Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF67C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rx2tOr2eY+H+fF6DPR+iLBfDIJ9wmmt75sHUbD+GTn4=; b=H6MJlA+HnhRzxMX9f6UlVZXAe5
	S08d3B57FD2GYDja6/9UQXf5YT7jQcQkV3JGowN/msI6LpWiTpDP4KmQMsZ6/GWw4kWN/PhC8BDv+
	HkBpv+o2MUAg4f1sPry4+p4/rYlMre6IiRq9ywWuGz4t3IZhha5L5i7EMhJQf/2aGuMMW8hvaYrok
	T/ZY8nfoDGotX2Z4ub++m6CYoqqxLrrhcm7wSeI02mWHz+ly9N6QkJfSWz99+u7jIW5OJepCwCP8y
	7iJF+Q2tX8sdHktCbB3PlYbtBz/YisVkT2o5IyUT+1dxRi2BfWUdsIoaGrbLSABXhKjxvGtGPohdZ
	tgnkbBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDRx-0000000CljO-2Ffj;
	Wed, 28 May 2025 09:51:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCzD-0000000Ci9E-1dhT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 09:22:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442e9c7cf0eso1325485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748424129; x=1749028929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx2tOr2eY+H+fF6DPR+iLBfDIJ9wmmt75sHUbD+GTn4=;
        b=DNgtSDiywaPWSPF7y7yOKpIEJsvvuf3wK0IKz24LWwR35SRivdRzTk41NTSF3w/CKG
         YadKMD39U6mzev1GxC6T6dK/HX/MEMBGKetSTDb4se+BFFrz4/Lm0zzYzCnSJUil/Ppu
         y9ZV9w3wr7Vyh/tYwl/VyXkc0bSUiQL4vbo4JCdOso6vVXmVJykDDf0xanu7a2b9Do2T
         gYZ/CiNP4VJFIz1SxvsBrZ2vucZjbIYj5KrKkhXxlWkRPq6TH89rSgBUT8Xlq0ZFCW1C
         0llxPmTaUvINMoGzZTj6dXPT6EcbxwidRyt2Yp8StPcc7jSC5qVA9NN5JbdFH3c6eqaV
         ZzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424129; x=1749028929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rx2tOr2eY+H+fF6DPR+iLBfDIJ9wmmt75sHUbD+GTn4=;
        b=GjNyH1xt8O0ew3csbIXbUHioFPidWA11QUZI2u0ul3DKpWFgHfBMDmR7X1ZLZzISZL
         mMx2zVW4ED/tRJqkKMUqb8QjKpNcITigAviKrsSj/1sGM/deiXrbx6yCf3OWVwMmBlJY
         YRNhsWXwd3xdnOsa/aXlCzI4UiegwtPAimNzy16Pym9xk76YHvLxDuSdLwhYhip5JyZ8
         vCACjGvjBUjE18uTUzAaeiIqwTGBNIInnYbtTGR/1AYcVdKrUIB77XmuajoTjz9WNnUt
         aFQNLsjlxJtFs9n5/q1lba0ogSoXQMdPLioxDoSaDhUTHhFjrDf+zHyd2IMT/8StsN4y
         A+IA==
X-Forwarded-Encrypted: i=1; AJvYcCWQhRQTPX0+b7TCvTlt6DtQpcmjn4Xy9N5SVSOWMYT7gXwUP8X+LFvGTndPLvJVirUVwF6ltsrBqwhYYFRn2/H+@lists.infradead.org
X-Gm-Message-State: AOJu0YyeSpNtZTJ07iGeNlvy9ppc3v3AqFplDOP/Y02D7zX2tJ1kiIc2
	Mdr8ZZtCMm2pee67/jYnTtVyOeGYEUg2kbSleRYqvwP4m86dhwPp0WxfLQihVn3FrZU=
X-Gm-Gg: ASbGncthiJPyKA/vrE68A+6OCscMLIlBX8FO5ehioMy3b4yaqy+GZpl6rdchpdj18Nq
	SZ9SMxI1G5Y5sh1kuGJwH+HkZGNVOZMVUmvwlahJLuDjE7jSjNRp8gJtOaFR1FXj/gv43JyR77/
	gTckXwdjgdbT1GmE3gj98uoOYMtccXVQ076y0vXLDNzd39+bUoed2HQSmloG1TJdtS56IWZ/yc+
	Kitr64Wv6WNLC12jNWl9/iWcYgkcAFicS2ulujjmZXJd1IFcMrx28VEwFSwX8GhGAcF0ueAZvgU
	Dejn7TiAPE875YUEQcfA+wkK0WU2Sb6DTnyBJ7ZV/HumcQW/r4xvr3JojGOz1Q==
X-Google-Smtp-Source: AGHT+IH5TQnhBjLCtJ2q/cfEBit7Ui0hALJWg1qthF8GaTLBAj1glOoq4NR08mgOFCiTUbTFHl0ZOQ==
X-Received: by 2002:a05:600c:4752:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-44c93caeb6amr53578465e9.9.1748424129243;
        Wed, 28 May 2025 02:22:09 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450787d3be4sm11249795e9.35.2025.05.28.02.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:22:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: st: Drop unused st_gpio_bank() function
Date: Wed, 28 May 2025 11:22:02 +0200
Message-ID: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=NBrvQMrhx/6hLM6e+tUOgjMzy9y+05NeL0rQjwNG5cg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNtW5SA81tOIk5iN4B9Z+3BqC9/qHt646YY3YJ
 uI9jWgBt8WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDbVuQAKCRDBN2bmhouD
 19i9D/0eBMcTsNOBBePfRl2DZ3L4ypubeOhVG44mTQpYX2zsIdOEgGmwhjuOd077CghdZii0sJk
 qdSkTwdpZ28eXWCuOkwDDskSzmWCaZF/9Ex5OQFRSEsJQe337Ltz4y3+KFb/E5hh09XzvuVMbCG
 aPwR0jTfawKW8vW72lIZ70d/gyNq2gM9/pRpb6Nci1v8b7d1f0RNr623SXEO9fd6ELCz8aKP83k
 mJ3aoCIqhO6iXRbo2mwKoEmdyI5x6qqyWlYZrDsC+UsgNNiPS6nzSUq7Dvbg1i90WdlEylZGv8M
 cl6GK84UxYlWEmYX5abbyMAdsT0O0/MTHOua6jdDgbjZapsX+ypR/cBmzjjcVwVuJvr4j0PYjrX
 pVY5fxYML23Z60GMa+8SSNTHEZgQZ9p+CUqmEdV3KBWStCv5ufMECiXT8tnYpbnWaaUrr9ggYd9
 sB69rRw2YhtFFpAj00TrAkfzVzHyDRBo6LgDCu82aOjC6wInFLqaLOeCSkVEn8NHWgDcGs80eL5
 rILPvqvOCf45rWEOVgDTL/i42dseGOcwN0CjxDZ5p2foOGCt3EYQdn6RewBhkmhviwZIcWA7a3c
 JgiZtccCOEtRxwsNF8G6PLwEecG4yqwi7MZIbcK/AI3iNZIkIx9G41SX9Iy9kjb35LpddAxw/6G eIDbZeugPNeCrQg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_022211_432885_26B70702 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Static inline st_gpio_bank() function is not referenced:

  pinctrl-st.c:377:19: error: unused function 'st_gpio_bank' [-Werror,-Wunused-function]

Fixes: 701016c0cba5 ("pinctrl: st: Add pinctrl and pinconf support.")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index fe2d52e434db..8a2ef74862d3 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -374,11 +374,6 @@ static struct st_pio_control *st_get_pio_control(
 }
 
 /* Low level functions.. */
-static inline int st_gpio_bank(int gpio)
-{
-	return gpio/ST_GPIO_PINS_PER_BANK;
-}
-
 static inline int st_gpio_pin(int gpio)
 {
 	return gpio%ST_GPIO_PINS_PER_BANK;
-- 
2.45.2


