Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F952CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=; b=PedxgDieCTvwU4bDKPWEh1gzKO
	wWDg5r01thgQb6ietZ6pzdUyfj+3ys1IzEqiymTtWfh/fd6A0V35HVEe7JUoSOagUmsRf+zvDs1c4
	ECrG8s6URHBq03A41RJd1/kdT5mVph3we+/y7tHwfrLOZscWovKy7dQ6cywOpySoY9EwHCZmTfs7B
	fL6MtHdWDgfP585UJ+byHZ2FC8E1BULlsGxxuWlFxNydMFhv1oqg9L94hOItVwAmFaR+bkz8Tej0D
	dyqJLsQbcRELbdH+C+dzy7GKz6oSGTzNndhydD/nAxlX2xTtawcloAc6od8flTy6wsgmyiuznRnlP
	VyzSjPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq8-0000000BZUa-3JjM;
	Tue, 12 Aug 2025 17:31:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnsD-0000000Af2M-3syd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:13:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-459ddf9019cso17802555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000780; x=1755605580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=;
        b=NKUd2oqtXj5xryz7G+4ecCL75pLYIY5nmHye0RMtlEXxZBXWLzUD7zooNnaVWJB94U
         Lm5un1bmMHmZTEHpYxuYd14AThkTpGVhcl8Dn0DEc31JomddJGiwdBb9/ghykDHyEc5e
         vxg2Uetpg0jKSaa7n0fh8dNJ/nBzx6tzgjq4xG4HeFdIPuzAVucSYSnkTCZlTtVSfIl/
         kqnW9sLQH7PDB3JN4NM5VjHLDz2li8JDeBcU62puazSZ8vPLw7Wh0DVOGD1hxVo2m1fp
         bxofyZrf45qNvUBwRgcbhoN4nr4pdTMIenB+NrFXct3LwsmnSkIwqw+vT82Kh9AQx936
         5KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000780; x=1755605580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=;
        b=uJH4OSQntLHRD5aXjNgErMmvqhXuhRH0bOQ8Z/HVoTRV8GNi46peP4JGqWYdTIQQL+
         ckVTbuYCbH+chzaQ5KJMZbgH7xoCkXOK0htqFuRXrlGCqHp5XAfDPfwKQdE80yGG+9iP
         XLhix7eBQQn8L1VdynS6pwmvV3oaw3dkhHsvDIKV8dM6ZIV59U1CPYYqHOnO7/wWM/gy
         KJuFlCe+sXxEHjZPqzqb/PqYiqwfubHzY9wR2w5jYVP0jTehalUxezqLoyOguVxMI7Wd
         +UEkwmYgr+I7s1vxupKnqWot72S7NcdMUUInh7gWa9ZEqHALyefQ8mAjEOkDOPjh7qOV
         lBkw==
X-Forwarded-Encrypted: i=1; AJvYcCUuiB8jrpHiwmNCjnNbCn230+mBw3eIx747qmLmJATlH/t0JdiHKcr4hXQeIacY58B2YVOv7TYqrkoWeYdMB2lA@lists.infradead.org
X-Gm-Message-State: AOJu0YwtB5RBAuLpeTyLKhExvgGy2EecOA/xZpgpqYtUhxI3B5dGuNvx
	NI8QSCJs3XUdvUjRDsfWwpdgJ8hQ+xQXUYvOb1hQAOPC6Oj550EvvAs2EdxGrDSlZ0Y=
X-Gm-Gg: ASbGnctnfsTJL+K3i9HaK8gGoJTs7GTREpxO5wzTggb8h0bu4CCrikU5Qurp9g0+lsv
	S86XWf2lVxtDm9iK1HkWOuJmZHQaGlWdHAHDlYDisEyE66XXnu1eRj/Uxa+hkjltZRRoyL/rwFk
	BlwnkDYZZwb1erBDNGVbY3eMxN53QGxRTrdhgk+BI/gOl2pl2KaOD+eKqkvsod/L3+TyaoZNUeW
	y+3AcLpoB5xlpQNDENMF8Yh3tW3pba18kcOFhBfgZi9CWR7PV2n6imSrKmisZ6rJDXyhoq1YBXY
	uVdwYUaJnpo+M+AQwafvquOTrMp9p6/lBKVcZdS+yUVhRqhMZTNA6jak+UAcYjPb75P7c/tImHH
	lwQZo47m+1cdTUjc=
X-Google-Smtp-Source: AGHT+IEPILn2ezeDHdgHGblO5LnPgpXqCH92o0onA0PD4rlV80i2qnmmx1nZzEAXazpVbXC9rkPt+A==
X-Received: by 2002:a05:600c:1c01:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-45a114e631bmr20280695e9.24.1755000780340;
        Tue, 12 Aug 2025 05:13:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:50 +0200
Subject: [PATCH RESEND 08/14] gpio: loongson-64bit: use new generic GPIO
 chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-8-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3657;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q0nDOolzmEolL80kYOdLVFVSG8jdJDB+vSKLox1kAgw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/AIO7gnzgnYClDRyJgPa9bqdxWNaS0o7JCo
 kpEivjPH0WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwAAKCRARpy6gFHHX
 ckAeEACpBuZdd3E7oKBEJYCiIdDjppA7PtJOjKS4jJzjYk38RZIbRF71e+ke3QZ5HXpMq6vmFKW
 Df4Hr/4AymzpQFGFN2EgHZbbs+3UNvS+urV8lGCZnBYBp2hKiVqGFMJml4z9UMlCXIS95Ugwbrb
 AXzPWS8wxHrZB1K3QmixEIKBQ7GM/e+REApDKnJry2BAtcOtL5ZJHmEi20mC621eDrbOzKp/21U
 lc54FDcCErQcZxT1lTSqz1prNxF5JuzZ4yu0gDBnNS7a8P3b3YRUhOKti16ghGnMfyZrZx9m9iC
 HoBbnkPWOwYoXVGO5jYqfiF9QLxWh5/QZvUkL6CV+IPjUyCTglP6EuKWWa9/q+cQvi7kJk3KbAl
 kPJhwJ7zqTc1vjFtkyHI6ENUyKB+iz4sTT9hpMOvcWurPTCyOVQlJ3OjRJJMVKKfmE69QF5X18l
 btvpda3umOPTz/aCGCzFmora7+HHZnqvRYFYUdqP28LLh2zIlb4BXzJdUlWPZkMW4WTPSlc3Da+
 EMlV7LFaruqsbbX3RiulvISrogyJXQWQVK8r1XEutJU3V7f0GQqm7wR3YjgdmBAL8JrxWsowPDY
 BNQAvSJ26ZSA3WrrlzG64KjH5+QCaRRZt0YGBRVkUJ53grAuTPpK13hif1HkzdfiQEBLvMEfmsp
 qnNaR8CZWTMnYqg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051301_962571_2B5C6752 
X-CRM114-Status: GOOD (  16.01  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-loongson-64bit.c | 42 ++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 818c606fbc5149b2e4274f0776e558332700d916..482e64ba9b4209443c2f64ae7426b8fa9034011a 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -11,6 +11,7 @@
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
 #include <asm/types.h>
@@ -30,7 +31,7 @@ struct loongson_gpio_chip_data {
 };
 
 struct loongson_gpio_chip {
-	struct gpio_chip	chip;
+	struct gpio_generic_chip chip;
 	spinlock_t		lock;
 	void __iomem		*reg_base;
 	const struct loongson_gpio_chip_data *chip_data;
@@ -38,7 +39,8 @@ struct loongson_gpio_chip {
 
 static inline struct loongson_gpio_chip *to_loongson_gpio_chip(struct gpio_chip *chip)
 {
-	return container_of(chip, struct loongson_gpio_chip, chip);
+	return container_of(to_gpio_generic_chip(chip),
+			    struct loongson_gpio_chip, chip);
 }
 
 static inline void loongson_commit_direction(struct loongson_gpio_chip *lgpio, unsigned int pin,
@@ -138,36 +140,40 @@ static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgpio,
 			      void __iomem *reg_base)
 {
+	struct gpio_generic_chip_config config;
 	int ret;
 
 	lgpio->reg_base = reg_base;
 	if (lgpio->chip_data->mode == BIT_CTRL_MODE) {
-		ret = bgpio_init(&lgpio->chip, dev, 8,
-				lgpio->reg_base + lgpio->chip_data->in_offset,
-				lgpio->reg_base + lgpio->chip_data->out_offset,
-				NULL, NULL,
-				lgpio->reg_base + lgpio->chip_data->conf_offset,
-				0);
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 8,
+			.dat = lgpio->reg_base + lgpio->chip_data->in_offset,
+			.set = lgpio->reg_base + lgpio->chip_data->out_offset,
+			.dirin = lgpio->reg_base + lgpio->chip_data->conf_offset,
+		};
+
+		ret = gpio_generic_chip_init(&lgpio->chip, &config);
 		if (ret) {
 			dev_err(dev, "unable to init generic GPIO\n");
 			return ret;
 		}
 	} else {
-		lgpio->chip.direction_input = loongson_gpio_direction_input;
-		lgpio->chip.get = loongson_gpio_get;
-		lgpio->chip.get_direction = loongson_gpio_get_direction;
-		lgpio->chip.direction_output = loongson_gpio_direction_output;
-		lgpio->chip.set = loongson_gpio_set;
-		lgpio->chip.parent = dev;
+		lgpio->chip.gc.direction_input = loongson_gpio_direction_input;
+		lgpio->chip.gc.get = loongson_gpio_get;
+		lgpio->chip.gc.get_direction = loongson_gpio_get_direction;
+		lgpio->chip.gc.direction_output = loongson_gpio_direction_output;
+		lgpio->chip.gc.set = loongson_gpio_set;
+		lgpio->chip.gc.parent = dev;
 		spin_lock_init(&lgpio->lock);
 	}
 
-	lgpio->chip.label = lgpio->chip_data->label;
-	lgpio->chip.can_sleep = false;
+	lgpio->chip.gc.label = lgpio->chip_data->label;
+	lgpio->chip.gc.can_sleep = false;
 	if (lgpio->chip_data->inten_offset)
-		lgpio->chip.to_irq = loongson_gpio_to_irq;
+		lgpio->chip.gc.to_irq = loongson_gpio_to_irq;
 
-	return devm_gpiochip_add_data(dev, &lgpio->chip, lgpio);
+	return devm_gpiochip_add_data(dev, &lgpio->chip.gc, lgpio);
 }
 
 static int loongson_gpio_probe(struct platform_device *pdev)

-- 
2.48.1


