Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DE6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WjmbME1436pSDYkp3aIgIG33gCEKBJTvr+5GarnqYuM=; b=ZS/pvKp6kRhuWFoWegOuti0633
	t1qNHA76mxVvGNeQJqsxju/OVDgnglPcbha6xPBpiOq1RFMPZUtdXjkw6JnFrrfFfAzhhTjdKnI5d
	AfuJsl7djveG6zy4s+oqL2ljsXY7XrpZZcfgnJIweHTFIuI4KeA18w+bzyTw8BvNUj68Z+OaSiEi3
	L5r5XUJYE5a6GP4mnS4GxfiL69MB13pXsEdtX3nMF8b3pye4O3mZwMIZPQhgZBa20Ei5y1zc3N9zL
	w/3jkzouJKY/iQS4C8napC70WqEAzxRZMfPKOaK7KlI/NatgfH+AZlHfy7jpQl6lQhP8Nc7MoaxPf
	EHt8JzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQmW-00000005O4m-20FB;
	Mon, 10 Nov 2025 12:14:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQmT-00000005O3w-1KMk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:13:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-470ff9b5820so1802715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776835; x=1763381635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjmbME1436pSDYkp3aIgIG33gCEKBJTvr+5GarnqYuM=;
        b=BGkJ0SV+DYjzvjqY5U1cQGmuSu+DWnd8dyzUu5vJ0QkdUBzQ9jhyI2az7DNUzOsWwy
         w/Or3+6lbj4o1GxpSMhKFTx1/xVgF8YH2iJi1p3bXrPASH50AV6Blj87KcyULbI5RtMs
         VTRUIvXppal0sTG/If6iFaifaxV/yGoCVVFjjn314MyTHpjZFXVB0W7Z1QFb4Gmo7OFE
         IHIFCJPCIK5cIchbfFqVP6AidLtBd8DMvfg/Vmq2f16nrG090CJUJuc3yKbCd0LaLLfk
         0XbtL2vZDjU2EPfaIrjVpprGglaOCJzVx6R0HM+2CY0hw3skbFggpv1kMIb61jGIG/9X
         wk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776835; x=1763381635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjmbME1436pSDYkp3aIgIG33gCEKBJTvr+5GarnqYuM=;
        b=jmBck+a3FRhHivtqLebr+vO8r5ntabEyyRAAe2ecN9AlMLMy57Hl95IhQK+GbLXUjr
         BVfMH5RtUWfOaLfa0C71hx7k4EO6cIFP3c4p3JwN2on8PfGmx1/ydlwmKm8xjzS6moN9
         EVyjv6lm9LiyuJ44pWdJpPZWLQObzdS5B8uJEHA+J8JTGwgPxbzW/jut1yefBzOP8Fli
         26c3caxjtMriEBwnK6vyw2tSsDbmiFxejP4UUR6wXxkL7620JawMdkmDfzREXGvbM5mg
         aRsBFdaUl8iGsNfM5x1MlJj324JJzByjSIh+XzBuZgmvcJFR0CWHOMcxMHXcyb6c1vES
         hxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMlmTmKXL3shEpdOeddTZQ7qnxQzScYZz7rUa1n34Sv/tg1nUsknZ7dK7u0WyaWcHzdRgTYeR2MqMYoDLA1khL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw99gJFSTY5B8XfleIIaxNoT3VuRFLCJA70hAIjgk3vDrQPAjAB
	tsHomq5jT/VmNQhLU/D51iDiD5ksIwrOzhIoycsniKSM4LQwB/cNbSVEzWA5Kh43Ce0=
X-Gm-Gg: ASbGncvZiaRksUrfQWmF4UOpgKvwpEJyqBSc7ja94BFPmS/A2R5Ljwn7d57F+pq7H/s
	asWXGfr1GffHPJ7JeAymmwM9U6qld4EEWz/+F8ftraEpzVQcgAVcWR/bmyvyFkQ3aXXCSwxgzEC
	yxL6k4LLTrn8rk51oWwk8notoo0E8vSWMHnGLHY1EAHfmLnCMyBYVQswk/yBiN94lHnyroE7pp1
	Z3peDLwDDP2wmm0ifjyACl5yX+zkaZl5Trq5WGbiZrqCFg+L0YulQ8XktNYep/ogDxFl8jjJUvE
	Et24sVgZIISjO/I0/eD7QtXxa1vcWcOWTecjdb9D2hJ8PazJrRPIXqyRqWr+ARkqS/v6/ch91DS
	PClxGjZU63VAUY0zvmm9uZEIQU6qf8/GHDGfMUX7MsSwZ/dJEyMRaLm9BtTdKGViKO1BA9H4Csp
	JBT8lFfjfBSl/fCJJhEkbIQA==
X-Google-Smtp-Source: AGHT+IHbNuArn8C9DWSTKYZ7LhUSvorI++lgVify2RunMzFZSAkl92QQgyKvse2NSni9jyc11HIbCw==
X-Received: by 2002:a05:600c:4f89:b0:477:563a:fc9c with SMTP id 5b1f17b1804b1-47773236215mr36141105e9.1.1762776835461;
        Mon, 10 Nov 2025 04:13:55 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: defconfig: enable Exynos ACPM clocks
Date: Mon, 10 Nov 2025 13:13:39 +0100
Message-ID: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=1RuGJhko7Tg/2IZzsHP76G8AT+Tj/AWNxpQIu6+goLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb46cR755V6vYrD6XaAJ+OSnAKc6fvm/6jTB
 xiiJhbvE0OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+AAKCRDBN2bmhouD
 10KaEACDLPQR0FrZpAjYo5Og1ep/uckTjcjFC+xCzOXqOEdkrzcpDl037REM1q5jViFkjhTPpXN
 SrcT8a/d5hhSfjHToiBEaoYwnPfJ9jRk8xdAeQotkzc3dCqUznEibLkng8olbmhebHJFB8Ry+Vk
 BPdygN/QaIjOVtyQ8CzlIFatPlF5AFkr/3lOUvqukBIXmWG0Iis/flbwcTR2/cRSBh1KCrx//WT
 8vaBkth4y9WjLiYCCqbheWjzD7HbUAkfV5t6ysaq9OBpOhHzjluW1fqFWr98jJXzda6FiDRWlD1
 TdhDDLfTWyrRTPwum+lUHGJrHjPNbcO+1npr5MfE5tOntgnu4hCeKrxRnoipk1eRrB1/MBWU1zP
 GFQjaz1w8dVPenwryczUMq3vNTVpAFmbPzGkvJWSuW3X9fh+7Al8vvsiURFB2ZuYf8pvS/IUZjx
 TDH9rq9EH5rf6nzBP7+wdNxIQ4rHsVY183B82SmCHrknOBF4KA043+Klx4m6FSgj2cogLngqZl0
 K1Hb8lOSiJ+jphwHeHFiIr8qeSzpJWmITsaO3uA+pN+Cx5y0fBUJy3kKtOd7BnAoxK9QG+bIGkU
 Yyt+4Kddltq1mXkDymUIjL7HnCxfeqMKLnxxQ5XJWeWHpRTrRg9qPy8G3QQ4als6oTKvOzSW72H AYWsXO6gNunbeBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_041357_408344_D3D9017F 
X-CRM114-Status: UNSURE (   9.90  )
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

From: Tudor Ambarus <tudor.ambarus@linaro.org>


Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
Link: https://patch.msgid.link/20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..646097e94efe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m
-- 
2.48.1


