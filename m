Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476EDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC668nCt8mHHP3FnT6kcpHmAaYm5QP6my+V/404SJa4=; b=SSn64qvzHvuxqVX2DDBimMzQau
	bErkZMx4epi42zKbBTSWfB8bbOGsRpXEuUz6jn41L7vEidZNfbWM2A/L40lHa0kJdyoiTaoN3644S
	bFNpTxYttNbNmOtRQwRD8IMUHgf5lStngXC6iY9XVU/dIlpMj5j1MSCxqdfME60PZTOEaU2uEkVXR
	T33V+h3/RTpXIutWOF96j2fjipf852kEYAMiT/clgCp8ziitLSpDdQQA9qp+yG7AN/9A2vn4kDz7j
	RUpqKOwpQim1rOdGoE2qbwNqOfRiWTdVP8VS1o/c3kGMF/Am66D2tu4slzpVNq4xliX6ZHPt/MvqS
	SnfOXmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOCK-0000000EYla-3Q7J;
	Mon, 28 Jul 2025 13:47:25 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugO9p-0000000EYMU-3r56
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 13:44:52 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so730672766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710288; x=1754315088; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RC668nCt8mHHP3FnT6kcpHmAaYm5QP6my+V/404SJa4=;
        b=zJ3ixWTB/nWbS5dpdn/xgC3EAA4gQ2b45j4xzk49AZTk6/riACUGPe10mKkUS1s0oo
         qOhlbn9TIsDO6XjdLDCExGF2KMMGbYU+6j+LLBwXM329+JRd5LVapHNxLveFs76LOcwg
         JYB/rryJ2EkS1sb8CNRB+B+jgnT2qk73jFnYqKJL/9H+uALGGyg6E7Kfoso5W3ldgZWj
         b8whW1xY2ov9rrk33hjiLQrUABlG30nLbxiKl2j310FKIdxynwmJiE2egOcdj4ph2DT1
         15uNIosChYvGOmQL7GPIZaLCtwSt/ooU0oHb5eAI4QKCA86sf+JLXpTvDVle63UjUN1Q
         KhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710288; x=1754315088;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RC668nCt8mHHP3FnT6kcpHmAaYm5QP6my+V/404SJa4=;
        b=GZuWxJ/DJhNQ+q7RL48dD1bGFiVw0IcZkJzaifdp4kWwKo4j20b8qjdQ++2XgbPQzD
         Gha8I/2VHDWh7QuZcYoDrde5Vy8g5yFSwApSM3BYvl1E3cQU/3rLUOQ6YeR7hMmEWVKO
         72Z8AUYDff3MOGYqRUzzEN5jmITY+yySva2nTitaVlXVWldKa38ikZwBSfHR5HgY8Xox
         sYZ87yxycvL4nwOR0RT0Di50EnIRymsvKvMmt/fSXQymqX91up99pSGHWC8iz14i6k7h
         jP3f1nHvlg92yOYlJH0ZG41t2f9n/kihv0+1eFbeRr/45cfbL7BmoogoXnemlfW0u3vt
         NM/Q==
X-Gm-Message-State: AOJu0Yw12Tv46fmcT4bwK/fZwvC6OQ71YHUagPj9WBJ5CA4DJ/Ja9Uht
	tuV9jjV3RwSXH+ixVcu23BKNmslWjjfylP0ox2QILoL+n/LqBjt+ad3GL11MtKX972c=
X-Gm-Gg: ASbGncvfX86MfjE5fDin5KJKMKuVuV/3SvBs3p8L0N8THjO9HCWSrp2jW7H48PFFnD1
	01uwKFYhexGaImYpzsSKCQcOA8z7EKSfJibG0Tom/NCC1SD5rZ8bRkjIHiDhW+iklLIEc5RL8fl
	D9dGV0qwm2SJEhSxumNAGclTNmUIkutFMunrA5UEzweiM113YoWIowYf0Lb2CSNYaN11Ob0fQQ9
	cRpwfaCE2xnBQ5qXty6nyG9wcjcy8QnoqSZnquv23sq+NPiZ9x7bB5lB8VMGKNzU+oRBLpFeLvE
	widpOs5HoyIwgqsl70IB3k4ocqbnYpQeMwC0RLy/MEIEUr3gWO+DYVIfbVALNbp5uYBdbJ0Ihir
	+AyiZISC9KmS+jTXxd9rV7p+tby5Fa0eU9JqkMGXnHvGhSG162kXzGnNl3zDGqq0=
X-Google-Smtp-Source: AGHT+IELW+a3KhmjkLCdMZPX2WGb73CXN0xX5TnTiHq9x7ZvKzBuKTWC2hjTDdFNf3HgtVm9iVz32w==
X-Received: by 2002:a17:907:da5:b0:ae3:4f99:a5a5 with SMTP id a640c23a62f3a-af61c2aededmr1250106966b.6.1753710287770;
        Mon, 28 Jul 2025 06:44:47 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a6314asm425521366b.91.2025.07.28.06.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:44:46 -0700 (PDT)
Message-ID: <5ac76f1e-21d1-4265-8afe-b4b7209cfc5a@linaro.org>
Date: Mon, 28 Jul 2025 14:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] media: qcom: camss: Rename camss-csid-780.c to
 camss-csid-gen3.c
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-2-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_064449_969308_2E500DCF 
X-CRM114-Status: GOOD (  21.13  )
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

On 03/07/2025 18:19, Vikram Sharma wrote:
> Rename the file camss-csid-780.c to camss-csid-gen3.c to enable
> reuse of CSID logic across multiple SoCs.
> 
> The SA8775P SoC includes CSID 690, which is functionally very
> similar to CSID 780, with only minor differences in register
> bitfields. This rename prepares the codebase for supporting
> additional SoCs without duplicating CSID logic.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile             |  2 +-
>   .../qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} |  8 +++++---
>   .../qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} |  9 +++++----
>   drivers/media/platform/qcom/camss/camss-csid.h         |  2 +-
>   drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
>   5 files changed, 17 insertions(+), 14 deletions(-)
>   rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (98%)
>   rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index d26a9c24a430..ee869e69521a 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -8,7 +8,7 @@ qcom-camss-objs += \
>   		camss-csid-4-7.o \
>   		camss-csid-680.o \
>   		camss-csid-gen2.o \
> -		camss-csid-780.o \
> +		camss-csid-gen3.o \
>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
>   		camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> similarity index 98%
> rename from drivers/media/platform/qcom/camss/camss-csid-780.c
> rename to drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 4c720d177731..0941152ec301 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -4,6 +4,8 @@
>    *
>    * Copyright (c) 2024 Qualcomm Technologies, Inc.
>    */
> +
> +

Dead newlines.

>   #include <linux/completion.h>
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
> @@ -13,7 +15,7 @@
>   
>   #include "camss.h"
>   #include "camss-csid.h"
> -#include "camss-csid-780.h"
> +#include "camss-csid-gen3.h"
>   
>   #define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
>   #define		OUTPUT_IFE_EN			0x100
> @@ -259,7 +261,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   
>   			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
>   				/*
> -				 * For Titan 780, bus done and RUP IRQ have been moved to
> +				 * For Titan Gen3, bus done and RUP IRQ have been moved to
>   				 * CSID from VFE. Once CSID received bus done, need notify
>   				 * VFE of this event. Trigger VFE to handle bus done process.
>   				 */
> @@ -325,7 +327,7 @@ static void csid_subdev_init(struct csid_device *csid)
>   	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
>   }
>   
> -const struct csid_hw_ops csid_ops_780 = {
> +const struct csid_hw_ops csid_ops_gen3 = {
>   	.configure_stream = csid_configure_stream,
>   	.configure_testgen_pattern = csid_configure_testgen_pattern,
>   	.hw_version = csid_hw_version,
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.h b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
> similarity index 84%
> rename from drivers/media/platform/qcom/camss/camss-csid-780.h
> rename to drivers/media/platform/qcom/camss/camss-csid-gen3.h
> index a990c66a60ff..e6298042ae74 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-780.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
> @@ -1,13 +1,13 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * camss-csid-780.h
> + * camss-csid-gen3.h
>    *
>    * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
>    *
>    * Copyright (c) 2024 Qualcomm Technologies, Inc.
>    */
> -#ifndef __QC_MSM_CAMSS_CSID_780_H__
> -#define __QC_MSM_CAMSS_CSID_780_H__
> +#ifndef __QC_MSM_CAMSS_CSID_GEN3_H__
> +#define __QC_MSM_CAMSS_CSID_GEN3_H__
>   
>   #define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
>   #define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> @@ -18,8 +18,9 @@
>   #define DECODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
>   #define DECODE_FORMAT_PAYLOAD_ONLY		0xf
>   
> +
another dead newline

>   #define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
>   #define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
>   #define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
>   
> -#endif /* __QC_MSM_CAMSS_CSID_780_H__ */
> +#endif /* __QC_MSM_CAMSS_CSID_GEN3_H__ */
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 9dc826d8c8f6..62273ca9f199 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -215,7 +215,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
>   extern const struct csid_hw_ops csid_ops_680;
>   extern const struct csid_hw_ops csid_ops_gen2;
> -extern const struct csid_hw_ops csid_ops_780;
> +extern const struct csid_hw_ops csid_ops_gen3;
>   
>   /*
>    * csid_is_lite - Check if CSID is CSID lite.
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 06f42875702f..1431e08dc04a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2285,7 +2285,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = false,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -2300,7 +2300,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = false,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -2315,7 +2315,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = false,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -2330,7 +2330,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -2345,7 +2345,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	}

I can fix those newlines, no need for a v4.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

