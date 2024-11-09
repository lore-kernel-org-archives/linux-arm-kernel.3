Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A993D5E360
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OF5SCwPrDcmkoojWBdBsivPVEi1IDZLFgt7fAIEnaTc=; b=bsV+rv7mVaGk/Vo/qT1r1zF+9H
	2AFvL0jlAm+RxzE24V1784j7OH816gXSRX6FZfXy9sWd6vPg9i/8gzA+xhDfwle9ypCky8NHrcdIe
	mV05MyXFoG2Xr++NpC28BN0G3QrK4LtyRtRc0zsQJraCBQ/8nt7QQ4s81LU//sApDgUnfuRcOYI2s
	Oq45s+3TZicqBEeXaGsa47QO2ePOqIvHlopugxNJiJVbNuruKynqNOgYndHOQNPiCPb7JVAo/xg02
	jZ3F5AnGrCdmElsRmaq7oAolFRTqTaWVGKEUkLtaG/dQ3+Oo7Kc0s9kTEi9yb4LFZJkR0gZr1u5Nk
	hqjnM4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hhU-0000000Cyd8-3CgY;
	Sat, 09 Nov 2024 09:24:12 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hfh-0000000CyRi-2JcX;
	Sat, 09 Nov 2024 09:22:23 +0000
X-UUID: 17021ba69e7c11efa216b1d71e6e1362-20241109
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:e45ddae5-ffbd-47ae-b380-f8425b9c0cf3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:bb0a940dd6dc7d1943b6e6fdaf5ba797,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0
	,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 17021ba69e7c11efa216b1d71e6e1362-20241109
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1099126974; Sat, 09 Nov 2024 17:22:07 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id E45B0E0080FF;
	Sat,  9 Nov 2024 17:22:06 +0800 (CST)
X-ns-mid: postfix-672F29BE-15679110
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id 2FC3BE0080FF;
	Sat,  9 Nov 2024 17:22:03 +0800 (CST)
From: zhangheng <zhangheng@kylinos.cn>
To: corbet@lwn.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	zhangheng <zhangheng@kylinos.cn>
Subject: [PATCH 4/4] docs: driver-api: firmware_loader: Convert to platform remove callback returning void
Date: Sat,  9 Nov 2024 17:22:02 +0800
Message-ID: <20241109092202.4040669-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_012221_930271_9CA7CA61 
X-CRM114-Status: UNSURE (   9.29  )
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void.

Trivially convert the mediatek drm drivers from always returning zero in
the remove callback to the void returning variant.

Signed-off-by: zhangheng <zhangheng@kylinos.cn>
---
 Documentation/driver-api/firmware/fw_upload.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/driver-api/firmware/fw_upload.rst b/Documentat=
ion/driver-api/firmware/fw_upload.rst
index edf1d0c5e7c3..b339265655ee 100644
--- a/Documentation/driver-api/firmware/fw_upload.rst
+++ b/Documentation/driver-api/firmware/fw_upload.rst
@@ -69,13 +69,12 @@ function calls firmware_upload_unregister() such as::
 		return 0;
 	}
=20
-	static int m10bmc_sec_remove(struct platform_device *pdev)
+	static void m10bmc_sec_remove(struct platform_device *pdev)
 	{
 		struct m10bmc_sec *sec =3D dev_get_drvdata(&pdev->dev);
=20
 		firmware_upload_unregister(sec->fwl);
 		kfree(sec->fw_name);
-		return 0;
 	}
=20
 firmware_upload_register
--=20
2.45.2


