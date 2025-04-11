Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A80C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym+swB0IGqW3GD8TUu3RUZwOm8qCGuP91NxIKul8xpM=; b=w6x0pURGQobqF4VMixkuut2cc6
	3txfsKqeWyCTo6MpoR0MeXPcEoj8HHbRsvGnRSOWL6hZFAFNJGumWu33TRmxKV9JcGDLnwfx5lGoo
	jlCxKpte6gcR4Bw2qVXL8SN2FTE0kx66CzVbi3jM/yXONUWYfn9ZqaQufb44rimCXa9DIiDHoLJLn
	S3RwlVwVjJSqtSMl+nrujC2KXjtA/Q7XLdpHGLYM4x6vLD9LoAnPKTLoQyq4HRz1C/KqggxTNmf2U
	LtU05IPzcTzcafhl2lDip53bLo7IBFbVlvqzEELo4P9ES4ushdJ5xf2S4FjCRjDYBUm2nUTd6exdU
	d3aSZStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3A83-0000000D5tp-44p1;
	Fri, 11 Apr 2025 08:52:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3A08-0000000D4bv-1002
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:44:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so10834315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744361078; x=1744965878; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ym+swB0IGqW3GD8TUu3RUZwOm8qCGuP91NxIKul8xpM=;
        b=Gl5h/hhVsqiZ2WI8YYSv98WyKyfPS322pn2YcTluwLeh31Sms1jWbHzs0ZTwmxj065
         ZncMVBcxLNbdrHmFIsQGwKV5gklNmMBeJB3O/+8J928tK0RsZO2lgNpI28qmAm6zFjek
         x77fj/liYr9HBACZJIR9imleNPLMd1iCnAWykHimOaG/NeOIQXTdrDFPik15duSwRpFI
         APb3AZ6Dua3RgL0izRYv/2LCaxNstUu9x1a4I1KXUtpTRDGHuaWfQXm3tUm+DdvBe+dc
         JIn5ST8rUzwV8cFH45xtwgEkLccQfBbiLuQnwcOl7M1YksvCZHVKgyuThD9PZFKswjBy
         QIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361078; x=1744965878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym+swB0IGqW3GD8TUu3RUZwOm8qCGuP91NxIKul8xpM=;
        b=aW6mCbMuuiDgchniXnLzqGrAPVnqCZcdqCJawmxjw08UOKdgLzaJSVGLzHFGtWjb4y
         IIj6uZBqP9JB+5WSi1RljuHAaDxwRcBybxB2NbYia3j2w7ZHhZG+jJ5Y65LhHWJc5z2H
         ttw2C+3pb3lLnFE2/9O+4m28hWkmvfnbL7lVs/A0hW7ECOoc+pI9eAm0MO8wsD7s8d6v
         D/XR6cVDSMoWeV8zBFiFja8MJgIIG+NN/AWk7PUfitLceLOQsQKiC8mOSqv8U3bVPduY
         T+1iZ7EScz8LNufItjeDzemkJRmWCByxml7wiZIAnTPMm/zpiyQNSv257S/od5l6IisA
         SBIg==
X-Forwarded-Encrypted: i=1; AJvYcCXV9xhmS86lhKG+BgbjA4nnnrhJNzfKT0SJXiXFTTR1+s/HyjoxnAGxbSetNlI1lgpQJa1Xe1mAovU69p4u0hpf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw8iP/SYvMbDmm8XQW4L48SGZa1c2tbAi82ReTP8Z4MTF/eDCo
	E4tyfFdNn0q2NN/pSrUS6hsAFK/botRgukn/ZOCrn9ifhIclYD4Ix+lcPLKSAEA=
X-Gm-Gg: ASbGncsQzGiDhFw8Vot3uGhVXH76KIiO4HHH1UDLhyBmf3NSHlPu2BACyyqoa0mqV7a
	8UC9WFtLoKhKNrbXQhs0IeUKC7DUrDShjxOQZj58+zlpDQUFxVROF2SNG7S3HRImKH/ajHP007g
	/oZPE5HWAztRlg/9AXSo8ggGHLrK/5XarxB8GUMtr+DR95gEwtJb3uZMk9r9melBuqGAFG+3Zu0
	ru9MlgjjEOP4fyIGHtcGDA2cv7xZxHUL/4ddI65/jhp4ONu0a8rdV25REu1Meg3jh9ypL9jPExQ
	5FME2QoMB8dELYxywF0klcw90nH/VJvY3pubvw==
X-Google-Smtp-Source: AGHT+IFKNUhGZrGZqRnXSCGsdpeGUvavp84OjEvM5R0nmvrxT8ATRqB5MuH3sqH0n0cc88cvltPmyw==
X-Received: by 2002:a05:600c:1e0e:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-43f2ea2a1a9mr53082445e9.4.1744361078490;
        Fri, 11 Apr 2025 01:44:38 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206269c8sm82609535e9.16.2025.04.11.01.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:44:38 -0700 (PDT)
Message-ID: <25d92af3-5aa4-4090-a60b-fff3bc30fcf4@suse.com>
Date: Fri, 11 Apr 2025 10:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: power: mediatek: Support Dimensity
 1200 MT6893 MTCMOS
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, ulf.hansson@linaro.org,
 matthias.bgg@gmail.com, fshao@chromium.org, y.oudjana@protonmail.com,
 wenst@chromium.org, lihongbo22@huawei.com, mandyjh.liu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
 <20250410143944.475773-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250410143944.475773-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_014440_299671_14130382 
X-CRM114-Status: GOOD (  14.28  )
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
> Add support for the Power Domains (MTCMOS) integrated into the
> MediaTek Dimensity 1200 (MT6893) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   .../power/mediatek,power-controller.yaml      |  2 ++
>   .../dt-bindings/power/mediatek,mt6893-power.h | 35 +++++++++++++++++++
>   2 files changed, 37 insertions(+)
>   create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 591a080ca3ff..9c7cc632abee 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -25,6 +25,7 @@ properties:
>       enum:
>         - mediatek,mt6735-power-controller
>         - mediatek,mt6795-power-controller
> +      - mediatek,mt6893-power-controller
>         - mediatek,mt8167-power-controller
>         - mediatek,mt8173-power-controller
>         - mediatek,mt8183-power-controller
> @@ -88,6 +89,7 @@ $defs:
>           description: |
>             Power domain index. Valid values are defined in:
>                 "include/dt-bindings/power/mt6795-power.h" - for MT8167 type power domain.
> +              "include/dt-bindings/power/mediatek,mt6893-power.h" - for MT6893 type power domain.
>                 "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
>                 "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>                 "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
> diff --git a/include/dt-bindings/power/mediatek,mt6893-power.h b/include/dt-bindings/power/mediatek,mt6893-power.h
> new file mode 100644
> index 000000000000..aeab51bb2ad8
> --- /dev/null
> +++ b/include/dt-bindings/power/mediatek,mt6893-power.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 Collabora Ltd
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT6893_POWER_H
> +#define _DT_BINDINGS_POWER_MT6893_POWER_H
> +
> +#define MT6893_POWER_DOMAIN_CONN		0
> +#define MT6893_POWER_DOMAIN_MFG0		1
> +#define MT6893_POWER_DOMAIN_MFG1		2
> +#define MT6893_POWER_DOMAIN_MFG2		3
> +#define MT6893_POWER_DOMAIN_MFG3		4
> +#define MT6893_POWER_DOMAIN_MFG4		5
> +#define MT6893_POWER_DOMAIN_MFG5		6
> +#define MT6893_POWER_DOMAIN_MFG6		7
> +#define MT6893_POWER_DOMAIN_ISP			8
> +#define MT6893_POWER_DOMAIN_ISP2		9
> +#define MT6893_POWER_DOMAIN_IPE			10
> +#define MT6893_POWER_DOMAIN_VDEC0		11
> +#define MT6893_POWER_DOMAIN_VDEC1		12
> +#define MT6893_POWER_DOMAIN_VENC0		13
> +#define MT6893_POWER_DOMAIN_VENC1		14
> +#define MT6893_POWER_DOMAIN_MDP			15
> +#define MT6893_POWER_DOMAIN_DISP		16
> +#define MT6893_POWER_DOMAIN_AUDIO		17
> +#define MT6893_POWER_DOMAIN_ADSP		18
> +#define MT6893_POWER_DOMAIN_CAM			19
> +#define MT6893_POWER_DOMAIN_CAM_RAWA		20
> +#define MT6893_POWER_DOMAIN_CAM_RAWB		21
> +#define MT6893_POWER_DOMAIN_CAM_RAWC		22
> +#define MT6893_POWER_DOMAIN_DP_TX		23
> +
> +#endif /* _DT_BINDINGS_POWER_MT6893_POWER_H */


