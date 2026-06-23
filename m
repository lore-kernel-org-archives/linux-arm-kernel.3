Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7061CCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=059lkVLq33bYeidBuL03HInTrUPoCgAHJIgUgjk9F4o=; b=JtMJlTc5k44nIydI1N6hI7b+sv
	Xs8onVGGMxhV3HbKey3muiUyDlfPc/s91rChty9A1cq+/swaqL8SsQRVF/JRQGHeenJpItCR1LfCS
	KMYvel2QezZv+qajZ4wpbP1hiZXp+eqqfmpdTl1RWsKn5HjZY9aHRHpMGFbGxQCOCLc2odqsKgOsB
	YMZw4aat/yyrxEBZME/gtWBEoCsCto6hFKW2r+bciWCf0JnE4CIts5sY+QVIn3kCn4JiKBaNxu4oG
	Aon727opaHQIyUk7s/MmBtwLAjrNy5mTvV1l0DjqUAA1wX0UwXMkWYqayGyhImm+iS0iU9HulxFF9
	LEPXEDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc43D-00000006d8y-0xX3;
	Tue, 23 Jun 2026 16:32:39 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc430-00000006d0I-0jyd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782232346; x=1813768346;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=b7Dymf517kF4quGrb7HxG94OSgoCfOvil6bI35Zl1p0=;
  b=bmLkuglVzRtUjZuBtEbKHxJVc/2ivKOyTy6TQRv1/5HAxVx+Pd5rGS4X
   Yoj1+vPMczs6tOdGnNsvzLjapKz+2s8qyOmvVgGEs026k3kwW+PEscqnQ
   /g0UGuS1/RbtZp4w5ex1Iw6f+vGmRr642bGv/Pfq+neE9PowLMMkPTDyC
   KTKp4xzvYDD+M7sMTJcyE2eg++Jx9+WS/1zDWnqr3uU9xtCkt301kc4Gk
   0TWgS+eVvS6Jf5+n7h+NruP9IHZNZeO1+AxF5harsPW9cXjTuTeP14C6i
   Y+m3VCsmu/K9vQPfE+y7cwuzwETeKxZDhshWKVr2rFNVLjWhBh2uJq9+z
   g==;
X-CSE-ConnectionGUID: s62FF0PXRX+Uy03EMz7jaA==
X-CSE-MsgGUID: vsDaYjGoS9WyZCTA0hS4cA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:32:23 +0300
X-CSE-ConnectionGUID: 1FpYdYBbQbWRD79i76cAKQ==
X-CSE-MsgGUID: ijERLh72R7CTM4JgnseRvw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 23 Jun 2026 19:37:33 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 19:32:22 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 23 Jun 2026 19:31:51 +0300
Subject: [PATCH 4/7] i2c: nomadik: return proper fault codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-i2c-fault-reporting-v1-4-6db1a8aabf18@mobileye.com>
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
X-CRM114-CacheID: sfid-20260623_093226_495776_3D801D3C 
X-CRM114-Status: GOOD (  14.00  )
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

I2C documentation Documentation/i2c/fault-codes.rst defines fault codes
for different negative results in I2C transmittion. Previously,
i2c-nomadik driver didn't implement them properly - it returned
ETIMEDOUT on most errors and EIO on master arbitration lost.

To comply with the documentation, return the proper fault codes for
different conditions, namely:

- EAGAIN if arbitration lost
- EOVERFLOW if message is too long (>2047 bytes)
- ENXIO if target address is not acknowledged
- EIO on other errors detected by controller (for example, NACK on data)
- ETIMEDOUT if driver gets timeout waiting for message completion
  without any fault condition detected by the controller (for example,
too long message, or SDA/SCL line stuck on 0).

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 3eb06988c026e5c573fcf55d83de7136b5ca7ac9..e19ace904e79cd2d83171d9f38fc103a6c5e023b 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -226,6 +226,18 @@ static const char *abort_causes[] = {
 	"overflow, maxsize is 2047 bytes",
 };
 
+/* Linux fault codes for controller abort causes */
+static int fault_codes[] = {
+	ENXIO,
+	EIO,
+	EIO,
+	EAGAIN,
+	EIO,
+	EIO,
+	EOVERFLOW,
+	EIO
+};
+
 static inline void i2c_set_bit(void __iomem *reg, u32 mask)
 {
 	writel(readl(reg) | mask, reg);
@@ -653,6 +665,8 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 				cause >= ARRAY_SIZE(abort_causes) ?
 				"unknown reason" :
 				abort_causes[cause]);
+			priv->result = -fault_codes[cause];
+			status = priv->result;
 		}
 
 		init_hw(priv);
@@ -865,7 +879,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 
 	/* Master Arbitration lost interrupt */
 	case I2C_IT_MAL:
-		priv->result = -EIO;
+		priv->result = -EAGAIN;
 		init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_MAL);

-- 
2.43.0


