Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C305DC3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ga66tI7ZBv/7mBhdJQc1HXQoEY3zEWmy/qJWiwMUdZA=; b=RLGUBnN5V73k+7TQURMNSNBqDI
	rqL4aOImqDOht1GYtN/Vix5CHqP6DWgjvv6jSJK7GoRmesaxUbWy0BaamsGX7iiGGhylU6Fh6nD0U
	ifJ9ucxfJAVpzidD4neVXekzEPpsXarK4E8OUuPys6RKtheM9l8IAfeXD4ZVdaSbELiT6M0AG/Ui1
	zIRL5RctR1dp0v6U+zdFuuHO51pnq+vFxnkkrHDvUnB1KoOf35kK7fG+t0sjPcI+MJMW+RjOBdnar
	mIUDYfovX3HK3XAfcB+rLBPRVDiUwdTybTUsXghzlbwcrh0mIxgLXEjmmMbob8yh/aZs3xomfZ8ma
	9p1gbWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4LL-00000008mZH-0IsH;
	Mon, 05 May 2025 22:31:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47I-00000008i51-143Y;
	Mon, 05 May 2025 22:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D94BB629C3;
	Mon,  5 May 2025 22:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FF7C4CEEF;
	Mon,  5 May 2025 22:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483411;
	bh=immGtHOQNAjbPw7pNkpPl9yR0ILfPCW0XuJiUmFodqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3xKHW86fKdCJcarEJf8NkWmuldJEcWx277LGx2iE6v0tXJPjndNzCB4nUmN81dJQ
	 BRHH80X+HldsSN2Z1AF6Cffxj3cr08ZmN2VligF3BxIirL+G/UITvwqXg1ikx5cGnl
	 ua9D+KeUHevH2Mgv2Kf+jUbxgBk8kkiO6Qe4liMZNRsIu6kX+0kFbGgkf7x3/BCIPS
	 BeZfoaDVyBvKYa/HXAD0KvBF4SnhYyVXsQULcuVI9AL8xmIeBxhU/Eh2vE3mNdBQfd
	 2/caui0LOsB1iJIcfg3/BLtFr3FHPyYv2Jr2Uc+VeWEw3PkWYkXqAsMRqMmVcU/ju0
	 J2Xwur5gGAn9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 072/642] wifi: mt76: Check link_conf pointer in mt76_connac_mcu_sta_basic_tlv()
Date: Mon,  5 May 2025 18:04:48 -0400
Message-Id: <20250505221419.2672473-72-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

[ Upstream commit 9890624c1b3948c1c7f1d0e19ef0bb7680b8c80d ]

This is a preliminary patch to introduce MLO support for MT7996 driver.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Link: https://patch.msgid.link/20250311-mt7996-mlo-v2-10-31df6972519b@kernel.org
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index d0e49d68c5dbf..bafcf5a279e23 100644
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
2.39.5


