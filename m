Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B507CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzbDUivdbZHMfuBc4xDzyoycsdLc4AWCQGQkE2LD/fM=; b=SLGtyx1w7uIfgXPNH5FE/Kz434
	gjNN5qZlQY3tN+4oVvpDH/hM8WSK7qzxW/ub7tV6OvCZgb/h18U4D7ipqB+01PHD6eVoC7XgTqm5I
	/6ADvCPnfONA2TxnKSOyByV/inB9iK3/2Ojcwd85JhtW+ibnj5RFwlYRg/Hz91EDUyjxPgz/R/C7/
	+UNvg3VzgpWA7SXchEAlN/Do09gxxPOrrWNNXPsEw+JRH/Yxg3UGkaq5s/ObzEcwu5VwJ/CiMGsKN
	s3onJF/wG7MumhgdnHwfXSe5HvmVf7UN/66JhUKO6r17cZQMX3yot/CPLe6H2WU6EbZdMfZmYJEvK
	qoV5bcRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtg6-00000006bfR-1vW0;
	Fri, 31 Oct 2025 18:16:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtg4-00000006bfB-1S5O;
	Fri, 31 Oct 2025 18:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DB056025C;
	Fri, 31 Oct 2025 18:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E322C4CEE7;
	Fri, 31 Oct 2025 18:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761934603;
	bh=JnGr5vUYfVAVza81n1ZuarMPqOm1k7qNnjeylSO/u4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JmK3nULsKWb4OBVjVEIiQPxIWECn/zWUWrH03JI1dsV8J6T8ZSr5nuNescmInN8K9
	 HYZ319GYROw8OfkDz2RIMOzkw3A2gnGjKgJKXtTuG2RvvOI7q01uk5C86vC3qcdPnT
	 Z2CbDx/Yy7siPbUNnEJM/SSyRNAWzcsSpIOhH6YbuAF5wFeUvU2dzoXC9xgeDj+nzE
	 Q7HznMnBwHtZTvBwlEytqTpb76ij7EVPGxwlIFTwKG+Yb8FxST0jYignNsySn0zLCo
	 plMd3mzLB03sIZSkDRzK7oyh8y0NsfFB3bUMxVKw5Wc45xk+qnCiRMs24BQKQ1eAWf
	 cYWPbbEMtIU4w==
Date: Fri, 31 Oct 2025 11:16:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <20251031111641.08471c44@kernel.org>
In-Reply-To: <aQR2Z51Q45Zl99m_@lore-desk>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
	<CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
	<aEg1lvstEFgiZST1@lore-rh-laptop>
	<20250611173626.54f2cf58@kernel.org>
	<aEtAZq8Th7nOdakk@lore-rh-laptop>
	<20250612155721.4bb76ab1@kernel.org>
	<aFATYATliil63D5R@lore-desk>
	<aQR2Z51Q45Zl99m_@lore-desk>
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

On Fri, 31 Oct 2025 09:42:15 +0100 Lorenzo Bianconi wrote:
> > > Hm, truesize is the buffer size, right? If the driver allocated n bytes
> > > of memory for packets it sent up the stack, the truesizes of the skbs
> > > it generated must add up to approximately n bytes.  
> > 
> > With 'truesize' I am referring to the real data size contained in the x-order
> > page returned by the hw. If this size is small, I was thinking to just allocate
> > a skb for it, copy the data from the x-order page into it and re-insert the
> > x-order page into the page_pool running page_pool_put_full_page().
> > Let me do some tests with order-2 page to see if the GRO can compensate the
> > reduced page size.  
> 
> Sorry for the late reply about this item.
> I carried out some comparison tests between GRO-only and GRO+LRO with order-2
> pages [0]. The system is using a 2.5Gbps link. The device is receiving a single TCP
> stream. MTU is set to 1500B.
> 
> - GRO only:			~1.6Gbps
> - GRO+LRO (order-2 pages):	~2.1Gbps
> 
> In both cases we can't reach the line-rate. Do you think the difference can justify
> the hw LRO support? Thanks in advance.
>  
> [0] the hw LRO requires contiguous memory pages to work. I reduced the size to
> order-2 from order-5 (original implementation).

I think we're mostly advising about real world implications of 
the approach rather than nacking. I can't say for sure if potentially
terrible skb->len/skb->truesize ratio will matter for a router
application. Maybe not.

BTW is the device doing header-data split or the LRO frame has headers
and payload in a single buffer?

