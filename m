Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B28606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lTzf8vfr;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Oad0yl4O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dhv+8FlBddRkoW7HUJioYxqmcNV+Dawhev5ggsbsEWE=; b=lTzf8vfr4G3EPa
	K5JLP+ziZgjAMTyzbqkvXMyskWB30q91dPZhCbyGlb9OI++M+oCe0tvQ4iJBh4rF6LDBXkC6HMCso
	ZiZEgRV+ThQlTkIEmtY7OHhlkIYBIF6+AFfzjqI7MvtT6FAiVmXpadcIW/o2EBSQsWcR6ALZzTq2A
	TMh8vlHR6Js5KSP+V2BqRdaZbcvaqYunED2d/LV65NhqXv46px7Hc6QknTjw55ndoZWzxOhuVn7fN
	nl4En/FS4e4UVlxr+AD1dlx2O2IUV+UsyPQhVXD8AxrQLLlxe6Fj/c5A6QD5RS2dj8DAQdwJbANSP
	BR7snrDSuDnkM9NdB2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvpO-00000006KW7-2MFo;
	Wed, 28 Oct 2026 05:03:58 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvpJ-00000006KUY-3veq;
	Wed, 28 Oct 2026 05:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dh
	v+8FlBddRkoW7HUJioYxqmcNV+Dawhev5ggsbsEWE=; b=Oad0yl4OirsQ5GShYM
	hygXEMibdlSmJwexZovzN75xOJNVE5doZxC38Z8aTjxrNz6sTeGdiv7uTsFFSmAU
	/RXoZBCRWbhE5V+UQn750371DT0scAjGJXQ0GaicYMaOyEn6z3wOtkW/+t+8EaDY
	fAXE2XKBEN8MxS7uWHUen29BY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3X28rguFqvXzDCw--.30877S5;
	Wed, 28 Oct 2026 13:03:43 +0800 (CST)
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
Cc: stable@vger.kernel.org
Subject: [PATCH 3/4] wifi: mt76: mt7921: unwind interface restore failures
Date: Wed, 28 Oct 2026 13:03:36 +0800
Message-Id: <20261028050337.127464-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050337.127464-1-yaojiale02@163.com>
References: <20261028050337.127464-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X28rguFqvXzDCw--.30877S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr13tryDtFW7CrykWr1rJFb_yoW8CFW3pF
	47KayYkry8Jw45Ja1xGFW8uF95t3Z5GF1Uury3Aw18Zrn5AryrJF4j9Fy3tFyjyFs7t34f
	trWvqFn8uwsY9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jva0PUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQ+++Grhgi+qLAAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220354_774736_B1A6901F 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

The reset recovery callback ignores failures while restoring an interface
in firmware and continues issuing per-vif configuration commands. A failed
two-command device addition can leave partial firmware state, while the
following commands operate on an interface that was not restored.

Check the restore result, remove any partially created firmware state and
stop configuring that interface on failure.

Fixes: 0c1ce9884607 ("mt76: mt7921: add wifi reset support")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 6f5e31489e2d..0d19f2d7dd5e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -628,13 +628,23 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mvif->phy->dev;
 	struct ieee80211_hw *hw = mt76_hw(dev);
+	int ret;
 
 	if (vif->type == NL80211_IFTYPE_STATION)
 		ieee80211_disconnect(vif, true);
 
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
-				    &mvif->bss_conf.mt76,
-				    &mvif->sta.deflink.wcid, true);
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
+					  &mvif->bss_conf.mt76,
+					   &mvif->sta.deflink.wcid, true);
+	if (ret) {
+		mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
+					    &mvif->bss_conf.mt76,
+					    &mvif->sta.deflink.wcid, false);
+		dev_err(dev->mt76.dev,
+			"failed to restore interface after reset: %d\n", ret);
+		return;
+	}
+
 	mt7921_mcu_set_tx(dev, vif);
 
 	if (vif->type == NL80211_IFTYPE_AP) {
-- 
2.34.1


