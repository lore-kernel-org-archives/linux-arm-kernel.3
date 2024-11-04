Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127FAD132B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iR/eLuJ7hqRBDR8qMgEyoLrx9OmW3jzB7EgHhAaqCPM=; b=Wh1iZeokEOzmmCsvhDbOLgSW/B
	TO7ujJ9e5s8WLwOisE3NFrIiV+BjcVgC+kQ0X/nzrxhJtijDV1ZFhoBzNFJajdznQptQnM1ahC7M9
	2MNQDRLdaTu1IbCixbmfKYNEFANXnkBk2fGyLpjXSkdvOvGS7FlzB6Ilx0nHsnk8WXKMsUThAhaeu
	iHW6Bd8iDIw+YSdi09iz3L1/BdtACL19jWqcd99WxNpTPvTO51UkrpFTrpz+Y26f2AHLoAUC5mH/w
	UFN5NNSvUdDPXaSZq9G9xTgx0LdJAcTKJ/LCTd9/EzpSDDI7snKMfs1svcR0IFv5DEvfGmKBJs4Av
	noCSAQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v1t-0000000DSQd-27bD;
	Mon, 04 Nov 2024 11:13:53 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uzQ-0000000DRmq-43nf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:11:23 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-a9a0f198d38so705717766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 03:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730718679; x=1731323479; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iR/eLuJ7hqRBDR8qMgEyoLrx9OmW3jzB7EgHhAaqCPM=;
        b=c3BQbcUW/AuD8nvz7jVIndsj6c0avvAwU1ZwjPALUIhEbMZUvM4s5tnIuxI41YYnWq
         jIskQrtxCtvbGLaQ89uts3H0t+ocWotqzXx5zQIwcfHoxC+FhWQLpzxR22+8nvlZjWU6
         JwJeoeNKRneclMqMgVdo+20oszKat3B/ohKzMK1L2OTml3QeOTNye1Ch+r9iYPpzRsL6
         vXGHLS0V5ttGd5LkYNjkxgEq7qBGnHO/cew8hGPDJaLRBNBNpK4Vxmx7KaaZ5H3ZMxTl
         HAWgRi8jcycbH7opBDh4SVxc1FbnNOSyM7K5Kt72hc/lRve7PzAaBHDnL406MV8BSi1m
         kIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718679; x=1731323479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iR/eLuJ7hqRBDR8qMgEyoLrx9OmW3jzB7EgHhAaqCPM=;
        b=ClTplr8kJCcpehwVoyqXkOR/3PB++RcsdztJfCH2AnzDmaoFAgBxbOgAAlI85riWrT
         cZkdAqKLCRFw3jyu5BUXi8tHYj0RnnG/KKODcj92Sq87xTCs2EUGf7E9SiibG7t3+2n2
         q+J9HgqdlBYIwULHWiCMwI1BuCSfM8fKs79IYJDjK7gczpTH398YqTuBOdrjQnW3YWkO
         SRRCHBKrDWmpko8hcxjmNyiiXNTCSTPHu+LYeNzdgh21u3L6Xbc36yWOJpjjh6MOn4fH
         CuDnQNnoO9gZelUBmfK+6d9k4Od1n2ESj/NqX8MYBEfJdwbe9pJEQNf3o1JY+1h/AhmC
         74qA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5FiEVu3kkXSwYTkxYsvWzi8NoX7DVKdIbQaTp3z2V5yk+bbzT0r2UZxPjTrNgyV68EZVkx4yBXpqvTfcAirz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr7cjCua4Mb5ikcMwT+k97uSuffysdU8d5WtH3HdcfhnxGkx/O
	KTY6AX3ZtB9yW46Gj4zfPnQ4YC6fA9ghhQzjn77uKDpYPQnmRBouHXYZiS2ZPMA=
X-Google-Smtp-Source: AGHT+IG5tnzS154o2gsQZG2Mb2tToZi0pE7ZGdMnxoVRw4hvBg/+92C8iupvzX1HwjwL9uMQzQiObQ==
X-Received: by 2002:a17:907:9446:b0:a99:88ab:c7cb with SMTP id a640c23a62f3a-a9e654fd997mr1068397466b.33.1730718677440;
        Mon, 04 Nov 2024 03:11:17 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56645dcbsm549642066b.177.2024.11.04.03.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:11:16 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 4 Nov 2024 12:11:42 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 02/12] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
Message-ID: <Zyir7pu8T-fjUIA4@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <9a02498e0fbc135dcbe94adc7fc2d743cf190fac.1730123575.git.andrea.porta@suse.com>
 <mjhopgkrjahaxydn3ckianqnvjn55kxrldulvjkpqivlz72uyi@57l5vhydpzc2>
 <ZyOPHm7fl_vW7mAJ@apocalypse>
 <cc2e1a17-c5b1-4608-8e32-a6dea23a7efb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc2e1a17-c5b1-4608-8e32-a6dea23a7efb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_031121_095494_282556A2 
X-CRM114-Status: GOOD (  40.11  )
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

Hi Krzysztof,

On 19:10 Thu 31 Oct     , Krzysztof Kozlowski wrote:
> On 31/10/2024 15:07, Andrea della Porta wrote:
> > Hi Krzysztof,
> > 
> > On 08:26 Tue 29 Oct     , Krzysztof Kozlowski wrote:
> >> On Mon, Oct 28, 2024 at 03:07:19PM +0100, Andrea della Porta wrote:
> >>> Add device tree bindings for the gpio/pin/mux controller that is part of
> >>> the RP1 multi function device, and relative entries in MAINTAINERS file.
> >>>
> >>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> >>> ---
> >>>  .../pinctrl/raspberrypi,rp1-gpio.yaml         | 163 ++++++++++++++++++
> >>>  MAINTAINERS                                   |   2 +
> >>>  2 files changed, 165 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >>> new file mode 100644
> >>> index 000000000000..465a53a6d84f
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >>> @@ -0,0 +1,163 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/pinctrl/raspberrypi,rp1-gpio.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: RaspberryPi RP1 GPIO/Pinconf/Pinmux Controller submodule
> >>> +
> >>> +maintainers:
> >>> +  - Andrea della Porta <andrea.porta@suse.com>
> >>> +
> >>> +description:
> >>> +  The RP1 chipset is a Multi Function Device containing, among other sub-peripherals,
> >>> +  a gpio/pinconf/mux controller whose 54 pins are grouped into 3 banks. It works also
> >>
> >> Please wrap code according to coding style (checkpatch is not a coding
> >> style description but only a tool).
> > 
> > Ack.
> > 
> >>
> >>> +  as an interrupt controller for those gpios.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: raspberrypi,rp1-gpio
> >>> +
> >>> +  reg:
> >>> +    maxItems: 3
> >>> +    description: One reg specifier for each one of the 3 pin banks.
> >>> +
> >>> +  '#gpio-cells':
> >>> +    description: The first cell is the pin number and the second cell is used
> >>> +      to specify the flags (see include/dt-bindings/gpio/gpio.h).
> >>> +    const: 2
> >>> +
> >>> +  gpio-controller: true
> >>> +
> >>> +  gpio-ranges:
> >>> +    maxItems: 1
> >>> +
> >>> +  gpio-line-names:
> >>> +    maxItems: 54
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 3
> >>> +    description: One interrupt specifier for each one of the 3 pin banks.
> >>> +
> >>> +  '#interrupt-cells':
> >>> +    description:
> >>> +      Specifies the Bank number [0, 1, 2] and Flags as defined in
> >>> +      include/dt-bindings/interrupt-controller/irq.h.
> >>> +    const: 2
> >>> +
> >>> +  interrupt-controller: true
> >>> +
> >>> +additionalProperties:
> >>
> >> Not much improved. You are supposed to have here pattern, just like
> >> other bindings. I asked for this last time.
> >>
> >> And there are examples using it - almost all or most of pinctrl
> >> bindings, including bindings having subnodes (but you do not use such
> >> case here).
> > 
> > This is the same approach used in [1], which seems quite recent. I did't
> 
> 2021, so not that recent, but you are right that it's not the example I
> would recommend. See rather:
> git grep pins -- Documentation/devicetree/bindings/pinctrl/ | grep '\$'
> 
> 
> pins, groups, states, etc.

Perfect. Thanks for the example suggestion.

> 
> > use pattern because I wouldn't really want to enforce a particular naming
> > scheme. Subnodes are used, please see below. Since pinctrl.yaml explicitly
> 
> But we want to enforce, because it brings uniformity and matches
> partially generic naming patterns.

Ack.

> 
> > says that there is no common binding but each device has its own, I
> > thought that was reasonable choice. Should I enforce some common pattern,
> > then?
> 
> Yes, you should. Again, look at other bindings, e.g. qcom tlmm or lpass lpi.

Ok.

> 
> > 
> >>
> >>> +  anyOf:
> >>> +    - type: object
> >>> +      additionalProperties: false
> >>> +      allOf:
> >>> +        - $ref: pincfg-node.yaml#
> >>> +        - $ref: pinmux-node.yaml#
> >>> +
> >>> +      description:
> >>> +        Pin controller client devices use pin configuration subnodes (children
> >>> +        and grandchildren) for desired pin configuration.
> >>> +        Client device subnodes use below standard properties.
> >>> +
> >>> +      properties:
> >>> +        pins:
> >>> +          description:
> >>> +            A string (or list of strings) adhering to the pattern 'gpio[0-5][0-9]'
> >>> +        function: true
> >>> +        bias-disable: true
> >>> +        bias-pull-down: true
> >>> +        bias-pull-up: true
> >>> +        slew-rate:
> >>> +          description: 0 is slow slew rate, 1 is fast slew rate
> >>> +          enum: [ 0, 1 ]
> >>> +        drive-strength:
> >>> +          enum: [ 2, 4, 8, 12 ]
> >>> +
> >>> +    - type: object
> >>> +      additionalProperties:
> >>> +        $ref: "#/additionalProperties/anyOf/0"
> >>
> >> Your example does not use any subnodes, so this looks not needed.
> > 
> > The example has subnodes, as in the following excerpt from the example:
> 
> I meant, you do not need properties in subnodes (1st level). You only
> want properties in subnodes of subnodes, so 2nd level. What is the point
> of allowing them in 1st level?

I will add those two sub-nodes to the example:

            rp1-i2s0-default-state {
                function = "i2s0";
                pins = "gpio18", "gpio19", "gpio20", "gpio21";
                bias-disable;
            };

            rp1-uart0-default-state {
                txd-pins {
                    function = "uart0";
                    pins = "gpio14";
                    bias-disable;
                };

                rxd-pins {
                    function = "uart0";
                    pins = "gpio15";
                    bias-pull-up;
                };
            };

The first is just a group of pins with the same settings, the second is 
a pin group with different settings per pin. This is basically the same
usage as in qcom,sm4250-lpass-lpi-pinctrl.yaml.

Many thanks,
Andrea

 
> 
> 
> 
> Best regards,
> Krzysztof
> 

