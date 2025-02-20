Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8843C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FrXJ/ahy6864R9VRstV3qivXROhxqIA8jUbocU0DTk=; b=pjb2jKjCk+l8RTB8Zdn2lbtEq4
	TmMwm7W1WlOaYEGMtZQH71EU+qYEFwqinyCpGwgZCg4r6dFKTjdpLRXJETO2SfHsIgoOzXLH+n9Oo
	jqoaoFFPH/hjMm9bfwetLU1zHdUGR+oWNxvU7dFb4nTTdsfS/DgHZwbMbzdQ4OPoHnF+7G/AQNW4Y
	U6ZeQGDRdloLvaoGtQtJJCWCj4QAYUbdL7QcQiYbgiC2/EeLW7mhGU9MjtpG6C0LwqYqIntXJtg3G
	kqia+vpWSfTEXzV0+hjO5IVrFTQh2Xzx6/lqO1y8HJRCY3hsBWB0nbix+rmkAUsN1c7gUyAuLSTce
	zCRrk5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6cb-000000013iB-0dFU;
	Thu, 20 Feb 2025 13:29:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Ss-000000011KN-1IYP;
	Thu, 20 Feb 2025 13:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90F295C5DAD;
	Thu, 20 Feb 2025 13:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121FAC4CEDD;
	Thu, 20 Feb 2025 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740057581;
	bh=+VpyAaCGQPDlKw/VJRkaWMvum+CMpG8GC+D7rosuNkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SV4pU/g4yK9CU5ahOAUkvGWwYn4vheSlJeLiIMBeJiegxkJJcFtBbTHrPk0PLS9b5
	 0bCxlON2W5S4PaNuRPElEt3slEGF2iPuuMZ0/TnzORsTUZ1SoRiN64bZB0ZyIUlNsK
	 nRpg1DYDE7lLHo+7o1D8pYVdqnRKB0DRLEfaie42zGRyU+qUiU3nujZaHpufjL7xVG
	 vSHLLJdHZvPO3SGi6m66qF8xtaj1UXXbYWr2aK60F3AOCWk700KSRZZXbF9XGg25Yy
	 4O8MlUTsKskiIJFbqJEzCRjvDWAY61GnSOLryilBq46MhSOJXYWRG76VdyKsV/2e2y
	 7o2c6aqCi5Arw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 20 Feb 2025 14:18:57 +0100
Subject: [PATCH 11/14] wifi: mt76: Check link_conf pointer in
 mt76_connac_mcu_sta_basic_tlv()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-mt7996-mlo-v1-11-34c4abb37158@kernel.org>
References: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
In-Reply-To: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051942_405752_7E3BD905 
X-CRM114-Status: GOOD (  10.50  )
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

This is a preliminary patch to introduce MLO support for MT7996 driver.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index f30cf9e716105d3aa05a68713e9c857d9df510f8..6e79dab7d8c786ef6435eff41d45aaf63ed1b078 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -391,7 +391,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_BC);
 
 		if (vif->type == NL80211_IFTYPE_STATION &&
-		    !is_zero_ether_addr(link_conf->bssid)) {
+		    link_conf && !is_zero_ether_addr(link_conf->bssid)) {
 			memcpy(basic->peer_addr, link_conf->bssid, ETH_ALEN);
 			basic->aid = cpu_to_le16(vif->cfg.aid);
 		} else {

-- 
2.48.1


