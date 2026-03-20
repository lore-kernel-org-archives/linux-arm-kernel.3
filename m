Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1F71093168
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 01:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OzPny3OBUeeBpt9cG0P/e54tGjxk7eLdlTFpb0o1yU8=; b=USno4KNb4GFb/hflHVZ1MOEvNb
	1qv+6HxzjnVDAeDALrnquZJs7bDN/awLYC01/zZEDdG/1VR6lZG8RZHHXkjExgvkC7TXZZPb9WQ2w
	9sEpw+q9RAu+jVe/HlziLm2nQt0AYdJhOBALnZKxo3zqRzujjPukfVtTC/zjrltrZu2EQ3ShTBAaO
	tyLQyROWZZcaLAO9TrpnxTKjQ+nUr797S5DC7uFzhrOnH5rqgKBg6PGtrsNWK3yux0QN/RuO7WlVG
	jeUIfFk5gOPMZJ4JrvjruK1aPk+SLDnczRUB3+Sdk+TpR4246BmCJYWU5ctexdEqb/lAqBCmeAUrz
	N1h610Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3P3Z-0000000Btlk-3VRZ;
	Fri, 20 Mar 2026 01:53:45 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3P3X-0000000BtlP-25Sy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 01:53:44 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso2073372d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 18:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773971622; x=1774576422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzPny3OBUeeBpt9cG0P/e54tGjxk7eLdlTFpb0o1yU8=;
        b=JRtwU54x6KK/WihwRUU9qTpvgDEzN9L1cpysyanTkfukl+Ri+lgK+e3jnIFWuSlasX
         FGNPl+Q1QDwdhfy83kUqDcj4paKKJvW0Jta9EKU/XaEziD/DqcP2j8uY/DgS6UOrVIMe
         e4FwDl7Fc5gx4vRzRyEiIbeuQRAjN+AlC5VlnM3VYSGCFTQ6tRLS2jQZRlwmMVm77FRh
         EhTxKHqI+wXMA+wrnxfeQHHe2YY7zJhkjHEN+Rzl5UQ6ypctRWBN6EVcY7qTs1QwbcMw
         ma9ZtwATcv5Fi2K5KlwEPsft0BfExYznxI4z2rrVX3x7C5d5KWXwtsVzz4zHZCUI4sSK
         Swgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971622; x=1774576422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzPny3OBUeeBpt9cG0P/e54tGjxk7eLdlTFpb0o1yU8=;
        b=LdXPXsRIsMNtIzw0jsV6BspUcB2gKrI/2GGpopLhpnIBtQV0Zm541keU16alakia3O
         H5m5EAUOzJnGLJOVdExPkTefcKes7Th/z3N1m+b/aBV+wNVFyn/l0pRTXoCiUuy1tX2B
         dkba4aaHJ9wOFFWHBbgL8N3cT4tEXeAgrFuEoHAO/Aqf2hXycUBZwRF8uONy/k55CmBG
         XlairpUevvdS6o9rkYAy/m3wo0JTsMICfx804CNf9LDbQJ7P8qgd78XhOLpfqO/JmnZ3
         Xt5FsVYGPwXTxuRo2VGIBf6dAAHgJ1o83wPdqJhdoTlthKEq53YNdkpCMS6s8bUtyXnG
         zM8w==
X-Forwarded-Encrypted: i=1; AJvYcCWXY/RtG55mEawHG6vD6gRGfXZF/f4eDfDcqaiEAJuPKRCS1hSCXH3ir16kR7gqbC3En97LHFX5a09OonANosUD@lists.infradead.org
X-Gm-Message-State: AOJu0Yza/xYtPCUl6ZbnUB5bsU2PKiEYuPIR99++02xMdD2HThoXD4Jo
	h/t1k1C61Z9cdgpPZ1gf5r+nVSZhhUa6al7x5RNr2Eb3KXtziZcZaALC
X-Gm-Gg: ATEYQzxZxTCgyVTocI+sPV7wKsdQMMvLt+dsO6RaNymXjsXFM8PKReXuwFN4N0m++OQ
	GLduzQoXeUHmIiZPXAQuC69RMERenlJ8EXqJAFdg6Dm8RdbleZTZD/X5reWoVuyCY78VcYRU0c5
	uqUH3hyMS2+9g57V1gcP88RmCdJN4SpWtrI15r5tja3a/oSCf486tmqe+iWlKk9MB9rcXGsQlXZ
	PN1xMBrED+xr3JKSnrVWisD8gZNy+GLDdTLlZm+TnLT6w3FIPwUQlAd/eFp2IPPDyaue88XYGq7
	GJDVElUOAZNLWnBOH/gZn2dwA3laB97lyQgJKpGkGc+bAgz0vtYtsqGEtIpS65xYzKXP51Q72iw
	rdq0oPLMVMIX+e0rtg8iZlNUqBsuaKQohlLzSH0fW6x25UalSkP38ovDkMwxDs8162tnySgMufx
	TwzVK6Nctf9/IP9CqbH7mrRXD68lDlQRNAYMoGxecmrFmFoe2KwHvXHuM=
X-Received: by 2002:a05:690c:d83:b0:79a:38a2:d8cf with SMTP id 00721157ae682-79a90aea249mr15668467b3.17.1773971622283;
        Thu, 19 Mar 2026 18:53:42 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90214024sm8378917b3.0.2026.03.19.18.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:53:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MStar/Sigmastar Armv7 SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] gpio: msc313: remove kcalloc
Date: Thu, 19 Mar 2026 18:53:23 -0700
Message-ID: <20260320015323.36383-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_185343_565575_5BF7023C 
X-CRM114-Status: GOOD (  11.44  )
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

Use a flexible array member to combine kzalloc and kcalloc.

Add an extra counting member to support __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add __counted_by.
 drivers/gpio/gpio-msc313.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 7345afdc78de..2accf3446cd9 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -483,7 +483,8 @@ MSC313_GPIO_CHIPDATA(ssd20xd);
 struct msc313_gpio {
 	void __iomem *base;
 	const struct msc313_gpio_data *gpio_data;
-	u8 *saved;
+	int nr_saved;
+	u8 saved[] __counted_by(nr_saved);
 };

 static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
@@ -631,16 +632,13 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENODEV;

-	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	gpio = devm_kzalloc(dev, struct_size(gpio, saved, match_data->num), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;

+	gpio->nr_saved = match_data->num;
 	gpio->gpio_data = match_data;

-	gpio->saved = devm_kcalloc(dev, gpio->gpio_data->num, sizeof(*gpio->saved), GFP_KERNEL);
-	if (!gpio->saved)
-		return -ENOMEM;
-
 	gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
--
2.53.0


