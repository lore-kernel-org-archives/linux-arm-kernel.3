Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D50CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 21:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+GFxQErCvWj4PbtQGhJ+tJMGMSzlUWRYZ+DV6Ypzug=; b=O9VrVzWhJbReqmzFeZTJPfWuYh
	2pSPYJ6qxG7KGG8FIbr4EdKCPmec/7ZZ2FGPiJNO0K4IZN6w1eWnknSOFeGDKkFoYq5E5Xwksuawp
	5qgcWBXmcdloa2T6aLbLonUDZcjjZ8vKkKZg2W0XJZ90eYPy1VjnlaRyQVZ8yNZaHe0T9lrkfSQ+Z
	hQ4bQ6gWeLGEd/BCGVihgRFS5d3JrVgymkobDbQ2D5Nf/PHzhNYrloeNANfp2+I6nZYNYHpTna2MF
	YMGAZ6HQBdlMqM0Pv/lIvHZOG/kKhamRVAPuP1xNl5/4Z4vZzpqohhnr9ch0q09Ha88SFf9ElHXkN
	G595mSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Aja-0000000EtJr-2Igf;
	Tue, 23 Sep 2025 21:39:38 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1AjY-0000000EtJG-30UQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 21:39:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758663564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p+GFxQErCvWj4PbtQGhJ+tJMGMSzlUWRYZ+DV6Ypzug=;
	b=IFFn5IiOy9Uc88PgON7sTpVx0lyqFk8K50yLPv3yQe2AojM4EmCPbgBoK2OUeOuIZoGZXz
	ZOIRBsXpTG9djL6zo3e4j2apoX5CNKoMOrNCzkh0OM2TFSsaP4q4S+EVZD7OfM1JuU5VVb
	4LMpPBMuVcUDyhknP9EEGvu1GgufzMM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless-next] wifi: mt76: connac: Replace memcpy + hard-coded size with strscpy
Date: Tue, 23 Sep 2025 23:38:31 +0200
Message-ID: <20250923213831.1896823-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_143936_897514_1822CC94 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Replace memcpy() and the hard-coded string length with strscpy() to
safely copy the string and improve mt76_connac_mcu_chip_config().

No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 16db0f2082d1..0ccd39149663 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1949,7 +1949,7 @@ int mt76_connac_mcu_chip_config(struct mt76_dev *dev)
 		.resp_type = 0,
 	};
 
-	memcpy(req.data, "assert", 7);
+	strscpy(req.data, "assert");
 
 	return mt76_mcu_send_msg(dev, MCU_CE_CMD(CHIP_CONFIG),
 				 &req, sizeof(req), false);
-- 
2.51.0


