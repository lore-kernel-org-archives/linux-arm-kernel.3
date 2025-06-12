Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97857C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4m9qzeyse7sWAVAE6b7KsyxE8k+79J/FEsxRK5Qmvk=; b=4+UGkSrF8mbtOyqlcYfaAqOyfu
	LUtiGZfFVBUHJCDw2/Hk0452LxJRnFdgDn2v4UZ5nkSIASYWDWnBeif3StRC0rCFxa9+rQIrRyHSJ
	oiA0vFUeVMl9orlPKiGIjoe0cUX/vvY2apA4XEFLbdnZNQCn2zGMUmZRsGTIx21FM/61hJTsHAqSJ
	QLsh+SVEeKkIwx/bPsqNjr6QkLq6dcg+OrEp3pPvg4+DMrYQe59TpzM1vUmAEEi38NzmJsjZJP0TI
	GWWY2XsG6J6xHumQ6SYtksHeWBRCIx2yA06wzS7oGaq8ijF+jxcOsYWhdihO6qp9tBnjhlFiynIx1
	qYYt1dwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYHC-0000000C2Ol-3b5r;
	Thu, 12 Jun 2025 03:06:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVvf-0000000BnUa-4BMM;
	Thu, 12 Jun 2025 00:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8CD15C649D;
	Thu, 12 Jun 2025 00:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0CEC4CEE3;
	Thu, 12 Jun 2025 00:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749688587;
	bh=VX2z2/FTyVn7BQpo+/VJOHyJJYMp0fe/rlbeOnwg8S8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gs8Ktq8oAq+gDWOf1HIkw1MKCjkvLUD34+FWmtdYgVDcMktaU8GYHoBfX87Y0SOQN
	 j712zYHBDZbysi8LQDV6hLTiAk9E15f0PjFmRABnbS3MiBl4dqJRQAn/rnekjgX2Y1
	 bW+lTZ2OUHhB0IbqfqnDueXhcyWZwR1f3gt6AGEjWbRRNddUmQzB8d2eB7huh4AiQj
	 t90s0vnkhMn3itY4Cx4MU8ENXBhHLU4L1prU3J3M7hQx0wr0W5LEgmWFt6q7edqW6k
	 cLTKz8/faCH5zcZyM8ZKVMeadORQw6ceFG49PlUd5WCD+PMC1YLk7q0daBgwMQWK5t
	 eQxr7fkyGGavA==
Date: Wed, 11 Jun 2025 17:36:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <20250611173626.54f2cf58@kernel.org>
In-Reply-To: <aEg1lvstEFgiZST1@lore-rh-laptop>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
	<CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
	<aEg1lvstEFgiZST1@lore-rh-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173628_083900_BB913E73 
X-CRM114-Status: GOOD (  19.67  )
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

On Tue, 10 Jun 2025 15:39:34 +0200 Lorenzo Bianconi wrote:
> > Tell us more... It seems small LRO packets will consume a lot of
> > space, incurring a small skb->len/skb->truesize ratio, and bad TCP WAN
> > performance.  
> 
> I think the main idea is forward to hw LRO queues (queues 24-31 in this
> case) just specific protocols with mostly big packets but I completely
> agree we have an issue for small packets. One possible approach would be
> to define a threshold (e.g. 256B) and allocate a buffer or page from the
> page allocator for small packets (something similar to what mt7601u driver
> is doing[0]).  What do you think?

I'm not Eric but FWIW 256B is not going to help much. It's best to keep
the len / truesize ratio above 50%, so with 32k buffers we're talking
about copying multiple frames.

> > And order-5 pages are unlikely to be available in the long run anyway.  
> 
> I agree. I guess we can reduce the order to ~ 2 (something similar to
> mtk_eth_soc hw LRO implementation [1]).

Would be good to test. SW GRO can "re-GRO" the partially coalesced
packets, so it's going to be diminishing returns.

> > LRO support would only make sense if the NIC is able to use multiple
> > order-0 pages to store the payload.  
> 
> The hw supports splitting big packets over multiple order-0 pages if we
> increase the MTU over one page size, but according to my understanding
> hw LRO requires contiguous memory to work.

Hm, you're already passing buffers smaller than normal TSO so
presumably having a smaller buffers will break the sessions more 
often but still work?

You mean want to steal some of the code from:
https://lore.kernel.org/all/20250421222827.283737-1-kuba@kernel.org/
and make the buffer size user-configurable. But not a requirement.
Let's at least get some understanding of the perf benefit of 
32k vs 16k or 8k
-- 
pw-bot: cr

