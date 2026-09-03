Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBDAC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Paf+07YoCsP/6V1r4fyNU7XrcpoPTfzBPCWELvff2pQ=; b=qlAfyFyMwEzF6JSAJqWFxBert/
	/+v2vJhZDpHIZULSXENBd0CReuLR+1EfAX52xz4CD6GP5524Tl8BGNfu9hDAvcqLYdR0KuyY9uJOz
	6HhXFuIEj7fGRLpGiIHx6tbwM+UXSSEGkA//YnrcY9K/T7sHcHXiy5tnNTsbrfNGFUbhLJ8/g8sZH
	WZR2o7OEbIpkklVUgWTm7e+ed8zNZv+8CPAp78zHBPQ8USPUPHSjNiOE8nMyIjDhUliFiHtIcodbj
	cCt+r3lJHVzGrdFDqdcuZf0qPdP4ga0IIDCB8iepgZxZfQKCziqF6GgoBty6CuYWBoACuPaQzJdcF
	X29i54MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A0-0000000GPQW-1cmm;
	Thu, 03 Sep 2026 05:38:52 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209q-0000000GPJw-2cZs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413922; x=1819949922;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=L1VT8VFHal4ll3cgXxcUxpNo9geScucAPiMQYju1t00=;
  b=ZGNo/MU9kkLg/y2i6DFQrTSecui3TfilRLkrOW4zhGlbYhY0st37nQ02
   M9F9fXbem0YID+FWNDNWBJOS+Dl10iWFdYHl3FIZvGZHY2hxE833fUuKj
   rv6ADbkgPyBZYEpFCzPv10btzoXt4VGvikVVJN/XYHitgyL3TVj4Ypd/l
   ZF55WV/X0c+cJc6IDibA6pn4Ry3c6TedUHX871c7q3o/VAk5WRcPOie39
   WPjyjpkT18q5pmokj0RyzwhPJvFIStb1YKe85hAZlqFAJBKh2imyWst51
   Yz1r8rDhhnqVPGUlhJe40lSIBuhKmxZxfGY6eWJRYfLwCarFk/CkltMO7
   A==;
X-CSE-ConnectionGUID: DDf9oXC3TC2X0gsorOsd2A==
X-CSE-MsgGUID: EYE3QnKmQXe8en08rAv79A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:40 +0300
X-CSE-ConnectionGUID: uHjNl9sHS3GOyxfMXxEu2Q==
X-CSE-MsgGUID: OSj80QBdQDyXPUG5vZ1qzA==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 03 Sep 2026 08:45:15 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:38 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:10 +0300
Subject: [PATCH v2 03/12] i2c: nomadik: do not try to retransmit I2C
 message series on errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-3-fedeb91792e6@mobileye.com>
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
X-CRM114-CacheID: sfid-20260902_223842_957520_B3208EBE 
X-CRM114-Status: GOOD (  17.96  )
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

i2c-nomadik driver of I2C bus controller in `xfer` callback retransmits
the whole message series in cause of any fault, and returns fault only
after third failed attempt. This behavior contradicts with API because
not only it hides hardware faults, but also re-sends messages, while
they are not guaranteed to be idempotent.

Remove the triple attempt to send messages in `xfer` callback.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 45b4815b094524d9a8de69376e2933171541611a..ca9366e09e7125b9c86dd0f995162018df56634d 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -716,27 +716,21 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 	int status = 0;
 	int i;
 	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
-	int j;
 
 	pm_runtime_get_sync(&priv->adev->dev);
 
-	/* Attempt three times to send the message queue */
-	for (j = 0; j < 3; j++) {
-		/* setup the i2c controller */
-		setup_i2c_controller(priv);
-
-		for (i = 0; i < num_msgs; i++) {
-			priv->cli.slave_adr	= msgs[i].addr;
-			priv->cli.buffer		= msgs[i].buf;
-			priv->cli.count		= msgs[i].len;
-			priv->stop = (i < (num_msgs - 1)) ? 0 : 1;
-			priv->result = 0;
-
-			status = nmk_i2c_xfer_one(priv, msgs[i].flags);
-			if (status != 0)
-				break;
-		}
-		if (status == 0)
+	/* setup the i2c controller */
+	setup_i2c_controller(priv);
+
+	for (i = 0; i < num_msgs; i++) {
+		priv->cli.slave_adr	= msgs[i].addr;
+		priv->cli.buffer		= msgs[i].buf;
+		priv->cli.count		= msgs[i].len;
+		priv->stop = (i < (num_msgs - 1)) ? 0 : 1;
+		priv->result = 0;
+
+		status = nmk_i2c_xfer_one(priv, msgs[i].flags);
+		if (status != 0)
 			break;
 	}
 

-- 
2.43.0


