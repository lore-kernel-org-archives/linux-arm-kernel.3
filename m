Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F78CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUZD+emMQ2xlB4a05ZZK2Z1/2LYgrrwvQo0kKAM+qPg=; b=DbpxC/GNZRy9ri2w9x7Y93xDLC
	euvhRABt1M0LzPE/OlV1OxaC1A892+wSP2AkGMtZ4+z59j/LwyQDkbhPSGX2gEmhDbpgD2GIpbz8R
	FvSte71W39N9Dx1Uhk7JGe8FCU7hR82cl0OzwiHYWhx/s9TsPTD2NNuB6Iifg49OO+wpy+HjBAbMD
	Wc5wKeqVM2LyEOmwkFYLfhGy6Mw9qL4eXDZHTLxlKbxBv6SzgRKjkipwiJ0eDLsScU7EYVzy6soav
	XgdWGfeFBIwgFDusKhPEv5lXcBTearVhHrAHxfBE5l42OEQ633nw+fX9eJiaHTcgaDqzdm6E73liX
	wG/lfGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhgV-00000005C6s-0rbv;
	Mon, 22 Jun 2026 16:39:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhgU-00000005C6f-0Eu9;
	Mon, 22 Jun 2026 16:39:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C5D8402A2;
	Mon, 22 Jun 2026 16:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5871F000E9;
	Mon, 22 Jun 2026 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146381;
	bh=QUZD+emMQ2xlB4a05ZZK2Z1/2LYgrrwvQo0kKAM+qPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A7u0TWl4NdgWXkAMlDQhZA9OVkFj9CDXRLeJ0IQJ1e6symrrmYwzLrCZ9FCEQ1/0e
	 pTA9PwpEaO53WqkDwx1TwQCkOhWhjypPk7KItRuXW4LG/nQpwuXE3zY1WjjdtkNmte
	 vk2U6VFIx+0aF9JPW1LZNTfzxGNPaSSa2MLJM1jEr/5SaWO7bdszv48UNu4h1WKBTg
	 lm/JubDjaM+vFcSBV5BWvoVkKxTUDNEQOWgERHxVasD8jFOzzSqLytg8y39E3d0IQU
	 zxeEh7xUCvsNa92YKvqBSUCtnuS3OWhsBWxRuQ++Cvt8sZLR9XZtAQJZWXGMbtwpeM
	 ZVftYS3FjcX2Q==
Date: Mon, 22 Jun 2026 17:39:37 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3] net: airoha: fix BQL underflow in shared QDMA TX
 ring
Message-ID: <20260622163937.GH827683@horms.kernel.org>
References: <20260620-airoha-bql-fixes-v3-1-76b95374e63e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620-airoha-bql-fixes-v3-1-76b95374e63e@kernel.org>
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

On Sat, Jun 20, 2026 at 05:04:51PM +0200, Lorenzo Bianconi wrote:
> When multiple netdevs share a QDMA TX ring and one device is stopped,
> netdev_tx_reset_subqueue() zeroes that device's BQL counters while its
> pending skbs remain in the shared HW TX ring. When NAPI later completes
> those skbs via netdev_tx_completed_queue(), the already-zeroed
> dql->num_queued counter underflows.
> 
> Fix the issue:
> - Remove netdev_tx_reset_subqueue() from airoha_dev_stop() so pending
>   skbs are completed naturally by NAPI with proper BQL accounting.
> - Rework airoha_qdma_tx_cleanup() to disable TX DMA, flush BQL
>   counters, DMA-unmap and free all pending skbs while skb->dev
>   references are still valid. Use a per-queue flushing flag checked
>   under q->lock in airoha_dev_xmit() to prevent races between teardown
>   and transmit. Call airoha_qdma_stop_napi() before
>   airoha_qdma_tx_cleanup() at the call sites.
> - Move DMA engine start into probe. Split DMA teardown so TX DMA is
>   disabled in airoha_qdma_tx_cleanup() and RX DMA in
>   airoha_qdma_cleanup().
> - Remove qdma->users counter since DMA lifetime is now tied to
>   probe/cleanup rather than per-netdev open/stop.
> 
> Fixes: a9c2ca61fec7 ("net: airoha: Support multiple net_devices for a single FE GDM port")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v3:
> - Remove airoha_qdma users counter.
> - Drop DEV_STATE_FLUSH bit and add per-queue flushing bool to avoid any
>   race between airoha_qdma_tx_flush() and airoha_dev_xmit().
> - Refactor airoha_qdma_cleanup_tx_queue().
> - Rename airoha_qdma_cleanup_tx_queue() in airoha_qdma_tx_cleanup().
> - Link to v2: https://lore.kernel.org/r/20260619-airoha-bql-fixes-v2-1-4351d6a24484@kernel.org
> 

Thanks for the updates.

Reviewed-by: Simon Horman <horms@kernel.org>


