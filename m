Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3592D5CCBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmKGehAtF2aC6hECS065yudbuhoIUUvkuW0P86X+zRI=; b=aiN85g6eRWjA7KcriM7vgrXClb
	NcNy6u3RAnGYlYlC3XxQGe9oujx7P8RJx/HYNIZjc4RmCMbP1wAJusxRoy4iy+56onpPV2DVObQqp
	HdlnxS9wCO2Ws3MrC0ZEv3o94vnFlKFOoGrrjc54H9JSJUsyox+PoALgFx98w950e9Ntq5WBODRB9
	ejdEPejKWTiXYL0itTqXmF0W36gX3fOsc9ntAfxU4bsddMDhhr+B5xvPfgKhtn9TcfrnF9J8dhGoo
	0/IIeqSvctZSR4iNfxufNua3xKfhY75C7UbLYlFFCbXVJDsE5RFC8YVEJFplf4Ou28TJa5aOqtiP+
	3yHSHN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSav-000000053oD-0rPp;
	Tue, 16 Dec 2025 10:47:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSat-000000053ns-1eVY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 10:47:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59426dc96f2so391084e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 02:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765882069; x=1766486869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmKGehAtF2aC6hECS065yudbuhoIUUvkuW0P86X+zRI=;
        b=IXYuASazf7lhop8sZH6eTdROTx/hrN0HRvyeJKdO7V9cau7Hgwg6zORj7z67SFZFmJ
         54Lz3n2ZKl+psr25y45YOH9zd7SgU89sikXLtPs+m24XAEnz0YHtgm206GucLBxaFF9/
         IMENUIUoYWjQksQWxHpJOqBGVGgDLOeQyDKdQwNesbJLGigjb4FtXwV3m0pxvyt071VB
         0YIBVGcSvi8Fi3JCT/G2JCBFAh1qqZL6gZRNWkTPt9tbEwZ43V90MBp+rO/qjWo+MH1N
         3+u6JHwF6d8ACKAgwA6m/NxALk/mNmlEb0/ZoC+3JOxsDCw5o2ofFSUiGfVryJ/F+CP1
         UjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765882069; x=1766486869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmKGehAtF2aC6hECS065yudbuhoIUUvkuW0P86X+zRI=;
        b=QD7usUFfReXWDQiLelOWU1/XkQkDbXcziWhDwvmiGVhvM4tq9shbwYvtzj+bxVBmG1
         qZSP3NQNogrCHcRcF3q3ibgnBL6XTp4/8i3D3oYrklgRs/qnMgwJMnvy/9z7O1FgfUbn
         m+G8a8KlreB7ogv1Ruut4vPNY4IoWOGnN3i4znLtE/iaAP78ThBYkmpqalEj9ibVVAe0
         CGern72AnJWZSdz4IS3+9NFPpXtde1TFPtX0FTROBPNSQ3bO02T1FNXFsIIB8lX5miyz
         o8atbl7cG1/ECB5GwUm6vpvzx/xInbhNdWWqFh0AZweT/PYxo04IKLBkWxg0EzrguZpO
         xJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCXiskH38PFSb1KwWddLAeDWt9X+Tyyut5MVBtn3LnPgCade4hQV5f5JnEMOU/hpDv6kz0Kex+O66w1WZCpLCQOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwIq+LGx4v3JZXZxxAf4nmQggyDTDDeKVmkFlmi5JuOHMWYosfV
	VCPfw7G+/NQTezxV85Dv6JimwKGYOq02b6sIcZ0jrR/c5KGbDcfue9a7RrctkCS8aJE=
X-Gm-Gg: AY/fxX4FTg+A4Cb7d49FyDzmjJEk+JTH+elzpyY1PeoBRQAcbauPn1tIy4x+b3bWI8u
	6KeQebTDt7b3ByLbkmaNxd2Qc5UBbB5xF0mzzeasSW3IkQQl9Y/tb8eZ/THsUB7KAOQo29CeHQX
	3yYDSXWU9WdxAbNVjUd3ww+W8O31lMn1tERlu4dpYH2wjgNQYCyzdw0Kx3siVwS6DyHAT8ebmP2
	9cd2wdP7Tzi+m81f2H5BWDe5BpznLof45CmRe3x3ktBu6PJMPxkdpB3jXyBjWvYLxTfmEldI4EH
	OKtTrfeyZpsWPcvn14Hcsh22h+id2YVs+FWGyxmsINmADfxnlAD6sT2gqFwtDMccSrqQCExIQDl
	6KUVZlL/G4hTtZzS9UvC+qty8mmH6VBAgIsLNUL/REQM+8ii/QhqIw2x8nWC949hrz0aZG1euwx
	6V4X7C01/dRGaHS14rGHYfJP9lrtWnyVJmGHXQR25asPx4knjIyNJCP5MtWScQ71Eb/A==
X-Google-Smtp-Source: AGHT+IF0H41NSoDHeiVoQB8t5PFRmbwgMPCmvxitVkRlghvklguwBlJGvPt9E5BeekSJvgfAgDKMYA==
X-Received: by 2002:a05:6512:3c8b:b0:594:2f72:2f78 with SMTP id 2adb3069b0e04-598faab5a2emr2935465e87.8.1765882069039;
        Tue, 16 Dec 2025 02:47:49 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da119c1sm806260e87.18.2025.12.16.02.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 02:47:47 -0800 (PST)
Message-ID: <3658e6cc-755c-4b38-aec7-b8bfdd7c8bd2@linaro.org>
Date: Tue, 16 Dec 2025 12:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] dt-bindings: clock: qcom: Add support for CAMCC
 for Kaanapali
Content-Language: ru-RU
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_024751_495792_51905D4F 
X-CRM114-Status: GOOD (  19.18  )
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

Hi Taniya.

On 11/25/25 19:45, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Kaanapali
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +
>   .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
>   include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
>   3 files changed, 186 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..3ec9bf4d82ad3b0fbb3e58fe312a416b3580c30c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -15,6 +15,8 @@ description: |
>     domains on SM8450.
>   
>     See also:
> +    include/dt-bindings/clock/qcom,kaanapali-camcc.h
> +    include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -22,6 +24,8 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-cambistmclkcc
> +      - qcom,kaanapali-camcc

I do have right the same review comment as the given for SM8750 CAMCC one.

The introduced qcom,kaanapali-cambistmclkcc does not inherit reset
controller or power domain controller properties, thus it should not be
added to the list of regular camera clock contollers.

Please create a new dt schema file for qcom,kaanapali-cambistmclkcc
and qcom,sm8750-cambistmclkcc IP descriptions.

>         - qcom,sm8450-camcc
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
> @@ -63,6 +67,8 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-cambistmclkcc
> +              - qcom,kaanapali-camcc
>                 - qcom,sc8280xp-camcc
>                 - qcom,sm8450-camcc
>                 - qcom,sm8550-camcc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ddb083b5289ecc5ddbf9ce0b8afa5e2b3bd7ccad
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
> +
> +/* CAM_BIST_MCLK_CC clocks */
> +#define CAM_BIST_MCLK_CC_DEBUG_CLK				0
> +#define CAM_BIST_MCLK_CC_DEBUG_DIV_CLK_SRC			1
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK				2
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				3
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK				4
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				5
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK				6
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				7
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK				8
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				9
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK				10
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				11
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK				12
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				13
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK				14
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				15
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK				16
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				17
> +#define CAM_BIST_MCLK_CC_PLL0					18
> +#define CAM_BIST_MCLK_CC_PLL_TEST_CLK				19
> +#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC			20
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK				21
> +
> +#endif

-- 
Best wishes,
Vladimir

