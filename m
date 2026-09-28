Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEFCC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=RRs1FLWuviHqDWXJh3MG0fOcB+
	njktfkved34dmDg4DjNbOabi9qd46yRfxHukahdWkK0E6AA8M3CItFI3OHHz7xvE4G40pXw4X15B/
	4KhUkL0omIvT3tnkOE9pciVR4banYCS9tU8R2xkUN3o4a9Piot613Rk2wPye/8jNH/7+LLUuuvL7B
	unuEQeZQ0vq+5ANUcrjNo6lT3Alx8UIoSuIR0JSDawIpgMB238wa3vDLdQUSlhEnjuzYnHPaV93lV
	63gZLb4dDO2hBvmPKHXY0gNCeBi9ZzvCeuMpUJzlRuVrOVTF0mJyrSLsv9myDXIyPx5MPLGfkRVYT
	AqLj1CyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBpX-00000000iUz-1x78;
	Mon, 28 Sep 2026 13:55:43 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBpN-00000000iPf-1jpF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:55:36 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2af7721e4aso384132366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790603732; x=1791208532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=L+pGDReK7c/z7bFzOyu9ByGR/LZCa8W94cKIWdQ0XJ7iJjduL2zKIhu3iiC52xiDO9
         l+gUiEqn0OhR073HpD9Too65mmAQGoZZT4hmIOpE9Y4/gF6oBGcGQThXSr8LTLxoOjMS
         6M1mGv3Ak7rtQmizLvCJk01pIGW1qIci8fT7dBVzyIsUiBIRDaq+7Glj+Tk+IibsmfAC
         0rF9VOKlgEvfiWIHdeCHR48TC7GXJa5eB1c8zuA6f4x3cZVtBcHIny6X7sZ9WTQIs9nu
         CRuAd8Jdd8Icvmfc3TaBhqrg/IuGm6OtWyoroCm929lzUWbAlb7fTFfj/UMgNk5t1xUD
         LqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603732; x=1791208532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=QnyEsS6d45daTNas/khz46NWRG/FGpBtCtMwHgINnifllAU0awp0FZTHxx/km0D+h+
         kbxYUI6zHpf8u6HWS32kn970OtDm0tScTnYOjaFmlgjPFdVseUN+byo+a8AS4zZd38+t
         2ejytowPAGBXfc7kwGz75yjrOyauR6Q9d061X3hnV0ld8rnZ/2D2dyaUfhAe7x0vvcFj
         2rUJbFh2/preBaO0vxqzcfAnxDjQiSMZApvRj6c3d7xFFnVi0rX0K6w6ndFEsb3eZHe8
         eRUoGFuZtsZPy9ttX9EhEhdlRkffVVrDt5idDxA/yqLvB2scPJqwmOMdUFzzWiHpaQXs
         oE3A==
X-Forwarded-Encrypted: i=1; AKwUvBwbKMtbBz8rtncQbg9SWjc3g+YLDhLkqw8Ig+iTorkhTn7fsHhqOBfxJCktSCoqjGOg6PfKEZhXCeWIOh6NMoSe@lists.infradead.org
X-Gm-Message-State: AFuF++mL0cFbj01Zpf1VALrnzCOqWNfQPx5kqVsWupWTOtmXToXpgEmH
	WVTBQxVzdUcUV9SILvRhxsfZYcDqfbC60Z/1H7XnC0cQFBoDZQIPw50QhvEKqFoI6RY=
X-Gm-Gg: AYBFou2Q/V3FWokjrE2SuaeonbgpgLYo5XeHls555yx/cRfsk3GmD/xCL6dVS6SQ1cL
	otdysIJJ5rSYOa7ip77htZ0cfM6uDhvhLtTjbKqXa719/YZgL6wZnTq1lgHS7phPzjyGvJtLksV
	I8yQzcJQzYfOBow4VQzNwggGUMtGORWy6L8WZTTjcUfhIFmXSrvkQgKy3+MwRBVgP4T6DtI+XvL
	c0HWWpEiaEE5w2otHm+KK0VqNe+urHoGpGS1a4KE0hi6KWNoKUZZxVVOVSHcbfXMkmEMjZxabvU
	+GJRPk/bBAwRpTU4IpEffAHnc3DpEV9udSpm8/1UAee8/9slrFhPOM27ymA0uGaCkyTFEvq1S3R
	QKQyNkvAFwR2/vyaObuIw0phne+fR+VPqvq3PlioF0fDs0xgplUC42AjZeX8RwV3j4LXRw8g2k9
	Hli9p6zkLtCUA7BBD1zKlRu2Qbij+9gvdFz2HedguQlvRExRTrG62W37o7FaER2vrPzQSK0g==
X-Received: by 2002:a17:906:730d:b0:c29:4b79:e417 with SMTP id a640c23a62f3a-c2ac240e791mr1124305166b.16.1790603731805;
        Mon, 28 Sep 2026 06:55:31 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc9a855adsm232416866b.60.2026.09.28.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:55:30 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Mon, 28 Sep 2026 15:59:02 +0200
Message-ID: <b222c0aa1c77564090d3c783cc79baf299b5d59b.1790603500.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790603500.git.andrea.porta@suse.com>
References: <cover.1790603500.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_065533_490872_9FBF3C36 
X-CRM114-Status: GOOD (  12.50  )
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

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..748be8f1ee9e2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
@@ -94,6 +100,12 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_pwm1 {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..df4c2d09c8d34 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
 		clocks = <&rp1_clocks RP1_CLK_SYS>;
 		i2c-scl-rising-time-ns = <65>;
 		i2c-scl-falling-time-ns = <100>;
+		status = "disabled";
+	};
 
+	rp1_pwm1: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
2.35.3


