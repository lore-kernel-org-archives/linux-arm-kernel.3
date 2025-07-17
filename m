Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C403C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=83jCr416azYCn7ZWfoPtR/8LxsJq3XFvpEtFQFTIDfk=; b=deAoh8SpCTRXAil+OP1dX8yEKW
	JQvyaAxp5yAL63D2gNdhV6uxsluwb6woBdVDnfe8EDjcNlA8vpMVa29ReTXc8c7FsnxIK1xsf+eOd
	/UPBL2H9K1NbkuNyKgee9GGIh1nKOgiQuM7bvLyB6TjyMXTZuk/pIe9S4yqpfGak7MUkq7TSwioh/
	a6tp+q/Ft3cuTbLkIinI+dGxHewT/pN0J+01nCD7fl57e2QFp53aWjNvK1xpvJQPmMQgJPckai6Z4
	SeGFOBquSBCgT/mu25sbTn4e5Ur0QmyIzySh0buAmHv9Us4Xvif8vT/cAJWNCgLx/qCVzdENgC2BV
	qkP609Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPQ1-0000000ALP5-3Cng;
	Thu, 17 Jul 2025 14:17:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOOW-0000000ADj9-0cE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 13:11:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a54700a463so542515f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 06:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752757887; x=1753362687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83jCr416azYCn7ZWfoPtR/8LxsJq3XFvpEtFQFTIDfk=;
        b=kwtKpVQRGkikTxh3vLp32g7v7IGJRiTxBmBUnZke+h/qW9Rg+R9PECGVW6G9EYN2sj
         PUgUp2l03lGBFOMC9xSrIosnV0LcUx4DkQgA8QuhlNGITpNKx/QTsr/djsNXlbf06OvC
         z58bezSEdt5QYsDz63JszRQP7z5JzavOtAai0s6HBVPcaPFB9awGmhAUFATfwiZ9zP1a
         PHYRJIBIYCeN6fkCfDQq/zLB9ynYwlBzsgSTuVJse5vB3kv8ipexbgXI64mk0FSIqgpY
         LgFBsAZgGWqTRVFVcyC9SAOEEfDv0IJupMzAEL+xTe7SeFatUsHBuV/8b4TACm5nwbXe
         G0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757887; x=1753362687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83jCr416azYCn7ZWfoPtR/8LxsJq3XFvpEtFQFTIDfk=;
        b=IuLMIP7K99w1VYnsTr2K7EPuYuyudR3HVTLTISZjKO1nZu3tViMbcZHmOwzfpFX7O6
         ndlpyJyR11xvFTBwTC6rYQDoNzMBScaI/4yJvKQfLS31ol+hbG/0k6mqpNPrkqzGZTIE
         XwawiHeKQjVGFUYqdeZt3BR1zNMT0ZsiEJm3eq28lMT8hWY3U2aNOeIUOt9sF7c8dFM9
         9YF1xAY14j9h9bmzOahUMPaloAyjzJuNyHbv5oocvycdD9u2Y1nIMdHyv/6S5Bak+H6h
         rrL9T0DkMQpVng7LH4jtVVf56gLETZeUoz371IBGmWX9VuntlV6o11XdsiKT+kt4UvXX
         IhfA==
X-Forwarded-Encrypted: i=1; AJvYcCUmsCAIMz9PyywvxedUeuEb1oK/EVxMhqI0bjP4Xuo+vfzmMwHimT4m6R4Bp/TsZMHhei5N5nhr8IYZMomceRMx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy7PLC2q9ocPeegkKSpFb7M810iMa87TBt/6KSk0AlT9MQtKtJ
	NQ0Uw2VBolziQdYwbnFSFt8PgJDWxoiyi6aLerPfSvjXfu9BIkEVsTn0rTAMKlG0qro=
X-Gm-Gg: ASbGnct6FFjhWCi0cKis7hTbcRlFr7vGr5YM+zljTe3tVtpTpArihI/Q+jnvBQ1lvJs
	9GauA3dhTzcNqAPd+2E2SrRDQCQ/kN7QEje19Aflbyjp15iVQigpbznnr9BuQwhECX35PTk9z/e
	kFwsWFlVW7cTP/5M0TPrWPLd1xNQlEzg8t0kwt85GY6jeQaH6jtiX8EAHRNZi0O0Bde63bIVjRn
	1h+MEctkSJxmnTa9aW4ShblDOrEpBOQYzBMOB3Ru9L5ndIdWniFiPE7jVzUaHrk/47lUA/Q7y9i
	uFvdGbCAIgCKt0YTiSRdzICWXKzgNnSgRNUmlOuR6yFIVV5Nn4IZqe8rh6FeVqkXuGqLcvG2DHM
	YGTJ/9nxI7HMcgGSv9Oq4vKM=
X-Google-Smtp-Source: AGHT+IF4aBEVNkpFE5pxCAK/kMqSx3h6NcRIudrOPp6QMPOhm1KlysOl7H2KIJzmTsnV6O11EnwLsw==
X-Received: by 2002:a5d:64cf:0:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3b61395ca72mr2800801f8f.0.1752757886272;
        Thu, 17 Jul 2025 06:11:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9e61:4694:c621:5693])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc201asm20560565f8f.22.2025.07.17.06.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:11:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: xilinx: convert set_multiple() to the new API as well
Date: Thu, 17 Jul 2025 15:11:15 +0200
Message-ID: <20250717131116.53878-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_061128_188934_AC7E8F0E 
X-CRM114-Status: GOOD (  12.88  )
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

The patch converting the driver to using new GPIO line value setters
only converted the set() callback and missed set_multiple(). Fix it now.

Fixes: 1919ea19a4ff ("gpio: xilinx: use new GPIO line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xilinx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index aaaa74117980..36d91cacc2d9 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -175,8 +175,8 @@ static int xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
  * This function writes the specified values into the specified signals of the
  * GPIO devices.
  */
-static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-			       unsigned long *bits)
+static int xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+			      unsigned long *bits)
 {
 	DECLARE_BITMAP(hw_mask, 64);
 	DECLARE_BITMAP(hw_bits, 64);
@@ -196,6 +196,8 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	bitmap_copy(chip->state, state, 64);
 
 	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
 }
 
 /**
@@ -605,7 +607,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.set_rv = xgpio_set;
 	chip->gc.request = xgpio_request;
 	chip->gc.free = xgpio_free;
-	chip->gc.set_multiple = xgpio_set_multiple;
+	chip->gc.set_multiple_rv = xgpio_set_multiple;
 
 	chip->gc.label = dev_name(dev);
 
-- 
2.48.1


