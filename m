Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10298C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGYSU8yspLY+yzvc+cdwfSs2SpB2H9RhDGDPSqaDb24=; b=EzrzREuz33jjUTtdgkCZV1Ank8
	hSSufM479LkGePQQ8j8WyqzOYAVxGsBBApT8UsgjbHhKq1iq13MT7LbF6oD4lvcviNImNEf1OjjVy
	5AYhho76Va26qL/KahRJOXagjjUemnq2sTQKXKtQrvVVK17rK60kAV1pK+sn4tUvPVX1L/nF0oZh4
	t45WjF6wNLkCAz9R/E1sede4NLT//IaWU1jbOtM5qq6H27k4TXZx+lKnLL1aQIKLrDPuJqg+2EmsN
	8Nat/I6raRfOijI0rGyvXB0kepWJAAJG0jKCrVltorcojwbrtr6xs5+ovvebX9pxXHbsUBICMmhlu
	FaK9NCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WrG-0000000A5Fp-01Ml;
	Wed, 23 Apr 2025 09:57:34 +0000
Received: from mail-m15571.qiye.163.com ([101.71.155.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vqn-00000009pZW-2kHH;
	Wed, 23 Apr 2025 08:53:03 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 12d9c1966;
	Wed, 23 Apr 2025 16:52:55 +0800 (GMT+08:00)
Message-ID: <576e87c1-5c4c-bcc4-4d4f-6cf76bb1c591@rock-chips.com>
Date: Wed, 23 Apr 2025 16:52:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: shawn.lin@rock-chips.com, Ulf Hansson <ulf.hansson@linaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v3] mmc: sdhci-of-dwcmshc: add PD workaround on RK3576
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20250423-rk3576-emmc-fix-v3-1-0bf80e29967f@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250423-rk3576-emmc-fix-v3-1-0bf80e29967f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpMHVZPQkgeQ0NDTR1DTktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9661d9a34909cckunm12d9c1966
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6Eio4MjJRHk5DH00sIk4f
	FClPCkJVSlVKTE9OSEJDSExNQ0NDVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU1ITUs3Bg++
DKIM-Signature: a=rsa-sha256;
	b=RnC7Hd5weLU8Y+dO7lw+qNXo5d9KvBzLVb+aVUMNqoaN0NsUAhQhIlmqyF0FTczFmkeyCtd9GFGHnNQlp/ayHDXVppu6C5/Ng/9BdEDorhQnw4roGSuN5xPaACTrfGi875qqzCKPXFvG2QgjGRSBVA2m4kGQfBaWB0RWl0HrU8Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dGYSU8yspLY+yzvc+cdwfSs2SpB2H9RhDGDPSqaDb24=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015302_267469_BB7BFFB5 
X-CRM114-Status: GOOD (  34.11  )
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

在 2025/04/23 星期三 15:53, Nicolas Frattaroli 写道:
> RK3576's power domains have a peculiar design where the PD_NVM power
> domain, of which the sdhci controller is a part, seemingly does not have
> idempotent runtime disable/enable. The end effect is that if PD_NVM gets
> turned off by the generic power domain logic because all the devices
> depending on it are suspended, then the next time the sdhci device is
> unsuspended, it'll hang the SoC as soon as it tries accessing the CQHCI
> registers.
> 
> RK3576's UFS support needed a new dev_pm_genpd_rpm_always_on function
> added to the generic power domains API to handle what appears to be a
> similar hardware design.
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

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Changes in v3:
> - Reword comment and commit message to correct that this is not a
>    silicon bug, but seemingly intentional design with regards to runtime
>    power management.
> - Link to v2: https://lore.kernel.org/r/20250412-rk3576-emmc-fix-v2-1-830e653ad4f0@collabora.com
> 
> Changes in v2:
> - Rewrite patch to use dev_pm_genpd_rpm_always_on in sdhci driver
>    instead, after Ulf Hansson made me aware of its existence
> - Link to v1: https://lore.kernel.org/r/20250408-rk3576-emmc-fix-v1-1-3009828b1b31@collabora.com
> ---
>   drivers/mmc/host/sdhci-of-dwcmshc.c | 40 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 09b9ab15e4995f0bddf57dd309c010c849be40d9..a20d03fdd6a93ecc5229c71f825bade5ac730370 100644
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
> @@ -745,6 +746,29 @@ static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv
>   	}
>   }
>   
> +static void dwcmshc_rk3576_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> +{
> +	struct device *dev = mmc_dev(host->mmc);
> +	int ret;
> +
> +	/*
> +	 * This works around the design of the RK3576's power domains, which
> +	 * makes the PD_NVM power domain, which the sdhci controller on the
> +	 * RK3576 is in, never come back the same way once it's run-time
> +	 * suspended once. This can happen during early kernel boot if no driver
> +	 * is using either PD_NVM or its child power domain PD_SDGMAC for a
> +	 * short moment, leading to it being turned off to save power. By
> +	 * keeping it on, sdhci suspending won't lead to PD_NVM becoming a
> +	 * candidate for getting turned off.
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
> @@ -1176,6 +1200,18 @@ static const struct dwcmshc_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
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
> @@ -1274,6 +1310,10 @@ static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
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
> base-commit: f34da179a4517854b2ffbe4bce8c3405bd9be04e
> change-id: 20250317-rk3576-emmc-fix-7dc81a627422
> 
> Best regards,

