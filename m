Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BFACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4UXY/O1n8garPzUK7BlpEllKN6HEI5/pvuk32gImq0=; b=HSn5y2Y6NBBwxh
	OH/11kT4XrZswPgTIyupfNO9kfCXIzfaGgp8niicAZQLtg1NwZsymGEOOg/qLhX3lwrlEb2UWulLw
	9nwTStAOGs00e3y/aF5ehipsZ1jBU7Fsh9DL/MFPg4reXQTwAR/QkDF/Ie7vOSpHViBR9IXqzZAT9
	YSlhMWdCTtR+4R5WDLy8oeAPrbt2fdoWOKT5rDa/RhDzRlV2XMeBgFaQ5FpXuqAx1G21ard/nEhe1
	X8WorEGJTqah6G/6XA+Ny98SVtNYIbMfb0BSppE5K4yI2Z7WcjYdzx3hvlqX84rG/NxsYurBjOCX9
	KlFCZ4ih5pigusEAh3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKINW-0000000GpSy-1GF6;
	Tue, 05 May 2026 16:12:10 +0000
Received: from earwig.ash.relay.mailchannels.net ([23.83.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKINU-0000000GpRU-0bba;
	Tue, 05 May 2026 16:12:09 +0000
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C3B1040042C;
	Tue, 05 May 2026 16:12:06 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (100-96-24-249.trex-nlb.outbound.svc.cluster.local [100.96.24.249])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A21E5400DF3;
	Tue, 05 May 2026 16:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777997526;
	b=VTr7TGlcrQQJh7V1+2z9UiyLQCPDe+uOGK6XwFmgvxkfhFDcyvBrhsrD2mO3MzEwaTkaun
	dmBnUplnUTXN0C/8pzq0vzi2emcNBOa5DDhmPphKs/Zu9RqFjWZTL3Sj9CH9WZFQXcNnC1
	J//TfucxzzQWTu+sZLFwuzdOChJeyS4DOvVR6TlWF9g60cnVs38XyABeeTGcEUU2YGxAiJ
	7wNtgzaTvbZPeyFTF3cPDA3t9FCF/X9lF2QhIG9D1Vpma723vZfnhIEEvaFjtYtNDwo6kY
	eRBw8dntV90793Xt4Ki306ZGThI9zdKVe4e/u8cm8Jwxbpr6XboIve21J3tqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777997526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=O4UXY/O1n8garPzUK7BlpEllKN6HEI5/pvuk32gImq0=;
	b=6FRuuJqN8ZBX8prOKt/kIalj2pN3qf4Nb5OwTUAZtesJqSJ3gP3xmyozJ8/+BS5X/NOlsA
	0qAYF2xX0TV09czB23KAUh63IkCB/LNrAsE62LPeX95woHN63FPMPJwEZbfDvFlBQlSA8S
	bRbQL+5tIcIXxF7F3Id08geEmL2KfpYgzrlYm1Ij1eICKUhbziNRlO2kRJabaSnoLJiaIq
	KX5htLX78trx212oOLPq6aZRulDHfKkqAqFnu131HF+Fa3MUsFqpX3Zfu4yERszO5Yj4X7
	2PIzGHSSVefTLNwWfN7ZmTi3VLfg+FhEoJnj9+yqEI2YbDMAgtCPvd0c6V3Dyg==
ARC-Authentication-Results: i=1;
	rspamd-7766795c76-g2nwv;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Stretch-Celery: 71ee9a8704ca7cd7_1777997526695_4240053568
X-MC-Loop-Signature: 1777997526695:4274407990
X-MC-Ingress-Time: 1777997526694
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.24.249 (trex/7.1.5);
	Tue, 05 May 2026 16:12:06 +0000
Received: from [10.10.10.3] (unknown [109.228.203.208])
	(Authenticated sender: chester.a.unal@arinc9.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g93S01kzqz406B;
	Tue,  5 May 2026 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1777997522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4UXY/O1n8garPzUK7BlpEllKN6HEI5/pvuk32gImq0=;
	b=cqqREIpxtI/aaybTpgT+MCzSKcM4Q4HuWLNLVJY9whqtks0uzjeSBh5pz24N8kwxqSkhDr
	XjmlWKxOERed0sHJvxodML2FPP3gxdHWcP5JUhcbOHIcE8RWx2WAu3ERDRjvDareEL9CUY
	kZUPN3Cgw0j7Z01wCB8qrXE1S+CaQ5vtb5szY5jGrw8nz4cB1ilrBGH2gxX5i3mpYP2TZt
	DmSgC4f9yhXn0XS1nuaYIz8ZIm1gaJlOFj0hSsfajkieAWRA/6YZYA0xO2kzpuqbPLvl7g
	nyGziJpqIg+T0OfjmXZB5t6REwZEu+b640GPOq53g0TGhBJNPodj22KISNmTaQ==
Message-ID: <1a62de44-7fbb-46b3-8d6c-66dac7ef9c94@arinc9.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/5] net: dsa: mt7530: preserve VLAN tags on trapped
 link-local frames
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 DENG Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1777986341.git.daniel@makrotopia.org>
 <3ad4b724d7ae6250b8429d50fe913d2dca07a3f9.1777986341.git.daniel@makrotopia.org>
 <46071c08-d85f-4157-9d61-6a0feef56747@arinc9.com>
 <afoUt46gGwAC33ZU@makrotopia.org>
Content-Language: en-GB
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <afoUt46gGwAC33ZU@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue,  5 May 2026 16:12:00 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69fa16d2 a=CS7yVHPVoEopjVSexcYCQA==:117 a=CS7yVHPVoEopjVSexcYCQA==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8 a=GvHEsTVZAAAA:8 a=E8QqtcFgGylCMEfhWDkA:9 a=QEXdDO2ut3YA:10 a=6CpsfURP9XNmmWg3j1mJ:22 a=aajZ2D0djhd3YR65f-bR:22
X-CM-Envelope: MS4xfJcwCJVpL1ZtOgXAwEetgW+YoNBvGUQPfmTxMKooQpgL08qLBmkPPJT9r7YgekgaKNRoJ/wjtuoqxgnatbFlj/11pJPx8GLKuo+MZmXFw/WCY3T45xBP 5WbYH8ePugTJ0kc8bjAbKWKDIzwU2N3qszk0q5AQ9qRnwlR5wRD+s3LeeZ54ghfygM+Vol+AExOaR8HPsIPw/RalpnzgD8XdcwJcTuGCkrXZtvY3R1dAD0UH CJuH/J0d+7c4Nns/xevN6Gt8HPUbqm6Dh+BlRo4bOv8ZZh37z1qcAKLFcqlOba0/Nj1TSL40RXk7hMjTFeMedEggEu2a255jm60L/0VYdOG8G2PmUm1OZ7kD OiEYi9gVjup8hJ2G7orHrds12F3ntgZpfm915uBvg9b+hO7IhDEZlebtR88TfAbi4Au0kHv0UVbJq/YW5BVGIrUTItdB3klrFuK4rtN+SShMQdQfW5EyICQX FHgFR8uW6s1z0d7RgSS5IqNfQT2K0AXDFkE4uaa/0uv5k97Ez4zOGM+aR04M3FR7a/WGAzYN7bPPoZiy8sebYM0D8HU/wtdXwXEAICch3fmxi+vmoK5rSTzD Rmj9NhD9cqIH3grnaBt4gu61sI5xcnQDdBp5vr4j8ltfWCGBPnMmdcy6wMFX3JtrzAWidLOeiK88bJpakJAw7+cQDP9wMKfmdoUcBHCOLJM5msp17puLno6x Af9zAoY6PYFSfVxUBNEW80D5OTn395RI2HOFmhPgbNLN6vRV2HvPUg==
X-AuthUser: chester.a.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091208_334700_A13FBA46 
X-CRM114-Status: GOOD (  15.08  )
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

On 05/05/2026 17:03, Daniel Golle wrote:
> On Tue, May 05, 2026 at 03:37:29PM +0000, Chester A. Unal wrote:
>> Hey Daniel.
>>
>> On 05/05/2026 15:16, Daniel Golle wrote:
>>> The BPC, RGAC1 and RGAC2 registers control the handling of link-local
>>> frames with reserved MAC DAs (01:80:C2:00:00:0x). These frames are
>>> correctly trapped to the CPU port, but the egress VLAN tag attribute was
>>> set to MT7530_VLAN_EG_UNTAGGED which causes the switch to strip any
>>> VLAN tags from trapped frames before they reach the CPU.
>>>
>>> This causes VLAN-tagged link-local frames (STP BPDUs, LLDP, PTP Peer
>>> Delay Requests) to arrive at the CPU without their VLAN tag, so they
>>> are delivered to the base network interface instead of the VLAN
>>> sub-interface. The DSA local_termination selftest confirms this: all
>>> link-local protocol tests on VLAN upper interfaces fail.
>>>
>>> Set the EG_TAG attribute to MT7530_VLAN_EG_DISABLED (system default)
>>> so that the switch does not modify VLAN tags in trapped frames. This
>>> way VLAN-tagged frames retain their original tag and are delivered to
>>> the correct VLAN sub-interface, matching the behavior of non-trapped
>>> frames which pass through without VLAN tag modification.
>>>
>>> Fixes: 69ddba9d170b ("net: dsa: mt7530: fix handling of all link-local frames")
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>
>> Thank you for this patch. Could you please confirm that it conforms to the
>> findings documented on this patch log?
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=e8bf353577f382c7066c661fed41b2adc0fc7c40
> 
> Yes. Combining VLAN CTAG and DSA tag into single "mess" tag is what the
> MT7530 hardware does, and also what tag_mtk.c expects, and mtk_eth_soc
> "special tag" feature handles well.
> 
> I've found, addressed and verified all the issues in the series using
> the DSA selftests in tools/testing/selftest/drivers/net/dsa, ie. running
> bridge_vlan_aware.sh, bridge_vlan_unaware.sh and local_termination.sh
> in a loop, and random order, on BPi-R3 (MT7531) and BPi-R4 (MT7988).
> 
> With the series applied many of the previously failing tests are now
> passing.

Great to hear!

Acked-by: Chester A. Unal <chester.a.unal@arinc9.com>

Chester A.

