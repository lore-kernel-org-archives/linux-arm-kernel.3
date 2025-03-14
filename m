Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB664C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V654k5pAF6D8HBfTFnPa0CB2pEJli9tIg/z2exl4uXI=; b=FLIMmaFBhm/ZytpjBONIaT0Xcx
	G7g2rhzOTXkMUugXFSkbwZhDCz6E3lqsNEScBhvsN3wjA6zheDrobxlYFvb8+I41tjp4uG65PNWzn
	Y0c9g/NnPBBohFi1pWUNDpBGQanHvn4Co4Kfks67AA2ndq4CuSRgej+YAYhPPAf6B1msuXWVj9lle
	4HNompxmAR3jXeFjPHaqRXqfv5aZC3o8mr4pzfS9bwWax4idAZkxcKauTWyne5zi2Kn3TJ0iiQ/VS
	p3a0IY8qfyloeBHbfgkmed2Y7FsjedRLuckDZwNr5fEwuEDGyDPg1qwTFuV4vMFPQozeuF01KepSS
	Hb90uB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9E1-0000000Ewc3-1N77;
	Fri, 14 Mar 2025 17:53:37 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt90g-0000000EuMF-1C3Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:39:52 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C545711401C7;
	Fri, 14 Mar 2025 13:39:48 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 14 Mar 2025 13:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741973988;
	 x=1742060388; bh=V654k5pAF6D8HBfTFnPa0CB2pEJli9tIg/z2exl4uXI=; b=
	Qr8eTlcIyalonhqSe3CMMnShEhk64haYwLN+WFQBNNmIpPTFpm5AvPSeySuFnbu4
	06DjpP1vn00N+a4wSG9pJwAsmsazhEIPnu/azKhy6j30oUhpxBALpwyuHE8B5kPT
	/rnittt3L7j8lTJFQkIGI5vAjcVEIYAnwZ1wSZgPsuQeusW96EkEwgfvm7JpTFwL
	lX5GZiqPj8vSKO87yNCtGhbtSCU9xQ82s8MljLTXlfC2ntkKmXkrsW56Y4Rry8fo
	5KpajimJCD5b+yxQ38BjLSVVllKoq9TyTmxegvF5nHVgd41eHApaCNcloN2mAHAa
	jQ/8iMIVpcEmyyUqs2b4ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741973988; x=
	1742060388; bh=V654k5pAF6D8HBfTFnPa0CB2pEJli9tIg/z2exl4uXI=; b=P
	n6W0vyzr7uqXgdLHioKInC9skDEvsGv9sz0cdE9SbSZafPZg1OJOGOOUlo/ROvQr
	Z3R5Qx6N5EoYdl/0VfVuvuWQEVRETtEG+rUH7T4GZq9UMS9aeHWzOniKO1dnfjS5
	ybj4TokSf93pddhbJygqBuM0CI9Y5FQVHbxprBTKTaE9vkAYx0aeXeORHvdf6MUN
	1IsFibD3ZQzI1c5T3xgbx9WrlvniZU7F7Wq/8htMOtXhRt8fQVXiaHlQyG8ad2Mg
	JvSMCiAmSqJxIkwbQvYOmdr1G8LJhc20jIdfYi9GDM74Yy6zmAYr/IrRAUdI55jt
	67hHqX6RXfrOKacg7jcWg==
X-ME-Sender: <xms:4mnUZ2lrmvRoitLLGC7J7zFoy0_UjShHEUECn0srorIY6utafG-1Vg>
    <xme:4mnUZ90tAj0nRHqsU70IO71IUU9EUzVNHtR5rx9oC4i4BrAMSEvTw-4FlHvBGKijC
    qfMZHWTfUBiYffkEdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedugeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhhinhdqthhinhhgpghkuh
    hosegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopegrnhgurhgvfiestghouggv
    tghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepjhhovghlsehjmhhsrdhiug
    drrghupdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeif
    ihhmsehlihhnuhigqdifrghttghhughoghdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtg
    hpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4mnUZ0ptPtSAVK1mCgpsk0UTZ9p1VWhNSw27vSVwy-mk6G1v3gYdIg>
    <xmx:4mnUZ6lw4KXvrER1UjC36CTwtAgNfBBxvG7bZIhcGpn6-Hks-m9PBA>
    <xmx:4mnUZ02S1-ucRISkk0NH8BJ30_Ve143dMVMW1FZgPTP74EeqWmXBkg>
    <xmx:4mnUZxsVHT5G6bxA-tZ6iUZoAr5Tm3H1zOONT4JsO6ABbnDW3v_ZDQ>
    <xmx:5GnUZ6wNh2imRHzh5dAn9BBBmxi2uzGZTtr2T3f9wYYhUMbc6zHlQw0Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5145F2220073; Fri, 14 Mar 2025 13:39:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 18:39:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Arnd Bergmann" <arnd@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Message-Id: <71b81647-aa39-4c33-b92f-2c9e6d1e606d@app.fastmail.com>
In-Reply-To: <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
References: <20250314160248.502324-1-arnd@kernel.org>
 <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_103950_743456_E4F825AC 
X-CRM114-Status: UNSURE (   8.06  )
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

On Fri, Mar 14, 2025, at 18:37, Guenter Roeck wrote:
> On 3/14/25 09:02, Arnd Bergmann wrote:
>>   
>>   	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
>>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
>> +		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
>>   	}
>>   
>>   	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
> Does that help if the pointers are 64-bit on a 32-bit platform 
> (multi_v7_lpae_defconfig) ?

Yes, that is the problem: resource_size() returns a resource_size_t,
so this is a 32-bit by 64-bit division.

Pointers are always 32-bit, CONFIG_LPAE only changes phys_addr_t
and resource_size_t.

     Arnd

