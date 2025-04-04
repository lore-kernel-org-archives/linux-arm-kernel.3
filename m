Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF217C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=; b=4PLsChFxsR5/7a2djbQz0x2lcX
	CScENGLdtraBq2qbsy4gTWkYLb/U7a90IcoX9xV0ZuGT/CQWI5GG8lOdeg8uy+HmCv0SvksLm6cVL
	GF9rwnVdbOH09eEsxIkmjaBEZcQ62V2fTB/lpU0P93//dbaYlrBvqGiajUbGXwW/Pj7fLdpBx3Ko2
	fcqGv3iFMTM8TiG0cP7VydRr2RnV2WMUb2LdNx2dvmEtDcFOfZUGDKNHWwjXTN9tt1ivlQlsnA3C/
	trZyvj15m3q6DQOWtKbsv1iEuGXIqdEuttM/qhkyL2mwkllNK6I5Tfg+rOW4yhbdP+JwpAA8ZZRL6
	wut09eFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fte-0000000Be1h-1r7r;
	Fri, 04 Apr 2025 12:11:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffq-0000000BbIr-0D7V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39127effa72so177500f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767845; x=1744372645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=;
        b=aLS9JF8suhCoGWz73/6KniZc8jegBWsZiZLoYX0SFz6gVlXec9cmyh8LR0bcNFI7RI
         OmkiBdN/48l0VNt78i3skM/OcnEdPw0lPJZeFcxm8exwG54whTlrb7tnJIlur4sJA5KC
         vVyrWI2JiZorv3j+5shWte2wS8iF2YC2KHfYmNoRiIEAJ0bC41AvnQpSqT9ofzI0LG22
         L1ngsT6reUKeNaOsrC/HKXmtoF9IZWIPWJDkn+GJOvB8iXygNv5ieYNVuaGzFILj0ZNj
         gyBp9KGjN+qSVBhQqaxMACkXk2BclcgVkTBephLIECPJytb/ztGZwj4Kqakfb31Yns1O
         a8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767845; x=1744372645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=;
        b=xTWD72Al0bbn2KG+SxfJ84pYacIeLq34akJ9NZMqDVpwqjRo5TtzMwXeFSNKlAE4mi
         ukk91Fb1QpE5ths7/KBA9dfI4vvuaNEP95/iSvpdrwqPseiBgAImKQgkyoCCb6wCJCpa
         uckT78sSbTs8Ognh6IDKl7WLeznzi+BLv6hRG+6BkRnUbiEzd4tjqjcwUIzxkjNs0D5e
         04NFTk8GAzPGj+FXwrMMsj896Z5IaALn4rLMIWEKzTS8h627yt3WCrJOARapUnfoHonp
         uKNnGYblf4ZmvFVrBADcrd4dp1d/4acBqeQ3RVRs9BX6u2TRDYkliQycX5KKkUHx/Yb5
         QVtg==
X-Forwarded-Encrypted: i=1; AJvYcCWVyvb7pqiaH/bRd/QobQRFtSKYN+Wh/+rs6Nr8uVLOmgGk2x35GHmlt0RuBY/X4r/mw+Ysr40E74ZEHo/7unYR@lists.infradead.org
X-Gm-Message-State: AOJu0YxHTIJttKslkgE0NWD1y3VPODZucJlEToORSBvoWsA4pflPpgJo
	dY2qENvm0nQ8rWNAV8cBMywRhT/V8sCfgcIpy4uoOuCK/S48v/937c4rU+C5Pck=
X-Gm-Gg: ASbGncvjZ/BQeghYjjQlqPYB32r4iPCZ+BM/iNpFxrrxlL5rZ4jeVws5p6fJA90Pute
	IMlU2vs3FqiHIPUbbbE+Z9Rkpp60MkBLzSDhAeu7xCeVlc+eb19QWUGTf2hrJBGnmEhpzwpZliR
	vT0wf8rxNyJ1NVlxVA0Z4I/O/gxuX3nAqzXyLL0O95DLrOrn5XXzu8mxRMOH5Hyf3jrUzrqQkvg
	zMnfMMVSZvtcwy3FcCKZTbixpIgxQp+g/215KFNRMIJh8R24JCL/AL76h8CxJGcxd0+OEsA9nnN
	iHsStv81eGtOv//zTl9hBWJqbytrmHlQEfFgw1fKbVgX8T8x4WsuqA==
X-Google-Smtp-Source: AGHT+IHBtV33JgKfAEZ/K/Z3eAGyaEe//CmaN4daL7d9M+mX3ZcQYu8+eSe3/MU83jWvj/2V41Xy8g==
X-Received: by 2002:a5d:6d81:0:b0:38f:27d3:1b44 with SMTP id ffacd0b85a97d-39cb357b616mr910662f8f.2.1743767844740;
        Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm4209455f8f.60.2025.04.04.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] pinctrl: uniphier: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:57:19 +0200
Message-ID: <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045726_098859_51DFB4D1 
X-CRM114-Status: GOOD (  11.53  )
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

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/uniphier/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/Kconfig b/drivers/pinctrl/uniphier/Kconfig
index b71c07d84662..5e3de0df756b 100644
--- a/drivers/pinctrl/uniphier/Kconfig
+++ b/drivers/pinctrl/uniphier/Kconfig
@@ -3,7 +3,7 @@ menuconfig PINCTRL_UNIPHIER
 	bool "UniPhier SoC pinctrl drivers"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
 	depends on OF && MFD_SYSCON
-	default y
+	default ARCH_UNIPHIER
 	select PINMUX
 	select GENERIC_PINCONF
 
-- 
2.45.2


