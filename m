Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4502C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IYz7yQMRnkNKoNFMrJRX51C8OKcK1OxBSNy43CR8s8=; b=cL0IbCKXMyzQzHvF9t9JMBUZZp
	bmSxB0QUiEG0DSB4GTryQZhL5Tv4aEMnTv6uJ0KYbhU3n+pyqNW8jMyjFfsBCSGBH+x4kE63DAEIF
	9bk6lLeZ+6ps87dURMbMZ6PzgY21zaOwoIg+jY0LcauvIi1Qd7mSCs7yl8I8IPyXJJM0bdXd3YliL
	wilV/k6B7KgIqrd4s9qfFBBQ80y2e/SsxSmt/ILW7eZHmg/V79rwDxppw8mrwqXXGcKYz+0F3d/f1
	t9AB6HOLkx0yLeTgkLAmVlANACG8KF8dPqbOpFYbn+TjYng1/9U8ugeMNOsFwCbKCeK+EI+jx7oIT
	jkc58JqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKMT-00000008HKr-0LuI;
	Wed, 12 Mar 2025 11:34:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2T-00000008Dwg-1q7k;
	Wed, 12 Mar 2025 11:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F990A46D44;
	Wed, 12 Mar 2025 11:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE04C4CEE3;
	Wed, 12 Mar 2025 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778056;
	bh=/x3wzMFh/aAQSrh9GQyvDMBbUMhJalBSiaTbjau5OB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SNK+dRsGd8967b7lHWF3nG9KTtKxsL9Nj5zDeNjfselbC4eh5E/ApH8d9qBn4gGrN
	 LbPruumpPzpkOtVndvTh2a3KMKqICq1Vw9hbQ11F4uoEtd+fdfHWDTy8SaC/ABO2fy
	 1cJJav6I2QOhLz60efOQmxTm02qazwmtbK14LCMnNDVT+ZNyBzo5GxigeiSJ9f6SqE
	 qM0TPTZpfTd6S2oKguuZQFfBXvObiAz8AG3Eu1VNcElGmd/lZQOBWMzLtXfC+mRfLY
	 k0P2zogdIHcN1/Pt0efamcyLkWKkO054QTUcqyJ/TXFD+axBNt6DWnj1V2BM7sMwv6
	 /AvPcYORcaiWw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:50 +0100
Subject: [PATCH 06/21] wifi: mt76: mt7996: rework mt7996_rx_get_wcid to
 support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-6-015b3d6fd928@kernel.org>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
In-Reply-To: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041417_612326_7ADA10DD 
X-CRM114-Status: GOOD (  16.96  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

The wcid idx and band idx in the TXS are sometimes mismatched since the
FW will select a transmission link according to a private algorithm.
That is, the wcid idx in the TXS would be the one registered by the
driver rather than the actual wcid idx used during transmission.
However, the band idx in the TXS is the band select for transmission.
Therefore, we should get the driver-registered wcid in order
to notify the driver the packet has been acked; otherwise,
the driver will be unable to match the transmitted packet and its TXS.
This is a preliminary patch to enable MLO for MT7996 driver.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 33 +++++++++++++++++++------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 9f8436edc81377d852dd4e7221575c7e1255187c..b8d88fdee97a3567b57a20d0322859b7ae8ce88a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -53,29 +53,48 @@ static const struct mt7996_dfs_radar_spec jp_radar_specs = {
 };
 
 static struct mt76_wcid *mt7996_rx_get_wcid(struct mt7996_dev *dev,
-					    u16 idx, bool unicast)
+					    u16 idx, u8 band_idx)
 {
 	struct mt7996_sta_link *msta_link;
 	struct mt7996_sta *msta;
+	struct mt7996_vif *mvif;
 	struct mt76_wcid *wcid;
+	int i;
 
 	if (idx >= ARRAY_SIZE(dev->mt76.wcid))
 		return NULL;
 
 	wcid = rcu_dereference(dev->mt76.wcid[idx]);
-	if (unicast || !wcid)
-		return wcid;
+	if (!wcid)
+		return NULL;
 
-	if (!wcid->sta)
+	if (!mt7996_band_valid(dev, band_idx))
 		return NULL;
 
+	if (wcid->phy_idx == band_idx)
+		return wcid;
+
 	msta_link = container_of(wcid, struct mt7996_sta_link, wcid);
 	msta = msta_link->sta;
-
 	if (!msta || !msta->vif)
 		return NULL;
 
-	return &msta->vif->deflink.msta_link.wcid;
+	mvif = msta->vif;
+	for (i = 0; i < ARRAY_SIZE(mvif->mt76.link); i++) {
+		struct mt76_vif_link *mlink;
+
+		mlink = rcu_dereference(mvif->mt76.link[i]);
+		if (!mlink)
+			continue;
+
+		if (mlink->band_idx != band_idx)
+			continue;
+
+		msta_link = rcu_dereference(msta->link[i]);
+		break;
+	}
+
+	return &msta_link->wcid;
 }
 
 bool mt7996_mac_wtbl_update(struct mt7996_dev *dev, int idx, u32 mask)
@@ -483,7 +502,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt76_rxq_id q,
 
 	unicast = FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, rxd3) == MT_RXD3_NORMAL_U2M;
 	idx = FIELD_GET(MT_RXD1_NORMAL_WLAN_IDX, rxd1);
-	status->wcid = mt7996_rx_get_wcid(dev, idx, unicast);
+	status->wcid = mt7996_rx_get_wcid(dev, idx, band_idx);
 
 	if (status->wcid) {
 		struct mt7996_sta_link *msta_link;

-- 
2.48.1


