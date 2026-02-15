Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDE0E63F14
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 20:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y4yLFGf0HuJyxk3nhKGUWRxXjLXHz3M7orS/XBgijeE=; b=TilG3sE7TZY+Uyq8RCF6rPDsGy
	FBht/vLkIVgGsCnENNmKVyBe2IuQ2pM5IeRCuow3e6deNQxsmjpRXF77lvC/Y4otxpxCxQwfaimMA
	gr2tT5am9NRd9EPR/EtuORN4IuvD2IZQ0Da8DzQxiZc0Wflxu+cjKQfP8ok2ABvsJ5TObeAL7ue7z
	EmWptNRTq3ntXuQ5J+2+m2N2A4CfY4O6+8Lt+R1aTG1VzqdfIsFZ2Z4cyk5LP4wAi9Oa1FCcfPQjh
	i5YR+FAOpefUEFvIH4y91PDN+1h3DCH6wKS7Uaer/CyY4usnvnEmynFVHM7kBtKBfv9jXfT+XBeMR
	F/UafXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrj6i-00000005ec2-3g0H;
	Sun, 15 Feb 2026 20:52:44 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrj6f-00000005ebg-0wvs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 20:52:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771188757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y4yLFGf0HuJyxk3nhKGUWRxXjLXHz3M7orS/XBgijeE=;
	b=MyDr4+euL02IC4+VXxYcvssTN0X0GLTlmegXORHSNzzOSyvjqXycitdGbS8kjNWcRdWxz1
	eYUleSUGyg/uhoEXwIkjtopdVJyiPqvrnP/JHY+I7QhPWaqEW0QRJWjbzJsCUsMIsh1wq3
	IadfEfh2clOZk1Xz5e38pTRw7TEQ6GM=
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
Subject: [PATCH] crypto: atmel-sha204a - Fix error codes in OTP reads
Date: Sun, 15 Feb 2026 21:51:53 +0100
Message-ID: <20260215205152.518472-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_125242_140138_E30CB902 
X-CRM114-Status: GOOD (  13.57  )
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

Return -EINVAL from atmel_i2c_init_read_otp_cmd() on invalid addresses
instead of -1. Since the OTP zone is accessed in 4-byte blocks, valid
addresses range from 0 to OTP_ZONE_SIZE / 4 - 1. Fix the bounds check
accordingly.

In atmel_sha204a_otp_read(), propagate the actual error code from
atmel_i2c_init_read_otp_cmd() instead of -1. Also, return -EIO instead
of -EINVAL when the device is not ready.

Cc: stable@vger.kernel.org
Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp zone")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Compile-tested only.
---
 drivers/crypto/atmel-i2c.c     | 4 ++--
 drivers/crypto/atmel-sha204a.c | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 9688d116d07e..ba9d3f593601 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -72,8 +72,8 @@ EXPORT_SYMBOL(atmel_i2c_init_read_config_cmd);
 
 int atmel_i2c_init_read_otp_cmd(struct atmel_i2c_cmd *cmd, u16 addr)
 {
-	if (addr < 0 || addr > OTP_ZONE_SIZE)
-		return -1;
+	if (addr >= OTP_ZONE_SIZE / 4)
+		return -EINVAL;
 
 	cmd->word_addr = COMMAND;
 	cmd->opcode = OPCODE_READ;
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 0fcf4a39de27..6b4e2764523e 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -94,9 +94,10 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
 static int atmel_sha204a_otp_read(struct i2c_client *client, u16 addr, u8 *otp)
 {
 	struct atmel_i2c_cmd cmd;
-	int ret = -1;
+	int ret;
 
-	if (atmel_i2c_init_read_otp_cmd(&cmd, addr) < 0) {
+	ret = atmel_i2c_init_read_otp_cmd(&cmd, addr);
+	if (ret < 0) {
 		dev_err(&client->dev, "failed, invalid otp address %04X\n",
 			addr);
 		return ret;
@@ -106,7 +107,7 @@ static int atmel_sha204a_otp_read(struct i2c_client *client, u16 addr, u8 *otp)
 
 	if (cmd.data[0] == 0xff) {
 		dev_err(&client->dev, "failed, device not ready\n");
-		return -EINVAL;
+		return -EIO;
 	}
 
 	memcpy(otp, cmd.data+1, 4);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


