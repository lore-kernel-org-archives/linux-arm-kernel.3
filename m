Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C93CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 00:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nBDQYELmeM++uI0eikSwF9uiMa5FBguJzVyGdL7t6Hc=; b=US1nQe9EXTLgd20QAU9c2Fhlts
	JcCl+Bpa8MXTYKWEQG/zVVFrHIOwrpO5lKjG3v1Wu92RkDccm7EHcUyK9qSVxV5sC0jik/Gg1RTMH
	wL9kyli3C7DPwg5/MLRIdRAwCcv01Ljcs/2Ev/A6tDeRWnS3YTxkIj1OlTTli7DurxBLKer8MBDvE
	V7pbdcHxdzEfpRRhEx4r6zECyUZN736Y71FFG/WdWAFayZa1I13b3gBrk/o8pQjZOwtmVZNeBRlx+
	TPkX5p3c3dCDuf7z+ZUIjrDPOEg1gcw4RtTlM6Tm5QL5EHiSgdi+mcHKJiHddPu2LYGsv8hUpemQl
	EBCyuSAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcY6l-00000008Tro-0qWO;
	Thu, 25 Jun 2026 00:38:19 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcY6i-00000008Tqv-3ejQ;
	Thu, 25 Jun 2026 00:38:18 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADH4dh2eDxqD+zCFQ--.4839S2;
	Thu, 25 Jun 2026 08:38:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Felix Fietkau <nbd@nbd.name>
Cc: pengpeng@iscas.ac.cn,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH] wifi: mt76: fail channel switch when TX queues do not drain
Date: Thu, 25 Jun 2026 08:38:12 +0800
Message-ID: <20260625003812.37895-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADH4dh2eDxqD+zCFQ--.4839S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyrWr4rur1rGFy5uF45Jrb_yoW8Kw4DpF
	WDt3yj9F1DJFn0g3WxJ3Z5JFWY9F48Kw1DGrZYy34rA3Z8Zrn0yF15Ga4jkr15ArZ2yayY
	grs8ta17WFyDWaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JF
	I_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7VUbtxhJUUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_173817_288767_6512D54F 
X-CRM114-Status: GOOD (  12.09  )
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

__mt76_set_channel() disables the TX worker, schedules pending TX queues,
sets MT76_RESET, and waits for pending TX to drain before changing the PHY
channel state and calling the driver set_channel() callback.

The wait result is ignored.  If TX does not drain within the timeout, the
function still publishes the new channel state and asks the driver to
switch channels while old-channel TX may remain pending.

Return -ETIMEDOUT when the drain wait expires.  Keep the survey update on
the old channel, then clear MT76_RESET and re-enable the TX worker through
the existing exit path.

This is marked RFC because the existing channel switch path treats the TX
drain wait as best-effort.  Maintainer feedback is needed on whether a TX
drain timeout should fail the channel switch for all mt76 devices or
whether the current force-forward behavior is intentional.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 13c4e8abe..37474d64c 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1033,6 +1033,7 @@ int __mt76_set_channel(struct mt76_phy *phy, struct cfg80211_chan_def *chandef,
 		       bool offchannel)
 {
 	struct mt76_dev *dev = phy->dev;
+	long time_left;
 	int timeout = HZ / 5;
 	int ret;
 
@@ -1040,8 +1041,13 @@ int __mt76_set_channel(struct mt76_phy *phy, struct cfg80211_chan_def *chandef,
 	mt76_txq_schedule_pending(phy);
 
 	set_bit(MT76_RESET, &phy->state);
-	wait_event_timeout(dev->tx_wait, !mt76_has_tx_pending(phy), timeout);
+	time_left = wait_event_timeout(dev->tx_wait, !mt76_has_tx_pending(phy),
+				       timeout);
 	mt76_update_survey(phy);
+	if (!time_left) {
+		ret = -ETIMEDOUT;
+		goto out;
+	}
 
 	if (phy->chandef.chan->center_freq != chandef->chan->center_freq ||
 	    phy->chandef.width != chandef->width)
@@ -1059,6 +1065,7 @@ int __mt76_set_channel(struct mt76_phy *phy, struct cfg80211_chan_def *chandef,
 
 	ret = dev->drv->set_channel(phy);
 
+out:
 	clear_bit(MT76_RESET, &phy->state);
 	mt76_worker_enable(&dev->tx_worker);
 	mt76_worker_schedule(&dev->tx_worker);
-- 
2.50.1 (Apple Git-155)


