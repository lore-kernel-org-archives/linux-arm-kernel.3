Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B96D5AE6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbOrRriYh6w4F8LVkNHZr22RHexrNFjFKA4icR8e7Vs=; b=GyrXOBvtGea2ET4lMG0HQD2Xqn
	V7FmevC2jvHhV0voFU8GD0F1JY6rbaxIwKyQyJIR0EvpH/z03C+tt/Ib8XMEsGSw+mtWIc/gxB3Td
	gqcAwloDxzt+dWlXXE+Gmpgp9FcFq8DMhfI6D2qZYxKgSP/sGrumuR1iVLIabhpLijhz8QuawjimL
	CCMRIDRuJFlhV9+b2nbfqzKi+g/RHBwPFM3+iLCaRPojeCGGthNR58ywAAWtmKM45bxgRl8oEG4aJ
	PFznlM/3uAZ8vBjTa0HpqYdaN6+RQtuEuVtijt5RWKQNJOgvW8zxHfreoa5fk9NPCibgnQn3e0fPp
	RjwNeAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8x0M-000000060FT-25Uv;
	Thu, 07 Nov 2024 07:32:34 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wlq-00000005xMG-30tY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 07:17:37 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso75643566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 23:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730963852; x=1731568652; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nbOrRriYh6w4F8LVkNHZr22RHexrNFjFKA4icR8e7Vs=;
        b=eO4TnnsVybc55jMemt0pH4FEqG9kN1M1rpHHiUTcQZ76+RkiXMo47DZt+1zGYF18+I
         /UT80N5c2MmaIMFehZTDFmaYDvlwlaJQuSTk44zP1sMJZqknut6o4Z5RDLhFTGRInxrK
         iG1ruS+T9RKk3gMaLd0jSz9JIXgmdNCF0c3orhPLfNx9JPG+HObPMhhqG1bdaJb/QoQZ
         f0t3x7EA3lII4mGuXs/PRCgOPKzykhjLGXInrxZzWrlIRh4ZRxbyt8OAuV1b211iNMcV
         eGPhRb5Z51kGy5Qq8FZYJXIRuwEj85WG7RRdsdjRqXAxeLlK155IkYtrABHBcjU2oYyA
         9A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963852; x=1731568652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbOrRriYh6w4F8LVkNHZr22RHexrNFjFKA4icR8e7Vs=;
        b=WdvjpWk0W4rhgCrUL7fo3Rdv186SU2tzS2iijkcN+PxMctSH79hb7jmkP2aEeB6HF4
         6fyXNgLjKMqNgDk51JdBsB5gSR3M0wwls8e0A+nIKUDChv2c1/65ZWvT0PVSWmU8WJWm
         rR10KFXwDcPatHIhrTy6jESRNlhKARRhBxSpF7QRBbqC3NtevbjZhW4gpgiCKQ6aBG0E
         TJDj5uAuWRQ6Rp+dY8jRU7zw5VeAnMHity4OFyAYfRC10pB5SDN4aG7sOh3leafE9s4D
         u80ExexfAvOF6KPudBv1vcjZamUokoWqiEW9+S/2NdQQrVtLHbDHfDJqd8QWUAQrbsFf
         nwrw==
X-Forwarded-Encrypted: i=1; AJvYcCVfwJhxMlYKgduysDOAOI8V56/Gi7glIIi2Ti9Q/KV1D991R437/2ItK6JwfTb27t686Z6lg2z1D9rBUT30QD9u@lists.infradead.org
X-Gm-Message-State: AOJu0YyGwwjmC5YhW865gtCdgfG0Qi7Hbxs6Jw/jDLvcDtybRP1qRAHR
	86o8rF0fbTNaGGrq4Q0Gn7F7PHI7GJA1nymUIIMWgL0+dAfShDRhU9NkMZJ4YaQ=
X-Google-Smtp-Source: AGHT+IFPT6mzuetQvJyLFc7e08zxC/5UPQxA/Xio6fkK4wjMcfEmL06ep3a65TdFRwza/k5rV5x/ew==
X-Received: by 2002:a17:907:70d4:b0:a9e:b5d0:de6 with SMTP id a640c23a62f3a-a9eb5d00edemr628074966b.50.1730963852370;
        Wed, 06 Nov 2024 23:17:32 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0defaefsm49539066b.164.2024.11.06.23.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:17:32 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 7 Nov 2024 08:17:58 +0100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
Subject: Re: [PATCH v3 04/12] dt-bindings: misc: Add device specific bindings
 for RaspberryPi RP1
Message-ID: <ZyxppoSeZhOQ8h2L@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <768d2307342e1054c58324a9d51957456dc82cbf.1730123575.git.andrea.porta@suse.com>
 <20241106145022.t7w2762t7zxpefc3@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106145022.t7w2762t7zxpefc3@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_231734_826444_DD844ECA 
X-CRM114-Status: GOOD (  24.67  )
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

Hi Manivannan,

On 14:50 Wed 06 Nov     , Manivannan Sadhasivam wrote:
> On Mon, Oct 28, 2024 at 03:07:21PM +0100, Andrea della Porta wrote:
> > The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> > schema is intended as minimal support for the clock generator and
> > gpio controller peripherals which are accessible through BAR1.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../devicetree/bindings/misc/pci1de4,1.yaml   | 80 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > new file mode 100644
> > index 000000000000..d66b2fc130d1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RaspberryPi RP1 MFD PCI device
> > +
> > +maintainers:
> > +  - Andrea della Porta <andrea.porta@suse.com>
> > +
> > +description:
> > +  The RaspberryPi RP1 is a PCI multi function device containing
> > +  peripherals ranging from Ethernet to USB controller, I2C, SPI
> > +  and others.
> > +  The peripherals are accessed by addressing the PCI BAR1 region.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-ep-bus.yaml
> > +
> > +properties:
> > +  compatible:
> > +    additionalItems: true
> > +    maxItems: 3
> > +    items:
> > +      - const: pci1de4,1
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +    description:
> > +      Specifies respectively the interrupt number and flags as defined
> > +      in include/dt-bindings/interrupt-controller/irq.h.
> > +
> > +  interrupt-controller: true
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - '#interrupt-cells'
> > +  - interrupt-controller
> > +  - pci-ep-bus@1
> > +
> > +examples:
> > +  - |
> > +    pci {
> > +        #address-cells = <3>;
> > +        #size-cells = <2>;
> > +
> > +        rp1@0,0 {
> > +            compatible = "pci1de4,1";
> > +            ranges = <0x01 0x00 0x00000000
> > +                      0x82010000 0x00 0x00
> > +                      0x00 0x400000>;
> 
> Could you please have the 'ranges' in a single line as used everywhere?
> 
> - Mani

Sure.

Many thanks,
Andrea

> 
> > +            #address-cells = <3>;
> > +            #size-cells = <2>;
> > +            interrupt-controller;
> > +            #interrupt-cells = <2>;
> > +
> > +            pci_ep_bus: pci-ep-bus@1 {
> > +                compatible = "simple-bus";
> > +                ranges = <0xc0 0x40000000
> > +                          0x01 0x00 0x00000000
> > +                          0x00 0x00400000>;
> > +                dma-ranges = <0x10 0x00000000
> > +                              0x43000000 0x10 0x00000000
> > +                              0x10 0x00000000>;
> > +                #address-cells = <2>;
> > +                #size-cells = <2>;
> > +
> > +                rp1_clocks: clocks@c040018000 {
> > +                    compatible = "raspberrypi,rp1-clocks";
> > +                    reg = <0xc0 0x40018000 0x0 0x10038>;
> > +                    #clock-cells = <1>;
> > +                    clocks = <&clk_rp1_xosc>;
> > +                    clock-names =  "xosc";
> > +                };
> > +            };
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ccf123b805c8..2aea5a6166bd 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19384,6 +19384,7 @@ RASPBERRY PI RP1 PCI DRIVER
> >  M:	Andrea della Porta <andrea.porta@suse.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > +F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> >  F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >  F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >  F:	include/dt-bindings/clock/rp1.h
> > -- 
> > 2.35.3
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

