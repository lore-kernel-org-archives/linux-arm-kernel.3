Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEB7F99C88
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pN0o7BK1pIZ9sDYdlJZcQbTL9p/fjnp83EDBt8ccDu8=; b=JjGjhpvmglMtlCA8A3bCNnvDy3
	ret3IShKL/1YDc9irF/bSZlwg4AIGRaNMdkIND+Zqgq1avP/VgfLkoVJ6gouEu03ysab6+TWfAlM6
	lMswBrLjOvKlHAjno3eYjf5oMuson8DYGCYHqKlD6wGKQs2GTIwCU54tVeIzB96nC0EecdANR4v4A
	c3803pMqZMRIJ/FDMGpxaGid/srE5KFqbbJd+IcNGzy33cV8vC1q0vntn0ydaOcgGPHG3PucylEzg
	2W5seVy7K4SlDoKd21bngwz/m75lRVFE3TtYTMnNlw8cSrBKDDPxnRd/nAznyzFtV5++y59zJqoYt
	tTsEdnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEA2F-000000058Sr-2YyJ;
	Sat, 18 Apr 2026 18:04:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEA2D-000000058SU-0rJG;
	Sat, 18 Apr 2026 18:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 171164385D;
	Sat, 18 Apr 2026 18:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2F5C19424;
	Sat, 18 Apr 2026 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776535487;
	bh=qwrArXkdKtSRP17F8YTE6Be+Z4mkpURZ8OCUdqmMrNw=;
	h=From:Date:Subject:To:Cc:From;
	b=PPs/65VX7qqQVRib0R5OJoUhtdtF6UU/qIxhe9Gh3dvI/QiuHH1gHD5qH9YEHcx3v
	 90C4KOUYiWkCifeTJgx0eu7uDdrCn8omRwi+8eevtlMCdemrvUPDT5LNPI9+z//2s6
	 EkFPdyewqLZ7rx4NlLAuKg2sOezM1gNLVRKFzOi0zu5feVLULmDnJK4c6mBaqQwLZW
	 pb5yXhtW0osP/05lrJUc+hXzK3QOOY2kG1aeZ7s4bEYTixXkq3bUbWHt/CmNPFhmaU
	 VnXfiPT/B6ab9XIR6tjkb97Q7zMtKXvP0eSp12fHDx+IvBpvEV+8090eeKkFsnLsdl
	 c8NgjbllYUXZw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 18 Apr 2026 20:04:16 +0200
Subject: [PATCH wireless] wifi: mt76: mt7996: Fix NULL pointer dereference
 in mt7996_init_tx_queues()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-mt7996-dma-init-npu-fix-v1-1-6b8dcffbcb57@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G6ilaOtXxEPRqAGt0riB+HeLx
 xmYeUAoMgnU2QORThZeQ4Iiz6CbfBgJuU8MWulSmcLislfOldgvHjnwjmE7cOAbq0FbozrjtLK
 Q6i1S0v+5gYsjzSQC7ft+jba15XMAAAA=
X-Change-ID: 20260418-mt7996-dma-init-npu-fix-7f2840c49208
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_110449_291836_0222F713 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

When MT76_NPU and CONFIG_NET_MEDIATEK_SOC_WED are enabled and
mt76 detects properly the Airoha NPU SoC, mt7996_init_tx_queues() will
dereference a NULL WED pointer.
Fix the issue by always passing the WED pointer from mt7996_dma_init().

Fixes: cd7951f242a7 ("wifi: mt76: mt7996: Integrate MT7990 dma configuration for NPU")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index 8f5d297dafce..3d9353811a02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -683,7 +683,7 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 		ret = mt7996_init_tx_queues(&dev->phy, MT_TXQ_ID(0),
 					    MT7996_NPU_TX_RING_SIZE,
 					    MT_TXQ_RING_BASE(0) + hif1_ofs,
-					    NULL);
+					    wed);
 	else
 		ret = mt7996_init_tx_queues(&dev->phy,
 					    MT_TXQ_ID(dev->mphy.band_idx),

---
base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
change-id: 20260418-mt7996-dma-init-npu-fix-7f2840c49208

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


