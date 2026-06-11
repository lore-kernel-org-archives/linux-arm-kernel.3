Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABBDCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gu55FwRBT152Nih3ja11oNDgaQEq1L4WQl/WzeRJgRk=; b=z0C69aYysD49ntf1UmcrWQDAPr
	f0WMX+iLMwOsdKu87asxWmUCKctfn5KZbGd5swwyOD82jiVR5fITklpyXK9KkvLk8QlFBb2vMO25K
	xKTGdIiUhDQVKRXEMtaaw6BXIyIUmrooJsm4Tb1TMT/0QkwwzZnNc/plEfOr6tuvbaQbW0/nLG8vy
	OL7+uT+yA40FxUDI/tZoAHwhkplM5tVbxS98DEUUKa0RvrOvc5TVZGhRosG+N1gwMA8Kh2gjb3vTx
	KREfB3A5UC6y1nIAC6zoRcWuQteRMK98r7u47GZ4wnmGop5u8kQHXXdyd0iPfYLWcmPQWyZz3bGwf
	+YS3YBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf0C-00000009SCF-18dW;
	Thu, 11 Jun 2026 12:59:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf0A-00000009SBy-3r9r;
	Thu, 11 Jun 2026 12:59:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03FC6600AF;
	Thu, 11 Jun 2026 12:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7EE1F00893;
	Thu, 11 Jun 2026 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781182757;
	bh=Gu55FwRBT152Nih3ja11oNDgaQEq1L4WQl/WzeRJgRk=;
	h=From:To:Cc:Subject:Date;
	b=JCkvv6G0GQs9N16tnlg8iVWHuKokUZ2kB9waYD10z4w4Vs5Tsl8ei5Qu8eDAwJ+5q
	 Nld17nsFeB8Qg8rTAi6yXlXqtjym/YzA3UzPpqTmm/oQWX5L+CLRPy9W92xC5MPVcP
	 1ZNKS5/gQqZeEJnozokANXtPGE9XtOZOjeqqK05T9NrIHJvrdRP84gzWnai9ne2ugF
	 SqMtUpNdBe051f8XgI+1LyvHamJr1PG9ZtbDar0CNv86cILFALmeGSZd4tsrXXOaih
	 pr6BLYbLpRIge9Y8Dw0vJg/tixiUoxAJudzDTpp7nIVqudsOek8cGSPEvSXnVj6qAE
	 pFqRBF3WTRvhg==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Rex Lu <rex.lu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: fix airoha_npu dependency tracking
Date: Thu, 11 Jun 2026 14:58:55 +0200
Message-Id: <20260611125912.3387021-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

There is a new build failure with MT7996E=m MT76_CORE=y and NET_AIROHA_NPU=m:

ld.lld: error: undefined symbol: airoha_npu_get
ld.lld: error: undefined symbol: airoha_npu_put
>>> referenced by npu.c
>>>               drivers/net/wireless/mediatek/mt76/npu.o:(mt76_npu_init) in archive vmlinux.a

Fix this by reworking the dependency for the MT7996_NPU to only
allow enabling that when mt76_core can link against the npu driver.

To make sure this gets caught more easily in the future when additional
mt76 variants need the same dependency, also turn CONFIG_MT76_NPU into
a tristate symbol that has the same dependency.

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/Kconfig        | 4 ++--
 drivers/net/wireless/mediatek/mt76/Makefile       | 6 +++++-
 drivers/net/wireless/mediatek/mt76/mt76.h         | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index 502303622a53..d941e67a222d 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -38,8 +38,8 @@ config MT792x_USB
 	select MT76_USB
 
 config MT76_NPU
-	bool
-	depends on MT76_CORE
+	tristate
+	depends on NET_AIROHA_NPU=y || MT76=NET_AIROHA_NPU
 
 source "drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index 1d42adfe8030..cacdd2b13d05 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -12,7 +12,11 @@ mt76-y := \
 	mmio.o util.o trace.o dma.o mac80211.o debugfs.o eeprom.o \
 	tx.o agg-rx.o mcu.o wed.o scan.o channel.o
 
-mt76-$(CONFIG_MT76_NPU) += npu.o
+ifdef CONFIG_MT76_NPU
+# CONFIG_MT76_NPU is tristate to simplify dependency tracking,
+# but it behaves as a bool symbol here.
+mt76-y += npu.o
+endif
 mt76-$(CONFIG_PCI) += pci.o
 mt76-$(CONFIG_NL80211_TESTMODE) += testmode.o
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 07955555f84d..60bd155cc7d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1647,7 +1647,7 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *skb,
 int mt76_testmode_set_state(struct mt76_phy *phy, enum mt76_testmode_state state);
 int mt76_testmode_alloc_skb(struct mt76_phy *phy, u32 len);
 
-#ifdef CONFIG_MT76_NPU
+#if IS_ENABLED(CONFIG_MT76_NPU)
 void mt76_npu_check_ppe(struct mt76_dev *dev, struct sk_buff *skb,
 			u32 info);
 int mt76_npu_dma_add_buf(struct mt76_phy *phy, struct mt76_queue *q,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
index 5503d03bf62c..5742bce12fbb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
@@ -16,6 +16,6 @@ config MT7996E
 config MT7996_NPU
 	bool "MT7996 (PCIe) NPU support"
 	depends on MT7996E
-	depends on NET_AIROHA_NPU=y || MT7996E=NET_AIROHA_NPU
+	depends on NET_AIROHA_NPU=y || MT76_CORE=NET_AIROHA_NPU
 	select MT76_NPU
 	default n
-- 
2.39.5


