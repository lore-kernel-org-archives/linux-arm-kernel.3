Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F29C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=; b=FU6HuZr6mDrB80yJftx/9KNsOe
	UmyV5lsSt8i+5eaW/4BhOqHUxv/nlCqp9ETE+gg8Zk3zJxYwmverTU2mLan45l9o1WsTmxHDSV0Gw
	ExUszMkMa/FrjJG1nmIiU2xJftkJj6KwKyVtbIFHs4XNfgeV4vzjJUoflzfafY48DTlMJqkDf+vU5
	7pohCUiKdK2/ptnz9UY5Sik5qKBzJSilUw4YZPisr5mw2I5bh2/8VanYjKmz1EtNyobmlL/TKBiPe
	kKQvV+K/O43Q4nqPzA/9ozs3eoL5057C+6c7g49+qe/SvnMiNH8ylJQVpL9L5EBiTTYYFvd0Ta5lv
	RRuXSDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquOw-0000000HUdk-2BGz;
	Mon, 03 Aug 2026 15:16:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquOt-0000000HUcm-1zeV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
	b=DWfwE+kndzygYyA42BdyjPLX1uUUR6se9yUq6LC98xJatthYSCCVzsb5ZmiAAM3vtcVb9B
	YradT4tOEp0nim3J5y4kWBX0nupboWsbkan1s8fmf/6mW9G77qm5X6J3NenwsKyEpeKgXe
	xpqQNo2EJWScdrlVp1jOIE7VsW4G6DQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-L0mD_GrwN_qcaDB5CHrXzg-1; Mon, 03 Aug 2026 11:16:21 -0400
X-MC-Unique: L0mD_GrwN_qcaDB5CHrXzg-1
X-Mimecast-MFC-AGG-ID: L0mD_GrwN_qcaDB5CHrXzg_1785770180
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81f0b6bb02dso123144657b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770180; x=1786374980;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
        b=PHr6C64MbYApOYwuZSgA6FqMbwzHnZSdLnCMx60dyuM2Z5yas8342nG/DvViSc5qAa
         smAdVfjsB8KkcNCAbEaOceYTPi4IaCkR6zQ2LKun9eX1FQwshQTvt8CAh6OcF3zmO7uI
         M+JqvpQb+Xnnu3rahY4MM2X3TgoKUrLNluZAMTBjPPYacj5JWUf/eMbTWYsJCyXt8yy+
         1iru+Mc4LqydXLbmsZWOI/mAa0RxpR2gZ0+R4kgP23hzWfcHvCtoqepzMHbLrs8G1blF
         NbCpXB4pw8q/cgwRmUjEV1BvkLawNGuvVjYadGe01jc/Z0upaLmWr7LeLv4/RhrvDsB9
         2hcw==
X-Forwarded-Encrypted: i=1; AHgh+RruY85g47Wqrjy7RrXbaoE1bC8ibobZRVkyOmqzK0Le23ZYBtCzowHIxzpkeJCMQoWhx9raRbxbCtUaIN0tO+vN@lists.infradead.org
X-Gm-Message-State: AOJu0YzbBM1baGoifs9Iyf3FuRfTumt5+d9ldVITYT7TOT1+tdiBa/zB
	yGzfMOLgO/+XI6R8S/2shdHH9dgCmGjXYXTvP/VXNuXRZ7Bxas+5pGlnXtFMjtwcAWQI1/Gr4P8
	WMBANdcKjq0js2Mi7hdvuYAQwtIoc7SFcU2G+p96sMIZdz6hX9DO3ir6VeLLnutFDA5L8fIsBgq
	JU
X-Gm-Gg: AR+sD10WSsHnvfksUUWhV6NWSVCovj+IHNFUpZ5bsNL9S1MT9V2WQ6V0A/j08bvCAP8
	cVaIlvGCL9XjeW525tvyWYPqtjNeg3YPS9s3EDNgX757p8qvcSXPQ9Ymh1DWojGEziA4B1baCLx
	fhaiMhWZNIlxGV9+OEHI4s150JyoX165BB+8Yk3uUnvM4BiDZJjT8t0E9zF2MaGaeNcFdv0bxf9
	+M5if48hiN+SYIq/VPlUqm4qEg2SBIitIbXWBUimy+7EXXpCW/qNmVawetIs+UjYl1Jm300+8B/
	CKWjArenonT/opGulDc2t0xK+lFDKJ9C3+RhRmRm207iaeoGXSm3G6kvgF2pbygreLfu5nE22Ny
	HyWs6mLnl+PIympxcZUu5hNR9LWoESr4eCPA=
X-Received: by 2002:a05:690c:6e0d:b0:7dc:aa85:5c67 with SMTP id 00721157ae682-81fd4ad3603mr135326887b3.11.1785770180461;
        Mon, 03 Aug 2026 08:16:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6e0d:b0:7dc:aa85:5c67 with SMTP id 00721157ae682-81fd4ad3603mr135326267b3.11.1785770179868;
        Mon, 03 Aug 2026 08:16:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm56520997b3.39.2026.08.03.08.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:16:19 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:16:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 17/25] clk: mediatek: Add MT8189 topckgen clock support
Message-ID: <anCwwMRMYex2_eSN@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BEm273JSIXOyBlg8qtC9WRF2FuzYauprrBlGhskNofA_1785770180
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081623_584171_2EE21296 
X-CRM114-Status: GOOD (  20.06  )
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

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:21:03PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8189-topckgen.c | 1025 ++++++++++++++++++++++++++++
>  2 files changed, 1026 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 66577ccb9b93..9d3d2983bfb2 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,7 +123,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> new file mode 100644
> index 000000000000..f25c0711512c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> @@ -0,0 +1,1025 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026 MediaTek Inc.
> + *                    Qiqi Wang <qiqi.wang@mediatek.com>
> + *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
> + * Copyright (C) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>

Are these two headers needed?

> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

And this one?

Brian


