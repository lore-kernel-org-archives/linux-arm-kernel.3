Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C40C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnuFOlyRJRVamZb24JKzDuiyjdS5PGYnE9sLED1LlXU=; b=atg2gltfTd8pc1
	dq57c7qMXfs0fm+G+jILO16OEpV3GXvJINMASk5L3LAldwPDCXSk3vA8ZICoVyStYceQXRhFwS8IN
	MmoJCxZ/J//Q2DOi7EH3+HHhUgaAHTvsQnLK7plnPD1OVz+G3NB5aEvPTqvNf77NBvjNDA4pii1bg
	/+3ZYOsk4xdopNk/umxQaR+xnnaXbJjaecXGc2lyADa33j3Si+PI/ICrc4qarizbttKgy+Fud9Rtv
	grTQiX7Cp0vyO3DKCmcujbLBi3M77GSzt6nR0i812k98xmLgWIMZklemI8SMVkvpG23eXeXZJ1S1c
	U/q60pt3YGyzDjMNP+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tad8c-0000000AdUf-02qn;
	Wed, 22 Jan 2025 15:59:30 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tad7H-0000000AdJN-33RX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 15:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bnuFOlyRJRVamZb24JKzDuiyjdS5PGYnE9sLED1LlXU=; b=Z1JhKeuy0mvu2Q+FtxIAwol7RT
	P+oPlW5SX/67njXVvh0rFkwON0QTYYZqkyvfiLhglMlxs+extLgAcnx1T16A2Hm9aYoaLjtsz6OiT
	pProX8yeNSPEQXIuullTJj6QrCzBuvEgKpuc1b71t2BXWbGsXsRfalyZEv0NckRESHgdEzxU1cQpF
	IyLfPfuKGamHaTp9aRUz3L/mYU7yOxcABa+qlbjrZL2ErN1AycVvpyFQaWWZOIvk/1WCgsPmYBNEP
	QvR6dyLK2lq1vAsJS9g2pI6fTvR/Xdrnj0H0Dbmz/WreFEW6KH9gPmhBTQp+Yh0n41nELKv9LUv9v
	3X488dEQ==;
Received: from [122.175.9.182] (port=60338 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tad7D-0007lR-1h;
	Wed, 22 Jan 2025 21:28:03 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id BA1031784068;
	Wed, 22 Jan 2025 21:27:56 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 569521783FED;
	Wed, 22 Jan 2025 21:27:56 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PUtGIRL-p0Y2; Wed, 22 Jan 2025 21:27:52 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id F408D1781F6A;
	Wed, 22 Jan 2025 21:27:47 +0530 (IST)
Date: Wed, 22 Jan 2025 21:27:41 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <1841709010.384806.1737561461669.JavaMail.zimbra@couthit.local>
In-Reply-To: <2f02964f-d143-4340-8284-790b5aa2901e@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-4-basharath@couthit.com> <2f02964f-d143-4340-8284-790b5aa2901e@lunn.ch>
Subject: Re: [RFC PATCH 03/10] net: ti: prueth: Adds PRUETH HW and SW
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds PRUETH HW and SW configuration
Thread-Index: lVPYynRfah86sJk1Rb7/xZ62CgiYow==
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
X-CRM114-CacheID: sfid-20250122_075807_796639_3D8BDF9F 
X-CRM114-Status: UNSURE (   5.92  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


>> +/* Below macro is for 1528 Byte Frame support, to Allow even with
>> + * Redundancy tag
>> + */
>> +#define PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC	(VLAN_ETH_FRAME_LEN + \
>> +							ETH_FCS_LEN + 6)
> 
> Is 6 for the redundancy tag? Is the redundancy tag defined somewhere?
> Could this 6 be replaced by a #define, which is maybe a sizeof()?
>

Yes. 6 is for redundancy tag. We will create a MACRO and use 
MACRO instead of hard coded value.
 
>> +	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
>> +		 (!eth0_node || !eth1_node) ? "single" : "dual");
>> +
> 
> Is that really true? Is it not in dual mode, but only one interface is
> in use? I also wounder at the value of spamming the log like this.
> 

This might be valid if in case user decides to use only one MAC port by 
changing dts configuration.

Thanks & Best Regards,
Basharath

