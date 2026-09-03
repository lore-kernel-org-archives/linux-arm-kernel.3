Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B092C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/F2Ey7oxD64LgkLPiu+H2uZ0b52M55k7lEmOrYFVHI=; b=rRm5CgJJ96jCRYw9i3o07lmWk1
	O4GwAdmjrvBJowlrNSqAApbdtSS8CSdXrnolqHjGPnTKduGOcW4MpscLi2RDiKOcLqmKeMhUbhB7V
	qeLrFaedciAhWpcWNN1OG9kjxyJfppyJYB6LjvYC4WrLDyTSu3TO7vxPOo7tiybJpyxBfZaCjYzYl
	qcYKkc9mhXM6gIwkMT3cjsG7iNJ6F1JyN5mc0AUnD8x9dOm5i2Eha/7K6BM28TN9sGoyemFtOWgTq
	BB56vb+WvmszSLzMiauAovtrAkxYodf7NPwtYMYWaqc/8hE+gQZUSKqUTRBQuvmLW1GKFjDGe7khB
	HBuTiO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A1-0000000GPT2-1sFW;
	Thu, 03 Sep 2026 05:38:53 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209v-0000000GPJx-0X35
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413927; x=1819949927;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=8TUN+9eI/Nacj8ClflcM6JdSTv4X8U6aMr/gCQEocVA=;
  b=dExdii788aqWswQQOy4pIkCSTkiwKGacH3y/jrfit4bGwE29Y+xxPV4o
   REC6UCICcRyH1ZNeZvS8BZrYQp6t469hkbBhA3jitUoH/fQPRfD7c0O8q
   snZKywMhGakhcCtHNOpgkfxeFokePeXTMBrDLqr/sJ5/5doEYh7LIgWj8
   YqAUG3rqEyrWmPoB0vLCDgPlfuWZUwkrwXP0txV+7xPojBwYJAeLsPQye
   iyz2wUo8oPHn+gS/5e7oaLLOpl7+gMXwaBzU2IJiagk13H2g81lAyK+lD
   of9dySPsP50vmHdN+bEpkhZrBgxKdFoUorg4M4WXN6aC+VkXxw4sKKIIe
   A==;
X-CSE-ConnectionGUID: Pv9G7W99SA+H4UChXTqr5w==
X-CSE-MsgGUID: WXQoGC6kSkWYCd0besUbnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:46 +0300
X-CSE-ConnectionGUID: BmP7FnTISB6uneerkrPTuw==
X-CSE-MsgGUID: 1ZenchvwTdGQwojcUCQLPg==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 03 Sep 2026 08:45:24 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:45 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:16 +0300
Subject: [PATCH v2 09/12] i2c: designware: no SMBUS_READ_BLOCK_DATA without
 EMPTYFIFO_HOLD_MASTER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-9-fedeb91792e6@mobileye.com>
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
X-CRM114-CacheID: sfid-20260902_223847_454813_7DB745E0 
X-CRM114-Status: GOOD (  13.70  )
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

Controllers without EMPTYFIFO_HOLD_MASTER feature cannot hold bus with
empty FIFO. This makes impossible to issue SMBUS block read command:
it is not known how many bytes must be read until it reads the  first byte
indicates the data length is read. Without EMPTYFIFO_HOLD_MASTER, when
the first byte is read, TX FIFO gets empty, this causes STOP condition
and the transfer is terminated.

Reset SMBUS_READ_BLOCK_DATA bit in functionality mask on such controllers.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d10f46cf4aa44344fa1c53b9b8798a8b0f0c193c..76f28e1696bdc81326cf149dfe88c52dd2f0731f 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -940,6 +940,13 @@ void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 	if ((dev->flags & MODEL_MASK) != MODEL_AMD_NAVI_GPU)
 		dev->functionality |= I2C_FUNC_PROTOCOL_MANGLING;
 
+	/* Controllers without EMPTYFIFO_HOLD_MASTER feature cannot issue SMBUS
+	 * block read because after reading the data length FIFO gets empty and
+	 * STOP is generated automatically
+	 */
+	if (!dev->emptyfifo_hold_master)
+		dev->functionality &= ~I2C_FUNC_SMBUS_READ_BLOCK_DATA;
+
 	dev->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE |
 			  DW_IC_CON_RESTART_EN;
 

-- 
2.43.0


