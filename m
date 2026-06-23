Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2F7CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEq0EOHHDB/A8I1h6skybvUc3bgObsWmJL8PW5rSB08=; b=dv+9TtfxMnCa3HHzU1Mp+3vhz4
	Iq2wfMbnRyhyPQEoFoVXfjb7qabwb8ppy3ztIqulLSwEiJJppKLO9pZu/bVae4rc32ypKyDA9IW5t
	c2wNSkeFXkINo8ddjpCO0Hv0BdebGJEZ6n3920Evdl3QaBVROGqqk9YuoGbwYXHGZRzWe0z+J+2Tl
	ioilqqwzc3SUQpvKDyf4WSeCZXbzK/VwMJAIfVw5NuJpeLs6yuRRMpI2A4VqvvhcHFzxNcFf4gL9H
	bjUxI3hpQ9vU4AJJxAHFnOHnfJY4jXVQhYaXMHK4/OhfLdhtoWjinzRbGKJSY6AjZWCYf8ToQ03+k
	Gd3c6fUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc431-00000006d2b-3oGT;
	Tue, 23 Jun 2026 16:32:27 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc42z-00000006cza-0TZ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782232345; x=1813768345;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=abiK5M9SqmKOeUi773fAhbaXyma8I8MJl0G28FSla+E=;
  b=sB/181WDZfckft3lLDhGalDlWrEFL9JMgeOYklUhPFZugyt+Drrt8Sfv
   UfyJySq96zbKQoAqEJ2kfrzgpVwB2zkeTy75XEwDtBSzSWmjq1culpE49
   KtDyxQbllqUrfDYLogLqS15ygAsQDAZrB2Cf7FESVOP+wnQh0ENuiaWx7
   86Lhs6ukXj7D14+ls2uVrVw3TUZKzOgWalLf3NT05njQQK9d5PdbHa/Xg
   hTX7fSVSjYoh2Cc71sQZJil9zVibjr633ladGG4einmgFY+a6TxNi2qql
   jLDMMoZLcFypft8zTGlqtd8nP7KOLD4jrd3DzO+8Jpt44TZeNeb4fChQP
   w==;
X-CSE-ConnectionGUID: s62FF0PXRX+Uy03EMz7jaA==
X-CSE-MsgGUID: 9LcZjEvyQ6Ctvf50TfLSOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:32:21 +0300
X-CSE-ConnectionGUID: 7WgFv90rTkCko6acKTvoTA==
X-CSE-MsgGUID: qdZ6EPPlRHWkQeWOry9Zyg==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 23 Jun 2026 19:37:31 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 19:32:20 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 23 Jun 2026 19:31:49 +0300
Subject: [PATCH 2/7] i2c: nomadik: optimize layout of struct nmk_i2c_dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-i2c-fault-reporting-v1-2-6db1a8aabf18@mobileye.com>
References: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com>
In-Reply-To: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_093225_443105_DA610D98 
X-CRM114-Status: GOOD (  13.37  )
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

Put two bool variables `xfer_done` and `has_32b_bus` and two char
variables `tft` and `rft` together in order to reduce struct size
wasted for padding.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b63ee51c1652080e414f4302bee16905914c1288..e4e5c6943c66144058fba857d7bf6c0be79ed5bd 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
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
@@ -206,13 +206,13 @@ struct nmk_i2c_dev {
 	u32				clk_freq;
 	unsigned char			tft;
 	unsigned char			rft;
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


