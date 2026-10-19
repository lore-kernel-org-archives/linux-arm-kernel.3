Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB37CCF2E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZuSQdKZoDodfXxINakcZgz8RnopRM3PGkhuKFq6Br8=; b=GnzrkGVNeoLG2mmRALYYHvNjoM
	qs+/Zg85VL5zTuVCEDr3GNP7hw+563DNZhD3qMIc8L1WH5Huj58DNTO4nJabMe93B6TAV+yvSOQNS
	rm2+zzzXFTKCEJ8CQn1Jn25iRHDMYFzTzr6pl3HFSvmqjS2xgjkcmfPKbxyjInnc0cuVZGHFo6uKK
	DgIm7ZslFD2rjEZXFDfo6ML5ESXIf04S+MiNjf//T6ulYc7ejvSAA/qrvXvAYDOcc07UPPjhBT/32
	BU+PhCMc4HUzE8JrnC6rXlhZIrghgv/FiYUq48sI1dp45KG6ZLjrQX7Cb094+uyQKdo88xUfCzm9K
	D17k+sYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP5-000000078py-30T1;
	Mon, 19 Oct 2026 10:15:40 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkOy-000000078la-0WUX;
	Mon, 19 Oct 2026 10:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8Z
	uSQdKZoDodfXxINakcZgz8RnopRM3PGkhuKFq6Br8=; b=llrw0tNCTChbZehVDx
	RV91p4ULKg983lsJVa3RKZaRjNQdhv9GGtAcLYehB9+67LiNeAuVRSClyo4vHiYV
	uXmZHnVFJJIlta1yHjVLzs5X5x8Mvm2U+FU2XDqfd1yjMdbbL2KuOMCUFGzlA5s5
	aDOquwbsQvqxjfftKWf4HZH3E=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S5;
	Mon, 19 Oct 2026 18:15:22 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	YF Luo <yf.luo@mediatek.com>,
	Yiwei Chung <yiwei.chung@mediatek.com>,
	Chih-Min Chen <chih-min.chen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 03/10] wifi: mt76: mt7915: validate MCU response lengths
Date: Mon, 19 Oct 2026 18:14:58 +0800
Message-Id: <20261019101506.1926943-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur43Jw4kAr1Duw4kZw1fZwb_yoW8Xw47pF
	W7Kay5ArW5Jr4jqw409w4kZayYv3Z5GFy2gFykZwn5JrZ5AF1rGFW09Fyqvr1rAFZ8C3Wf
	Xr4qqrsxWrZ8Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMnmirUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xq582rV7bo2gwAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031532_480404_DC0D224F 
X-CRM114-Status: UNSURE (   9.92  )
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

The MCU response parser accesses receive descriptor fields and some
command payloads without checking their lengths. A truncated firmware
response can therefore cause an out-of-bounds read.

Validate the descriptor and the patch semaphore and thermal payloads
before accessing them.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5bfe0366562f..3643906cbdf2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -174,6 +174,11 @@ mt7915_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 		return -ETIMEDOUT;
 	}
+	if (cmd == MCU_CMD(PATCH_SEM_CONTROL) &&
+	    skb->len < sizeof(*rxd) - 4 + sizeof(u8))
+		return -EINVAL;
+	if (cmd != MCU_CMD(PATCH_SEM_CONTROL) && skb->len < sizeof(*rxd))
+		return -EINVAL;
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
 	if (seq != rxd->seq &&
@@ -185,6 +190,9 @@ mt7915_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		skb_pull(skb, sizeof(*rxd) - 4);
 		ret = *skb->data;
 	} else if (cmd == MCU_EXT_CMD(THERMAL_CTRL)) {
+		if (skb->len < sizeof(*rxd) + 4 + sizeof(__le32))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd) + 4);
 		ret = le32_to_cpu(*(__le32 *)skb->data);
 	} else {
-- 
2.34.1


