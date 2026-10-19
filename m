Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D174CCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44nY6J6XiDlqL4AiN+jyRzejpQtk9NdoZSmq8/1VDHg=; b=EHWT8meYLx0ezxA8eiM1HKHAjj
	7bWVjmlQG6eDlGZX8up2dxyy/QV32DDTYC6JAwqn1kr1p6j8Kb6WKqr6+OABZnw9OsYCXvseHo8dw
	MuQGfb2JkrHeQQVNC6JuLa5RVK6GSIZLW8N3CHiX+6v3tOa/UVM+n8Fr/ZGkzbMR+BwlmocYQgDuc
	zQap987i6fHaKcDRV1zN3FHsv6pVvL5uT4r5OrdtjPfC3HMFbWboEJ9xQVuqO4fcqwtmMNAAj46XO
	kWMlhbncvxGjzQwPpGOZsy0E8rJiiDR6c7V/hZPb/9qyGvH0BUGAXdpOZiVd9VKxApB3+f0NSdTbe
	2pYNAttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkPF-0000000796U-0nQi;
	Mon, 19 Oct 2026 10:15:49 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP4-000000078o8-08kh;
	Mon, 19 Oct 2026 10:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=44
	nY6J6XiDlqL4AiN+jyRzejpQtk9NdoZSmq8/1VDHg=; b=Tld/xJBgjfHpuHYLHb
	8hpQdwil+6PAYmsQYiJDg6bRVnHsNC2becAn/o/s2Tn4iHuXWK9A02lAHy5Uk40O
	6X4x0QeDI9bQMbWWow4A8d47vhroeeTYg57JeoixGBcLq73qP7UaKMyeWBy52OcH
	NrmgjWg0tJh3M23r8p79EetRI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S10;
	Mon, 19 Oct 2026 18:15:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
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
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 08/10] wifi: mt76: mt7915: validate RX rate response length
Date: Mon, 19 Oct 2026 18:15:03 +0800
Message-Id: <20261019101506.1926943-9-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S10
X-Coremail-Antispam: 1Uf129KBjvdXoWrur4Utr1rGFWkCry5Ww43GFg_yoWkJrX_ur
	4v9r9xGr18Gw4qkr12kr47uFWqyaykA3Z5urWrt3yrJ3y7ArWDCrn7ZwnrGrZrW3Z2vF45
	Jrn8Xa45X34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiuWl7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AG79WrV7cG0KgAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031538_447155_334517E1 
X-CRM114-Status: UNSURE (   8.38  )
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

The RX rate query reads a complete PHY information structure without
checking the response length. A truncated firmware response can cause
out-of-bounds reads while decoding the rate.

Require the complete PHY RX information structure before using it.

Fixes: 11553d88d0b9 ("mt76: mt7915: query station rx rate from firmware")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 955c0e6c7cb6..00a528694255 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3942,6 +3942,10 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	res = (struct mt7915_mcu_phy_rx_info *)skb->data;
 
-- 
2.34.1


