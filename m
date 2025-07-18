Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A690C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOk35ZzBn37AEr/mW9u2vChIBOYONAdbfp7TIWwzLCA=; b=bLhq4896YQt+v1EbNUS6mwrBTV
	qLw3hCeRIVI9xcHDodJN5/42Ui/4dCij/C1xf+l9tL5NHO20mPOEDKrhnuzWjZvuKrzk7bNYHg1be
	89T/uyxjQ019MxZ02a4tQDDv8Geo5onvDUwBqIcTRQgyUZvZpNBv+cvj0peUUCtGixfFcIe8Q9jPr
	DYZ1CAYOzK3KMFYWd4ez283ZMoXJB6VuVtcNX0UkBW4B0iO7q44mq4RqAcGh5YT+SiaDSPF5mBIni
	cTPc8+aUFtUKjR4QMYszU9Xo8H29kY/22yPWM9HXQ+zB9xaFHODA3nWFNxabDxkDppDNPjutrP45t
	yP1Hd1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclJa-0000000CiHv-0Mrd;
	Fri, 18 Jul 2025 13:39:54 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclEe-0000000Chjz-0mIH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 13:34:50 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 780C820779;
	Fri, 18 Jul 2025 15:34:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1752845683;
	bh=XOk35ZzBn37AEr/mW9u2vChIBOYONAdbfp7TIWwzLCA=; h=From:To:Subject;
	b=CkoBcYsghFk1GxTRNki8tgsuHIbOZ7FY5af/1MI+ete+HSy3UqmsoUn2uknqrp9/z
	 X0m5IQBKU/Zo1Gh99fAcqxk88cb+24V3Hp7xWlSxJPdHbXxhfiBkTIr2dVrdnzzOWX
	 2oRyP7P9o+G1hwSoY8VHlmros8eFIUr/rHvR16sso3znp31ao4dTBIsGlrWT4L4MpZ
	 IT/OPhiPFW7J+iTNwPabwrzfePz8rxdduxsW8/i50E16fjCBlFFA4PNA6uBucDrfnQ
	 +C+SkzV04bInphmtO2eBDK50JnhNxJrmigVJmS6yEBfH1uwmk1ulFaJU3TZrH7vpSD
	 fsd4PN51SbRPw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Carlos Song <carlos.song@nxp.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v5 1/2] i2c: lpi2c: use readl_poll_timeout() for register polling
Date: Fri, 18 Jul 2025 15:34:28 +0200
Message-Id: <20250718133429.67219-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718133429.67219-1-francesco@dolcini.it>
References: <20250718133429.67219-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_063449_138434_35D1EC89 
X-CRM114-Status: GOOD (  19.31  )
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Replaces polling loops with the readl_poll_timeout() helper macro.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Carlos Song <carlos.song@nxp.com>
Tested-by: Primoz Fiser <primoz.fiser@norik.com>
---
v4 -> v5
- rebased due to commit 614b1c3cbfb0 ("i2c: use inclusive callbacks in struct i2c_algorithm").
- add Tested-by Primoz

v3 -> v4
- Split the patch into two parts: one for the readl_poll_timeout() and one for the atomic implementation.
- Change the readl_poll_timeout() delay to 0 us to do not change the behavior of the driver.
- Use err variable consistently.

v2 -> v3
- Closes: https://lore.kernel.org/oe-kbuild-all/202505130735.zh3WuTNu-lkp@intel.com/. Using the return value of
lpi2c_imx_read_msr_poll_timeout() to check for errors.

v1 -> v2
- Rename READL_POLL_TIMEOUT to lpi2c_imx_read_msr_poll_timeout
- Remove addr and timeout_us parameters from lpi2c_imx_read_msr_poll_timeout since they are used always with the same value
- add r-b tag from Carlos Song
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 94 ++++++++++++++----------------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 064bc83840a6..4a25c92adfc1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -187,6 +188,10 @@ struct lpi2c_imx_struct {
 	struct i2c_client	*target;
 };
 
+#define lpi2c_imx_read_msr_poll_timeout(val, cond)                            \
+		  readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val, cond,  \
+				     0, 500000)
+
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
 			      unsigned int enable)
 {
@@ -195,33 +200,34 @@ static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
 
 static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	unsigned long orig_jiffies = jiffies;
+	int err;
 	unsigned int temp;
 
-	while (1) {
-		temp = readl(lpi2c_imx->base + LPI2C_MSR);
-
-		/* check for arbitration lost, clear if set */
-		if (temp & MSR_ALF) {
-			writel(temp, lpi2c_imx->base + LPI2C_MSR);
-			return -EAGAIN;
-		}
+	err = lpi2c_imx_read_msr_poll_timeout(temp,
+					      temp & (MSR_ALF | MSR_BBF | MSR_MBF));
 
-		if (temp & (MSR_BBF | MSR_MBF))
-			break;
+	/* check for arbitration lost, clear if set */
+	if (temp & MSR_ALF) {
+		writel(temp, lpi2c_imx->base + LPI2C_MSR);
+		return -EAGAIN;
+	}
 
-		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
-			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
-			if (lpi2c_imx->adapter.bus_recovery_info)
-				i2c_recover_bus(&lpi2c_imx->adapter);
-			return -ETIMEDOUT;
-		}
-		schedule();
+	/* check for bus not busy */
+	if (err) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
+		if (lpi2c_imx->adapter.bus_recovery_info)
+			i2c_recover_bus(&lpi2c_imx->adapter);
+		return -ETIMEDOUT;
 	}
 
 	return 0;
 }
 
+static u32 lpi2c_imx_txfifo_cnt(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	return readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff;
+}
+
 static void lpi2c_imx_set_mode(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned int bitrate = lpi2c_imx->bitrate;
@@ -259,25 +265,18 @@ static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
 
 static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
+	int err;
 
 	writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
 
-	do {
-		temp = readl(lpi2c_imx->base + LPI2C_MSR);
-		if (temp & MSR_SDF)
-			break;
+	err = lpi2c_imx_read_msr_poll_timeout(temp, temp & MSR_SDF);
 
-		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
-			dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
-			if (lpi2c_imx->adapter.bus_recovery_info)
-				i2c_recover_bus(&lpi2c_imx->adapter);
-			break;
-		}
-		schedule();
-
-	} while (1);
+	if (err) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
+		if (lpi2c_imx->adapter.bus_recovery_info)
+			i2c_recover_bus(&lpi2c_imx->adapter);
+	}
 }
 
 /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
@@ -393,26 +392,23 @@ static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 
 static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	unsigned long orig_jiffies = jiffies;
-	u32 txcnt;
-
-	do {
-		txcnt = readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff;
+	unsigned int temp;
+	int err;
 
-		if (readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) {
-			dev_dbg(&lpi2c_imx->adapter.dev, "NDF detected\n");
-			return -EIO;
-		}
+	err = lpi2c_imx_read_msr_poll_timeout(temp,
+					      (temp & MSR_NDF) || !lpi2c_imx_txfifo_cnt(lpi2c_imx));
 
-		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
-			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
-			if (lpi2c_imx->adapter.bus_recovery_info)
-				i2c_recover_bus(&lpi2c_imx->adapter);
-			return -ETIMEDOUT;
-		}
-		schedule();
+	if (temp & MSR_NDF) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "NDF detected\n");
+		return -EIO;
+	}
 
-	} while (txcnt);
+	if (err) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
+		if (lpi2c_imx->adapter.bus_recovery_info)
+			i2c_recover_bus(&lpi2c_imx->adapter);
+		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
-- 
2.39.5


