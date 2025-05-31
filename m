Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24DDC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 07:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=204UNc2Wl3rmtEs6OGcSVTV/VNrUI6SdVkUZQOxQBr8=; b=26Mblv4Ri+cJ2MLRPbi6LbHldz
	OeB4PrypL7sF6T1S5mviUzryyYnulBOj/62fqaO2X3KxBZ9CnUKA/GJ0tMtWtm17SvYmIhdq0y0Np
	bIDYCmWXB5OcCbTVMAPWhNRgVnTjmJGSVinWU2G/k8CDUu5YUR6CRLWXadkDiS36FljZQaQSWov4x
	2zP9BP8HQ+Skqg2KY+XV7OoYRP4NuyJ1RqweFVsI3t2Bv7X7IBTviZBXDwBy5AKMFfD0lQ+Wiw6yQ
	h7azWALKZmdsleh2xQmO7QvRCRHK2XZ0okPjv8BPn+SfFtnzCbavI4vb3wt2kq+Gm0Bx+wJ+2QdfL
	YPX0GInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLGEJ-00000003Sfe-3FSK;
	Sat, 31 May 2025 07:02:07 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLGA9-00000003SKg-2jhh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 06:57:50 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-22d95f0dda4so34340205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674669; x=1749279469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=204UNc2Wl3rmtEs6OGcSVTV/VNrUI6SdVkUZQOxQBr8=;
        b=Ca7QbF8QfwpTQZNOli++/6OSLX8VBkoKVXMqIYroK0XFuyHW+c9M2pmbIO6XenKoml
         A83cEfNPhRScnU1R2khKhQzLbSF737ZqNN1tAeLPvaOlvmcsULb94hc/zDKg3rLAtyJU
         fu8gwfJWkK78SUIOY5OURpSOgwaRTCNAu1BPXHQY/Zoi8o8mANxGB04Bo3qcYw7F/5ZL
         bnvtEkzminwI8AeOp6FKTorsXwoPgBoDv5V1ch4j4CebsE2QwHmtPCBOVSmKUQuJSUyH
         3yqH1orR88bW7dGaxfXQ+EQGNH4tj53ojWInIKPcQcp9jAc63K4S6qs/sLUgLVqjw8H1
         unpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674669; x=1749279469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=204UNc2Wl3rmtEs6OGcSVTV/VNrUI6SdVkUZQOxQBr8=;
        b=ki+JPfH+lwELdL6cBEOCVlF1zyULJlpBRxjSOz4UJC7Db2oy1MY6btlNax4jv9yuAm
         nWhZxjNy19+IYrDCctWSDiiZyUvUV7Y9sT3MtEALITZEn+pajMbtu6qCNNA1dxuutkz6
         8HFAYlE47UGRNQj9k0rw5JlRv0OSY2QzFTdjfsHST29Q7ypJ5Qz4TI0aJ4AH2ppGpYwA
         /zoSNj5KIbWKht8XtyhCQC7OxKwjlprcQXJbfYMl+SgUOhvaz3KrAz4kicJ8VSs7mbnI
         GZWKixRjgYmfzpK4K7UfT2V8vpxR4mH5l7J0FN0DmvkYlyh8v53U6FxS/8P4sio4VQPV
         MNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWSHvtb4/LeN0uHqUo51smHKTmVu517CyVQ4lka8u14LQnksrYR96T0ASKa3GIbA5ht1ACPAI3pTNMVnuEatqR@lists.infradead.org
X-Gm-Message-State: AOJu0YyU7KvA5Qj4JS5zzPFeKn7LZxYf7fJ25CQ32dmN160aoN/aMR/E
	e9yJOkb08fexp5gjJ3+Y7q4y6Ysq0ixtRJJolQMDH1JWkNQFlYezxtcN
X-Gm-Gg: ASbGncs48xbneP3nvm3rkXW8cpujnoUxTJdWlFwH7fixCPYOeAvv/PMj4Ce1B0DHXiz
	ccIr2vFGW+usuth49czg4o6YYB+lIxA81gj87nVeLT+QZmn+huo3QIJ9Ktge4bDFu11+VdkKWJu
	7Clj6NmvQCuzT/JjrechN77EQXB8nWvOyFJSwBjrtqwU6LZi96OIxyHrdQHYmwGm7wvjNmU1hT8
	GSCHa5xV9u1YNtAewGz4R9X36ZX30hMxdHUmT7bZvTSIpoXrPO9KDN/BqQAOkBmEhp8x649aT7p
	WD9O+mlGDp9GHRrVJLJuIAp7nW9FT0rLfII=
X-Google-Smtp-Source: AGHT+IFyM1uZ0Xpp3l9OJV7SKmrYyK0ZVxdW6vyRglphqDLVvMKdPGkWMU7FlfnGr4XgkK+hBC/f3A==
X-Received: by 2002:a17:903:289:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-2352920a1b6mr86911505ad.31.1748674669029;
        Fri, 30 May 2025 23:57:49 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:48 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sat, 31 May 2025 14:57:26 +0800
Subject: [PATCH v4 1/2] i2c: imx: use guard to take spinlock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-i2c-imx-update-v4-1-bfad0c8fd45c@gmail.com>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
In-Reply-To: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=3153;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=kzfikvqslmcNoM9cU44BoA71y4mZZRBxiPJC+FC3nqM=;
 b=mSmDu4RPXx7Q/E/jz8U9/3TeqXi9A+CHJVNhbEnD/etxzCaQKeXuGPBn44QvPeKRfsEUAomxS
 RS7ibvc1PWlD2+I2WStej5tGgy79/YVJzveC6SOm9EFUHoN+iWAemox
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_235749_700023_DC7CB54A 
X-CRM114-Status: GOOD (  15.92  )
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

So Using scoped_guard simplifies the control flow
by ensuring consistent and automatic unlock,
which improves readability without affecting correctness.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..5b276e007292 100644
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
 
@@ -1125,32 +1126,26 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
-	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	scoped_guard(spinlock_irqsave, &i2c_imx->slave_lock) {
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


