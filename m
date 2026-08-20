Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBE8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 04:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4xcLOCx3S0JrW7h9n5Y0wUiYz/r3Bt5hqhyZUGbtns=; b=douwapxA1fccFk5J0ZWM+ZI/2F
	kJMXB/x9+Bb9PelKMk8m0hVRx1XB4qTL1ZkfjRO5hC3ElfPlYKdi2oO+GT+l0RKQwCUBDoROnwsST
	YPd/dwjkg23y2PH6dpS0Nkjkf8jRS3qwoQhsXYZl1EFvHRyIE6dTYP6MJZsUPdtP43svlEHqVsE6m
	Pc/ar9WAGd6wdo41wDVzjRskirS/LAY8VI69lJeSy4pAdJ/a8ifmQD9doEH5vcffEsAElIXRzZ3xW
	99bgHtbtsYFevEs3ZHT5LQsbEB5QlwYUmAAODwVBaoyIPWWFVtGzPYJRyMixBl6sCwW7MxL5m9sGq
	YMpKzCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwumt-0000000ApBo-1edy;
	Thu, 20 Aug 2026 04:53:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwumq-0000000ApBS-0fqM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 04:53:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so19069525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 21:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787201633; x=1787806433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4xcLOCx3S0JrW7h9n5Y0wUiYz/r3Bt5hqhyZUGbtns=;
        b=iIJp7LOHWmLgb6PFMRK9QaaxvnOqxIQ+3VUSkLRaNAlGLQa+17bzx3Er/phCAzIVz3
         6QLD4QtJQUAEcYwYAMqt38xHRTugds2j+2blgPS9K3BmofZSgv+yQW57Jlzlu27ZlPil
         lZMBsNcP7ZZ8tQmQnGE0x+ytFEvGTX5tvExrjXcr4+i1t2C/jql9TGpve6QYbV/9LgnK
         f89/Kg137tR6XU+O8G8ooMuuQ2D9xkVAaGZwqgMu7yNBRsRpg1TtqAyVZvdzqxyQpaOH
         W9YgmSRtduhTyUnLdyd+lyPmmy7CKH/3/2IwzOvaP3lPpn6eO2OJmVdjBExZmM4O88tn
         e/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787201633; x=1787806433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4xcLOCx3S0JrW7h9n5Y0wUiYz/r3Bt5hqhyZUGbtns=;
        b=R53BPor6AQthrZpFKtkL2xYxLg+Uas35vRikGbhVl2Qr9VCNTs9ywjLLF0pTHbT7Ub
         Bg8FLOl7t21UUWhPuU2cpLUdoIoZH5d9aw67fiLkJ7jaH5+DJIvsUl3E7Jqsg+v6R+mH
         J1R47oQLHiY/Im3NbF1X/LFeLh87UARH8hvwwshxBUb6Ils+2IwLuQUhisA3ReITtczD
         UknMdVOEW9oRwixIONKBuxHX0RLfroUNIrDV+EGaaLPXk0lx7vs4XsWghzF+vLUZ5AmC
         6yjVqHXFukQ1NLvSWdX2dzcMJyFgZDoPbwyVUWbz/SmM2TsFy7RJ8IgciDaz92wk6cpU
         wpNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rps5PmxRjFiaYpsE5W2tbOSPQIwKo4ubSRFEZBaEmAxiEcYsWzYC/O6aJjGahgHv2CTKWXRFqAFDC5FNfPZZDVH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb8XDvsX7i5k3Cv2O9DzqM8J77xXbuWNKraXCI2eKi6lPkVIR8
	4M0L1/gCY9hVDokEeX19SNLTvvJZi0qtd5STV/4Ln90Pf0r9guoHqJ+Z
X-Gm-Gg: AR+sD10zSb7/cPduSpAVuyeY9o4cX1GCUhjh3sj9UlyUlsQkfn9WEcgTRlzE2TRnjfO
	2ZKkK0LRZSs3zmnxF6TE8RhTMjqQPbAUdnKOsWOqElB9rCn6EuTGhEkCZJWd2kuylkVvRJfSnmp
	T9bNRXBbi8jzdbZmLM7PFnFZyLZKOGRYjXIVs9ZanYrkeZorYSBpv8kHIDqeEBC9i50CGPPbmkF
	74GojyKcq4ATQOk2ZiiF8xcRw7bh2mtR5w25/xKouncQcHQcAO/orlE/WvsK80pGvMk2ZOvz99j
	uknNxvUe5OMG5sYmOvq57IMQMnslZm0V1gx/9MB1U3uIO6lU//u4VN18QqrzxPsP2SLUOxCBq6B
	YlAGucVHRuOxGYe8ClQ5aOY5ugHFTbSIDrk+Nds1nALJTY9UMdNXtMxYKHOnULrABI06Y6ThthI
	dDwL28vVhs7GBKo/fQRrqTa3DWJqP+c8CFk/qMRMfsly7pJutQuVIuH07e1Ydts3y7lW8gWIcgx
	bDMKJxCc5FORJMsTkKAZoDgF0wmFI+QsH9P/W/G
X-Received: by 2002:a05:600c:540e:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-499aa1d0b23mr182276385e9.10.1787201633070;
        Wed, 19 Aug 2026 21:53:53 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e784b3sm97616565e9.3.2026.08.19.21.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 21:53:52 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
To: pabeni@redhat.com
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dev.taqnialabs@gmail.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	qingfang.deng@linux.dev
Subject: Re: [PATCH net-next v4 1/3] net: stmmac: enable MAC rx/tx after DMA start
Date: Thu, 20 Aug 2026 04:53:29 +0000
Message-ID: <20260820045330.618-1-dev.taqnialabs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818135704.212816-1-pabeni@redhat.com>
References: <20260818135704.212816-1-pabeni@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_215356_253068_EB2BB4D2 
X-CRM114-Status: GOOD (  48.06  )
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

On Tue, 2026-08-18 at 15:57 +0200, Paolo Abeni wrote:
> [Severity: Low]
> Could a Fixes: tag be added for each of the two sequences being corrected,
> one for the ordering in stmmac_hw_setup() and one for the same ordering in
> stmmac_xdp_open() which arrived with the AF_XDP path?
>
> Without a Fixes: trailer, how do stable/backport tools determine the
> affected release range, and is this intended for net or net-next?

Yes, I missed the trailers. These are supposed to be fixes.

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Fixes: ac746c8520d9 ("net: stmmac: enhance XDP ZC driver level switching performance")

The interface stall can happen on any platform if inflow happens between
stmmac_mac_set() and stmmac_start_all_dma(). I added an intentional delay
between these two events to test it, and that made the interface hang
100% reproducible.

I will resend as [PATCH net] with both trailers in the next version.

> [Severity: Medium]
> Does this reordering actually close the window on the dwmac4/dwmac5
> (GMAC4+) cores?
>
> There the MAC receiver and transmitter enables are set from inside the
> per-channel DMA start callbacks:
>
> drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c:dwmac4_dma_start_rx() {
> 	value |= DMA_CONTROL_SR;
> 	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(dwmac4_addrs, chan));
>
> 	value = readl(ioaddr + GMAC_CONFIG);
> 	value |= GMAC_CONFIG_RE;
> 	writel(value, ioaddr + GMAC_CONFIG);
> }
>
> and dwmac4_dma_start_tx() does the same for GMAC_CONFIG_TE.
>
> stmmac_start_all_dma() starts the RX channels one at a time:
>
> 	for (chan = 0; chan < rx_channels_count; chan++)
> 		stmmac_start_rx_dma(priv, chan);
>
> so the global MAC receiver is already enabled by the first iteration while
> channels 1..n-1 still have SR == 0. On those cores, isn't the relocated
> stmmac_mac_set(priv, priv->ioaddr, true) redundant, and doesn't the
> "MAC classifies frames into an MTL queue whose DMA is not running"
> condition still exist whenever rx_queues_to_use > 1?
>
> The RE-in-DMA-op coupling itself isn't introduced by this patch, but should
> the commit message claim "The EMAC should only accept packets after the DMAs
> are enabled" be qualified, or should the dwmac4 coupling be decoupled too?

Not completely on dwmac4/dwmac5.
dwmac4_dma_start_rx() raises the global GMAC_CONFIG.RE itself, so RE is
up after the chan 0 iteration of stmmac_start_all_dma() while the rest of
the channels still have SR (the start bit) clear. That is still a timing
gap where the MTL queue can fill up.

Mainly, RE is no longer set before stmmac_start_all_dma() is entered at
all. That was the long window, where stmmac_dma_operation_mode(),
stmmac_mmc_setup(), stmmac_set_rings_length() and the rest of the setup
all ran with the receiver already live.

On XGMAC even that is gone once 3/3 ("net: stmmac: xgmac: decouple the
MAC Rx/Tx enables from the DMA ops") is added, since it takes the RE/TE
writes out of dwxgmac2_dma_start_rx()/dwxgmac2_dma_start_tx() entirely.

Ideally the same should be done for dwmac4/dwmac5, but I left that out
as that was not the hardware with me. Seems like should follow the same
and will do that in the next version.

> [Severity: Low]
> This isn't a bug introduced by this patch, but the mirror-image teardown
> ordering used to be the reverse of what this patch establishes, i.e.
> stopping the DMA before disabling the MAC Rx in __stmmac_release(),
> stmmac_xdp_release() and stmmac_suspend(). The follow-on commit "net:
> stmmac: xgmac: tear the datapath down in the documented order" introduces
> stmmac_datapath_teardown() and converts those callers, so the MAC is
> disabled before stmmac_stop_rx_dma() runs:
>
> 	/* Disable the MAC TX and RX */
> 	stmmac_mac_set(priv, priv->ioaddr, false);
>
> 	/* Wait for the MTL RX queues to drain into the RX DMA */
> 	...
> 	for (chan = 0; chan < rx_channels_count; chan++)
> 		stmmac_stop_rx_dma(priv, chan);
>
> Noting it here only for completeness, since the remaining "MAC Rx on, DMA
> off" case is the WoL branch of stmmac_suspend(), which that commit
> documents as intentional.

Right, that is 2/3 ("net: stmmac: xgmac: tear the datapath down in the
documented order") of this series. The teardown is not the exact inverse
of the bring-up; the databook gives its own order for it.

Also, the WoL branch in stmmac_suspend() is left on stmmac_stop_all_dma()
on purpose. That path only stops the DMA channels and never calls
stmmac_mac_set(priv, priv->ioaddr, false), because the receiver has to
stay enabled for the wake frame to be seen. 

> [Severity: High]
> This isn't a bug introduced by this patch, since the DMA was already started
> here before the reorder, but the MAC enable now sits inside a region whose
> error path never unwinds either the DMA or the MAC.
>
> If stmmac_request_irq() fails, the unwind in stmmac_xdp_open() is:
>
> irq_error:
> 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
> 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
>
> init_error:
> 	free_dma_desc_resources(priv, &priv->dma_conf);
>
> There is no stmmac_stop_all_dma() and no stmmac_mac_set(priv, priv->ioaddr,
> false), while free_dma_desc_resources() reaches:
>
> __free_dma_rx_desc_resources() {
> 	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
> 	...
> 	if (rx_q->page_pool)
> 		page_pool_destroy(rx_q->page_pool);
> }
>
> Can the RX DMA then write received frames into the freed coherent
> descriptor ring and the freed page-pool pages? stmmac_xdp_set_prog() also
> discards the stmmac_xdp_open() return value:
>
> 	if (if_running && need_update)
> 		stmmac_xdp_open(dev);
> 	...
> 	return 0;
>
> so does the device stay in that state indefinitely rather than being
> reported and cleaned up?
>
> The same gap looks present on the ifup path: __stmmac_open()'s irq_error
> label only does phylink_stop(), the per-queue hrtimer_cancel() and
> stmmac_release_ptp(), and stmmac_open() then falls through to
> err_dma_resources: free_dma_desc_resources(priv, dma_conf), which frees the
> rings that were programmed into the live DMA engine.
>
> Should these error paths be made symmetric with the release path, which
> does:
>
> 	/* Stop the MAC and the TX/RX DMA channels */
> 	stmmac_datapath_teardown(priv);
>
> 	/* Release and free the Rx/Tx resources */
> 	free_dma_desc_resources(priv, &priv->dma_conf);

Yes, it can. The rings are freed while the Rx DMA is still running, SR is
set and nothing on that path stops it, so the engine can write into freed
memory. stmmac_xdp_set_prog() then drops the return value, so the device
is left that way. The similar gap exists in the ifup path too.

It is a real issue, but it existed before the reorder too. Both the MAC
and the DMA were already live at irq_error:, so this could happen even
before the reordering. I do understand the concern, but the AI review
does seem to flag everything it finds wrong in the surrounding code even
when the patch did not introduce it.

I could look into a fix for this, but cleaning up all the surrounding
code flagged by sashiko seems like an endless loop.

> [Severity: Medium]
> This is a pre-existing race rather than something the patch adds, but it
> bears on the invariant the patch is establishing: the ordering here is only
> statement order inside stmmac_xdp_open(), and nothing serializes it against
> phylink's resolve worker.
>
> phylink_resolve() runs from a work item holding only pl->phydev_mutex,
> phy->lock and pl->state_mutex, with no rtnl:
>
> drivers/net/phy/phylink.c:phylink_resolve() {
> 	mutex_lock(&pl->phydev_mutex);
> 	phy = pl->phydev;
> 	if (phy)
> 		mutex_lock(&phy->lock);
> 	mutex_lock(&pl->state_mutex);
> 	...
> 		else
> 			phylink_link_up(pl, link_state);
> }
>
> and that reaches stmmac_mac_link_up() -> stmmac_mac_set(priv, priv->ioaddr,
> true). The AF_XDP reconfiguration never quiesces phylink:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c:stmmac_xdp_set_prog() {
> 	if (if_running && need_update)
> 		stmmac_xdp_release(dev);
> 	...
> 	if (if_running && need_update)
> 		stmmac_xdp_open(dev);
> }
>
> So can a link-up resolved on another CPU re-enable MAC Rx after
> stmmac_xdp_release() has stopped the DMA and before stmmac_xdp_open()
> reaches stmmac_start_all_dma(), which is the same "MAC accepting frames with
> no DMA to drain the MTL FIFO" condition described in the commit message?
>
> Separately, stmmac_mac_link_up() and stmmac_mac_set() both do unlocked
> read-modify-write on MAC_CTRL_REG:
>
> 	old_ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
> 	ctrl = old_ctrl & ~priv->hw->link.speed_mask;
> 	...
> 	if (ctrl != old_ctrl)
> 		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
> 	...
> 	stmmac_mac_set(priv, priv->ioaddr, true);
>
> Can concurrent speed/duplex and RE/TE updates lose each other's bits?

They also look valid, but they are not related to or introduced by this change.
Again, I am not able to see how either of these follows from the reorder proposed here.

In this 3-patch series, the primary fix I intended was for the interface
hang, and based on the initial reviews it made sense to fix the teardown
path too even though teardown was left untouched.

I also took a look at the comments on 2/3 ("net: stmmac: xgmac: tear the
datapath down in the documented order"), and some of them seem valid, but
addressing those corner cases does not look straightforward and will 
definitely need some time.

Would it make sense to send 1/3 ("net: stmmac: enable MAC rx/tx after DMA
start") and 3/3 ("net: stmmac: xgmac: decouple the MAC Rx/Tx enables from
the DMA ops") as the [PATCH net] fixes for the bootup interface hang, once the
review comments on them are addressed, and leave out 2/3 ("net: stmmac:
xgmac: tear the datapath down in the documented order") for now, since
the teardown path was never intended to be the fixed here?

Would like your feedback on how to proceed.


Best Regards,

Abid


