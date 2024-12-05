Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9E8E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FmxWE5EhzoSWDAXa4b5JycP7gjDtMkh2D/HJuqalzuU=; b=ZXOAhpslsdoQBiTd+ONKuh0MWY
	xtZq/t8AuE4egvU7KY0LnYG7KrRtF1rv3AP/talCvqqFdgxtpt70CjkW3/Hfz0cSq2x37aQ2wimRs
	tNgORFWMlw6rbbrpXAhvbOqmYTum7UVMHKR88anowJMAAPgooumNN4Jg4CQoFYbPR0RMlFDh8QFGU
	q0vbXw0uC397UQvGKscWONuTs0qMx9zWiNWa21l1GkNNxRWJIMylOjNwgdLk+q83ZfXQP/swDKo9M
	8YBeiNL9sk7Zv51wHswojq2clgNVdtbqu4W5HA8QMl+WblIuqEPzlt1g5/yNkOWAEvVxV6YIPpY6B
	DSvHFoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBuL-0000000G9Oo-1fBf;
	Thu, 05 Dec 2024 13:28:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBtJ-0000000G931-2HTz;
	Thu, 05 Dec 2024 13:27:38 +0000
X-UUID: ae2f808cb30c11ef82ff63e91e7eb18c-20241205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FmxWE5EhzoSWDAXa4b5JycP7gjDtMkh2D/HJuqalzuU=;
	b=jDTYYX2u4z0aMU0NwYRKyqB9TwlaOOBwm366a0BgVxxVWsSYnc2D9QWyHQ0LbmpR+4XnvopMZLq2bSTZO6vKxeV+IoqvAoMcZTukSePeEamMZgck02fclVJ+DVduAbCm4ygaQ9a9JUOzR13fNNkvv1EEMJvoKh75fN4B3ewxyxc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9d52b054-1eaa-468a-b3c6-a50854ddf5cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:78657d3b-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ae2f808cb30c11ef82ff63e91e7eb18c-20241205
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <defa.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1935099265; Thu, 05 Dec 2024 06:27:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 5 Dec 2024 21:27:28 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 5 Dec 2024 21:27:27 +0800
From: Defa Li <defa.li@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <mingchang.jia@mediatek.com>,
	<yuhan.wei@mediatek.com>, <hao.lin@mediatek.com>, Defa Li
	<defa.li@mediatek.com>
Subject: [PATCH] i3c: master: Improve initialization of numbered I2C adapters
Date: Thu, 5 Dec 2024 21:29:02 +0800
Message-ID: <20241205132934.12110-1-defa.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_052737_586933_CB8D3BB7 
X-CRM114-Status: UNSURE (   9.32  )
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

Add logic to initialize I2C adapters with a specific ID if available,
improving device identification and configuration.

Signed-off-by: Defa Li <defa.li@mediatek.com>
---
 drivers/i3c/master.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 42310c9a00c2..a838cdbb897b 100644
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
@@ -2497,7 +2497,14 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->timeout = 1000;
 	adap->retries = 3;
 
-	ret = i2c_add_adapter(adap);
+	if (master->dev.of_node)
+		id = of_alias_get_id(master->dev.of_node, "i2c");
+
+	if (id >= 0) {
+		adap->nr = id;
+		ret = i2c_add_numbered_adapter(adap);
+	} else
+		ret = i2c_add_adapter(adap);
 	if (ret)
 		return ret;
 
-- 
2.45.2


