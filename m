Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0305CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 18:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vNhgED/fw/SK99O+jaKO3SdY5UdvEE4bnqv55Pa92lg=; b=VLbZ07cScUyDbbRUT5sB6XY+JE
	Zf6q10J4wwxW6aPhUtUTk5jfMs0nYARPvN0uPdwRo6IejCHbXaqwmDQHmpzxSGJMnk+rnaTz/L1mB
	3ZA5eIftOYY9IVsbqDaslcZTUz9IK5Mizu8MgVkJuK/kCg9wKgfKxSJBXklptzMFC5mAWQcNbc0fw
	MNBlw2BF2cXxYrXb1GWkK+9bW0r3RaeiIqiK7Mxf3YDCDDkmgaLvUci5xai8SQvOzmE7jjEewZ2As
	JB4uRLHg8ocCAxFA/uLr+QnB39GX0IbrJS4ZacvI5vFP4t0B1gwF0GaTooy1WshgQUetiglnq3Wpd
	O5JY0nLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7q5-00000008jhu-0vFZ;
	Thu, 21 May 2026 18:09:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7q3-00000008jh1-0JhG;
	Thu, 21 May 2026 18:09:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1FEA43EC2;
	Thu, 21 May 2026 18:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486C91F000E9;
	Thu, 21 May 2026 18:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779386981;
	bh=vNhgED/fw/SK99O+jaKO3SdY5UdvEE4bnqv55Pa92lg=;
	h=From:Date:Subject:To:Cc;
	b=n9ohybIpzkoxAqCZYqAqkKisCgfsJUjcPLKpv4xw4dridRQKi86wgC+HxMfpTw6KJ
	 7w1iuoFW8oS3nq6yTVO5isu5t8B3AhuLizd3zTgdwhc60v/PCRXsjQCOuUe1si/utU
	 ctP4c96HWd0foNpiillhSkejA6zwoWIYooWEa60t5ioZBi+iSNWIQyrSg9NlheAdZo
	 p1u2f6nEXJxAxuRUsyPBpJAdNSI1746fF2RQ+MOwOdQeJW0lfto+9rwMaHPvvJlbg3
	 c9cDznCg5dhAgJfUYsdskb3HtESYj0ClOCJA3kytz89Ua5CObXDiXa5zE2LphmBDSI
	 r95PC3gmY6wAA==
From: Eugen Hristev <ehristev@kernel.org>
Date: Thu, 21 May 2026 21:09:27 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix log status runtime access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-bcmpipm-v1-1-3eba88d88045@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFZKD2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyND3aTk3ILMglxds2RTc4tUc2MjY8tkJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAE5alClrAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=B9Y3iYDFYanKro3mnipAL97LUIUxW+HOKXTVG5bBdW8=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLL4veL9zhRpnF4/f23gnTmugiyFM7xkpp01rOIuMehkL
 gg6Oyu3o5SFQYyLQVZMkaXa5F+tcP8O95Ouliowc1iZQIYwcHEKwER+TmVkuPlJ+FvqcZFjAjvL
 zjz5vSpWeFLLvav9CZVan69tVNuT8YThr+gi2YhNnZNnaBhpGS3l8tIO/v32lVzA962rZt25Msl
 kPy8A
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_110943_134229_D0E8F914 
X-CRM114-Status: UNSURE (   9.86  )
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

When requesting log status, the block might be powered
off, but registers are being read.
Avoid reading the registers if the device is not
resumed, thus also avoid powering up the device just
for log status.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..818694f007e2 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2052,6 +2052,10 @@ static int unicam_log_status(struct file *file, void *fh)
 		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
 	dev_info(unicam->dev, "V4L2 format:         %08x\n",
 		 node->fmt.fmt.pix.pixelformat);
+
+	if (!pm_runtime_get_if_in_use(unicam->dev))
+		return 0;
+
 	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
 	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
 		 unicam_get_field(reg, UNICAM_PUM_MASK),

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260521-bcmpipm-6c578e73239c

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


