Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC792FEDA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bd47LJ2tcZUp4fxKJyryk+1k19iRlk16WHTGOaLdME=; b=E4jGqBE2I25PTYgpSJR4pxHlCW
	zteNe+3jE4Q3fJ4huJJjIW1eMzG0esKz0APwJeragvcdcGdyzy88FSh/2SvgPr51Il0B9d90rNcH9
	Q4fmEy6gGExbv2DLjFGy8ZI2dPjp6opNfP/jtGDhWOvIS9qxZcqgBL+Jorz2CV3Kq1F/VlQ6Nh6P9
	kHQhFs3XQ4eodoIGtOAjYmb1FEU/zakuByzOl8vVhD54hxLdo6aLWyErijyGQgd9kdS9VVAjJkeix
	xyDk1KU0oInHRdbnaUpVD8UR234+DdOcZ8yzOarWXQhMQAhka0ZojsOYtyB7m6UBDPTf6PUXEmf/I
	cnRxwjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQl-000000074Wg-1Q0I;
	Tue, 17 Mar 2026 18:46:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQi-000000074Ue-0h0i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:46:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so43667775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773170; x=1774377970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bd47LJ2tcZUp4fxKJyryk+1k19iRlk16WHTGOaLdME=;
        b=SlZJ1w+4l6Izn//OWLL4ZoCUkUof4HPFouvFVxHoKDw02/rIn6/amZmJ80qVnLlLaY
         pyhpd4uj89370zxsDTC5F9th4QTJbut9rYJroNrTGniEXY4qTt9QP/boD4YefY6+f2ZN
         L/x3lSdzrnCkah6xtDZQGUEOp4P939N6OJ5i31Mg3DEJWKC4MR7ND5Ts+nCVsI57KKZ5
         Y7jVgcc9Xf5edMjFxkuDE2y5XqWXleBuBZ4aBSxqAJaF9zyI9SOtykusolFatcLGOKPq
         19vEK4QfCgdeFnSJGJY/ZAQseWs388YJh9csupjZZbvHWwHRL9kok72GkQdn9AnY2eiD
         mkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773170; x=1774377970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5bd47LJ2tcZUp4fxKJyryk+1k19iRlk16WHTGOaLdME=;
        b=JZvnVAGjgfLlvqSUghcaKUQVAvAIV7U1OFF7BG+rZFwVWAdUPDWZr4toq9w0QxhOw8
         jQLZrOEm+eGzKe+qhC2xvMUz9FfPwR1Qc8z3LuT8SqPhDaAdc4tmqTiLnla5Lke3S4Ds
         3JvdtkH8ioxfE2wNFXPl0QJdD3LioY/flVxyNtZN6qrqLh2o7L7ySrmrH6Guk3rWGbVw
         8zJqsZmp1eOfcgowrukh8EzJUXN86zq6dtpQCXIWIEipt5c9x0z5THvAs8rAGIonsBIw
         xPC2PokrX9gKrhYoW73+23IYcCDOQJCx3+jHT0bVI3mG2w4ifCBIyEnx+8YU6qyXN+tL
         uqew==
X-Forwarded-Encrypted: i=1; AJvYcCX7VQzY374Jy0RXFZrqn6WFki9dYBKLWBnoM1ou5h+2OdE/ZtTnZwL0Z82kgpNejdlkm5fQvKKqPLucFlP6/Em3@lists.infradead.org
X-Gm-Message-State: AOJu0YzhPO0qu71k925XHGDRTnoTexvztsgI8GbnpHxVlXrtZc25nXo9
	eEPacicOmDjYiQ6LiQqc2P+cqgBe7JlGXnWhrXv/lypA2vBxOfbhjUAR
X-Gm-Gg: ATEYQzxiAw/iGbgETwUi6rmSpghwbWAd/R200CRic94/CD+qsW/wWEfXxWupz28PRnY
	0jmayV+kbn5F7IA3qK/yoPlU1rRw7TLl8OCZ49bbNjABxW286MTZN9F7xcRa4POMt0OGYvaJQm+
	vkmTRmDUlvrMH7jNN7Lnlz6DCrbDEW8jCNWqBRsPTUHhtogc4ZzgnvnSYgSLGFD0XKBCvTyScEQ
	Z2VfblDocVj02eo4bD/IkXA2kUKxk6TBHtML+JF4yZR1uazfgiHZv4mYQBSxXfRQriQXTt0F6hs
	4H4z1pUV+Z3k7EfbWiAYFWEli4eTXv8xw4WhswTISRjBiBjNPqq9cCe+rIZ5191HmwdUkuwAVjw
	j5F4HIPkm4tONmY0I4sDfNzdF87qJglZcBMPxzqhqe9EQt98OUsYErPysCiXHN3OWr2Liaa2HKm
	KvHByYMoivvgBp0c/tlSk=
X-Received: by 2002:a05:600c:348b:b0:485:4552:8fbb with SMTP id 5b1f17b1804b1-486f4457d26mr10995495e9.22.1773773170348;
        Tue, 17 Mar 2026 11:46:10 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:46:09 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 4/9] dt-bindings: pinctrl: mt65xx: Document MT6392 pinctrl
Date: Tue, 17 Mar 2026 18:43:07 +0000
Message-ID: <20260317184507.523060-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114613_136359_BCA17E45 
X-CRM114-Status: GOOD (  14.33  )
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

Add a compatible for the pinctrl device of the MT6392 PMIC, a variant
of the already supported MT6397.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |  1 +
 include/dt-bindings/pinctrl/mt6392-pinfunc.h  | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/mt6392-pinfunc.h

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index aa71398cf522..1468c6f87cfa 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt2701-pinctrl
       - mediatek,mt2712-pinctrl
+      - mediatek,mt6392-pinctrl
       - mediatek,mt6397-pinctrl
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
diff --git a/include/dt-bindings/pinctrl/mt6392-pinfunc.h b/include/dt-bindings/pinctrl/mt6392-pinfunc.h
new file mode 100644
index 000000000000..c65278c8103d
--- /dev/null
+++ b/include/dt-bindings/pinctrl/mt6392-pinfunc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef __DTS_MT6392_PINFUNC_H
+#define __DTS_MT6392_PINFUNC_H
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+
+#define MT6392_PIN_0_INT__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+#define MT6392_PIN_0_INT__FUNC_INT (MTK_PIN_NO(0) | 1)
+#define MT6392_PIN_0_INT__FUNC_TEST_CK2 (MTK_PIN_NO(0) | 5)
+#define MT6392_PIN_0_INT__FUNC_TEST_IN1 (MTK_PIN_NO(0) | 6)
+#define MT6392_PIN_0_INT__FUNC_TEST_OUT1 (MTK_PIN_NO(0) | 7)
+
+#define MT6392_PIN_1_SRCLKEN__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
+#define MT6392_PIN_1_SRCLKEN__FUNC_SRCLKEN (MTK_PIN_NO(1) | 1)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_CK0 (MTK_PIN_NO(1) | 5)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_IN2 (MTK_PIN_NO(1) | 6)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_OUT2 (MTK_PIN_NO(1) | 7)
+
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_RTC_32K1V8 (MTK_PIN_NO(2) | 1)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_CK1 (MTK_PIN_NO(2) | 5)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_IN3 (MTK_PIN_NO(2) | 6)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_OUT3 (MTK_PIN_NO(2) | 7)
+
+#define MT6392_PIN_3_SPI_CLK__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
+#define MT6392_PIN_3_SPI_CLK__FUNC_SPI_CLK (MTK_PIN_NO(3) | 1)
+
+#define MT6392_PIN_4_SPI_CSN__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
+#define MT6392_PIN_4_SPI_CSN__FUNC_SPI_CSN (MTK_PIN_NO(4) | 1)
+
+#define MT6392_PIN_5_SPI_MOSI__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
+#define MT6392_PIN_5_SPI_MOSI__FUNC_SPI_MOSI (MTK_PIN_NO(5) | 1)
+
+#define MT6392_PIN_6_SPI_MISO__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
+#define MT6392_PIN_6_SPI_MISO__FUNC_SPI_MISO (MTK_PIN_NO(6) | 1)
+#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_IN4 (MTK_PIN_NO(6) | 6)
+#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_OUT4 (MTK_PIN_NO(6) | 7)
+
+#endif /* __DTS_MT6392_PINFUNC_H */
-- 
2.43.0


