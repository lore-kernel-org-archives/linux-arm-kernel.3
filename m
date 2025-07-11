Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24717C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CQ37NQ7OuN9s6t6lsJ/sx9p8s2M7suKYbs3UhLaa68=; b=r2aek8m797Gle8
	dcAgn8MTTrypgkJS3d3+C0/WPdN8/HJ8b7wanPVpAG+X0PidCCKRSUPQvbtmW6h/V9tS+W76NOUxj
	mtdm0/Da2Mun2PnMGgTWDBtKmGxnwxyPSkqEiZjz1lGb79Xiz72EsCnxBnyqwftbr6PffoNBYQdNN
	YoSV3YN9LSBhCZBzCBH+QoY9fCcoa8q3Ny7u3R8BL88mSt+MQLk5/DsSVbkKkiSp3sDN71C496MJJ
	SgIxrDHMC86KEsnpKqeQuUsXB4BU/HUUSbL+Toejs6x9BonEgl6/l0Q7pJeQFcfNnMEf7av3X+5wc
	cscryW2trmObbelEM2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCw9-0000000EkmS-0JWV;
	Fri, 11 Jul 2025 12:33:09 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCs4-0000000Ejx1-0qkn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9CQ37NQ7OuN9s6t6lsJ/sx9p8s2M7suKYbs3UhLaa68=; b=KdzVv9fJDf1XQb1jdC6biZosKz
	lhUsKc4Ozz7nrtcgc6s/SI5EEfw4iRs+htJe8XA15k9mVD2Qk2UefELYDwZMUtlWO+pq8bXpgYtgZ
	y8nFX+orCZl78nU9/vjraMiBO0jyYZUnPfYDHhX0J8LDx9cySJ3uMU0C6HU0Coz4clcvdDU1A6Ryu
	nFJcUWkVNZRKGgOuzjdYffIwmFGcY9hThz7zkqkCRMeux7i4wDSpgy5vC32r/I5/oYvRUTfe1BHMs
	WxnApWPSItDydhXJsM4hynyg9aaae/dRwMlGoLpaV17h45/vn9ExI5zwFfJpmZ7Lg3kUyopb5gArl
	rruzo1Jw==;
Received: from [122.175.9.182] (port=2219 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uaCs0-0000000CkzW-2aDI;
	Fri, 11 Jul 2025 08:28:53 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 04F771783F55;
	Fri, 11 Jul 2025 17:58:47 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id DF13117820AC;
	Fri, 11 Jul 2025 17:58:46 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Zb1_7GMlzRER; Fri, 11 Jul 2025 17:58:46 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 9F2B61781A71;
	Fri, 11 Jul 2025 17:58:46 +0530 (IST)
Date: Fri, 11 Jul 2025 17:58:46 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <1955816878.1712472.1752236926517.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250708175301.599c82b8@kernel.org>
References: <20250702140633.1612269-1-parvathi@couthit.com> <20250702140633.1612269-4-parvathi@couthit.com> <20250708175301.599c82b8@kernel.org>
Subject: Re: [PATCH net-next v10 03/11] net: ti: prueth: Adds PRUETH HW and
 SW configuration
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds PRUETH HW and SW configuration
Thread-Index: X8jfoHwLggsJP12Hu9W5PyGLi3G3FQ==
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
X-CRM114-CacheID: sfid-20250711_052856_272388_DD30013D 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Wed,  2 Jul 2025 19:36:25 +0530 Parvathi Pudi wrote:
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> index aed5cdc402b5..f52858da89d4 100644
>> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> +	txcfg = PRUSS_MII_RT_TXCFG_TX_ENABLE |
>> +		PRUSS_MII_RT_TXCFG_TX_AUTO_PREAMBLE |
>> +		PRUSS_MII_RT_TXCFG_TX_32_MODE_EN |
>> +		(TX_START_DELAY << PRUSS_MII_RT_TXCFG_TX_START_DELAY_SHIFT) |
>> +		(TX_CLK_DELAY_100M << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT);
> 
>> +	/* Min frame length should be set to 64 to allow receive of standard
>> +	 * Ethernet frames such as PTP, LLDP that will not have the tag/rct.
>> +	 * Actual size written to register is size - 1 per TRM. This also
>> +	 * includes CRC/FCS.
>> +	 */
>> +	txcfg = (((PRUSS_MII_RT_RX_FRMS_MIN_FRM - 1) <<
>> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_SHIFT) &
>> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_MASK);
> 
> Please use FIELD_PREP() instead of defining separate _MASK and _SHIFT
> values.
> 

Sure, we will use FIELD_PREP() to align with kernel bit-field handling.

>> +	/* For EMAC, set Max frame size to 1528 i.e size with VLAN.
>> +	 * Actual size written to register is size - 1 as per TRM.
>> +	 * Since driver support run time change of protocol, driver
>> +	 * must overwrite the values based on Ethernet type.
>> +	 */
>> +	txcfg |= (((PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC - 1) <<
>> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT)	&
>> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK);
> 
>> +struct prueth_queue_desc {
>> +	u16 rd_ptr;
>> +	u16 wr_ptr;
>> +	u8 busy_s;
>> +	u8 status;
>> +	u8 max_fill_level;
>> +	u8 overflow_cnt;
>> +} __packed;
> 
> Please don't use __packed if the struct will be packed anyway based on
> C packing rules.

We will address this in the next version.

Thanks and Regards,
Parvathi.

