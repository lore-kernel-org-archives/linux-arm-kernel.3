Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A76C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9AA+Vme2A7tvOOtAYEoOThuPzc4baD44EpnxiBVar0=; b=0P2dc9LkVzA1FaMhKzGobdSTUu
	sdzwRD8o2Y3ZSmKFoeHoRe3E92aHrWLTAk5UoIJL+SggqZBz1tjBS2mOBGCCK2WjRCnowqCSdTCxl
	Z7dzkk1MTHcHXxow+VY4hTyvAJQ6w2rJwO4zJ0r0ol0PqpGd6j7QWYJDABwJlt+4Is1k/Vhw9oTaq
	Y2BadQOf/JMqC5/XmemNwbDp231+e+cLiWLaE6VKWDvKyzQ13yVtoayqKGnqasyHkoKS5xc51EGtq
	5fiVgRM01/1y1/c3yRqZ+aWXNWGJUoTH2gzGv8nKx4ZIdvDkYHRei3xTAtSV+Cu1uo8RJrMB8uSk9
	6NejMccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPHz-00000007ozC-0w3f;
	Wed, 09 Jul 2025 07:32:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVo-00000007hE8-1NmM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so419972f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043355; x=1752648155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9AA+Vme2A7tvOOtAYEoOThuPzc4baD44EpnxiBVar0=;
        b=mFsnZ93jpP4gy2xJ0u+F8DsufuN+OixyI9GeUtCywArpDeiJUvmENSYBlr45qVLMys
         k48Ybv5PtVYCcjkSa0zgJEpMC3MeJ/f9CdLsZ3ZbOkBOII+7CHF6mpJeeBi1LjlbvgGY
         fG1clf4O6zVu3b0kJ+sQjb5x6HubvV9adZpIXJBc073zYMsakRIJwzXXia5SoMvmoFJ5
         k9U7afMFe+Jtj8D9ThVYaWGYKGcL5vvn1V7bqC5gLWis967SndD7IzBLYI+s9piz76iY
         0Gibz+0Z64KBfNiL8GSPzdggL6WnE8youQSGNXXeM+EuXxE1t2dv5/tB51PHwuplkAkE
         odbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043355; x=1752648155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9AA+Vme2A7tvOOtAYEoOThuPzc4baD44EpnxiBVar0=;
        b=uOqkSx9k2K3Z3D9VaA/ctr9I3OTOmpB7txuE2qicXexK5rOmDtulULI12cm4E/DQvp
         kqAQ+FVfPkW27e0Joa638XRktVZYCX/qf1x+Vdw54jUUJrKD/cpN994sOdFImgIjl5gm
         NtG8Ae9Q6xo/0d0dm2tLgbsMEu73wZgrpr/vfhropSh4+E/SaHJ4ztePDmlpZZtyAIKC
         tM6uGrQtiUX+zlDUVFwNAiM2P7b7SDmUvnUrbY8PYi0BsrA7XtTPx1EM7JKRa7OGTKlt
         dKcvku9XK8ZgLNoJ0L+G04FCb5Y90pw5efBH54zGSDFiUqQxLOCmhId8gLlzXtpex0ir
         Ootw==
X-Forwarded-Encrypted: i=1; AJvYcCX++rKWN2lk34J6J+F5lUbKayh4Mu/XRhW8P/vVetOQeYeU4dzyEQszwoegN0M5DiGX9fp21tgd149LAeBXdovW@lists.infradead.org
X-Gm-Message-State: AOJu0YwuhcufPTNdFr11PXVCimBQT2u/U4e1BDwlXHgJZqiqrnu/NGu+
	++EAfe88gtNs9ljw9UrmVXfm0BWZzfvxq83+xlaw1BaOmeE+yqAo9uf2bvf/Kx2Xzwk=
X-Gm-Gg: ASbGncssrCHvnYUupITFvft/PMEM58HDoNc2AL/Oi4dPs3sTdfATZ4kh86mGHfmrm58
	oxAc6UnuGiY4BBIFaiQ4ilgCE3yzRSvCQrP+gFdSnQdpGSZcEDG8qZzGRxYqPmcdT5d5LVAX3d9
	pJDKMsBmk51Kei1BiUbTy0fwq0nCutIbGxKrHG5HYL+jL9dAFsXNKcPIKBwOTW9zBggefLyOcrx
	oDwtG8ZZgYnOXZlLoFArmPEHiHlUV+imnbny2oeC/ezbnjZcrPvxPXF6z/yl8AhBNPuMGLPmDdI
	3WwhMOjfIjHYpcIEDHaHozG31Bt+0fAw40OieG/QVToVaPBqY8OtCymi
X-Google-Smtp-Source: AGHT+IEvr05IxCN5A7HvgNfGFUMeS/mo5iKrHVFh/EJWjikMuh24rrQubvJ2gZPceVVSxyPLoIWjuQ==
X-Received: by 2002:a5d:64c6:0:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3b5ddfb8af3mr4849741f8f.5.1752043354814;
        Tue, 08 Jul 2025 23:42:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:54 +0200
Subject: [PATCH 17/19] gpio: zynq: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-17-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Kh1qw8D2McTAX2snIyGAwdgPEv34+/OEjkqc/OAdgRI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9EHAVIz0smvBiUJ3rqZMZiSSik9MKt5LJIB
 NYuDZJIhXeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRAAKCRARpy6gFHHX
 chTvD/9olNPD1TmY0Vr47XhyqgN5kCjK3v8PeHWRJYjj/Ezv2NPrbPOdBdptbwxaGSHYdnyxFy1
 5CIWK6/isTqR3KRIFWfZK1uabv0nY7dzgvx3INHU1ym7GToGsNE4MLxJIKjW5unzhExdMYPvVNX
 akLDe5j3eGIjs3h+IDVt2A78pYcA5LDxVVTBkdm7hGMlIw/wuKoJhSNZH6KzFIIuEBnBqJi3NeJ
 1mZFlw9PUZdC6hkQQB4TgSNjZ3DAVpZczDvL9JWxYF5/6hwNePWjRCBZ+pS4foPn5oYYuHfAJ7u
 EVmJt6T/qm6gCnWVVHN0EV8RBi48TaPp0CYWlEZufjBv4BDbQWiAr7s3DDLENZD8JRP6CDrivLK
 ld8qgccCKLALrN0uqRRTFidcyB1YZBjrUmJ3fq0PIBCFSEuwXEb1NVxxTKO5zZK59E6m6yCcqYE
 fWuU72awwZd7nVCyBjrImj/+laSI+WNiNreu4Ym7JqRNCC2Mci2BN3MN3YY2B+Xw6pLnco/fHkn
 0tsvxc7fD2prK/xAvj8x4lFaTH9x2rNvz6JZHhMMJfspYWZKolhuk+YfPe3df27E2Fv6+DX6ym/
 5aYOtQltr3CDb87TRQbHmfTIKeH2YklE4iBvMrZIlZzimIa5q7xLkHnBm6SMo13z5g3EBDkrpA2
 2ARoAyvufzkNGXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234236_404588_6FF9E7BD 
X-CRM114-Status: GOOD (  13.98  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 3dae63f3ea217780818ccb991ccba13ab18775db..b22b4e25c68dc19388dc2eb63504279e548c73b7 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -265,8 +265,8 @@ static int zynq_gpio_get_value(struct gpio_chip *chip, unsigned int pin)
  * upper 16 bits) based on the given pin number and sets the state of a
  * gpio pin to the specified value. The state is either 0 or non-zero.
  */
-static void zynq_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
-				int state)
+static int zynq_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
+			       int state)
 {
 	unsigned int reg_offset, bank_num, bank_pin_num;
 	struct zynq_gpio *gpio = gpiochip_get_data(chip);
@@ -290,6 +290,8 @@ static void zynq_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
 		((state << bank_pin_num) | ZYNQ_GPIO_UPPER_MASK);
 
 	writel_relaxed(state, gpio->base_addr + reg_offset);
+
+	return 0;
 }
 
 /**
@@ -930,7 +932,7 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	chip->owner = THIS_MODULE;
 	chip->parent = &pdev->dev;
 	chip->get = zynq_gpio_get_value;
-	chip->set = zynq_gpio_set_value;
+	chip->set_rv = zynq_gpio_set_value;
 	chip->request = zynq_gpio_request;
 	chip->free = zynq_gpio_free;
 	chip->direction_input = zynq_gpio_dir_in;

-- 
2.48.1


