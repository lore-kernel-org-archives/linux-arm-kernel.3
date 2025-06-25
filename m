Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9D7C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyMmalZdJ6pbvGscU3TgFwWkO4BumQObBVQ5qABdz2w=; b=ajiIAgof0GeOPxj8EhL8Z+RYis
	q5g6HCyBnXLoYQNHJNsa+jT9qoEk53aSwWGdHbAHTW46F6gzv2gENXgKXYWW46i9WeXgpsVcpf825
	BVVa0Z+r+Nk2py5hnJvnsuP4oyNwOfwIgjPshGDB/MeZdxBgYm80No5YuJzNXj+lxyH965fMwZXus
	+VgzV/0VJY0HMvVILilkI0Hq24BG4rCIPGb7UK6DMZezcmkjrRzwpjnUFpFyY127+EN3cUMHWhOAk
	pc/2mMIEhZXe8LI6uIzR0xgmtPlQ6ZD1z3T+01l3xP5vpwUrnqs4sXKQUOCrzIPCWp4PA903BC88l
	5txYJZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQQM-00000008qdv-2ubz;
	Wed, 25 Jun 2025 13:44:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRm-00000008K4C-198X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so5476065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847621; x=1751452421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyMmalZdJ6pbvGscU3TgFwWkO4BumQObBVQ5qABdz2w=;
        b=pMIsOhYhZNMDLiiL7s4YIlTf7bbYQQKUIKc+uTPP9Xvbs/n8dyrDzBJnZJ3d9PN0wD
         dtRE9jItt8gso/z8/2M7szkMIEQlIXcZ+Hi6w0ga8DhBI12xwEdgFjQfJLUNrcIQGblt
         zCBTxfgXIvp/bYYSoScafCmhyxCrhxd45kxfS7AH6YrbTPl8ELxACKJ5vfbPbEJxkzLW
         hpPEm5PCSXmAlqCwigP2PG5xMzWOYLhHhrbdvVOHODd0KIOlyuBa3ulSR4QgSpLotTJa
         t4LExg6a+z4fxp30qca75BBc1kQAyFGRZ0fT8XyKoMkdQ0fQ1EAthqOxT34q/zD8PfL3
         JCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847621; x=1751452421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyMmalZdJ6pbvGscU3TgFwWkO4BumQObBVQ5qABdz2w=;
        b=a7yJs/foY+d4x7dDezWhz3pjzKxMwqjkGHuZ8dPcs9HeJmSBuQpV6iQBzFrTTaDklt
         VGLYNxWUNGgpmoW+y+bU1o439gcJHZuIwxrj+Ms6KyY21sF9k2JLx8LgzIxB7kqeEq35
         5DUWfV5YigVN2ij7YnD0qTExq6Du7dfjCYFu3e59yiFAo/WCZJXPbfvXbk+lZioAqsE4
         KROEAG1lzDuAtWxzi/QNViIlmuYJ1VLy4LL8SZLo+fneSO7LGHf5TBOoomKJicgGNgF5
         A3xTiX4KZGrCmvbC8ydNy8ZhcVQlmHy46akWHIdgO5z5JFofmXym+4LvE9xwtB6YuERB
         aCDQ==
X-Gm-Message-State: AOJu0YyacTJurXnCyjsKjt3cW20eVyn+FXyUkXkoMYbNQoVh0qzkkrZz
	l5mhZO68LhAGfINEV+9wNFcGOMLDSVofd0263J9AGFS0BrHySk3NtoNuh3W8h+Vr/9E=
X-Gm-Gg: ASbGnctsAtl0P6FR6RqxhHS89L/KSQyIsATewFiXS1hVbYzu5a8SmtDC1FRh9BrtayA
	z2dTEYeRsdNx36HqB6TkrFDpXO+JDz226xwNt/ZgfIQV4peewtc9ir85cO8kVmU6k/AQ3lAB/VK
	BAyJHTDw/CgEeT3zYgY2TGNMrW3USYI3sTs171XuO5XbKizMYRyI2NCLJvhvNBlj0O+F21LIAnV
	oM2AxMmm0Ug8xE5O71bwq6zceM0GlFyfRVgqLVXyEGn+lEwaV9YQswqPX80HHyY4ip6q3I7lS4t
	+7ZYaW2Xx/gP507e1N6eVPgcqd23+3I+kwwzI4htBfQJ6zu0d+lVtMx8
X-Google-Smtp-Source: AGHT+IGX5kkHK6/RlQAQGngBXm2j4mrTrpDdNI6ZtxmGUqgETkm/4NoVqdH01dVxDSht4AUXDDia+g==
X-Received: by 2002:a05:600c:1c1f:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-4537b784539mr66449965e9.11.1750847620649;
        Wed, 25 Jun 2025 03:33:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:25 +0200
Subject: [PATCH 02/12] gpio: sch311x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-2-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Bm1ZmDU3+64z2/g6/pZk48jzwRhypNvi/L59y0B0Rkc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+9/4Ewmd+YvX9HPVEYmxBAdnKtB6+FINBn
 JAEQO8cyCyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 ciqYD/921ph5itXKEOUqDoyuMmmgJkixfw98VW/OgdyKVZj1uo+9vDhgAOVGkD/krekgRzgxW4i
 tGuZFW3nq9IKvvScXoxHU24f/6dqGeijpan24o3x9lA6p2ToC05dRWgl2gPydwhTbOjf/yiGrJg
 eXiCiQnsto2fqjl17KdY4sLcN+vPguhIT295R6kSncA1df414q1shuAnrXlPaxo5dNi5xcY1Q58
 lLXtaeLwJiHFyhTk/nByGZAFlB0B3QS8y5UuImWgevMv2TJ7JY2ucndXH6YWUdhsAta/iwAWMAe
 O0xWo/AD2N+AUW0jy9smE3pvLoF7MadWEb/A+/U+KUD+T1i7RtZJjIjyym9rmucanI6Vl3aB1TK
 VjU0tyG5TR/Ih8+YTi/84SBv6imCmwGopVzWS0y0gYE/imeqPb89kCdNXMwOuLSPYPB/w/CyQgX
 vjOFwLlS2UPEJWOP+t8+9wYxyut+zWUX/ydGxXsnLvXz3oMJPNEusb1siZI7ubyeVc1YwZZe8Yi
 QIzCICpYNSOY/xzKxdbvA9b/q8KyfuvRden2qr6OQm++gLpzyNhzwIvtAO8KJqLqTHP5fxrX/c/
 o91d6WX5k0vnrzu2a5/zFDqLlr+WsqxxVjvBq7Utv9bXVV6Dy0UEnA4hktRgLxR1y+7k1l9nAiY
 n49AHM8TfJKjUQQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033342_316791_40C42039 
X-CRM114-Status: GOOD (  12.49  )
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
 drivers/gpio/gpio-sch311x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index ba4fccf3cc94f108f036936bc2d5006fb4d060a3..44fb5fc21fb8aaa7a4edde5605e3e23c79ab806e 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -178,14 +178,16 @@ static void __sch311x_gpio_set(struct sch311x_gpio_block *block,
 	outb(data, block->runtime_reg + block->data_reg);
 }
 
-static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset,
-			     int value)
+static int sch311x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	spin_lock(&block->lock);
 	__sch311x_gpio_set(block, offset, value);
 	spin_unlock(&block->lock);
+
+	return 0;
 }
 
 static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
@@ -295,7 +297,7 @@ static int sch311x_gpio_probe(struct platform_device *pdev)
 		block->chip.get_direction = sch311x_gpio_get_direction;
 		block->chip.set_config = sch311x_gpio_set_config;
 		block->chip.get = sch311x_gpio_get;
-		block->chip.set = sch311x_gpio_set;
+		block->chip.set_rv = sch311x_gpio_set;
 		block->chip.ngpio = 8;
 		block->chip.parent = &pdev->dev;
 		block->chip.base = sch311x_gpio_blocks[i].base;

-- 
2.48.1


