Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9860CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzK5qNzDD1OL6sh9VhoK7dF0ie9h0/HgqvIRoxOou0g=; b=xlbAG3/nzhSmYT577RbTpnEBnu
	es56Mg7NTvFh6BOHn77+lGTGhDETAkrZpEhxBogbNniy03risFJaMaTjVCOJSTIP78HrV7O86HF6l
	wbo1IgfnNNVj20ID+sQeEqroVxTiINqGV9x3qto8zRBm9f0fNw1x+fP3SJ7E1WM5xpROkAm4vp0bX
	sExbNcltlN4D/0tj12HfToe2QXkyIuf88HN6O+dbwdnbL2NkvZV7zRpqzqa34UKIT517twrKXM8tH
	XiTOvtLwOIFlsj6wNUd30BVUQ7QngbNAYdngANzogsHgYG9MlmuEpywwFQMs3YHb8lUfUfLxVqAwo
	AqgYYbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAqF-00000002Odb-0QH5;
	Wed, 29 Oct 2025 18:24:15 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAqC-00000002Oc9-1e6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 18:24:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so935435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761762250; x=1762367050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bzK5qNzDD1OL6sh9VhoK7dF0ie9h0/HgqvIRoxOou0g=;
        b=Vqa06qqKpnLD8b1zm2/KQEgvd2Kht2uE+5t54ivoRIfO/N1yriyUJgq9IqYq9CoDw5
         qwWFFuPlpDJ5lUqOJA1htHD4uShHa1C8RREovYcag4UttkfzdDtUC8MbbM6L18LgYrck
         3e6ypOVnjfo3s7hoK4lBGoGPepPjMYHgylXf/W0ZX99OSDZUWAG76lXS5CRgSZTtv5WA
         svJNSOCJr+ukiWRCf5kClGkpTPawRXFhkk/pbgTk9u8PJ1hnam+MIEzDnOtFi/jR3dE5
         coKkiO3anRpBQQs0qcLGlivrWS2LfUJw1E+Q/Dv8Jx3NHQNuZk8sdnVxeBSaNuEx0G7a
         j+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761762250; x=1762367050;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzK5qNzDD1OL6sh9VhoK7dF0ie9h0/HgqvIRoxOou0g=;
        b=JiUYvkbbN51NBaKKel/WHMhMMIcdzja9fSaXm3GDaEPBDCOtrPl6k8BfFF4eL1FAJs
         SVUj96FV+3hM5pk7tuFsU5AKQAUIgP2RkIRVIfWXI2hYW/yhqs6y9nysd6YYZ61m+i1N
         dDjKttMRlbl+3cq/1fB8Mn84t1dbmQif9yTjhNyaKD4Xc0Jpe2UyTe33dNX7GTtI3UC4
         4fUJyHaja1FMCVjVc5PjIk1j1wCExN7/T8Ck0VXu3WJl7hTqkMnb5S75h83aH33AIBi7
         DArHeaa17B0ToO39DSUxMJShNwUqIHFeqqxO31+lmbhWaCBUzK3x5PGS79wUTKmDJvo8
         Qh6g==
X-Forwarded-Encrypted: i=1; AJvYcCU3JoJ/HL5NFHLD4IFqDVF9CWS6aCmMj4A5zyQ16q6qvM87aTLsksUJ4DHwlqaQ5gFI+iwumjzOJ37FuNoiqRqT@lists.infradead.org
X-Gm-Message-State: AOJu0YyzDpOCE/aC7M5JPxf2dW+rkVCOUhlncq8nKwq77/hjf/KUm+BC
	Yps+rRjiADOMsDR5fJBQ2ahHBfVSolVVSJ2B8lWg+Ubzf9Sc+YTjJQTh
X-Gm-Gg: ASbGncucxLEQqaSOrYYAJty2mhqsfxgr2QNJ6mIN7ultKULCjvPF9BLSqGbSilun9uH
	IkFB34OmPqP/YZ8Vy+91vPmt7FV16M4mA//+V/SE4tPT5Cp7VkV9wJclRl/7gkMWEL/nwCaDzMk
	UaSR+j+0JMKuYOavX+yVM6V8pNsBvTN9kXP8scuEjjL0wfjAQWzE8esuZS0cg7qwa85v7ZpOP6j
	b+Sy9sEjJxYTd29tt1AgmwkyiYnZG7ljoy/RL4fsF+irROo4n4tH3rUAQMsX+hRe5cWv+S1bVcT
	QWg9U6zHiIovopUmqgva67zyJWYTHb9PAUBpBp1e7uo66LIV677SeiYmiGv/OMhz1r5Kq2dQq+D
	xCNi2ZWUFA3ICIEZUdqj89kQ/1aJ7+FusK1/xq8sH7/H2ySOj1rhd8LE0p555WQqlcNNrPMmNlz
	iWjg/6fj4K1UMhPs+v90+sMm9VzjSX
X-Google-Smtp-Source: AGHT+IHiqbGMQAd5HKcmjlS9yIwTWKcuIT+kbHRohu/cwGjeIbdOsMSRiO92YQLIPJlRr2d/zjLp/w==
X-Received: by 2002:a05:600c:468f:b0:46e:1cc6:25f7 with SMTP id 5b1f17b1804b1-4771e177ca5mr33863075e9.9.1761762250323;
        Wed, 29 Oct 2025 11:24:10 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca979sm28796326f8f.14.2025.10.29.11.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 11:24:09 -0700 (PDT)
Message-ID: <69025bc9.5d0a0220.1f0440.deb9@mx.google.com>
X-Google-Original-Message-ID: <aQJbxPm8SFN8WR7f@Ansuel-XPS.>
Date: Wed, 29 Oct 2025 19:24:04 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-mutual-scotch-7ca52e17da69@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_112412_492762_DA73BA7D 
X-CRM114-Status: GOOD (  44.91  )
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

On Wed, Oct 29, 2025 at 06:07:22PM +0000, Conor Dooley wrote:
> On Wed, Oct 29, 2025 at 06:37:10PM +0100, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > for the USB controller.
> > 
> > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > mode currently configured on the system for the relevant USB port.
> > 
> > The first USB port on the SoC can be both used for USB 3.0 operation or
> > Ethernet (HSGMII).
> > The second USB port on the SoC can be both used for USB 3.0 operation or
> > for an additional PCIe line.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > 
> > For DT maintainers, in v2 there were some comments, hope the new
> > description and names of the property better clarify the usage and
> > why they are needed.
> > 
> >  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 76 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 ++
> >  .../dt-bindings/phy/airoha,an7581-usb-phy.h   | 11 +++
> >  3 files changed, 94 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> >  create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..5106685c124d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7581 SoC USB PHY
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description: >
> > +  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
> > +
> > +  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> > +  mode currently configured on the system for the relevant USB port.
> > +
> > +  The first USB port on the SoC can be both used for USB 3.0 operation or
> > +  Ethernet (HSGMII).
> > +  The second USB port on the SoC can be both used for USB 3.0 operation or
> > +  for an additional PCIe line.
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-usb-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  airoha,usb2-monitor-clk-sel:
> > +    description: Describe what oscillator across the available 4
> > +      should be selected for USB 2.0 Slew Rate calibration.
> 
> Why's this being set in dt? What actually determines what oscillator
> should be used? Do they have different performance characteristics?
> How is someone meant to know which one to use?
>

Hi Conor,

thanks a lot for the review.

The airoha,usb2-monitor-clk-sel is set in DT because it describe the HW
and to what oscillator the PHY should be connected to.

There are 2 PHY at different register space. One PHY needs to calibrate
for oscillator 1 and the other PHY for oscillator 2 or the PHY doesn't
work for USB 2.0 (the calibration fails)

The previous implementation used an index property but that was rejected
as it wasn't descriptive of the HW.

> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2, 3]
> > +
> > +  airoha,usb3-serdes:
> > +    description: Describe what Serdes line is attached to the USB 3.0 port.
> > +      Can be either Serdes USB1 or Serdes USB2.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [2, 3]
> 
> This is confusing. Why 2 and 3 for usb1 and usb2? What even is the
> mapping? Is it 2:1/3:2 or 2:2/3:1?
> 

AFAIK there isn't a way to directly reference dt-bindings.

2 and 3 are from include/dt-bindings/soc/airoha,scu-ssr.h

#define AIROHA_SCU_SERDES_USB1		2
#define AIROHA_SCU_SERDES_USB2		3

> > +
> > +  airoha,scu:
> > +    description: Phandle to the SCU syscon to configure the Serdes line.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  '#phy-cells':
> > +    description: Describe if the referred PHY is the USB 2.0 PHY or USB 3.0 PHY.
> > +    const: 1
> 
> Which is which here?
>

Mhh I think I didn't understand here. #phy-cells describe the
parameters to be used for phys property in a different node.

The current usage would be

<&usb0_phy PHY_TYPE_USB2> for USB 2.0
or <&usb0_phy PHY_TYPE_USB3> for USB 3.0

This node expose 2 PHY that can be referenced by the single parameters.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - airoha,usb2-monitor-clk-sel
> > +  - airoha,usb3-serdes
> > +  - airoha,scu
> > +  - '#phy-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/phy/airoha,an7581-usb-phy.h>
> > +    #include <dt-bindings/soc/airoha,scu-ssr.h>
> > +
> > +    phy@1fac0000 {
> > +        compatible = "airoha,an7581-usb-phy";
> > +        reg = <0x1fac0000 0x10000>;
> > +
> > +        airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL1>;
> > +        airoha,usb3-serdes = <AIROHA_SCU_SERDES_USB1>;
> > +        airoha,scu = <&scu>;
> > +
> > +        #phy-cells = <1>;
> > +    };
> > +
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8085fdca7bcd..af23c590bbc6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -763,6 +763,13 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> >  F:	drivers/spi/spi-airoha-snfi.c
> >  
> > +AIROHA USB PHY DRIVER
> > +M:	Christian Marangi <ansuelsmth@gmail.com>
> > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > +F:	include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > +
> >  AIRSPY MEDIA DRIVER
> >  L:	linux-media@vger.kernel.org
> >  S:	Orphan
> > diff --git a/include/dt-bindings/phy/airoha,an7581-usb-phy.h b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > new file mode 100644
> > index 000000000000..efbb0ae75e3a
> > --- /dev/null
> > +++ b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +
> > +#ifndef _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
> > +#define _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
> > +
> > +#define AIROHA_USB2_MONCLK_SEL0                 0
> > +#define AIROHA_USB2_MONCLK_SEL1                 1
> > +#define AIROHA_USB2_MONCLK_SEL2                 2
> > +#define AIROHA_USB2_MONCLK_SEL3                 3
> 
> These definitions seem completely pointless. The property is called
> "airoha,usb2-monitor-clk-sel" so any use will look like
> "airoha,usb2-monitor-clk-sel = <3>;"
> That's more informative than the define is, since it doesn't even
> truncate "monitor". I'd just delete this header entirely and use the
> number. If you want the define in the driver to avoid magic numbers,
> just define it in the driver.
> 

Well yes the idea here is to not have to use magic numbers in DT and try
to use the naming in the SoC documentation since they are called
monclk_sel0, monclk_sel1 ...

Will drop.

> pw-bot: changes-requested
> 
> Cheers,
> Conor.
> 
> > +
> > +#endif
> > -- 
> > 2.51.0
> > 



-- 
	Ansuel

