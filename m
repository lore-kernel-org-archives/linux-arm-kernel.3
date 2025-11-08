Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBD8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 01:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw+10nODLIflAfodQe8dvj5XlG0jHvUDYnAtuW1+hpc=; b=JRnaj0iv8aP/+VBbXfK8QvZeiU
	lJZGLA37IrZdJdk+qKSjNYNBPIY97XW+OM39mPNn7pS4opTh2NHXQbnielmlK0Qe8ecBIKEH9wufz
	Hok5DdsoCgvQiAeb6EqTtDiqO418gvrMQnm65XfyaJcrrC/xAensMW8NccI94yR57xYibX/ugKO+E
	nnNGHq+QLo6dXjfXEq58Oe80ag0+1xVrcYNfZoq/eFlKE8jV4DDuZmXdX9vRrzyNx4GpOKFeTTGVl
	hwaffezQHq/jL5LKEz4p+iBFll6apSpsnizGtBI3/kCHrzE1a07MDzeI5Q8WwqCW4PQmSULdctPOF
	rtyCVuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXTx-00000001tMX-3HO9;
	Sat, 08 Nov 2025 01:11:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXTu-00000001tLX-1jMs;
	Sat, 08 Nov 2025 01:11:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2DAE417ED;
	Sat,  8 Nov 2025 01:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC35C4CEF7;
	Sat,  8 Nov 2025 01:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762564264;
	bh=vKvPEc0OL56xvPcMsxJFQrmcCo4e6Q05X9tUYOSx5KQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=owVNnjE7rpsR/fXVy5i3r/TrRDPynfRnlN1NADbVrhl52cS7clwQNTMMG1PYBZwd6
	 zsN/QkKp8g1wByCaab8YVZtJ1w/idgxBkfjBShJJDFjUwCll9g4fMp9a7E0EI5CY9l
	 hqx5OdAayvLn/LCYNF2xJ08qSVXJxter+bNwOI3A0h9EyQQBpILa/PhjzqBGgs7I0r
	 jZ09zNxBF8kj4s1sBU+w64/djiAKf+YWm47XsO2LGLr7gX9WXQqHQSkVTBJpn6MLmN
	 PuknKC7EFvyrraIzHidgPob8im5tyr7Acns0XfzuwqTYPkWuYuKC7PbX4LwwxwIcxZ
	 0Rt7Y1X3QxvTA==
Date: Fri, 7 Nov 2025 17:11:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <20251107171103.2ecda810@kernel.org>
In-Reply-To: <aQ30WmbN_O60vEzl@lore-desk>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
	<CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
	<aEg1lvstEFgiZST1@lore-rh-laptop>
	<20250611173626.54f2cf58@kernel.org>
	<aEtAZq8Th7nOdakk@lore-rh-laptop>
	<20250612155721.4bb76ab1@kernel.org>
	<aFATYATliil63D5R@lore-desk>
	<aQR2Z51Q45Zl99m_@lore-desk>
	<20251031111641.08471c44@kernel.org>
	<aQ30WmbN_O60vEzl@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_171106_497002_2D7A2AB7 
X-CRM114-Status: GOOD (  21.24  )
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

On Fri, 7 Nov 2025 14:30:02 +0100 Lorenzo Bianconi wrote:
> > On Fri, 31 Oct 2025 09:42:15 +0100 Lorenzo Bianconi wrote:  
> > > Sorry for the late reply about this item.
> > > I carried out some comparison tests between GRO-only and GRO+LRO with order-2
> > > pages [0]. The system is using a 2.5Gbps link. The device is receiving a single TCP
> > > stream. MTU is set to 1500B.
> > > 
> > > - GRO only:			~1.6Gbps
> > > - GRO+LRO (order-2 pages):	~2.1Gbps
> > > 
> > > In both cases we can't reach the line-rate. Do you think the difference can justify
> > > the hw LRO support? Thanks in advance.
> > >  
> > > [0] the hw LRO requires contiguous memory pages to work. I reduced the size to
> > > order-2 from order-5 (original implementation).  
> > 
> > I think we're mostly advising about real world implications of 
> > the approach rather than nacking. I can't say for sure if potentially
> > terrible skb->len/skb->truesize ratio will matter for a router
> > application. Maybe not.
> > 
> > BTW is the device doing header-data split or the LRO frame has headers
> > and payload in a single buffer?  
> 
> According to my understanding the hw LRO is limited to a single order-x page
> containing both the headers and the payload (the hw LRO module is not capable
> of splitting the aggregated TCP segment over multiple pages).
> What we could do is disable hw LRO by default and feed hw rx queues with
> order-0 pages (current implementation). If the user enables hw LRO, we will
> free order-0 pages linked to the rx DMA descriptors and allocate order-x pages
> (e.g. order-2) for hw LRO queues. Disabling hw LRO will switch back to order-0
> pages.

Are all packets LRO-sized when it's enabled? What you describe is
definitely good, bur I was wondering if we can also use rx-buf-len
to let user select the size / order of the LRO buffers.

But the definition of rx-buf-len is that it's for _all_ rx buffers
on given queue. We'd probably need a new param if the pages are
just for lro

