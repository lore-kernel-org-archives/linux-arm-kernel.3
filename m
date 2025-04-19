Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B65CC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 03:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HEB3Gu0mmtCLHoo7vWAwYwONR42w2RB1PSaApMMRgZ0=; b=Dw9LaswKaHVw8g4ict61vfqI99
	FpvTpCueyrE1e37SwTxifu0ODj/dwc3A63f62EdMa1/IwMn7Nh5WqKFvGMpwXHz0QMLEFCUhpuk/I
	VLqi9PUCBlCUSTMBm7vwE2pKb1kJ4WXKfQZ7jwaw3qOdoBTjChCSAw+1bNLrCMIhopbMGh/BTV4Hb
	HFvXde9GirWtdOkjANKKprM28BpcRIKR70vqKzHLMvw9Jczd+znxrjxECXZp+iszcO/UEZVyZvuvM
	P4CXIlUBBX4spUezUtvo5d9es/o0tNX42ftokcmj1CvAkyQKPrOR2B6+3a91+SdlmDvlObylrgA6B
	G1QE6E5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5yiX-00000000lKU-24bP;
	Sat, 19 Apr 2025 03:18:09 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ygf-00000000lEF-2MCY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 03:16:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745032569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HEB3Gu0mmtCLHoo7vWAwYwONR42w2RB1PSaApMMRgZ0=;
	b=UD8N6BD3tYDGzkmMJbDeZEkO8JXQY5pN24SwGdbUgaaIaUgiuZAwtjzpkfiVKXTqzoDVjl
	8ZJQ0OXXBIKd1g47WPLE+obP9bjFP1tERbEtDmJIaBHFvFVw+CvhGgSdKiCICYh0cGeHvc
	AokjfPoZ966kJE8y4FIVKnneZH4aFt0=
From: sunliming@linux.dev
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] wifi: mt76: mt7996: fix uninitialized symbol warning
Date: Sat, 19 Apr 2025 11:15:28 +0800
Message-Id: <20250419031528.2073892-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_201613_811071_E969FFE8 
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

From: sunliming <sunliming@kylinos.cn>

Fix below smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:952 mt7996_mac_sta_add_links()
error: uninitialized symbol 'err'.
drivers/net/wireless/mediatek/mt76/mt7996/main.c:1133 mt7996_set_rts_threshold()
error: uninitialized symbol 'ret'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202504101051.1ya4Z4va-lkp@intel.com/
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index cc6bb4544c2a..7c7c4b5a28b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -991,7 +991,7 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	unsigned int link_id;
-	int err;
+	int err = 0;
 
 	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_bss_conf *link_conf;
@@ -1248,7 +1248,7 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 static int mt7996_set_rts_threshold(struct ieee80211_hw *hw, u32 val)
 {
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
-	int i, ret;
+	int i, ret = 0;
 
 	mutex_lock(&dev->mt76.mutex);
 
-- 
2.25.1


