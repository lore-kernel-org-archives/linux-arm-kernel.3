Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32BECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaqhUv6DYkD+NK9mDEt9K8F9Lv6LckzDqKYbDXQI4Qk=; b=N1zbYIwNj9iXxrvkh7a6qSL9nM
	YEAqUB0+DaaHt0dHe0qvGWAu+LfLHoVcSrddr7aCMGeNpFF/RfmMJqW7L1m0MVgEpZmmVnF5sGrKJ
	ksk67xsZ5lFq5mBc/JuIWCvkN2nSvn+2QGPGwmmVVUSO3UEF1ZWhAN1w9q5Z1k94F1QEW1rp4IZ/q
	aBZUHyG6OLk6AueIGPWTwBOndA0MXFWJ7yMY4JE+g38SJYe9yytXjhjtgYet4pMBtOb9MrzDjgG45
	RBFkpKXpmDe8CG6a5bgN+rEk8+JqP4QRSkN2eNGi9oS+X50w+iaecjiIKNBvrEL9qAgGqfjorTF+w
	NSUgFNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc43D-00000006d8e-0Vx1;
	Tue, 23 Jun 2026 16:32:39 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc42z-00000006czR-0FXI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782232344; x=1813768344;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=gTrRTdtLS8baBdybUjfIaCTg6YqV6Q88loNVflxOmBA=;
  b=hvFRecfe2QdzfChCB5lsXWeExYn4ksDuJGW4RKkqslLFPUVx4Lz8pZcm
   gkiYBu8moCwK+Bd7ppAViQfbsEX/9dsdUz4MKduNa4Vs4+EgRqhDurjJe
   8xNKayfmBaiqUzCX5c85dXoEMFsMFrrkFOLuh063cxU43nKyBIpvayZNR
   ujA6R/6WgMitpFiet9xHAVruipqlCVjazNm3aCDdRg0mS9EIw5zm4uugs
   qPKh8AYw2DbYsw3skUOzcXj1wXvmm9DsWtRFVTgQ1kZRmEdiLcBxnT+0J
   S180rvrP4U6oJsod3E4zmlJCs8Ugb+BtQnA/VPwWZS8dW/K1DAkWpKGMd
   g==;
X-CSE-ConnectionGUID: CYtpn2YERS2anpd+v6aZDA==
X-CSE-MsgGUID: kwJRCjTdShicsj6zdFjQtA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:32:22 +0300
X-CSE-ConnectionGUID: 5UkoFnxtT+ajORjDtGw7yA==
X-CSE-MsgGUID: 4nQu2gUfRFS94rakXpXx0g==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 23 Jun 2026 19:37:22 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 19:32:21 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 23 Jun 2026 19:31:50 +0300
Subject: [PATCH 3/7] i2c: nomadik: do not try to retransmit I2C message
 series on errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-i2c-fault-reporting-v1-3-6db1a8aabf18@mobileye.com>
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
X-CRM114-CacheID: sfid-20260623_093225_417491_6BE3658C 
X-CRM114-Status: GOOD (  16.66  )
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

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index e4e5c6943c66144058fba857d7bf6c0be79ed5bd..3eb06988c026e5c573fcf55d83de7136b5ca7ac9 100644
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


