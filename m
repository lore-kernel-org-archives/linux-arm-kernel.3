Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA59EC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 18:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7e5kgtc2YZSO5D03srWrdyaym5Iq/tfMaY+RIMQ8Ask=; b=yh9ry8XBuSq4m5zFYBEnp8oXWc
	uLlyjZepK5LayvUCewFunAYqmByWJKcCJGb7mw03seORNBJU7f19HL1Krch7ZhV9XGkqdzT5Iv7CM
	rK8drzVqKuVk5crj5PSe5jop1MPXyVyRSdCufdp63Z3qDvixI9v3+AhVJbw6T2QrNM/+yvMrdfZZV
	VO7o0xVAWfbXFROtL/uiywii8mAfypBLuQc3v6ykFU2UClqlkM3EftkXOfQ909voRPKrIv3WurHbf
	sU5xDzXjeq24ndnZ1noi5VIVvXTpgQlMyD3kk2UR2Wifw1naQc5JHW181LWPWVAKY8sBFgQNwYLwh
	p2fU/iGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknZ4-000000032mc-23Jo;
	Fri, 17 Jul 2026 18:45:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknZ3-000000032mN-2oi2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 18:45:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CC0943FEB;
	Fri, 17 Jul 2026 18:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D1B1F00A3A;
	Fri, 17 Jul 2026 18:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784313937;
	bh=7e5kgtc2YZSO5D03srWrdyaym5Iq/tfMaY+RIMQ8Ask=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B1fKXYJh2h7Ct2/5ML0oO16NwxLPg/4YRE4YHOue1OIZylWuNWnUszWCEoEOaAXoP
	 4HlIqSo5hETN9YBZY48ZcnmuXi5WVyQrJp7jFO+tL7UAmpw/i4mFysLaQXsW8zif1x
	 +RqtsbyH5fy9gDDKfVDNokAXATV+aMfYebYpIkZ7XXKawQ1AXjmmF3jRniGLIs3cOf
	 vf8Ybp/wUvDhMxANd9b42G9fuLAjLXd+fxy4N9PQBcvZR5uGRGkVTe7CnUbCo8ZgT+
	 xoqv+kcYqWru71TvPJPdAJEi6TK12MO/1+2nD0MLv7FRpF4cgufm6hQbSDH1ChnnHF
	 Pc/KIgt9oxttg==
Date: Fri, 17 Jul 2026 13:45:36 -0500
From: Rob Herring <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/4] dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as
 child node
Message-ID: <20260717184536.GA1805255-robh@kernel.org>
References: <20260708-arm_dts_ldb-v1-0-4f5579b85797@nxp.com>
 <20260708-arm_dts_ldb-v1-2-4f5579b85797@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-arm_dts_ldb-v1-2-4f5579b85797@nxp.com>
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

On Wed, Jul 08, 2026 at 04:29:03PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The legacy i.MX6SX (>15 year) SoC imx-iomuxc-gpr contains one LDB_CTRL
> register. Allow the LVDS Display Bridge(LDB) child node under
> imx-iomuxc-gpr.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> index 721a67e84c137..c3b942bbcd6da 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> @@ -47,10 +47,21 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    mux-controller:
>      type: object
>      $ref: /schemas/mux/reg-mux.yaml
>  
> +  bridge@18:
> +    type: object
> +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +    unevaluatedProperties: false
> +
>  patternProperties:
>    "^ipu[12]_csi[01]_mux$":
>      type: object
> @@ -67,6 +78,18 @@ allOf:
>        patternProperties:
>          '^ipu[12]_csi[01]_mux$': false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: fsl,imx6sx-iomuxc-gpr
> +    then:
> +      properties:
> +        bridge@18: false
> +        '#address-cells': false
> +        '#size-cells': false
> +
>  additionalProperties: false
>  
>  required:
> @@ -87,4 +110,40 @@ examples:
>          };
>      };
>  
> +  - |
> +    #include <dt-bindings/clock/imx6sx-clock.h>
> +
> +    syscon@20e4000 {
> +        compatible = "fsl,imx6sx-iomuxc-gpr", "fsl,imx6q-iomuxc-gpr", "syscon", "simple-mfd";
> +        reg = <0x020e4000 0x4000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        bridge@18 {
> +            compatible = "fsl,imx6sx-ldb";
> +            reg = <0x18 0x4>;
> +            clocks = <&clks IMX6SX_CLK_LDB_DI0>;
> +            clock-names = "ldb";
> +            status = "disabled";

Examples should be enabled. Drop.

> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    endpoint {
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    endpoint {
> +                    };
> +                };
> +            };
> +        };
> +    };
>  ...
> 
> -- 
> 2.43.0
> 

