Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB04EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5t4LO5iZc4495dyi2ppzMU1jd7cqzfUiUSRCJpWlCU=; b=c0TFtdl/J+u53e
	Wx91hGE5TcFfBs9SPgzLKDm9HB1n24/V0tPBXYxsuECnlH43735IrSa+Hy+vX70VG4fC8GBRuK8k2
	Yt5Mf8tssfNx4atW75fQBeBetHAbHItRzo6eMYEm/6B/PUvZn7GtX7GHyU6rP0BcV5wo+m+eoRb90
	0i6/NuezItGJTM7PHs0K2VvxLkBMBKmDbHzvj551cTCHjuI7IdnJA3HDxO8RIkaLeUTXRa4o0Osgf
	kUGaDux+fOEz5S+E19nv287Xp90xQpvK6bHa7V+JRqdqzBGBApOW4G+8lQsiEifGLtOJ4/ti6tdNb
	Yrdb+Ff0WUZGijK5+qXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOub-00000003zUN-06iq;
	Tue, 04 Mar 2025 09:50:05 +0000
Received: from cockroach.aspen.relay.mailchannels.net ([23.83.221.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOre-00000003yQb-1Ppl;
	Tue, 04 Mar 2025 09:47:03 +0000
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1B9A78C3E29;
	Tue,  4 Mar 2025 09:46:57 +0000 (UTC)
Received: from nl-srv-smtpout1.hostinger.io (trex-8.trex.outbound.svc.cluster.local [100.101.191.136])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E7C588C3ACC;
	Tue,  4 Mar 2025 09:46:53 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1741081616; a=rsa-sha256;
	cv=none;
	b=af7eV8eu4Ky/VzUdDADBUxjgxKKKs7u3q1Ev7az2ONYZp4OxvPhkZo6tgrdIRJd2itYF0h
	zrPfYU4JGa9mxZneKMiCPXRlWWtEowsV6wH5Si0VGLw+oZi3ot6njAU15PiHufC0VB3FtT
	CGaPVd/WJS6koZnsxf/xUIASrxiJf/+dWTK8OaQtu7mR6vx7DM9wfO2KfZDoYvH1v4A3Up
	/9oMWljF+mmEFKPrTA+ApQHX9ORnLDQDRBWMhjGdM/Nj91Oe6hFssniYCG6IjYPwnGraWb
	itnZqmA1/OyXlms4EQfS2aBktOWTzdwlWvDmeBLyMy2OllmPfIHM7p1uTLbjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1741081616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=D5t4LO5iZc4495dyi2ppzMU1jd7cqzfUiUSRCJpWlCU=;
	b=GiAtfS43kFwoJr/tRcZ9Zn8Pz6XjVCRaYleWaTx2nTh0ioce/VASeJBkMXIWwtcNX9c1tF
	vl8L1WEnDQuedsCyjqTv9cInWgcUbOI8k+jkuJaxabNhxKBOKUtDHWFu5SN3a1LzORLcVS
	3B5Rpu8xmYavOQmb2Hhq1dXqdjHebCJHaDedcM0rDOgNK8FIfU+2bVB2fJ81Uz2wcGHbY2
	MOz/fWFXHp9eFhvmv5khRrJBUNhIziGHOwk86F2ewRbT2okKv3aQAlrPOVNBHHEguDeh9A
	kliPmYOC9yQKc2Yiuxe4I2mjciRPRxjwV0z25+ZNMb0M5ouB5a7gM7qjadpMjg==
ARC-Authentication-Results: i=1;
	rspamd-58748c789d-w6rjb;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Bad
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Slimy-Shoe: 19d76dbe66a13cec_1741081616908_3888167419
X-MC-Loop-Signature: 1741081616908:8098079
X-MC-Ingress-Time: 1741081616908
Received: from nl-srv-smtpout1.hostinger.io (nl-srv-smtpout1.hostinger.io
 [145.14.150.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.191.136 (trex/7.0.2);
	Tue, 04 Mar 2025 09:46:56 +0000
Received: from [10.9.32.97] (unknown [185.182.236.36])
	(Authenticated sender: chester.a.unal@arinc9.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4Z6W6D2wtsz35BH3;
	Tue, 04 Mar 2025 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1741081590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5t4LO5iZc4495dyi2ppzMU1jd7cqzfUiUSRCJpWlCU=;
	b=O3QbHPIru7AnlxKZ0j2JcvM0aDko5YyybmfATwJ7W6Uyy0cYcrQ0Ay3i69qGkiy1nlWaYc
	1hWpE1a3EaybroRWRfsrOnJnL6kBJ6z5gCnUTJHTMxKVrs9DSkj0iBLAG6y/MkrZuhftMJ
	R++VBdvY03avb4Esfcfg4EWVS0Nn2MnBWTT9KcJruUXjzKOwRs6863OXMnuPxIeELxq0J0
	ZuyG6OlYYkt8NLFn3abG5liwj1OZXhB6AGl2oZgaPbYXoVwpo8/YhNSXLrv/Fg1wtRf7pP
	V8vuI1Pvaxpb3sOMYi/9mm1f2h85PsbKQa10PHLAk6fSnYDG31414GFXiFez+w==
Message-ID: <b63fcbaa-ef27-48a9-885c-7962bd92a8b9@arinc9.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: mt7530: Fix traffic flooding for MMIO
 devices
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250304-mt7988-flooding-fix-v1-1-905523ae83e9@kernel.org>
Content-Language: en-US
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <20250304-mt7988-flooding-fix-v1-1-905523ae83e9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 04 Mar 2025 09:46:28 +0000 (UTC)
X-CM-Envelope: MS4xfAak46EaWbKlaQAOOnK1fi3wYW/2+4l5aFepSvjx8uGgOA14qId//toYZLzeR8I+fViXYRlIlNrSjhVYMS07D3LEvzQpZSwyrxo5G9Gty/xvDUy3QReb 81z8mlUhj8RTJim8GAvhYmM6/pF4WuB98DsIwesDXLY0yHpEm/E4voVX2sYx/kRelHjE5ZBFitzVbCH6SbiW/rCQx6pIvy7WNTLecRcB4gK5PUnSvp6bgpI5 Vp8PZG773xMy9cwJSctfC0mHiuA7qSvV+toWfGyhQLx+BXpppAfLFYedocznA8KwlosasXFjoGihBHj2golKcOv0nfcU2dXferx/0xfaoGPlOcIKt7iabktN iA1sFATs9WZO9x3kSxeA8u0HpQbsPUk8JwvXAz/4qP7BTX5Kr6VPd7QoCEyK4d4jZfNG0kpgp9o9ch5t7YboX4IuSr2wCc7FVXkHFFM9wOnRdkfCqygd7Nes qmYirDGRadJL+OcTKysDx4Lkurf/dh8sR6T8eOa4D+633H0+QKjbxlbzKZyIzmaupWPgrbUydGKr3k0sgbv3j5wXbcJRhsyLqW/MOEHYH9wtACwUpPEkJCzM 0lOjmmauEwkKUWVjJhNGMxlojrEdw/Ov4DaRFHwbM0JHZmROfNaKWCZGkZae/Ku8PGSFRroLVy2cTdn+llFe4d+Ok3ttmbSFd85rV+z4OsljPg==
X-CM-Analysis: v=2.4 cv=F4sFdbhN c=1 sm=1 tr=0 ts=67c6cbf6 a=jLKKKTx0pIsUXH9Z8yxYVg==:117 a=jLKKKTx0pIsUXH9Z8yxYVg==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=GvHEsTVZAAAA:8 a=oMYzIxOzatuwx5kPrsYA:9 a=QEXdDO2ut3YA:10 a=aajZ2D0djhd3YR65f-bR:22
X-AuthUser: chester.a.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_014702_775596_C4476BDE 
X-CRM114-Status: UNSURE (   6.73  )
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

On 04/03/2025 08:50, Lorenzo Bianconi wrote:
> On MMIO devices (e.g. MT7988 or EN7581) unicast traffic received on lanX
> port is flooded on all other user ports if the DSA switch is configured
> without VLAN support since PORT_MATRIX in PCR regs contains all user
> ports. Similar to MDIO devices (e.g. MT7530 and MT7531) fix the issue
> defining default VLAN-ID 0 for MT7530 MMIO devices.
> 
> Fixes: 110c18bfed414 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

I was suspecting of this for a while. Thanks for addressing it.

Reviewed-by: Chester A. Unal <chester.a.unal@arinc9.com>

Chester A.

