Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C688EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UED2MPPB6ErGPf9SzqxWrhbWnlHVANSe4cIFIu1q+Q4=; b=M1n36e01ANKbkamLCeVvmdxVCL
	cMj2so8ihV/9dMpvyN2+Yc4VvMnSKf4uCUwGFke8wL15Sxqzpwcrlmz+D5jbO7QV3ItgxtvGKi/FE
	ZCL8t01IjMl+ThdBCZpRxkPp5CbftU98VHyRrI8WriWF2jWoSV8+lv+3HFAAIn1GW/cBegShJi8VT
	A7JGbBHBrQW2O4a6rVxP4CPUjKJds1NBw6/QzNUfu6za6DZtPeyHVE3m25bx2nSCoEs8yxqkTB6R8
	GCiov8lMifb0cMygUL6U3LSoGa3i/u9veug24VclHxu9wnlJwTMzFsiBWr+LXRPGcBtLsm20htgo5
	fonDYtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP090-000000079Nc-3Hql;
	Tue, 10 Jun 2025 14:40:06 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyFi-00000006nXD-4AgW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:38:56 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2259382f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559133; x=1750163933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UED2MPPB6ErGPf9SzqxWrhbWnlHVANSe4cIFIu1q+Q4=;
        b=ODuBNCFlpUWr6GpYBfRfNh7DcdRNtWgMoekahMwIg/sSkF8b9S/P6QACIveNDwZhfj
         ILTzhgwT3Hj1ndMX0JGCG3esKQ4xPU0gr3tXR6LIGs6bSGZe1FIkQnxjdTvtdzzEhVnD
         F7AcIyGsYSjyyjAKRbsO8e8Y/O5ppbtspBGAYcX+FbXdU8a4ATGq08Ed83YeqJVAKn0a
         EMCnuuHO+0QLGLT2iQTwQ2AKeB63GdgUzrU9Dd+CKJcUdSkBRDL/fXXmfJq46pvGDfw8
         ON+Tgxv5/fXzntHTAVi8xRTWhDfYeRqUrt0dJ8AkP1k4hRt5h8+OT1NSAQpMbgp9q403
         xpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559133; x=1750163933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UED2MPPB6ErGPf9SzqxWrhbWnlHVANSe4cIFIu1q+Q4=;
        b=nx0MsjNp7nKnZHEI1XS6HMAO0hmsrl/lFklCnH5POY/v3CVPBUoSdgBOgX3jCBw6bg
         BkCZ8AliKc9Q3ituY6+8bTGCYsjdG7qKSiMT8ZD0ZwuwCxjtPd/pjpKR5Q8ckbLsGgk3
         Vv3+7Yc5bsU8NqWaha3op0LqABzKwfRkMWBNnGQHbW2JpRXizGiouRmgdkkLa60rzYZb
         jwcW7AFEGgc4YghD7aXIvikhOcHwoPlnCqDmzz859kzU6sLIO9QkIvASURe1Tik7eocE
         7t+DGhMR6EtUa8GXkt/YHcJzfdmluE2v5NmdMuQYlaelGsNj3Glylh8F3AIwO7FTDSiw
         0S1A==
X-Forwarded-Encrypted: i=1; AJvYcCUYbk7+I58U1fT8kOaPwA4qFfO1GeJTl2PRkb+lJBxDKWBJNoE9ekWy7bUxhqsN3hB813KJpZPY8Ccmouvxlc7t@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxv59hjlB0V1vcPUhCkHn5jWdHg97kYu65Bm9vDVBUOyVK2jtz
	dlSytPXF9iK2vgPdSEjZ8DkuWBwDFX/053nIjFpuTQDFuVhYgbA1DsPn3flWF2H2SQkq0a5+RqC
	YRSxT
X-Gm-Gg: ASbGncvuForDHMiwVsAsyyL985i/tT2bQ4Zrpx2odLGRzlZdSOrgfld4zDfz6ncazj6
	DmThqqYpx8dWDN4ckSsApxQJK7WV0CdopQ38YBGMkPEQWEMl/rUdwoiCCKC8fRdogfmweBaqKHN
	ZLLZiFupMsaIMUQHJDZJamaxIdZqvmDCp9jD6cX/SSuubHvh5fQzcuQONMkx5aSNBhL8eKDQedJ
	TxF6GliiKJcw3R8ogdweTPrVuc9fsNwSdAyHmUoCIIJCfQXH4jIrU5VoyOG+WXwpLGfWQeYAxj/
	x56jkNiqnZUNTAm/ok3oyJ1ngTPMuSkpqKoHvykyQ43mf0Lkvn4Q
X-Google-Smtp-Source: AGHT+IHJRkQOc9mKKTqisqkycJt9sb/TgcpVTi9hUVKLOOQP54qkbtSmSLteeeLcL9Fl+UGpgwdsKw==
X-Received: by 2002:a05:6000:2203:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a552272cccmr2256652f8f.21.1749559133197;
        Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:38:50 +0200
Subject: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4MWRLVrsy5tNHMi8wmFGL8LdEv5y9p4ltDubDqUCng8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCdbgSaqAglGw/fi7XTf6vhd7I5rjcyoaZ7sg
 u/b0JAesI+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWwAKCRARpy6gFHHX
 cphAEADbU+UhlxQiORUaofwF5dUuYRA9iVQv3yEvZ+lXlQEGEXL4mX5gYjUS9d/xWjS8CHSJ7Cq
 +UUe2xk0NLgsm1fE9SV5Hp9SGQqqcFdilBX5lGIJE6tLOzFdGjtU7fYNlmPPebz7glzebbg04jE
 ETaOEIJoVn9KS+yaFocnqrbFTt3PqOHhjVGrwcZSxuni3nf4iy9Yn6Gg9RjT4sZD7LbZpvPIu+q
 VSJ+OiSJrKaKNK5BWfpVcUBV9ozDfUURkd8lrj1eN9zVE1/NTQJtKzVkfS2kpgOOq+DQajEzPiL
 9oez1XcOjWsvIfe9qQQSofbZtZz3kG94oqWNrr/VOpx6LGzqwgol7ozx4fGlykaa5QiTn5sjxcV
 zrNQpp0DoIf1xjwAovdNq8vE/SKPAPYAwQNlpG4Xjp7WZEkJxxmN6fbikV2Ob9wkRDAgy3Xo1gG
 yYH2FlibMDX7OGlZ0/QrG0cjBY4OyPJN3UUJUimhaU7SG+orUxraxwl9IA6V2WwLq4NliXgLm5u
 8SwuKGtvYzhiFoyiBDDCnKRrkWFC+s4ZLD+GnjEobklVaxgM2/ctCUotBi/brbm13+YbqYOUiUd
 clq8mYqQHWeM1/nbk74TqSGNVNjSm6iFxQ3CZjMr4FgR0E12kdYKX8d1UgJ6kye0WkNWDRCGsSN
 4YqcJKc35stS1uA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053855_037646_496FA59A 
X-CRM114-Status: GOOD (  13.23  )
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
 drivers/soc/fsl/qe/gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 3ef24ba0245b75471ffa10f579bb744c0c3b7e43..5391cce4e6efe6d120db7fdf7509dc5eb840f344 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -57,7 +57,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(ioread32be(&regs->cpdata) & pin_mask);
 }
 
-static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
@@ -75,6 +75,8 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
+
+	return 0;
 }
 
 static void qe_gpio_set_multiple(struct gpio_chip *gc,
@@ -317,7 +319,7 @@ static int __init qe_add_gpiochips(void)
 		gc->direction_input = qe_gpio_dir_in;
 		gc->direction_output = qe_gpio_dir_out;
 		gc->get = qe_gpio_get;
-		gc->set = qe_gpio_set;
+		gc->set_rv = qe_gpio_set;
 		gc->set_multiple = qe_gpio_set_multiple;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);

-- 
2.48.1


