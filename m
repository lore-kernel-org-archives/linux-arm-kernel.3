Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AEAC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdFJaAx/M3iRHEOHSD0PcPVz0vpeIpXT7Cc80F0NI1Y=; b=CxM8CrIqe7zVMkyyJ1igQ5LYQD
	cJFKEyRhzyZrokJPncTrVt7kDgTwNX1XMtQxJ2cfs7xmxEejslH+sw8i1+MASiRnF3ImHaUZ5uwei
	avinklrTVR++3UICkTmwot8ZoyS+Hr/gdX9t7lV4FXBB6RwgZxfCYJU7cQzWgfQ0yhkPYkOy3gail
	VHSEgMznwyqdoCX5TVsg3ob6exa/BdWaoyMUyo29ot3m2S9q/qyv7/pzmajPjW13qdtj3VmybGNdc
	Gwk2hrKoiKSpjICXEWr8uOoi4zbQaUjxNlWBxJSjULJcEr7+KkfJOXJ++ie1eLoiww++IeI51VlxA
	7mxHGPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYSS-0000000EV1p-0MoG;
	Wed, 06 Aug 2025 07:21:08 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujY8h-0000000ESZJ-3b94
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:00:46 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250806070031epoutp034753824ce51679c301418a87b873199e~ZG2Ch6ZQK1969519695epoutp032
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 Aug 2025 07:00:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250806070031epoutp034753824ce51679c301418a87b873199e~ZG2Ch6ZQK1969519695epoutp032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754463631;
	bh=WdFJaAx/M3iRHEOHSD0PcPVz0vpeIpXT7Cc80F0NI1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pWXINgjRUiRpy07aYB7U8GPmjmhcpFIFxEaXKSoysi/BG3bDHOOY7cInrdGJLgEG5
	 lYGfzNtYfDlIQfRlCeTVGwLWKt6S6OmTCTw7Qla49jb4qEESmBv5jSQuf5/O0XPai9
	 m+elc+yKphkafY5z/xgTQlYM15IXdz32pTL+F49g=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250806070031epcas2p423c42bbb76200c5d32899a676d2d74d5~ZG2CPLfSk2830528305epcas2p4h;
	Wed,  6 Aug 2025 07:00:31 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bxh5B5g2Bz3hhT7; Wed,  6 Aug
	2025 07:00:30 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250806070030epcas2p3f2b0c36b6c492629e50e76be469b2db3~ZG2BCi5f80529905299epcas2p3a;
	Wed,  6 Aug 2025 07:00:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250806070029epsmtip25dbf0c4b3bad33e05b0354e7716c4448~ZG2A82Z2n2095520955epsmtip2S;
	Wed,  6 Aug 2025 07:00:29 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v5 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_CNT
Date: Wed,  6 Aug 2025 15:55:13 +0900
Message-Id: <20250806065514.3688485-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806065514.3688485-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250806070030epcas2p3f2b0c36b6c492629e50e76be469b2db3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806070030epcas2p3f2b0c36b6c492629e50e76be469b2db3
References: <20250806065514.3688485-1-sw617.shin@samsung.com>
	<CGME20250806070030epcas2p3f2b0c36b6c492629e50e76be469b2db3@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_000044_248263_15F8861D 
X-CRM114-Status: GOOD (  12.81  )
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

Enable QUIRK_HAS_32BIT_CNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 673ab6768688..541870b4d01a 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -357,7 +357,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -370,7 +370,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.25.1


