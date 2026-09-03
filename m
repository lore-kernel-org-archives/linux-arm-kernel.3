Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF0CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUFwy9QrPCuyLCAt7XYvl+mcIMDGLz06Hbq7x19g67U=; b=TlQfCIGPtoW7cRqaERlYyrSBQN
	V2PSoZi4MlbuSV624QbLTVgkp/2JCeSBiVC4py5VoVDX5b0RyEi8L14xR6ZF6FbUCXAZAHWWIRqDx
	W8TbDrgeKLDpcvoynR6mGmaw4zS5iXNSHljHxQOajJBha4bD0gu5jUA5mc0xOGVZZkyKP8mb1anbj
	olWKxCg9CUWz28lMCVKlQmyd0AoG7wdT9Vv09z1CQUfbOLc2NDORo79dGTSXThm4Hg0QdM7G/p+P2
	EAINxZD7642Fu97mF0rCRVHRyLaeOjRAoho3lzUDK4OQJk2rAvcmqcFJRcBAEBH9+1fxRXsCYCxVg
	K3RRBT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A1-0000000GPRo-0c0K;
	Thu, 03 Sep 2026 05:38:53 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209u-0000000GPJu-2Bw3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413926; x=1819949926;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ItnzHs4CMTfZZuAr1WQ3jV2V8snov5mwV0y2o0zOF2g=;
  b=qyfN2+aaHZhR9+VdKxMaHUhPPHoDNtbRelSUzsKjato0rPoU96ipzyB7
   2naeImnh0pMZMk4ZtqeBEr7dL9sC1W19P/lpHvFzwwv3lCdPfsJaQiIS/
   O+pKefQ9bVgiZY9koXDNqPuqmr03yghJN8LvvDwaDGVHoDX6ElyCGuy7g
   /uW3zz8f+qUk+NSEIpUJ2vnuJz9jCR9n4Rxgn0d6RRp+UJ8QfP5kd930k
   bCGfc9YlllwhxxpqHn0A8mL93vaVuiOcBJfoCq1+LoAEdynPGKCv3TT9L
   ucAgOX2XYDZzelo+Z7a+J2T/U6uv0a8MSUJd+PhY9oeFGD8X3E0CLZl6W
   Q==;
X-CSE-ConnectionGUID: Pv9G7W99SA+H4UChXTqr5w==
X-CSE-MsgGUID: M6fsaeZ1T2WUt4+1SfjERg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:44 +0300
X-CSE-ConnectionGUID: 0bgttk3bQ+aWaisyrwKAlA==
X-CSE-MsgGUID: WeSs7CFaRlWuEIIEcXulAQ==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 03 Sep 2026 08:45:22 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:43 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:14 +0300
Subject: [PATCH v2 07/12] i2c: nomadik: add support for I2C_XFER_V2 -
 detailed fault reporting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-7-fedeb91792e6@mobileye.com>
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
X-CRM114-CacheID: sfid-20260902_223846_882668_718073F4 
X-CRM114-Status: GOOD (  26.27  )
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

I2C_XFER_V2 is a new API that allows I2C clients to get the detailed
report in case of transmission failure. Previously, the only information
returned by I2C bus controller was the error code; there was no way to
find out how many messages or bytes in a certain message have been sent
or received until the fault condition occurred.

This commit introduces support of this feature in i2c-nomadik driver.

Acked-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index c36e9961e0a39e76386a6e20f6e0b6fec3d5b5a9..8b0ab191f7c1fc120f81319c1b1689193e2b9ea2 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -197,6 +197,7 @@ struct i2c_nmk_client {
  * @stop: stop condition.
  * @xfer_wq: xfer done wait queue.
  * @result: controller propogated result.
+ * @bytes_cplt: number of bytes completed in the message that caused a fault.
  */
 struct nmk_i2c_dev {
 	struct i2c_vendor_data		*vendor;
@@ -216,6 +217,7 @@ struct nmk_i2c_dev {
 	int				stop;
 	struct wait_queue_head		xfer_wq;
 	int				result;
+	int				bytes_cplt;
 };
 
 /* controller's abort causes */
@@ -529,6 +531,8 @@ static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	int status = 0;
 	bool xfer_done;
 
+	priv->cli.xfer_bytes = 0;
+
 	mcr = load_i2c_mcr_reg(priv, flags);
 	writel(mcr, priv->virtbase + I2C_MCR);
 
@@ -653,6 +657,7 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 {
 	int status;
 
+	priv->bytes_cplt = 0;
 	if (flags & I2C_M_RD) {
 		/* read operation */
 		priv->cli.operation = I2C_READ;
@@ -678,6 +683,16 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 			status = priv->result;
 		}
 
+		if (flags & I2C_M_RD) {
+			/* For READ messages, return the number of bytes read from FIFO */
+			priv->bytes_cplt = priv->cli.xfer_bytes;
+		} else {
+			/* For WRITE messages, return the number of bytes sent on bus */
+			priv->bytes_cplt = FIELD_GET(I2C_SR_LENGTH, i2c_sr);
+			/* LENGTH value includes the last byte that has not been sent or ACKed */
+			if (priv->bytes_cplt > 0)
+				priv->bytes_cplt--;
+		}
 		init_hw(priv);
 
 		status = status ? status : priv->result;
@@ -687,10 +702,11 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 }
 
 /**
- * nmk_i2c_xfer() - I2C transfer function used by kernel framework
+ * nmk_i2c_xfer_v2() - I2C transfer function used by kernel framework
  * @i2c_adap: Adapter pointer to the controller
  * @msgs: Pointer to data to be written.
  * @num_msgs: Number of messages to be executed
+ * @report: Pointer to transfer report to be written.
  *
  * This is the function called by the generic kernel i2c_transfer()
  * or i2c_smbus...() API calls. Note that this code is protected by the
@@ -733,14 +749,16 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
  * please use the i2c_smbus_read_i2c_block_data()
  * or i2c_smbus_write_i2c_block_data() API
  */
-static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
-		struct i2c_msg msgs[], int num_msgs)
+static int nmk_i2c_xfer_v2(struct i2c_adapter *i2c_adap,
+		struct i2c_msg msgs[], int num_msgs,
+		struct i2c_transfer_report *report)
 {
 	int status = 0;
 	int i;
 	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
 
 	pm_runtime_get_sync(&priv->adev->dev);
+	priv->bytes_cplt = 0;
 
 	/* setup the i2c controller */
 	setup_i2c_controller(priv);
@@ -760,10 +778,17 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 	pm_runtime_put_sync(&priv->adev->dev);
 
 	/* return the no. messages processed */
-	if (status)
+	if (status) {
+		report->msgs_cplt = i;
+		report->bytes_cplt = priv->bytes_cplt;
+		report->fault_msg_idx = i;
 		return status;
-	else
+	} else {
+		report->msgs_cplt = num_msgs;
+		report->bytes_cplt = 0;
+		report->fault_msg_idx = num_msgs;
 		return num_msgs;
+	}
 }
 
 /**
@@ -1014,7 +1039,7 @@ static unsigned int nmk_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm nmk_i2c_algo = {
-	.xfer = nmk_i2c_xfer,
+	.xfer_v2 = nmk_i2c_xfer_v2,
 	.functionality = nmk_i2c_functionality
 };
 

-- 
2.43.0


