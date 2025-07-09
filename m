Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA445C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7D6yL0IVw5djYiHGV3XKwe94mzmNLmXANv1uukKgjo=; b=WH6zlg+xmsH1zsNhnfrQDmrGOi
	lOVfZNKOUp0foCa1fXkvAYzTZpwIg61PM+p3xw9xAZ7GruUBuPdPLbmgtkBfnYDw/kvTaj4VvU46X
	t2tyQ5Ks+j+HR0p90TdeICrVsDJWOXB/gftiYKeKxQd0ngh8cZeGLcoclyue6qlPmg0Ys2hOzeh2j
	b3D7CqrapKOCp6soOW5mOjwvuQSnyN/tJfnwzQF3lA1YMHt61V2dZJMCD1nkcW5kj7Hk4KpqlyT/S
	7ee+8/o2PLyD4+sc06ZtBy8EIZN/mOzmS5gitsGdwkAXxKfHvfkY8pa4AzwQbCVHnGHDrM34JGxQw
	Q998j1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOqC-00000007kt1-1URn;
	Wed, 09 Jul 2025 07:03:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVZ-00000007h7M-05Dv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b45edf2303so4891564f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043339; x=1752648139; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7D6yL0IVw5djYiHGV3XKwe94mzmNLmXANv1uukKgjo=;
        b=heklXnODEVedjTZixbT3rVnjPdU+EldrX76MNDriK/CwsrcddOvhw4gKxoYUE4vHn+
         sT9/LLNbhn3kNDTmV3mbyDpjEQVtuhAh8aHQ98wgjAVmDnRqeKQ0x8EQussPQznQJn9D
         Zou8cVNjPAF4YskOFguKSNg3rqsxylnSgzSiR3JK1NZSA93zWQouQdoQRh1FLoqme14m
         or9pGknPWkEsSD3dpfnRRKzICnJQwV0AvmdrFh37W1v2vD782JuEDAzK31r0+JU5HJn/
         lX2u3wQG2LhZ9l+nFl93YHz6gyJGe3lqZs5o9ejtcWkqyJlPU5xuJ16WxWtRdazkABfT
         oJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043339; x=1752648139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7D6yL0IVw5djYiHGV3XKwe94mzmNLmXANv1uukKgjo=;
        b=wQYkyVTLrMYV4gmdb+8PbJ7zSdU8Akiag/ZQU+8WwPp63DNmLI4FDqYuEJnKr1hPPr
         owsdxvdR1R45dqU/zmd5WH17r7qzuKCCGdKKWgNQalNa9jJXVhL8FucfrjzALHBCpfL9
         m9qlQEUzQGN83CmGUwJNSpXkGGU67r0pnMtuVDjPR/zeN9m/vnB4EBijo192wWYwvUHa
         HX6a/JqRsakmggdv9OUC0POvJG8KOibLTpR7ChelWcTuhEVLjRFWa5Je4Z/kPNZx33kf
         26FIpsUfzjHfTMatOvF3YbCJdj3Pm8i49sBHyB6aqKZpEZjWtnLywMzvcKBqDzZj3t0M
         C4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUFAYWWws3LVvkGTViXWRQGeBy3/tH9QMe6y8Tzme19PN+xH8l3+QLR4FeSAjmJ+IarTY2fnQ88yiF+kJ8+qZu@lists.infradead.org
X-Gm-Message-State: AOJu0YzvdgKPotgVmyyXOmuhVudXx4BQLoPmT0VBA4Iow6/hbBHgOMrI
	Ybmv1C/S9C4xYUIs6lwxMBDgXG7cVYlLexGdd0TsYw1P4UblRdkgPacPNDX0Wgsc5LU=
X-Gm-Gg: ASbGncsBQ5Hlp5EfJbgbrr83c/acUTPV94C6XbtXc5IRLtssSQms47RK4x+IYkNtr1e
	MWPlC1lw8S/Sy4Yl6kXRWe+new3gRr65zSGoTxwM8VDSVtI2+Uv7XhStP4yAz0ZDKXy7E5QziQV
	9CCHiNl5po23ygTCjxO4XrVpELPKyOx9iE6dwKiyBq4AuqwkEZNZEVMTruPyeXnd8RiQ/OubR4V
	mKWPM3EtEuQeWQ17tUaL0W6vweXt8CDzl55JmXFoLaql+O5OhfMD42Kb8vIBE7Y7gtgLpqZiJCT
	0W9RFAwpZV0/k0RkwOkjluDFdtLrThfNn1sYp7HLy2C9l9IQsdlYcHDh
X-Google-Smtp-Source: AGHT+IFsc2XhCJHpv2AICjm9ErTIxzmuwd76UKpGdabiRQsHWUF8TpEV+bZDxTqZBHhyjPjnEzFqAw==
X-Received: by 2002:a05:6000:1acb:b0:3a5:5270:c38f with SMTP id ffacd0b85a97d-3b5e4466ed4mr792333f8f.0.1752043339475;
        Tue, 08 Jul 2025 23:42:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:42 +0200
Subject: [PATCH 05/19] gpio: winbond: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-5-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/MP8OTWpXnD0QcqCaGyWn4wC+X1zvxCk0GefxRrJBw0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9BDmffu27SvUy84btlxo+IQ9HC+2aVXNke2
 Bv0Q8Q53CeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQQAKCRARpy6gFHHX
 cpb+EADH1tfoH45scdvApBrkHQcCzNjHIV06LRTwcA7OGIbtjlAOi0k2WQ8aL0h2iVLiwIDY0HO
 QdZ8G8IwF2ZegPXZsjxpHz/I4kS+n51GSwHV+3VLCUtPJogFrHVi9iG9ByZ0IpiX5YYARZKPduf
 8TaJMkoBw0JOKGtVzwCmiSkTMnPApyHL/yKbmAbXr/I816eDW0RrTTtMhT+iWNtx36Z9l4v36Ew
 Bx4nO+PEgHROaELVaDSBlSjvTjCB5hthu8NlUww2nx5UwkSTrkq6iV3I5CNn8dJogpW8bqloy0H
 A4PgQ+Fkx/shCTF1W+hFo24tLVAZbZOUBtq6uWB4ts7Wk7lFg0VtQG0GE45CPu2RgmaoMymFkgw
 3TiTKWylAJG10Gfnq4mzw7MHp/IneZLVxGx7Wz1xvpLWAmBEb/+r7iQHfjS033NRPXYUwF/ChR2
 Sbs+fQV+tMqBL07k1V6LOuNeACAvrld8NdhzxyebpJ+uHCrtq4M8OQF4PGlSQH8RW1dfbFGeXGe
 Tk/T8J9wEofRqGbWfkaE1qQ3l7rTz/aR48mdB0wOO92SdWGtYXksSGkhnu70idZI6b7vcyoYggj
 Emiot1MC6x6EIHP/4Cv60yxexv2IriX6UxriKf+o8Q07yT8ZXE7maHFtDuteBaOjumYis11FhuM
 fD/nK64y69QoOAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234221_063732_1971859A 
X-CRM114-Status: GOOD (  14.04  )
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
 drivers/gpio/gpio-winbond.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
index 4b61d975cc0ec27a3b0fc342a976b09bb14e0d28..421655b5d4c24d9ceda6d258f0a17f49c5215bc8 100644
--- a/drivers/gpio/gpio-winbond.c
+++ b/drivers/gpio/gpio-winbond.c
@@ -458,17 +458,19 @@ static int winbond_gpio_direction_out(struct gpio_chip *gc,
 	return 0;
 }
 
-static void winbond_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			     int val)
+static int winbond_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int val)
 {
 	unsigned long *base = gpiochip_get_data(gc);
 	const struct winbond_gpio_info *info;
+	int ret;
 
 	if (!winbond_gpio_get_info(&offset, &info))
-		return;
+		return -EACCES;
 
-	if (winbond_sio_enter(*base) != 0)
-		return;
+	ret = winbond_sio_enter(*base);
+	if (ret)
+		return ret;
 
 	winbond_sio_select_logical(*base, info->dev);
 
@@ -481,6 +483,8 @@ static void winbond_gpio_set(struct gpio_chip *gc, unsigned int offset,
 		winbond_sio_reg_bclear(*base, info->datareg, offset);
 
 	winbond_sio_leave(*base);
+
+	return 0;
 }
 
 static struct gpio_chip winbond_gpio_chip = {
@@ -490,7 +494,7 @@ static struct gpio_chip winbond_gpio_chip = {
 	.can_sleep		= true,
 	.get			= winbond_gpio_get,
 	.direction_input	= winbond_gpio_direction_in,
-	.set			= winbond_gpio_set,
+	.set_rv			= winbond_gpio_set,
 	.direction_output	= winbond_gpio_direction_out,
 };
 

-- 
2.48.1


