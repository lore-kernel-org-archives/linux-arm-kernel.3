Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6413BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 06:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+/rrda8ib7zX55HJF6zNx//IkDV6WKc4dFWq+87emM=; b=y5bjgKAwmtX1tqcTtCcYQubQUH
	oaX0eIHOe3oR0S5ADUmTio24Sb9+0G+3ircDQvc3kUXBKiqOBOsaIRwcaqw+lEi9mlaCr0DgWxdfZ
	AXbS3u2HK1hHYQvOicwLL0icPsBc1Zzj2Pvw2+4VhtvTOdrlf+Z9LXo1nICSly6vP38Wqatw2+96q
	5I4Dc3KJE+bEg1Lyy18tVK9d457o2wHP2BJ/lj5WvTF9ULcKg68GHJdgtDt2NVPXauXZ867DFOB1f
	rA2yrxTyyExtkQ1ViJThtBc0j7erS+qn1M9VK32/PsWi4BjWa2Heg089/C9bwbvVHvUdgAlxLR7Ye
	Qj9974DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7TJ-0000000DsnV-2riM;
	Fri, 11 Jul 2025 06:43:02 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7Mq-0000000Drcz-1Eb3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 06:36:21 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250711063613epoutp012aa84410d53c2416bc7469ba3a0d07cd~RHvZWVuLb0195701957epoutp01L
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 06:36:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250711063613epoutp012aa84410d53c2416bc7469ba3a0d07cd~RHvZWVuLb0195701957epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752215773;
	bh=U+/rrda8ib7zX55HJF6zNx//IkDV6WKc4dFWq+87emM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hIUd8iICX39vSZyq0d+jB3off7/csR7Q6dzgxCUvzusLLsv5vzzWv3XgMYtoL1VMb
	 XYABELOpIThZ647owUVWZ8LAMkSoAYrT0SvEUFyvtK+P8yE+sPxKz+y56iaThHfYQ/
	 2f7cYRvtGOBghcyooZtZcEheOZHkoSOGueko2n4o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250711063612epcas5p35a5f41544a3407fd44a482ef63e834ce~RHvY_8_AP2513825138epcas5p3m;
	Fri, 11 Jul 2025 06:36:12 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bdhn71zVqz3hhT8; Fri, 11 Jul
	2025 06:36:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9~Q1lnqmpmI0133701337epcas5p4q;
	Thu, 10 Jul 2025 08:25:36 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082535epsmtip1530e1f1f7803df409b271014bb8e7acf~Q1lmJoIVI0693006930epsmtip11;
	Thu, 10 Jul 2025 08:25:34 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Thu, 10 Jul 2025 14:04:33 +0530
Message-Id: <20250710083434.1821671-3-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710083434.1821671-1-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_233620_645301_85CECBDD 
X-CRM114-Status: GOOD (  17.77  )
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

The on-chip RTC of this SoC is almost similar to the previous
versions of SoC. Hence re-use the existing driver with platform specific
change to enable RTC.

This has been tested with 'hwclock' & 'date' utilities

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 5dd575865adf..8db24b6360b8 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -384,6 +384,15 @@ static void s3c6410_rtc_disable(struct s3c_rtc *info)
 	writew(con, info->base + S3C2410_RTCCON);
 }
 
+static void exynosautov9_rtc_disable(struct s3c_rtc *info)
+{
+	unsigned int con;
+
+	con = readb(info->base + S3C2410_RTCCON);
+	con &= ~S3C2410_RTCCON_RTCEN;
+	writeb(con, info->base + S3C2410_RTCCON);
+}
+
 static void s3c_rtc_remove(struct platform_device *pdev)
 {
 	struct s3c_rtc *info = platform_get_drvdata(pdev);
@@ -574,6 +583,12 @@ static struct s3c_rtc_data const s3c6410_rtc_data = {
 	.disable		= s3c6410_rtc_disable,
 };
 
+static const struct s3c_rtc_data exynosautov9_rtc_data = {
+	.irq_handler		= s3c6410_rtc_irq,
+	.enable			= s3c24xx_rtc_enable,
+	.disable		= exynosautov9_rtc_disable,
+};
+
 static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	{
 		.compatible = "samsung,s3c2410-rtc",
@@ -590,6 +605,9 @@ static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
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


