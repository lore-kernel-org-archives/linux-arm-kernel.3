Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED235606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BMrx6Ylt;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N0AGkb2Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5rO9f1I5wxtaSzXVg3rcnKC09sTjMhhgv3WDJaewHGQ=; b=BMrx6YltxmCL5Y
	yZMedoAGcXiPeIP6cK6wbj3Ni6MgGKlxxbYNRbTDCgPraoBH7t9q0JA7lZjFbeXxu5VXLLRjNhxkc
	gjeiAUjmJljIUgmp2etva3kJi/XSFjl51ytQDeP4mI3nKdZvRojYQy+G+Egv2LcoKr+0hwtwYllbO
	HXYC7MVpI7pmW1iM/0iIUPOeBgo953H/EiFqNIuuoxzGxTPAIs7GHRmImiVrIovdOCbWmTm+AYL6L
	QwrxAjUVaHG5vlw9rtAa4hTOeI4ItIxvo4zofwFhAUKp+eJCwdsaPkoIiPJeXoHuCZ3t4zKartSn/
	RO767kYfCACtUdH7zLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvt4-00000006LHs-3huQ;
	Wed, 28 Oct 2026 05:07:46 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvsy-00000006LDx-0dNe;
	Wed, 28 Oct 2026 05:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5r
	O9f1I5wxtaSzXVg3rcnKC09sTjMhhgv3WDJaewHGQ=; b=N0AGkb2ZpAgmGY3bnn
	gkZQuCvT+qAmOY/UYO+9t8sIF00IHQTf6m8G0uDDurQg3OVW9SIw9vw6WXHC4Njp
	4Xe0jul65rV/9yezm3DPidD1fHA8DPFb4ZdQYXNUyWdTxXjwMTwhMVCNZndKJK4N
	Ftq1IN2yGOsiNP3lvYqIyNb8Q=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDn31cMg+FqswGRDQ--.35366S3;
	Wed, 28 Oct 2026 13:07:26 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/3] wifi: mt76: mt7921: validate NIC capability payload lengths
Date: Wed, 28 Oct 2026 13:07:20 +0800
Message-Id: <20261028050722.135598-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050722.135598-1-yaojiale02@163.com>
References: <20261028050722.135598-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn31cMg+FqswGRDQ--.35366S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4kJF15WFWDurWftw4kCrg_yoWrXFyfpF
	WYgay5CrWUGFsF9w4DAr4UAan0y3s5KrW3KFyrC3WFq3ZrCrn8AF4Iv342kr4aka4kur1a
	yF4jvan5WrnrXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWrWrUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg72MWrhgw73xwAA3x
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220740_570878_7C509725 
X-CRM114-Status: GOOD (  13.36  )
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

The NIC capability parser checks that each declared payload fits in the
skb, but it does not ensure that the payload is large enough for the
selected capability. A truncated firmware response can therefore make
the driver read beyond the current TLV while copying fixed-size fields or
parsing capability structures.

Validate every consumed payload before accessing it and reject the
response when a known capability is shorter than its fixed data.

Fixes: dab35009fc1c ("wifi: mt76: mt7921: move connac nic capability handling to mt7921")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 41 +++++++++++++++----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 25638c68c468..c960648b2b61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -521,8 +521,8 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	return ret;
 }
 
-static void mt7921_mcu_parse_tx_resource(struct mt76_dev *dev,
-					 struct sk_buff *skb)
+static bool mt7921_mcu_parse_tx_resource(struct mt76_dev *dev,
+					 struct sk_buff *skb, int len)
 {
 	struct mt76_sdio *sdio = &dev->sdio;
 	struct mt7921_tx_resource {
@@ -537,6 +537,9 @@ static void mt7921_mcu_parse_tx_resource(struct mt76_dev *dev,
 		u8 pad[3];
 	} __packed * tx_res;
 
+	if (len < sizeof(*tx_res))
+		return false;
+
 	tx_res = (struct mt7921_tx_resource *)skb->data;
 	sdio->sched.pse_data_quota = le32_to_cpu(tx_res->pse_data_quota);
 	sdio->pse_mcu_quota_max = le32_to_cpu(tx_res->pse_mcu_quota);
@@ -546,10 +549,12 @@ static void mt7921_mcu_parse_tx_resource(struct mt76_dev *dev,
 	sdio->sched.ple_data_quota = le32_to_cpu(tx_res->ple_data_quota);
 	sdio->sched.pse_page_size = le16_to_cpu(tx_res->pse_page_size);
 	sdio->sched.deficit = tx_res->pp_padding;
+
+	return true;
 }
 
-static void mt7921_mcu_parse_phy_cap(struct mt76_dev *dev,
-				     struct sk_buff *skb)
+static bool mt7921_mcu_parse_phy_cap(struct mt76_dev *dev,
+				     struct sk_buff *skb, int len)
 {
 	struct mt7921_phy_cap {
 		u8 ht;
@@ -571,12 +576,17 @@ static void mt7921_mcu_parse_phy_cap(struct mt76_dev *dev,
 		WF0_5G
 	};
 
+	if (len < sizeof(*cap))
+		return false;
+
 	cap = (struct mt7921_phy_cap *)skb->data;
 
 	dev->phy.antenna_mask = BIT(cap->nss) - 1;
 	dev->phy.chainmask = dev->phy.antenna_mask;
 	dev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
 	dev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
+
+	return true;
 }
 
 static int mt7921_mcu_get_nic_capability(struct mt792x_phy *mphy)
@@ -620,20 +630,30 @@ static int mt7921_mcu_get_nic_capability(struct mt792x_phy *mphy)
 
 		switch (le32_to_cpu(tlv->type)) {
 		case MT_NIC_CAP_6G:
+			if (len < sizeof(skb->data[0]))
+				goto invalid;
+
 			phy->cap.has_6ghz = skb->data[0];
 			break;
 		case MT_NIC_CAP_MAC_ADDR:
+			if (len < ETH_ALEN)
+				goto invalid;
+
 			memcpy(phy->macaddr, (void *)skb->data, ETH_ALEN);
 			break;
 		case MT_NIC_CAP_PHY:
-			mt7921_mcu_parse_phy_cap(phy->dev, skb);
+			if (!mt7921_mcu_parse_phy_cap(phy->dev, skb, len))
+				goto invalid;
 			break;
 		case MT_NIC_CAP_TX_RESOURCE:
-			if (mt76_is_sdio(phy->dev))
-				mt7921_mcu_parse_tx_resource(phy->dev,
-							     skb);
+			if (mt76_is_sdio(phy->dev) &&
+			    !mt7921_mcu_parse_tx_resource(phy->dev, skb, len))
+				goto invalid;
 			break;
 		case MT_NIC_CAP_CHIP_CAP:
+			if (len < sizeof(mphy->chip_cap))
+				goto invalid;
+
 			memcpy(&mphy->chip_cap, (void *)skb->data, sizeof(u64));
 			break;
 		default:
@@ -641,6 +661,11 @@ static int mt7921_mcu_get_nic_capability(struct mt792x_phy *mphy)
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
 
-- 
2.34.1


