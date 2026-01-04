Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06D1C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OGZWrSK/pBZyPvguxbiLvLVKORor8gaxhxXKMup7zw=; b=SWFG/v9/oS/gIqE4PZLwcZlipz
	m0Z68aI3Kr7WLAtzcL+SkDift6P120YcdIqha47Ut36e6mMa/yf1VO5fxeKOyL579yFpMdMDxs+2M
	bDh2OGAfP9xc3AEd86SFhbvw2l+bFAs/JT0011NQNTe1Bsdw4wQwjuNaOEXIsrkyCA+92tcentNnQ
	nmimjgYMHA20lirD0V9ZVNQobIZvy7+l9QVAX5luHcpJXqx388UjvDAFNr6LJpnGRsy91+cChew3n
	BDJQyg62F0/juI1EAV/Q+fWxbHM/BY6ZCUbWYmoIiZ6/QV32dmDXEPv3lGP0xpxMnBGSV8oVh+cQM
	7IL2eOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcLOy-0000000AAQs-17tY;
	Sun, 04 Jan 2026 10:32:00 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcLOt-0000000AALE-42oq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 10:31:57 +0000
Message-ID: <1814efa2-0b4c-42a5-a18a-eca5638cdd43@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767522576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OGZWrSK/pBZyPvguxbiLvLVKORor8gaxhxXKMup7zw=;
	b=pbhhV1905EQt9JEVAb1+D7LOOo/2UGmxJ3nRvamrlQZNFtu2Kl314pfwqXRKJW6gEZFSWw
	Z4LiNBz2zgBM+bpN4YfKbfMTRQfBZLD1zteV9yywb2W7MTI/nnIM02LqU2Q/DKt11lmZ46
	qSAncGxEYUxMMoEn+e47fddbx1rmjSc=
Date: Sun, 4 Jan 2026 10:29:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] net: mediatek: add null pointer check for hardware
 offloading
To: Andrew Lunn <andrew@lunn.ch>,
 Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>,
 Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Sebastian Roland Wolf <srw@root533.premium-rootserver.net>
References: <20260103005008.438081-1-Sebastian.Wolf@pace-systems.de>
 <6491ccf8-0318-421e-ba44-1565875e374c@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <6491ccf8-0318-421e-ba44-1565875e374c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_023156_148826_6099FC93 
X-CRM114-Status: GOOD (  10.14  )
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

On 03/01/2026 08:30, Andrew Lunn wrote:
> On Sat, Jan 03, 2026 at 01:50:08AM +0100, Sebastian Roland Wolf wrote:
>> From: Sebastian Roland Wolf <srw@root533.premium-rootserver.net>
>>
>> Add a null pointer check to prevent kernel crashes when hardware
>> offloading is active on MediaTek devices.
>>
>> In some edge cases, the ethernet pointer or its associated netdev
>> element can be NULL. Checking these pointers before access is
>> mandatory to avoid segmentation faults and kernel oops.
> 
> Would it make sense to return EOPNOTSUPP, or maybe ENODEV? This does
> seem like an error case.

The if condition checks for single device only, while the code was added
with introduction of multiple PPEs. I believe we have to check multiple
devices from eth[], but the author may know better (CCed Elad Yifee)

> 
>       Andrew


