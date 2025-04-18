Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC12C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 00:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lcb43dSZS3+Y/L9GUNHVrV5chNZ/V2WVLs/FwGaCc1s=; b=IRtMCkqoTejdcgT/agG3yQQqLg
	6MNxkclaZXLU/62OEE5af+7lA3RtkulfsbvrSwfyNl6x3VUr++uk9y2HG4T3s9kYoxYSo2NukJFhV
	nbV7qUHZerN5FfCQ9cmE6D0ixD36U27dPSm0MF6KYvG+/K2qGvh9Myy0CJcaL3RcorjB0bSYi3M9C
	z7KDef3PlT8C2D4zaVlr06Wnrhpjv/8+YBuV7ziANr6O0ZhoKJyepYE5rsMZlQ5baypWoVpGHsGvr
	Zmcq6v5iSEGn2GSQZLl9kpE1G/uSd8Jc5eyMkh/UpQW+0V2RshJGHzxU9NpbU2bYAzhfZQb/rDCBS
	WyqDXwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZsM-0000000EiYb-2XRP;
	Fri, 18 Apr 2025 00:46:38 +0000
Received: from mail-m1973178.qiye.163.com ([220.197.31.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZqU-0000000EiOo-3Cvb;
	Fri, 18 Apr 2025 00:44:44 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 12477934f;
	Fri, 18 Apr 2025 08:44:31 +0800 (GMT+08:00)
Message-ID: <c70cef1b-9f37-5a73-faf3-4d1cac6bcdde@rock-chips.com>
Date: Fri, 18 Apr 2025 08:43:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: shawn.lin@rock-chips.com, Detlev Casanova
 <detlev.casanova@collabora.com>, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] mmc: sdhci-of-dwcmshc: add PD workaround on RK3576
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <20250412-rk3576-emmc-fix-v2-1-830e653ad4f0@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250412-rk3576-emmc-fix-v2-1-830e653ad4f0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpITlZNGk9PHRhKT0hNH05WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96465ab30c09cckunm12477934f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NiI6Tio5GjJNFhU4Mg8fS0ks
	NTUwCRBVSlVKTE9PQkhMS0xJQ09IVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU1KTkk3Bg++
DKIM-Signature: a=rsa-sha256;
	b=Tk//MLA56Ghww08hBdr9vFuE8XaqrrlB+sMy2CcuqZJ3Ion+u7E9rGD/rlImMVOzl/RJ1cGe5d/e6fGfqh5LKM5ABl2DSUs6liUiPPBhBSXaeBm77NSls+uwEOj4zX9UlsU1xyrp7rIE+06HHojiLnttWKb5J/whbh7OB6+Tfs0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Lcb43dSZS3+Y/L9GUNHVrV5chNZ/V2WVLs/FwGaCc1s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_174443_275770_727BE24C 
X-CRM114-Status: GOOD (  34.81  )
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

Hi Nicolas,

在 2025/04/13 星期日 4:45, Nicolas Frattaroli 写道:
> RK3576's power domains have a peculiar problem where the PD_NVM
> power domain, of which the sdhci controller is a part, seemingly does
> not have idempotent disable/enable. The end effect is that if PD_NVM
> gets turned off by the generic power domain logic because all the
> devices depending on it are suspended, then the next time the sdhci
> device is unsuspended, it'll hang the SoC as soon as it tries accessing
> the CQHCI registers.
> 
> RK3576's UFS support needed a new dev_pm_genpd_rpm_always_on function
> added to the generic power domains API to handle what appears to be a
> similar hardware issue.
> 
> Use this new function to ask for the same treatment in the sdhci
> controller by giving rk3576 its own platform data with its own postinit
> function. The benefit of doing this instead of marking the power domains
> always on in the power domain core is that we only do this if we know
> the platform we're running on actually uses the sdhci controller. For
> others, keeping PD_NVM always on would be a waste, as they won't run
> into this specific issue. The only other IP in PD_NVM that could be
> affected is FSPI0. If it gets a mainline driver, it will probably want
> to do the same thing.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Changes in v2:
> - Rewrite patch to use dev_pm_genpd_rpm_always_on in sdhci driver
>    instead, after Ulf Hansson made me aware of its existence
> - Link to v1: https://lore.kernel.org/r/20250408-rk3576-emmc-fix-v1-1-3009828b1b31@collabora.com
> ---
>   drivers/mmc/host/sdhci-of-dwcmshc.c | 39 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 09b9ab15e4995f0bddf57dd309c010c849be40d9..a00aec05eff2da8197cc64690ba9665be756e54a 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -17,6 +17,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/reset.h>
>   #include <linux/sizes.h>
> @@ -745,6 +746,28 @@ static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv
>   	}
>   }
>   
> +static void dwcmshc_rk3576_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> +{
> +	struct device *dev = mmc_dev(host->mmc);
> +	int ret;
> +
> +	/*
> +	 * This works around what appears to be a silicon bug, which makes the

After discussion with Finley, we agree with this patch which is
basically the same way we handle it on vendor tree. But it's not a
silicon bug to us, so maybe the comments need a bit of adjustment.


> +	 * PD_NVM power domain, which the sdhci controller on the RK3576 is in,
> +	 * never come back the same way once it's turned off once. This can
> +	 * happen during early kernel boot if no driver is using either PD_NVM
> +	 * or its child power domain PD_SDGMAC for a short moment, leading to it
> +	 * being turned off to save power. By keeping it on, sdhci suspending
> +	 * won't lead to PD_NVM becoming a candidate for getting turned off.
> +	 */
> +	ret = dev_pm_genpd_rpm_always_on(dev, true);
> +	if (ret && ret != -EOPNOTSUPP)
> +		dev_warn(dev, "failed to set PD rpm always on, SoC may hang later: %pe\n",
> +			 ERR_PTR(ret));
> +
> +	dwcmshc_rk35xx_postinit(host, dwc_priv);
> +}
> +
>   static int th1520_execute_tuning(struct sdhci_host *host, u32 opcode)
>   {
>   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -1176,6 +1199,18 @@ static const struct dwcmshc_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
>   	.postinit = dwcmshc_rk35xx_postinit,
>   };
>   
> +static const struct dwcmshc_pltfm_data sdhci_dwcmshc_rk3576_pdata = {
> +	.pdata = {
> +		.ops = &sdhci_dwcmshc_rk35xx_ops,
> +		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> +			  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
> +		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
> +			   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
> +	},
> +	.init = dwcmshc_rk35xx_init,
> +	.postinit = dwcmshc_rk3576_postinit,
> +};
> +
>   static const struct dwcmshc_pltfm_data sdhci_dwcmshc_th1520_pdata = {
>   	.pdata = {
>   		.ops = &sdhci_dwcmshc_th1520_ops,
> @@ -1274,6 +1309,10 @@ static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
>   		.compatible = "rockchip,rk3588-dwcmshc",
>   		.data = &sdhci_dwcmshc_rk35xx_pdata,
>   	},
> +	{
> +		.compatible = "rockchip,rk3576-dwcmshc",
> +		.data = &sdhci_dwcmshc_rk3576_pdata,
> +	},
>   	{
>   		.compatible = "rockchip,rk3568-dwcmshc",
>   		.data = &sdhci_dwcmshc_rk35xx_pdata,
> 
> ---
> base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
> change-id: 20250317-rk3576-emmc-fix-7dc81a627422
> 
> Best regards,

