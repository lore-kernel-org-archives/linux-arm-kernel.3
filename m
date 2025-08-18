Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DB6CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 02:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEDfE/cZXX2izbtPhVO3xIr/ycqFTEjTVg1EKyWi0Nw=; b=QJkHFisuErAg7lHdcD3pBxjk2n
	/0TgX/vk7+c3OO3KnUPIO023J6KsgK2sm9TAe11keKsoH33CkQQgkC3GRX85J8vIqqBGtontSP680
	KNKJanFWyuwQP2fhGNhUt4eFsJTvDgrI5lZwihpcy0dFcIxcosEVyQqtHP5TVGkHV+wpEl5iFBfas
	TI0/uovjgpVjgAyuJjpZZFzLoKi+B6Y5+tAp42DJpeT7J1U6M9wMdv79OUW7hMhzUtYrGwG/68cfO
	z9s8bvuKJQslvF3utjbQXvL9px2UMRKEmKffte4K7+xXm65YmfBuRpqGp2NNusDHx5TJPAddXao2W
	693byBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpkq-00000006Lpg-1o07;
	Mon, 18 Aug 2025 02:37:48 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpY7-00000006KkY-1Afg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 02:24:43 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp02c7f8d41c03c6da0a92899bfae31a4fc1~cu0ihqa2I1805518055epoutp02z
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818022435epoutp02c7f8d41c03c6da0a92899bfae31a4fc1~cu0ihqa2I1805518055epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=PEDfE/cZXX2izbtPhVO3xIr/ycqFTEjTVg1EKyWi0Nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBpmN7hqf3udV1mdb+I6iTo/k45zKhBKMeyAe3oschja9I0NcTvacI//+K77tqglA
	 qourToFXGqTHY11hhLH2OmFlOXg8f8atq16KUDwxTxUIRwVVBMtV7l01WGTAS0RzuE
	 3zXfc5TBa1YEKk0G803sBat5CNdgEC+c4zyefBEo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p440e93fce21adb4db3786fad8d74e4a5f~cu0iELH4Y1747217472epcas2p45;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.68]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c4xPG250vz6B9mG; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836~cu0g9KQ3e2945329453epcas2p4O;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip1332c50c1db103d4bbdcee250138ca793~cu0g22E_C2171021710epsmtip1K;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_CNT
Date: Mon, 18 Aug 2025 11:18:25 +0900
Message-Id: <20250818021826.623830-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818021826.623830-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_192439_834031_490DC21E 
X-CRM114-Status: GOOD (  13.19  )
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

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index d983cbcb975c..915d3c88565a 100644
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


