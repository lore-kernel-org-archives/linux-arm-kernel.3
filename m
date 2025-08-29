Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9BDCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrFCpCv3d5Fnz7+0IcCealDSnEk0Cu7CBr9MUduf1ls=; b=usY76okDeGd/Q+nqfqHdwObCha
	kQA/CrBFmOubL7049CO0s6bpQsPphKmO9A4x4BkemQblY1HxaSydLwJelDh+lIAQZjQVVnoEidotZ
	bdKUyczxRtAT+Y+ESAd4D7PfOdw97kftByEIdFn36SP0Gp3yW5YeMfenOqS1+O8FE44kg9RF0TWKO
	1NR3fN0FoDtVVjhPDOeCiKLBygbLN2rYtq5tjR0AtEnh/rpPjYBcTipuEuim+O1bwr73+yROYCTbU
	xA53BkECZ6g1PlujlxlpWAuKUvQQYHJopySegAr/APz3CLz88O9SSvJiucIeV3Npd26JubkKnZO8c
	v0Y8WjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9m3-00000007AzF-0lbi;
	Sat, 30 Aug 2025 00:48:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3OJ-00000006av5-1kuc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 18:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 262B841966;
	Fri, 29 Aug 2025 17:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9721C4CEF0;
	Fri, 29 Aug 2025 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756490399;
	bh=+h1tJAQ+dSMq7fdj/8N37DlbXKEJmc4JNq48M9PFtwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlABTpoBtGyhka7GIXWU6daQrCTsFWd3E3VBykCMvye0lE9ztaFdUKmPW3oEeurQr
	 TKlIcXZHPE1txSTj6bb4czIy2HPGz+S7I1vSWOdEhbe55pk/IeZQIU528q15IGLVSN
	 FLWFBRJ1IKvpUbBsg7tMtLaGDrlLNVvbS4QZS2ooVmdmNvC6HXgO5Es1Jis4lTs2uJ
	 iObyuQcZUuoOtm7X5uERgNzoMnxTFip4TAbwV4p5FGZhg5WUCrHP7GHnKcxZPmSz25
	 SELMCFjD/kLzI4W+m0X6c5P1+ofqJm9QLwXt9JcgwswKWuovq/M6j1NH8tHRCpsMFh
	 yK1ExmeBSkEIg==
Date: Fri, 29 Aug 2025 12:59:57 -0500
From: Rob Herring <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linus.walleij@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom
 STB pin controller
Message-ID: <20250829175957.GA1073350-robh@kernel.org>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_105959_504330_2D608E27 
X-CRM114-Status: GOOD (  23.03  )
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

On Thu, Aug 28, 2025 at 02:47:38PM +0200, Andrea della Porta wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> The STB pin controller represents a family whose silicon instances
> are found e.g. on BCM2712 SoC.
> 
> In particular, on RaspberryPi 5, there are two separate instantiations
> of the same IP block which differ in the number of pins that are
> associated and the pinmux functions for each of those pins. The
> -aon- variant stands for 'Always On'.
> 
> Depending on the revision of the BCM2712 (CO or D0), the pin
> controller instance has slight differences in the register layout.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> new file mode 100644
> index 000000000000..1e5d5234ee8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2712c0-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom STB family pin controller
> +
> +maintainers:
> +  - Ivan T. Ivanov <iivanov@suse.de>
> +  - A. della Porta <andrea.porta@suse.com>
> +
> +description: >
> +  Broadcom's STB family of memory-mapped pin controllers.
> +
> +  This includes the pin controllers inside the BCM2712 SoC which
> +  are instances of the STB family and has two silicon variants,
> +  C0 and D0, which differs slightly in terms of registers layout.
> +
> +  The -aon- (Always On) variant is the same IP block but differs
> +  in the number of pins that are associated and the pinmux functions
> +  for each of those pins.
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm2712c0-pinctrl
> +      - brcm,bcm2712c0-aon-pinctrl
> +      - brcm,bcm2712d0-pinctrl
> +      - brcm,bcm2712d0-aon-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-state$':
> +    oneOf:
> +      - $ref: '#/$defs/brcmstb-pinctrl-state'
> +      - patternProperties:
> +          '-pins$':
> +            $ref: '#/$defs/brcmstb-pinctrl-state'
> +        additionalProperties: false
> +
> +$defs:
> +  brcmstb-pinctrl-state:
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +
> +    description: >
> +      Pin controller client devices use pin configuration subnodes (children
> +      and grandchildren) for desired pin configuration.
> +
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode (either this or "groups" must be specified).
> +        items:
> +          pattern: '^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$'
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
> +                aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
> +                arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
> +                bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
> +                ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
> +                hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
> +                ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
> +                sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
> +                sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
> +                te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
> +                vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
> +                vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
> +                vc_uart4 ]
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +
> +    required:
> +      - pins
> +
> +    if:
> +      properties:
> +        pins:
> +          not:
> +            contains:
> +              pattern: "^emmc_(clk|cmd|dat[0-7]|ds)$"
> +    then:
> +      required:
> +        - function
> +    else:
> +      properties:
> +        function: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    brcm_pinctrl: pinctrl@7d504100 {

Drop unused label.

> +        compatible = "brcm,bcm2712c0-pinctrl";
> +        reg = <0x7d504100 0x30>;
> +
> +        bt-shutdown-default-state {
> +           function = "gpio";
> +           pins = "gpio29";

Wrong indentation. With those fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +        };
> +
> +        uarta-default-state {
> +            rts-tx-pins {
> +                function = "uart0";
> +                pins = "gpio24", "gpio26";
> +                bias-disable;
> +            };
> +
> +            cts-rx-pins {
> +                function = "uart0";
> +                pins = "gpio25", "gpio27";
> +                bias-pull-up;
> +            };
> +        };
> +    };
> -- 
> 2.35.3
> 

