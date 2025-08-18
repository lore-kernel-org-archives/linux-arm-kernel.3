Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F66CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 02:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aygIjGhtEZCiK0bBdeBSKt8kirdXxHE5geSp6SzHtmY=; b=tfB0DFggyrtCe+h8Gd+qc0Qp/p
	f6ZjHQYWlzhnx6TBJb9dpjkoK3CLabZ6hHoQ72+nvOk8ZTfapcrjVo6IXPWPl+x4Ry8E4oeb0KUv3
	DcK16R3jA/g6WLbuwRlRC3PfQJUb+jalkgtqe7hJDO8ZHFeXexeKEVtuS6mDub4KnJPn3xoSPuVKB
	VI6efTCbjBh7H+puqntmeycbavai9G2VOOA1xM51jQBW4p3AuXY6QRpobQjQ+hiUzkmwghtH/SeS+
	VcbMNsJ0Zs+RsXqSFGgBDXy7tRbKCxh5QPHeDQYtj9Sv82bwP0JJK4MY8w1ss5EJGsKUFEftdiA9S
	9xvkfMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpnM-00000006M3G-1gGv;
	Mon, 18 Aug 2025 02:40:25 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpY7-00000006KkF-1AjC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 02:24:43 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp046961c6a309ea46ca12bfc9dd05fd18a0~cu0iXXkCh2754127541epoutp04I
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818022435epoutp046961c6a309ea46ca12bfc9dd05fd18a0~cu0iXXkCh2754127541epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=aygIjGhtEZCiK0bBdeBSKt8kirdXxHE5geSp6SzHtmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOjkk0w3HbH+c8MTa6tTE/u/wLbgConV0/9tiW5BJHP0HpgYD5wVcuHLFWCwQWrZH
	 qED6x68pCsOp9LLW0fKhsm4UirxDPCv5oaHv7c8vOA4h9XVZfpyfUdBkuf3VVT4kxv
	 FPXIwTsI1HEsqxoylbQHB7OKVOBx8EmCOqlIaBoU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p4c0f064bb19c18253efffecba277c43c4~cu0h9Ze-51747217472epcas2p43;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c4xPG1YXwz3hhTT; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9~cu0g2a5Wc1646716467epcas2p1t;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip1dfa1e198042f5aa086b3a7b743b126e2~cu0gx84n_2171921719epsmtip1O;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 3/5] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Mon, 18 Aug 2025 11:18:24 +0900
Message-Id: <20250818021826.623830-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818021826.623830-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_192439_838171_CFBC5FEF 
X-CRM114-Status: GOOD (  21.12  )
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

Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
38400000 frequency system if the system has 32-bit WTCNT register.

cat /sys/class/watchdog/watchdog0/max_timeout
3665038

[    0.330082] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099511400000, timeout=3665038, freq=300000
[    0.330087] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3665038, divisor=256, count=1099511400000 (fffffc87)
[    0.330127] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
[    0.330134] s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog: count=0xfffffc87, wtcon=0001ff39
[    0.330319] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled

If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk flags,
and it will operate with a 32-bit counter. If not, it will operate with a 16-bit
counter like in the previous version.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 1e8cf0299713..d983cbcb975c 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -34,7 +34,8 @@
 #define S3C2410_WTCNT		0x08
 #define S3C2410_WTCLRINT	0x0c
 
-#define S3C2410_WTCNT_MAXCNT	0xffff
+#define S3C2410_WTCNT_MAXCNT_16	0xffff
+#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
 
 #define S3C2410_WTCON_RSTEN		BIT(0)
 #define S3C2410_WTCON_INTEN		BIT(2)
@@ -124,6 +125,10 @@
  * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
+ *
+ * %QUIRK_HAS_32BIT_CNT: WTDAT and WTCNT are 32-bit registers. With these
+ * 32-bit registers, larger values will be set, which means that larger timeouts
+ * value can be set.
  */
 #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
 #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
@@ -131,6 +136,7 @@
 #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
 #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
+#define QUIRK_HAS_32BIT_CNT			BIT(6)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -199,6 +205,7 @@ struct s3c2410_wdt {
 	struct notifier_block	freq_transition;
 	const struct s3c2410_wdt_variant *drv_data;
 	struct regmap *pmureg;
+	u32 max_cnt;
 };
 
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
@@ -412,7 +419,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 	const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
-			S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
+			S3C2410_WTCON_MAXDIV * wdt->max_cnt;
 	u64 t_max = div64_ul(n_max, freq);
 
 	if (t_max > UINT_MAX)
@@ -572,7 +579,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
 	unsigned long freq = s3c2410wdt_get_freq(wdt);
-	unsigned int count;
+	unsigned long count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
 
@@ -582,7 +589,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	freq = DIV_ROUND_UP(freq, 128);
 	count = timeout * freq;
 
-	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
+	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
 		count, timeout, freq);
 
 	/* if the count is bigger than the watchdog register,
@@ -590,8 +597,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	   actually make this value
 	*/
 
-	if (count >= 0x10000) {
-		divisor = DIV_ROUND_UP(count, 0xffff);
+	if (count > wdt->max_cnt) {
+		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
 
 		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
@@ -599,7 +606,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 		}
 	}
 
-	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
+	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
 		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
 
 	count = DIV_ROUND_UP(count, divisor);
@@ -807,6 +814,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->src_clk))
 		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
 
+	if (wdt->drv_data->quirks & QUIRK_HAS_32BIT_CNT)
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
+	else
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_16;
+
 	wdt->wdt_device.min_timeout = 1;
 	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
 
-- 
2.25.1


