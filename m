Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F4CE77173
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqa/FJfDuFpf2/icBmOOPejR/n8LB10qbeeDVsmf77U=; b=I7P90VNKv9TYHBvmn6lusw49pL
	0rXjg3iGgNjKo1Sg4xZbQXfdwM9O73AzAHPVMIs04mBqvLIVUC1KBmglmdNAMsOzxJLmVlhUp0Vp7
	4d9EXsfQDWLVjobCtWixcLe/JUqWUeXTqwn/ZH/pCzcBKhIr9nSUqjcRq5Y86tKv951O18lGWFVWk
	aS7ksHJV5qrUzPTiZ+qQtVkWboI9HPopXVecS6hX8XKQZA0OYURkM6qS6Waj78S0ZVS5ubrCv6Ays
	HHaJYXpJRY14OPeRtwfSswJbUWty5YLTfSO4x5yO5S9xuWjINqWKtQ6iab5Zypil0/N3G1Pjj9esr
	5MSU5MfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGcz-0000000H7Vu-24ef;
	Thu, 05 Dec 2024 18:31:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGbv-0000000H7GU-2Ho8;
	Thu, 05 Dec 2024 18:30:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so12259655e9.2;
        Thu, 05 Dec 2024 10:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733423398; x=1734028198; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vqa/FJfDuFpf2/icBmOOPejR/n8LB10qbeeDVsmf77U=;
        b=Pu0fAQZa/Y0LZfTrs7hsGcdHgVae0e3H0lGaC9oA2GC7fwBMn4hjqIxfFomjkoQAYN
         lQltsBklG8ZuPYdeJwmLOBnvXHCegCHajqeE/UgzA//8eIYq1C4/kiPvAZXMSVmCQH05
         L62lX/sRil8AT1t2QvAxPtRU2I2xTUskYi7Aq8kf46y+8gxWoAdEwIrqeCkm2jr6YPEy
         J0Zo5wEaCFqk6GM4x/QpnkPxNd/cfhY3eEVF65PSIqxnMjxjkDhCU+1RStO/3K9mdXam
         uzz7U2MfAR6XK3IdtyLNhlDQx/f21vmNTzC5GHG/jKUs4SkQVK/srCTLtmZKh7UK2AZV
         N8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733423398; x=1734028198;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqa/FJfDuFpf2/icBmOOPejR/n8LB10qbeeDVsmf77U=;
        b=Rthn06xEDXJYaNf6Gj2Vw31CaWT7tMz6ceTXWVoc6hSij0Ml0SAPtm35GvSFe3lf3M
         u6Nf0jLnOT+FT1TnXDYO3cPZCRbHse+lPphue5m5HWmC64owH6S0p/mDitM3vC9yEWAu
         89CZr5/SHdsZr6E5YWIhZi9EWm6EMmmJAlTym8JDauF0c1wxqytxCqkrhOzQaUw7+hHa
         TeR+AoTy31Pfw+ntDJXVmT2Sa/F5+1husE7Q1SzrNTl3KYm7ryiU5NJckArPrTYWeP2B
         DW4+6bQO3QckTKmNqwqQfdQ46dHC+PQj7cgeMCvdGy4PfgQYdhf7FHpue38K/MoEaNpq
         AF3A==
X-Forwarded-Encrypted: i=1; AJvYcCVTOd8Lay86nHiKKxqpTN0+iyyhCjlFYANEo/59afaa3zusu5NtEXo3Dx1L5+MReCbwHs3VLPZYgkAuOI/UJ1ej@lists.infradead.org, AJvYcCW2q4U2IvZoVgRPDh10XY+ZUCBe4MbDTpYTapimgbzAHU2OL16MAv9ddTV+MFChqqKeHUYawUkdqexYP3t4/WI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRvu0xAGnSU5pPB6oUYReTCfudV1FW+JDbeeZs0DxofQ576Y2D
	M+V9a7yPxeUNtWvRftzYClnEUWB3ABRAO86ZYk8PVGrZnrKgTxrj
X-Gm-Gg: ASbGnctegucvhRHVePmHgI2pM9QwdX58X8Rx1A2mYzmdKoEq6CnoIlLtbM3RIByLqB8
	r2kU5bBJuecZQcIAZPJwp8t/RKeEzt67WBsdf1VjoYEBvYn0pZnoeb4CfZB5ys4Umbl8hSD6jhr
	LtlQIwWEzFGstwTeHTdMIEEKo22mqJ7S+YekUs/QxHVAdOOeAJWLAzDXFUsk4EsTwvXHLzjPviY
	l7+OWJqX7+2frAH7K18laZSvwB0/VSksD41/yLZvcqDoH+y9wAWUc1xf+sZXm1SJ5lmthmNUubD
	2GHK+g==
X-Google-Smtp-Source: AGHT+IFTb665DniOhjVw8PuT2tMsXOiRKDE+9zzhmTvFCq7OvOYhsxODyzok3XIotSpVVjcnB4qQFw==
X-Received: by 2002:a5d:5886:0:b0:382:319f:3abd with SMTP id ffacd0b85a97d-3862b3cea9fmr76744f8f.36.1733423397793;
        Thu, 05 Dec 2024 10:29:57 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f4a874dsm2596621f8f.24.2024.12.05.10.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:29:57 -0800 (PST)
Message-ID: <6751f125.5d0a0220.255b79.7be0@mx.google.com>
X-Google-Original-Message-ID: <Z1HxIYnkilHmBbgK@Ansuel-XPS.>
Date: Thu, 5 Dec 2024 19:29:53 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102959_590186_0B97267A 
X-CRM114-Status: GOOD (  41.51  )
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

On Thu, Dec 05, 2024 at 08:05:39PM +0200, Vladimir Oltean wrote:
> On Thu, Dec 05, 2024 at 06:17:18PM +0100, Christian Marangi wrote:
> > I checked the examples and one problems that comes to me is how to model
> > this if only MDIO is used as a comunication method. Ocelot have PCIE or
> > SPI but this switch only comunicate with MDIO on his address.
> 
> I don't see why this matters. There will be a top-level device driver,
> which in this case will be an mdio_driver and will use mdiobus_{read,write}
> to physically access registers. This driver will create regmaps and add
> them to devres using devm_regmap_init(). From devres, DSA and other child
> drivers can use dev_get_regmap(dev->parent) and perform their I/O through
> regmap.
> 
> This driver is already written for regmap, so part of the work can
> already be reused.
> 
> > So where should I place the SoC or MFD node? In the switch root node?
> 
> The SoC should be placed on the host MDIO bus. And the Ethernet switch
> component should be a child of the SoC. Ideally, so should be all other
> switch peripherals: on the same level as the Ethernet switch.
>

Ohhhh ok, wasn't clear to me the MFD driver had to be placed in the mdio
node.

To make it clear this would be an implementation.

mdio_bus: mdio-bus {
	#address-cells = <1>;
	#size-cells = <0>;

	...

	mfd@1 {
		compatible = "airoha,an8855-mfd";
		reg = <1>;

		nvmem_node {
			...
		};

		switch_node {
			...
		};
	};
};

Consider tho that recently I faced some problem with such structure with
DT mainatiners asking to keep everything in the MFD node. But lets see
how it goes.

Well aware of the MFD API, (had to have some fun recently) so the only
confusing part was the node placement.

> > Also the big problem is how to model accessing the register with MDIO
> > with an MFD implementation.
> > 
> > Anyway just to make sure the Switch SoC doesn't expose an actualy MDIO
> > bus, that is just to solve the problem with the Switch Address shared
> > with one of the port. (Switch Address can be accessed by every switch
> > port with a specific page set)
> 
> Sorry, I don't understand this, can you explain more? "Switch Address
> can be accessed by every switch port with a specific page set"
> 
> In the code, I see that the priv->bus and priv->phy_base are used to
> perform MDIO accesses for anything related to the switch. That's perfect,
> it means that all switch registers are concentrated on a single MDIO
> address, behind a single mdio_device. If that weren't the case, things
> would get messy, because the Linux device model associates an MDIO device
> with a single address on its bus.
> 
> And then we have an8855_phy_read() and an8855_phy_write(), which in my
> understanding are the ops of a fake MDIO controller, one which has no
> registers or MDIO address space of its own, but is just a passthrough
> towards the host MDIO bus's address space. I have no idea why you don't
> just put a phy-handle from the switch user ports to PHYs located on the
> host MDIO bus directly, and why you go through this middle entity, but I
> expect you will clarify. Creating an MDIO bus from DSA for internal PHYs
> is completely optional if no special handling is required.

The difficulties I found (and maybe is very easy to solve and I'm
missing something here) is that switch and internal PHY port have the
same address and conflicts.

Switch will be at address 1 (or 2 3 4 5... every port can access switch
register with page 0x4)

DSA port 0 will be at address 1, that is already occupied by the switch.

Defining the DSA port node on the host MDIO bus works correctly for
every port but for port 0 (the one at address 1), the kernel complains
and is not init. (as it does conflict with the switch that is at the
same address) (can't remember the exact warning)

> 
> To explain again: In the MFD proposal, there is only one driver who has
> access to the mdio_device from the host bus: the MFD driver. Depending
> on how it implements the regmaps it presents to the children, it can
> control page switching, etc etc. The child devices only operate with
> regmaps, and have no idea of the underlying hardware access method.
> 
> > But yes the problem is there... Function is not implemented but the
> > switch have i2c interface, minimal CPU, GPIO and Timer in it.
> > 
> > Happy to make the required changes, just very confused on how the final
> > DT node structure.
> > 
> > -- 
> > 	Ansuel
> 

-- 
	Ansuel

