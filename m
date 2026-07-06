Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zxf73Z9LVcCtgiRAVysSS0IZVg1LZRrQrjTa3gvtixQ=; b=xMNXpn3tFsIiJDTl/N39kfV9Y2
	7ENnHW51sdc9f8pnnoU0q8YmGJ/0azF8eWDwK5ZzP20op8HkZZAUUnw8ZOy8qUrpPmMUyXQPLcV1G
	fZgrlxSfAdwSNZYdYWE633YoJQvfjI1OCBXYffVFFfDclobodNqAqnuAKTp6mZr6DGp7Gx71DSlQ9
	tm9p79CNC4gfzlo8rhimDvmAp7I8Nqpx7xlVRhuqDiy7RKuVPE8r1LtsQh/KMS2EmUSlttNBe2VGS
	rBQlJUm6mfEn3hdGq3NzZU5jU6e7zlHJdRkHR9ACZ1c/PV/tYzNpG2wLJgATcmalyCfpAB0QpL5xC
	u8qEv+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfOY-0000000ByHg-0N3G;
	Mon, 06 Jul 2026 09:13:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfOV-0000000ByGx-03wu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783329215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zxf73Z9LVcCtgiRAVysSS0IZVg1LZRrQrjTa3gvtixQ=;
	b=Pv4JJKklk0lxRQgg789qjoh4zzuK+u63bXzdhKcPxouQ1nKbCaG0yB212dkxTWEZz0Vhv/
	ryXHMvCs0j4wROc8FGnjqp2iOJIQAlp5Ehehcoc883GSbzyBbOmiK996lU/XE8rSnu79OZ
	lQfxs/BUDp7B6ccevKoMBuTCBMyD4aM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-TJYIGl1TMu61YYIhCbunfg-1; Mon,
 06 Jul 2026 05:13:31 -0400
X-MC-Unique: TJYIGl1TMu61YYIhCbunfg-1
X-Mimecast-MFC-AGG-ID: TJYIGl1TMu61YYIhCbunfg_1783329208
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F79F1955F18;
	Mon,  6 Jul 2026 09:13:28 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.156])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 86BB5300070A;
	Mon,  6 Jul 2026 09:13:20 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2 1/3] net: ti: icssm-prueth: Add HSR and PRP HW offload mode support for AM57xx, AM437x and AM335x
Date: Mon,  6 Jul 2026 11:13:14 +0200
Message-ID: <20260706091314.134721-1-pabeni@redhat.com>
In-Reply-To: <20260630124958.894360-2-parvathi@couthit.com>
References: <20260630124958.894360-2-parvathi@couthit.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 6C62n_Zb7_g_QcXXtz5YNZ5lF21I_h1pQWIZU8dHevA_1783329208
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021339_132149_AE8B26E1 
X-CRM114-Status: GOOD (  23.06  )
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
Subject: net: ti: icssm-prueth: Add HSR and PRP HW offload mode support for AM57xx, AM437x and AM335x

This commit introduces hardware offload support for the HSR and PRP redundancy
protocols on TI PRU-ICSS Ethernet MACs. It enables firmware-based frame
duplicate detection and L2 forwarding, treating PRU Ethernet ports as Link
Redundancy Entity (LRE) slaves. The driver can now dynamically switch between
dual-EMAC, switch, and HSR/PRP modes.

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
[ ... ]
> @@ -564,7 +592,7 @@ static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
[ ... ]
>         /* update first buffer descriptor */
>  	wr_buf_desc = (pktlen << PRUETH_BD_LENGTH_SHIFT) &
>  		       PRUETH_BD_LENGTH_MASK;
> +	if (PRUETH_IS_HSR(prueth))
> +		wr_buf_desc |= BIT(PRUETH_BD_HSR_FRAME_SHIFT);

[Severity: High]
Does padding small packets with eth_skb_pad() in icssm_emac_ndo_start_xmit()
interfere with PRP trailer detection here?

When a short PRP frame is padded to 60 bytes in icssm_emac_ndo_start_xmit(),
the zero-padding is appended after the RCT. Later, in
icssm_prueth_tx_enqueue(), the driver attempts to read the RCT like this:

    struct prp_txopt_rct *rct =
        (struct prp_txopt_rct *)(skb_tail_pointer(skb) - ICSSM_LRE_TAG_SIZE);

Won't this calculation point into the trailing zero-padding instead of the
actual RCT? This would cause small PRP frames to bypass redundancy
duplication.

[ ... ]
> @@ -912,6 +963,25 @@ static int icssm_emac_request_irqs(struct prueth_emac *emac)
>  	return ret;
>  }
>  
> +static int icssm_emac_sanitize_feature_flags(struct prueth_emac *emac)
> +{
> +	netdev_features_t request_lre;
> +
> +	request_lre = emac->ndev->features & NETIF_PRUETH_LRE_OFFLOAD_FEATURES;
> +
> +	if (prueth_is_lre(emac->prueth) && !request_lre) {
> +		netdev_err(emac->ndev, "Error: Turn ON HSR offload\n");
> +		return -EINVAL;
> +	}

[Severity: Medium]
Is this check sufficient to handle partial feature toggling?

If a user disables NETIF_F_HW_HSR_TAG_RM via ethtool while leaving
NETIF_F_HW_HSR_FWD active, request_lre will still evaluate to non-zero and
bypass this validation. Since the firmware unconditionally strips the tag,
could this mismatched configuration cause the software stack to misinterpret
the inner IP header as an HSR tag?

[ ... ]
> @@ -1079,6 +1162,9 @@ static int icssm_emac_ndo_stop(struct net_device *ndev)
>  	else
>  		rproc_shutdown(emac->pru);
>  
> +	if (prueth_is_lre(prueth))
> +		icssm_prueth_lre_cleanup(prueth);

[Severity: High]
Could this unconditionally cancel the global HSR/PRP duplicate table check
timer while the other LRE port is still running?

If eth0 is brought down, the timer is canceled here, but if eth1 remains
active, the duplication tables could silently fill up and drop legitimate
frames because the check timer is never restarted.

[ ... ]
> @@ -1122,7 +1208,8 @@ static int icssm_prueth_change_mode(struct prueth *prueth,
>  		}
>  	}
>  
> -	if (mode == PRUSS_ETHTYPE_EMAC || mode == PRUSS_ETHTYPE_SWITCH) {
> +	if (mode == PRUSS_ETHTYPE_EMAC || mode == PRUSS_ETHTYPE_SWITCH ||
> +	    mode == PRUSS_ETHTYPE_HSR || mode == PRUSS_ETHTYPE_PRP) {

[Severity: High]
This is a pre-existing issue, but can the direct invocation of ndo_open() and
ndo_stop() inside icssm_prueth_change_mode() cause a deadlock?

If ndev->netdev_ops->ndo_open(ndev) fails and returns an error, the function
aborts without restoring the NAPI state. Later, when the interface is brought
down, the kernel naturally invokes ndo_stop() again. A second napi_disable()
call on an already disabled NAPI might trigger an infinite sleep waiting for
NAPI_STATE_SCHED.

[ ... ]
> @@ -1360,6 +1465,8 @@ static void icssm_emac_ndo_set_rx_mode(struct net_device *ndev)
[ ... ]
>  	/* It is a shared table. So lock the access */
> -	spin_lock_irqsave(&emac->addr_lock, flags);
> +	spin_lock_irqsave(mc_filter_tbl_lock, flags);
>  
>  	/* Disable and reset multicast filter, allows allmulti */
>  	icssm_emac_mc_filter_ctrl(emac, false);

[Severity: High]
Does this function corrupt the shared multicast hardware filter table in LRE
mode?

By calling icssm_emac_mc_filter_reset() the shared table in DRAM1 is cleared.
The code then repopulates the table by iterating only over the current
net_device's multicast addresses. Could this silently drop multicast traffic
for the other active slave port since its addresses are wiped out?

[ ... ]
> +static int icssm_prueth_hsr_port_link(struct net_device *ndev,
> +				      struct net_device *hsr_ndev)
> +{
[ ... ]
> +	spin_lock_irqsave(&emac->addr_lock, flags);
> +
> +	if (!prueth->hsr_members) {

[Severity: Low]
Is the per-port emac->addr_lock the correct lock to use when modifying the
device-wide shared state in prueth->hsr_members and prueth->hsr_dev?

While the networking core's global rtnl_lock might serialize this path during
NETDEV_CHANGEUPPER, using a local instance lock to protect global state could
be a maintainability hazard.

[ ... ]
> +free_hsr:
> +	spin_lock_irqsave(&emac->addr_lock, flags);
> +
> +	prueth->hsr_dev = NULL;
> +	prueth->hsr_members &= ~BIT(emac->port_id);
> +
> +	spin_unlock_irqrestore(&emac->addr_lock, flags);
> +	return ret;
> +}

[Severity: High]
If adding the second HSR/PRP port fails (e.g., during
icssm_prueth_change_mode), does this error path corrupt the bridge state?

Unconditionally clearing the shared prueth->hsr_dev pointer while the first
port is still present in prueth->hsr_members appears to permanently break
subsequent link attempts for the second port, because future links will fail
on the earlier condition:

    if (prueth->hsr_dev != hsr_ndev)
-- 
This is an AI-generated review.


