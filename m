Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4184C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 06:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EU3GcwlVx1NDSs8nRLWvQptaTgy/PPey4t/ZeBvdCf4=; b=YDLOoXSb3T0a8cukojw8gs169X
	mvFjqSg2wAC1vsW/n0vJfEtdcf9UJDR9CaXuc7cPJ8b6PWVVHw08NjHnZbioqyWpPBpTu9oevyvuQ
	ZmnnGNN2ar02qMHuADowSgRXLqsoGfpuQGKPlmQv+napMYod49zE0jwUrBkCxkQxeV6LanigIvKWP
	OgAe2+U5aUGqEseVkGmng7a2rXmy5C8nU3m6HpVjfMLQdmlmGAIGHojSxn7cr71pNAMM4OamKp3K2
	J411n4c2s8InleQjNO7bj6DcJM4GI1iaXKqO57Uuke+U12rjVQAZIJ2DaAuXoIlTHF7yO2dSArIzS
	9Yg2Tlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vND-00000002yAx-0iGc;
	Sun, 27 Apr 2025 06:20:19 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vJR-00000002xmS-2RVH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 06:16:26 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so2879918a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734584; x=1746339384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU3GcwlVx1NDSs8nRLWvQptaTgy/PPey4t/ZeBvdCf4=;
        b=GKiHxh3N1mPMcHB9S8m+X0mRbxtoGSYp9VnV4DvW+rVtm8HuUZUlKt2lOG5KFhO9xX
         VDKFyB2D4bGqskbagdzWWJOwN9l4YJ9Mq9VUr4mj3l2/gqDmvZ22vIirofss9H0iwj2g
         JlyqMDli6iBoHeHInVHwe21ndu06XQQnAkMxj86o1ZCs6Am3QEvuMzGaiuZmNab9Ga6P
         tQYiRdRB370R52zjEKz86vrWwzmwpA0KDAITjME+apKKR8Zyue6cq0yRnQzhB5RMGTCg
         /9kWe1fU3Lsjb4zmR6NMoMAK+1XDw22Or1vOJdS1VhgKHkxv8Cb35PuuE+F5qeGQ3G4o
         3RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734584; x=1746339384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU3GcwlVx1NDSs8nRLWvQptaTgy/PPey4t/ZeBvdCf4=;
        b=PlFymNWXCEDdnyVz5akZ18iQJBDQNvtGvS3nSkjWpsjc1oA6kmWXf1KFTDs7BqyYnV
         Twiwpaj5R/sYGVcGD27hj33SCpZArW7GTdSR3Sm8frFljhI3JKmg4B/fWXgKov4T46r9
         7eb7EiOlTRlLDD5kV2NrnHBel3SkodQGjD7D+J5m3MqKgc3FKUt2cLkcZlm7w7PBX8Bo
         r8MfKjqt9RvU46UVd2KS/UXmgQ/dpE3Zkucqh2RULIeLk1D4oJE4rp3oyJn3YT0YYNGP
         RX1iraf0qqmZlIzarF/aTivirz3iA0nH2O2HHMdP1QMriSATEaIIiEPcNQwT1WLXi0Mo
         S39A==
X-Forwarded-Encrypted: i=1; AJvYcCUegIwtGutOkEwzJl7/N670QQNTAEBbC6giGs/lqqdglhpLx9gnQohBTGv13z3ZOBIWTS2ORXG/9tH3pinVonPT@lists.infradead.org
X-Gm-Message-State: AOJu0YwjcL100/D0kmIIEhZzi66uKI36XNFVWh184rUauLA6cy1Bjwej
	6cbXZ+NsNlYvYn6H+n9Kt36xchuLrq6s/yW2idnU1GZ2sus1U9r7kvzN/6bfin+ndAE1
X-Gm-Gg: ASbGncvhWA3aVvwN+PgiCQzzJ4iGdMP0xI0X1/3rtY9JEvXal5qTrpYafp8qCJOymip
	RzzYw3GJtetBa7dwuMSjpfwgNkQb1BfV6cKI1cvRxFlD1GL0E7MJik3qj1S4ZJlOR/qT0oGVmeH
	n9V0RwbgpYpXTJiOWmEXDqodAtRyATfkEAUAwpyomh3ZUSnAFGAJ2UyVRXOt3AOVp8aGSmQOHXJ
	9PQlLCcIrElm+Q4xl0y3bDU8uD+DZ71XfimKhSO3c1RFfDQXj6nrgnA6y4I9KjEAPRJR1+OuKhp
	pg0tY1UaHNxwIm2wyC56x6MM
X-Google-Smtp-Source: AGHT+IE3i6OjCQRWdv18uxdsodyVfMfSGch53emtn4PADO6a09T0tF9jjDHqnBrDwcUxVZwLyWkrPQ==
X-Received: by 2002:a17:90b:4f45:b0:2fa:228d:5b03 with SMTP id 98e67ed59e1d1-309f7ddd53cmr10233411a91.19.1745734583686;
        Sat, 26 Apr 2025 23:16:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:23 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 27 Apr 2025 14:16:09 +0800
Subject: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-i2c-imx-update-v2-1-d312e394b573@gmail.com>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
In-Reply-To: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=3115;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=E1ouHhYW5PVDVuXzVF747nKwomAL6wn6Nilv3Ee5mas=;
 b=xfkTzhbIKjZVihZsGuN+Wiqoz3QU8UyXVphp6monpZqAVNl9kksWQe1ths3ySasDwYc/f6Dq4
 YzWT/UQnMRlB6Zefe3NjGRJCt+XV1q7GScMa4RCx+WxAvwDOXAvW01M
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_231625_627655_333D21B8 
X-CRM114-Status: GOOD (  15.98  )
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

Use guard to automatically release the lock after going out of scope
instead of calling it manually.

i2c_imx_slave_handle() can safely be entered with the lock held.

Refactored the i2c_imx_isr function so that i2c_imx_master_isr
does not participate in the guard scope

So Using guard(spinlock_irqsave) simplifies the control flow
by ensuring consistent and automatic unlock,
which improves readability without affecting correctness.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..a98bf01c5dde 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -23,6 +23,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -891,13 +892,13 @@ static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
 	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
 						      slave_timer);
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	i2c_imx_slave_handle(i2c_imx, status, ctl);
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+
 	return HRTIMER_NORESTART;
 }
 
@@ -1125,32 +1126,28 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
-	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	{
+		guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
+		status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+		ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+		if (!(status & I2SR_IIF))
+			return IRQ_NONE;
 
-	if (status & I2SR_IIF) {
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
+
 		if (i2c_imx->slave) {
-			if (!(ctl & I2CR_MSTA)) {
-				irqreturn_t ret;
-
-				ret = i2c_imx_slave_handle(i2c_imx,
-							   status, ctl);
-				spin_unlock_irqrestore(&i2c_imx->slave_lock,
-						       flags);
-				return ret;
-			}
+			if (!(ctl & I2CR_MSTA))
+				return i2c_imx_slave_handle(i2c_imx,
+							    status, ctl);
+
 			i2c_imx_slave_finish_op(i2c_imx);
 		}
-		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
-		return i2c_imx_master_isr(i2c_imx, status);
 	}
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
 
-	return IRQ_NONE;
+	return i2c_imx_master_isr(i2c_imx, status);
 }
 
 static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,

-- 
2.34.1


