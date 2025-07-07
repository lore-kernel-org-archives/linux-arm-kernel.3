Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02634C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wrJ6zrF6vaCOu99tOK97ZMO7NSzykhtEKi8+veNvYb0=; b=Nh0gEbxiOi9rxG
	DCsaQnQsN7tKa7iEyR51aJnKeK/4FUZ4b/sPej8ZVP4+DmBNSXVJlxc+mN/6tYFCilyqNqztHRTUw
	Mg7laUVofljTDJ956ijvzXzRrbIWg/Ev5dqvBTpOlqHV+akmoCYE+ky+OlgjQ3BMczrvZI7uZXiBa
	hVXFzDZ/Sk7YYpB3W5FlfqOxrDYPzeEuoSMvsoreI61MmQUPlNanybGhrk/PbVVQ3gRTtkD2mRY9p
	3PQEZsS/MM/iZZ4X8HcRMGvGVr/Ms8gpGFZHOFbCdtyAKxE9/GrBE3c5Pl6jYLcM5ItgNOE2nlmXf
	we5iXfQFPUXlbVP82zjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhFS-00000001rRn-3nsq;
	Mon, 07 Jul 2025 08:30:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcJ-00000001kHv-284u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4530921461aso18235785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874622; x=1752479422; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrJ6zrF6vaCOu99tOK97ZMO7NSzykhtEKi8+veNvYb0=;
        b=16qbviMOTDHBvvHQ0LhQOmqfirmVxH5tAAKXeJXA0xqQ4VKlHxUYfdNXG8rUhyjoNH
         VyT4l3KXpdAu2lkPT7BKPoPxFFIkk7tNH668juINoIpXxuPZFZPGsXkPGHPY5FNM0HCb
         wS04ts831feG4JKg7Ci169OWhZTel0bt+bOSkx9wshpHhCvdsMxiYYK62+zRDu6HD7uJ
         p8y1Tyb+RGu1X75Yl4yfazNzAxp/TUvkMMvnvYuXefiXYW7KqTBymXxDhjCPpQ85eu20
         y4Dkq4PbXZhysbSlYOvAsrFRQhujMusDMydXvdAJwYzin96xmMBM5vRcxaI3InIJe3Hp
         grcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874622; x=1752479422;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrJ6zrF6vaCOu99tOK97ZMO7NSzykhtEKi8+veNvYb0=;
        b=i3uoqJ27X/zVxHmLYRGveQVXNhQc/Uzep72SAzMjl2pyIvoPyVxKJLSlgpD7jSYxjZ
         4WURFvixlgAJwhFFbb4qhI5cpD8WkHq8tZZ/hyz/0X+Sanp3v+GwXqTUqT9leXHkKUMC
         Hk4JPM6KyvYdxGo8YNJ/UsRyjtH6jQiyoxHfsmYIYQyDTxaK4I16oWBA0mPBXRoo7g+K
         LeyQXes1K3qajQrdKw1eS1YuTXARz4AvK82ul4ZaVSxMEjgSfc6KORhxAjdnvm7NU8l+
         upQsuc4wPoS4gnk08F/+RrLUWjB/H0SO2Tip512YkszcB7HkM5jimOljbfrJ0+5CHG6q
         z9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWJdKZaGMO8NF16TXkt0Y+A149JRmhXnBuk/WHqumQfYC10W5oAuXShWbv0ZUSN2tSXsYJZYRc+XmzCjsyTGXWX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4AIX9tQb4SlPHpJfmPPjvlXf30sjnReFIfSpPIpqEZKHyvM3r
	5I5/b+QIyJQPb/MLQvDGVTZNTeKFaci5HDsjy9kVZXLPYc7QSS9KotzhVhjUPKfZgcc=
X-Gm-Gg: ASbGncvzUFQE/0aauWBwyIUSJrDMI7NezmkOOEqpRJctdzIx++7z0aiwfp8lsG2IXTc
	Fisu0B6Rmvix5sWhs4JxZ0ml295/BsTXPEH4OOxVEgC/sger2PbAivV8lNC0C1izVkf47o+vbmR
	jUfj0LGgeql2b2BrO2XXsu9+K1icM7wrjFP12ea5Td3J28UOh7E7xEneXfpO+QAmvnY2Z+ns/aC
	pkORVDtGKpiFvvVAsClahS3fjRasUjjFCUQYiNvYwkewYWmzol8vKpuEyCycBKjE3sPEiiYYCs7
	NFhIBlE2USfthAyiWZom9yHTSztlUbhtYQtkTA5Ng0okeZlRE9qmPTUX
X-Google-Smtp-Source: AGHT+IH4gLV5Mgn3MdroclkxvUxTKeVkvmHDseW8EX75VnEa6h1K/vjvfvOwjdwNRHlp/4uzbFHh5w==
X-Received: by 2002:a05:600c:3ba5:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-454bda7bdccmr48978165e9.21.1751874621306;
        Mon, 07 Jul 2025 00:50:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Mon, 07 Jul 2025 09:50:13 +0200
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADV8a2gC/x3MOwqAMAwA0KtIZgP1UxWvIg7appqlLamKIN7d4
 viW90AiYUowFg8IXZw4+IyqLMDsi98I2WZDrWqtetXgFjmYnSMmOlCu3yjh9LZFalbdDc4uemg
 hD1HI8f3v0/y+H+Fd+LttAAAA
X-Change-ID: 20250703-gpiochip-set-rv-gpio-round4-e3b568fda584
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N5jkOm+E42/3325sIdUmS+wpBK7ER15rMc5rHE+VhBg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w5tKVICFJEhXCxLZ7KQX21D4C2OCbBqjj7g
 LfSHShz25+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OQAKCRARpy6gFHHX
 cph4D/9XkrbmY6i6HDt0Q6nX+na/hkp23/znnKQcMJJi5zuQ/t0WnggIIqdXKmBwqf6H0GAav2w
 irFg4zybDpxT38A5klx8m+9f1RQ5RxP0J+mWyeXv6DpzPsR1ibP5S8QEJiqilS47WrkKm4vufW0
 +20euvBZ2i4yvFrSPGAoaQ66oCatMYAzN/Bg8Xcn9bO/KKXgFo2yn/ukjlDlib61WqBqTxp77Ds
 G3wPgAYY6Ae+7/uBSFJh/jGJctTJypXFX/NUS8waHsqZps7fGN6JHHlNUCOXpzQXj+zYPjkNn9x
 6A2vcYBY22Qy8H7v8FAfDPnvkb+1NvN7eLkbtOnsLKUZ5z+LdF2o1xeyJCjshxnxex3ndPUIc8j
 6S+cpIaP/p64S2fj2MqnMKNQS6VzfeJ0qNn0GcYvIfH9UG+ZC4KIlGUgRZ37WTGJrf9uN7Eb44a
 zz+zagYRrWB3Dbr5cZtJBZsUtJnoTdznhgfL20NiK29AIlL3okae268KjdXnx54v5DREc2Om5bu
 lcgT7VJvcpH9Lqw5EhYAQbvTfhEH3gnwhJRF5bY1dRu2N6QBcljYZKBBYoDnlLuyvpKAHpABdB5
 EjN+HpurtDmAMYFVlEYV5no1rLlIHLnQMB27gi4qr+zaammaLIiFVO5NQA+j7K5/zZSyANkYvs+
 ddLuVD9NJscVD8A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005023_555053_220888A2 
X-CRM114-Status: UNSURE (   9.47  )
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

To: 

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: tps65910: use new GPIO line value setter callbacks
      gpio: tps65912: check the return value of regmap_update_bits()
      gpio: tps65912: use new GPIO line value setter callbacks
      gpio: tps68470: use new GPIO line value setter callbacks
      gpio: tqmx86: use new GPIO line value setter callbacks
      gpio: ts4900: use new GPIO line value setter callbacks
      gpio: twl4030: use new GPIO line value setter callbacks
      gpio: twl6040: use new GPIO line value setter callbacks
      gpio: twl6040: set line value in .direction_out()
      gpio: uniphier: use new GPIO line value setter callbacks
      gpio: viperboard: use new GPIO line value setter callbacks
      gpio: virtio: use new GPIO line value setter callbacks

 drivers/gpio/gpio-tps65910.c   |  21 ++++----
 drivers/gpio/gpio-tps65912.c   |  17 +++---
 drivers/gpio/gpio-tps68470.c   |  14 +++--
 drivers/gpio/gpio-tqmx86.c     |   8 +--
 drivers/gpio/gpio-ts4900.c     |  14 ++---
 drivers/gpio/gpio-twl4030.c    |  23 ++++----
 drivers/gpio/gpio-twl6040.c    |  23 ++++----
 drivers/gpio/gpio-uniphier.c   |  16 +++---
 drivers/gpio/gpio-viperboard.c | 116 ++++++++++++++++++++++-------------------
 drivers/gpio/gpio-virtio.c     |   7 +--
 10 files changed, 144 insertions(+), 115 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250703-gpiochip-set-rv-gpio-round4-e3b568fda584

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


