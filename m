Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021C9CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52cJq27fTrRB0shrC+OriI/jG8WLskY0nr0nR3oM2xU=; b=cwKu4I8hnUAwQ7bJf8mefma8q4
	AW0VSU6c6cRIQKyw59Xqm99f5z5zygMmdz4uQS768G/W/hgjJU9f7laxZoAvUjFwCWnhtZy35oD+H
	rycnPaexM5SZQtURxpvDx8v8ni8MyZr72BWbpDq7DxN99udnvLumFc8q8RECV4SGyFuoQafUfGkX9
	GNfk8yqikn0q1zoqOFhq+SR+4bt3Tk2oI4Z/1Wl4GeCYrmSmG9mft8+ctSrHFjcbto3271IeZ9/Gt
	IfARImyKpgzR45VVDPCrztDDkExs7CdUqMjwS468m+lE4YJE2ceCRnf7dlxkZcKrXiOw89qRdC7Jk
	9gRv7vGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1huG-00000007PQ5-0gJY;
	Thu, 25 Sep 2025 09:04:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1huE-00000007POK-09MV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:04:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46b7580f09eso4299235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758791088; x=1759395888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52cJq27fTrRB0shrC+OriI/jG8WLskY0nr0nR3oM2xU=;
        b=uRtT8oIQSONapt+cnRoDk8q1hVqd8XgT0et5Iy06nEqGAOodfq/ZtI9sWWjW+JtzbS
         IeqqIERleKg2d5otY2z2XLKp91waUNu86j7Irzi0I9yncEfrZhBqAIZ+znViGfA3UDuB
         MwPkhfbzyqqSqATCSSjsMiLRWyCHxAo43Uif5OTI82P+wUTz/fs2AsSRxK/Qbcr0bnbM
         yx5NafEOTZIUvDFPkBIg6NcAKmCDpD4DG+Np2ImrDBvjZWUxe3n8DAQJ8gV2O190utBK
         aA5MoOPh6XNgQfON5hqtt1KtXXT53BhYnIuQ5C6fPuoCw+KmH4xjpNv6kSfPOEDr/W50
         sIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791088; x=1759395888;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52cJq27fTrRB0shrC+OriI/jG8WLskY0nr0nR3oM2xU=;
        b=sUK5xv0t/gq7+06O5yKEbO7/tgGJUJwKmNQtABHJnDvmzpmqDG5TtcJ0CM8iPiTG8+
         xFpn5RhZh727kTyExe803BMyGcPyV5i23p62cK+AN0YpDQ4usY42e429QLnEOx+zT1gr
         RdLi2lVyVOiq7FEW+zfFWLpp+3ccTylnkOI8zCVnKelB9OD7WG1rYfKx/Di5qDV9/CeM
         fr7IYXYiat2BUzxkAMidRD0ThzFAsR85ZoQq8MN6xCiCFeZZsnkz5yvZoAobRKmWCrZO
         m44nRMd9H3KcqUmxSiskrNafUyoaopNXCvxBNBTign+ZGtL6awC1LlzvOKY7Uzqzog81
         BRHw==
X-Forwarded-Encrypted: i=1; AJvYcCU8WxCR4qVo7HJBgzUNaYWjAIj4Bma9GcQI8ErdiO0zmc99xb/1rcrnmSuryMq1JKI8IqCnC3lTpb2ixkZFQfE2@lists.infradead.org
X-Gm-Message-State: AOJu0YwmCObdjBk3TFoNYN4gElWmCaEABm2zoODIVJxesbmYfVwQ3krp
	G65HBq+T3X/E6HKfXViq57cVzVs3BEhJmMuIE5DkLH6KXYtk3e5xUTMAsOVjkU/oYyQ=
X-Gm-Gg: ASbGnctW1X8ywqcEWuBBXeFtwvXfkGN312xc5jULZyP/B0ENYeX/ZtF0fFu4LqtAsOU
	H9eX4Z7KfiuYlZp2vPnrHwvkCUR0bU/Lmy4ADaU/11qYMqeR7pe/k+s5RJqDl5/d1+yY5IH+HVh
	TBYqUEktvlbVUxYXMDIeSr18bS8tPZkN61gXpUC9gjWhu6TdV9yXIVV3Wy/RwVPs+YUpJ8yyrZt
	i0hCb6aZhxRU+bkwE1bRNsvjG7Fc7Yhh18bVLkSxIbbMA1QnuwWcmo054VvVrUvB3jtZVEaVmf+
	sHTaRS0zwSlQWiwkM6rFNvyZox7zk5SqoDF2pm1eYlzvlmys1kLAqI6C6TcI1klDzDmseuyOJRB
	2FSA+Wgy/4wfsM79iiUyS3qz/aa+0rSUxgHmDGZi1ynNJZjT2DuEOCY+ET0hBzb8cd42ipU+wq2
	gA6iynF9x618p6/ux4Y2qR
X-Google-Smtp-Source: AGHT+IErNyAgA6Qo/uMNdIgcGBbOskM97JAo4kEppskCvZUmBIRp8NL7i5asdGJupVwWIHvszpenhQ==
X-Received: by 2002:a05:600c:a43:b0:45b:7b54:881 with SMTP id 5b1f17b1804b1-46e329a0e5dmr26627875e9.1.1758791088108;
        Thu, 25 Sep 2025 02:04:48 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm80767955e9.7.2025.09.25.02.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:04:47 -0700 (PDT)
Message-ID: <19c66c0e-e784-4403-abae-c4cd92f4a150@linaro.org>
Date: Thu, 25 Sep 2025 10:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] dt-bindings: clock: qcom: document the Kaanapali GPU
 Clock Controller
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
 <20250924-knp-mmclk-v1-5-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-5-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_020450_124984_5528B0DC 
X-CRM114-Status: GOOD (  20.19  )
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
> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
> power domain Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>   .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>   include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>   .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
>   4 files changed, 124 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> new file mode 100644
> index 000000000000..31398aec839d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics power domain Controller on Kaanapali
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm graphics power domain control module provides the power
> +  domains on Qualcomm SoCs. This module exposes the GDSC power domain
> +  which helps the recovery of Graphics subsystem.
> +
> +  See also::
> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kaanapali-gxclkctl
> +
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GMXC power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@3d68024 {
> +            compatible = "qcom,kaanapali-gxclkctl";
> +            reg = <0 0x3d68024 0x0 0x8>;
> +            power-domains = <&rpmhpd RPMHPD_GFX>,
> +                            <&rpmhpd RPMHPD_GMXC>,
> +                            <&gpucc 0>;
> +            #power-domain-cells = <1>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index 44380f6f8136..6feaa32569f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -14,6 +14,7 @@ description: |
>     domains on Qualcomm SoCs.
>   
>     See also::
> +    include/dt-bindings/clock/qcom,kaanapali-gpucc.h
>       include/dt-bindings/clock/qcom,milos-gpucc.h
>       include/dt-bindings/clock/qcom,sar2130p-gpucc.h
>       include/dt-bindings/clock/qcom,sm4450-gpucc.h
> @@ -26,6 +27,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-gpucc
>         - qcom,milos-gpucc
>         - qcom,sar2130p-gpucc
>         - qcom,sm4450-gpucc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-gpucc.h b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
> new file mode 100644
> index 000000000000..e8dc2009c71b
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
> +
> +/* GPU_CC clocks */
> +#define GPU_CC_AHB_CLK						0
> +#define GPU_CC_CB_CLK						1
> +#define GPU_CC_CX_ACCU_SHIFT_CLK				2
> +#define GPU_CC_CX_GMU_CLK					3
> +#define GPU_CC_CXO_AON_CLK					4
> +#define GPU_CC_CXO_CLK						5
> +#define GPU_CC_DEMET_CLK					6
> +#define GPU_CC_DPM_CLK						7
> +#define GPU_CC_FF_CLK_SRC					8
> +#define GPU_CC_FREQ_MEASURE_CLK					9
> +#define GPU_CC_GMU_CLK_SRC					10
> +#define GPU_CC_GPU_SMMU_VOTE_CLK				11
> +#define GPU_CC_GX_ACCU_SHIFT_CLK				12
> +#define GPU_CC_GX_GMU_CLK					13
> +#define GPU_CC_HUB_AON_CLK					14
> +#define GPU_CC_HUB_CLK_SRC					15
> +#define GPU_CC_HUB_CX_INT_CLK					16
> +#define GPU_CC_HUB_DIV_CLK_SRC					17
> +#define GPU_CC_MEMNOC_GFX_CLK					18
> +#define GPU_CC_PLL0						19
> +#define GPU_CC_PLL0_OUT_EVEN					20
> +#define GPU_CC_RSCC_HUB_AON_CLK					21
> +#define GPU_CC_RSCC_XO_AON_CLK					22
> +#define GPU_CC_SLEEP_CLK					23
> +
> +/* GPU_CC power domains */
> +#define GPU_CC_CX_GDSC						0
> +
> +/* GPU_CC resets */
> +#define GPU_CC_CB_BCR						0
> +#define GPU_CC_CX_BCR						1
> +#define GPU_CC_FAST_HUB_BCR					2
> +#define GPU_CC_FF_BCR						3
> +#define GPU_CC_GMU_BCR						4
> +#define GPU_CC_GX_BCR						5
> +#define GPU_CC_XO_BCR						6
> +
> +#endif
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> new file mode 100644
> index 000000000000..460e21881c4f
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
> +
> +/* GX_CLKCTL power domains */
> +#define GX_CLKCTL_GX_GDSC				0
> +
> +#endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

