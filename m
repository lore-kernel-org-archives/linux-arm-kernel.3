Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747B7CA9ECC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSOY2agxT2iMt962Kcsg74ayJKaWCLdSy8T10g4JvDc=; b=CCy3CT3esbzwTHW+xGgUyV6tCU
	VaH4fP7WBSj5YuJCxzA2CyG5O/WERL6LaSedlUvzGXIp0QTZVzD3QLFwToBr2/Zf1aX7ds8MdVRy2
	givCmzlFz+GBEFlR/zmEs+ZW1XNmYwLGsLyEiI6Cw53bxgFZzfoZ7NE3CZeAOKZQg9s7GHuJ0LFmz
	8ef/Cu4t6Hv1yYzc5ipge5MWNfmaVaO8lEnN9unVnYEilXYqYbmPwtX/AnT73BGxB/qdh01N68ObM
	nC5jFG8/G8bCm29cS3vdZgXr0r6eb5NK8X2VUSt3GvxuBckV3/KgVjH8KIZY1AhqfVL/LUn95HsCq
	6L5fkqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgp-000000083FH-3Ty5;
	Sat, 10 Oct 2026 13:00:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgk-000000083C9-30ha
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a17baef589so4249215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637233; x=1792242033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSOY2agxT2iMt962Kcsg74ayJKaWCLdSy8T10g4JvDc=;
        b=XruPGjja4+AYILTfiRNAynH28N/IpETwzG/PGX3a9z+n4/hVq9OpEjMw1QiZjEvZJt
         Oo9G4wMM6nBmWN2sG5fNn2jCC6w1jYFwn3EIw0faKrh7VvA4vKHnIgN0etCeJwaz7IMk
         etn3YBlS1rVfPfbakctZtxc2XavXOaBU5aIH4QbYUzgbvWo6Sg4ieVR+08n4IbMcFoDG
         KQsYeElwAQr+O7ql6KrzJgKimEIQwY+n2zHqeNMT0H4GUbp1Zv9TLXHePOn0haBNeMH8
         utrHK4AwYnEdT4j6BTa6OmOmJaxgsmdm/3qy1NldqkYU+JS5wxY+5Ao5MJyuAuHwByX3
         VryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637233; x=1792242033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSOY2agxT2iMt962Kcsg74ayJKaWCLdSy8T10g4JvDc=;
        b=0esBWZFMCdapxHxV+GI+AF1vJw2t/p42muMb9eu3Jj4/GOmbwvB1EB/SbWquYl8M1L
         We1PJwpTOTRxOh6pOwYJbYlxBeGvCvteXELperq5VXRWDzZSjYatp3hkeThu09o/oAL8
         cCdfANpcDLaKpADjfSlsyFgwWZNMcUXHlB19twcy8Xenp+MdFCGbLO3Qfq5fHriOMniv
         A0yrwiPeIRH35Z83NLVb6yD8XBJ1aDAMJuN1XwuE+1usg3N0UvN/uckO8lgil4XltpNI
         IG/VuGtI7G3Kdzd7Ob9UsYnoDtbuZ4aVE6nXWp0h74OviajaioFjfBqCPiNanvankuhU
         fNSw==
X-Gm-Message-State: AFq9FYLU87c9hRmtfnjFKHmvU1SSBF/P9iLnqb2mE2rVsgGDV03lGgw/
	RDkktVhH3iBzHqUb7i/g5zXT2VrtX67UfVhusT2pf2auq2JtK3nKD+OT69BRaHPF+domXQ==
X-Gm-Gg: AYBFou07T6ONSY2rkZFW/k4Eo+KsSSKqwZPE7sBHcxuTeVOd8EsSRdZphf9OxNkYRzZ
	X1ETo0fdV8xOiIFnwASBYXJ7M8FUfqNwkZIYCSG0hNv3zHD2j2Q3oOZmSx3tRL6kzQbHMEx5rQW
	P6epw55wnOlASdLU3yq59G6shWykawXQ7Z52sBWpI6fRX3GjgwazYKlxYKb7ETzPAVhmgl5reg2
	FIkEXG01l1AHe4+r8XqGkJqn9VHKbz+NvTgOqCLXNT4VPn0P3wmG6i/hsYeN4x4a2HKwjWgGqSU
	Q30+AbXzkEh0jijI5u5QPK7Q1iYNBQvZ+j2WlDXI9kpMeGPgpOExsujuFETQsyNbM6miaxpbnSu
	roVhPn9Zb6USqgD4+fmIhiQeMbbCk9XhVGwr2kGFDW8P5gQMu0kUlPZpZPeq5IYPG+o1YmWAkkx
	nPRGsWgn0milkRZm2qkyUV1ITS29rrM9k6d033bGedWk+gWtbQjY6YEoxHogiOy1jF5jG9fWP6N
	XhqqFFT2Adj+llUAZjaVjMpeHFI7XcRHgHw36MBG5P8+sSNuUi/k5qP8fAdFf70epZ1Djcu4lUM
	XfTyPCSMvzGvsb1bNC9mrOqNJ44FVZm3zcqWh47Ka2KvIt1nSeCLLA/xrubcCTXZZknaZg/b
X-Received: by 2002:a05:600c:19c8:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a18e47ab20mr94757755e9.11.1791637232698;
        Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 03/24] wifi: mt76: Serialize MMIO reads with outer cache maintenance
Date: Sat, 10 Oct 2026 13:59:41 +0100
Message-ID: <20261010130024.177503-4-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060034_996025_7CCF7FFF 
X-CRM114-Status: GOOD (  17.60  )
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

Apply the existing workaround to current mainline mt76. This depends on
the preceding ARM API and needs review together with that API.

Assisted-by: LLM

The implementation is refreshed from the existing locally signed mt76
patch; this new draft still requires review of the final dependency/API.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/dma.h      |  2 +-
 drivers/net/wireless/mediatek/mt76/mmio.c     |  6 ++---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 23 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  2 +-
 5 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index 7694764feb..721c54b92f 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -107,7 +107,7 @@ mt76_dma_handle_write(struct mt76_queue *q, u32 offset, u32 val)
 	u32 _offset = offsetof(struct mt76_queue_regs, _field);		\
 	u32 _val;							\
 	if (!mt76_dma_handle_read(_q, _offset, &_val))			\
-		_val = readl(&(_q)->regs->_field);			\
+		_val = mt76_readl(&(_q)->regs->_field);		\
 	_val;								\
 })
 
diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
index 73d47608bf..95c6fe27f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mmio.c
@@ -11,7 +11,7 @@ static u32 mt76_mmio_rr(struct mt76_dev *dev, u32 offset)
 {
 	u32 val;
 
-	val = readl(dev->mmio.regs + offset);
+	val = mt76_readl(dev->mmio.regs + offset);
 	trace_reg_rr(dev, offset, val);
 
 	return val;
@@ -53,13 +53,13 @@ static void mt76_mmio_read_copy(struct mt76_dev *dev, u32 offset,
 	int i;
 
 	for (i = 0; i + 4 <= len; i += 4)
-		put_unaligned_le32(readl(dev->mmio.regs + offset + i),
+		put_unaligned_le32(mt76_readl(dev->mmio.regs + offset + i),
 				   data + i);
 
 	if (i < len) {
 		u8 tmp[4];
 
-		put_unaligned_le32(readl(dev->mmio.regs + offset + i), tmp);
+		put_unaligned_le32(mt76_readl(dev->mmio.regs + offset + i), tmp);
 		memcpy(data + i, tmp, len - i);
 	}
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 62b41c8bb7..54b63ba614 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -20,6 +20,29 @@
 #include "util.h"
 #include "testmode.h"
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+#include <asm/outercache.h>
+#endif
+
+/*
+ * Some SoCs deadlock when an outer cache maintenance operation runs while a
+ * PCIe read is outstanding (see CONFIG_CACHE_L2X0_IO_LOCK).  On those, take
+ * the platform lock around device register reads.
+ */
+static inline u32 mt76_readl(const void __iomem *addr)
+{
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+	unsigned long flags = outer_io_lock();
+	u32 val = readl(addr);
+
+	outer_io_unlock(flags);
+
+	return val;
+#else
+	return readl(addr);
+#endif
+}
+
 #define MT_MCU_RING_SIZE	32
 #define MT_RX_BUF_SIZE		2048
 #define MT_SKB_HEAD_LEN		256
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index dc7c03d231..0fdf2e3a2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -357,7 +357,7 @@ static bool mt76x02_tx_hang(struct mt76x02_dev *dev)
 		q = dev->mphy.q_tx[i];
 
 		prev_dma_idx = dev->mt76.tx_dma_idx[i];
-		dma_idx = readl(&q->regs->dma_idx);
+		dma_idx = mt76_readl(&q->regs->dma_idx);
 		dev->mt76.tx_dma_idx[i] = dma_idx;
 
 		if (!q->queued || prev_dma_idx != dma_idx) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 8007e62004..4c57e66a21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -36,7 +36,7 @@ static struct mt7915_hif *mt7915_pci_get_hif2(u32 idx)
 	spin_lock_bh(&hif_lock);
 
 	list_for_each_entry(hif, &hif_list, list) {
-		val = readl(hif->regs + MT_PCIE_RECOG_ID);
+		val = mt76_readl(hif->regs + MT_PCIE_RECOG_ID);
 		val &= MT_PCIE_RECOG_ID_MASK;
 		if (val != idx)
 			continue;
-- 
2.55.0


