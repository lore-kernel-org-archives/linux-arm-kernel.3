Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E91FE6B25B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 22:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fn8sMcW5ZhN+2jgAZu7n+4aY/KfBjBni/L2aDFrF3us=; b=atXddJ1nx0VcpIohitS5LhWZHX
	r47GbsUc17VDP3NqZU/+nNWOVnnIYD6lX5rBgRwXLU9CCGHD3aBpLgxrDRwv6tIOq0T48alZieqjH
	joyPs6LrV5r2Y5I1oQLOqQgSBqZL/IPrBibKkSS6/rAnovCkdWIwz5NPpytRRbgGdRsHp6UzTWDmE
	RO2gL2OE8xb7Edh7EZQC2tNaW7oG5ZBH7QZLn3EH1D9UDq4nPvbj7jOs9ICnt2hKEX03g/a3Mhxy3
	W9T2Ag35x7fIYfNN8UAFHwBBPuTxh3GywCvlQivwSitmn4DV7E96q7JdwTb/dh/0rC6JJ2LpvKTTj
	K25qinRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXo1Z-0000000EDFC-2BNv;
	Mon, 22 Dec 2025 22:05:05 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXo1W-0000000EDEY-0oID
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 22:05:04 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 019ABEC0108;
	Mon, 22 Dec 2025 17:05:00 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 22 Dec 2025 17:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766441099;
	 x=1766527499; bh=fn8sMcW5ZhN+2jgAZu7n+4aY/KfBjBni/L2aDFrF3us=; b=
	JpHfYhx3vQl/aAbpZFiFdPt+aQ3rA6hSmY8dhfRWKmn7NUcH/GNndxmSsCFgpqQL
	a5JCbGnyHvViraDoVqFnAuadgijOrHoSac6fZRjrzAeqBQj5nTGVO22cM6VUqUuw
	JWGlH5O+YA6U0zZRaw/QQ0YYD/oZSzQekWnolZXsIcL6ZroMBum29iKd8RvLN1oH
	0kRNMBH13ftJAxCEuOlOPk237c5SjGyaXJCSwASjwcaPySxSuqQObKbpb6zs+DbH
	mS011SarHP+yNh8qgKhwYrUdOtWgPaobRYNmIx9qEi64jiYXYMobk6pT6w4OWi+Y
	zPyrkup+rxqyYFF/BbY3Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766441099; x=
	1766527499; bh=fn8sMcW5ZhN+2jgAZu7n+4aY/KfBjBni/L2aDFrF3us=; b=B
	41ZZ+U2VAER4K2xiTRxLjEm1LB2BbyToGduVynfcZChf26wjI5kM8PQY6NZRtNNa
	GPLcGLg9KyqpCpeQAY0AbyzKkuFjUZSvaFprYy4qehAcefGokI5TW0MotdlZou7N
	QMKu4itRtXOTem6hoYTZaYp1gPnEY48eFZSmHboFydxxHfA+jFBVwRz+RQ6H8cLi
	5epWGN4TAdKdwEvnGTPN1twOsuICyn0PW6NlCx0rHT/vwrrxS6A5jtNDwpBjRhwJ
	8Attkdt3S81g6hVVXIhqL2SzetGIMhc2zeVTFHenF7p1miEkqlCu+HrZCeTOs6LE
	kB7yyga32KOvjTpA/63Og==
X-ME-Sender: <xms:isBJac7Q8eEhZybdBsfJM063AcT8nOyAJ-Ebkk0Xih8KmrcFa7nKnQ>
    <xme:isBJaYvPBXMVFc5xUQEzAkBamhF6EGYP6FLrXKXsLABqfgPw3_gO33g2n7jTUZmvM
    DJfV8Xvgqds9WxMOIL75g0BZs2hcKKEHUJQAumPaGwupVFZCkMiMe8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehkedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeutdekkeeftdehleekieejvedtkeelvdevteeugeejlefhhfehiefggedtvdduieen
    ucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgs
    pghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgrhgvgh
    horhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosggv
    rhhtrdhjrghriihmihhksehfrhgvvgdrfhhrpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhrghojhhirghnrdiihhhurghn
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhes
    ghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:isBJaR1bZIBtik6Vtm3TGWF_o2ossCrl_NNwAkztoFUluTSl_eSMug>
    <xmx:isBJaf_j_RNO6ay714654QHlcXnUuQtbwQP77F8aj8blIqDg3XWy0g>
    <xmx:isBJaRSNuKJrgxPvh17_hLdn6BBAprADrqf0HuxS1uP_p9aw3zSX7g>
    <xmx:isBJaWmRFZID-AbQTNbHPZwed8vv_3kWXE1nMRxzUfsSCFF4KODfKQ>
    <xmx:i8BJaQApsEsADYiPQx44VdDHDnKQ7uj_-51vd1nS3p4GZJelvuJYWfAY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3B20A700065; Mon, 22 Dec 2025 17:04:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXfFZUabNlQ-
Date: Mon, 22 Dec 2025 23:04:09 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Mack" <daniel@zonque.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>, "Rob Herring" <robh@kernel.org>
Cc: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <de82700c-2e63-4598-a6ba-be27903e807c@app.fastmail.com>
In-Reply-To: <700e5050-aebe-4ca4-b02d-8ffacccf7045@zonque.org>
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
 <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
 <700e5050-aebe-4ca4-b02d-8ffacccf7045@zonque.org>
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_140502_711187_EF461A58 
X-CRM114-Status: GOOD (  24.07  )
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

On Thu, Dec 18, 2025, at 09:21, Daniel wrote:
> On 12/17/25 17:04, Arnd Bergmann wrote:
>> On Fri, Dec 12, 2025, at 22:58, Robert Jarzmik wrote:
>>> "Rob Herring (Arm)" <robh@kernel.org> writes:
>>>
>>>> These .dtsi files are not included anywhere in the tree and 
>>>> can't be tested. They have not been touched since 2018 other than 
>>>> clean-ups.
>>>>
>>> And yet, there are used by people using pxa2xx board with an DT 
>>> support (like the mioa701 for which a board file was never merged).
>>>
>>> If you remove pxa25x.dtsi and pxa27x.dtsi, you might as well 
>>> remove all support for this architecture from the kernel, as
>>> these are the building blocks needed to make it work.
>>>
>>> That might be what should be done, I'll let Arnd and Daniel 
>>> comment on the future of PXA in the kernel.
>> 
>> I agree with Rob that at the very minimum, any dtsi files in the
>> kernel should be build-tested along with the rest, so either
>> we add some dts files using them soon, or we can remove pxa2xx
>> (and maybe pxa3xx) completely.
>
> PXA3xx is in use by the Raumfeld boards, and I would really like to keep
> them around.

Ok, no problem. If there are upstream users, we can always keep that.

> For PXA2xx I'm torn. I don't have the capacity and hardware to work on
> those, but I don't know how many users are out there with out-of-tree
> dts files.

It's clear that nobody has done anything upstream for a while on pxa2xx,
you both initially put a lot of work into it but it has been incomplete
for almost a decade at this point.

I wouldn't even expect you to do any runtime testing, but if we want
to keep it in mainline, it seems the minimum state we should get to
is to complete the upstreaming to the degree that one machine can
plausibly boot with a mainline that gets built by default, and not
introduce new warnings in the process.

At the moment, an empty dts file that includes pxa25x.dtsi doesn't
even build because there is no pwri2c node:

arch/arm/boot/dts/intel/pxa/pxa2xx.dtsi:36.10-43.4: ERROR (path_references): /aliases: Reference to non-existent node or label "pwri2c"

The pxa27x.dtsi file does build but produces a couple of
'dtbs_check' W=1 and W=2 warnings:

arch/arm/boot/dts/intel/pxa/pxa27x.dtsi:134.30-138.5: Warning (node_name_chars_strict): /clocks/pxa2xx_clks@41300004: Character '_' not recommended in node name
arch/arm/boot/dts/intel/pxa/pxa27x.dtsi:149.31-187.4: Warning (node_name_chars_strict): /opp_table0: Character '_' not recommended in node name
arch/arm/boot/dts/intel/pxa/pxa27x.dtsi:134.30-138.5: Warning (unit_address_vs_reg): /clocks/pxa2xx_clks@41300004: node has a unit name, but no reg or ranges property
arch/arm/boot/dts/intel/pxa/pxa2xx.dtsi:154.33-160.5: Warning (simple_bus_reg): /pxabus/lcd-controller@40500000: simple-bus unit address format error, expected "44000000"
arch/arm/boot/dts/intel/pxa/pxa27x.dtsi:29.29-33.5: Warning (simple_bus_reg): /pxabus/pinctrl@40e00000: simple-bus unit address format error, expected "40e00054"
arch/arm/boot/dts/intel/pxa/pxa2xx.dtsi:67.23-94.5: Warning (unique_unit_address): /pxabus/gpio@40e00000: duplicate unit-address (also used in node /pxabus/pinctrl@40e00000)
pxa270-minimal.dtb: /: failed to match any schema with compatible: ['marvell,pxa27x']
pxa270-minimal.dtb: cpus: '#address-cells' is a required property 
        from schema $id: http://devicetree.org/schemas/cpus.yaml#
pxa270-minimal.dtb: cpus: '#size-cells' is a required property
        from schema $id: http://devicetree.org/schemas/cpus.yaml#
pxa270-minimal.dtb: /cpus/cpu: failed to match any schema with compatible: ['marvell,xscale']
pxa270-minimal.dtb: pxabus (simple-bus): $nodename:0: 'pxabus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
        from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
pxa270-minimal.dtb: /pxabus/interrupt-controller@40d00000: failed to match any schema with compatible: ['marvell,pxa-intc']
pxa270-minimal.dtb: interrupt-controller@40d00000 (marvell,pxa-intc): interrupt-parent: True is not of type 'array'
        from schema $id: http://devicetree.org/schemas/interrupts.yaml#
pxa270-minimal.dtb: /pxabus/mmc@41100000: failed to match any schema with compatible: ['marvell,pxa-mmc']
pxa270-minimal.dtb: rtc@40900000 (marvell,pxa-rtc): Unevaluated properties are not allowed ('clocks' was unexpected)
        from schema $id: http://devicetree.org/schemas/rtc/marvell,pxa-rtc.yaml#
pxa270-minimal.dtb: /pxabus/lcd-controller@44000000: failed to match any schema with compatible: ['marvell,pxa2xx-lcdc']
pxa270-minimal.dtb: /pxabus/pinctrl@40e00000: failed to match any schema with compatible: ['marvell,pxa27x-pinctrl']
pxa270-minimal.dtb: /pxabus/usb@4c000000: failed to match any schema with compatible: ['marvell,pxa-ohci']
pxa270-minimal.dtb: pwm@40b00000 (marvell,pxa270-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
        ['marvell,pxa270-pwm', 'marvell,pxa250-pwm'] is too long
        'spacemit,k1-pwm' was expected
        'marvell,pxa910-pwm' was expected
        from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
pxa270-minimal.dtb: pwm@40b00010 (marvell,pxa270-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
        ['marvell,pxa270-pwm', 'marvell,pxa250-pwm'] is too long
        'spacemit,k1-pwm' was expected
        'marvell,pxa910-pwm' was expected
        from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
pxa270-minimal.dtb: pwm@40c00000 (marvell,pxa270-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
        ['marvell,pxa270-pwm', 'marvell,pxa250-pwm'] is too long
        'spacemit,k1-pwm' was expected
        'marvell,pxa910-pwm' was expected
        from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
pxa270-minimal.dtb: pwm@40c00010 (marvell,pxa270-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
        ['marvell,pxa270-pwm', 'marvell,pxa250-pwm'] is too long
        'spacemit,k1-pwm' was expected
        'marvell,pxa910-pwm' was expected 
        from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
pxa270-minimal.dtb: /pxabus/udc@40600000: failed to match any schema with compatible: ['marvell,pxa270-udc']
pxa270-minimal.dtb: /pxabus/keypad@41500000: failed to match any schema with compatible: ['marvell,pxa27x-keypad']
pxa270-minimal.dtb: /pxabus/imaging@50000000: failed to match any schema with compatible: ['marvell,pxa270-qci']
pxa270-minimal.dtb: imaging@50000000 (marvell,pxa270-qci): '#clock-cells' is a dependency of 'clock-output-names'
        from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
pxa270-minimal.dtb: /clocks/pxa2xx_clks@41300004: failed to match any schema with compatible: ['marvell,pxa270-clocks']
pxa270-minimal.dtb: /timer@40a00000: failed to match any schema with compatible: ['marvell,pxa-timer'] 
pxa270-minimal.dtb: opp_table0 (operating-points-v2): $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
pxa270-minimal.dtb: opp_table0 (operating-points-v2): Unevaluated properties are not allowed ('opp-104000000', 'opp-156000000', 'opp-208000000', 'opp-312000000', 'opp-416000000', 'opp-520000000', 'opp-624000000' were unexpected)
        from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#

Most of these have an obvious fix and just need someone to care
a little bit. The Raumfeld files have a similar set of warnings:

arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi:17.9-20.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts:242.29-248.4: Warning (node_name_chars_strict): /pxabus/pinctrl@40e10000/charger_pins: Character '_' not recommended in node name
arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts:250.37-256.4: Warning (node_name_chars_strict): /pxabus/pinctrl@40e10000/dock_detect_pins: Character '_' not recommended in node name
arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-speaker-one.dts:122.3-25: Warning (property_name_chars_strict): /pxabus/i2c@40301680/codec@1a:st,needs_esd_watchdog: Character '_' not recommended in property name
pxa300-raumfeld-speaker-l.dtb: /: failed to match any schema with compatible: ['raumfeld,raumfeld-speaker-l-pxa303', 'marvell,pxa300']
pxa300-raumfeld-speaker-l.dtb: /: failed to match any schema with compatible: ['raumfeld,raumfeld-speaker-l-pxa303', 'marvell,pxa300']
pxa300-raumfeld-speaker-l.dtb: / (raumfeld,raumfeld-speaker-l-pxa303): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2684354560, 134217728]]}
        from schema $id: http://devicetree.org/schemas/root-node.yaml#
pxa300-raumfeld-speaker-l.dtb: cpus: '#address-cells' is a required property
        from schema $id: http://devicetree.org/schemas/cpus.yaml#
pxa300-raumfeld-speaker-l.dtb: cpus: '#size-cells' is a required property
        from schema $id: http://devicetree.org/schemas/cpus.yaml#
pxa300-raumfeld-speaker-l.dtb: /cpus/cpu: failed to match any schema with compatible: ['marvell,xscale']
pxa300-raumfeld-speaker-l.dtb: pxabus (simple-bus): $nodename:0: 'pxabus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
        from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
pxa300-raumfeld-speaker-l.dtb: /pxabus/interrupt-controller@40d00000: failed to match any schema with compatible: ['marvell,pxa-intc']
pxa300-raumfeld-speaker-l.dtb: interrupt-controller@40d00000 (marvell,pxa-intc): interrupt-parent: True is not of type 'array'
        from schema $id: http://devicetree.org/schemas/interrupts.yaml#
pxa300-raumfeld-speaker-l.dtb: /pxabus/mmc@41100000: failed to match any schema with compatible: ['marvell,pxa-mmc']
pxa300-raumfeld-speaker-l.dtb: /pxabus/lcd-controller@44000000: failed to match any schema with compatible: ['marvell,pxa2xx-lcdc']
pxa300-raumfeld-speaker-l.dtb: /pxabus/i2c@40f500c0: failed to match any schema with compatible: ['mrvl,pwri2c']
pxa300-raumfeld-speaker-l.dtb: regulator@34 (maxim,max8660): $nodename:0: 'regulator@34' does not match 'pmic@[0-9a-f]{1,2}'
        from schema $id: http://devicetree.org/schemas/regulator/max8660.yaml#
pxa300-raumfeld-speaker-l.dtb: regulator@34 (maxim,max8660): regulators:regulator-v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/regulator/max8660.yaml#
pxa300-raumfeld-speaker-l.dtb: regulator@34 (maxim,max8660): regulators:regulator-v4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/regulator/max8660.yaml#
pxa300-raumfeld-speaker-l.dtb: regulator@34 (maxim,max8660): regulators:regulator-v5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/regulator/max8660.yaml#
pxa300-raumfeld-speaker-l.dtb: regulator@34 (maxim,max8660): regulators:regulator-v6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/regulator/max8660.yaml#
pxa300-raumfeld-speaker-l.dtb: regulator@34 (maxim,max8660): regulators:regulator-v7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/regulator/max8660.yaml#
pxa300-raumfeld-speaker-l.dtb: pinctrl@40e10000 (pinconf-single): 'led-pins-a', 'led-pins-b' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
pxa300-raumfeld-speaker-l.dtb: /pxabus/mmc@42000000: failed to match any schema with compatible: ['marvell,pxa-mmc']
pxa300-raumfeld-speaker-l.dtb: /pxabus/mmc@42500000: failed to match any schema with compatible: ['marvell,pxa-mmc']
pxa300-raumfeld-speaker-l.dtb: /pxabus/usb@4c000000: failed to match any schema with compatible: ['marvell,pxa-ohci']
pxa300-raumfeld-speaker-l.dtb: ssp@41000000 (mrvl,pxa3xx-ssp): $nodename:0: 'ssp@41000000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
        from schema $id: http://devicetree.org/schemas/spi/marvell,mmp2-ssp.yaml#
pxa300-raumfeld-speaker-l.dtb: ssp@41700000 (mrvl,pxa3xx-ssp): $nodename:0: 'ssp@41700000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
        from schema $id: http://devicetree.org/schemas/spi/marvell,mmp2-ssp.yaml#
pxa300-raumfeld-speaker-l.dtb: ssp@41900000 (mrvl,pxa3xx-ssp): $nodename:0: 'ssp@41900000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
        from schema $id: http://devicetree.org/schemas/spi/marvell,mmp2-ssp.yaml#
pxa300-raumfeld-speaker-l.dtb: ssp@41a00000 (mrvl,pxa3xx-ssp): $nodename:0: 'ssp@41a00000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
        from schema $id: http://devicetree.org/schemas/spi/marvell,mmp2-ssp.yaml#
pxa300-raumfeld-speaker-l.dtb: /pxabus/timer@40a00000: failed to match any schema with compatible: ['marvell,pxa-timer']
pxa300-raumfeld-speaker-l.dtb: /pxabus/display-controller@54000000: failed to match any schema with compatible: ['marvell,pxa300-gcu']
pxa300-raumfeld-speaker-l.dtb: /clocks/clocks: failed to match any schema with compatible: ['marvell,pxa300-clocks']
pxa300-raumfeld-speaker-l.dtb: /ssp-dai0: failed to match any schema with compatible: ['mrvl,pxa-ssp-dai']
pxa300-raumfeld-speaker-l.dtb: /ssp-dai1: failed to match any schema with compatible: ['mrvl,pxa-ssp-dai']
pxa300-raumfeld-speaker-l.dtb: spi (spi-gpio): gpio-miso: False schema does not allow [8, 98, 0]
        from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
pxa300-raumfeld-speaker-l.dtb: spi (spi-gpio): gpio-mosi: False schema does not allow [8, 97, 0]
        from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
pxa300-raumfeld-speaker-l.dtb: spi (spi-gpio): gpio-sck: False schema does not allow [8, 95, 0]
        from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
pxa300-raumfeld-speaker-l.dtb: spi (spi-gpio): 'sck-gpios' is a required property
        from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
pxa300-raumfeld-speaker-l.dtb: spi (spi-gpio): Unevaluated properties are not allowed ('gpio-miso', 'gpio-mosi', 'gpio-sck' were unexpected)
        from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
pxa300-raumfeld-speaker-l.dtb: dac@2 (ti,dac7512): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/iio/dac/ti,dac7512.yaml#
pxa300-raumfeld-speaker-l.dtb: gpio-keys (gpio-keys): 'on-off', 'rescue-boot', 'setup' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
pxa300-raumfeld-speaker-l.dtb: leds (gpio-leds): 'left', 'right' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#:%!

It would be good to at least address the warnings for nodes that
have an existing yaml binding. Converting the remaining others or
writing new ones takes more time and I wouldn't stress out about
those (yet).

    Arnd

