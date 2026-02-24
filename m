Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22624F55422
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NGJ4m6uSFJeo4IGOp1CFoC2THWgwdRgpjYr/fElumKk=; b=OlFPYoGwJUUjTV1FiloLKX+aPg
	V+oqW9Vr5v/or8gPi+CNveTstpBw9Vfii0wR8PUn+Z28VMsaJbiLaATv0nyZqA+v1dyzDFirT6PfW
	MG7gGoU6+0ShFH8kWj1UJRK2oD1QfVXpub/Gie91BTmv2pBa/HeoY++//s83u3hFL0g6gwGqMbc1t
	Xg199Xh3MNjO9IcOS6TdCje6zQjtQ8IeKvgvQDFOAakq3if++G104W3MtKsaHvPpQHqtYfvons16y
	vRnK34nOJRx2cGj5rueg+JasMgfeuvPpueirRhAwko+WcGbWbvqbjGo6XhF46Ed93UvZE9FiqAtem
	9HAP1mVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1Ls-00000002trs-2GQz;
	Tue, 24 Feb 2026 22:58:00 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1Lp-00000002tqj-2KzO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:57:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771973862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NGJ4m6uSFJeo4IGOp1CFoC2THWgwdRgpjYr/fElumKk=;
	b=jcELf9x7tzrjzQfZEk71ZhmHikjCeZn8fjx0cJxXz4IG1YiBtZeljCqJsWJlzSMxtCD+Ui
	KunCXjvojxynhaE5IelD3bzUBZuO7UrJIjM9y1eRh9ybDoXsX9vQdCZptQZWCaMH+5m7bw
	GfwdBiIXC3mbRoNKqGLMUPx1UiLgxKo=
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
Subject: [PATCH] crypto: atmel-sha204a - Fix OTP address check and uninitialized data access
Date: Tue, 24 Feb 2026 23:55:47 +0100
Message-ID: <20260224225547.683713-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_145757_746188_AF2C3483 
X-CRM114-Status: GOOD (  14.78  )
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
atmel_i2c_init_read_otp_cmd() instead of -1, and return early if
atmel_i2c_send_receive() fails to avoid checking potentially
uninitialized data in 'cmd.data'.

Also, return -EIO instead of -EINVAL when the device is not ready.

Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp zone")
Cc: stable@vger.kernel.org
Reviewed-by: Lothar Rubusch <l.rubusch@gmail.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Compile-tested only.

This patch combines [1] and [2], as suggested by Lothar in [2].

Lothar's Reviewed-by: for [1] has been preserved.

In [2], Lothar questioned whether returning -EIO is appropriate; the
exact error code can be adjusted if needed. The errno is currently not
propagated to userspace, but [3] changes this.

[1] https://lore.kernel.org/lkml/20260215205152.518472-3-thorsten.blum@linux.dev/
[2] https://lore.kernel.org/lkml/20260220133135.1122081-2-thorsten.blum@linux.dev/
[3] https://lore.kernel.org/lkml/20260216074552.656814-1-thorsten.blum@linux.dev/
---
 drivers/crypto/atmel-i2c.c     |  4 ++--
 drivers/crypto/atmel-sha204a.c | 11 ++++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index da3cd986b1eb..59d11fa5caeb 100644
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
index 8adc7fe71c04..b0480d3bec70 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -94,19 +94,24 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
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
 	}
 
 	ret = atmel_i2c_send_receive(client, &cmd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read otp at %04X\n", addr);
+		return ret;
+	}
 
 	if (cmd.data[0] == 0xff) {
 		dev_err(&client->dev, "failed, device not ready\n");
-		return -EINVAL;
+		return -EIO;
 	}
 
 	memcpy(otp, cmd.data+1, 4);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


