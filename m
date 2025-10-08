Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4107CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 17:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9ffyoQQV2jOME14ODmiVvONWLYIqARldGSMUGBbO8M=; b=gMxDWSHyc3P5OB9/Hx8V1ZlSoR
	DR1EyR8WIgdoqGFWWgjBSIRTfG/rFPnJIOK6SbtHvLlE23sxyHUDgqX5TvXjP/FctxzVVioOKyN1S
	IvGMXlXA1De0T8RW9SwkAEY2L33Gp5D3X5FGsgsr6BBpVoPn8jXB3V9Tb7FwWJd0A+7jjPH8EFB/F
	Uw3JVAi9l4XJGsIeaix3pUWzSDEO6oBQdyceURhaSQZh7ax13gK6zZJ7NAausF1MZgwfgF8WiTI6x
	ohibdab2AH7ExIiGoBLJzTUlzd4Oub9zZ/33aDrKO7wPeM4nu+pW7XNfEydLgq8EDC+/GAmfm52O9
	gx7kFjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YPV-00000004Qds-0auB;
	Wed, 08 Oct 2025 17:57:09 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YPS-00000004QdN-3Nfi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 17:57:08 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3FA341400009;
	Wed,  8 Oct 2025 13:57:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 08 Oct 2025 13:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759946225;
	 x=1760032625; bh=P9ffyoQQV2jOME14ODmiVvONWLYIqARldGSMUGBbO8M=; b=
	oOQ0AZXBE6Th1KoTWR7rg8bM7107U1pFQtunpwoxKfmvrMY4PceSgF88StxS/uAA
	G8aqp5vywasoIkpOlvyDF2cCNgtPRjqMFPn7coUke3QPKvuEFxU9HKT/MghCatMM
	RmWT21b43ZWjzAU6nyPl27TtOdZDumMKtbTGDdfrb/ouH4O+gPfhW1bfw8uIZFYg
	ZTLmzPeuK3Jb5KNEjKd1IMZ/ZF5VGs3cx0BC7WKXta3FmtiHUyN8LmI3tls+sB67
	Q2r3jOQnGUqylCh9kNm9h72anStX1p4wXT2VjwCPyUgyCMoYtN/F9pGeWoxUMgY2
	PbZj0VyGSnXWUPO6GMeKqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759946225; x=
	1760032625; bh=P9ffyoQQV2jOME14ODmiVvONWLYIqARldGSMUGBbO8M=; b=x
	YjUaq7UaXeolq+j075yn1CkvpSJMlXN+GTbMofEF1Qpx2a6oem1mQk1Unc0V7Byj
	+qqMHueQ8Shxx3kFpc/6eziH7ua1YGuyBb737X13AoxzYllvNyns9q3vbQEy6guq
	LqQhFY1asuGtyDV3OUP66ErPlGY/3u1TNbapZ+Xp8/xh1gqyihn5sDmJpIgSfuo2
	Rr8iiKahxqWwFRdLTcaIORPOny7acO48gOWAhFGvRCJbQS/iUrRgMOtqntnSfF4w
	lpU43oc3D+532xmDThPMZ6rTmkl3YzNmV/aWxFA9cqxdy50M+5dAZxaBXnpKrOGY
	XcXmE6sdfQHx6uOtYxFfA==
X-ME-Sender: <xms:8KXmaHfI4aCKyGgA7qPREFU7iBIZe6LfCfMKU-Hj5cG_SJt0bpbYIA>
    <xme:8KXmaIAYgDXt-zII0IctqQt3gGks0cqiaq1VKcGeFFoVw5NM3JeM9KdRcmwUf6oBo
    CKvZ7OyqTmSsf3PrfBgqCVHgkfLCwgaLc3Hj-lGyxAS13RRyiZOCN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdefleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegthhgvshhtvghriedvheduheesghhmrghilhdrtghomhdprhgtph
    htthhopehjihhnghhoohhhrghnudesghhmrghilhdrtghomhdprhgtphhtthhopegshhgv
    lhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheptggrshhsvghlsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhifih
    hltgiihihnshhkiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhpihgvrhgrlhhi
    shhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghniheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:8KXmaA3wDIrJW9ljHhQjqC0rEnLXNwnDneYIzqdFULG53VnitRRbOw>
    <xmx:8KXmaK9iDBrCTA99sfPOd8BMaMdGJxJAzV7okxRVSPR5KGIXodG6JQ>
    <xmx:8KXmaGNFG0quGiFGqFXbnv4Y0Bej8JqGhgFJiBvha3qqWuZ1HFN53A>
    <xmx:8KXmaGA06Mbvpq45lKuGGE8vEsM8IRUFNHNkcgqUQXqIa5zcwXR7LA>
    <xmx:8aXmaCCKsByF2Lxor3unCFpiLI7dvwxNMG8TNND-xpq-CHbdKn6vEuQ5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8FBA5700054; Wed,  8 Oct 2025 13:57:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AIHrVq-NOQMk
Date: Wed, 08 Oct 2025 19:56:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manivannan Sadhasivam" <mani@kernel.org>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "NXP S32 Linux Team" <s32@nxp.com>, bhelgaas@google.com,
 jingoohan1@gmail.com,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, Ionut.Vicovan@nxp.com,
 "Larisa Grigore" <larisa.grigore@nxp.com>,
 "Ghennadi Procopciuc" <Ghennadi.Procopciuc@nxp.com>,
 ciprianmarian.costea@nxp.com, "Bogdan Hamciuc" <bogdan.hamciuc@nxp.com>,
 "Frank Li" <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 "Niklas Cassel" <cassel@kernel.org>
Message-Id: <3d480f73-15b4-4fb8-8d2b-f9961c1736ca@app.fastmail.com>
In-Reply-To: <2erycpxudpckmme3k2cpn6wgti4ueyvupo2tzrvmu7aqp7tm6d@itfj7pfrpzzg>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
 <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
 <aOU0w5Brp6uxjZDr@lpieralisi>
 <4rghtk5qv4u7vx4nogctquu3skvxis4npxfukgtqeilbofyclr@nhkrkojv3syh>
 <eba7d968-209d-4acb-ba41-4bebf03e96ba@app.fastmail.com>
 <4143977f-1e70-4a63-b23b-78f87d9fdcde@app.fastmail.com>
 <2erycpxudpckmme3k2cpn6wgti4ueyvupo2tzrvmu7aqp7tm6d@itfj7pfrpzzg>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105707_349379_7F8D164E 
X-CRM114-Status: GOOD (  18.93  )
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

On Wed, Oct 8, 2025, at 17:19, Manivannan Sadhasivam wrote:
> On Wed, Oct 08, 2025 at 10:35:34AM +0200, Arnd Bergmann wrote:
>> On Wed, Oct 8, 2025, at 10:26, Arnd Bergmann wrote:
>> > the physical addresses for RAM at 0x80000000 and on-chip devices
>> > at 0x40000000. This probably works fine as long as the total
>> > PCI memory space assignment stays below 0x40000000 but would
>> > fail once addresses actually start clashing.
>> 
>> I got confused here myself, but what I should have said is that
>> having the DMA address for the RAM overlap the BAR space
>> as seen from PCI is problematic as the PCI host bridge
>> cannot tell PCI P2P transfers from DMA to RAM, so one
>> of them will be broken here.
>> 
>
> No. The IP just sets up the outbound mapping here for the entire 'ranges'. When
> P2P happens, it will use the inbound mapping translation.

That is not my impression from reading the code: At least for
the case where both devices are on the same bridge and they
use map_type=PCI_P2PDMA_MAP_BUS_ADDR, I would expect the DMA
to use the plain PCI bus address, not going through the
dma-ranges+ranges translation that would apply when they are
on different host bridges.

> So your concern would be valid if the 'dma-ranges' (for which inbound
> translation happens) overlapped with the RAM/MMIO range. But that is not the
> case here.

dma-ranges should normally list all the memory controllers, so in
this case at least the 0x80000000..0xffffffff range of PCI bus
addresses must be routed from the host bridge to RAM. If a BAR
is assigned to the same numbers, I would expect a PCI bridge
to direct a DMA transfer downstream to that BAR instead
of upstream to the CPU even before it gets to the host bridge.

      Arnd

