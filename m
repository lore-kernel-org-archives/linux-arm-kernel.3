Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D05C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBEpExP60BKwR+80aEYT0motmzonf8fi0uI5o05psGA=; b=jtK9ORK+d2Pru+O0uZ7UfyaurC
	WGAKaKlpCQlbLSUqdfLb1GaWu+kk+2sjahpHdc2giWvxbwcDEN5YPV33E2g2i/8fcVCDi+rKsYKaZ
	iydeXyZkPRsBv5fNltJFUfp6zuxMPoZOOxCpblYECLGY9layTEto9b04e1RS4gM/ogpr56KbrLfB+
	fUDwbaJUHNK+V+JMxN3By23x6IBjzRveRGizA6gbZv6J9qk/uydmC0h1GcGuxAA77JJeT5N+yvMJO
	gc/Y8HhZmFpdlJS2vg1rsR+3sJLPtCeM3KRze0kdk//2cCh0rLeqjHfRwXBtxpatE06L9t3uu6xMW
	+8oBVYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ile-000000037jL-1dT6;
	Mon, 21 Sep 2026 18:29:30 +0000
Received: from mail-oo2-x2b.google.com ([2607:f8b0:4864:31::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ilb-000000037i6-3iCS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:29:29 +0000
Received: by mail-oo2-x2b.google.com with SMTP id 006d021491bc7-6bff4d6504cso1410337eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790015363; x=1790620163; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zBEpExP60BKwR+80aEYT0motmzonf8fi0uI5o05psGA=;
        b=UE6f6TumaPLiWfhIPF/QJL9u476YpR/drEDQWOzDCeFhJeVIbBfnezutf37Tv66dac
         +CcyJZ+8mv0qdnJzHmS2T1BkXCOcpmryq2sUNRSilNoNskOvRFpByc2J4CKC5RG5prE+
         pcKErMQbxcuQ+QR33xh/HpjIOF17nk4Feys7XwCUnVw1dCsNR48slH/CHt+sTic1cq3V
         2ta0ffojpI0DVvQrZC3oovBtVr+f65DGPBTMC2aJVuDsMcMex6uxhdIslBajviiodmA4
         X+YoHmGOJcmtF4CKnTBHZUwJodIp/Arl0z75/nGysqqF/TXgGMyqoDuLme6IEopdQT3H
         B5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015363; x=1790620163;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBEpExP60BKwR+80aEYT0motmzonf8fi0uI5o05psGA=;
        b=YSs+vqZBaPIX2SsC1j+HHs5kseiz1TkWJQvYgva5b9qyP3pq2b77vK2qgZlti9IJx/
         k0B8BlZ6rmp9wqELas3NMxrv2TmWiQFmBrFZpKURs/PpQ6NGiKIRflaBwuoX/3yCDr0P
         G7N7Q5kUfacLE7WbaMtO8FWmcmmVRCbR7hLl8Bwys6i3hxzgyK6Yjk0kyO9CDxmQR9tB
         DePG4GCyeDbgJxEZiJBeTU6GpcU8ijWqsvQPL1X4DPMljy+4vgeXEwabZEMlwCCMgbmI
         agCjJq2RnLP259OFfs/HsQ//9x6KakEbHa41gKjJzBkV9QoNQ66HFYPW4GJFI3AMRvQi
         6ccg==
X-Forwarded-Encrypted: i=1; AKwUvBxd7XfJ1iDi7Wvyc2loVY+hFE3b6rzHgMWBjhyBOZNdj7uogXg1ImKiw7mJOdckLKsg8vMd8UYPCVeKKTiOd77j@lists.infradead.org
X-Gm-Message-State: AFuF++mZ04bTmPRfiJNvrg4P6hFiytBPdPvPr8eN0RwJtQMBEq5W4TXx
	cWQdl1r5bZO9aP3KUCnXPNZ1KprOhG0UmJO2d8OAdX69OZMkyI+EEfIRFDrCIHBokA==
X-Gm-Gg: AYBFou3zAcRWL/YqL2ZP+ZjJJOuOUEER4vZfCHPQXkf7RlcoRFF20uP05P6zrfs+x1d
	DQo3xSN7ckIghk74yL0xjbPTeILrKNpxLfAI0maOz9aa/Op90AzwDnlBC/hVVxMsxme3MEoEoqg
	s2RTpBlrMQpNtoENOm7X4YIcfzZj2WmMIs/lxhRcIFGHAyNUrVq8LqGTbK2vjzOaic9c3nlkxIz
	hgh+WlBZlcopUS/ZzUOV7liNOYKfwyx45fR3k8qzrATVD3B89oCQaQD00/Zc0nQLyE0PZ3ybKp1
	PrLkUGh5FwEL8yCmqeTIIISRZ9k4TnOoBWcHffMV+da7cu7Jrd6WzWP/D4+TWNge8o5m8YGjwgX
	+LgEDm5DZS8fPlZ4iHcQ3T2UxjP+sDSjBGOkr7aLNle9BRG10nGtHL197QSxi+Kw8WoJThu+Yxc
	yLfJGrVW4qu2gabssegxLnotKG41OX9rJ10JevoB0K9gX/pJLfuAyvlsHPemAALrZHFaMfpraIt
	Bz9Miopvw3V+XyJoAA6+XU7AXLRlpRMcEFP
X-Received: by 2002:a05:6820:607:b0:6c2:c9:2c76 with SMTP id 006d021491bc7-6ca9a85289amr10091458eaf.16.1790015362272;
        Mon, 21 Sep 2026 11:29:22 -0700 (PDT)
Received: from google.com (222.97.173.34.bc.googleusercontent.com. [34.173.97.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d181ae5a14sm26230eaf.3.2026.09.21.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:29:21 -0700 (PDT)
Date: Mon, 21 Sep 2026 18:29:19 +0000
From: Neill Kapron <nkapron@google.com>
To: RD Babiera <rdbabiera@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de,
	neil.armstrong@linaro.org, badhri@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-ID: <arF3fynAGG5khe3B@google.com>
References: <20260918222513.2633456-2-rdbabiera@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918222513.2633456-2-rdbabiera@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112927_932357_8F629519 
X-CRM114-Status: GOOD (  28.00  )
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

Hi RD,

Thanks for sending v7. I've reviewed the changes and identified a few
functional issues, and a couple minor items as seen below:


On Fri, Sep 18, 2026 at 10:25:14PM +0000, RD Babiera wrote:
> Add USB3 PHY support for the Google Tensor G5 USB PHY driver.
...
> --- a/drivers/phy/phy-google-usb.c
> +++ b/drivers/phy/phy-google-usb.c
> @@ -20,6 +20,7 @@
>  #include <linux/reset.h>
>  #include <linux/usb/typec_mux.h>

The driver is now using readl_poll_timeout() and
pm_runtime_get_if_active(), we should be including linux/iopoll.h and
linux/pm_runtime.h explicitly.

> +#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS 0x1e85
> +#define TCA_PSTATE_0_OFFSET 0x50
> +#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
> +
> +#define GPHY_TCA_DELAY_US 10
> +#define GPHY_TCA_TIMEOUT_US 100000

With the addition of TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS, we
should consider bumping GPHY_TCA_TIMEOUT_US to be slightly larger (e.g.
110000us) to ensure the hardware timeout is guaranteed to expire before
the software poll timeout.

> +static const char * const u2phy_clk_names[] = {
> +	"usb2",
> +	"usb2_apb",
> +};
> +static const char * const u3phy_clk_names[] = {
> +	"usb3"
> +};
> +static const char * const u2phy_rst_names[] = {
> +	"usb2",
> +	"usb2_apb",
> +};
> +static const char * const u3phy_rst_names[] = {
> +	"usb3"
> +};

nit: checkpatch.pl --strict flags missing blank lines between these
array declarations (and the inline helper functions + DEFINE__FREE
macros below).

> +
> +static const struct google_usb_phy_config phy_configs[GOOGLE_USB_PHY_NUM] = {
> +	[GOOGLE_USB2_PHY] = {
> +		.clk_names = u2phy_clk_names,
> +		.num_clks = ARRAY_SIZE(u2phy_clk_names),
> +		.rst_names = u2phy_rst_names,
> +		.num_rsts = ARRAY_SIZE(u2phy_rst_names),
> +	},
> +	[GOOGLE_USB3_PHY] = {
> +		.clk_names = u3phy_clk_names,
> +		.num_clks = ARRAY_SIZE(u3phy_clk_names),
> +		.rst_names = u3phy_rst_names,
> +		.num_rsts = ARRAY_SIZE(u3phy_rst_names),
> +	},
> +};
> +
> +static inline void google_usb_phy_clk_disable(struct google_usb_phy_instance *inst)
> +{
> +	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +}
> +DEFINE_FREE(inst_clk_disable, struct google_usb_phy_instance *,
> +	    if (_T) google_usb_phy_clk_disable(_T))
> +
> +static inline void google_usb_phy_rst_disable(struct google_usb_phy_instance *inst)
> +{
> +	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> +}
> +DEFINE_FREE(inst_rst_disable, struct google_usb_phy_instance *,
> +	    if (_T) google_usb_phy_rst_disable(_T))
> +
...
>   
>  static int google_usb_set_orientation(struct typec_switch_dev *sw,
>  				      enum typec_orientation orientation)
>  {
>  	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +	int ret = 0;
>  
>  	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
>  
> -	gphy->orientation = orientation;
> +	guard(mutex)(&gphy->phy_mutex);
>  
> -	if (pm_runtime_suspended(gphy->dev))
> -		return 0;
> +	gphy->orientation = orientation;
>  
> -	guard(mutex)(&gphy->phy_mutex);
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		if (pm_runtime_get_if_active(gphy->dev) <= 0)
> +			return 0;
> +	}
>  
>  	set_vbus_valid(gphy);
>  
> -	return 0;
> +	if (gphy->phy_state == COMBO_PHY_TCA_READY && orientation != TYPEC_ORIENTATION_NONE)
> +		ret = program_tca_locked(gphy);
> +
> +	pm_runtime_put(gphy->dev);
> +
> +	return ret;
>  }

Previously, sashiko recommended moving to pm_runtime_get_if_active(),
which was done in v6. However I think this may have changed the behavior
of google_usb_set_orientation() and potentially introduced a regression
due to the pre-existing ordering of calls in gooogle_usb_phy_probe(),
causing this function to always take the early 'return 0' path.

In google_usb_phy_probe(), we call devm_phy_create() prior to calling
pm_runtime_enable(dev).

In drivers/phy/phy-core.c, devm_phy_create() calls phy_create(), which
has the following check:

    if (pm_runtime_enabled(dev)) {
        pm_runtime_enable(&phy->dev);
        pm_runtime_no_callbacks(&phy->dev);
    }

Therefore, the phy device never has pm_runtime_enabled, causing this
call to pm_runtime_get_if_active() to always return 0, and the function
exits prior to calling `set_vbus_valid()`.

I think moving the pm_runtime_enable(dev) call prior to
devm_phy_create() will resolve the issue, but we should audit power
managment in this driver to verify.

> 
> +static int google_usb3_phy_init(struct phy *_phy)
> +{
> +	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +	struct google_usb_phy *gphy = inst->parent;
> +	int ret = 0;
> +	u32 reg;
> +
> +	dev_dbg(gphy->dev, "initializing usb3 phy\n");
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	if (gphy->phy_state != COMBO_PHY_IDLE) {
> +		dev_warn(gphy->dev, "usb3 phy init called when combo phy state is not idle\n");
> +		return 0;
> +	}
> +
> +	reg = readl(gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);
> +	reg &= ~TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL;
> +	reg |= FIELD_PREP(TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL,
> +			  TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS);
> +	writel(reg, gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);

I think this introduces a regression between v6 and v7, as usb3_tca_base
may be accessed prior to the 'usb3' clock being enabled, and
furthermore, the call to reset_control_bulk_deassert() will clear this
value.

Therefore, I think we need to this after the call to
reset_control_bulk_deassert().

> +
> +	reg = readl(gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
> +	reg |= PHY_POWER_CONFIG_REG1_PG_MODE_EN;
> +	reg &= ~PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG;
> +	reg |= FIELD_PREP(PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG,
> +			  (UPCS_PIPE_CONFIG_ISO_CPM |
> +			   UPCS_PIPE_CONFIG_PG_MODE_STATIC |
> +			   UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT));
> +	writel(reg, gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
> +
> +	set_vbus_valid(gphy);
> +
> +	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +	reg |= USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN;
> +	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +
> +	set_sram_bypass(gphy, SRAM_BYPASS_MODE_BYPASS_FIRMWARE |
> +			SRAM_BYPASS_MODE_BYPASS_CONTEXT);
> +	set_pmgt_ref_clk_req_n(gphy, true);
> +	struct google_usb_phy *pmgt_ref_clk_req_dev __free(pmgt_ref_clk_req_n) = gphy;
> +
> +	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> +	if (ret)
> +		return ret;
> +	struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
> +
> +	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
> +	if (ret)
> +		return ret;
> +	struct google_usb_phy_instance *rst_dev __free(inst_rst_disable) = inst;
> +
> +	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_PSTATE_0_OFFSET,
> +				 reg, !(reg & TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS),
> +				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(gphy->dev, "wait for lane0 phystatus timed out\n");
> +		return ret;
> +	}
> +
> +	gphy->phy_state = COMBO_PHY_INIT_DONE;
> +
> +	retain_and_null_ptr(rst_dev);
> +	retain_and_null_ptr(clk_dev);
> +	retain_and_null_ptr(pmgt_ref_clk_req_dev);
> +
> +	return 0;
> +}
> +
> 
>

Thanks,
Neill

