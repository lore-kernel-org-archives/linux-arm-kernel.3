Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F74E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpcAPRrti2Mspwvvh0HkUfdkgM+x6sKmtKugtmBINFQ=; b=hgMEVeIE9l1vEHtOAHnTFrSZHH
	b3eGRIe9zDM6e+5vH5fAgn42wPpHXkH4Wnb17hVczOL84XmrvyA5Su3Og6NyZWtBP1AFniHF2ZePu
	hbNvCabeA4eZDdRTqrz9hV9EkX72r16iNcvRzp6axnB/YV44L61eROQfhqVyyYq+A1VhlmRZcyDh1
	EO6gldO6SoJI9YMsSJQuLWiiEy9Z4yJNPuM5OVLnQjuazC8VTMgMMApb/TbeYwSWp66Zkqu9Tbgtz
	ZMQD5kbE+X9vblTeMrfd4d6zmSnoLpHzKabYIDf/lz1S7wWQ99QP9Z2wuiqKL7Adn+YsZADMcuUDC
	2qt4I6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPff9-00000009n8Y-0693;
	Mon, 23 Dec 2024 10:27:47 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfdw-00000009mzx-14zs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:26:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4475327e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734949590; x=1735554390; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpcAPRrti2Mspwvvh0HkUfdkgM+x6sKmtKugtmBINFQ=;
        b=lzgFCarX3QkfsAbcX/dxESO4I2dV/RXxVxtOuOdkQCZglb5X9yoNSXkw/V9rxkGw+q
         5O7yOqDg+wsXddQa4Rwe8XMoLQY51CgPmitpqBKwYxdi/pUhekIq7W1j5sCHCyjyzjED
         wwCJe61pQ5hLMAV6oBZJwh29iJkp1pFWlRAf8bszkwd6yxYMeO9OpIGrSkK84g7R6nz9
         O9IFuY1qwpOavz6+nPPbOHdt1ypQZAzOV6jj6Vg5XZYFBbww+EwEASCYONQCXQ2hjaof
         Sv6Yk/zwOAmX+bPGQasuu1WwtABgYDz7o/xgCJCDSrkYXc5AUAk/E+U/tYID/U9p89u3
         iyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734949590; x=1735554390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpcAPRrti2Mspwvvh0HkUfdkgM+x6sKmtKugtmBINFQ=;
        b=gUlFMJEU2lFmtTlCzkvqSmZ4Omr3iSxZ1gpJWhB+4jGlLD8YdtHuLPNaMsPI5ejhof
         ps819pIDeGGjYaGzNjONKsI34Jf/b0zW/gGFGRFF0XFupA5hHWhS335KV5nLC1SM6nZP
         DdYatg6OkPfunjQeYKaav55W+iieXeNznasvd3e33XFNE52dK7eJlf+FHTCxOFT1/q4w
         HsMbCUxukIu5ffbwedKFO1WuwE1RdypMPEk0R+bIxEd5qFDSN8nZ5gZAfg8LKb4XBHK4
         QHoUyYM0OTP9hI+tpuPgUImcYJkSs0J9acTecn0wXj93gtVShq8cfWVEVSmnwalVi9go
         x4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW+OwKjA2HjMFmFN5z84sakrEMC8iGKVrxyMO90Y0ICMN2TBxfeK9cz7MYBdf1fi6WG7Idl6L273H99VtxHAFx@lists.infradead.org
X-Gm-Message-State: AOJu0YyromkiQ6ohnsP5hpq3c0ZxBwGjV7UYSu2lLB40Ow3Bj3CGb2xv
	10AGM/tph9eGGGWlm/osEozFWcF/E7d7KEdmEgxtMgquK/HvdFhwL/Q4gaJLpQI=
X-Gm-Gg: ASbGncsNfA+poviGEh0AncG+N/wgA8kGmHIquUKeTXBmFj7EBPti7zFgXzzQ/YGhPev
	Xnv133HXrKZDMBgxkVSVVoFMFRNJCFACBKBk1WwXKz5PQQgqOAFjz0gkiEhB3MJzadklsbbrIuO
	U4G8bPoKrI7VkRTRc3XIz6G4o4+1rMxj5u7QcxwqRwhsjrFnU6Ygn1yaHVoxRaY81mcVQsVi/3H
	HGtl53Uqm/VVtFyJ7PE41tmpcP44OZiBF9CoWMY73sZxG4ak3M8fdWczPsBNeSaQpJ8zxYUpxof
	c7D3hL33PtOCm1EBbStBSy8U4W9mHdBTvR3z
X-Google-Smtp-Source: AGHT+IFbBpruzFpAgIIU0n0/jwU07GmTaDXBwkrAj3El2zSPjw4bqzUyTtJuARVLHLA0cBnGaJX8lw==
X-Received: by 2002:a05:6512:1044:b0:542:218a:71a with SMTP id 2adb3069b0e04-5422953ac6bmr3140370e87.26.1734949589912;
        Mon, 23 Dec 2024 02:26:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5efbsm1241435e87.39.2024.12.23.02.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:26:29 -0800 (PST)
Date: Mon, 23 Dec 2024 12:26:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
	u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Message-ID: <kpem2w4wu7ywc5pvbk3ls5hsyttrwcylomzfh567ejlxkymeqd@cujrbfxgrntc>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-4-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-4-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_022632_311212_12188B9B 
X-CRM114-Status: GOOD (  18.56  )
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

On Mon, Dec 23, 2024 at 02:41:31PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing units
> that operate in a display clock domain.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Drop DT alias documentations and add instance numbers to compatible strings.
>   (Rob)
> 
> v6:
> * No change.
> 
> v5:
> * Document aliases.  Drop Rob's previous R-b tag. (Maxime)
> 
> v4:
> * Collect Rob's R-b tag.
> 
> v3:
> * No change.
> 
> v2:
> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> * Drop port property. (Krzysztof)
> * Fix register range sizes in example.
> 
>  .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++++++++++++
>  1 file changed, 235 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> new file mode 100644
> index 000000000000..60d1e0a4a5dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> @@ -0,0 +1,235 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qxp Display Controller Display Engine
> +
> +description:
> +  All Processing Units that operate in a display clock domain. Pixel pipeline
> +  is driven by a video timing and cannot be stalled. Implements all display
> +  specific processing.
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-dc-display-engine0
> +      - fsl,imx8qxp-dc-display-engine1

Is there actual difference between engines 0 and 1? If there is none,
why are you artificially adding one here?

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: cfg
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: shdload
> +      - const: framecomplete
> +      - const: seqcomplete
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^dither@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-dither0
> +          - fsl,imx8qxp-dc-dither1
> +
> +  "^framegen@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-framegen0
> +          - fsl,imx8qxp-dc-framegen1
> +
> +  "^gammacor@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-gammacor0
> +          - fsl,imx8qxp-dc-gammacor1
> +
> +  "^matrix@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-matrix0
> +          - fsl,imx8qxp-dc-matrix1
> +
> +  "^signature@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-signature0
> +          - fsl,imx8qxp-dc-signature1
> +
> +  "^tcon@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-tcon0
> +          - fsl,imx8qxp-dc-tcon1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-dc-display-engine0
> +    then:
> +      patternProperties:
> +        "^dither@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-dither0
> +
> +        "^framegen@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-framegen0
> +
> +        "^gammacor@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-gammacor0
> +
> +        "^matrix@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-matrix0
> +
> +        "^signature@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-signature0
> +
> +        "^tcon@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-tcon0
> +    else:
> +      patternProperties:
> +        "^dither@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-dither1
> +
> +        "^framegen@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-framegen1
> +
> +        "^gammacor@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-gammacor1
> +
> +        "^matrix@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-matrix1
> +
> +        "^signature@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-signature1
> +
> +        "^tcon@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-tcon1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    display-engine@5618b400 {
> +        compatible = "fsl,imx8qxp-dc-display-engine0";
> +        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
> +        reg-names = "top", "cfg";
> +        interrupt-parent = <&dc0_intc>;
> +        interrupts = <15>, <16>, <17>;
> +        interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        framegen@5618b800 {
> +            compatible = "fsl,imx8qxp-dc-framegen0";
> +            reg = <0x5618b800 0x98>;
> +            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
> +            interrupt-parent = <&dc0_intc>;
> +            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
> +            interrupt-names = "int0", "int1", "int2", "int3",
> +                              "primsync_on", "primsync_off",
> +                              "secsync_on", "secsync_off";
> +        };
> +
> +        tcon@5618c800 {
> +            compatible = "fsl,imx8qxp-dc-tcon0";
> +            reg = <0x5618c800 0x588>;
> +
> +            port {
> +                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

