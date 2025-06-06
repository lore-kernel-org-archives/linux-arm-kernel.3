Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86748C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UCpCUa4DVnSwSqF4CZTQ4qvXWqPBT9i4rbTxHu3KPIk=; b=n5Zk4RdOR6ld3vJdT7yqfRDXRr
	jwD3SSupCYiuhE6P8xTAvmOmCm95TBzTGkMZO+Hd3x0Q3mboGWgE7fNVsGrOcD6UbcSAxeRF/t02B
	93piJGcW6L4Qej8pAEy3p9hUbuaDZ0/on3KLdh+HMrVCm/DhqJJWLtLlDrhbFYS3GvOJN+3mJXd6h
	e547PMBjUm3uSsrmcE7EgldrZAlZ+w6UTf1XQ6j2tGvjdqOyrgqDv7XcVuv4As8FVMAqHX7VKtrA7
	9ya4zIIxPjuGiPo742jMTPxKXIbJeHTm9ulS2Fajab8AwUb26zaMdPvhuLnPQuktkZPoRUMKXAwkH
	A6bA7DmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNYTb-00000000Shs-31bm;
	Fri, 06 Jun 2025 14:55:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNYRT-00000000STF-0KTP;
	Fri, 06 Jun 2025 14:53:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D53FD44633;
	Fri,  6 Jun 2025 14:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED27C4CEEB;
	Fri,  6 Jun 2025 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749221588;
	bh=TcHbFteQOmLGBTjvX6qik4ZH9aSmoF2gCaV1qnEzHEs=;
	h=From:Date:Subject:To:Cc:From;
	b=dI+0Ye+AGlZIaH/LY1u7ma22xgJn7KvgemittR6jP5yziMo9nnkajES+zuH79aYo+
	 gpVnmRjPOgcWmWHPYwNZLY49I9zzd40rSPJ/m5qyMCHAabaxWfsE0qsO9rhgFh7zJ7
	 8gv+WuKNH7svThgQ/GeAWVvt2IqakwIkIV/Ucz6lX9XxEwQL1W0BUWkm+jTLmvYmd/
	 hyopqgm+mrSl28br7RKDPRBjt/D4F80WrPG75l938RoJuGq2sy0t/ljYiXof/G60hH
	 MLlNBTky/+Ro44yqw3expGOKqchH1DXLImcKd1EdadqUOj6IGplLMe3A6hz6on8onz
	 N0lrSXJAVki/w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 06 Jun 2025 16:53:03 +0200
Subject: [PATCH] media: bcm2835-unicam: Remove RGB24 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAM4AQ2gC/x2MSQqAMAwAvyI5G2hFK/gV8dAl1hyskqIIxb9bP
 M7ATIFMwpRhagoI3Zz5SBV024DfbIqEHCpDp7pBGWVQTsYrsbc7SnToouDKDwbtzNobOw42QI1
 Poar/8by87wcQphAQaAAAAA==
X-Change-ID: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TcHbFteQOmLGBTjvX6qik4ZH9aSmoF2gCaV1qnEzHEs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnODBcdQnQ+MO74st7wm4N2jPGUE8frxWuEpXdsn7D88
 bbGp2xXOqawMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBECl4yNhxzmWem2pHb0W8z
 8X/Ay9isuX6arzVjHykLq+0vjZTk423b9+R2ndlZueavVzgfCi6fyVim9C7/7AT/d99+ySU92mx
 mEPD+kpbb9gZPJY5VXTsVLismFtk9q1ooNbnhLH+6hY6cAgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_075311_162044_B688886F 
X-CRM114-Status: GOOD (  12.46  )
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

The RGB24 V4L2 format is defined as a pixel format with 8 bits per
components, with the components being in the red, green, and blue order
from left to right.

The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
RGB888) with blue coming first, then green, then red. So the opposite of
what V4L2 means by RGB.

Since the hardware cannot reorder the components, this means that when
selecting the RGB24 format, you get inverted red and blue components
compared to what you'd expect.

The driver already supports BGR24, so we can simply remove the RGB24
format from the driver.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
 	/* RGB Formats */
 		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
 		.code		= MEDIA_BUS_FMT_RGB565_1X16,
 		.depth		= 16,
 		.csi_dt		= MIPI_CSI2_DT_RGB565,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
-		.code		= MEDIA_BUS_FMT_RGB888_1X24,
-		.depth		= 24,
-		.csi_dt		= MIPI_CSI2_DT_RGB888,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
 		.code		= MEDIA_BUS_FMT_BGR888_1X24,
 		.depth		= 24,
 		.csi_dt		= MIPI_CSI2_DT_RGB888,

---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


