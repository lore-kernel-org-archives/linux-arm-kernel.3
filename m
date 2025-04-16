Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2BDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XF1ouON7r19OevKldtRbjX0yHgsiXwfPXmVLBz5tEU=; b=JjbfTjnekFypTg
	80bhdOc6qsqKMUVw38fl0kkyM9m4GiFu1y2ZiTF0OePj4+TiUdfBtNZQRhOX27q5MFFTzNQrQnW1G
	V3IeSAhxfa8AnhN0dp50h/x1n/YfM6vdkAhv6I6q+WNhHzVfKmgPtL76o3XzKQ238TUQu85dA2rQF
	/UihsoIX0mUgp2RO71FlPQzqpFQC8iPR1Okl0GjqND9PjAgKvFfO0wXJzG9e/XnvjHyEsLZGaJV55
	3s6SqnDdqS1mq2HcVSgjmj3k3u1edYs29rRjaZiRJyBj41VrtXMzQWcCzkuMsjGMZp9IfYq84sVnC
	Su3V3xmzfqevgKXJhtDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51So-00000009QHl-3Jcx;
	Wed, 16 Apr 2025 12:01:59 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51Qw-00000009PqG-00qe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3XF1ouON7r19OevKldtRbjX0yHgsiXwfPXmVLBz5tEU=; b=TFJXzkSXznU2jJl8JPOsr2VVRp
	DjP8dl//vWxLNxcq+iTwxTVjJmlfe9KhHZyS7mQhY9ZSBYLmVk5XN+eRikwxZ6rZn+vYddIUEgVk3
	0GUMusS7Ydxjta7FsBpm8dUOBnCszM2Yidtr0UVThJt3yLaHU79vBOCWYoT3J6vuSmgq/CYZIB0Gg
	0RYbx8XIv0vrZYslVgm3PyM4xGB7di1mPpocCSqyrn4yV5hsEeag2gnsXxwqV1lNnWjm4ElBbOfKf
	xCE28OtPn9mcvIEfqe4Ec0+pCDLCckTePJSIB6EjX737yZyktIA7cs96ow6SFoWS7s18z8hx/CgyC
	2gB3Te2g==;
Received: from [122.175.9.182] (port=57370 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u51QB-000000006nZ-2HHQ;
	Wed, 16 Apr 2025 17:29:15 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id D1FBE1781A82;
	Wed, 16 Apr 2025 17:29:03 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id B22C7178247C;
	Wed, 16 Apr 2025 17:29:03 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KVGCnqemXVdZ; Wed, 16 Apr 2025 17:29:03 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 759F31781A82;
	Wed, 16 Apr 2025 17:29:03 +0530 (IST)
Date: Wed, 16 Apr 2025 17:29:03 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <1593029669.1081007.1744804743217.JavaMail.zimbra@couthit.local>
In-Reply-To: <5e394736-00c6-4671-a55e-6019ce245b01@lunn.ch>
References: <20250414113458.1913823-1-parvathi@couthit.com> <20250414130237.1915448-6-parvathi@couthit.com> <5e394736-00c6-4671-a55e-6019ce245b01@lunn.ch>
Subject: Re: [PATCH net-next v5 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ethtool support for ICSSM PRUETH Driver
Thread-Index: PiT+QqjjmPdkikvvwOrwQ08G5r5VPQ==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050002_078539_62F1ED4F 
X-CRM114-Status: UNSURE (   4.69  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

>> +static int icssm_emac_get_link_ksettings(struct net_device *ndev,
>> +					 struct ethtool_link_ksettings *ecmd)
>> +{
>> +	return phy_ethtool_get_link_ksettings(ndev, ecmd);
>> +}
>> +
> 
>> +static int
>> +icssm_emac_set_link_ksettings(struct net_device *ndev,
>> +			      const struct ethtool_link_ksettings *ecmd)
>> +{
>> +	return phy_ethtool_set_link_ksettings(ndev, ecmd);
>> +}
> 
>> +/* Ethtool support for EMAC adapter */
>> +const struct ethtool_ops emac_ethtool_ops = {
>> +	.get_drvinfo = icssm_emac_get_drvinfo,
>> +	.get_link_ksettings = icssm_emac_get_link_ksettings,
>> +	.set_link_ksettings = icssm_emac_set_link_ksettings,
> 
> The wrappers don't do anything, so why not just use
> phy_ethtool_get_link_ksettings() and phy_ethtool_set_link_ksettings()
> directly?
> 
> 	Andrew

Yes, the wrapper API does the same. We will clean this in the next version.


Thanks and Regards,
Parvathi.

