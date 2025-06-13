Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC77C71150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ho/EHOpIe2Sf+vRZsQ8wp34zSotufJ2MpOjVyrp9Cc=; b=ESzf7FtfJKS1QvKTnzygQLw+8E
	OKLpEgbWBtkmgK0mN9iRxk69TAprl3oA+RnGZWyeZEZlO1s9G435BJA6iHFPINMAZNgt23GPtjSh1
	+YX/OXAIuL6DoFGRLxNOiod1mOXG0H7lzPzbmmjYTfbGaih1ZPylc2tFj2QCiaTKa4lK9iAKgH9KO
	rFxbnK9/2yI4UXmx9p5NyK5iI7OmseuA6vWS4BAYiDYadPDaZLJMFOUR2gLfOgCco3nsZ49Y+E31p
	phPsZu1R+KS9loaMYY3x+3lr1cfeYeVZZ4l0UXRKOqprDVpFW4WiAJ96EUb9Ms8EHvCDNtjKMldKc
	pl22UNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6uE-0000000H01c-1gkZ;
	Fri, 13 Jun 2025 16:05:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5km-0000000Glxf-1Yv8;
	Fri, 13 Jun 2025 14:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9C10A51231;
	Fri, 13 Jun 2025 14:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEACFC4CEE3;
	Fri, 13 Jun 2025 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749826295;
	bh=a9gFEcNHOIC/Oz4QB/0+6Gj9TjA8O4O73SG5pKhkDQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYCjanIC9/ogE7BdmHldhYndikxkMFKyqq9mPw6xl6mpfeCU8xq4U0zUWklx3SSvr
	 e9WbsvU7oIvvYCBptqhLerjURuJCA8xnaDTABdNeXAy1B09nrKLDsh9BrqfYzGwq8f
	 0mQMRj2FmejGCqqaDhkK4ShurJ5BQTHmLtsrpI61urwamObAs/mE0q4BWwC/J7kl+n
	 uv3mVq6uKsGRsdSa89jxh6Y5KWaPihaeIP4MerLNjVzuGAF7xWZ6ujHlPCnVWGME6b
	 yp0xmWbNhmK4FlxYgcpDJvquONpj1F5m9bl0mHgZIFU6AyPzdK3I+xfWmlHTCZfIGV
	 2ZwEwxOvLUDkw==
Date: Fri, 13 Jun 2025 07:51:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250613145108.GB1287@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
 <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075136_468770_F8FCB5A4 
X-CRM114-Status: GOOD (  15.97  )
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

On Fri, Jun 13, 2025 at 04:39:10PM +0800, Herbert Xu wrote:
> On Fri, Jun 13, 2025 at 09:38:11AM +0200, Ard Biesheuvel wrote:
> >
> > Perhaps I am just slow, but could you please explain again what the
> > point is of all these changes?
> > 
> > Where is h/w accelerated ahash being used to the extent that it
> > justifies changing all this existing code to accommodate it?
> 
> There are two separate changes.
> 
> First of all the export format is being made consistent so that
> any hardware hash can switch over to a software fallback after
> it has started, e.g., in the event of a memory allocation failure.
> 
> The partial block API handling on the other hand is about simplifying
> the drivers so that they are less error-prone.

Is it perhaps time to reconsider your plan, given that it's causing problems for
the librarification effort which is much more useful, and also most of the
legacy hardware offload drivers seem to be incompatible with it too?

- Eric

