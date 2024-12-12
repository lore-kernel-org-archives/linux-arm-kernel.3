Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89785E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=axvJlHiBR2zkbU+O3koSZ3ET0NsXqwruLo6eqUrj9fI=; b=HkmMtsNwYTIgHZ+pOtimuga1dq
	G7iJuti+7Raa8YewdI2H6C4DamDv6XBf2tP4gy2O2EkE8X1aQyuDyHsupKxO+Xo5fVQt2iM7vrHqi
	OAzGRR7Yd3MT3Ugg5aZmkdF5By3yEggxMogtrsDS8/EOq7N8h1MkPv5AAzKNaaoawL404G2GSsYNo
	SkqDa9a87yRDv7U367JjH8spEIi7bt9mQBEFwXupbKbazGpzj4p2+P0qiMgplDtA9QLFElYNCRojZ
	dXp6fVkpyJAd3Z6sZG4vixbcJz99Z9RjD6/WcJRscniDfXKXjWET+kvAmDZLT/PeOyYZ9HzdMs8fp
	ssR09ElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfJx-0000000HRzY-1VNk;
	Thu, 12 Dec 2024 09:17:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfIt-0000000HRmr-0C5Z;
	Thu, 12 Dec 2024 09:16:16 +0000
X-UUID: b941dadab86911ef82ff63e91e7eb18c-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=axvJlHiBR2zkbU+O3koSZ3ET0NsXqwruLo6eqUrj9fI=;
	b=ZJKwGNvkU/GyPkSeEtYc0qHr7kwaT/OBq/q9QXlJo31dpS1mvRaCNjQK291oPqXtUgKNrvwagzggRdIhPA15TIdQWcb/Lfb7R3IlZ+xPdzygh9D654zjbPZ4rDnkfL+lH8EqEErRQtv+UB0KHOSDppxZFmRs3zjUGopnm5UH/Pg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:14056c1b-b5fa-40f4-b406-9b7167ae2524,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:75616828-d2eb-4de2-b5c9-495d1bc17256,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b941dadab86911ef82ff63e91e7eb18c-20241212
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <defa.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1197075212; Thu, 12 Dec 2024 02:16:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 17:16:06 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 17:16:05 +0800
From: Defa Li <defa.li@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <mingchang.jia@mediatek.com>,
	<yuhan.wei@mediatek.com>, <hao.lin@mediatek.com>, Defa Li
	<defa.li@mediatek.com>
Subject: [PATCH v2] i3c: master: Improve initialization of numbered I2C adapters
Date: Thu, 12 Dec 2024 17:17:53 +0800
Message-ID: <20241212091818.8591-1-defa.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_011615_089771_5F6D8BD5 
X-CRM114-Status: GOOD (  12.46  )
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

Add logic to initialize I2C adapters with a specific ID if available,
improving device identification and configuration.

For mixed buses, in addition to the i3c alias, an i2c alias can be added to
assign a fixed bus number to the i2c adapter.

This allows an alias node such as:
    aliases {
        i2c2 = &mixed_bus_a,
        i3c2 = &mixed_bus_a,
        i3c4 = &mixed_bus_b,
    };

    /* assigned "i3c-2" and "i2c-2" */
    mixed_bus_a: i3c-master {
    };

If there is no i2c alias for a mixed bus, the i2c adapter numbers will
remain as is and will be assigned starting after the highest fixed bus
number.

    /* assigned "i3c-4" and likely assigned "i2c-3" */
    mixed_bus_b: i3c-master {
    };

v2:
  - Modify commit message and code format issues

Signed-off-by: Defa Li <defa.li@mediatek.com>
---
 drivers/i3c/master.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 42310c9a00c2..92223e0b6e59 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2486,7 +2486,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
 	struct i2c_dev_desc *i2cdev;
 	struct i2c_dev_boardinfo *i2cboardinfo;
-	int ret;
+	int ret, id = -ENODEV;
 
 	adap->dev.parent = master->dev.parent;
 	adap->owner = master->dev.parent->driver->owner;
@@ -2497,7 +2497,15 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->timeout = 1000;
 	adap->retries = 3;
 
-	ret = i2c_add_adapter(adap);
+	if (master->dev.of_node)
+		id = of_alias_get_id(master->dev.of_node, "i2c");
+
+	if (id >= 0) {
+		adap->nr = id;
+		ret = i2c_add_numbered_adapter(adap);
+	} else {
+		ret = i2c_add_adapter(adap);
+	}
 	if (ret)
 		return ret;
 
-- 
2.46.0


