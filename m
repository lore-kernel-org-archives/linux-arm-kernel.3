Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0651ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QamokhfM1GcyheOMdy3Zz4jkOrdWtl4wsYSaEK3Ivkw=; b=WFc508hmezGuhb4U7KRMUGWiwE
	IfA8HbmdcQ0Qy2JtPdnCp+s2+G2NlZZn4lynGhkQ4YTbtiovp3LXmCfZpT9z5Xjt88uUy5VlGLmJJ
	bdllz4BmSd+2FbZ2qBJa/0Ln2T1QAnKLQZ1e/KK9X1BBbH/UMPIS8v3m7bGQyNFF8S5wmEHlGlvea
	yhdBGib7llRMhu6qqxnJUR4dh51657Lmd3Gi5vdycm6IjqfEHLBJvPyTLCdnXwHfbK37XNmekb2Hk
	wJTmD9SgeiaVZiXfjijRh6zxTe5oOAFyCmwwFHVFoKSocylj7QWT6Prl1Jhk3LPAPlUKg46tDbD2y
	m1MCMI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0sp-00000007kxN-0v1n;
	Mon, 18 Aug 2025 14:30:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0mU-00000007jq7-1l7U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:24:15 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-afcc96bb64eso74034866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755527053; x=1756131853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QamokhfM1GcyheOMdy3Zz4jkOrdWtl4wsYSaEK3Ivkw=;
        b=MQFt+ALEtLXG9+ucL5K1b/LU5MPLG5SlvfSWc8PZt1UGls7RvaAwjnZZoCvg/Gafpp
         8mKDhkBn88eo49xpeYyJ+QoWxwOh+tWaKnulRmZkq9ymaYZJbpTR2PpEMnJZrFfKSGnV
         aM/B0NptgDFDyByJEXmP4XYnlnAYZAJh9NaGrlfPGEgORkhEVN7dAQQ79YeWdeCZqH8T
         inRiKdKgRi+HN30ZZDwwNX3dFhVVk+wYdonuAxLamAkdMLM6u/mggU+cnzEh/M8qeWwJ
         m7ofZFQv6GT5nmwIxCdGseLYXzmvMEWKPGHOJKSQnovwXcJmo3rLh/bDtnZkNstv/je5
         GWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527053; x=1756131853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QamokhfM1GcyheOMdy3Zz4jkOrdWtl4wsYSaEK3Ivkw=;
        b=O2L6lDVg62MEOat7OliJGDPVqqPX8nHt1oRzyD7B/ToJiWboZdIa07Su27nEJJcUi4
         UsSe+Nv5R2kcXAmQ0JLskJ3bzpOJfKgufDw28CIzyT4WOe4cPs5LRiv89M4gt0FlCWJh
         hrtgehqcxI211nfKJVq2mzkVU5MqGc58dYT9bA1EoqTZFvcYDDc7kdZVN1SoB18ZwK1A
         kQIOXrPykot1DQ9CEwnuqSgtGqHTE3+ZgR/Ts3pmJVCLKvCP0gIlgFjCcwHLxmm/UPT8
         Mnx+aprf/3X/4fKnjGppSA6m0iBU7qYQ+pBaKCR74Xcp+B5/Ho8X0lFo96aKXqiKppaq
         D4MA==
X-Forwarded-Encrypted: i=1; AJvYcCXGknKHw90FywqOxE3ReY1jy7hAHC/fz2jQpYDwhOBjR6SgvwH4eTnW5siZdeiUXhnpcavHCiIT35/4Z8XJaOpy@lists.infradead.org
X-Gm-Message-State: AOJu0YwarMGiHdT21yPPwbfzce2MeMQeIVy37zySmoo8hg2Hoe9aKrMs
	Qa/NjAnrt9yZIywe1KqJUbdobyTwER4mf5yLZ8HEJPnY9sqp1Is3kGnsMdSW+e0ZZf0=
X-Gm-Gg: ASbGncsASuEGo0V1wQbwbEZYznzldksZ3URCvxt09+m4WcY4DFM+7cWe00IeQnz6v74
	Vt5YC2ubNrDQ7BlqebX6+bLGN4x1VaQSezJM++sXAalN3RB1u/jTksOEzPNiTT+P8p/kJeMeRfk
	fqXWPHd49QLwr65C68DJksdUaHEo7sIiYWED7yzsCtF9VGHi0E6X+q3dMe+1n98Ftf3+FVOBp1V
	C8VeROyksk6AqqhqVki6IpKC/y8Z+lluW+DP3K8eyEn/vdjTF5PJtsq2QjB/ObR6FIBiSFuoLAt
	hISbRAdOq7AV7ipTZwCg4EyPDMRf8v2d3/GWsYMilK3TfVt9v9KKlNeGjbFObeSE9q9aVLiDwV8
	xXwfS4TUGr9RzJ5dIUoja690OAmBpwucu7g==
X-Google-Smtp-Source: AGHT+IF0eQL4ER7n043LGZ/uWkPZXG/pygEg35URndrpoalaoUz4uPyviRVbuOk3OWfAjWq8XjlDiA==
X-Received: by 2002:a17:907:7fa7:b0:af9:566c:4cd2 with SMTP id a640c23a62f3a-afcdc2367a4mr462998666b.10.1755527049798;
        Mon, 18 Aug 2025 07:24:09 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53dd5sm803192366b.5.2025.08.18.07.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:24:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: stm32: Constify static 'pinctrl_desc'
Date: Mon, 18 Aug 2025 16:24:03 +0200
Message-ID: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=840; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=GQ5ftdYWjc1ggmTXk0Nbj6QK5jviPLomx0fpZtjccPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoozeCHbXUKSjJp2DSxgX9G/1zAJfSI1ztiFFmO
 GadvdBbwOOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKM3ggAKCRDBN2bmhouD
 1yoED/4kiZrB9q1OBGXP/IDolXlLyozFqO4AV9Emhx7w6pECE6srTXNW0Io7CnrMi0NzZMG58Ok
 fm+15O1C8b/juIQEqd21izzXzrGo27C3MZyD0BRrXqiwig7D2md0Om36cPq5qhacQ/zDmTpqwre
 RB3kZssnYEetCx0yNNlo+4FilIdI73HUOLBe7NjhjdgYyinQ1CUFjyQBrIkfunSZqcBZezmsQ++
 D0K40lIyY0h5nBjRIKpz+x6o7wDitTdHR41tBju6dC/iGlvLJy+EEOpTTi8OuybUdMZTjyXH+AW
 v3l7+uSupThYNKmIPHmI+dgJTg6wYmF+RRwgTwlKOIVSkrjSK0qlmYJxDubNzMVhPGQtLju+zZf
 yrapLhuKFH6b2QE3QQigfWAWcilF9rdt7gD/mr8FljvXYBKtQVazVxlky4pZWXtJnk0acqX4+bu
 JRmGZ08gufYi08WEAQ4Fbq4ef0x1HR4/6epHh6Kyf033ep138BhgWHGz5jinmmwQmCTJPowT+Iu
 ZRAS5U1JPvwEAQHEQsFTMttnyATQyBPYpJ7NZiTc+QJMTnYhxHhQBnpIrcUZuQ8gjf9Aw+NoO5s
 cCDK8474FZvZaoSSTtwZPWx9SuZLQQmpjUT5Yjad3ZHNO4LYiv5uT/wfKA8WZczUAJ1ziod5OIU fbYKk48w9jEUxLw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_072414_459935_69581084 
X-CRM114-Status: GOOD (  12.75  )
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

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index e91442eb566b..0cd41f3f7a52 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -575,7 +575,7 @@ static const struct pinmux_ops stm32_hdp_pinmux_ops = {
 	.gpio_set_direction  = NULL,
 };
 
-static struct pinctrl_desc stm32_hdp_pdesc = {
+static const struct pinctrl_desc stm32_hdp_pdesc = {
 	.name	 = DRIVER_NAME,
 	.pins	 = stm32_hdp_pins,
 	.npins	 = ARRAY_SIZE(stm32_hdp_pins),
-- 
2.48.1


