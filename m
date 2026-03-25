Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54C8109C023
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWGD4hQPLoVQRo9t8LEnKi+4d5KyybuIU/ivYgViFIE=; b=O7U26Ld6YejfetfRCKAgrT4G/p
	hYYBbbLtF6hU3l0tPtpfK5ejJPKBF0kiVc+WQ5KSGDFqbKyQ81ERq3cGlGh5+OtQbab6JDpouis39
	wJWubmVyv79xteiTJ+3xw8E0nsbWJ7CFYzSjvIa/YlUtwJIjIqKVwAlEjYS/N+WYKpQIgebtbmlEN
	nTNfPEdQn+/OVEn8lIGTW/IIkOXCxupcSw6G4FpGjoDheRsGmuIUFfZ9M0V66Nn5AIc0Lsx3/+Mu7
	+nOisnoZP6RKS9lN7YRNWVyGqbdbojExV1+/IbRIdE/0L0mWhBtze94feBIdZR1H0uS60eQaHFOTy
	w9L1cJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCS-00000003Zcb-2Kb3;
	Wed, 25 Mar 2026 14:27:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCI-00000003ZY2-2Ugg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774448821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KWGD4hQPLoVQRo9t8LEnKi+4d5KyybuIU/ivYgViFIE=;
	b=TGotR7IGs3XtEiyySecWCTKPSQ8MMzYv7NlIQ0UcfFY83yyqqwWC20lwIoNMY5JRhqC1Lf
	3LwspSmgfoErMTQSboFzVP/Pr6+8Hmo9mSO1Q+VgQUd1tYbkp2WsvEggtDMxMqWI+/Zm8/
	ScndF1iQuLUDCqkRcqUZTiM/V/2FIVI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-D9-2lDvgPo6rbbyWHGJJog-1; Wed, 25 Mar 2026 10:26:59 -0400
X-MC-Unique: D9-2lDvgPo6rbbyWHGJJog-1
X-Mimecast-MFC-AGG-ID: D9-2lDvgPo6rbbyWHGJJog_1774448819
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c4d85d619so377270616d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448819; x=1775053619;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWGD4hQPLoVQRo9t8LEnKi+4d5KyybuIU/ivYgViFIE=;
        b=fIwg9hgrCxU0xwFcj+g5tqbveJ22WGCrKNmY3/2jf+0Ov2VEWvL1BCYqvnCsPf4HBm
         Yp4x5Rq2+LWdMId+y456ge1481bUx+Hbzt2RNPYqu8aSNbBsIgAX9A3TPdm2ZjLSJqKG
         2TXyxh06apk+1HiTnFAaRYZdb84NxeBomIzRCeJieJk2AHjCnGa+2FJg8xns4Kb4QAA4
         XaJy2Dt9nFEq+AoapM5T3BdVPNetEM3ZtzxkHqMomDzrrbdOgzqj/AssunD8zW56EzfK
         +W3GhasKt9QNehxyGoy5+NTu+U1qGZNj/KbKNELUx2aPLcA9Xx4ktNZPo/4h4xVJ09ir
         3QYw==
X-Forwarded-Encrypted: i=1; AJvYcCUgsB9fViU0fNkpRHU3KJOJhq3G0kYHbrqQUmUuDcRNAOUr7iFYEKes/sYPuxcNAEq8IZvOKV2TTmim/uqrM6n4@lists.infradead.org
X-Gm-Message-State: AOJu0YxcR/wpbIQq13CyBhsMKwqM+7fizfEDFp3ZVcEF60oRIQEkYUiK
	kSUyKoqRxYbfRvD5SINtyWVDw1B7F4kNmgT/hR27I9jVms2U4+WkzofRfssQ1X1oU7HXqn9GqEg
	CMuLSWjOiM452VxPhAOThNxzpy0A2w4NAZj7ofBXYBNWoLeOwYRQk/Cvd7a+X/1RS16D/zHEsn1
	XY
X-Gm-Gg: ATEYQzwreNjUhW4ezSR2DwmsRva0YNVNy2oB6WniK9O/xT8GfteOd9xyfkdEuprTU0s
	tZp3fRPlSs5BULpA6oD4lDXDT5sRfLIyAwag1+Uzkw6NSaNjGqk+lfr3owVZf1m4AWZsXnWvQG/
	PyWa9N14gGFSqo/eYeuViG73ryExw7Dnzn92Se71OX4V17uEJvoCWFzn+39OnhJyPK+NbKnheoz
	Ag5isFUhhKERKyrAozYYXI2L9Kg0i0P8JN9QSqQoDtPqE/vGHsH1OsfLVwUjBQlobkk7ks/AexG
	COMGJDrIbsKAyR3eptIYF2KAQ+rXEFxM3xbh7OfF4UQmPkbSYzDng8Xi6XszEYVPVkVYqR5Lm2H
	5Lr9x4JvTk3UPReubUE6vr6iMVy7Qu8GlbWWQFnVA5fUklMU7l6Dr6rIG
X-Received: by 2002:a05:6214:319e:b0:89a:b20:9f4e with SMTP id 6a1803df08f44-89cc4a445a8mr52199356d6.17.1774448818312;
        Wed, 25 Mar 2026 07:26:58 -0700 (PDT)
X-Received: by 2002:a05:6214:319e:b0:89a:b20:9f4e with SMTP id 6a1803df08f44-89cc4a445a8mr52198596d6.17.1774448817701;
        Wed, 25 Mar 2026 07:26:57 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cad854addsm68276376d6.48.2026.03.25.07.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:26:56 -0700 (PDT)
Date: Wed, 25 Mar 2026 10:26:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: mediatek: Add mt8173-mfgtop driver
Message-ID: <acPwruNQpLQg7W2A@redhat.com>
References: <20260325071951.544031-1-wenst@chromium.org>
 <20260325071951.544031-3-wenst@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20260325071951.544031-3-wenst@chromium.org>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J0IOXpsPMQpZXH-4Ca58upvS1YyfNmHIdAFfnp7IEhI_1774448819
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072702_766761_83BDC10D 
X-CRM114-Status: GOOD (  35.82  )
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

On Wed, Mar 25, 2026 at 03:19:46PM +0800, Chen-Yu Tsai wrote:
> The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> in the datasheet, that contains clock gates, some power sequence signal
> delays, and other unknown registers that get toggled when the GPU is
> powered on.
> 
> The clock gates are exposed as clocks provided by a clock controller,
> while the power sequencing bits are exposed as one singular power domain.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reduce tab after GATE_MFG() by one tab
> - Move of_match_clk_mt8173_mfgtop to just before clk_mt8173_mfgtop_drv
> - Rename power domain to "mfg-top"
> - Add FORCE_ABORT and ACTIVE_PWRCTL_EN bits and explicitly clear
>   ACTIVE_PWRCTL_EN bit
> ---
>  drivers/clk/mediatek/Kconfig             |   9 +
>  drivers/clk/mediatek/Makefile            |   1 +
>  drivers/clk/mediatek/clk-mt8173-mfgtop.c | 243 +++++++++++++++++++++++
>  3 files changed, 253 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 2c09fd729bab..8dbd9f14be62 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -537,6 +537,15 @@ config COMMON_CLK_MT8173_IMGSYS
>  	help
>  	  This driver supports MediaTek MT8173 imgsys clocks.
>  
> +config COMMON_CLK_MT8173_MFGTOP
> +	tristate "Clock and power driver for MediaTek MT8173 mfgtop"
> +	depends on COMMON_CLK_MT8173
> +	default COMMON_CLK_MT8173
> +	select PM_GENERIC_DOMAINS
> +	select PM_GENERIC_DOMAINS_OF
> +	help
> +	  This driver supports MediaTek MT8173 mfgtop clocks and power domain.
> +
>  config COMMON_CLK_MT8173_MMSYS
>         tristate "Clock driver for MediaTek MT8173 mmsys"
>         depends on COMMON_CLK_MT8173
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index d8736a060dbd..892a54eeb281 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -82,6 +82,7 @@ obj-$(CONFIG_COMMON_CLK_MT8167_VDECSYS) += clk-mt8167-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173-apmixedsys.o clk-mt8173-infracfg.o \
>  				   clk-mt8173-pericfg.o clk-mt8173-topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8173_IMGSYS) += clk-mt8173-img.o
> +obj-$(CONFIG_COMMON_CLK_MT8173_MFGTOP) += clk-mt8173-mfgtop.o
>  obj-$(CONFIG_COMMON_CLK_MT8173_MMSYS) += clk-mt8173-mm.o
>  obj-$(CONFIG_COMMON_CLK_MT8173_VDECSYS) += clk-mt8173-vdecsys.o
>  obj-$(CONFIG_COMMON_CLK_MT8173_VENCSYS) += clk-mt8173-vencsys.o
> diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
> new file mode 100644
> index 000000000000..9e18f34166ae
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Google LLC
> + * Author: Chen-Yu Tsai <wenst@chromium.org>
> + *
> + * Based on driver in downstream ChromeOS v5.15 kernel.
> + *
> + * Copyright (c) 2014 MediaTek Inc.
> + * Author: Chiawen Lee <chiawen.lee@mediatek.com>
> + */
> +
> +#include <dt-bindings/clock/mt8173-clk.h>
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +static const struct mtk_gate_regs mfg_cg_regs = {
> +	.sta_ofs = 0x0000,
> +	.clr_ofs = 0x0008,
> +	.set_ofs = 0x0004,
> +};
> +
> +#define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
> +	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
> +
> +/* TODO: The block actually has dividers for the core and mem clocks. */
> +static const struct mtk_gate mfg_clks[] = {
> +	GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
> +	GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
> +	GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
> +	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
> +};
> +
> +static const struct mtk_clk_desc mfg_desc = {
> +	.clks = mfg_clks,
> +	.num_clks = ARRAY_SIZE(mfg_clks),
> +};
> +
> +struct mt8173_mfgtop_data {
> +	struct clk_hw_onecell_data *clk_data;
> +	struct regmap *regmap;
> +	struct generic_pm_domain genpd;
> +	struct of_phandle_args parent_pd, child_pd;
> +	struct clk *clk_26m;
> +};
> +
> +/* Delay count in clock cycles */
> +#define MFG_ACTIVE_POWER_CON0	0x24
> + #define RST_B_DELAY_CNT	GENMASK(7, 0)	/* pwr_rst_b de-assert delay during power-up */
> + #define CLK_EN_DELAY_CNT	GENMASK(15, 8)	/* CLK_DIS deassert delay during power-up */
> + #define CLK_DIS_DELAY_CNT	GENMASK(23, 16)	/* CLK_DIS assert delay during power-down */
> + #define FORCE_ABORT		BIT(30)		/* write 1 to force abort a power event */
> + #define ACTIVE_PWRCTL_EN	BIT(31)		/* enable ACTIVE_POWER */
> +
> +#define MFG_ACTIVE_POWER_CON1	0x28
> + #define PWR_ON_S_DELAY_CNT	GENMASK(7, 0)	/* pwr_on_s assert delay during power-up */
> + #define ISO_DELAY_CNT		GENMASK(15, 8)	/* ISO assert delay during power-down */
> + #define ISOOFF_DELAY_CNT	GENMASK(23, 16)	/* ISO de-assert delay during power-up */
> + #define RST__DELAY_CNT		GENMASK(31, 24) /* pwr_rsb_b assert delay during power-down */

Is the double underscore expected in the name?

> +
> +static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
> +{
> +	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
> +
> +	/* drives internal power management */
> +	clk_prepare_enable(data->clk_26m);
> +
> +	/* Power on/off delays for various signals */
> +	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,

Should the return value of clk_prepare_enable() and regmap_write() be
checked?

> +		     FIELD_PREP(RST_B_DELAY_CNT, 77) |
> +		     FIELD_PREP(CLK_EN_DELAY_CNT, 61) |
> +		     FIELD_PREP(CLK_DIS_DELAY_CNT, 60) |
> +		     FIELD_PREP(ACTIVE_PWRCTL_EN, 0));
> +	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON1,
> +		     FIELD_PREP(PWR_ON_S_DELAY_CNT, 11) |
> +		     FIELD_PREP(ISO_DELAY_CNT, 68) |
> +		     FIELD_PREP(ISOOFF_DELAY_CNT, 69) |
> +		     FIELD_PREP(RST__DELAY_CNT, 77));
> +
> +	/* Magic numbers related to core switch sequence and delays */
> +	regmap_write(data->regmap, 0xe0, 0x7a710184);
> +	regmap_write(data->regmap, 0xe4, 0x835f6856);
> +	regmap_write(data->regmap, 0xe8, 0x002b0234);
> +	regmap_write(data->regmap, 0xec, 0x80000000);
> +	regmap_write(data->regmap, 0xa0, 0x08000000);
> +
> +	return 0;
> +}
> +
> +static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
> +{
> +	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
> +
> +	/* Magic numbers related to core switch sequence and delays */
> +	regmap_write(data->regmap, 0xec, 0);
> +
> +	/* drives internal power management */
> +	clk_disable_unprepare(data->clk_26m);
> +
> +	return 0;
> +}
> +
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
> +		dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
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
> +}
> +
> +static const struct of_device_id of_match_clk_mt8173_mfgtop[] = {
> +	{ .compatible = "mediatek,mt8173-mfgtop", .data = &mfg_desc },

Is the match data and mfg_desc used?

Brian

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_mfgtop);
> +
> +static struct platform_driver clk_mt8173_mfgtop_drv = {
> +	.probe = clk_mt8173_mfgtop_probe,
> +	.remove = clk_mt8173_mfgtop_remove,
> +	.driver = {
> +		.name = "clk-mt8173-mfgtop",
> +		.of_match_table = of_match_clk_mt8173_mfgtop,
> +	},
> +};
> +module_platform_driver(clk_mt8173_mfgtop_drv);
> +
> +MODULE_DESCRIPTION("MediaTek MT8173 mfgtop clock driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.53.0.1018.g2bb0e51243-goog
> 


