Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6390560A2618
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=46NPuqq+;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=qYvCrg9o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gg5b0dMeEslMw2aOATqbJoZiyPtuaE9d4fWSpcO4s5Q=; b=46NPuqq+urjIYW
	baPdjQGF577Qu4B3nNKvCI9QwYGMGa23Cqf+8EwXWKAQfaVrz1PTIXWCYCNr8sQIe+9q6KW81p52e
	L/W5z6AzKtWXSxZtAFCoE3dsyq+7mH8sWEUnFGIWFXY240h5l82cbNRHO4zZGAyUnrmOidGGR1G+l
	VKsdUQ22WwJ4J/G/u7v2RYfwRUt2wGke0CZHbLrF+VTNQ5RVngz8O4kdyqVCkBFJ+JyckvR/bxI0l
	W3KHJMZcXGPGczqCvfAF7MxluTlQXXlacTGSTekBYwSsciVy3W749M7ougXu19u9ryw9dSKbwvlj1
	ooiijLb18xQgqifntLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP17p-00000009sQz-1Xh6;
	Thu, 05 Nov 2026 17:19:45 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14r-00000009qk9-2m78
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793899002; x=1825435002;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=gnp8tA4y2rADZDVqbzjlmD3iUpQrfUNUuMLEH91Ykxc=;
  b=qYvCrg9oZsw9/w/dcf2mgaFRY95IoG/HtmdU14iZ3HTJ7qIS5+PklON4
   PweFlR5VBGy7SkSeDGdCKVNgwyIzpr9DbkX6NorV8Nkkx5X4XrHlolWDm
   tHoEIOsQ3s3x/8SPI152Q802iT89z4WXLAmeeOOzo5Jom1b2kOFUSZJjX
   jSk6Ca2ogN2ldcsxUnduS52XBhHpVUC/pCUWgzHzDS3TZQs4wG7iy3O98
   SSbZ3SvyfHha9tiTCJap16+maHcu+7bxRQs/A23wDbq+/EN2dhwynBoSv
   NNaiyDE65pB6TggtN4iQC5/nVyrCyUupRMMJ1A1HaCu+m5zIcCqPN3onv
   Q==;
X-CSE-ConnectionGUID: v7RjAzLzRZyclLiaKGMzhA==
X-CSE-MsgGUID: Ih5qVltAQUegFFZ7jZeSUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:39 +0200
X-CSE-ConnectionGUID: MzRslvUbSRm3HKfNtijAFw==
X-CSE-MsgGUID: eHkOcAtOSD+a6mzwMtvCEw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:41 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:37 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:32 +0200
Subject: [PATCH RFC v3 11/14] i2c: nomadik: save I2C_CR register before
 resetting HW in IRQ handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-11-515ad74ac4c9@mobileye.com>
References: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
In-Reply-To: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091645_205892_1E9B1973 
X-CRM114-Status: GOOD (  19.55  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On some interrupts, such as Bus Error interrupt or Arbitration Lost
interrupt, the interrupt handler calls init_hw() to reset the I2C
controller. This clears I2C_SR register value that might be used for
fault reporting.

Add i2c_sr field to nmk_i2c_dev structure, store there I2C_SR register
value before resetting the hardware, and use this value instead of
reading it directly in nmk_i2c_xfer_one() if it was read in IRQ handler.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b9f839d5a6fa..f68d4cf7c0e7 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -193,6 +193,7 @@ struct i2c_nmk_client {
  * @xfer_done: xfer done boolean.
  * @has_32b_bus: controller is on a bus that only supports 32-bit accesses.
  * @timeout_usecs: Slave response timeout
+ * @i2c_sr: last read I2C_SR register value
  * @sm: speed mode
  * @stop: stop condition.
  * @xfer_wq: xfer done wait queue.
@@ -212,6 +213,7 @@ struct nmk_i2c_dev {
 	bool				xfer_done;
 	bool				has_32b_bus;
 	u32				timeout_usecs;
+	u32				i2c_sr;
 	enum i2c_freq_mode		sm;
 	int				stop;
 	struct wait_queue_head		xfer_wq;
@@ -652,6 +654,7 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 {
 	int status;
 
+	priv->i2c_sr = 0;
 	if (flags & I2C_M_RD) {
 		/* read operation */
 		priv->cli.operation = I2C_READ;
@@ -663,12 +666,22 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 	}
 
 	if (status || priv->result) {
-		u32 i2c_sr;
 		u32 cause;
+		/*
+		 * On some errors, the interrupt handler reads I2C_SR register value,
+		 * stores it into priv->i2c_sr and resets the hardware with init_hw().
+		 * If it is done, we use this value. The value cannot be 0 because
+		 * I2C_SR_STATUS after transfer start may be I2C_ON_GOING, I2C_OK or
+		 * I2C_ABORT but not I2C_NOP.
+		 * If priv->i2c_sr == 0, it was not updated since transmission start, so
+		 * init_hw() was not called and the hardware register I2C_SR still holds
+		 * correct value.
+		 */
+		if (!priv->i2c_sr)
+			priv->i2c_sr = readl(priv->virtbase + I2C_SR);
 
-		i2c_sr = readl(priv->virtbase + I2C_SR);
-		if (FIELD_GET(I2C_SR_STATUS, i2c_sr) == I2C_ABORT) {
-			cause = FIELD_GET(I2C_SR_CAUSE, i2c_sr);
+		if (FIELD_GET(I2C_SR_STATUS, priv->i2c_sr) == I2C_ABORT) {
+			cause = FIELD_GET(I2C_SR_CAUSE, priv->i2c_sr);
 			dev_dbg(&priv->adev->dev, "%s\n",
 				cause >= ARRAY_SIZE(abort_causes) ?
 				"unknown reason" :
@@ -879,6 +892,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 			priv->result = -EIO;
 			dev_err(dev, "%lu bytes still remain to be xfered\n",
 				priv->cli.count);
+			priv->i2c_sr = readl(priv->virtbase + I2C_SR);
 			init_hw(priv);
 		}
 		priv->xfer_done = true;
@@ -890,6 +904,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	/* Master Arbitration lost interrupt */
 	case I2C_IT_MAL:
 		priv->result = -EAGAIN;
+		priv->i2c_sr = readl(priv->virtbase + I2C_SR);
 		init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_MAL);
@@ -906,11 +921,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	 */
 	case I2C_IT_BERR:
 	{
-		u32 sr;
-
-		sr = readl(priv->virtbase + I2C_SR);
+		priv->i2c_sr = readl(priv->virtbase + I2C_SR);
 		priv->result = -EIO;
-		if (FIELD_GET(I2C_SR_STATUS, sr) == I2C_ABORT)
+		if (FIELD_GET(I2C_SR_STATUS, priv->i2c_sr) == I2C_ABORT)
 			init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_BERR);
@@ -927,6 +940,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	 */
 	case I2C_IT_TXFOVR:
 		priv->result = -EIO;
+		priv->i2c_sr = readl(priv->virtbase + I2C_SR);
 		init_hw(priv);
 
 		dev_err(dev, "Tx Fifo Over run\n");

-- 
2.43.0


