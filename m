Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CABCA0EDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=; b=n817qxnHfO4BNOflPi5NikUYgO
	9Yvzx5bQwotYOdRsXsNxh+HvWYDul5vWS6jQQbHQ3849bkZPTCLx1m83CS//8Vz67R+9SPTR0U8mP
	qDbJFokjn8jPzKWQxrjyvJOyDnScDvdKc68FJNQmb4xPDsuJZmefJdgOuikjs2e15AvQzG9fFG5vS
	nRx3Hov2raAV46xStxkp4IY4XzyKzpGeMLfIxN9Ez84j2nO4QgqZQ8n+kqIJ6Pw8iRuBqnKUfCko0
	pdod/clAZZEu3Nc9+n++mLvrVm63nx/C5JWNs/oXFKRXhCUdLcpuZa/2G+Upz0BXoE49Op1YPNJff
	hilvkAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhj-0000000BHHy-1gxF;
	Tue, 12 Aug 2025 16:18:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullg7-0000000ARGy-23u9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:52:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3b7886bee77so3831913f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992342; x=1755597142; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=2viBzIcNhIk/PSBpE8x45FVaugSPSiLNbmPEUPot99P1d3ppY1XFkzxEKv7nVUXIhl
         2Z2joTwAybN4SFmWyR0ExXVgff/f//mDwzhZn+YDhnSUcaA9W3w9fTG261LfcNZTi2n2
         KH+jmCBmNResY2CA+NGrd52bQf21jO5mOirrCTvpna3RLR1FvrAU+TahDtQO86zegwiy
         n/WqhyfXJCPv+fb9Q2cKO/b+PDoIbElTpB457/tLshjghRhxFOiEDYdpP3zkj40mv/v1
         ULaoatOXc2Z0OrQKK6dlsjuLPl94KoINMcjgo+RMAtW9hvBk2nM7JF8h4GRPtBozKx8X
         tX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992342; x=1755597142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=aPUBDy6tOxtG9c8eArflUSXb8uTRcSoUykuDmt4p4iyeG8Xf+4pn6wUV3WnmhXFiUI
         keT2tkZuxsuiNKKIMBYASjGtXw+7Lz9zEu4rnqQt9HZadcBjwAGGmO64ZM0TYCFtfNOI
         qChMnN5X8Pr5O9dQMxE9B23SymFzgGZx7TXeGZTAOUm/h44EOa0HIgnV+1Wa9xN89KZz
         y0q17VGE9leLslFjxbyjd/l8jWTWB+1H24+/pyzAt3yiDj7SBrmzD63NZV6g3rKbCMip
         5m31S8ZElUoPIb5MLloluO8KNZ6jdXBXZ1XPKRclprlzHW+89JBv1laPrGsjCqFZT7Mz
         KfSg==
X-Forwarded-Encrypted: i=1; AJvYcCWtgoTszBJ5Y77EO5R/jyLoEWvOul0VSY/3a4Qy/6xl20upMztpBKDVcQQW2jkw2Yhq3991iljcN+0e9sOFEQXB@lists.infradead.org
X-Gm-Message-State: AOJu0YyhZ+uN8f1WNcWoHw52J/UYZCoJmTd/5nR9VBnQLYtcX/gq2zms
	4OkAMW995afBYv5RXvZR9OHUXO7lpVq/1zdTgXdIk0GgJ94iU/QeZuaabQN9E8TvlZU=
X-Gm-Gg: ASbGncsCEdGjbWw+SR0jeIeLc4nx6NGXHWNRIURjk4McncvNqMg8MpRrE+f2PqexK3a
	a+Spl71IocStJJneoGLKiLWUPZ7vMvBEWpe0HsWfOVC/GMgFYHAAZvxUBnM05dNFJXFw1zZyhyK
	MOcd4fOldz+pMbjBnMjiCFSnL+CFlZUoig46YVdpHJEm7MlGpe7uWBycfkgkXrUTSJpkhJ6U6Ik
	qiUj/E5eS5vH9OiSbq5AMRr53yEM4uRk2MPwfuW3se0LfFZlJ7NTtFlOqjw60VzTGUr+74kYZyJ
	hMM8UMvBPBneSqN8QtSuAU7wi7fHd6Fwz2tzX4ktENUfdBEohyg+4mkBwT4rkksNI2lIXNajBR1
	ACHZjJ4/9x6f90Wc=
X-Google-Smtp-Source: AGHT+IFhu3eBE61b3o1CeUsd+4IJk3B6C/uJlFbaeXOz24wBBmqFmhKOMJ+2LpT68myAimu+s/kRqw==
X-Received: by 2002:a05:6000:4022:b0:3b8:fe01:cc29 with SMTP id ffacd0b85a97d-3b91100ec4amr2185308f8f.45.1754992341938;
        Tue, 12 Aug 2025 02:52:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:51:59 +0200
Subject: [PATCH 02/14] gpio: generic: provide helpers for reading and
 writing registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-2-9f43e95dea98@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OZyZWSGy8uPs2UaDZUWXQTJ09CV/XrDYoRGt1dr0Y80=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7FVQgiJpzBOU44PukLx9jZdqD1qP/d2YDnL
 DDJZ5rlEh2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxQAKCRARpy6gFHHX
 ckwvEACCYpw3TBBm+4QxD3fMyvnMsXLF0rCJpsRs/micPsQez8B8fCSq2jLZsLdFCEbO8gXvIz9
 7yxSocjBylUJUNHZpUg1enKYX56dw3/PMzo7H/3ezKIZOV+5Zzc5bBew/8TuFSLWnS19XgTBrWc
 hGR/uzwBp07HBNOo3a0QHSTqQY2dfBcp9dcVJeyD6l4n8aK9rKmlCDxcsLRa4oZ/zB09v+5mIWC
 RkqmfGhJ3E8gt5j/qkcXEXTv6tm7ee3m6BynnAs3fljqrK7Qp/xUT0Mz8CvWKwvXGeGvRJIxBTY
 jwo63D4gCtB4ArcwLFTDWRohUrpZsjOv2eFMtjEJsZAnBdKR8yoGFPj8cw+rw4dQqzuSiNm16Z3
 KvPWZuztO8kOKvmXlGBCYoIT0JpLw4daGjiUm/eb3+/P+utlN2FzBdNlbVyfipWCer7wyz+ARe+
 P3v7whbF9yVKkLvZiJHgBa3CJMuaviCJtBnvvDY5PppfSYysmUpxk3eUwnta9U8fJSuxsHYBMer
 l2e2Hk/AOGyItuelYOgKC35POSsp3IpnoCqJ9TslZYp2xiMGUhwamw42vWF77tI9i1V8K5j0FuJ
 OgPtLvVuRude8ZWgFPrBa1dHsqEcCki+RXoJ8tA5fOQy/cHpFtmIFQNpYCG2CUNOzIQ0k5NMcJA
 XyedK5ZeVqhRP1g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025223_540327_F97C4C9F 
X-CRM114-Status: GOOD (  12.19  )
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

Provide helpers wrapping the read_reg() and write_reg() callbacks of the
generic GPIO API that are called directly by many users. This is done to
hide their implementation ahead of moving them into the separate generic
GPIO struct.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index 5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4..4c0626b53ec90388a034bc7797eefa53e7ea064e 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -100,6 +100,37 @@ gpio_generic_chip_set(struct gpio_generic_chip *chip, unsigned int offset,
 	return chip->gc.set(&chip->gc, offset, value);
 }
 
+/**
+ * gpio_generic_read_reg() - Read a register using the underlying callback.
+ * @chip: Generic GPIO chip to use.
+ * @reg: Register to read.
+ *
+ * Returns: value read from register.
+ */
+static inline unsigned long
+gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
+{
+	if (WARN_ON(!chip->gc.read_reg))
+		return 0;
+
+	return chip->gc.read_reg(reg);
+}
+
+/**
+ * gpio_generic_write_reg() - Write a register using the underlying callback.
+ * @chip: Generic GPIO chip to use.
+ * @reg: Register to write to.
+ * @val: New value to write.
+ */
+static inline void gpio_generic_write_reg(struct gpio_generic_chip *chip,
+					  void __iomem *reg, unsigned long val)
+{
+	if (WARN_ON(!chip->gc.write_reg))
+		return;
+
+	chip->gc.write_reg(reg, val);
+}
+
 #define gpio_generic_chip_lock(gen_gc) \
 	raw_spin_lock(&(gen_gc)->gc.bgpio_lock)
 

-- 
2.48.1


