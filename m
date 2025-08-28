Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FFFC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vejRaEijRO8+CORhQowxHuuY85LG5Du7ZSdJ6Jjs0g=; b=Wn28rnOne+OwtHwuN199W5eeQk
	tdEKebGt0DV5rrKagwI35ZdlZAneUqMijx57Yyz1pTKk6jxEs6DZtsjGS2HgZYo7ZnpgHWzNjXsCm
	/N53LUZKXjvBSJ1qTa/2wHm6kiXI9pMfvUaljAli6Orxhfe7o6eavQbQOQomSPPZGTNuJESxPXli7
	fIU9vU4etFWLlbmLLVC/dQf7CODWwKtSdWcqeC56aQktyMrIRGOfm1gEyVz2/RyMGXhdleb8fKYTR
	CaCULaj8JmELJSI8V27oqrG2VjJYNflaVgGwXbqLTtdgeJLidr2vgugqu9ZZXlWGcZylMfVKGscEH
	xF9RwM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWJ-00000002oAb-42sf;
	Thu, 28 Aug 2025 18:38:47 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcZp-00000001iaa-28zB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:22:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so128825766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756387324; x=1756992124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vejRaEijRO8+CORhQowxHuuY85LG5Du7ZSdJ6Jjs0g=;
        b=QyGURqmW+lY6cxGEE0fxxjuY3jCZ7YoSmSxOYD7eCUZseRYDcDZwZvHZhim0V5HZmQ
         lfQTINUiKwkgZfaSLmRrtxrWAXBIXZpZKxVIzj094kyV0Djvq7v1hsq96yjnjaOoQm33
         xlu1/MrvaX92bK9kWuTUj4j8nJzJG7uaOfFhh4fMjjGGBXsiy1dkHAICyys96XU1DfkA
         n/wYtq6E20HgdMgY3VO1q/4dLy7EqgauTU7Z3w4L8hdSjMvsqwynzlOg9Dj8dy10WKVZ
         ecIRjq6DO7IdbBB+YG0t7iZn3d+YxFwtsLlOded8J6bFlCPMPznWfwTuFDcxZFO++LgA
         UIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387324; x=1756992124;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vejRaEijRO8+CORhQowxHuuY85LG5Du7ZSdJ6Jjs0g=;
        b=odFSmj6KlYYnMnXvGVXp3EZjhwPhoRuyH2545GJjSTKAt2G3SQF4EcVvAkfwWkdn0q
         tpai115CkT2WMS6lpE59UCmAwZDvU0b+HZcxlU+KBUswBsWjxkluJJWIi/J23lqD3TwM
         TlIb4SWt/qObPwZfh352V2I+j97bQDnM4r8f23QcwvxJpUmRPN15HdWUpUSWEADQqBOx
         b9cVJSNI7eER/iyXM6VKd94t1SE2870NKq46eIiP/6uJ2jmsVz7QozMPCuoEYZeE41NF
         r1PQR/vDo+BEoOrOC7Y0Vs/Ej07tgWBCvcICTouDCidDHkFgkxpY7bWU4ddotwTiHetp
         FNnA==
X-Forwarded-Encrypted: i=1; AJvYcCWQO36zaJTVy+HrN4Sos+ot/LYRVoP+jxs9RknSL2FZEQk4yL7MvOulbwzo6YD206cLqabb07YvxWElX/DVFxpC@lists.infradead.org
X-Gm-Message-State: AOJu0YwZV98zzHr1LQi9/GM2FDzG4mu/xxdT9kh9Z2zuzFM6SrYnNKXs
	3gWpGUgMZVJciUx4Vh9Vxr0zpxV2URT1N9cZzR61mtCFJptSieFoTsRk+x7makgZ5hU=
X-Gm-Gg: ASbGnctT96UhB8K++1dCn+cDehCTELMBp5KocQsm1K1WLmZuQJDWlw2fDT8x3ZhVQYj
	L9gOwDAlKHGYLFLHO9vwaS0bF+uq9kajD9hmC+Radt+JVLxiCS8WiNtykunWNsVL9VZE/FEhwjj
	EZOKYAulBIv1E/UVSkeAMN4+D0nt8GVnahfk4TCa8KV93+pDGWwUQv5Yw6M9uhQJeosW1E/Bl5W
	RLDE2om19If1qvSpyaWSkn78wH+j66GNmaDnyaPb3EoTDmxAW3XtwkMqABABbpUUK3K4c0egSc+
	BpnyAnauzRr2m9eg5/HfnnF1Vm0v6H366wbNGyyA1tIUWhp5W/ZWz37CEVTNjjKnW7X58aoZGmx
	3BOYEKgt9bJkK8QeCZRShYVDXNQ4yPAS9ZAJPb09X7+b3g67dmG8vBtak/y3bsPZSXItWDx6wTd
	6KEA==
X-Google-Smtp-Source: AGHT+IEydpmL/CGGlYRxIOHwyq2SzsRVG+uSKGaJVOpWYTkFto5PXtB9f5EDZvVuQAcMg4VMfo+bpw==
X-Received: by 2002:a17:906:398f:b0:afe:b7b5:555a with SMTP id a640c23a62f3a-afeb7b56482mr637165366b.63.1756387323855;
        Thu, 28 Aug 2025 06:22:03 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe849d7e6bsm850780866b.61.2025.08.28.06.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:22:03 -0700 (PDT)
Message-ID: <45fa25b0-076e-4df5-a3e3-118b1034c71b@linaro.org>
Date: Thu, 28 Aug 2025 15:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/13] media: dt-bindings: add rockchip px30 vip
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-3-62d8a7b209b4@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v10-3-62d8a7b209b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_062205_576028_EEBC182C 
X-CRM114-Status: GOOD (  19.27  )
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

On 19/08/2025 01:25, Michael Riesch via B4 Relay wrote:
> From: Mehdi Djait <mehdi.djait@bootlin.com>
> 
> Add documentation for the Rockchip PX30 Video Input Processor (VIP).
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> [revised description]
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   .../bindings/media/rockchip,px30-vip.yaml          | 122 +++++++++++++++++++++
>   MAINTAINERS                                        |   1 +
>   2 files changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
> new file mode 100644
> index 000000000000..9f7ab6965636
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,px30-vip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip PX30 Video Input Processor (VIP)
> +
> +maintainers:
> +  - Mehdi Djait <mehdi.djait@linux.intel.com>
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip PX30 Video Input Processor (VIP) receives the data from a camera
> +  sensor or CCIR656 encoder and transfers it into system main memory by AXI bus.
> +
> +properties:
> +  compatible:
> +    const: rockchip,px30-vip
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: PCLK
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: pclk
> +
> +  resets:
> +    items:
> +      - description: AXI
> +      - description: AHB
> +      - description: PCLK IN
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +      - const: pclkin
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: input port on the parallel interface
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [5, 6]
> +
> +            required:
> +              - bus-type
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/px30-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/px30-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        video-capture@ff490000 {
> +            compatible = "rockchip,px30-vip";
> +            reg = <0x0 0xff490000 0x0 0x200>;
> +            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
> +            clock-names = "aclk", "hclk", "pclk";
> +            power-domains = <&power PX30_PD_VI>;
> +            resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
> +            reset-names = "axi", "ahb", "pclkin";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    cif_in: endpoint {
> +                        remote-endpoint = <&tw9900_out>;
> +                        bus-type = <MEDIA_BUS_TYPE_BT656>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d2adf483426..356679cfdcaa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21768,6 +21768,7 @@ M:	Michael Riesch <michael.riesch@collabora.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/admin-guide/media/rkcif*
> +F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>   
>   ROCKCHIP CRYPTO DRIVERS
>   M:	Corentin Labbe <clabbe@baylibre.com>
> 

I think your example could use with some newlines per dtsi files in real 
life, i.e. newline after the reg as an example.

Other than that this looks fine to me, please consider incorporating.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

