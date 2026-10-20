Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53629606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qe5xcZfe;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fvZV49Pp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyA3JX14Q6WRUe8iSFtxvl8ukjUrydPdyqI0BYKCZIU=; b=Qe5xcZfeWXHRopotqD7s+EWelE
	4Knz4QqSdOxpHj7REX9k7QLhE3YBI/d9+Ey9KWm3L+5TNjc9G8JxAP0drruc4piJz+covNUVXFiSe
	PkQExRbLOKiGhTuGTR9/WBE3jjdnzOToXs2tpZwqjfFTf9lvVQjHQYRMOC+KmPiyzzSkfD2+Vx87n
	k5ZOtR1UaQUNXZUfXr0iECcL/rmVfgaPrIN0ZzSIS+lK2m/a939s32DDXvxtwON9HPsBa0/Qv6qdC
	QcaRNKWztOxegwhlY55cLOef0GBkWhyqBWeRkCU5tO/wMlBzCtE8ynUMOBrxBZd8RtzPadZ1feTK+
	632ZQbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzsJ-00000008iFT-3Y4z;
	Tue, 20 Oct 2026 02:46:51 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrc-00000008hgU-1Maa;
	Tue, 20 Oct 2026 02:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ly
	A3JX14Q6WRUe8iSFtxvl8ukjUrydPdyqI0BYKCZIU=; b=fvZV49PpCPWdpYt7uA
	OrBd3+Ny9esLFTnFO3oqsVu9c5JQ5iZc40jWKguf6NXBD/s3+4ijLG+t9EA1lvbz
	MuPrTH5bORD/0GGSuDkyjpMeUFsEhmOtSfg3WqMkA6g2vASoUX3KTK8W0a/HfjaJ
	VSUQ6baCAS9Uz2UTT/MVw+6No=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S4;
	Tue, 20 Oct 2026 10:45:50 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 02/11] wifi: mt76: mt7921: validate EEPROM response length
Date: Tue, 20 Oct 2026 10:45:34 +0800
Message-Id: <20261020024544.3101738-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW3tr15JFyxWF15AF13Jwb_yoWkZFg_ur
	1v9rn7Jr1UGw1UKr42kw13ZFZ0yay8A3W8ZrWrtrWYqFWUJrW7ur93ZrZ8GrZFkws2vF1U
	Cwn8Jay5X3sIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1XTmPUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR78N2rW1d6CNQAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194608_699033_91C3BD05 
X-CRM114-Status: UNSURE (   9.07  )
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

The EEPROM reader indexes the data array in a firmware response without
checking that the complete response structure is present. A truncated
response can therefore cause an out-of-bounds read.

Require the complete EEPROM response before indexing its data.

Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 782c8baaf776..ef6660653723 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -104,6 +104,10 @@ static int mt7921_mcu_read_eeprom(struct mt792x_dev *dev, u32 offset, u8 *val)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	res = (struct mt7921_mcu_eeprom_info *)skb->data;
 	*val = res->data[offset % MT7921_EEPROM_BLOCK_SIZE];
-- 
2.34.1


