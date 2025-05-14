Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B78C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9nR+4yjOvh1XbA9AsmONTB28VO11laEZY8Ec+hddHA=; b=QGkwpRkDo81JqZTc1/RccX40tD
	niPRYEayfR48xSk0d3gAtX4/XVYvTBdV4S7P+TouPUTOIoa64p3ocVaIlt4LBpH6xsoTj+snI7j1M
	kSz0NbzAiiam+sSo7s1iIP15zfxAm8lOZTwro88ajJH3lTR1TjjtY3TwxQHRyYmPpVldHXq4d+MBk
	3ooj8IC6Uk5722mDKuv9sBczHlbgTYZhBS0w+w/wce9VcKefTU3jGYdNSiNl01VOPb3t/x6dNou88
	253+44rTBGQ8Olmf923mBaJNFUeu3s09D+8KaHc1RJoyjaMRYajEwdQCsCD53GoXoBC79ekJ1xEYw
	8AKHqfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5H-0000000F2go-3TTt;
	Wed, 14 May 2025 12:19:39 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8o7-0000000Ej4o-0Whq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:53:48 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250514095342epoutp02a173bfb5b6f76decd8fd550714bcefd0~-XBRJrsQ02558825588epoutp02y
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:53:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250514095342epoutp02a173bfb5b6f76decd8fd550714bcefd0~-XBRJrsQ02558825588epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216422;
	bh=F9nR+4yjOvh1XbA9AsmONTB28VO11laEZY8Ec+hddHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+UPB3saAahHjPu1LaWVZL6z3lnKcijMlonRVnlK7J5sW73Kf/jWNtTK0cyxsXBKP
	 KTxuqjusrBNz17XrqQ2FxoJutCX987ppQXGRl2AJloQfXlTL0PqlSTe2TZLFAC2OWF
	 EgoJB4C4N7yXCavavzKfPyoBufKxDuC6PYIi5Vn8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250514095342epcas2p4e93a4c35b70d89577b32214afeef708d~-XBQ0Y1Mo0421404214epcas2p4E;
	Wed, 14 May 2025 09:53:42 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zy7vn67Dkz3hhT9; Wed, 14 May
	2025 09:53:41 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514095341epcas2p4f4bb6da7fa61f19610e63ee605eea94c~-XBPyMg9h0421404214epcas2p4D;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095341epsmtrp16ccda6f6dbd6411a230b3289924ab0b0~-XBPxhGW-1996219962epsmtrp1R;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-15-68246824de58
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B8.C4.07818.42864286; Wed, 14 May 2025 18:53:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095340epsmtip1ab4469196d723c53a1b1d9ac55153c78~-XBPh6vsY3233232332epsmtip1Y;
	Wed, 14 May 2025 09:53:40 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_MAXCNT
Date: Wed, 14 May 2025 18:42:19 +0900
Message-Id: <20250514094220.1561378-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsWy7bCSnK5qhkqGwerFzBYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZTQuOste8IOzYurTa6wNjFs5
	uhg5OSQETCTuX1vC1MXIxSEksJtR4k/zU5YuRg6ghJTEu2eWEDXCEvdbjrCC2EICHxglLs6p
	B7HZBHQkpv+7zQJiiwjESRxr38wMModZ4BGjxJV5PUwgCWGBGInGCZfAbBYBVYmfn56wgdi8
	ArYSV6Z9ZYJYIC8x89J3dhCbU8BOYm5LKxvIDUJANU3bPSDKBSVOznwCtosZqLx562zmCYwC
	s5CkZiFJLWBkWsUomVpQnJuem2xYYJiXWq5XnJhbXJqXrpecn7uJERz4Who7GN99a9I/xMjE
	wXiIUYKDWUmE93qWcoYQb0piZVVqUX58UWlOavEhRmkOFiVx3pWGEelCAumJJanZqakFqUUw
	WSYOTqkGJudvG2cdMmZmdWpwPOP7mXWP7gNNgz+3p+kVzvnMu/8Z58PO+AJ7P4MEU6abGeZ6
	n87Ku+3s2KEurzhRUDJE1amslPul/4XyMONZqvLuLmIsaZuOtD01Z4kP+XPO55tmUdzbyV9e
	7996SuawlKrys1OT7dnW806zvK7iJiL8iG+P40mNBd9XFQnLq02+sia3SHTu67KX5UIh0uvm
	rFCqs6jpFvBf/EAvhSW5cP7EoIyLtkk3uR88OaD2elmspssX51xpZp95RVHVMrd7391278qy
	rNv5X8BWM8Pu5Jvtib/2uzyIlGteVyf8SsTXKrbIQav/lWBOS8v5+CnPVMQqPgsc6dro3WX+
	4NiiziAlluKMREMt5qLiRADbeOu/6wIAAA==
X-CMS-MailID: 20250514095341epcas2p4f4bb6da7fa61f19610e63ee605eea94c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095341epcas2p4f4bb6da7fa61f19610e63ee605eea94c
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095341epcas2p4f4bb6da7fa61f19610e63ee605eea94c@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025347_480700_BD053811 
X-CRM114-Status: GOOD (  15.30  )
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

Enable QUIRK_HAS_32BIT_MAXCNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 1c7299deec5d..3c12a3ae50f8 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -326,7 +326,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -339,7 +339,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.40.1


