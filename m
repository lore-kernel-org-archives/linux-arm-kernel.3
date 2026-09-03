Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACC1C624DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLX3+E88Q55lry1pMFRCI7HxL2+8kiC+vbAZMUBx8ag=; b=1TEDZyelyainu/Xr8Kz58HNvAY
	gA9Cc09fUwyV7D0ET31PzaxYvNSRivfuOF6LAyZYqlSZzHudBBVs03qdnaNPpdsv5XHJCz+Cs/RHR
	zPDMhs8Xz48tuwqKNgnmzsRtLe9YMKigx1QgM7St8uDPZLuBOz8Zn1ZOyuCL9dkHKLgZs/AavsiKD
	TZtw9PnOpuyIHhwICyfDWhq83tFfgNZT0bbjVWpkif5VpwZtZzj9ZRK7qaR7U5R4C0aRkzqBOw7q/
	9ubKKWCSKbDqocodQbum2ggJu4qhZGpN2cvXe9oJRBhz4+SaOIZnzZb1NifEFpcuTU4aTRxCpHUWS
	OiLGxyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209z-0000000GPPW-487E;
	Thu, 03 Sep 2026 05:38:51 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209q-0000000GPJu-1TU5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413922; x=1819949922;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=laNov46rEhoHC/594iUdtbtLJH8byqqzWUsDYSOQ0MQ=;
  b=gGiqz/O1dXZCCXwhD4riYCnOGASraLJPsJTqwpbgnAfsZhTkd67lso5y
   VtJ4Hcaczl7BtpbL66jLJoBy/kwlYsa2p3HIYyNSh2AtVzO4NhZTlEqX0
   8Uvb4GJSKiR08TzNp9dvPaKR0G5K2U2RlA5gNZ4srCApprzHViKhUGSkV
   bvPpfmVjm1nXA4D7m0Z64KZW3xSm+RiZIuS56Dm6LNh2396lMMDHLS3wU
   QYsJuQpTfrK+2ZlFTDhaOmkmm/0Ojt2z2qNR9BIKmRywrhUARJUoX5oMP
   OFlVUyj0FavkovT3ywBsQijz+NBm8l8U3qED/h9zApdkzeSsHfMm69y2c
   Q==;
X-CSE-ConnectionGUID: HwvXeYcWThWecnr8u3ngag==
X-CSE-MsgGUID: RTUEssFPRm2Vj7s5Rn4cfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:39 +0300
X-CSE-ConnectionGUID: KLgcRyVFTouh6uKzqEEf/Q==
X-CSE-MsgGUID: WQqKPgDaTeGS1ta5vi3O2w==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 03 Sep 2026 08:45:06 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:37 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:09 +0300
Subject: [PATCH v2 02/12] i2c: nomadik: optimize struct layout, change
 unsigned char into u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-2-fedeb91792e6@mobileye.com>
References: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
In-Reply-To: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_223842_676269_021F09D0 
X-CRM114-Status: GOOD (  13.52  )
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

Change type of `tft` and `rft` fields of `nmk_i2c_dev` structure from
`unsigned char` to `u8` and `buffer` field of `i2c_nmk_client` structure
from `unsigned char *` to `u8 *`.

Put two bool variables `xfer_done` and `has_32b_bus` and two u8 variables
`tft` and `rft` together in order to reduce struct size wasted for padding.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index c3878670da9cfa462b66919ddc58b55cc78db6e5..45b4815b094524d9a8de69376e2933171541611a 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -170,7 +170,7 @@ enum i2c_operating_mode {
 struct i2c_nmk_client {
 	unsigned short		slave_adr;
 	unsigned long		count;
-	unsigned char		*buffer;
+	u8			*buffer;
 	unsigned long		xfer_bytes;
 	enum i2c_operation	operation;
 };
@@ -187,13 +187,13 @@ struct i2c_nmk_client {
  * @clk_freq: clock frequency for the operation mode
  * @tft: Tx FIFO Threshold in bytes
  * @rft: Rx FIFO Threshold in bytes
+ * @xfer_done: xfer done boolean.
+ * @has_32b_bus: controller is on a bus that only supports 32-bit accesses.
  * @timeout_usecs: Slave response timeout
  * @sm: speed mode
  * @stop: stop condition.
  * @xfer_wq: xfer done wait queue.
- * @xfer_done: xfer done boolean.
  * @result: controller propogated result.
- * @has_32b_bus: controller is on a bus that only supports 32-bit accesses.
  */
 struct nmk_i2c_dev {
 	struct i2c_vendor_data		*vendor;
@@ -204,15 +204,15 @@ struct nmk_i2c_dev {
 	struct clk			*clk;
 	struct i2c_nmk_client		cli;
 	u32				clk_freq;
-	unsigned char			tft;
-	unsigned char			rft;
+	u8				tft;
+	u8				rft;
+	bool				xfer_done;
+	bool				has_32b_bus;
 	u32				timeout_usecs;
 	enum i2c_freq_mode		sm;
 	int				stop;
 	struct wait_queue_head		xfer_wq;
-	bool				xfer_done;
 	int				result;
-	bool				has_32b_bus;
 };
 
 /* controller's abort causes */

-- 
2.43.0


