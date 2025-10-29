Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD6BCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLgblDIy8bcKRfG2LuAVMDQcQzPf8VrxYqngcQhuaTk=; b=p/UiDLD+hs5e8275Iyj4Gktxhp
	DfTG4xLmPy+QwZNiNm3IX7xG11Kn4Nd7m9CIFem1e298fNmKluXf90wQ0lsl/03fA3qryVPG/AAQC
	zux6Ytshxw8INOTvQU2W21ExKvrM9fyo+mJ91Cgthlvc8rx0OzpI0rGuZBUCfOR5DdiTc/+zsD5dP
	VwCLjr0uTUmiqGvjfnx6jAS6CD96Dw6tjwiL6dwS0GMxjXrqdFIxaabuNk+0ZLcs9rxPfEIElbvk8
	7R8kPABuWrW6AI0LdOAikn47OHt3kV+8CJbRSe+FnEBaKjV36PpuS63EMF0fVrSbsvLKNWvSIfoyb
	AEQz0VCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBZp-00000002XHi-2uyU;
	Wed, 29 Oct 2025 19:11:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBZm-00000002XGS-4A3N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:11:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so2341855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761765077; x=1762369877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zLgblDIy8bcKRfG2LuAVMDQcQzPf8VrxYqngcQhuaTk=;
        b=dkFMGPpp1JiOhoHwXCVU7GyFExqCBDHnCpnjTXltmJ429Dg61wj3jfFvx9Uq1D/DzF
         qVItct294otqaIo7nTv7GQ3qShxN1xPmupz99oj4p1lQZToyotccGS0uuwbYHDJ4C6zl
         8C0dwS5UeC63iFjlayc20aDu9X1fjdmLL6RFzJ1NLo5fFQ3g1DEj/oddoGMiVs8zV5l8
         6d0JNCKZx7SJKlHm5h6CD0ArbUedKaHFtc/Io1009hrq8ol//3lFOK4DJNhyr0LuN9Pf
         rGzkbsBmwSJHxpwhSY/3FApUEiWYNR09xaDpMqXxc/9FMD3LAfwmIeohJCkbOWw6xmD8
         XFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761765077; x=1762369877;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLgblDIy8bcKRfG2LuAVMDQcQzPf8VrxYqngcQhuaTk=;
        b=I1H3Lf5hF6Xzlx4t0q4rmRuQoAXEU1CmpN820GQVKHkfYhsbHFOYtufxQSe1nfsK3O
         IDlZrk2SDFDAQkSe8lTcpmNYF0jsOWQ2O0/uvprSiRhAUlKlVa6FUTMnqcDiyvg5QDr0
         WqQo6OI5UWffSxx4CBxGCFajxZbSLA+roUoN1PKD4xu7C6k8xmfpJy7Us1QUixFF67V+
         oK/e5s2vsrXK0oj0Egx94Qxzdggw+00i3OLxokCOXpelNBOAT3zug8SNWJ5AlRAtMndR
         d7qxh/3X+/gJa3Qcgz9m4nmDm6b1heO4/jhS0AI3iMd/oUMbZT/Q0+P+LUPuWyug5o9n
         F0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWjneHgngfbclUmPG8M8Sqyp6rMJjtSNK87yeNswD2cD/ueIWFltTRRP+Sxrwo3WuGr/h5F4i54SAjxCIAXckwH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5PEhO3vZ9MWIoKKtMD0dVwpnNS9g+9qAJii4J2Orqzq42LSqH
	fv5PCcFW6Q9jFNeLv9YSRM7Mk7iF9qKySTrALsgWoF6SIf5v3ftjYIcd
X-Gm-Gg: ASbGncu2VAQXNiu40GmkczMhI2oAsyJ9ShB4XBV7v78l1e5jNSg5yYsElcxDSnC8ijb
	VPYt/RueStPPeWr79ecrP3F5bdINnJyqQsp6WME6ZCuMklA6obH/W6gbclHFu7MCX9vE2uRiRSX
	nQP3qaaTFSz2DLyGJP7yW6DTZG4+Jjk7TgTgfNvXxfiFrq0bgp2zPkHN3yOH6bCKZ70C6E0m2nQ
	tna4s39jddXozG1Yqx/QBwAgXZJ5BjNbujFIRnKxhQYIGTrHS1zhPU2yYZJswUbvoMldLKaqGX3
	apEop/duZywUBLz6FEj/ygWCYJkbtcihtqAybmousptfrEruQeEAvGwaEwa1OLLws907tZsJmfh
	6MhFsdFo5He369s4Uac8WtGop4l16y8gm4r/MV3lfBqYvck88U1z/KbduqpR+r+jFnxEvCDknnz
	Anag1esOr/SfVp+ZemFXyDzs1BNXiC
X-Google-Smtp-Source: AGHT+IHHJ0QFj6Gb9jCEPnxHuuKJVnaNcrJYknPm6OXlzII4o39jZjUz3lv37Wl4zGDlA2OEKu9Xhg==
X-Received: by 2002:a05:600c:34c4:b0:471:145b:dd0d with SMTP id 5b1f17b1804b1-4771e1ca0b2mr36156105e9.24.1761765076611;
        Wed, 29 Oct 2025 12:11:16 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771832e857sm53183195e9.0.2025.10.29.12.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:11:16 -0700 (PDT)
Message-ID: <690266d4.050a0220.3a144c.eef7@mx.google.com>
X-Google-Original-Message-ID: <aQJmzmMMxJfaZA4h@Ansuel-XPS.>
Date: Wed, 29 Oct 2025 20:11:10 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
References: <20251029173713.7670-1-ansuelsmth@gmail.com>
 <20251029173713.7670-3-ansuelsmth@gmail.com>
 <20251029-mutual-scotch-7ca52e17da69@spud>
 <69025bc9.5d0a0220.1f0440.deb9@mx.google.com>
 <20251029-henna-easily-227513366e90@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-henna-easily-227513366e90@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_121119_112474_3B57EE66 
X-CRM114-Status: GOOD (  66.80  )
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

On Wed, Oct 29, 2025 at 06:35:51PM +0000, Conor Dooley wrote:
> On Wed, Oct 29, 2025 at 07:24:04PM +0100, Christian Marangi wrote:
> > On Wed, Oct 29, 2025 at 06:07:22PM +0000, Conor Dooley wrote:
> > > On Wed, Oct 29, 2025 at 06:37:10PM +0100, Christian Marangi wrote:
> > > > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > > > for the USB controller.
> > > > 
> > > > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > > > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > > > mode currently configured on the system for the relevant USB port.
> > > > 
> > > > The first USB port on the SoC can be both used for USB 3.0 operation or
> > > > Ethernet (HSGMII).
> > > > The second USB port on the SoC can be both used for USB 3.0 operation or
> > > > for an additional PCIe line.
> > > > 
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > > 
> > > > For DT maintainers, in v2 there were some comments, hope the new
> > > > description and names of the property better clarify the usage and
> > > > why they are needed.
> > > > 
> > > >  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 76 +++++++++++++++++++
> > > >  MAINTAINERS                                   |  7 ++
> > > >  .../dt-bindings/phy/airoha,an7581-usb-phy.h   | 11 +++
> > > >  3 files changed, 94 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > > >  create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > > > new file mode 100644
> > > > index 000000000000..5106685c124d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > > > @@ -0,0 +1,76 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Airoha AN7581 SoC USB PHY
> > > > +
> > > > +maintainers:
> > > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > > +
> > > > +description: >
> > > > +  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
> > > > +
> > > > +  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > > > +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> > > > +  mode currently configured on the system for the relevant USB port.
> > > > +
> > > > +  The first USB port on the SoC can be both used for USB 3.0 operation or
> > > > +  Ethernet (HSGMII).
> > > > +  The second USB port on the SoC can be both used for USB 3.0 operation or
> > > > +  for an additional PCIe line.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: airoha,an7581-usb-phy
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  airoha,usb2-monitor-clk-sel:
> > > > +    description: Describe what oscillator across the available 4
> > > > +      should be selected for USB 2.0 Slew Rate calibration.
> > > 
> > > Why's this being set in dt? What actually determines what oscillator
> > > should be used? Do they have different performance characteristics?
> > > How is someone meant to know which one to use?
> > >
> > 
> > Hi Conor,
> > 
> > thanks a lot for the review.
> > 
> > The airoha,usb2-monitor-clk-sel is set in DT because it describe the HW
> > and to what oscillator the PHY should be connected to.
> > 
> > There are 2 PHY at different register space. One PHY needs to calibrate
> > for oscillator 1 and the other PHY for oscillator 2 or the PHY doesn't
> > work for USB 2.0 (the calibration fails)
> 
> This implies that the oscillator is not part of the phy block, if
> there's multiple competing for the same one. Why are these oscillators
> not represented as clocks?
>

This was also pointed out in the old revision. The oscillator is
internal and there isn't a register to read the frequency or to
enable/disable.

The PHY register block have the same exact bits to select from 0 to 3.
The HW internally is then connected to 1 or 2 basted on the physical PHY.

So yes they are part of the PHY block, just the register map is too
""liberal"" on the configuration.

I verified if the same oscillator could be used for both but it does end
up in the port not working as the calibration fails.

> > The previous implementation used an index property but that was rejected
> > as it wasn't descriptive of the HW.
> > 
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum: [0, 1, 2, 3]
> > > > +
> > > > +  airoha,usb3-serdes:
> > > > +    description: Describe what Serdes line is attached to the USB 3.0 port.
> > > > +      Can be either Serdes USB1 or Serdes USB2.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum: [2, 3]
> > > 
> > > This is confusing. Why 2 and 3 for usb1 and usb2? What even is the
> > > mapping? Is it 2:1/3:2 or 2:2/3:1?
> > > 
> > 
> > AFAIK there isn't a way to directly reference dt-bindings.
> 
> Usually people put the name of the file in.
> 

Yes on this I have seen mixed implementation with only the enum and some
adding the link to it. I will add in the description.

> > 
> > 2 and 3 are from include/dt-bindings/soc/airoha,scu-ssr.h
> > 
> > #define AIROHA_SCU_SERDES_USB1		2
> > #define AIROHA_SCU_SERDES_USB2		3
> 
> Why overcomplicate like this? Just use 1 and 2. If that corresponds to
> register settings of 2 and 3, do that conversion in the driver.
> Properties are not shoving just register settings etc into, what happens,
> for example, when the next soc comes along and these are actually usb1 is
> 3 and usb2 is 4 there? All of a sudden, your property has different
> meanings depending on which device is being used.
> 

This is really just to identify the serdes line that can have multiple
usage, they don't refer to a specific register.

The PCIe one are added as they can also be used for PCIe or Ethernet
usage and in the future this feature will be implemented in the PCIe PHY.

It's ok to change it 1 but then I hope we won't fall in the monclk case
where we end up with

airoha,usb3-serdes = <1>;

as that will be VERY confusing in DT.

(again I'm using dt-bindings here to give clear indication of the
hardware since it's already confusing as is with all the double usage of
the different PHY)

> > > > +
> > > > +  airoha,scu:
> > > > +    description: Phandle to the SCU syscon to configure the Serdes line.
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +
> > > > +  '#phy-cells':
> > > > +    description: Describe if the referred PHY is the USB 2.0 PHY or USB 3.0 PHY.
> > > > +    const: 1
> > > 
> > > Which is which here?
> > >
> > 
> > Mhh I think I didn't understand here. #phy-cells describe the
> > parameters to be used for phys property in a different node.
> > 
> > The current usage would be
> > 
> > <&usb0_phy PHY_TYPE_USB2> for USB 2.0
> > or <&usb0_phy PHY_TYPE_USB3> for USB 3.0
> > 
> > This node expose 2 PHY that can be referenced by the single parameters.
> 
> Ah, I didn't know that the 1 cell variant here was type not index.
> 

Yes in the driver I'm maching for type not index as it's very confusing.
Any hint on better describe it on the schema? Maybe I can reword with

"Describe if the referred PHY is PHY_TYPE_USB2 or PHY_TYPE_USB3"

Should be more direct. I understand now the confusion.

> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - airoha,usb2-monitor-clk-sel
> > > > +  - airoha,usb3-serdes
> > > > +  - airoha,scu
> > > > +  - '#phy-cells'
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/phy/airoha,an7581-usb-phy.h>
> > > > +    #include <dt-bindings/soc/airoha,scu-ssr.h>
> > > > +
> > > > +    phy@1fac0000 {
> > > > +        compatible = "airoha,an7581-usb-phy";
> > > > +        reg = <0x1fac0000 0x10000>;
> > > > +
> > > > +        airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL1>;
> > > > +        airoha,usb3-serdes = <AIROHA_SCU_SERDES_USB1>;
> > > > +        airoha,scu = <&scu>;
> > > > +
> > > > +        #phy-cells = <1>;
> > > > +    };
> > > > +
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 8085fdca7bcd..af23c590bbc6 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -763,6 +763,13 @@ S:	Maintained
> > > >  F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> > > >  F:	drivers/spi/spi-airoha-snfi.c
> > > >  
> > > > +AIROHA USB PHY DRIVER
> > > > +M:	Christian Marangi <ansuelsmth@gmail.com>
> > > > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > > > +S:	Maintained
> > > > +F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > > > +F:	include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > > > +
> > > >  AIRSPY MEDIA DRIVER
> > > >  L:	linux-media@vger.kernel.org
> > > >  S:	Orphan
> > > > diff --git a/include/dt-bindings/phy/airoha,an7581-usb-phy.h b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > > > new file mode 100644
> > > > index 000000000000..efbb0ae75e3a
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > > > @@ -0,0 +1,11 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > > > +
> > > > +#ifndef _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
> > > > +#define _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
> > > > +
> > > > +#define AIROHA_USB2_MONCLK_SEL0                 0
> > > > +#define AIROHA_USB2_MONCLK_SEL1                 1
> > > > +#define AIROHA_USB2_MONCLK_SEL2                 2
> > > > +#define AIROHA_USB2_MONCLK_SEL3                 3
> > > 
> > > These definitions seem completely pointless. The property is called
> > > "airoha,usb2-monitor-clk-sel" so any use will look like
> > > "airoha,usb2-monitor-clk-sel = <3>;"
> > > That's more informative than the define is, since it doesn't even
> > > truncate "monitor". I'd just delete this header entirely and use the
> > > number. If you want the define in the driver to avoid magic numbers,
> > > just define it in the driver.
> > > 
> > 
> > Well yes the idea here is to not have to use magic numbers in DT and try
> > to use the naming in the SoC documentation since they are called
> > monclk_sel0, monclk_sel1 ...
> 
> Sometimes the "magic" number just makes sense to use. If something is
> completely arbitrary, then sure use one to make it readable. If
> literally the number itself, as it is here, don't bother.

Ok no problem, thanks for hint. More than happy to make this easier and
have less redundant headers.

-- 
	Ansuel

