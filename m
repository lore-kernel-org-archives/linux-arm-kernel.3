Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D554C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHwiM8no9nNs/Qfx5TRiwznXH95D7Ip697lzp5pUO5E=; b=fjuEJqJ62iZgqrOCZprAZKktK3
	5+pLVCE/8dU89PsNn3d+EXYwKfXhu6TDFG18HoaqyQJg49QNVKXFcHJKrEB+UE/umzu5m+2rKQ2X1
	W5DPUjC8GITNkg37s4T9+8CTjsCz8l+gPRF3Qwz5umnqdQbPzCy75FZ/QqVQyQa12BqehBHfzf5k1
	1MZh7XIjelKSyXgbwq3mCVCKi2zebuePKnzwB/MgTBFGjr5UKmevgFeBy4Qw2Dg7XQkLqc3UejwFi
	Lz3jZVzrRj4ON9+Bhuwfs+t4kJprWfeBDqXMvIkCPmjlz2T4W/Rn0bpxQgQQXAtwcFsvL1n+hQhDg
	6ylzboZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8h6-00000000M7w-0UvH;
	Mon, 28 Sep 2026 10:34:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8h4-00000000M7f-2ljC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 10:34:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C563C60052;
	Mon, 28 Sep 2026 10:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6DC1F000FF;
	Mon, 28 Sep 2026 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790591685;
	bh=uHwiM8no9nNs/Qfx5TRiwznXH95D7Ip697lzp5pUO5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c8YOuRKdYOQ4eE/tWgHof45oq3awiqSVG1a8TsqWEb+mhLn36nmBbkvyp0yxOAC5i
	 kiz0HuCqRJkWFnNWJl98QPmi1aB7qvwy9HczSpriyP7ANfwcirJPtybvDqQHN98sd+
	 w19R0hDKwOu8HRfq8+yLPTRtuT7oZJWuvQJZm3ie8kgQo9dVzDQC9k2hgH7jlKWI9H
	 djtdrNseclXph1/1doexe+W2/cU2aNQZp/arQG7jE53tNZHoJVLhyIcrlIboiHd6Ju
	 JuaVPVt5l3PQ4Cc3o8FXhjvlvp3HtQYcvl2BV4uvNXE6mlpXL/50Kdn6UNPhjSdwOR
	 bec5t1+uO4pQA==
Date: Mon, 28 Sep 2026 11:34:40 +0100
From: Simon Horman <horms@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	michal.simek@amd.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] net: xilinx: axienet: Free outstanding DMA
 buffers on dmaengine stop
Message-ID: <20260928103440.GP13925@horms.kernel.org>
References: <20260924085441.74012-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085441.74012-1-suraj.gupta2@amd.com>
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

On Thu, Sep 24, 2026 at 02:24:41PM +0530, Suraj Gupta wrote:
> In the dmaengine path the driver pre-submits RX buffers and holds
> in-flight TX buffers whose SKBs are DMA-mapped by the driver and freed
> only in the completion callbacks. On ndo_stop() dmaengine_terminate_sync()
> aborts these descriptors without running their callbacks, and the driver
> then frees only the ring shells, leaking every SKB still owned by the
> engine and its DMA mapping on each ifdown. With 128 RX buffers pre-posted
> per channel, the mapping leak can eventually exhaust a limited IOMMU
> aperture.
> 
> Clear the slot's skb in the TX and RX callbacks so a non-NULL skb marks a
> slot that still owns a live, DMA-mapped buffer, and on stop unmap and free
> every such buffer.
> 
> axienet_dma_rx_cb() runs from the DMA tasklet and re-arms the RX ring on
> each completion, so it can race axienet_stop(): a completion may submit a
> fresh buffer after dmaengine_terminate_sync() has returned, leaving the
> channel armed with a buffer the teardown then frees while the engine may
> still write into it (dma_release_channel() does not stop it either). Add a
> lock that axienet_dma_rx_cb() holds across the @stopping check and the
> resubmit, and axienet_stop() holds to set @stopping before terminating.
> Once @stopping is set no callback can arm a new buffer, and any armed just
> before is aborted by the terminate, so teardown only frees buffers the
> engine no longer owns.
> 
> Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
> Changes in v3:
> - Serialize RX descriptor resubmission in axienet_dma_rx_cb() against the
>   stop with a dedicated rx_submit_lock, replacing the bare
>   READ_ONCE/WRITE_ONCE @stopping fence. (reported by the netdev Sashiko
>   AI bot).
> - Update the commit message to describe the race and its fix.

The use of a spinlock looks correct to me.
But, if so, I think that plain acecsses to stopping should be used:
READ_ONCE/WRITE_ONCE wrappers should be removed.

I mean, like this:

	spin_lock(&lp->rx_submit_lock);
	if (lp->stopping) {
		spin_unlock(&lp->rx_submit_lock);
		return;
	}
	...
	spin_unlock(&lp->rx_submit_lock);

And:

		spin_lock_bh(&lp->rx_submit_lock);
		lp->stopping = true;
		spin_unlock_bh(&lp->rx_submit_lock);

> v2: https://lore.kernel.org/netdev/20260917100525.250952-1-suraj.gupta2@amd.com/
> 
> Changes in v2:
> - Free outstanding TX/RX buffers on the dmaengine stop path (the original
>   fix), and drop the redundant dmaengine_synchronize() calls that
>   followed dmaengine_terminate_sync() (Jakub Kicinski).
> v1: https://lore.kernel.org/netdev/20260910141946.3017164-1-suraj.gupta2@amd.com/

-- 
pw-bot: changes-requested

