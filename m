Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AE3CCF2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvdWDrbzXQPcRArKbRRazwOwJZcvcz3zMV26SeCgv8E=; b=SdAU0ZDoJF/HqCRmoNP3z1e6tX
	qYBLO0XRqunGjvCecrGc9oDXwdxhqR3p3hWPuIIbSNrI4n8Iw6UUYXZsJXyte0TmGWf74K2x4+fiL
	bQPnUElZaIP0TXbWLWrBn+IPBic68HMmttNtofQFuq3ZNlUDjv2jqR2ha7Kj+ger8taLGdH8QKwsC
	y7ZZAnYxVIRzkINT0eVCHtz8WHRPbZ1TaoXnxwwnXHz+qj3zz7InfFO0rqk/ekHZihDc+cJXDmQRK
	hoI6lDOBu3XCP9rNAGsefQV4qtxnDGEYFi6tJkCCqb2tBFvKfswAK+IZyWuI4KObug1MYsokjkJAi
	e6BX7t/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQz-00000005luF-3TCR;
	Sun, 18 Oct 2026 10:48:09 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQp-00000005lky-3FnP;
	Sun, 18 Oct 2026 10:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tv
	dWDrbzXQPcRArKbRRazwOwJZcvcz3zMV26SeCgv8E=; b=Pbb2CIJFMeGe5pl1yd
	UGALXvCC9SaN+QWa/2PfA1R43TKs3occoXYAwd1j4gOjahn64zTEE8KX7ZJ4N45S
	ZgTu5t3BI/e1gObSVJ23m60aHmQQWKGjBrJvA0SN60FzKAEIhqC8t1DmCBSpjPBM
	fEXI/H7lcJOFGazMNHfqMPYUU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXHyjOo9Rq9DXFAw--.17380S4;
	Sun, 18 Oct 2026 18:47:47 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/2] wifi: mt76: mt7996: clear all link WCIDs before RCU removal
Date: Sun, 18 Oct 2026 18:47:39 +0800
Message-Id: <20261018104740.865520-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261018104740.865520-1-yaojiale02@163.com>
References: <20261018104740.865520-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXHyjOo9Rq9DXFAw--.17380S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1rKr15uF15Ary3JF1UWrg_yoW5Jw1rp3
	yDZas09ryUArs7X3W3Cr4jvF45Za1rKry3ArZ7Wwn5JFyIkF92qF18ZFZrZFy5CF93Cay3
	Xr1ktFnrGan0va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR0_MsUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhPsJ2rUo9M0RgAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_034800_476411_24238495 
X-CRM114-Status: GOOD (  11.52  )
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

mt7996 registers a separate WCID pointer for every link of an MLD
station. The generic mt76 sta_pre_rcu_remove callback only clears the
WCID embedded at the start of sta->drv_priv.

The remaining link WCIDs can therefore still be acquired by the RX path
after station removal starts and outlive the synchronization performed
by mac80211, resulting in a use-after-free.

Add an mt7996 callback that clears every allocated station link WCID
before mac80211 waits for network readers.

Fixes: a9eae65d97f3 ("wifi: mt76: mt7996: Export MLO AP capabilities to mac80211")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index dd7a01c02a7c..dc7401319ed5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1510,6 +1510,31 @@ mt7996_sta_state(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mt7996_mac_sta_event(dev, vif, sta, ev);
 }
 
+static void
+mt7996_sta_pre_rcu_remove(struct ieee80211_hw *hw,
+			  struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta)
+{
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct mt7996_sta_link *msta_link;
+	unsigned int link_id;
+
+	mutex_lock(&dev->mt76.mutex);
+	spin_lock_bh(&dev->mt76.status_lock);
+
+	for (link_id = 0; link_id < ARRAY_SIZE(msta->link); link_id++) {
+		msta_link = mt7996_sta_link_protected(dev, msta, link_id);
+		if (!msta_link)
+			continue;
+
+		rcu_assign_pointer(dev->mt76.wcid[msta_link->wcid.idx], NULL);
+	}
+
+	spin_unlock_bh(&dev->mt76.status_lock);
+	mutex_unlock(&dev->mt76.mutex);
+}
+
 static void mt7996_tx(struct ieee80211_hw *hw,
 		      struct ieee80211_tx_control *control,
 		      struct sk_buff *skb)
@@ -2568,7 +2593,7 @@ const struct ieee80211_ops mt7996_ops = {
 	.vif_cfg_changed = mt7996_vif_cfg_changed,
 	.link_info_changed = mt7996_link_info_changed,
 	.sta_state = mt7996_sta_state,
-	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
+	.sta_pre_rcu_remove = mt7996_sta_pre_rcu_remove,
 	.link_sta_rc_update = mt7996_link_sta_rc_update,
 	.set_key = mt7996_set_key,
 	.ampdu_action = mt7996_ampdu_action,
-- 
2.34.1


