Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F4606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cXXhASUe;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VVcrQEw9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dbh6YGgR0WSkZuJ88x07QU7KuKLYyEQn9r6wPVh799M=; b=cXXhASUeNnKZxe
	DkJMXFhcleilyUiWRHmnOu8BverNmcHecgcz0rNmoqoUeztfGhGEEOi69l2r+IuUNPvvLuVi4VRpg
	bMelIeYn6St5/KluYKyqv2vkGSm6OYH45pnMqCuQfs65RtctOvLc/ZglfhJz8eOmRoavBSDwlWKAQ
	hy1K0xAQfhCrDz0Z1RTjny+ZYBDOEBUGlsRoj0y+Mjzs0+a4HUG+8gs8R09vAYwhaB47LqoDOqtps
	5MyOFHJqz7dDm58bMjTL3RyOJVl+X99j75siXVQst21o81ZEQGWOVI08SZOpdxklbhTcY9WJzkeon
	of9fsyLC7ZdSEFiIfQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvpU-00000006Kaf-3bt9;
	Wed, 28 Oct 2026 05:04:04 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvpM-00000006KUZ-0Xn4;
	Wed, 28 Oct 2026 05:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=db
	h6YGgR0WSkZuJ88x07QU7KuKLYyEQn9r6wPVh799M=; b=VVcrQEw9lZffUHl8W9
	sVWxUz66zEK4SYKm0Ac0ge+8zlHe4qLYQ9iRZhSUUgRtRVKD5qCGFEzE5sGHNrY3
	7p1pmFE5JB3g1dsLQe0KfBUAWfAWBJ+7Ji7o5xoPoiNodhr2Zh2zO8z0SqlAWaxB
	Gzg7B7+55Tm1P/88Qb6VRWBjA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3X28rguFqvXzDCw--.30877S6;
	Wed, 28 Oct 2026 13:03:44 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 4/4] wifi: mt76: mt7925: unwind link restore failures
Date: Wed, 28 Oct 2026 13:03:37 +0800
Message-Id: <20261028050337.127464-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050337.127464-1-yaojiale02@163.com>
References: <20261028050337.127464-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X28rguFqvXzDCw--.30877S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw43CrWUJw47KFWkWr15Arb_yoW5Gw1rpa
	1DKa9IkrykJw43Ja18Ga48uFnYvan5G3WUCr13Cw1rZw1kZrn5AF4qkFy3tFyUAFWku3W8
	WFWqqrn8uwn5uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joOJ5UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRC-+WrhgjCqOAAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220356_599792_A91085C7 
X-CRM114-Status: GOOD (  10.64  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The reset recovery callback ignores failures while restoring each link in
firmware and continues configuring the link and remaining interface. A
failed two-command device addition can leave partial firmware state, while
links restored earlier in the loop remain active on a partially restored
interface.

Track every attempted link and remove their firmware state if any restore
operation fails. Stop configuring that interface after the failure.

Fixes: 14061994184d ("wifi: mt76: mt7925: add link handling in mt7925_vif_connect_iter")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 7af996abe294..7b29e147b19e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1477,11 +1477,12 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	unsigned long valid = ieee80211_vif_is_mld(vif) ?
 			      mvif->valid_links : BIT(0);
+	unsigned long restored = 0;
 	struct mt792x_dev *dev = mvif->phy->dev;
 	struct ieee80211_hw *hw = mt76_hw(dev);
 	struct ieee80211_bss_conf *bss_conf;
 	struct mt792x_bss_conf *mconf;
-	int i;
+	int i, ret;
 
 	if (vif->type == NL80211_IFTYPE_STATION)
 		ieee80211_disconnect(vif, true);
@@ -1493,8 +1494,13 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 
 		mconf = mt792x_vif_to_link(mvif, i);
 
-		mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf, &mconf->mt76,
-					    &mvif->sta.deflink.wcid, true);
+		restored |= BIT(i);
+		ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf,
+						  &mconf->mt76,
+						 &mvif->sta.deflink.wcid, true);
+		if (ret)
+			goto rollback;
+
 		mt7925_mcu_set_tx(dev, bss_conf);
 	}
 
@@ -1506,6 +1512,20 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 				      MT76_STA_INFO_STATE_NONE, NULL);
 		mt7925_mcu_uni_add_beacon_offload(dev, hw, vif, true);
 	}
+
+	return;
+
+rollback:
+	dev_err(dev->mt76.dev, "failed to restore link after reset: %d\n", ret);
+	for_each_set_bit(i, &restored, IEEE80211_MLD_MAX_NUM_LINKS) {
+		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		if (!bss_conf)
+			continue;
+
+		mconf = mt792x_vif_to_link(mvif, i);
+		mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf, &mconf->mt76,
+					    &mvif->sta.deflink.wcid, false);
+	}
 }
 
 /* system error recovery */
-- 
2.34.1


