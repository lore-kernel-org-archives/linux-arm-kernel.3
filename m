Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C7C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL05gORsxok+msUyXLgoEfbclxBIDnZpZXVNz5j6TQg=; b=GDxxrQ17itIhw8wgJZsHXHZwON
	I02LloUPpMBuNYncFTeC+dx2M06mydyuxPx/Uc2d3fcr9OFOz7SUsrzVFCPITpfCmN6zUamsWsc0S
	0/9VmZDGxAispPwzWOVYQhdVSls5hk54TeF7Giw+KyH5m/Hmm7sRPxR8/gsoeWdAMLcD8E0jWFCQ4
	6I/+3Ktirp0WAsRtDO6Tq2S5qh6u32SPpM9F7CB/OEADHhu+GX75caJMMB5DFo0up55IpLINyBpO/
	OkDfl5qY908e/hm6fN2S3W1XuoXfy7lBzhYqL7tOn+tHLM/pcNT35BVDRaz5cH9w3o1GBZiDy/GJ5
	TUb5vNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u90KM-00000003QO3-1qxv;
	Sun, 27 Apr 2025 11:37:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u90Dz-00000003Pe4-3rEl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 11:31:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 577D9614AB;
	Sun, 27 Apr 2025 11:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A38FFC4AF09;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=S4z7nos27hI/7ufS5vv7byZtBgt3zdHjyqnqgydLOG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vi2nZBoAXHz+LdW2JtLmRp9St4kEW0p4FCErubxlBkI3niI306TAyfRK1NiBzuqvh
	 b1F485McK+a3DR1skKEoxB3RAK0yYfiSHo3HlLH1tfM2elkEHCiKF7pQd1TN6JP17k
	 N6xJEdLDIouhCspG0b1TPNX3SpB3ZC49cyoDOprPxgU9sjEnW15Q/Hsicuv5hMKK7H
	 P7qIqbSf24fiDUMhPmvg/OFrY+8TLVobzFGmIrZIa5dAp3vrqW5Unn9xC0kOAfhodN
	 ce9WKbCsRNMYZQT/v5G3hEmvXdPQRL/2/kccayOMuIk0ntEhCyq9ShbGQkbDiUQFoq
	 lnDKbriZUHFlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965B5C369DC;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 27 Apr 2025 11:30:44 +0000
Subject: [PATCH v3 2/4] i2c: pasemi: Improve timeout handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-pasemi-fixes-v3-2-af28568296c0@svenpeter.dev>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3201; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Ymd7PRyxpRzDKy8qH3xCi40gQpZYxfTSb89hsdr26SY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaPG+qs01Hw2ePLjJX2BzQCNpflYco5LOcgN2DZczZ
 zJtrKQ7SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABN5K8XIsG/1rvhWyy0vUh/M
 jb89KW4Fh03/nk3WU1kWRIaYHnxy1ovhr+CLAw/XWKlEqOteFl6cpj+n7eCHmIete9hyXmx8oLD
 xGhcA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sven Peter <sven@svenpeter.dev>

The hardware (supposedly) has a 25ms timeout for clock stretching
and the driver uses 100ms which should be plenty.
The interrupt path however misses handling for errors while waiting for
the completion and the polling path uses an open-coded readx_poll_timeout.
Note that we drop reg_write(smbus, REG_SMSTA, status) while fixing those
issues here which will be done anyway whenever the next transaction starts
via pasemi_smb_clear.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 41 +++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 3f5571a90c1d268ea2a9d95285f1a5e47f0481ff..ee38e8a1e1f5d062384e85a2fd49d7da9257aacc 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -52,6 +53,12 @@
 #define CTL_UJM		BIT(8)
 #define CTL_CLK_M	GENMASK(7, 0)
 
+/*
+ * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
+ * use 100ms here which should be plenty.
+ */
+#define PASEMI_TRANSFER_TIMEOUT_MS	100
+
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(smbus->dev, "smbus write reg %x val %08x\n", reg, val);
@@ -90,20 +97,36 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
-	int timeout = 100;
 	unsigned int status;
 
 	if (smbus->use_irq) {
 		reinit_completion(&smbus->irq_completion);
 		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
-		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
+		int ret = wait_for_completion_timeout(
+				&smbus->irq_completion,
+				msecs_to_jiffies(PASEMI_TRANSFER_TIMEOUT_MS));
 		reg_write(smbus, REG_IMASK, 0);
 		status = reg_read(smbus, REG_SMSTA);
+
+		if (ret < 0) {
+			dev_err(smbus->dev,
+				"Completion wait failed with %d, status 0x%08x\n",
+				ret, status);
+			return ret;
+		} else if (ret == 0) {
+			dev_err(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
+		}
 	} else {
-		status = reg_read(smbus, REG_SMSTA);
-		while (!(status & SMSTA_XEN) && timeout--) {
-			msleep(1);
-			status = reg_read(smbus, REG_SMSTA);
+		int ret = readx_poll_timeout(
+				ioread32, smbus->ioaddr + REG_SMSTA,
+				status, status & SMSTA_XEN,
+				USEC_PER_MSEC,
+				USEC_PER_MSEC * PASEMI_TRANSFER_TIMEOUT_MS);
+
+		if (ret < 0) {
+			dev_err(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
 		}
 	}
 
@@ -111,12 +134,6 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 	if (status & SMSTA_MTN)
 		return -ENXIO;
 
-	if (timeout < 0) {
-		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
-		reg_write(smbus, REG_SMSTA, status);
-		return -ETIME;
-	}
-
 	/* Clear XEN */
 	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
 

-- 
2.34.1



