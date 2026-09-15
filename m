Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13713C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3Hgjw7laGOWScI+sHbX1ErTzip/jWvwqQPcLsTDwxk=; b=42lYhVUV4eEejVPgPjlEmSlk1L
	KcZC+3awqUB8DTkv8UbfpMExgZI7/0ETHFGDfGRn27pS89sM/vBa/x2flnL4tY80K0dxakk+tbNsW
	k7g4XicjJ9A6uL5OVUIqBWR8qxfh+eEWIOi9PUPl9kHenzbrt2mAgYqypiTMDfuZtOrPT+BiYgle3
	rOWuTGRxFXwvGloHksCWPlQHKcVbvP4RyNK32yUMCtW4E4W0PeuAczYy1ziVxi8EnSTq779AuxQuz
	ia/qJZd/pQArV0KZXJTXHBzsLgyMYSUk5LgIVsvq9CFC0Rwp+zoWRzdS9bhhVpo76F/KXB78IpKCb
	qMUp8Iig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Voy-00000007NoO-32Hn;
	Tue, 15 Sep 2026 16:15:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vov-00000007Nny-3tTJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P3Hgjw7laGOWScI+sHbX1ErTzip/jWvwqQPcLsTDwxk=; b=flTsLXLEu02Sg//bmouBFb7T4s
	lU79ILbCW7JCGM+m4uq7BS8/U/AnqH39tgkBc2PZJ6YJiGTjGSRgVpkhGafktUwPKh7dw7+UZIkot
	P7BVzI5NaDqf+qUBS0et9u7MYqkpMKMeuoH5kZofjgt+BSa6Po8Uf5U91ixJA+I3edvA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6Vom-005JM1-PV; Tue, 15 Sep 2026 18:15:36 +0200
Date: Tue, 15 Sep 2026 18:15:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: axienet: add a TX timeout handler to
 recover a lost DMA interrupt
Message-ID: <6acfc82e-7690-4759-90df-22b64a5441ba@lunn.ch>
References: <20260915065534.102249-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915065534.102249-1-maimon.sagi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_091547_046254_79BD0FF6 
X-CRM114-Status: GOOD (  18.76  )
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

On Tue, Sep 15, 2026 at 09:55:34AM +0300, Sagi Maimon wrote:
> axienet_dma_err_handler() is the driver's only reset path, and the only
> two places that schedule it are axienet_tx_irq() and axienet_rx_irq(),
> both on the XAXIDMA_IRQ_ERROR_MASK branch.  Every route into recovery
> therefore depends on a DMA interrupt being delivered.
> 
> If a completion interrupt is lost the queue stops making progress with
> descriptors unreclaimed, and nothing ever schedules the reset: the error
> branch cannot run because no interrupt arrives, and NAPI is not polled
> because it is only scheduled from those same handlers.  The interface
> stays wedged until the driver is unloaded.
> 
> Add an .ndo_tx_timeout handler so the netdev watchdog provides a route
> into the existing reset path that does not depend on the interrupt that
> was lost.  The handler only queues the work; axienet_dma_err_handler()
> then performs the reset in process context, as it already does for the
> error-interrupt case.
> 
> .ndo_tx_timeout is added to axienet_netdev_ops alone.  On the dmaengine
> path lp->dma_err_task is never initialised - INIT_WORK() for it lives in
> axienet_init_legacy_dma() - so scheduling it there would be a bug, and
> watchdog_timeo is set in the same branch for that reason.
> 
> Tested on a Xilinx AXI Ethernet MAC by clearing PCI_MSIX_FLAGS_ENABLE
> underneath a running interface to drop completion interrupts: without
> this patch the TX queue stalls permanently, with it the watchdog fires
> and the interface resumes passing traffic.

Have you seen the hardware wedge without faking it by clearing
PCI_MSIX_FLAGS_ENABLE?

	Andrew

