Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE3CC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3w+R1zOuJPY71/KjLfkxWemnLW1oSrZqC7s9lCEBRtY=; b=Ff8SFbAfYBYddP
	B0XVaPQsl1qiJRB2Y0rYWfDebLGjuguBb73Gyw9BGPTaTK311ArUvFU3+JJHM/9MuHNh1iOSRmEDi
	bzWHY9LLygrra7szH3iukNaLnGKn/8nV/G2NlDTKukQ1cWfOXIjCcQWpKjGB/9wSbpJyf6rZy6yTq
	Exjw1Q4HgnwtRy9w5nbtjOGYEc9RvLNDlUp5xHqPisViVBG4cES6iY7Dn8FBBdX51+pwAs8n3cMuo
	Lu/AmP91xidpovVSO5XaRHk5NTSkY4E9Sn9f5w6A8sFqdRpurIwBG4hGTcXjFm1S0tnA/eA6oPeoa
	ZZTBC56zRiSBag9GbbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriPn-0000000330J-2J1I;
	Thu, 28 Aug 2025 19:36:07 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgBS-00000002N8R-1Aeb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3w+R1zOuJPY71/KjLfkxWemnLW1oSrZqC7s9lCEBRtY=; b=mQpbwAPYB1wWBpiNJnJ3ZURQRE
	g9G72BFuIZwI3WmiDEtPaj4u0YDZGLQ31Eo2Kv7TzHKJoJLg7xygkX+Tr2FerBdNV5G73iaGTx1Ar
	iZWNExlCxfCOSs8Fj2HiTADJ5OL8mL/969t6raSzp94ImYL9Bwm6YfX5wWgoRtS5Eu2MGi8yWL8uO
	IeCZGM58IQO8A2Tz/XKnMRIM77rwwDpxOnDgzGaBU1I8kxnf8cITNdyDYX/p+Lw96tNepoBx6bV7Q
	LCT3CQXb3/3OmY0VmPerkJ5tw4FvAbuYP3a+TG24osxDVFfkGgyDYtI6l7kJwjpndFmMHFlDRhl5f
	V9gxXWOw==;
Received: from [122.175.9.182] (port=8338 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1urgAi-00000006HIe-3TIO;
	Thu, 28 Aug 2025 13:12:25 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 1C3841781C63;
	Thu, 28 Aug 2025 22:42:18 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id D57421781F94;
	Thu, 28 Aug 2025 22:42:17 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 33U0h1areI3V; Thu, 28 Aug 2025 22:42:17 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 796361781C63;
	Thu, 28 Aug 2025 22:42:17 +0530 (IST)
Date: Thu, 28 Aug 2025 22:42:17 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <1892122434.246137.1756401137255.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250827090820.12a58d22@kernel.org>
References: <20250822132758.2771308-1-parvathi@couthit.com> <20250822144023.2772544-5-parvathi@couthit.com> <20250827090820.12a58d22@kernel.org>
Subject: Re: [PATCH net-next v14 4/5] net: ti: icssm-prueth: Adds link
 detection, RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: icssm-prueth: Adds link detection, RX and TX support.
Thread-Index: 04+NkdyMJsTY7VdcDfyHFa/DcZsalw==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_101310_340354_0051986B 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan <johan@kernel.org>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Fri, 22 Aug 2025 20:09:16 +0530 Parvathi Pudi wrote:
>> +	struct net_device_stats *ndevstats;
> 
>> +	ndevstats = &emac->ndev->stats;
> 
> Please don't use netdev stats, quoting the header:
> 
>	struct net_device_stats	stats; /* not used by modern drivers */
> 
> Store the counters you need in driver's private struct and implement
> .ndo_get_stats64
> 

sure, we will verify and use the suggested approach.

>> +	if (!pkt_info->sv_frame) {
> 
> sv_frame seems to always be false at this stage?
> Maybe delete this diff if that's the case, otherwise it feels like
> the skb_free below should be accompanied by some stat increment.
> 

Yes, We will remove this for now.

>> +		skb_put(skb, actual_pkt_len);
>> +
>> +		/* send packet up the stack */
>> +		skb->protocol = eth_type_trans(skb, ndev);
>> +		netif_receive_skb(skb);
>> +	} else {
>> +		dev_kfree_skb_any(skb);
>> +	}
> 
> The rest LGTM.


Thanks and Regards
Parvathi.

