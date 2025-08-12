Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34154CA0EDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=; b=jcoG0mUsKMLRVaLTjvGVyMUP+I
	Bt8y+bJ3iwCLbjXJx/NqigYnwn6t82FODwI3CxLKv4YZuKCPUITSoS3Y31dbwleWAUMVMj++o7aty
	mCmFpVqEwim25HIcZn2hCqsfk2ORJ8Bk2ATxqbjBTkgWg+5308KD++VsCNhWCXcm1AwGI1pOR644S
	pTiwr/BmS0kNh8YzuqAGuN2X41GhNqQfYFaAzuuU09UuWruYdEY/qupE63YryztnDJ0ZsOfg2WgHw
	2D/ghS3O6rdq2pmkSJqHL3pSDL4QXgJrXTaOiQmrGBnN0F8DqJFrWx1m82DXGhllVVoYdn7waZ7h4
	rpsik32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq4-0000000BZOG-262A;
	Tue, 12 Aug 2025 17:31:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulns6-0000000Aeyb-3tYV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:12:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so34540725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000773; x=1755605573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=nP9ZAfoidyDxQrCczpmJoW3iWJ6Op7Dq91TQzhUUJs9tGZNaaSKZn0L2UBYPT9GsEn
         vrYVHtby4mwuyWyiX1cFIZQiWiGu8r3YavbejgZWcJ1MC7QCmbhvMdUoKaCzUbyZIZEx
         ghej5S2MlVdFq+lJI8eLy8XXeP/AG0Jkp0vaAx1xd2P+rM72aleTQ6pDjxfl1fIpl0aw
         sp35+BocuRZdK7RTfU2bNfQQ16kIKM81f8TJWuh4amioGZjqW/FhFOHxPDTiBCahJ+cI
         XsXk+8WFiOXqL6SA9YwyvIiQMRdISccLIPgJB4/x6a0vJ/YdZUfEpwTMGEGLFUtYgtMB
         RMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000773; x=1755605573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=bMxui5FPUDnO4Phb1vFIRzMjwK+eGTJurdsE7wmk3JH68+tSmxfB5xK5N0fjbE+cO2
         tAVH+1BTA2FbXHaDvEgHMigNRL6MVCtHZvkmTpiGuyI6V42q7XpvxhkXUI56SCM/ExC1
         DjcTldC25zcKfMOeQv6svTzoVc7+04T4qZSZNaqkXhuX781XSj7dCzy8qqN7/GJMws2J
         Bjl4FJ6RPue//GFvfe0V7dOiQz5FWP7FibOugPmygVcdXGE8eTljBaYTu2SAbQOuQQKN
         8Sp0eqck6nrHBHh4nonzkae5ec7urZ45Hpxwq/ajZyliWY4GohiFwUpDihs18MRBT8fo
         X/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCULC55OnvdET30N4mdbzUHx/vL/mJWiy9gKNVTK5xN49JhdiSXzpsdC0roAFLxW7U4omPGJrrPekonR04yvwwPo@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ5ihLRE2ZRhxFU8kKekyFkvbO6QAxgvNMJu27lSM3cJeHCEJn
	z4bEwYwyIwitTcZWUKHkXnrInDM+OsFUlFImtUAXIwYzGaIqV1osxr4p1a451hhAXEs=
X-Gm-Gg: ASbGncuwaWGhkXj5X8gFofknfHtOIlyIlFqQrqGnAQ9QObgwuqPWfQE3f/Q8Zx2Is7N
	apEmlkOXUmgRo8OZHDt28Z6SiR8HoFGlvhMACxPpBvnz4Q8vm2nu3Vi9iB70QTCUsgMyKWRQXgj
	LOzqCwqkowY8ka3a9c0kQK1DGt6mwMCbbxMS5wlkOvw6JEalervFQCRxE+NNcacyib+soT2sO3C
	af2NxdevIh6QIl9fgd96YShsHuN3i0S2gV67q2vBEcx2z3rvTJsh+LpDgPhLJgs4HJnyr2gaKY4
	W9M9JDeUJIzACz+1bTDtr9eNC7qyzTrYYtBjrikcCkJcyGpEi/AD7MeFy26BjBtWa2mDwv4pXrr
	Bot2+hsluHcf+eB5lf+woq6nfAQ==
X-Google-Smtp-Source: AGHT+IEjYBGc/KpeAWjFSaq+JuE16h38uymsb1ZFUiMpW7oYYK1p/4XlxpYj0LWPvpE4j2eNSqrp8Q==
X-Received: by 2002:a05:600c:1c04:b0:456:76c:84f2 with SMTP id 5b1f17b1804b1-45a152e2fccmr4110035e9.30.1755000773375;
        Tue, 12 Aug 2025 05:12:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:44 +0200
Subject: [PATCH RESEND 02/14] gpio: generic: provide helpers for reading
 and writing registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-2-aac41d656979@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OZyZWSGy8uPs2UaDZUWXQTJ09CV/XrDYoRGt1dr0Y80=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy+/0JW/AnHm83j5bW1jh0kc3KflCAbpm1Nez
 +QIf94ZPVSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvwAKCRARpy6gFHHX
 ctCWD/9Gpiv2qp0sqepQR7gFmlFChmRPozyq4AM1g7kU1KkrWAwTQoI85kU6hAp/usYcU4rZpBj
 VjEnamt7ga6KGRF+TbWK0Srw72Z8giKyNnZK/VUgwWTf3vUcFRu1Y20himIjGP5tSw1OO37dXnh
 GrDIyhtiFYXzX+L8egWIS+XUSW4lzONXcXFjh6dkRie7SojGAxDqwGNMDPC+pegpHGFoeE8BSwG
 0zI1KijmtHhgf4PmRImBRE9LzQnaKGnh4WGgz0yBJBpXiBGdBK4YbJTkpQWXl1wPAJbP9zEZR69
 1Xqlveq/zYbY4c1fjV+Pcvd7ZrLCbImz2yl+u8LYNuYFjS145kHnwcJUDjVVLb98hmmdl9VAsv6
 mhjZkA4WX3fS1u6LP6YtqdvsW7LmtE5vfzczD1V6Rr1jWAXzQJJxmoTBGprIU99KZRmXaNBqEma
 SQ617U6c/BaiJK03BHURZUlP3QFwt153QiFv17oPRcODIRkfDm0m3BXuR4Mhhx98vGtkzz7hvdJ
 GJxNXumsYrZMvi3ethW/j6AGvYg30jVnMkXOymDVS2MkO8hKZ1QPG/OrTSto7qvgAfO7l8QI1Us
 TeAyfHigSJwMeiwvI9KSwA4ZAgYip48Xk4hQfrM8QXyuckZuqXHJmrcTnCVBMzld9KnVLSiMahq
 9u5gtMFrkye64EQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051254_964989_E358E919 
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


