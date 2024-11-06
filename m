Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EB9D44D78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMLPbUdK9AywBAADioyII9I9KRIUBTgFkntThVZZvAQ=; b=b+Ue8B93KwrN33xv2FALjt/8RQ
	hFJndI+8gMElCqPRej4kX9itIRh/6UWNh16R8gmFvC5aZaW3v439oubgwwHcpTzfpRMnE+3lGqpQk
	EiYMpetTFnh87tzEf+qTHLQ0c7BDfB3uy1DqvzI6CRfFnv23uL+mhKtnUQah79IHHEZ1u5MVriR/Q
	jwZ0deUGXphQnPVrieDkvRPtJx+Gw2JXFmTVvuJbRs6LyQvwQ2WXheClSLI52/3XT7w3lAcDTu+4h
	dSkOEs3WfvEE/IZbTTe5AjlP2h/e5xDqFjzuQAzPie//5Fg7GzOMLAgjm9e6cM2K7io6Apavwr9cJ
	Jk9tOH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hPt-00000003hjN-0piK;
	Wed, 06 Nov 2024 14:53:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hMZ-00000003h9G-48jc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 14:50:29 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso7842127a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 06:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730904625; x=1731509425; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YMLPbUdK9AywBAADioyII9I9KRIUBTgFkntThVZZvAQ=;
        b=fZPFT/Of0z+yYonby53DP7vBO3CIVajs3qhM/d/+yZZ8iRthMPVjq9hI+ln+SkuK2a
         paqFLPd8Rs6Uho6YjgEw2Hpa7rOT5pS+SRZWQPOs5TJPvEXo3I7tTRWb+ApBN+QqB6E7
         a/eZyoL4XdK8sxVJyXp5SXsPFJsIFtsJKIJxPCCRvqBvLRmoRqVKKqVkwj67SP+LW3Dt
         Xpa9jbk35HD4glxpJ7f+IlCBYv3EBNPZdsXj/0pHmi2FimY5pbtCJZw37z29qbGXkoLR
         VKbeSXacSCV89jVxuM+tIdQaIKfkWQl2CPtV1i7acvlBQbJRuHkRlfD6xIh9XKGrIkAp
         QT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730904625; x=1731509425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMLPbUdK9AywBAADioyII9I9KRIUBTgFkntThVZZvAQ=;
        b=N13vLOP2WFARZSFMHSM/tQdh+G2dB5oAMACHdWyg0qQvYb8mnl5YSGbS50M0b5tDPy
         sA6x7s05qyPJWFe/0DTkQPRHbSG3mgIn68Rm0cBdbx6sNU32qXPMP2Db05fD21u1qJvG
         uPB/mPu5WToOmZ9R4z/YaDZ7Q+hyq3lCoPXCxhCAKc2YVUSsYjWTj/j3UcjqSEblzwUX
         jPhOkFET6OFEdL4lzXDzz1QcetKg50dOrTCYbQ11YD7vSVT9Kb6kh9rESE4c7QeS/2r9
         u3S/c2IxJR5VCGMLI6iemoTzL9J52jcykzoib0JZby/puuVEq+nEfHSOVWnt4OYZ7hzL
         pOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpeXjVhBCP25jRvaIV/zfVImMzWzWSJcFw6oXQAoLnqJzaeNt/ZPjvm9126ZHirOAXS2U97g46uZrPGqFHibca@lists.infradead.org
X-Gm-Message-State: AOJu0YzHsL5Nyj9BMKDhOqBl2tGG8WYudzbz6bt0DFnMNut7OfvHAt2w
	be6ZlyVKGzc2wIQJsgC+A9Kn6FjVvcyABW+GnMiE4KX8G/ZYqeCFE8U4MxIZbg==
X-Google-Smtp-Source: AGHT+IHeThKtOkHeL5FWKZz5ZM2mmxjVWGrW0423WOvwhMrPUysvQLsevJdmI+OQ69yHH6kYAZaq6w==
X-Received: by 2002:a17:907:9495:b0:a9a:161:8da4 with SMTP id a640c23a62f3a-a9de619f1b6mr3822800366b.55.1730904625169;
        Wed, 06 Nov 2024 06:50:25 -0800 (PST)
Received: from thinkpad ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813123sm287511966b.174.2024.11.06.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:50:24 -0800 (PST)
Date: Wed, 6 Nov 2024 14:50:22 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <20241106145022.t7w2762t7zxpefc3@thinkpad>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <768d2307342e1054c58324a9d51957456dc82cbf.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <768d2307342e1054c58324a9d51957456dc82cbf.1730123575.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_065028_114683_CD02F5A5 
X-CRM114-Status: GOOD (  22.37  )
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

On Mon, Oct 28, 2024 at 03:07:21PM +0100, Andrea della Porta wrote:
> The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> schema is intended as minimal support for the clock generator and
> gpio controller peripherals which are accessible through BAR1.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../devicetree/bindings/misc/pci1de4,1.yaml   | 80 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> new file mode 100644
> index 000000000000..d66b2fc130d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RaspberryPi RP1 MFD PCI device
> +
> +maintainers:
> +  - Andrea della Porta <andrea.porta@suse.com>
> +
> +description:
> +  The RaspberryPi RP1 is a PCI multi function device containing
> +  peripherals ranging from Ethernet to USB controller, I2C, SPI
> +  and others.
> +  The peripherals are accessed by addressing the PCI BAR1 region.
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-ep-bus.yaml
> +
> +properties:
> +  compatible:
> +    additionalItems: true
> +    maxItems: 3
> +    items:
> +      - const: pci1de4,1
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description:
> +      Specifies respectively the interrupt number and flags as defined
> +      in include/dt-bindings/interrupt-controller/irq.h.
> +
> +  interrupt-controller: true
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +  - pci-ep-bus@1
> +
> +examples:
> +  - |
> +    pci {
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +
> +        rp1@0,0 {
> +            compatible = "pci1de4,1";
> +            ranges = <0x01 0x00 0x00000000
> +                      0x82010000 0x00 0x00
> +                      0x00 0x400000>;

Could you please have the 'ranges' in a single line as used everywhere?

- Mani

> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +
> +            pci_ep_bus: pci-ep-bus@1 {
> +                compatible = "simple-bus";
> +                ranges = <0xc0 0x40000000
> +                          0x01 0x00 0x00000000
> +                          0x00 0x00400000>;
> +                dma-ranges = <0x10 0x00000000
> +                              0x43000000 0x10 0x00000000
> +                              0x10 0x00000000>;
> +                #address-cells = <2>;
> +                #size-cells = <2>;
> +
> +                rp1_clocks: clocks@c040018000 {
> +                    compatible = "raspberrypi,rp1-clocks";
> +                    reg = <0xc0 0x40018000 0x0 0x10038>;
> +                    #clock-cells = <1>;
> +                    clocks = <&clk_rp1_xosc>;
> +                    clock-names =  "xosc";
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccf123b805c8..2aea5a6166bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19384,6 +19384,7 @@ RASPBERRY PI RP1 PCI DRIVER
>  M:	Andrea della Porta <andrea.porta@suse.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> +F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
>  F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
>  F:	include/dt-bindings/clock/rp1.h
> -- 
> 2.35.3
> 

-- 
மணிவண்ணன் சதாசிவம்

