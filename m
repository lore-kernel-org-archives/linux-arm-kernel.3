Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A687CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 01:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnN6UHZy9R4p3IMdheElLYZmIksWWOtLpEfuDmsxZRU=; b=gRXmo5OWk9OsxqvYreN7cBvska
	EfRJ1tUVUG6oc7dXJjHny3hamc8+DLrzqa/vLt3yY5ALx+F0mzJJ+a/kM7hgqXeb9lwTxZXyAd4EX
	ozSHSAQnrMshws28mkfVSNnu2Uh0l10+2IFvzWRisU7tfJcQQmr/uvwc+J41hLaFW5xeSmX/aQ6br
	Yx98pFTM/28odggJpUVefMEglMpR8F4WC6o+zc6doslJ7q6wvPmZxNiXjJfTeNjW4i87ZP5KI7feW
	1btq1iGcYNJYPbQ4lM0K2Wmq5UzquZ0tIUS2BuN7a2lE3wlzUjrzBqSRdiGBpGKGgGgao14gqs10b
	6hEAi9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrAb-0000000AHAz-1tPT;
	Fri, 12 Jun 2026 01:58:53 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrAZ-0000000AHAb-0mqq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 01:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=NnN6UHZy9R4p3IMdheElLYZmIksWWOtLpEfuDmsxZRU=; 
	b=pOLn7EKJHStcwWNuifLZbdBAWCwzvuPPN/vPB8Zp4Pu8aFBSMYgoubkxIzlIroh1hVw8j8A+qsU
	8suFeL5toZq3pOD3kQVls5dwyxls0pkGeyuT3aY8uqjwIgFk+/vJWOQp1MJtE5g+TNc6YisfRoBBI
	Un7PHCUFM6Zwww4V0ieFEYigDpQL2Nwoqk2wewN0TCv3nRtJroo5M31HvobrBrjDR2ZNMjkz2xiDo
	/y/GGxvgjjuTXb2Dfb0NmVVpM+nOX/u24EVpnwvyB/0cStH0vs/jvTt/za6xiG0yIcAOa5JfeWcV+
	eSwE+2HEnN7UPh/QhgMpHmIaaHBOem8FPwDw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXrAJ-00000004ljD-1R4u;
	Fri, 12 Jun 2026 09:58:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 12 Jun 2026 09:58:35 +0800
Date: Fri, 12 Jun 2026 09:58:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mounika Botcha <mounika.botcha@amd.com>,
	Harsh Jain <h.jain@amd.com>, Olivia Mackall <olivia@selenic.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] Xilinx TRNG fix and simplification
Message-ID: <aitnyyvnfU2ysMYj@gondor.apana.org.au>
References: <20260531191738.55843-1-ebiggers@kernel.org>
 <aip2l1pwMY4UDBdA@gondor.apana.org.au>
 <20260611204702.GB1747@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611204702.GB1747@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_185851_223807_0ED4B528 
X-CRM114-Status: GOOD (  11.91  )
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

On Thu, Jun 11, 2026 at 01:47:02PM -0700, Eric Biggers wrote:
>
> Can you re-add the following to "hwrng: xilinx - Move xilinx-rng into
> drivers/char/hw_random/"?  It seems you applied this before the qcom-rng
> series, then dropped the drivers/char/hw_random/Makefile change rather
> than resolve it.
> 
> diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
> index 3e655d6e116b..95b5adb49560 100644
> --- a/drivers/char/hw_random/Makefile
> +++ b/drivers/char/hw_random/Makefile
> @@ -51,5 +51,6 @@ obj-$(CONFIG_HW_RANDOM_XIPHERA) += xiphera-trng.o
>  obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
>  obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
>  obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
>  obj-$(CONFIG_HW_RANDOM_ROCKCHIP) += rockchip-rng.o
>  obj-$(CONFIG_HW_RANDOM_JH7110) += jh7110-trng.o
> +obj-$(CONFIG_HW_RANDOM_XILINX) += xilinx-trng.o

Thanks for checking.  It should be fixed now.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

