Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8F4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 06:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/m+/Li5pJXxIfZ18YdvYQcc+JWVJfDghRV2cswxgso=; b=3LbC+yki8nJi5Om/Ni2Zk5tDZ9
	yFY0SlnpN9TYKl9mZjXVSKJ6lkHLR4hyqhQ1DgTK53lQw787uTLNvabw0r+sdwgc5PZtF1/A1C13N
	qasNw/W1fLi1GmgApZQa391UZoiwFAucv63RJpsb7G/xn9zYq/SZN25BOJXWW94mdx/WkDzfvuZzg
	lupMuJWSfNTA7r7sp9lLz9oWZZCQgodaPltWMbcvZhjyaiaIorUrIyuFr2+wf3QFWRtna4pjjRE8J
	+c1wUK1NaDlC2OsKtzmI5r31jgxrMPXoVUpuYPIqxQ6kL75RngfcLpLiE7UWlbfBwK9EUGseWQAVC
	6XWHCgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjM9-0000000BWoe-2rax;
	Tue, 13 May 2025 06:43:13 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjFo-0000000BWE3-2cTg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 06:36:41 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-7426159273fso1915219b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118200; x=1747723000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/m+/Li5pJXxIfZ18YdvYQcc+JWVJfDghRV2cswxgso=;
        b=XP2XT8YaQk3CMwfctgc9ET/pML4QX5IoKSK1eiExAOJDTD2spN1wDaQozCjAnskFqr
         wXerLAxHUbK81mp8STQtPJJIi/vGg4TLkOCNmW9Pi+XOZF3oFpwxKUUn692zbBDNT54B
         BDhdbaMmMED3gew/qIO7uJrvbnYWRFzw2xrEcf9M9ehHneuPjO2CsiHn4o4Dm4xRgWe5
         2fzrQjG2N/XYu6YpFHK8BWH+BW6B30rFZ/MqqyUos/7iGlsJz1sqVpq7q2+vflrcDuTn
         46SZFxjGVqbMvAjMTV6MAOH4ClaUL2zAJ6T6IYLMx89WUS44/BIJAQvt1+F8q8yRqIGX
         pV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118200; x=1747723000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/m+/Li5pJXxIfZ18YdvYQcc+JWVJfDghRV2cswxgso=;
        b=Z8kPK0RG6FKzxaWwUSS+UTxuM7L0qftDq4bRhZU9Hfww2TKC2/Rc/Qxkm0luS0y38U
         xb3KyphqQYo32KegO4D0O6usC7eU4nAlrOwIAcAzJAQ2ZEAGEAhoRenh6SYSvTgfKe1i
         RPlYg8AS/V8c+9kaS3IzLOBbcrFEcrlP7HkQyPqMEb43YH0IF+alrg5DYwch4BaZTDlf
         9BmFchB24QTE6ieitiy5Yq0MhhXJuR4TQ3xhlZhzVXNc8vBhgoUJywgSVQZ0B1vYSXW2
         Zy5JhZF+FUuMoPI3j4PhdI8U7j71+00q45toi7yNa2NlVEqPRIYYCjxAgswc6l9hacLw
         WvMw==
X-Forwarded-Encrypted: i=1; AJvYcCVehp73NdrUxNIulw1/2EyPS2XTAkwm5S71YemproFgySs6qqzoDcgL+Myit+MILqJF3wdTFOUR9zQuiM6zTkw/@lists.infradead.org
X-Gm-Message-State: AOJu0YykRgzpHc/Ra3iqvPQHtJa8p7qOEUlgNqORM+bKVmvWJrLrlEs4
	HW/D+jDUGIz+1U06LaF9XV9fblDAGNIL8wviN3xpCYa8ApHgc6Ees9z05DN6Oto48a6s
X-Gm-Gg: ASbGncsm5VlSBhl1mLYXYANnWvm0l3pOC5z4GmoPQpRQnq+kLC2a983nlN/ZPm9pR8S
	4ENp+OcHxsd9ehP43kodTG+3u5n+gj0xDYV00yS0+JCY1yHc3/6d+meAn9LcBf4mke4Kfg+QVG0
	JhglsQ5hdeRBlfY5Rnd3K6o+dV5xMtFU///9IePgpJfSrutxOMgYjiCYoGwfdYcvpDo4TJw09Re
	XjsJVPYyp1Supzu9NNRdKFjxmsQUxMzwwNxLWnUzW/9y5bB1iQSaXdcAuXuHEN2j/FZhhK/AQxa
	E3Bo3zxBZ4ZYxfYTiLunSNK+a8pCJ7/3u4I/CgJ/JPp1zvjxyG0VQrc=
X-Google-Smtp-Source: AGHT+IGZ12WCZaO89aqysPWzb8ptQomhGLUKACz8fvPTEYceAq2R5hRP0UZ1mryvPQHCijtI5AB34g==
X-Received: by 2002:a05:6a20:7fa4:b0:1f5:83da:2f9f with SMTP id adf61e73a8af0-215abaf92e9mr22671112637.12.1747118199649;
        Mon, 12 May 2025 23:36:39 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:39 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Tue, 13 May 2025 14:36:13 +0800
Subject: [PATCH v3 1/2] i2c: imx: use guard to take spinlock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-i2c-imx-update-v3-1-817b7426a67e@gmail.com>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
In-Reply-To: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=3101;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=h+IkIgCUvVv5X/EgaxFnbE68t9F1Ebt3Kltz7OM6R0o=;
 b=GEBTx6+w7HdlyIV2HGzJrrowsb4WUjf9YUDMcusHX61zNyz4tZoMS2uN2u12UPh1FXB5/cVSC
 QhMiNEnbqgnAxvnM70de3VHUi8VKsRvt/VNeqwQ9jVbxs9ve176vtez
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_233640_667656_DD5DCC4E 
X-CRM114-Status: GOOD (  16.17  )
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


