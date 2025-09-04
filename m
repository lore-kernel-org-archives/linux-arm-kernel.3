Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8C1CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=andwmpKrCJmWqbe3js2pBT19a3YYMZomvjRde22VNvE=; b=d9ozpgON0hiAzn
	sNi5J20KvP6yvgLaDIZ+tAAvmzNeVMvnISusfOBLTHGowi5moEomoBkwNGipoyivkwqPNnbePaypY
	w2ojrBQlq2DTeHOiidTkCbbJlU0ELK3vTp44liN7fxkxaYPDe8/7c/u92KTpJ/J09Vw/OFOgNsUzc
	PHxih0kC8FbAQyq61B/qMOEjt0O82RObvNu2g63nssmuJeUVZxEND2WKeugZBVxWAdtbhmdB8LZH0
	GSFNPF9Nfu7kMfsfiQtMtkcC3ZJ5dzrEq6hMEocMniCO+LwOFVB0plQaeeSY2MwXFFQ0nrxo1kamM
	H88yyIjcOpRvnBBZXpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0j-0000000Fxtg-2hg1;
	Fri, 05 Sep 2025 02:17:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCyY-0000000D0Bq-1yMB;
	Thu, 04 Sep 2025 16:38:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1DCB60247;
	Thu,  4 Sep 2025 16:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430D4C4CEF0;
	Thu,  4 Sep 2025 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757003897;
	bh=ChX4cPagxHty/nC/yRxRrePEVJPTduypsP1Q5ifYM7Y=;
	h=From:Subject:Date:To:Cc:From;
	b=BITsbOMIAwbcvehEwnuLF/fetUdeLkMwFX7QHiXTTQ4r+fgBFgUIXQsvXMTcHmQIE
	 vnddshjNs1AjPvUqrN62kC3EPdyOQ+/b2Vqt45F/c1anaTzLYjCKvgQxjvBmS8PEKL
	 EQ31dUYUEpDatFSa83RYya5cVOpSAq3kPIlokeh8Egs1CpVEkpq8NFwhvxRA1wQvU1
	 WKq7/7Wwv/wnwY+9nTB3Ir6XTsJCm+k3qpEuG76xU5Kznhj0ziKren5m0zNp6DLNCc
	 fVOFgtDndk5iOdSEMHaxQVPkKFAX0/Oluxj+FAlpabwoZPAjsapR01KxQR37isavve
	 2/1h4E3eMXUPQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 v4 00/15] wifi: mt76: mt7996: Decouple RRO logic from
 WED support
Date: Thu, 04 Sep 2025 18:37:54 +0200
Message-Id: <20250904-mt7996-rro-rework-v4-0-2cd91e7229d6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLAuWgC/33NTQ6CMBCG4auYrq1py1/HlfcwLhCm0KDUTEnVE
 O5uYaNG4vKdZJ5vZB7Jomf7zcgIg/XW9THS7YZVbdk3yG0dmymhMqGV5NehAMg5keOEd0cdVym
 IClEYUWsW/26Exj4W83iK3Vo/OHouE0HO139akFzwvNJpUZQ15GAOHVKPl52jhs1cUG8CxCqhI
 iENxIn8nMla/hDJJ6HWiCQS2miZaBCQAX4R0zS9ABi3+Eg5AQAA
X-Change-ID: 20250821-mt7996-rro-rework-2490cee0f0d8
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>
X-Mailer: b4 0.14.2
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
Lorenzo Bianconi (7):
      wifi: mt76: Add reset_idx to reset_q mt76_queue_ops signature.
      wifi: mt76: Remove q->ndesc check in mt76_dma_rx_fill()
      wifi: mt76: Do not always enable NAPIs for WED RRO queues
      wifi: mt76: mt7996: Fix tx-queues initialization for second phy on mt7996
      wifi: mt76: mt7996: Fix RX packets configuration for primary WED device
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

 drivers/net/wireless/mediatek/mt76/dma.c           | 226 ++++++++++---
 drivers/net/wireless/mediatek/mt76/dma.h           |  29 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          |  54 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c    |   4 +-
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c    |   6 +-
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    | 326 ++++++++++++++----
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 310 ++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 365 ++++++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  19 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    |   4 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c   |  89 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  91 ++++-
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c    |   3 +-
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h   |  32 +-
 drivers/net/wireless/mediatek/mt76/wed.c           |   8 +-
 15 files changed, 1297 insertions(+), 269 deletions(-)
---
base-commit: bf71ee05e8ceaa086233d6db2557442c153ba05e
change-id: 20250821-mt7996-rro-rework-2490cee0f0d8

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


