Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC87CAC5B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=; b=QWv00ysRON9BAP9Hhxrb7pL4Pc
	/Nv3Motl6TiSuIgzj4UdRP3TyrmJfbhI94h3eix9m0N8dIMuO/XL1mXPJdOr6b4roK4UtNiBZj8oW
	bBaj4b8PbNWqSTC7fwmOQnoVRqU4FZkJ2chkgWgUlihI7hi+Lf/TK2XmvduwaFN/UnvWkARQkmLub
	nVPzjhsrVMlSntSe2/p7gxX4dbQpn+Bm3dtBjTxnG93P9EsLYS1AdOH1G692x6KACd6GsIRdOGxCn
	9bYmU/YA7Icvnj6ML278ffNevxzW0YfcQ4Q93fZsvIOqyRSbLBCnaV/iUNV6l8DP+PaKiMfVyJbtk
	zBkfao2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqz-00000000tXR-2vIu;
	Wed, 24 Sep 2025 14:52:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqs-00000000tKj-29T4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:52:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3fa528f127fso875768f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725533; x=1759330333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=yaotrZKjgKJW+uo5bLX+wqM/S9Ye5goPrmLN+H/iKDaHDSyf7iZZjdAju2+oWGnvMz
         QPraJC5mE0zHkgB8tuotenj8JbrQ4L8g7Ui5Y7m8k8w2u9d9LQ7Ea12ZoX1XoaFPnPpu
         cgXE7utubv37KgvHgm2u5ZfmNx9JZb30dyzKJ8M5hcR9KyhYNFC9Ceqt4+KZV8CMWwUP
         MV/qE+jTz4/he3wc9fxOvxyodHahdxR+CJi5H2X5NkoyuBZUqougeUZUyed62DKR7ASh
         brONXOjG6mIoWW1Da7HShqmsgn24l1xPmtMsXXOs01HVQuSE+wMjXg146uIcf3PbMs58
         dehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725533; x=1759330333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=KM5dOcD4PKaL/l/A/qoMw+xlAo9Fl8uGxTIf+Crrw+DSXXlsA2TyCTKMQPkUyfC0P+
         M3lOVDOvor7xBsXGVHl5Tb/3uIbQYHrRayPzELmP/mZDDkuHcDJSlQqaygdNEajajvf4
         /XbX+5EZPi6dsNIEU/KNILFlmQQecNoJsNCEI1g5zxesTiPrahH+00IR5/KtAapgITN5
         xsyLMDaYMhadaHPhvdp/8zQGdCn2a+qZgQl6EKHICkzNye+fXplFCfXx00oXpqkLo7wO
         yDYhqob6AxMfR3ZvGBBmdqWR+rT61aV5lWB9jdsZ1dnxkK+guutkoy7UjQ3phT9khiyy
         XIrA==
X-Forwarded-Encrypted: i=1; AJvYcCVw73qbiYrW2zgb8F7J+lve6UzMPBKLL24zqOdpU/IQlNV7WMdnZgr0V5eOX08JgPbi9c9GcCWLIRGW4tb85atg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Pca3sINFr9t2bJtjR9hD2PdA8qCJUj0WuMR8ayYXhTh0+MI5
	HTvNgnyi/TyXtin3D3Vyuz13aIlXHcoBy/Amval/B3uKj1StYQ7jMVDSd/9iffaOK2Q=
X-Gm-Gg: ASbGncvmqWeFb1jtPIxoU58rH+jgjF10s/o6Hadz6TVsReF7Q/ghc6wFUIYJAJQ2Abt
	BOJEkSNPQ33Htbfru1c1DTQCNzVjypDZihjJJWIvOTO8fvaWa/mszHABs3eMh52sCh7f1f/RJjK
	JPKGKXMwl10+QCaPOOjG3GxbpvfIiMcHIYvN+uHqgkGqmnJvg3u7641Kt/Ffs64Z5Ogh2ZlXXQ/
	SW1a8bBTU7QGBLwPdGUMoJWAhwcbJtRUy6l+x/Qa6OHe+FcUWKEklOweiUp124wWutX7IX4PfWa
	gRA2PJxVfxeeHBng+pZJhwuNksDV555iGoRuSKRthQn74Now+jlL6jD69s7HJWPL8rw8bQ2GVhw
	dbb1v1C6oTLguQPmu4W7pqG90LppZ
X-Google-Smtp-Source: AGHT+IHNoygF5K6NbFZFn73ylgRAxtpGZVjEv4fnMw43TW4zazr6wr096y7fD1mLuRt7rZlC64ts9g==
X-Received: by 2002:a05:6000:2010:b0:401:ae97:a1ab with SMTP id ffacd0b85a97d-40abe093fdbmr2608816f8f.10.1758725532824;
        Wed, 24 Sep 2025 07:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:52:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:37 +0200
Subject: [PATCH RFC 9/9] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-9-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xxM5DFs0HrWkdhU2lVlfFzKEyxjnJBr+LeYHk9Z5T9I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWGsIAdL4UJeiMya3ALuTFpKjTN7aiOFeRzH
 +UVHZT5JrCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhgAKCRARpy6gFHHX
 cphcEACKy+MOIGJFHlexGtoihY6/OLkWdmrBXTUoO645qSw8NQvk7z2y3yUjzvjBKr9hX81y36k
 bi2ATgazhH2Y1qvRZLbCIyviBSlA/Ng/tlMWhAih3C07fcUG4xSkIpQmEvG11WfZbM1/JEdat4H
 oD3+pxKwrYyGakphDygC2/1nRA6QdzY6faa2Z6Q1DULdAyY6UoySb7D4odXllJNuZyJCCtiqxWE
 ubY3EMGOgrUzkIo5o17rtWlh6q+lU86nd59+duDIMpp6jgsUk/A1crptrmnhptqlh4HqNaUyHSS
 rS+ejjtDOTT46Z1nSE5u86Pg8+VJOjulDbM+epJg7NwA8n/Nz4uSLBbYABdnCaq3kG4s4OYHoGW
 2EUoRTdUaKhnQOn2B/C8/W6zEkf+y6PjFboefj7wsslTNN7vlPo4vYmHA7jdCnDzWs4cW3AEdOZ
 sMMbRrfmlrfPatsBaEL+HZH71qMXTu/zBucKIg58ZckX9wKRAS+FWVtm04JHuuqGgS1XtkMwu4p
 Szr//k1rQp23kajM4IU5f9EUL1JLmpeoiDQEjUKcS1u0OiMeqkC+5RrMHwKd4uP6zPFkpkaQcLQ
 VSogCIlRTTQ4/NIBHy7HHxQD5Ehky/V5JKlAuCEStvEZ/XxunMEiLV0qz5adX0fh3iAMdhZ8igI
 MtfsM1m9NuzFvHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075214_575449_03481A00 
X-CRM114-Status: GOOD (  14.37  )
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

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa2c9377449e29cdd33e9e8dd28c5..ba60b4de6cab7740cd8aa70c89f6e03e1dc2dd12 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1572,13 +1572,10 @@ static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
 	if (IS_ERR(wsa883x->sd_reset))
 		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
 				     "Failed to get reset\n");
-	/*
-	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
-	 * which does not handle sharing GPIO properly.
-	 */
+
+	 /* if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios */
 	if (!wsa883x->sd_reset) {
 		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
 							GPIOD_OUT_HIGH);
 		if (IS_ERR(wsa883x->sd_n))
 			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),

-- 
2.48.1


