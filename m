Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D1ACDB480
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqPMOa3VhTzs3b8j0JAq4TCU3cOlOKYv3BYmrlxV9SQ=; b=TMVLaNeSQbFGnjvj9cQOTIa9Fe
	QDS8O72qDOo4VVd3yw3Iw34g5d91ui3i8/nK/Y2WmE0Vj89ZvhPVLq20KzNHO92Tsehnpb6ZDQyVf
	xhrsq0R2f6iXgs1GGHo3QAXqJWAJTMmZS8XZk56DIkjfxXyxBdHMQ9YiRTbmFR/rPxq2Ok2KN1COl
	tUuqwYnJOzZob+wEdU2b2CDYVSPr29wlx4Z08z+M/bOf1iB+bniEmhBbMQroShIY7Lzuvq6XOUMAp
	Y2GemMXHFiws8iIB3BjpQlnqUvPgf+6JGf3gpOG19TdnGx8IydsPpBO/GDlxGO5ff7mC41rWf7G32
	hij0rFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc43D-00000006d9B-1OnW;
	Tue, 23 Jun 2026 16:32:39 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc431-00000006cys-08hx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782232347; x=1813768347;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oG9nkyldQyyI/7WMBxXQe7MvXPqBKeJkeAmDpqjZ4uc=;
  b=nUs9Pdj9EaJjGZz/+8cuFqAIam9RtBosiL/u8AavQrNthySujwdcQYiH
   fQLpvGZAmR17rRQRK30v+WgcvXdCBhdORb21SqfAVpgfB0gKtq0wZH9g1
   gsILhiurqMw3OtPDkxwzbPndfUu3P648U9hCCI3TqQ3r6x+ayvJdfC4Ai
   R1bafWAp+j+Uj9QNfdo/ZYjRmHl916XDDwT5BCUg/sM+zkdZwSkHZzne0
   gNzeKzcM0WpnLdAfzNZoANA8156cPxWb9w6Xu/zucriCd0K0REwJY5f6M
   48fpkNbffsr7M/CCOG6VsyoTWCKUAGvuQ/UG9mlLZuaOoiYi9uUFZdGCJ
   Q==;
X-CSE-ConnectionGUID: FDMCIGXTQNeOYXoHW9pvjw==
X-CSE-MsgGUID: 5HZjzprpRfS3JusJ3fM2Iw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:32:24 +0300
X-CSE-ConnectionGUID: z3gDAWAXRIK5/bfqOX3Iaw==
X-CSE-MsgGUID: ZxvTOvUiS3GUK9Xe1gOEaw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 23 Jun 2026 19:37:34 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 19:32:23 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 23 Jun 2026 19:31:52 +0300
Subject: [PATCH 5/7] i2c: nomadik: change print level for fault messages to
 debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-i2c-fault-reporting-v1-5-6db1a8aabf18@mobileye.com>
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
X-CRM114-CacheID: sfid-20260623_093227_351815_3C2E3FC1 
X-CRM114-Status: GOOD (  14.34  )
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

i2c-nomadik driver prints error message on every faulted message. This
is not a good practice, because in I2C a fault not always is an error,
sometimes it is the expected result. For example, scanning bus with
`i2cdetects` prints over 100 messages in dmesg (two messages per each
target address).

To avoid excessive prints in the log, change the print level from err to
debug.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index e19ace904e79cd2d83171d9f38fc103a6c5e023b..7d93fb3876dc1324003dd19884e3fd5cbba9cfbb 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -627,7 +627,7 @@ static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 
 	if (!xfer_done) {
 		/* Controller timed out */
-		dev_err(&priv->adev->dev, "write to slave 0x%x timed out\n",
+		dev_dbg(&priv->adev->dev, "write to slave 0x%x timed out\n",
 			priv->cli.slave_adr);
 		status = -ETIMEDOUT;
 	}
@@ -661,7 +661,7 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 		i2c_sr = readl(priv->virtbase + I2C_SR);
 		if (FIELD_GET(I2C_SR_STATUS, i2c_sr) == I2C_ABORT) {
 			cause = FIELD_GET(I2C_SR_CAUSE, i2c_sr);
-			dev_err(&priv->adev->dev, "%s\n",
+			dev_dbg(&priv->adev->dev, "%s\n",
 				cause >= ARRAY_SIZE(abort_causes) ?
 				"unknown reason" :
 				abort_causes[cause]);

-- 
2.43.0


