Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98464D37E39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYwhWQ9zZMnOKXaK1vSooK2Sr4WO9byJT6zo9omkZXo=; b=gp19DE/vtRvpbZD25sjgHt6rT4
	h0sxh2pC5U7djfAMmT5eZMCxgCboS4K4gbu7etc1UqO8qXITkdv+5ydjuPiYExJAf55jJ3Yq9yaFD
	ImkIA/nezO0K+wwT/LKpTx3ESTwK/xz88+8zMTqH+ab/mmfRrPkA6LPNH46WtC83/PqpPIIkiOMMD
	BAl4CuxfJ0qwLwgRBiJ0ft9VRL0yMSAI9LdVeo91S7prHLO9JPU9Ux6rDl4XbcAaWaReZ79itGlL+
	39wJRa6Lr4GiCqSWRcyzWU+nydwN2ihcEh8qOAb2lvgXy6OvVUCPwGQYO6v29CfTBQOKeBajQm6KT
	vtQeDx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gf-00000009Ued-3haw;
	Wed, 14 Jan 2026 14:17:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gW-00000009UQt-430A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso8827605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400239; x=1769005039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYwhWQ9zZMnOKXaK1vSooK2Sr4WO9byJT6zo9omkZXo=;
        b=g/T8r8JuK/ebvByF6oKQK1mfr/zrlwls6WUOSrBimxGAYCZzUUtTLad0z4bzvRSWCw
         1E05Ir4OXcxNurs4ow2TZtqrp7E3z6XQ4KdtwkM+5miHyjEDhWKIE2MnSFnANeNg69H8
         2qj4ptXgTtvMWsZqoAp45WzVUcen7RE7/9gLfCCP3UT7y53dqvNnw8Gj1+lNVBjkasPp
         FqYeV9SMBv5nVaKO1FGFONTtBzbt7cUELuJYTwQYcHXnzVTe/xBJsoHnHdc3m3Gn4C6k
         jmEii7geRauv5yp/uPDr8eHDFEI1lPE69ajHeGEdALXiD6xRW8dV0cjDy/8PPnadk0mN
         kHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400239; x=1769005039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KYwhWQ9zZMnOKXaK1vSooK2Sr4WO9byJT6zo9omkZXo=;
        b=YoVnz/SmRlCRcFBLi+nf/2i1B9Ljx0Y5nK+c2Em9+HHthAcRiN4fOdSms63p20h54V
         N5bXDbewSjFRT7SODySOmKXyfxriR9KVGBWTKngLdNQBnbLbuv5ZpmXHJ6R6yKEcZ+ZL
         e8ZUtW/zrMp78ttcCsm9wSmHYwuaNMdkYjq0fqoCw5s+f/bSQrhqGj8ebp+0RD+5twKx
         L1knDtPfZOifwdaCVT/V0Yu+dBEnlVP4mMnw6xm4n8ySo6NN1FKLxnvIvTbD798ptXNa
         Kca1xm3S0JDDEE2lmqyDhuRmJjOmX949i8HUtuLnY3caHQQiJ0oBj28MeYZcfUhC42kh
         vvAA==
X-Forwarded-Encrypted: i=1; AJvYcCXuO4X3PQTRbH+rZWHyOa5Nd1g/2vD9hAZPhhp8MiLj9PMYbUSbPFJFpwxLUHlGUCD4S104LMGRTLPSNMNrJlM8@lists.infradead.org
X-Gm-Message-State: AOJu0YwEMChwSFYNs0yoZM1IoM0YbzFHcZydY+wraPnAhTAPeUMXGs/K
	1Uewo1GW7RnG3IJjDw654iRtSEqwN3jG5+IgzM3AvZTIE2ys68FzkX6qWOUKaeclxkY=
X-Gm-Gg: AY/fxX5qXumYvRjP/yNTRlQzbM1+9wnipuHxKZzwbdT1XK81rQRPNAQeJEnFghXnomV
	rIS9gKVfyZ0zBasqrIab75n1rSPtwRyeTbKc7OLMLFGz9UZRdUrxjtQIHJ3TeiUaaWd0p+HWQCU
	Oll5RFyJQ11tmxdvuQ8aC09Ns305ICrVuAwBVJrTJa+MeagO1spgKPdhcim6+R/MC9KiPBFrChO
	siU8zymTLGUdkQakPDk8b5QNG11wOnhZa63byhO+su2ClCPVyN9AWDbazAICzki0ayfzw8/voWa
	x6sFvwfS4qUlJmJ3fcF6hs10U956TBg6vR9uSPZzh/EwOJoN7SWBmPQ86FSQjBsqapo3aPsTPMe
	wgBEU1+8+gR9hSYKM11CfmD4yIgTsD5sNW308GlR5GbMjVqaBwFrzFBgIYbr6YVYRTK6+u75E1k
	Plqt0ylrzACKrEFpopZdf7ks5VMsk1tGSWUnBK37+rclux7S/qIfCt/b97OijizHtUgXx7kA==
X-Received: by 2002:a05:600c:35c6:b0:47d:900e:c646 with SMTP id 5b1f17b1804b1-47ee32e9818mr42733775e9.8.1768400238988;
        Wed, 14 Jan 2026 06:17:18 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:18 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:36 +0000
Subject: [PATCH 8/8] arm64: defconfig: enable Exynos ACPM thermal support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-8-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=969;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=4R2WX+ZJeXKAug4HVmP5YDimNXbTtbG2dMJBRwWnt8o=;
 b=VnsK9/fLTj9mjFXQo/4xOaDgDR3JfubzIq3NbGbuODD2OJ1c6XHTPf+LI9LbcMoZ3NCIW9wy/
 IJLw4Q7eeDiAhz67Bq9hsH5OJkql4RdLF5r4fJcduQpSKMK/g4HWwqv
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061721_033788_3041BF0C 
X-CRM114-Status: GOOD (  10.16  )
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

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

This ensures that thermal zones are properly exposed and handled on
platforms such as the GS101.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7365427d98195c48e2f8065a8bb1b..1bfe37857f51663c9d745cd575f107fef183008f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -752,6 +752,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=y
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.52.0.457.g6b5491de43-goog


