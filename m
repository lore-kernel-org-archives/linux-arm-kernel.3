Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57578D6ACC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 12:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMnA2TIQtFWhtYtMcjnAKHGq49js6Hrus6w+eGXStpw=; b=L1aaTjyVEBSzHMZ08DGq9zU3Fy
	GrJp27DiTeWXrC+zrg+WF9SynCkiPxyYVpi0GNwK909z9pB5qBUQeWmTA+nG6l+7a98qXAbk6sYvv
	xwykB8/PcavrNEtWJXdpGh/qk7Cv/W2T52q6ps8KttHcVGzNOGWdxKg6zeBBcYN874aD18p9GVny3
	5WjapPYsmdgpQ8EJVtcFpXLBJ3v6li+s2Pl+5AFRq5dnT5CE6Eik4s7VIGl6Yfgyn1YwgykfAZRXV
	g0sergTMcm54j9BqNd9MJzJWicbnhSc1mockqr7GhbIRL0NeONDfhW8cp3J9krLffAQjKhWX0S48t
	fRFC071A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHcc-0000000DBjl-38lp;
	Wed, 27 Nov 2024 12:58:22 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHbe-0000000DBcG-0wFp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 12:57:23 +0000
Received: by mail-lf1-x141.google.com with SMTP id 2adb3069b0e04-53ddb4c05c0so670965e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 04:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732712240; x=1733317040; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMnA2TIQtFWhtYtMcjnAKHGq49js6Hrus6w+eGXStpw=;
        b=iFCRIx7bG5Tj2lLgR/guWzhKP5sMOWH3rs7urIATYqU7zjMTUh4BD9HN7jvWDfLxUy
         bYkX6uu0+Lc2nSv7SYrNtviZ8FCurBth+L4TdIBoLLipa7/JIdcR2q/E3Fm3OWiAB1Q4
         UoVqXYEeziAtDLNF09bj3j+RXxlzNzzL1UFukXQp/Lpb7AS4KYBGDyOVpcTwjYghR1VV
         Nc6YrUC7VY5BDPGkQS6Ykth3zI4TzgyZLuutWzvRvZ7wXDx3z1tZ92IPTm2aDZcPJV+V
         KUyxzPNDN1TXKFwb2DnRcjIc94ko5wfDfyZsiIrIMHEUaVWZjIlCvOy6OQ7WCwYdDEbd
         VmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712240; x=1733317040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMnA2TIQtFWhtYtMcjnAKHGq49js6Hrus6w+eGXStpw=;
        b=S1YeZlUmBMVy3AIqgbZJ/EqQVUPgIljOVjmnN4J9D4BLzJ1FRT5vrSBrrOQE5KpFYY
         r0PbcIkX5TsbhRNJEi4fyS3rEk8ZY5+SqkEuIcKZkc1bh5ehwxEK1gz9wqgd38KCNNOh
         TGxeoWtcAIWtLarCFVhdoNbLR05ZbtCGxZimiOaDMm4hWivlJGjaX+FGpDIk0/SfaXXJ
         Qnaogktf7fmqVtDftW0rc155eAk3Qjx+vLtnRAOyjBH33HZ8XdiUwxb7ov78F+m1cKXH
         +fBry5VG0K4I6CYgE1xVJyMf+SWjTxs2ou7TqIIgE1SCw9jM7/3mC8vwk3202Q1Lpg7d
         XDtw==
X-Gm-Message-State: AOJu0Yw8+r09rK6CHcrI1J4Z1b4v9i8175RcoJBMNX+XqLPnmH+CmVn0
	AYbDk3wL1lg7kKWmgMTaL8vfvhSPw1OZ/LPKh53MWKejrCh/FVuio/+smMGpFi4=
X-Gm-Gg: ASbGnctrmywzZRvcLRCdQ4axlcWoRzrxdsL7xWX3xHe8cDdr+jwjJKaeUIYvj2fSKcG
	88R9zx3eyOKcSzn/wNCHyjn3Xj26GiwO4DFqL5iSGUckjKbdU/AJHU4HLowFPpRDJMpGdyphy9b
	NTn/sj0e74EwtadHnsrqrNJwIz1waEmoxs2GhHjjYhEvzseEyB2PSrYLZUkRGQR06DYY1GBLHxG
	tnYlRphpdwKVjXcVPn8N/sDireHeL0FCGHb4Jn98/M9Cu+WLXvf4qgs0HDldcbczfh+Nj7+nyr0
	tn9L80lS1TjG5PNNFtR6wyoUrsza
X-Google-Smtp-Source: AGHT+IEorNTlk8cNgkvDRFQKz1WeQVG+qF6iU+1q8AV+O6kv4z8kbCBsuwDicAF8+/dgchFW5mETbw==
X-Received: by 2002:a05:6512:33d6:b0:53d:e780:3ff5 with SMTP id 2adb3069b0e04-53df010a27dmr318412e87.9.1732712239632;
        Wed, 27 Nov 2024 04:57:19 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ddd4c8fefsm1587593e87.125.2024.11.27.04.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 04:57:19 -0800 (PST)
Message-ID: <1a87e9d9-da7e-4b8b-807e-f56aa15acfc2@linaro.org>
Date: Wed, 27 Nov 2024 14:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
 <20241127100421.3447601-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241127100421.3447601-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_045722_320112_63A49213 
X-CRM114-Status: GOOD (  16.64  )
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

On 11/27/24 12:04, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,sc7280-camss.yaml     | 415 ++++++++++++++++++
>   1 file changed, 415 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> new file mode 100644
> index 000000000000..6fafb3631b15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -0,0 +1,415 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SC7280 CAMSS ISP
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-camss
> +
> +  reg:
> +    maxItems: 15
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid0_lite
> +      - const: csid1
> +      - const: csid1_lite
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe0_lite
> +      - const: vfe1
> +      - const: vfe1_lite
> +      - const: vfe2
> +
> +  clocks:
> +    maxItems: 32
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: gcc_camera_ahb
> +      - const: gcc_cam_hf_axi
> +      - const: soc_ahb
> +      - const: vfe0
> +      - const: vfe0_axi
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe0_lite
> +      - const: vfe0_lite_cphy_rx
> +      - const: vfe0_lite_csid
> +      - const: vfe1
> +      - const: vfe1_axi
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe1_lite
> +      - const: vfe1_lite_cphy_rx
> +      - const: vfe1_lite_csid
> +      - const: vfe2
> +      - const: vfe2_axi
> +      - const: vfe2_cphy_rx
> +      - const: vfe2_csid
> +
> +  interrupts:
> +    maxItems: 15
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid0_lite
> +      - const: csid1
> +      - const: csid1_lite
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe0_lite
> +      - const: vfe1
> +      - const: vfe1_lite
> +      - const: vfe2
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
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
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
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSIPHY 0.
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
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSIPHY 1.
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
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSIPHY 2.
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
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSIPHY 3.
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
> +      port@4:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSIPHY 4.
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/interconnect/qcom,sc7280.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@acaf000 {
> +            compatible = "qcom,sc7280-camss";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,

Unsurprisingly above is the error, which has been already reported for
enumerous amount of times, I wish to stop poking it eventually, please
reference to the previously given review comments and fix all of them
before sending a new version of the changes.

--
Best wishes,
Vladimir

