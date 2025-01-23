Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE8EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EWFkR8ZwsVB5EtOpQVLpbQnF99d1xPnEL8Z+nC+xqU=; b=xcTgdQ5I0IakVQ
	wTJ1zR4yERH+WOvXyor0kuyjQyzv1IpJkelXDDDmMhJn5+oaUUZoFiMOyvh5nbkYqAvSbc/sHEUnr
	qEiJOT1Q7IBkhsAaQ438rzbhb7rrfEI2Idd4sFZP/ung+jWm6NyOXrwRkfjy9btGqAfd5L03x2H66
	dQqeYTucXScc4mgpZFweW/yH86P9I4an83kmvQg6Ylm2XRN+s9sJBoZe9XbPaVitSrjtTBF9sIS7x
	4FcJl/Z4ubA0jFrYt8fb+NzY+gFZHOJtvPCq50AgCDflrwyx0FO+EOW9TytervotEQSoHiyRNbMhO
	dPdF2dSd8JYSxRdSPR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tarG6-0000000BpoF-1N9h;
	Thu, 23 Jan 2025 07:04:10 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tarEl-0000000BpYB-0yVf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 07:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6EWFkR8ZwsVB5EtOpQVLpbQnF99d1xPnEL8Z+nC+xqU=; b=ex+U+1wJtT2OCD1ASNGwka9QYY
	xypVpmUOShTnyedBAXKZOdNmwKEwkEacLFN7f/TAQ+0OBzV+if8OLP6Mrp9awA7pwB3O1hyqYa+Ab
	R7G9AGl8sjBGIKYVSRPim0M7DRpMmcEN99aZoYyzy4wdYibA5TYfjwhL8AaqgtcVeUGIthGMcUahK
	QtxztYiyCRAi/iMSapMZxoznwdah+M917B9Z3uxv1vIlXaDsqtwTQfiFyXBAnaj2pmeqDVRigdrlm
	dLfB4nG9A/K0Xkdpf6RVVd18J5DGXl9Q108c69M7VJvAIcRYbNtWAw3smTBQWquNhl0qZNtoiUgOH
	G+tsRBxw==;
Received: from [122.175.9.182] (port=19706 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tarEf-0007uX-2D;
	Thu, 23 Jan 2025 12:32:42 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id D476F1781A7D;
	Thu, 23 Jan 2025 12:32:29 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id B12FA1782495;
	Thu, 23 Jan 2025 12:32:29 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8r6jauI9kHCU; Thu, 23 Jan 2025 12:32:29 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 464731781A7D;
	Thu, 23 Jan 2025 12:32:29 +0530 (IST)
Date: Thu, 23 Jan 2025 12:32:29 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <951581664.391198.1737615749019.JavaMail.zimbra@couthit.local>
In-Reply-To: <fce8d698-2ae2-460c-a288-3d70d61dbf9e@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-5-basharath@couthit.com> <fce8d698-2ae2-460c-a288-3d70d61dbf9e@lunn.ch>
Subject: Re: [RFC PATCH 04/10] net: ti: prueth: Adds link detection, RX and
 TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: BN38BmJZ1YvXDCRq7dlK/kmFcsDoFg==
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
X-CRM114-CacheID: sfid-20250122_230247_353258_C92D32DC 
X-CRM114-Status: UNSURE (   8.87  )
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

>> +/* update phy/port status information for firmware */
>> +static void icssm_emac_update_phystatus(struct prueth_emac *emac)
>> +{
>> +	struct prueth *prueth = emac->prueth;
>> +	u32 phy_speed, port_status = 0;
>> +	enum prueth_mem region;
>> +	u32 delay;
>> +
>> +	region = emac->dram;
>> +	phy_speed = emac->speed;
>> +	icssm_prueth_write_reg(prueth, region, PHY_SPEED_OFFSET, phy_speed);
>> +
>> +	if (phy_speed == SPEED_10)
>> +		delay = TX_CLK_DELAY_10M;
> 
> How can speed to 10? You removed those link modes?
> 

We will clean it up in the next version.

>> +/**
>> + * icssm_emac_ndo_start_xmit - EMAC Transmit function
>> + * @skb: SKB pointer
>> + * @ndev: EMAC network adapter
>> + *
>> + * Called by the system to transmit a packet  - we queue the packet in
>> + * EMAC hardware transmit queue
>> + *
>> + * Return: success(NETDEV_TX_OK) or error code (typically out of desc's)
>> + */
>> +static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
>> +				     struct net_device *ndev)
>> +{
>> +	struct prueth_emac *emac = netdev_priv(ndev);
>> +	int ret = 0;
>> +	u16 qid;
>> +
>> +	if (unlikely(!emac->link)) {
>> +		if (netif_msg_tx_err(emac) && net_ratelimit())
>> +			netdev_err(ndev, "No link to transmit");
>> +		goto fail_tx;
>> +	}
> 
> Do many other MAC drivers have this test?
> 

This was an experimental safety check to avoid pushing anymore packets 
into PRU buffers when link down occurred but upper layers are not notified
yet. We will remove this check in the next version.

>> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
>> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
>> @@ -17,6 +17,11 @@
>>  
>>  /* PRUSS local memory map */
>>  #define ICSS_LOCAL_SHARED_RAM	0x00010000
>> +#define EMAC_MAX_PKTLEN		(ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN)
>> +/* Below macro is for 1528 Byte Frame support, to Allow even with
>> + * Redundancy tag
>> + */
>> +#define EMAC_MAX_FRM_SUPPORT (ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN + 6)
> 
> This looks familiar....
> 

We will use the MACRO instead of hard-coded value.

Thanks & Best Regards,
Basharath

