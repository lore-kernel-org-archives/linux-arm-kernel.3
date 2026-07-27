Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2C1C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QW8PobFLl9VuSJ+iyJKGdmgP3JvFIctsAQhl5gtsCFo=; b=H4JY5HAaTK4n59dgSjfmtTRuS7
	KH+fLHClqdMMWFj/o9mrjV42Nu2NotE9h0sDuYzIZx3UsWQVpaxzQGvfDYqWhbzEaw6ZT3hL3eVGs
	sw1kY6l/JjO1oik3J6x4VF0OtKDJr7Yc2FPNwIm/TAQnYVT/XyrSGbW2fd6zbXjPdBShdP3tzN1O6
	2BJNkY6FNHXAy5o8GDrF9tCEC0TccslG9UFOqhukbFddej+iWDIOGkZIqIsZOJpkzxdolKzXLqCxk
	CsIIn3y8ENrokjaQ+eo7FLlUkH8/PrPVXrMmpAEJCESfaPxm2QeJPvbwbo2tOl+L/zC2XUCLqAvaM
	t/bYWnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO0q-00000003Hfj-1ivW;
	Mon, 27 Jul 2026 16:17:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO0o-00000003HeJ-13VZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QW8PobFLl9VuSJ+iyJKGdmgP3JvFIctsAQhl5gtsCFo=;
	b=e9EgnTBFtwUBdOynoixpBPRQKMJaYNApHd+27Crx8WskuqjqK/7/WDTp3QTgLY3EO7Up6B
	nCot9ONufQGsOtAsOrF/2GGLn7xUOK9LZhDAJgXQIX6alQo4RK89kAbYROJ94SkLzXoBZj
	hyQCYry7SA8Psx6WZyWfmO9nU8yDYqw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-k7lgG8YUOmitbVvquUTInw-1; Mon, 27 Jul 2026 12:17:02 -0400
X-MC-Unique: k7lgG8YUOmitbVvquUTInw-1
X-Mimecast-MFC-AGG-ID: k7lgG8YUOmitbVvquUTInw_1785169022
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a098ea19so313330685a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169021; x=1785773821;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QW8PobFLl9VuSJ+iyJKGdmgP3JvFIctsAQhl5gtsCFo=;
        b=naBDnWBXBXWCml4uLIuT2BP7wiXf+w4P0JJTH7nM7e4QtyNhrPBsR+kDS9VNANlKwy
         p5IhbXtwJcUlXFfsCHgqklY+ogk8/Mh+B4MftRpd9J2fDu207QNUGqwyf9633MOJrzd2
         xAVPj1iU0HS4hlB33oFtx7yRInNSL3j1G8mQM/zIZ1vw1Q1oIeWpvvQdaeJGf5mlC02t
         z/cUuhqO0+QAqFdId8j/WLJh/dFlQ3eiMq3IC7R5flbm40ZLa6eFCZ2HjPbr/TA5PA0Q
         Nj6XBEuAOHXbxm3SLkS4j1XHc4Fa/gC+BGkeeRihX6HQOwnWvDGVItawDNTSGlDxCkwz
         vXWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/JW76CfY0LcejZNSVjhbjwW6+CzKXr4rveDue98My1c4hhfa4UhH2w+0BWpVy29EQV+MQ8ZJN8xcUNru8f5JI@lists.infradead.org
X-Gm-Message-State: AOJu0Yymqdm8ckziVmuXdCMnBwq3GGJs9y3xDnZLSY13JmWGPHM8oZOv
	3Dgp8/1d65IeUp+eU/kemDfXfCSFK0k9/gHE49Pgm3Q61nAAqvmKsvyeyj8A364JSiYH+PRJk72
	hDCSTc45vV6r0Q2Lb3/5zM577JXxWq4GX5DtaSb8SFu07PK9D19Ay71WqGCniEvJRxROzUuq0bn
	BS
X-Gm-Gg: AR+sD11VLdziJhmKzW0VJXcfJPcSYkcPTZ46zkGXbIqUcP4Z/EWQOiKm3Hi9+63BQwD
	0XAI84zZG7xcIQ058BbjSkqrbnZ76t5Fy0KPtZ4qSewmtMEJZ/b9p9u2Jefe84KeA2cFIjIlDfA
	pzmHx02cgb5xRpEin83gZSkt3Rk10l2G35uoU/EAlbkACI56/lhTTKl6UN40uuC15e1p4pW1E0h
	iwzLFKLEiCKQpmr6o0QlYPE1e/Ovz1WUEiVqwr0JHzIDbt1akztQpo5YjzzeYDDkGzuAH9ck9B2
	VTULdUATs043OWKJROAoY39Q1bt7Wl9HKJUYm1C74wXKslgJuWPO3I8uK/B5csbqRJglYZz9y5+
	KjbaFy5EZNvuLcX9WF+Yj9byB0COf6M3G5iE=
X-Received: by 2002:a05:620a:2691:b0:915:83fa:b3e0 with SMTP id af79cd13be357-932df627547mr956644185a.5.1785169020707;
        Mon, 27 Jul 2026 09:17:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:915:83fa:b3e0 with SMTP id af79cd13be357-932df627547mr956637785a.5.1785169020166;
        Mon, 27 Jul 2026 09:17:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de6724a4sm641575585a.43.2026.07.27.09.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:16:58 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:16:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: Re: [PATCH v3 2/5] clk: mediatek: Add mt8173-mfgtop driver
Message-ID: <ameEd76Flq7_eUMy@redhat.com>
References: <20260727091555.1023910-1-wenst@chromium.org>
 <20260727091555.1023910-3-wenst@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20260727091555.1023910-3-wenst@chromium.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2y_H6sdQ54nWGqRl83xl8AENalJrUXdKh36yS3uPosM_1785169022
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_091706_361233_68B6EE3A 
X-CRM114-Status: GOOD (  23.62  )
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

Hi Chen-Yu,

On Mon, Jul 27, 2026 at 05:15:51PM +0800, Chen-Yu Tsai wrote:
> The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> in the datasheet, that contains clock gates, some power sequence signal
> delays, and other unknown registers that get toggled when the GPU is
> powered on.
> 
> The clock gates are exposed as clocks provided by a clock controller,
> while the power sequencing bits are exposed as one singular power domain.
> 
> Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>   - Needed since the driver implements PM domains using the generic PM
>     domain library, which also depends on PM
>   - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>   clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>   (Dan Carpenter / kernel test robot w/ smatch)
> ---

[snip]

> +static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	struct mt8173_mfgtop_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->clk_data = mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_clks));
> +	if (!data->clk_data)
> +		return -ENOMEM;
> +
> +	/* MTK clock gates also uses regmap */
> +	data->regmap = device_node_to_regmap(node);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed to get regmap\n");
> +
> +	data->child_pd.np = node;
> +	data->child_pd.args_count = 0;
> +	ret = of_parse_phandle_with_args(node, "power-domains", "#power-domain-cells", 0,
> +					 &data->parent_pd);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse power domain\n");
> +
> +	devm_pm_runtime_enable(dev);
> +	/*
> +	 * Do a pm_runtime_resume_and_get() to workaround a possible
> +	 * deadlock between clk_register() and the genpd framework.
> +	 */
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to runtime resume device\n");
> +		goto put_of_node;
> +	}
> +
> +	ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
> +				     data->clk_data);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register clock gates\n");
> +		goto put_pm_runtime;
> +	}
> +
> +	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
> +	if (IS_ERR(data->clk_26m)) {
> +		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
> +		goto unregister_clks;
> +	}
> +
> +	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
> +		goto put_26m_clk;
> +	}
> +
> +	data->genpd.name = "mfg-top";
> +	data->genpd.power_on = clk_mt8173_mfgtop_power_on;
> +	data->genpd.power_off = clk_mt8173_mfgtop_power_off;
> +	ret = pm_genpd_init(&data->genpd, NULL, true);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add power domain\n");
> +		goto del_clk_provider;
> +	}
> +
> +	ret = of_genpd_add_provider_simple(node, &data->genpd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add power domain OF provider\n");
> +		goto remove_pd;
> +	}
> +
> +	ret = of_genpd_add_subdomain(&data->parent_pd, &data->child_pd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to link PM domains\n");
> +		goto del_pd_provider;
> +	}
> +
> +	pm_runtime_put(dev);
> +	return 0;
> +
> +del_pd_provider:
> +	of_genpd_del_provider(node);
> +remove_pd:
> +	pm_genpd_remove(&data->genpd);
> +del_clk_provider:
> +	of_clk_del_provider(node);
> +put_26m_clk:
> +	clk_put(data->clk_26m);
> +unregister_clks:
> +	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
> +put_pm_runtime:
> +	pm_runtime_put(dev);
> +put_of_node:
> +	of_node_put(data->parent_pd.np);
> +	return ret;
> +}
> +
> +static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
> +{
> +	struct mt8173_mfgtop_data *data = platform_get_drvdata(pdev);
> +	struct device_node *node = pdev->dev.of_node;
> +
> +	of_genpd_remove_subdomain(&data->parent_pd, &data->child_pd);
> +	of_genpd_del_provider(node);
> +	pm_genpd_remove(&data->genpd);
> +	of_clk_del_provider(node);
> +	clk_put(data->clk_26m);
> +	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);

Looking at the error labels in the probe, does the remove also need:

    of_node_put(data->parent_pd.np);

Otherwise this looks good. With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


