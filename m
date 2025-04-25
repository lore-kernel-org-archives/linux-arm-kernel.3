Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D416FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sKCVt8cqZa4daExvvFC4VJJQ68THbR+BkiDSHCicFkU=; b=WRF9nfVoQxMHKb
	E7239Ff2nlH2oznud7viVevSaOwvy/PKODV9UY3XFf1yHHm3y8ncfeX/XZw7DL0DIqr29YUXZjgYg
	qItby6b7umXF63kD2/VzliTOUXldnMW3J7Ms5rCzACe3T5s+lYsVmxXupaXjJFYnCSio70rgZDZc0
	7UUKgSy+J/LQZ8H8VokIOpyjsZUfXlVkOfgggeWIkkDu8jh4nD2iU3R3qxx8pL1ntQT2oxGuGRgsX
	mFvBMpCCCIVkL2312or7zgGgmGRU78gSgcXrr1gLWr/gvbamHit/7vY1Mmo+1yQzwifEsGw6aMdZ/
	rM+aEbL2PN1m3Eg1nqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fzc-0000000GfRo-2Jph;
	Fri, 25 Apr 2025 10:09:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8F2w-0000000GUBl-3uYf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:08:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2387031f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572113; x=1746176913; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKCVt8cqZa4daExvvFC4VJJQ68THbR+BkiDSHCicFkU=;
        b=hB+Xi7babqYAlzkEdb0fr3cFW2kjhJs9q2bXn77U5xGlxQW6GkpfgrWMuIAL3eacE1
         F3jE0E9iNU94wNRJqGI3geuBF1vgCLQOvCy7Dk7dSajFVRsIL1Pw5nvPxINJKjRA5AHW
         1mEZpN7k6s9eWEXAZ8yYU7pSBWeks96fK69k3cHyGke1nDYM9EUIRbFp848UASvWvSTh
         OdOsyhDAGgWWFqTL9albcVEnR+SJdOtcE1rBabKauYSjAFe3SZt1U3k7SU57xQe3OC3J
         E3M34WbvMY4llyOYggSRj1sFHdQq2VkMUeaUxyOXLgDaiMbFNO2NYTfBrBk4+qKQV/L2
         4kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572113; x=1746176913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKCVt8cqZa4daExvvFC4VJJQ68THbR+BkiDSHCicFkU=;
        b=SnnfuePvmv3mZjCImLwTdXdjdamGQdx3x528kzDq/iyEiY+78mGm8HPwvCcvRpdeJC
         ktuha7d3U0/9SElw0Tm89hm4TDWrbILqdjcSKokQBwR2g8CrxV3ozO+iqG71A17oS7fO
         kWjkRCyyj6ZfBlRsEJasHavo+d6JEyzeNFey3q0mbAKXdbzrX1Vc6tqn6DQD1JsaZ7mI
         oqr7C9ZYV1DCbL6OxOmZv5KKERpiDH4E4hYXzypZ54mC0mbC/nbesdUvdObBNvZ/BP/5
         a0VUkp1rX2K1tRFX+gxh6rwoRupKfkaIK1Zv43kQJ5PBFu9007rJRJ1RrUWcgTmzvLHv
         d0Tg==
X-Gm-Message-State: AOJu0YwuVfqtmZJ8ex+pUOr7jSexr/ArnBtdUDMA8HTyoUM1q65iv6Qu
	JZOWl97C1Xm97EM7Tvmk+tHfsc2zW+iLJjnzeMUMbb27SQNfVlyoR1OlkKfvAdw=
X-Gm-Gg: ASbGnctM4EeDRQiYO7+cZCB0teX3pk0vaY3dFiDUqsCxsBuZDNeUhEY9u+ohVr4HAj1
	Tpqc5w/Ls8pYp7Bnb06bBcieykJ9ffVeVgKyjk95Nm1cFEarnH6W7Tfaa2WfH1Lg1OfP91nfH4u
	kvcQJkwZ61FJ+JpJA5po0401f24yIs1KrXoswwpF2HtKF+WZZqdYOiwiOi8xQe5isgL9cjLj40e
	5X2otiY+iDNuosjqijRPxqpEcwaewjzH1iiR9eeKKKXo0XVmjSJUNo429i5RHQH7+r2q1v8tFnS
	T8jV9UAWWYQcEPI7pvipiqy70fu86Wd21mVIiB8Dvr4S
X-Google-Smtp-Source: AGHT+IFhCd5BPYZFIfYD16hI1BlRwFfgX60D/xCeQ4EZ5iaoUDIXJctfJLdM9miyeVLK+SKr/8t4cA==
X-Received: by 2002:a5d:6da5:0:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-3a074e14995mr1200520f8f.5.1745572113504;
        Fri, 25 Apr 2025 02:08:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] pinctrl: bcm: convert GPIO chips to using new value
 setters
Date: Fri, 25 Apr 2025 11:08:28 +0200
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAxRC2gC/x3MMQqAMAwAwK9IZgO1WAe/Ig41Rg1oLamIUPy7x
 fGWy5BYhRP0VQblW5KcoaCpK6DNh5VR5mKwxjrTWodrlJM2iZj4Qr0xSqBLd5zowM52TM77loy
 HMkTlRZ5/H8b3/QCF1mfQbQAAAA==
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=987;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ANj/MbrvQHKDnhB3vQX1T2MkVCMk0PmRafR6TVspNQw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EOgR8kZf+AgOsBpF3vuYSeKM2l0AU4Iiv2f
 y4AuAkbP/+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDgAKCRARpy6gFHHX
 ck+uD/9RfuF65/qkAGF1taXgtmW7kgM2w55txdgGadXpYy9Ue44TYkv8VgdzBvcotGQmizJcOMz
 OGj0QdPsNe2XKRDD+NZ3G6pO7MDOFDQyPu/NEmUFOOaP7GWIGWtX5sVfma+0bK+mDL9PZqIPu+C
 +FAPEiVqrYz/7QPBZtcWpNf7ridhw/VYqYNvIrTAMMkEvw2o9RwkQIBqchw3uEIaFNlIAoxy7cD
 NTSiH4LhqxhGw1zJYmdxtHy6wsxprQH6HWGRorlYwsjXAo3yy2KSJbetN1DDi6kDzBRJneREu0p
 5dYzlTzm2TJVoPj2Fdd/rbvmLsBIRuTu9FkNgWoYNhiAt7AMNyTzmFlyUHTX1gKCJyN3iZdsISg
 S+a8JavpGW3DMnrFRnax0pVFDhWPDhR7OIQv115lXmOmmXkZjX/QiTfZfZKDeFY0MxMAyZO/n+5
 nsen5anTT5xGlM02QaYxi/m7/1yZV8CQFTJOaXetm4JwPCia2KiRJ4PZFw/poFQ5qRwFI0mBLYJ
 QwRV63tyryAxtd4Qr4TYOvONarpe5ARr+iOWWh2qxpJQwNCNr8nb9mR2D2bfF2uyvVaOBWG4Uw/
 bKUVTJZkI2ioduc1Ii7UN1UydDR3osnRLXVmVPaS/4VIcosXsBY+Dzu60v9/mfBEq/SbSiJMIBj
 WXihIq7NcwrwYWQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020834_974559_D63B89CA 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the broadcom pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      pinctrl: bcm: nsp-gpio: use new GPIO line value setter callbacks
      pinctrl: bcm: iproc-gpio: use new GPIO line value setter callbacks
      pinctrl: bcm2835: use new GPIO line value setter callbacks

 drivers/pinctrl/bcm/pinctrl-bcm2835.c    | 9 ++++++---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 6 ++++--
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c   | 6 ++++--
 3 files changed, 14 insertions(+), 7 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-gpiochip-set-rv-pinctrl-bcm-626ec5aa4c0a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


