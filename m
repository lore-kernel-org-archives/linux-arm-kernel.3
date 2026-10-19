Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF57CCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39+rHsUPFz0jl7q8duyowDHk9CeWNhUTVpMmdClsFH4=; b=OTobP1Tujd+Jvklct0D+o8eTE8
	C6TGldWjjnRY3IPKsVeOofKRzcbVzqz9N4kCa1/pEt9/w4EXbIGAVLaWwUSQMLH0EyQCWFdn/rYay
	3oJ5YK5hJL3KhyAViXITZruJcldwLpX9AIkctwpDsjWkT1jElIW6t3AOLp8cJzmef/2pFZJoND2wQ
	BIUt7MrzHqst/W/eVnZtbwu8bxCHjpE7tAwr/QuHKyjdSRXTsVT1ZJlsZIiFaRJ1rAzNY6yFPV7rD
	YMfeBqZZ5c/xY7oVdY8KJN8AIm7C6k1vOCaPt6IKon7yQldOnVQ9FlLCSgTcrxtmLtiNub8C0ZLQ5
	QbrsNNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkPJ-000000079Cl-0QgD;
	Mon, 19 Oct 2026 10:15:53 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP5-000000078ox-2cF2;
	Mon, 19 Oct 2026 10:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=39
	+rHsUPFz0jl7q8duyowDHk9CeWNhUTVpMmdClsFH4=; b=ZuXFd512IHtJ/b4N2p
	wotEEk2Zr2eACFmk57qGCownmvG4BxCzr8lS9U1j9M5dffpLLjBxiTlM1sLVsB30
	RHbs6PP7YL0NQRP+BrxpS5z+juLT/I9Usj4KEyCA9eAqHq5pwtaiVnDI5jeBiBHo
	Pazr9cyVppiGrnx9zsavVPFWY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S11;
	Mon, 19 Oct 2026 18:15:30 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 09/10] wifi: mt76: mt7915: validate WED TX statistics response
Date: Mon, 19 Oct 2026 18:15:04 +0800
Message-Id: <20261019101506.1926943-10-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWfZFyDXrWkAw18CFWkCrg_yoW8XF48pF
	W8Ka4Yvr4UGF4vq3y8Aa1kZayrtanYgryxCrW8Ww1rGryvyF1rCFWq9Fy5KryFya1vkF17
	Xr4YvFnxWrZxZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRl_MxUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AK79WrV7cK0PAAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031540_539100_522A74BF 
X-CRM114-Status: GOOD (  10.30  )
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

The WED statistics query optionally skips a response prefix and then
reads a fixed statistics structure without validating either range. A
truncated firmware response can cause out-of-bounds reads.

Calculate the chip-specific prefix and require the complete response
before pulling the prefix.

Fixes: 161a7528e407 ("wifi: mt76: mt7915: rework tx packets counting when WED is active")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 00a528694255..4a11a4a0dbde 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -4183,7 +4183,7 @@ int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wlan_idx)
 	} __packed *res;
 	struct mt76_wcid *wcid;
 	struct sk_buff *skb;
-	int ret, len;
+	int ret, len, offset;
 	u16 ret_wcid;
 
 	if (is_mt7915(&dev->mt76)) {
@@ -4200,8 +4200,13 @@ int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wlan_idx)
 	if (ret)
 		return ret;
 
-	if (!is_mt7915(&dev->mt76))
-		skb_pull(skb, 4);
+	offset = is_mt7915(&dev->mt76) ? 0 : 4;
+	if (skb->len < offset + sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
+
+	skb_pull(skb, offset);
 
 	res = (struct mt7915_mcu_wa_tx_stat *)skb->data;
 
-- 
2.34.1


