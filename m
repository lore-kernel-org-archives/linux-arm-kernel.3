Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25238C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aneT5K+AF41TXCi/VQ3SDAAM0cdM1vJg1NCj+Raq3kI=; b=m2FhNXBt5o4o0uagPwbDqxjc48
	A/iv3A/YU+4GMiswe88AMXSQCv/JFfXcGG0MyVKdytRIw9BZVlnDdHZUO+DUqX0aGFNqBFhICt5SF
	vpj7T5MBQdQIPQUmtFcDUzPqecJTplBLQHkSpqLUTFfSxKKcNOFZVZDQmGL3ny3VguschYsIhji5I
	pld+uuFyrpoPq+q0FZbajf/8VOGu9PFBda9Wsp5pwhTswGSF8+5fxmtSDY1eryoQlg9CbYPNSP92t
	u3tJRHqhpT+n3SISPzIM0xuhU6MnQtQukacbWOxSpxzfyfY5qPhpgRBePPiWdzBwzs/z1yiKmsNA7
	dNuVG2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4zs-00000006k0q-0mSK;
	Tue, 11 Mar 2025 19:10:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4wb-00000006jKU-2AcY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 026195C6847;
	Tue, 11 Mar 2025 19:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E155C4CEE9;
	Tue, 11 Mar 2025 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741720032;
	bh=vfXaMojQxXrOenb7DcUF+z+2Fku7SdE8waa4ob1RDZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJXIgoUPIQRAUHjcFUTDyIfqwQ2eFlwFY7LHUDwA5KlmDGsolin4xNlDw2FKmB+r0
	 z5FTMUZKCOi+wXYZKb322bhqgH1aJFMmJk28VCdJ1y86Cd1H3nWGmJLeOgyzcRTXGE
	 dwpJwnx26Eer6M+lqIxvqL/PAqQGxKGAa32IHHtDdxDmoYHp+nl3iEry727gNG7rmA
	 oHh06bYfYuIU0E2gxniR7NJr+nxluemY9byk/h2tIOtoNYz3OIl7jTXpTbXvNMFgd0
	 tdeMsjKdHzeKJf7MRD5bqjKWOIy4xxeRNtdlHfZdj2ClIJNig2AySCQ824bLiYwbu/
	 uI95kmEn6Pp7w==
Date: Tue, 11 Mar 2025 14:07:11 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH v2 11/16] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Message-ID: <20250311190711.GA3985355-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-12-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-12-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_120713_643881_E1B9B0E3 
X-CRM114-Status: GOOD (  24.49  )
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

On Sun, Mar 09, 2025 at 10:48:03AM +0200, Cosmin Tanislav wrote:
> The MAX9296A deserializer converts single or dual serial inputs to MIPI
> CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
> in the forward direction and 187.5Mbps in the reverse direction.
> In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
> GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
> GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
> GMSL1 links. The serial inputs operate independently, allowing videos
> with different timings and resolutions to be received on each input.
> 
> MAX96716A supports both tunnel and pixel mode.
> MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max9296a.yaml    | 281 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 287 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> new file mode 100644
> index 000000000000..97731549d161
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> @@ -0,0 +1,281 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Collabora Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/maxim,max9296a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX9296A GMSL2 to CSI-2 Deserializer
> +
> +maintainers:
> +  - Cosmin Tanislav <cosmin.tanislav@analog.com>
> +
> +description:

Needs '>' token as you have paragraphs.

> +  The MAX9296A deserializer converts single or dual serial inputs to
> +  MIPI CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps
> +  or 6Gbps in the forward direction and 187.5Mbps in the reverse
> +  direction. In GMSL1 mode, each serial link can be paired with 3.12Gbps
> +  or 1.5Gbps GMSL1 serializers or operate up to 4.5Gbps with GMSL2
> +  serializers with GMSL1 backward compatibility. The MAX9296A supports
> +  mixed GMSL2 and GMSL1 links. The serial inputs operate independently,
> +  allowing videos with different timings and resolutions to be received
> +  on each input.
> +
> +  MAX96716A supports both tunnel and pixel mode.
> +  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max9296a
> +      - maxim,max96716a
> +      - maxim,max96792a
> +
> +  reg:
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Specifier for the GPIO connected to the PWDNB pin.
> +
> +  port0-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 0
> +
> +  port1-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 1
> +
> +  i2c-mux:
> +    $ref: /schemas/i2c/i2c-mux.yaml#
> +    unevaluatedProperties: false
> +    patternProperties:
> +      '^i2c@[0-1]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1
> +
> +  i2c-alias-pool:
> +    maxItems: 2
> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^i2c@[0-1]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@[0-1]$':
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +        description: GMSL Input
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#

What properties are you using from here?

None actually because /schemas/graph.yaml#/properties/port won't allow 
any.


> +            unevaluatedProperties: false
> +            description: Endpoint for GMSL2-Link port.
> +
> +      '^port@[2-3]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              lane-polarities:
> +                minItems: 1
> +                maxItems: 5
> +
> +              link-frequencies:
> +                maxItems: 1
> +
> +            required:
> +              - data-lanes
> +
> +    anyOf:
> +      - required:
> +          - port@2
> +      - required:
> +          - port@3
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max9296a
> +              - maxim,max96792a
> +    then:
> +      not:
> +        required: [i2c-mux]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max96716a
> +    then:
> +      not:
> +        required: [i2c-atr]
> +
> +dependentRequired:
> +  i2c-atr: [i2c-alias-pool]
> +  i2c-alias-pool: [i2c-atr]
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        deserializer@28 {
> +            compatible = "maxim,max9296a";
> +            reg = <0x28>;
> +            powerdown-gpios = <&main_gpio0 37 GPIO_ACTIVE_LOW>;
> +
> +            i2c-alias-pool = <0x40 0x41>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    des_gmsl_in_0: endpoint {
> +                        remote-endpoint = <&ser_0_gmsl_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    des_gmsl_in_1: endpoint {
> +                        remote-endpoint = <&ser_1_gmsl_out>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    des_csi_out: endpoint {
> +                        data-lanes = <1 2 3 4>;
> +                        link-frequencies = /bits/ 64 <400000000>;
> +                        remote-endpoint = <&csi_in>;
> +                    };
> +                };
> +            };
> +
> +            i2c-atr {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                i2c@0 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <0>;
> +
> +                    serializer@40 {
> +                        compatible = "maxim,max96717";
> +                        reg = <0x40>;
> +                        gpio-controller;
> +                        #gpio-cells = <2>;
> +                        #clock-cells = <0>;
> +
> +                        ports {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            port@0 {
> +                                reg = <0>;
> +                                ser_0_csi_in: endpoint {
> +                                    data-lanes = <1 2>;
> +                                    remote-endpoint = <&sensor_0_out>;
> +                                };
> +                            };
> +
> +                            port@1 {
> +                                reg = <1>;
> +                                ser_0_gmsl_out: endpoint {
> +                                    remote-endpoint = <&des_gmsl_in_0>;
> +                                };
> +                            };
> +                        };
> +                    };
> +                };
> +
> +                i2c@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <1>;
> +
> +                    serializer@40 {
> +                        compatible = "maxim,max96717";
> +                        reg = <0x40>;
> +                        gpio-controller;
> +                        #gpio-cells = <2>;
> +                        #clock-cells = <0>;
> +
> +                        ports {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            port@0 {
> +                                reg = <0>;
> +                                ser_1_csi_in: endpoint {
> +                                    data-lanes = <1 2>;
> +                                    remote-endpoint = <&sensor_1_out>;
> +                                };
> +                            };
> +
> +                            port@1 {
> +                                reg = <1>;
> +                                ser_1_gmsl_out: endpoint {
> +                                    remote-endpoint = <&des_gmsl_in_1>;
> +                                };
> +                            };
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index abf3afc95fc9..c1e01668e81a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14220,6 +14220,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
>  F:	drivers/iio/proximity/mb1232.c
>  
> +MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS
> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> +
>  MAXIM MAX11205 DRIVER
>  M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
>  L:	linux-iio@vger.kernel.org
> -- 
> 2.48.1
> 

