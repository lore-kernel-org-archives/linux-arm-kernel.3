Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C67860A261A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gC8Y/aDc;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LzXmEMM1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWWVKdiYGbmvOs6BNs5U4wYjRvABmR24ib21cCIkM/M=; b=gC8Y/aDcvH1wQAgFm8kTwC6RmK
	JFDxX02lqXJJ8yTH/4fR2/rmhPAveQO43kLeSryL1L9RZnz7UuXAqF518nMNBX+/xd76jWEzEgYCP
	g8E9mFPS9AEEAtFjwIcaUYAelonN6SFWlA/YKmv6U26y5o19Ne4k2e0iaZY93pAM4Ib8byHey4/LJ
	KJJdyV7+tOUFM8pfnc+LqD8ps0dnJ3whgwHKPoLYEH3h/C4QQ8l5e3Zy3uGoJmGapmLCA5fpNy60m
	1YWUkQvuHxPNrWoX5T/vFyW5nKxwH3SNVco1O/5EwVMMiqL+QlRY8Yc5M6phd4UicfQ/VH7ModtV/
	kin5aSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvM-00000008jJY-1w4B;
	Tue, 20 Oct 2026 02:50:00 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvF-00000008jEg-1o2D;
	Tue, 20 Oct 2026 02:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QW
	WVKdiYGbmvOs6BNs5U4wYjRvABmR24ib21cCIkM/M=; b=LzXmEMM16FGmg6Z00P
	g8iLkfXXvZzqo050H19DLXnlACdRkcKa3KYU0MG16CPp0okQ2RarrGVtdFi7wL30
	+nuoqCzulFrDyqW071gNbUDeRJNeYtWWnHPEdlBTHsFSpRk7ddDVU0V27eESUHeO
	MiFFVL+318dajv4FDmLi1QmAk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnr8C+1tZqMLhIBA--.5123S3;
	Tue, 20 Oct 2026 10:49:38 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/7] wifi: mt76: mt7996: validate MCU response lengths
Date: Tue, 20 Oct 2026 10:49:27 +0800
Message-Id: <20261020024933.3205681-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024933.3205681-1-yaojiale02@163.com>
References: <20261020024933.3205681-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr8C+1tZqMLhIBA--.5123S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4rJw13CF1kWFyDWr1kuFg_yoW8ur4xpF
	Wjka4Yvr48Ars2qw18Ca1vya1Yq3WrGF13tFZ5WwnYvrZ3C3Z5JF1xKFnFvr45AFZxCF1f
	Jr4jqF13WF98X37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlfO7UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wI2cGrW1sKSwAAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194953_875837_05F370A7 
X-CRM114-Status: GOOD (  11.94  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MCU receive and response paths access descriptor fields without
checking that they are present. The response parser can also read a UNI
event payload beyond a truncated skb.

Require enough descriptor data at the receive entry point, account for
the shorter patch response, and validate UNI event payloads before
accessing them.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index cd7587ce5b8a..d661ff1e4a20 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -238,6 +238,11 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 		return -ETIMEDOUT;
 	}
+	if (cmd == MCU_CMD(PATCH_SEM_CONTROL) &&
+	    skb->len < offsetofend(struct mt7996_mcu_rxd, ext_eid))
+		return -EINVAL;
+	if (cmd != MCU_CMD(PATCH_SEM_CONTROL) && skb->len < sizeof(*rxd))
+		return -EINVAL;
 
 	rxd = (struct mt7996_mcu_rxd *)skb->data;
 	if (seq != rxd->seq)
@@ -248,6 +253,9 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		ret = *skb->data;
 	} else if ((rxd->option & MCU_UNI_CMD_EVENT) &&
 		    rxd->eid == MCU_UNI_EVENT_RESULT) {
+		if (skb->len < sizeof(*rxd) + sizeof(*event))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt7996_mcu_uni_event *)skb->data;
 		ret = le32_to_cpu(event->status);
@@ -943,6 +951,11 @@ void mt7996_mcu_rx_event(struct mt7996_dev *dev, struct sk_buff *skb)
 {
 	struct mt7996_mcu_rxd *rxd = (struct mt7996_mcu_rxd *)skb->data;
 
+	if (skb->len < offsetofend(struct mt7996_mcu_rxd, ext_eid)) {
+		dev_kfree_skb(skb);
+		return;
+	}
+
 	if (rxd->option & MCU_UNI_CMD_UNSOLICITED_EVENT) {
 		mt7996_mcu_uni_rx_unsolicited_event(dev, skb);
 		return;
-- 
2.34.1


