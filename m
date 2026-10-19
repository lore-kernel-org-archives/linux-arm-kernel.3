Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB8DCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3OAGVXW2Ko+Y9YRydzxhFTQ2EohK4kPgZFn6DX2A4U=; b=s3oNa2CiwXeVg0Jnh7DDjNLWFz
	Ik/HGItQ68XGXBJ1o3NqIlzoh81cKgMm4RhSNLldkkj9fGqi+gTNHzdsxIHfjTAzxtV3K2GaJfhHL
	yfzYAWeDat6SyKVj1DuzMbTQRorJpIjtp5LCppdiKnfwz9hiHQL3UnhEbLjby2EFJnmcsac8c1LQ1
	BxHd4ih7lkybixTaH31OeSMQBgMbKBm3wPV2Nk8hEkf/rbuh4sy7kO6S6eiOZhh+b2i4gwCt7AJ4y
	88NsaxPKJESwsGvsqbjy3BxTkz/HjYLxdWDSeAGWx7sns1kLq5lJv8p6JI7H8oyGcPOUR9Vl8D10K
	dhXQJ0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkKl-0000000789R-0ISp;
	Mon, 19 Oct 2026 10:11:11 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkKa-0000000783U-2dfj;
	Mon, 19 Oct 2026 10:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=G3
	OAGVXW2Ko+Y9YRydzxhFTQ2EohK4kPgZFn6DX2A4U=; b=bNLckP4h5X/l5nfUnn
	bmK/IBrOE0+dD2VaP5x4ha9dxH2I8+u/GPzE3ylxBaZRv0UEbDqopH68WupJXmp1
	91NNEJD9C20oJyNqmTM89b36Lzn2ot1Zp8r/QWRF7MRprcKyqD6wZnJjQ9U7tTVG
	1hmT/DpK3bGXJz4S0WXWdOEm4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3_8Wk7NVq1VPPBA--.45843S4;
	Mon, 19 Oct 2026 18:10:48 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/2] wifi: mt76: mt7996: clamp EHT beamforming NSS
Date: Mon, 19 Oct 2026 18:10:42 +0800
Message-Id: <20261019101043.1922205-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101043.1922205-1-yaojiale02@163.com>
References: <20261019101043.1922205-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_8Wk7NVq1VPPBA--.45843S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1DJFW3KFyUtF1kGr1DAwb_yoW5Wr4Up3
	yfZa42vr4xArWkW3WfArs7tr98Ga13G34aka1kWrs3CryfKFyxJF4xuF9xJF1rAF4UAry3
	Zw1DArn8Wa4Y9FDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRwmi_UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wh1r2rV7KggHQAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031101_102266_E21065AA 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

An EHT peer can advertise zero receive spatial streams for an MCS
range.  The beamforming setup decrements that value, causing an
underflow and sending an invalid column count to firmware.

Clamp the converted NSS value to zero for 80, 160, and 320 MHz
beamforming configurations.

Fixes: ba01944adee9 ("wifi: mt76: mt7996: add EHT beamforming support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index e6243dd33c31..29b67248fad7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1969,7 +1969,7 @@ mt7996_mcu_sta_bfer_eht(struct ieee80211_link_sta *link_sta,
 	struct ieee80211_eht_cap_elem_fixed *pe = &pc->eht_cap_elem;
 	struct ieee80211_eht_mcs_nss_supp *eht_nss = &pc->eht_mcs_nss_supp;
 	u8 nss_mcs = u8_get_bits(eht_nss->bw._80.rx_tx_mcs9_max_nss,
-				 IEEE80211_EHT_MCS_NSS_RX) - 1;
+				 IEEE80211_EHT_MCS_NSS_RX);
 	const struct ieee80211_eht_cap_elem_fixed *ve;
 	const struct ieee80211_sta_eht_cap *vc;
 	u8 snd_dim, sts;
@@ -1988,6 +1988,7 @@ mt7996_mcu_sta_bfer_eht(struct ieee80211_link_sta *link_sta,
 	snd_dim = EHT_PHY(CAP2_SOUNDING_DIM_80MHZ_MASK, ve->phy_cap_info[2]);
 	sts = EHT_PHY(CAP0_BEAMFORMEE_SS_80MHZ_MASK, pe->phy_cap_info[0]) +
 	      (EHT_PHY(CAP1_BEAMFORMEE_SS_80MHZ_MASK, pe->phy_cap_info[1]) << 1);
+	nss_mcs = nss_mcs ? nss_mcs - 1 : 0;
 	bf->nrow = min_t(u8, snd_dim, sts);
 	bf->ncol = min_t(u8, nss_mcs, bf->nrow);
 	bf->ibf_ncol = explicit ? min_t(u8, MT7996_IBF_MAX_NC, bf->ncol) :
@@ -2001,7 +2002,8 @@ mt7996_mcu_sta_bfer_eht(struct ieee80211_link_sta *link_sta,
 		snd_dim = EHT_PHY(CAP2_SOUNDING_DIM_160MHZ_MASK, ve->phy_cap_info[2]);
 		sts = EHT_PHY(CAP1_BEAMFORMEE_SS_160MHZ_MASK, pe->phy_cap_info[1]);
 		nss_mcs = u8_get_bits(eht_nss->bw._160.rx_tx_mcs9_max_nss,
-				      IEEE80211_EHT_MCS_NSS_RX) - 1;
+				      IEEE80211_EHT_MCS_NSS_RX);
+		nss_mcs = nss_mcs ? nss_mcs - 1 : 0;
 
 		bf->nrow_gt_bw80 = min_t(u8, snd_dim, sts);
 		bf->ncol_gt_bw80 = nss_mcs;
@@ -2012,7 +2014,8 @@ mt7996_mcu_sta_bfer_eht(struct ieee80211_link_sta *link_sta,
 				   ve->phy_cap_info[3]) << 1);
 		sts = EHT_PHY(CAP1_BEAMFORMEE_SS_320MHZ_MASK, pe->phy_cap_info[1]);
 		nss_mcs = u8_get_bits(eht_nss->bw._320.rx_tx_mcs9_max_nss,
-				      IEEE80211_EHT_MCS_NSS_RX) - 1;
+				      IEEE80211_EHT_MCS_NSS_RX);
+		nss_mcs = nss_mcs ? nss_mcs - 1 : 0;
 
 		bf->nrow_gt_bw80 = min_t(u8, snd_dim, sts) << 4;
 		bf->ncol_gt_bw80 = nss_mcs << 4;
-- 
2.34.1


