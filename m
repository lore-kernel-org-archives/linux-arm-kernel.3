Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D59BE6895E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoiG2q7mPENxGqV2o9EotirCxP1iVZskztD3m7IMwvo=; b=UtENa8iapf0N/Yx5MBsC2wu4g4
	06KfomGSqFrxgAEi38JEYRD3jkG1ZESKMm1sFIHhoNc7v3Cb46eG/IHS/m29RI6TlJBp/je/a2I42
	/J1C7hTTnSdtQVUnsf+coZcvShuOZKoRaPeprQjabHdympZx0XS25fgUcKwAIu91feXJEdp1rpUlj
	guLdOLl5lwYAxR8QC2LgnEs5ry69CZU0eqhbFOdqK0BND1KtATkca9pSWVcQOFEuK1BkBDNFUz/+m
	l1S/h1eIq5f/TI60XK8DMsgdgDxkSyecUdbdf4xAkKNmjhnZ60E6QR4i7GcTnUuGEXzjzvBhz5z2J
	5ioETwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RJG-0000000334z-2cHk;
	Thu, 31 Oct 2024 09:17:42 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RHH-000000032dg-3POk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:15:41 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso95345666b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730366137; x=1730970937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoiG2q7mPENxGqV2o9EotirCxP1iVZskztD3m7IMwvo=;
        b=GM1tlmzzqzhWYIoZx9AeOtAHFefVnvkNc9pHBS4HJ6dy2/lWLnX2MYaDZicoZkvaMV
         mpQZW3DXyYCdtfQRWLMBvOZpLdAxewvk98Es9zThA/RaoNEWQLfUwdJ7WiEcFRG4xGdc
         8s0tB2VXiO0hTFXYRh78o/8b2CnqzyUadTV9hMTjVhx9bywkqdvXkgMLjbTJtU/7kzyR
         yZUyUNogNyhZ2gRhz2e0OXRkaa8XD9R1cRs0En6M0IWCqAfi8dCnZ1WWY0GFeKkQLnXN
         50tt/V9sJGbkA9H5SVs5lyH1Zdf/oKfQaclfO9tM55E9VXttAhygDsW19W25deLrSRtH
         NMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366137; x=1730970937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoiG2q7mPENxGqV2o9EotirCxP1iVZskztD3m7IMwvo=;
        b=qXGRsGd7ZmY2LJWe1X4h9Cnh7Q4yRKp3NsZl51VJ9Uaw6z2yfgGifIsdEI/tpjjbCI
         FTSSnHsCA/ruGS1jPA+uJhJUp1q0ZvkwdVUm0hcjeIQsUz45jsjmpM56jFrMDmPBvhT0
         A7u/dtoiuHCMdm0VyjUrjcvxGYwpJ5+BW9oQZ3o223S/dOzUCyYFUgmbIl6fDcTa0vBY
         l24B59wOzNwSgUJRPkAU7yKFqLC0GhVIcd2hri9UymLgE8HzFXKbkp0y7njsEKMogfkc
         2fYtB2BH2zxgdzO8IBDHQBvqTudcbbUlVQ45wtHI4ObuA4MIL6RBcSGn+wDI9JwviMy8
         yrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp32HS4iipchAh4BlKXyLv4iV5PA1wd4DvDmWg+JMgdGKM0frNJD81MmCxdHafiV7qRL3KBvolDjBK175J/au7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8t4y5FXu6SiQ5PxjdVCXDzV7n3GGq32Qn6ZrSOgVv+VEDOTyJ
	Qhzneug6Gerakh0xJbcXlauwuSliBUhb4efa+/684MAh3I9H6TwgtejVa5n1o2g=
X-Google-Smtp-Source: AGHT+IGqY9TZJZkR9s1c+Lyk4eQ/ILwNYxPHLn7zzQfTeVpg9i8pEvuNeYMcJ+P8ngwF9rXjQzp9hw==
X-Received: by 2002:a17:907:8686:b0:a9a:212d:4ecb with SMTP id a640c23a62f3a-a9de5d702eemr1922884766b.12.1730366137085;
        Thu, 31 Oct 2024 02:15:37 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565df8c2sm43663366b.102.2024.10.31.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 02:15:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 10:16:01 +0100
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
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: Add RaspberryPi RP1 clock
 bindings
Message-ID: <ZyNK0RxJKdNCV11N@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <914978925d34cfb5bee10fe92603f98763af48b0.1730123575.git.andrea.porta@suse.com>
 <cxwzmlzafgdu2uarcx7mdv4p32zig7efatcg4dzmctho6mvykl@dgwvf3ltcjmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cxwzmlzafgdu2uarcx7mdv4p32zig7efatcg4dzmctho6mvykl@dgwvf3ltcjmo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_021539_885894_F2071687 
X-CRM114-Status: GOOD (  32.98  )
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

On 08:23 Tue 29 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 03:07:18PM +0100, Andrea della Porta wrote:
> > Add device tree bindings for the clock generator found in RP1 multi
> > function device, and relative entries in MAINTAINERS file.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../clock/raspberrypi,rp1-clocks.yaml         | 62 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  .../clock/raspberrypi,rp1-clocks.h            | 61 ++++++++++++++++++
> >  3 files changed, 129 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> >  create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > new file mode 100644
> > index 000000000000..a123dd619f8e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RaspberryPi RP1 clock generator
> > +
> > +maintainers:
> > +  - Andrea della Porta <andrea.porta@suse.com>
> > +
> > +description: |
> > +  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
> > +  VIDEO), and each PLL output can be programmed though dividers to generate
> > +  the clocks to drive the sub-peripherals embedded inside the chipset.
> > +
> > +  Link to datasheet:
> > +  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > +
> > +properties:
> > +  compatible:
> > +    const: raspberrypi,rp1-clocks
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    description:
> > +      The index in the assigned-clocks is mapped to the output clock as per
> > +      definitions in include/dt-bindings/clock/raspberrypi,rp1-clocks.h.
> 
> You still describe how current driver matches assigned-clocks to your
> output clocks. That's not the property of clock-cells and that's not how
> assigned-clocks work.

This description is taken by another upstream binding, please see
Documentation/devicetree/bindings/clock/renesas,5p35023.yaml

Its purpose is to let the user know how clock-cell number specified
in assigned-clocks is mapped to the clock provided by this generator.
Since some of these clocks are shared among peripherals, their frequency
cannot be set by consumers, so it's the provider itself (i.e. the clock
device described with this binding) that should take care of them.
The renesas example has assigned-clocks specified though, please see below.

> 
> There are no assigned clocks in your DTS, so this is really irrelevant
> (or not correct, choose).

In the first revision of this patchset (please see [1] and following messages)
I had the assigned-clocks setup in the example while trying to explain their
purpose, but Conor said those didn't seem to be relevant, hence I dropped them.
Maybe I had to be more incisive on that.
So, I'd be inclined to retain the description as it is and reintroduce some
assigned-clocks in the example as in the renesas one, would it be ok for you?

> 
> 
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: xosc
> 
> What is the purpose of clock-names if you do not use it? Drop.

Ack.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#clock-cells'
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
> > +
> > +    rp1 {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clocks@c040018000 {
> > +            compatible = "raspberrypi,rp1-clocks";
> > +            reg = <0xc0 0x40018000 0x0 0x10038>;
> > +            #clock-cells = <1>;
> > +            clocks = <&clk_rp1_xosc>;
> > +            clock-names =  "xosc";
> 
> Only one space after '='.

I will drop the name since the driver will not refer to it via clk_get()
but will use clk_parent_data::index.

Many thanks,
Andrea

[1] - https://lore.kernel.org/all/20240822-refutable-railroad-a3f111ab1e3f@spud/

> 
> Best regards,
> Krzysztof
> 

