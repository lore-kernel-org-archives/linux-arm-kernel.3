Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A7FC624DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwRfAN4FTJEPQqNsTQb4hJlAd0NIugy+RxUVr0Kzamk=; b=5EjbsZO7o0iZm2aYsJVjiVW1Kx
	c3XIBqdtFV08CHrmA30ByJ4ghMZ3yS3vMWshH75heWpZUatTGxm0AaF3/htakWpJp+zfl00mp20uy
	zO4qJQN52qxtNenKQrCZh9gIk1dKAMIR8WdrvTsQyTD2q9XOAKAIMQZoGqKcunnw7de9eOmNpn7Yj
	iCvrR4I8zB4IoIlsoRTTxB8r3fA3/kVCPSucVekXnEl9+2u39Ty6sDpMR20jNSwAnKqkAxLQUwuJb
	9eO9tz4NqJTVRIZSvPdcJ5VzBQ15k184H6SpEOtUvYNm1irX8hNY5e0Tz5rqaSBi3qT+b2fm2l3G2
	M+X5iUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A0-0000000GPQy-2eoh;
	Thu, 03 Sep 2026 05:38:52 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209s-0000000GPL3-3qIl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413925; x=1819949925;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ngGDtfpm/5mhvpzqlcomRG1s4PNkluY8gIbRm8fwLA8=;
  b=MPqFalqWKnrwQmRiqL21saY0VlksNPWgt//le8VExfXnMXUlY+mmXHFw
   2snVxnjBYPTeoNu/eed+Ddniv2WtdgJt4EGQ9MFYHu+w+RKI+jvEFPaEB
   0P32KhayRh381YbCv8UYI8+Am1klgRxUqyUoIUVeka6x7VAlyWJs6AUFR
   iIcJUzYXrPuXLLWeSEHsJHZusVPPp9s9R+u0YX2ZEdZAsLi9VFvFNeNyI
   U+JTZtIwJRnWFluDV+KxyD1zs96tNewRNObWt29Y9ch9FJ1djcD5BS+ad
   E92o9zCYPgKYngbDtbe/PAKPqwPZ1baFoSLrMCEyeFM246z7PT50xb5eO
   w==;
X-CSE-ConnectionGUID: DDf9oXC3TC2X0gsorOsd2A==
X-CSE-MsgGUID: dMScLluUQ+ObmEElTn2C0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:43 +0300
X-CSE-ConnectionGUID: NsHN44qGTJiJHqU79igiIA==
X-CSE-MsgGUID: AHHKGvs0QmqFFmKhMvwnVg==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 03 Sep 2026 08:45:18 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:42 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:13 +0300
Subject: [PATCH v2 06/12] i2c: nomadik: add quirks max_len=2047 and
 no_zero_len_read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-6-fedeb91792e6@mobileye.com>
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
X-CRM114-CacheID: sfid-20260902_223845_239034_F5D0F2AA 
X-CRM114-Status: GOOD (  15.01  )
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

In Nomadik I2c controller, register I2C_MCR has 11-bit wide LENGTH
field. Its maximum value is 2047, so this is the maximum length of a
single message. It is less than the common maximum I2C message length in
I2C subsystem (8192), so define a quirk in order to report the
unsupported message without any attempt to transfer it.

Zero length reading doesn't work properly on this controller, so add
`I2C_AQ_NO_ZERO_LEN_READ` quirk flag.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 9c7658148bd45ecdaef1f998558315580233555d..c36e9961e0a39e76386a6e20f6e0b6fec3d5b5a9 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -79,6 +79,9 @@
 #define I2C_MCR_STOP		BIT(14)		/* Stop condition */
 #define I2C_MCR_LENGTH		GENMASK(25, 15)	/* Transaction length */
 
+/* Controller hardware limitation of the message length */
+#define I2C_MAX_MSG_LENGTH	(I2C_MCR_LENGTH >> 15)
+
 /* Status register (SR) */
 #define I2C_SR_OP		GENMASK(1, 0)	/* Operation */
 #define I2C_SR_STATUS		GENMASK(3, 2)	/* controller status */
@@ -238,6 +241,12 @@ static int fault_codes[] = {
 	EIO
 };
 
+static const struct i2c_adapter_quirks nmk_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+	.max_read_len  = I2C_MAX_MSG_LENGTH,
+	.max_write_len = I2C_MAX_MSG_LENGTH,
+};
+
 static inline void i2c_set_bit(void __iomem *reg, u32 mask)
 {
 	writel(readl(reg) | mask, reg);
@@ -1161,6 +1170,7 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;
 	adap->timeout = usecs_to_jiffies(priv->timeout_usecs);
+	adap->quirks = &nmk_i2c_quirks;
 	snprintf(adap->name, sizeof(adap->name),
 		 "Nomadik I2C at %pR", &adev->res);
 

-- 
2.43.0


