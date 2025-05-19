Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F30C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnonPLmJBu73K6JSsLsm1dFm7U3QwLe6s03FTKzEpZU=; b=c8k+pjh00G/5TqgFHKtsuv9CEU
	JiHxM06yulY/OLuSfdGtYc/LZ5xYcg/2KI1yFOIZAEkgaudiDn/wX4nXxSlHuJm5dyq8fZ7uh5EWT
	8IUGJrs93v7Ax0s/inL6/ryKyZ/6Q1DrCLpp9kxFeO8e+9YHqp1+LH6AYlX5lxO73RMQY0vF/JsWZ
	X3Tlz2XAQOtPRsHaB91vJWv0B4lx81+WnHjDf3Jf7gHBDi8Q9QLZkpkANg3XFhAtLlmKxxSBfd9VM
	682orW5iot6PF+aaseIR39kQ5tquFq8YWTHZRQD0uR8WAGgNyc6yZ1Z5PazmS3NrfRMUETemlH9Cz
	XKQcPTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvcx-00000008JcD-1ZYU;
	Mon, 19 May 2025 08:13:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGva2-00000008JLU-0Q6f;
	Mon, 19 May 2025 08:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 319046112E;
	Mon, 19 May 2025 08:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1DBC4CEE4;
	Mon, 19 May 2025 08:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747642236;
	bh=YhHucTbG2eUBFPlS1a/JrdQuTRlGHANsway1CBoAGII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXVvLU8wR9xtpCsyqffYZGBHL9P576ldjFHHsYkB02iuRcuU1wIau6WK6tAKc1Jbc
	 dwW6ONMRvBnSV1Y6nA6DgNmmdqkjaEsH7MUAMRe4kHq/Y/l6cARbALXmEvwE+621cc
	 DWYtVQFAV/CWs+cw2vSP9guVsYrJHOhl1K61RNRGN3N873oqpxEadh1XEdy/8Ve2yl
	 W70sQ60FEtdheEqROrzfiJoyhoFpo3+h9lHZ8q34f+ciKd3+oLgdjvkWEv+38V82j6
	 KOQ1uTyoOtKSxOOLDkMb6YWsypgx2dhYc7D5FH+ElDH5V96ckzwukukkDNW2gYSalR
	 2rHi5N9/nR/0Q==
Date: Mon, 19 May 2025 10:10:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Markus Elfring <Markus.Elfring@web.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Collabora Kernel Team <kernel@collabora.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v7 05/14] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
Message-ID: <20250519-amazing-loutish-kudu-af8f47@kuoka>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
 <20240220-rk3568-vicap-v7-5-7581fd96a33a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v7-5-7581fd96a33a@collabora.com>
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

On Wed, May 14, 2025 at 05:41:06PM GMT, Michael Riesch wrote:
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [1, 4]
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - bus-type
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port connected to a RK3568 VICAP port.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - phys
> +  - ports
> +  - power-domains
> +  - resets

If there is going to be a new version, please order this the same as in
properties. Or rather order properties, because this looks alphabetical
and properties do not.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi: csi@fdfb0000 {
> +            compatible = "rockchip,rk3568-mipi-csi";
> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
> +            clocks = <&cru PCLK_CSI2HOST1>;
> +            phys = <&csi_dphy>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_P_CSI2HOST1>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi_in: port@0 {
> +                    reg = <0>;

Make it complete. Missing endpoint with bus-type and data lanes.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


