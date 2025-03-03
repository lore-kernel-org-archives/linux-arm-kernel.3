Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35801C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZ5oJp3c5WFM4WouXer3X9uqb/QndY0s4T1ZVpIJ/XI=; b=hkpgyJt8JtG73Gva6EBKBMSOgs
	ysXW3GSBP/FhYpktigM10lFc+hyckdq1MSr6KI56jSglkTwEZxRD48Q1PYXTduU+rjcYPUUrjVcDl
	VN+cbcMF5tGKIMVPPmqLK5/mEumjhTYeWLEzhupV8e7/ocNfdUcBZAgt5sphz8sO7brQLaGt0aaVz
	2Z7/tJIU2rgwU6kzfqP/t3IkNWBRkZ1R2YLu3HpwAVmGJafgUv6u3QTgHjzIiLjgBcucnrrZwx5yh
	ASJyYa4zfPxpDu17mQoLPqvHezwXlqmQtJ362KKFTvACqTnMK3KSJ03SJ2XWbxsh4k25mk9J/4zm7
	4QyFp0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5nX-00000000uOA-43rg;
	Mon, 03 Mar 2025 13:25:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5gv-00000000sVw-3hI0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so11520085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007920; x=1741612720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZ5oJp3c5WFM4WouXer3X9uqb/QndY0s4T1ZVpIJ/XI=;
        b=0kusdpOdwEahAhpPuIm9hqDteddl4OYOLnrlvlbpOnpmeSQtL1dFnsKSM1NMtswD0T
         1gaUgFtN47XxxIlUEhXnUlG2hL3QGIUnNi7lczoaTdPc0CDnQlrpdMcsxd3S5THEzHST
         DuSq+ABz/yOU/8N8A2+HK1oUDbRkt2pLMUZ7y5EqlLZgqtbi8uXae7SlZoTsZcsnJdcZ
         i1R7bnuCE58CtmrTuupBGW988XWAt5n0wKpcHPWvycdOxp76DBXLCI80XdjiYLpW00am
         Jgu3qSWlSu5CzlLhAOKGEfFZXB/G1A77SFKRxq1cCQzsQtvYf0tnCEbTFA8g1vzEDKl3
         aKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007920; x=1741612720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZ5oJp3c5WFM4WouXer3X9uqb/QndY0s4T1ZVpIJ/XI=;
        b=l7DmKvkWdNoA8gj0W0weVfXBVqWNDj/Q5xlv+U69g8XLdLVLw6KC182wkQzjqH6oeE
         KKrQTRiaeuIQzkb8do7new2ur5+OhtSdbRLPXGWuZNyKWDxcM+0YypyMbvkleTyuE4BK
         n4T/YUFyMnZL8CULtCT3F+ze7ghrsB+yNGP6BLQHgjWiKY6Oql0CJazggbTbl3KhUamz
         fJFGN7SCM7gVfR4B3sxnCt54zbkfWh9tgwOT1sAg3Lwvgz61Fc1OEpHak9JDApGGnjtg
         5TYJDG1LRGHCSzq0QvSimYfSrlG19f8AlXjuWLx+MJI4BbUdT4y3ktSN+gXGGAN235WU
         OpLA==
X-Forwarded-Encrypted: i=1; AJvYcCXYgGZhqXkFjI7wV+BCQxw729XkgrDD9IMoPN28wwLtJPNORCt3r/oY1PVedOYV72ITWgMVLVrGtkQAhBeUzC4i@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0kqCP+pmvh1EDABYClGJxhC+c479bntJBWI/aVPoxiIDa2gi9
	ncsG8MK6WbQtbK+9w3+9F3y+GfuB4NQiCmu11mdkAz7QlEXdjMlyTN1+hav8suA=
X-Gm-Gg: ASbGncviFEMBn/QgyKUiqpvjOocaiWAJVAJiKVvW49rF90iMl4yd+Pdm178QoQpXinU
	onLecT0vZ+MK0PoLP3XzfqhBWNODUYjTZY8T68xn/sFGY7hENFkwZoKG5iG2RVr8zHzYDbV/Orc
	b8kZw1ydXm8nSdIIjpJZUWxsEZ+UvvSdzQH6bxUofIUOOA0t1oV2gvYekbesWXDuFNiznGrUUqz
	ZL3eiXNsp+uQw1eGrGAaxQTGVSZMHVH/04InxtFo26obhS9XkBOmtC6HxOKnYuLLQy44czV5b3K
	je54X/57g6sLlXg5rWFhHm3kfAYojMZzYs1n/w==
X-Google-Smtp-Source: AGHT+IG5s1ruT1nmumvD1vz4k/PQPFk73wz70YSES2dlvEwqzkFmq0l7g9gUOgUlEDWIW1/6NKwMVQ==
X-Received: by 2002:a05:600c:1990:b0:439:9b80:ca6f with SMTP id 5b1f17b1804b1-43bad205987mr116763645e9.5.1741007920075;
        Mon, 03 Mar 2025 05:18:40 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:27 +0100
Subject: [PATCH 02/15] gpio: adnp: use lock guards for the I2C lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-2-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5610;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7cE7tXYd+kBXXnaURava5I+mvo86dKpC24i0n29V+bg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawpxuJoIV5NMGocJt+m6HFa4mYBXmmZlg4hw
 8wwnHfFcfGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKQAKCRARpy6gFHHX
 cvjzEADPodYCLVwjeMTiGTqPipprljvQCB/GL3xqqTvapt8laajCeEP13MAl+wEQgOI0PZjtgmX
 IfA0F82Ky3uW/F57NzwGDDUbhJo1kkawv/eZOqQ+iySkYpAjFaF1eV+oboYthMguItGFy3KWAQ5
 JqKgAdn7TqGMrZWB4xBd2Nfu71VA+FhqgEXam6X9yeI0uNeMN0yeLZsyxvTZq66ZVrt0yop3Pg5
 kp6deFDMu8Jn1//eSLL+8uVpdoKB+Cj7AT/AUl6/5x69brbHiORb03ioq1Nv4XPE2Bva+/oCBw/
 aCFfEOyJrsROsvx1dYpcXMWytgBgxj6wM3OhAa4dXuPWGxKFq3inPX7XxK2YoKp/HlfRCs3Bv0Y
 MPsQNxupceBB6eNWtP3bk0r92+8D0i5+m3NMGz2zq83unvXskmb8q+LiwAQ79DL72CednxwdxTu
 Bj6tysTCulxtGU5NqYQDAgmXUbdvRiqUrSAmCUQAvmQ2b5Gf+VaMZIj/V+Z7gfj5/emjbGC9rem
 R+EAqun19YF+NX/B2DOft33MLhn9mZThlbEy6JE1cTaXqDp/Tq2AArFUUx/C0JDRf+HzB+Mx3q5
 dNl7v/Pp8yfkP/IZCSnqtnNj1sUXTVN69sTh4L4X2UV96caMerMTa59SIBSU4eZPg8a9MdsOwj/
 UB9QF8bbNI/2ffQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051841_961612_65CE735E 
X-CRM114-Status: GOOD (  17.26  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reduce the code complexity by using automatic lock guards with the I2C
mutex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-adnp.c | 118 +++++++++++++++++++----------------------------
 1 file changed, 47 insertions(+), 71 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 6dafab0cf964..dc87768276ec 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2011-2012 Avionic Design GmbH
  */
 
+#include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -101,9 +102,9 @@ static void adnp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct adnp *adnp = gpiochip_get_data(chip);
 
-	mutex_lock(&adnp->i2c_lock);
+	guard(mutex)(&adnp->i2c_lock);
+
 	__adnp_gpio_set(adnp, offset, value);
-	mutex_unlock(&adnp->i2c_lock);
 }
 
 static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -114,32 +115,26 @@ static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	u8 value;
 	int err;
 
-	mutex_lock(&adnp->i2c_lock);
+	guard(mutex)(&adnp->i2c_lock);
 
 	err = adnp_read(adnp, GPIO_DDR(adnp) + reg, &value);
 	if (err < 0)
-		goto out;
+		return err;
 
 	value &= ~BIT(pos);
 
 	err = adnp_write(adnp, GPIO_DDR(adnp) + reg, value);
 	if (err < 0)
-		goto out;
+		return err;
 
 	err = adnp_read(adnp, GPIO_DDR(adnp) + reg, &value);
 	if (err < 0)
-		goto out;
+		return err;
 
-	if (value & BIT(pos)) {
-		err = -EPERM;
-		goto out;
-	}
+	if (value & BIT(pos))
+		return -EPERM;
 
-	err = 0;
-
-out:
-	mutex_unlock(&adnp->i2c_lock);
-	return err;
+	return 0;
 }
 
 static int adnp_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
@@ -151,33 +146,28 @@ static int adnp_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	int err;
 	u8 val;
 
-	mutex_lock(&adnp->i2c_lock);
+	guard(mutex)(&adnp->i2c_lock);
 
 	err = adnp_read(adnp, GPIO_DDR(adnp) + reg, &val);
 	if (err < 0)
-		goto out;
+		return err;
 
 	val |= BIT(pos);
 
 	err = adnp_write(adnp, GPIO_DDR(adnp) + reg, val);
 	if (err < 0)
-		goto out;
+		return err;
 
 	err = adnp_read(adnp, GPIO_DDR(adnp) + reg, &val);
 	if (err < 0)
-		goto out;
+		return err;
 
-	if (!(val & BIT(pos))) {
-		err = -EPERM;
-		goto out;
-	}
+	if (!(val & BIT(pos)))
+		return -EPERM;
 
 	__adnp_gpio_set(adnp, offset, value);
-	err = 0;
 
-out:
-	mutex_unlock(&adnp->i2c_lock);
-	return err;
+	return 0;
 }
 
 static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
@@ -189,25 +179,24 @@ static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	for (i = 0; i < num_regs; i++) {
 		u8 ddr, plr, ier, isr;
 
-		mutex_lock(&adnp->i2c_lock);
+		scoped_guard(mutex, &adnp->i2c_lock) {
+			err = adnp_read(adnp, GPIO_DDR(adnp) + i, &ddr);
+			if (err < 0)
+				return;
 
-		err = adnp_read(adnp, GPIO_DDR(adnp) + i, &ddr);
-		if (err < 0)
-			goto unlock;
+			err = adnp_read(adnp, GPIO_PLR(adnp) + i, &plr);
+			if (err < 0)
+				return;
 
-		err = adnp_read(adnp, GPIO_PLR(adnp) + i, &plr);
-		if (err < 0)
-			goto unlock;
+			err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
+			if (err < 0)
+				return;
 
-		err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
-		if (err < 0)
-			goto unlock;
+			err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
+			if (err < 0)
+				return;
 
-		err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
-		if (err < 0)
-			goto unlock;
-
-		mutex_unlock(&adnp->i2c_lock);
+		}
 
 		for (j = 0; j < 8; j++) {
 			unsigned int bit = (i << adnp->reg_shift) + j;
@@ -232,11 +221,6 @@ static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 				   direction, level, interrupt, pending);
 		}
 	}
-
-	return;
-
-unlock:
-	mutex_unlock(&adnp->i2c_lock);
 }
 
 static irqreturn_t adnp_irq(int irq, void *data)
@@ -252,28 +236,20 @@ static irqreturn_t adnp_irq(int irq, void *data)
 		unsigned long pending;
 		int err;
 
-		mutex_lock(&adnp->i2c_lock);
+		scoped_guard(mutex, &adnp->i2c_lock) {
+			err = adnp_read(adnp, GPIO_PLR(adnp) + i, &level);
+			if (err < 0)
+				continue;
 
-		err = adnp_read(adnp, GPIO_PLR(adnp) + i, &level);
-		if (err < 0) {
-			mutex_unlock(&adnp->i2c_lock);
-			continue;
+			err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
+			if (err < 0)
+				continue;
+
+			err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
+			if (err < 0)
+				continue;
 		}
 
-		err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
-		if (err < 0) {
-			mutex_unlock(&adnp->i2c_lock);
-			continue;
-		}
-
-		err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
-		if (err < 0) {
-			mutex_unlock(&adnp->i2c_lock);
-			continue;
-		}
-
-		mutex_unlock(&adnp->i2c_lock);
-
 		/* determine pins that changed levels */
 		changed = level ^ adnp->irq_level[i];
 
@@ -365,12 +341,12 @@ static void adnp_irq_bus_unlock(struct irq_data *d)
 	struct adnp *adnp = gpiochip_get_data(gc);
 	unsigned int num_regs = 1 << adnp->reg_shift, i;
 
-	mutex_lock(&adnp->i2c_lock);
+	scoped_guard(mutex, &adnp->i2c_lock) {
+		for (i = 0; i < num_regs; i++)
+			adnp_write(adnp, GPIO_IER(adnp) + i,
+				   adnp->irq_enable[i]);
+	}
 
-	for (i = 0; i < num_regs; i++)
-		adnp_write(adnp, GPIO_IER(adnp) + i, adnp->irq_enable[i]);
-
-	mutex_unlock(&adnp->i2c_lock);
 	mutex_unlock(&adnp->irq_lock);
 }
 

-- 
2.45.2


