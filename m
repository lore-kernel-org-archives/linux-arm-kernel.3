Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10490CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfOo1Gz+lA1SKNNUpWE+MzAGtSNDgpxabOAYAnI4anM=; b=hbs8GCk9yIV3N6UdKMB/HT1FYB
	F9dLwqe3hKEQIBgkGJtpd2SonjeEp4YvRiyRswxulcZtH4vJyYzDBiZKb/K+bSZcn0cEHxgLZ+Iz1
	sZzJwLRoZ7cD3anjJcrkeOZ/Nvaq8laTNipQGMs34hSwo8jBvcg5fHGV2LtGWy7IUx8RYI3+XCvcj
	LhhmvBZn1AeapAN0m2b8Nf2/mi0SREB3DGA/r2k1xr2Z8XdXpMu74TjZu0ib+Z+SvzY9RFxhudKsv
	bzSkDx4QwhNuN4QPK0hYvcQE8Fj02e7aC48rdyhodEePIjlV2ppNMOjbF1ziweiR+dXThRPS5b59I
	SnYYxC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP6-000000078qc-2cRS;
	Mon, 19 Oct 2026 10:15:40 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkOx-000000078lX-2fGV;
	Mon, 19 Oct 2026 10:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Vf
	Oo1Gz+lA1SKNNUpWE+MzAGtSNDgpxabOAYAnI4anM=; b=bmM23mX7OCWym4JS8S
	VCnruMtsb95J64mQyc/UA4/Zk1UyMdlzn2Nh5Fsr2o6q3DhL/GRI67brvB7i20uD
	+BHAvK9v7SLom8W4FMnI+0gKX646PmO9cmodV0PV6K1L2JsR4IJY2CvHS3wkfBGh
	c8PmUpv6jXSyHcExVQgxboquc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S4;
	Mon, 19 Oct 2026 18:15:21 +0800 (CST)
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
Subject: [PATCH 02/10] wifi: mt76: mt7615: validate MCU response lengths
Date: Mon, 19 Oct 2026 18:14:57 +0800
Message-Id: <20261019101506.1926943-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy3JrWrWry7JrWkKr1UGFg_yoW5JFy5pF
	Wqga4Yyr1UJrsFgw10vw1kA3yaqwn3KFnxtF9rWwn5J3yrA3WrGF409a4Yvr1rJrZ5Cr1r
	Jw4kXFnxWrWDX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRwjjDUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRm582rV7bmLoAAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031532_394804_842BE3F7 
X-CRM114-Status: UNSURE (   9.71  )
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

The MCU response parser reads descriptor and command payload fields
without checking whether they are present. Truncated firmware responses
can therefore cause out-of-bounds reads.

Validate the descriptor and the command-specific payload before reading
or removing them from the skb.

Fixes: 0e6a29e477f3 ("mt76: mt7615: add support to read temperature from mcu")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index ff57ede87f71..4e33c6a618f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -143,6 +143,11 @@ int mt7615_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			cmd, seq);
 		return -ETIMEDOUT;
 	}
+	if (cmd == MCU_CMD(PATCH_SEM_CONTROL) &&
+	    skb->len < sizeof(*rxd) - 4 + sizeof(u8))
+		return -EINVAL;
+	if (cmd != MCU_CMD(PATCH_SEM_CONTROL) && skb->len < sizeof(*rxd))
+		return -EINVAL;
 
 	rxd = (struct mt7615_mcu_rxd *)skb->data;
 	if (seq != rxd->seq)
@@ -152,9 +157,15 @@ int mt7615_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		skb_pull(skb, sizeof(*rxd) - 4);
 		ret = *skb->data;
 	} else if (cmd == MCU_EXT_CMD(THERMAL_CTRL)) {
+		if (skb->len < sizeof(*rxd) + sizeof(__le32))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		ret = le32_to_cpu(*(__le32 *)skb->data);
 	} else if (cmd == MCU_EXT_QUERY(RF_REG_ACCESS)) {
+		if (skb->len < sizeof(*rxd) + 8 + sizeof(__le32))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		ret = le32_to_cpu(*(__le32 *)&skb->data[8]);
 	} else if (cmd == MCU_UNI_CMD(DEV_INFO_UPDATE) ||
@@ -165,12 +176,18 @@ int mt7615_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		   cmd == MCU_UNI_CMD(SUSPEND)) {
 		struct mt76_connac_mcu_uni_event *event;
 
+		if (skb->len < sizeof(*rxd) + sizeof(*event))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt76_connac_mcu_uni_event *)skb->data;
 		ret = le32_to_cpu(event->status);
 	} else if (cmd == MCU_CE_QUERY(REG_READ)) {
 		struct mt76_connac_mcu_reg_event *event;
 
+		if (skb->len < sizeof(*rxd) + sizeof(*event))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt76_connac_mcu_reg_event *)skb->data;
 		ret = (int)le32_to_cpu(event->val);
-- 
2.34.1


