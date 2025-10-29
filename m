Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82EACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITkYH5qq6p2spjReXhvHRadCK4LlO30xMaO7HYP/79Y=; b=NeMAl8wa4G9mPZA9a0pCFF75nq
	rURsyF3DQnSvOteM1j5gD4bpvHC0/6P/OrolNV6++eJBYH/83dZgfjbZRVV8k8lGdvysZtHJE/bZG
	UxHSiXVa6ZIDdtiL9eQwtg6wfqF5Jicf+0B6fYoAgzZcsMn5JT5SnuiQlh1YcjZnLh51e8B5Iq43d
	6qo22gRRfzCTlr3lDSZ61KMM3ShuhOhoOZPpmHvpxr/gmNGWKp+W4PIVbZsV3ipaDykkTTbJY5VIW
	8Ltbrm5ObwUWWfjO3p9yjHiHOqqlstGV2kgR4AiMR+jNuj0JUkoWi2MCjpluD7CbxvO82FYecBnBQ
	y1B0+Dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4F7-00000000wBT-2O2S;
	Wed, 29 Oct 2025 11:21:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Er-00000000vvv-2Ura
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:21:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-426f1574a14so4725599f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736872; x=1762341672; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITkYH5qq6p2spjReXhvHRadCK4LlO30xMaO7HYP/79Y=;
        b=lgtGhBx8ESx+9frqEi5V195BrMXaXRJebdKx6TXQsJe1yo4fTK4KK9ZdaaKHRZpZxS
         f8rYc6BF8HVEhftSXkmTkOTrPI+xwe00Essu04JKFOgTqu/vhSkw6H9PjMuuradd0mU5
         qZbANXuVR4FjI/zpMs1xFY0XQxbnGcD1kcrR11uIhhzw1WCUpKIuUwtfRHL9Jtxqk6Jm
         69iH0VMgbh1yo4LPkiNlkyxIhz7Wb3t0iHn1xthoNYVB6FWUGMWIt+Mq8pjZWW9FMD7e
         wBWXb/xb6OdKjrsnCLNRy80akblbS0pAuEMx9AcqUn5IxW6q66B1P2gzZycvKO04pjTs
         IHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736872; x=1762341672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITkYH5qq6p2spjReXhvHRadCK4LlO30xMaO7HYP/79Y=;
        b=jD8Lu3IgZmRPzpCZ9ZKL/pr0o1TjwJlAmlF4YUULCnrrn6MGVMCsgKH0T/kFZl8RYw
         cRo/s5z/zruWLS1W76y/zzO1woyJMYrJkf9jhgUXn4VcqkAI0aiLYatGCuj3o0M5sKmY
         M6Z26ZWQfhdb/R7Wg0m5edRYhFS6sAUzhKhAw/0/1GLLOb9GpZrOpu5xFqtwI+PT7PdH
         UZPbKNhXp3akiu4QhGSM9yh+zXF/1YlmPU/VOExwR++mTd4iO7WMshSOXgeoPVErmsT2
         WpCB3LlixSVVAlSbCOdKisy7ZqHmuAw5hcNcZo1HFsH7XLuOx3Nszv89Nq0ubhiSoCn5
         nGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNIZBhjp4cqno/okC0JNU3hMxbAFzVPQs9BYg/V/NznBXkLEO3RC+7n5WOtSqIPX5/RoFUqVBLMrzfkGlTZmfy@lists.infradead.org
X-Gm-Message-State: AOJu0YycJwhEC+gTSuDO6HFxriVZF2/sXgmijDY3iw8i5zlBsJwbAE8A
	sxPpWyzYyE/f2J8P9Lf1GfEz/JT3nOkrMUSDulXVAsCPOkK0JahSSTWMKRERM66zcjk=
X-Gm-Gg: ASbGnctOE2VopKDC4ymhgfa6zcowldzCoKnBT0yIgsGBXr8AomMzVD+ib9IWkLqm6+m
	4uZIHueVenvLAut2vDpkRJSqI/LWyXX8cNeuzYOt8rD+Yx01Eoq2GIaq/a4HyVsTHJlF/tFEs3K
	0k8REU0WqkDrCtnQu5lmNqEr5XVB6zgv5HXNZlxGPrZvEASRVkS5wam0lM8YqckfT9M8xCwG3FZ
	IOXNJbhlXR0yIVVBSh3JyK22yLoCPyQnieyr4HL4AHePe7tCe00xHIWm/w3oe3a8lCjppP39hx8
	/Vl2MhuOFR/nfPcetnndrIOH5tlyfuOOCqydGFeiUrPJutmNvWweks+Kdac5Lhlw63rQYFpNie6
	nxoaYCij5CmwwiLOTow4yiFqhXI5j8aH1LKreFO3XukuUB30uiI22AzpoUb2iNfzHlTXl2zHXV6
	JAhdMo
X-Google-Smtp-Source: AGHT+IENSqWLO/JMNJLWEfyUHP3Mjq4W26Iv0qEKH3r8OB2YkTy+FUkLuZiv4z7uvfVY/XuiHdrcmg==
X-Received: by 2002:a05:6000:4021:b0:427:60d:c505 with SMTP id ffacd0b85a97d-429aef78e49mr2088157f8f.15.1761736871599;
        Wed, 29 Oct 2025 04:21:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:44 +0100
Subject: [PATCH v3 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-8-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iK0ZywBEmfSVw6xPFQX6Oke9nUVZV1pPcQC7Xb1WLtQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiXKnnAKknhcraojtkxn3HXQvIqfHbyL+bzN
 EXTvAFatICJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lwAKCRARpy6gFHHX
 csiEEAC4y0Ps9nRfERWW+TIRHLw8qrds7gW3K+kxaWsNsBT38vOQRrALl8SNYm7GZ94LluEso9n
 SSL5AT5boIXTnkKpKhUsNmRhvoaLjsuUtlE1AA/iJvZ6//AC34+pn6a3lOlQZ/s8M5rvRUvNzCc
 /AUSqSkyyElorHQnZsVm23TiMb/h4chxqFQ1mzI1M2CaFDVugOHv3SZyOV5Yus7GI5c0uvt97Cy
 sWYE8PC4I3Io8+souZC+TdOkjA+DJuTjKURoijR4yUrYmiWAVyrz+0C9W9B7orM6U2G+o9DMJwi
 KQplI+8j/Hvq/9j7BdTbgEJmjhj6o3haaszRDVGGKcVhKQZT/hMfO5WOtpxcXUnGh0a9PXeCNvT
 ybgTvSQChRrkrZ/suBk7OAtLas9JNP/AV/ADIwkvT1Qg5YcFUQywjrBccQJaA9XrZ7dUQar+4NX
 plHV0zHPlCYaVSBIjTfUFKER/m41CuhFiKhU1CaIife+NIwemkfvoJNWoYcUDrMwT7Qx4H47jDL
 mUHV3+jE1kwsAHpCEE5EvjKnsgl43pw/R1IxgYaUrcDQxeyO3Bqy+8l0FvyCD9yINbpQNKIwPcc
 JtOZh2FqyA8AZW2dDandfZl9eVndB4tdKfVWQghb1jzvvn2MlVP5t04RU101IMPqdKH51lxIBFj
 yj8vFSO/EhCgneg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042113_670776_1BF6E121 
X-CRM114-Status: GOOD (  13.13  )
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

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index e249de7f91d91f8c7f1e7020086cc65c71e64c5e..d7aca6567c2de1ec36e9f36aa82463bdbf3be27e 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.48.1


