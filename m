Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03728606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lYnR4wnh;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MIfIiYqP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs8cAxhySWBLyThS4ZeIA5H/vVY6IeEZqZKTZ+G87Dk=; b=lYnR4wnhccPdRiGGJuLihhBpsZ
	VpDZ6YeBLQCt5av7U4OGKHWjg8rSt7atpOzmHk5C3XbTit36zIu/koFMbhvBYBfICI1OoOu+85tX5
	oqIcuAcqz+V4WO2wQJkt4eaEr33iJ5GsIs6GRC2HN7pWlad2RIwPyei5A4B1HMGWdllcf3jxF72a4
	Fp0j5aXF81cgP3y1BQrIFb9qnxLIysB2x1zECecQiNDm6e9HOD4WN2Jqm/wgwycpJJ3HX5QI2XtWn
	WeCol8aQ/WDpRSFo1vZYqN/yVq++srjp4CPSGyzr71NYhNiJHc8+nAJyne25ucOQ6bTFzglHcVEZY
	sK5MbGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrb-00000008hh6-1PAI;
	Tue, 20 Oct 2026 02:46:07 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrX-00000008hfB-1HQA;
	Tue, 20 Oct 2026 02:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qs
	8cAxhySWBLyThS4ZeIA5H/vVY6IeEZqZKTZ+G87Dk=; b=MIfIiYqPZ+OUUruick
	eS45VmzaiTWCBPK7QMmD7e+7KqAAc7jLH3ZZ0G7QtVAeSQIPghwaOyZMJ3etO+4V
	9fG6Vs5PuFkeBlImlkYS4KycTD2Ea0RI4LPjFmAySSEEOg6hUPEPpl1zcyarIcf9
	P5IeNUi7ooKTFNU9SmWtv6A9g=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S3;
	Tue, 20 Oct 2026 10:45:48 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Soul Huang <Soul.Huang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 01/11] wifi: mt76: mt7921: validate MCU response lengths
Date: Tue, 20 Oct 2026 10:45:33 +0800
Message-Id: <20261020024544.3101738-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXryDWFy7CF17tF18GF13twb_yoW5XF15pF
	WYgas8KryUJrsFgw109F4kAa15twn5JFnrtFy8uwnYqrW3A3Z8GF4F9FyYvr15tFZ5CF1r
	Jw4vq3ZxWrWDXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHUDXUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhz8N2rW1dyLCQAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194603_683415_DFC157D5 
X-CRM114-Status: UNSURE (   9.34  )
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

The MCU parser reads receive descriptor and command payload fields
without checking whether they are present. Truncated firmware responses
can therefore cause out-of-bounds reads.

Validate the descriptor and each command-specific payload before
accessing or removing it from the skb.

Fixes: 1c099ab44727 ("mt76: mt7921: add MCU support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 40546005c743..782c8baaf776 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -26,6 +26,13 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 		return -ETIMEDOUT;
 	}
+	if ((cmd == MCU_CMD(PATCH_SEM_CONTROL) ||
+	     cmd == MCU_CMD(PATCH_FINISH_REQ)) &&
+	    skb->len < sizeof(*rxd) - 4 + sizeof(u8))
+		return -EINVAL;
+	if (cmd != MCU_CMD(PATCH_SEM_CONTROL) &&
+	    cmd != MCU_CMD(PATCH_FINISH_REQ) && skb->len < sizeof(*rxd))
+		return -EINVAL;
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
 	if (seq != rxd->seq)
@@ -36,6 +43,9 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		skb_pull(skb, sizeof(*rxd) - 4);
 		ret = *skb->data;
 	} else if (cmd == MCU_EXT_CMD(THERMAL_CTRL)) {
+		if (skb->len < sizeof(*rxd) + 4 + sizeof(__le32))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd) + 4);
 		ret = le32_to_cpu(*(__le32 *)skb->data);
 	} else if (cmd == MCU_UNI_CMD(DEV_INFO_UPDATE) ||
@@ -46,6 +56,9 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		   cmd == MCU_UNI_CMD(SUSPEND)) {
 		struct mt76_connac_mcu_uni_event *event;
 
+		if (skb->len < sizeof(*rxd) + sizeof(*event))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt76_connac_mcu_uni_event *)skb->data;
 		ret = le32_to_cpu(event->status);
@@ -55,12 +68,18 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 	} else if (cmd == MCU_CE_QUERY(REG_READ)) {
 		struct mt76_connac_mcu_reg_event *event;
 
+		if (skb->len < sizeof(*rxd) + sizeof(*event))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt76_connac_mcu_reg_event *)skb->data;
 		ret = (int)le32_to_cpu(event->val);
 	} else if (cmd == MCU_EXT_CMD(WF_RF_PIN_CTRL)) {
 		struct mt7921_wf_rf_pin_ctrl_event *event;
 
+		if (skb->len < sizeof(*rxd) + sizeof(*event))
+			return -EINVAL;
+
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt7921_wf_rf_pin_ctrl_event *)skb->data;
 		ret = (int)event->result;
-- 
2.34.1


