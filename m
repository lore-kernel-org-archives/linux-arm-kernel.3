Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B5BC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 13:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aaAoqv5+ouHYGZZLFjrXRilOOwM4Jup3fbChPgYdkk=; b=zYkcklYcZK2Tik28WyFAtBlzRx
	S9eEN1PTlzibecFl76kPK7PjHeqVObaOsvC4BeGa/iq1kOGzRfawpHhkqGTJDybMJyFTXn4pPRMkL
	n5PJxb9C9m+OjpMJxnAvwjWbUgSCIj/FQUAJVAd95WKZL2kkpd6DpM2HQ02n9EbEhyFg2KTeIM30q
	lsXVTRp3F8BxGQl62dhS7M5zB/oZCy/r6gxHFdbW3DDaSNTB46dj4ADFPdcxgMJXgwXM9PVPywkY9
	OKBHUM3C9rbhp33FuYvmZ5iv7Xys9fLJyLLqbmc6B+813I84un0dNo7qAbWo10F6bnnycSCk+342+
	tJdC1uSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOJb-0000000Ea3t-2aXO;
	Mon, 28 Jul 2025 13:54:55 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOC3-0000000EYiu-3isN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 13:47:09 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b78b2c6ecfso475235f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710426; x=1754315226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aaAoqv5+ouHYGZZLFjrXRilOOwM4Jup3fbChPgYdkk=;
        b=Ak0WJSuclFLu3tAOlRMYyt/Cd6pMpY53QKpAA8RmnvymofJXGcvN7P40YCn8DyW/vj
         xIyC6ZfqFAw/sw5o9F4+Rjcp2myDln5YCdfWrjj/uRzb1DbEZ4NH+4X28JUlpZuwLa77
         q0WAS5kUOYyISBWSRRsbf4GT7S5y2yoeV/tsrEIuuCRMC6F1gQr+k0v+jKUXzfLKjh31
         J7Z3mif/9Tm7OdfinWUH2K/303aELOXLLUkLKVwjRR4Tzd0Ezn16Rt4AjnR296+g5cTz
         JFNudbqk8HUY+kEPdNL6JVOMxvZJBg5uavCIyae4ngqpmV2EgmNESwReBrzk2QcW+Y8Z
         3mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710426; x=1754315226;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4aaAoqv5+ouHYGZZLFjrXRilOOwM4Jup3fbChPgYdkk=;
        b=pHgLwuvwDswfn+/qwupZVIMp97+m990/jUb3/jt7pxs6uBSNc4KJTM+tYe/Nen1T5I
         H2WvN61LKgbPd1rt7r52///gC9BObkjxUx/Nq0eY2qDsR71LgJK56VFW+IYnTNHYyehW
         T05BqHsDYlRcO658QhH0g1Y42M0KmytHyh7xnINpAnJbW4vr2XAHxwr6OKQIpGxgVE+x
         7+djtAjNswgtw9xctNJULCgEOpZytEDV7r0fX5dQ843oIKhaOtTMhqUT0KNBbwqbfO26
         NONsMnIPk6yOR8En2JJ5FNtugzsGzeWNx1Hha07GcbJvHxEkS9Afjm8k0EUuAde20Ezg
         4/jw==
X-Gm-Message-State: AOJu0YxjCuY79K94Xa6grWlRqhsSD6FZs6OtL/Ht7h8Xr0T9GTAlWTJi
	YMj61/BXTiKbvAkFit07doE+jwerYSueoTotMjbVKgV/B9sl/3brncuF0ezNNEtk4m0=
X-Gm-Gg: ASbGncv95Ly5Gfwj9bECW3m6ZDKdloh+gFt9uMeEo5JO69PZyOJYOhU+csNm1UakORE
	bN14kZa7G7HjTzINqMCi0wffY4qYN4C8akznB05kDkeXp5k2/7c1RtsjqEaZTfcLQKTq1id6UB6
	SPIiQlIPphQ4ub0hwoLfTDup0Xf9ITzyS7wzX6tXh0G/V1MeUGC4cA3HeLHwGZnmXmXf//EoG8B
	Mmz5Vowj6EJ92DLFfwxcUMJ2bACWzsdb3LtwtLhtrB6tX3+dD5axSdFR++HxX9kGnj/QfqylhYN
	QfKz4bQE7kADN8LqxS9gnuey96CKeSIAYjMF0ViceLrOlHhKPlvtnXEs12tBQ/CWc3fYFQlAFXU
	xP5oAomDEH5NnEfmhyZ1rNSkVxfRv4PWRjNXSRZOxm6/nO+oeUsK2D4snigyr3j0NvxKf3CkkMA
	==
X-Google-Smtp-Source: AGHT+IEmyRdJ5hUcc+FCHw4q7fjwq2f7c66lh0lffLNTrZj+CMP5Khlz0+rxsLL4mi6tfmYQmWKZbw==
X-Received: by 2002:a05:6000:288c:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3b776732accmr9927466f8f.21.1753710425692;
        Mon, 28 Jul 2025 06:47:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bccc5sm156569365e9.22.2025.07.28.06.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:47:05 -0700 (PDT)
Message-ID: <6560f783-c50d-4509-8937-f76553c8bbb4@linaro.org>
Date: Mon, 28 Jul 2025 14:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] media: dt-bindings: Add qcom,sa8775p-camss
 compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-4-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_064707_950005_AF3190DE 
X-CRM114-Status: GOOD (  17.52  )
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
> Add the compatible string "qcom,sa8775p-camss" to support the
> Camera Subsystem (CAMSS) on the Qualcomm SA8775P platform.
> 
> The SA8775P platform provides:
> - 2 x VFE (version 690), each with 3 RDI
> - 5 x VFE Lite (version 690), each with 6 RDI
> - 2 x CSID (version 690)
> - 5 x CSID Lite (version 690)
> - 4 x CSIPHY (version 690)
> - 3 x TPG
> 
> SA8775P is the first Qualcomm SoC to introduce a CSIPHY-based
> Test Pattern Generator (TPG).
> 
> Co-developed-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/qcom,sa8775p-camss.yaml    | 361 ++++++++++++++++++
>   1 file changed, 361 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> new file mode 100644
> index 000000000000..b9f351546cd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -0,0 +1,361 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sa8775p-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8775P CAMSS ISP
> +
> +maintainers:
> +  - Vikram Sharma <quic_vikramsa@quicinc.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8775p-camss
> +
> +  reg:
> +    maxItems: 22
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_lite2
> +      - const: csid_lite3
> +      - const: csid_lite4
> +      - const: csid_wrapper
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: vfe_lite2
> +      - const: vfe_lite3
> +      - const: vfe_lite4
> +
> +  clocks:
> +    maxItems: 28
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb_clk
> +      - const: cpas_vfe_lite
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: csid
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: icp_ahb
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 21
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_lite2
> +      - const: csid_lite3
> +      - const: csid_lite4
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: vfe_lite2
> +      - const: vfe_lite3
> +      - const: vfe_lite4
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSIPHY 0-3.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@ac7a000 {
> +            compatible = "qcom,sa8775p-camss";
> +
> +            reg = <0x0 0xac7a000 0x0 0x0f00>,
> +                  <0x0 0xac7c000 0x0 0x0f00>,
> +                  <0x0 0xac84000 0x0 0x0f00>,
> +                  <0x0 0xac88000 0x0 0x0f00>,
> +                  <0x0 0xac8c000 0x0 0x0f00>,
> +                  <0x0 0xac90000 0x0 0x0f00>,
> +                  <0x0 0xac94000 0x0 0x0f00>,
> +                  <0x0 0xac78000 0x0 0x1000>,
> +                  <0x0 0xac9c000 0x0 0x2000>,
> +                  <0x0 0xac9e000 0x0 0x2000>,
> +                  <0x0 0xaca0000 0x0 0x2000>,
> +                  <0x0 0xaca2000 0x0 0x2000>,
> +                  <0x0 0xacac000 0x0 0x0400>,
> +                  <0x0 0xacad000 0x0 0x0400>,
> +                  <0x0 0xacae000 0x0 0x0400>,
> +                  <0x0 0xac4d000 0x0 0xd000>,
> +                  <0x0 0xac5a000 0x0 0xd000>,
> +                  <0x0 0xac85000 0x0 0x0d00>,
> +                  <0x0 0xac89000 0x0 0x0d00>,
> +                  <0x0 0xac8d000 0x0 0x0d00>,
> +                  <0x0 0xac91000 0x0 0x0d00>,
> +                  <0x0 0xac95000 0x0 0x0d00>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csid_lite2",
> +                        "csid_lite3",
> +                        "csid_lite4",
> +                        "csid_wrapper",

csid_wrapper is IMO the "main" register bank and as such should come 
first in the list of registers.

Please update this description to reflect, remembering to amend your 
isp@address here and in your dts.

> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "tpg0",
> +                        "tpg1",
> +                        "tpg2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe_lite0",
> +                        "vfe_lite1",
> +                        "vfe_lite2",
> +                        "vfe_lite3",
> +                        "vfe_lite4";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_ICP_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +            clock-names = "camnoc_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb_clk",
> +                          "cpas_vfe_lite",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "csid",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy_rx",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "icp_ahb",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csid_lite2",
> +                              "csid_lite3",
> +                              "csid_lite4",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "tpg0",
> +                              "tpg1",
> +                              "tpg2",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite0",
> +                              "vfe_lite1",
> +                              "vfe_lite2",
> +                              "vfe_lite3",
> +                              "vfe_lite4";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_0";
> +
> +            iommus = <&apps_smmu 0x3400 0x20>;
> +
> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "top";
> +
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };

Otherwise that this looks fine, please fix and then add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

