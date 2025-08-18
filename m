Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B4CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 02:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iF7XGLKPcudkWLwpYz/z12ZVFINWFvDEkKGpP/Zh/5A=; b=qMzdQ439zNklbq9eZ0+hGv9acN
	ltJ9es6SWk/hVduZkmGbTDfcrJSaJ66AJu70E60D+x3rzzbtEOoGA/XpCdDYZ/Sl2MkGxdkKNA0EJ
	BYGjFBi3T+e3qDNfhgUBOkJMTpKQrF4IzI1VvwQG28znzxlRyUA7mnB6SzdHkYeFpILgx1xZUPKjY
	Rcwd63ID88KBrNNQx3nkmDTRzfq0iZK3jmFN248cCTcd+dsSmI2N0mYiIhHd1ZNByUGo+JXl4WwN2
	xSTTXgs+ML/TRcEQC4nVXFBem+XQwHXaQksu1/1GKR53sV1ColG16W7wuExO2IQvi+utNJgnacbex
	wwFMuRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpiJ-00000006Li5-1FZf;
	Mon, 18 Aug 2025 02:35:11 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpY7-00000006KkG-1Adz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 02:24:42 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp04cb277e183733ba8b138b6a65f31a07af~cu0iLl-cb2755927559epoutp04O
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818022435epoutp04cb277e183733ba8b138b6a65f31a07af~cu0iLl-cb2755927559epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=iF7XGLKPcudkWLwpYz/z12ZVFINWFvDEkKGpP/Zh/5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6PLsc0k88J2COkoanK5Vft9WABSgOSO3zR0u4+q/N1NUI47saqrGEYR+0KDxyik1
	 t0KsP588+QQ15pN3yDaL5DOoQgAHjYbAOIC6DZ7BkmEe/kPxQqyAuYmtz4Gg7RxqlS
	 EQ2OTsaTh8cUOHFk9pTuP4w1CWOQxFlfQ0G7B4SI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p1aa372480dd5834f5b2f2e63737219b49~cu0h1Any60956809568epcas2p15;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c4xPG0fpfz2SSKh; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50~cu0gr7DFt3096330963epcas2p2y;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip1b7f6a2586034e6291a0000e252656057~cu0glYO2z2174121741epsmtip1N;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 1/5] watchdog: s3c2410_wdt: Replace hardcoded values with
 macro definitions
Date: Mon, 18 Aug 2025 11:18:22 +0900
Message-Id: <20250818021826.623830-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818021826.623830-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_192439_833363_1B66C613 
X-CRM114-Status: GOOD (  15.17  )
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

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 40901bdac426..95f7207e390a 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	if (count >= 0x10000) {
 		divisor = DIV_ROUND_UP(count, 0xffff);
 
-		if (divisor > 0x100) {
+		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
-- 
2.25.1


