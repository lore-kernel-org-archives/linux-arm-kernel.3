Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C09CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=; b=n1ctaG0vGZ6AE3mY0mLNQAmAVk
	y1XJutzSbI9nMDcAqYE4k0QvT7l8uMwMofKv9LLbakIRfdknOazchIrmQ3+5RKQnqBOPOOBKnuUx+
	sZmrbBis9O7rwLM0isZEZaHmHTc3G5NpufL7K7cba64mcnWqdMZse7w3CbJ2cwo3gQIEzwuF+WfNR
	QR0XQkl0LWD8bBKGcFAcoi0Qsc8cLl6UEbnrIaTnWx7Q/C9goq94VlLjHiGZc1JY1ai9Ikz58U2TD
	H432eR/F+3wNLRAew/OBmQoj+xSt74Z2oUV1TfmBEiNKJJws6DgdNBIKiH2MsbQ4DCKTo9+SyYc5q
	vQFhl3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWu-00000006jut-0mty;
	Tue, 09 Sep 2025 11:28:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSB-00000005seE-1rof
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45de6ab6ce7so11863115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409354; x=1758014154; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=ys7sMjOHAGW96eZL9ebGU2u5MywokElMJAwWaoWC5QliTCp0sLHGGev47G5zv43SdN
         U9xXz/3gXVXf3N0iYd+aa0QXTPl/plFMu2r0IQYIb5GPM99ydnp17eIzhnU4FJ2gmei6
         aOlozC/8qh4ZdY0l9MD92NqfH+vkbe3djIM2uplzGYYRerNbU9y3zJ7LSWu4KbQHWJ/5
         YsTZHgohHHCD5zdw57FI2zeUOdQLa3dYJrrtemAoiRL50CA/0OZKAENV4RztKxp9D1vy
         wQ2ilAk0PITXeYn+MKkEKdCY7QCkhP50G4CidNWu4b98FxASlx2rXWDHr1uPehoUvPq4
         mJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409354; x=1758014154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=sh6ZlsfY57M5Rx3Rrnjt1MjlzY2o0fY4NnANU7OYJYN37Bm4MFFvWmgxybspNbb7o2
         hzr3jFX4g7D1kmLacx1gLhJ83GjUyV5sqspltMaWF4sY9H0tu3nTOSuwIKFj/MolApYf
         B1TVOdihof/G6+YuHjnhvWPjdynIYsp+EwFyE3GbK0lHSA83NHYYw2QOUaFxJ+rk8kfM
         CfOuLeyDCT1WPxkxtTRKoRhdQj4UgHdq7dpNKHfuqc9y1Q5dDyrM9rmdgKMrXIsFm9+n
         Jg/9GUIE2ynFsmuWikxHKSA2VUXbEYo2i6ODLC/pUREWBTb28u8EItJCBgQGTAKT28p2
         YoXA==
X-Forwarded-Encrypted: i=1; AJvYcCVzXiLyOVqGNQyh2l6f0p9d1jGpFX3T0md9onvMZXYdfXNaoizpyYLG9ehst0O6qCS3tyKsDk/x3fT3wieLwO2C@lists.infradead.org
X-Gm-Message-State: AOJu0YxBSLx/Pv/bq2uxHisyuXrLmY5La4pqfeFIAgfso5gIhlqlyBea
	OXA21VOBvSyl4LC8S/p6NMtSZvA5oE1hAk3bEz1pSUf1uXwJCjn0FUjI5cTxZVxZgJs=
X-Gm-Gg: ASbGncv7ChCIJul0qABuozb8vpyMT5Ch6DcJjjPIglZ2aB4/jNBXW9JNhYEdoZu7ES2
	wRuFmK4EFS9zMlaAKSHzr6iaZD9quOygw9u/pD/seMkdXjLIqN4OJhTU8Ufkg/pTMYZ8vBRxoO6
	XLReRhLKZFkpwo1frc+QNdtzrxzmbSPotu+Oz6RkWca94kdg15YTCJmW+6ZJsuty7LhSsVf4VH/
	5YGy4PlPW5pC1u7OGHicm+kfKUAbZoPYsrINTftnl/fJt6iWUJdV60t45/rdTS+aspAPqdn3QBH
	sV5UXWIUNaO2zHM2bA1sgMHVtoMcdVcvJtuSkUatzTd3F0llzcwxR7vF8eh8IGRXRK3DUJPTb1Y
	mK6sxIJPrILnCqtzMQGsdAQQ/ni8G
X-Google-Smtp-Source: AGHT+IHhcgO6dwZxJtkrv/4cgFJ9AZZjVhBwJVC7OCJoGvWxqWltiwPbbtdGBypNoYfTrgC0pMDsDA==
X-Received: by 2002:a05:600c:4f47:b0:45d:d903:beea with SMTP id 5b1f17b1804b1-45dec7992demr29926925e9.30.1757409353851;
        Tue, 09 Sep 2025 02:15:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:33 +0200
Subject: [PATCH 06/15] gpio: xgene-sb: use generic GPIO chip register read
 and write APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-6-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=We0X7xb7ACmLY+lbQa1fcNw6pP25NDN5z92R8VM93TU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A4pQZLBZn4BjfERAi0jFAen5It67lNNEGX4
 28/FwbaFj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOAAKCRARpy6gFHHX
 cppTD/4ubzT5gkUPHClRcXZW7nUjOwMKszigAjd07nNOb4PF0UpVU/Xa7EnK+Syz6p0XN914Vg1
 dMG2j9qlrjrNzhrbPetN/pzgg0RJ5FtkBeCt0QXzTIM/a+OIXPh7USmz0K2fiNPTPV2j9/afS9Q
 o1uvp7fh5vygt/dxzTY3GXRvzvAvlXF7Nj7cXXbufdr+leL6pNp9oAtHKmepILW5EXpYFjMoStH
 jbkjAo0gaQWdhdfr3K7hUFVirfvRgS3xp/s0PuStezskzt2soyUXvzAk68x1n1aoTsHvj8e18/M
 ELZsqbHx5BzbZXplavqjtoWHWaIHPaZGUK5I96znEf7RNJcznFDPSn3z2hemiZlD5j5zjVbaiQJ
 e7fMVvjPH1WvX60+a5oopYA1ZIZjLNqd31TgZltatr7zdX2BQbFJRQo8bHngbWak1gQiVh/7Cex
 zwXws2yfiUCjol1anGcqyeNvCPSA0b+vzKTlM9Yg+31ZHNGWeisiXTVtlVO8mxr5JdJg8IXJFhE
 HIN1TnCnnyCKDjmqRucW6M/Sj4KBGnUNgwFtA+dnhk1DDyvACq73VpW4OXZUPBsKF9uHpEHvW0M
 ymUv6nH3ayojO3TG4dtSPtFoY2Y4aol+CHE8v2IqHm74wWbdOuT7cdf+yMxDJ/DCtZs3ND+cIUd
 3eWJFcmxF3LRACg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021555_497347_273AE85B 
X-CRM114-Status: GOOD (  14.61  )
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

The conversion to using the modernized generic GPIO chip API was
incomplete without also converting the direct calls to write/read_reg()
callbacks. Use the provided wrappers from linux/gpio/generic.h.

Fixes: 38d98a822c14 ("gpio: xgene-sb: use new generic GPIO chip API")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene-sb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index c559a89aadf7a77bd9cce7e5a7d4a2b241307812..62545e358b6c4b1cab25e1135cb24ccc3e955078 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -63,14 +63,15 @@ struct xgene_gpio_sb {
 static void xgene_gpio_set_bit(struct gpio_chip *gc,
 				void __iomem *reg, u32 gpio, int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	u32 data;
 
-	data = gc->read_reg(reg);
+	data = gpio_generic_read_reg(chip, reg);
 	if (val)
 		data |= GPIO_MASK(gpio);
 	else
 		data &= ~GPIO_MASK(gpio);
-	gc->write_reg(reg, data);
+	gpio_generic_write_reg(chip, reg, data);
 }
 
 static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)

-- 
2.48.1


