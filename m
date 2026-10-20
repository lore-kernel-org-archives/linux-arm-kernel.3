Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A962B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rrz9VNPX;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UXYUz7po
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qG7JtnRczNxt1kKLbkWdEV0AOLzF5wKtMwKHYhdEecc=; b=Rrz9VNPXiMFtRYHA//aPEqEPva
	6t/lqc+BrkfyunDpgK6mvK+Rqy06K2l6mSfLvDkD9hn0ivnQAVcbePte4LHftVhH5NKSWqOLjsrLd
	mCiLoawAQXFrlMf+w4FizEM2IaoMJ39nzhFNSrCvwBAaWO7TSeTYQPvRQoz3jqalGRlZXLsqflWYk
	tbnyY1BPiLHgNsAXvPbaLjMvOazVukSoE502dC9jc/YM8sQWNHb2ioKv65ccfcaREMYjlvjUIlQtr
	qdTT315eoG7jx9QXwPrV1OcgcR1dpVCq4RTD6fwrfvFWuDrdADMlrI5vC52y/aVOsOTz6xPlayoBJ
	lVPPafOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzro-00000008hrI-3f6Y;
	Tue, 20 Oct 2026 02:46:20 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrZ-00000008hfP-3EDo;
	Tue, 20 Oct 2026 02:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qG
	7JtnRczNxt1kKLbkWdEV0AOLzF5wKtMwKHYhdEecc=; b=UXYUz7poemjlMN23To
	m6wrUyhgSoSVHHRAoRUS/d7WnKTPTmkz3slpM6wEOjY6eBGD9UtXB5P7RqM0Yh0I
	jHSBuhgRofCvFinlCWmhjtQb20oqvHU25l1Q5MQs5NmkjiKHkUZtLJjyEUqIzdPd
	eYNbwoW9XwnkaSL7qORyho6zE=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S8;
	Tue, 20 Oct 2026 10:45:55 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Rong Yan <rong.yan@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Nelson Yu <nelson.yu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 06/11] wifi: mt76: mt7925: validate register query response
Date: Tue, 20 Oct 2026 10:45:38 +0800
Message-Id: <20261020024544.3101738-7-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rGryUXF4xCr18uw4DArb_yoW8WFyUpa
	yUK3y5Ar1UJrsrXw4xCan3ZF43K3Z3KF17CFWxWwn5W3s5Aw1rA3WYvFyYqr43CFZYkrW8
	Xr4qqFZxurnrWaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1zuXUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wP9OGrW1eN6KgAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194606_172743_1913F483 
X-CRM114-Status: GOOD (  11.54  )
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The register query reads either a basic or RF register response without
checking its length. A truncated firmware response can cause an
out-of-bounds read.

Calculate the response size for the selected register type and reject
short responses before reading the value.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index bca753d8ce71..ce860e63a108 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -113,7 +113,7 @@ int mt7925_mcu_regval(struct mt792x_dev *dev, u32 regidx, u32 *val, bool set)
 		};
 	} __packed * res, req;
 	struct sk_buff *skb;
-	int ret;
+	int len, ret;
 
 	if (u32_get_bits(regidx, MT_RF_REG_HDR) == RF_REG_PREFIX) {
 		req.rf_reg.tag = cpu_to_le16(UNI_CMD_ACCESS_RF_REG_BASIC);
@@ -138,6 +138,17 @@ int mt7925_mcu_regval(struct mt792x_dev *dev, u32 regidx, u32 *val, bool set)
 	if (ret)
 		return ret;
 
+	len = sizeof(res->__rsv);
+	if (u32_get_bits(regidx, MT_RF_REG_HDR) == RF_REG_PREFIX)
+		len += sizeof(res->rf_reg);
+	else
+		len += sizeof(res->reg);
+
+	if (skb->len < len) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
+
 	res = (void *)skb->data;
 	if (u32_get_bits(regidx, MT_RF_REG_HDR) == RF_REG_PREFIX)
 		*val = le32_to_cpu(res->rf_reg.data);
-- 
2.34.1


