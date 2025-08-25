Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1545CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=; b=H/4Mh2GgqQL+mQUCrFTUIFY9HU
	cSjy10la6vpkE0LDw8h8WtubW1BMzFy6Tr5QVLaxqQH8J8cT/Q/+jDL6b4YXcOkHHuJ3bKaGQn0VT
	bMvnFajMO35lVkuEPlllyt9uqtkpDQSKV79A8v0pz4ViLBCPkxi+0jt1euR+NO/VTc7pjyJwNQXcB
	22lN/IuDqwXEtr9xHsQb9J1ah9UisdONNXl3jaBbVXymCVVoazu7Ciq1Ie8JtivAsRaQsl1Xz2WeO
	/bzAI4crcxhGRPPNTw3T9UnYrMfankzN8oIuhB/2peSqnwVsyxWIQy5Tb1MX2Q+TwUCq1Id9h4YS3
	rexbbP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaI-00000007nAB-1mN4;
	Mon, 25 Aug 2025 11:41:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqToy-00000007YGj-1otA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:49:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so24494265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115339; x=1756720139; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=;
        b=dU96RGdD6SAESYW+r1SRcxnmsTcgAKAetJYursyMj0J8che5EGngv5doKzG+0qmE7k
         eIhujLE7X7DOdb10xpXIVtL3puiwO4/5+N8nomGCj3LxEm/XL++v5XMhKv0Pf0S401S2
         al7tYFC9EIMqSefOXfb7NQNF0HfHu6h/G04nL8oLBz8RO29bxGIshBs7rTq1blOv/OG6
         GII41cs6P5qT5SQcsJEWUjpk+Abg/hbWtYbajtt0J8kcvCamoEZRzsTUjsp0XdcV11X+
         OGdY8DJXpqeQLC/xemt4ylE7mFSkhL6l8mkV9pJGOutfilJE3XQ9rz5/oHsCAVQuAXE9
         npqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115339; x=1756720139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=;
        b=tYxsPhEtG+jfBaLtxc4lW8qHr/NGunc1gLP8ILUUsOg0yvIP3+JJVzZyUhIcN5QX/X
         OvQApN07JkhUifhjT6kmr+FTLxx0tLJt5amXXdFbKMIxUDrAOM/LwyJhME7W9dQf6ObK
         mJk5XoCB5jxXjiBUlfWvSrRDMqgdvKJ/YB6WKkozDTiN+zmZEYKIueEUn6WLpACvrc7O
         YWhJ1FcpnohOnhRnMpSCeVnOn6LFUX/dJ/iTZ103kKO+bOUXOmtdo/FhMxYRCisUiS/d
         /j8Um+ib1gNKR6Fo8c8yUnzq/Nwjys+jyNxgyzKMyTgJp8kP3hnOwzJt9wjuY8CGB3K5
         G3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWJqSz0esO9SU1rbsnUO25O/u9ixTGQVui4hS8zWiwlXIyDL53YBACmj8LCD8Qe6lQ/cY+JLb4vRB7hgTyay8+W@lists.infradead.org
X-Gm-Message-State: AOJu0YwaucgqrQ9sAHLNwIudTbh9MXYTOOqRRqbXcz5jcExPyFDfJSqh
	RGz9KSDYXUXH3CZ2QaJRpkv3jXxyMu+vBe5Zrng0IK+YL0uWsEVW/U1SEd/zL+eIdTs=
X-Gm-Gg: ASbGnct4RagHx9IGXC59rfsVa2F6fh+DGHaHUUeeGK7UVw+DsrSa9XKfXtncmArVuw4
	dIAKc6Y+DP77fADdHrq46auZW6+ieqB7Sb+a6t0K3e/UPquRKkZ48yABqDLJjYer97qyCFx1QUF
	We2J1mPvS4kDATMgBy6wMuH4lAQBvZc/cUb5eiuw+5juRY5SU1wp4ZJXQ7SYKpJx1kpRL4Zt2Mp
	ljreXXj/bwZPvSKSMyrPz769roNsWsmUCNkNkZfr4RyfFnxFrPsM9e+RG3TVypLKoNgGxjgaVsK
	jFmXE8yVKstNdBWQ1211mXBAdwkWY/hqaYFIBpfhQ8A8jpCicFmK/LiXUshaFk0bf/zLiavXfr5
	s8TCnDwWXfE4EkR16nA==
X-Google-Smtp-Source: AGHT+IEegOIMU9MY8ViLpXUpgmi0qzunmqMgdKsRZ/R1rOCcGUkKbBKLGa79Jl9AtpUG8cW2p0LW0A==
X-Received: by 2002:a05:6000:3105:b0:3ba:cff3:2e9 with SMTP id ffacd0b85a97d-3c5daa27683mr7362068f8f.1.1756115338987;
        Mon, 25 Aug 2025 02:48:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:49 +0200
Subject: [PATCH RESEND 08/14] gpio: loongson-64bit: use new generic GPIO
 chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-8-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF/z4zF1+EzbSX44wW9kp5C98zyXeFWHMG99
 qM5rdbUe8eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfwAKCRARpy6gFHHX
 cgkAEADb79ImSyrjWksRjQwnS5++P92g47dudBXPy9h3Q0D8aRDzB4vpmH49EUY9gzVQP23hHEs
 hZngF6HTmH6JBuL0DT5v453QiPforXrkouXp7V3AvUMrZP+Di/tSXxwNDFz9N+dEHgx0Y8//3eS
 aacgJ8wdtl+k+y9VAwkQ8Gw0jOspifdoMpiP7PCs2W8wE+J2SuPR+hHGwBdmykLlLmjeBWFsVkm
 g85RWVYDwM4xVEYUyaRb844JrOxkEfXvL4IbQcdve3kCL7JJqujpSxwNeS6eUfKnoH2PbnN5LiW
 ZrsBdVU+Sp6Y1EtS4lgX5MpnRYtdh9eacHK3m/Uw7x80+2rV0uEZGP5zo0zRpdwt0nBHRncgkNz
 w8ZWYThFpX4J6vchCC8vrRPIszWRXmVm1Gv/APHMPSSysfaeeTBLR2f4C++5RzpkwOe1dwWLZgv
 UJ/Gs9uqXy0Dml0IUrBcCoKOBUqgKn+Ut3YFwwbuw+fPOlothO9+MbySYEv2godYhJ3woXtd6Ef
 tKNGmZfVUEseCIGCdSDoBVCrzytkAZ8e1hlLySQipfHjW5pFNswyBgMvqFE6s2q47zjo0eDe6nS
 KNP/jh4kjpCU/Xdmftn/ElIAHKxVghpEIs+oNhQWsV0nIicqVpvt1fp1VVuFsYOg7K+Zu8hIG14
 zOPbKvV5wIPoaEw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024900_491679_8C430FC2 
X-CRM114-Status: GOOD (  15.40  )
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


