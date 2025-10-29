Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8069ECCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSw2EdxjOi8kYZ3PupDeUSTW/56qTSGlR/hARhYoX30=; b=pNg9qioMw8oIqFRKxfAYdEUuJh
	4H5MXVAfWjOKURiWSXsnJTr98JJUDhpHWvSxxbe1FA8qHE/N4INlAWUIOZa5JJqdNk+DmIjItshLE
	glYjuqmkE/ajk5XvbAvac4sS8SotZ7idXd9vIF/6MQwVlZ2cLi/blZQiWHA1eGq7rFRZ7Saq6BJH+
	+VsDvrV1oMq7+W/4+lifeUzaPPQWL2WDcUsK+kfCvPdUDQtwOoRNjqXHjN1V8DLdKlE/hWu2vJtjg
	QWiX8CVJe0rfJgLIdxzp23tAptwiypSKEZrhWZWK5eoE4JYvHCVF2F+KIUrAqOcYGlH8YP4F8wTSR
	b911dxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4F8-00000000wC8-1HRJ;
	Wed, 29 Oct 2025 11:21:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Es-00000000vxd-49Fh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:21:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so4435420f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736873; x=1762341673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSw2EdxjOi8kYZ3PupDeUSTW/56qTSGlR/hARhYoX30=;
        b=WhwE3yGsKmKB4lI+Xq2AjYzFlNRUszAC3h8zSQTLoWGuVK/uL8A3GA7kz1q/+eX8/S
         Vzp/ppqkCQ2GcYflcQUlwqV2w2E2vJPhKT1X8WOQnSz6TO0U0coci21/dgQ2yZhykN01
         nCJAS/lzksAVcL3wgb+rcxYdelRxNMBY7z1ix/yirjbLzIq62UHVC6qhfBABphJVt0tG
         p2v9MyrMwGs7lRexLk99FcNyurdOTSr5pHfTkBtqMNreRy+kOyYLsKgYN+8HpqYpgnQg
         1M10kJUxFcMKpeT5YMwyWiguVg7A6dbZ9ZGDzNGdh3Qn3gC15vhhru350Tjx4fAw1KRo
         2dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736873; x=1762341673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSw2EdxjOi8kYZ3PupDeUSTW/56qTSGlR/hARhYoX30=;
        b=coz68/OQG6RdHNHwqL0gL/co+9beF/t2C5B/CLMOS3XMUizLdpsCslMmWTLk9kTrmP
         UqVPdg77hshWt4eYONoRAwoI9/YdGgwvjkV3P9/1gjnt7fJoGlNswgslrVT7JOytqwhD
         rLWv21sdEGGuQprEfFuX/EHkQ+ISdWTvvFA49HCfGbGZhwAXANy1C2I+8+MmqLgJJ2rC
         WO0gRAAxBe38nggZm3Z9iO6AfB0bz88jwzPBO53ECrrhbkgrsxRQBRq9YQ8v0kfxLAwZ
         Xr7/5gQEXpHvuf1IZD3wYsUTHd7Aafhuso7GqZgt2HY5y9mKp/YCZJwJoLGJxKGK4wzx
         +IUg==
X-Forwarded-Encrypted: i=1; AJvYcCW5WiPDNcOZ/wWXJ5Z5zG+DGCYPbDQdBOJnRZVn7FGrOpMnV+gkWpzuG3zWIeOfjqUvar8EYwHucCoxVxodWvlD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw++cx2pkLqNvYK5TQGtXNXKzk4/tSIHPlx7rrn2iLIXMs6ncID
	WGoxJwiBIFBs/sj7Z9lgGvmLfR3DZMZYqS1kkQ9YJFQiTqIJu0M24awAtMAHDDBM2yM=
X-Gm-Gg: ASbGncvtYbLdHRvijb9piMeoazX+RdBtqaGCzRDTQqCWQnU1O5M8T0gXXqUXdiJtxHy
	3Gm3z3LAq/fiMWhKgFLvkegSFlQB5Yd7/7dxQ6HwsvqgDhAhomlAN58SeoAnMtF1wyUD7918V21
	3ImsIb5x4inlWIb+RXLON4Z4dOPSVUh1gUgGbc5QAplRaaqJvg1bPI5zj4mvTz3kdcU5bTaNON2
	RT6RmAFnif/bfK2QqDgxMnf0M8MxkiWXSr8tX7RUMeOqY1ACqqoqXVljwQANj131io18+thOBSt
	7pVndDoG5HfHHZ/dBO+xS1SSnAQxQooc3LRwnDDxAhFXNNbjay+uhROJmBsjfpMejgHCncFKm1Q
	VmkHPFTexo+W5eJKMdRi7hvHFRxzb0Za4zc7DQVR2IiODM7eideCqDzJmyANZICOA9ucTnTACl7
	jhdAXe
X-Google-Smtp-Source: AGHT+IHFL3/SEypSJwx0z/KiduAwAaTPznbT5JJfFEzpWMAJnW6K+9SO/RgtFfJleuosrj/o5yax2Q==
X-Received: by 2002:a05:6000:2089:b0:428:4354:aa43 with SMTP id ffacd0b85a97d-429aef83083mr1953832f8f.18.1761736873302;
        Wed, 29 Oct 2025 04:21:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:45 +0100
Subject: [PATCH v3 09/10] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-9-71c568acf47c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vbLbGIRrVxCCk3wt/NECqvmCZHfWshBV2zBTPFShXA8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiXMGr304xGBu7tq+dWAfIS6q2tDWWQKveWm
 r22V+7NbSWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lwAKCRARpy6gFHHX
 cmvWD/9A2sOwmknVVLQVKABwBt8qycLb4JNObvNJ4aRgS6PD/ENhwvX/HEy9aPpX/OPWJLDaWBi
 v1LS7Jo2LbgVh3gQ/k9j9zogkLL+fZLSYgjIzsYzCsc+fv0Pf+Pd2hM1F21g+nFzqpIaeE2bjTf
 lKKtWoGDhh3cOB5Ynw5OZ0lXQtdOPkY0ynJp4d4SugeLwZ2sVlboPaFVVInEjP9jbDX+qaQGUtW
 ZXz1wxfDEey087MB54ZEKKSJE8EkOckNaSrJwGteoDmImCmdnQbvG+gOS7cr4LSc+wU4BPwqY2G
 7kAq7gg//lCBUGn9fJu8z3PFHmp10lO8GovA9M9UTOaIDq6yAhJT/QShNTDlIYqajICuLe/9r6N
 1XylMntalgyk/QeuFFbM2nShQKrR6nj5f78oWbDBXtQZU/Nfd+n9KZ75/OmmS71h4vNvccn+u/f
 QMwB/wSuHbYZY8m+hnL7gbiF7TMPccpZiIh3duEFfFrnXz51Ux5ROW9PPZ8CREQh825sXocYvfy
 evWCuhwluI3Jshr1EFB1/QPtGa4E3iFjfuaxJFv4DQMcWxflUT02mQesgQtabdaFBa9PVnDpPGA
 mx3paf/ZPiy+CzHgnMMTLxs/1PLkFKjEMV827AEeyzgzv1kZnsIWJLxttu7Sae9eYoBW+Qdje/Z
 ZcfHMA13BxzE1bQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042115_049880_4D3C07BA 
X-CRM114-Status: GOOD (  14.41  )
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

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 96dd66c4b88dea34f1f24bed4d5ab66d3e2249ae..c3046e260cb958296a41b78b545f1ac7f377a968 100644
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


