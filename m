Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9E2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnQ9+b8org6s1pxYGa7eJ31JPvtF7h8oe1U+bvOBcuc=; b=U25Egdn+DFv2XZDunSTYFDXXi2
	JeVYqB8K1JZUNIlkv6+fN99YThPiTpIngakUN1J/aKYLC3qcjXMEi43ApPej2pt7aDzbg7GDt8xXF
	RveccUlUaqDx2TO3/MM7kS7cTRwFNkOdyf+0YD806M8MXlPURhwW2nIVjAa+QCjzFmKGnmeITPW5X
	hYJw9/ZbVFpiHWpCvAFz65vW2AUS5M7Cs4S4WvjaqIVO1n8obYPV09IfpqjozApkFd1XAmUtTK2ZQ
	GP4+Ge3RNzz5+D3SQzJQONjHeCdpwDJIhEqMIGvHXmtt8tWRIb/JuTl+5oCs//lV3iUYEVEer9ZO1
	UaksRpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmWr-0000000C15k-29aB;
	Tue, 13 May 2025 10:06:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmNs-0000000BzYQ-3qSc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 09:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DnQ9+b8org6s1pxYGa7eJ31JPvtF7h8oe1U+bvOBcuc=; b=OTKGWULXjUynMYc8mJzCyTl28D
	s5VdKOSPfndzyecfvAXDR1Xi5wF2E24pe8w1jtWpbgUYZ259Y/3yZ1xSKQYMtDw3XJyzjcjx2Rl3J
	ZY/s4uvtmRJoK241D37nqmPcxHkLAozKbYb+/39LdWU4oNk2/6e+0ZKlhOV6KrjgE575YS1Srx6+U
	DgSdddu3h5+3F3ASLyb21+yb7G5bCd6dIDXzP8mWhLNeca0f05E4QSvXaXrdmD1kfAkCwTzA+IBfa
	Rll2jnJDMdfmKDtJJdyTA8yKqLCX5GO6of3rV4K5Ge076vv94rdI+4M3vGnd/X7S+dm3biFTtmTxT
	P+yk79ag==;
Received: from mailout1.samsung.com ([203.254.224.24])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmNo-0000000GuXb-0Scc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 09:57:11 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250513095702epoutp011d6b35210b035530319123079ddc992e~-Da4tD3Pf1833118331epoutp01N
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:57:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250513095702epoutp011d6b35210b035530319123079ddc992e~-Da4tD3Pf1833118331epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747130222;
	bh=DnQ9+b8org6s1pxYGa7eJ31JPvtF7h8oe1U+bvOBcuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1Cam7XMsSsvHHNaKz3EsUJ3+PTYvj0lbOsxJfrAjJFdMYSJjwATHvqK/KZ2VZafl
	 nHPLOghHxiAEtoSjzEIe3TuzSRaAq9iaWn4VWnysKJofJ0N+xI1OBHBbGV54ehKadP
	 sW5A56E1UWagsIcH/fBOZIF0KnrW5HPWX3Mk2zvA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250513095701epcas2p3f757cc5a03c93e1b839c161b622205b1~-Da4LcN2M3204032040epcas2p3p;
	Tue, 13 May 2025 09:57:01 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZxX251CFsz3hhTB; Tue, 13 May
	2025 09:57:01 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250513095700epcas2p33505c67ac3c3ba687ccf4a70ade10a34~-Da3HTgts3204032040epcas2p3j;
	Tue, 13 May 2025 09:57:00 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250513095700epsmtrp12431157914af9efc70fc92756bca32ed~-Da3GYVE51976619766epsmtrp1e;
	Tue, 13 May 2025 09:57:00 +0000 (GMT)
X-AuditID: b6c32a28-edfbf24000001e8a-1a-6823176c5881
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	47.78.07818.C6713286; Tue, 13 May 2025 18:57:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250513095700epsmtip2957cf38d053f24a138e555a24906be87~-Da29BYeS2427724277epsmtip2j;
	Tue, 13 May 2025 09:57:00 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH 3/3] watchdog: s3c2410_wdt: exynosautov9: Enable supported
 features
Date: Tue, 13 May 2025 18:47:11 +0900
Message-Id: <20250513094711.2691059-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513094711.2691059-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsWy7bCSvG6OuHKGwaKTEhYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZTSd72UrWMpd8XjBR+YGxouc
	XYwcHBICJhL3n6Z1MXJxCAnsZpTo+nSDDSIuJfHumWUXIyeQKSxxv+UIK0TNB0aJN4c3M4Mk
	2AR0JKb/u80CYosIxEkcaweJc3EwCzxilLgyr4cJJCEsECzxZetfZpChLAKqEveX5oGEeQVs
	Je4s38kGsUBeYual7+wgJZwCdhJfW5RBwkJAJe/mbGGCKBeUODnzCdgqZqDy5q2zmScwCsxC
	kpqFJLWAkWkVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpecn7uJkZw2Gtp7GB8961J/xAjEwfj
	IUYJDmYlEd7G7YoZQrwpiZVVqUX58UWlOanFhxilOViUxHlXGkakCwmkJ5akZqemFqQWwWSZ
	ODilGpi870+uXZccdTCqSjP42EmLmSHaj7VzLrbJKyqcK+dg3fjGK4nvl5rCmvwgQdN5TVNu
	hWwrO9LRlnr10e+fxyvuC6/ZsZpRy+ntuukNAV88lW0M5XP25AjwHS1o8Zfb7cjDyC4p2MN7
	5O/PRoPXS+MOagivvHr18JGXwo75Piy5XGcMfENtF7W+EODMLzCe/CpPJOcgT7wF2/zNcct8
	ZojaGKkovJh421Zf+nbDBjkxzyRGhZ3+2htWVVjday3MvKW4e4aW7d8FdQyfxXeGWr5I6v/I
	zZ7+ecu1ghVRolyOynXCKbU/9h8ycd7A38Jjmb1y++EpXpsOt5tsS223FHaPWSvbe3Oi8qwb
	RUvtlViKMxINtZiLihMB22VAl+oCAAA=
X-CMS-MailID: 20250513095700epcas2p33505c67ac3c3ba687ccf4a70ade10a34
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513095700epcas2p33505c67ac3c3ba687ccf4a70ade10a34
References: <20250513094711.2691059-1-sw617.shin@samsung.com>
	<CGME20250513095700epcas2p33505c67ac3c3ba687ccf4a70ade10a34@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_105708_921777_CBDC2F91 
X-CRM114-Status: GOOD (  16.92  )
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

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 48819246f1ac..a630d5da3ba1 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -274,7 +274,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -286,7 +287,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
-- 
2.40.1


