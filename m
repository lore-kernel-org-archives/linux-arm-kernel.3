Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88172D767CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEGfHgtlfX7KJ8goCZZIWVQ2MO0hMqzb+0kc1/rtAds=; b=I4FyQbFHscq/T4gzwuru5wQyJC
	9jWgKvvJaJXsj/Wrk3g4zkXcUozDDZQcBUd2V1rujyvG7NwxVQ3DU79iytfuhjoMsb23Lxc6WCAyc
	AA8TwJlqSLYIuqRIIMfMRaXUdZJpcSG6yGBi6Gws6g7VAZpOCzzGSYuTG93DvNevDsQbgdtWCXo5S
	8OiG9dfBizmFw36170NWAqtJBQCkEJXGcrUh+IpO0dV0nEF/qDKKoCOCbKkzidyI9OFnlTjln94nz
	ko2J26SqbM4XuoSH4o5EbsSGtvX6HaGTtH7pbLPlkDhDmTD1P9tMHLKZhC3XsfNj6vjSoqwrMpEuC
	zuYOkiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Vr0-00000003lLw-1c5R;
	Thu, 31 Oct 2024 14:08:50 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VpJ-00000003l5s-0rWZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:07:06 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-a99ebb390a5so372663266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730383623; x=1730988423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEGfHgtlfX7KJ8goCZZIWVQ2MO0hMqzb+0kc1/rtAds=;
        b=UHChBI7e19HsCwkk0Af87b8bRecA/RsAAX4/8uHXfttlIwW+K1UGNLCbFGcZ5rNfOM
         49+P7mVJCJhMfCrMdtKKc0lAnL33pWMTDxazmRDcPTHNCFTBczC0iSORga5D0y6pO5ze
         41rDvDNdFcz+d8u6G7cOWJmNsin5pT84op6Qtqk1ceZGuCNlm0G0/y8mt8Jntw2Efn3U
         WY2If+YqOpjllPtLgU39+WqJ4c2fLh5e4/jsSufYFZjP0WSQt0JcjnDs+0xdWObyEmXB
         9KvTRcThU+WW0lRYL1RweqZmHrqdNfEuVWnQCmtsqREcuPt+UyJz1d/ueSdbRiwYlVyo
         o7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730383623; x=1730988423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEGfHgtlfX7KJ8goCZZIWVQ2MO0hMqzb+0kc1/rtAds=;
        b=w4bGQ6+iT2O0nWiNSvvTojDALdibu3EiPly+4HJtX3ee18zM3qinclfkizfXFtkGER
         r9o2Qsf9K0y899CihSQJUEhtAw6N9VjxX6KGA6L9DcsH2YV1nhvxhRz9HfJ+Je7L8V55
         MuTzjWKPcpFRvzzutqyb/qE3WCFzPrGiZRLflWtvF2HLV9nuJtVpYtjh09cB1IyQkepD
         8il0bG5NModWhNUWG8uOLmBVqvzCpKlRSA2/sk9LMDUT1GstypURmAvIqC+eV+BgVAd0
         yzEBTkK3Nr9LTcnpyLPd6r8n1pzPT1iIB06Qf0iUGGuLUFlhfYPI8EyaYtwn3bmqZf0D
         bNTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOdJ3RPC3hPObz+uPxxO3zjS34FYij6fdf9abYhMV/tZXLXeOEt7C2fs3uDqC8QKjmmBgZfr+pnj4Mp8/FMtXM@lists.infradead.org
X-Gm-Message-State: AOJu0YzWc9YwgHrYiMpGGdBmi9RlD+u3JfrVBmCzcZpSsWrDzY97MBn0
	7b5zszmcai3ygT2YWFdMG52lT15lldj3SUq12AL9UzodhXYCPzjTFOmAuSjAGEQ=
X-Google-Smtp-Source: AGHT+IHIQ0tbBiD4S9T+SeWA7RT+bD93Ja4MEmDsZzDyFDQ+3MuTwIXh7kQIQRv4IgnjZ0byYOCkag==
X-Received: by 2002:a17:907:3f87:b0:a9a:cea7:1294 with SMTP id a640c23a62f3a-a9e65436316mr9805566b.21.1730383622809;
        Thu, 31 Oct 2024 07:07:02 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c5327sm72556866b.56.2024.10.31.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:07:02 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 15:07:26 +0100
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
Message-ID: <ZyOPHm7fl_vW7mAJ@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <9a02498e0fbc135dcbe94adc7fc2d743cf190fac.1730123575.git.andrea.porta@suse.com>
 <mjhopgkrjahaxydn3ckianqnvjn55kxrldulvjkpqivlz72uyi@57l5vhydpzc2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mjhopgkrjahaxydn3ckianqnvjn55kxrldulvjkpqivlz72uyi@57l5vhydpzc2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_070705_274626_7456D165 
X-CRM114-Status: GOOD (  32.78  )
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

On 08:26 Tue 29 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 03:07:19PM +0100, Andrea della Porta wrote:
> > Add device tree bindings for the gpio/pin/mux controller that is part of
> > the RP1 multi function device, and relative entries in MAINTAINERS file.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../pinctrl/raspberrypi,rp1-gpio.yaml         | 163 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +
> >  2 files changed, 165 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > new file mode 100644
> > index 000000000000..465a53a6d84f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > @@ -0,0 +1,163 @@
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
> > +  The RP1 chipset is a Multi Function Device containing, among other sub-peripherals,
> > +  a gpio/pinconf/mux controller whose 54 pins are grouped into 3 banks. It works also
> 
> Please wrap code according to coding style (checkpatch is not a coding
> style description but only a tool).

Ack.

> 
> > +  as an interrupt controller for those gpios.
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
> > +additionalProperties:
> 
> Not much improved. You are supposed to have here pattern, just like
> other bindings. I asked for this last time.
> 
> And there are examples using it - almost all or most of pinctrl
> bindings, including bindings having subnodes (but you do not use such
> case here).

This is the same approach used in [1], which seems quite recent. I did't
use pattern because I wouldn't really want to enforce a particular naming
scheme. Subnodes are used, please see below. Since pinctrl.yaml explicitly
says that there is no common binding but each device has its own, I
thought that was reasonable choice. Should I enforce some common pattern,
then?

> 
> > +  anyOf:
> > +    - type: object
> > +      additionalProperties: false
> > +      allOf:
> > +        - $ref: pincfg-node.yaml#
> > +        - $ref: pinmux-node.yaml#
> > +
> > +      description:
> > +        Pin controller client devices use pin configuration subnodes (children
> > +        and grandchildren) for desired pin configuration.
> > +        Client device subnodes use below standard properties.
> > +
> > +      properties:
> > +        pins:
> > +          description:
> > +            A string (or list of strings) adhering to the pattern 'gpio[0-5][0-9]'
> > +        function: true
> > +        bias-disable: true
> > +        bias-pull-down: true
> > +        bias-pull-up: true
> > +        slew-rate:
> > +          description: 0 is slow slew rate, 1 is fast slew rate
> > +          enum: [ 0, 1 ]
> > +        drive-strength:
> > +          enum: [ 2, 4, 8, 12 ]
> > +
> > +    - type: object
> > +      additionalProperties:
> > +        $ref: "#/additionalProperties/anyOf/0"
> 
> Your example does not use any subnodes, so this looks not needed.

The example has subnodes, as in the following excerpt from the example:

            rp1-uart0-14-15 {
                pin_txd {
                    function = "uart0";
                    pins = "gpio14";
                    bias-disable;
                };

                pin_rxd {
                    function = "uart0";
                    pins = "gpio15";
                    bias-pull-up;
                };
            };

Many thanks,
Andrea

[1] - Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml

> 
> Best regards,
> Krzysztof
> 

