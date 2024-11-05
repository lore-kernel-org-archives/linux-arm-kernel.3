Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4BFD12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Subject:
	In-Reply-To:Cc:To:From:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jefnxVo5g2H0Su9GziWcx7xJMa463Zc+Yp3+Yh3BVHg=; b=0viHS46V1KwXQIICkdxtmkHm5y
	xfpccLJE7u1XHTJPHr1xgoHIZ/g0ny1ZorcFFI8PGTnhGT3ZDaOoSTY/ljNnXLxN33s90Q1ZnQxbW
	Ra1w3JHbwH0uMQiY8mHyW3Z/e1oH7fKyqab4c72AoqFD7YMj+QnvzWlzI0xmkvfS6PfaiSLa96Aw3
	dIsptvpA6DiYSgcKbRt7dwxFo5buoIYRQjoS9PRQmyzXNl+Ya9ygkae7YeLg9iU0YjZJSaFt+HDB/
	dcUnA92eR9QmdBaY5PM/Hf1irQjZDwQe4HbRIJl8rvqWsnuUkwI2QfvWDxjbxSp6LsS6wWf9aq8nk
	FpR04jKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FCu-0000000GOJe-0cWB;
	Tue, 05 Nov 2024 08:46:36 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8F8M-0000000GNLR-0vT4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 08:41:56 +0000
X-KPN-MessageId: cbd3c289-9b51-11ef-8d51-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id cbd3c289-9b51-11ef-8d51-005056999439;
	Tue, 05 Nov 2024 09:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=jefnxVo5g2H0Su9GziWcx7xJMa463Zc+Yp3+Yh3BVHg=;
	b=lYgRInHZEGEGH/dOZfkoaC8/iZWU5AkH6VZn0Alk60Z7+RyVneblrEOPFdUR7WL4sVA518nO5q+Q/
	 j8FO6vztuP1v3Q8BHY8VIY1JRqlyLJOqI/+EUFfvMXLOA7AzUfvvKPD0piD+1lHtE/nUArRLOa5bDW
	 2/fGR02W9ejHFdMvvXUHE6PBsmW/BtMUB1mWeBVOegRgIBtxqXHg920URl5oUzrIg3AnliULfxbsiB
	 6yRxu6JC8aVflWKzkebX+egmQeogHSS6ol45qgsRZ1lSxd9UgtG8oFiglt+54POChTFGLZD/3Sgwhr
	 9F7J0MYHzEYaCS9lV1tWPVKR9z0fe+w==
X-KPN-MID: 33|DvtP+JdYvzSblrsg267cZse9/LQIrxsjK7xbTQSHViMueZiHcwJ9JP7t5Z0peDU
 eiukTx7x+7l/cI5g28XYgCXH+5MSPTXWzfQRdkH7uEL4=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|JvOqZX1LaV8o6V89k1e3f0Nll+2+Ct0klrl86zRy/XeEYFMeTkVlUzc6ubdJbXB
 HBTFMVcQRcXCMRT/CynX8wA==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id cbfa2edc-9b51-11ef-b66d-00505699b758;
	Tue, 05 Nov 2024 09:41:49 +0100 (CET)
Date: Tue, 05 Nov 2024 09:41:48 +0100
Message-Id: <87a5ee3wdv.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: j@jannau.net
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, j@jannau.net,
	towinchenmi@gmail.com, conor.dooley@microchip.com
In-Reply-To: <20241105-asahi-spi-v4-1-d9734f089fc9@jannau.net> (message from
	Janne Grunau via B4 Relay on Tue, 05 Nov 2024 09:08:29 +0100)
Subject: Re: [PATCH v4 1/3] dt-bindings: spi: apple,spi: Add binding for Apple
 SPI controllers
References: <20241105-asahi-spi-v4-0-d9734f089fc9@jannau.net> <20241105-asahi-spi-v4-1-d9734f089fc9@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_004154_556683_28438513 
X-CRM114-Status: GOOD (  16.40  )
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

> From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
> Date: Tue, 05 Nov 2024 09:08:29 +0100
> 
> From: Hector Martin <marcan@marcan.st>
> 
> The Apple SPI controller is present in SoCs such as the M1 (t8103) and
> M1 Pro/Max (t600x). This controller uses one IRQ and one clock, and
> doesn't need any special properties, so the binding is trivial.

Matches what is currently in use for U-Boot and OpenBSD.

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Nick Chan <towinchenmi@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  .../devicetree/bindings/spi/apple,spi.yaml         | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/apple,spi.yaml b/Documentation/devicetree/bindings/spi/apple,spi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7bef605a296353a62252282af4ba45a71b20b7b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/apple,spi.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/apple,spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple ARM SoC SPI controller
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-spi
> +          - apple,t8112-spi
> +          - apple,t6000-spi
> +      - const: apple,spi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      spi@39b104000 {
> +        compatible = "apple,t6000-spi", "apple,spi";
> +        reg = <0x3 0x9b104000 0x0 0x4000>;
> +        interrupt-parent = <&aic>;
> +        interrupts = <AIC_IRQ 0 1107 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clocks = <&clk>;
> +      };
> +    };
> 
> -- 
> 2.47.0
> 
> 
> 
> 

