Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCABCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nfuysb1r/89+ZrV1E85qpQuYbpPmf4DR4+ysy9HhnX0=; b=Gk4wXNE2zLIyyT
	0IpivfwUtrpPfT21kEFiEqBrYlXfurugZigs05iuBrOYsrc2vtxZFccNz6RiBvW5xrtKihsBsL3IF
	rtUIWyyj60LuKcWm0zYaAlUPLlV6w376Xs87b/LcL8TFqX3qZU0Tqty3JUqYJ8NnXvdmoZpR+o9CF
	TaAwqM1IisYQjRSjDQ5+nBOsAQFt5W+fT7Fc/Fzk5p4ubdaVAAOXvbVY/YzKbUjo6Pc1C80fvSl4Z
	ZbO8A7U4NxTkvM9zBGIiQyi9tukUKduhybH1h9zgIaZ3VJ1n81SyYlJB7qpvhLArIiSkrEZ5pHClM
	LLTPUDhWSSlUpFRbBRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1Q8-00000008afe-0SPt;
	Tue, 09 Sep 2025 16:42:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuui-000000065s2-1fwT;
	Tue, 09 Sep 2025 09:45:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E9D741749;
	Tue,  9 Sep 2025 09:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B2CC4CEF4;
	Tue,  9 Sep 2025 09:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411123;
	bh=6Ia94TRSZA8SsqhhVryqysgdQbFx10IztQi8lM9eEWY=;
	h=From:Subject:Date:To:Cc:From;
	b=NjKhMMDYd72PhQgDOxt8i8Ro/KBVVDDBON28EkMgi4bndcvon6TjRPk7e2a3HD6Cp
	 UXvygD+ZWGOU4z+QrHMRbp8QS3s9SJeaJv/uqaYLyCGVuuUeKJvf3E0vsrYIyhHsFK
	 EZv4PdYAif1g+bmIk+CGVzm4cfyJZPiUHOdGEin33SsrO77GKvLHqh+iwZy7ozli5k
	 1YnnwAvb0RTpzPqcFWhrRuIBuvpbVt6tx+z0bW1yMM8ksafyZKdWhSWQlDDCuPvlQ7
	 Q7rrGh8kZVPS6sgxAOu9tpqlJvt5DDuOIaEZ8kL85x3SpYS7K6qZxFXP1V4GdE/rtE
	 8kY74Bxy0F+og==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 v5 00/16] wifi: mt76: mt7996: Decouple RRO logic from
 WED support
Date: Tue, 09 Sep 2025 11:45:08 +0200
Message-Id: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACT3v2gC/33NQQrCMBCF4atI1kaSaZpmXHkPcaHNRIPayFSqI
 r27sRsrFpf/wHzvKVriSK1Yzp6CqYttTE2Ocj4T9WHb7ElGn1uAglI50PJ8rRCtZE6S6Zb4KMG
 gqolUUN6J/HdhCvE+mOtN7kNsr4kfw0Sn39d/WqelkrZ2pqq2Hi2G1ZG4odMi8V68uQ4+BKpJA
 jKhA+YJuyu11z9EMSZgiigy4YLThUOFJdIPYcaEmSJMJqD2qKkCQG+/iL7vX0/n7/R8AQAA
X-Change-ID: 20250821-mt7996-rro-rework-2490cee0f0d8
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024524_519901_8EDD2D3C 
X-CRM114-Status: GOOD (  10.20  )
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

Decouple RRO logic (v3.0 and v3.1) from WED support in MT7996 driver in
order to reuse it when WED module is not available.
Introduce WED offload support for MT7992 chipset in MT7996 driver.

---
Changes in v5:
- Fix more bitmap usage in DMA descriptos data.
- Fix compilation warning.
- Link to v4: https://lore.kernel.org/r/20250904-mt7996-rro-rework-v4-0-2cd91e7229d6@kernel.org

Changes in v4:
- Do not use bitmap for DMA descriptos data.
- Link to v3: https://lore.kernel.org/r/20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org

Changes in v3:
- Fix compilation warnings
- Rebase on top of mt76 main branch
- Split patch 4/14
- Link to v2: https://lore.kernel.org/r/20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org

Changes in v2:
- Fix SER when Wireless Ethernet Dispatcher (WED) is disabled
- Rebase on top of mt76 main branch
- Link to v1: https://lore.kernel.org/r/20250821-mt7996-rro-rework-v1-0-6c8477ad969f@kernel.org

---
Lorenzo Bianconi (8):
      wifi: mt76: Add reset_idx to reset_q mt76_queue_ops signature.
      wifi: mt76: Remove q->ndesc check in mt76_dma_rx_fill()
      wifi: mt76: Do not always enable NAPIs for WED RRO queues
      wifi: mt76: mt7996: Fix tx-queues initialization for second phy on mt7996
      wifi: mt76: mt7996: Fix RX packets configuration for primary WED device
      wifi: mt76: mt7996: Convert mt7996_wed_rro_addr to LE
      wifi: mt76: Add rx_queue_init callback
      wifi: mt76: Add mt76_dma_get_rxdmad_c_buf utility routione

Rex Lu (8):
      wifi: mt76: Differentiate between RRO data and RRO MSDU queues
      wifi: mt76: mt7996: Initial DMA configuration for MT7992 WED support
      wifi: mt76: mt7996: Enable HW RRO for MT7992 chipset
      wifi: mt76: mt7996: Introduce the capability to reset MT7992 WED device
      wifi: mt76: mt7996: Enable WED for MT7992 chipset
      wifi: mt76: mt7996: Introduce RRO MSDU callbacks
      wifi: mt76: mt7996: Decouple RRO logic from WED support
      wifi: mt76: mt7996: Add SW path for HW-RRO v3.1

 drivers/net/wireless/mediatek/mt76/dma.c           | 226 +++++++++---
 drivers/net/wireless/mediatek/mt76/dma.h           |  29 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          |  54 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c    |   4 +-
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c    |   6 +-
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    | 326 +++++++++++++----
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 318 ++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 387 ++++++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  17 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    |   4 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c   |  89 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  89 ++++-
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c    |   3 +-
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h   |  32 +-
 drivers/net/wireless/mediatek/mt76/wed.c           |   8 +-
 15 files changed, 1315 insertions(+), 277 deletions(-)
---
base-commit: 29806c11aec7a552fa351867efa1337cc4ad1fe9
change-id: 20250821-mt7996-rro-rework-2490cee0f0d8

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


