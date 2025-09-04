Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A8CCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHkXCOoolN0R2z4q+2Fm3Vfj9kj+SsUQVeLX8caHoaE=; b=zg3EYuooLlibocbmBaGw3yDcCe
	WOE201wiFPAy3ekGTGCQ3AfdE6z0otibu4nZNP9OvbBQsv8wMk/ke796lA6de0x9CoX9LKSbvdXrn
	RyRNPl9iEf06ceQ21ryb2JJGdLmAUK8EXZQcD1KlQONSVne2Pnu+xhZscoxx6peAHolBMahimjbQM
	J131Y3z+qxTxSVTh2Zv6plYlaAZerKrAQ6bF+WqmhWvjhuuG8vHntrsXiuTqBHW4mJHRKvpk8kVxk
	j4kREPdGnFfCR/97nqoGHeJXF+rGbmYh+25H8ouFXXeQvTx7F+1i2HjRTGdcAdGziw4bOWw8DCkt+
	2bUjtcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5N3-0000000AFH1-1g5J;
	Thu, 04 Sep 2025 08:31:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4qN-0000000A2m6-1Pf1;
	Thu, 04 Sep 2025 07:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C233142B1D;
	Thu,  4 Sep 2025 07:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4975BC4CEF0;
	Thu,  4 Sep 2025 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756972638;
	bh=uOT9augq1THTn6rcZNU8gbe4Sm3lAPpWzSXT4I6JDmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yo9XcH+jSTIKxb91KKSGPv0SvyekPECqA3ocn8SMlKENyNd7YyKocl5495pLgDr1W
	 DfTJ+riG9k8J12pC6g9p7vnqCucjMl/J7vdWWB7djfYCZx4JdH0qJ4YMMLU9zjPOti
	 TsMR/YtJWW59qefg41gvuvLYb4G3T3TtBS3glEXtP7Vaiv+we6RfnlYqXKHJXs/nJv
	 ii8VHxDd2xp3OQeP3QXOPVbywFezGI4Lmh4zioWuvsSgInOMZluIXg66U6SaK33BXo
	 kFVUtMf+zcwNo06Q68GDmL4DIRBNoFzbrP7i04cNE6E1IVmil5eLysIiDWIPHFE6TM
	 TS228ay70UEXQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Sep 2025 09:56:40 +0200
Subject: [PATCH mt76 2/4] wifi: mt76: mt7996: Add all active links to poll
 list in mt7996_mac_tx_free()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mt7996-mlo-more-fixes-v1-2-89d8fed67f20@kernel.org>
References: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
In-Reply-To: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_005719_401882_7786852B 
X-CRM114-Status: GOOD (  10.75  )
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

Add all valid links to poll list for Airtime Fairness/AQL accounting when
tx-free event occurs.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 646c6f2f72918bbbdceddb5321c862f326d803b0..33eb05dc5fc4826b5752fcee923213e051107074 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1249,6 +1249,9 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 		info = le32_to_cpu(*cur_info);
 		if (info & MT_TXFREE_INFO_PAIR) {
 			struct ieee80211_sta *sta;
+			unsigned long valid_links;
+			struct mt7996_sta *msta;
+			unsigned int id;
 			u16 idx;
 
 			idx = FIELD_GET(MT_TXFREE_INFO_WLAN_ID, info);
@@ -1261,7 +1264,21 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 			if (!link_sta)
 				goto next;
 
-			mt76_wcid_add_poll(&dev->mt76, wcid);
+			msta = (struct mt7996_sta *)sta->drv_priv;
+			valid_links = sta->valid_links ?: BIT(0);
+
+			/* For MLD STA, add all link's wcid to sta_poll_list */
+			for_each_set_bit(id, &valid_links,
+					 IEEE80211_MLD_MAX_NUM_LINKS) {
+				struct mt7996_sta_link *msta_link;
+
+				msta_link = rcu_dereference(msta->link[id]);
+				if (!msta_link)
+					continue;
+
+				mt76_wcid_add_poll(&dev->mt76,
+						   &msta_link->wcid);
+			}
 next:
 			/* ver 7 has a new DW with pair = 1, skip it */
 			if (ver == 7 && ((void *)(cur_info + 1) < end) &&

-- 
2.50.1


