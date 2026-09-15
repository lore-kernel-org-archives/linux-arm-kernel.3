Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D82DC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMJ3kAH2H7v1EwMfvPitDPV9QPEVx96053JJoMhRZJs=; b=G3UV2/Ruix4Gf0T6HPaLo3zBg1
	CzeXBUlpZzqn/TBUvay2EAfOxRyCCqwQy0dwguxfeUq6rQzw/JjtN654cIGuX518gkXIV2LImBw74
	KpvwbySryu1EcbYJBksHzRoQEd5gxgitKtTBQKxrbUaCxFlUSMmLybwGMo2bdfjqsIdKmY+mEewFu
	DalJX4JrDv3jukgc0njqvLU81Ii73VeexF6foo6BAuyurvQ9IxoQjRUxDbdVOZC75Ggb8e0LUoo8x
	viXh31TatZYHii1rClzj/cZfR7ThZYZWFN/CeSasKHU/xhufhfPdXoSc+I0inIz91ObrBH4+33ENm
	dPmFHXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Owu-00000005hqD-02zJ;
	Tue, 15 Sep 2026 08:55:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Owr-00000005hoR-1euv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:55:30 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789462525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hMJ3kAH2H7v1EwMfvPitDPV9QPEVx96053JJoMhRZJs=;
	b=eQxa4rTGWLcefuQCDvytS+cTBpXko4P99kaxBvTKuykFGBaJJ9CJYlLTBvu2wQi0lT/0bD
	ri5Urk8/SD3FfrH1EsHvgwLVbz5qBY3M2Oc+21II3alrKg3XIDNpEib4nVGod0ShSms6oZ
	Fea1aXKOM5V0vPiPafql09JaOGK1a0W6lZrFtSX1ccS8kqN6uitVkpLRBt9aonwK3Uq0tW
	cg1XnXApr0vcgp5y1RkzYMbw6ZJLpwkltXwBeE6kPtpZHXAymEFhO1+1lylH0bBDQ8Xkeh
	E9H3P1YjRDPYDRwfR92zTuq/7ASHQ2vw/o0f/2yXgeAHZwB90QwWiErcSc3b/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789462525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hMJ3kAH2H7v1EwMfvPitDPV9QPEVx96053JJoMhRZJs=;
	b=xEfU9KKd6yg1EZ6ZmZjqz1H/aDxa/KnzJuJ1gBEOLClsH394695bMxx/lyEbjSahU3FISL
	gsU7p7hAGRsvagCQ==
Date: Tue, 15 Sep 2026 10:55:05 +0200
Subject: [PATCH RFC net 1/2] net: stmmac: Disable NAPI before stopping Tx
 queues in stmmac_xdp_release()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-stmmac_xsk_crashes-v1-1-e14553fcf553@linutronix.de>
References: <20260915-stmmac_xsk_crashes-v1-0-e14553fcf553@linutronix.de>
In-Reply-To: <20260915-stmmac_xsk_crashes-v1-0-e14553fcf553@linutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
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
 h=from:subject:message-id; bh=jR0H34vdiv7W/SJ2FsE8rZ6PylOArSBFOR8UWIe5QP4=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBqqQf7VRjiE33xEjX5HXdvVzeunnvJsx+68sJZ8
 CyIsgNhPymJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCaqkH+wAKCRDBk9HyqkZz
 glBiD/92mTGGrKpOeUztqwXY2V5plO6OoGyiU+j5cgP1leoX/hJ5NOef0QMobjCueVorAy5t7lM
 B5E5ZnNqv7G3fT/MKvIUAOGeGwU3WsDztSxWbD57kIHBZLZyqo8iLoSW/MHUbmRdWVpNBS5eGPe
 hz0wXI8eO8pKXPu/udFlGGHfIMzzm1F5cYKZO0vf1kIgxSNrChuBRXTYVqtlgulkFTAR/TRFcsc
 Fdq7KN2NiUhOxhbj7cQxj1vEFRD6Pf3Q9SdJn4CqT2p2zjy9smZFAtv0n1nwDsIQz3W/Q5PurrC
 Yq1yK5ny3qgwNCZCDTa3b4xOqVCsvfzc+2H2Cl2u4Qy1KtUoBH9PAFKc8FiMfyjZ80nGQt4Pkrh
 yJ74cWJNFtnJCcQHgWtwFIg2cQ9wJEFoddjCZEF2UM/L0GwivF8CahL1FiG0U+wqPLSH+Ld/MwU
 9qQutwhsevpetjYVKPJYV5+xvBKyNdKYbe/qBW++6tVKRRPlHyuU8xg1TAbwj9a7N3J6Sv/AbGI
 u5K7BBXk81qrnpILF3Z7maLOeegTZ7TybjvDLjVTeqA39kssBqeSoSjVYOQqZGXDc5Wkog/MBLI
 bbIMQj67o35mKQnKZBCcJ2MN16G/Ya6xgFG26FJYRNoVae0otVMDJYIpjVGrZ2wjzx06eTf0AQj
 8fHP5dMYKPbeYjQ==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_015529_589254_9422AF7C 
X-CRM114-Status: GOOD (  12.69  )
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
index 62c3441911e7..928aa05aa87d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7118,15 +7118,15 @@ void stmmac_xdp_release(struct net_device *dev)
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


