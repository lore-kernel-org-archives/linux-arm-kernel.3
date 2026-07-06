Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E202CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/vMmcC4kWrSghj9zOYbdr017eZqpNDv49JorGXwtkQ=; b=PbUxM/7JYFBd+xRvYyPVG4ztlS
	8JlN7yImRaFUmhiqQvL+Y5S6k4lv6IHVmOR22GPMfvGGepHHQGKlYVa1Rp9IEjZfFGVS0I2h1DV8q
	j0rHnGU9wZLFq7HuvJ/phWE0URkxA2G4wLoB5MbQjnKapbr1k2OrC1W/FSyKmwukHw1JbeVI1cQVx
	6T7R4dsI5ZiNH/uNUDYAwHtNXm1Tfhs4+9FXZgKSCN7wx0NP5XjCigfYCDK0S5K8H/HGDlhym4YTF
	ggJ3993j3xUb0mGnJ2fhQNSjpgSwUxzUqH7YjBQLyd9eQmGK0wb1bOXblLMYCMwZRm/3917yQAboe
	PO2kAbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfOg-0000000ByJx-0w1q;
	Mon, 06 Jul 2026 09:13:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfOc-0000000ByIh-2Y8T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783329225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/vMmcC4kWrSghj9zOYbdr017eZqpNDv49JorGXwtkQ=;
	b=JZPs3RhTS/3UbKXTFWPGoR2J9lzVo7GJRKiHxAEIxC93eYuUlk5yHGoO6dkLD9rSQ1stMf
	p+L7XWdooRiBTScROjOygufSKhIVcgdoj5z13oKtDRL84Ju0gzBXsbWwwLCIknSCio4hrO
	n42m1oG/Pq0Ef5XrqomH1WzQoa7IVB4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-7D3y0LjYNc-pGmC_Q9qfLw-1; Mon,
 06 Jul 2026 05:13:41 -0400
X-MC-Unique: 7D3y0LjYNc-pGmC_Q9qfLw-1
X-Mimecast-MFC-AGG-ID: 7D3y0LjYNc-pGmC_Q9qfLw_1783329219
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 536F31800846;
	Mon,  6 Jul 2026 09:13:38 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.156])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 453EE300070A;
	Mon,  6 Jul 2026 09:13:31 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: parvathi@couthit.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	pmohan@couthit.com,
	afd@ti.com,
	basharath@couthit.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	m-malladi@ti.com,
	krishna@couthit.com,
	mohan@couthit.com
Subject: Re: [PATCH net-next v2 2/3] net: ti: icssm-prueth: Add priority based RX IRQ handlers
Date: Mon,  6 Jul 2026 11:13:28 +0200
Message-ID: <20260706091328.134740-1-pabeni@redhat.com>
In-Reply-To: <20260630124958.894360-3-parvathi@couthit.com>
References: <20260630124958.894360-3-parvathi@couthit.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Jg4AkXFdcyJ7rqcD8TrTnaSyy5bLAbpI43IKuXdRNA0_1783329219
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021346_762619_AFEDD34E 
X-CRM114-Status: GOOD (  30.65  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: AI Reviewer <ai@example.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/
---
net: ti: icssm-prueth: Add priority based RX IRQ handlers

This patch adds support for priority based interrupt handling for the STP/
RSTP Switch, HSR and PRP protocols along with extra logic to address first
come first served to avoid port dominance. The driver will read the RX HW
timestamp from the frame to achieve wire-arrival ordering.

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
[ ... ]
> @@ -1188,26 +1188,26 @@ static int icssm_emac_ndo_stop(struct net_device *ndev)
>  	/* disable the mac port */
>  	icssm_prueth_port_enable(emac, false);
>  
> +	netif_stop_queue(ndev);
> +
>  	/* stop PHY */
>  	phy_stop(emac->phydev);
>  
> -	napi_disable(&emac->napi);
>  	hrtimer_cancel(&emac->tx_hrtimer);
>  
[ ... ]
>  	/* stop the PRU */
>  	if (!PRUETH_IS_EMAC(prueth))
>  		icssm_prueth_sw_shutdown_prus(emac, ndev);
>  
>  	if (prueth_is_lre(prueth))
>  		icssm_prueth_lre_cleanup(prueth);

[Severity: High]
This is a pre-existing issue, but is the LRE duplicate detection timer
prematurely canceled when a single port goes down?

In icssm_emac_ndo_stop, icssm_prueth_lre_cleanup is called unconditionally
when any interface is brought down.

If one port in the HSR/PRP bridge goes down while the other remains active,
this cancels the shared tbl_check_timer, potentially causing duplicate
frames to stop being detected and dropped by the hardware.

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
> @@ -0,0 +1,286 @@
[ ... ]
> +static int icssm_prueth_common_emac_rx_packets(struct prueth_emac *emac,
> +					       int quota, u8 qid1, u8 qid2)
> +{
[ ... ]
> +		if ((*pkt_info_p).length < EMAC_MIN_PKTLEN) {
> +			/* Undersized frame: firmware should have filtered
> +			 * these before they reach the host queue. Advance
> +			 * the read pointer to skip it.
> +			 */
> +			update_rd_ptr = *bd_wr_ptr_p;
> +			ndevstats_p->rx_length_errors++;

[Severity: High]
This is a pre-existing issue, but does this error path flush the entire
pending RX queue?

When the driver detects an undersized or oversized packet, it attempts to
skip it by updating the read pointer. However, setting update_rd_ptr to
*bd_wr_ptr_p appears to assign the hardware's write pointer (the very end of
the queue), rather than advancing by one descriptor.

Could this discard all pending descriptors instead of just the malformed one?

[Severity: High]
Does this introduce a race condition on the network statistics?

This patch introduces split NAPI polling with separate priority threads
(napi_hpq and napi_lpq) that process the high and low priority queues across
both physical ports. These NAPI instances can be scheduled on different CPUs
concurrently.

Both instances invoke icssm_prueth_common_emac_rx_packets, which updates raw
unsigned long statistics like ndevstats_p->rx_length_errors (and 64-bit
stats like emac->stats.rx_bytes in icssm_emac_rx_packet) using += without
atomic instructions or locks.

On 32-bit platforms, could this cause lost updates for concurrent writers, or
torn reads when read by ndo_get_stats64?

> +		} else if ((*pkt_info_p).length > EMAC_MAX_FRM_SUPPORT) {
> +			/* Oversized frame: firmware should have filtered
> +			 * these before they reach the host queue. Advance
> +			 * the read pointer to skip it.
> +			 */
> +			update_rd_ptr = *bd_wr_ptr_p;
> +			ndevstats_p->rx_length_errors++;
> +		} else {
> +			update_rd_ptr = *bd_rd_ptr_p;
> +			ret = icssm_emac_rx_packet(emac_p, &update_rd_ptr,
> +						   pkt_info_p, rxqueue_p);
> +			if (ret)
> +				return used;

[Severity: High]
This is a pre-existing issue, but does a memory allocation failure in this RX
path cause a permanent RX queue stall?

If icssm_emac_rx_packet fails to allocate an SKB, it returns -ENOMEM. The
driver immediately aborts the NAPI polling loop without updating the hardware
read pointer or consuming the packet.

Because it returns used (which is less than budget), it triggers
napi_complete_done() which re-enables the RX interrupt. Since the packet is
still pending in the hardware queue, the interrupt fires again immediately in
an infinite loop.

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_lre.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_lre.c
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth_lre.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_lre.c
> @@ -152,6 +152,14 @@ static void icssm_prueth_lre_protocol_init(struct prueth *prueth)
>  	       dram1 + ICSS_LRE_SUP_ADDR_LOW);
>  }
>  
> +static void icssm_prueth_lre_config_packet_timestamping(struct prueth *prueth)
> +{
> +	void __iomem *sram = prueth->mem[PRUETH_MEM_SHARED_RAM].va;
> +
> +	writeb(1, sram + ICSS_LRE_PRIORITY_INTRS_STATUS_OFFSET);
> +	writeb(1, sram + ICSS_LRE_TIMESTAMP_PKTS_STATUS_OFFSET);
> +}
> +
[ ... ]
> @@ -202,6 +210,11 @@ void icssm_prueth_lre_config(struct prueth *prueth)
>  	icssm_prueth_lre_init(prueth);
>  	icssm_prueth_lre_dbg_init(prueth);
>  	icssm_prueth_lre_protocol_init(prueth);
> +	/* Enable per-packet timestamping so the driver can order
> +	 * received frames by arrival time across the two slave ports.
> +	 */
> +	icssm_prueth_lre_config_packet_timestamping(prueth);
> +
>  }

[Severity: High]
Does this fail to enable hardware timestamping in Switch mode?

The patch introduces timestamp-based packet ordering for Switch, HSR, and PRP
modes, requiring configuration via ICSS_LRE_PRIORITY_INTRS_STATUS_OFFSET and
ICSS_LRE_TIMESTAMP_PKTS_STATUS_OFFSET.

However, icssm_prueth_lre_config_packet_timestamping is only called from
icssm_prueth_lre_config, which is gated by prueth_is_lre() (only true for HSR
and PRP).

In Switch mode, these registers appear to never be written, potentially
leaving timestamps disabled in firmware and breaking the wire-arrival
ordering logic.

[Severity: High]
This is a pre-existing issue, but are the dynamically allocated FDB learning
work items tracked for cleanup?

When learning a new source MAC address in icssm_prueth_sw_learn_fdb()
(drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c), the driver dynamically
allocates a struct icssm_prueth_sw_fdb_work and queues it.

If these are not tracked in a list, unloading the module could leave pending
work items that execute unmapped memory, potentially causing a kernel panic.

[Severity: High]
This is a pre-existing issue, but can the unbounded GFP_ATOMIC allocations
for FDB learning lead to memory exhaustion?

Every received frame with an unlearned source MAC address triggers
icssm_prueth_sw_learn_fdb(), which uses kzalloc_obj(..., GFP_ATOMIC) without
rate limiting.

A continuous flood of frames with randomized source MAC addresses could
trigger thousands of allocations per second, potentially exhausting the
kernel's atomic memory pools.
-- 
This is an AI-generated review.


