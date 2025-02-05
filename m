Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A06C02196
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IX6S+s8EeF017CitJ0Amm6YZClGj6PE4I3uBra4Hybs=; b=BwmHydCvgcnTh6
	vxuW+OcpXsw6Do+9znvLKIwUExdSN5tyv6ByHlDq04OurBg2pqzTaEAQLIE+GjgRY5toD2Gs4CA+I
	1iCWx+hE4aQC/akZ5OI6NijjCppeInTCXJivKGEGZPqgTqzczKFPcbEYZaWJVCulxqF2gbVXUSfEc
	8kJvu4EjGbHQBxXZiT3eP9a8m0yBDxL29wpQft5c/byv2B2fDBo4h6yfmEpib6M79RBKbmReQVlp+
	oVr2moJuYnx365inmCyZ/KMMd0gITiJpahK0KOOAFP9a10Jl0WsGMjNRbyq3nO+5/40FToN2BUNXr
	QPtI16kBFz0D3bcMaahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfed0-00000003E7u-1anN;
	Wed, 05 Feb 2025 12:35:38 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeT9-00000003BtH-3caT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IX6S+s8EeF017CitJ0Amm6YZClGj6PE4I3uBra4Hybs=; b=T95rmct+50ggaPOhZQXO5EXRKt
	SzqAyadJCTHnS47NVlioNc1Nb+vLxPAxMOpb/Lr8N6osbpDCcdN63v47oQwPxLG9TM8iHpJQGOcKa
	mxfUIaLig+XCLE6k9KiHg/bwRQnirwkz8TUnYUGxFYUA5/ViyGYXOD+hP/JKOT4u8l3VSMrvUFPlm
	H/6yUK/K85IztWd1blooChHX+1sMKPOM64Hw8RUycuWB/maiQfnh2Sfo1LsHYBqhUiOwHa9mWe0MP
	LjtL2DQdm+BjakRd2wBYDjyWZnV9nem3EjF5AOtcxBURpkKNPC8nI4D4Hdx72wTfsOCuQneF/etw4
	X1lMPdKA==;
Received: from [122.175.9.182] (port=21369 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tfeSP-0007fK-0V;
	Wed, 05 Feb 2025 17:54:41 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 91D1A1783F46;
	Wed,  5 Feb 2025 17:54:32 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 708381783FF1;
	Wed,  5 Feb 2025 17:54:32 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NEkAupy8cBz9; Wed,  5 Feb 2025 17:54:32 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 003331783F46;
	Wed,  5 Feb 2025 17:54:31 +0530 (IST)
Date: Wed, 5 Feb 2025 17:54:31 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: horms <horms@kernel.org>
Message-ID: <1980208448.516541.1738758271732.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250131103352.GH24105@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124134056.1459060-7-basharath@couthit.com> <20250131103352.GH24105@kernel.org>
Subject: Re: [RFC v2 PATCH 06/10] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds HW timestamping support for PTP using PRU-ICSS IEP module
Thread-Index: hqQUi4g5G9OQqwwgSSWJWploNUaQCQ==
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
X-CRM114-CacheID: sfid-20250205_042527_930929_5B9A4708 
X-CRM114-Status: GOOD (  19.47  )
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


> On Fri, Jan 24, 2025 at 07:10:52PM +0530, Basharath Hussain Khaja wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> PRU-ICSS IEP module, which is capable of timestamping RX and
>> TX packets at HW level, is used for time synchronization by PTP4L.
>> 
>> This change includes interaction between firmware and user space
>> application (ptp4l) with required packet timestamps. The driver
>> initializes the PRU firmware with appropriate mode and configuration
>> flags. Firmware updates local registers with the flags set by driver
>> and uses for further operation. RX SOF timestamp comes along with
>> packet and firmware will rise interrupt with TX SOF timestamp after
>> pushing the packet on to the wire.
>> 
>> IEP driver is available in upstream and we are reusing for hardware
>> configuration for ICSSM as well. On top of that we have extended it
>> with the changes for AM57xx SoC.
>> 
>> Extended ethtool for reading HW timestamping capability of the PRU
>> interfaces.
>> 
>> Currently ordinary clock (OC) configuration has been validated with
>> Linux ptp4l.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> 
> ...
> 
>> @@ -682,9 +899,22 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16
>> *bd_rd_ptr,
>>  		src_addr += actual_pkt_len;
>>  	}
>>  
>> +	if (pkt_info->timestamp) {
>> +		src_addr = (void *)roundup((uintptr_t)src_addr,
>> +					   ICSS_BLOCK_SIZE);
> 
> Can PTR_ALIGN() be used here?
> 

We are making sure Both roundup() and PTR_ALIGN() will point to 
the same address location. We will change this in the next version.

>> +		dst_addr = &ts;
>> +		memcpy(dst_addr, src_addr, sizeof(ts));
>> +	}
>> +
>>  	if (!pkt_info->sv_frame) {
>>  		skb_put(skb, actual_pkt_len);
>>  
>> +		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
>> +		    pkt_info->timestamp) {
>> +			ssh = skb_hwtstamps(skb);
>> +			memset(ssh, 0, sizeof(*ssh));
>> +			ssh->hwtstamp = ns_to_ktime(ts);
>> +		}
>>  		/* send packet up the stack */
>>  		skb->protocol = eth_type_trans(skb, ndev);
>>  		local_bh_disable();
> 
> The code preceding the hunk below is:
> 
> static int icssm_emac_request_irqs(struct prueth_emac *emac)
> {
>	struct net_device *ndev = emac->ndev;
>	int ret;
> 
>	ret = request_threaded_irq(emac->rx_irq, NULL, icssm_emac_rx_thread,
>				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>				   ndev->name, ndev);
>	if (ret) {
>		netdev_err(ndev, "unable to request RX IRQ\n");
>		return ret;
>	}
> 
>> @@ -855,9 +1085,64 @@ static int icssm_emac_request_irqs(struct prueth_emac
>> *emac)
>>  		return ret;
>>  	}
>>  
>> +	if (emac->emac_ptp_tx_irq) {
>> +		ret = request_threaded_irq(emac->emac_ptp_tx_irq,
>> +					   icssm_prueth_ptp_tx_irq_handle,
>> +					   icssm_prueth_ptp_tx_irq_work,
>> +					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> +					   ndev->name, ndev);
>> +		if (ret) {
>> +			netdev_err(ndev, "unable to request PTP TX IRQ\n");
>> +			free_irq(emac->rx_irq, ndev);
>> +			free_irq(emac->tx_irq, ndev);
> 
> This seems somewhat asymmetric. This function does request emac->rx_irq
> but not emac->tx_irq. So I don't think it is appropriate to free emac->tx_irq
> here.
> 
> Also, I would suggest using a goto label for unwind here.
> 

Sure. We will clean this in the next version.

>> +		}
>> +	}
>> +
>>  	return ret;
>>  }
>>  
> 
> ...

Thanks & Best Regards,
Basharath

