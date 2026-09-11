Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16A1C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9qPNY3Uu4k+FecCTTTG7VYnLoe6+q61r76rTHiKu0vo=; b=FnuJgPYCc1TKO6PKDgltaCpSbT
	3jg4azUM9QzfqKEGSQmd2/q6WZib//Ace2gQXjMrGM9cuOfFDTDFimIHrqr4HMlP4yAaw11zh+E6w
	c6byO0/JyVI8Vnv40dpbst+4cRTAgOZWt14gjk25VDSY0uYU9YYlaUS565mKXXgpGZrT0BJh594Q8
	TtWBftL1GJQgkDQdM5mE4McAoJb5IV8lPCi4eUGMp4jIBNpry/M6Xrgd8x8u0iyXYySDzwoPltUpI
	svhJHp/XfTKGCbTGDfzTUwCWnH1UHhdyHsnzbCJojcdKVltCKUN+pccD5ith01q/UugGuGXG6k1kD
	8adZHxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uWt-0000000FvGT-315T;
	Fri, 11 Sep 2026 06:14:31 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uWo-0000000FvF4-1fhY;
	Fri, 11 Sep 2026 06:14:29 +0000
Received: from seu.edu.cn (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fb7;
	Fri, 11 Sep 2026 14:09:23 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC net] wifi: mt76: mt7996: guard station-only MLO TX handling
Date: Fri, 11 Sep 2026 14:09:22 +0800
Message-Id: <20260911060922.94383-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15c19903a1kunm3f9087f41c7355
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUtIVklKGE1IThpDTk9IHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=KmpRcIo4HhataD46neMm5mjBpxhLA7cwHRwITzsoQngB8Q1+TReXPqBFyaGZFTPgqSRbkVVrbg1vrq0+2+FY7zL3yA5cifwzEo9cn43y+8+dqpZO2kizTH4Yc4oQl+wQi/yYR+j+qOJ4ljV0JSj/Mhl1jwg9z25jf1SaGhQltDs=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=9qPNY3Uu4k+FecCTTTG7VYnLoe6+q61r76rTHiKu0vo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_231428_525374_48E6DECA 
X-CRM114-Status: UNSURE (   9.61  )
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

Pending frames can be retried after their station is no longer
available. Require a station for both MLO-specific branches and retain
the existing non-station transmission path for valid vif traffic.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 7ef0c7ad735b ("wifi: mt76: mt7996: Implement MLD address translation for EAPOL")
Fixes: 85cd5534a3f2 ("wifi: mt76: mt7996: use correct link_id when filling TXD and TXP")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 1cba381a78b8..e24dd530486c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1057,7 +1057,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	if (!wcid)
 		wcid = &dev->mt76.global_wcid;
 
-	if ((is_8023 || ieee80211_is_data_qos(hdr->frame_control)) && sta->mlo &&
+	if (sta && (is_8023 || ieee80211_is_data_qos(hdr->frame_control)) && sta->mlo &&
 	    likely(tx_info->skb->protocol != cpu_to_be16(ETH_P_PAE))) {
 		u8 tid = tx_info->skb->priority & IEEE80211_QOS_CTL_TID_MASK;
 
@@ -1097,7 +1097,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	 * compatible with 802.11 EAPOL frame, we do the translation by
 	 * software
 	 */
-	if (tx_info->skb->protocol == cpu_to_be16(ETH_P_PAE) && sta->mlo) {
+	if (sta && tx_info->skb->protocol == cpu_to_be16(ETH_P_PAE) && sta->mlo) {
 		struct ieee80211_hdr *hdr = (void *)tx_info->skb->data;
 		struct ieee80211_bss_conf *link_conf;
 		struct ieee80211_link_sta *link_sta;

