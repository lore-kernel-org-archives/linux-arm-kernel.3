Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF362CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Qe3xfGFmIVMF6CqhJOdRE5h4PSOi9dIsttGyzx+Zh0=; b=xx8vwq6bA4wzdfVQ7E1RD2OVEE
	/A/I4G86JRqHZfNfccTlIU852Q1CqnFR7RUmZqdHoCk7TvCC06SMwgP4W2Fvz+FY04Kojx2YDS+wB
	mpMpv1kHpan/ly2lsJyyQMC+P4CkeG+dINPal1Cni2FaCBMsvni5D4YS0OKwRlc1zUOmpnCt1s0Tn
	JNJebZ0r/IaDE/oI669vCxWBFYOakosjWju7Y8E2V+L0aLB8/5SNeGQFIXp/d2jjaphQ4WX85ZCv8
	wCG4+SZwFaaXldP3yJw+b1tQ4i0F24v0or9oZ7ep8Z9sQ4D8hde1+YZkJN1knu5L+Pka+RC24jkii
	vq35Hryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hrp-00000007O46-3Lj0;
	Thu, 25 Sep 2025 09:02:21 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hrn-00000007O29-37wV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:02:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3fa528f127fso513938f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758790938; x=1759395738; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Qe3xfGFmIVMF6CqhJOdRE5h4PSOi9dIsttGyzx+Zh0=;
        b=teXmnmGarC5phhm8mJXsWfAY2c+o1v2CdEBvmTszMmVGgEQeekTusSJ/g+XkpGxjXn
         DW/rQd4iuuyD7ql9B2nIGd2Hmx41HgPeqGCfTbzW0AuHN8X2UZkYprf0AOD5sKxlFxEc
         ZWbGrjXfK5yD+dWbIlM3/6+Fq8qESBszvsMWW5xXcPbg3zfSILxuMHa/T/cQ25M2djqw
         rB2I8AHZvzQVfytqiM8WhNpPJJY9511yi091InTHiVfBc8m2VjSou/EJKBgAjKLY+mCj
         PzvzVAbdt9wqFnjYxHekxx6HcYX20fdOa3MEPdkc6h1w0NeyqoxND0Bfom9IFUBrn+BY
         iYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790938; x=1759395738;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qe3xfGFmIVMF6CqhJOdRE5h4PSOi9dIsttGyzx+Zh0=;
        b=TNWadi7CYINECuzc8LtewQKO8gS3qui58jT5034Ig8Mg8IXmjV0yFo3+7IjfeBi8qc
         i7OXoYay0BPQqrOQdP0GlnaT/+t09V+tneBl2HGsJIlHnguGowwSatFStEm9EeUeDSW+
         cVZzfPBknj6UyRCBQk8MAq/6ea3I+mj0q8U3JF/PnasT/VKiecIILIVopdWlwT34RKqp
         iiSTS4XCUlSYJ/i+JgnoHJK/D3TvBxaByp4oXwuRyPhUbGPPkGnlBvM3r/1/+6LrqLL/
         IIZJsExWhMDrs0OkaWAKS3YtwVjttezKKEv+i/IS03hENO2Kv7VATl2RR9RPlMdCKpAt
         VpPg==
X-Forwarded-Encrypted: i=1; AJvYcCX3BlDAsbTMiObU4kKTnRoh9GzkvIYDfYyk+BSpszD7aEgLDgXgnfkxeNE2Yjq4QRmGgaVqntq1D3hK/dlpufCz@lists.infradead.org
X-Gm-Message-State: AOJu0YxRwk26HCxhXGsMiSEJ/i+GmZpMu81IBgJkOy0xytvEwl7CH3Eg
	TpWHtTwIuPJNz/HvYboTJz74RAQttnGBDDaHSQnXV9reI5DLkdFuICZE3E4FGiZSIQs=
X-Gm-Gg: ASbGnct0m3EHEJvF/5XHHXjrfYSDkG/+jaDPLdI3Lu+UQNc8eVmutkoQTEkb8CCcoUk
	HTm5rd/Tbymr7uK/VDxFqqxIN4jaOFz86TjqO30OAtIa46JM2sy5xL93w//SOqntm0rxhMAc+sw
	a1cnseGiNWiXZMlCNJ9d18stlH1ryzzH7EXSWUQgzv0iKGonrO3QVrgTAp60SuySqiOGZ7WKJCC
	tzL8CZizQ4X7RxEwN7CQ2y5syHWn61CxIYxMbA7d76XeUP8fSrL6TO7osF6wzXWiPX7+L8nuAz1
	1klbuEPheYCrZorAl88RY1oz09v+SfMLaoVa5X8P8hac6CQ9IVn0lr1gHCocfLYdiQXCq7KUyUG
	+82mLTVX5FaWoOed0GdtxcEWqo72cono3wg4WKrYDa+EwxdvgLlD56PJx/UIQIo+hqDCj4opCzT
	yWGEv08IJiTsL/WcmuCsbi
X-Google-Smtp-Source: AGHT+IG6omy3mi4l5IjwhwiD+yQndxiCA+tBSpwYG7hEz4IaSuBeLRkN2eEbLT+qy6PzJRqtHh6D9g==
X-Received: by 2002:a05:6000:2dc1:b0:3d0:e221:892e with SMTP id ffacd0b85a97d-40f6617670dmr1826060f8f.27.1758790937794;
        Thu, 25 Sep 2025 02:02:17 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm2143861f8f.24.2025.09.25.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:02:17 -0700 (PDT)
Message-ID: <69e8c15d-108e-4832-849e-a23c7ddfe625@linaro.org>
Date: Thu, 25 Sep 2025 10:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: clock: qcom: Add Kaanapali video clock
 controller
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-4-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-4-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_020219_812908_6A2D4BE1 
X-CRM114-Status: GOOD (  15.25  )
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

On 25/09/2025 00:56, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add device tree bindings for the video clock controller on Qualcomm
> Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>   include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index b31bd8335529..e6beebd6a36e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -15,6 +15,7 @@ description: |
>     domains on SM8450.
>   
>     See also:
> +    include/dt-bindings/clock/qcom,kaanapali-videocc.h
>       include/dt-bindings/clock/qcom,sm8450-videocc.h
>       include/dt-bindings/clock/qcom,sm8650-videocc.h
>       include/dt-bindings/clock/qcom,sm8750-videocc.h
> @@ -22,6 +23,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-videocc
>         - qcom,sm8450-videocc
>         - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
> @@ -61,6 +63,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-videocc
>                 - qcom,sm8450-videocc
>                 - qcom,sm8550-videocc
>                 - qcom,sm8750-videocc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-videocc.h b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
> new file mode 100644
> index 000000000000..cc0d41b895c9
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
> +
> +/* VIDEO_CC clocks */
> +#define VIDEO_CC_AHB_CLK					0
> +#define VIDEO_CC_AHB_CLK_SRC					1
> +#define VIDEO_CC_MVS0_CLK					2
> +#define VIDEO_CC_MVS0_CLK_SRC					3
> +#define VIDEO_CC_MVS0_FREERUN_CLK				4
> +#define VIDEO_CC_MVS0_SHIFT_CLK					5
> +#define VIDEO_CC_MVS0_VPP0_CLK					6
> +#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
> +#define VIDEO_CC_MVS0_VPP1_CLK					8
> +#define VIDEO_CC_MVS0_VPP1_FREERUN_CLK				9
> +#define VIDEO_CC_MVS0A_CLK					10
> +#define VIDEO_CC_MVS0A_CLK_SRC					11
> +#define VIDEO_CC_MVS0A_FREERUN_CLK				12
> +#define VIDEO_CC_MVS0B_CLK					13
> +#define VIDEO_CC_MVS0B_CLK_SRC					14
> +#define VIDEO_CC_MVS0B_FREERUN_CLK				15
> +#define VIDEO_CC_MVS0C_CLK					16
> +#define VIDEO_CC_MVS0C_CLK_SRC					17
> +#define VIDEO_CC_MVS0C_FREERUN_CLK				18
> +#define VIDEO_CC_MVS0C_SHIFT_CLK				19
> +#define VIDEO_CC_PLL0						20
> +#define VIDEO_CC_PLL1						21
> +#define VIDEO_CC_PLL2						22
> +#define VIDEO_CC_PLL3						23
> +#define VIDEO_CC_SLEEP_CLK					24
> +#define VIDEO_CC_TS_XO_CLK					25
> +#define VIDEO_CC_XO_CLK						26
> +#define VIDEO_CC_XO_CLK_SRC					27
> +
> +/* VIDEO_CC power domains */
> +#define VIDEO_CC_MVS0A_GDSC					0
> +#define VIDEO_CC_MVS0_GDSC					1
> +#define VIDEO_CC_MVS0_VPP1_GDSC					2
> +#define VIDEO_CC_MVS0_VPP0_GDSC					3
> +#define VIDEO_CC_MVS0C_GDSC					4
> +
> +/* VIDEO_CC resets */
> +#define VIDEO_CC_INTERFACE_BCR					0
> +#define VIDEO_CC_MVS0_BCR					1
> +#define VIDEO_CC_MVS0_VPP0_BCR					2
> +#define VIDEO_CC_MVS0_VPP1_BCR					3
> +#define VIDEO_CC_MVS0A_BCR					4
> +#define VIDEO_CC_MVS0C_CLK_ARES					5
> +#define VIDEO_CC_MVS0C_BCR					6
> +#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				7
> +#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				8
> +#define VIDEO_CC_XO_CLK_ARES					9
> +
> +#endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

