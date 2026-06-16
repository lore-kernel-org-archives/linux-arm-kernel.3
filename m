Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BC3CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfbnHY+aIdC82PGEHGtuLsQPBx8FLWY1rXe+qSv98R8=; b=rKzkCisaqoo8T22jQq5HUJ+Ocu
	eomODxgNk2iKGLsFEhgwdHYRxhB01pcm+4DH7vrsFfL8BEpqgKOfkviQZGlQ6Gl/soXOKqG2QBZsR
	tU30GgvTP8H19/Z5qyN7/R810BFur2zboFJ0Kvtb87WORX9h5VYAFB8ZhYIpnf8s0hwi50tm1Ms9d
	8BbxEUeJQyLltaqEzbP6+FdhIZPqlPXU2apODP4l3Kv7mTYCPI9HSlaRLMcpQD7VspSfqhvCJXxpS
	cnXHNWmKnRf5OAm1+B7Z9OekIXf932O3CUJyPoR44uJ8jhAW+yRwzYL5WbMO6FBFaPGUeAglZNA5q
	hIb6J+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVa2-0000000Fztb-3phG;
	Tue, 16 Jun 2026 15:19:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVa1-0000000FztG-2Nmp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:19:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF34A44307;
	Tue, 16 Jun 2026 15:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B128D1F000E9;
	Tue, 16 Jun 2026 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781623196;
	bh=VfbnHY+aIdC82PGEHGtuLsQPBx8FLWY1rXe+qSv98R8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mHNEtl8RbNvTGPTjX3pTBwPHUIhqntugKsjms91Ls7d61c5mmVyuH+GHfghcDdZSf
	 /nj7LafsGUp8ljfbv63H7uY34K5fpgjQh4rjja9+ps6pad72/qnzQs1BiHxiRIk2fo
	 B5Crbz5sDRCq5okwRknKNZImddxeI6GJ2BRpPygnNMrUx4tBM7acfOgOMz9w5YH7kf
	 JlMP/6iVUSX5Qfu17S7v6LuM2+H4nfUo0klMVovuNkWlpkxVm59Rlk8RnS82YjkNMp
	 hBg6JVIezzCk91zmmovFSBIwW1/DbYzebsj0R8QTgJYcYTYqes/yI0/LETGFkutney
	 moeafmV/dqjGw==
Date: Tue, 16 Jun 2026 08:19:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <diogo.ivo@siemens.com>, <haokexin@gmail.com>,
 <vadim.fedorenko@linux.dev>, <devnexen@gmail.com>, <horms@kernel.org>,
 <jacob.e.keller@intel.com>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net 4/4] net: ti: icssg: Fix XSK zero copy TX during
 application wakeup
Message-ID: <20260616081954.0d12aa13@kernel.org>
In-Reply-To: <ed0bc332-0196-4613-8066-9b94f8ed0013@ti.com>
References: <20260611185744.2498070-1-m-malladi@ti.com>
	<20260611185744.2498070-5-m-malladi@ti.com>
	<20260615162157.3748bcda@kernel.org>
	<ed0bc332-0196-4613-8066-9b94f8ed0013@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 16 Jun 2026 16:41:00 +0530 Meghana Malladi wrote:
> On 6/16/26 04:51, Jakub Kicinski wrote:
> > On Fri, 12 Jun 2026 00:27:44 +0530 Meghana Malladi wrote:  
> >> @@ -169,9 +169,6 @@ static int emac_xsk_xmit_zc(struct prueth_emac *emac,
> >>   
> >>   		num_tx++;
> >>   	}
> >> -
> >> -	xsk_tx_release(tx_chn->xsk_pool);
> >> -	return num_tx;  
> > 
> > Why are you deleting this?
> >   
> 
> xsk_sendmsg() also calls this without an rcu-lock when transmitting the 
> packets if the xmit was successful, so I was assuming it is not required 
> and I removed this.

I think you still need it. Besides, seems like a separate cleanup.

> >>   void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
> >> @@ -279,9 +276,6 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
> >>   		num_tx++;
> >>   	}
> >>   
> >> -	if (!num_tx)
> >> -		return 0;  
> > 
> > Does something prevent us from running all this code if budget is 0?
> > If budget is 0 we can complete normal Tx with skbs but we must
> > not touch any AF-XDP related state.
> 
> Can you elaborate more, I couldn't interpret your comment here

netpoll may call napi from any context, including from IRQ.
It uses budget of 0 to indicate that it's trying to only reap tx
completions, without doing any Rx or XDP work. XDPs can't be called
from IRQ context.

> >>   	netif_txq = netdev_get_tx_queue(ndev, chn);
> >>   	netdev_tx_completed_queue(netif_txq, num_tx, total_bytes);
> >>   
> >> @@ -306,7 +300,9 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
> >>   
> >>   		netif_txq = netdev_get_tx_queue(ndev, chn);
> >>   		txq_trans_cond_update(netif_txq);  
> > 
> > This looks misplaced, now we will hit it even if we didn't complete
> > or submit any Tx.
> 
> This code needs to be hit for packet transmission in zero copy mode.
> emac_xsk_xmit_zc() submits the packets to the DMA in NAPI context,
> when application wakes up the driver and triggers NAPI. Once DMA 
> transfer is done, irq gets triggered NAPI gets called which will handle 
> the tx packet completion + submit next Tx batch packets to the DMA.
> 
> if (tx_chn->xsk_pool) -> check ensure this hits and runs for zero copy 
> only. Also above check (!num_tx) returns early during the application 
> wakeup (where budget is zero), hence it is removed.

I'm commenting on txq_trans_cond_update(), you're calling it
effectively on every NAPI call when XSK is bound, whether
Tx is making progress or not.

