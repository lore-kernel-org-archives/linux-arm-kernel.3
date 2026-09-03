Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D443C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3vqEOSCHdzH1bKgUUjeMU5Tre2E4mlpV47mZxSd3DE=; b=FrPUPuD4Y/t20sg7DFHvwjlnLo
	TAosvST3XTdT8sWU/RppvubR1H6NcXR5Nzeq6Xiu2PwhnWvarzmLLsCJcAweHcPZEHk8dWtaAcM0v
	r9qcnUVXwWBwXy9jEfrhWJW1NEXUgB7i0KT2GPec4kX0swnQStqQzrqz1Wd1sKK/H2GbOAZ0OnVno
	M1Sy/RE/ukr0HZayfFtmCBOIaa4Xb3vG3M6D+gogt7RcP2SaYqUlSNgPLc49iGA8slFCjb41NyJrg
	cCyUV63RzJB+NArGEAf2kl3Ex8GObpUQsK61xMpZa3GBrSigi3EFr79IGrTG/XE3effuB78O3AD21
	3yObJBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A7-0000000GPaJ-3t9Q;
	Thu, 03 Sep 2026 05:38:59 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209w-0000000GPJi-0b5G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413928; x=1819949928;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=HlYAVuM9vZLFTesP9pfThfI3jTZfqm2p6kxvhhe8OIs=;
  b=JXA3qy3g11etOvEQ3ApCQDIYWEWTFArx0QsjNmUq/UGpVUe2jJsJ+E8j
   FFTtP1wIJ/8paOzjDwLrsr61MyTW3ZRtpblAQ4zKzThKaJDCb+acWHAFL
   7YRkHS8vnMrdBw3BniIm4K437jC2SWxUGsOjsO+q8Rs0xpF9HqlXEvVJx
   pcfkaQL6PzuDV4UBorFJVTPB9g7IeB6Uxhl5xXTXNRuh9HzZyJ1hftvb8
   ZRNC6epNZ/C5jCtOE8LTTdy32wLfxlrdUaf2UiRUrYoF5p0K8yjokwrbt
   0cO/by+whDj97QK+BT6uz4bPoE9smHgZNooDSlPGNADZtaDs2tker+YYq
   Q==;
X-CSE-ConnectionGUID: HwvXeYcWThWecnr8u3ngag==
X-CSE-MsgGUID: /AU/EbUrQla8nE5rUGWt8Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:47 +0300
X-CSE-ConnectionGUID: DGlRIx87RHqxRAx0DKNZDQ==
X-CSE-MsgGUID: /Qj9nrTdRMmiTWGdE7nxiw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 03 Sep 2026 08:45:15 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:46 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:17 +0300
Subject: [PATCH v2 10/12] i2c: designware: stop transfer if spurious STOP
 is detected
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-10-fedeb91792e6@mobileye.com>
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
X-CRM114-CacheID: sfid-20260902_223850_513751_A2E3645E 
X-CRM114-Status: GOOD (  16.88  )
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

In `i2c_dw_process_transfer()`, if STOP_DET flag is set while read or
write is in progress, the transfer should be aborted. If this flag is
handled the same interrupt as TX_EMPTY flag, the driver first handles
TX_EMPTY flag and transmits the following messages, and only afterwards
checks STOP_DET flag.

Also, if STOP_DET flag is set, interrupts are not masked, so if TX_EMPTY
interrupts arrives later, the driver will also send further messages.

To abort transmitting data after spurious STOP, check STOP_DET flag
before TX_EMPTY flag, and if STOP_DET flag is set while transfer is in
progress, disable interrupts as it is done in case of TX_ABRT flag set.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 76f28e1696bdc81326cf149dfe88c52dd2f0731f..936b9150754e85a1bac2d17a0fa65f6963e4ef3e 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -651,17 +651,19 @@ static void i2c_dw_process_transfer(struct dw_i2c_dev *dev, unsigned int stat)
 	if (stat & DW_IC_INTR_RX_FULL)
 		i2c_dw_read(dev);
 
-	if (stat & DW_IC_INTR_TX_EMPTY)
-		i2c_dw_xfer_msg(dev);
-
 	/* Abort if we detect a STOP in the middle of a read or a write */
 	if ((stat & DW_IC_INTR_STOP_DET) &&
 	    (dev->status & (STATUS_READ_IN_PROGRESS | STATUS_WRITE_IN_PROGRESS))) {
 		dev_err(dev->dev, "spurious STOP detected\n");
 		dev->rx_outstanding = 0;
 		dev->msg_err = -EIO;
+		__i2c_dw_write_intr_mask(dev, 0);
+		goto tx_aborted;
 	}
 
+	if (stat & DW_IC_INTR_TX_EMPTY)
+		i2c_dw_xfer_msg(dev);
+
 	/*
 	 * No need to modify or disable the interrupt mask here.
 	 * i2c_dw_xfer_msg() will take care of it according to

-- 
2.43.0


