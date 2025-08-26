Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5B6CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpYS93HuS2Ws4ibadqFyYNPcNkc+D/2ZRLQIn3G55gg=; b=v8AdeUZJFa1HUVSbdQ5gW89brR
	hf628qaewW31uOP9P7K/Gjb1onamzhUzWctvmLMs28OnE/Shbk8zJHR2slDq31GfugPNVtLdAYcWo
	WJsMBHJKoKuCajbpVL1NgLjTS73O36p/3DVy9wF6KBccwJxQI/TVm98jHhXfWuElZcxEYJnVCzsar
	ef1+VV7xndbNOEwmBuRu1b8cR7H1Im0MLIoSaSb96ccIJsSeToeVQcImSfm8NmxZtqxXgtkPUzmEo
	UjlvTEMj2eHu6EnasTXcGBfAIG8jzUwbfAfMhQdxJ/1DhldPl3C6I5Ugpm5J0zcSBOm0+2B3X+yUy
	r9vb/ZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrGt-0000000Bg58-0fax;
	Tue, 26 Aug 2025 10:51:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqO6-0000000BVlh-3Wo3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:54:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3c79f0a604aso1541294f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202085; x=1756806885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpYS93HuS2Ws4ibadqFyYNPcNkc+D/2ZRLQIn3G55gg=;
        b=Z4UcgbjApXlqprmAssqm5Aih2kjI09nuHnthyFlJUBpaeEhgCHfpnriY5dftNPumq6
         BvnfR9q7F+eGiVX9s0Vh7TmU2oQKxPNUIFU9puCDRBsRR+AmosMgcO3mFLANpDPfxSPd
         2AfhlcyRqGQxLZNyrM0L2UPmurEiS86ycusLENrQUIOe6NsT5ICtrLixU7+bWGPwgC4L
         7QOAJXUHBNu4yuyV8ZeAmoKTNl0M8ppX89UxfTb2lSOF8VpUcYNzoWcBxTXuoBnBSln8
         nEnuDR2AiV+HSEkbXMB3HHNgAdrKgEIFcGrob3WkEaD03HNRGoPTlwh3dzJi4/GcpigB
         JSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202085; x=1756806885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpYS93HuS2Ws4ibadqFyYNPcNkc+D/2ZRLQIn3G55gg=;
        b=U+mZH8HwCj8jcDuFAJL5KDwNNWaqSKmYl3EeN9KPFbQjd0VDRbDwxdOpww771dodVU
         830Ckl2g042CXL9lOJHN0IYBNf3DPd0/FPD2qQ1X9hYjwNWzJTIuGVcbDFaOsZAh6NK/
         bWuGkxLvKDj7K2ybvTZrAyVrs13E5npnFiqj5rcyvVZCwC7FNbzXLC9TrlZMUMqCCGWj
         yRg/fJ/axjC0dApsEvETw/1XxupRkdCZzDp1H6C/WoMRO/h7IctAAYTxpiLSb17kZvaE
         ICuZaipRwIN0ZJiCXqr2+pS3BQ2RIzikzVU6a13TbzLoUifxLatqxLvL5LPy8qmr2B8v
         GiCw==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZAGzXcsKp08jsGffMQ9WiHidJXGmTE4elNOvPLznhLxw4T4moamH0l1ntsL+4Jd+UXMtjWa0YLx2ACRdKdPz@lists.infradead.org
X-Gm-Message-State: AOJu0YzNdMyEEZrqabiKCbWf/gwr55yvySPD5aZh8FdeZ/q3i648QNEd
	+tC/trJr8IiWyWGKdvqtSlzf3HMW16seuPL0rG1jWiEmhjOIS0Aji9IgcRQKsCYqWGk=
X-Gm-Gg: ASbGncuFyPjRJFyd3NUKx1qpFeWGDYLXg94eBAUHE1FxTvECEYvyNSb/CT4W6x1wuN/
	byzUaxyPHE3Qt6xog6C1QyWNXYgj8QG8w/VhBMD2sopY0UxgOjUt0IL5lX85YODk7zyyuWCXVV+
	HjEuLj/sIf1XRliTMKVCvcvEtbdIrUTlD80NjfOHlkNEIM5jkfvdlRiL6yzBjgMVzLNdHhTG4MQ
	CcuYmHk9rEYUu7dlKWULPvv4zhXBTWDWwCwneMFCbY+lKbcxNZ8sFrjCK/tAQvLeUlhZQgb+z0G
	t5iGQXXLeUu2yhwO/tSkiiVo7FrQNEGggiuZKjhkQkKVIDnmel0PAts2JBpX9Ivt1m99a7TGuxL
	WX7ZJlbiqrOmzfz8ZBtnYJVwniBKQ
X-Google-Smtp-Source: AGHT+IH+zImocM00pe6xCRWyWfzSwlePAUzY6aZ/dvMer4YnerGXKYc/WZlxM7P5Y+5mqjP1ZLVAkA==
X-Received: by 2002:a05:6000:40d9:b0:3ca:5a3f:4182 with SMTP id ffacd0b85a97d-3ca5a3f47cbmr4448457f8f.63.1756202085222;
        Tue, 26 Aug 2025 02:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:36 +0200
Subject: [PATCH 2/6] gpio: nomadik: don't print out global GPIO numbers in
 debugfs callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-dbg-show-base-v1-2-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4312;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oBcKb5RM1YnckG7cnSsJVl/Lpv59j4+skQx80n0XNRw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRgtssbMNuvtdq9VaXj9texeQjs6T84FYRzh
 GIOLMeOaHOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYAAKCRARpy6gFHHX
 cqp1D/9DHh5rBMhO3+JDLKv38OKZVQIWchApIdXx916/Wf5pq10ueE3pLb5m4Vvikj3RHMIu+iy
 u+F2qBtWL9EmQqGOhRB9PF3Eg02DRPX/bg+4lUWsKZp+7wvOYpkcLeFAuh7QxiOU/QrIDBpqYP8
 DYikMquUwOx/GfXEFHSj4poi7RRQGmWXMwlppIcoyEB03q+mQ1cSNmaFUCEJLLJcNHq0N5Trf0A
 Xt8XmE/QBLi/OXEM0i+IKbaZbsyBlBjitj1gxGJE7QwyyCUbaD7KPYkIS7n0uBlocqCGcG6WzFc
 I1cGSIGXVmxEGbOyDn0CTIK4lFcT3lS1KHH/4FmNKYxwyIpuEyO8EUjvjz/tOjdnmWXtqGnCFF1
 DudpHu4USyrl59LUT98mAqDQAjAuFdXINsoBJ7ZJKUoXyrk3Oko+P87+tQe5lB2TW/72TQL+9wr
 F15l/ynM6W7UkXSgTllBhtbdawKwKlM/7ZRlkG7KV1KoVC36SPl4bBbu36JoB2k9R48IELQs3iJ
 o3N3fZ3GGG+NzjADIoJaDXKcpgJkIeCvwSSmJWOZE4ZGyCL6ugws4pkhiykdjA09jQTKUFTJf/X
 aBnefpuUk7NfMbDt+V2JwNcvjp4XUkQNGD0uL533DMg7drYCwBrKkmb4YqeamMzb7QMYllOGPQq
 eeDaj8vM/Qle7eA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025446_902184_AC49487A 
X-CRM114-Status: GOOD (  18.20  )
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

In order to further limit the number of references to the GPIO base
number stored in struct gpio_chip, replace the global GPIO numbers in
the output of debugfs callbacks by hardware offsets.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-nomadik.c               | 25 ++++++++++++-------------
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |  2 +-
 include/linux/gpio/gpio-nomadik.h         |  3 +--
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index bcf4b07dd4584f884992ae35caa8aa1aaacb619e..fde4b416faa81816ee554f85e5665f16d5defa06 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -20,6 +20,7 @@
  */
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -396,10 +397,10 @@ static int nmk_gpio_get_mode(struct nmk_gpio_chip *nmk_chip, int offset)
 }
 
 void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
-			   struct gpio_chip *chip, unsigned int offset,
-			   unsigned int gpio)
+			   struct gpio_chip *chip, unsigned int offset)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
+	struct gpio_desc *desc;
 	int mode;
 	bool is_out;
 	bool data_out;
@@ -425,15 +426,15 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 	data_out = !!(readl(nmk_chip->addr + NMK_GPIO_DAT) & BIT(offset));
 	mode = nmk_gpio_get_mode(nmk_chip, offset);
 #ifdef CONFIG_PINCTRL_NOMADIK
-	if (mode == NMK_GPIO_ALT_C && pctldev)
-		mode = nmk_prcm_gpiocr_get_mode(pctldev, gpio);
+	if (mode == NMK_GPIO_ALT_C && pctldev) {
+		desc = gpio_device_get_desc(chip->gpiodev, offset);
+		mode = nmk_prcm_gpiocr_get_mode(pctldev, desc_to_gpio(desc));
+	}
 #endif
 
 	if (is_out) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s           %s",
-			   gpio,
-			   label ?: "(none)",
-			   str_hi_lo(data_out),
+			   offset, label ?: "(none)", str_hi_lo(data_out),
 			   (mode < 0) ? "unknown" : modes[mode]);
 	} else {
 		int irq = chip->to_irq(chip, offset);
@@ -445,9 +446,7 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 		};
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %s",
-			   gpio,
-			   label ?: "(none)",
-			   pulls[pullidx],
+			   offset, label ?: "(none)", pulls[pullidx],
 			   (mode < 0) ? "unknown" : modes[mode]);
 
 		val = nmk_gpio_get_input(chip, offset);
@@ -479,10 +478,10 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 
 static void nmk_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	unsigned int i, gpio = chip->base;
+	unsigned int i;
 
-	for (i = 0; i < chip->ngpio; i++, gpio++) {
-		nmk_gpio_dbg_show_one(s, NULL, chip, i, gpio);
+	for (i = 0; i < chip->ngpio; i++) {
+		nmk_gpio_dbg_show_one(s, NULL, chip, i);
 		seq_puts(s, "\n");
 	}
 }
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 8940e04fcf4cc4898cda5a5734574bfed6a175c6..db0311b14132276b9020bf3331fd9bb7a4f73a59 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -584,7 +584,7 @@ static void nmk_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 		seq_printf(s, "invalid pin offset");
 		return;
 	}
-	nmk_gpio_dbg_show_one(s, pctldev, chip, offset - chip->base, offset);
+	nmk_gpio_dbg_show_one(s, pctldev, chip, offset - chip->base);
 }
 
 static int nmk_dt_add_map_mux(struct pinctrl_map **map, unsigned int *reserved_maps,
diff --git a/include/linux/gpio/gpio-nomadik.h b/include/linux/gpio/gpio-nomadik.h
index b5a84864650d0c228de6e7350a28449537a829d9..7ba53b499e164edf410475cf62d60f399aaaa0c7 100644
--- a/include/linux/gpio/gpio-nomadik.h
+++ b/include/linux/gpio/gpio-nomadik.h
@@ -261,8 +261,7 @@ struct platform_device;
  * true.
  */
 void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
-			   struct gpio_chip *chip, unsigned int offset,
-			   unsigned int gpio);
+			   struct gpio_chip *chip, unsigned int offset);
 
 #else
 

-- 
2.48.1


