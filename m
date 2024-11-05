Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9219FD2B931
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ta4J6k5jVAMZKZSpLijGX731ZlTwallmszrkrr+XXw=; b=1mvL1ZBRJVcx224JR0vRI98soX
	FfQUAzXfs2/P9A6x84l1l9jVkDhYWzuAL9xpPWrY8K1ZgAo+U0/2ESB2ji3Ubqq6MwhPyfULuVvno
	wO5x7GMNQ4SXpbKVHRT9xQBkWmJoJTHetCZ+iaWsKRYiPym8MNVi1iMVvvbLVrrUiL77F2IxNXi7W
	o9N95286NLEkaHW6uWOY6GtDyZPDAD1on34gqkPLrVl2X3r3wmScJ95DUjhbxRbnHYtW4UgTQFjiq
	ntXo8h5/t1HzorYDRGqk00hj1n+HoWV/qL0itnOaANhbSMbNS9ULY+Fs3XBxBjHa9P9H/xFqdKmQL
	s7aCS4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Kdx-0000000HIYu-425m;
	Tue, 05 Nov 2024 14:34:53 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KaR-0000000HGzc-2gIr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 14:31:18 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so892559866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 06:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730817073; x=1731421873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ta4J6k5jVAMZKZSpLijGX731ZlTwallmszrkrr+XXw=;
        b=WO7TyM8kS23Ke94w4d9ZJMbSA3AmgTuaioi/z9Tbnk6K8k1+eIaJZ3S3xUvwxK7raq
         osBYPhpLhuIeWQC40Pu1PJOUk0oeSwIo/7MraQgovwx7Hr2JmlgwlXicrbREglYXVK4b
         DHUMgK7gQpIYYGDVhQlyAmQNb9n/mDXfApFFqqkxdYl5XVE/p5k6hTWr0hwMmxfpFdTH
         hV3wJ6KtWl4bBg9+u1EjX54CmVVLRPqboher/IPREIXYbXAlmsu/T97gyFzZLcS4EBrX
         ldCfh8xBizb2TKBdzrD63cUHRYf+//GeB2IbFL/wXiHONSqwBdFNd/3hiEjU7Ce+Vrxs
         2WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817073; x=1731421873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ta4J6k5jVAMZKZSpLijGX731ZlTwallmszrkrr+XXw=;
        b=IhsE7xra8fKKq9wEcb6vOvH7Nzh4BZm9qqM3A4uu83Bp2VxeImBoFEZ1R/iX9XQIqj
         DAmRJN8NNiGb42lxPYObknpmBDDYxvpCzrXlD7RIslbvhr9QWW9hlxnn8XVTHsevUK3Q
         q5aT02a337XMZOmaY5i93epqxDx8eZDawxy4Rj94w8V1Jgs5pZ+5H5N53cvKolzgBJWi
         Hym0cB3N11Pm6UUwOUtepf2Ge3GWeMhi5ziIc9MWLBhZLsgr61bM3y9DQdiS1K476l35
         FVCvPZfNbJGnUBJpAONqxUWfogIUdqQ8AcP9drbW1Z5JpuICurTGHGOLZAxd9eegsYUY
         SDAw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3nlvI0KfK40XqXy7MrS+FnSalBtrbpNZ1iyjVmK3WCfr6tsdeuN2D2JIGMutYirY9ATZ/Iy0ZrvVL05EbLVl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx12EDbr/hcfavoJF30++dNy1IVdCw7HUFJnyzjq/zkZJPtKasn
	Unuu/fEUTtShxVyK8lp3lmIFE62OXRprMYGOK1lN8m3OS80+IjSVu3ECbE+1ZHE=
X-Google-Smtp-Source: AGHT+IGfFIA7pHiw/bQC/D2ASD/c0vYvs4DJcTYAQN6+XwmdDdmF15vw/BW0JRu8bqizSc9PGJFmeA==
X-Received: by 2002:a17:906:a84a:b0:a9e:8522:19e1 with SMTP id a640c23a62f3a-a9e85221c0cmr968110466b.62.1730817073143;
        Tue, 05 Nov 2024 06:31:13 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb169fc18sm140394466b.10.2024.11.05.06.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:31:12 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 5 Nov 2024 15:31:38 +0100
To: Stanimir Varbanov <svarbanov@suse.de>
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
Subject: Re: [PATCH v3 09/12] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
Message-ID: <ZyosSv4ecKxohSrM@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <1f4cec50493ec5d3168735c0a005771787e5cd59.1730123575.git.andrea.porta@suse.com>
 <4a474dae-6669-4678-87dd-e0e9692a749b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a474dae-6669-4678-87dd-e0e9692a749b@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_063115_700388_80F109B9 
X-CRM114-Status: GOOD (  28.91  )
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

Hi Stan,

On 15:29 Mon 04 Nov     , Stanimir Varbanov wrote:
> Hi Andrea,
> 
> On 10/28/24 16:07, Andrea della Porta wrote:
> > RaspberryPi RP1 is a multi function PCI endpoint device that
> > exposes several subperipherals via PCI BAR.
> > Add a dtb overlay that will be compiled into a binary blob
> > and linked in the RP1 driver.
> > This overlay offers just minimal support to represent the
> > RP1 device itself, the sub-peripherals will be added by
> > future patches.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> > NOTE: this patch should be taken by the same maintainer that will take
> > "[PATCH v3 10/12] misc: rp1: RaspberryPi RP1 misc driver", since they
> > are closely related in terms of compiling.
> > 
> >  MAINTAINERS                           |  1 +
> >  arch/arm64/boot/dts/broadcom/rp1.dtso | 61 +++++++++++++++++++++++++++
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 06277969a522..510a071ede78 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19383,6 +19383,7 @@ F:	include/uapi/linux/media/raspberrypi/
> >  RASPBERRY PI RP1 PCI DRIVER
> >  M:	Andrea della Porta <andrea.porta@suse.com>
> >  S:	Maintained
> > +F:	arch/arm64/boot/dts/broadcom/rp1.dtso
> >  F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> >  F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> >  F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > new file mode 100644
> > index 000000000000..8d1bbf207a30
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > @@ -0,0 +1,61 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +	fragment@0 {
> > +		target-path="";
> > +		__overlay__ {
> > +			compatible = "pci1de4,1";
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <2>;
> > +
> > +			pci_ep_bus: pci-ep-bus@1 {
> > +				compatible = "simple-bus";
> > +				ranges = <0xc0 0x40000000
> > +					  0x01 0x00 0x00000000
> > +					  0x00 0x00400000>;
> > +				dma-ranges = <0x10 0x00000000
> > +					      0x43000000 0x10 0x00000000
> > +					      0x10 0x00000000>;
> > +				#address-cells = <2>;
> > +				#size-cells = <2>;
> > +
> > +				rp1_clocks: clocks@c040018000 {
> > +					compatible = "raspberrypi,rp1-clocks";
> > +					reg = <0xc0 0x40018000 0x0 0x10038>;
> 
> shouldn't this be:
> 
> 	rp1_clocks: clocks@18000 {
> 		reg = <0x00 0x00018000 0x0 0x10038>;
> 		...
> 	}
> 
> ?
> 
> And for other nodes too...

For that to be @18000 instead of @c040018000, you should also change
the "ranges" entry in pci-ep-bus node, as follows:

ranges = <0x00 0x00018000	//This was: 0xc0 0x40000000
          0x01 0x00 0x00000000
          0x00 0x00400000>;

which is of course feasible, but I prefer to use addresses that 
resemble (at least to some extent) the ones in RP1 docs.

Many thanks,
Andrea

> 
> ~Stan
> 
> > +					#clock-cells = <1>;
> > +					clocks = <&clk_rp1_xosc>;
> > +					clock-names = "xosc";
> > +					assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
> > +							  <&rp1_clocks RP1_PLL_SYS>,
> > +							  <&rp1_clocks RP1_CLK_SYS>;
> > +					assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
> > +							       <200000000>,  // RP1_PLL_SYS
> > +							       <200000000>;  // RP1_CLK_SYS
> > +				};
> > +
> > +				rp1_gpio: pinctrl@c0400d0000 {
> > +					compatible = "raspberrypi,rp1-gpio";
> > +					reg = <0xc0 0x400d0000  0x0 0xc000>,
> > +					      <0xc0 0x400e0000  0x0 0xc000>,
> > +					      <0xc0 0x400f0000  0x0 0xc000>;
> > +					gpio-controller;
> > +					#gpio-cells = <2>;
> > +					interrupt-controller;
> > +					#interrupt-cells = <2>;
> > +					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
> > +						     <1 IRQ_TYPE_LEVEL_HIGH>,
> > +						     <2 IRQ_TYPE_LEVEL_HIGH>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> 

