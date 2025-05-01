Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E85C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjFuL+Hxvp62ckp62d4xwkNy5J2SbdNnB8mUiL94WtI=; b=ixZ6B5jnZB5DPRQdZ/T8QlLco+
	qj6AKA31ImlCbrbuXy6qsNgZSq4gsuUjjrXGdGOb6ATweNMI9PTAy8r46Hm8KS74FtyqgVgdlHOWb
	tNZ57abge90CLcdJ62fAZXo4cZRBOcM6nQlapYydvS9/HyAsgwKsfiRKKwxyBlSGkMhC1Q1UvTsR6
	L+iIuQHFI97oyRQxUiiFFVoqYYfgApNtdBVdWfRVmGMq+2tHC+OeAUqfQZgHSOnVxfwR6XDsxokTR
	ruWWBukfuwgM2HKerVvj0vGWXW9yHD60+OuhDeJVOZTvQG7mfyaNDAjr15RI8UYxv4/TEwULQCmTs
	U+XvLY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVXM-0000000G2p1-3MY3;
	Thu, 01 May 2025 15:09:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVQS-0000000G1i5-14mD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:02:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1640045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 08:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111730; x=1746716530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjFuL+Hxvp62ckp62d4xwkNy5J2SbdNnB8mUiL94WtI=;
        b=fGp7m8X4smlhbZ6ZybMsomJV64uSWlpSa9iamLsj+k1V7frNuaBQCoG2aboSgg+w5Z
         ph1OzckGNOmnJ3v3dCCEbJ9htpnyXiRjBSQXI/0eXUyCZ2LFjMTI3GBW84oCn5+Ny/UX
         ggocKS7viuSTD6dDgCOV02/zjXonHLrmcWwDKq7FFTNiYme7vbXM5lLPGlWWKtdbXIpP
         4aBZ5oFZvKysxapjjQuf0POdpuvaBsibZ9FYDcBjGdu60fcJrDXq+C8omDOwvpyEm8cs
         L2jqpKb9fN7rONXeXCxw3C0Oz+iSHZLP0qzttIM+e5P7gDphIXRa7ZRSUognW5rCaZ4R
         QYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111730; x=1746716530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjFuL+Hxvp62ckp62d4xwkNy5J2SbdNnB8mUiL94WtI=;
        b=TlMbFAU1tvue40+q4hOfZ/FoHbEbF0UMyLqdP4oLF50cZueOeEndkGySgPP/Sz3OPJ
         FKGeEwmQitT5/VV5O/CYsoDceMAYtlY6c3LIUZLlVYL35xnX+Bt7SSIncpAyxTjJKY7O
         ez/47rsFJjjZUIK7CKxrXWK5xGILri0TWlnJiQnYdWj4e2QBhuLnlAeXs51i3MvGfL88
         kyhwzfR0ZLJXr9etVntOI7OrtQq5zXg3vEP9NmNTNbrQa1n6wW88aS3FXQpK1rG3JRhf
         qj+fWPCekUhl5joYkTHNEAlzEsjrCW2nZ5EllMXMO1WtY6asFBP2Y5xcvyQe2iAyn8hP
         Pcfg==
X-Forwarded-Encrypted: i=1; AJvYcCUnO72qDhoPZdSvcnJq/8LukkMs5rx0hVAYe6yn6jkPw0qdU2uzwips0egmLYyc6ba+BBzcqq7/sTltOh1gorTv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+l1/ZZYACbX0VSuZa8cfUNXbQP1kIEnAWEb0RkxofadXQuvg4
	xClu+5MGADs6rPijZbSy+MqG5kNRxWOAQJjL5dki1ZEtBPrr97JyQcpM3nshFF4=
X-Gm-Gg: ASbGnctwENuWRtdCn9IzCZpZnp+N4u7/3q4Letyl0ZJBlI9ZTUASF5eOUnjLgpGz3I2
	rHkUo1fOvdiNkNAiRJQHf+CIY0VexP4Op8rRdp8vVv1Y/1YMl5Gr3YiGk09aOv/hnJDYMsy8wRD
	oTRu6D47DfFv4hZ4smIxgr/iDC3M8i69Ay/8vmmOf2EpGWsNU4sXoH+pD5M/RLTePNAG61pZJgC
	AKKV9XqoN/O3AFlrs3yf7siK3uMv2JJyQiEpPiwqjtsa9ay752ptu7eJc854bNxNtOKmS+QTipM
	mVSdAmTszeKJkk69mUau88/q9lVCFrPz+qsq3nEd7BWkWunts62pNChL53c=
X-Google-Smtp-Source: AGHT+IHx8sWqPznlt7972Iuo2Aq29rBeEzunJHQrQZKTzx2L2RYiG2zZqFAc0QZBwI42PaKv7Rtz0A==
X-Received: by 2002:a5d:47c5:0:b0:39c:12ce:697 with SMTP id ffacd0b85a97d-3a08ff740cdmr2119607f8f.7.1746111730466;
        Thu, 01 May 2025 08:02:10 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4702csm1033190f8f.40.2025.05.01.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:02:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 17:02:00 +0200
Subject: [PATCH v2 2/3] spi: cs42l43: Make handling missing spk-id GPIOs
 explicit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-n-smatch-fixes-v2-2-d2ad9c1f2e67@linaro.org>
References: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
In-Reply-To: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
To: Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wbJvTFF93vO4XDJ3t3HtJwaTtycPFJ1qGS1kFwex8VI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4zrtu7znQCsit8jnz6Ax+qO4kjdY1hQPTmwI
 OVVwvysS82JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOM6wAKCRDBN2bmhouD
 147VD/972YtDAImuxcHPXe0MWIDPqszTwkbi59mXMxbvRK6obHdCyrpJkqfn024r4nmdDhOiPb9
 4E1FN0hEFSk8JGbXFmIw22G8Bwq5S0k76HOEPL+b0sGuJi6v5uBoyCVhla5wYn7WGuoKF7wMfR5
 3G/CPkg+jGFN/OiG3QKQ5KM8zlCxT0gAANfomMj388nuUHZSuVD0TuhI0yZS5hROJ8X1RuDeHqt
 /qAObojiLu5fNh/M4xgzFtwpyfd9mR95NFNuR3GYoUIomx4WH0bVbEYFEQuafiUhgf98GIi/yun
 KWucCUhMHpL+B5R5nnhr0lp+gG+9vtbSoNEH2FHo7Ge0+StqKh4wprKlXgVF7Cr7VV6aBZxm6Lr
 LFf5Xov+wZDaUzXgUpRXCYskqUSS4vnlGHlENlY4WU6Gx1pZA/INSKRbIko/wBrLQsnBgaJ8zQy
 ez7jNZlgzRl0LoeE2weS23vDqTEDAsxfRtaAxIky7g0tiIq6IAZmMHkoH58PdxPiG7tmyA0O0bw
 WdP11DStBXyynr8D7wkqgC9snxJkAFL9MuHjwxCdnJJlJhJfl6kOKHeAXSksD0tpm/QXvPH3cKY
 ExiuTU5tkPKjs2lVv1y8RyO4+fmuArAc2AVddNhlCmhSviquLZH4CBGjenXnX82f0vcLkiZLOSJ
 N3UJhd6BH8beTlQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_080212_297799_739C8226 
X-CRM114-Status: GOOD (  14.06  )
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

gpiod_get_array_optional() for spk-id GPIOs can return NULL, if they are
missing, so do not pass the value to PTR_ERR but instead explicitly
treat NULL as acceptable condition.  The old code was correct, but
misleading because PTR_ERR usually is used on errors.

Reported by Smatch:
  drivers/spi/spi-cs42l43.c:241 cs42l43_get_speaker_id_gpios() warn: passing zero to 'PTR_ERR'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-cs42l43.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index ceefc253c54904b51a12ff112988d1dfbeed39c1..b28a840b3b04b5a4cce15539188bca02bf36716a 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -237,7 +237,9 @@ static int cs42l43_get_speaker_id_gpios(struct cs42l43_spi *priv, int *result)
 	int i, ret;
 
 	descs = gpiod_get_array_optional(priv->dev, "spk-id", GPIOD_IN);
-	if (IS_ERR_OR_NULL(descs))
+	if (!descs)
+		return 0;
+	else if (IS_ERR(descs))
 		return PTR_ERR(descs);
 
 	spkid = 0;

-- 
2.45.2


