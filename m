Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39450C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NC7Pu9soozWv+X4KdcyQ3wROHwf5kQLULZRPlnwsRdk=; b=r9rQaqgklnaCEEpjeV0ySg9ya2
	b3g0dxOiVUD3rlm7E1MOCgGb8YD0vLYJkJNwl6MlVrrvB3KIkrXLzB/7ywF9xnNbp0ZwQzxLg8DD9
	/SimZpuLzaRswczUfEaE7dmBqSvYNsXxK7ll0JO5jJLSaLcDqjRnHOPJd0SLb6VhPq//grzhOfW3V
	5ySxOFxm5iHSMLfsJu93AcKssVdvXOUeh0pUzoInJZYfV4IS/v1V4jZuMdzoMCWvBpP1xy5m7oZ3q
	EpiZ+1t9+lCFwMHGRQ5KplaQ8YDjpEmCpcMaya31hyicT0oQkwxTNUCMFz2625d4Ax64IB91avjZa
	B0K2ynHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPOv-00000008eCR-3B6W;
	Wed, 25 Jun 2025 12:38:53 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRz-00000008K9T-1epD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:56 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so5065251f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847633; x=1751452433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC7Pu9soozWv+X4KdcyQ3wROHwf5kQLULZRPlnwsRdk=;
        b=bJSfwIvfWEn7+LegAHKQuG2POZ2KcKeY22/9K5Kp4lxJ1e42nOkl5nWfZBjx9HYVT4
         XufPFG6FKWOK15ZYA5a4Mi0ndu0hZ/v5vV3kinvqCeypB04gKYkpaXFTK6x2USlegOy0
         gziLp4wAGsSLqQ1h++ScP11BrznmtdpyTG0XPoP3VdZt39jNI5AFfxhRTHjlYghI7ITq
         IRvXZFmd5/OnayhUAmJxaHRNU/MfkzN4eOiQeaArQ2Cybj8u63OYtIcXcn67cJezsnf0
         +BjZ1H1nr7n+7DG4Hw2j0Rubp1qysyv/IH9xxeo0mwKtGk5Bxly9NvJ+KUjZPsBqg1Kq
         rAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847633; x=1751452433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC7Pu9soozWv+X4KdcyQ3wROHwf5kQLULZRPlnwsRdk=;
        b=p8KJPH4cZw6J2tmHUnZJqScvjXcnAGgOpreHxlP4k7B8F4mh5bp2M+wtTFP7QCO6Bg
         i27fEFu0S91HlbrzKof621rVzn4jYMpNmIGF9Uo/PMa7Nj70gmHuvrLnrCeKDAxcgWVX
         0LqPougx+JqCh+UoOYk1zqducJjfVTDbg5hhgUb754S2Nc5hzPeDT2apMKxYj1axDskB
         uYW62X26VFz9JFGmVw91faJpxtTLFdr7ozjnLRagGgTlGedUUe0cfevcqMyeBq3q5GGs
         BCmkUNpgMunzbKrJOtSytlapzS2F35S8DIQC/KhAHeWbEZw4pxwJezcU7oBkzgpvdSow
         Z0Qg==
X-Gm-Message-State: AOJu0YzqopEYIr2rzXURruUizA7AA0inP+B7NQBYU+N20Xn0S+mEVKx6
	j+HpvaevM0CsU8TAyfXyPqQBql3kRNxlc6oX4F7dG1jz/8DkTYSMFY7S1fMqsGCLjBM=
X-Gm-Gg: ASbGncvkHpKvjHVshrvuL+9zNpck+uY/i6fF8c8rCgwQbBDG4P639qYlOOfc8y4z0sb
	K09Iyod/07zIhsyzZ1oJbDjgVOyoqx2PZUcA/DSLyOOZVjG9Wjw30JYNxNNRSwh0cmytwIZvObd
	rf05NAAY8QYzZLeE3yFbqtBrHyofSyVMgVoQoIhliO7w7v6Dv3ZxcA5WAnRUfYKR08NjBCshmDo
	dxtIUdC6+ClFN9Up+SmHn0c1pbCg1xE5dgdHuDmsz9M5KRl9GHJ18cqR1+BmHr4pjfxum62qEJ4
	7ijkGlCrW9kv/1FaGreYUDltUXmlvy0lQvb9zYuIBIqN46uuUVPhImJu
X-Google-Smtp-Source: AGHT+IHxR2qvRGmElBXq67F0SKZPrxii/yocT/jg1I7d7lhCDWU0MVv4VQ0cqFQ8XWvWsQzZJx/Yjg==
X-Received: by 2002:a5d:6f18:0:b0:3a5:8a68:b823 with SMTP id ffacd0b85a97d-3a6ed60755dmr1812393f8f.23.1750847633454;
        Wed, 25 Jun 2025 03:33:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:35 +0200
Subject: [PATCH 12/12] gpio: tc3589x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rb/GoPaCoaNCEXEQPUk26EQjk/xqS/m+eP+cKDaCCqo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CA575QX9X7E+WHE5PW5iX86bog1E6GPj/k+
 5sFRK+FqfOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 coHHD/wMH31t1wMzv3QMkuAnqPWJ4IxSDFv1ZkrRfqK+WIEZZxs4GldQzrDhHJxVM9B3Zzy03Fb
 bvX/ND0cQ3SI+J2zOWX0fHQcj2xA+0ifJsiNXu87Eyad0w5lDmO9bdKEN2LyKDDZim6lcAVsbti
 hdgbzWxvuI4jmQkAT6cyxZNyHwvcegXwpRUz+zLhzf3kym7keBczoqdjcm0xSu0iFc3uHIeW9jM
 xMEaTrLbsSbDeZrt61DYlgkMG5qgy6Mu13GvMKDnkI9zpduu/0EsTWrNAsVMUmFb4bnTt70W4iE
 xNtlJWglIEdv8FdUFf7jeCXtULeoBTpjycxN56IraT4sgqt2HobWV/XKvbp8bia3nQ8mXH6Q2hT
 3Hu1kLt+Cw6fVUP+P3uTsvGiB9tGA5YPXuMc5jIRx/j6fNtXgEYRJ/8Bx7ZAYR/Aess6RFci1fn
 ctW05dqgrdFEBPMNOI1rEPNEutdTpLmiAD3bWHElDMDPL2+0Lq1fFXg0IMcSQTma9yHnfxPK/z+
 lULXHRCP0lqNRXlKxW6f1n/G5jg5FdktLY9gGWbukblkSYdXc+plpftzge5t9UC3369vcSOK57E
 J981JOpgHxMxN2mEgtJm9Ia9ir6wIUceZ6AuLO7I63GooqvnLgso58PnGKlFhj3ehmzut0m3/Rv
 wBMQPc2MAszYITQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033355_443031_82993254 
X-CRM114-Status: GOOD (  12.72  )
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
 drivers/gpio/gpio-tc3589x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index e62ee7e56908f9125ccb6deb21130a5d9043fbde..0bd32809fd682bac7b16b1f251887abebb44acdc 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -49,7 +49,7 @@ static int tc3589x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(ret & mask);
 }
 
-static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
@@ -57,7 +57,7 @@ static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	unsigned int pos = offset % 8;
 	u8 data[] = {val ? BIT(pos) : 0, BIT(pos)};
 
-	tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
+	return tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
 }
 
 static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
@@ -67,8 +67,11 @@ static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODIR0 + offset / 8;
 	unsigned int pos = offset % 8;
+	int ret;
 
-	tc3589x_gpio_set(chip, offset, val);
+	ret = tc3589x_gpio_set(chip, offset, val);
+	if (ret)
+		return ret;
 
 	return tc3589x_set_bits(tc3589x, reg, BIT(pos), BIT(pos));
 }
@@ -146,7 +149,7 @@ static const struct gpio_chip template_chip = {
 	.label			= "tc3589x",
 	.owner			= THIS_MODULE,
 	.get			= tc3589x_gpio_get,
-	.set			= tc3589x_gpio_set,
+	.set_rv			= tc3589x_gpio_set,
 	.direction_output	= tc3589x_gpio_direction_output,
 	.direction_input	= tc3589x_gpio_direction_input,
 	.get_direction		= tc3589x_gpio_get_direction,

-- 
2.48.1


