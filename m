Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FE4E6B251
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KCdmocw4aqHZ1sPlI0nYvdn46cstnY/2gAo9mGfI6bY=; b=17uhbFUM2PcVAcY1YOcVaT5uCR
	uZAyWITPHvOKbeYJKhnUaN/yO9kIU/151JSzYhuJsRjQ/we15mwc5r+8PUCh+zP+eaG7SrLZIpXks
	3VmZCRYjoq+caZD8a3mPXOHLBeg7PZ9e4xEasRyGMn+dwZlPlcdNTUi6dr3tV8CzYNRjHzvGc3u49
	OOcrrP3v5geRnlzMfSRVZdZpn7dU0c4j5KJ2j+MAuyp9Ome146vGhhVP7lDE1CthG8wmKa3QlPI+l
	evF7BLhZ3QGIsyxM6aRAz26YJ9xnKIbXp6GVfdyhRN28ldA8cGUeO4fIDotXGt4fV7PgeZMvQwnQd
	aiNIt1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qZU-00000006vzp-3QCC;
	Fri, 01 Nov 2024 12:16:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qFc-00000006p3w-2kLO;
	Fri, 01 Nov 2024 11:55:38 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 318CF3D4;
	Fri,  1 Nov 2024 12:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730462127;
	bh=YgheqCGz5W29kaXksMwAsSLSItD+uZ0Eo9BVpZbhL50=;
	h=From:Date:Subject:To:Cc:From;
	b=a/eEwneaxNk6oWJRPCLor+aANObSNwjnxnCP5bGCka8VI1i6CkzFeM0EHlitOfikF
	 DrXyhjgAtZ4BRYeVmDbVKUfok90oK0QRxoQOIGAdbAf2bvpt+i8tqzuUr8JDij80yx
	 cjkOSWmopNw1Ke6rdPicWBKWbigbQwMPwoMsyoYI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 01 Nov 2024 13:55:15 +0200
Subject: [PATCH] media: raspberrypi: cfe: Fix mapping of dmabuf buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-rp1-cfe-fixes-seg-size-v1-1-0aacf2da56e5@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAKLBJGcC/x3L0QpAQBBG4VfRXJvaWUq8ilwsfswN2inJ5t1tL
 r86J5EhKoy6IlHEpabHniFlQdMW9hWsczZ552sRJxxP4WkBL3rD2LCy6QMeG1e5dg5NHTzl+Yz
 4i/z2w/t+QRV3oWgAAAA=
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YgheqCGz5W29kaXksMwAsSLSItD+uZ0Eo9BVpZbhL50=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnJMGvFaCtuDuyf61e0vv8PqzSJB/xa17jDfwQW
 NGrimnq/deJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZyTBrwAKCRD6PaqMvJYe
 9eNFD/9DUTfzgMBvDuE/F3k405rVzyAORyhjBXr0Duc/OrM9lBlDIG/ONRSY0o6qO/4ZQC5YsDU
 EwrZtGSBoz64NZuYl7Z6a+MocK2A3izCAeObWSj8tIIKme6zvEFxfMQxhpLeJOLFfdJpOzPOHKO
 VpEloIccudNFJzZ4akkWJBuiq37JAhMefysGdA6gJFmW5rKZLIFgydYEeo+R8W7oQsocbVB8utG
 z9BgmQ+wPMuiyUSDh+VFyv1H3wEdHgvOs+9kPQokhg/TqD5nrzYUezENUp8PpupZA/TMdEkcfqA
 BFXTabQDmNBykvtMKrmtsbzRGaVryu6w4wSUoM6h71LWpANIFjtlca4vFk3GclDBLdO+ejA7B/1
 cY8ecpBA5bR6CBX6hqx88bnxo4j6+o9l2neZMCMoCo2jr2jgnReOejI0jT4sWn698D7lWg6DhZH
 vZkAunYNcOJG+gjTYyN7k5rDKSGA85d/ZvDU8wONpMdDAnSowioKwd3nwFXXUrxLKNVyX0WkWPc
 /wcb9mTKebDrnQlOI34cVGpiJ8fXRI0IQFIMCz4SmmmcfJkeooldFLcduo9uYVdEwF48Kdbz98Q
 1OtjfkalIC1ZmXO7+TyAvpx4TS1Dp5RdGDdavLXDGFLQQg4Dd6zhx8eOPdBAJkUuTG3z+AQDoMS
 Sskai3Yq9FFlqTA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_045536_873495_0B09564B 
X-CRM114-Status: GOOD (  11.50  )
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

When using buffers from DRM, DMA-API gives a warning about: "mapping sg
segment longer than device claims to support [len=307200] [max=65536]"

Add a call to vb2_dma_contig_set_max_seg_size() to tell the DMA-API
about the supported segment size (which is UINT_MAX).

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..e52d8b20df40 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2341,6 +2341,12 @@ static int cfe_probe(struct platform_device *pdev)
 		goto err_cfe_put;
 	}
 
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to set max_seg_size\n");
+		goto err_cfe_put;
+	}
+
 	/* TODO: Enable clock only when running. */
 	cfe->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(cfe->clk))

---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20241101-rp1-cfe-fixes-seg-size-b70309da74a2

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


