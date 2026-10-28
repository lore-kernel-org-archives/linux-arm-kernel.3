Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8470606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qwnHjZaF;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nrNkqtu8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MTIAVEb2k2hh86gcLrq0Ks4EmnWvWMm36zR/JvnNe0E=; b=qwnHjZaFumngcV
	NbyqaVWSQ3y/kosNOPGLrx2LyrrbxfxqIN3+2z85+L19hozxZzr9ZBgxCp2AIjvY/gfxmkpXUOY99
	SjqLiDuDScOaDZxFba3mqMsbRl33Yr02AS+S9hXwVz2aq03/ptbcjndreOCcneVTTLvDSzNc4RrHO
	o5XxWcGmYfBpB6NyUh0agbr8UsK/qF1u8hZVxGhh13VGnan/d7BtBbCtY+norWbNwHDLJPFWpER7d
	cwhW4l799D6sSpKz0yaQniEWZ04d15rc6C3bsxhYaSkE8A1X+Ew+2XDO4BhVUztdZy5GLt8P3f7r2
	ldTxCp3oSl7KEVF4ggUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvt5-00000006LIf-0N5a;
	Wed, 28 Oct 2026 05:07:47 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvt1-00000006LFm-2QqL;
	Wed, 28 Oct 2026 05:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MT
	IAVEb2k2hh86gcLrq0Ks4EmnWvWMm36zR/JvnNe0E=; b=nrNkqtu8fhkkFEswyo
	5jC53CibVwNMeuTwwxIPK5GhoGBJ5QhERYZUqAh3NQg6svcqL+1EERLpf3jlDmSE
	uh56lqO5C0w8K95PS9/wQeWbUoRmDicQkKooX4LxHUDku7w9wzO66RhNSEeIYu31
	Z9qI5QEFvp3KltohOrzo2Fvmw=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDn31cMg+FqswGRDQ--.35366S5;
	Wed, 28 Oct 2026 13:07:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Rong Yan <rong.yan@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 3/3] wifi: mt76: mt7925: validate NIC capability payload lengths
Date: Wed, 28 Oct 2026 13:07:22 +0800
Message-Id: <20261028050722.135598-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050722.135598-1-yaojiale02@163.com>
References: <20261028050722.135598-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn31cMg+FqswGRDQ--.35366S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF17Kr4xJFyxZr15XrWfAFb_yoWrJr4Upa
	yagFW5Kry8trsrWw4Iyw4fArWay3s8Kw47JFyfJwn0vws7Awn5Ga18Z34vvr1ak395ur1I
	vr4UtFn8W34DuF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwb18UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xH3MmrhgxHxmgAA3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220743_935765_1B682BE2 
X-CRM114-Status: GOOD (  13.39  )
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

The NIC capability parser only checks whether a declared TLV length fits
in the skb. It does not reject lengths shorter than the TLV header or
ensure that known payloads contain the fields consumed by the driver. A
truncated firmware response can therefore stall the parser on a zero
length TLV or cause out-of-bounds reads from fixed-size payloads.

Reject undersized TLVs and validate every known payload before accessing
it.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 43 +++++++++++++++----
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index c612fda55eb7..41138203ada2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1039,8 +1039,8 @@ int mt7925_mcu_get_temperature(struct mt792x_phy *phy)
 	return temperature;
 }
 
-static void
-mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
+static bool
+mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data, int len)
 {
 	struct mt76_phy *mphy = &dev->mt76.phy;
 	struct mt76_dev *mdev = mphy->dev;
@@ -1064,16 +1064,21 @@ mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
 		WF0_5G
 	};
 
+	if (len < sizeof(*cap))
+		return false;
+
 	cap = (struct mt7925_mcu_phy_cap *)data;
 
 	mdev->phy.antenna_mask = BIT(cap->nss) - 1;
 	mdev->phy.chainmask = mdev->phy.antenna_mask;
 	mdev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
 	mdev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
+
+	return true;
 }
 
-static void
-mt7925_mcu_parse_eml_cap(struct mt792x_dev *dev, char *data)
+static bool
+mt7925_mcu_parse_eml_cap(struct mt792x_dev *dev, char *data, int len)
 {
 	struct mt7925_mcu_eml_cap {
 		u8 rsv[4];
@@ -1081,9 +1086,14 @@ mt7925_mcu_parse_eml_cap(struct mt792x_dev *dev, char *data)
 		u8 rsv2[6];
 	} __packed * cap;
 
+	if (len < sizeof(*cap))
+		return false;
+
 	cap = (struct mt7925_mcu_eml_cap *)data;
 
 	dev->phy.eml_cap = le16_to_cpu(cap->eml_cap);
+
+	return true;
 }
 
 static int
@@ -1121,36 +1131,53 @@ mt7925_mcu_get_nic_capability(struct mt792x_dev *dev)
 
 	for (i = 0; i < le16_to_cpu(hdr->n_element); i++) {
 		struct tlv *tlv = (struct tlv *)skb->data;
-		int len;
+		int data_len, len;
 
 		if (skb->len < sizeof(*tlv))
 			break;
 
 		len = le16_to_cpu(tlv->len);
-		if (skb->len < len)
+		if (len < sizeof(*tlv) || skb->len < len)
 			break;
+		data_len = len - sizeof(*tlv);
 
 		switch (le16_to_cpu(tlv->tag)) {
 		case MT_NIC_CAP_6G:
+			if (len < sizeof(*tlv) + sizeof(tlv->data[0]))
+				goto invalid;
+
 			mphy->cap.has_6ghz = !!tlv->data[0];
 			break;
 		case MT_NIC_CAP_MAC_ADDR:
+			if (len < sizeof(*tlv) + ETH_ALEN)
+				goto invalid;
+
 			memcpy(mphy->macaddr, (void *)tlv->data, ETH_ALEN);
 			break;
 		case MT_NIC_CAP_PHY:
-			mt7925_mcu_parse_phy_cap(dev, tlv->data);
+			if (!mt7925_mcu_parse_phy_cap(dev, tlv->data, data_len))
+				goto invalid;
 			break;
 		case MT_NIC_CAP_CHIP_CAP:
+			if (len < sizeof(*tlv) + sizeof(__le64))
+				goto invalid;
+
 			dev->phy.chip_cap = le64_to_cpu(*(__le64 *)tlv->data);
 			break;
 		case MT_NIC_CAP_EML_CAP:
-			mt7925_mcu_parse_eml_cap(dev, tlv->data);
+			if (!mt7925_mcu_parse_eml_cap(dev, tlv->data, data_len))
+				goto invalid;
 			break;
 		default:
 			break;
 		}
 		skb_pull(skb, len);
 	}
+
+	goto out;
+
+invalid:
+	ret = -EINVAL;
 out:
 	dev_kfree_skb(skb);
 	return ret;
-- 
2.34.1


