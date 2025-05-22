Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABCFC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gLuQCxbfr3KvUzpXAn2Xj8ogqL1aA5GUJ49CPSjbbFQ=; b=WE2y6lbfQxPRWau6vh8tqM6+yT
	HoANTWVZEuoC5geb3h2yQB+iuB2gdpiZWAh7VLC0yHEf0758Rf3JJ80uMEKUZTdg9Sv0KIcFxXCgk
	bAwaaNEckKk7Xy6D4s3sk1n+IMlMIYDZcxYZUBX4aZ4t4Pi+mVlTWhZe6Mu9m/HnlI/jh6KMJm5Xw
	onk6H/32Qloc8OsQav3MFDIE17yUCTKlxVGR2NMWsvjl9BadmU1kNY6xb3vX151g/9oQ1XYNDtDiG
	toqY7XM8zm/pcBl2oOuZjf6aL5r60D2j2G34TqeYRR0hMq4Aq2TEnK4F8S9WW3miqUGC/sIonRL+6
	rOr1qbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI73o-00000001HWG-3qFP;
	Thu, 22 May 2025 14:38:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6w8-00000001G14-3Pop
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:30:22 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1249605;
	Thu, 22 May 2025 16:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747924195;
	bh=wckcvoDCtVYuVQ45Vmpb0HC8Y3wDYK2Ihiq07qgCo8c=;
	h=From:Date:Subject:To:Cc:From;
	b=E4ciBaxdzUuNJthh5HtadlpLiY6WWDFJaR06D3BNyJhoWW66pT2iogyLDfu35es+H
	 a+/e+NTZ7pNXO7CFXvFyhJsX2Oehmt8QscKoQ/WsAPTws8Vup2ZcMUrslJWAiWP7kR
	 jd1n6zVMQmXobR7TcR4ufw4JIcnnk0opFkK/YK7E=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 22 May 2025 15:30:08 +0100
Subject: [PATCH] media: nxp: imx8-isi: Cleanup video device in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAO80L2gC/x3LSwqAMAwA0atI1gY0UBSvIi60TTXijwZEEe9uc
 DkM7wHlJKzQZA8kPkVl3yzKPAM/9dvIKMEaqCBXOCIMc1LfL8uNsl41GsAoFytGDhQqH+NQejB
 +JP6H6bZ73w8V4gWbagAAAA==
X-Change-ID: 20250522-djrscally-imx8-isi-fixes-fed2d7cffb1c
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=wckcvoDCtVYuVQ45Vmpb0HC8Y3wDYK2Ihiq07qgCo8c=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoLzT4FA2xMRgW+1iOA/DWAUW2zv16JdLFCB8IL
 NAHJxAkUCeJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaC80+AAKCRDISVd6bEV1
 MhrlD/wJW0XoG+ZwSn2u/l3SJPS1irfWIGnsuG4FaEnkWe5S8ViGOT1uKTAIWOX5Ih9j6Ab8kuD
 LryH9KAoBz7efLTDwE9EqkD77giZk2gmrzf1AQ14TGlLBygcXPi9eQY9VfrD2gKnCQourpIWLoN
 5G3tbE7tmnBIGGVX1Pq5SswUOElRNc4TKt4aq5jZqsVeKxESFpUWWTG4atsDhDqmjy6mWwqmZWF
 NddgYNAteNafnzejnyNlG7MeENDeLWaamGDzJ/+hH/AlTdDO0tz4ud8aqrNnkAeCrMHn/knk8mC
 ze/uj+K0XbPwkqQpgeo6tiNrVWpGfk+NRuL63XBlbEjC1XGbQmbnxQbYNNqc2hXChbwe6v6nxY+
 vdA8MRfvsjo/Ogz8x7eEzmoABmYnkjUbp0kA8vpc13wb+RdxKjz62WrFKI94a9pqgql9rRl9O+n
 egMZi/M/tkdEzH4f6W2HuWUPLoe6Gx8SxvZu2xFPYugnP4Yg7Tta8ukr01pK0fno2EYWK/+ahkN
 AWmKW5LM/XlLaR3G9BN9pQ2RWy9miU/xLQXNdbOHG6lWEG4+LaExrsej/DfHFGH59fB4AtAw/iU
 fMw2boDIoA43LCRsXDgx2J3MhGy4S3yMs5WF3FCmG8N3I+ZI2kPwH2cMLKJ3YbC+UBmVG4Al8Ma
 3cZ72ap908l1L0w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_073021_003382_EF788A2B 
X-CRM114-Status: GOOD (  10.52  )
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

mxc_isi_v4l2_init() registers video devices and v4l2 subdevices but
the video devices are not cleaned up in that function's error path
which means they're left hanging if it fails. Update the function
to clean them up properly.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 1e79b1211b603a71f0427e82a997787110f7e4ac..4a74b988217f504a03dfe330a7bac76cdecc933c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -154,7 +154,7 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 		if (ret < 0) {
 			dev_err(isi->dev, "Failed to register pipe%u: %d\n", i,
 				ret);
-			goto err_v4l2;
+			goto err_cleanup_pipe;
 		}
 
 		ret = media_create_pad_link(&isi->crossbar.sd.entity,
@@ -164,14 +164,14 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 					    MEDIA_LNK_FL_IMMUTABLE |
 					    MEDIA_LNK_FL_ENABLED);
 		if (ret < 0)
-			goto err_v4l2;
+			goto err_cleanup_pipe;
 	}
 
 	/* Register the M2M device. */
 	ret = mxc_isi_m2m_register(isi, v4l2_dev);
 	if (ret < 0) {
 		dev_err(isi->dev, "Failed to register M2M device: %d\n", ret);
-		goto err_v4l2;
+		goto err_cleanup_pipe;
 	}
 
 	/* Initialize, fill and register the async notifier. */
@@ -212,6 +212,9 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 err_m2m:
 	mxc_isi_m2m_unregister(isi);
 	v4l2_async_nf_cleanup(&isi->notifier);
+err_cleanup_pipe:
+	for (i = 0; i < isi->pdata->num_channels; ++i)
+		mxc_isi_pipe_unregister(&isi->pipes[i]);
 err_v4l2:
 	v4l2_device_unregister(v4l2_dev);
 err_media:

---
base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
change-id: 20250522-djrscally-imx8-isi-fixes-fed2d7cffb1c

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


