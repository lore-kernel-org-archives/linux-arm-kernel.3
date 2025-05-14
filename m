Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0445BC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euDg0lpNrnAL1l5Mdnq3mtKgKzdVtdPZ2zegxJqxchA=; b=HryYGbXpgsmyFQChdW+EAQ3LBK
	7ezq+tcWCbecPLHByChf31F7gntnw8VmqcScwcwe7mQLm45t699zpiE3SqzQ5P5gIHNhf1r43p0Mq
	a/7JgklJTlxFMs1VgHagEZrD2P96+xFM1zmw/M5Ri3OOnrY4H4PwZ9T1nncDi9ReCb9JZGoIucOYS
	OsrtgUQ+JRNX8vZ6uig97rBGXuAZg/qVXTnctzP/qWSdu7bYEIeviA98eDA0DJ+someXWpvwJllAD
	RazJF87m2qn4YN+g9Qo50W45mxHrmnPjdQEqB/x43IItRVNFlBeb9SDtmN0FChHblcCAjqoLkt//S
	nyjSX03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5K-0000000F2mv-1QLE;
	Wed, 14 May 2025 12:19:42 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8o7-0000000Ej5e-2P0P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:53:49 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514095343epoutp042f5f91138ba2edcccd3c2a635b3057ca~-XBRy-plT0285702857epoutp04g
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:53:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514095343epoutp042f5f91138ba2edcccd3c2a635b3057ca~-XBRy-plT0285702857epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216423;
	bh=euDg0lpNrnAL1l5Mdnq3mtKgKzdVtdPZ2zegxJqxchA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VCzszoMPD7nw+jtgtfo2yfzdf/o4bMLtODt74fiW+R3xb4WJ06a0eCqguMG3Yn7SH
	 szze6IKugVyKyuyOuQzR59luLsAEpd0Sv8D99ePX/GC46n0/wJjKCWniNFo9n0K9IU
	 BlBPudwPjGSHHgXhte574g6PB2FsE6YePr7cWUY8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250514095343epcas2p134dadafb319aee512fab07dc76564974~-XBRh5m0j0288702887epcas2p1D;
	Wed, 14 May 2025 09:53:43 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.101]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zy7vp4ZT4z6B9m7; Wed, 14 May
	2025 09:53:42 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250514095342epcas2p366f8abb441850d4b503926425082f2e7~-XBQj9krg1373113731epcas2p3H;
	Wed, 14 May 2025 09:53:42 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095341epsmtrp1a88bf0b1c84a630ccc397dcf28e64214~-XBQiV3do1996219962epsmtrp1S;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-da-68246825082b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B9.55.19478.52864286; Wed, 14 May 2025 18:53:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095341epsmtip16e419ee7529645ed800122dee606b8f0~-XBQYfbc43083530835epsmtip1Q;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Wed, 14 May 2025 18:42:20 +0900
Message-Id: <20250514094220.1561378-6-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnK5qhkqGwcUvFhYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZcxcsp+5YCl3xeVVdg2MFzm7
	GDk5JARMJNrP/2fvYuTiEBLYzijx42AzaxcjB1BCSuLdM0uIGmGJ+y1HWCFqPjBKTNzwnwUk
	wSagIzH9320wW0QgTuJY+2ZmkCJmgUeMElfm9TCBJIQFwiR6v+5gA7FZBFQlWs6sAovzCthK
	9Ow4xQixQV5i5qXv7CA2p4CdxNyWVjaQI4SAapq2e0CUC0qcnPkEbBczUHnz1tnMExgFZiFJ
	zUKSWsDItIpRNLWgODc9N7nAUK84Mbe4NC9dLzk/dxMjOOC1gnYwLlv/V+8QIxMH4yFGCQ5m
	JRHe61nKGUK8KYmVValF+fFFpTmpxYcYpTlYlMR5lXM6U4QE0hNLUrNTUwtSi2CyTBycUg1M
	OQ9ebZu/7MeX7QvCo77LvNzxwb2c/VP3m6cZEterUx4GLJqw6GHT4r8XLmZ/63q3qpG9wPR/
	4mfhJV6hV5acCzi7PGrP79KnK/jOGbzc8eRWh9O6BKt8if+hzmU32RUu3n79dVJCiwjHp9gE
	MeYmKWvGFwzulq7nCz/w7UhX+1z/R8NV78WRdT9WZRZFXLfSf3Gv4seO2qstd9/Ihc29HtQV
	r/zisnq/lEFsrKd+/bw40fyo1uUP5k39fpDlo8NzmeArSYZ9Ei68mk1l1pVtmQwbXv1VFH5w
	6eQp+y+bV39y0TTrM7i6+kH/uy0x88xkglslDrgwb+zitZvqtcG6Ztmd+ud7TdbrmBo48E1s
	UmIpzkg01GIuKk4EAO3sg/fnAgAA
X-CMS-MailID: 20250514095342epcas2p366f8abb441850d4b503926425082f2e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095342epcas2p366f8abb441850d4b503926425082f2e7
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095342epcas2p366f8abb441850d4b503926425082f2e7@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025347_930400_76F59439 
X-CRM114-Status: GOOD (  14.86  )
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
index 3c12a3ae50f8..bbc1d9916f67 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -275,7 +275,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -287,7 +288,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
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


