Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6667CC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3b1Psw+JucOaMEaVCgfFq85fzdpxooWfq61IOT0Tpk=; b=nDzXRfilw3BSjT8OKkMoj16+vE
	60VWML8bikbK6JvQB2+Lk/ThX4NWyxWWG7jTfCBMEKP0Be5t4sO4WRwsNZ+mYwGeBd/qh68DX0pVt
	qhuF54kc2TVJp7JwYxo2arPAtH0gq0jB4zFhpXYCUQTQXok676h8mBZZfz9q2rK1cwAI2IJF1ClaP
	PWl+AppHGJESAfIJFxWD3M/ne9YRCc6834TPRdm+tqnx2I15FYIxX6xkhcfYr7bi21QpnfN5PaWaR
	iY3WyNYakgUGYRCX5mXy3u1il9VtZn3YMTDDfhLOt6LXLwvGpFsR3FnOUl8t34IF1CT16RQVN3VPv
	E6Aaa5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXh-0000000FGpX-0JlS;
	Wed, 14 May 2025 13:53:05 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8o3-0000000Ej1n-0zNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:53:44 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514095341epoutp047bdf0d82f0074a64840bd4868eaeef12~-XBQDUPlp0338103381epoutp04W
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:53:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514095341epoutp047bdf0d82f0074a64840bd4868eaeef12~-XBQDUPlp0338103381epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216421;
	bh=M3b1Psw+JucOaMEaVCgfFq85fzdpxooWfq61IOT0Tpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cPgcvyY/UF3i4/R78cS6a6Nc4BjrYoyUzGDMr+hJ2BKmIPQ+JkAlmlYWYw0f8FbEh
	 McoPcvXjd4wFGl9RLgakNjj4XXtnBPEDK+TV3UOHt1RBwvR9UsvfuVi4nRybsM/Jyt
	 S1uHlyZ9K5HNWQ712ilJ2bbtDaA4ZwSuLQfPG7MI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250514095341epcas2p4a56583edd09d7c993c68efd8667ab8d3~-XBPxewzu0188301883epcas2p4R;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zy7vm5x42z3hhTG; Wed, 14 May
	2025 09:53:40 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095340epcas2p2c58454d8e0e27f46d5a71475f22e614e~-XBO7Nqho0657806578epcas2p2d;
	Wed, 14 May 2025 09:53:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095340epsmtrp19c55ac68ac736c446cac4b9212cf74d2~-XBO6ce_J1996219962epsmtrp1Q;
	Wed, 14 May 2025 09:53:40 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-47-68246824665f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	59.AB.08766.42864286; Wed, 14 May 2025 18:53:40 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095339epsmtip17dca7478570878620e0152c719068ba8~-XBOreiFl3233232332epsmtip1X;
	Wed, 14 May 2025 09:53:39 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 3/5] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Wed, 14 May 2025 18:42:18 +0900
Message-Id: <20250514094220.1561378-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsWy7bCSnK5KhkqGwcnVbBYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZXxqv8xYcF+l4vjkRsYGxity
	XYycHBICJhKPdy9g62Lk4hAS2M0o8f3eWfYuRg6ghJTEu2eWEDXCEvdbjrBC1HxglPi4aj4r
	SIJNQEdi+r/bLCC2iECcxLH2zcwgRcwCjxglrszrYQJJCAuESnx+c54dxGYRUJX4MXMtWJxX
	wFZi/pxudogN8hIzL30HszkF7CTmtrSygRwhBFTTtN0DolxQ4uTMJ2C7mIHKm7fOZp7AKDAL
	SWoWktQCRqZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBoa+luYNx+6oPeocYmTgY
	DzFKcDArifBez1LOEOJNSaysSi3Kjy8qzUktPsQozcGiJM4r/qI3RUggPbEkNTs1tSC1CCbL
	xMEp1cC0U2rHsWSjNU1LH6kG336/Y2mI9DV2FwXFBucFO1x/aP1+ue343HVhEy0EhEo+JliE
	brT4tLNrgZKccU7Rnor6aPMiMV2p2PbLM1V+GUq4qLy8Fa3PN9fwW9bSqYsc9h88tu4xk3La
	59rgOwefXTttH8RxZH9M+s5pAev+/lFLZWq259xwarmsX2TAtXlNcrkvEjTCWibXhx9dZPLf
	J0Zz2te+S/nrDtg22r17scO/a8PcNUUnu5u9e5TPZ+3/0eLUynu5TDBo5YSXv5xZRN76fS/8
	78nxpORLwrZH12bp3Mt74/rhe4uUj7rJo6l9cZ6+rsFHNT6bb4jlsXV4vbckt/vGEdbtnFds
	y/qeCxopsRRnJBpqMRcVJwIADso1IewCAAA=
X-CMS-MailID: 20250514095340epcas2p2c58454d8e0e27f46d5a71475f22e614e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095340epcas2p2c58454d8e0e27f46d5a71475f22e614e
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095340epcas2p2c58454d8e0e27f46d5a71475f22e614e@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025343_588496_A1679FA0 
X-CRM114-Status: GOOD (  22.62  )
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

Increase max_timeout value from 55s to 3664647s (1017h 57min 27s) with
38400000 frequency system if the system has 32-bit WTCNT register.

cat /sys/devices/platform/10060000.watchdog_cl0/watchdog/watchdog0/max_timeout
3664647

[    0.302473] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099394100000, timeout=3664647, freq=300000
[    0.302479] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3664647, divisor=256, count=1099394100000 (fff8feac)
[    0.302510] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
[    0.302722] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled

If system has 32-bit WTCNT, add QUIRK_HAS_32BIT_MAXCNT to its quirk flags, then
it will operation with 32-bit counter. If not, with 16-bit counter like previous.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index c6166d927155..1c7299deec5d 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -34,6 +34,7 @@
 #define S3C2410_WTCLRINT	0x0c
 
 #define S3C2410_WTCNT_MAXCNT	0xffff
+#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
 
 #define S3C2410_WTCON_RSTEN		BIT(0)
 #define S3C2410_WTCON_INTEN		BIT(2)
@@ -119,6 +120,10 @@
  * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
+ *
+ * %QUIRK_HAS_32BIT_MAXCNT: WTDAT and WTCNT are 32-bit registers. With these
+ * 32-bit registers, larger values to be set, which means that larger timeouts
+ * value can be set.
  */
 #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
 #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
@@ -126,6 +131,7 @@
 #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
 #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
+#define QUIRK_HAS_32BIT_MAXCNT			BIT(6)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -194,6 +200,7 @@ struct s3c2410_wdt {
 	struct notifier_block	freq_transition;
 	const struct s3c2410_wdt_variant *drv_data;
 	struct regmap *pmureg;
+	unsigned int		max_cnt;
 };
 
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
@@ -379,7 +386,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+	return wdt->max_cnt / DIV_ROUND_UP(freq,
 		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
@@ -534,7 +541,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
 	unsigned long freq = s3c2410wdt_get_freq(wdt);
-	unsigned int count;
+	unsigned long count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
 
@@ -544,7 +551,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	freq = DIV_ROUND_UP(freq, 128);
 	count = timeout * freq;
 
-	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
+	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
 		count, timeout, freq);
 
 	/* if the count is bigger than the watchdog register,
@@ -552,8 +559,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	   actually make this value
 	*/
 
-	if (count >= 0x10000) {
-		divisor = DIV_ROUND_UP(count, 0xffff);
+	if (count > wdt->max_cnt) {
+		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
 
 		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
@@ -561,7 +568,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 		}
 	}
 
-	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
+	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
 		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
 
 	count = DIV_ROUND_UP(count, divisor);
@@ -764,6 +771,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->src_clk))
 		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
 
+	wdt->max_cnt = S3C2410_WTCNT_MAXCNT;
+	if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
+
 	wdt->wdt_device.min_timeout = 1;
 	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
 
-- 
2.40.1


