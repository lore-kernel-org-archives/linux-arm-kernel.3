Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7607AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgunnjfEprEyEUPgYP1+kUccBZ3YjE+8YV+rdA6Sxx0=; b=wZaw+PVxL2qK88
	X4xndm3jujdqb+MkMKQNORYNtuuEW95XE/8FKNYnsBfuJZxJSme2GNgO/VyBevR5roQ1+QXB9rBt7
	ldNejvArCBoLU4koB/QPP/mEmhZ+Y8WLCYQvn4Q2AaqM4BEAEsyzEuOcQvYbGp0CK7D5UvLQTtlXe
	TzRRKCXA29E7kh5yltQGgEcCf5qRR95gguLBdF4vPWszV8L28Ux28A6JkqYEVUD4lOffnelq4CSnk
	3pHXXc62PtV5OM56Zt7JptFJT0LFyZ5w8Pkdzp9R2IQqORx18hG/b1QKdEu9gJb2nxxVREY9Gjee4
	lgK8Pg+KJMejMVQ5f2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmxa-00000001MYv-2rO7;
	Mon, 06 Jan 2025 13:15:58 +0000
Received: from buffalo.tulip.relay.mailchannels.net ([23.83.218.24])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmly-00000001K2v-3BWH;
	Mon, 06 Jan 2025 13:03:59 +0000
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 285CC164090;
	Mon,  6 Jan 2025 13:03:57 +0000 (UTC)
Received: from fr-int-smtpout5.hostinger.io (trex-2.trex.outbound.svc.cluster.local [100.109.211.86])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 82E7B161A97;
	Mon,  6 Jan 2025 13:03:53 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736168636; a=rsa-sha256;
	cv=none;
	b=Al67xvuDjV1w/VW3zt49Bw8pMKjVRFC9zvbe5M3LL8IcMugZb/mRT9UrvQkN+4qsIhANVC
	HQno4A4IBmXAl7ePOroKFRh0ewSfzhHu8eHsxOWKGJiISLorO3hcsVK8RCqo4qr4IQh6re
	Lkbvvi/snaLfIOP/OkgDmh3mzzK339a3W0HqVvhHlsKBVsYPsOYq3eLT6wlW0rytxO/G7T
	n0WgmBVQu9V/kB23j3XIVrjwJ8qtv82UTX0xdyVZwP2BstyUiOtDPzOg4v30n47YohacXT
	GHOcrG0dirkX9dxWiT1OPQ/or1L3dsNDX1FLPII3OSDc/Z/e0QdkidWfKAFhNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736168636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=XgunnjfEprEyEUPgYP1+kUccBZ3YjE+8YV+rdA6Sxx0=;
	b=aC3f3jKXL1Oht009qcD2a1nBPzXphJQ3l5ly29T8y3HEm6wExdyuSi3mH8mP76HXUlSbRy
	XT2bwjrZgMH4Nj3Rp0yDuYS+Wzyemm5po2YK6s2YZLfPP/YETLWefLC9r17AhPOJuDCc+W
	BvH8Vz7f54v6cZlfYYBD/w+HZiw7N11Yb/U5cMM3JC8+1HanOkNcJ0eWLnbGpiVeVN+sIT
	LwNDRHMW0KMsEe7zv39z0iYExbtDUiECO+scWyCXjilwTctbVEF95w1uJl5TYwh9lSTjKV
	v/1X+TU/JcP0DdS9/RfaaocS4v81IA8+z5EorSh304WEoAD8DAgyJyjRrLqgYQ==
ARC-Authentication-Results: i=1;
	rspamd-7c48484bf8-8b54m;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Attack-Battle: 131763bb7a50d5b3_1736168637037_1303998989
X-MC-Loop-Signature: 1736168637037:2752394756
X-MC-Ingress-Time: 1736168637037
Received: from fr-int-smtpout5.hostinger.io (fr-int-smtpout5.hostinger.io
 [89.116.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.211.86 (trex/7.0.2);
	Mon, 06 Jan 2025 13:03:57 +0000
Message-ID: <c133c8bf-d28f-437d-b5e1-f575959651ca@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1736168628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgunnjfEprEyEUPgYP1+kUccBZ3YjE+8YV+rdA6Sxx0=;
	b=Gy6/OD8XFvQii3YnmjbQH0VqO/Ykd9k0Jr94c64ckZhQHECZbIZfZmhGGSaN/nZne0WDrZ
	mxg0yqJmNZ/V2qNPiwUNUhm2rLzU0prfuHhLxkX6vR/1WNcNO9pqIUZX5cW0ikyprEmgAH
	xmOwjjnTU2NaCF0UaKsOO4Sz/+8Gh5Lf2wzyvaHlt61LuDq/ff5K4pqPMMcbfqwQhNTxf6
	ccVI5lhHvDe6+EVPlvBPkk1w9YMToWY9IjDi+g+7dN/PS0DLvncEZw0zcBdKGoNTmOAzTt
	d0/P5nmJ7e/izqgK6wYqv8ccn50qLSevi4WGafyjsDft8It44NmFecXmPZckQw==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/9] net: dsa: mt753x: remove ksz_get_mac_eee()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, "David S. Miller"
 <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
 <E1tUllF-007Uz3-95@rmk-PC.armlinux.org.uk>
Content-Language: en-GB
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <E1tUllF-007Uz3-95@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 06 Jan 2025 13:03:46 +0000 (UTC)
X-CM-Envelope: MS4xfOuJ73vLBHrLuVej0n1cCU7agxp9CmaswBEWG72vvoZew8+FZg1ujxav9c70yO4zR8J5S5YZ6mZ6oit6/TuWDr/6vXBvW+Aa+SzBM6zsGuKZMNikKVxN oTNqxP4x+swr3Jz9CrOGI4OkzwLE3Wl3aPfeJrP0QT99pED3UqZNdyyF/hun5m4ur3YT9yqhvL9g4045xcIamX7MKUJup6eU5jQIJWPHOl7OQjyRvC0rjTqr Xo8e1P3dYXUp/Ah0WFOtBun5TUpKpYtp54srXEpcg964gw9WWMd4oBUVN8XFAyTq2Ek/xOYPigeEcpSbWZUBbjExA9GdnxDwi9B7cYT1CtmGEuc+N79UKnoC FZ7lCfxZrOBUYMqC4JQ+Yk8LZq/gcNlxo8PvqMu6GT9mbJZay4gYF3fUuUtFRnzNu1nQYjEcXTpou6JXHNZvXJ6xgDdk7i9Asu3ImNb6n+1Hb/x4n8ruhJ3+ Y4cR1cpnjDn19Shvkll4oCPty1bzmcG3MXZ/KWI6PculF45+8bd24OIVZkQD2+Q0CBcIqKIX4fTwhNhZ+BmdqCjso3SZWkr2VqlglCJAh+h8YHn1tuAfk1U6 MA9whuMuxdIHw5HyQqgA4ZbZ7Y75p7cmFL1WNWct2Oty5u4ZBjnfUmjSwP9fjbMz/u8RpaNw/X9hHdVhbT8kHcF2Wu4Looyj4Ys7Ffevfm1dv8I5SC5njfmP cn3rvIQA6GbzTO5WcguhvKwfU+Ji7LFaKOsj8gcOKAkDPOhbf6VvBIIM45N2uZssE0Kw2M2JdLfia/6fA0pgitaW9tza24aa6dwizNFeQm20te/hOfsYG/Ao Q2jSwHa9j3fGaTv2SOAgDhYmW+8qnN7uP9ubKbWx
X-CM-Analysis: v=2.4 cv=H9KJwPYi c=1 sm=1 tr=0 ts=677bd4b4 a=xjZdIgyYDteOtQQgkZ0oAw==:117 a=xjZdIgyYDteOtQQgkZ0oAw==:17 a=IkcTkHD0fZMA:10 a=PHq6YzTAAAAA:8 a=GvHEsTVZAAAA:8 a=A3CJIOadstd3g-hVWj8A:9 a=QEXdDO2ut3YA:10 a=ZKzU8r6zoKMcqsNulkmm:22 a=aajZ2D0djhd3YR65f-bR:22
X-AuthUser: chester.a.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_050358_862835_40D22BD1 
X-CRM114-Status: UNSURE (   4.95  )
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

Hey Russell.

The patch subject mentions ksz_get_mac_eee() instead of
mt753x_get_mac_eee(). Keep that in mind if you happen to submit a new
version of this series; this is not enough as the sole reason to submit a
new version, in my opinion.

On 06/01/2025 11:59, Russell King (Oracle) wrote:
> mt753x_get_mac_eee() is no longer called by the core DSA code. Remove
> it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Chester A. Unal <chester.a.unal@arinc9.com>

Cheers.
Chester A.

