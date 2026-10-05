Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EC8CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykzFJf8V/2yXxJYZccH4hCRQdjDYiBaGvTlRpnHRJ9U=; b=0MSv2e57AEKhc+MLOWFhafSIwJ
	fjtAOecoOqSfEKHhIvtslbPODMXWvZUMQaoqq4CgQjuJ+suI0ZwkzOo4XiztoFmwzWM/UCVgdEjwK
	yDEdqOkHXlRGleAKJgExIkKomPD8x/1Hv2UYR+6796iSbgLjX1ycuaeE4auHBcWAyvfwYpzyyxxWR
	YHR6nhb7S2HExsCY4xZv6tsuIIf5OHZ9o437peeRDguC3ZSLI5+Re1XtLaz6Gg27i9QYGglnLl2O9
	RKxqH/3v1N+AZ07XA/yOWB9w5SUtBYhjbT5T27VFf90LjiqjUqXuzaWCkELVFQKI1V6cupmouqdue
	B9dSGdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcpU-0000000Flkr-47Hu;
	Mon, 05 Oct 2026 07:09:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcpS-0000000Flji-3AhC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 07:09:43 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791184178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykzFJf8V/2yXxJYZccH4hCRQdjDYiBaGvTlRpnHRJ9U=;
	b=zwCQZ5k9tM+8hb2GFqsnTjHUDpJRScO9qoE+kRil2TQaOelDFlTALaIvadK+6FjmS6gVOA
	Dh2mPuscoafrFDwvQjdLmPyj/rVRCR4lhQhKYnGwOQaMZbVllhwsVcgcVVODhjyRM4vH+z
	WwxloSDI7BTmRGHkLg7KfVrGFwutH1uiES1hYVmdWKU2gEz11NQGy2qwMO9KINNJ/DUunf
	40NWVXLY20Yyn+ex6zvng3kgUMUCD+0G/WSYhCwuzKWTThfHmlkpnoPGKNe31MB5CMUZgU
	Hkg6Zp+ub0YaIscZOMHOJ//U+U/ckRZrEjlnAcn1Q/4KXDmOP11blT1xi/i6yQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791184178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykzFJf8V/2yXxJYZccH4hCRQdjDYiBaGvTlRpnHRJ9U=;
	b=h0QeuFiF1HZJN2n6zZM73rq/GBmaL7BOhje0g4Zovd7pjIuntYPEILCvOAuzWvZWqAGKLU
	11HOmPDAxg7Uz0AA==
Date: Mon, 05 Oct 2026 09:09:32 +0200
Subject: [PATCH net v2 1/2] net: stmmac: Disable NAPI before stopping Tx
 queues in stmmac_xdp_release()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-stmmac_xsk_crashes-v2-1-46c60cba6421@linutronix.de>
References: <20261005-stmmac_xsk_crashes-v2-0-46c60cba6421@linutronix.de>
In-Reply-To: <20261005-stmmac_xsk_crashes-v2-0-46c60cba6421@linutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>, 
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 Kurt Kanzenbach <kurt@linutronix.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2343; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=Npj3lyjQeWCninc643PMtbQInmY0CNbwT9gsW5wBoRA=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBqw00xXh5X24kO1xk3Cyt2Zrvz6DgUrNG1svMeJ
 CldqKaOudiJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCasNNMQAKCRDBk9HyqkZz
 gsl+EACC6Ds/eVUzFacK1iii6oJICkDSPY9RrBp76kQuXWyR+n6lFl/MjV9Xu0WfqGyPQJTDhEO
 P0R8lOTX3AyL3xJ8QZeCvJZuT8OP0hB7PK6dWKB5AGtRm1PtjVD5BDEqvuAi89dMtxRqnevFNvg
 WVvRxP1CI1UNuXDmR6yV8fSqfILLsOy97bd7ebXXq5+HKE1b+r78sCNu2eBDV+RV84n1MaYI4rk
 xuw4LEEQAwNwnKpQdz1sw31d+hUWCOZApc5vhyBPnoUvlr1DYOPXsHdYREtQrMR04r/INiqc5P2
 wzKWnG3bDpKFF6SGS4rAetxz0gHvv6XNopjG1PX4F508MU0GC4doyivnRsaT/HoOZqpGU1MNM1r
 ikHGCUluzwE3uV9UgTZutMwVfGTPxL66nexs4wkWvD4+C5hTnw+IKwjQGhnXAFHM0claeuDYfCp
 BNBCiJgxXh/VgpEwRphUn0hetFsnpVml8xMc8JI8tbahAAhsdFmgWRBpcKd+1dSiz8crxiagscJ
 k0uWRCe7k2VVuq+Fnsisp2J4YBngeyOe7ND4WYK4cBajiQR62bZOsRcHcullpYkpDCYU5cCCcUM
 DA1E9TzkjFDp4/KRibjPGY58ipgEv/vx2Hql71qqS7rRSOBTI4DJ7+ptrvxyLYPDASfRVKF/HaV
 Z8QR0/3JB3BCt2Q==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_000942_952413_D1BC5D6F 
X-CRM114-Status: GOOD (  12.39  )
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

Attaching an XDP program while Tx traffic is running results in kernel
crashes in stmmac_xmit() -> dwmac4_set_addr().

Loading an XDP program tears down and reallocates all DMA resources via
stmmac_xdp_release() and stmmac_xdp_open(). stmmac_xdp_release() stops
the Tx queues before disabling NAPI:

 stmmac_xdp_release:
   netif_tx_disable
   stmmac_disable_all_queues
   ...
   free_dma_desc_resources

A Tx NAPI poll may still be in flight at that point. stmmac_tx_clean()
takes the Tx queue lock, reaps completed descriptors and wakes the queue
again when it observes it stopped with enough descriptors available.
Nothing stops the queue afterwards, so the Tx path resumes while
free_dma_desc_resources() releases the descriptor rings underneath it.

On non-coherent platforms dma_free_coherent() tears down the vmalloc
mapping of the descriptors, so the subsequent stmmac_xmit() faults on an
unmapped address instead of corrupting memory silently.

Disable NAPI first and stop the Tx queues afterwards, which is the order
already used by __stmmac_release().

The issue can be easily reproduced by:

 1. Run iperf
 2. Run application which opens an AF_XDP/ZC socket

Assisted-by: Claude:claude-opus-5
Fixes: 77711683a504 ("net: stmmac: ensure tx function is not running in stmmac_xdp_release()")
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9741f97fa37a..796817caf7af 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7178,15 +7178,15 @@ void stmmac_xdp_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
 
-	/* Ensure tx function is not running */
-	netif_tx_disable(dev);
-
 	/* Disable NAPI process */
 	stmmac_disable_all_queues(priv);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
+	/* Ensure tx function is not running */
+	netif_tx_disable(dev);
+
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 

-- 
2.47.3


