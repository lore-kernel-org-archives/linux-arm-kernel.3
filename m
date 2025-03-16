Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF113C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 19:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KKiT+5efbIUlHhEE1qhOdYjXJu1nfrYjC1bFfsz31As=; b=FYNLGAnGSFQH3HEyK/vYfCay1E
	I5ddbIvA1rmoGhsxs3Twp+RnQOVZPQU0csf1+36TPi/ncm98Au6nyBg1vwL5EMLIlWG3tpRs6owpo
	SWNGgselpgL6pS740/8yvkj1LokaI8TEnSpiN8gKI6eSEmEchgyx5QHmyM5l1iTr8rON8z8N6WN62
	dWZpbwz5Jvj1NsifWyylYocs9hXsl/e8z57OGBF6CVN5Q+IRaFUgdRPmPefzZjkNkxDPzwav2XhBG
	f0yySPvy3vF0qnNCnp7zlzz7hyocym8Q8JaMq3c67xVUBnlXV/2ZdcHrsECZ7bsL7fU+HhsRmJ072
	bmmOep4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tttXf-00000000X2v-40Nn;
	Sun, 16 Mar 2025 19:20:59 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tttVx-00000000Wrn-3ylT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 19:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1742152752;
 bh=KKiT+5efbIUlHhEE1qhOdYjXJu1nfrYjC1bFfsz31As=;
 b=uevkTLiZcsbjOs7T/6RWXb1JapQUrzSiwDNyl62XTp/KnIGVR2MCDYhrb8cEtgy0tPJ1Blsrh
 0s97SXxHfcu58MSF8awahrl0PucEmgYFXM8bMnOo5RLzUJGnRe+kFp67tPxpAF4LuTzAfJymuI7
 giI/IaoFCPpq+JuxhujlHni953b6rEfOu64qow4U7XvXsR7NbiUfhFHC1FPFQEDEYrgyrWZnlPx
 /C/IPy6MvTTu6dbyVZ0H0Cl6B3DbmTT2Bian3Y+rwRoFOqixUuT+MlIfsHnlZjCzh6c9mSTxPRF
 lRI/xhonGN+x0yHDib5pEABSrLBxjR5fxOscnxmwMgXQ==
X-Forward-Email-ID: 67d7242a63cc912a5bbae3ed
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmem: rockchip-otp: Handle internal word_size in main reg_read op
Date: Sun, 16 Mar 2025 19:18:58 +0000
Message-ID: <20250316191900.1858944-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_121914_400735_9AEA74BD 
X-CRM114-Status: GOOD (  17.10  )
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

Rockchip SoCs RK3576 and RK3588 read data from the OTP using 32-bit
words instead of normal 8-bit bytes. Similar RK3506, RK3528, RK3562 and
RK3568 will read data from OTP using 16-bit words.

The nvmem core stride and word_size cannot fully be used as cells is not
always aligned. Continue to report a stride=1 and word_size=1 in
nvmem_config and instead handle use of SoC specific word_size internally
in the driver.

Move current SoC specific word_size handling from the RK3588 read_reg
operation to the main read_reg operation to help simplify the SoC
specific read_reg operation and allow code reuse in a future RK3568
reg_read operation.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
This closely matches how I refactored the Rockchip eFUSE and OTP driver
in mainline U-Boot to handle word/block reads back in 2023, see [1].

[1] http://lore.kernel.org/r/20230222224436.1570224-3-jonas@kwiboo.se/
---
 drivers/nvmem/rockchip-otp.c | 72 ++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index d88f12c53242..45bbb6147fb7 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -59,7 +59,6 @@
 #define RK3588_OTPC_AUTO_EN		0x08
 #define RK3588_OTPC_INT_ST		0x84
 #define RK3588_OTPC_DOUT0		0x20
-#define RK3588_NBYTES			4
 #define RK3588_BURST_NUM		1
 #define RK3588_BURST_SHIFT		8
 #define RK3588_ADDR_SHIFT		16
@@ -69,6 +68,7 @@
 struct rockchip_data {
 	int size;
 	int read_offset;
+	int word_size;
 	const char * const *clks;
 	int num_clks;
 	nvmem_reg_read_t reg_read;
@@ -185,48 +185,28 @@ static int px30_otp_read(void *context, unsigned int offset,
 }
 
 static int rk3588_otp_read(void *context, unsigned int offset,
-			   void *val, size_t bytes)
+			   void *val, size_t count)
 {
 	struct rockchip_otp *otp = context;
-	unsigned int addr_start, addr_end, addr_len;
-	int ret, i = 0;
-	u32 data;
-	u8 *buf;
-
-	addr_start = round_down(offset, RK3588_NBYTES) / RK3588_NBYTES;
-	addr_end = round_up(offset + bytes, RK3588_NBYTES) / RK3588_NBYTES;
-	addr_len = addr_end - addr_start;
-	addr_start += otp->data->read_offset / RK3588_NBYTES;
-
-	buf = kzalloc(array_size(addr_len, RK3588_NBYTES), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
+	u32 *buf = val;
+	int ret;
 
-	while (addr_len--) {
-		writel((addr_start << RK3588_ADDR_SHIFT) |
+	while (count--) {
+		writel((offset++ << RK3588_ADDR_SHIFT) |
 		       (RK3588_BURST_NUM << RK3588_BURST_SHIFT),
 		       otp->base + RK3588_OTPC_AUTO_CTRL);
 		writel(RK3588_AUTO_EN, otp->base + RK3588_OTPC_AUTO_EN);
 
 		ret = rockchip_otp_wait_status(otp, RK3588_OTPC_INT_ST,
 					       RK3588_RD_DONE);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(otp->dev, "timeout during read setup\n");
-			goto read_end;
+			return ret;
 		}
 
-		data = readl(otp->base + RK3588_OTPC_DOUT0);
-		memcpy(&buf[i], &data, RK3588_NBYTES);
-
-		i += RK3588_NBYTES;
-		addr_start++;
+		*buf++ = readl(otp->base + RK3588_OTPC_DOUT0);
 	}
 
-	memcpy(val, buf + offset % RK3588_NBYTES, bytes);
-
-read_end:
-	kfree(buf);
-
 	return ret;
 }
 
@@ -234,7 +214,7 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 			     void *val, size_t bytes)
 {
 	struct rockchip_otp *otp = context;
-	int ret;
+	int ret, word_size;
 
 	if (!otp->data || !otp->data->reg_read)
 		return -EINVAL;
@@ -245,8 +225,34 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 		return ret;
 	}
 
-	ret = otp->data->reg_read(context, offset, val, bytes);
+	offset += otp->data->read_offset;
+	word_size = otp->data->word_size;
+
+	if (word_size > 1) {
+		unsigned int addr_start, addr_end;
+		size_t count;
+		u8 *buf;
+
+		addr_start = offset / word_size;
+		addr_end = DIV_ROUND_UP(offset + bytes, word_size);
+		count = addr_end - addr_start;
+
+		buf = kzalloc(array_size(count, word_size), GFP_KERNEL);
+		if (!buf) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		ret = otp->data->reg_read(context, addr_start, buf, count);
+		if (!ret)
+			memcpy(val, buf + (offset % word_size), bytes);
+
+		kfree(buf);
+	} else {
+		ret = otp->data->reg_read(context, offset, val, bytes);
+	}
 
+err:
 	clk_bulk_disable_unprepare(otp->data->num_clks, otp->clks);
 
 	return ret;
@@ -259,7 +265,7 @@ static struct nvmem_config otp_config = {
 	.type = NVMEM_TYPE_OTP,
 	.read_only = true,
 	.stride = 1,
-	.word_size = 1,
+	.word_size = sizeof(u8),
 	.reg_read = rockchip_otp_read,
 };
 
@@ -277,6 +283,7 @@ static const struct rockchip_data px30_data = {
 static const struct rockchip_data rk3576_data = {
 	.size = 0x100,
 	.read_offset = 0x700,
+	.word_size = sizeof(u32),
 	.clks = px30_otp_clocks,
 	.num_clks = ARRAY_SIZE(px30_otp_clocks),
 	.reg_read = rk3588_otp_read,
@@ -289,6 +296,7 @@ static const char * const rk3588_otp_clocks[] = {
 static const struct rockchip_data rk3588_data = {
 	.size = 0x400,
 	.read_offset = 0xc00,
+	.word_size = sizeof(u32),
 	.clks = rk3588_otp_clocks,
 	.num_clks = ARRAY_SIZE(rk3588_otp_clocks),
 	.reg_read = rk3588_otp_read,
-- 
2.48.1


