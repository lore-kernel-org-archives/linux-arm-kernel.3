Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D401FCD4F28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 06:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TsCv3+cJ+T1nVfr75kjuiGgZn2uIqwLNHM/E0w+NzcM=; b=ZSo8l7ExXEU2Oj5rcABOsLjKEn
	KR6oZDncoo73vhYoPikuqzyz8u8Se7TX8KtBK6tYnRVC2ZIuIkdZSOg/lHdEoXNS23YWEFpfZKsOq
	5hmR0Tw2cRLhldRRwBD7Zxw7daU16IhiQclIwl6K4d05eMS5M8eKyiToLoQ0tcSlebjPfqMizynLE
	ppjBIwJxzxHOX4AlCg5br/fScMWohAd5vYJl8S0zVW2x7VD435E5SvPDJ1mZpPLFJJK4w08Bf/tpN
	9JwVVWHUT6pdvVgZXGGMwmSE3bQH8A1v8bThbPIJ+DGBVPieQ9wDUZzI8sNudDpMAwUF4hxH+CMyT
	3f7RcEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJQkv-00000009xBK-1afn;
	Thu, 13 Nov 2025 06:24:29 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJQks-00000009xAh-1I93;
	Thu, 13 Nov 2025 06:24:28 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 296eb37ed;
	Thu, 13 Nov 2025 14:24:18 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: nbd@nbd.name
Cc: lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH net] mt76: mt7615: Fix memory leak in mt7615_mcu_wtbl_sta_add()
Date: Thu, 13 Nov 2025 06:24:15 +0000
Message-Id: <20251113062415.103611-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a7be2e11303a1kunm4a412972110eee
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSBhLVkwdQ00eHh1LSh8eT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0xVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=QHLrg1omORyQvGJuKbNRFxk3dRh3/GYzA5JngeZw/cgJz3tz9ACgBW2bd3Z6+7rYA7SajuYdGSRCfo3P1grhQ8VrnZfDX+cHJ/9pHnYzszEMp25biRgeaWIqL2ppQm2fXklqxBYJFMEIimNPxykQC0RGK2732adun6WtugWOBng=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=TsCv3+cJ+T1nVfr75kjuiGgZn2uIqwLNHM/E0w+NzcM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_222426_962497_DE00FBBC 
X-CRM114-Status: UNSURE (   8.54  )
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

In mt7615_mcu_wtbl_sta_add(), an skb sskb is allocated. If the
subsequent call to mt76_connac_mcu_alloc_wtbl_req() fails, the function
returns an error without freeing sskb, leading to a memory leak.

Fix this by calling dev_kfree_skb() on sskb in the error handling path
to ensure it is properly released.

Fixes: 99c457d902cf9 ("mt76: mt7615: move mt7615_mcu_set_bmc to mt7615_mcu_ops")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 4064e193d4de..08ee2e861c4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -874,8 +874,10 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	wtbl_hdr = mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
 						  WTBL_RESET_AND_SET, NULL,
 						  &wskb);
-	if (IS_ERR(wtbl_hdr))
+	if (IS_ERR(wtbl_hdr)) {
+		dev_kfree_skb(sskb);
 		return PTR_ERR(wtbl_hdr);
+	}
 
 	if (enable) {
 		mt76_connac_mcu_wtbl_generic_tlv(&dev->mt76, wskb, vif, sta,
-- 
2.34.1


