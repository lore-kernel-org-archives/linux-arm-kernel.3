Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FB4606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZH/JhN0H;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OYDLZ7sX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7Pzuz7LE/Ym3T5iLUPnrRl+jMU1QyIKfb/Jk5nU0JY=; b=ZH/JhN0HyZrf6cprvB/rEfAoeN
	quRo8+B252+58tskZUFxty7K0Mn8yK+gumz3Sc+Smixl2N9FXPSSMczPm92XCtCvFhPirmGdI1jLK
	CwIn0kPzWmBiKbmkHV/qq+PSYxKMQT0Tp9rBDqr1krFpMGyo1YdEvDcK8K4g1PvRcR9neh9VieOTx
	61CWv8ry6uTmtfc7I2jLfiW+cg8ttTlPMIBu/C37oVEp4s0a13fHCcvDXrKsocK+/6nl1fcIIu4gi
	z4jfCmUy5Yv0auPY0UZLwKDUB4TIVC60qhN00REFXHqBw2uR3JHyMlJFYcY9tkcm08UF4nfKdCeJx
	ashnr8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzsP-00000008iKW-1AX3;
	Tue, 20 Oct 2026 02:46:57 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzre-00000008hji-40rG;
	Tue, 20 Oct 2026 02:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=f7
	Pzuz7LE/Ym3T5iLUPnrRl+jMU1QyIKfb/Jk5nU0JY=; b=OYDLZ7sXNHapi0fR65
	FOlODgEfr8fwz3OofDGQsVoabF2NQq3hDbHj9LkOEzXLjJzdjeGHsvzfNwRQ252o
	ONyOxWiQrmEfXBRlggIGpqz2yM1DpPx/OR01/QJ2iHIo5nr9/A42fFjVZIlPcWo1
	GsQ/omq140ZFlESL7Ra2pESnc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S7;
	Tue, 20 Oct 2026 10:45:54 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Mingyen Hsieh <mingyen.hsieh@mediatek.com>,
	Rong Yan <rong.yan@mediatek.com>,
	Nelson Yu <nelson.yu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 05/11] wifi: mt76: mt7925: validate MCU response lengths
Date: Tue, 20 Oct 2026 10:45:37 +0800
Message-Id: <20261020024544.3101738-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rGryUXrWDXw1kCrW3Jrb_yoW8CrWxpF
	W2ga4akryUJrsrWw4093Z7Z3yYq3Z5GFnrJrWxXwn5XrZ5Aa4rGFWYvFy2vr4rAFZ5CF1r
	Gw4vv3W3WF98X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ug2-OUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wL9OGrW1eJ6BwAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194611_515535_4ADB917F 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

The MCU parser reads receive descriptor and UNI event fields without
checking whether they are present. Truncated firmware responses can
therefore cause out-of-bounds reads.

Account for the shorter patch responses and validate all other receive
descriptors and UNI event payloads before accessing them.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fa29c486a455..bca753d8ce71 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -32,6 +32,17 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 		return -ETIMEDOUT;
 	}
+	if ((cmd == MCU_CMD(PATCH_SEM_CONTROL) ||
+	     cmd == MCU_CMD(PATCH_FINISH_REQ) ||
+	     cmd == MCU_CMD(CB_PATCH_SEM_CONTROL) ||
+	     cmd == MCU_CMD(CB_PATCH_FINISH_REQ)) &&
+	    skb->len < sizeof(*rxd) - 4 + sizeof(u8))
+		return -EINVAL;
+	if (cmd != MCU_CMD(PATCH_SEM_CONTROL) &&
+	    cmd != MCU_CMD(PATCH_FINISH_REQ) &&
+	    cmd != MCU_CMD(CB_PATCH_SEM_CONTROL) &&
+	    cmd != MCU_CMD(CB_PATCH_FINISH_REQ) && skb->len < sizeof(*rxd))
+		return -EINVAL;
 
 	rxd = (struct mt7925_mcu_rxd *)skb->data;
 	if (seq != rxd->seq) {
@@ -60,6 +71,9 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		   cmd == MCU_UNI_CMD(NAN)) {
 		struct mt7925_mcu_uni_event *event;
 
+		if (skb->len < sizeof(*rxd) + sizeof(*event))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt7925_mcu_uni_event *)skb->data;
 		ret = le32_to_cpu(event->status);
-- 
2.34.1


