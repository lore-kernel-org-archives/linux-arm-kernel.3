Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28BEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Aj7bYwGpmFij+p6WS5NWCrr8WK21yn91m17fgt7T08=; b=iRh40vd5b1UlInDM/C8ldEQm5L
	Ig1wfWd8zcKNirv+jlfhOxVtD3cp3txdMVrzvzkh9FvR35Do4ZVJUNSvUW66irUKEka35LFf+Pq3U
	W2JrhUpjGB/sd9nP6aQh8QBrHODpV++J9o11RqBoB7s0k/YTIqK6WuduLhK92Y1FxZ9VwVFKEMGra
	SgPKQ3tFcC+8Fo2cKa9oo//7Ll+TSqEz8MbO/iZOU7TbrMfcFx/MV75uqBCxOjio2wz38MZnCsz2N
	gEEFDjWQO1W5sXWrtjscdtH0fLxgQSmKx7UtstCwqnmun5arYgMNWF1BuBbPJwQFN8ChTJme2D60q
	jFFxRdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ABd-0000000D6R3-3926;
	Fri, 11 Apr 2025 08:56:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3A0R-0000000D4jV-47Dr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:45:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso12332655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744361098; x=1744965898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Aj7bYwGpmFij+p6WS5NWCrr8WK21yn91m17fgt7T08=;
        b=J2FDNc8+9ARvRiEsh6CDtlSU1k4YHezMkQYXN8VkTPmkKw+FQJg2olQxKmfORcUR9E
         Clcp+XdYCEPqwMPNFEUKLEnDbIkqzKJIM6cxIhIfzais+s1IAbBxDpoQIeFsC5aEphta
         xRg5NuCviB+GJiaF7GQuAEsWi2cAwYmm1/WsCCEGOr8sNeNmBrXhU3zw4NDK9chOqWKD
         XZsMsH6AORENRycPVCFF4Ao0d1rdJVzh1L5W0hdpA99EmaOTApTPgGsdKPrkmZmXfNB4
         qM9b95t6g1425Higf9Rp9FgaXjxNoCgUsrvBhUeAYJG9vPqatn1O0GcETgFW+wivkJY4
         ieTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361098; x=1744965898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Aj7bYwGpmFij+p6WS5NWCrr8WK21yn91m17fgt7T08=;
        b=imYDByq0Hh0zCN481izaakBH9s+sNvVGj3+DzYfNBFO4WH4wFfaxOY+r0DWY4s4+lb
         QIDQuCefYwIKMN9sNNeShfO3orrKr3aFo9hf1P84/KQFIx5X3xeyZQA+Yo4+Tks4gOoL
         D6xj6EPXP+BEnq/FKyCc9cvF/Zul4KUv9F18OCqc6h4+U0SlpPEymhQhv/K4Qc7NwuRi
         VwV0BR/NYrzjGk/UfA6arZrnw3sXOVXbb5TmsZ2zqZ8Y9tmZmKdah0S+s0goBeL2HJuB
         ExurWWklBTMbbQrYeY/IMPWE+vW4atQIjiNQcKQVtGY5epC5MagQe5Z+ihGx9PMHRpO4
         MCdA==
X-Forwarded-Encrypted: i=1; AJvYcCUAJJ1H81PLPyojtN7HGbOtE6eL5ihA0BOfQNofF+60gprMn5ER2Nb8jG3arGpxUFpxHCF0FaJaGE2G7SrhQHTY@lists.infradead.org
X-Gm-Message-State: AOJu0YyWqlhOOoGq0HTXz/76424Z3wv5y/vYSvqPlJhQlC1uL7Zwor5X
	x0RM3Eg1RcRbo3mr1ro2M/L83t0JJoCF2+FYRdTxBDHfJMUOsQwf6ovOht2cW5I=
X-Gm-Gg: ASbGnctUphtwokaFdJrU+7MNrExuXRunk3nydntbnpS94n+m5E2MKGMo8t7lr70VH6f
	W3HWEMULKwlqMceQpbJ+8ih7T+i9iz1gjEOzot/rtrNG7ZRDQvN+rvLTLjD7Gx86C+1/AyF3TgL
	f1W3qNPBOkJB2edhCx0le/XNW0s+b0a66Mne/1LlKh6GhNN+YGH/Z/KR6NYoHweQqyykbxyCX4a
	Q11kThw7ERvKUsovyBYljJHbSVmJQr/qL0Kodliy+blxlLvtAy3BhExK8j4ryGFnZ3iLvom1Oly
	2EWA/ZoO0srRLIJAZOqrXOyyhYhqbOrgyPImYhx+mqmmMt9C
X-Google-Smtp-Source: AGHT+IFmDNoMNIPep30iQGk7L0aRLNYJN1WA4f/yj9i/HMl65pMcNflAUWdBjK5NVU7WvtrKQTywtA==
X-Received: by 2002:a5d:6d82:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-39eaaecd9d3mr1479862f8f.43.1744361098447;
        Fri, 11 Apr 2025 01:44:58 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm1328298f8f.76.2025.04.11.01.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:44:58 -0700 (PDT)
Message-ID: <c65ed484-6edb-4e41-9f63-cde9671aa332@suse.com>
Date: Fri, 11 Apr 2025 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] pmdomain: mediatek: Add support for Dimensity 1200
 MT6893
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, ulf.hansson@linaro.org,
 matthias.bgg@gmail.com, fshao@chromium.org, y.oudjana@protonmail.com,
 wenst@chromium.org, lihongbo22@huawei.com, mandyjh.liu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
 <20250410143944.475773-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250410143944.475773-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_014500_131475_67F52541 
X-CRM114-Status: GOOD (  17.78  )
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



On 10/04/2025 16:39, AngeloGioacchino Del Regno wrote:
> Add power domains definitions to implement support for the
> MediaTek Dimensity 1200 (MT6893) SoC.
> 
> Since this chip's MTCMOS are similar to the ones of Kompanio
> 820 (MT8192), the definitions from that have been reused where
> possible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/pmdomain/mediatek/mt6893-pm-domains.h | 585 ++++++++++++++++++
>   drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
>   2 files changed, 590 insertions(+)
>   create mode 100644 drivers/pmdomain/mediatek/mt6893-pm-domains.h
> 
> diff --git a/drivers/pmdomain/mediatek/mt6893-pm-domains.h b/drivers/pmdomain/mediatek/mt6893-pm-domains.h
> new file mode 100644
> index 000000000000..5baa965d22da
> --- /dev/null
> +++ b/drivers/pmdomain/mediatek/mt6893-pm-domains.h
> @@ -0,0 +1,585 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Collabora Ltd
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#ifndef __PMDOMAIN_MEDIATEK_MT6893_PM_DOMAINS_H
> +#define __PMDOMAIN_MEDIATEK_MT6893_PM_DOMAINS_H
> +
> +#include <linux/soc/mediatek/infracfg.h>
> +#include <dt-bindings/power/mediatek,mt6893-power.h>
> +#include "mtk-pm-domains.h"
> +
> +#define MT6893_TOP_AXI_PROT_EN_MCU_STA1				0x2e4
> +#define MT6893_TOP_AXI_PROT_EN_MCU_SET				0x2c4
> +#define MT6893_TOP_AXI_PROT_EN_MCU_CLR				0x2c8
> +#define MT6893_TOP_AXI_PROT_EN_VDNR_1_SET			0xba4
> +#define MT6893_TOP_AXI_PROT_EN_VDNR_1_CLR			0xba8
> +#define MT6893_TOP_AXI_PROT_EN_VDNR_1_STA1			0xbb0
> +#define MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET		0xbb8
> +#define MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR		0xbbc
> +#define MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1		0xbc4
> +
> +#define MT6893_TOP_AXI_PROT_EN_1_MFG1_STEP1			GENMASK(21, 19)
> +#define MT6893_TOP_AXI_PROT_EN_2_MFG1_STEP2			GENMASK(6, 5)
> +#define MT6893_TOP_AXI_PROT_EN_MFG1_STEP3			GENMASK(22, 21)
> +#define MT6893_TOP_AXI_PROT_EN_2_MFG1_STEP4			BIT(7)
> +#define MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1_STEP5	GENMASK(19, 17)
> +#define MT6893_TOP_AXI_PROT_EN_MM_VDEC0_STEP1			BIT(24)
> +#define MT6893_TOP_AXI_PROT_EN_MM_2_VDEC0_STEP2			BIT(25)
> +#define MT6893_TOP_AXI_PROT_EN_MM_VDEC1_STEP1			BIT(6)
> +#define MT6893_TOP_AXI_PROT_EN_MM_VDEC1_STEP2			BIT(7)
> +#define MT6893_TOP_AXI_PROT_EN_MM_VENC0_STEP1			BIT(26)
> +#define MT6893_TOP_AXI_PROT_EN_MM_2_VENC0_STEP2			BIT(0)
> +#define MT6893_TOP_AXI_PROT_EN_MM_VENC0_STEP3			BIT(27)
> +#define MT6893_TOP_AXI_PROT_EN_MM_2_VENC0_STEP4			BIT(1)
> +#define MT6893_TOP_AXI_PROT_EN_MM_VENC1_STEP1			GENMASK(30, 28)
> +#define MT6893_TOP_AXI_PROT_EN_MM_VENC1_STEP2			GENMASK(31, 29)
> +#define MT6893_TOP_AXI_PROT_EN_MDP_STEP1			BIT(10)
> +#define MT6893_TOP_AXI_PROT_EN_MM_MDP_STEP2			(BIT(2) | BIT(4) | BIT(6) |	\
> +								 BIT(8) | BIT(18) | BIT(22) |	\
> +								 BIT(28) | BIT(30))
> +#define MT6893_TOP_AXI_PROT_EN_MM_2_MDP_STEP3			(BIT(0) | BIT(2) | BIT(4) |	\
> +								 BIT(6) | BIT(8))
> +#define MT6893_TOP_AXI_PROT_EN_MDP_STEP4			BIT(23)
> +#define MT6893_TOP_AXI_PROT_EN_MM_MDP_STEP5			(BIT(3) | BIT(5) | BIT(7) |	\
> +								 BIT(9) | BIT(19) | BIT(23) |	\
> +								 BIT(29) | BIT(31))
> +#define MT6893_TOP_AXI_PROT_EN_MM_2_MDP_STEP6			(BIT(1) | BIT(7) | BIT(9) | BIT(11))
> +#define MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MDP_STEP7		BIT(20)
> +#define MT6893_TOP_AXI_PROT_EN_MM_DISP_STEP1			(BIT(0) | BIT(6) | BIT(8) |	\
> +								 BIT(10) | BIT(12) | BIT(14) |	\
> +								 BIT(16) | BIT(20) | BIT(24) |	\
> +								 BIT(26))
> +#define MT6893_TOP_AXI_PROT_EN_DISP_STEP2			BIT(6)
> +#define MT6893_TOP_AXI_PROT_EN_MM_DISP_STEP3			(BIT(1) | BIT(7) | BIT(9) |	\
> +								 BIT(15) | BIT(17) | BIT(21) |	\
> +								 BIT(25) | BIT(27))
> +#define MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_DISP_STEP4	BIT(21)
> +#define MT6893_TOP_AXI_PROT_EN_2_ADSP				BIT(3)
> +#define MT6893_TOP_AXI_PROT_EN_2_CAM_STEP1			BIT(1)
> +#define MT6893_TOP_AXI_PROT_EN_MM_CAM_STEP2			(BIT(0) | BIT(2) | BIT(4))
> +#define MT6893_TOP_AXI_PROT_EN_1_CAM_STEP3			BIT(22)
> +#define MT6893_TOP_AXI_PROT_EN_MM_CAM_STEP4			(BIT(1) | BIT(3) | BIT(5))
> +#define MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWA_STEP1		BIT(18)
> +#define MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWA_STEP2		BIT(19)
> +#define MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWB_STEP1		BIT(20)
> +#define MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWB_STEP2		BIT(21)
> +#define MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWC_STEP1		BIT(22)
> +#define MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWC_STEP2		BIT(23)
> +
> +/*
> + * MT6893 Power Domain (MTCMOS) support
> + *
> + * The register layout for this IP is very similar to MT8192 so where possible
> + * the same definitions are reused to avoid duplication.
> + * Where the bus protection bits are also the same, the entire set is reused.
> + */
> +static const struct scpsys_domain_data scpsys_domain_data_mt6893[] = {
> +	[MT6893_POWER_DOMAIN_CONN] = {
> +		.name = "conn",
> +		.sta_mask = BIT(1),
> +		.ctl_offs = 0x304,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = 0,
> +		.sram_pdn_ack_bits = 0,
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_CONN,
> +				    MT8192_TOP_AXI_PROT_EN_SET,
> +				    MT8192_TOP_AXI_PROT_EN_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_CONN_2ND,
> +				    MT8192_TOP_AXI_PROT_EN_SET,
> +				    MT8192_TOP_AXI_PROT_EN_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_1_CONN,
> +				    MT8192_TOP_AXI_PROT_EN_1_SET,
> +				    MT8192_TOP_AXI_PROT_EN_1_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_1_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_MFG0] = {
> +		.name = "mfg0",
> +		.sta_mask = BIT(2),
> +		.ctl_offs = 0x308,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
> +	},
> +	[MT6893_POWER_DOMAIN_MFG1] = {
> +		.name = "mfg1",
> +		.sta_mask = BIT(3),
> +		.ctl_offs = 0x30c,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_1_MFG1_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_1_SET,
> +				    MT8192_TOP_AXI_PROT_EN_1_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_1_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_2_MFG1_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MFG1_STEP3,
> +				    MT8192_TOP_AXI_PROT_EN_SET,
> +				    MT8192_TOP_AXI_PROT_EN_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_2_MFG1_STEP4,
> +				    MT8192_TOP_AXI_PROT_EN_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1_STEP5,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
> +	},
> +	[MT6893_POWER_DOMAIN_MFG2] = {
> +		.name = "mfg2",
> +		.sta_mask = BIT(4),
> +		.ctl_offs = 0x310,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_MFG3] = {
> +		.name = "mfg3",
> +		.sta_mask = BIT(5),
> +		.ctl_offs = 0x314,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_MFG4] = {
> +		.name = "mfg4",
> +		.sta_mask = BIT(6),
> +		.ctl_offs = 0x318,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_MFG5] = {
> +		.name = "mfg5",
> +		.sta_mask = BIT(7),
> +		.ctl_offs = 0x31c,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_MFG6] = {
> +		.name = "mfg6",
> +		.sta_mask = BIT(8),
> +		.ctl_offs = 0x320,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_ISP] = {
> +		.name = "isp",
> +		.sta_mask = BIT(12),
> +		.ctl_offs = 0x330,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_ISP,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_ISP_2ND,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_ISP2] = {
> +		.name = "isp2",
> +		.sta_mask = BIT(13),
> +		.ctl_offs = 0x334,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_MM_ISP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_MM_ISP2_2ND,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_IPE] = {
> +		.name = "ipe",
> +		.sta_mask = BIT(14),
> +		.ctl_offs = 0x338,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_MM_IPE,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_MM_IPE_2ND,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_VDEC0] = {
> +		.name = "vdec0",
> +		.sta_mask = BIT(15),
> +		.ctl_offs = 0x33c,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_VDEC0_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_2_VDEC0_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_VDEC1] = {
> +		.name = "vdec1",
> +		.sta_mask = BIT(16),
> +		.ctl_offs = 0x340,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_VDEC1_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_VDEC1_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_VENC0] = {
> +		.name = "venc0",
> +		.sta_mask = BIT(17),
> +		.ctl_offs = 0x344,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_VENC0_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_2_VENC0_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_VENC0_STEP3,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_2_VENC0_STEP4,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_VENC1] = {
> +		.name = "venc1",
> +		.sta_mask = BIT(18),
> +		.ctl_offs = 0x348,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_VENC1_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_VENC1_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6893_POWER_DOMAIN_MDP] = {
> +		.name = "mdp",
> +		.sta_mask = BIT(19),
> +		.ctl_offs = 0x34c,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MDP_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_SET,
> +				    MT8192_TOP_AXI_PROT_EN_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_MDP_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_2_MDP_STEP3,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MDP_STEP4,
> +				    MT8192_TOP_AXI_PROT_EN_SET,
> +				    MT8192_TOP_AXI_PROT_EN_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_MDP_STEP5,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_2_MDP_STEP6,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MDP_STEP7,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_DISP] = {
> +		.name = "disp",
> +		.sta_mask = BIT(20),
> +		.ctl_offs = 0x350,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_DISP_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_DISP_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_SET,
> +				    MT8192_TOP_AXI_PROT_EN_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_DISP_STEP3,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_DISP_STEP4,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
> +				    MT6893_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_AUDIO] = {
> +		.name = "audio",
> +		.sta_mask = BIT(21),
> +		.ctl_offs = 0x354,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT8192_TOP_AXI_PROT_EN_2_AUDIO,
> +				    MT8192_TOP_AXI_PROT_EN_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_2_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_ADSP] = {
> +		.name = "audio",
> +		.sta_mask = BIT(22),
> +		.ctl_offs = 0x358,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(9),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_2_ADSP,
> +				    MT8192_TOP_AXI_PROT_EN_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_2_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_CAM] = {
> +		.name = "cam",
> +		.sta_mask = BIT(23),
> +		.ctl_offs = 0x35c,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_2_CAM_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_CAM_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_1_CAM_STEP3,
> +				    MT8192_TOP_AXI_PROT_EN_1_SET,
> +				    MT8192_TOP_AXI_PROT_EN_1_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_1_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_CAM_STEP4,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_CAM_RAWA] = {
> +		.name = "cam_rawa",
> +		.sta_mask = BIT(24),
> +		.ctl_offs = 0x360,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWA_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWA_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_CAM_RAWB] = {
> +		.name = "cam_rawb",
> +		.sta_mask = BIT(25),
> +		.ctl_offs = 0x364,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWB_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWB_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_CAM_RAWC] = {
> +		.name = "cam_rawc",
> +		.sta_mask = BIT(26),
> +		.ctl_offs = 0x368,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWC_STEP1,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(INFRA,
> +				    MT6893_TOP_AXI_PROT_EN_MM_CAM_RAWC_STEP2,
> +				    MT8192_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +	},
> +	[MT6893_POWER_DOMAIN_DP_TX] = {
> +		.name = "dp_tx",
> +		.sta_mask = BIT(27),
> +		.ctl_offs = 0x3ac,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +};
> +
> +static const struct scpsys_soc_data mt6893_scpsys_data = {
> +	.domains_data = scpsys_domain_data_mt6893,
> +	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt6893),
> +};
> +
> +#endif /* __PMDOMAIN_MEDIATEK_MT6893_PM_DOMAINS_H */
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index b866b006af69..9a33321d9fac 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -18,6 +18,7 @@
>   
>   #include "mt6735-pm-domains.h"
>   #include "mt6795-pm-domains.h"
> +#include "mt6893-pm-domains.h"
>   #include "mt8167-pm-domains.h"
>   #include "mt8173-pm-domains.h"
>   #include "mt8183-pm-domains.h"
> @@ -617,6 +618,10 @@ static const struct of_device_id scpsys_of_match[] = {
>   		.compatible = "mediatek,mt6795-power-controller",
>   		.data = &mt6795_scpsys_data,
>   	},
> +	{
> +		.compatible = "mediatek,mt6893-power-controller",
> +		.data = &mt6893_scpsys_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8167-power-controller",
>   		.data = &mt8167_scpsys_data,


