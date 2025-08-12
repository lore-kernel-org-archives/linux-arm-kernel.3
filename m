Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCA3CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=; b=PYTL/KxGOHsbFDdTkrGpTwhQk+
	boRFNSu3djAegEqxpJYAOdkseXVZbSbAVwEMjbcx5n/cu/XK74CFp3rjyHoW4XejiEI9QkPT/P/do
	e4jHAUj5KXg14z7Rqf2dFmDtrtElonfipCE8n6DFobgP+tFoLmBr9kXepKSUchO7sQaH9euMAaPyn
	JtFFPtjHd5FBU5+tZUtJZLG/9Jy5HAeWxHvXLiAC1ufGf7M/uOkGcORXIGb8IdbjBojLAlUi5vA21
	7rARECi/uIsPqRQlQg1Dg01jHwoSzZZ3syAUreCsO0zsXwjjS5CRKGiYlLfJQBLnURY+ZQVfZKzOY
	AJj0aPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhi-0000000BHHg-3H1Z;
	Tue, 12 Aug 2025 16:18:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullg3-0000000ARFa-2JDZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:52:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b7892609a5so3045441f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992338; x=1755597138; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=gYQMRVn5vY6QK1pISHXhVJc8kk7n/5mT56C3DKXELRTHP3vQz8SS6eMl9WlZr3zlWw
         AZI4F9JiucdVxx+xZUrq7KyJ8f3bikwD0UBZ8wO4zbHMFvhH2fXZIVu2s3eIeC5SSmRC
         4yINrbHEGIQ1VUw95+lQHTNQeHVtMnaK3SnlBPexKLrXTNGs95uaD6hvkTTT6XVU/6OH
         zrsoZfk7vBeia/sEumkBN0BfiLfrOniU6yWoYYL2W4HWXshoQ3Mymfmv7jG/L80mPA7Y
         yw/xqfbjAgnRyHFbNLtjJDQYgLq4vJ5q3ykHfTMGbUhQSbIJB4MQC8GZhC+qvpAeYVBA
         mTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992338; x=1755597138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=st0rlR2xYkkHj9bSXgxFHwxnQX5wJcXL1lIvt627WJfUWJsOx+Hn9ZEDOwwKLG55ku
         A9Glx5p4NUCC6227Die7Yf9W6psqJwQjw40Dubic0hXHpcCbVofdUM2AejS0+BR4ZxEH
         EJzt6wQdk+zA3Ss8Z9dVbjK6VzjLJLCrT5n2/cPERPBPikVA9EWZCJx6h+QCMJOtUx3q
         /hDIi907+CWTm/NMGrAOB+iocWF3UVUO8Ih63ImLlZK/1khcixSueaPHPjiDoiT3Ribd
         y4kmE8YVgDb92fmwskySY2V770A8oCnMM/E18u87pwq9dsUL9FafQlHwK4CwTgqZonw1
         HDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbAfSYLArB/C/jpFkHrg7MFdSpPfODQKm5wMNJ1/IZ3PwMYF6Cz+fZZCbfG4g8ajKsLMEHPPqsHqX7RjYLijBY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm+BEsp0gc7Kj05F4eJWl0jV3fW31g9AwdhKIdq/5col/YS49s
	L4h24PF0e/4yVzamaQ3t7VdEjc737ce2oFSGQ0RvLLEOy3LbrUBNTZ2C8Xe7sT+TDys=
X-Gm-Gg: ASbGnctPe+6iOjkRRnK8N0CPE9DrxdOcoZzafqO+rGwpHtNTLMlDJo/Y1ZfZnkkkucS
	PtjIQBgKrHUaKtxoXjFmMHlrzSfiyFsPNoKd0gMgM6jksYd0xVi0uXWRCshaBa67aCo0i3CGntF
	SLUCrAGyzShWG5A9F3ZcRJN+Qq7e9GfCXe7vonvhC8VUAwvW0ScTEuC6V6XQ+rLGmZBOD2b+cyf
	Zs3yzQ+ZBYRVEAt5VQsnw5P6iB3DNtEMtA34k5Je54N4KCtxxCt9qmalONCPt+pLLxdWDOg2i4I
	E6S0KHmR8oEjoZKXnc46UGh00fpW28v9qieD/pjkfwSDQRShkegnihEDfU28Aa/k8yum749Vfui
	siiCioyhzx81jtuc=
X-Google-Smtp-Source: AGHT+IEDkb2zYaOQh3qOMcQ7k9tD4E03pa0Qq/HtC6R2/6gV+8zZkb6gglZn1kajQMc54hiPXB8tLg==
X-Received: by 2002:a05:6000:381:b0:3b8:893f:a17d with SMTP id ffacd0b85a97d-3b91100f0a1mr2413378f8f.49.1754992338055;
        Tue, 12 Aug 2025 02:52:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:51:58 +0200
Subject: [PATCH 01/14] gpio: generic: provide to_gpio_generic_chip()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-1-9f43e95dea98@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q7IZHV9NOU3n+seY+p1AeQbkCwKHTjI/3z6Qnen62yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7F6b/sc3xyJ9g01VwsG5+SMMxU9DyL9YZqI
 VZzjg+ppbiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxQAKCRARpy6gFHHX
 cp7xD/9OaD6zx8qjk4ksBh1Tv9mnlo8kv37xfmX8Jlr72gj0e1Vnv85wGsZx5aOIosq52KdJmfh
 5P3ZIzyWm1BD7s0FIJiqruiIU5+AHeA23FQVWIFB+DDqXcFGaenms/cityggjNSL9JzLdFLMZ5I
 rY4C2MeUvpy6erMNED2GRhLvehwwvno9P01KxHqw7YJGkn+hYkET7YZbmp7okNxIUtcUmS8cALS
 x10LykGNyEX6Kt0AeCyj+VaFTCtAD1Hr+yoP2EpAQmo6PKMrQO0vIlM68rv7mAd5LyL6TiA1XZ5
 yJ/l+zKY+tmOZiUTcakNlFccF8qlqPCa9CiBjjoQ5QcT7H6RX3EPzYzlq7RcSA4CJV/bhPls8i4
 MYp+qqty3toPkf5rsiWBOMQRk8Ma92Tow0U33eNjUhz/nbwAq4zra2A6/e8k3eOZ3bmvPIk0fzl
 fjdAZMmX8Sx6Sf9rpZmcYnxAkoWh/7Gs72mq+TTLy5PGVUUFPljdug8wr0XklE/6VviOIhFNRON
 EQbsn13LaAFgcEfk2vxkWbdu/PsKG8JhJkEwM9EafQaklDSZLEWIQQyBIKNU6kP86Jpa1cDvChI
 0QbwJcLjkLpTO1asQ4eiUnwBTbExico5+jZwkVslMW1qzcxdNblPm/nVJI+P4IW9kl/fo+yQ9sp
 uC7NZ1+J+aFd/IQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025219_594424_EC879FBF 
X-CRM114-Status: GOOD (  10.17  )
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

Provide a helper allowing to convert a struct gpio_chip address to the
struct gpio_generic_chip that wraps it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index f3a8db4598bb59f1dba4fbebace24dc10be44ae4..5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -55,6 +55,12 @@ struct gpio_generic_chip {
 	struct gpio_chip gc;
 };
 
+static inline struct gpio_generic_chip *
+to_gpio_generic_chip(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_generic_chip, gc);
+}
+
 /**
  * gpio_generic_chip_init() - Initialize a generic GPIO chip.
  * @chip: Generic GPIO chip to set up.

-- 
2.48.1


