Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD1606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vk22MRfz;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VX7JUUPE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ASGar675lziP9Lhne+zcfjAyNbEwAZOOXLcfTSeQQE=; b=Vk22MRfzbtyhjss6lCdli6MVcG
	b1P/vp8CrwwEWhS3bdUTEr/lJnNl6WNA0LwlCcK0TWx8rIZgDbPIRZ2bte/gfzgj3OFXekI5NLzXO
	Slz4otDmjmRIi9gaF75IMdZN0MeolzICRRT+HqrO6ZBWL8LPkrym2xSNa79GsHoOm1aOV/H5SJnN+
	Cw+Q8+6nEOwz/UCs2pvoLUnjVsw5nb8N3+RzQlJR5DjdDOqNkZ4egJFHPOiZ91GsLA3FiM+C6QJmS
	hylO9E5EccpPMl0uN4QqA39yZx0M1DuftNBwRBnPwEq1Gdq////Pk8ppcX7i/UNylyOL61fXjiQGD
	rYNW1idA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvF-00000008jF8-3ImX;
	Tue, 20 Oct 2026 02:49:53 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvC-00000008jDx-321Q;
	Tue, 20 Oct 2026 02:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7A
	SGar675lziP9Lhne+zcfjAyNbEwAZOOXLcfTSeQQE=; b=VX7JUUPE9xnLdJKjsX
	LI090qXDvHxi4ugkSicQnypg6OEDAibZAdFmluCovYljojP5Rop+Kw07mhwKJ66h
	fmoHy3/Bj6a/mGElxinKTB8Y7/1ALeZFBUivAcSlMzjXhvlQKA9ukRAyKrgmZn+p
	JhHQrtNQflIr9mMijevkbDFQc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnr8C+1tZqMLhIBA--.5123S4;
	Tue, 20 Oct 2026 10:49:39 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/7] wifi: mt76: mt7996: bound IE countdown event parsing
Date: Tue, 20 Oct 2026 10:49:28 +0800
Message-Id: <20261020024933.3205681-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024933.3205681-1-yaojiale02@163.com>
References: <20261020024933.3205681-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr8C+1tZqMLhIBA--.5123S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr15Xw1fZr1DXryUurWUtwb_yoW5CrWrpa
	4j9a4Fq3ykAr4UWr18ArWvyay5twn5K3Way3yvyws0qFn2kr1kJF48XFyjvr4Yka43uw17
	Xr1j9wnrCFn5Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_UUbUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wM2cGrW1sOS6gAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194951_130214_FBD1A874 
X-CRM114-Status: GOOD (  11.02  )
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

The IE countdown handler reads its fixed header before checking the skb
length. Its TLV loop also accepts lengths smaller than the TLV header or
larger than the remaining data and reads the event payload unchecked.

Validate the fixed fields and constrain every TLV and known countdown
payload to the response buffer.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index d661ff1e4a20..1f7af6359dd7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -489,12 +489,20 @@ mt7996_mcu_ie_countdown(struct mt7996_dev *dev, struct sk_buff *skb)
 		u8 band;
 		u8 rsv[3];
 	};
-	struct mt7996_mcu_rxd *rxd = (struct mt7996_mcu_rxd *)skb->data;
-	const char *data = (char *)&rxd[1], *tail;
-	struct header *hdr = (struct header *)data;
-	struct tlv *tlv = (struct tlv *)(data + 4);
+	struct mt7996_mcu_rxd *rxd;
+	const char *data, *tail;
+	struct header *hdr;
+	struct tlv *tlv;
 	struct mt7996_mcu_countdown_notify *event;
 	struct mt7996_mcu_countdown_data cdata;
+	u16 tlv_len;
+
+	if (skb->len < sizeof(*rxd) + sizeof(*hdr))
+		return;
+
+	rxd = (struct mt7996_mcu_rxd *)skb->data;
+	data = (char *)&rxd[1];
+	hdr = (struct header *)data;
 
 	if (hdr->band >= ARRAY_SIZE(dev->mt76.phys))
 		return;
@@ -505,18 +513,29 @@ mt7996_mcu_ie_countdown(struct mt7996_dev *dev, struct sk_buff *skb)
 
 	tail = skb->data + skb->len;
 	data += sizeof(*hdr);
-	while (data + sizeof(*tlv) < tail && le16_to_cpu(tlv->len)) {
-		event = (struct mt7996_mcu_countdown_notify *)tlv->data;
-
-		cdata.omac_idx = event->omac_idx;
+	while (tail - data >= sizeof(*tlv)) {
+		tlv = (struct tlv *)data;
+		tlv_len = le16_to_cpu(tlv->len);
+		if (tlv_len < sizeof(*tlv) || tlv_len > tail - data)
+			return;
 
 		switch (le16_to_cpu(tlv->tag)) {
 		case UNI_EVENT_IE_COUNTDOWN_CSA:
+			if (tlv_len < sizeof(*tlv) + sizeof(*event))
+				return;
+
+			event = (struct mt7996_mcu_countdown_notify *)tlv->data;
+			cdata.omac_idx = event->omac_idx;
 			ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
 					IEEE80211_IFACE_ITER_RESUME_ALL,
 					mt7996_mcu_csa_finish, &cdata);
 			break;
 		case UNI_EVENT_IE_COUNTDOWN_BCC:
+			if (tlv_len < sizeof(*tlv) + sizeof(*event))
+				return;
+
+			event = (struct mt7996_mcu_countdown_notify *)tlv->data;
+			cdata.omac_idx = event->omac_idx;
 			ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
 					IEEE80211_IFACE_ITER_RESUME_ALL,
 					mt7996_mcu_cca_finish, &cdata);
@@ -525,8 +544,7 @@ mt7996_mcu_ie_countdown(struct mt7996_dev *dev, struct sk_buff *skb)
 			break;
 		}
 
-		data += le16_to_cpu(tlv->len);
-		tlv = (struct tlv *)data;
+		data += tlv_len;
 	}
 }
 
-- 
2.34.1


