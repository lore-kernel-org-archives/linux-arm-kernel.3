Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C69D6DDF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnRQ5k2W4KQtF3o50oAe39uq4EEsE5sLc3WraeZijZ8=; b=FxedsMch8bio8KE3/wJzjnH+ar
	ZBS/zaX8GEeV3oTZ3heAz/zuCg82adnxOvss1WRigfnXe2x1CWHYKGPPMhUDsjezzZ4hhxjV4mnrm
	/mu5piK2TNUhNPs0VbiyYD4Luw/Sw1MwYL/rsEFJC1W+WxVuBc/RhxwwcLr0ShU8pFNeA70iN34v/
	l0YH1cvkvT1hgmspEJnW8Ep4SW50o+Xs+75ftolmgTuNStaB1DwAl987TJMYPD6R17OmufFpnCjIu
	RndY1d1fYWn/jA9KUsFFve+JUEj0f2IFjcxUyWahOoPKqsuemEJ+lfOs0p8H80RydlOLSQESE0xFh
	4ECVJfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuYi-00000002XSw-3OZy;
	Fri, 15 Nov 2024 11:32:16 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuXn-00000002XKy-26nz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 11:31:20 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso310302566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 03:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731670278; x=1732275078; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dnRQ5k2W4KQtF3o50oAe39uq4EEsE5sLc3WraeZijZ8=;
        b=TQE12CgS+dPPYFKVhjlvTbxbP7cpaIpJRLlWPdB8OEEBd7KMsC6a/09KVyhaeeU00m
         1KzGQFBUw75MiXj2P0sMQQAESHIVCPh5/5yiTtGG6mseruGlxO67OptrQbbmOBLW/BKe
         eLSwwiV+nJ8VJ7fCTZgjAISQat2aRnUQQg8EtaZw1BBwH7ncDVRSBgv6zP0IkuKTyL5y
         oFCILFdbw/qfld/00XjITmKq4y291ZbmuJdKBpkvJzT1CGfXJdhidXSN3s1F0ubdw5w0
         8yw2FMcwAw95wCDSRxYYjXMQ/LENR9rLA07QVcG3BBkhsxusQ7jj+wV/nS70pOIwGEhY
         kiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731670278; x=1732275078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnRQ5k2W4KQtF3o50oAe39uq4EEsE5sLc3WraeZijZ8=;
        b=FnLU2c/hyFBR4QwygNsgKPWAFrVjkE28t2tVk/GmeOL4CLu23SbJ0YnwS5Se6IFLkk
         RomOhSUXYVsrOeKdaTjye0QQIAjTxaOQ93dwDb+j2s2KeyJzcohasckrOIrEOv3E3gsV
         P3SjEltThqbCkY4k8lXk0Cw+5Y9caPEjTERdp3myWpTi93HVukGlbt+J8xpUATRyunXX
         4fvyl/6v8q4nMRqds9TbgybP5TTBBdEZvMXeUSMppdeTSdsb2EGF9ajcVetXd+1Gz1xL
         BZYgOiAgZ/upSLcwB88OoVMaHlb3dFrWNuZsPpFZHzItLBzRoEkigqzTVYp8ZTlZqsia
         bjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc6fIJugqL5NOnWG0UuKAnGJMfAN/Xn50EcirXHwbiz0YmNfFRRfHxY3b93//Hce1Xvuh3LIML7ikShmG2zUMV@lists.infradead.org
X-Gm-Message-State: AOJu0YzRqbvOgd/bI+33XtzaUCqSfDSeesf/IZcxaimdaKyJNxypy5hA
	5eXmGhYYBYvE3ErI2EDAke+G6rfeZf5BGW84w05ZrCplKm/sQmFBhreGVUQ5uTU=
X-Google-Smtp-Source: AGHT+IGGVV57uzrNc0ydJB35BuAQW3PLmwezoY7ro9Htuqv6FaxtVtfdaNQjMW38HVtyAVFZlg/ZLA==
X-Received: by 2002:a17:907:6eaa:b0:a9e:df65:372b with SMTP id a640c23a62f3a-aa4835525d6mr182898666b.52.1731670277871;
        Fri, 15 Nov 2024 03:31:17 -0800 (PST)
Received: from localhost (host-79-19-144-50.retail.telecomitalia.it. [79.19.144.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df26a40sm168760666b.4.2024.11.15.03.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 03:31:17 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 15 Nov 2024 12:31:45 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <ZzcxIYKcZ-z6ubrZ@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <914978925d34cfb5bee10fe92603f98763af48b0.1730123575.git.andrea.porta@suse.com>
 <cxwzmlzafgdu2uarcx7mdv4p32zig7efatcg4dzmctho6mvykl@dgwvf3ltcjmo>
 <ZyNK0RxJKdNCV11N@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyNK0RxJKdNCV11N@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_033119_541195_44996988 
X-CRM114-Status: GOOD (  40.52  )
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

On 10:16 Thu 31 Oct     , Andrea della Porta wrote:
> Hi Krzysztof,
> 
> On 08:23 Tue 29 Oct     , Krzysztof Kozlowski wrote:
> > On Mon, Oct 28, 2024 at 03:07:18PM +0100, Andrea della Porta wrote:
> > > Add device tree bindings for the clock generator found in RP1 multi
> > > function device, and relative entries in MAINTAINERS file.
> > > 
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > ---
> > >  .../clock/raspberrypi,rp1-clocks.yaml         | 62 +++++++++++++++++++
> > >  MAINTAINERS                                   |  6 ++
> > >  .../clock/raspberrypi,rp1-clocks.h            | 61 ++++++++++++++++++
> > >  3 files changed, 129 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > >  create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > > new file mode 100644
> > > index 000000000000..a123dd619f8e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > > @@ -0,0 +1,62 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RaspberryPi RP1 clock generator
> > > +
> > > +maintainers:
> > > +  - Andrea della Porta <andrea.porta@suse.com>
> > > +
> > > +description: |
> > > +  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
> > > +  VIDEO), and each PLL output can be programmed though dividers to generate
> > > +  the clocks to drive the sub-peripherals embedded inside the chipset.
> > > +
> > > +  Link to datasheet:
> > > +  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: raspberrypi,rp1-clocks
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#clock-cells':
> > > +    description:
> > > +      The index in the assigned-clocks is mapped to the output clock as per
> > > +      definitions in include/dt-bindings/clock/raspberrypi,rp1-clocks.h.
> > 
> > You still describe how current driver matches assigned-clocks to your
> > output clocks. That's not the property of clock-cells and that's not how
> > assigned-clocks work.
> 
> This description is taken by another upstream binding, please see
> Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> 
> Its purpose is to let the user know how clock-cell number specified
> in assigned-clocks is mapped to the clock provided by this generator.
> Since some of these clocks are shared among peripherals, their frequency
> cannot be set by consumers, so it's the provider itself (i.e. the clock
> device described with this binding) that should take care of them.
> The renesas example has assigned-clocks specified though, please see below.
> 
> > 
> > There are no assigned clocks in your DTS, so this is really irrelevant
> > (or not correct, choose).
> 
> In the first revision of this patchset (please see [1] and following messages)
> I had the assigned-clocks setup in the example while trying to explain their
> purpose, but Conor said those didn't seem to be relevant, hence I dropped them.
> Maybe I had to be more incisive on that.
> So, I'd be inclined to retain the description as it is and reintroduce some
> assigned-clocks in the example as in the renesas one, would it be ok for you?

Since I'm on the verge of producing a new patchset revision, may I kindly ask
some comments on this? Is it ok for you?

Many thanks,
Andrea

> 
> > 
> > 
> > > +    const: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    const: xosc
> > 
> > What is the purpose of clock-names if you do not use it? Drop.
> 
> Ack.
> 
> > 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - '#clock-cells'
> > > +  - clocks
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
> > > +
> > > +    rp1 {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        clocks@c040018000 {
> > > +            compatible = "raspberrypi,rp1-clocks";
> > > +            reg = <0xc0 0x40018000 0x0 0x10038>;
> > > +            #clock-cells = <1>;
> > > +            clocks = <&clk_rp1_xosc>;
> > > +            clock-names =  "xosc";
> > 
> > Only one space after '='.
> 
> I will drop the name since the driver will not refer to it via clk_get()
> but will use clk_parent_data::index.
> 
> Many thanks,
> Andrea
> 
> [1] - https://lore.kernel.org/all/20240822-refutable-railroad-a3f111ab1e3f@spud/
> 
> > 
> > Best regards,
> > Krzysztof
> > 

