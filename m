Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AF6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D5Rngr0p;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UVUf0h9l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=datRhPKvUt8Wm3BSwDl6dFeqU17AfptMGzHaScRNqKs=; b=D5Rngr0pvLy6Ll3HB7B/ajeKn7
	hoPJXqOv92dN67OEvSp8R8fqE/37gJnOt2RofvR5S+9MCg2r+90y1v+H1JVCwsT6rzf2JKHWW55t/
	6KQW+5W+3WADbRQleLV1EV0sVl6RMoPysqQX0VOicz/mHIHLtDbC9slnDJl0ad7Zm3YV+6BRP3W4y
	lgDNnhaAiXTrZc0FkRBHWPLIoxuvPnl2BWNjAp0upj38aW8dgn9yNsvDjoGCklOnh+6YuBBOL+ynx
	q2EDwNtYUGjaKHqQ7GQDQFtclzeYbPpY+J/Suc2m8NdgIzEFr5a00KosBq+Zqzsmrv+1l184nG+5x
	DTZdihuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrk-00000008hoT-36HF;
	Tue, 20 Oct 2026 02:46:16 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrY-00000008hfF-18wY;
	Tue, 20 Oct 2026 02:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=da
	tRhPKvUt8Wm3BSwDl6dFeqU17AfptMGzHaScRNqKs=; b=UVUf0h9l1rqCxWV+ou
	TQMAA0aj0AtvHKUeLPukGq5Dye1+QxBBUOZ+R+XK7d5ZRA4WkPKmqFWPwasaWQSP
	x4aZoSFcQqkZKBa0cxd8xl4JAyEgpMFsAjpIQPxpQiH2HDNsYBMqoNflg+wgnD6U
	/2XZDzhHBTDDwPT/pYHPUZQ9w=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S5;
	Tue, 20 Oct 2026 10:45:51 +0800 (CST)
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
Subject: [PATCH 03/11] wifi: mt76: mt7921: reject malformed TX power responses
Date: Tue, 20 Oct 2026 10:45:35 +0800
Message-Id: <20261020024544.3101738-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWfXF1fXr1fJr13WrWrAFb_yoW8Gryfpa
	y0gayYkr4UGr4vqw1rAF4kAFySyan5KF13GFyruwn5WryfJrn0kF4F9Fyjqr4Yya1vkF1f
	Jr4YqF9xGr9Yv37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7J5rUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR-8N2rW1d+CUgAA3-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194604_694522_86CD0C9E 
X-CRM114-Status: GOOD (  10.54  )
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

mt7921_get_txpwr_info() only warns when the firmware length differs from
the skb length and then copies the response anyway. It also reads the
length field before ensuring that the response header is present.

Require the complete event and reject a mismatched firmware length
before copying the TX power data.

Fixes: ea29acc97c55 ("mt76: mt7921: add dumping Tx power table")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index ef6660653723..96e5e13d3c47 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1167,8 +1167,17 @@ int mt7921_get_txpwr_info(struct mt792x_dev *dev, struct mt7921_txpwr *txpwr)
 	if (ret)
 		return ret;
 
+	if (skb->len < sizeof(*event)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
+
 	event = (struct mt7921_txpwr_event *)skb->data;
-	WARN_ON(skb->len != le16_to_cpu(event->len));
+	if (skb->len != le16_to_cpu(event->len)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
+
 	memcpy(txpwr, &event->txpwr, sizeof(event->txpwr));
 
 	dev_kfree_skb(skb);
-- 
2.34.1


