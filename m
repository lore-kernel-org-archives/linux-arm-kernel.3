Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48A0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tED5dwnj315XjkrIWNQbx34834+SR14pbuCDCqP1fp8=; b=jin6CIE0t9N/OwXJHTF9TYrBOe
	XG6nvrus2DiR4aiBjQk65lT9x0XKu9mFimWiZS5ACuItR7Lw+1GXBSnHYVpCRQ+ZdAg+g9lnUdXTD
	yPEwHcSB5h4gp/nySNLl3hDau6eLZuDfTLNzTcKQSDafIOqIymrl34Zd8NYFdEqfVYkWCFChi2v/O
	jGvwfWk98K5kUzSc8pdqpnT6uQN0NM0n8gj3Y6l5T43xCZJU15ZpaTooATPnD2IUkdm60YPjQ4S8g
	OfIrvMMeb8Siuv3L1wMYCN0koXGTu1mDySpjzIf7jYWCOFznwtKt3+qZCD8gCji1McVIYtHCzv5qj
	yoLh/6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrBs-00000008G8A-081U;
	Fri, 15 May 2026 11:58:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrBp-00000008G7W-1NDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tED5dwnj315XjkrIWNQbx34834+SR14pbuCDCqP1fp8=; b=rasTR9evdB4dfCLMjM38qWDGj1
	bT02YPoZDRO6VV6bIgLy6E+0pxgrHtxk0XFhjeOvm0mDijBy5NmECTkswXzikpfGF5hFus2dCAm+p
	fzVRL5e28EtFNXn4PQCYbTkPlQBmN1TKXSctPr1rc/ejXk/4VQphRvbiaVwu8AZosntg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wNrBO-0033c2-Pz; Fri, 15 May 2026 13:58:22 +0200
Date: Fri, 15 May 2026 13:58:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ding Hui <dinghui1111@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, dinghui@lixiang.com,
	xiasanbo@lixiang.com, yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: Re: [PATCH] net: stmmac: fix fatal bus error on resume by
 reinitializing RX buffers
Message-ID: <e731631e-53f3-484b-994d-4b551f241d05@lunn.ch>
References: <20260515053856.2310369-1-dinghui1111@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515053856.2310369-1-dinghui1111@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_045849_369468_942A4E2D 
X-CRM114-Status: GOOD (  11.49  )
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

> Fix this by treating the RX ring the same way as on close/open around
> a PM transition:
> 
>  - In stmmac_suspend(), after stmmac_stop_all_dma(), walk every RX
>    queue and free its buffers via dma_free_rx_xskbufs() when an XSK
>    pool is attached or dma_free_rx_skbufs() otherwise, then reset
>    rx_q->buf_alloc_num and clear rx_q->xsk_pool so the queue state
>    matches a freshly closed queue.
> 
>  - In stmmac_resume(), call init_dma_rx_desc_rings() before
>    stmmac_reset_queues_param() so RX buffers are re-allocated and
>    the descriptor buffer-address fields are properly repopulated
>    before the DMA is restarted.

The problem with this is, if the system is under memory pressure, it
might not be able to allocate the new RX buffers. So on resume, your
network interface dies.

For configuration changes which require buffers to be change, like
ethtool --set-ring, sometimes changing the MTU, you first allocate the
new buffers, and only if successful do you free the old buffers, so
that you can gracefully fail.

That free and then release idea does not work for resume.

So, can you live with the buffers you have, and just reset the
descriptors?

	Andrew

