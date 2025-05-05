Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E297C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdwbDJZLWp/I8PkV1oHai1kolkfn00p4/WYZVh2nSSE=; b=tHqKFlJ1D7Q+wG4JoErR07Kb6C
	0pR70j5+sqE9WVpz5N6GihR+rAllhjdAEfHvQ7k+2wJ6TfnU2R4Vzm3hiYDdTTML7TVf69XeAr1lp
	3nJStC6AbwHwrYSuanCKYIadNqwpd+485GPdyX3ujgatnpmkqgIjtj95O+9S3kCnHCo9pfoHS71J/
	b+ZoLHk9UH2pzHbHVzwdMVKVmrQewNvo8KlKLGjBWe624JFMCY39m37/djwzNWQv+cmf4FIM+pYGu
	Auit1G89ESPbFYwdxpyj9gDRrLdBEBY8d/bF6lwUbBpav519N9hIrwfzLyEJh2qQjZyx3LXNS+rIa
	qqfm61Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAUr-0000000AM19-23OD;
	Tue, 06 May 2025 05:05:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4V0-00000008peL-0mlP;
	Mon, 05 May 2025 22:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D39F8A41BF2;
	Mon,  5 May 2025 22:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C05EC4CEE4;
	Mon,  5 May 2025 22:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484881;
	bh=DK1NNzx9X/rE5G8Y1YDJEO+qp/3WCpguqAhtF85L4y0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O/Go31eqv0I3f+rtjDq/etQxVVAybR2F1SZ+TTdlTTy0KbrI6h1WoUwgvbsLYmjf1
	 H/yog4hDCBrduAiBFjwgqlW/SZRzbX8+tUxrOOIkueb8IDzrZGpWNQEmqbOprDjjoi
	 9QH9ycOFJy4ETCgYNxu7fmfRZkJSY5/iCoAPykoQZWlXk0MGrqd5c5QCfteGbMyg+I
	 lzQGd5UuCKPDvErDnTms0tCtFg/2uH/VGOM+FoTKV2RcCIuEUkWUO3tXeuZy6zmlwp
	 cqMPgys6VC3dTdF+sX9I42eo8Xby5RR0h3ldpcut4Qw35g3dt1MdkjswcvLQwFO930
	 7gCeoFpesuDlA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	miriam.rachel.korenblit@intel.com,
	emmanuel.grumbach@intel.com,
	kuba@kernel.org,
	edumazet@google.com,
	johannes.berg@intel.com,
	uwu@icenowy.me,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 060/486] wifi: mt76: only mark tx-status-failed frames as ACKed on mt76x0/2
Date: Mon,  5 May 2025 18:32:16 -0400
Message-Id: <20250505223922.2682012-60-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154122_357179_8DD5A339 
X-CRM114-Status: GOOD (  13.42  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 0c5a89ceddc1728a40cb3313948401dd70e3c649 ]

The interrupt status polling is unreliable, which can cause status events
to get lost. On all newer chips, txs-timeout is an indication that the
packet was either never sent, or never acked.
Fixes issues with inactivity polling.

Link: https://patch.msgid.link/20250311103646.43346-6-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h       | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/pci.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt76x2/pci.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/tx.c         | 3 ++-
 6 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e2e9b5ece74e2..a6ac8e5512eba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -489,6 +489,7 @@ struct mt76_hw_cap {
 #define MT_DRV_RX_DMA_HDR		BIT(3)
 #define MT_DRV_HW_MGMT_TXQ		BIT(4)
 #define MT_DRV_AMSDU_OFFLOAD		BIT(5)
+#define MT_DRV_IGNORE_TXS_FAILED	BIT(6)
 
 struct mt76_driver_ops {
 	u32 drv_flags;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index 1eb955f3ca130..911e162a45980 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -156,7 +156,8 @@ mt76x0e_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	static const struct mt76_driver_ops drv_ops = {
 		.txwi_size = sizeof(struct mt76x02_txwi),
 		.drv_flags = MT_DRV_TX_ALIGNED4_SKBS |
-			     MT_DRV_SW_RX_AIRTIME,
+			     MT_DRV_SW_RX_AIRTIME |
+			     MT_DRV_IGNORE_TXS_FAILED,
 		.survey_flags = SURVEY_INFO_TIME_TX,
 		.update_survey = mt76x02_update_channel,
 		.set_channel = mt76x0_set_channel,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
index b031c500b7415..90e5666c0857d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
@@ -214,7 +214,8 @@ static int mt76x0u_probe(struct usb_interface *usb_intf,
 			 const struct usb_device_id *id)
 {
 	static const struct mt76_driver_ops drv_ops = {
-		.drv_flags = MT_DRV_SW_RX_AIRTIME,
+		.drv_flags = MT_DRV_SW_RX_AIRTIME |
+			     MT_DRV_IGNORE_TXS_FAILED,
 		.survey_flags = SURVEY_INFO_TIME_TX,
 		.update_survey = mt76x02_update_channel,
 		.set_channel = mt76x0_set_channel,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
index 67c9d1caa0bd6..55f076231bdc5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
@@ -22,7 +22,8 @@ mt76x2e_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	static const struct mt76_driver_ops drv_ops = {
 		.txwi_size = sizeof(struct mt76x02_txwi),
 		.drv_flags = MT_DRV_TX_ALIGNED4_SKBS |
-			     MT_DRV_SW_RX_AIRTIME,
+			     MT_DRV_SW_RX_AIRTIME |
+			     MT_DRV_IGNORE_TXS_FAILED,
 		.survey_flags = SURVEY_INFO_TIME_TX,
 		.update_survey = mt76x02_update_channel,
 		.set_channel = mt76x2e_set_channel,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index a4f4d12f904e7..84ef80ab4afbf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -30,7 +30,8 @@ static int mt76x2u_probe(struct usb_interface *intf,
 			 const struct usb_device_id *id)
 {
 	static const struct mt76_driver_ops drv_ops = {
-		.drv_flags = MT_DRV_SW_RX_AIRTIME,
+		.drv_flags = MT_DRV_SW_RX_AIRTIME |
+			     MT_DRV_IGNORE_TXS_FAILED,
 		.survey_flags = SURVEY_INFO_TIME_TX,
 		.update_survey = mt76x02_update_channel,
 		.set_channel = mt76x2u_set_channel,
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index ce193e625666b..065a1e4537457 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -100,7 +100,8 @@ __mt76_tx_status_skb_done(struct mt76_dev *dev, struct sk_buff *skb, u8 flags,
 		return;
 
 	/* Tx status can be unreliable. if it fails, mark the frame as ACKed */
-	if (flags & MT_TX_CB_TXS_FAILED) {
+	if (flags & MT_TX_CB_TXS_FAILED &&
+	    (dev->drv->drv_flags & MT_DRV_IGNORE_TXS_FAILED)) {
 		info->status.rates[0].count = 0;
 		info->status.rates[0].idx = -1;
 		info->flags |= IEEE80211_TX_STAT_ACK;
-- 
2.39.5


