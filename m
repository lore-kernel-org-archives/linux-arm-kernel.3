Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4E2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgpIYA1X3JY/hFPKIDfOS0L7idr7TKT6OBuNKuxgpM0=; b=tDnegLDDQrjaG/
	MLXE4SE821DEpf0BbsnmA1x7NeR3tIg7YRfTF64/1/R1/LGZYgXvfRJwqJCxO6Mqjh9dPw1egFcFk
	0yAR6qpn7vA9KbI5rBNCMjt7uMzxyqpPPT97UILtwwI++/ohyfK1Drvfu5zYrJdXBp0HN2rhXcGf0
	KHcbK31zG7EOXj/OV0eqUKJvSbJYN3LQOwFWuIJ6NsZn71tngEmKDkRDxydTQQYucaL3RCANkoaDh
	hzEuOAZxNIw6PdW62z4ytHtV3cEYKUQUFSlD3X95jtpJ+KWJS5qe+hAMnQQlJ1CpNhLzJwSfNvtRH
	jm/AgPardhqM8+BIfOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUgH-00000003tUe-2z71;
	Thu, 31 Jul 2025 14:54:53 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU09-00000003n4f-2ofQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dgpIYA1X3JY/hFPKIDfOS0L7idr7TKT6OBuNKuxgpM0=; b=RvDagKchEHmC4Ohnvrd5X4rHZh
	ZRwgwTS1WLBLNUGSdhpOKJ6ciErX4Oy4+FsGuJlmMA0otp9j/MJKstfLThqDqcZb3GBuOr3QSke5X
	DcTq1roXkeaza/POMx0wg5jChjGZj48LDOFEzu7IYBpemkuaaV37N6DnuXu1QZdpBcPflrlv2WhJe
	vJaRhV0ZqbnqdesZ6/0rnLU+KdlD1t8gIwWBTSUV1F5MfBIGtKNLYTmL5NCHHCYpacyAx1gojB0Ts
	eGxRd9bviVbDhlUmcGUoDPSN1Z7giUusyeg8t8Jf/upl9g1UF1hjxuIXtE58Q9Jyx0qJJ+q6LTxTU
	QcH/28sQ==;
Received: from [122.175.9.182] (port=5734 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uhU05-0000000EGZB-1GGq;
	Thu, 31 Jul 2025 10:11:17 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 124C81781F30;
	Thu, 31 Jul 2025 19:41:10 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id D14491783F55;
	Thu, 31 Jul 2025 19:41:09 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KDcsVC7gPY0O; Thu, 31 Jul 2025 19:41:09 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 775C11781F30;
	Thu, 31 Jul 2025 19:41:09 +0530 (IST)
Date: Thu, 31 Jul 2025 19:41:09 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Message-ID: <1942226614.78018.1753971069296.JavaMail.zimbra@couthit.local>
In-Reply-To: <743eddd9-1f63-4c6c-8ba3-5007bd897ae1@oracle.com>
References: <20250724072535.3062604-1-parvathi@couthit.com> <20250724072535.3062604-4-parvathi@couthit.com> <743eddd9-1f63-4c6c-8ba3-5007bd897ae1@oracle.com>
Subject: Re: [PATCH net-next v12 3/5] net: ti: prueth: Adds PRUETH HW and SW
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds PRUETH HW and SW configuration
Thread-Index: Bgd3ThmGCBL4ZbqhqpbvPS3WfmfZ0A==
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
X-CRM114-CacheID: sfid-20250731_071121_754061_5CF2F8DA 
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

>> +/* NRT Buffer descriptor definition
>> + * Each buffer descriptor points to a max 32 byte block and has 32 bit in size
>> + * to have atomic operation.
>> + * PRU can address bytewise into memory.
>> + * Definition of 32 bit descriptor is as follows
>> + *
>> + * Bits		Name			Meaning
>> + *
>> =============================================================================
>> + * 0..7		Index		points to index in buffer queue, max 256 x 32
>> + *				byte blocks can be addressed
>> + * 6		LookupSuccess	For switch, FDB lookup was successful (source
>> + *				MAC address found in FDB).
>> + *				For RED, NodeTable lookup was successful.
>> + * 7		Flood		Packet should be flooded (destination MAC
>> + *				address found in FDB). For switch only.
>> + * 8..12	Block_length	number of valid bytes in this specific block.
>> + *				Will be <=32 bytes on last block of packet
>> + * 13		More		"More" bit indicating that there are more blocks
>> + * 14		Shadow		indicates that "index" is pointing into shadow
>> + *				buffer
>> + * 15		TimeStamp	indicates that this packet has time stamp in
>> + *				separate buffer - only needed of PTCP runs on
> 
> only needed if PTCP runs on host
> 

Sure, We will address this.

>> + *				host
>> + * 16..17	Port		different meaning for ingress and egress,
>> + *				Ingress: Port = 0 indicates phy port 1 and
>> + *				Port = 1 indicates phy port 2.
>> + *				Egress: 0 sends on phy port 1 and 1 sends on
>> + *				phy port 2. Port = 2 goes over MAC table
>> + *				look-up
>> + * 18..28	Length		11 bit of total packet length which is put into
>> + *				first BD only so that host access only one BD
>> + * 29		VlanTag		indicates that packet has Length/Type field of
>> + *				0x08100 with VLAN tag in following byte
>> + * 30		Broadcast	indicates that packet goes out on both physical
>> + *				ports,	there will be two bd but only one buffer
>> + * 31		Error		indicates there was an error in the packet
>> + */
>> +#define PRUETH_BD_START_FLAG_MASK	BIT(0)
>> +#define PRUETH_BD_START_FLAG_SHIFT	0
>> +
>> +#define PRUETH_BD_HSR_FRAME_MASK	BIT(4)
>> +#define PRUETH_BD_HSR_FRAME_SHIFT	4
>> +
>> +#define PRUETH_BD_SUP_HSR_FRAME_MASK	BIT(5)
>> +#define PRUETH_BD_SUP_HSR_FRAME_SHIFT	5
>> +
>> +#define PRUETH_BD_LOOKUP_SUCCESS_MASK	BIT(6)
>> +#define PRUETH_BD_LOOKUP_SUCCESS_SHIFT	6
>> +
>> +#define PRUETH_BD_SW_FLOOD_MASK		BIT(7)
>> +#define PRUETH_BD_SW_FLOOD_SHIFT	7
>> +
>> +#define	PRUETH_BD_SHADOW_MASK		BIT(14)
>> +#define	PRUETH_BD_SHADOW_SHIFT		14
>> +
>> +#define PRUETH_BD_TIMESTAMP_MASK	BIT(15)
>> +#define PRUETH_BD_TIMESTAMP_SHIT	15
> 
> typo PRUETH_BD_TIMESTAMP_SHIT -> PRUETH_BD_TIMESTAMP_SHIFT
> 

Sure, We will address this.


Thanks and Regards,
Parvathi.

