Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A12C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMaoBpGPZEHHjmwoUMsy/5mBTacSRCosM8VYO3Lr7hI=; b=h5aE0QsCDrVYzhi/WFq4+VRawD
	pn9D7WjzIFVuZwnznN6JD2MPAuhqqr63SIM7ayFqVCt62QawVBLRmhvwXu0su9YmsBXHWzy7vyb4p
	vxPGGEviHQ8IRCc++6VV3iagpkLiPrOr9jvqCEj+AnWiXINuF/2OsjGoHUMxw/PCk9EmuHfxEf/mi
	tOkClzhjaUJvOkgR9aPkWZvQmujoqJ6ms5fEC3yJeuHEamFQJRNLMtJQQVb1N/WEk5uP335npnESA
	MKfKk+uy91CxuIxfkvPUyl0vZO8qu4ESADJMpeUXuh5IGVD55HMlIGlDlpovpLJNhkN8jbml+JtdX
	apX73TQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6yV-0000000D9BZ-3V5w;
	Sun, 27 Jul 2025 19:23:59 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6ub-0000000D8u6-1aXL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 19:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753643997; x=1785179997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ODQad/kLebqtWcgou3DFGpBib/gjsX4M3+AiroUgXOs=;
  b=nZOfUyQbAv/hj1gCX82BfHBfGb0tBMU2sa5HfJtvUPt7eZpLguc4VA+/
   ICGHuPR6kbA2WLnNyj8tuJ3JBv+S3RVGQODcjkgM4Qx2ENxo/lYt1m52E
   EtlhMMTr33uD8YL/DCb2fAd4iJUW9JIFAODYMZI+gk0pAyTNajjXcvwnY
   6BXt33z/vRQnZEAtTvkqvCYcekS1pEhAgmWMPc2CqQNrk76cUwESgNSyJ
   RRI8xOc0u4sYocgr9wpP8vANv+OUfMw9PMAzVEFfhf/JiDQHSbESvVvAr
   NzXggCOdKbwjHW3PSRio4hrQUPJbvN2Hbmy8H+4odz+WHMORKyvBvN8u1
   A==;
X-CSE-ConnectionGUID: 5NI2afIVSMibDmuxrNIGxQ==
X-CSE-MsgGUID: Epcg8xf3Qk+sj+yY67+fNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="58518748"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58518748"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:19:57 -0700
X-CSE-ConnectionGUID: Wlqgd4GMRi2rWUo+AG9GTw==
X-CSE-MsgGUID: ftSqS2g5RKOKTsUxssggWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193215578"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.124])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:19:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 821F111FAF5;
	Sun, 27 Jul 2025 22:19:49 +0300 (EEST)
Date: Sun, 27 Jul 2025 19:19:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 14/24] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Message-ID: <aIZ71TZM9wUGlGoU@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <20250718152500.2656391-15-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718152500.2656391-15-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_121957_434278_D2E1EA2D 
X-CRM114-Status: GOOD (  23.14  )
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

Hi Cosmin,

On Fri, Jul 18, 2025 at 06:24:50PM +0300, Cosmin Tanislav wrote:
> The MAX9296A deserializer converts single or dual serial inputs to MIPI
> CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
> in the forward direction and 187.5Mbps in the reverse direction.
> In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
> GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
> GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
> GMSL1 links. The serial inputs operate independently, allowing videos
> with different timings and resolutions to be received on each input.

C-PHY or D-PHY? I'd assume the latter?

> 
> MAX96716A supports both tunnel and pixel mode.
> MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/media/i2c/maxim,max9296a.yaml    | 242 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> new file mode 100644
> index 0000000000000..4f2b3b5b69cf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> @@ -0,0 +1,242 @@
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
> +description: >
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
> +
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
> +        description: GMSL Input ports 0-1
> +
> +      '^port@[2-3]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output ports 0-1
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

With D-PHY, 2 is the minimum.

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
> +                        compatible = "maxim,max96717", "maxim,max96717f";
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
> +                        compatible = "maxim,max96717", "maxim,max96717f";
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
> index 93e22dfd61c17..0eb1729ae1647 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14783,6 +14783,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
>  F:	drivers/iio/proximity/mb1232.c
>  
> +MAXIM GMSL2/3 SERIALIZERS AND DESERIALIZERS
> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> +
>  MAXIM MAX11205 DRIVER
>  M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
>  L:	linux-iio@vger.kernel.org

-- 
Kind regards,

Sakari Ailus

