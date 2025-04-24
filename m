Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0555C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+3iKFxCfscjGZ5lo548PmHQDSd63gE+gM96nF6Z1AU=; b=A8LggfGISch3fsMDej6RRL78eD
	fdqZw591sAQjtYyg5kC9bFFd9WA+Q0ZMpXsIeymfts/Ufi4sPQ1ayzl5NW9M1bGHu6NJmx9nfsJsX
	apO2MEQV0iFKGjy9N0YF7t/e6X5k5PCrO25Vn64L37ComXSeHyJ/71eQFpduWRyD2ZLMdrx3FLURv
	fwHQp6O87a8GQOlJ1sBXiNpVmymaPsOXmPrnI/6cx3PE4ntfKgUze8Qd5WVGKBGd6Iab3jzMiBGdW
	5Jqqa9I1SHpiPi4ZqUhcvFbAcJoXW34PkfJK1ebFTrg5zr8yvDE7bCqB9JTQqLyz94+6rjBNf0NKz
	1YJVYBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sal-0000000DSYa-3l4R;
	Thu, 24 Apr 2025 09:09:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s8L-0000000DNMg-46xY;
	Thu, 24 Apr 2025 08:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745484035;
	bh=l9dPGwMvDj8gElRX3EvehtAe/d4UpYzyGhNZphyOZUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ar9PDOY0M/rexfHPKKWyAYFI3VdKZi6appSJiVwBw3wfbZ0+zy9UqHSe/35cV581U
	 7drbipRYeSVhHHVDLE7kOKWOfn0Ta/pisicOhDVwMp8gOyyWFYo3sHktMQGTPc4rfq
	 mChSOQMTjj+vZ2lg7UNrCkEnManx656Bqwd6sddpjoYkVTOCtU+ddXytvrirhAVimI
	 opiEZkXjt3S76MOjk4Rbul+sZvRNisZAH7S1FvtyQOMV326rSRgBDp8kyWLqPv6Zy9
	 Z1kcnszAj+1s9s5SHv3gL/dKf/2FvVI0zGGggnNp8pZwGYLspce9XhkCDeDmVYkxJr
	 ZJjW0Ey6KRY9w==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A49BC17E101A;
	Thu, 24 Apr 2025 10:40:34 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 24 Apr 2025 10:38:48 +0200
Subject: [PATCH net v2 1/2] net: ethernet: mtk-star-emac: fix spinlock
 recursion issues on rx/tx poll
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-1-f3fde2e529d8@collabora.com>
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484033; l=3810;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=l9dPGwMvDj8gElRX3EvehtAe/d4UpYzyGhNZphyOZUc=;
 b=KoIX2GlO4Q5JBfz87m1qsqYPtTVkGGkYO0CPRQg8RFotdR2FdoqjKXYr6QPnbJOJ4EW6TNDIj
 9mjx14b0pXkBczTGHKsph9qPHo2he+EWoFSHnwjDaAqgAqckEKZi1nS
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_014038_197937_363DC633 
X-CRM114-Status: GOOD (  11.68  )
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

Use spin_lock_irqsave and spin_unlock_irqrestore instead of spin_lock
and spin_unlock in mtk_star_emac driver to avoid spinlock recursion
occurrence that can happen when enabling the DMA interrupts again in
rx/tx poll.

```
BUG: spinlock recursion on CPU#0, swapper/0/0
 lock: 0xffff00000db9cf20, .magic: dead4ead, .owner: swapper/0/0,
    .owner_cpu: 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
    6.15.0-rc2-next-20250417-00001-gf6a27738686c-dirty #28 PREEMPT
Hardware name: MediaTek MT8365 Open Platform EVK (DT)
Call trace:
 show_stack+0x18/0x24 (C)
 dump_stack_lvl+0x60/0x80
 dump_stack+0x18/0x24
 spin_dump+0x78/0x88
 do_raw_spin_lock+0x11c/0x120
 _raw_spin_lock+0x20/0x2c
 mtk_star_handle_irq+0xc0/0x22c [mtk_star_emac]
 __handle_irq_event_percpu+0x48/0x140
 handle_irq_event+0x4c/0xb0
 handle_fasteoi_irq+0xa0/0x1bc
 handle_irq_desc+0x34/0x58
 generic_handle_domain_irq+0x1c/0x28
 gic_handle_irq+0x4c/0x120
 do_interrupt_handler+0x50/0x84
 el1_interrupt+0x34/0x68
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x6c/0x70
 regmap_mmio_read32le+0xc/0x20 (P)
 _regmap_bus_reg_read+0x6c/0xac
 _regmap_read+0x60/0xdc
 regmap_read+0x4c/0x80
 mtk_star_rx_poll+0x2f4/0x39c [mtk_star_emac]
 __napi_poll+0x38/0x188
 net_rx_action+0x164/0x2c0
 handle_softirqs+0x100/0x244
 __do_softirq+0x14/0x20
 ____do_softirq+0x10/0x20
 call_on_irq_stack+0x24/0x64
 do_softirq_own_stack+0x1c/0x40
 __irq_exit_rcu+0xd4/0x10c
 irq_exit_rcu+0x10/0x1c
 el1_interrupt+0x38/0x68
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x6c/0x70
 cpuidle_enter_state+0xac/0x320 (P)
 cpuidle_enter+0x38/0x50
 do_idle+0x1e4/0x260
 cpu_startup_entry+0x34/0x3c
 rest_init+0xdc/0xe0
 console_on_rootfs+0x0/0x6c
 __primary_switched+0x88/0x90
```

Fixes: 0a8bd81fd6aa ("net: ethernet: mtk-star-emac: separate tx/rx handling with two NAPIs")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 76f202d7f05537642ec294811ace2ad4a7eae383..23115881d8e892a622b34b593cf38e2c8bed4082 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1163,6 +1163,7 @@ static int mtk_star_tx_poll(struct napi_struct *napi, int budget)
 	struct net_device *ndev = priv->ndev;
 	unsigned int head = ring->head;
 	unsigned int entry = ring->tail;
+	unsigned long flags;
 
 	while (entry != head && count < (MTK_STAR_RING_NUM_DESCS - 1)) {
 		ret = mtk_star_tx_complete_one(priv);
@@ -1182,9 +1183,9 @@ static int mtk_star_tx_poll(struct napi_struct *napi, int budget)
 		netif_wake_queue(ndev);
 
 	if (napi_complete(napi)) {
-		spin_lock(&priv->lock);
+		spin_lock_irqsave(&priv->lock, flags);
 		mtk_star_enable_dma_irq(priv, false, true);
-		spin_unlock(&priv->lock);
+		spin_unlock_irqrestore(&priv->lock, flags);
 	}
 
 	return 0;
@@ -1341,6 +1342,7 @@ static int mtk_star_rx(struct mtk_star_priv *priv, int budget)
 static int mtk_star_rx_poll(struct napi_struct *napi, int budget)
 {
 	struct mtk_star_priv *priv;
+	unsigned long flags;
 	int work_done = 0;
 
 	priv = container_of(napi, struct mtk_star_priv, rx_napi);
@@ -1348,9 +1350,9 @@ static int mtk_star_rx_poll(struct napi_struct *napi, int budget)
 	work_done = mtk_star_rx(priv, budget);
 	if (work_done < budget) {
 		napi_complete_done(napi, work_done);
-		spin_lock(&priv->lock);
+		spin_lock_irqsave(&priv->lock, flags);
 		mtk_star_enable_dma_irq(priv, true, false);
-		spin_unlock(&priv->lock);
+		spin_unlock_irqrestore(&priv->lock, flags);
 	}
 
 	return work_done;

-- 
2.49.0


