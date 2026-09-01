Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEF8C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaM3jU4o2eLseJzaumSG3mU1xqoFMK4JnncFkSoW6BI=; b=cKrdDCaQtICB9enHpnce/xbwYx
	VIDuZYUrlHA4A1zRhHy4mfQ/+rhEpmjOIjj647tdWloBfjdLTj1XwBcm4hhlMRkhkgNAWUQFG6Adu
	G0CQQEnAEr4wfBFAFaW2tjoe/AI6vum9jqqqSXuU4If4DX9+Q2zR6WdEQ6LPJWVt2RccWaLISHI2H
	xV/P5spPP8US9jkVekT4RViuqptSW4HQd3WPzPuDiS8aZ3P1AyWgeX2jgF+NzkSRSCRYc5Iae/+N0
	MX3NU5x7SvFjK88aCp32b/7PYqU0aU7C3URcpqbw+ROL+FEjbb/uxWURCCTSuLIe3Tt8alKsu8rZ4
	Zg7zX9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IY0-0000000B5Wb-2GzN;
	Tue, 01 Sep 2026 07:04:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IXx-0000000B5W1-28CT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:04:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 884E24E41491;
	Tue,  1 Sep 2026 07:04:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59C716053C;
	Tue,  1 Sep 2026 07:04:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E6C111C791BE;
	Tue,  1 Sep 2026 09:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788246276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zaM3jU4o2eLseJzaumSG3mU1xqoFMK4JnncFkSoW6BI=;
	b=v206OMzfYeQ7xEHxKAWOM1ctyzoIUou2/+W0y+dVbL+M4SfijKa5BWrW5WGJcxzHoaVz39
	k+WxEg+Vnf+EXsGS5ZZ7VvMw9Xkvehp9TX99d7CtRe9R6MEs7JhKV1zra/xiVSI9Csayzg
	jEZ4yUc4LqjQKg/1OxUmkHgT8heQODdZNCmZTNqrjbxjjqqZnNsPbGmnqY1qJ/VnPBoaG7
	ESyG1Y0VE7IzJqe5wU0GQJbVlj1Lkax1N6aYWzj1Mc2MZJAakiKN0EIWsIUs28d8p0thTb
	cOJnslXFyvqZVsOko5wI3mq7ATuumHBbXyKcqscJzQA2qoFNer7EE0i7OI9hDQ==
Message-ID: <b677535a-5395-4703-aa08-a71a6b26ccb6@bootlin.com>
Date: Tue, 1 Sep 2026 09:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac4: Read the UC filter size
 from hardware capabilities
To: Andrew Lunn <andrew@lunn.ch>
Cc: Nicolai Buchwitz <nb@tipi-net.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-2-maxime.chevallier@bootlin.com>
 <2631c832d5aebc56e152628132494545@tipi-net.de>
 <480f15e2-e045-46b7-89af-1fbcefd3c4eb@bootlin.com>
 <b2fbcec7-90ee-4a6f-bd15-32e4e1ff1a47@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <b2fbcec7-90ee-4a6f-bd15-32e4e1ff1a47@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_000441_715701_C50EBDBC 
X-CRM114-Status: GOOD (  20.72  )
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



On 9/1/26 02:26, Andrew Lunn wrote:
>> Yeah but dwmac4 has a hash filter, but same as the UC filter it's just not plumbed
>> in :/
>>
>> Let's leave this flag here, hash filter addition for MC filtering is coming-up, so let's not
>> drop it now only to re-enable it after, one of the other wonderful discoveries found by
>> running the selftests...
> 
> I assume you can put a MC address in a perfect match filter? You can
> perfectly match a multicast address just as well as a unicast address.
> 
> The hash filter is less accurate, but again can be used to match a
> unicast or multicast address, and then you need additional filtering
> in software, which Linux will do.
> 
> So it seems to me, you should use a perfect match filters if you have
> one available, independent of unicast or multicast, and only use a
> hash filter if you have run out of perfect match filters.

That's an interesting point. The HW supports that, we have 3 control knobs
for that in the MAC_PACKET_FILTER register :

 - HPF (bit 10) : Use Hash or Perfect Match for filtering.
                  0 : Match UC and MC against hash filter
                  1 : Match UC and MC according to HMC and HUC

 - HMC (bit 2) : Use Hash or Perfect Match for MC filtering
                 0 : Match MC against perfect filter
                 1 : Match MC against Hash table

 - HUC (bit 1) : Use Hash of PF for UC filtering
                 0 : Match UC against PF
                 1 : Match UC against Hash table

I don't know though how this all interacts with the primary MAC address. We
always have one entry in PF for the device's own MAC address, we should
probably always perfect match that one.

But as the UC Perfect Filter toggle is global for All UC addresses it means
we're stuck with perfect filter for all UC then ?

For MC, this is a good point, but I'm worried about the complexity vs gain.

If we consider the 4 dwmac boards I have (may not be a very representative sample),
we have :

 - imx8mp   : 64 PF (Perfect Fitler) entries
 - jh7110   : 9 PF entries
 - stm32mp1 : 4 PF entries
 - yt6801   : 1 PF entry

On a simple setup, between the IPv4 and IPv6 multicast, we very easily have at
least 3 multicast addresses assigned to our interface when it's brought up :

# ip maddr show eth0
2:      eth0
        link  33:33:00:00:00:01
        link  01:00:5e:00:00:01
        link  33:33:ff:00:af:d7
[...]

So on STM32MP1 this is already enough to fill the perfect fitler, any addition
trips either the promisc logic, or a more complex logic to re-split UC and MC into
Hash and Perfect filters separately

On YT8601, 1 PF entry, all MC to Hash, and any additional UC trips the UC-promisc mode.

I think in a typical setup, the UC table has more chance of getting filled than the hash
table, so a simpler option could be :

 - Always use hash for MC
 - Use perfect match for UC when possible
 - If perfect filter is full, use Hash for UC and MC matching, with
the idea that hash is still better than going UC-promisc ?

Maxime

