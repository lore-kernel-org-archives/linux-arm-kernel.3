Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B41C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaYv2VZ9MsiLRHsJHqttCi/99UIffkAJmhZGe+nwPnI=; b=K4BwoCXJNJN/HCNbKVZTeisbq3
	ZzavGen7RzpfFCzHqjOOTTHy6tGF3YEVWIvgYyUIebtCvF5lROSzicpoVXoGzJ517h3w+Nw1m9BSf
	VPl68mUDTKt0uZg3iRgNQlVAy41t5g2UL47zUeGKUJC7tAazosLpklYKleiB0d4BhTaUFW3LaefAL
	w2ukTD5zJ772GAJj2hHtcuZBUnRKeBbZto5TwXadF/UvUhUcivONDuCFSgiGlNX9/KjdN0mHC3VNR
	paMgD1lcIURfoG/eW3HIM92SRokY4jBVeUUc/2S02jfCXuUJZa9AScB1zNUSO8RB3jGlLKxU1V6RC
	bbKKzc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnwN-00000009kMr-3gOw;
	Tue, 14 Jan 2025 20:55:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnl6-00000009i9x-3Ii9;
	Tue, 14 Jan 2025 20:43:34 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6EBBBEB;
	Tue, 14 Jan 2025 21:42:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736887352;
	bh=InqNACpUCj9mpYqJ8XnaR7lMhaTuW084yMOuOSGPTxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bX63zxgmLghan7xFuHE3sZqBz2Oq3frOojXqUqojirlRHuSnXHMeBRCqvlFrJ3WSR
	 /EG8BSHFgJjPfIggEvmJHRTsPijYoY2Ijyr8sml40uBGfrBiDWMjssvLWD8SyulU0Q
	 ZH3KZ0euBoWfECAIcllIsybMVPwYmhi5uoi4O4ik=
Date: Tue, 14 Jan 2025 22:43:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Michal Simek <michal.simek@amd.com>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: Use str_enable_disable-like helpers
Message-ID: <20250114204323.GB29414@pendragon.ideasonboard.com>
References: <20250114203537.1012955-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114203537.1012955-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_124332_966954_A983FD0D 
X-CRM114-Status: GOOD (  18.43  )
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

Thank you for the patch.

On Tue, Jan 14, 2025 at 09:35:37PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.

As commented in a similar patch, please drop these changes from drivers
I maintain.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/broadcom/phy-bcm-cygnus-pcie.c |  3 ++-
>  drivers/phy/realtek/phy-rtk-usb2.c         | 15 ++++++++-------
>  drivers/phy/realtek/phy-rtk-usb3.c         |  9 +++++----
>  drivers/phy/ti/phy-twl4030-usb.c           |  4 ++--
>  drivers/phy/xilinx/phy-zynqmp.c            |  3 ++-
>  5 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
> index 462c61a24ec5..562d7d7151c5 100644
> --- a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
> +++ b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
> @@ -7,6 +7,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>  
>  #define PCIE_CFG_OFFSET         0x00
>  #define PCIE1_PHY_IDDQ_SHIFT    10
> @@ -86,7 +87,7 @@ static int cygnus_pcie_power_config(struct cygnus_pcie_phy *phy, bool enable)
>  
>  	mutex_unlock(&core->lock);
>  	dev_dbg(core->dev, "PCIe PHY %d %s\n", phy->id,
> -		enable ? "enabled" : "disabled");
> +		str_enabled_disabled(enable));
>  	return 0;
>  }
>  
> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
> index 248550ef98ca..14543636796d 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -14,6 +14,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/regmap.h>
> +#include <linux/string_choices.h>
>  #include <linux/sys_soc.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/phy/phy.h>
> @@ -729,7 +730,7 @@ static int rtk_usb2_parameter_show(struct seq_file *s, void *unused)
>  
>  	seq_puts(s, "Property:\n");
>  	seq_printf(s, "  check_efuse: %s\n",
> -		   phy_cfg->check_efuse ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->check_efuse));
>  	seq_printf(s, "  check_efuse_version: %d\n",
>  		   phy_cfg->check_efuse_version);
>  	seq_printf(s, "  efuse_dc_driving_rate: %d\n",
> @@ -741,17 +742,17 @@ static int rtk_usb2_parameter_show(struct seq_file *s, void *unused)
>  	seq_printf(s, "  dc_disconnect_mask: 0x%x\n",
>  		   phy_cfg->dc_disconnect_mask);
>  	seq_printf(s, "  usb_dc_disconnect_at_page0: %s\n",
> -		   phy_cfg->usb_dc_disconnect_at_page0 ? "true" : "false");
> +		   str_true_false(phy_cfg->usb_dc_disconnect_at_page0));
>  	seq_printf(s, "  do_toggle: %s\n",
> -		   phy_cfg->do_toggle ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->do_toggle));
>  	seq_printf(s, "  do_toggle_driving: %s\n",
> -		   phy_cfg->do_toggle_driving ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->do_toggle_driving));
>  	seq_printf(s, "  driving_updated_for_dev_dis: 0x%x\n",
>  		   phy_cfg->driving_updated_for_dev_dis);
>  	seq_printf(s, "  use_default_parameter: %s\n",
> -		   phy_cfg->use_default_parameter ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->use_default_parameter));
>  	seq_printf(s, "  is_double_sensitivity_mode: %s\n",
> -		   phy_cfg->is_double_sensitivity_mode ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->is_double_sensitivity_mode));
>  
>  	for (index = 0; index < rtk_phy->num_phy; index++) {
>  		struct phy_parameter *phy_parameter;
> @@ -830,7 +831,7 @@ static int rtk_usb2_parameter_show(struct seq_file *s, void *unused)
>  		seq_printf(s, "  efuse_usb_dc_dis: %d\n",
>  			   (int)phy_parameter->efuse_usb_dc_dis);
>  		seq_printf(s, "  inverse_hstx_sync_clock: %s\n",
> -			   phy_parameter->inverse_hstx_sync_clock ? "Enable" : "Disable");
> +			   str_enable_disable(phy_parameter->inverse_hstx_sync_clock));
>  		seq_printf(s, "  driving_level: %d\n",
>  			   phy_parameter->driving_level);
>  		seq_printf(s, "  driving_level_compensate: %d\n",
> diff --git a/drivers/phy/realtek/phy-rtk-usb3.c b/drivers/phy/realtek/phy-rtk-usb3.c
> index cce453686db2..77ce58f98302 100644
> --- a/drivers/phy/realtek/phy-rtk-usb3.c
> +++ b/drivers/phy/realtek/phy-rtk-usb3.c
> @@ -14,6 +14,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/regmap.h>
> +#include <linux/string_choices.h>
>  #include <linux/sys_soc.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/phy/phy.h>
> @@ -363,13 +364,13 @@ static int rtk_usb3_parameter_show(struct seq_file *s, void *unused)
>  
>  	seq_puts(s, "Property:\n");
>  	seq_printf(s, "  check_efuse: %s\n",
> -		   phy_cfg->check_efuse ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->check_efuse));
>  	seq_printf(s, "  do_toggle: %s\n",
> -		   phy_cfg->do_toggle ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->do_toggle));
>  	seq_printf(s, "  do_toggle_once: %s\n",
> -		   phy_cfg->do_toggle_once ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->do_toggle_once));
>  	seq_printf(s, "  use_default_parameter: %s\n",
> -		   phy_cfg->use_default_parameter ? "Enable" : "Disable");
> +		   str_enable_disable(phy_cfg->use_default_parameter));
>  
>  	for (index = 0; index < rtk_phy->num_phy; index++) {
>  		struct phy_reg *phy_reg;
> diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
> index 6f12b38cd894..4bf4c4f93b4c 100644
> --- a/drivers/phy/ti/phy-twl4030-usb.c
> +++ b/drivers/phy/ti/phy-twl4030-usb.c
> @@ -26,6 +26,7 @@
>  #include <linux/usb/ulpi.h>
>  #include <linux/mfd/twl.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/string_choices.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  
> @@ -567,8 +568,7 @@ static ssize_t vbus_show(struct device *dev,
>  	int ret = -EINVAL;
>  
>  	mutex_lock(&twl->lock);
> -	ret = sprintf(buf, "%s\n",
> -			twl->vbus_supplied ? "on" : "off");
> +	ret = sprintf(buf, "%s\n", str_on_off(twl->vbus_supplied));
>  	mutex_unlock(&twl->lock);
>  
>  	return ret;
> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
> index 05a4a59f7c40..b96bdc39bcc7 100644
> --- a/drivers/phy/xilinx/phy-zynqmp.c
> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> @@ -23,6 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <dt-bindings/phy/phy.h>
>  
> @@ -865,7 +866,7 @@ static int xpsgtr_status_read(struct seq_file *seq, void *data)
>  	seq_printf(seq, "Reference clock: %u (%pC)\n", gtr_phy->refclk, clk);
>  	seq_printf(seq, "Reference rate:  %lu\n", clk_get_rate(clk));
>  	seq_printf(seq, "PLL locked:      %s\n",
> -		   pll_status & PLL_STATUS_LOCKED ? "yes" : "no");
> +		   str_yes_no(pll_status & PLL_STATUS_LOCKED));
>  
>  	mutex_unlock(&gtr_phy->phy->mutex);
>  	return 0;

-- 
Regards,

Laurent Pinchart

