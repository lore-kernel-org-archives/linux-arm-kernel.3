Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1BBC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3tZe3/WIA/A9RSei6guiNM9/nIQO96/MG0HzRXeW18=; b=dLBSmjpQNDx4kTPTs1VItQZytt
	Qz5LiCSmWTB88L6HKmXsAK5jeLH/E4IKbN1ciw9vzZSdyvSpD5Qx8i/JiZeQKL9gBK1ZBYpOyk3ry
	YjsXrCj05Apz8Ysbvgv+bWsz3gWHrhHAMHytQDGbMT0fslklUf4+PLbZF+GXJV1s+ALz6i8SGvYue
	96w4wP7Mjj1h8VJVC9iNQJ1PiHb7EhMa4+z6/RgM6kgPUPRsLxKHfub34Eb5UruzLFYr30eG4IIZ3
	fwjXECsoTjGhg6xCKxiHtegS0nWi2NPupenwKPbJ1BjrE6P9rrY54ghnh/bit/ETodwcr6LaaEzwI
	LmvfXB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1a-00000003KkR-3u4a;
	Fri, 23 May 2025 08:45:06 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINmg-00000003J6A-25l5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:29:44 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 80F3D1F9D9;
	Fri, 23 May 2025 10:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747988980;
	bh=j3tZe3/WIA/A9RSei6guiNM9/nIQO96/MG0HzRXeW18=; h=From:To:Subject;
	b=pqG2RpQsBjSnlowjk4bODeanUiXyagWvirSd6sjdbCKiUxbgXvd501uR8H8LH7yEZ
	 hn+X4q5g4Bav8fcOjTGSfrMGfXB9WT4bV4IaXtTlsQWEjOpRb8xnh9oya0B118Edt+
	 PU3awFuhctkusnRKgNVW5ykPUKm3M0yeeQGxzNsd6trC+e36fdWRNnSnYE26FGVGkU
	 5uON2FBEwK8bvU5AYAi/HbljKbw/9LaOKiL/5aDXTZC5GPV18Xm6i08q3y3jlr0glS
	 ZKQp20lGXuP1fB8OJarTRQHjs2ll8dXXsrPwWicva+gHvgpjawQZHXRduKMfX6gMfJ
	 O3yLhpzJctSVg==
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
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v4 1/2] i2c: lpi2c: use readl_poll_timeout() for register polling
Date: Fri, 23 May 2025 10:29:30 +0200
Message-Id: <20250523082931.23170-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250523082931.23170-1-francesco@dolcini.it>
References: <20250523082931.23170-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_012942_851069_FBE130C7 
X-CRM114-Status: GOOD (  19.17  )
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

Replace polling loops with the readl_poll_timeout() helper macro.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Carlos Song <carlos.song@nxp.com>
---
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
index 342d47e67586..91b0f4c2b924 100644
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


