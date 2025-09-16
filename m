Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42FECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVY8HlUwyupRngH0FEF59/2yMgyALkZJuEelqwsIa+U=; b=WUsWTxv9x3szy/TD1PlDIKZNvF
	JTZqRDMmVsd1CHWHjD4HAo9V+wgT0Z7WqEuY5zkxq1ett0Q6u14aqBO9gCWBI6/bs7aMH0BiJ3E0i
	830Rh9P6pylvyNUIUDZBfWEPXzdxk5SdffFrrI+6UjpjDbwnvhBA0xM5XeIcubd3h4Vn1uuoC2P5+
	VtDifoEeR7IgBmzF0JOLmZY+cJmMs+Zsrzbb5wjNmtj3UvkIWUO/05HqDGEVuANtZxcFO/LwlSVtm
	Na6v1elU3SgrNHjJhuplou48P2Fd/SGCs/G9jnEXi4CR+ixoLJdqmJsRIGfe87Qnwapji9CKIWDbV
	y3JY/mLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyabH-00000008mmP-1EM4;
	Tue, 16 Sep 2025 18:40:23 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyabE-00000008mly-1o1H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 18:40:21 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id C43111D0000C;
	Tue, 16 Sep 2025 14:40:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 16 Sep 2025 14:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1758048018;
	 x=1758134418; bh=iVY8HlUwyupRngH0FEF59/2yMgyALkZJuEelqwsIa+U=; b=
	A72gXSkGR0ORvvJLEj+Ni1ff0qwqAypaE89Y5WCvHx4uq9gD/Rzjc6dC0QtdPd2S
	bShRP7eE4YfsKlJx0LiULmSWwH9RVKyGf0zNypohCKtx8oT2ArdHWKG+urxRLx+0
	rD2Jo2dO9e7+c9HxwYIudgaP1fsTiQN/E5g2sXOD+BVPaUidJnD7LePkodbERBge
	0Qa4fHYxahmfgxZiQrXyeopabno8R8uA610+bm6RBuNQQtjfl/xKhSC104V5Zi50
	CMzaMhLxlzW1ACRmulu6ybnvrhxj7Rn/Rx5e3fVaO35F7m3Vi039cnMsc2rwHKpy
	1Ow9AAcv3cb4LMzeVB1zsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758048018; x=
	1758134418; bh=iVY8HlUwyupRngH0FEF59/2yMgyALkZJuEelqwsIa+U=; b=S
	OXR+xj22pRvPxQKbXam3zW08wSzLSxmsLqWBUgzTZUCG9YG+j61UVWoeqVNC3JnW
	Zv0OFita/dUVv8GXnKdcJnmFubACZeOdsy2/WVPKUDfCyfScFgz+K9TjwmTDhF+D
	r0p2JgXiMO6osFKIsdJYxdtYYflJ9VYZ4lrxWuLAL3y/jmDc4GJ5xDj8xnYyJm+g
	b9XM2d38ioCKfrdGniGKSONtIV0umqtIpmyF8ZHCSB8iLXiEHu4qYV+GdgPP3hOM
	S9YdDAOh/oQJNRuyxkH7bkORbakaN8WtJzifz6vNMgiz/NTQsQPCXnvBGwEHoDyj
	wlR+5+YRVhlvkOWAUVkWw==
X-ME-Sender: <xms:Ea_JaBrgswY1n3OgOf8uFsoFQ98tQRkSvjkd2onlrzCbzwHTFov6Mg>
    <xme:Ea_JaC3isGkdjuavfDbgKACR0CWTYlLiInwCDzsIPumDu0CN2TO_eo7V_0v2iZciN
    8LA3wy__4On34jdbxg>
X-ME-Received: <xmr:Ea_JaA4mMjAr-dQna3dxZP4ppq3XCsyc-TbIAS5mHuoInirOXhvx1x8gXmfqJaLdoAT21C1f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptfgvsggvtggt
    rgcuvehrrghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvg
    hrnheplefhgeevleehieeuveduudfguedtieetteevhffgfffhhffhveffueegtdegkeek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsg
    gvtggtrgessghsughiohdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhope
    hrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegrnhgurhgvfies
    tghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:Ea_JaGQBxJSwEfGRMTko09bVz5_-F0ZDOf4WfUEOBLqMTSRM3h30Xw>
    <xmx:Ea_JaNWskqNpNikZwlmbx25ivU7o7NFWT53H4O7HR2ggKLW-rLN_eA>
    <xmx:Ea_JaDGLob01pBVEoWx9dvDvzvCjCkOeO3uF2zDq8j_GyIs9pVvNmQ>
    <xmx:Ea_JaIcbAdva1ahgGqMtAA2ZROdeuLJ7oVftUNTv0g9JxLZ66mnLzg>
    <xmx:Eq_JaArmjObCc7S5hs6xJ2BjYjMdRd5SH6Sz5cuJ0iNcOKfraFnUqi3g>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 14:40:16 -0400 (EDT)
Message-ID: <92bcdac9-44b1-4fc8-892a-01ef0ed0b7e0@bsdio.com>
Date: Tue, 16 Sep 2025 12:40:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250911051009.4044609-1-rebecca@bsdio.com>
 <20250911051009.4044609-3-rebecca@bsdio.com>
 <58a092c5-5dd0-4718-831a-e25ecb184087@lunn.ch>
 <5ccc4945-87f6-4325-b034-ca3f2f90257a@bsdio.com>
 <74e68c53-2696-4f86-97d3-c0b0a74d4669@lunn.ch>
Content-Language: en-US
From: Rebecca Cran <rebecca@bsdio.com>
In-Reply-To: <74e68c53-2696-4f86-97d3-c0b0a74d4669@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_114020_805466_EEEB937B 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

On 9/15/25 18:37, Andrew Lunn wrote:

> And does it have a PHY? On an MDIO bus? Unless i'm mistaken, you don't
> describe the PHY, a phy-handle pointing to the PHY, and don't have
> phy-mode = 'rgmii-id'.

I've been trying to figure this out. Yes, it's connected to a PHY (an 
RTL8211E).

At the moment it's being detected by OpenBMC as:

ftgmac100 1e680000.ethernet: Read MAC address 9c:6b:00:43:0b:bd from 
device tree
RTL8211E Gigabit Ethernet 1e680000.ethernet--1:00: attached PHY driver 
(mii_bus:phy_addr=1e680000.ethernet--1:00, irq=POLL)
ftgmac100 1e680000.ethernet eth1: irq 43, mapped at 7e548db4
ftgmac100 1e680000.ethernet eth1: Link is Up - 1Gbps/Full - flow control 
rx/tx


aspeed-g5.dtsi has:

mac1: ethernet@1e680000 {
     compatible = "aspeed,ast2500-mac", "faraday,ftgmac100";
     reg = <0x1e680000 0x180>;
     interrupts = <3>;
     clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>;
     status = "disabled";

};


It doesn't define a PHY, but I presume I can't define one without it 
conflicting with the definition of mac1.


-- 
Rebecca Cran


