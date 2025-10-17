Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2111FCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UHr+xzyJCkdzY1GgO+0D1oQuHHbrSnsCShF/yfcGsgA=; b=DBnEOXmNq8y9H9
	juOZv58GeoBhPGOvA+YsxwRNJg9yi8KWHeRoBT+pmh4uPt5LUHabqAyQjqAsDT/+w+yV492RqCA18
	nqKhiFbF09WdyV7p87kegNw/z6t8LaNBjct9bTGodMjWM4wYitQsQOxt7b3UDr1HnH6R1AsfmPLG+
	naGB4cPBaC1GUWkNIZ9qtTnQT27p2If+Z0ff2kb5WdZ7/JGLJ918YtpzD8kN0Q5CbR6DsbESkCEe7
	FZD6ttI5y0ZzzQ3USFO/DIAubgcIhwkgaIy93bEtk8+xLCWGkFraVISZQpJgDY5MWS1fXbBND+W0F
	jmuh2nsKt03inq5JVVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gAm-000000078mb-276F;
	Fri, 17 Oct 2025 08:50:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gAm-000000078m4-0Ybm;
	Fri, 17 Oct 2025 08:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F9EF604F5;
	Fri, 17 Oct 2025 08:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B046CC4CEE7;
	Fri, 17 Oct 2025 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760691051;
	bh=w4olcKRO3ecEK3uC8NaUXgJFicNfgiNRqioLEZz49X0=;
	h=From:Subject:Date:To:Cc:From;
	b=oiUW45BhCheOI+GQWnej3OnwcgbHLJHeFtnrCUBtv6r0BfHpkideZeNPoxkIxyZgF
	 KnM+iwVqE2YPXRHTaEcluROFF/EWBPvmytPE/hX6YONZYf/5Ovw2zoR+wP6jZsjP5L
	 mfJpy88nISloEubuc4cJXwirylqqLFYIr+PhHOdxjviyg/0awvb0eXoqdpTENCTcgC
	 7y4GICdCNwbVBM7rgWJddx3STShz1kmvFNPcTvv3ylv7kFcTqRiToNqkZBJLmgny5F
	 7/EDzr9SWRjgh6G8dCK4bDSAw+KVD9zhNNeEQFba1Z3Sne446tln+ZIfgzSncYPNpp
	 K4cxUOytflpAw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 v2 0/5] wifi: mt76: Add NPU offload support to MT7996
 driver
Date: Fri, 17 Oct 2025 10:50:28 +0200
Message-Id: <20251017-mt76-npu-devel-v2-0-ddaa90901723@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUD8mgC/3XMQQ7CIBCF4as0s3YM0CrWlfcwXVCYtsQKDVSia
 bi72L3L/yXv2yBSsBThWm0QKNlovSshDhXoSbmR0JrSIJg4sZYzfK7yjG55oaFEMypFl0ZLPRh
 ZQzktgQb73sF7V3qycfXhs/uJ/9a/VOLI0PSGGlXLvtXs9qDgaD76MEKXc/4CLwH7760AAAA=
X-Change-ID: 20250910-mt76-npu-devel-aae84c7cfd73
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

Introduce Airoha NPU support to MT7996 driver. NPU is used to enable
traffic forward offloading between the MT76 NIC and the Airoha ethernet one
available on the Airoha EN7581 SoC using Netfilter Flowtable APIs.

---
Changes in v2:
- Rebase on top of wireless-next main branch
- This patch is based on the following commit avaiable in net-next main
  branch but not in wireless-next one:
  commit 105ce7ad57e492b75ab40f2dc591db645fadbaa2
  net: airoha: npu: Add a NPU callback to initialize flow stats
- Link to v1: https://lore.kernel.org/r/20250910-mt76-npu-devel-v1-0-dbde4a37b9c0@kernel.org

---
Lorenzo Bianconi (5):
      wifi: mt76: Move Q_READ/Q_WRITE definitions in dma.h
      wifi: mt76: Add mt76_dev pointer in mt76_queue struct.
      wifi: mt76: Add the capability to set TX token start ID
      wifi: mt76: Introduce the NPU generic layer
      wifi: mt76: mt7996: Add NPU offload support to MT7996 driver

 drivers/net/wireless/mediatek/mt76/Kconfig         |   4 +
 drivers/net/wireless/mediatek/mt76/Makefile        |   1 +
 drivers/net/wireless/mediatek/mt76/dma.c           |  73 ++-
 drivers/net/wireless/mediatek/mt76/dma.h           |  67 +++
 drivers/net/wireless/mediatek/mt76/mac80211.c      |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          | 137 ++++++
 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig  |   7 +
 drivers/net/wireless/mediatek/mt76/mt7996/Makefile |   1 +
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    |  16 +-
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  13 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |   4 +
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  26 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c   |  13 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  21 +
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c    | 352 +++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c    |   3 +
 drivers/net/wireless/mediatek/mt76/npu.c           | 494 +++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/tx.c            |   6 +-
 include/linux/soc/airoha/airoha_offload.h          |   1 +
 19 files changed, 1187 insertions(+), 58 deletions(-)
---
base-commit: ccc4cf71390c19ea0b95c7879b31ed23f18525d7
change-id: 20250910-mt76-npu-devel-aae84c7cfd73

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


