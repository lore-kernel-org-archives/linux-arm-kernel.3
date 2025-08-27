Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2C9CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjkSzRyl1g9cs5mTFMFSZLWz4lR/ELoXhIHKRJbEmxI=; b=sDGUzuHWu/3i0P05P4jZ2yEQM+
	FfMVUBmmyoyCkrsbJwZKDlwvGcFCAPclYC9ZrXPSKI7oDPBpqF6OLl8Z2lnpBxycMazVXLVIDlfea
	QnJEHfLtU1tY5SbRJTMNrVWg9gPwna9aFIss/NZFyt7GROodzCuT1hXSzQSbKWEC9FC1F401cl0kH
	SkftOxMSiclJW5S0VFRTWo2iN2QYYP4rxSjZGvDhP/aabM/M+3D64vzGdqDCJT2yTvhEaFqbijV17
	juC3d8fBUVR+MIy8tMbb/kg+uZEAuyNDJlx8JEHHyRyKj21tawxO4JkU2iP5kvsC+ojrL+fObxO+h
	YUImiO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE0K-0000000FAti-05Lg;
	Wed, 27 Aug 2025 11:07:48 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCsz-0000000Ewfl-1IqV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 09:56:10 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-afe6fe7c89bso122100366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756288567; x=1756893367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sjkSzRyl1g9cs5mTFMFSZLWz4lR/ELoXhIHKRJbEmxI=;
        b=GQJJWLTIPGNdeArNi724bCLS/DJ2/c3Wee11a46X3yBtx20mfP+iwXDH9d391PfSeA
         gh/3aKQ5wth5wZdIg59NIc3LO3YPN6oXgf2kmsKxFZuh8EcCqarlZoH4dj2FHZNpz9nJ
         tpl0vWzhpVnQHjTyQQZiBJInCulIhx/v5g/NoPr8VyTY75pEEf3pYrQjNtDtNhZEHDxD
         5IlszRLQf/jpJAWdgMfpBYgk0b5NPn1tDhO4X9bXy+1Q1oYgpVVz3yiM2ZTomWFQm+Gs
         qNiog3NrxItL+xbxhLLJoaWaAYMsXfv3x99UU7kPFYqnRaO34eZGoFB1zkP61hIS5soe
         zkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756288567; x=1756893367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjkSzRyl1g9cs5mTFMFSZLWz4lR/ELoXhIHKRJbEmxI=;
        b=k65/EhskWZvpJ+uO6+wZlXpYSBlLwqk4JWIKvHpkLFIVKUg/tgEAtaoaO4KJdTexRS
         fpR4wAVA3SxQrfVRxeuk/cl+ErQlkpGpzVHKFHwLz6KNSX7Xwpxw3g3rwQYlrozD14nu
         Oj8AIiIkZEoUbRwUfKcrEXOMMOP3TJ0hNan5PffutU6ciSjJ3GcFFNlig3eTjc0rKHZK
         qacHp7j2yrjd3CLXxT1GPxCWKgL2k05MyjD30NrVmGVCh+v0vtzdLccF5RVsIyCLx2nO
         TklIyzB/uMjF8uCOvrnKLzvyhSy13ky3I85CXDOV7IZqUVjrs9rIzix2iXwbiNFYCuRj
         M6LA==
X-Forwarded-Encrypted: i=1; AJvYcCVXTXTNhfUfjLiI8eXaIPKUSLyP6ln/8GXfkXGU0L9jBdUrM/wom+Sti0ubMEb9an+TAwwremBgIWkuR7saGoRS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyciib52TLqhhmdOJYnFzdo4wHnrhNV5xJLt5mj7lD3ZSzfvFfn
	dFjEIdLpWZOhG/j2IdBsTVZSgDSy+jPDVft4nK8+HBRKfJOlNJRgcil0U+GBQaPPwvE=
X-Gm-Gg: ASbGncubTn9vMSZMhgM2S13sKtyhbisiZAJvM7v/TZZhy2mIfBAGnD5HqO0UMLEsHKz
	hMm3+mMiYIXnckERUI6MICl8P53MfT+O6VU+vXLLq8tcMSqm9SITi2uQxBA9PrjjNc9CncswnP3
	8sSlitY6jd2L/VddlUHvLomCyYLM+wHo56iPpI5p1GOdX3bHIyoxMgbbXnjCS4j5ORhuImpAgyb
	Rh5yAgsrL6g06pTNYIGmjsMAxgmt63MLnwJ87E+xuXyJCf0/YgWlBQGu9QNq7mgXNnZZlLUayX5
	Zm96AIHAeTs7vJzAjKQBqdACAlYshBQCEqoHsRO7gazeC9ZwsHCFm6hxt1+xdsVgxlOKgCFwpKD
	8+Qe93Ik8brwW1gK2lBBwba0Z+Mfko+rUaQvCmhz1618H9OFwjCCcY07HzKq56taKfgSWj0Phfp
	z6pxU/cGXjUEPOmHxH
X-Google-Smtp-Source: AGHT+IH2BAIHZjtkFkG74TGOjFzT/IYNS5G2LQt+C3kivswZI0B2A0fV9PMQ7gyzkhXRRDI2psHzvg==
X-Received: by 2002:a17:907:3d12:b0:afe:94cd:111a with SMTP id a640c23a62f3a-afeafec9ccemr423517966b.7.1756288566993;
        Wed, 27 Aug 2025 02:56:06 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe89bd7acesm555423866b.73.2025.08.27.02.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 02:56:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 27 Aug 2025 11:58:00 +0200
To: Rob Herring <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Broadcom
 STB pin controller
Message-ID: <aK7WqA7OP1h-rpJ6@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <6fdbaf2bd0b72badbb5384e43b97bebcda4cc2f0.1754922935.git.andrea.porta@suse.com>
 <20250818172040.GA1483013-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818172040.GA1483013-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_025609_354727_83827C13 
X-CRM114-Status: GOOD (  32.45  )
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

Hi Rob,

On 12:20 Mon 18 Aug     , Rob Herring wrote:
> On Mon, Aug 11, 2025 at 04:46:51PM +0200, Andrea della Porta wrote:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > The STB pin controller represents a family whose silicon instances
> > are found e.g. on BCM2712 SoC.
> > 
> > In particular, on RaspberryPi 5, there are two separate instantiations
> > of the same IP block which differ in the number of pins that are
> > associated and the pinmux functions for each of those pins. The
> > -aon- variant stands for 'Always On'.
> > 
> > Depending on the revision of the BCM2712 (CO or D0), the pin
> > controller instance has slight differences in the register layout.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 135 ++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..28d66336aa2e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> > @@ -0,0 +1,135 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2712c0-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom STB family pin controller
> > +
> > +maintainers:
> > +  - Ivan T. Ivanov <iivanov@suse.de>
> > +  - A. della Porta <andrea.porta@suse.com>
> 
> Why is your first name abbrievated here?

The heuristic inside get_maintainer.pl does not correctly recognize names like
"Andrea della Porta", reporting something like:

della Porta <andrea.porta@suse.com>

and missing both the first name and the double quotes surrounding the
name/surname pair.
Something like "Andrea d. Porta" would be reported correctly but it's not an
option in my case since 'della' is not a middle name that can abbreviated,
it's just integral part of the surname.
The easy workaround I've found (the hard one being fixing get_maintainer.pl
script, of course, but I'm not a Perl guru) is to just let the name be
abbreviated.

> 
> > +
> > +description:
> > +  Broadcom's STB family of memory-mapped pin controllers.
> > +  This includes the pin controllers inside the BCM2712 SoC which
> > +  are instances of the STB family and has two silicon variants,
> > +  C0 and D0, which differs slightly in terms of registers layout.
> > +  The -aon- (Always On) variant is the same IP block but differs
> > +  in the number of pins that are associated and the pinmux functions
> > +  for each of those pins.
> 
> Wrap lines at 80. If there are paragraphs, then blank line in between 
> and use the '>' modifier.

I'm not seeing any lines exceeding 80 chars here. Ack for the
blank lines between paragraphs plus >.

> 
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - brcm,bcm2712c0-pinctrl
> > +      - brcm,bcm2712c0-aon-pinctrl
> > +      - brcm,bcm2712d0-pinctrl
> > +      - brcm,bcm2712d0-aon-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  '-state$':
> > +    oneOf:
> > +      - $ref: '#/$defs/brcmstb-pinctrl-state'
> > +      - patternProperties:
> > +          '-pins$':
> > +            $ref: '#/$defs/brcmstb-pinctrl-state'
> > +        additionalProperties: false
> > +
> > +$defs:
> > +  brcmstb-pinctrl-state:
> > +    allOf:
> > +      - $ref: pincfg-node.yaml#
> > +      - $ref: pinmux-node.yaml#
> > +
> > +    description:
> > +      Pin controller client devices use pin configuration subnodes (children
> > +      and grandchildren) for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> 
> Paragraphs here?

Ack.

> 
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this
> > +          subnode (either this or "groups" must be specified).
> > +        items:
> > +          pattern: '^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$'
> > +
> > +      function:
> > +        enum: [ gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
> > +                aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
> > +                arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
> > +                bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
> > +                ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
> > +                hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
> > +                ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
> > +                sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
> > +                sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
> > +                te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
> > +                vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
> > +                vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
> > +                vc_uart4 ]
> > +
> > +        description:
> > +          Specify the alternative function to be configured for the specified
> > +          pins.
> 
> Be consistent with putting 'description' first or last.

Ack.

Many thanks,
Andrea

> 
> > +
> > +      bias-disable: true
> > +      bias-pull-down: true
> > +      bias-pull-up: true
> > +
> > +    required:
> > +      - pins
> > +
> > +    if:
> > +      properties:
> > +        pins:
> > +          not:
> > +            contains:
> > +              pattern: "^emmc_(clk|cmd|dat[0-7]|ds)$"
> > +    then:
> > +      required:
> > +        - function
> > +    else:
> > +      properties:
> > +        function: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    brcm_pinctrl: pinctrl@7d504100 {
> > +        compatible = "brcm,bcm2712c0-pinctrl";
> > +        reg = <0x7d504100 0x30>;
> > +
> > +        bt-shutdown-default-state {
> > +           function = "gpio";
> > +           pins = "gpio29";
> > +        };
> > +
> > +        uarta-default-state {
> > +            rts-tx-pins {
> > +                function = "uart0";
> > +                pins = "gpio24", "gpio26";
> > +                bias-disable;
> > +            };
> > +
> > +            cts-rx-pins {
> > +                function = "uart0";
> > +                pins = "gpio25", "gpio27";
> > +                bias-pull-up;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.35.3
> > 

