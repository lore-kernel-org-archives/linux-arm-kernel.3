Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E9BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6m+k/1Y4Uh33GKZZUwcFzs8654vi6kkMP4rcv75Y0jk=; b=jLqCDpwE2V4uQ9
	ueLmnyJjrpWoG9suxgmnDR8FKN7zymcc8h0gpQ0TWEKixRlhs36Q71KfymBPaVPNvY95I/dImzCUq
	LB8x4gpJjPaLimmMQ8iPUIeZAT6A+8VIVIVc4pkFso4cwiZ2zzXN543SvHUaMLp9vqK3N9zxkUbQo
	i746Pxtg/0mE1CSO/QDqz//gwGYgLvYzegCQ+tYwnE79SQ9jvHUEy6QBGVIn0EtbyZqse7c8IXuQ8
	K3fFWS6+tapmCaHCsn752bWgphdWMTlyi8pbSecK3tyfOU8j1EmEUK37+Xmn7ows6DBYrbjBNTwgq
	yp52gGEtkmSYIqds2juA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tarae-0000000BrBx-3xjZ;
	Thu, 23 Jan 2025 07:25:24 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tarZM-0000000Br0m-1HSt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 07:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6m+k/1Y4Uh33GKZZUwcFzs8654vi6kkMP4rcv75Y0jk=; b=SgsLdvtu8BwBVCEyiJ85RcoLua
	NZhur8SM+haQkGsciU1J4WN1sJ+WNSbnBO83FK77bJ7RZDm9YDlIM+9nYulAX0vlNpdSyID1jr40f
	MHQZfH4gb/dyr94F0UgFytpvlduyUZD92ZWhC8BcQgRvXXjYDOc9P00CTKRfwgSv38HFzmEqXWsBl
	xRMw/CbArUhCNMUGF0dQ+hTMlazeV7bfs0PZgM7Gi3KGU2WN1SDRI7J2uTPytLGKEftRgllgoA3Jd
	b7fzLOFdY5hhYoyuzEc0XXJDHBK2XBRbcEznUWG9KVQDKE84Ts20xamB9hyTGosVHRs2qKO52iXmJ
	QMK+BRHQ==;
Received: from [122.175.9.182] (port=30001 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tarZG-0008Ks-1z;
	Thu, 23 Jan 2025 12:53:59 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 4D6711781A7D;
	Thu, 23 Jan 2025 12:53:51 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 280411782495;
	Thu, 23 Jan 2025 12:53:51 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id G6FJ-AEfZLuV; Thu, 23 Jan 2025 12:53:51 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id D07AB1781A7D;
	Thu, 23 Jan 2025 12:53:50 +0530 (IST)
Date: Thu, 23 Jan 2025 12:53:50 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: richardcochran <richardcochran@gmail.com>
Message-ID: <717976963.391348.1737617030636.JavaMail.zimbra@couthit.local>
In-Reply-To: <Z4KdxQMBXmkF37KI@hoboy.vegasvil.org>
References: <20250109105600.41297-1-basharath@couthit.com> <20250110055906.65086-7-basharath@couthit.com> <Z4KdxQMBXmkF37KI@hoboy.vegasvil.org>
Subject: Re: [RFC PATCH 06/10] net: ti: prueth: Adds HW timestamping support
 for PTP using PRU-ICSS IEP module
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds HW timestamping support for PTP using PRU-ICSS IEP module
Thread-Index: GveTHKWfgkR3edDiJqhjAdYwerPYPg==
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
X-CRM114-CacheID: sfid-20250122_232404_363109_856919F4 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> On Fri, Jan 10, 2025 at 11:29:02AM +0530, Basharath Hussain Khaja wrote:
> 
>> @@ -189,12 +190,37 @@ static void icssm_emac_get_regs(struct net_device *ndev,
>>  	regs->version = PRUETH_REG_DUMP_GET_VER(prueth);
>>  }
>>  
>> +static int icssm_emac_get_ts_info(struct net_device *ndev,
>> +				  struct kernel_ethtool_ts_info *info)
>> +{
>> +	struct prueth_emac *emac = netdev_priv(ndev);
>> +
>> +	if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
>> +		return ethtool_op_get_ts_info(ndev, info);
>> +
>> +	info->so_timestamping =
>> +		SOF_TIMESTAMPING_TX_HARDWARE |
>> +		SOF_TIMESTAMPING_TX_SOFTWARE |
> 
> The driver advertises software Transmit time stamping, but where is
> the call to skb_tx_timestamp() ?
> 
> I didn't see it in Patch #4.
> 

Yes. This module always uses IEP HW time stamping for better precision. 
We will clean this in the next version.

>> +		SOF_TIMESTAMPING_RX_HARDWARE |
>> +		SOF_TIMESTAMPING_RX_SOFTWARE |
>> +		SOF_TIMESTAMPING_SOFTWARE |
>> +		SOF_TIMESTAMPING_RAW_HARDWARE;
>> +
>> +	info->phc_index = icss_iep_get_ptp_clock_idx(emac->prueth->iep);
>> +	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
>> +	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
>> +				BIT(HWTSTAMP_FILTER_PTP_V2_EVENT);
>> +
>> +	return 0;
>> +}
> 
>> @@ -442,6 +482,173 @@ static void icssm_emac_adjust_link(struct net_device
>> *ndev)
>>  	spin_unlock_irqrestore(&emac->lock, flags);
>>  }
>>  
>> +static u8 icssm_prueth_ptp_ts_event_type(struct sk_buff *skb, u8 *ptp_msgtype)
>> +{
>> +	unsigned int ptp_class = ptp_classify_raw(skb);
>> +	struct ptp_header *hdr;
>> +	u8 msgtype, event_type;
>> +
>> +	if (ptp_class == PTP_CLASS_NONE)
>> +		return PRUETH_PTP_TS_EVENTS;
>> +
>> +	hdr = ptp_parse_header(skb, ptp_class);
>> +	if (!hdr)
>> +		return PRUETH_PTP_TS_EVENTS;
>> +
>> +	msgtype = ptp_get_msgtype(hdr, ptp_class);
>> +	/* Treat E2E Delay Req/Resp messages sane as P2P peer delay req/resp
> 
> s/sane/in the same way/
> 

This was a typo, We will address this in the next version. Firmware running in PRU 
treats E2E Delay Req/Resp messages same as P2P peer delay req/resp.

>> +	 * in driver here since firmware stores timestamps in the same memory
>> +	 * location for either (since they cannot operate simultaneously
>> +	 * anyway)
>> +	 */
>> +	switch (msgtype) {
>> +	case PTP_MSGTYPE_SYNC:
>> +		event_type = PRUETH_PTP_SYNC;
>> +		break;
>> +	case PTP_MSGTYPE_DELAY_REQ:
>> +	case PTP_MSGTYPE_PDELAY_REQ:
>> +		event_type = PRUETH_PTP_DLY_REQ;
>> +		break;
>> +	/* TODO: Check why PTP_MSGTYPE_DELAY_RESP needs timestamp
>> +	 * and need for it.
>> +	 */
>> +	case 0x9:
> 
> Delay response messages are PTP "general" messages and not event
> messages, and as such they do not require time stamps.
> 
currently firmware sends back timestamp even for E2E Delay_response message 
though this is a general message. To service that txts request we added this
here. We will revisit again and clean this in the subsequent versions.

Thanks & Best Regards,
Basharath

