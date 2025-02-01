Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F374EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nb68TYL9t8PS/LozpmfjHUwS6470gMW71XEiwbzKw6A=; b=F48idAdNYi76QD
	YpgJqzzY7R8xhnFuLfFqIrA7NDBhp52ONyrxYXk/l1/28xds92IlKHvwGg41CiseckBgzX2QycPTV
	OM91s4CBYqWJ0JOH3EH4op5dJVix50RbQNFKMZGDxt59enO0gSMOCY5Elg7DYbU1zHQYfc/CNgQQM
	zeli4KE+2xmV2Op4EE2zKH+wWuUhY0q5RK0v5yreQ2OsSY4Tg1YgSgXtudR3gDFRFe5Bj9XQ5piDp
	WPW+JWSQuOGJrX6BY06v6g8MzIM8VaTlL8BV1xTS0eAhzuW2itiZoOYC4Ggfm1lABW12p+jM4A8G1
	hhX1RfgzDPDXFopw9ZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teDsw-0000000Chyl-0F5R;
	Sat, 01 Feb 2025 13:50:10 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teDrb-0000000Chlx-1eot
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 13:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Nb68TYL9t8PS/LozpmfjHUwS6470gMW71XEiwbzKw6A=; b=n9ZjdaM/i7qy0tJn7RUe8jEJ4J
	XREX0V7OJ3iWtN50yNNOwQQ3T7zNvTVgnqCxscsgkJvC9bqlQQbsMSYeaX9aIaVjBbyORue5YGOWo
	FdEe+PvxhdfRt+U8YUcjGGiWl4Ry1FKn6pHrTas4B2myFM77k5oz+LJYpFZOPkWePQnFnfxJ7OIMH
	iDfaeZyiUjI5j4aK3urYUi/LOK9UD7QdePo9vEC9nPrpjQyikLTPp6tZF825XCyyug/utraHbtzzL
	AN7PayCdfexg4Jif/QvutTiPTntboTUpCCDum7fGb0yhdoXHUqHjYGHf75L3buv1ifc6Q54J8MP6h
	PDfz1fSw==;
Received: from [122.175.9.182] (port=27502 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1teDrX-0004Dx-1v;
	Sat, 01 Feb 2025 19:18:43 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id DA0821781C56;
	Sat,  1 Feb 2025 19:18:37 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id BA5DD1782035;
	Sat,  1 Feb 2025 19:18:37 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VAvysSHs7gYN; Sat,  1 Feb 2025 19:18:37 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 747E01781C56;
	Sat,  1 Feb 2025 19:18:37 +0530 (IST)
Date: Sat, 1 Feb 2025 19:18:37 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: horms <horms@kernel.org>
Message-ID: <1332280195.481828.1738417717332.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250130172304.GD13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124134056.1459060-6-basharath@couthit.com> <20250130172304.GD13457@kernel.org>
Subject: Re: [RFC v2 PATCH 05/10] net: ti: prueth: Adds ethtool support for
 ICSSM PRUETH Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ethtool support for ICSSM PRUETH Driver
Thread-Index: vgALNNkSnZlxeSVy7G7hiRfdp6aaZw==
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
X-CRM114-CacheID: sfid-20250201_054847_468266_2A0D3BE5 
X-CRM114-Status: GOOD (  17.77  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


> On Fri, Jan 24, 2025 at 07:10:51PM +0530, Basharath Hussain Khaja wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Changes for enabling ethtool support for the newly added PRU Ethernet
>> interfaces. Extends the support for statistics collection from PRU internal
>> memory and displays it in the user space. Along with statistics,
>> enable/disable of features, configuring link speed etc.are now supported.
>> 
>> The firmware running on PRU maintains statistics in internal data memory.
>> When requested ethtool collects all the statistics for the specified
>> interface and displays it in the user space.
>> 
>> Makefile is updated to include ethtool support into PRUETH driver.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
> 
> ...
> 
>> +static const struct {
>> +	char string[ETH_GSTRING_LEN];
>> +	u32 offset;
>> +} prueth_ethtool_stats[] = {
>> +	{"txBcast", PRUETH_STAT_OFFSET(tx_bcast)},
>> +	{"txMcast", PRUETH_STAT_OFFSET(tx_mcast)},
>> +	{"txUcast", PRUETH_STAT_OFFSET(tx_ucast)},
>> +	{"txOctets", PRUETH_STAT_OFFSET(tx_octets)},
>> +	{"rxBcast", PRUETH_STAT_OFFSET(rx_bcast)},
>> +	{"rxMcast", PRUETH_STAT_OFFSET(rx_mcast)},
>> +	{"rxUcast", PRUETH_STAT_OFFSET(rx_ucast)},
>> +	{"rxOctets", PRUETH_STAT_OFFSET(rx_octets)},
> 
> Hi Roger, Basharath, all,
> 
> There seems to be some overlap between the above and struct rtnl_link_stats64.
> 
> Please implement those stats which are present in struct rtnl_link_stats64
> using ndo_get_stats64 and omit them from your implementation of
> get_ethtool_stats.
> 
> IOW, get_ethtool_stats() is for extended stats, whereas is for standard
> stats ndo_get_stats64().  And standard stats should not be presented to the
> user as extended stats.
> 
> Link:
> https://docs.kernel.org/networking/statistics.html#notes-for-driver-authors
> 

We will address this along with the changes that will be done by using 
rtnl_link_stats64 instead of legacy net_device_stats. 

>> +	{"tx64byte", PRUETH_STAT_OFFSET(tx64byte)},
>> +	{"tx65_127byte", PRUETH_STAT_OFFSET(tx65_127byte)},
>> +	{"tx128_255byte", PRUETH_STAT_OFFSET(tx128_255byte)},
>> +	{"tx256_511byte", PRUETH_STAT_OFFSET(tx256_511byte)},
>> +	{"tx512_1023byte", PRUETH_STAT_OFFSET(tx512_1023byte)},
>> +	{"tx1024byte", PRUETH_STAT_OFFSET(tx1024byte)},
>> +	{"rx64byte", PRUETH_STAT_OFFSET(rx64byte)},
>> +	{"rx65_127byte", PRUETH_STAT_OFFSET(rx65_127byte)},
>> +	{"rx128_255byte", PRUETH_STAT_OFFSET(rx128_255byte)},
>> +	{"rx256_511byte", PRUETH_STAT_OFFSET(rx256_511byte)},
>> +	{"rx512_1023byte", PRUETH_STAT_OFFSET(rx512_1023byte)},
>> +	{"rx1024byte", PRUETH_STAT_OFFSET(rx1024byte)},
> 
> Similarly, the above, along with rxOverSizedFrames and rxUnderSizedFrames
> below seem to be RMON (RFC 2819) statistics. So I think they should
> be handled by implementing get_rmon_stats().
> 

Sure. We will add get_rmon_stats() function and update necessary statistics
in that function.

>> +
>> +	{"lateColl", PRUETH_STAT_OFFSET(late_coll)},
>> +	{"singleColl", PRUETH_STAT_OFFSET(single_coll)},
>> +	{"multiColl", PRUETH_STAT_OFFSET(multi_coll)},
>> +	{"excessColl", PRUETH_STAT_OFFSET(excess_coll)},
> 
> And likewise, the section above and below seem to overlap
> with Basic IEEE 802.3 MAC statistics which I believe
> should be handled by implementing get_eth_mac_stats()
> 

For now we will remove these stats in the next version
and address this in the next series of patches.

>> +
>> +	{"rxMisAlignmentFrames", PRUETH_STAT_OFFSET(rx_misalignment_frames)},
>> +	{"stormPrevCounterBC", PRUETH_STAT_OFFSET(stormprev_counter_bc)},
>> +	{"stormPrevCounterMC", PRUETH_STAT_OFFSET(stormprev_counter_mc)},
>> +	{"stormPrevCounterUC", PRUETH_STAT_OFFSET(stormprev_counter_uc)},
>> +	{"macRxError", PRUETH_STAT_OFFSET(mac_rxerror)},
>> +	{"SFDError", PRUETH_STAT_OFFSET(sfd_error)},
>> +	{"defTx", PRUETH_STAT_OFFSET(def_tx)},
>> +	{"macTxError", PRUETH_STAT_OFFSET(mac_txerror)},
>> +	{"rxOverSizedFrames", PRUETH_STAT_OFFSET(rx_oversized_frames)},
>> +	{"rxUnderSizedFrames", PRUETH_STAT_OFFSET(rx_undersized_frames)},
>> +	{"rxCRCFrames", PRUETH_STAT_OFFSET(rx_crc_frames)},
>> +	{"droppedPackets", PRUETH_STAT_OFFSET(dropped_packets)},
>> +
>> +	{"txHWQOverFlow", PRUETH_STAT_OFFSET(tx_hwq_overflow)},
>> +	{"txHWQUnderFlow", PRUETH_STAT_OFFSET(tx_hwq_underflow)},
>> +	{"vlanDropped", PRUETH_STAT_OFFSET(vlan_dropped)},
>> +	{"multicastDropped", PRUETH_STAT_OFFSET(multicast_dropped)},
>> +};
> 
> ...

Thanks & Best Regards,
Basharath

