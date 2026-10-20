Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D1606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gVl9tg69;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mxGw2sQB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RN3k8czzMRgmOq/HRFi3+tQnogP9QGjQCyHmUCQ+VUg=; b=gVl9tg69IMrN/RGhp4U04JYkAC
	zDrRyCQlqtp/hlonSZpE78KrVrLSRopn0BlLs8Qzd/lQP/RYh6mdBikNt+YWnQoHitNGIcpI3RdWR
	4thhjELJRMEve//NTN/29JD1ET2Cbo/mRDXMtA6Pg5oq/z/szOutXLRWcwd49We2CBPafGFZUG5hW
	LkTBA9uDvH/hhSi+s+IyARBGkMNa65V6MIFogIrjL7JSKze3YdHbg7FvVkCYUZK1TvAtN/xdzjCBZ
	BJ8rwx4F4nrjsyK9MUNRzIlGEl0qxfahLiq2F+/rCrC7Kv/ZE7tciZ5L6RuKCEDaCrsdPnRF8tyJL
	S5opCLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzs9-00000008i7O-2s2W;
	Tue, 20 Oct 2026 02:46:41 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrc-00000008hgB-105l;
	Tue, 20 Oct 2026 02:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=RN
	3k8czzMRgmOq/HRFi3+tQnogP9QGjQCyHmUCQ+VUg=; b=mxGw2sQB8hYJH4gYCq
	2y4+hkmlB0hxn0pMepd5zM3sa7gANUfKHPDFUk4XIvbM0B51vDMd6CIxr/lVIOEW
	ehDF12aKnU4q8pZf/Qr6WpplhraUTr7OnxhBx03JOvMHTtN61a0teSjPmIWpkE4/
	+Kr/JD49adTnwyQe4Y5MUaTr8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S11;
	Tue, 20 Oct 2026 10:45:59 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	Mingyen Hsieh <mingyen.hsieh@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 09/11] wifi: mt76: mt7925: validate TX power response length
Date: Tue, 20 Oct 2026 10:45:41 +0800
Message-Id: <20261020024544.3101738-10-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S11
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF45uryktFy3XryDtFy3CFg_yoWkWFcE9r
	4v9r97Jr18G3yDtr42kF43WFZFy3y8X3WkArWrtrWrWa17J3y7Cr9ayrsxWr9ruws7ZF45
	Gwn8Aa4UX34SgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbAsqtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Af+OWrW1eccuwAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194608_645561_D57A5EFF 
X-CRM114-Status: UNSURE (   9.11  )
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

The TX power query copies a complete event payload without checking the
firmware response length. A truncated response can cause an
out-of-bounds read.

Require the complete TX power event before copying its payload.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d768002c64c2..f37d2a8eafe6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2287,6 +2287,10 @@ int mt7925_get_txpwr_info(struct mt792x_dev *dev, u8 band_idx, struct mt7925_txp
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*event)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	event = (struct mt7925_txpwr_event *)skb->data;
 	memcpy(txpwr, &event->txpwr, sizeof(event->txpwr));
-- 
2.34.1


