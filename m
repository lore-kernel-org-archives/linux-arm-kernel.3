Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67585C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 19:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Nf4LboMlyAzQCzh/1ctdONRto33aQQULX47UTzpFE0=; b=YveBD20fnOJPbsIuxJPxxLWImZ
	sSpVK1IFhV5T5/mYDTdQcxeAvnwP/wpYHsJb5+oiXOfHwIkN1aA4BFpeIIzdCsRKG+NSYfkm09emj
	g43d9gsXzArwlA3E1wMwKAdZsiD+CAzvd3kK5+nHu0gHOqO3JupLPUNPIGL9lGzAeXqm2K+91ZWF5
	is6Vj2WO3Gt+BQ3by1bXPK8/RFXw6Wiuj7pZmHB7rCzHSU62nZBl5Ft7avNZQpZvljXBaGkmL5Rsk
	HFBqwABMghsCNUy2OGtFGTv9O0j2LHsLqjSvjjJ6jEN3OUpLmqY+wrzN/00It7OjDEcSc0/DFK08i
	NzkPUJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSRp-00000003WZd-493M;
	Fri, 08 Aug 2025 19:08:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSPI-00000003WHd-3yp9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 19:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C947DA569E1;
	Fri,  8 Aug 2025 19:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FB2C4CEED;
	Fri,  8 Aug 2025 19:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754679935;
	bh=9sNZifZ906dYt7wIbV9eoAh1hSVh4+0uqV8iP9M7bIw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Db1XJ4G8RHVrCzWfz7X+y6PLjFRKCtezVLfArElwa49X52xu0y0wb6fzwZrtOrW9e
	 RMnQRFOZaNXpa21Kqqr5QiK4V3xMkEeHujpZ07QczjdcmfQU618W5zEiJ17LieCfq1
	 iINq8vBHGZMWU4qnv02JN2genYJBfNm7A22qVqem5xL6rBjYYBc/k6CGwXAHVhZRI7
	 eTFmJed6OFXe5tLcP6rcwsVBiDwaPyAStPzggj3y53kBOAfa5HhPuYMfAq2JfLosJd
	 +7N3L8sQPGWbHdoD5Q5WG/1QkS4zolLfOlbYqHSIq5JYPrcVb2kCX7i0RFyk7cxraX
	 LDyxQrjRODaKQ==
Date: Fri, 8 Aug 2025 12:05:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <michal.simek@amd.com>, <sean.anderson@linux.dev>,
 <radhey.shyam.pandey@amd.com>, <horms@kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: Re: [PATCH net] net: xilinx: axienet: Increment Rx skb ring head
 pointer after BD is successfully allocated in dmaengine flow
Message-ID: <20250808120534.0414ffd0@kernel.org>
In-Reply-To: <20250805191958.412220-1-suraj.gupta2@amd.com>
References: <20250805191958.412220-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_120537_051379_F3F6C25C 
X-CRM114-Status: GOOD (  13.43  )
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

On Wed, 6 Aug 2025 00:49:58 +0530 Suraj Gupta wrote:
> In DMAengine flow, AXI DMA driver invokes callback before freeing BD in
> irq handling path.
> In Rx callback (axienet_dma_rx_cb()), axienet driver tries to allocate
> new BD after processing skb.
> This will be problematic if both AXI-DMA and AXI ethernet have same
> BD count as all Rx BDs will be allocated initially and it won't be
> able to allocate new one after Rx irq. Incrementing head pointer w/o
> checking for BD allocation will result in garbage values in skb BD and
> cause the below kernel crash:
> 
> Unable to handle kernel paging request at virtual address fffffffffffffffa
> <snip>
> Internal error: Oops: 0000000096000006 [#1]  SMP
> pc : axienet_dma_rx_cb+0x78/0x150
> lr : axienet_dma_rx_cb+0x78/0x150
>  Call trace:
>   axienet_dma_rx_cb+0x78/0x150 (P)
>   xilinx_dma_do_tasklet+0xdc/0x290
>   tasklet_action_common+0x12c/0x178
>   tasklet_action+0x30/0x3c
>   handle_softirqs+0xf8/0x230
> <snip>

Do you mean that we're incrementing lp->rx_ring_head before we know
that the submission will succeed? Potentially leaving an uninitialized
entry (say at index n), next attempt will try to use the next entry 
(n + 1) but the completion will not know about the skip so it will
try to complete entry n ?

This is really not coming thru in your explanation.

The fix itself seems incomplete. Even if we correctly skip the increment
we will never try to catch up with the allocations, the ring will have
fewer outstanding Rx skbs until reset, right? Worst case we drop all
the skbs and the ring will be empty, no Rx will happen until reset.
The shutdown path seems to be checking for skb = NULL so I guess it's
correct but good to double check..
-- 
pw-bot: cr

