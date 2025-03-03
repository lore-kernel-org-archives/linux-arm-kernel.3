Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974BAC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Eanl17qUXG71sYy7CwEaQ1Eemxd4O2oMCTK+HJwW1c=; b=PNYhrttPqNV5Oz+ZOwO8JT/9NB
	2eVlJwgpg19xbu2UBChuJkkdnQoLW6kJc5AA7haLHr6sukHDUr1lOocKXiGd4ZODJoJTzk2m7j+1N
	L6kkLbon1wA2avqNtStgfrhYEcefmEwpFiizwJdyUbYj7TubrbondK+syvNOvz9tZxu/YWJ8l2ZHG
	bjhfO2uLT9s6gxM6puiEqSR79nHnOtGIQ5F42NpH4gbODOLCqgtxycHM8BIU8rjx7nBECvMpiMyce
	edU68CwMUIXzidryPz4WDB+z07UBIHixe2bXTB1omj3pouYsT7TsZOryJZ6Q36uMK9Hfi+h9NprgF
	+WiiHzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5yL-00000000wiC-3AvO;
	Mon, 03 Mar 2025 13:36:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5h3-00000000sai-173x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-390ec7c2d40so2811890f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007927; x=1741612727; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Eanl17qUXG71sYy7CwEaQ1Eemxd4O2oMCTK+HJwW1c=;
        b=HAPfK5ZcXgNRdUzVqHm5pbcT8Jse0sKFzLZ6gxC0/4aVYId2xTddqNPdJfOzLq5PiV
         wk+IIqvw+IymjxxTDWzBcK1QWjLlSv8zOspVJzdQfwTeM1sB5nSx+kyFr8wumFtDk/Eh
         QdJ9CbyuyfeP+52OWL7TC0pi40un1uN412465C5qTwvmypIfXKuap8obM0Ap38fMYZsc
         /6/0QLCCsJC9qbjx/6fCujljFHyaj1Mt4cYdWdiQUzpW+j//NuPmMxcdzHSggHfbe+ZB
         IrtgnictnD9ZL9hWAOndCiI0dFrOIH2qLL16CW0qHKpn7nJMmIYQDSrDwE0gDZzePob9
         vPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007927; x=1741612727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Eanl17qUXG71sYy7CwEaQ1Eemxd4O2oMCTK+HJwW1c=;
        b=wIIVu6YrtAQzGd4PEwpBKjqNBT1cLyNGqanX9x7k8JECUKr8pQKLF1vTYbkHUD70E5
         UHSMxBL8G4JN+TtfbJgJXXWWZUEQsZqtYyB/sBimq62pJV/l73/gpEpGnE177cfVoHm0
         QeiWv1tr+FtqnF3POb79ODDfWceQ1nJpYKUURoyBfb8ZFYLV3azRNsVBMoyv7B/OcGcw
         D0tP1u0upy6RGAt9TxlxpX/RLyUocncIDoVYEj4F9FaypLm1kBdDCCeak/nWqGefTj1k
         EV6Vve+s9LWdElfHoMTD104mWa7GCVQNh6Dv8oLICKtq3NHaIUpClu7wpBbQvjSB0qgT
         ikig==
X-Forwarded-Encrypted: i=1; AJvYcCWnL4MV78vC3O51ivjFOX2mEyIsVAHb1MIsbGzld7qAykBGJz0w60358y3P2SWhTpZY4CMKk2cdqwVpLSvCcOA6@lists.infradead.org
X-Gm-Message-State: AOJu0YzYimcBQ9pc+ZHFIK2qPQlGTryKBKyD0RiHSMQbvrnBCkDaJImn
	99rk2j8sraLhjPqHM29Sq7LvT/90ALS0HlSItUlBRZKgUuUyUjWy8PGJXwpV41A=
X-Gm-Gg: ASbGnctmP5CqvlFIGfk6nmv3Fzml3qx9F9SoX3ZnEzIsBEmq1okWZCi6EOqGd760KfH
	k01JZ2DR4vgcdy9sNvFvWeHk4HfX4nk3DAP4nwkf/5XCLJDWB1m0hwyCRXLoSt0BJg6ZSjYefsN
	3l9XbGM1kbo/xJGMSRsutLWOYEnryufm/FOLSfqgXTK7HBy0l5a8Zo3AMQpXo7WUC/J/S/qj108
	P8lCwBEJ1iOXL+jUVKWsh5D3XAlLBl9oUYs/sb6LoJdnLuoMpjW5JAaLcLJMANmvB/qDxxL0IdM
	L/aMl0p/mn1zeTJp0wloQGrjq9eiCdm/Go40VA==
X-Google-Smtp-Source: AGHT+IG8W48OymLU+IHB9XFSJz4Ws6HhZ4oe3cmcpMbwh3yAlmIGNVglM90Lo5CWs6gLp9klDtqeGg==
X-Received: by 2002:a05:6000:188c:b0:38d:e15e:17e1 with SMTP id ffacd0b85a97d-390ec7c6743mr10583036f8f.10.1741007927451;
        Mon, 03 Mar 2025 05:18:47 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:34 +0100
Subject: [PATCH 09/15] gpio: amd8111: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-9-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=IGpiMZp6L9gGWujO4qnSAPvX9iEEZxJHKKOMOCB/YPk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawrsUI2RWcy6gYPrX/W+WpNP5fdKL0VhBngf
 HbvtbNwL0SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKwAKCRARpy6gFHHX
 cn7uD/9fLib1qmXJVVjOojHi15zCxHxK9YZHqSAzCp7rH94PpJrQVFK0/4M/9A5SA7n/43yhQJt
 q16nhbWNsd656/N/6DKOmlP3alKPdHDzsIIJLWSCtEG/DUuKltm5rByCe83Q5WN+j72Ppw2dcXM
 0QndwPOucqxkqiqLUXTCx9n6rgL9K4/A66JfBJ3k+fnOIKWlQYRad+5Ja54geRp5RofS1D/RWVr
 r0dy0roFTTJ9ZB4kRj0pkWd7EO3pEYWcI7kSIl0y2+RjrvhSrYLQftUvg/JPPXEXds/8aiJ1Ew3
 xURb2djMwd0qp9hk5BgCX8JH8I20ZfXCGI4qWK80k6cMIMu8O3qyTd4CapXeIhFIHj760lTqZLb
 98+Poi2DamuEmj56LQN6R0v4nx4PIQWNEWYclzSyIMD/ThQZwtG9+MThzU9Baz+XhENutJBT5CO
 YRWrfqqV+XAKVNMeeE9szHW2C1uPqGMrLIar0g97JpGjqpHv3qPaIaZHWlq6E9tntQctjiMJ4se
 XimBq7eoM6qsxJRvRSXx4GSUb0TkysTs4XTpOZJf0LeCfU1UTnlQrIAPP5scSCe57es8PqKeVM4
 NhHNMAzFCUJvtRyNFSbOtJziCjPmw/weTEqrkCmM3p9OIBCRqEtfHh8aCuFfn13QvOXKYFsU9fZ
 vV6G4nC/fyB2SOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051849_307227_1364B1C8 
X-CRM114-Status: GOOD (  12.92  )
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
 drivers/gpio/gpio-amd8111.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 3377667a28de..425d8472f744 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -94,7 +94,7 @@ static void amd_gpio_free(struct gpio_chip *chip, unsigned offset)
 	iowrite8(agp->orig[offset], agp->pm + AMD_REG_GPIO(offset));
 }
 
-static void amd_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int amd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
@@ -107,6 +107,8 @@ static void amd_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	spin_unlock_irqrestore(&agp->lock, flags);
 
 	dev_dbg(&agp->pdev->dev, "Setting gpio %d, value %d, reg=%02x\n", offset, !!value, temp);
+
+	return 0;
 }
 
 static int amd_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -163,7 +165,7 @@ static struct amd_gpio gp = {
 		.ngpio		= 32,
 		.request	= amd_gpio_request,
 		.free		= amd_gpio_free,
-		.set		= amd_gpio_set,
+		.set_rv		= amd_gpio_set,
 		.get		= amd_gpio_get,
 		.direction_output = amd_gpio_dirout,
 		.direction_input = amd_gpio_dirin,

-- 
2.45.2


