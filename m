Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F0EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0stVGTOp2A7iOdrNEMnFBm64FAGWEdBv8PkE1TGF6o=; b=CKUD8pzo4Z9qRTPuD3E5/9JrSj
	7nzeDpcGcge+Z5aTPWXzRfGrMC+HV0mMwxIzodehz1U+7sVHXnCGYtnF7D7Yn1EtNLvsQuQjKqLu8
	PsMTydUYclam0ptBzsdj5VyNEJ+Rv6Npas1vSPCl1K60uBRWFGooqE1Z0ixJWS3xfZB/cwwEl2xWR
	NlPZ8pEJswYZ7akRlua3FQfztd4UnpNnx55LQ4TnNlhi5UEwPWi0SULWTAh+m+w4Q6kZGuo2CbKJn
	i4JWW17XLFB8+GR9GUC4SQg8cg4Q2JBdFGVqpV43KkiY4LIn5Dwp2Ql8z96gtse/TR3E6A7REPZJh
	1xnFi+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3x7-00000006YML-3Vyf;
	Tue, 11 Mar 2025 18:03:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fj-00000006VHV-3wuX;
	Tue, 11 Mar 2025 17:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21D8CA459A8;
	Tue, 11 Mar 2025 17:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EB0C4CEE9;
	Tue, 11 Mar 2025 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715142;
	bh=GfQP+e9/FOkiyZ4CffiuWj+w7zarlndvdcfCxYmuIDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TPpE0dJXm/592JDWkQcW8CyoEIpLbdNDMFunMGBG74L2TsdDGvFPMAwWjKawXcBTo
	 lGZ1tmZy+TGuyfwbV25S0Wvo28RFOx/201pVu/JFXc+5bRzmeQV/+jVJ+1v7ij/pzW
	 Q6tQ1evL2v6/aX2lzBFDRyGY3csC8fPGvIsyEyiHC3h9kKZxzkBZe8a4JWGGtdxT+c
	 IkyuIW9eiBk5749CTScDz7wucc//FujACUpytIjckMDo5xnuC5OQvikOYe2K9vYuYS
	 cikVkBNMlxY+QXfl6SHu/OgEdxmsJI8rhojdL0pOfe5IilqUN2SN6dXX+xTUcz9vlB
	 /GEvlVv/GN0Ug==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:09 +0100
Subject: [PATCH v2 10/13] wifi: mt76: Check link_conf pointer in
 mt76_connac_mcu_sta_basic_tlv()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-10-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104544_054763_E16A07C8 
X-CRM114-Status: GOOD (  10.44  )
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
index d0e49d68c5dbf0ed4eab084d9c6f1cad230bed93..bafcf5a279e23ff007d9052301cd2f6b899c491e 100644
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


