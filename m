Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D57C3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uyrSvAmQQ5ghHQuMdGwe5+qHgS46BUHOOuLj9yq9FM=; b=i5LPARFFqg8jDfiRZx/m5sayRm
	NSv0SGynLEv77gkpH/etZjmpcuhsQFRUhsHNIcRwkg4TeXjL1km/3tfP8rMW3hV+EOQYxR2Zv55rJ
	ZEfgroz0YlN2FMqR5kN3n0eqf9OWx76tker4XIXkyBEkiP01Nq5aKd448n1uWbTeNH4XMKHM5O9gE
	glfUoNNf0L0hGMr+cBzLqDWdZOAURl78lezsRLALlUHrCnNpp0z6na3ZhgcArA5gh58dZML7/LeOQ
	tDsX82p6KyBttTTpUDTCFsngZ46gLRgw1/+Lx+8yFRQMeHYCX8eCAcDMH3cl2ZlBs0RV9B5aQRnNb
	DZRvABRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4ZG-00000008quZ-3s4Y;
	Mon, 05 May 2025 22:45:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47f-00000008iEX-0bi0;
	Mon, 05 May 2025 22:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2821E446E8;
	Mon,  5 May 2025 22:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44B9C4CEE4;
	Mon,  5 May 2025 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483434;
	bh=dnFX6L2FuA3kKeW+zfBCzbB85ETKxmxU1Lrgu5g1UlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TsEZhmGaHbtsqsSwZUaDn3hv0xM0I82ApJQsCoIIOC41VJCS3apSA51ZUvH+j/tnT
	 eqBJbDZXUFyaceJVRbc90/ZNxN/F5nBMj07AdZJSp1ywAwVegrBLSbBaoNNk3rJYN1
	 0v+adjnERbs7tebpc3+5guXi6dWBtH2HGnDrlNV9XP8alxriKXjG8igfoWfGs5qeL/
	 YL5SKgG9oeKDataDmGq0HcxLy4cubdp6alJ0L+R/5OPWuQcP31xetbFJkJyjEGKmSq
	 zqmuisy1yS3y7hcMXAqNl1GiVXJsn4s9oPOxxikeyxgsK+dH22K4uijSCRL5dMz2Em
	 c5KqpYl8tXCqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	shayne.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 079/642] wifi: mt76: mt7996: revise TXS size
Date: Mon,  5 May 2025 18:04:55 -0400
Message-Id: <20250505221419.2672473-79-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_151715_398118_FAE363F5 
X-CRM114-Status: GOOD (  10.95  )
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

From: Benjamin Lin <benjamin-jw.lin@mediatek.com>

[ Upstream commit 593c829b4326f7b3b15a69e97c9044ecbad3c319 ]

Size of MPDU/PPDU TXS is 12 DWs.
In mt7996/mt7992, last 4 DWs are reserved, so TXS size was mistakenly
considered to be 8 DWs. However, in mt7990, 9th DW of TXS starts to be used.

Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Link: https://patch.msgid.link/20250311103646.43346-1-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c       | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
index db0c29e65185c..487ad716f872a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
@@ -314,6 +314,9 @@ enum tx_frag_idx {
 #define MT_TXFREE_INFO_COUNT		GENMASK(27, 24)
 #define MT_TXFREE_INFO_STAT		GENMASK(29, 28)
 
+#define MT_TXS_HDR_SIZE			4 /* Unit: DW */
+#define MT_TXS_SIZE			12 /* Unit: DW */
+
 #define MT_TXS0_BW			GENMASK(31, 29)
 #define MT_TXS0_TID			GENMASK(28, 26)
 #define MT_TXS0_AMPDU			BIT(25)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 88f9d9059d5f2..c7e8336027334 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1413,7 +1413,7 @@ bool mt7996_rx_check(struct mt76_dev *mdev, void *data, int len)
 		mt7996_mac_tx_free(dev, data, len);
 		return false;
 	case PKT_TYPE_TXS:
-		for (rxd += 4; rxd + 8 <= end; rxd += 8)
+		for (rxd += MT_TXS_HDR_SIZE; rxd + MT_TXS_SIZE <= end; rxd += MT_TXS_SIZE)
 			mt7996_mac_add_txs(dev, rxd);
 		return false;
 	case PKT_TYPE_RX_FW_MONITOR:
@@ -1456,7 +1456,7 @@ void mt7996_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 		mt7996_mcu_rx_event(dev, skb);
 		break;
 	case PKT_TYPE_TXS:
-		for (rxd += 4; rxd + 8 <= end; rxd += 8)
+		for (rxd += MT_TXS_HDR_SIZE; rxd + MT_TXS_SIZE <= end; rxd += MT_TXS_SIZE)
 			mt7996_mac_add_txs(dev, rxd);
 		dev_kfree_skb(skb);
 		break;
-- 
2.39.5


