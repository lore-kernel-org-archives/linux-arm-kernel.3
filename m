Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7360A2625
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zewp5gJU;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ys3yJNEl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uD9iLC9u0+i53WqbXenU4Sedkd6VmeyujwIgM/Ul8mg=; b=zewp5gJUoR5ISa+ISKjjLm7uzn
	V+9CMyjOwNz4q4RaJZK5xnLlE6+7z0bMUU9cw0j/92c3w/TgeHzxm0FJCxErsgfn+9EbhY8+ZoE9S
	+PVfb8yiwx8uuvq/+4nJe5fygBWBG26T2mjh7/h4TQ3VqCSsqAYKho0cHhGo2MQHwJl2CZcuySfQR
	g5+yWfwh1Yh/vY5DFDOll62UdScT8sOaCQuAaBcSRnXgT7oxx8/F8o5HrsiOh0MdbBGEqpHhVwjXP
	rqctzMxQDZJUnAnARPHYptQDd6NbgqFPRWgI2GbdwJK5310qLU1wMu4vGXIwX3LJ4pieFtQeT0WDY
	uPgQTleg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvS-00000008jNr-1Oz7;
	Tue, 20 Oct 2026 02:50:06 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvG-00000008jE1-3LdL;
	Tue, 20 Oct 2026 02:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uD
	9iLC9u0+i53WqbXenU4Sedkd6VmeyujwIgM/Ul8mg=; b=Ys3yJNElDXDx/8YhgS
	5kz6NqPdGdOB3IDzNisIIiXWme0srucIdVdUoxGdTKwxoj7V5Y14EkWjKQECDwkT
	WvVHRpgMjBSZ+aZgN2Ck8A/jaWsk6i0P79Bmv+aNl2WwMeWiJQmHFhaXP6NfEBDJ
	AFn6xfXhZhDKISWStm8xFLpis=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnr8C+1tZqMLhIBA--.5123S5;
	Tue, 20 Oct 2026 10:49:40 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Elwin Huang <s09289728096@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/7] wifi: mt76: mt7996: validate EEPROM response lengths
Date: Tue, 20 Oct 2026 10:49:29 +0800
Message-Id: <20261020024933.3205681-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024933.3205681-1-yaojiale02@163.com>
References: <20261020024933.3205681-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr8C+1tZqMLhIBA--.5123S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1xZr1UZrWrWw4rZrWrXwb_yoW5WFWfpF
	y3KFyjyr1rJr1kXr4SyFs2ya4Fg3WrWr13Kw43Wwn8W34aywn5AayFvFyvgr1YkrWUA3W8
	Gw4UtFnrGF90qrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7a9-UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQQ3cWrW1sScIQAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194955_199255_EB74D53D 
X-CRM114-Status: GOOD (  12.31  )
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

The EEPROM query reads fixed event fields and copies EFUSE or external
EEPROM data without checking the firmware response length. A truncated
response or an oversized external data length can cause out-of-bounds
reads.

Validate the fixed event, the requested EFUSE bytes, and both the
external data-length field and its payload before copying data.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Fixes: f456e1f56c4c ("wifi: mt76: add external EEPROM support for mt799x chipsets")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 1f7af6359dd7..eb868c2d5108 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4399,6 +4399,7 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_l
 	};
 	struct mt7996_mcu_eeprom_access_event *event;
 	struct sk_buff *skb;
+	size_t data_offset;
 	int ret, cmd;
 	u32 addr;
 
@@ -4424,9 +4425,14 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_l
 	if (ret)
 		return ret;
 
+	data_offset = offsetof(struct mt7996_mcu_eeprom_access_event, eeprom);
+	if (skb->len < data_offset) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	event = (struct mt7996_mcu_eeprom_access_event *)skb->data;
 	if (event->valid) {
-		u32 ret_len = le32_to_cpu(event->eeprom.ext_eeprom.data_len);
 		u32 block = mode == EEPROM_MODE_EXT ? MT7996_EXT_EEPROM_BLOCK_SIZE :
 						      MT7996_EEPROM_BLOCK_SIZE;
 
@@ -4444,16 +4450,35 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_l
 		case EEPROM_MODE_EFUSE:
 			if (!buf_len || buf_len > MT7996_EEPROM_BLOCK_SIZE)
 				buf_len = MT7996_EEPROM_BLOCK_SIZE;
+			if (skb->len - data_offset < buf_len) {
+				ret = -EINVAL;
+				break;
+			}
 
 			memcpy(buf, event->eeprom.efuse, buf_len);
 			break;
-		case EEPROM_MODE_EXT:
+		case EEPROM_MODE_EXT: {
+			u32 ret_len;
+
+			if (skb->len - data_offset < sizeof(__le32)) {
+				ret = -EINVAL;
+				break;
+			}
+
+			ret_len = le32_to_cpu(event->eeprom.ext_eeprom.data_len);
+			data_offset += sizeof(__le32);
+			if (ret_len > skb->len - data_offset) {
+				ret = -EINVAL;
+				break;
+			}
+
 			if (!buf_len || buf_len > MT7996_EXT_EEPROM_BLOCK_SIZE)
 				buf_len = MT7996_EXT_EEPROM_BLOCK_SIZE;
 
 			memcpy(buf, event->eeprom.ext_eeprom.data,
 			       ret_len < buf_len ? ret_len : buf_len);
 			break;
+		}
 		default:
 			ret = -EINVAL;
 			break;
@@ -4462,6 +4487,7 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_l
 		ret = -EINVAL;
 	}
 
+out:
 	dev_kfree_skb(skb);
 
 	return ret;
-- 
2.34.1


