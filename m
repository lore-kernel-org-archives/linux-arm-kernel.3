Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6057C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFUr4aCkp+5YmR6tR2U36z6Fr5POpRt/Tx7/nzrROWQ=; b=t4pCdhyDpuiLPa0zQe/KFDj6Ps
	k+TERQUJ97mWrk2QpDhqNPLkIMCo/6ZPPdBsw4FsRdzu3jy4/o8wKqlb+8atRWpy4ImBv9ojhDHqJ
	uP9E9yizk3kma8V6FhIj+tNIH+cqdQsTcyeILC+z17WdakD6mO7RNxI0OCt7KYMmqcMOOHyGhMYNS
	aQI8AZIRj+QT7wp3hE3d1aAAX7D8qRHUXPb5geYrWdf82hs2AMinalXVW1/d8BwkBiG6YmsdOvBV0
	kgdMUhMrLY0WAv7gMVOYEVpNtYlOwrNd/u7OhkHByRz3wTtD7CJFh+t4bysXwux1mgzc7UicBKwyo
	bL25DERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWuG-00000006QX6-0N1m;
	Thu, 27 Feb 2025 05:58:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWsi-00000006QJI-00Fx;
	Thu, 27 Feb 2025 05:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23D515C4609;
	Thu, 27 Feb 2025 05:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C31C4CEDD;
	Thu, 27 Feb 2025 05:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740635782;
	bh=Qs9KlJ2e3nsU7Zdb+mxSOy0BPAa0JMo2sv/AdzdVSww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2bnllZQv48CZI9ThMiGQAP/KEvinCY9XJE+zMx6WpY54EUp8pBZa9gICGPovWZB6
	 ofX2cm9UwYn5TeNXRHIBqLvEVKHfBZzeO5aqAJCV6HfXF+V2ZvpPtTz3Jwvwl1mm1g
	 oPUmuXlGRlf/b+NEJiGOpl8BzunbG16GEyFH//aDJIgyZ2OF+HD56fW1G4JaPl57Fp
	 EC+ck1XIiYVEKGwoko39TJ999jdQepDp39ikB+qRnIy4FVS5ZLuiWwdoAj8Fcu7smp
	 IQth4DKd2pDrxKGzGyQttW1PLrxMsIsA98iEOGjA/Fmdnpzo6KORiM1ZFDVpYT86HD
	 aets8RZZaQ8RQ==
Date: Thu, 27 Feb 2025 11:26:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC
 dependency)
Message-ID: <Z7/+gXVFVzGadc4z@vaman>
References: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_215624_116952_108171D2 
X-CRM114-Status: GOOD (  18.81  )
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

Hi Krzysztof,

On 15-02-25, 10:41, Krzysztof Kozlowski wrote:

Can you revise the title to "phy: exynos5-usbdrd: dont depend on type-c"
or something relevenant which describes the change rather than the
Fix something!

> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
> USB DRD PHY does not really depend on Type-C for these devices at all.
> Incorrectly added dependency on CONFIG_TYPEC caused this driver to be
> missing for exynos_defconfig and as result Exynos5422-based boards like
> Hardkernel Odroid HC1 failed to probe USB.
> 
> Drop incorrect dependency and rely on module to be reachable by the
> compiler.

Changelog lgtm

> 
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> Closes: https://krzk.eu/#/builders/21/builds/6139
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch for issue in linux-next
> ---
>  drivers/phy/samsung/Kconfig              | 1 -
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index 7fba571c0e2b..e2330b0894d6 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -81,7 +81,6 @@ config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>  	depends on HAS_IOMEM
> -	depends on TYPEC || (TYPEC=n && COMPILE_TEST)

So how would this dependency be sorted..?

>  	depends on USB_DWC3_EXYNOS
>  	select GENERIC_PHY
>  	select MFD_SYSCON
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index ff2436f11d68..e8a9fef22107 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1456,7 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
>  {
>  	int ret;
>  
> -	if (!IS_ENABLED(CONFIG_TYPEC))
> +	if (!IS_REACHABLE(CONFIG_TYPEC))
>  		return 0;
>  
>  	if (device_property_present(phy_drd->dev, "orientation-switch")) {
> -- 
> 2.43.0

-- 
~Vinod

