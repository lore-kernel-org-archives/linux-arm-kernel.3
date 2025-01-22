Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E82C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcskuKqmEXV7K9kECUGgtRmCx7Ek1vR+0m10TiF37lo=; b=PpZ86OfJuJoXEg
	9xdF2cSAO/5l0h7EZaQayag7zLheB++hBQIT7Wf2xotQCmyBQddIfMYwlXUKFBCqfBKx3kE4o2iJo
	ZCs9ekNGd+N2bJtmCoECnX4UTTfjhS/MMZrkNKk2cJ72veafUB7EwugtOXNyWME72Ds+DrW8SB96N
	H/r4lw3PeKsQ5LVLsK33jD8mmtuJEOluWjs25igvszDEN7PB+YzZI/W+CLzddIyl8r0jIIzLTEQNJ
	sf3r80ePHSsta/DxYcFsDnQrkzeh7DZW99DqWC1EnFH5Ziwd3NZ/2XeDh3JMqQbRue0Xk0NkbNoK/
	kLugNoV6Wb2kJVWVRXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taah5-0000000AGQK-3eNv;
	Wed, 22 Jan 2025 13:22:55 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taafo-0000000AGK5-0yKm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DcskuKqmEXV7K9kECUGgtRmCx7Ek1vR+0m10TiF37lo=; b=KlvTx/SMqGVqY950WN5VNxqsNe
	RoisaltVI63Pcvp/g+/sIy9PUux9Gux0lK5vl/cV3Uz9iL3trlz6eCcLx6zTfmRVnt0+EuZtowFsZ
	lHYXRlmhGAaG8LaJqfjGqqKqSnWStZdR3mlrDW5O6p6cmT7uzftRs+Ii6/gkS9TSD0fS4vCybypQT
	fQ5c2nkJkvKfSHUx4+joqgkQSdu7h/+guSUcQqDluVlwOjhhtn0fMMm/hFlg4zZ13SDhXuqbgRtuc
	riy9EmuHugLdyh0rEt3va15DvsCe4a3WveLboyxw9meoVAI+mxY+bLQ2xoCo+0hmtm1EXiBMAZInP
	7eWuvq8g==;
Received: from [122.175.9.182] (port=2973 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1taafi-0004x2-2I;
	Wed, 22 Jan 2025 18:51:31 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 2F9FD1781C74;
	Wed, 22 Jan 2025 18:51:20 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 0DBDE1783FED;
	Wed, 22 Jan 2025 18:51:20 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pu07YBsJQNXF; Wed, 22 Jan 2025 18:51:19 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id AE53C1781C74;
	Wed, 22 Jan 2025 18:51:19 +0530 (IST)
Date: Wed, 22 Jan 2025 18:51:19 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <630653923.382482.1737552079551.JavaMail.zimbra@couthit.local>
In-Reply-To: <4a8fb859-e173-42bf-8d9b-8d6423f45a9b@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-2-basharath@couthit.com> <4a8fb859-e173-42bf-8d9b-8d6423f45a9b@lunn.ch>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree
 binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds device tree binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: 2UyMxDDiC8+8fqlFZHcZxeWj7+ll0A==
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
X-CRM114-CacheID: sfid-20250122_052136_300862_48E3DCB7 
X-CRM114-Status: UNSURE (   7.61  )
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


> On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
>> From: Parvathi Pudi <parvathi@couthit.com>
>> 
>> Documentation update for the newly added "pruss2_eth" device tree
>> node and its dependencies along with compatibility for PRU-ICSS
>> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
>> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
> 
> If i was to do a side by side diff with the ICSSG, how much would be
> the same? Does it make sense to refactor this into a yaml file for all
> the common properties, and then yaml files for all the specific
> properties?
> 
The main difference is ICSSM follows traditional memcpy approach and ICSSG
follows DMA based packet processing so there are lot of differences in 
transmitting or receiving a packet through PRU firmware. On top of that there
are considerable changes in the configuration of MMRs as well as other run time 
parameters. We tried to reuse as much as possible and where ever reuse was not 
possible we created separate instances.

Thanks & Best Regards,
Basharath

