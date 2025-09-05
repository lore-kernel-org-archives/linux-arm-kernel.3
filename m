Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BB9CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooWfYBgMzL1HgRQvYlxiux0h/MzDlMT3KW8zBL4DMug=; b=EZC1xUkvMW1xbTQafQM6HVKyt+
	YKvx3zNVpuyImnbsdNhLza1R6m//Hdq1hi3F5c2JhOhsCfI6VsH9P79qH5c9hoy6DVNqc+ocRk0bN
	5dMtWIN3SMIdGaghKiiY9Qj9ktyIcZipCQnThnp4jAL7xIHFQklxefRtgEK0TIdA+sD8GCioCiA3L
	0TCb+qXAx8Jh8t+jy+j5JQnlKEhKzZDhedy3RypOn4QV8AVG7QIkNAwAWt3HejyMIRyS/8GZU8RBZ
	ByN/HQ2AvFMooKwKXcUajIPmBq4uMCL1iK1182RmD/q9yU4r0/E4BsfGtNx0rXAR5UIKq8VCI9H8V
	SjxURd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXYk-00000002Oqv-1ucQ;
	Fri, 05 Sep 2025 14:37:02 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuU8E-00000001DIv-2fZl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 10:57:29 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250905105715epoutp02d5b188862e555ddb5f458bead28a159b~iXbTCVpPk2624126241epoutp02C
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 10:57:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250905105715epoutp02d5b188862e555ddb5f458bead28a159b~iXbTCVpPk2624126241epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757069835;
	bh=ooWfYBgMzL1HgRQvYlxiux0h/MzDlMT3KW8zBL4DMug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=np7fmyJ5H9lGa1PORLtAIWKDb92ferHWfmhRaXTwdusrOLUZmZfSFeO8hldaUW2lW
	 4AXYN/aVqsQ99X5X3PPPxKLeTtdCJMyaL5vLRGj1zdJePPLLolGEMY1b7t1LVPRyyn
	 8/5UVhrrgKEbbHq1/mADOW3N/TylU6osBGRGvflE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250905105713epcas5p41d465581cf2290d58cd98c4b0a4c643c~iXbRWBSlb2479124791epcas5p4b;
	Fri,  5 Sep 2025 10:57:13 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cJCwS5XCdz6B9m5; Fri,  5 Sep
	2025 10:57:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43~iXbP9aZN20553305533epcas5p3r;
	Fri,  5 Sep 2025 10:57:12 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905105710epsmtip26d1fd9792e6bbd2ec4ada09f930c876f~iXbOQqDrP0831308313epsmtip2T;
	Fri,  5 Sep 2025 10:57:10 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v3 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Fri,  5 Sep 2025 16:35:53 +0530
Message-Id: <20250905110554.2212304-3-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905110554.2212304-1-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43
References: <20250905110554.2212304-1-dev.tailor@samsung.com>
	<CGME20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_035726_990740_8D863953 
X-CRM114-Status: GOOD (  17.79  )
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

The on-chip RTC of this SoC is almost similar to the previous version of
SoCs except for S3C2410_TICNT tick time counter, which is used in this
driver but not applicable for exynosautov9. So re-use the existing driver
skipping disablement of S3C2410_TICNT in s3c24xx_rtc_disable() callback
via a new boolean member of s3c_rtc_data.

This has been tested with 'hwclock' & 'date' utilities

Suggested-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 79b2a16f15ad..8fc5b4582b6d 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -48,6 +48,7 @@ struct s3c_rtc {
 
 struct s3c_rtc_data {
 	bool needs_src_clk;
+	bool use_s3c2410_ticnt;
 
 	void (*irq_handler) (struct s3c_rtc *info, int mask);
 	void (*enable) (struct s3c_rtc *info);
@@ -369,9 +370,11 @@ static void s3c24xx_rtc_disable(struct s3c_rtc *info)
 	con &= ~S3C2410_RTCCON_RTCEN;
 	writew(con, info->base + S3C2410_RTCCON);
 
-	con = readb(info->base + S3C2410_TICNT);
-	con &= ~S3C2410_TICNT_ENABLE;
-	writeb(con, info->base + S3C2410_TICNT);
+	if (info->data->use_s3c2410_ticnt) {
+		con = readb(info->base + S3C2410_TICNT);
+		con &= ~S3C2410_TICNT_ENABLE;
+		writeb(con, info->base + S3C2410_TICNT);
+	}
 }
 
 static void s3c6410_rtc_disable(struct s3c_rtc *info)
@@ -550,18 +553,21 @@ static void s3c6410_rtc_irq(struct s3c_rtc *info, int mask)
 }
 
 static const struct s3c_rtc_data s3c2410_rtc_data = {
+	.use_s3c2410_ticnt	= true,
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
 static const struct s3c_rtc_data s3c2416_rtc_data = {
+	.use_s3c2410_ticnt	= true,
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
 static const struct s3c_rtc_data s3c2443_rtc_data = {
+	.use_s3c2410_ticnt	= true,
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
@@ -574,6 +580,12 @@ static const struct s3c_rtc_data s3c6410_rtc_data = {
 	.disable		= s3c6410_rtc_disable,
 };
 
+static const struct s3c_rtc_data exynosautov9_rtc_data = {
+	.irq_handler		= s3c6410_rtc_irq,
+	.enable			= s3c24xx_rtc_enable,
+	.disable		= s3c24xx_rtc_disable,
+};
+
 static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	{
 		.compatible = "samsung,s3c2410-rtc",
@@ -590,6 +602,9 @@ static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	}, {
 		.compatible = "samsung,exynos3250-rtc",
 		.data = &s3c6410_rtc_data,
+	}, {
+		.compatible = "samsung,exynosautov9-rtc",
+		.data = &exynosautov9_rtc_data,
 	},
 	{ /* sentinel */ },
 };
-- 
2.34.1


