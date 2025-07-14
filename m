Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21583C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEE4uWjAAvqGbGNHuZIiAusKYEx36zda62ZjOAcwkGI=; b=VU0EjUl3uLOkvcVGo97fC1O+eN
	NvavTctdxnawrPq86Ud1zmqLSys85ppdnNqI5QcoJoAWzELO6mNDgyZDifudVrAlu/mOk7X1MA5RE
	roGKQM/7ZQVZQISP3IxzfQQRh9EpJkSfK1E+yQ5eU5auOb74GCERYmndXtAdfwvzj7K8xUceIxC/z
	4FpCdem9qrqcbUjK3KRzqsbHmjKAW+H9xB8gpbbtBb28ApQhxp5229GpPK0m48Mkp2ubmSYDnbN8c
	zKQ9JQXoW3cuSHw1F43WWx+4qr8rHZSgbtonDhjWRIXGHtHgypgiqh9mdxPs99i2SVCMKJNllMFb0
	75V9/gvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCIG-00000001HFr-33uR;
	Mon, 14 Jul 2025 06:04:06 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCDO-00000001GJL-0w1U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 05:59:05 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250714055855epoutp04bfc43b93856c6bc426cbe5fe40972f53~SCKri-Az11602116021epoutp04Z
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:58:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250714055855epoutp04bfc43b93856c6bc426cbe5fe40972f53~SCKri-Az11602116021epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472735;
	bh=DEE4uWjAAvqGbGNHuZIiAusKYEx36zda62ZjOAcwkGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qvSnWaCw4mtPSN1I6zh82H/gfllGlf5eEwLhF0c+cOoi6vfsVoOK56aSD5oCz3k8W
	 4TsXspk5i4zMey6rYOd4oZ3FJo4Hl+QbLUoSB0N+Apq5BbJOHXU3vUv0K+KkPurNSC
	 /P3sx2C7Y/UxgC4JLYCAfmU1L9C1mlWHDC7Ah4Ds=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055854epcas2p2e7f656b05ffb32038de95175d9c4017f~SCKrQ0r0m1945019450epcas2p27;
	Mon, 14 Jul 2025 05:58:54 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bgWpk1994z6B9mH; Mon, 14 Jul
	2025 05:58:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9~SCKqPDzbx1936819368epcas2p1H;
	Mon, 14 Jul 2025 05:58:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055853epsmtip19fb52d10a7006a5d55c0744d4b862c49~SCKqJ1vbW0366003660epsmtip1M;
	Mon, 14 Jul 2025 05:58:53 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 1/5] watchdog: s3c2410_wdt: Replace hardcoded
 values with macro definitions
Date: Mon, 14 Jul 2025 14:54:36 +0900
Message-Id: <20250714055440.3138135-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_225902_834112_02EB19FB 
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

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

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


