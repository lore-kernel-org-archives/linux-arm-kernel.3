Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7307C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSKaFk0+DeKlsV0UcX7WhmfsVywbQKXHecEM+prNcy4=; b=QCzGm6nxpkB97iHqWSfOPO9eRt
	IZ+lLpvxale7rBF+hJYTdv4sLKCgG7pMOinM8AF/54On/DhhcIdk9GUfmuPb0cXQQnZDdAsuR4iHB
	WBzJjOpm3XEGlPzhdxWLUuyBJYwcLXkFMC6e5jzLsnjGUA7Q/tQf+Pc/1ttSkcu4v2xI2M66O8UK8
	m3nZXj69UbrWVRrEZM7NflC7dihinr2YC/wDpjW940d/454Hb1wKsrbUTtcSiOjTnbIuAFf7LrvPF
	hSMn94A3zSpib2wyOGN843VECIUpo6OBdP+eNXz5SgegQJynBtRiPXGBekZfu1h0FV7uNxaetaN5y
	7eYWzQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A0-0000000GPRF-3Y26;
	Thu, 03 Sep 2026 05:38:52 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209t-0000000GPJi-1gCa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413925; x=1819949925;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=nlZNbwIyTEpADUlhze0eaVgSfFmoT/5b05U10+WjG/M=;
  b=SAsF120cCo73K8OZqzA+aeEKzTnfiQC00e1tUk60a6jlGJv/g/Vgdzp2
   9AEQJr+cjmG3E6VN7SaoAhDDxb4GyyDxP7uZDn9ZL2q0WNVSUZHrJx5Aq
   vk7a6b8HMomiJwixvSDwNhnFwxjdWDWVeUCQ6JycoZxPzNfYsrMFcurmh
   okeh/s9JVRuAEjDGi73JgiNI1xkXlPRp4g5tAfGDtRa0+YYou1EoW+Oog
   YoR+Lqb5fNTdrDtp7eLMkSt9ZtyYdGE2E7DW70BAwEDaYmXm8RGwrFiSZ
   ivDAo07kzZ5yGd7ueeMPbxPcgqdbRJdDVneXlP4t4QlwURbvinfnZHddp
   w==;
X-CSE-ConnectionGUID: HwvXeYcWThWecnr8u3ngag==
X-CSE-MsgGUID: +8koiemDT6m0fczdTYsyhA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:42 +0300
X-CSE-ConnectionGUID: abxc5S9CQ2SBHX1Nd2NPmw==
X-CSE-MsgGUID: ZuKQV8clSlyTOQVNKYtjJA==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 03 Sep 2026 08:45:09 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:41 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:12 +0300
Subject: [PATCH v2 05/12] i2c: nomadik: change print level for fault
 messages to debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-5-fedeb91792e6@mobileye.com>
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
X-CRM114-CacheID: sfid-20260902_223845_711395_B814B9EF 
X-CRM114-Status: GOOD (  15.54  )
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

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index a3cef4b66190a9e45898e25867a3ceefce5d3d0a..9c7658148bd45ecdaef1f998558315580233555d 100644
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


