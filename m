Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEA4CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvGaHGcUtbNa8pA00YQRkxYIlyvf+Kc6B2WPJd4XCNA=; b=VlBB4LOfCqOoHo0/Fwg17ELNWT
	CPQdtwC/uSh5GWwW+kviKNuU1hE+KtLx12BgL2sJxUAnt20QrcfwKzlD0yH2xscqEdOAPVKjVixJl
	9oTUUSwyzDkIw/mLHjaLSh6crOo7mqpFsO2h1X5DG9ejm3phUSEQvdYkTn5b9JHayupX7gBXSLnI3
	KrwnuI0NqxFloJYugyC8HtYj0sRftab+IlnLRr+CsH3NV+31bAOSUnI3jPSdq4D4ZtkAGAGcTC7vk
	kxFz30AP//FrPb6gRWIWJ7Alv49fEd2kVrnxGj7XulErxLjy1hVFVIu2O3tJxdQDidXrbYx1nuKIo
	Pij6YLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOR7-00000005m12-0eVM;
	Sun, 18 Oct 2026 10:48:17 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQu-00000005loE-0cMq;
	Sun, 18 Oct 2026 10:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qv
	GaHGcUtbNa8pA00YQRkxYIlyvf+Kc6B2WPJd4XCNA=; b=VlWMxck8TlfFIw58LI
	YU1swKyQNcFPqK1cIm3knCeQMSvM9ubylHR2Mw/Bbufw5UMXAi6qKG5p3WxChaG3
	i11zp7ks52km8A8xAc6MWe2K89ZjUjsJrrrPVYW7DqL2kqMSb3RjS+syOO5c4PBc
	zKxIH88uz2V43cGY2rX5GSrD4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXHyjOo9Rq9DXFAw--.17380S3;
	Sun, 18 Oct 2026 18:47:45 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Money Wang <Money.Wang@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] wifi: mt76: mt7996: unlink TWT flow if MCU rejects agreement
Date: Sun, 18 Oct 2026 18:47:38 +0800
Message-Id: <20261018104740.865520-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261018104740.865520-1-yaojiale02@163.com>
References: <20261018104740.865520-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXHyjOo9Rq9DXFAw--.17380S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr48uw1rtr47ZF48Gr4DJwb_yoW8Gr1Dp3
	yj9342vF9rGr4UG3W0ya109r4rZan5GFnxGFZ3uw1Fv34xArn2kF42vF9rAr1qkFsFkFyj
	qFyjyr1fWa95Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRy7K3UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRLsJ2rUo9LJWQAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_034804_559332_B003CAB0 
X-CRM114-Status: GOOD (  11.02  )
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

The flow is added to dev->twt_list before the agreement is sent to the
firmware. If the firmware rejects the agreement, the flow remains linked
while its flow ID is left available.

A later setup can reuse and reinitialize the linked flow, corrupting the
TWT list. Station removal can also leave the stale entry behind.

Remove the flow from the list when adding the firmware agreement fails.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 1cba381a78b8..a9558381ad91 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -3285,8 +3285,10 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
 	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
-				       MCU_TWT_AGRT_ADD))
+				       MCU_TWT_AGRT_ADD)) {
+		list_del(&flow->list);
 		goto unlock;
+	}
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
 	dev->twt.table_mask |= BIT(table_id);
-- 
2.34.1


