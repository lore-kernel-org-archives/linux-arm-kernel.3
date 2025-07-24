Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3B5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsQQNaYSRD2U8LOrlkyZxDfezSoAFEk1Vqrj9+PASX0=; b=MOK82k2RwzI8aOEuuls3mqnrY4
	tEXJ0X+f/BgXUXndjmDQ0rFFIk++9O/9EY4ni33+4ErgSzLRqz8nsr3CRfelBzxq2+TntxMxkwjFF
	7q+eZizBQ7FuD8W8BGAjC9Isd3XYTwkjJDW/Z5xyqz+KQGIBgRe2JgJab8KOjbQbhPSXcyr4GeVDW
	lj3I4IO4/WSTlNbwfdv0eYO1vIJeiZOhmZ7lxPFs+b/mCAl2RiQgoU6AYfg32dnsCOULn3CzPPy6l
	+gkvohgmCMV+9+OR82X8eZxtBk/IFssZopG2pW/IGOyXwuBOY7Q/v+kyk35U/QxTYY6kFms8Y4lSj
	F5Zrk/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ues2z-000000070Po-0AAt;
	Thu, 24 Jul 2025 09:15:30 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uer5F-00000006os6-1CPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:13:49 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250724081338epoutp04c515120d2c6d79ec3acebed91dd92cac~VIdK51IGk1684916849epoutp04q
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250724081338epoutp04c515120d2c6d79ec3acebed91dd92cac~VIdK51IGk1684916849epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344818;
	bh=QsQQNaYSRD2U8LOrlkyZxDfezSoAFEk1Vqrj9+PASX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IE/PiPjCu4yG3f3DRwt1j54cxsgRyc7ra0+WkQTkBuu+hb+T4ACthfPWLeUKgHBtB
	 Q8Rw1AEZEri4Wf+f+B5Zb3lO/c0ptVaVHmIMlDjJh0hgs5HV+6/rgrMEL7oJ2OcUl+
	 S80RyNeco0x3Z2nCxuLBEr1QSbAlRMHdQQNWLgxs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p25a24d73f6497f2b680918d4f8e2ca4df~VIdKgCcht0557505575epcas2p2B;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.102]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bnkKY5n7Mz3hhTB; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45~VIdJSia0H1004510045epcas2p4C;
	Thu, 24 Jul 2025 08:13:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081337epsmtip15995237414cebf3f8f4d85e133d21737~VIdJO8PAw1874118741epsmtip1K;
	Thu, 24 Jul 2025 08:13:37 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 4/4] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Thu, 24 Jul 2025 17:08:54 +0900
Message-Id: <20250724080854.3866566-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724080854.3866566-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45
References: <20250724080854.3866566-1-sw617.shin@samsung.com>
	<CGME20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_011345_890521_FCB49FEF 
X-CRM114-Status: GOOD (  12.86  )
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

Enable supported features for ExynosAutov9 SoC.
- QUIRK_HAS_DBGACK_BIT
- QUIRK_HAS_32BIT_MAXCNT

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 184b1ad46ca6..16a845f41e74 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -305,7 +305,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -317,7 +318,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
-- 
2.25.1


