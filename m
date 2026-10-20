Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C111D60A262E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ktofxhw8;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=W2T3g/MP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNTKqv6h3K/O8eqrjNbseAaayL6xDS0BmfNpiSU5B9c=; b=ktofxhw8XYGNGBIaGf4nHZL0st
	dgbJNqOccK3eGr9SlDV6d56xGd5ktXnkpM06I/0XbAWfY6FFcvgnxcXXUylUNBfwvaE3PXz4xLhjO
	c9vPR87yh3uzO+X5XGUzLkJjKPnqo/W9t4bYX/Y00pLWbcZjW/VB/jQXexoBlaJU6Mb1PXxmUD05d
	h9nnuc7tArVZrZEiYxjIEapnqUJ5f48VKVaHeQ8jkS2b/Q64EO63muusX17yiDSrBJu7DEWGQk6UP
	sLtFcVdnb6P1a1o8Xu9PSIQ+VN0o0V3AQldAnu1bPOu2FRLbH/G3Ov/QXDT90TwN/AWw1pNrpHMAR
	N7HRTfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzsW-00000008iUL-2vIN;
	Tue, 20 Oct 2026 02:47:04 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzsP-00000008iIw-07zv;
	Tue, 20 Oct 2026 02:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rN
	TKqv6h3K/O8eqrjNbseAaayL6xDS0BmfNpiSU5B9c=; b=W2T3g/MPjsmCTo1wW9
	uT1Jec/l5kIUPEywG3xThrVOcLdcF4dmXo1jMMuv18FydzSmD6PeYZHk6Rk2oTzL
	AslAd+mz9Qea6MgO6YE/egVIrp+fyEr0RG+8GUpeTipUKbl496bESkU/IxTDV9wV
	As6/e5IGP3PRV1aRZpO9H+zEo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_9AW1tZqr10qBA--.44565S2;
	Tue, 20 Oct 2026 10:46:47 +0800 (CST)
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
Subject: [PATCH 11/11] wifi: mt76: mt792x: bound firmware release-info parsing
Date: Tue, 20 Oct 2026 10:46:44 +0800
Message-Id: <20261020024645.3130280-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_9AW1tZqr10qBA--.44565S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAryUtFy8KFWrur4furW3KFg_yoW5ur48pa
	y5Kay2yr43Jrn8Ww15Ar48Zan3Awn5Ka15CrZIk34Svrn3trn8uF409a40vrWayw4xtr1Y
	grsaqF1xZr1DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6mh7UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRcLRWrW1heIhAAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194657_456554_9EA8ABA0 
X-CRM114-Status: GOOD (  12.63  )
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

mt792x_get_offload_capability() derives region and release-info pointers
from firmware-provided counts and lengths without keeping them within
the firmware image. A malformed image can therefore cause out-of-bounds
reads while locating or walking the feature records.

Validate the region table, accumulated region lengths, release-info
range, each record, its padding, and the feature payload before reading
them.

Fixes: e8a264ccd2de ("wifi: mt76: mt7921: move init shared code in mt792x-lib module")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 44 ++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 0ad33f74c228..feab3abcc1dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -862,9 +862,10 @@ mt792x_get_offload_capability(struct device *dev, const char *fw_wm)
 {
 	const struct mt76_connac2_fw_trailer *hdr;
 	struct mt792x_realease_info *rel_info;
+	const u8 *data, *end, *fw_end;
 	const struct firmware *fw;
-	int ret, i, offset = 0;
-	const u8 *data, *end;
+	size_t offset = 0;
+	int ret, i;
 	u8 offload_caps = 0;
 
 	ret = request_firmware(&fw, fw_wm, dev);
@@ -872,41 +873,72 @@ mt792x_get_offload_capability(struct device *dev, const char *fw_wm)
 		return ret;
 
 	if (!fw || !fw->data || fw->size < sizeof(*hdr)) {
-		dev_err(dev, "Invalid firmware\n");
-		goto out;
+		goto invalid;
 	}
 
 	data = fw->data;
 	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
+	if (hdr->n_region > (fw->size - sizeof(*hdr)) /
+			    sizeof(struct mt76_connac2_fw_region))
+		goto invalid;
+
+	fw_end = (const u8 *)hdr -
+		 hdr->n_region * sizeof(struct mt76_connac2_fw_region);
 
 	for (i = 0; i < hdr->n_region; i++) {
 		const struct mt76_connac2_fw_region *region;
+		u32 region_len;
 
 		region = (const void *)((const u8 *)hdr -
 					(hdr->n_region - i) * sizeof(*region));
-		offset += le32_to_cpu(region->len);
+		region_len = le32_to_cpu(region->len);
+		if (region_len > fw_end - fw->data - offset)
+			goto invalid;
+
+		offset += region_len;
 	}
 
+	if (fw_end - fw->data - offset < 16 + sizeof(*rel_info))
+		goto invalid;
+
 	data += offset + 16;
 	rel_info = (struct mt792x_realease_info *)data;
 	data += sizeof(*rel_info);
+	if (le16_to_cpu(rel_info->len) > fw_end - data)
+		goto invalid;
+
 	end = data + le16_to_cpu(rel_info->len);
 
 	while (data < end) {
+		u16 len;
+
+		if (end - data < sizeof(*rel_info))
+			goto invalid;
+
 		rel_info = (struct mt792x_realease_info *)data;
 		data += sizeof(*rel_info);
+		len = le16_to_cpu(rel_info->len);
+		if (len > end - data || rel_info->pad_len > end - data - len)
+			goto invalid;
 
 		if (rel_info->tag == MT792x_FW_TAG_FEATURE) {
 			struct mt792x_fw_features *features;
 
+			if (len < sizeof(*features))
+				goto invalid;
+
 			features = (struct mt792x_fw_features *)data;
 			offload_caps = features->data;
 			break;
 		}
 
-		data += le16_to_cpu(rel_info->len) + rel_info->pad_len;
+		data += len + rel_info->pad_len;
 	}
 
+	goto out;
+
+invalid:
+	dev_err(dev, "Invalid firmware\n");
 out:
 	release_firmware(fw);
 
-- 
2.34.1


