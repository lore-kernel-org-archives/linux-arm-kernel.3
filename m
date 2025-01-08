Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76283E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 21:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D041SwdHYWNWMigFkJt4+JIf+crqlqsXgmWSFbexmFE=; b=muQ0SvVeb1qFiSYkLY1Sz8F05q
	4JoO2OVG17zMio8nygKHKLgxa4X/t4RWYezzTXwzFuK5bTaPDGn1rz8Mlkqqxs1iDS+M4wBqyFjhr
	ErwshpXwzTLHQCBNL6bCHrrbRtXQsCQDQmxGKtwKQ0aVGtEhTVwnAliYUs5xc6Kd13DomcqacF8Cb
	gZy4WWJ1TsTxwQfV2qkxxKseAoVwNWDW2/VyoREysv0S7ZhB2nSAdJ63WVcYXPQo0gLvvD8MBwhid
	xdBMj1r0bp2jjcIjHF3OhS6uHRNKeoID/q7UV/UtY4k4IwP0UNKpDk/cGyCb/vEDYT+3SvfH6iLuN
	u5+MzAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVd9W-00000009qFE-0OJt;
	Wed, 08 Jan 2025 20:59:46 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVd8J-00000009q2d-1K5K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 20:58:32 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so1195491fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 12:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736369909; x=1736974709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D041SwdHYWNWMigFkJt4+JIf+crqlqsXgmWSFbexmFE=;
        b=NEZE1+1WORqI9LBRQTGh7kEqsmANFrbxMkMDBfwT9tejOCiBTE5G1I0P0OVtBkdgBr
         8NBmYol/cxDOD5D5HzJaWJPL9t1dglyDN9UmNx3p0alo/YBcfuLO73maoYV+fDw+pLsd
         m9NUUHq9HgFDMJ22WIUdkIyUpX+x76nGG7aOx6C+QN/kI2KqTW0/SVAYlykpliMAKXRI
         4ZHPxRTOEWqPNHznUZiorrbKlJbUiHgo8FtVV6HB3SThFzdJseaY55GyKoQolbyZwJgx
         xXknNzm9Db5ucDuqefCnsf+idN+Wi0wJClHJwKT/Lvo7UqywpJlDwXwBWKp9RPsaMTVy
         LXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736369909; x=1736974709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D041SwdHYWNWMigFkJt4+JIf+crqlqsXgmWSFbexmFE=;
        b=VMaNl+BdCTXdsap7EwlAmf9ti9Xv6TZGVq9aBOFHXCuJEah31+alyGvGhh7JoPGFur
         xQOyXskzq32J18gdm3TolC2KW3q+2LOHYbaK2tNlQ4NT0ysbULQJuBoSGVUAbAZnMO94
         UGXFVJwaV6aDBH3iNri9U7YlqS3dw6vcMy7tGynfmT68j0w4s4oRJVQdJnyk5w/i82R9
         TPTMkCzUTbqwh4uXkJpdiiC8Hg6EWPyhBUFwaJhMZz4TX1CJ9ZmeOn4g+sdp/zq2GnxQ
         2QpAsZaFmK99uJ4uYh+kxxP5P1PG3fpQJFTMSzye3HmvUMu3eFOUepoTnQZQQUg/MaJ/
         PXIg==
X-Forwarded-Encrypted: i=1; AJvYcCVA5gVKbD9cgDaaKNpe+HMSGdLRt3KQaSwujlvtw5BbDZs7spVlqLCuR9+Ez/8uZO8v2beqVetYgtvAs8jvsHP+@lists.infradead.org
X-Gm-Message-State: AOJu0YwSmo6rTF7AN+uMs0eFQdUnRGKN3vAd0DtPBtvA7RLKFH8dR8Vm
	XmpSpFCaYxjWaKxWfdCX2z4ez4eDos6T6uUwDF0GzIyXzfmtI7ATzz5I4nujEGE=
X-Gm-Gg: ASbGncthNkUtriygX6xhDaco2aBMYhgGtFsd1atO7vjoZrTI58+RceiKlJOxYqz9JTY
	qj6lipYhrh02l2+zQjlz5vwhkRY4bbgOcrkpUJAcDcSeInhfkywBl7qWbXJe29y3fnvEmgbrXTZ
	1qmnW15yGPvsOoUeBGrcL1QlmfbGy4o6w+BQKKOKgki68R5rKkvvlTkWsdmuz847Ab5lrIFrSOL
	GFOuPVksdjVPMMWd0vd9AGUGX3OQsmQt6f7gV6hb7biNB7KPthRhfghPPjZrh9WS4S1xwq2gMOC
	NZt6Sm4zxMfkdIdVPBKAV8xj/t0/dbP2Bipp
X-Google-Smtp-Source: AGHT+IEHOmBJZvnHUY+VnOmirrNKUoUnyZBed/dBjNDUGMfiiafHMe4J5mjKk5uonUpyQAXGzoSnRw==
X-Received: by 2002:a2e:a781:0:b0:302:1aed:f62a with SMTP id 38308e7fff4ca-305f45a0a1emr11449191fa.21.1736369908167;
        Wed, 08 Jan 2025 12:58:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c632sm63195401fa.21.2025.01.08.12.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 12:58:26 -0800 (PST)
Date: Wed, 8 Jan 2025 22:58:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com, 
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v4 32/34] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <5qtfugb6jvmf7e2aixwxf2wdeldrfmybpg5xloeqewloj3z7mb@rf4pbiomsic6>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
 <20250108112744.64686-33-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108112744.64686-33-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_125831_381937_07768826 
X-CRM114-Status: GOOD (  34.10  )
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

On Wed, Jan 08, 2025 at 12:27:42PM +0100, AngeloGioacchino Del Regno wrote:
> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> found in MediaTek's MT8195, MT8188 SoC and their variants, and
> including support for display modes up to 4k60 and for HDMI
> Audio, as per the HDMI 2.0 spec.
> 
> HDCP and CEC functionalities are also supported by this hardware,
> but are not included in this commit and that also poses a slight
> difference between the V2 and V1 controllers in how they handle
> Hotplug Detection (HPD).
> 
> While the v1 controller was using the CEC controller to check
> HDMI cable connection and disconnection, in this driver the v2
> one does not.
> 
> This is due to the fact that on parts with v2 designs, like the
> MT8195 SoC, there is one CEC controller shared between the HDMI
> Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
> adding support to use the CEC HW to wake up the HDMI controllers
> it is necessary to have support for one TX, one RX *and* for both
> at the same time.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig            |    8 +
>  drivers/gpu/drm/mediatek/Makefile           |    2 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |   10 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    9 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  403 ++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 ++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1379 +++++++++++++++++++
>  7 files changed, 2074 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> 

[...]

> +
> +static int mtk_hdmi_v2_bridge_atomic_check(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *bridge_state,
> +					   struct drm_crtc_state *crtc_state,
> +					   struct drm_connector_state *conn_state)
> +{
> +	return drm_atomic_helper_connector_hdmi_check(conn_state->connector,
> +						      conn_state->state);
> +}

This is now a part of the drm_bridge_connector and can be dropped from
the bridge driver.

> +
> +static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
> +	.attach = mtk_hdmi_v2_bridge_attach,
> +	.detach = mtk_hdmi_v2_bridge_detach,
> +	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
> +	.mode_set = mtk_hdmi_bridge_mode_set,
> +	.atomic_pre_enable = mtk_hdmi_v2_bridge_pre_enable,
> +	.atomic_enable = mtk_hdmi_v2_bridge_enable,
> +	.atomic_disable = mtk_hdmi_v2_bridge_disable,
> +	.atomic_post_disable = mtk_hdmi_v2_bridge_post_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_check = mtk_hdmi_v2_bridge_atomic_check,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.detect = mtk_hdmi_v2_bridge_detect,
> +	.edid_read = mtk_hdmi_v2_bridge_edid_read,
> +	.hpd_enable = mtk_hdmi_v2_hpd_enable,
> +	.hpd_disable = mtk_hdmi_v2_hpd_disable,
> +	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
> +	.hdmi_clear_infoframe = mtk_hdmi_v2_hdmi_clear_infoframe,
> +	.hdmi_write_infoframe = mtk_hdmi_v2_hdmi_write_infoframe,

Note: the HDMI Codec framework has been merged. switching to it can come
as a followup patchset.

> +};
> +
> +/*
> + * HDMI audio codec callbacks
> + */
> +static int mtk_hdmi_v2_audio_hook_plugged_cb(struct device *dev, void *data,
> +					     hdmi_codec_plugged_cb fn,
> +					     struct device *codec_dev)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +	bool plugged;
> +
> +	if (!hdmi)
> +		return -ENODEV;
> +
> +	mtk_hdmi_audio_set_plugged_cb(hdmi, fn, codec_dev);
> +	plugged = (hdmi->hpd == HDMI_PLUG_IN_AND_SINK_POWER_ON);
> +	mtk_hdmi_v2_handle_plugged_change(hdmi, plugged);
> +
> +	return 0;
> +}
> +
> +static int mtk_hdmi_v2_audio_hw_params(struct device *dev, void *data,
> +				       struct hdmi_codec_daifmt *daifmt,
> +				       struct hdmi_codec_params *params)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	if (hdmi->audio_enable) {
> +		mtk_hdmi_audio_params(hdmi, daifmt, params);
> +		mtk_hdmi_v2_aud_output_config(hdmi, &hdmi->mode);
> +	}
> +	return 0;
> +}
> +
> +static int mtk_hdmi_v2_audio_startup(struct device *dev, void *data)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	mtk_hdmi_v2_hw_aud_enable(hdmi, true);
> +	hdmi->audio_enable = true;
> +
> +	return 0;
> +}
> +
> +static void mtk_hdmi_v2_audio_shutdown(struct device *dev, void *data)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	hdmi->audio_enable = false;
> +	mtk_hdmi_v2_hw_aud_enable(hdmi, false);
> +}
> +
> +static int mtk_hdmi_v2_audio_mute(struct device *dev, void *data, bool enable, int dir)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	mtk_hdmi_v2_hw_aud_mute(hdmi, enable);
> +
> +	return 0;
> +}
> +
> +static const struct hdmi_codec_ops mtk_hdmi_v2_audio_codec_ops = {
> +	.hw_params = mtk_hdmi_v2_audio_hw_params,
> +	.audio_startup = mtk_hdmi_v2_audio_startup,
> +	.audio_shutdown = mtk_hdmi_v2_audio_shutdown,
> +	.mute_stream = mtk_hdmi_v2_audio_mute,
> +	.get_eld = mtk_hdmi_audio_get_eld,
> +	.hook_plugged_cb = mtk_hdmi_v2_audio_hook_plugged_cb,
> +};
> +
> +static __maybe_unused int mtk_hdmi_v2_suspend(struct device *dev)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	mtk_hdmi_v2_disable(hdmi);
> +
> +	return 0;
> +}
> +
> +static __maybe_unused int mtk_hdmi_v2_resume(struct device *dev)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +	int ret;
> +
> +	pm_runtime_get_sync(dev);
> +
> +	ret = mtk_hdmi_v2_clk_enable(hdmi);
> +	if (ret)
> +		return ret;
> +
> +	mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, true);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(mtk_hdmi_v2_pm_ops, mtk_hdmi_v2_suspend, mtk_hdmi_v2_resume);
> +
> +static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
> +	.bridge_funcs = &mtk_v2_hdmi_bridge_funcs,
> +	.codec_ops = &mtk_hdmi_v2_audio_codec_ops,
> +	.mtk_hdmi_clock_names = mtk_hdmi_v2_clk_names,
> +	.num_clocks = MTK_HDMI_V2_CLK_COUNT
> +};
> +
> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8188 = {
> +	.ver_conf = &mtk_hdmi_conf_v2,
> +	.reg_hdmi_tx_cfg = HDMITX_CONFIG_MT8188
> +};
> +
> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8195 = {
> +	.ver_conf = &mtk_hdmi_conf_v2,
> +	.reg_hdmi_tx_cfg = HDMITX_CONFIG_MT8195
> +};
> +
> +static int mtk_hdmi_v2_probe(struct platform_device *pdev)
> +{
> +	struct mtk_hdmi *hdmi;
> +	int ret;
> +
> +	hdmi = mtk_hdmi_common_probe(pdev);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	hdmi->hpd = HDMI_PLUG_OUT;
> +
> +	/*
> +	 * Disable all HW interrupts at probe stage and install the ISR
> +	 * but keep it disabled, as the rest of the interrupts setup is
> +	 * done in the .bridge_attach() callback, which will enable both
> +	 * the right HW IRQs and the ISR.
> +	 */
> +	mtk_hdmi_v2_hwirq_disable(hdmi);
> +	irq_set_status_flags(hdmi->irq, IRQ_NOAUTOEN);
> +	ret = devm_request_threaded_irq(&pdev->dev, hdmi->irq, mtk_hdmi_v2_isr,
> +					mtk_hdmi_v2_isr_thread,
> +					IRQ_TYPE_LEVEL_HIGH,
> +					dev_name(&pdev->dev), hdmi);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Cannot request IRQ\n");
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Cannot enable Runtime PM\n");
> +
> +	return 0;
> +}
> +
> +static void mtk_hdmi_v2_remove(struct platform_device *pdev)
> +{
> +	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);

You have devm_pm_runtime_enable(), so this call must go away.

> +	i2c_put_adapter(hdmi->ddc_adpt);
> +}
> +
> +static const struct of_device_id mtk_drm_hdmi_v2_of_ids[] = {
> +	{ .compatible = "mediatek,mt8188-hdmi-tx", .data = &mtk_hdmi_conf_mt8188 },
> +	{ .compatible = "mediatek,mt8195-hdmi-tx", .data = &mtk_hdmi_conf_mt8195 },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_v2_of_ids);
> +
> +static struct platform_driver mtk_hdmi_v2_driver = {
> +	.probe = mtk_hdmi_v2_probe,
> +	.remove = mtk_hdmi_v2_remove,
> +	.driver = {
> +		.name = "mediatek-drm-hdmi-v2",
> +		.of_match_table = mtk_drm_hdmi_v2_of_ids,
> +		.pm = &mtk_hdmi_v2_pm_ops,
> +	},
> +};
> +module_platform_driver(mtk_hdmi_v2_driver);
> +
> +MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>>");
> +MODULE_DESCRIPTION("MediaTek HDMIv2 Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("DRM_MTK_HDMI");
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

