Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B12BCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=; b=UfA4V3bZkzIRLcodm2Kz9C3drQ
	tyvAO7J7xkcl7AfjayvCndj7Y9T8zjxvaZ3W4D+Pc/1JdqsEFflq8RkdxeTPqg1sdeTRdjI1BIVfV
	7yq8Y9dvqdvTKPCXYQu4hLOX+d8r4WNXkyrSJ/vkNXlzJ5RSMzQT+ggkyFezUeVn6r7xpREJ/q58D
	/bWkZv+gTskNMG99iVmDyCi05Q/VIChmBWuLUNwZ6M1msuHMqg+gmfMzyvpX37i2MeFWBeD0gtvMf
	JDbsZNyiAX1iyN6VEX5zJxAkT2zulLgLU9ab+giVj3IAOAUwxJ5P05OxRBFLsqa2z0Ke6Z+vvI2sH
	ra0jGkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq5-0000000BZPJ-0kp5;
	Tue, 12 Aug 2025 17:31:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulns8-0000000AezI-0kg4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:12:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45994a72356so42715245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000775; x=1755605575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=2AJTKh5ObjZD26ICCbRaY7CNGgPhKJQ7tggpZEhm6GLbtShOPk4KvSBCtPe2khUoCh
         6e09BNnY9GgF98Cm08NnQp25ewG9wptr01n9P7ZY9obiQqcby2HK0CfiL1cbZglA0e9M
         Fj1mVKgBn9E9txezxLZZgU7+oi+N2c9YD+fSdmGjUQPb3iSsSTFcD03UKPgnm5v/PWtC
         rZZxm/YFo6BML/euD/GT4fnYu2XNGA1Rp6qQ79AalJbL7hKBBchOZ51+RSiwcIMFGDCi
         RbM+uRr7CEukcatH3lvObFebSdWXtMIL78TMq2LT88sbspsdX0onyAUhzKw1aAo649Pl
         fSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000775; x=1755605575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=woz3XK2TEZjweZCZ+5CsCZqlNoMoPuTZO7YSJ8hle4/1RGZaGUu6AQw6O7Vx0dCouN
         l9SxoSxZ8sxWQElKQVTK92ucnOzaQfu8judEya7iuuOXfJp5K7iVqBGR3zbBsruccC1Z
         hph5XS2Isl5DsnXI5djphFJM8QizqCd+DmwmOqCVh3elqkcBrJuSDZx2yPzOxZdyZPcE
         hz8XMQWtCfg+kfP+w4bcuZTVMZYVJEra6l9xAATMaTdFtn7yrdCz2gzAJIiX+PI2QY6Z
         oe2MY9UdnD73Rh058fK2rc5u/ZVr0iGKNYy99uUnfXlZlMqFmSBrMoMHCsOOrlzh+dDf
         kSeg==
X-Forwarded-Encrypted: i=1; AJvYcCXemZoqg/CAB/NiGMa4GQwE4x3XaPEVBWtJsGGtuhEwjkc7HmcUz8e41AOH/4p6krKJFZRy6yvUXjW9wYHU6dz8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn4p1w9daBHdui2ZRg5Sz5Z3ePB6R8Y3mSyA8FpmdsUdPcDdm5
	ZOB2tD1OHc+VyYDNSP5mllcHS6ITKsJ6TyfuCQ3L97s6IDZWOZxWrSlRt81xden5qjo=
X-Gm-Gg: ASbGnctTPGvhgmihOLW38SBwqWHEB6Rv2gsQ29dzS1w8MujXdgfHe50ijU5gPMtSSQC
	ArbCDvY9zJxP0KBKAI6o6spl8By1iIwW6/akNi0n7mj9E8FRQBLN8AD2/Y52rxUqv4EJvsjwfhz
	huxr2ZkOa2H8xZc7Fgn8PL4gHZu+Kk6//L7BUEgU/lDX13Kz2nkXJjc61z/xHyWgSYGkziyB501
	n7ndrJHGYSsIjWkHneJ8AgWbt5kYYRfRhFeVWS13Y7W91lgJFYPYdG+hKJeuZ+IaeQpNYHfvoOU
	Q0ev2bZffBmWDIo6A0GhkxyDFOF8QmPApbsB4ZP8e90iQLv1/v86OLOZNcqIoKYUfvElEsBL+1k
	wXuPLDjkLC2NJl3Y=
X-Google-Smtp-Source: AGHT+IE2LcKw8rjS26CcRnR5lLe9kyK4DWUbNSa945JYdSNP/FB2BhvPQUNxmFpnWH6teI1ZO0UI8Q==
X-Received: by 2002:a05:600c:8903:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-45a152e2fb4mr2926755e9.10.1755000774439;
        Tue, 12 Aug 2025 05:12:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:45 +0200
Subject: [PATCH RESEND 03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-3-aac41d656979@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LGZlUs6AQDs8ng5Nn7ommqnFHh3w6/vhUJqzq5JniBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy+/mio72vVpANuTm+f6vM7UHBMPRPfzU4rJg
 eqw8jyheiiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvwAKCRARpy6gFHHX
 ck0fEACNnQ0xuf1zm0bcXc4sWxmEp3tOkYyBQwtaCRBVqm/HoJdnPpkSK8qx0sulRperBpUkNKK
 C+RTJqLjVPlBJmnc0F88+P++7wbHardUSAhVj9bC9h4e+lf9fcOiSDQsmJa4W9fqdWgDA0Gxd2f
 yhOz+mAcQP93HOFDY2MQLZ0tuY6fjqv64hcXPht55HbMvAyVMHpJeKiibOLNXxvSuMKLzxptgRM
 PGuj+Nlwkalow2pp3vkHb8jm58K/8KCpKCb6oSCjSSzTRjNI856ZSB6ckSto8L0eRQMwtw4wTUW
 7tCIju4zu/Td3Z+p4Mdmh/SopuNCI8t8Y7XNUCJCpDhOMpxZ5dr1dkM9m265yvFAHR5aTgk0Bdq
 g/fVt1H9CiOPYaXS+uyc2YiTs60HSk9M6H5QVPhBtD9+lIUF5nBVEBVFwjBwvmVHYG+kRVs7luw
 JUCFCGJ+y2PXHazzlFdTBCDORR4iKWzBILE8rK3aJ6pAdB8ZG5qg6EL/jPlZ0lPrCXitueygA+U
 ErK5hxEzYcROEe8Qz5TmJUczRD7mVBcMXUxS86DRP3O/b7LRLzADpow3ioCNF4JzsN3C3fVYMss
 bb/YtS29AtLHA3JTMY0wMwm2puAbX4ZFUWo1wb5NvSm+pox6Hi1As5vNk9mtc0n+l9ViWu3Viu1
 pDQc6mC+42cYmJQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051256_211168_FBDC3931 
X-CRM114-Status: GOOD (  13.83  )
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

There's no reason for this driver to touch the gpio-mmio internals, we
have a dedicated flag passed to bgpio_init() indicating to the module
that the DIR register is unreadable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hisi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index ef5cc654a24e2327510b872563e68fb0b9aaef71..6016e6f0ed0fb80ea670ebb575452d9ec23976fa 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -295,7 +295,7 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-			 BGPIOF_NO_SET_ON_INPUT);
+			 BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR);
 	if (ret) {
 		dev_err(dev, "failed to init, ret = %d\n", ret);
 		return ret;
@@ -303,7 +303,6 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->chip.set_config = hisi_gpio_set_config;
 	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
-	hisi_gpio->chip.bgpio_dir_unreadable = 1;
 	hisi_gpio->chip.base = -1;
 
 	if (hisi_gpio->irq > 0)

-- 
2.48.1


