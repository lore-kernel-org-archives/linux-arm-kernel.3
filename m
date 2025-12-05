Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F607D2F7D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvKjQKXrz9xLBMKqQldxh0N2c2JNqte9Gn9HSqWv8v4=; b=UB11n0YlUMI6W7I68frLdp3ncQ
	Fog2EmXgRqCXgmChH5P0yHvfo6QYpuVZTJqo953uN4D2vZhfWTjCCRbjtinS1gYno2V1Qo3LVeMZ9
	EwGKpcdhh47o8ROXVuthEzxRqXzVwR1AoSum7WlSPN0cwG1JLa1KpHYXiPUJgn7aE+HRvW06x07W7
	9BJaQwka5c1AwSaAnLyCrkC1XC5ygbmm2Yvqnpf4+juuZ/KyzSUErEr/wN5g2Kz6XFoGzctQd+RXK
	zbdCa+JZY7Te3koU0PD9veXE1ZgXT/mZTIuC4hCuAfSPd9gT6OuNoxCz5IjR46DwnAd9ap+0+bNQF
	YKCUADmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzo-00000009Nkf-0qpK;
	Fri, 05 Dec 2025 10:25:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzl-00000009Nj4-3sNB;
	Fri, 05 Dec 2025 10:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53E4F60204;
	Fri,  5 Dec 2025 10:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA726C116C6;
	Fri,  5 Dec 2025 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764930301;
	bh=j2sszEHvbo+AG1hndOWuS1qSVFTizaaquasEEngVdcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ITxiKiLYOPaF2czX9ZLml8Vf4qQz9RaNDooaySGr1VYW4790XsvtmbXg+QbMMEdZX
	 4I3BBQJzalOlbWt3WU5DEZn7OC2DC117A83CzY0i++9mDiSl8j72gOtm0aQpl0rW9I
	 NevtwxuxQSH3hYF+J1V6BIWaEaHiv9vstB8hmSuo/RygINeU+TVYXwDbhl+7Q+J+0M
	 shdh3coqrTZucjdC9GuoXC63b7oB18EfNTSsuJInND7JGsTdYIsMnzDU9Qm3qQcYA5
	 H00HhpS2mU/VlJLyre0VKoCk8hW+Brdxfe0+HyMT15xg60JpCfnGz/2XH7wmE/OkmP
	 zO0s4zWJQqWUw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 05 Dec 2025 11:24:37 +0100
Subject: [PATCH mt76 v2 2/4] wifi: mt76: mt7996: Reset mtxq->idx if primary
 link is removed in mt7996_vif_link_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-mt76-txq-wicd-fix-v2-2-f19ba48af7c1@kernel.org>
References: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
In-Reply-To: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Reset WCID index in mt76_txq struct if primary link is removed in
mt7996_vif_link_remove routine.

Fixes: a3316d2fc669f ("wifi: mt76: mt7996: set vif default link_id adding/removing vif links")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 0ad0152478a7e1b11bfe5d68d750cb8332d54290..8bf85a9beee7dc8c6741568af5b36cf89f0c1a88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -409,12 +409,23 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		struct ieee80211_bss_conf *iter;
 		unsigned int link_id;
 
+		/* Primary link will be removed, look for a new one */
 		mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
 		for_each_vif_active_link(vif, iter, link_id) {
-			if (link_id != IEEE80211_LINK_UNSPECIFIED) {
-				mvif->mt76.deflink_id = link_id;
-				break;
+			struct mt7996_vif_link *link;
+
+			link = mt7996_vif_link(dev, vif, link_id);
+			if (!link)
+				continue;
+
+			if (vif->txq) {
+				struct mt76_txq *mtxq;
+
+				mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+				mtxq->wcid = link->msta_link.wcid.idx;
 			}
+			mvif->mt76.deflink_id = link_id;
+			break;
 		}
 	}
 

-- 
2.52.0


