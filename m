Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4270FCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dtlEZn0u7+XT4vmdn7hCpaorY+MocHae3bYpju4Mrjo=; b=hpE46oXUTXsMnv
	iIrNxH36XvWm67dUJjxplMg0+6cV9ofHd7BwSD4Q8kBQrwVyY1fTDYsDH9CiHleo4NU/BV0fevQ8D
	JY6WVd3M+eLtWBPmrF8ptNS4qkzq2lOEJJlxv7lVDU1OA4kTnPNzyxcwYTbeCbpKcQURJ6nBnQvRu
	QYH+RFAne3avEoWd+RO9bRQk6eEV7382TDXkrM9uhseXMlj4ZC2faEVkcDxYbLJtin2BW4ZZfzdeG
	egk4virPmEv3ccXXpBKFAsD3zGgq1slEpqP8LeCT2ddDUv+BSWNIORZA7cR2eLHIMFXUVce9aSoOy
	u5xc/JwgVLFuO8ptDrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbbz-00000002osk-0grw;
	Wed, 03 Sep 2025 00:44:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWW8-00000001gWf-1SQ1;
	Tue, 02 Sep 2025 19:18:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FC8960055;
	Tue,  2 Sep 2025 19:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24C0C4CEF7;
	Tue,  2 Sep 2025 19:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756840687;
	bh=ck3/Ptu01yBjH4i4YdJ++OB47FDKG2zMtAy7fwoHRYk=;
	h=From:Subject:Date:To:Cc:From;
	b=hDfO+Jq+R3j/5cTzFy6+tt0efObUX8DEVs73EXYGOMva30PuK2whyRRWK19sWUFXj
	 0L0D0DQElFeji/CEBZHMJ7BAUbvqfGVE9+44PIfoa6mAXxyxvkfz/Yj7u+NNsVEhFq
	 8LSeExjGaXVIu6DDALjm8grhcnhUv6GXyx5f4lXl/I+y8E5G3CL6KgCv9RZMjkcneR
	 TvVkbQyu32In3Yt0kXBeu2COv1jHcrOSjtiRWo9p8vFa8yUwblDyFmewHOxwwKlcRx
	 xWfygV35KlC35kSTZWqMwo3Z5WHddSxQm3/4DntFz/q6K6IPyEfexkSqi3xUxEvgzB
	 kO1XR3ml0UQXg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 v3 00/15] wifi: mt76: mt7996: Decouple RRO logic from
 WED support
Date: Tue, 02 Sep 2025 21:17:50 +0200
Message-Id: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN5Ct2gC/33NQQ6CMBCF4auQrq1pKxSGlfcwLpBOoUGpmZKqI
 dzdwsaYGJf/JPO9mQUkh4HV2cwIowvOjykOu4y1fTN2yJ1JzZRQhaiU5LepBNCcyHPCh6eBqxx
 EiyisMBVLf3dC656beTqn7l2YPL22iSjX6z8tSi64bqu8LBsDGuxxQBrxuvfUsZWL6kOA+EmoR
 EgLaUJfCmnkF7EsyxsIPk/H9gAAAA==
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

 drivers/net/wireless/mediatek/mt76/dma.c           | 215 +++++++++---
 drivers/net/wireless/mediatek/mt76/dma.h           |  47 ++-
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
 15 files changed, 1304 insertions(+), 269 deletions(-)
---
base-commit: 8680a5406aa6348943da4e739483870a865c343a
change-id: 20250821-mt7996-rro-rework-2490cee0f0d8

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


