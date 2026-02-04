Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3971E9D40F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epZt+Y09pHufvgU+ObynUBr16JQc3dEVQrLIjJohvYA=; b=e6jlTQ9wvaJSFJEnqL7/cG9y8G
	Kqrax5VxqdgVI4HlM8qcMYQaRkLtohFfKvxvEslRUVj+MyR9sy81X+YubVKZCHQniWSsrwNoabDq4
	nkDmavJ3US2wtfQ73ah5iBCeE8SuW9Y04qBD0rRVfDc/2VWPJGu23jlBl2kQWKnIO/G/tAxnsUquH
	xQvT1iZq5HTzcoLw4cW3RmtdDAtmk5JvqqyOcMPLzeG5UaQ5oQeghQAEG6MIVd/eGMAcBYtMseBPT
	5iSzKeU73izf20nvdFNdZ5BtH/IYHFQw3t/1HqoOiHpfCuLEbtQQdGWUs+9RleHUR9b7D2UlNWTw/
	SJrPnT0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngvB-00000008s29-34PX;
	Wed, 04 Feb 2026 17:44:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngv9-00000008s1J-1kSd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 17:44:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-483100e97d8so349425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 09:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227045; x=1770831845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=epZt+Y09pHufvgU+ObynUBr16JQc3dEVQrLIjJohvYA=;
        b=cbGjkYtttkPDX5zn+BSahAGylubycUX4zzfvecSz1lVc555DoiOr60A2ANLVorv7En
         gxNEehkFS9HXR5LiiEzaGLWA2osfNH7cntk5f+PBU9pQkY1Xc7YJDgAzIGqU4YLifkbY
         xM9/QtR9uiRpfR1v8RAXZkGNv1J+p6StJCVyuCFjCVKcPcl412d4o0K+K/G2bjSXmRxS
         eUjqNZtvdusl0DUg8sQAGAT7oQmiI2m44/k2Qa7E3G2Ndb9Dj5eaIk5/1rc/uAiO088a
         Eja/mbMy4CHWVi5YADkDcTvXdhFTesac9OrqR/8kTmQ03k7NoIDNwIo7NbWNlYUnMMaq
         LtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227045; x=1770831845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epZt+Y09pHufvgU+ObynUBr16JQc3dEVQrLIjJohvYA=;
        b=ASdEw3ioxVzYZyc8Qz7kh33YnN2jw0fBEAArb8ZRuLN6eRmw8g9dhSwB13UPih5ski
         8KfFVyK3V3GQvughEF2esQMNMHvkGBhvqQbUDzYAP+Vm8Sea30vcvZjSxOrZz61/HtXV
         /dmrt+lj0enBmVtt+9SKDnJy50p9UzHsMbuS8FBK/w3A0sNWbyQQojEjyih33CYaBEBk
         zPyRJlKAetK2WivdCxgidgCUlsERT2ynOPeSnexkqEugf+mkv1Pq4K/dMjIEZq1Q9elj
         kZkVpeR0mxU1OqTusITKhk6W52EQivu0AqjemQhyW7lYRK6lGb0x/Fx5cP19NkZGvJOl
         qmUA==
X-Forwarded-Encrypted: i=1; AJvYcCVQxKc4guxcIw2Mh1+kqmCvx8s7qvaAIuNryW198djANKbTdulcts5JYIMS80HDDYbpzqq/6fLJMYNCEd3VVc6n@lists.infradead.org
X-Gm-Message-State: AOJu0YzS0Qyk6OHqcaEjuyQIeAA3EV0qAFM0yXskjK/njZfkqZ9/UvEe
	H9lhkn+dgYLYo9xBM29DM8VkIXFLpET5ME/Gl8ULxy7Zdf7G+dC5GIiM
X-Gm-Gg: AZuq6aI2ZVjDg59sHuWKMjyy3Dcv4jeOcrTANt9ncHJU+PKm+Azu2LwVgBKJTFA8srq
	rJqSPrLCsJY3cMzl1Vd0cSDoDEZlWDqbRY5C7SuI0tKM3Fppm9o4YXetWgPRgKA+MsCzfi+kOFU
	XLPw04mMcIdxODbDTuKQoRMbU/BbX/L1R8rPhjZqDm7g3adS+iVmqRxvtbbv+IfhWQhuuH70Wul
	1m34h+iWByOdPPWieVZDch7RwUAuHOG0ocfQo4d1/NKSnJNjVGv7tla58S9PPmPV4wShkUAlHv0
	DJxJBK6tQOcgLkBcAVeW8OgeI1SrBs18atSm4FJRj2CBYK4U9LmRcTVvFlkuuC/n9XZ+Mrfzh0M
	2pVGZaH1ZBG7UmmVUmiRdh0ynGD5RAQOgBJ4zG2wTxqlx/sxccCo8U+4xvL0of082sEorUi5f5V
	/FkHGEMeIV6cyrJyJYk6VRcB0/i0AzOpc7k7dMIkQmhjbmBFe+wPVdeijQvbYr
X-Received: by 2002:a05:600c:8712:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-4830e975764mr58651935e9.27.1770227044879;
        Wed, 04 Feb 2026 09:44:04 -0800 (PST)
Received: from [192.168.0.29] (static-95-59-231-77.ipcom.comunitel.net. [77.231.59.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec57bcdsm44293525e9.2.2026.02.04.09.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:44:03 -0800 (PST)
Message-ID: <4b5918ac-5b8c-4839-a550-da4fb1a1f442@gmail.com>
Date: Wed, 4 Feb 2026 18:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: power: Add MediaTek MT8189 power domain
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
 <20260202064820.347550-2-irving-ch.lin@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20260202064820.347550-2-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094407_488154_A0D7CC41 
X-CRM114-Status: GOOD (  16.21  )
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



On 02/02/2026 07:48, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add dt schema and IDs for the power domain of MediaTek MT8189 SoC.
> The MT8189 power domain IP provide power domains control function
> for subsys (eg. MFG, audio, venc/vdec ...).
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../power/mediatek,power-controller.yaml      |  1 +
>   .../dt-bindings/power/mediatek,mt8189-power.h | 38 +++++++++++++++++++
>   2 files changed, 39 insertions(+)
>   create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 9507b342a7ee..07f046277f8a 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -31,6 +31,7 @@ properties:
>         - mediatek,mt8183-power-controller
>         - mediatek,mt8186-power-controller
>         - mediatek,mt8188-power-controller
> +      - mediatek,mt8189-power-controller
>         - mediatek,mt8192-power-controller
>         - mediatek,mt8195-power-controller
>         - mediatek,mt8196-hwv-hfrp-power-controller
> diff --git a/include/dt-bindings/power/mediatek,mt8189-power.h b/include/dt-bindings/power/mediatek,mt8189-power.h
> new file mode 100644
> index 000000000000..70a8c2113457
> --- /dev/null
> +++ b/include/dt-bindings/power/mediatek,mt8189-power.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Qiqi Wang <qiqi.wang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8189_POWER_H
> +#define _DT_BINDINGS_POWER_MT8189_POWER_H
> +
> +/* SPM */
> +#define MT8189_POWER_DOMAIN_CONN			0
> +#define MT8189_POWER_DOMAIN_AUDIO			1
> +#define MT8189_POWER_DOMAIN_ADSP_TOP_DORMANT		2
> +#define MT8189_POWER_DOMAIN_ADSP_INFRA			3
> +#define MT8189_POWER_DOMAIN_ADSP_AO			4
> +#define MT8189_POWER_DOMAIN_MM_INFRA			5
> +#define MT8189_POWER_DOMAIN_ISP_IMG1			6
> +#define MT8189_POWER_DOMAIN_ISP_IMG2			7
> +#define MT8189_POWER_DOMAIN_ISP_IPE			8
> +#define MT8189_POWER_DOMAIN_VDE0			9
> +#define MT8189_POWER_DOMAIN_VEN0			10
> +#define MT8189_POWER_DOMAIN_CAM_MAIN			11
> +#define MT8189_POWER_DOMAIN_CAM_SUBA			12
> +#define MT8189_POWER_DOMAIN_CAM_SUBB			13
> +#define MT8189_POWER_DOMAIN_MDP0			14
> +#define MT8189_POWER_DOMAIN_DISP			15
> +#define MT8189_POWER_DOMAIN_DP_TX			16
> +#define MT8189_POWER_DOMAIN_CSI_RX			17
> +#define MT8189_POWER_DOMAIN_SSUSB			18
> +#define MT8189_POWER_DOMAIN_MFG0			19
> +#define MT8189_POWER_DOMAIN_MFG1			20
> +#define MT8189_POWER_DOMAIN_MFG2			21
> +#define MT8189_POWER_DOMAIN_MFG3			22
> +#define MT8189_POWER_DOMAIN_EDP_TX_DORMANT		23
> +#define MT8189_POWER_DOMAIN_PCIE			24
> +#define MT8189_POWER_DOMAIN_PCIE_PHY			25
> +
> +#endif /* _DT_BINDINGS_POWER_MT8189_POWER_H */


