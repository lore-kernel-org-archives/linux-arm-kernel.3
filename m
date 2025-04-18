Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758A4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Am3qSE+37xleqfIGr3FojtYrzlwSKp8ZLDqwhi0VPgI=; b=R5VKAbB0DKJNSsmzroLUg6WGTi
	f/JhSk2Pbwa1gy1mLsZ2FYCckjPINXaRKTcJPbYMkywMpQto8PnQCHPdomA5vIB2buHGlBUs/KjKG
	b/0EKl5rZ/JmFndQVHxEK4tQz+ZY6eswqVRjM1aXcF5LwdN5DTazOF/w3unuvVmZWbr0KPU2ujmJo
	VU5qXpa5t9igK/GBZxccMUE71GBomLl6yZsNlS1Pbyr4gUEmC8GnCjUl/6rIF9be5RCpLtGHRSZ5z
	77AmAm+p3U1MQPQsWp5yBhggtboiIsYHLVQLBtXsKTXtriuu4Vc8TyHND8mhs4hvNKxiiJ/UChIdl
	hJiCJ2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cUu-0000000EzN9-3C7U;
	Fri, 18 Apr 2025 03:34:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cT2-0000000EzF0-3Mbx;
	Fri, 18 Apr 2025 03:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04B764A233;
	Fri, 18 Apr 2025 03:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A07C4CEE2;
	Fri, 18 Apr 2025 03:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744947160;
	bh=pKH0iMn/ElSIBHsAfOGxNhjlTOJh60B8ZyUUd2TvSWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sr2SG5z+VUuYx9tif00YQ4lXNJDQnAwS2cDvkeWHH+1dDjsS2xsJGAVflXA6/ugx0
	 YsreR8YIfO9pbQUnd5xqyIK7iDfa6mm8d+b64w67ZiyskrV9BSY5w4eNuG1gIe8aMh
	 /VnOIjxNG2ruThkQpwZSfy/nhIHEMmCw9JPPO7DDUnVyMHs6LCgq7j1FqX+Rh9kZ7N
	 4GyosOjpiwdAVR0Xk/3odPnwV33kADLe1BLf6Cpyx7vL4VB4V9XETfCPvYX5JoGdKg
	 HqxC1RDd1RT1ZgzvfoMCxVk+o5IqKy8Sd7rwMaeTae0bDMeANN2hLnouvr+ZWcbtXB
	 8c/XrREVJrfjg==
Date: Thu, 17 Apr 2025 20:32:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <20250418033236.GB38960@quark.localdomain>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_203240_859429_BA993E35 
X-CRM114-Status: UNSURE (   9.30  )
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

On Fri, Apr 18, 2025 at 11:12:33AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > config CRYPTO_CURVE25519_NEON
> >        tristate
> > -       depends on KERNEL_MODE_NEON
> > +       depends on CRYPTO && KERNEL_MODE_NEON
> 
> Rather than adding CRYPTO to each symbol, how about grouping all
> the CRYPTO symbols together under one if statement?

I don't think that would be better.  The 'if' would be up to 400 lines long, and
it would be easy for people to miss the context when editing the file.

- Eric

