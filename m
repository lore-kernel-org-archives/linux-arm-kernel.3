Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCF8C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XB7UDmR4U2bHFJZI6k8184FerQ53jnzg35M0AQGdUo=; b=02AJiKrXknM6n5orVoEZkur9Ks
	qRplY+aBuYS8BF/fWS5jpK7EjJeYs4hLaYhdLI5sVxBrjxR0R9ph3ZfT7loeLk8CWSranwGg2UKj4
	NJMbG6uMax+vx5FNFH/dLhSdYmeUR+9qkqujXtvLxZquMEzz7IjrrgwDIf7Wx3WGB5v5jkzEZe5yK
	OzHcsGoVOfqPAB52Lm/vu7KpQd5vOXCuLUcqN/cUsC1cMViIgi7Kl7J5jowVg5SuockZFzbCLvZu6
	lIBymub6ZzUD5wp58mS0j91MqOdsD1kfKi0patQ7q7iCcGpKJ0bA6yP27Wi/15CTj/D/8A00omAfF
	5Q4766zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A8-0000000GPb5-0bzm;
	Thu, 03 Sep 2026 05:39:00 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209z-0000000GPOD-3U3Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413931; x=1819949931;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tXlRbGYQCwCA4tGfxwjozAwepNU3isVDrniH+0t54+o=;
  b=iOqaPjWRhzD7AN56dvlwAGBmnlkAstSxMgaZ4HQuxvOJYO+GUdU12dzS
   E0g6yc6tjRvnkOCxVMi11V9czVTKWv2XfvsCW8q/OTMVchRhPi+M81YO0
   nrFLB5I55IXfTtyERe0OgB7gJBkU84OWAGQYEgsTc6DGilSW5+S5H1a9N
   X52sw96AvrzsiSv3vrPyGMiuRZXJ1AAikTNpOsLnoJ3GxNAlxaJh1VFPJ
   x9og7e6Q9vqAwo30TotqU6ZrXb8waSytTpsIkkI0fGnOWWPG8BWhX3TLL
   riAuRDoERx+1fm8SwlDaxRrFOvpm/NCO2TVCyWIZurWV6ZgPOeYbxea0Q
   A==;
X-CSE-ConnectionGUID: QSA2K9DhR8mtupPpLY54Qg==
X-CSE-MsgGUID: ZTPpNdWESjiJUzGIrLeaCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:50 +0300
X-CSE-ConnectionGUID: Uo2BT8XQTdyTw2Hv0XhF0w==
X-CSE-MsgGUID: SzSF1Hd3QDCPUsxPczmgbw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 03 Sep 2026 08:45:25 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:48 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:19 +0300
Subject: [PATCH v2 12/12] i2c: designware: add support for I2C_XFER_V2 -
 detailed fault reporting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-12-fedeb91792e6@mobileye.com>
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
X-CRM114-CacheID: sfid-20260902_223852_225985_CDF1B160 
X-CRM114-Status: GOOD (  37.84  )
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
or received until the fault condition occurred, or to receive the data
read before the fault.

This patch introduces support for this feature in i2c-designware driver.
For AMD_NAVI_GPU model that has its own `xfer` callback function, this
feature is currently not implemented.

The driver uses FLUSH_CNT field of ABORT_SOURCE register to detect
how many command/data bytes written to FIFO were not actually sent.

Also, if the detailed fault report is required, the driver checks
status after each read/write from/to FIFO. If ABORT flag is set, the
driver cannot detect what happened first - FIFO read/write or
communication abort, so it assumes that abort happened first, otherwise
it either falsely reports one extra byte sent or returns the byte read
from FIFO flushed after abort as a valid read byte. So, in unfortunate
conditions, the fault report may be too pessimistic by one byte.

This check increases amount of time spent in interrupt handler, so if
client doesn't need detailed fault report, this check should be avoided.
Because of this, both `xfer` and `xfer_v2` callbacks are implemented in
struct i2c_algorithm: the former does not generate detailed fault
report, while the latter does.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-designware-common.c |   1 +
 drivers/i2c/busses/i2c-designware-core.h   |  10 +++
 drivers/i2c/busses/i2c-designware-master.c | 139 +++++++++++++++++++++++++++--
 3 files changed, 145 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 4274bf809b3f4bff90139d186447256b01317951..42fc5989c917686a89802d7ef027a6d89aea6213 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -879,6 +879,7 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 
 static const struct i2c_algorithm i2c_dw_algo = {
 	.xfer = i2c_dw_xfer,
+	.xfer_v2 = i2c_dw_xfer_v2,
 	.functionality = i2c_dw_func,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	.reg_slave = i2c_dw_reg_slave,
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 9f3492717e18fe104d307cfc65293ae4b41251f0..108fc1d1132c0aa91723de83198204a0dde42484 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -117,6 +117,8 @@
 						 DW_IC_TX_ABRT_10ADDR2_NOACK | \
 						 DW_IC_TX_ABRT_GCALL_NOACK)
 
+#define DW_IC_TX_ABRT_SOURCE_FLUSH_CNT_MASK	GENMASK(31, 23)
+
 struct clk;
 struct device;
 struct reset_control;
@@ -180,6 +182,9 @@ struct reset_control;
  *	to generate the high period and low period of SCL line.
  * @emptyfifo_hold_master: true if the controller acting as master holds
  *	the clock when the Tx FIFO is empty instead of emitting a stop.
+ * @need_precise_report: true if client needs precise fault report
+ * @bytes_written: number of bytes written to FIFO. Used only for precise
+	fault report.
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -239,6 +244,8 @@ struct dw_i2c_dev {
 	u32			bus_capacitance_pF;
 	bool			clk_freq_optimized;
 	bool			emptyfifo_hold_master;
+	bool			need_precise_report;
+	u32			bytes_written;
 };
 
 #define ACCESS_INTR_MASK			BIT(0)
@@ -318,6 +325,9 @@ extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
 int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
 int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs);
 
+int i2c_dw_xfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
+		   struct i2c_transfer_report *report);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
 irqreturn_t i2c_dw_isr_slave(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index f029aa1eadbf83d304fc73b038e92f258e2148a1..bc23c3fdaaf2e0629e02016aef428cc9f8bffda2 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -11,6 +11,7 @@
 
 #define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -33,6 +34,16 @@
 #define AMD_TIMEOUT_MAX_US	250
 #define AMD_MASTERCFG_MASK	GENMASK(15, 0)
 
+static int i2c_dw_fault_report(struct dw_i2c_dev *dev, struct i2c_transfer_report *report);
+
+static inline bool i2c_dw_check_abort_flag(struct dw_i2c_dev *dev)
+{
+	u32 stat;
+
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
+	return (!!(stat & DW_IC_INTR_TX_ABRT));
+}
+
 static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 {
 	unsigned int comp_param1;
@@ -198,6 +209,8 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 
 	i2c_dw_set_mode(dev, DW_IC_MASTER);
 
+	dev->rx_buf_len = 0;
+
 	/* If the slave address is ten bit address, enable 10BITADDR */
 	if (msgs[dev->msg_write_idx].flags & I2C_M_TEN) {
 		ic_con = DW_IC_CON_10BITADDR_MASTER;
@@ -451,6 +464,21 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 					     cmd | *buf++);
 			}
 			tx_limit--; buf_len--;
+
+			/* If precise fault reporting is required, check if the transfer
+			 * is aborted after writing each byte.
+			 * Otherwise, if it is aborted during filling FIFO, there is no way
+			 * to know how many bytes was written to FIFO after transfer abort
+			 * and thus are not counted in FLUSH_CNT.
+			 * If we are checking abort flag after each byte, we can lose only 1 byte.
+			 */
+			if (dev->need_precise_report) {
+				if (i2c_dw_check_abort_flag(dev)) {
+					dev_warn_ratelimited(dev->dev, "Transfer aborted during FIFO writing. Report may be imprecise.");
+					break;
+				}
+				dev->bytes_written++;
+			}
 		}
 
 		dev->tx_buf = buf;
@@ -542,6 +570,13 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 
 		for (; len > 0 && rx_valid > 0; len--, rx_valid--) {
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+			if (dev->need_precise_report) {
+				if (i2c_dw_check_abort_flag(dev)) {
+					dev_warn_ratelimited(dev->dev, "Transfer aborted during FIFO reading. Data byte may be lost");
+					/* It is unknown if the read byte is valid. Drop it. */
+					break;
+				}
+			}
 			tmp &= DW_IC_DATA_CMD_DAT;
 			/* Ensure length byte is a valid value */
 			if (flags & I2C_M_RECV_LEN) {
@@ -568,8 +603,10 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			dev->rx_buf_len = len;
 			dev->rx_buf = buf;
 			return;
-		} else
+		} else {
 			dev->status &= ~STATUS_READ_IN_PROGRESS;
+			dev->rx_buf_len = 0;
+		}
 	}
 }
 
@@ -765,6 +802,7 @@ __i2c_dw_xfer_one_part(struct dw_i2c_dev *dev, struct i2c_msg *msgs, size_t num)
 	dev->status = 0;
 	dev->abort_source = 0;
 	dev->rx_outstanding = 0;
+	dev->bytes_written = 0;
 
 	ret = i2c_dw_wait_bus_not_busy(dev);
 	if (ret < 0)
@@ -868,12 +906,25 @@ i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t i
 }
 
 static int
-i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
+i2c_dw_xfer_common_v2(struct dw_i2c_dev *dev, struct i2c_msg *msgs, int num,
+		      struct i2c_transfer_report *report)
 {
 	struct i2c_msg *msgs_part;
-	size_t cnt;
+	int msgs_in_prev_parts = 0;
+	size_t cnt = 0;
 	int ret;
 
+	if (!report) {
+		dev->need_precise_report = false;
+	} else {
+		dev->need_precise_report = true;
+		report->msgs_cplt = -EOPNOTSUPP;
+		report->bytes_cplt = -EOPNOTSUPP;
+		report->fault_msg_idx = -EOPNOTSUPP;
+	}
+
+	dev->msg_read_idx = 0;
+
 	dev_dbg(dev->dev, "msgs: %d\n", num);
 
 	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev->dev, pm);
@@ -889,6 +940,8 @@ i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 	 * we do one transaction for each part up to the STOP.
 	 */
 	for (msgs_part = msgs; msgs_part < msgs + num; msgs_part += cnt) {
+		/* Count previously transferred messages*/
+		msgs_in_prev_parts += cnt;
 		/*
 		 * Count the messages in a transaction, up to a STOP or
 		 * the end of the msgs. The last if below guarantees that
@@ -897,6 +950,15 @@ i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 		 */
 		for (cnt = 1; ; cnt++) {
 			if (!i2c_dw_msg_is_valid(dev, msgs_part, cnt - 1)) {
+				if (report) {
+					report->fault_msg_idx = msgs_in_prev_parts + cnt - 1;
+					report->msgs_cplt = msgs_in_prev_parts;
+					report->bytes_cplt = 0;
+					/* Reset report pointer to avoid
+					 * calling i2c_dw_fault_report later
+					 */
+					report = NULL;
+				}
 				ret = -EOPNOTSUPP;
 				break;
 			}
@@ -918,16 +980,83 @@ i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 
 	i2c_dw_release_lock(dev);
 
-	if (ret < 0)
+	if (ret < 0) {
+		if (report) {
+			i2c_dw_fault_report(dev, report);
+			report->msgs_cplt += msgs_in_prev_parts;
+			report->fault_msg_idx += msgs_in_prev_parts;
+		}
 		return ret;
+	}
+	if (report) {
+		report->msgs_cplt = num;
+		report->fault_msg_idx = num;
+		report->bytes_cplt = 0;
+	}
+
 	return num;
 }
 
+int i2c_dw_xfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
+		   struct i2c_transfer_report *report)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	return i2c_dw_xfer_common_v2(dev, msgs, num, report);
+}
+
 int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 
-	return i2c_dw_xfer_common(dev, msgs, num);
+	return i2c_dw_xfer_common_v2(dev, msgs, num, NULL);
+}
+
+static int i2c_dw_fault_report(struct dw_i2c_dev *dev, struct i2c_transfer_report *report)
+{
+	int idx;
+	int n_flushed = FIELD_GET(DW_IC_TX_ABRT_SOURCE_FLUSH_CNT_MASK, dev->abort_source);
+
+	report->msgs_cplt = -1;
+
+	if (n_flushed <= dev->bytes_written)
+		dev->bytes_written -= n_flushed;
+	else
+		dev->bytes_written = 0;
+
+	/* The last byte that the transmission was interrupted on is not counted as "flushed".
+	 * We should not reported it as transferred successfully, so decrement the counter.
+	 */
+	if (dev->bytes_written)
+		dev->bytes_written--;
+
+	for (idx = 0; idx < dev->msg_write_idx; idx++) {
+		if (dev->msgs[idx].len <= dev->bytes_written)
+			dev->bytes_written -= dev->msgs[idx].len;
+		else
+			break;
+	}
+
+	report->fault_msg_idx = idx;
+	for (int i = dev->msg_read_idx; i <= idx && i < dev->msgs_num; i++) {
+		if (dev->msgs[i].flags & I2C_M_RD) {
+			report->msgs_cplt = i;
+			if (!(dev->rx_buf_len))
+				report->bytes_cplt = 0;
+			else
+				report->bytes_cplt = dev->rx_buf - dev->msgs[i].buf;
+			if ((i < idx) || (report->bytes_cplt < dev->bytes_written))
+				dev_warn_ratelimited(dev->dev, "Read data lost due to FIFO flush");
+			break;
+		}
+	}
+
+	if (report->msgs_cplt < 0) {
+		report->msgs_cplt = idx;
+		report->bytes_cplt = dev->bytes_written;
+	}
+
+	return idx;
 }
 
 void i2c_dw_configure_master(struct dw_i2c_dev *dev)

-- 
2.43.0


