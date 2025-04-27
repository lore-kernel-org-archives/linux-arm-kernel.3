Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50210C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 02:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr6T9H2zAVWfdvJ3K161MQ13R94FK5/vPHjqT3ipS1E=; b=S9ZpF/mK4ouXd0QKJmxF0Io75V
	SUuczynofmFN9e11fs9kxNuK3GKq4XcAcDISkh+Rw8R/oug12BrP8RDQWDYcQEuOd7xE86NRqISBA
	3T5o/YoPnalnL8crp0nrkGSy622XquhnxjZu+JoNtdRzAURnFNgpGNgA8FAxAOraeCPmjkkq+Y9bd
	oovPsXBx5c6sbvPxCkiRAWlEXZYDRx8PfOi+/XYB5AJs9Trh3UrI0iGjHgOV/vsHtPo8Rq5nN8XGu
	oFInHJ/cslkvY7ZbkKHVm6OR5sIYA2Uy4IplekAvkhSPxTyK2mrqWoqHJ0222i6MDnHG4YJuTa3/H
	9LUg3L5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8rQr-00000002lX3-2HxS;
	Sun, 27 Apr 2025 02:07:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8rOu-00000002lMz-3cuJ;
	Sun, 27 Apr 2025 02:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5EC1A4A150;
	Sun, 27 Apr 2025 02:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BFBC4CEE2;
	Sun, 27 Apr 2025 02:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745719547;
	bh=ueSM0+6v5DBafLvS0giIuMW8ulfX++okvZjAf4dve3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCGIitGddXyxO16n9EzYOnE9TFJ4BfEVtkdwKz80J3E+jJ+T0+5bLKSqz39z0wxx6
	 24UXZR0EAV95qJ5XXRDbMxMqTcdC91UJ7yLt1g+MQAvpXl2yFYqk6BRrAx1lSYwwC8
	 LHzKORO2cK0uy22Iu+7qhNLgVYT6LB5/fpWCPdxXrFFOtVTTL2V9LEsPxWdqhGc2A7
	 i7osVXQPlfyBxVjnBs45A0dvXdXOSHPf+nI4xhzbXVaUZB9uKG1IVo9eUa47IVB0+M
	 NHbrX2DWvuSzqqHrTuZcr4Fs1MlwZNwMqI5u3LGtXpfD1hHL8rZ8mIBjmrzaosKfhS
	 9TnNyl+W7Q6Uw==
Date: Sat, 26 Apr 2025 19:05:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <20250427020550.GG68006@quark>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
 <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
 <20250427015041.GF68006@quark>
 <aA2N6oJ9fQYQUtD4@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA2N6oJ9fQYQUtD4@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_190548_971664_78320D20 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Apr 27, 2025 at 09:52:42AM +0800, Herbert Xu wrote:
> On Sat, Apr 26, 2025 at 06:50:41PM -0700, Eric Biggers wrote:
> >
> > But this one does have a lib/crypto/ interface now.  There's no reason not to
> > use it here.
> 
> I need to maintain a consistent export format between shash and
> ahash

Why?  And how is that relevant here, when the export format should just be
struct sha256_state, as it was before?

- Eric

