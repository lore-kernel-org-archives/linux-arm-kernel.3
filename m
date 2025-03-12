Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C951C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHkSeIbpTyoWrJ27HfifuOl/xO+2NTtQyxvA5mh/w/E=; b=Hvr6l3yGM6D5zRdmDDttcbl+DE
	hTWPy2DIrz6k/Y07u40xPBoqUncjrbcsxRHO+URgzxT09ELNzG65lYmh480ZHDWbeenYQTyEGftiq
	kYGcC7VxjmbWsCkwaaNHqRiRXB9OWM4wE6aTS5sIltSPcd9zbaFmJDKDdCnFIEay4RWROXgcyt7hT
	b7OsSsaYRrYOkgIDq8NE40v+FE2iebVgAI3mE4EeswbzRKVkN7QkSsOPlbiWyx1KYN0eleIdFqeC6
	DxizV8xqOpcaGNhcGz/bt5NfkB3cu5/4JIUpnCkJk7DYqCZ8RbRzrxV4hYyVlBm0sEXFlaHg2JTpu
	Deo43HvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKKr-00000008H7g-0LW3;
	Wed, 12 Mar 2025 11:33:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2Q-00000008DwA-2ZMJ;
	Wed, 12 Mar 2025 11:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E31FEA44D86;
	Wed, 12 Mar 2025 11:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CBAC4CEE3;
	Wed, 12 Mar 2025 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778053;
	bh=gBYGGRWaS8lOGVSxVW8+XecchMXFP9cQ/1BVUQ52D+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TFL20cpXW3kq1wjv5IjD1axcG2dThJyxMi8c3EeCKtkzqHdHQVZZSGGE2yrxan99h
	 zbvoWkNSDgyevK1ceMFHKqHXut9/cGKC3kRegZn8+tLDRBcaE0NyfIFSnZ48Wycrq4
	 oQRJx5C6/I8RWvGxlLXXyTKlfHiSMc2HSxZNH66O8Dfy3dKVmhCynOb0hCVeV2wgFG
	 pkAKIXFqfepigC39+tizQaxIzwqw1KrCzS+xvz8g1UtkOWJXQgTtXzaEz9GNDN7Rf6
	 ONiNE3BS4GGgwdYsWxJdwCZ+7lNyVo++VdF8qPXsO+5cke4kUtkwFSyci5aVb+Oa+i
	 ZCnjHgnRgir4g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:49 +0100
Subject: [PATCH 05/21] wifi: mt76: mt7996: Rely on wcid_to_sta in
 mt7996_mac_add_txs_skb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-5-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041414_721409_55BDF533 
X-CRM114-Status: GOOD (  10.07  )
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

This is a preliminary patch to enable MLO for MT7996 driver

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index eed692cd64a6acedb2f6d9aaf6f459bf4a4f5b08..9f8436edc81377d852dd4e7221575c7e1255187c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1287,7 +1287,7 @@ mt7996_mac_add_txs_skb(struct mt7996_dev *dev, struct mt76_wcid *wcid,
 		struct ieee80211_sta *sta;
 		u8 tid;
 
-		sta = container_of((void *)wcid, struct ieee80211_sta, drv_priv);
+		sta = wcid_to_sta(wcid);
 		tid = FIELD_GET(MT_TXS0_TID, txs);
 		ieee80211_refresh_tx_agg_session_timer(sta, tid);
 	}

-- 
2.48.1


