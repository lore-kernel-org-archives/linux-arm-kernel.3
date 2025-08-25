Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3C3CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=; b=mpXNPGTSuiPL8mSe+Z7tML8aza
	FV+V4Xia8FgXg9GValm1x4ta5Fh7TJdpdvpEt5auKztkMcVKvOGELAozMDpnBhTjw5dIzPKnAS3/h
	7t20ELOTeiD8olvjlJoydHOobqVidyCd/nwlomCIzZJtf2aDhwHUtGOG8N6QTmezd3ekWuf1z+6rw
	1nxHpwmhoDAHNFbMC20e8KmosVWblMc9iVFR0cFt1+K3xF+O9ZpV/s6MCYL86QwnbLNR/Aeb4oU2o
	fU8pcN7R7k11bM5TV78HSz73qbznUgvsprRA1ThC2p4XoqyEU/7M2RO37D06GDU4JKrxF7RyEPgXa
	JE7KabYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaD-00000007n4t-3HmD;
	Mon, 25 Aug 2025 11:41:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTor-00000007YAl-26Et
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:48:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so22279065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115332; x=1756720132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=ZrN6tDxL1TcWauCTT3T8aQapnKDozBt4HEYbSAs560Ikq8MvUJMG/E6T5YJsHOaije
         +KrCJRdtuz8rzLhG2R3kAuFBg1rTjcBLe5AGFhr4u6Uo5LNIMr5Gn2LxXFd+NhCVe3mQ
         d/N1lSGampvxNX1f6IxmPMbtB5PA2hahz+m2uoGySJ6opHnHTRqyyYatX0TzgMN9y+mT
         os25J1B0E1b/RVIZSBxnAWnOCHzna4APQPUYpYBq6cQ6d4ZdS22gHgFGyXP5eU+HbAzV
         NPvALtd+9rEsCGzyaGiwqJaMB//Vn5do+/KQ1ycfm/kmVz4dnAvh7Qxt9mavbqSmCGHa
         VnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115332; x=1756720132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=AHvg1Ix5uWBlEpqhgcXdNkk89HVZLg2KYjXTqDVZCSGPKW5bxr86rzQZAlk+scqQyw
         e6t/YTdLAD64w1zS/C5kCCPuuDbucc6W6SC8V0PKGrRZ1peW70oY9IfqFb5b7mwPzSaL
         DErjUgSJRHQHYpRGVdQL4M28D+nrFZGVA4WLDBE9Pd7whfyb6zbh3Z+0wb6hhvrfzOsv
         IAW6yLrZob5BXuT80gz6PWWWXk8cvEAtRjwT/eT67WMGjl4XH0eR6NW0Wft+Aimlbe6s
         gfcphcCDWnP0nh/T4PZLu+F7NiDYfVsbyEC2MEM003MXrmQpRxD5+RlJ+fyXdS/sbjBf
         a0Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVFCXNN6sXJTuAKHk0VWBa9cqBYfNl+JNuEui8ilt1kDDgXbTeNw03vWEouUAEB6jlLOBY29E+aEz1orQthEei7@lists.infradead.org
X-Gm-Message-State: AOJu0YzkW1c+ldubG4YM4DLrOblSxQTR/J6lq4iv1sQUyWcnieh+f8s1
	ZGIifO/J3qSu/LFMHvklABoIicFl1fMbzZ9AC4CdkT1WQ+bBTfwEkODrI0Gn7iPCFMM=
X-Gm-Gg: ASbGnct56SNu/AVXgDPF1U96uizQlaeONquyZ7KBB1Nx3y+h+CJLdztID92Hs4cWMS9
	iNGD1hW2Y301o3etGlklbrmcoOpSkRP9wZDCvPE4gdOjNZiWip09O2Lw38XFoW6wjKfM2Zsv0I1
	pdObWW8ZRa/15yMtKb4vP5F9q7RjLiMttL17JogYKj/PBkGfSd7za/ON3nEKri7N2Dqpm09uaSa
	ogqD+ICkbMhRPnwRFzYLcOaBxU2aUiyXbd3gG4J8seQEGe1KL/k85J2tHzSpZtbIlpKCm48SXm1
	qcnFJTyIO7/3lm+uZqgGilcgS3pymCt0/QYAs7ncwc9RCKVjhIlj0hhtvq+QPY9bwJcYI8ercko
	ORoIdCvIKynQUdXhxQQ==
X-Google-Smtp-Source: AGHT+IErwpn4wYmB5jWccKig8AZtnAMXECNBpK7ppyejcQJbbvls81o2Gjjr0DQ/5R6ReudO+l7A1g==
X-Received: by 2002:a05:600c:8b55:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-45b54b21175mr93803705e9.9.1756115331853;
        Mon, 25 Aug 2025 02:48:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:43 +0200
Subject: [PATCH RESEND 02/14] gpio: generic: provide helpers for reading
 and writing registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-2-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF9HIhZW6BvlmVuXoPopEENCwXIxMLWctX64
 fTuynaHZbCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfQAKCRARpy6gFHHX
 cp6zEADBIpzlbLlGa3I1SdfKLKbDta+9JyIZmdQVLH2mg/LNCF3YbcK7N0mgsnw43q1025et3av
 XaqJK6ibXMqtva6QKx/z75U+yaEpyhwnaux/B8j5HHpRyLw48PQJttWNqRcyP71qcfJ2FhDphQh
 4cnxQ9aGm8RkciEgxizFghS1f5BTqXruI6MSTByi4cwe4KhbwKsGAbC4G860vkkiPmIWc2PxaIm
 HGYdALZjgUCHAsoyF1+1eh+4mZJhYgKlLI2Xkt4lv4BSLhEKphBquzql77PjRVAs14euy9DvPJ2
 Ax71OechHRIFXG6y9b0oJCpurOwo0qT5/VG78lOFbB9L0scZtAYlzqqF3mjNyU3+BDHqKhN/Hla
 ttWDVJ40ELpeFmo1oWpTm/Aq3j3VBw0ZDH+WCPwfu+J5tpVV3QPXjGweYxfrKFjhn9qQPZHhOmx
 zdTi+vMitZGd0nwY0Ar8ra36TepQFKD1sT7U20KG1YlXc4rENwZfow0x35suq+TUsUYr+vB4M7t
 dMGCWuAFqyBah+9PO8x3qZJfFNDe3YIwOzbFf1rHZmQPp/UohxtdxkHIQxGE6DcuJs6VH28B7EL
 brDe1BxthAdC6j2rcK8o8b5Grf2aLJWcEPQLqn9hC7w/Mpj8noMauYy3lFNHDLZy53gYjJzdFES
 fjcFitr2B/rR2nw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024853_554298_3F9E6EE6 
X-CRM114-Status: GOOD (  11.69  )
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


