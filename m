Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE58CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VlUmGwE0ILPgOg+KpZs1mxPqeBRs9I2PikBa8crC90o=; b=cIPknG1Xx2EsOEBfCN5hgP3kLh
	+y38Tcy979Qo0v4lUE/T1+GIgE4ren2bTbG1/UTNbWjsRs+cIBJMesVvLaaxqUXxDHK6+mGoRDyVT
	Mc3Lnzmfq6o6AifSc2T5nfYrcnUvZLTgrdepyDpdFg1wLTGMt689nPZE8ROWayguAccx0G1Kf+Hcz
	qTlVK1S8cBjGl4h7IWoqKlm4oW6ryEpq8K3R6erG35T8PAimU4CuGvSOPdbaZOfUvyrA2vY1z9iXi
	tnwCd8Kere5ArllcYNaHgv7UyTOcN54mmcXEsXAMqV2wTOj3FuwJbmXeNY/iNZPGV5IT/5eGYYk0Z
	GhTir5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXzV-00000008jii-2sYc;
	Thu, 11 Jun 2026 05:30:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXzS-00000008jhd-2gD4;
	Thu, 11 Jun 2026 05:30:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 739D96020A;
	Thu, 11 Jun 2026 05:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87711F00899;
	Thu, 11 Jun 2026 05:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155805;
	bh=VlUmGwE0ILPgOg+KpZs1mxPqeBRs9I2PikBa8crC90o=;
	h=From:Date:Subject:To:Cc;
	b=a97rLwiSf/wopPh1XUAO3MQnqZCbyeIzz8OVwoND7Lc8TZ5X10f15Uo3QHpxuT51u
	 s9U2ngqpgeoHDKUK002wtev5CqIq+4nSyH3+9DEHicAuDpfpDY65zKy8EbeVOnarnM
	 N3keGgZZFd0VIBOyhxiVi58AEwER/T2GB/yh41r0b4XC69hra8gdTB1T4G66GOW7ZS
	 LVaAHlR3Frl2vHbgZGlDi0rSdwaV2L8kiV7NofRmTlFT+L/cMYbNiTM0MMsWPkEQdu
	 MEXUJR8F4iYCzV5SnN3wC/uqDSNb5/Jk2VM2RlLzFUtrPDJHpDPr820OJTtmxzFICo
	 3oDGQAMaXsWwg==
From: Eugen Hristev <ehristev@kernel.org>
Date: Thu, 11 Jun 2026 08:29:55 +0300
Subject: [PATCH v3] media: bcm2835-unicam: Fix log status runtime access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-bcmpipm-v3-1-c609dacb029f@kernel.org>
X-B4-Tracking: v=1; b=H4sIANJHKmoC/2WNyw6CMBQFf4V0bU0fUgor/8O4aMsFqvJIi42G8
 O+2uFDjcpIzcxbkwVnwqMoW5CBYb8chAt9lyHRqaAHbOjJihAmSM4q16Sc79ViYvJBQcMZLg+J
 6ctDYx1Y6nd/s7/oCZk56WnTWz6N7bleBpt1/NVBMMQetpKylJIf8eAU3wG0/uhalbGDfIvuIL
 IqK10oIo03ZkB9xXdcXx/qyHuoAAAA=
X-Change-ID: 20260521-bcmpipm-6c578e73239c
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3216; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=zPyDYXa6zGSFKayiHQHtfIPXQU2y4Rco+w2TGKlmhLs=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLK03K92NnL93fC/x8y3t8BrT+aUBxzszr8cWucYfPzqv
 K/Q58mkjlIWBjEuBlkxRZZqk3+1wv073E+6WqrAzGFlAhnCwMUpABO5nMHIsG7zoq2HxM0zDzxq
 eKjwSfnkpg3LNY/+L9yamZKwPdl7cQPDf3fVv0zP/h/9+bh7xaVJ18yDHLv8p6Ts7lH8duqSnVQ
 pLx8A
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
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

When requesting log status, the block might be powered off, but registers
are being read.
Avoid reading the registers if the device is not resumed, thus also avoid
powering up the device just for log status.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
Changes in v3:
- Changed to check return value of pm_runtime_get_if_active() and only call
  pm_runtime_put() if the device is active.
- Link to v2: https://patch.msgid.link/20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org

Changes in v2:
- changed to use pm_runtime_get_if_active()
- add corresponding put()
- Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org

To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Ray Jui <rjui@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..96b51e29bba4 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2043,6 +2043,7 @@ static int unicam_log_status(struct file *file, void *fh)
 	struct unicam_node *node = video_drvdata(file);
 	struct unicam_device *unicam = node->dev;
 	u32 reg;
+	int pm_active;
 
 	/* status for sub devices */
 	v4l2_device_call_all(&unicam->v4l2_dev, 0, core, log_status);
@@ -2052,6 +2053,14 @@ static int unicam_log_status(struct file *file, void *fh)
 		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
 	dev_info(unicam->dev, "V4L2 format:         %08x\n",
 		 node->fmt.fmt.pix.pixelformat);
+
+	pm_active = pm_runtime_get_if_active(unicam->dev);
+	if (!pm_active) {
+		dev_info(unicam->dev,
+			 "Live data N/A due to device inactive\n");
+		return 0;
+	}
+
 	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
 	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
 		 unicam_get_field(reg, UNICAM_PUM_MASK),
@@ -2065,6 +2074,9 @@ static int unicam_log_status(struct file *file, void *fh)
 	dev_info(unicam->dev, "Write pointer:       %08x\n",
 		 unicam_reg_read(unicam, UNICAM_IBWP));
 
+	if (pm_active == 1)
+		pm_runtime_put(unicam->dev);
+
 	return 0;
 }
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260521-bcmpipm-6c578e73239c

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


