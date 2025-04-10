Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB436C369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1af3Acrq13omiCmpt+yfFcpHFjByQr6jExJ1EFKRn6w=; b=FvRLc4+S5CaCNme4lxshMmQKP1
	L5h+u5NS8r87IogEXiUyIcatjJRPJaMgD3XEJZXsG5DlK/bmQJCIooAFRAFdFtOg2A3tXnyQaCkXe
	iObhLR9aOHmYeqC8G82lp7lUbvetdjybPLE8Q1Dj7gnV+kWLHuuquGLIywwHSSnJVxRx6my554i1u
	f6pyYHf3nzxbXebIYLbK0Z3SAhpvs4T1PIGd5MzZRuMCiIIA9cgwY/zHXzOPlhDslV2IJSIx6gfYR
	iUrjVjKRDVunJfhcEXa3BI6ZPCBVfSM+UkqZk6gA2ZrxpGHiwaZQ2fuCWdyZdzifbUxSo7U2cAGyB
	lxVzB3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rPr-0000000AZwz-0HdR;
	Thu, 10 Apr 2025 12:53:59 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rIh-0000000AYS6-2w8D;
	Thu, 10 Apr 2025 12:46:36 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B389A254020B;
	Thu, 10 Apr 2025 08:46:33 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 10 Apr 2025 08:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744289193;
	 x=1744375593; bh=1af3Acrq13omiCmpt+yfFcpHFjByQr6jExJ1EFKRn6w=; b=
	CTgul6S/PRDtZviO5Qr6XiWIQjRJhlNlaftnJevYu/kQvu1s8Z420F2Ibs97+uRw
	Q78FBsti/k939A+EgHm7EbBzkG8zXEBtM1c4DlNNSKVRp23v7RSojkDxqYWBK8bu
	JFJCbEHttBvbRcOCifjby3duW8p4mbrqO/jUQe09YRvYvahrbEHiTp6KZ8k2Vc4U
	8/wr3L3XpYzg/MYlmopmC0amruLXr5jD0Ex/l1PcNvOFybwV23hFgP/SDVXt4GFY
	DPpTpQmoQD5eULdN3gQfG2ASkAjFjpD1ABz2UPxjyHRkyELYjwyFkh5xJZ8PaGmQ
	8RnkXWG1qkQUdYF9105pqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744289193; x=
	1744375593; bh=1af3Acrq13omiCmpt+yfFcpHFjByQr6jExJ1EFKRn6w=; b=K
	apeDGnNm5BzuSGD5u4h+sayd3St/4HtGMW08wMmVL6Qmdlda+wwfyK39c4i9TLzv
	4OhaykoJb9H2dtdEgypwrpHW5/dJ3uaY6/qz5EXz5n1B5EwtX8L07PHpibcoQ6f/
	qnNNyIFQ7+JIzx9mAS3R1r8xt9ePn8/FWMXlw6I3uYHzzL5FRDlOP8UZc7QppbbR
	XVGzl7HYmbSbbTPJ7QUeBJeF43imDCywIf30n2TO5lHvjuhuJpvezAZNuraxnQDf
	cwcoo+NqgQYao17PKUBzMhp9Bgj/iwl9KAVmB2vZIMgwLN4XM0Nzfys6+CZcWbk0
	Ut89RCle7MFql0lYruPTw==
X-ME-Sender: <xms:qL33Z72OD5mAzq3NyH6zwHcRV4DKl2bxafPGEcgc9mnv_wQSxlhFpQ>
    <xme:qL33Z6GwD-puoPGmTiC3FCJrvsMUY7uubst4qSCcvJ_1UsIrzORCH8VEJ544wqidB
    OpC6qaUKK1WIjdGlGk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinh
    hugidrohhrghdruhhkpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordgu
    vghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnshhuvghlshhmthhhsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepughqfhgvgihtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthht
    hhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvgguuhhmrgiivghtse
    hgohhoghhlvgdrtghomhdprhgtphhtthhopehrughunhhlrghpsehinhhfrhgruggvrggu
    rdhorhhg
X-ME-Proxy: <xmx:qL33Z74yKyuv9T4pmEnAnQIrf6FHKoaFItdOIjFSdZid9siM6yKo5A>
    <xmx:qL33Zw27BgErfILdNjIIpynzf4X7HG4rJ8jFKr1LaQU_0XdhaCdQhw>
    <xmx:qL33Z-EWK24u-Mtl3szpATHpieoba8qfoPQUOvjWJT5GrOI_RzOX8Q>
    <xmx:qL33Zx-AOVVboYLW94rdIKplVfrhPWR8WUM4aYETGu13OdgJPoqXfQ>
    <xmx:qb33Z_8YEeexYNtkkz26Eyv4VIHGVq_pY59-ppJbee4kNWCVWNqGfGEV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4D3DE2220074; Thu, 10 Apr 2025 08:46:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T2340d8c52bdbc82d
Date: Thu, 10 Apr 2025 14:46:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Daniel Golle" <daniel@makrotopia.org>,
 "Qingfang Deng" <dqfext@gmail.com>,
 "SkyLake Huang" <SkyLake.Huang@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Simon Horman" <horms@kernel.org>,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <487b3b92-59e8-4ce5-88da-1d8176392d87@app.fastmail.com>
In-Reply-To: <67f7a015.df0a0220.287b40.53b2@mx.google.com>
References: <20250410100410.348-1-ansuelsmth@gmail.com>
 <c108aee9-f668-4cd7-b276-d5e0a266eaa4@app.fastmail.com>
 <67f7a015.df0a0220.287b40.53b2@mx.google.com>
Subject: Re: [net-next PATCH v2 1/2] net: phy: mediatek: permit to compile test GE SOC
 PHY driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_054635_797851_3548A721 
X-CRM114-Status: GOOD (  22.64  )
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

On Thu, Apr 10, 2025, at 12:40, Christian Marangi wrote:
> On Thu, Apr 10, 2025 at 12:31:05PM +0200, Arnd Bergmann wrote:
>> On Thu, Apr 10, 2025, at 12:04, Christian Marangi wrote:
>> > When commit 462a3daad679 ("net: phy: mediatek: fix compile-test
>> > dependencies") fixed the dependency, it should have also introduced
>> > an or on COMPILE_TEST to permit this driver to be compile-tested even if
>> > NVMEM_MTK_EFUSE wasn't selected
>> 
>> Why does this matter? NVMEM_MTK_EFUSE can be enabled for both
>> allmodconfig and randconfig builds on any architecture, so you
>> get build coverage either way, it's just a little less likely
>> to be enabled in randconfig I guess?
>>
>
> If we base stuff on the fact that everything is selected or that a
> random config by luck selects it, then COMPILE_TEST doesn't make sense
> at all.
>
> For my personal test, I wanted to test the driver on a simple x86 build
> without having to depend on ARCH or having to cross compile. Won't
> happen on real world scenario? Totally. I should be able to compile it?
> Yes.

Being able to compile test the driver yourself is clearly
a good idea, I just don't think that requires the dependency to
be conditional here.

>> I would expect this to break the build with CONFIG_NVMEM=m
>> and MEDIATEK_GE_SOC_PHY=y.
>> 
>> The normal thing here would be to have a dependency on
>> CONFIG_NVMEM in place of the NVMEM_MTK_EFUSE dependency,
>> or possible on 'NVMEM || !NVMEM' if you want to make it
>> more likely to be enabled in randconfig builds.
>> 
>
> The big idea of these dependency is that... In MTK the internal PHY of
> the switch needs calibration or it won't work hence it doesn't make
> sense to select the PHY as it won't ever work without the NVMEM driver.

That's not how dependencies normally work: the driver also fails
to work correctly if you are missing the correct pinctrl or led
driver, or the syscon, yet you don't list them explicitly because
you just need them for the machine to work correctly.

The driver dependencies should just list what you need to build,
regardless of whether you are compile-testing or building a driver
that is going to be used.

    Arnd

