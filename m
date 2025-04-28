Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6CFC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rKI293OkNtSCRW2GiaUvxvB6LASuRfbVCog4wPqflw=; b=3GfwNa4FV0m4hdyuGDnFBROt4J
	qhRLE+YjtNeIcw1zi94128KQrIGRT0OwcuCkv8CCiP36Axx0J3VSKd81cgGrKOjKGjoxtXP0ZwTxS
	nSmv/RGp4udNI3NHZCdnmXNQumUOLqPrFN266x30YQOs3fkSfvZLNy+LXG+uSe3GEYLWPYcuRh177
	+VdjfP8v/D0JqHZi9Zc9llmT0fqtNjED+FPGrnn7Rc0ozs1GfIE30FqX7kExS1HNTblrfXRvEwkCU
	gcI4nrTOV2Owc0JhoXpBiiFGEdEnXIhL8JfUgWUicZxNQPfLfUulFvJaxrq/e2rEkYeUsi1KTqjhb
	TipafOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OnA-00000006Wdx-1iF7;
	Mon, 28 Apr 2025 13:45:04 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ODQ-00000006Nxy-3mZi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 13:08:16 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5498cd09cbfso394901e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745845686; x=1746450486; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rKI293OkNtSCRW2GiaUvxvB6LASuRfbVCog4wPqflw=;
        b=iDXbngbaFyuSa44wPSutWN1q4fQPyCdJjimRaal9nj2rd1Af8gr1w43UMLeryyCyyE
         vWJAiX0HRdvTXWvT14azwRDkrXp6V8mGkUxsQlmXFyQuqQfxm8/Tkv7MtYBj2yPKFRir
         tUk2oi7H/ko/SyAo5Qyp0i1NaL9C8R49IewGBPrmnPbry6gtVwnRhquR6/FD9vgl84hx
         58o7KCjn8EcA4kYSrD1ly6IFyvjsI+UXXmiiVMM+c45jEr3xKpWwOw09QNmocy2Th221
         YI1JjmyYuDagHec5n58ha2xfkMhLwB7aoSYKoSCu1yowpLr2Kkdb2rGNstEuzmChRlZd
         cAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745845686; x=1746450486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rKI293OkNtSCRW2GiaUvxvB6LASuRfbVCog4wPqflw=;
        b=Qv4HPigZ0DUdutWw0cix0o9dSxuvdXHiPCJvPBwChN4r8zKqi2ZyZYW3en3sfxOBRD
         wNpDnCLDTiT01jxQqoswE2ercTznJKcPV5xSEimwbPQpwzvWCHfL0h6O/dG3UiwZKsxd
         KJEj7e2XLV8yGiN7t/OIPZjRg+CLEwEApnL7CqYPKBvqES8i2MoFOAX0sPXwmT2e+5am
         VOC+esnHLTRYOF3w8njY9n2V0ZTKVI5iieFe2x41DXjQ2YGeTvGPFn550v0M6tN1G0AS
         pBAbzAScyLL9jAQj5bMYGkTdyc3Kg9WvbDGnTyIlbYI+JyIl6up5Zx6ITlBWoIMpqeI9
         xqpw==
X-Forwarded-Encrypted: i=1; AJvYcCXWAEfzm5Jq/nDAwEyAV5wkDIkcivOej+bfJSyumwifOirK0kZmF0LGyqXg3XFdtIHkqXUrYrErr4ppjrflBS22@lists.infradead.org
X-Gm-Message-State: AOJu0YxjYENRoyT/tbFstF+Ip3M8VvzsVkALmxFF/3vN5ST/sDMxMo/M
	fXp7x68O2wvtzfWqW+pcmIzBYb/RbpdkK8vw1b10MK3GVzxNiwKOoDQ55dbfFQk=
X-Gm-Gg: ASbGncsA+q+mgpneqGnd5YJR1uEWwQsTrajVu8lnzAqtpdukKLqLjmy6MAbXYRKLLy8
	fZFKPntPSiuS3CDJvL887o9jqMUlNefbkz38HXOXlmBdzRolL7CLHsqoIQNVxSYopeRR9OpgKhw
	yWFam4rvydEPpeLWRkVRApeWr222VyEnvbUECFrVROvOSCs/L89XxUs0MpEpOeww+2UHK4za6Lu
	x5kG2A959MY/wZ5/51UFfftr/N5v7u0BYjW+sLr1yhEeWIb/VK0BJnsybezDdkps+gpU7zL5mbx
	vWdqaph3aXIokvt4t1qmq7wpacNwl4IWeT4eSuS9LeRrdYGP0hsRw+ow4pQ3VHeWmMN4cpzus+K
	1elOeHHekTqMuLUw+YWg=
X-Google-Smtp-Source: AGHT+IHigrHmgJYNc7nLQZKoFasjeKXtn3RhBxEwzQXSKbVJgPgq1Au5kKKLuo2iHhmAFvJw3wh3Ig==
X-Received: by 2002:a05:6512:6c4:b0:549:8932:a1be with SMTP id 2adb3069b0e04-54e8cc111edmr1038151e87.13.1745845685451;
        Mon, 28 Apr 2025 06:08:05 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb39f1esm1632907e87.58.2025.04.28.06.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:08:05 -0700 (PDT)
Message-ID: <b80d500b-6203-4d83-8396-3ba579abd980@linaro.org>
Date: Mon, 28 Apr 2025 16:08:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Content-Language: ru-RU
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <20250424-qcs615-mm-v7-clock-controllers-v8-2-bacad5b3659a@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-2-bacad5b3659a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_060809_037976_76C0F3EC 
X-CRM114-Status: GOOD (  16.41  )
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

On 4/24/25 12:32, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   .../bindings/clock/qcom,qcs615-camcc.yaml          |  43 ++++++++
>   include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>   2 files changed, 153 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2b811e66d406c16c70004bb3a9fce294422a5914
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,qcs615-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller on QCS615
> +
> +maintainers:
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm camera clock control module provides the clocks, resets and power
> +  domains on QCS615.
> +
> +  See also: include/dt-bindings/clock/qcom,qcs615-camcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-camcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@ad00000 {
> +      compatible = "qcom,qcs615-camcc";
> +      reg = <0xad00000 0x10000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>;
> +
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...

Is there anything what prevents to add this clock controller dt bindings
description into qcom,sm6350-camcc.yaml ?

Apart of compatible values I barely see any difference between two of them.

--
Best wishes,
Vladimir

