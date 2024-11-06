Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D5AD59F75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 22:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEXdF7FgDobr4S8P4fiJnbBjvEddi/g16he1qCtIfY4=; b=rtZK2fgKThT2YIgi2uxgLJnvjB
	lMN4N2K2OWiTrqMV6hc8ron+QbKOrgvSoAcgEwSLsPjlGNC0T4s2YgNk2nFzH5Boh0KRXKVa36jca
	tUqJFzaBXCnhPqy49O4EpZ7UhgEo8xZ29SlTTla+HWha7kOkW2LaEhJ2gPisrZdgJhLJ6mwuHXJ9o
	/qiOsr9vTN7LC6K2P6D4aQEjTUnawguFkTLvuNJ6831ziO9MV878u0t7s65OR1U/hq1yvTCbHPhh3
	xBg3rBgrYKSfkbaH8BB9IMb7EBR0Mwx3Zjkhg99lQ/Qq16a4GXn0jGSk+cQ3CWvIUicERm+4Byicf
	x9NBrumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oD8-00000004sGw-32jZ;
	Wed, 06 Nov 2024 22:09:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8o9j-00000004rmW-0i23
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 22:05:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-431616c23b5so2109765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 14:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730930737; x=1731535537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEXdF7FgDobr4S8P4fiJnbBjvEddi/g16he1qCtIfY4=;
        b=K37r5r2vuI5/uuKHK0OmIVr0vPkZ+8pWarNnxnC1ovd/4uD0lOcTEoP5pms/9C2JGg
         bhhsq5SKq6ZPWTsILJ4qbd6DNajqNjNyxIpVlbSmqueCAyCqhpcGmDNvwtm4DrkqSRF6
         woeuFw6fJ1SLGCHhG66fZyprUeu3TFJPXqT6+acqBdurjMQodaGtObqR3JCXahm9vXuV
         7bl7ng3aZJOYII99hZ+Jeq5Jy9YQqY214exearxWdvieDIlbzXAlHYfe9k67YFLCAh1z
         g7cTwhJRlxdZfdasZUS3ACPiD1EyKbRJdLHh3wy8Ec3iWOXJrqCmZV0CJiTwb4rWoDz6
         mowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930737; x=1731535537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEXdF7FgDobr4S8P4fiJnbBjvEddi/g16he1qCtIfY4=;
        b=BeBW6JrJiZOfIWw0raSfAd3Q0NdZFl59bJIwaCqnq4mYBS+Z9JnfkOJyVSLNvHOtNI
         Er+3JcEhJJ7fszvMziH/U75yE25TdXGYcvbWcE0tc1nslvNxuaUtMr3BImG0Q4WFoLVy
         OvqTPQ8iG9PryBFoUiKoDN2qXkDG3g/ZS/udn2bEl4EtBcETSz5x7g7cGb/AlOZMl0MM
         iqEagi50FPkJUNsUaThjMMrupru1jyPXm7eJrVKEMMcCWLt3BSkmLFbie5jHgouYWwsl
         j8Qjn8AOYBfvN/GIUOezFgNmND8OcRoHauSeBYtPVQTTMD8S3O3MRDDw0QSDKa3Bxiao
         3SfQ==
X-Gm-Message-State: AOJu0YyMHj4MCOtJ+RM4Ws6sJfbZ7+SDN+/oRdKC/cwiNd6UKjfpqnIe
	Xx/zlbZLJWt4XMKJjaPHYLoOhnI7Y0u3arjhAqXPt2cZa7jk1rA4
X-Google-Smtp-Source: AGHT+IEDrfx1of1AMxp+HK64trdwGdT2xN20fbWPf6OXOXnfs1FmyB2Agr58LJjAT8gJWmF3VJmIyg==
X-Received: by 2002:a05:600c:4704:b0:432:7c30:abf3 with SMTP id 5b1f17b1804b1-432af3239camr6500915e9.7.1730930736603;
        Wed, 06 Nov 2024 14:05:36 -0800 (PST)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-20b4-40af-8ae8-9c61.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:20b4:40af:8ae8:9c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b0eesm20288493f8f.106.2024.11.06.14.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 14:05:36 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 06 Nov 2024 23:04:39 +0100
Subject: [PATCH 1/2] pinctrl: samsung: fix fwnode refcount cleanup if
 platform_get_irq_optional() fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-samsung-pinctrl-put-v1-1-de854e26dd03@gmail.com>
References: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
In-Reply-To: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730930732; l=1350;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=oY8Y2FrGBH8KQICCKj314nalJMZPuXPc6PykZh8Vt1U=;
 b=U/E66BB9zFwfVf9lehclFknC50UuSS6b689jx+tQ1wE2/UOsLHRY7qyHAYqNxUflhSm5d6Ezy
 LuLJxM23r14BYZPI1Bezt4jPbCrMxGUQ5ym6t5L/ilC4tqfFmbwRyWR
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_140539_244121_9662E348 
X-CRM114-Status: GOOD (  16.20  )
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

Commit 50ebd19e3585 ("pinctrl: samsung: drop pin banks references on
error paths") fixed the pin bank references on the error paths of the
probe function, but there is still an error path where this is not done.

If samsung_pinctrl_get_soc_data() does not fail, the child references
will have acquired, and they will need to be released in the error path
of platform_get_irq_optional(), as it is done in the following error
paths within the probe function.

Replace the direct return in the error path with a goto instruction to
the cleanup function.

Cc: stable@vger.kernel.org
Fixes: ab663789d697 ("pinctrl: samsung: Match pin banks with their device nodes")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index bbedd980ec67..3ab5878b69d1 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1272,7 +1272,7 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq_optional(pdev, 0);
 	if (ret < 0 && ret != -ENXIO)
-		return ret;
+		goto err_put_banks;
 	if (ret > 0)
 		drvdata->irq = ret;
 

-- 
2.43.0


