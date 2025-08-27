Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0CFCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 02:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqQOUmPhPDF+wRFVuZ8A8xxyMc7EM27KRGaAeuZra8I=; b=B8099D10s1ZBepx9BkrR+Xw0pG
	bVFWhMuSp6TXuAMOOomf3xXohTnQTcl7qSn9CBH+1sH//nzQrD4Rcz9tegnSK3xeSHzJDmip9K3ke
	szDYXuJHezMmiAjC3MWfM6XXAwkppaEcZ1TUXyN3oSOGo2AyI5JDi8oCZhDyXeNw8o6nBvpgB2fHf
	3fPBPQenm8KmYpIeunD4gf06z6yEL6RU30rWvmG8cdnU4ZfPjbT6V28oyIVTuedWLANBAJ3URFhBV
	tVzYsMmW0ajohj4U84Cwu/6wU3RHYDMlG+xTain+j+suDRt/yV8nONbzMDDKO6RzoZ3SvvfOcEC88
	B9tGeceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur67s-0000000Djti-2Lt9;
	Wed, 27 Aug 2025 02:43:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur62d-0000000DixS-0wyz;
	Wed, 27 Aug 2025 02:37:40 +0000
X-UUID: c9c779c882ee11f09f706fa2197c6ceb-20250826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qqQOUmPhPDF+wRFVuZ8A8xxyMc7EM27KRGaAeuZra8I=;
	b=OwreRfaHxOeaRe24eDR6vrOwfwf21WwEEbIo4DQ12Otso1UubuYSuclmj95kqM5AGOAtkBZZdLWjm9U6V4UnoHfWxXmKV2FQTBXnAO+GB8HcMCnjSLO1jqnPRDIuRdZKvSaQIhbjJ+APVvRXuPFfPmKoDmBSuqMuRvartDXX/0I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:89aece49-edf4-43aa-bed5-31e32480e91f,IP:0,UR
	L:0,TC:0,Content:22,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:22
X-CID-META: VersionHash:f1326cf,CLOUDID:d1798b20-786d-4870-a017-e7b4f3839b3f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:4|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c9c779c882ee11f09f706fa2197c6ceb-20250826
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xion.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1602654965; Tue, 26 Aug 2025 19:37:34 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 10:37:32 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 10:37:31 +0800
From: <xion.wang@mediatek.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <huadian.liu@mediatek.com>, Xion Wang
	<xion.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] misc: remove ineffective WARN_ON() check from misc_deregister()
Date: Wed, 27 Aug 2025 10:41:00 +0800
Message-ID: <20250827024201.21407-2-xion.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250827024201.21407-1-xion.wang@mediatek.com>
References: <20250827024201.21407-1-xion.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_193739_271324_295ED94F 
X-CRM114-Status: GOOD (  10.44  )
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

The WARN_ON(list_empty(&misc->list)) in misc_deregister() does
not catch any practical error conditions:
- For statically allocated miscdevice structures, the list pointers
 are zero-initialized, so list_empty() returns false, not true.
- After list_del(), the pointers are set to LIST_POISON1 and LIST_POISON2,
 so repeated deregistration also fails to trigger the check.

Signed-off-by: Xion Wang <xion.wang@mediatek.com>
---
 drivers/char/misc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index 558302a64dd9..f46b00a76a59 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -275,9 +275,6 @@ EXPORT_SYMBOL(misc_register);
 
 void misc_deregister(struct miscdevice *misc)
 {
-	if (WARN_ON(list_empty(&misc->list)))
-		return;
-
 	mutex_lock(&misc_mtx);
 	list_del(&misc->list);
 	device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
-- 
2.45.2


