Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7895C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 06:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zZ964UaOcqM6aIvLP+DeBwxQG6DN76Q94+laK2Fad4=; b=ThH/y0GlIL3+PScz4AJM0ENzKQ
	fhsH2ps+hBMwoEDdDMzzziZBjOZVlWDtccyXN8mFJcg+NnCwjq3K08KrYUKDjnBEPOngDczSRkU5H
	2Fms1SSQNNzU25deUdop3VnSp32U0CFMXh1IogQDOp+A4n/XFvli5y5FHdX8lxOKDtrlhoY7XPDYu
	ppP/yGYIA38JwxYADEQ6kc4xQMCoeHg5aDTbon07SGm7ER9+cmevF6c/IUqxnM7E64hvWPsOidThK
	RWzaT9zRqjVGJBPgDb98xFfq3OMscSKFeX6Q7CmkB5MC+nigfVvm+Z+Yqfl79/P0dgKa3cMm6LCQw
	sHfPqOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy1fu-0000000F7dn-3oxs;
	Sun, 23 Aug 2026 06:27:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy1ft-0000000F7dW-1dPI;
	Sun, 23 Aug 2026 06:27:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EA6760008;
	Sun, 23 Aug 2026 06:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7F41F000E9;
	Sun, 23 Aug 2026 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787466439;
	bh=4zZ964UaOcqM6aIvLP+DeBwxQG6DN76Q94+laK2Fad4=;
	h=From:Date:Subject:To:Cc;
	b=TGY2e4QO+Z9kVs0AgtHsqhw1zDiHU3+6xDoMX2i6/dgHwFp4asR/MJX+1tPIeHn1p
	 KAejm6pC0LKkWtENq3YrDesupEtH082B5QA0vuY+WAXFllVqTBdfW22ZzOKrw+aBFP
	 JStGAXQFpg6SSYxSzAYO7akYvlk6l+B000SV6ORA3Xya/VloWGJ89Na8A0rVRfMGOe
	 7Xv7p4uuDPCxNlj3oW/5alh5GMAsEdoPDLFw2I/ArasNwj4/7OyCbG4sQ8h+nxLl73
	 ka/47JM8b01UE7cd2qv5m1uryg7Q+uurtxb/UQc8o1vTXqUIHPMyZGqm6Di7n5EoyR
	 TmRW7V9ydbD6g==
From: Eugen Hristev <ehristev@kernel.org>
Date: Sun, 23 Aug 2026 09:27:09 +0300
Subject: [PATCH v4] media: bcm2835-unicam: Fix log status runtime access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-bcmpipm-v4-1-faf20d9c3e2b@kernel.org>
X-B4-Tracking: v=1; b=H4sIALySimoC/2XNyw7CIBQE0F8xrMXwaJG68j+MC7jcKmofgUo0T
 f9dqotqXE4yZ2YkEYPHSHarkQRMPvquzaFYrwicTXtC6l3ORDChWCk4tdD0vm+ognKrcSuFrID
 kdh+w9o/30uH4yfFuLwjDzOfG2cehC8/3VeJz7381ccqpRGu0dlqzotxfMbR423ThRObZJL6hW
 KDI0EhnlAILVc3+oFyg4l+PMkNQrHIGLBNV/QOnaXoBQfimiyMBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=6caN5GbikuqADZTPUPquRicuKp50Ix0df0KcUGo/32s=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLK6Ju1XWH+w+K3IrHauEPFJx90dTcVjja/p7Ko9dHyv9
 LHyVUfMO0pZGMS4GGTFFFmqTf7VCvfvcD/paqkCM4eVCWQIAxenAEzEm53hf9WdrJ+/3+yelvz3
 xsU1Tdmn55tJb50/7VvTAa/uQmZHNk5Ghpd3L65K4Gppu39q0cc13ry8t3l+9B7RNq34//peGcP
 vfSwA
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
Changes in v4:
- rebased on latest tree, no additional change.
- Link to v3: https://patch.msgid.link/20260611-bcmpipm-v3-1-c609dacb029f@kernel.org

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
index 14bb916dd7b1..7745aee711cb 100644
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
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260521-bcmpipm-6c578e73239c

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


