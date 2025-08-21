Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD63CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WxQPks2eFdBMUcM0QWeMPm2xDf9EwlU447gtmdGG6rc=; b=eFSiUcwEGW2+Jh
	Daj2xxb9/EUThClwbSzCO/bfo5YsyQtyXbK2xBJfNbVZzy+V2/lc3MX7XGuf3+YTkWRlYa3Cv4EXr
	kmeGsEF8ButF9uSQGPsh1w3oPEAXGqfzhGbATEB8fOnLjDnRVOAfeXzVRNirR6atyWB2pVQ/7BadR
	+1HqRDfG7jeclM+hDcK6dum9pqpLOSP8vae1GVbwOXmzej9nyRcrD1ZPKJjQP56P0qFZkdlazS6WQ
	zupNqy3NK7vwRtztpQC9dhyfCjVIr1FxLblb9p6qfHH0IttXoJXksfDv3S3k4VdgKVHPFPfTRLtAZ
	H7EouYQuXrKFIHC9frsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8sA-000000002NU-14r3;
	Thu, 21 Aug 2025 17:14:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up59V-0000000H19K-0r8p;
	Thu, 21 Aug 2025 13:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A09F761154;
	Thu, 21 Aug 2025 13:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D601CC4CEEB;
	Thu, 21 Aug 2025 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755782184;
	bh=uXC8XBLK8JNdBpqHbP9lfOw01MDaNvB9hC67k6MC2as=;
	h=From:Subject:Date:To:Cc:From;
	b=BIxP/xj6QGyIxppt2DObsQpLw2SOfcPEkzfJWTyxSjrixxHJB60NQBd0Sly1OBPoN
	 WWC7QH4oDH1Md7M3oNxli5EWkSr2q28SaEY0issY+Bjoy/xuyRT8tlYWq2zyAuE5f4
	 9MRMLrEXO7N0IJMdxpTNQhOZoQ0webpFA/DIG24AMMvzHfUs/E6AfgsK8a08krUH6m
	 ahJsb+8FhclO1D1XjDQOCh9yb4AC4L7UknXWDO+6dPewop5dbDgNiV1IOwwuFDsrVQ
	 0CwdeJd3WW2Bm3JQJ4pxSrWlfzUHBZnAvEUKf0SwDOzV/hMqUoCsN9AbYQ6QAOpirN
	 zyN9Avrnr/TNg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 00/14] wifi: mt76: mt7996: Decouple RRO logic from WED
 support
Date: Thu, 21 Aug 2025 15:14:52 +0200
Message-Id: <20250821-mt7996-rro-rework-v1-0-6c8477ad969f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM0bp2gC/x3M3QpAQBBA4VfRXJsam7/1KnKhNZjEalYoeXeby
 +/inAcCq3CAJnlA+ZQgfovI0gTc3G8TowzRYMgUVJsM16OytkRVj8qX1wVNbskx00hDDbHblUe
 5/2fbve8HzC2rsmMAAAA=
X-Change-ID: 20250821-mt7996-rro-rework-2490cee0f0d8
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Rex Lu <rex.lu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>
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
Please note this series is based on the following commit available in
net-next tree:

commit 477b4a33c96451b6e49f242a3d7bab67a57666b1
Author: Lorenzo Bianconi <lorenzo@kernel.org>
Date:   Tue Aug 12 06:57:23 2025 +0200

    net: mediatek: wed: Introduce MT7992 WED support to MT7988 SoC

---
Lorenzo Bianconi (6):
      wifi: mt76: Add reset_idx to reset_q mt76_queue_ops signature.
      wifi: mt76: Remove q->ndesc check in mt76_dma_rx_fill()
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

 drivers/net/wireless/mediatek/mt76/dma.c           | 176 ++++++++--
 drivers/net/wireless/mediatek/mt76/dma.h           |  47 ++-
 drivers/net/wireless/mediatek/mt76/mt76.h          |  54 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c    |   4 +-
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c    |   6 +-
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    | 326 ++++++++++++++----
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 310 ++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 367 ++++++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  19 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    |   4 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c   |  89 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  91 ++++-
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c    |   3 +-
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h   |  32 +-
 drivers/net/wireless/mediatek/mt76/wed.c           |   8 +-
 15 files changed, 1280 insertions(+), 256 deletions(-)
---
base-commit: 477b4a33c96451b6e49f242a3d7bab67a57666b1
change-id: 20250821-mt7996-rro-rework-2490cee0f0d8

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


