Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4335C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E+pV7n6F1eiQsjNgSMeovGhdczmhV6c5wMuEuVtyBs=; b=snFeUVEBqGTqDoRwXtQwCec+G5
	9H/3w7TJGQjAp1YTnljdNyGv8YMHzdYb0aSVsjggTiF/9hhrQnayk9PEX1aBzJxexGkJP0HjB7TVK
	VBHYLZ2gUdvWHoSlO74eG3DxkRMzggvhs41zCy4ZCNZC2jNbr4uorBFRocEXsfmJBMLAFy1Sx6i8x
	ixuDSqJQsHITXK3zjfRVY+f+SNmM+1yAHunm0FiQVpqxqwwHrQv1zOYS9AfChp9ZNORbsFm7FvRrp
	/C3fWfbwUISDugUadiv9Jkrlq8XCYc4O8Tj3S1E2hurZwOqfhBfA+tHb9bYwz9FMtVpj3aT65ZpT8
	N5iXwipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTm9-0000000HU4D-2NiZ;
	Thu, 15 May 2025 08:17:09 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTYl-0000000HROl-17PC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:03:22 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250515080311epoutp01c78af921daa8fd890e82f7c7d0a3e037~-pKD6Gf541013410134epoutp01G
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:03:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250515080311epoutp01c78af921daa8fd890e82f7c7d0a3e037~-pKD6Gf541013410134epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296191;
	bh=6E+pV7n6F1eiQsjNgSMeovGhdczmhV6c5wMuEuVtyBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pmYFseS5N4H5pnvdK01BIqDgEPdkLbvewVptfUh5Fm17MgtQKW60Djm8m2yMvEQH3
	 mHwLJ1AzgqUoIGf7KbfJBEDb1hg3LGGwujszqKPyHBZRsPb0FFl4BYIpuqn76ISwkl
	 0UDXurBYrUF+AgSjqWCBnhjX0NVlyQNoDmAg/i/k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515080311epcas2p37c9372ba816747ad9656a31ce32f9b3f~-pKDlpvx90512805128epcas2p3N;
	Thu, 15 May 2025 08:03:11 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.102]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyjPq0RPgz6B9mS; Thu, 15 May
	2025 08:03:11 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250515080310epcas2p3e045327d03d031d38614464e881957d1~-pKCtzKMG0512805128epcas2p3J;
	Thu, 15 May 2025 08:03:10 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515080310epsmtrp251f35ed8e6bc7e92010376c57bc1c705~-pKCsNObh0272802728epsmtrp29;
	Thu, 15 May 2025 08:03:10 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-08-68259fbe1191
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	FD.77.19478.EBF95286; Thu, 15 May 2025 17:03:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080310epsmtip2d6c9b47d2e65d4be8635ae76e0ab739b~-pKCeOpfZ1291412914epsmtip23;
	Thu, 15 May 2025 08:03:10 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Thu, 15 May 2025 16:53:50 +0900
Message-Id: <20250515075350.3368635-6-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSvO6++aoZBscvCVk8mLeNzeL8+Q3s
	FpseX2O1uLxrDpvFjPP7mCxurNvHbvFk4RkmixmLT7JZPH75j9mB02PTqk42j5Vr1rB6bF5S
	77HzewO7R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGVMfTObpeA9V8Xe263MDYwLOLsYOTkk
	BEwkmt9sZ+xi5OIQEtjOKLFp8R32LkYOoISUxLtnlhA1whL3W46wQtR8YJT41PWfESTBJqAj
	Mf3fbRYQW0QgTuJY+2ZmkCJmgZ2MEi3TfzODJIQFwiRevP/LBGKzCKhK/Nl0gBlkAa+ArcSy
	WXUQC+QlZl76zg5icwrYSUy8uAtsvhBQyeE9T9hAbF4BQYmTM5+A7WIGqm/eOpt5AqPALCSp
	WUhSCxiZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIEB7pW0A7GZev/6h1iZOJgPMQowcGs
	JMJ7PUs5Q4g3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZqakFqEUyWiYNTqoFp
	cX9q4vrq1qslwjMnr5nH0f+S92yvjdIK8yb2AwdEn6zOvcffNKWi7mi18LsnLcdCY16nB93m
	q+TeqrrQPYNtpeUkG2bhjaxBLq8vaH9ZUn8j2u3dLPa1f1mEQ/RsFyjMmTzrz+Krtz5s8Fq+
	Sv2nbeWeekO1Ei13TYPO2gOCmtfeGG5nsPv/MdiAU9JelkVk4k2e0xnNV2eHJvbeSeR8ev38
	lnMfQn7t/s7ZZvWYlzOzytSaN3PN/HX77H9xhsiovp+tv9f6eJOZVWYA06z4Z2t4p2esvFav
	t9Kw8KDW7UUuxreWqRzoFnnc48RyueNzweYLf8t4p6lsfBE06Yip8Ob911oi5pw5fzzvGPde
	JZbijERDLeai4kQAlpDYcuMCAAA=
X-CMS-MailID: 20250515080310epcas2p3e045327d03d031d38614464e881957d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080310epcas2p3e045327d03d031d38614464e881957d1
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080310epcas2p3e045327d03d031d38614464e881957d1@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010319_631155_826861E7 
X-CRM114-Status: GOOD (  16.99  )
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


