Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC03DCA0EDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=; b=WOHRCiGmQoP/Pe3Zit73S50Kmt
	KShdagyey3ZiAfFRXBvF0gmkr3vW4TfnaROY3UZOHzzmWgk8TcU40E6YSOC+ocxWXt2F3Sz2pBic4
	tGSuf7JX55ehHKmgm+7vjqPXvXx+s9Oe7+N7+EFyFYZQCRdRGdBdWr8PVGqo1zCATS+BsR5ExaOwA
	a8ugvCZhhF+8/rYXzsJVoR4/Rjr37J6YNCbUuYxIeITu76ygov0YBcC/yP9x6jBE8H7UItCcwkMWs
	a4v4jUwIfWUwK18qW3h+avs4IUTc8RhZNglPafR2AFeqRsfau8Yo8irxp5hMof1t0IOZDB/pwaMNK
	fositz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhq-0000000BHNt-3mkz;
	Tue, 12 Aug 2025 16:18:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulllj-0000000ARu5-2ow5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:58:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so3409327f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992690; x=1755597490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=BIr8b4BQ0woPCltD1HH7sYsQJNIkZAmSUstaUadkyr2d0Ix7HXAI/0T6XvPPiaMLvw
         oD6WrLCelyhybnNu6NeBRuhnAmL3yXf51AFM0meJCdduz1ef9clAG7vyyy5XOXrlV0in
         fbxu01EgZ7C7CRLA0jgZztlK7vDVRIeMv6ewo27rGiyA6lvOP31TXI2FASnBOD5KPl9Z
         BAc1wYnMov4tarIuuEu3t7dXH74gn05ISmg+nCKxyzz8gEXKb+wNvt5xtPeO8GHkppz7
         Bg3bDHe6n6bjZQL5gqVsMnWzGAYqZK7km2EtVjS0KNTIYoxjPevY68QOvnri779K3ZHc
         GCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992690; x=1755597490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=cf5Lj0fBbD/Tz1NEmh4uznoi43SDEUuRQj+xknZIR47cVtLZmru9AdctrBYErKnwS5
         9P2XtFGQzfRtsvW2bR4/iULmudqRb6yZ3XsWjHL4YbDCMvZQcZF8uicOsu/kCuSRpRKg
         4Pp3gesxwI7/gdFvw0d79jKwv5+ksUTPMV46KKDPOOWv7gNy1Fkseix5JsFQER5xElBj
         FnKODcyacnnTdekGvFZ+SD5iVgLwiZ4y6CZJGKXNlhoqPpdhBtkRKuKMW4ZIZSwHrCNH
         BxehdDZG+3jWRI4CYSqCVeelRi/FGzjzWhS+lH2VMf9L7VgMsQxzdlJl0iPbD+7tMJbL
         wvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH8Aqjzrkr0iM8wxQD2jnwefTjflEfqRSUh4Z7ughM8I+QL8ymfJzITNVZc/YuS7RsZzyMNcX3wQEdboptLWjg@lists.infradead.org
X-Gm-Message-State: AOJu0YzNBjUCuCD5gYLj0m6B5q/zsbJc9ebZVbBRDrg349H9WF8mvbA3
	7v6B+RSTxXAct+UKMpwnNTzgf2z9OC81qZ2Oi5Vw1tWdWiOEbg7xOeGfzLhfke6JS0Q=
X-Gm-Gg: ASbGnctlNlTzYDbgQ2Um7U0Kfl1NO3wvbiDQJxx8sanwFQa9jwUBtfIrPWnNNedExep
	ycKhxzqqhoEN6ZtWGth89wSwz9qPcSswfq9MUG34CZKSmJbgi3qnlhRw+jiDdbJ4GWkXXHffcRB
	nnwlz3ZqA9fRDPw9BXotVaxp+51kmSHId2Nx7P5hq4jvU0WO+ApHCCrXhoWZvvSWwaC9banCTW4
	aOZNFDQ7wIpnK3WE774rwBzHQfSggKlQeq5fReBJxqyr9gPktPYuLF0QvTwmZns7IQ/nbd9uYb5
	Ua5dFErEniolAkjOFnetUTMVZKXoM5oDdECkWHiDcOrHmQn6agzy5tPXjGR7tJW8Syf0oQCgULo
	mQgnxWfaLnNFQIQ==
X-Google-Smtp-Source: AGHT+IH0M4qhHyixl1sHu6hz4NKhfeVB0xMfjQlXchVhABld6egJ7JJlOcxAZFgYJyv4JKK7t9p/Xw==
X-Received: by 2002:a05:6000:2911:b0:3b7:8d70:ed05 with SMTP id ffacd0b85a97d-3b910fdb8fcmr2680550f8f.5.1754992690144;
        Tue, 12 Aug 2025 02:58:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:57:57 +0200
Subject: [PATCH RESEND 02/14] gpio: generic: provide helpers for reading
 and writing registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-2-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmVNtFfsvUL8cpCyXfyREmONGjZEbamoSN4
 XtnK4eTph6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 cr9lEACr0Kaw3cWn9laijJ2cSbRn9TnZUAFO7gbdE3yAQS+HGT2kObHSadptmhX5Y8r0mGZ38rZ
 lAdzts2EpWHWskB68dYpDPYQ2YuZgYQMVHaC0PW7Z5bLkdR9ajiI8kCn/pTu4K41tnswkjuq4yS
 lSt/aOMsH+8sHJT/cEdoyK4ilN9AJqivJkCkXj0bipYhh30RzxPeogUrpBuNdaOXEADxQpRSdqb
 ZgXhtJE9IwgHrwuhRYTg8MiXiDwODsNm+UP8ztOlKuXL1fFatIA7jNwGYjT7InUND4XMcHXymgd
 MJn4853D+trN1ksjSlt13Uyhe6X9/JJBEm2WKeY2vvVQnFt55+0Ov0lIOkZbAoaGKNuPMQyTroR
 dj4GmT7Au8MQSBLtg5gdD318vEC2P+U2P+9KJMVEj5EpIupf1Y0nbwIulcjRil1oeJLnn51a0V9
 ExZeIfr5vNKmrZYaqV/yesPb9QmPSFioUNdaToJ/vfI+1T5kiUvIdxeFvRTf1vmnYeer3MN/16I
 ftCoPPU1lGwZkAoRYOklHyC6xl5hpyhID76HPkBxsO2mf7gXkxej+SUk/SCd3FxYqhBlqddQeqR
 3pDf5Xe5KVfIBUNfK6Gloeed0L6D71q6vbkpWuWIntJMkweYSLy+kaCxd7ovceaUTbxOUklPRZY
 w/JuvxlrocgR9ww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025811_708821_17A7C1E9 
X-CRM114-Status: GOOD (  12.10  )
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


