Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC55CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMYx3fvOc4IklVhBUf5llo8vSIo+hl5jzHBrwQJ9Izs=; b=SsZLTsEVUTPm2VSCugux+HzBq1
	oVdzsH0xOMEsrRffZU7CqKVdSEGCr1sEPRmPhPxQeAQP8e72tuWNHAAgg7socV8Qd97NPtj38N0hA
	Y4uzsIJzwPgaiACT/TPMB5mM2Lmrx86fMtk1n48/adzSaClJubJSAKhcdwsQ6ARszkVHga5959ia9
	by5d6qMgtO1LB2xHFwDwFcY/hsFtzUfhHHY5/2SjyACtfpgLgTpqtlGDIOllnJedxdeSSI/JN/ndJ
	/6Vo/FqUFlHatbeiYMHiGLDpoXe3YcNS0PqFIgiDA+KWyQiyI43Gg3ZHy41EzYjjjZ2ni9GQlLWGy
	bz3KSjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0SK-00000008AbN-1Ev2;
	Tue, 09 Sep 2025 15:40:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuvB-000000066An-4A8B;
	Tue, 09 Sep 2025 09:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A9E7601BA;
	Tue,  9 Sep 2025 09:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5084C4CEF5;
	Tue,  9 Sep 2025 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411153;
	bh=1Vav5//DSHKxmGTaOnbQqVFRjxjXuYDhPgQlOA2KQrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fmYn9oaw1haf/I1D6dB5JgOqe1RvR052o+vz9sTVcZadbeEO2BDoWRB323tN3Q0vO
	 AZUkcPWvxA6Fqf95DTlCMLKR+Ic9CqS2QTKkiDnaBBBTPhvNp6au8B4n1nko2pyk2J
	 +mGnnVN8wRYqnqf7ZzEz1zA53AxN6OHFxfNJSG76wydZophoDtC/K2u+oflzQt/TLD
	 pG5cAjynO2SR/nXaYbfMX8TQj1Kvx7DRz8Q2IMT/EM1lGNX96NoXZ5X5urbtwfwfJD
	 b01KI27Ezss6KeZJI0+YHwra+Cc8Gs2s5Jqjpb9vUJ2jDCZiNqhW4p2Pnqvd3A0Jv9
	 uLHLRcfiCQC1w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 11:45:19 +0200
Subject: [PATCH mt76 v5 11/16] wifi: mt76: mt7996: Convert
 mt7996_wed_rro_addr to LE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-rro-rework-v5-11-7d66f6eb7795@kernel.org>
References: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
In-Reply-To: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>
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

Do not use bitmask in mt7996_wed_rro_addr DMA descriptor in order to not
break endianness

Fixes: 950d0abb5cd94 ("wifi: mt76: mt7996: add wed rx support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  8 +++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 11 +++++------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 0104b50ce3f6d52d762dc2f87e5caa5d36ce69b8..f70e24d989cbd0454fa4f9273c87057258ded0f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -852,6 +852,7 @@ void mt7996_rro_hw_init(struct mt7996_dev *dev)
 static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 {
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
+	u32 val = FIELD_PREP(WED_RRO_ADDR_SIGNATURE_MASK, 0xff);
 	struct mtk_wed_device *wed = &dev->mt76.mmio.wed;
 	struct mt7996_wed_rro_addr *addr;
 	void *ptr;
@@ -890,7 +891,7 @@ static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 
 		addr = dev->wed_rro.addr_elem[i].ptr;
 		for (j = 0; j < MT7996_RRO_WINDOW_MAX_SIZE; j++) {
-			addr->signature = 0xff;
+			addr->data = cpu_to_le32(val);
 			addr++;
 		}
 
@@ -922,7 +923,7 @@ static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 	dev->wed_rro.session.ptr = ptr;
 	addr = dev->wed_rro.session.ptr;
 	for (i = 0; i < MT7996_RRO_WINDOW_MAX_LEN; i++) {
-		addr->signature = 0xff;
+		addr->data = cpu_to_le32(val);
 		addr++;
 	}
 
@@ -990,6 +991,7 @@ static void mt7996_wed_rro_free(struct mt7996_dev *dev)
 static void mt7996_wed_rro_work(struct work_struct *work)
 {
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
+	u32 val = FIELD_PREP(WED_RRO_ADDR_SIGNATURE_MASK, 0xff);
 	struct mt7996_dev *dev;
 	LIST_HEAD(list);
 
@@ -1026,7 +1028,7 @@ static void mt7996_wed_rro_work(struct work_struct *work)
 				MT7996_RRO_WINDOW_MAX_LEN;
 reset:
 			elem = ptr + elem_id * sizeof(*elem);
-			elem->signature = 0xff;
+			elem->data |= cpu_to_le32(val);
 		}
 		mt7996_mcu_wed_rro_reset_sessions(dev, e->id);
 out:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index f6dfd36a44c0bf587d3ac85a5a9d38e24deb14d4..313f6923d071a71152cadceaaf09dfd80b005287 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -285,13 +285,12 @@ struct mt7996_hif {
 	enum pcie_link_width width;
 };
 
+#define WED_RRO_ADDR_SIGNATURE_MASK	GENMASK(31, 24)
+#define WED_RRO_ADDR_COUNT_MASK		GENMASK(14, 4)
+#define WED_RRO_ADDR_HEAD_HIGH_MASK	GENMASK(3, 0)
 struct mt7996_wed_rro_addr {
-	u32 head_low;
-	u32 head_high : 4;
-	u32 count: 11;
-	u32 oor: 1;
-	u32 rsv : 8;
-	u32 signature : 8;
+	__le32 head_low;
+	__le32 data;
 };
 
 struct mt7996_wed_rro_session_id {

-- 
2.51.0


