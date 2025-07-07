Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B41C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5m95BPd+tC0NJEgq1fKV46WFawJx2Vc2kdVjnJZ0X7U=; b=m1vqy66+TJmqp1cT0KDzyz5HaC
	lqjrabUXifvBfAHhs3XSaGpjHInPRE2oYkHZDvkoAeX+9ZqKCbp+7pKH905rPqQPd38pRre07Yi0U
	rO+HL86PxfQWRgfLYJJaKx+nGQf46ZRqSnOMerrRSVoIJRYYmozBE1GxfhTES4v2leLbok89OSFsE
	sLKf0mlYePp0FJOfH5qMwKRN3G3KfQMhwV9S/AD6vtY1QCOdgDtpQPKpXEELvzrEPqbJMLuZZ/bed
	JhYIP8EWXL67COQ45lwJa8buihY39VfnEeJKCfq6bEB7rz8jaD/kvpgZX9xhTtw2hoTCLC52zRX4r
	4iMNWn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhee-00000001uIv-2Ldi;
	Mon, 07 Jul 2025 08:56:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcW-00000001kNH-1iM7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-451d3f72391so28079925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874635; x=1752479435; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5m95BPd+tC0NJEgq1fKV46WFawJx2Vc2kdVjnJZ0X7U=;
        b=wGy9wy0TeMcy2VIC3WmZl+gJkUsT+iIq94NCMI8UWT/hd5rFy0X9Nuv8lKb2Ho6TQe
         hjvx2IkA3cZ6Vr07WeeykALgkoDbYmYIOfOKWtEuazp3cMa4emHN/E2ItRjmh3/PgzzH
         o2V5KaZkQXpXGhdRqH6ZZ+NTTDQdYLiqru2GyG1ZMCg+EStpPNTEqxk/Iz3b7WQdvp4T
         Lw//0kG7GIeaap2jumMBqzKUeTbZu6AdAGbVgKrWaLiZW680Z5OLG2NwwI/wVmaaalN8
         l7RABmH0hKLNxE3BTakCJrB+mzA5a+NK4ruEEXAiAtpV1cpl+Y+StG8chjsAdaDAKfy4
         pzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874635; x=1752479435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5m95BPd+tC0NJEgq1fKV46WFawJx2Vc2kdVjnJZ0X7U=;
        b=NXeWyokdCv8yZfShWHcM/i+1gSChKmPhmyUNUsyGoylWG3puWa6y+AKQ/s7yN3THJL
         91CF8IIXKbSn84Ah3wI8+IEOlnDC/NWVa89NIbQSR7UkgIWyueRRvkAleB+FygbCEiPm
         PWV84of1H+UJsbVrBo7lQjU9BQD/IQSlYw0twUrmdwZdKyxopR9aVuG/NvdTUgeaU3mY
         D5hj8cvv/Mxr5WnKjws2ljUMUpgCmtg2WrnVksILjR1cjhVpFBcOxhrxbaMk9SAAerfl
         L/QEN+vnDhRnlIRBkJI05Xox2HIvQASd8+Sc+MAUqns+LP+jY1m9P1dDE3Kdh2VUFdJi
         tfOw==
X-Forwarded-Encrypted: i=1; AJvYcCV6U0BCuuq0b9oJ/Zz4OWjbEHEltvSoVcYNRmSXVfQVvB7ntfK+3BK2VwT5oIyEnYf0nvsdaPYHcNTb9+ltwfA0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx41jZPAZrTWdJfsdkgzDrJ5ItCiTCdmzlwt4kdJY12kwFn9rJE
	1bI4DevL7MmCPw+hjUMgoHF4CKWVQ2a6Dkw2+TqtjzUuX0rmMxViSzKryF0FqqXjaq4=
X-Gm-Gg: ASbGncubtxZTqC/VQMXlW7k2QK22o5JNHxsNWGd7zCmRftIaLWJzMdPAWOVTRj5cfTg
	OBScDTLJ/obkXrV0DjdUHENTqgytjMFLz/j2sbXbH99+DqSdEG9n/4PlIwzGePaAu0njCGFtpoW
	i47EEGx01KDWItvJjclnfn6Tto09UQv6fGVgJNRCoVdJ5HjFd8d7ayXMsFwIh907ZvI+0iF61xM
	2pw/m17XU241mwblvrctdn2wcekPYzId7mHQ9H5O2iYjZYFIhX/LYvT1OEx3+xEongM17b3RHmS
	RtJUS11ra/EdWpU937XJRypkhOW7Uum5HzQwbkpVm2qUSfVA0hxTzT4t
X-Google-Smtp-Source: AGHT+IHsI+U/zbDSojMWN6sQm8VqQSx9aNhllH3AxLDc+j6V7DOcunJJMpxwdV+S7DO5xusMHGPzvQ==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3b4964f4da0mr9403903f8f.2.1751874634985;
        Mon, 07 Jul 2025 00:50:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:24 +0200
Subject: [PATCH 11/12] gpio: viperboard: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-11-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6288;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hG6ioXzqzHsweEWMJ3BfovvFEd26Ob457d1Hk91Aou8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w8kR5HfkB64zWwyrPXKAiwMT9HvA9xCgXzs
 3pKgIk6+6SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8PAAKCRARpy6gFHHX
 cpLoEACy+LzB2oIjcjJubbFal3oJ0odHk4EQHj7PZKBDox/S3htDeM1+FAViWFPpp44LwXrHVJd
 rZLJkEinpuIpyjqfpENeFgXMgEWWCCIOUmcK4azXhS5YPVnFkxl0LhTQez814mKWgJAZM1yuj0R
 tSvipK4cQBa8UUl1RKXrsb0naRvbfkkApmgloy5RrY7pJTBEU+trqDIVB61vU2mZ6hTjZ9+gogU
 //5ti98loMrVW9mdvZsWcpJt4vxDoHAm0JBMwOgo4VMqo3ghx/4uTh4Ozm8GPxTSjDu92RY31pZ
 vRWnd57ryNVnSwOwM1i5pWbpZ9UfSC0OztH1+3BvaTPOREZI8dy1CHM6303RX0ZmDZPYoaHNPKz
 PVxCW6p5NJK+F3rPr6XQ9L6Q0d/FUuCpbLXvhOvEmGs/Bu0GFv2drMbQlB72t91n/R0DN8+/Qrp
 jXKsNHqtJ4+NKrRrWLXdTl1ICMclZQ5td0zoqaGNHMMIRfff3g93xTnixkXNdHWQ9P7gtid84w1
 6mUrycMIacz+as0MO4Ej+Q3NUmLeslYFrxRKnnztz239jNC/RQCjuhicBVqLCzwG40JLIPWGKf2
 bNs9D4gCLrABH/LxryBSFYkDCZw28ipZknYxo3iDkX1Lc7/NnRYdPjMGiVeTSsUWggbTiKxqCEQ
 FJke3RNIg2OY+yw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005036_476827_4508ABD3 
X-CRM114-Status: GOOD (  14.95  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-viperboard.c | 116 ++++++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 53 deletions(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index e55d28a8a66f25dd0949133c4a7f3bca9b5711dc..3eba77f981d3a502b67a0a7cdea51c706d4c3376 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -128,45 +128,50 @@ static int vprbrd_gpioa_get(struct gpio_chip *chip,
 	return answer;
 }
 
-static void vprbrd_gpioa_set(struct gpio_chip *chip,
-		unsigned int offset, int value)
+static int vprbrd_gpioa_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
-	int ret;
+	int ret = 0;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpioa_msg *gamsg = (struct vprbrd_gpioa_msg *)vb->buf;
 
-	if (gpio->gpioa_out & (1 << offset)) {
-		if (value)
-			gpio->gpioa_val |= (1 << offset);
-		else
-			gpio->gpioa_val &= ~(1 << offset);
+	if (!(gpio->gpioa_out & (1 << offset)))
+		return 0;
 
-		mutex_lock(&vb->lock);
+	if (value)
+		gpio->gpioa_val |= (1 << offset);
+	else
+		gpio->gpioa_val &= ~(1 << offset);
 
-		gamsg->cmd = VPRBRD_GPIOA_CMD_SETOUT;
-		gamsg->clk = 0x00;
-		gamsg->offset = offset;
-		gamsg->t1 = 0x00;
-		gamsg->t2 = 0x00;
-		gamsg->invert = 0x00;
-		gamsg->pwmlevel = 0x00;
-		gamsg->outval = value;
-		gamsg->risefall = 0x00;
-		gamsg->answer = 0x00;
-		gamsg->__fill = 0x00;
+	mutex_lock(&vb->lock);
 
-		ret = usb_control_msg(vb->usb_dev,
-			usb_sndctrlpipe(vb->usb_dev, 0),
-			VPRBRD_USB_REQUEST_GPIOA, VPRBRD_USB_TYPE_OUT,
-			0x0000,	0x0000, gamsg,
-			sizeof(struct vprbrd_gpioa_msg), VPRBRD_USB_TIMEOUT_MS);
+	gamsg->cmd = VPRBRD_GPIOA_CMD_SETOUT;
+	gamsg->clk = 0x00;
+	gamsg->offset = offset;
+	gamsg->t1 = 0x00;
+	gamsg->t2 = 0x00;
+	gamsg->invert = 0x00;
+	gamsg->pwmlevel = 0x00;
+	gamsg->outval = value;
+	gamsg->risefall = 0x00;
+	gamsg->answer = 0x00;
+	gamsg->__fill = 0x00;
 
-		mutex_unlock(&vb->lock);
+	ret = usb_control_msg(vb->usb_dev, usb_sndctrlpipe(vb->usb_dev, 0),
+			      VPRBRD_USB_REQUEST_GPIOA, VPRBRD_USB_TYPE_OUT,
+			      0x0000, 0x0000, gamsg,
+			      sizeof(struct vprbrd_gpioa_msg),
+			      VPRBRD_USB_TIMEOUT_MS);
 
-		if (ret != sizeof(struct vprbrd_gpioa_msg))
-			dev_err(chip->parent, "usb error setting pin value\n");
+	mutex_unlock(&vb->lock);
+
+	if (ret != sizeof(struct vprbrd_gpioa_msg)) {
+		dev_err(chip->parent, "usb error setting pin value\n");
+		return -EREMOTEIO;
 	}
+
+	return 0;
 }
 
 static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
@@ -304,37 +309,42 @@ static int vprbrd_gpiob_get(struct gpio_chip *chip,
 	return (gpio->gpiob_val >> offset) & 0x1;
 }
 
-static void vprbrd_gpiob_set(struct gpio_chip *chip,
-		unsigned int offset, int value)
+static int vprbrd_gpiob_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	int ret;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpiob_msg *gbmsg = (struct vprbrd_gpiob_msg *)vb->buf;
 
-	if (gpio->gpiob_out & (1 << offset)) {
-		if (value)
-			gpio->gpiob_val |= (1 << offset);
-		else
-			gpio->gpiob_val &= ~(1 << offset);
+	if (!(gpio->gpiob_out & (1 << offset)))
+		return 0;
 
-		mutex_lock(&vb->lock);
+	if (value)
+		gpio->gpiob_val |= (1 << offset);
+	else
+		gpio->gpiob_val &= ~(1 << offset);
 
-		gbmsg->cmd = VPRBRD_GPIOB_CMD_SETVAL;
-		gbmsg->val = cpu_to_be16(value << offset);
-		gbmsg->mask = cpu_to_be16(0x0001 << offset);
+	mutex_lock(&vb->lock);
 
-		ret = usb_control_msg(vb->usb_dev,
-			usb_sndctrlpipe(vb->usb_dev, 0),
-			VPRBRD_USB_REQUEST_GPIOB, VPRBRD_USB_TYPE_OUT,
-			0x0000,	0x0000, gbmsg,
-			sizeof(struct vprbrd_gpiob_msg), VPRBRD_USB_TIMEOUT_MS);
+	gbmsg->cmd = VPRBRD_GPIOB_CMD_SETVAL;
+	gbmsg->val = cpu_to_be16(value << offset);
+	gbmsg->mask = cpu_to_be16(0x0001 << offset);
 
-		mutex_unlock(&vb->lock);
+	ret = usb_control_msg(vb->usb_dev, usb_sndctrlpipe(vb->usb_dev, 0),
+			      VPRBRD_USB_REQUEST_GPIOB, VPRBRD_USB_TYPE_OUT,
+			      0x0000, 0x0000, gbmsg,
+			      sizeof(struct vprbrd_gpiob_msg),
+			      VPRBRD_USB_TIMEOUT_MS);
 
-		if (ret != sizeof(struct vprbrd_gpiob_msg))
-			dev_err(chip->parent, "usb error setting pin value\n");
+	mutex_unlock(&vb->lock);
+
+	if (ret != sizeof(struct vprbrd_gpiob_msg)) {
+		dev_err(chip->parent, "usb error setting pin value\n");
+		return -EREMOTEIO;
 	}
+
+	return 0;
 }
 
 static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
@@ -370,14 +380,14 @@ static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
 	mutex_lock(&vb->lock);
 
 	ret = vprbrd_gpiob_setdir(vb, offset, 1);
-	if (ret)
+	if (ret) {
 		dev_err(chip->parent, "usb error setting pin to output\n");
+		return ret;
+	}
 
 	mutex_unlock(&vb->lock);
 
-	vprbrd_gpiob_set(chip, offset, value);
-
-	return ret;
+	return vprbrd_gpiob_set(chip, offset, value);
 }
 
 /* ----- end of gpio b chip ---------------------------------------------- */
@@ -400,7 +410,7 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpioa.base = -1;
 	vb_gpio->gpioa.ngpio = 16;
 	vb_gpio->gpioa.can_sleep = true;
-	vb_gpio->gpioa.set = vprbrd_gpioa_set;
+	vb_gpio->gpioa.set_rv = vprbrd_gpioa_set;
 	vb_gpio->gpioa.get = vprbrd_gpioa_get;
 	vb_gpio->gpioa.direction_input = vprbrd_gpioa_direction_input;
 	vb_gpio->gpioa.direction_output = vprbrd_gpioa_direction_output;
@@ -416,7 +426,7 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpiob.base = -1;
 	vb_gpio->gpiob.ngpio = 16;
 	vb_gpio->gpiob.can_sleep = true;
-	vb_gpio->gpiob.set = vprbrd_gpiob_set;
+	vb_gpio->gpiob.set_rv = vprbrd_gpiob_set;
 	vb_gpio->gpiob.get = vprbrd_gpiob_get;
 	vb_gpio->gpiob.direction_input = vprbrd_gpiob_direction_input;
 	vb_gpio->gpiob.direction_output = vprbrd_gpiob_direction_output;

-- 
2.48.1


