Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86A4CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YUgGB7unUfuXaH5pfE121ZOgCzzrH9HhF5tOcGI554=; b=iNM9VkIdT4h5nr22nmtmN1sMgh
	LSqz84ODbyxtf5nKHIJUKIJZznc5kF6AhcnMBRrNfERxKTMXfCxxrpvxocTgnxBSlnr2YHqcqJWKE
	ekKlIfGB7wiYqwrVs+aiEAVCAtbGXsTaJ4XL0MHZ6JsCaklcyHjFlKwNpEhLmSg6K5R60T/KnauMc
	m5KZvRnvQFq0aIaQQwjitRcINpJKWOKjB6kxVwtcRU8bir+m/kKMSAAwjGs66d4JYkd4wZTPRy6yn
	xCEkh8FchaF4MPwCEkSpK69F4VdBaaUK0F/qFbjfvdk0PFnSvhvd+U0AAYPGKJzfBO49teCbZx/Ck
	I7TtJfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmIs-0000000A3xc-2a4O;
	Thu, 11 Jun 2026 20:47:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmIr-0000000A3xW-2XBe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:47:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7082E60210;
	Thu, 11 Jun 2026 20:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E216E1F00A3A;
	Thu, 11 Jun 2026 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781210824;
	bh=8YUgGB7unUfuXaH5pfE121ZOgCzzrH9HhF5tOcGI554=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EQCnh2FCvEu1io2MpQW3qyrOqoiUSUjMnJfNKoZ8lIPcGe9MTiL0FTk8rFl+/fHqW
	 GdN0/DVHIaFEf+cdJzNxt7riig00q+HHX21wZ6pn2wDTxbhLUs10yH82aYCqHL9sTl
	 QUencz6XOI2GALaBOpNWB3WImqzD3VZ7015Ok5i3mSJxWQPc2hBkWggQhAVAg82eT+
	 qaJAsQPmu52hJUn6kUMdJssCJNfjFl6frJ0+53waVp+Y0Xv/dh3boBwRtUcg+MTObG
	 lp3hETH5mq1QSBNXAPZOM9eiIdTIwQ9J93ZoPB6/qJWBi4MQhMzZ9uyz5FdUMjVa5D
	 hLZifhzblF8aQ==
Date: Thu, 11 Jun 2026 13:47:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mounika Botcha <mounika.botcha@amd.com>,
	Harsh Jain <h.jain@amd.com>, Olivia Mackall <olivia@selenic.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] Xilinx TRNG fix and simplification
Message-ID: <20260611204702.GB1747@quark>
References: <20260531191738.55843-1-ebiggers@kernel.org>
 <aip2l1pwMY4UDBdA@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aip2l1pwMY4UDBdA@gondor.apana.org.au>
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

On Thu, Jun 11, 2026 at 04:49:27PM +0800, Herbert Xu wrote:
> On Sun, May 31, 2026 at 12:17:34PM -0700, Eric Biggers wrote:
> > This series fixes and greatly simplifies the Xilinx TRNG driver by:
> > 
> > - Removing the gratuitous crypto_rng interface, leaving just hwrng which
> >   is the one that actually matters.
> > 
> > - Replacing the really complicated AES based entropy extraction
> >   algorithm with a much simpler one.
> > 
> > Note that this mirrors similar changes in other drivers.
> > 
> > Eric Biggers (4):
> >   crypto: xilinx-trng - Remove crypto_rng interface
> >   crypto: xilinx-trng - Fix return value of xtrng_hwrng_trng_read()
> >   crypto: xilinx-trng - Replace crypto_drbg_ctr_df() with HMAC-SHA512
> >   hwrng: xilinx - Move xilinx-rng into drivers/char/hw_random/
> > 
> >  MAINTAINERS                                   |   2 +-
> >  arch/arm64/configs/defconfig                  |   2 +-
> >  crypto/Kconfig                                |   5 -
> >  crypto/Makefile                               |   2 -
> >  crypto/df_sp80090a.c                          | 222 ------------------
> >  drivers/char/hw_random/Kconfig                |  11 +
> >  drivers/char/hw_random/Makefile               |   1 +
> >  .../xilinx => char/hw_random}/xilinx-trng.c   | 134 ++---------
> >  drivers/crypto/Kconfig                        |  13 -
> >  drivers/crypto/xilinx/Makefile                |   1 -
> >  include/crypto/df_sp80090a.h                  |  53 -----
> >  11 files changed, 37 insertions(+), 409 deletions(-)
> >  delete mode 100644 crypto/df_sp80090a.c
> >  rename drivers/{crypto/xilinx => char/hw_random}/xilinx-trng.c (75%)
> >  delete mode 100644 include/crypto/df_sp80090a.h
> > 
> > 
> > base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
> > prerequisite-patch-id: 07e982b663ac3f8312ca524f6b91b5b38661df5e
> > prerequisite-patch-id: 72064361a8f36e015ab0b7e1fa4d364b40d90506
> > prerequisite-patch-id: 8978b8e0db7f47935e5f6f0aff14a97f55d3073c
> > prerequisite-patch-id: 6aa0e3e93a008279d71e535a3d0cf48643f55e19
> > -- 
> > 2.54.0
> 
> All applied.  Thanks.

Can you re-add the following to "hwrng: xilinx - Move xilinx-rng into
drivers/char/hw_random/"?  It seems you applied this before the qcom-rng
series, then dropped the drivers/char/hw_random/Makefile change rather
than resolve it.

diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index 3e655d6e116b..95b5adb49560 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -51,5 +51,6 @@ obj-$(CONFIG_HW_RANDOM_XIPHERA) += xiphera-trng.o
 obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
 obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
 obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
 obj-$(CONFIG_HW_RANDOM_ROCKCHIP) += rockchip-rng.o
 obj-$(CONFIG_HW_RANDOM_JH7110) += jh7110-trng.o
+obj-$(CONFIG_HW_RANDOM_XILINX) += xilinx-trng.o


