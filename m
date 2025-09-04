Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE1ECA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpGOZ6R4tA8s0gpQCC9ncHlNVuO9zib3S9+/vzed/sQ=; b=ydXHeqgnmxziOxuPvOPFvPUDx4
	I9jkkTGD//z0fjB8kuw7FwbblZIkYJFqVViN7jOPDDlKVcedhKL/ya3KHn6oZ0Cq4gU0fFj62eOLQ
	ijytZ7WtrPS+hex9i9kgWcou70AK6xe5DsfkBbqkSM/4DDJe2zVQTuJQPw1+CdKkjP9VdW4RJ1i9S
	X1jJ7cXFJYVKVYSUydRwPv8BJf4J4icuaWh8ZEAlGbpV90WNl2kR6osBmkGIGDca3AcU4DByyVs1b
	uqRCYSldLs5Qj23dXAOkRgBbOUyzoGYlvUafZ++2obs6J//ri7gugBMH4hXaU8hJWZ92+9XCiKVv0
	PrzTJtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3c9-00000009a3y-0AtU;
	Thu, 04 Sep 2025 06:38:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Ws-00000009YLD-1bSk;
	Thu, 04 Sep 2025 06:33:07 +0000
X-UUID: 01f25136895911f09f706fa2197c6ceb-20250903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YpGOZ6R4tA8s0gpQCC9ncHlNVuO9zib3S9+/vzed/sQ=;
	b=GOSZfhB1S2vrhO3TVkB5u8O6D6D0wbzm+W0DiDCmZ5/gLQkd5+Bigkoi8ii2Z/WaaT3G/LW1eOw3BCIc2/R24leLa6AIvdmiGnno2XnQKW7sQfOFM7Pmk4ElFWOqGE70gh+uoBy7lLcp2W9nlXrOyX6y4pkTmNKgHdjqkNSy4c4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:78afee3b-4d87-466f-83a9-a26d2dac08ec,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:9334306c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 01f25136895911f09f706fa2197c6ceb-20250903
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <xion.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 887598291; Wed, 03 Sep 2025 23:33:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 4 Sep 2025 14:32:58 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 4 Sep 2025 14:32:52 +0800
From: <xion.wang@mediatek.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Akinobu
 Mita <akinobu.mita@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
CC: <wsd_upstream@mediatek.com>, <huadian.liu@mediatek.com>, Xion Wang
	<xion.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] char: Use list_del_init() in misc_deregister() to reinitialize list pointer
Date: Thu, 4 Sep 2025 14:37:04 +0800
Message-ID: <20250904063714.28925-2-xion.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250904063714.28925-1-xion.wang@mediatek.com>
References: <20250904063714.28925-1-xion.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_233306_422559_77F307DE 
X-CRM114-Status: GOOD (  15.57  )
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

From: Xion Wang <xion.wang@mediatek.com>

Currently, misc_deregister() uses list_del() to remove the device
from the list. After list_del(), the list pointers are set to 
LIST_POISON1 and LIST_POISON2, which may help catch use-after-free bugs,
but does not reset the list head.
If misc_deregister() is called more than once on the same device,
list_empty() will not return true, and list_del() may be called again,
leading to undefined behavior.

Replace list_del() with list_del_init() to reinitialize the list head
after deletion. This makes the code more robust against double
deregistration and allows safe usage of list_empty() on the miscdevice
after deregistration.

Fixes: b329becfc78b1 ("char: add WARN_ON() in misc_deregister()")

Signed-off-by: Xion Wang <xion.wang@mediatek.com>
---
 drivers/char/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index 558302a64dd9..b5d44b08ad7b 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -279,7 +279,7 @@ void misc_deregister(struct miscdevice *misc)
 		return;
 
 	mutex_lock(&misc_mtx);
-	list_del(&misc->list);
+	list_del_init(&misc->list);
 	device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
 	misc_minor_free(misc->minor);
 	mutex_unlock(&misc_mtx);
-- 
2.45.2


