Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370C5CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 15:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls6bC5WUT44yJBbelTO53g+/ymWhSMFK8Kw9Rkm2/d4=; b=zJOwdsm7quMusQGehVk8Qn9aCQ
	mf7+vnLjdiLp1Pec1gK0ns8yA2C3bvhaqA+CkMwNYs5XSgUy3/9W6m3TZMP3bHeSi7SyHb//QptX2
	4+wcG4Llk5/6gKn8KsAF0pNeqzYCVkcBLNnm7cHiFOmofp+/gJR3wF1s5U4hoA5CJ+b9KGfwlOG/K
	7pvXdz4AXsC8b6uTPWeqp3F+bjro4i1M3oy6Mxk96sBaz9Bew/ZA8uEs+icPXrHk1QG7AWCsLAyAF
	UjZzk+Wjaa0GTSvuj8gPvGN/8HIOQGNi12+8RoTt5Ish3TJLIdmY4rYcyTW0Wepptc4hN3B5tDN22
	J9MvNqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7b89-0000000AHZJ-3lDt;
	Sat, 11 Oct 2025 15:03:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7b88-0000000AHZA-3yBJ;
	Sat, 11 Oct 2025 15:03:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23F5B60439;
	Sat, 11 Oct 2025 15:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B863C4CEF4;
	Sat, 11 Oct 2025 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760195011;
	bh=b6EdLmV6B3+GD7OoEyD5jUcVCGvRMVnc835CfKljTrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eAvSBGBBJHHtzAoqbi+raaM0PPk6z2C6qVHJYhwHn6su6sBCu8HUGgL9Ox95aw39n
	 IEoGiZYk/KvEylRIZY2CupYglOAwPuQWiGUBco1erCUed6RDKs66QBIa5JWTzozBZt
	 Bc7SI8gCpeFCMMkFlx5cBV6mFiIL4y2ITezDAi1h2RPVRpdzyZAYKfZAJv/Nz7xwnt
	 Y16SIUpRt+DCB9RW19fIFjkGI3LH4POJnGlUsqxp9dim4MxeU9hwdqWb+hfjFfi5Tm
	 MppYpSDvlyusvBLpXeT/flK1q4CAQ58AJZRLw5SAdh5oiueLB5GXjMnuocqmdvCQx1
	 8umcFo7enpj2Q==
Date: Sat, 11 Oct 2025 16:03:27 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Take into account out-of-order tx
 completions in airoha_dev_xmit()
Message-ID: <aOpxv3SPSrMDB3Ib@horms.kernel.org>
References: <20251010-airoha-tx-busy-queue-v1-1-9e1af5d06104@kernel.org>
 <aOo0woPiMxjABFv2@horms.kernel.org>
 <aOpc8d0dPGOnwfJE@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOpc8d0dPGOnwfJE@lore-desk>
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

On Sat, Oct 11, 2025 at 03:34:41PM +0200, Lorenzo Bianconi wrote:
> > On Fri, Oct 10, 2025 at 07:21:43PM +0200, Lorenzo Bianconi wrote:
> > > Completion napi can free out-of-order tx descriptors if hw QoS is
> > > enabled and packets with different priority are queued to same DMA ring.
> > > Take into account possible out-of-order reports checking if the tx queue
> > > is full using circular buffer head/tail pointer instead of the number of
> > > queued packets.
> > > 
> > > Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  drivers/net/ethernet/airoha/airoha_eth.c | 15 ++++++++++++++-
> > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > > index 833dd911980b3f698bd7e5f9fd9e2ce131dd5222..5e2ff52dba03a7323141fe9860fba52806279bd0 100644
> > > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > > @@ -1873,6 +1873,19 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
> > >  #endif
> > >  }
> > >  
> > > +static bool airoha_dev_is_tx_busy(struct airoha_queue *q, u32 nr_frags)
> > > +{
> > > +	u16 index = (q->head + nr_frags) % q->ndesc;
> > > +
> > > +	/* completion napi can free out-of-order tx descriptors if hw QoS is
> > > +	 * enabled and packets with different priorities are queued to the same
> > > +	 * DMA ring. Take into account possible out-of-order reports checking
> > > +	 * if the tx queue is full using circular buffer head/tail pointers
> > > +	 * instead of the number of queued packets.
> > > +	 */
> > > +	return index >= q->tail && (q->head < q->tail || q->head > index);
> > 
> > Hi Lorenzo,
> 
> Hi Simon,
> 
> thx for the review.
> 
> > 
> > I think there is a corner case here.
> > Perhaps they can't occur, but here goes.
> > 
> > Let us suppose that head is 1.
> > And the ring is completely full, so tail is 2.
> > 
> > Now, suppose nr_frags is ndesc - 1.
> > In this case the function above will return false. But the ring is full.
> > 
> > Ok, ndesc is actually 1024 and nfrags should never be close to that.
> > But the problem is general. And a perhaps more realistic example is:
> > 
> >   ndesc is 1024
> >   head is 1008
> >   The ring is full so tail is 1009
> >   (Or head is any other value that leaves less than 16 slots free)
> >   nr_frags is 16
> > 
> > airoha_dev_is_tx_busy() returns false, even though the ring is full.
> 
> yes, you are right, this corner case is not properly managed by the proposed
> algorithm, thx for pointing this out.
> 
> > 
> > Probably this has it's own problems. But if my reasoning above is correct
> > (is it?) then the following seems to address it by flattening and extending
> > the ring. Because what we are about is the relative value of head, index
> > and tail. Not the slots they occupy in the ring.
> > 
> > N.B: I tetsed the algorirthm with a quick implementation in user-space.
> > The following is, however, completely untested.
> > 
> > static bool airoha_dev_is_tx_busy(struct airoha_queue *q, u32 nr_frags)
> > {
> > 	unsigned int tail = q->tail < q->head ? q->tail + q->ndesc : q->tail;
> > 	unsigned int index = q->head + nr_frags;
> > 
> > 	return index >= tail;
> > }
> 
> I agree, the algorithm you proposed properly manages the 99% of the cases. The
> only case where it fails is when the queue is empty (so tail = head = x,
> e.g. x = 0). In this case we would have:
> 
> 	- q->ndesc = 1024
> 	- q->tail = q->head = 0
> 	- tail = 0
> 	- index = n (e.g. n = 1)
> 	- index >= tail ==> 1 >= 0 ==> busy (but the queue is actually empty).
> 
> I guess we should add a minor change in the tail definition:
> 
> 	u32 tail = q->tail <= q->head ? q->tail + q->ndesc : q->tail;
> 
> so:
> 	- q->ndesc = 1024
> 	- q->tail = q->head = 0
> 	- tail = 1024
> 	- index = n (e.g. n = 1)
> 	- index >= tail => 1 < 1024 => OK
> 
> Can you spot any downside with this approach?
> I tested the proposed approach and it seems to be working fine.

Thanks, agreed.
Sorry for the out by one error.


