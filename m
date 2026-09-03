Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED230C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/zImZ6Sky7PwJWMPoWYX+vFO7OVXM9QKWIMA4fdEu8=; b=K5k4m4Rw3qQ6+b6b9qJEHgOLJi
	/vKQzdt9QBFOz2c4hwD4FNczQg+rDVIPmFk6+l0dwTaR96uQ4mzhhkaU3GAfdAVJI3hXTwulRWoRP
	LGhhzgBCuRHaer2zhJmE7GrOQcKsAamB8Dfh2KFUWMSRYGnUgtkujijNvjJXuU0hAT3oCZRc/+3UT
	pOTxdrZry8q92julc4E0pjRyXJ/yvmaGQ0sk9AH13qeOO58G5Zfetpz/zH5FW3a7rHEGXaysi1zXX
	HXDjhn6+T/GY84O1rIKbzt6m33AgG+7pWMrMoqcEtYEOc/g6o25gUjT05E1/ETNmc01I2N++tjXNa
	E7c/V/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A8-0000000GPah-07I4;
	Thu, 03 Sep 2026 05:39:00 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209y-0000000GPNd-1JEh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413930; x=1819949930;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=eHmFtsWU5LjiwnO3niytJNP8sUYds/84ZFFIoQLM9gk=;
  b=EFO5Y+UrFGIA440FEJLWKvGe4tE/5za+qmFZW49X0ExkQsl7zDF4hggf
   zPIOgFj2lNXMpuJAPydojApCfcSuRQ0kJcETp5xGLg4YJb/zTHFyPF4XG
   n+XVk2A+Jf9tlsLoCAfn7zWrXEWfaHsdfsrcW+EWzE64aj2azh6CxtPrO
   IkYFoulWDZezUIoMp2px9zB1Nyf0/UbM6l3Os7kA6ep7MIbvFZd9rs8da
   xxSNcjR4sRamP2KLNZ+opH0ZaFFRgypTtbLAzm9m3ncUrooELxWbLlpW8
   4Efw9MH1E2ejItKb3Rz5zvkimRo2pyyDcscKB51spOe7C8IK+TW5/ao3k
   w==;
X-CSE-ConnectionGUID: HEUEMwveRnCWUrp8fs3GKg==
X-CSE-MsgGUID: qBSeXy1OSCOZfkEsJKkYoQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:48 +0300
X-CSE-ConnectionGUID: 5S1lyqeURkuJKJFGaAW5FQ==
X-CSE-MsgGUID: IQLGvVf4RLesE2UPXjvhPA==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 03 Sep 2026 08:45:29 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:47 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:18 +0300
Subject: [PATCH v2 11/12] i2c: designware: use separate `i2c_algorithm` for
 AMD_NAVI_GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-11-fedeb91792e6@mobileye.com>
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
X-CRM114-CacheID: sfid-20260902_223850_696960_BDDBA437 
X-CRM114-Status: GOOD (  15.26  )
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

AMD_NAVI_GPU variant of designware I2C controller uses its own
implementation of `xfer` method. Instead of checking flags in runtime,
create a separate `i2c_algorithm` structure and put pointer to
`amd_i2c_dw_xfer_quirk` directly into it.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 14 +++++++++++++-
 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c |  6 ++----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e934bcbe766042483874b3e43d10ffff30c59e04..4274bf809b3f4bff90139d186447256b01317951 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -886,6 +886,15 @@ static const struct i2c_algorithm i2c_dw_algo = {
 #endif
 };
 
+static const struct i2c_algorithm i2c_dw_amd_navi_gpu_algo = {
+	.xfer = amd_i2c_dw_xfer_quirk,
+	.functionality = i2c_dw_func,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave = i2c_dw_reg_slave,
+	.unreg_slave = i2c_dw_unreg_slave,
+#endif
+};
+
 static const struct i2c_adapter_quirks i2c_dw_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 };
@@ -922,7 +931,10 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 		strscpy(adap->name, "Synopsys DesignWare I2C adapter");
 
 	adap->retries = 3;
-	adap->algo = &i2c_dw_algo;
+	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
+		adap->algo = &i2c_dw_amd_navi_gpu_algo;
+	else
+		adap->algo = &i2c_dw_algo;
 	adap->quirks = &i2c_dw_quirks;
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 025311c8662c612aaaf772fb223af38278217c90..9f3492717e18fe104d307cfc65293ae4b41251f0 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -316,6 +316,7 @@ extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
 
 int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
+int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs);
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 936b9150754e85a1bac2d17a0fa65f6963e4ef3e..f029aa1eadbf83d304fc73b038e92f258e2148a1 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -291,8 +291,9 @@ static int i2c_dw_status(struct dw_i2c_dev *dev)
  * Initiate and continue master read/write transaction with polling
  * based transfer routine afterward write messages into the Tx buffer.
  */
-static int amd_i2c_dw_xfer_quirk(struct dw_i2c_dev *dev, struct i2c_msg *msgs, int num_msgs)
+int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
 {
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
 	int cmd = 0, status;
 	u8 *tx_buf;
@@ -926,9 +927,6 @@ int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 
-	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
-		return amd_i2c_dw_xfer_quirk(dev, msgs, num);
-
 	return i2c_dw_xfer_common(dev, msgs, num);
 }
 

-- 
2.43.0


