Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7ECCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/c/ZnFn816x3dYN0EttbOgIrQ9C3fDEkTn38/FB7uY=; b=3BGI836cR/00X/Wwlbd33b5wk8
	OWdU19kSkCahJUPkoAb1UAfPoXIzQPBABVSdj9S4x7t2U9YgNziQNuugwOiZC5jB34WO89iAcwOre
	mv5BjmUFWYw8KOy7SHiNKfkV7/ehrEpnXh6MP8+xLVDZCt5ikvaXeBo5FiKmuxI3/I6oQAygQbU0J
	sxPF2mxVf+RSPOXIZdQsBKxoJ36umRPxLwYWn8VDmqhfmEMbTaRT6Wy2uWGryLvBsY4ovgQO/H+Em
	sOVQD1L1rg2WggAI5cJZPpsgxTtsvqj3jk45Y1cdihVviySC79ck9R1Vc/vS7Z0KgvDzKZbPgZoph
	s7jN++MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhKQ-00000005Alk-2oJH;
	Mon, 22 Jun 2026 16:16:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhKP-00000005AlT-2DG7;
	Mon, 22 Jun 2026 16:16:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2951601F6;
	Mon, 22 Jun 2026 16:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A4A1F000E9;
	Mon, 22 Jun 2026 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782145012;
	bh=C/c/ZnFn816x3dYN0EttbOgIrQ9C3fDEkTn38/FB7uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KDHBLkTGnpBq0tBH98rMEFx3nPcKMjBPMCY/Psi7PkEq/zhVqyD4DfYCO6gYN8Ggw
	 eK/e2HlZazzAdAoaJquWQhvvwlqU4TdnsDHcydZEiFilhVi6cjxPX7+9CsuRdc9Epc
	 GXKJhumyMWqRTYrw9qdDIRJs6f1AW60WW3Ej4HrpRP6xw4zsP/tx7rfn0rBSjLJnSB
	 JcZjAC/+5TWOdcItI3sFOoiWPd3VKXoe8h7xUsJR3jl/X1wa6XChtGWbZ4hqqy4QcX
	 nk/6rXM42ia6NkZFnL+L3dPMPCyAlb4/Pe2N9QU5UWr/BIVeQN0V3jBmoyCc4bKzBU
	 +5hb0CUOfvNfg==
Date: Mon, 22 Jun 2026 17:16:48 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: airoha: fix netif_set_real_num_tx_queues
 for sparse QoS channels
Message-ID: <20260622161648.GG827683@horms.kernel.org>
References: <20260619-airoha-qos-fixes-v2-0-5c43485038f9@kernel.org>
 <20260619-airoha-qos-fixes-v2-2-5c43485038f9@kernel.org>
 <20260622123136.GC827683@horms.kernel.org>
 <ajk0kS76nahtop8g@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajk0kS76nahtop8g@lore-desk>
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

On Mon, Jun 22, 2026 at 03:11:45PM +0200, Lorenzo Bianconi wrote:
> > On Fri, Jun 19, 2026 at 01:37:14PM +0200, Lorenzo Bianconi wrote:
> > > airoha_tc_htb_alloc_leaf_queue() assigns queue IDs based on the channel
> > > index (opt->qid = AIROHA_NUM_TX_RING + channel), but updates
> > > real_num_tx_queues with a simple increment (num_tx_queues + 1). When QoS
> > > channels are allocated sparsely (e.g., channels 0 and 3 without 1 and
> > > 2), the returned qid can exceed real_num_tx_queues, causing out-of-bounds
> > > accesses in the networking stack.
> > > For example, allocating channel 0 then channel 3 results in
> > > real_num_tx_queues = 34 but qid = 35, which is out of range [0, 34).
> > > Fix this by computing real_num_tx_queues based on the highest active
> > > channel index rather than using a simple counter, in both the allocation
> > > and deletion paths.
> > > 
> > > Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > 
> > Thanks for the update since v1.
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> 
> Hi Simon,
> 
> thx for the review.
> 
> > 
> > FTR, there is an AI-generated review of this patch on sashiko.dev.
> > I do not think that should impede the progress of this patch but
> > you may want to consider it in the context of follow-up.
> 
> Even if it is not introduced by this patch, I do not think what is reported
> by Sashiko is a real issue since airoha_eth driver implements
> ndo_select_queue() callback and the selected queue is always in the range
> [0, AIROHA_NUM_TX_RING[. HTB queues (in the range
> [AIROHA_NUM_TX_RING, AIROHA_NUM_TX_RING + AIROHA_NUM_QOS_CHANNELS[) are just 
> 'offloaded' and never used in the TC sw path. Agree?

Thanks Lorenzo,

I've looked over this more closely with the above in mind and I agree.

