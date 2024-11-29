Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227B6D729EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqZrAfjye64ZhMw5Co4hhbixNEOQJOzDdw3eUKG3fbQ=; b=g7IOFm3Zbw6w/om14AgupwaOY8
	PcpGs8Uu0+a8rDIzaPwi8H5yGSXMiw1DWU00cs6+vuIVqnxY5mmIGblDdQ8ZLdFR2FlATjCt8x1xQ
	ubYGhClDhpQIqirRELi2JkS4qfs6gEolvg67uFZrn+udaVwKIBuQUcufr1t6dfDE0aasrxHTOxhx3
	VKDgrIRHhrcu0NGcPFsHDQ0qUM0b0iSKTuyU3vFDXA9y0FP8MX1XMwq5moc+y3SRF2mrMMBTdV/ex
	A4PR3IXRahJdxkOQ/cEr4Vp32qnQmHBWyEFAaIE2EDe2EjQs3Co7F5ct3E4lVm3vM5F/M2sYgRTG6
	1KaDudwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH59R-00000000jXq-0Lwj;
	Fri, 29 Nov 2024 17:51:33 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH58Q-00000000jPA-2aw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 17:50:33 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-aa531a70416so122662566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 09:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732902628; x=1733507428; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PqZrAfjye64ZhMw5Co4hhbixNEOQJOzDdw3eUKG3fbQ=;
        b=AquOuBbVVWIQvh1hBs3aCnuXM1i4Wf7CyMmSy+9HK4QXfp4QCrp57syG3T22e0IKCr
         q3t6t1qJS4A02sVKTT9ls7dLiJlliTY13pdNOwdRBjsxBuUTij7rfmJJ292+8Ilk/PKn
         zQzgd1WoDk8mzpvcMAbwQRAwoclMelKCTLI4j6wvlJWYRshxdIld0GEO2mJOHYR6UHmD
         iF0a9Kf0Ey0tLYmg0zTCGNWR9FAwD5blLy7yZ8q2iqs0+aZ1K9UALBbnddaUkq/tgcSw
         gnR+JN7DvS6VeoVVA4Wd7xSzxVdgjLMDTlOimrTwwgKCHY7gNSIMQvRA/61R/oYC0mO6
         Wg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732902628; x=1733507428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqZrAfjye64ZhMw5Co4hhbixNEOQJOzDdw3eUKG3fbQ=;
        b=eQpM5nSAcL+4XYN9tk1Pn8odMuYRIC3u8nOejmdioNfxC8ANK2KLaSkerbAjBoQeBa
         Mh2NuzAUYeQZTpkD1CvBoNNn+18YHX3raozbd4d436yRX9ZDyQnanSyY1fXZx8KLWKqZ
         reSrnAdPQbhEhZ/D1tP+cuzbOImUBPBQdoTkEbCqwXSeJVCW8Fa/g0m/8f815FtZxsqb
         XT9W37BgMeZh1D39uuMpY6GCnCxaIvjioL/uz1qgMn+glDzbL/H3q3JjdWNdh0ZJtOUI
         c8X8bMZ7MIScX4l4VYrO0up1/VU3qmBqky8Zxoh3bkgDY9JHz05OWuRm0ePIf0e94OGa
         qxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0zXlbP+hxgPPrUQzSqPtfWHgneWd0FqqUv7FR8O5TE0GVApoXuSHyuYStriJEifNTIdbwzbgexcIT0Wh9xhZm@lists.infradead.org
X-Gm-Message-State: AOJu0YyN24q+QGbOsJnWX/FB3rIjoRAErZd/ZLJdPQEtF9+TEvyZHR0i
	2OAGm+bf6V3/a7bTFIzmqG3Z26B92nwdUXXpEoIdEGcSUruUfAsA+xJpud681Dc=
X-Gm-Gg: ASbGncuD5dDjmHGiVp6ufLcCr836MjontkH0zHQXNytKmRjNtiXaUHAHGMtNpy+s/Xc
	VNBVi3XaFh/BdNEfvxi4ahhLTfKvxb6LTf+NFfEpPlzh9cWSQqXOzHMmO4P6WZt6YmGhqP+tyCE
	E2MTFywyPL+4i7K1lllB6CYZpr/oIYjSInYXACl6qNTfDwNAsQC4l/7nJTCJ5aQK+30bpMy0JtD
	9NmKU+PmIQ32pDG8bVo6ZrGKShUs60OG7/nFgkFnUKKUPUatYbi0ijcy6MIrnVd20DaF/yoYZGW
	XFSHVP+BP38kNhOu8XC8
X-Google-Smtp-Source: AGHT+IF7i5rs2I/Z8Do8qBVzOITzII4lxVZ5lVsk4D6hBN3DGyS3RbzWkQK53YgfV1EgQ7zK28Pzig==
X-Received: by 2002:a05:6402:13d3:b0:5d0:224b:d4c1 with SMTP id 4fb4d7f45d1cf-5d080c53c5dmr12990539a12.25.1732902627665;
        Fri, 29 Nov 2024 09:50:27 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b264f0d2sm996856a12.72.2024.11.29.09.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 09:50:27 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Nov 2024 18:51:00 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
Message-ID: <Z0n_BA8ZRU3ghE7Z@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <9b83c5ee8345e4fe26e942f343305fdddc01c59f.1732444746.git.andrea.porta@suse.com>
 <e0595933-d503-492d-ae29-aa3afe90b279@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0595933-d503-492d-ae29-aa3afe90b279@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_095030_662729_AB5406E1 
X-CRM114-Status: GOOD (  28.15  )
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

Hi Stephan,

On 19:12 Mon 25 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 24.11.24 um 11:51 schrieb Andrea della Porta:
> > Add device tree bindings for the gpio/pin/mux controller that is part of
> > the RP1 multi function device, and relative entries in MAINTAINERS file.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   .../pinctrl/raspberrypi,rp1-gpio.yaml         | 193 ++++++++++++++++++
> >   MAINTAINERS                                   |   2 +
> >   2 files changed, 195 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > new file mode 100644
> > index 000000000000..21923d39c1bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > @@ -0,0 +1,193 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/raspberrypi,rp1-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RaspberryPi RP1 GPIO/Pinconf/Pinmux Controller submodule
> > +
> > +maintainers:
> > +  - Andrea della Porta <andrea.porta@suse.com>
> > +
> > +description:
> > +  The RP1 chipset is a Multi Function Device containing, among other
> > +  sub-peripherals, a gpio/pinconf/mux controller whose 54 pins are grouped
> > +  into 3 banks.
> > +  It works also as an interrupt controller for those gpios.
> > +
> > +properties:
> > +  compatible:
> > +    const: raspberrypi,rp1-gpio
> > +
> > +  reg:
> > +    maxItems: 3
> > +    description: One reg specifier for each one of the 3 pin banks.
> > +
> > +  '#gpio-cells':
> > +    description: The first cell is the pin number and the second cell is used
> > +      to specify the flags (see include/dt-bindings/gpio/gpio.h).
> > +    const: 2
> > +
> > +  gpio-controller: true
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  gpio-line-names:
> > +    maxItems: 54
> > +
> > +  interrupts:
> > +    maxItems: 3
> > +    description: One interrupt specifier for each one of the 3 pin banks.
> > +
> > +  '#interrupt-cells':
> > +    description:
> > +      Specifies the Bank number [0, 1, 2] and Flags as defined in
> > +      include/dt-bindings/interrupt-controller/irq.h.
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +patternProperties:
> > +  "-state$":
> > +    oneOf:
> > +      - $ref: "#/$defs/raspberrypi-rp1-state"
> > +      - patternProperties:
> > +          "-pins$":
> > +            $ref: "#/$defs/raspberrypi-rp1-state"
> > +        additionalProperties: false
> > +
> > +$defs:
> > +  raspberrypi-rp1-state:
> > +    allOf:
> > +      - $ref: pincfg-node.yaml#
> > +      - $ref: pinmux-node.yaml#
> > +
> > +    description:
> > +      Pin controller client devices use pin configuration subnodes (children
> > +      and grandchildren) for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this
> > +          subnode.
> > +        items:
> > +          pattern: "^gpio([0-9]|[1-5][0-9])$"
> > +
> > +      function:
> > +        enum: [ alt0, alt1, alt2, alt3, alt4, gpio, alt6, alt7, alt8, none,
> > +                aaud, dcd0, dpi, dsi0_te_ext, dsi1_te_ext, dsr0, dtr0, gpclk0,
> > +                gpclk1, gpclk2, gpclk3, gpclk4, gpclk5, i2c0, i2c1, i2c2, i2c3,
> > +                i2c4, i2c5, i2c6, i2s0, i2s1, i2s2, ir, mic, pcie_clkreq_n,
> > +                pio, proc_rio, pwm0, pwm1, ri0, sd0, sd1, spi0, spi1, spi2,
> > +                spi3, spi4, spi5, spi6, spi7, spi8, uart0, uart1, uart2, uart3,
> > +                uart4, uart5, vbus0, vbus1, vbus2, vbus3 ]
> > +
> > +        description:
> > +          Specify the alternative function to be configured for the specified
> > +          pins.
> > +
> > +      bias-disable: true
> > +      bias-pull-down: true
> > +      bias-pull-up: true
> > +      slew-rate:
> > +        description: 0 is slow slew rate, 1 is fast slew rate
> > +        enum: [ 0, 1 ]
> > +      drive-strength:
> > +        enum: [ 2, 4, 8, 12 ]
> according to the driver in patch 4 the following should also be
> supported by the hardware:
> 
> input-enable, input-schmitt-enable, output-enable, output-low, output-high

You are right, added.

Many thanks,
Andrea

> > +
> > +    additionalProperties: false
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - reg
> > +  - compatible
> > +  - '#gpio-cells'
> > +  - gpio-controller
> > +  - interrupts
> > +  - '#interrupt-cells'
> > +  - interrupt-controller
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    rp1 {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        rp1_gpio: pinctrl@c0400d0000 {
> > +            reg = <0xc0 0x400d0000  0x0 0xc000>,
> > +                  <0xc0 0x400e0000  0x0 0xc000>,
> > +                  <0xc0 0x400f0000  0x0 0xc000>;
> > +            compatible = "raspberrypi,rp1-gpio";
> > +            gpio-controller;
> > +            #gpio-cells = <2>;
> > +            interrupt-controller;
> > +            #interrupt-cells = <2>;
> > +            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <1 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <2 IRQ_TYPE_LEVEL_HIGH>;
> > +            gpio-line-names =
> > +                   "ID_SDA", // GPIO0
> > +                   "ID_SCL", // GPIO1
> > +                   "GPIO2", "GPIO3", "GPIO4", "GPIO5", "GPIO6",
> > +                   "GPIO7", "GPIO8", "GPIO9", "GPIO10", "GPIO11",
> > +                   "GPIO12", "GPIO13", "GPIO14", "GPIO15", "GPIO16",
> > +                   "GPIO17", "GPIO18", "GPIO19", "GPIO20", "GPIO21",
> > +                   "GPIO22", "GPIO23", "GPIO24", "GPIO25", "GPIO26",
> > +                   "GPIO27",
> > +                   "PCIE_RP1_WAKE", // GPIO28
> > +                   "FAN_TACH", // GPIO29
> > +                   "HOST_SDA", // GPIO30
> > +                   "HOST_SCL", // GPIO31
> > +                   "ETH_RST_N", // GPIO32
> > +                   "", // GPIO33
> > +                   "CD0_IO0_MICCLK", // GPIO34
> > +                   "CD0_IO0_MICDAT0", // GPIO35
> > +                   "RP1_PCIE_CLKREQ_N", // GPIO36
> > +                   "", // GPIO37
> > +                   "CD0_SDA", // GPIO38
> > +                   "CD0_SCL", // GPIO39
> > +                   "CD1_SDA", // GPIO40
> > +                   "CD1_SCL", // GPIO41
> > +                   "USB_VBUS_EN", // GPIO42
> > +                   "USB_OC_N", // GPIO43
> > +                   "RP1_STAT_LED", // GPIO44
> > +                   "FAN_PWM", // GPIO45
> > +                   "CD1_IO0_MICCLK", // GPIO46
> > +                   "2712_WAKE", // GPIO47
> > +                   "CD1_IO1_MICDAT1", // GPIO48
> > +                   "EN_MAX_USB_CUR", // GPIO49
> > +                   "", // GPIO50
> > +                   "", // GPIO51
> > +                   "", // GPIO52
> > +                   ""; // GPIO53
> > +
> > +            rp1-i2s0-default-state {
> > +                function = "i2s0";
> > +                pins = "gpio18", "gpio19", "gpio20", "gpio21";
> > +                bias-disable;
> > +            };
> > +
> > +            rp1-uart0-default-state {
> > +                txd-pins {
> > +                    function = "uart0";
> > +                    pins = "gpio14";
> > +                    bias-disable;
> > +                };
> > +
> > +                rxd-pins {
> > +                    function = "uart0";
> > +                    pins = "gpio15";
> > +                    bias-pull-up;
> > +                };
> > +            };
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 75a66e3e34c9..c55d12550246 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19384,7 +19384,9 @@ RASPBERRY PI RP1 PCI DRIVER
> >   M:	Andrea della Porta <andrea.porta@suse.com>
> >   S:	Maintained
> >   F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > +F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >   F:	include/dt-bindings/clock/rp1.h
> > +F:	include/dt-bindings/misc/rp1.h
> > 
> >   RC-CORE / LIRC FRAMEWORK
> >   M:	Sean Young <sean@mess.org>
> 

