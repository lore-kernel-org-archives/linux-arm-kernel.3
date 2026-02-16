Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8823E63F33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RLvrlavvqhsMsZumdIpLoyT+Im13G14jyGnOLsn5bKE=; b=G6CI7e/7RDgKtfYsZtoiVq8nEl
	tspcR5IfLj/58Vf6S8JPKksha0fgLmXjMetJnq47LbeFaA5VgJ0tHXm3Dar0SQ4NSBZzbQBy0DXgP
	jSd4H4tk44Qw4+xzcE/MI78znKyxncbZAzrOpZk2cP9fDGxqxkCD5yxsDaLLP4SDOPgKz3HGgg72z
	0y04V69JXLAcu3Q2HyOHbb9jhgCvvMqiEniZJq7DnrkVEMM5CPSx7PuSV4OZiOq5V9ksPtChssCmL
	Cw2hYNPrc7Ms3eGFup3AQDmUG7UP8BAA4iSiGkLLKBxtxxQ7phmWyxnvagyb2NBDYQaxsd2np6+gd
	AbE5wODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtJ7-000000066DQ-2wVF;
	Mon, 16 Feb 2026 07:46:13 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtJ3-000000066D4-2PEh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 07:46:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771227964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RLvrlavvqhsMsZumdIpLoyT+Im13G14jyGnOLsn5bKE=;
	b=RZ52Jdyxe6XiQTHXDsQO6GihvOPBgC0lqv3st4LY4st0n6eYcTDf7S+11dnYK8nSGx/hyh
	bzgQBFfmjlJX9TUPTPKwh8k01uY2Nn7Jfr75wJ/nN4OLMcHT6o60Y8EDGTrUiiWnru4As1
	YGJszJkW9kRtVdpj5oYMoDVnJzrcmrg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lothar Rubusch <l.rubusch@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: atmel-sha204a - Fix OTP sysfs read and error handling
Date: Mon, 16 Feb 2026 08:45:51 +0100
Message-ID: <20260216074552.656814-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_234610_561757_9432BC3F 
X-CRM114-Status: GOOD (  13.68  )
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

Fix otp_show() to read and print all 64 bytes of the OTP zone.
Previously, the loop only printed half of the OTP (32 bytes), and
partial output was returned on read errors.

Propagate the actual error from atmel_sha204a_otp_read() instead of
producing partial output.

Replace sprintf() with sysfs_emit_at(), which is preferred for
formatting sysfs output because it provides safer bounds checking.

Cc: stable@vger.kernel.org
Fixes: 13909a0c8897 ("crypto: atmel-sha204a - provide the otp content")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Compile-tested only.

Changes in v2:
- Return the total number of bytes written by sysfs_emit_at() after
  feedback from Lothar (thanks!)
- Link to v1: https://lore.kernel.org/lkml/20260215124125.465162-2-thorsten.blum@linux.dev/
---
 drivers/crypto/atmel-sha204a.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 0fcf4a39de27..8af767f903ea 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
@@ -119,21 +120,22 @@ static ssize_t otp_show(struct device *dev,
 {
 	u16 addr;
 	u8 otp[OTP_ZONE_SIZE];
-	char *str = buf;
 	struct i2c_client *client = to_i2c_client(dev);
-	int i;
+	ssize_t len = 0;
+	int i, ret;
 
-	for (addr = 0; addr < OTP_ZONE_SIZE/4; addr++) {
-		if (atmel_sha204a_otp_read(client, addr, otp + addr * 4) < 0) {
+	for (addr = 0; addr < OTP_ZONE_SIZE / 4; addr++) {
+		ret = atmel_sha204a_otp_read(client, addr, otp + addr * 4);
+		if (ret < 0) {
 			dev_err(dev, "failed to read otp zone\n");
-			break;
+			return ret;
 		}
 	}
 
-	for (i = 0; i < addr*2; i++)
-		str += sprintf(str, "%02X", otp[i]);
-	str += sprintf(str, "\n");
-	return str - buf;
+	for (i = 0; i < OTP_ZONE_SIZE; i++)
+		len += sysfs_emit_at(buf, len, "%02X", otp[i]);
+	len += sysfs_emit_at(buf, len, "\n");
+	return len;
 }
 static DEVICE_ATTR_RO(otp);
 
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


