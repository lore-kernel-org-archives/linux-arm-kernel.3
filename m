Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893CCC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yQ3vEmjwKiSfWo9bCKh2Tpilewzv/3IegJxtxqqielQ=; b=T9IbLeP5xGrIg39ELpaiZqaF80
	fSemSZS0CDc9dR6czxGeX9awabrpgKlsFYA7r9aE9nsNd+BuDidQ7ikFNMw/UQV44qeSkj84smU3f
	NvIcS+qc8OypgS6s3OUKXXX21SIMC4lvQruigg+BiBrYmDKOI6874CIiVAStLAWmxJHKa0q56p9/m
	y4QVj82ysWq9J4LzJhwvXjC5jJPtpA0aO50kTad3pcmJBDfw2AuoK0c/hD1QegJeKJdSfTW/2A5J4
	eESImI0LZEXs0W3QqeE+XqpjXtFJI8BbFmsknnGX0Zn4PRs3TsXFm0JbdDLaMmw1mr02CDrAGj7gK
	+2A5qOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Ga-00000001aaa-3Gxp;
	Tue, 22 Jul 2025 07:18:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7E6-00000001a96-2nSq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 07:15:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so3867535f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753168549; x=1753773349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQ3vEmjwKiSfWo9bCKh2Tpilewzv/3IegJxtxqqielQ=;
        b=CoDZhX4IyFtCTjOzT145B912mO3z27hHIkgX2EPlvBk8VkXzoBZsmyd5zT5urpmyTu
         zyK6R+MTfLd9bZUrEfmAzMmcWCkZj5AinAVG5lfWNqO5MPCAvarUKYj0NEFLkyDk6S8a
         xXLbxjMPxe6QJckW4R1IOwN3Cf4JLIiiy9ABvvBGkXSmCCXO0BuZ/42JptthU0HVet5r
         SEnVbEBdArUS6qMMmnmf3gadB8ovnM8nvfI4eEtuD+vBrqTLCP5mGlLHF4IPmNPkqT7C
         2WvPVX88ZEGkdtGRHB6nMsGJIYX4P3BEwPgyFR3uHHP0rdaJUBJWdM5vgoP3gem/s6c7
         kVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168549; x=1753773349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQ3vEmjwKiSfWo9bCKh2Tpilewzv/3IegJxtxqqielQ=;
        b=fkqq09v9m858+KohYuMZPAScCHTXzgXtiYKb+p7rZlhq6evwvLeNJO8xkHi0f9jU1l
         2vzSeNkmp6nAK+921s6X88fRnvH/9p3j5xv18gVh7GtJn9oBXNeYm1wBAqRTmOGoxH3U
         F0I/WeHMnaXErjMLyDa94ALyQN9ox6mEOBUBs6QEZufmf/GeRPATPh1D25qTK43iXnNZ
         cz20i9zE9pkVM0M+676Dt90+7EBXHekLxma6CctTt6BRHsbhN8eVQbHMG5QLDKWyBTXp
         S0w6jtoDsvy1/7O6SOx03Vper5z1JBWnBXMKL+0ZB1jAamPhA9g0B0QxMbLHR88wKlYa
         oC2w==
X-Gm-Message-State: AOJu0Yx1gakHHml0gVywC2sIr+FTPlvYHAR/oO68oZg/+HCDHcfAEd4D
	FIvx1OZ8aS2W6FKftKFJdEjtt/gx4uO88JA0DmUp44LL/ggjGO7wNAeFLe4UBak6q10=
X-Gm-Gg: ASbGncvekgF/sjW/WHvwRBnFvWGlcMi3LG4Uj5MYtUI6m9ZBGKvarlV2WgM7YQqe0Qb
	SAL/CMjyuaZTxE7e3cnuNOFDogQ4QoR5/R5RfaHqn28TpSXxG6iRMQlEFWZI+htS8DMQ8iqoPyR
	qFSU9g54d0xNFkOli09slS7LlXW/WO1a2K1qvP6NDAYg512D9M3W9+EkIfykDBOZMQa5Ss+9I+A
	0MML25VY5RLKaV0NEhQLrpfgaX4NhtHC0hw0ACQbkRwmuD+2oTzwyCR+YqKqCsRuQy5GmcUUA4H
	G6wttF++2/VO6wzHQu9yo4uJFB0E03gJFUYS0dzF1ib67menm0eR7UfXwjFWl7zquSlj82GFxyf
	JDSVId0NtubY2fWOQ8BBf1nMZ9vKcIQK9
X-Google-Smtp-Source: AGHT+IHYIREMnXqJzvIrKSlpu72TKoCe2oI41qKi1zUISJbrlyCEP1q0OUDLmdmVYJabSs5VX3PelA==
X-Received: by 2002:a5d:64c3:0:b0:3a3:71cb:f0bd with SMTP id ffacd0b85a97d-3b60e4d2b7amr16271092f8f.23.1753168548308;
        Tue, 22 Jul 2025 00:15:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2548:4ac:d051:6197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm12725706f8f.80.2025.07.22.00.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:15:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] ARM: sa110/gpio: convert set_multiple() to returning an integer
Date: Tue, 22 Jul 2025 09:15:42 +0200
Message-ID: <20250722071542.19030-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_001550_942955_65A2B313 
X-CRM114-Status: GOOD (  14.23  )
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

The conversion to using the new GPIO line setter callbacks missed the
set_multiple() in this file. Convert it to using the new callback.

Fixes: 9c3782118a57 ("ARM: sa1100/gpio: use new line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/common/sa1111.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 86b271cc29e1..d7e2ea27ce59 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -578,8 +578,8 @@ static int sa1111_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 	return 0;
 }
 
-static void sa1111_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-	unsigned long *bits)
+static int sa1111_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				    unsigned long *bits)
 {
 	struct sa1111 *sachip = gc_to_sa1111(gc);
 	unsigned long flags;
@@ -597,6 +597,8 @@ static void sa1111_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	sa1111_gpio_modify(reg + SA1111_GPIO_PCDWR, (msk >> 12) & 255, val >> 12);
 	sa1111_gpio_modify(reg + SA1111_GPIO_PCSSR, (msk >> 12) & 255, val >> 12);
 	spin_unlock_irqrestore(&sachip->lock, flags);
+
+	return 0;
 }
 
 static int sa1111_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -616,7 +618,7 @@ static int sa1111_setup_gpios(struct sa1111 *sachip)
 	sachip->gc.direction_output = sa1111_gpio_direction_output;
 	sachip->gc.get = sa1111_gpio_get;
 	sachip->gc.set_rv = sa1111_gpio_set;
-	sachip->gc.set_multiple = sa1111_gpio_set_multiple;
+	sachip->gc.set_multiple_rv = sa1111_gpio_set_multiple;
 	sachip->gc.to_irq = sa1111_gpio_to_irq;
 	sachip->gc.base = -1;
 	sachip->gc.ngpio = 18;
-- 
2.48.1


