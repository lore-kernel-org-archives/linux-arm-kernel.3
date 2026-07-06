Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14248C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZJn90Px9hZJUz6AB3nf2Qs9xkQXJCI5324Fe6y0Nzs=; b=mTpDEzpMR6pv+PuLGZ+eD89u8d
	VgLwV0Y1O8CLuZPo79BltXp8/wRYEdo9RsiKHhUAzyECNwyWDUlF05yOulPRvzpQU+K1dtONP3gE7
	eQxIFbUMru8cZnId1UTiGxSxLSDm/zCHQphdBzjuxZ0zIM9Rh0cjKy3wEYwAgMyD55IgPwz2MmYBf
	SzDwgSzY94ZhmAb5UK9TekJjO2Q9dVCwApyN2Z/IFkucRbjVkD6kD9SbRfmDYgKMi86ivg42A1a3U
	6K9LZUES9+Xr54fYzb0/aj284+ZlfKLq0NOTXfdoy7tXLuwV+S0nD1fFXZvcUJDlT3Mu4nmcgEHSg
	KpOf1WxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfOr-0000000ByPR-2PkM;
	Mon, 06 Jul 2026 09:14:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfOo-0000000ByNv-416l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783329237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZJn90Px9hZJUz6AB3nf2Qs9xkQXJCI5324Fe6y0Nzs=;
	b=SXvFd6aYUPDWXQ7GBnc+2TSEFS9PD6sfhwRh90s93PZmlylg6e9/tK5RqYle9WtBFt0fUn
	rJKbsZ6z3PelmoQ0k+dlidKBpAI0/3SyzXItrAByrs/NONyGHM/euhxvijfA8X71gSDmYf
	FmPDYEyiujuNPSvR3/b+VUKCROiZD3k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-k0_NrMkTMqa0sm7gCWKE4w-1; Mon,
 06 Jul 2026 05:13:51 -0400
X-MC-Unique: k0_NrMkTMqa0sm7gCWKE4w-1
X-Mimecast-MFC-AGG-ID: k0_NrMkTMqa0sm7gCWKE4w_1783329228
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9A361955F05;
	Mon,  6 Jul 2026 09:13:47 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.156])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EEED918005A2;
	Mon,  6 Jul 2026 09:13:40 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2 3/3] net: ti: icssm-prueth: Support duplicate HW offload feature for HSR and PRP
Date: Mon,  6 Jul 2026 11:13:38 +0200
Message-ID: <20260706091338.134754-1-pabeni@redhat.com>
In-Reply-To: <20260630124958.894360-4-parvathi@couthit.com>
References: <20260630124958.894360-4-parvathi@couthit.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: MWaBRix2mqoyR50DznL_hXgyOeltyrAxV7JNTsvgR4U_1783329228
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021359_076837_42CB0003 
X-CRM114-Status: GOOD (  20.50  )
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
net: ti: icssm-prueth: Support duplicate HW offload feature for HSR and PRP

This commit introduces hardware duplicate offload for HSR and PRP modes. It
implements a common shared queue between the two ports, writing frames once
to OCMC RAM and relying on the firmware to replicate the transmission.

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index 2ab78a98f8568..cbe666a212c3b 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> @@ -97,6 +125,17 @@ static void icssm_prueth_write_reg(struct prueth *prueth,
>  static enum pruss_mem pruss_mem_ids[] = { PRUSS_MEM_DRAM0, PRUSS_MEM_DRAM1,
>  					  PRUSS_MEM_SHRD_RAM2 };
>  
> +struct prp_txopt_rct {
> +	__be16 sequence_nr;
> +	__be16 lan_id_and_lsdu_size;
> +	__be16 prp_suffix;
> +};

[Severity: High]
Does this structure definition need the __packed attribute?

This struct consists of three 16-bit fields but lacks the __packed attribute,
so it inherits a 2-byte alignment requirement.  Later in
icssm_prueth_tx_enqueue, a pointer to this structure is derived directly
from skb_tail_pointer.

If an ethernet frame payload has an odd byte length, wouldn't casting and
dereferencing this pointer cause an unaligned 16-bit memory access, resulting
in hardware traps or panics on architectures that do not support it?

[ ... ]
> @@ -549,15 +588,24 @@ static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
[ ... ]
> +	other_emac = emac->prueth->emac[(emac->port_id == PRUETH_PORT_MII0) ?
> +				PRUETH_PORT_MII1 - 1 : PRUETH_PORT_MII0 - 1];
> +
> +	if (prueth_is_lre(prueth) && (emac->link || other_emac->link))
> +		link_up = true;

[Severity: High]
Could this logical OR cause the shared transmission queue to stall completely
if only one of the slave links goes down?

If one port loses its link, its emac->link is 0, but the other active port
will still evaluate link_up as true. The active port would continue sending
duplicate frames to the shared queue.

[ ... ]
> @@ -605,6 +659,29 @@ static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
[ ... ]
> +		if (free_blocks_other_port < free_blocks)
> +			free_blocks = free_blocks_other_port;
> +	}

[Severity: High]
Following up on the link_up logic above, since the available queue space is
bounded by the slowest reader here, wouldn't the inactive port's read pointer
remain frozen?

This appears to exhaust the free_blocks pool, causing the active port to
eventually spin and return -ENOBUFS permanently, defeating the redundancy.

[ ... ]
> +		} else {
> +			/* Read PRP RCT to extract sequence number and LAN ID */
> +			struct prp_txopt_rct *rct =
> +				(struct prp_txopt_rct *)(skb_tail_pointer(skb) -
> +							 ICSSM_LRE_TAG_SIZE);
> +
> +			if (rct->prp_suffix == htons(ETH_P_PRP)) {

[Severity: High]
Is it safe to directly dereference rct->prp_suffix here?

As mentioned above regarding the struct definition, this might lead to an
unaligned memory access on certain architectures. Perhaps using the
get_unaligned_be16 helper would be safer here, or adding the __packed
attribute to the structure definition.

[ ... ]
> @@ -1341,18 +1516,30 @@ static enum netdev_tx icssm_emac_ndo_start_xmit(struct sk_buff *skb,
[ ... ]
> +	raw_spin_lock(lock_queue);
> +	ret = icssm_prueth_tx_enqueue(emac, skb, qid);
> +	raw_spin_unlock(lock_queue);

[Severity: High]
Does this need to use the irqsave variant to protect against cross-device
deadlocks with netpoll?

The lre_host_queue_lock is shared between the two ports. If a hardirq
preempts a CPU while it holds this lock during a transmission, and the
interrupt handler invokes a printk that triggers netconsole over the second
interface, netpoll might bypass the netif_tx_lock.

When the second interface calls into ndo_start_xmit, it would attempt to
acquire the exact same lre_host_queue_lock, causing it to spin forever on
the same CPU.
-- 
This is an AI-generated review.


