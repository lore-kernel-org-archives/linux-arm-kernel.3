Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB11EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvMg7xlfJga8JPXOikC0tZb6M+MeWNROouU7uXoyuKU=; b=YmOqm7oARIeiKGGdtwc1tYrpdG
	Z+kQnmn6Akpc19Fk/2E37tWzXg9mKkChuYGxfTqw+94K/DkWAMC68fTWD9g1Q+QsTc5HUYPn2xeHN
	f7Kyvjz4aL+qMVlLOA8oQugotpKPuL/6+r1E0aKzgwB1jBTyagjZqmzMe9gytYWcaSckJ//spreeP
	26tfERMGtTxzpAbKWwiufjo9klzQPxM0Seg6Xaf3YU2peanfMMSfCg59v3A3UOzwG6dcBiHHD6+Uc
	xxDHIAP14y+KofbzwUFpTYJcYEzfO/acODEUAUXGaG5vpLH1SwL+ja5hd6Y+JmmDcvOXRanNkq1WF
	5yml3K3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjWZ-00000007HkL-3kN5;
	Wed, 05 Mar 2025 07:50:39 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjLf-00000007GAH-3x3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:39:25 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bc9cbeac1so15990071fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160362; x=1741765162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvMg7xlfJga8JPXOikC0tZb6M+MeWNROouU7uXoyuKU=;
        b=lNfnRaAO2Vrs2jpZR3LiLp11pBQTp7DeqLqGo28pCrTDVTzzB9ANEYtIvpANnVgwv+
         qCe/coR4fgaifiJ19yhNjwPCEdGoKupU4/qo0aos5cjTeKT/PkIl4j6lH8JKh061xL63
         8djyZ+QZVY+mBd6wC0rMG6nGu8wDeg/FRA2TcieVI0l3Q4F6+CK0gUeDnxfYGGv6QxN7
         FlM+l1jAHCz65jVZyKdrt5O+xjVyG311lIdgpK1LZOZPvrpuvPkhPD25qlHdxAAjnjnW
         u5LS/0UvY0luzYLKJR7RmZ92bnU8eWXQPiWiB3i6HDPUEhSY8POPaVMj2I1Oa1X+YMK5
         z47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160362; x=1741765162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvMg7xlfJga8JPXOikC0tZb6M+MeWNROouU7uXoyuKU=;
        b=MtwIwrEqECgT+xwbtAwHjXxS8cZTxCmxLz/oWYRJ1qZZ0MH5vV71l4uOfD8cUYBZUS
         uKXPGT/CDMcfcIh3NaGX1MrvVf+oN9cDG+ETEiBuSgcX0E6GwHsIudiGZDBJTRlpJhGD
         TOh4CuHkr06YWUoVBK+XN/5tHSCEvmCCpVQtqIebHBhg+kM1l18P7lopIvsSMuDIAUN/
         0+v2M7cK7eFvX/UaKAPM7rF+t4uTor5Ac0n+VZYivmxpFDXbk2Mqh7F2aTTulQaMWF+k
         BBKWXI1APP3Ax94Z3esSqAFoircePcl8pgjvuCij+gFzbdmkhumW7Vf0eeWvGj0cR1is
         VL+w==
X-Forwarded-Encrypted: i=1; AJvYcCVz3CK9ambpUKmxUoYXtEky6W3yE0Tq+K85zx3POk8iPQrx3Yn+ikcYqADjFA4NBKhqwjIBSG4VourhGVC0/hnJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyOOLPhRu4d6SNu3iiCHT6/b2309aGXF4PnWRvSPOHWKN4ec0Ru
	DuFniTUvjRReF1qQdu5hkbSEWuhgNxhrfm4w4K4Ht7iHEAqFWTjUJwRyQ3edHok=
X-Gm-Gg: ASbGncufKBdzkMHEoLX1pP9QUvhEYR/JLtN/0xV1E/HJB88+k6xHuDAwj838v7K5ybc
	crH6CDH/JPXaKHs0gSY7C38Ldl9eWy0lgLr+jWxe9FiioVv1srCqZr4TTeviivWp2dUThTKPwCk
	FkLlKijNQd3JOJ0OGOHd8ZehDf+DdrOAuFRLYTTm9Pllzfg+67B4Sja6+XYIePaMSuXclXvqeJ1
	LXQyzP63FYyG7j1TW/xHM6HYdy1v327WrxSkPSrByGBV2AFqG6Nv5Ms74mE1ymf/3trGtIg6J9Q
	iyHf4qpuBeRy5p02SZCtWkl0k5d8digaloF2rKCiHtJEE3p4JT/Iiqo=
X-Google-Smtp-Source: AGHT+IEtLI5nI7Bn3OrfjpaA3Uhj2NQz5pnTloc8Oo+6GBcf8NHxPSUkm7UW17xx2XaVIcFRKTemtQ==
X-Received: by 2002:a05:6512:3ba4:b0:545:981:1bc4 with SMTP id 2adb3069b0e04-5497d3776a0mr644805e87.38.1741160362095;
        Tue, 04 Mar 2025 23:39:22 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:21 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:18 +0100
Subject: [PATCH v2 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-6-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_233923_984598_78503E30 
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

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45acf9a28720fdde158 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -6,7 +6,6 @@
 //          Sylwester Nawrocki <s.nawrocki@samsung.com>
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.48.1


