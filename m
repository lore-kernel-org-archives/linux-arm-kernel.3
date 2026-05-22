Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616A9CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFJS4E8ysH6VWoRSBHjAlfd82xpgU6b8hTLyq1WoytQ=; b=OJDdX7GCCi5wNOECULnU7FmznM
	LcENGsGTdTS3ujU1k0TYBWSTH2vTgKH1rMtL+Yrb1HQ50vlx7MCX3+lARU+gIlzj06YaCH+RAemo1
	LAQlMkduldqgmVMpnOCLX1JiqPQ6BkLH0hJ6qBIel/fHzz5x7xCd+brBPrdLb4UBx1ggTaLHS4VmK
	tjCSX0/ITw+U+zx10kgPMF1nyc0VKLOn/nGB05TAXUHo/ZC112vuimr3DfR53CPEUZYR8Vejgg5jv
	rem+GuAQot9/a4nfdXFxkh0/DicjZ55cmQBY3FoUuo3Q7alkdoWAWXMGUC9DnK6FfXGhXEzVlJORn
	PqAS5jdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRoJ-0000000BFl9-2EdZ;
	Fri, 22 May 2026 15:29:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRoD-0000000BFjj-2XKP;
	Fri, 22 May 2026 15:29:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11C8B601E8;
	Fri, 22 May 2026 15:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474A71F000E9;
	Fri, 22 May 2026 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779463748;
	bh=OFJS4E8ysH6VWoRSBHjAlfd82xpgU6b8hTLyq1WoytQ=;
	h=From:Date:Subject:To:Cc;
	b=JFXuh43RCVTyqtAbJLwWtRhXdlf4tNdvB981Iu34Wl9Fn8mrtL0eAASxRYj9Fji9i
	 bAeTmiIWZOy7TZqiw5hjnqSYaOL7ggNfbS2E/PzghqX2e+aY1Bpu7nfnKQMThkDXsF
	 CoCdJ1H1dS3wlA+t0QS3mznf9DzTHnsOgHCzdWMST4KEFE50gURlD94UU4AsNuRdzy
	 6InkLGsbNATFKAKI3/nNZFJThTZlQzaxrQM1AWmsix9uQHCglh9+vavtJfdAATbdme
	 uU8J18jlfpJs8pzhjwvdzAZ3iwqlkLOcPvaq7cey36rt3/p4YpuJ0TOWKWjXUtF+1H
	 Kmc1t83hkGsYg==
From: Eugen Hristev <ehristev@kernel.org>
Date: Fri, 22 May 2026 18:28:50 +0300
Subject: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
X-B4-Tracking: v=1; b=H4sIADF2EGoC/2WNwQ6CMBAFf4Xs2RraWqic/A/DgZYVVoWSFomG8
 O+2ePQ4ybx5KwT0hAGqbAWPCwVyYwRxyMD2zdghozYyiFwUuRKcGTtMNA2ssKrUWEohzxaiPXm
 80XsvXesfh5e5o53TPBk9hdn5z3618OT9VxfOOJNoGq1brfOTujzQj/g8Ot9BvW3bFyy4khKxA
 AAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=PMJsP28V5hMlxYp4KcsWEmzsqIgDeoKx+jpa+dUb3Vs=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLIEyhxa7cVVn6y34sqx1F/sdioi/MbsV280nuwv3J7Mt
 LNi4lqXjlIWBjEuBlkxRZZqk3+1wv073E+6WqrAzGFlAhnCwMUpABOJO8LwT/3trrQvnHuWzS48
 GODw/mD3S2NRj6UtDq419Tu8nXPapjH8j5Yx3CnhHS314tncu8euGJ47/PLsB152u1qbVedXLNp
 mzwMA
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
 drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..93815b8ab930 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
 		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
 	dev_info(unicam->dev, "V4L2 format:         %08x\n",
 		 node->fmt.fmt.pix.pixelformat);
+
+	if (!pm_runtime_get_if_active(unicam->dev)) {
+		dev_info(unicam->dev,
+			 "Live data N/A due to device inactive\n");
+		return 0;
+	}
+
 	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
 	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
 		 unicam_get_field(reg, UNICAM_PUM_MASK),
@@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
 	dev_info(unicam->dev, "Write pointer:       %08x\n",
 		 unicam_reg_read(unicam, UNICAM_IBWP));
 
+	pm_runtime_put(unicam->dev);
+
 	return 0;
 }
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260521-bcmpipm-6c578e73239c

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


