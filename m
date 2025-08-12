Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBCDCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1evk3OmIRtfZwDni9+00QXZ21rdMVrFGcmbyCodTqyQ=; b=fL0MjqUwtpm/mzCxhXipMtjNVX
	OrcwJsHf1N8ey5+4+PReopiNNpbcNZhLHLzMVfcM2JjUFnTktf71joaXpmqfas6oDDedlacGAiPJx
	yH/miXOKHytfeRALHke00hJhpXpna+p8Ard5FOIgelnofjvAxWDdkMcOLYJ2/Vm3deE+yKW1Al0UQ
	LQxcj3PhmNfp7MGwOgy+XeHl7FfINHWLeyjBsmTueoqceYZ597bbyXYxO1ttjmjoVddvSW6hywAxV
	QWlfwD1xY6dY9Vzfre80NQxtrpFXmjLxmDS/9nH3izW1ryiEE1ZXZ/iLemY+z+r+raiAGVnlIdK8F
	AZwJY7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHv-0000000Am08-0wrA;
	Tue, 12 Aug 2025 12:39:35 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkt4-0000000AK0n-1lW1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:01:43 +0000
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76b8d289f73so4848909b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754989301; x=1755594101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1evk3OmIRtfZwDni9+00QXZ21rdMVrFGcmbyCodTqyQ=;
        b=DA920/cuJIL9i+wpbcs7EgQ1uNJwsDLAeMEVTd4R2cJdddG7RSTqyYAv4PT1iY/dyL
         FCstsFd1yrgpEPAqzC+hLqVdBvL8nsr/sh0AiArNU3TaGKOfnBeAwZiXPMTjunxO9oPq
         qq8+6fW3+Zgo+jg0CS6g8bcO96tXVjMsylU3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989301; x=1755594101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1evk3OmIRtfZwDni9+00QXZ21rdMVrFGcmbyCodTqyQ=;
        b=hpervjjlMTbF0DR1jttpi06w/3VZ3j/mWkem9F+bp9BjWOP5rPW4bi5QKJeHcjgCVB
         Cbb911rEl/cM9Racf9/Hf7NIdXQcsqD3eNNJVh+xsxIH55w8dMfM4QGonfqKUtdZinGc
         lLWKLfT68rvaoN3oeqY514LPr2rVsUGSBJhd6xMYTWvGGt3YjvZbiQdI8kjR01Y2HxjQ
         JpEip0m0dXLVju1G2FmqeyD0lK/kr3tJpAkzd1l1Gn5XidiPAfaWfOcAgrmubSy5NzAL
         pRb0yOVNGUPAsl9FX8o89WvwW+0GZKpM6/pNzj8oT2bT5fwBomybGTbhtgSpVHVNjO8K
         /gyA==
X-Forwarded-Encrypted: i=1; AJvYcCXtwCLfMhlELAWVYKIPPThbNRfIun/N+XtF/ThdzLstap7X4CXHnB9oAvH4dHS3UNoUCLv8iQ35Kn4tpj/AGAbe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8QBn0JEHzSa/itBWXIOjDe9/NRBe+ysj9AsIxyhnlBO1ekLbM
	Ujlezm062cD741g7U1ro5v9jqKZmVif3uOFZ2lKFzki/BL2NRba2aG/Zk71dSF9EV5B1PRc5hRB
	CdR8=
X-Gm-Gg: ASbGncur6b+YhfO6tjF6oF3Lpd53B/yXMWrQVo1smK4HS9oBOvV0iJeOzZTRehIwBN9
	OsJh+XeR8UG0iaPA9nNnpKfQMzd4N3GT3/GrKB/dQf/fTFZ9/U1NgMvUjJdA8f9lUsU+HhHN6j3
	g8H4LjVTsMu/GmvfmTjJq7IlLnxQUMJFJH2S89HPpAOJXUPC3jCS96KxVH+TY0lF8MyIlCm7aoC
	xMq4Lo1hsDgY3MjkOjhDSbIOJKAs/yWwWY41B+c0xNDeuWtB++hqn/Rw38NzYKOtFxNRMPicpBw
	jrZS9a05MmiwqiOwwB8wuyj4uE/EUO04fulATAd/GVA1rao0r/kIv7VzyFUUTe4pGqd8m2s9q5w
	bOnFH+X+fpu/DmtiCu/u7T2G0xbbR/SEgm16zy79X
X-Google-Smtp-Source: AGHT+IHXmeu6f/qQoZG8o8delXd8Ye6Z0N5pfSw8ONOvc9dDiZfBz+hBlS0QTkCIYV04xBciYh8R9w==
X-Received: by 2002:a05:6a20:3d1c:b0:23f:f88a:c17d with SMTP id adf61e73a8af0-2409aa01f0amr3953648637.42.1754989301505;
        Tue, 12 Aug 2025 02:01:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f81e:7c91:8fbf:672a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcee7sm29052518b3a.66.2025.08.12.02.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:01:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
Date: Tue, 12 Aug 2025 17:01:34 +0800
Message-ID: <20250812090135.3310374-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_020142_458718_3F9F1611 
X-CRM114-Status: GOOD (  15.57  )
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

The touchscreen controller used with the original Krabby design is the
Elan eKTH6918, which is in the same family as eKTH6915, but supporting
a larger screen size with more sense lines.

OTOH, the touchscreen controller that actually shipped on the Tentacruel
devices is the Elan eKTH6A12NAY. A compatible string was added for it
specifically because it has different power sequencing timings.

Fix up the touchscreen nodes for both these. This also includes adding
a previously missing reset line. Also add "no-reset-on-power-off" since
the power is always on, and putting it in reset would consume more
power.

Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi   | 8 ++++----
 .../dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts  | 4 ++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
index 7c971198fa95..72a2a2bff0a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
@@ -71,14 +71,14 @@ &i2c1 {
 	i2c-scl-internal-delay-ns = <10000>;
 
 	touchscreen: touchscreen@10 {
-		compatible = "hid-over-i2c";
+		compatible = "elan,ekth6915";
 		reg = <0x10>;
 		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&touchscreen_pins>;
-		post-power-on-delay-ms = <10>;
-		hid-descr-addr = <0x0001>;
-		vdd-supply = <&pp3300_s3>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		no-reset-on-power-off;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
index 26d3451a5e47..24d9ede63eaa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
@@ -42,3 +42,7 @@ MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
 		CROS_STD_MAIN_KEYMAP
 	>;
 };
+
+&touchscreen {
+	compatible = "elan,ekth6a12nay";
+};
-- 
2.51.0.rc0.215.g125493bb4a-goog


