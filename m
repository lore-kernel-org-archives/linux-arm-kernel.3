Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E2CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ur2nzdK93Gujnnrr7/bhg1o+Yu3Nd/Uvn3Pjsb5/zzU=; b=liOBaPdMVxbHgh4J6pezvA7hA1
	hlOl2UAofyKvu7+tLfm7xQ+8qGJAN+fmoviowb0/aNXCz5lbXCBMAkLml2nlaFKHiJ0qhkWLqUUis
	1DW6kw4Tt8H+aXH189KjPs+NbrdGR9pxH09Xms9GONK/wuB5/QeO64CCIVHKW4qaTgg0kIFhdfvMr
	pr+cIIkG8wWXyKoukyNG54Pidm26GRoN5uH9ZMyps993sjFCyllSIgCFxRJcjJmOOo8MndG1Qj2RI
	wEkEkX9EiS5pPwplEdFdnbvRQtpaHnbkttp1LS3GTDTjqhcU5aYhlzsRU0xuYScvIn+Sl8XrjAB+n
	LJpSh8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofG-000000067I1-2dL6;
	Fri, 31 Oct 2025 12:55:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofD-000000067Hf-45PF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:55:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4710683a644so19546525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915330; x=1762520130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur2nzdK93Gujnnrr7/bhg1o+Yu3Nd/Uvn3Pjsb5/zzU=;
        b=UbqrCQq+uRamdF8Dwj6EZ2tdtN94SgAdbdB1hmC1v2i2rLMWEw+eEdPL92OghyNHk9
         6lIjRB1yWPZo6lwv11u9RCK9WIvgtbcJxxgA9GVOvx3PgglJfZA6SoLgwXcTTWMqQw/X
         C7zxAqbZKzjqo95+hgNIaUvibCxLMFrZk7JMTVtN65kbfIU04euFuunU36S89/GBHMsr
         JNZRSxDay+HMKWbr3HEZ56jKw1ZgC4F65dgcvoVDOYOFWBHLtxAWjZ2ThQnVi4xiqoaZ
         adwyy8eMLJGCjob1v3mFeY6G0BAXStcLAm7kudTxQysc1nwlWWUJbf5e5b4DsC4x2Yw3
         Uc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915330; x=1762520130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur2nzdK93Gujnnrr7/bhg1o+Yu3Nd/Uvn3Pjsb5/zzU=;
        b=w97s34HWwqiQ19eglBfZR7WQmsaJ2dfWuT3JgFFgAdGPPhD7NViwX8CpFTo978MWK4
         KylXICGB/KDDr/Y2jGxdZNa50zv/jGnquXpUlLlnQG7FDdJ0QICqcXAdXSF1zd5JMMJ6
         +FUtUncHOKdKkBqIuBaYET/CL1KEgsdpM9kyY48l/W+1NqQC7aVM7KomezHoQX6boOvA
         +odsaos/jcF4vvlkFDGH0lPJpXwrcACYo6sVIC6eZWL+0JlI6DeCei0j/PT8XZkyuDA7
         nhqlPmXcwJzCororhHm+Ak5U8wQoYv0DFGqT7oU/n7ggfhOJmg7Qtk5MqMGSlehCdkrD
         KP9g==
X-Forwarded-Encrypted: i=1; AJvYcCXj4A+1HYXHtTMGipfUY+JZBczep7cjJ6ryUPD6kqmqPjGMZ2k3DPcMZUwBebdgKaxipDmsTac6hLEM2eRVQKOv@lists.infradead.org
X-Gm-Message-State: AOJu0YzWi/zhzv8tS5RFf/OubDqWPD+Z2j1Z4tF6TARY2bSQpoyLtIq6
	WysGWS3PTP180p/GzvdsWDVfQDB+GWYRgEOV1+x5bjQBw7qbwlJ/6PvM
X-Gm-Gg: ASbGncuUjdVeXeUTOrsdYJCCrYpLAFDGFrcJFpCdgd5pvskTR7sz9b95y2cxfr/a6Y8
	bSS3L6MqkuLYxcDRtbhU57m3IveEIy5CWH4EzNqsjzFRrRGe1bKCjLZOp8xlN/ZhpNEr4Hr//3M
	stSbw0R1T9qe+ocTwSkpNkm3WbMGRh3DBO24A5djO6WqzGqUgeow9OJ24THZ5KpmenApUjcIZbN
	hTx79RWEwVJiGnY9hqVFnM4v2W80yDK8P0mAAi8k0M69KA07nHahYIBA3i6vtV1PZQIfb0RkXIT
	MqXPHuGOo9hKQfh10M3Zjwm/TQR+Eto3kgYGL0aXhAqxu5NdCJnfh9JwjiwT6cMm/zN5w2LTVE8
	zlYx26AInxdzPePZbA/op0kP6DwuWFsXyiH4JoeMBWytLKxsAP4dLFQoIbkBzOcRkBMthdt0juR
	nlC6v+8X2MZ2VlhawSZs5yUlGgqQTSS3iNyCTAw7WuWBRbef40IKUJqVLlPgfGWNBtvB0900h5a
	fROhesAWWiBNaJJ
X-Google-Smtp-Source: AGHT+IHKkMjFYDq3sA/7iAVV6Ds+dv03BvTAXq+xvomUp5eBrJogf0XF/TD11Cyme54hAMfPd6Wl0w==
X-Received: by 2002:a05:600c:c4a5:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-4773010641fmr38615415e9.13.1761915329775;
        Fri, 31 Oct 2025 05:55:29 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c54efcadsm99111f8f.5.2025.10.31.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:55:29 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8qm-apalis: add pwm used by the backlight
Date: Fri, 31 Oct 2025 13:55:07 +0100
Message-ID: <20251031125510.433175-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055532_051101_3998A3A4 
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

From: Max Krummenacher <max.krummenacher@toradex.com>

Add pwm node used by the backlight output pin BKL1_PWM and
reference it from the pwm-backlight node.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi       | 5 ++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 5 ++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 5 ++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi       | 7 +++++--
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index 311d4950793c..06790255a764 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -109,7 +109,10 @@ &pciea {
 	status = "okay";
 };
 
-/* TODO: Apalis BKL1_PWM */
+/* Apalis BKL1_PWM */
+&pwm_lvds1 {
+	status = "okay";
+};
 
 /* Apalis DAP1 */
 &sai1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 3d8731504ce1..7022de46b8bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -196,7 +196,10 @@ &pciea {
 	status = "okay";
 };
 
-/* TODO: Apalis BKL1_PWM */
+/* Apalis BKL1_PWM */
+&pwm_lvds1 {
+	status = "okay";
+};
 
 /* Apalis DAP1 */
 &sai1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 106e802a68ba..12732ed7f811 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -245,7 +245,10 @@ &pciea {
 	status = "okay";
 };
 
-/* TODO: Apalis BKL1_PWM */
+/* Apalis BKL1_PWM */
+&pwm_lvds1 {
+	status = "okay";
+};
 
 /* Apalis DAP1 */
 &sai1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 86d018f470c1..66261c0286d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -18,7 +18,7 @@ backlight: backlight {
 		brightness-levels = <0 45 63 88 119 158 203 255>;
 		default-brightness-level = <4>;
 		enable-gpios = <&lsio_gpio1 4 GPIO_ACTIVE_HIGH>; /* Apalis BKL1_ON */
-		/* TODO: hook-up to Apalis BKL1_PWM */
+		pwms = <&pwm_lvds1 0 6666667 PWM_POLARITY_INVERTED>;
 		status = "disabled";
 	};
 
@@ -799,7 +799,10 @@ &phyx2_lpcg {
 		 <&hsio_refa_clk>, <&hsio_per_clk>;
 };
 
-/* TODO: Apalis BKL1_PWM */
+&pwm_lvds1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm_bkl>;
+};
 
 /* Apalis DAP1 */
 &sai1 {
-- 
2.42.0


