Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74993C5B570
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vxnxyq4EBot5fuhq3s4GNJt0r7zAtznqxRDQwegelng=; b=DBdaeXHI8eN3CjUWudQIAQ7HhD
	1yyJQ05NFYl0tbpe1ea3e2c1B/pm6vhm7P75YJcOObXhYhznda+44h/plIY+7RfkzsffOyvYVGr3P
	qAAUbzMCIGi/194ZqnaNqdv7/+4MpcnTjca8UpIz0VR1vWxdriOmwrlqO+TjAPlSATo4Mj/CY4ERF
	DV8ugBVx2VUpf0rjMViR7bsDN9z076cp9dT0Av+WCFPNm6Jhmxb9j327qjDOnRGLezs7RaBbJr0aT
	5BQZ/wVopVicH/b/vX0PgSaEPuvngOFhqw9EIIvKkGp77FLGQrx59VCFSxtl3r469NbFfVicaH/ZA
	iG6Y/TuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgQ0-0000000DT4q-3Pi9;
	Tue, 11 Aug 2026 06:57:00 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgPw-0000000DT3g-1tj4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:56:59 +0000
X-UUID: d39dc9f4955111f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:29bfe68e-fcfe-420c-9344-c20a17e34ee6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:d47660827bff5ee2b9483309721501eb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d39dc9f4955111f1aa26b74ffac11d73-20260811
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 284839150; Tue, 11 Aug 2026 14:56:50 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkai Gong <gonglinkai@kylinos.cn>
Subject: [PATCH] char: xilinx_hwicap: check device_create() return value
Date: Tue, 11 Aug 2026 14:56:44 +0800
Message-Id: <20260811065644.379601-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_235656_833422_B46141DB 
X-CRM114-Status: GOOD (  11.75  )
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

device_create() can fail, but the driver ignored the return value and
still reported probe success. That leaves a registered char device
without its /dev node.

Check the return value, report the error, and delete the cdev on
failure.

Fixes: ef141a0bb0dc ("[POWERPC] Xilinx: hwicap driver")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/char/xilinx_hwicap/xilinx_hwicap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index 34a345dc5e72..338588b7bf08 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -660,9 +660,17 @@ static int hwicap_setup(struct platform_device *pdev, int id,
 		goto failed;
 	}
 
-	device_create(&icap_class, dev, devt, NULL, "%s%d", DRIVER_NAME, id);
+	retval = PTR_ERR_OR_ZERO(device_create(&icap_class, dev, devt, NULL,
+					       "%s%d", DRIVER_NAME, id));
+	if (retval) {
+		dev_err(dev, "device_create() failed: %d\n", retval);
+		goto failed_cdev;
+	}
+
 	return 0;		/* success */
 
+ failed_cdev:
+	cdev_del(&drvdata->cdev);
  failed:
 	mutex_lock(&icap_sem);
 	probed_devices[id] = 0;
-- 
2.25.1


