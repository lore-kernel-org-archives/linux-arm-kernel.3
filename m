Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C60CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C91mNtrzgPeKSlnGkaTiPEalhjsVdXTjVYDja2SR5Z0=; b=pFG1welrctC3c4e4Ywbo1TC1LX
	0x5Y4dCIlvOOJdYryJ27jB7RFrifW1hFjN1bAGg4AdWXZKryMTYBKbwJtiZqGgLjgY6sB2RDPPgPw
	Tbs6Td/En2dYYQZT6652O5ZCKPXluG2G5lQP7KTp4tlwR5W5z5hPHMCG4tIDjRVHbpZjgJplJYgVc
	szNmjZBGY/sY4XSsoHHaW2MMC38s/VGYA5FUu/lWW/ZBdopm3p+xGZO5LOfRsHHBfNySi45CUYSBe
	vpmhRA4bvfguCGOGib2um5Vju26pIzvK34Mf5oqMEX4G/0MWrpYPYGZZbLEb7Vfl4iSQYqokbshaq
	HFAKRqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpHa-0000000HK6v-2bU8;
	Wed, 17 Jun 2026 12:22:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpHZ-0000000HK6m-0Xil;
	Wed, 17 Jun 2026 12:22:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 042B76001D;
	Wed, 17 Jun 2026 12:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CF31F000E9;
	Wed, 17 Jun 2026 12:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781698931;
	bh=C91mNtrzgPeKSlnGkaTiPEalhjsVdXTjVYDja2SR5Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mekYatbMEmJXUGcnAbabV9Da4XDBoPIVNHMbvLbEZEObEgCdAZFY1rvPgkPQX+zH5
	 oM91aFVte4WoeFXSlkhiA5navSUy8hBkyw58JmK0GbzGZ5jinWH10hE0hrjGiUJpXr
	 57ioUT6ROSt1nR13Th/kOWC/oCBew+P/g/B7q8YUzuj7B2NfxIoJGEFCUWZJMEdb79
	 d6bZ8kmGCvaknWQ/F8xl7RpP9WEC3L02MMXuC4oRqM28UYJB4NRiI3tUFhI7NpHGjh
	 InGT4n7UTLi/rMJs2gyGGst7ze2e5jAE1X1dzsQ6wV2ZY3NHhv78/3cgBxKd96C3wD
	 PVLkXiadx0AHQ==
Date: Wed, 17 Jun 2026 13:22:07 +0100
From: Simon Horman <horms@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Clean up RX queues in airoha_dev_stop
Message-ID: <20260617122207.GD827683@horms.kernel.org>
References: <178160746585.2156302.190868309474762875@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178160746585.2156302.190868309474762875@gmail.com>
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

On Tue, Jun 16, 2026 at 06:50:48PM +0800, Wayen Yan wrote:
> When the last port is stopped, airoha_dev_stop() clears TX queues
> but neglects to clean up RX queues. This can lead to:
> - RX ring buffer descriptors remaining valid after device close
> - Potential DMA synchronization issues on device reopen
> - Risk of use-after-free if pages are freed while DMA is still active
> 
> Add cleanup loop for RX queues to mirror the TX queue cleanup,
> ensuring symmetric resource management.
> 
> Fixes: 20bf7d07c956 ("net: airoha: add QDMA support for Airoha EN7581 Ethernet")
> Signed-off-by: Wayen Yan <win847@gmail.com>

Hi Wayen Yan,

There is AI-generated review of this patch-set available on both
https://sashiko.dev and https://netdev-ai.bots.linux.dev/sashiko/

I asked AI to summarise these concerns, it came up with the
following. I would appreciate it if you could look over this feedback.

1. NAPI Synchronization:
   While the TX path is managed by the netdev layer during stop, the RX path
   relies on the NAPI subsystem. Since NAPI remains active during
   `airoha_dev_stop()`, the new cleanup loop could race with the poller
   (`airoha_qdma_rx_process`). It would be safer to call `napi_disable()`
   before draining the queues to ensure exclusive access to the descriptors.

2. RX Queue Refill:
   Unlike TX, the RX hardware requires descriptors to be pre-allocated and
   posted by the driver to receive data. Because this patch empties the rings,
   `airoha_dev_open()` needs a corresponding update to refill them (e.g.,
   via `airoha_qdma_fill_rx_queue()`). Without this, the interface will
   encounter an empty ring on restart, leading to an RX stall.

3. SKB Accumulation:
   The cleanup should also account for the `q->skb` pointer used for
   fragmented packets. If a partial packet is sitting in the queue when the
   interface is stopped, freeing it and resetting the pointer to NULL will
   prevent a memory leak and ensure the next session starts with a clean
   state.

