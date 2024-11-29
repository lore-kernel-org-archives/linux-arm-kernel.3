Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F0D729E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKStJ4JMYm6/f7jAdkMonmjOHy/XStYH3AHNh9QPw+k=; b=ca+znMnSFaHO1VKxFQdoFARVt/
	oegm3bZAiFvxyxrbDHXkk8UK+O+8roxPOsigqPRuxgH2IJl+Mj9gZsFV2PneNnjGRTSxXxMe/wpt9
	tDTy/iDbkTkWUpN5l8B90XkcRDEdVIM9REsVzE7OOusDBLqWp7VXeWx1X4g6XKXiQOUGoz5IqPgSy
	3CxrQXIYu4N1ezOWksCH2unovjYRw/pWKV6NK3O7iicmdQaxsmzoxnWvhASayHJGZDvV2KgrSzxLq
	NpTOKOgZbnF/FXalml5mNjofRquJ75MA2Uw6D2QitgbOlwlPtLDojxAovwUC0gi7XTDwqphaYE2Nu
	uYrHh9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH4XY-00000000gW9-1dk4;
	Fri, 29 Nov 2024 17:12:24 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH4WZ-00000000gNk-1n4s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 17:11:25 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53df63230d0so2571429e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732900281; x=1733505081; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKStJ4JMYm6/f7jAdkMonmjOHy/XStYH3AHNh9QPw+k=;
        b=X9PB1Wa/YGXKaKpLJOFtpNJ03oCOOdovWr2f8mTh4V7LskUMOFOwc7zJ3IhZV60tte
         8fn+UlxstUV0NrI3FRCsNhpqxguZq8zr5bUTFImNbp6n4zoAwVLFi/8HUIBJMcXrrZx0
         TmeBnqqx3zRmkUdHQUhKzdOAJVA/aWu9y+9vbQe94lfgi4QwFYhIcLKSdhTvY1hVlbVK
         054aydSUg4PvM4ggyK7fjcAOrdCpiS25/aXsUOoZbqTXUZbE+LRNm/sJ7NutJ3TMHX5C
         VC+CY8EgIojZUFjILgK0vLpLLyYCUFDGNQjxu1XRYeyM1ISxPVz2X94Ts10v3fq75UZi
         2LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732900281; x=1733505081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKStJ4JMYm6/f7jAdkMonmjOHy/XStYH3AHNh9QPw+k=;
        b=Val3XbDle4stc7gwFSTAgClLl6TI8kR1enX8CRqbvbBeSZ7epXA4JiWUA/5yle3per
         RBIvbuV37Fy+YHkYhq4Ni1S7SSmI+4hwDj90Yl4JiBIDQ+k525VKnzqcp1chEi35fx/v
         0sTnsJ5nI8+z25q6tOyWlPfxwl2xamwlzGI/qQHiJQtkq7oE1qwPgcmTef1956sRB5ir
         +3IasfxFG3B6tpFMFznnu5SMfW2GdFMgvAptrT+ADeCw5AMSmE5FPl8uwBOVUjiMSUoH
         sWQOaqFc0GmrxtHfSGwsNQ8xkcTintZEDsV7ztCT50PQt6l7cV7L7De6Qclo+92Gmp2+
         Gkow==
X-Forwarded-Encrypted: i=1; AJvYcCUSfdcVge68wsuKnZp0Dh6t+y5GaWnfB6llt6z3LnhlGF490opNQCmp2ioITg129S8X1CChZnOQoVk0Vt4DCCWd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp7V0SxpvmUnbkfT8wQXsfMHAz/HiXZHaDblL156LYxq1FeKRV
	Jp3s4WvJpWJhpuZ4jGpvFbj0Pms8Civsw25QLIIgrLcAedebhhBC4EEGDoZ6BDs=
X-Gm-Gg: ASbGncuzJaaP5K7M9zQJ+hutXsLTs6x1NKr/P8VxpUmJdZk/LIix3HB1kU81KJGx9Qy
	6lwVQ7rguw1pbcY90mqvIzCHFU/qWo+mXm2sfeghvhNwAWsSDgIdZSNavNcEeIus294u7rOIiEM
	S3fWXWCs2cQqu+/J6SJwJJ/AHDSNVtBTQnxIcA3i4jpJXpYac5z6LM3yB3diZeMx38H0EAIEmXZ
	3I3suzPWH0hFNqBklRX1vZwtjoV0TL/bM+s2MZsdHIh22kGvj4KgdclA/8WLq4juu2hmZlVXhTE
	YdXIpwayKzb6hkrn9gRR
X-Google-Smtp-Source: AGHT+IHZ3oTCh7gVSsmHhrZ3fiOp7cXkhyrNMHuydkCIk2tz2qxDfVIno+QP7oK2bTxacMEqt16MJg==
X-Received: by 2002:a05:6512:39d2:b0:53d:ec9a:138f with SMTP id 2adb3069b0e04-53df0112687mr8431697e87.57.1732900280754;
        Fri, 29 Nov 2024 09:11:20 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e63a2sm192130166b.113.2024.11.29.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 09:11:20 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Nov 2024 18:11:53 +0100
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
Subject: Re: [PATCH v4 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
Message-ID: <Z0n12a6irbXQomdD@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <9b83c5ee8345e4fe26e942f343305fdddc01c59f.1732444746.git.andrea.porta@suse.com>
 <4ufubysv62v7aq53qfzxmup5agmqypdvemd24vm6eentph46qq@3kveluud3zd3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ufubysv62v7aq53qfzxmup5agmqypdvemd24vm6eentph46qq@3kveluud3zd3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_091123_465142_490A77BE 
X-CRM114-Status: GOOD (  14.87  )
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

On 08:55 Wed 27 Nov     , Krzysztof Kozlowski wrote:
> On Sun, Nov 24, 2024 at 11:51:39AM +0100, Andrea della Porta wrote:
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
> 
> You have 54 GPIOs, so up to 53.

Ack.

> 
> Use also consistent quotes, either ' or ".

Ack.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 

