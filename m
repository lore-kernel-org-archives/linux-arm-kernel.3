Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47702C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHP1Kn4u1hbST9K3iiqbN2BkFflYyC4SeT8ll5DHOAU=; b=ZJuLmExYayUwLBOnHYRWsjNw7V
	BY7r7OGj+PEeBjdo+9j7RzO7HKfybWKyFbE/0lzcoIAmBBDR2JOjJe+tK0uB+IFkU66+1RF215sks
	RC0opWfVXQjER6FSL0P2hUrEysslBL4sYvRlFu2CjDPvVpItYs2gcZUA6IJFUj8+BnzxdoUEtR8pG
	BHtHBLAm1crgocSy/SfZWtNhG6Ld0LlATfoXVS2Q5LWdn+v8JeKIx1ge2YX5F9tRSzmSYr34yeNt+
	dBA4HbgFQ2jiTNU4O8hvDEuAAU1wf6YYbV7pjm7R3Xq5RJaxQnUp+NtnwM0qjHQ1+gEumszD3a/3H
	C1+CtR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYL3-0000000EUKN-0CkW;
	Wed, 06 Aug 2025 07:13:29 +0000
Received: from [203.254.224.25] (helo=mailout2.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujY8c-0000000ESZC-3cOw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:00:45 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250806070031epoutp02d698c9a9fc4bc3819e9abd39cc4dd2d5~ZG2CT-LRU0375803758epoutp02j
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 Aug 2025 07:00:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250806070031epoutp02d698c9a9fc4bc3819e9abd39cc4dd2d5~ZG2CT-LRU0375803758epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754463631;
	bh=EHP1Kn4u1hbST9K3iiqbN2BkFflYyC4SeT8ll5DHOAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exB3lSrHqLcljETr1Sy15vVeoUV4kV38wn4la7SiiYOKKzjOL3gqI4NH+mcqs6SFc
	 v8Hx4TvgKvXpEwEh2SD0A41RfZ3SNIoQGkwefKAZyO9tuAijApYCZzjAp26I4kOo+Q
	 YRuqdDzbr9D5n4fhEmZoqlU8FnAl/Za6LLrzZF9k=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250806070030epcas2p42ba0d1ddacb08bccdc3e4f97ea317069~ZG2Bz_v9Y2835028350epcas2p4T;
	Wed,  6 Aug 2025 07:00:30 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bxh5B3x25z6B9mG; Wed,  6 Aug
	2025 07:00:30 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1~ZG2A32YOF0152301523epcas2p1n;
	Wed,  6 Aug 2025 07:00:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250806070029epsmtip298a6e310946bb155b77ddf18434180b6~ZG2AzuvxD2044420444epsmtip2e;
	Wed,  6 Aug 2025 07:00:29 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v5 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Wed,  6 Aug 2025 15:55:11 +0900
Message-Id: <20250806065514.3688485-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806065514.3688485-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1
References: <20250806065514.3688485-1-sw617.shin@samsung.com>
	<CGME20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_000041_161405_B5EC518E 
X-CRM114-Status: GOOD (  15.48  )
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

Fix the issue of max_timeout being calculated larger than actual value.
The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
is discarded during the calculation process. This leads to a larger
calculated value for max_timeout compared to the actual settable value.
To resolve this issue, the order of calculations in the computation process
has been adjusted.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 95f7207e390a..0a4c0ab2a3d6 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -27,6 +27,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
+#include <linux/math64.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -410,9 +411,13 @@ static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
 static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
+	//(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV = 0x8000
+	u64 t_max = div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);
 
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	if (t_max > UINT_MAX)
+		t_max = UINT_MAX;
+
+	return t_max;
 }
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
-- 
2.25.1


