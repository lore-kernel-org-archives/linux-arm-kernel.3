Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2159CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 02:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nOxkbOYFWH5ScnkdXr6eQI1bknyQ+i8azIWqBjjz0VY=; b=0gA7NJ21PSvf3jYksJc+w4Id0O
	PnOuMblWlHoRmDzTbpZBKsKCauxoWOgo14NwNBYeCYa0EyTfeUNi6i6+rZvHqUmyvNl6jraU/Xbne
	K+/gozpHgoabY/h+F4LdGkuqu98guDeb+r4VPRTKBHc9i3/EbU8UqfOF16U2geH5ZhsNST2obpvPD
	3HRuFEXhH3PRPV/xjd3IllRI+IYkXL20ZV+xJgPZ9GuCJrCV097QIEq8scnUm4aua+dNwkvMpvNSD
	ccPFOaaNhn94zAnF42JKs8PrUU6VTXNg4GrL6+cS1ryQWSQkupQhv0cY4OaPZjE3oHAEHn4ZUoXwR
	AX6MVibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWTA-00000003I2K-1xvr;
	Wed, 20 May 2026 02:15:36 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWT6-00000003I0T-1ncJ;
	Wed, 20 May 2026 02:15:34 +0000
X-UUID: c0371a2e53f111f1aa26b74ffac11d73-20260520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5f95d278-0ca8-4f62-be13-634d09b3a2a4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:887d1953b4785460769cf36a49e66563,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c0371a2e53f111f1aa26b74ffac11d73-20260520
X-User: liujiajia@kylinos.cn
Received: from nature.lan [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liujiajia@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 909766949; Wed, 20 May 2026 10:15:20 +0800
From: Jiajia Liu <liujiajia@kylinos.cn>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiajia Liu <liujiajia@kylinos.cn>
Subject: [PATCH] Bluetooth: btmtk: remove extra copy in cmd array init
Date: Wed, 20 May 2026 10:15:00 +0800
Message-ID: <20260520021500.13504-1-liujiajia@kylinos.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_191532_778825_79B0B21B 
X-CRM114-Status: GOOD (  10.02  )
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

In btmtk_setup_firmware_79xx, the data length indicated by wmt_params.dlen
in the cmd buffer is MTK_SEC_MAP_NEED_SEND_SIZE + 1. Except for the first
byte, the remaining length is MTK_SEC_MAP_NEED_SEND_SIZE. memcpy copied one
more byte to cmd + 1 than the remaining length. Align the length passed to
memcpy to avoid exceeding current section map.

Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
---
 drivers/bluetooth/btmtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index ea7a031000cd..53cba71cb07f 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -188,7 +188,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 				       MTK_FW_ROM_PATCH_GD_SIZE +
 				       MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i +
 				       MTK_SEC_MAP_COMMON_SIZE,
-				       MTK_SEC_MAP_NEED_SEND_SIZE + 1);
+				       MTK_SEC_MAP_NEED_SEND_SIZE);
 
 				wmt_params.op = BTMTK_WMT_PATCH_DWNLD;
 				wmt_params.status = &status;
-- 
2.53.0


