Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0C4D73EA8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 23:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L3xhdHlKfGLcqgxeTS+ozWIuu1fcHH/+mliJjYQyaZI=; b=YzO4UzFd9rqsfW7xcJ22jNYNwn
	GmEie49JHPeLqgXQck0aKPDZgrwvgtcHdfF299RE7jD1eLlkQgQs8jPpKHFxcFYa4fdVUjNPculcp
	eAIHtBPPjzKyDNlCvESQcsalWLuK6DVS4HfYSRmu5OShWyv0l7QV1oD5pJnDYc48xX/R9pXvkZldV
	Hf9AAroVbn01QyCPnfK2opqZxqnxXHW8j3vTRz7YyXO3XTgITsux1LuY/52nJYRG7YN9DhIIc+YL/
	4wy4FVrGjQIGTAQAt0WWXZ373eLl56KCFQHV2OTL7JRWnawyzmXdWzX7eAOm9Wm3XWSdAaXWQ4k14
	BmCguzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlbMs-00000000mNa-3JMW;
	Thu, 29 Jan 2026 23:24:06 +0000
Received: from mailgate01.uberspace.is ([2001:1a50:11:0:c83f:a8ff:fea6:c8da])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlbMo-00000000mMr-2xDv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 23:24:05 +0000
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 858B16170E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:23:51 +0100 (CET)
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 7041C17F6D2
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:23:51 +0100 (CET)
Received: (qmail 32761 invoked by uid 988); 29 Jan 2026 23:23:51 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Fri, 30 Jan 2026 00:23:51 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: don't return TXQ when exceeding max non-AQL packets
Date: Fri, 30 Jan 2026 00:23:20 +0100
Message-ID: <20260129232321.276575-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=cYV+S1poLG3zOhpK3v5Vt81YSGQXzrx6B1Ag/C8c48g=;
	b=ndYNbSDQrNwf7xGt82nlrHof8y4t/AgBZh4xQb7NYSFYb9ZEJ4Hgu8wZdPxDrAnsmsEYf+7ljX
	cRuRwJkHHnmOdV3YA38wo3cE6NkbdozK/T1FRKulgf8XWUubf0veIF8pOzGkIJeHCpvJIESsax8u
	6Utc+9hhVW53MAJXL8h4x6cwoizLt4gZ1Q9DiMdtp2mbnH+4+37GuO5r+OgRQf4A5urQAfyxesb9
	6K8E/Zf1WpUErPf/dExUrde31xDB84T0TrQdVNX7/PumcINXJLIzPLfi1hwYxGwh/WITPb2vJttk
	M1ejI9DyHa3rOy6lGDIq39tcZaRb/GC0sz0BsCWxpTHp0f5FhVIlqtLIPOtKq6BA281DO1ej/4vW
	+IrZJ6WJoRTFE4hu3MGm47hZGLe68S0NlBxjLK4PDF/BwJHsrF5PPBXCkd3gVVa6xBaKE6aUj/N8
	dOwEwrwdc7h7S9fgipUI1l3YHj6KJs46bR2/2CEGTLT9+WNcDY3ZABfXiy//f2mnuJfBilPQ4REw
	G1nQjW1vvNbQa67fY46dlIU6R4LUP8Ur7NG6uhVMS+USBgzNaJyIOHi+2bh3nobggb1qHyvBIsSU
	+NZoX7k7AUoO9KhwPbYzXa5+45nMZlEwSw3bI3MpPfq0jO0KjsZ4ZJliT2Zwo2q9sODYajl6KVCF
	8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_152403_171508_0B9B6699 
X-CRM114-Status: GOOD (  13.82  )
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

mt76_txq_send_burst does check if the number of non-AQL frames exceeds
the maximum. In this case the queue is returned to ieee80211_return_txq
when iterating over the scheduled TXQs in mt76_txq_schedule_list.

This has the effect of inserting said TXQ at the head of the list. This
means the loop will get the same TXQ again, which will terminate the
scheduling round. TXQs following in the list thus never get scheduled
for transmission.

This can manifest in high latency low throughput or broken connections
for said STAs.

Check if the non-AQL packet count exceeds the limit and not return the
TXQ in this case.
Schedule all TXQs for the STA in case the non-AQL limit can be satisfied
again.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 9ec6d0b53a84a..0753acf2eccb8 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -227,7 +227,9 @@ mt76_tx_check_non_aql(struct mt76_dev *dev, struct mt76_wcid *wcid,
 		      struct sk_buff *skb)
 {
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_sta *sta;
 	int pending;
+	int i;
 
 	if (!wcid || info->tx_time_est)
 		return;
@@ -235,6 +237,17 @@ mt76_tx_check_non_aql(struct mt76_dev *dev, struct mt76_wcid *wcid,
 	pending = atomic_dec_return(&wcid->non_aql_packets);
 	if (pending < 0)
 		atomic_cmpxchg(&wcid->non_aql_packets, pending, 0);
+
+	sta = wcid_to_sta(wcid);
+	if (!sta || pending != MT_MAX_NON_AQL_PKT - 1)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(sta->txq); i++) {
+		if (!sta->txq[i])
+			continue;
+
+		ieee80211_schedule_txq(dev->hw, sta->txq[i]);
+	}
 }
 
 void __mt76_tx_complete_skb(struct mt76_dev *dev, u16 wcid_idx, struct sk_buff *skb,
@@ -542,6 +555,9 @@ mt76_txq_schedule_list(struct mt76_phy *phy, enum mt76_txq_id qid)
 		if (!wcid || test_bit(MT_WCID_FLAG_PS, &wcid->flags))
 			continue;
 
+		if (atomic_read(&wcid->non_aql_packets) >= MT_MAX_NON_AQL_PKT)
+			continue;
+
 		phy = mt76_dev_phy(dev, wcid->phy_idx);
 		if (test_bit(MT76_RESET, &phy->state) || phy->offchannel)
 			continue;
-- 
2.51.0


