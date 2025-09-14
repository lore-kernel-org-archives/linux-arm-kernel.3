Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F49CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=; b=w5J5UXW0WPBI5S5TgI6nOTSMLr
	+7+DFB4XjeDYpiFQ5Shhk0MlyZe8+N5G5y5TG7d+14duWoepHW86dpaeVfyWefVydmzr+xc8lMs+C
	EUW2Ur44BP7GDucogYomoLAA4VgbjwWENBTvACql+apmCspnvbLKefEZcJwlXHhxhJsGAQO5ICQH/
	J2kzl8uyq4TFMEpKQ8kvCSADpiYIh6GC2yhH2O/t7nCSvhPSI82FvjMaCApG9Zhy1KjLwxw86ZQHo
	hb3vUkXqyfN13hwelqmG+memdGrJSFpyuscmSJbTLIMMNL1OTXedHECl2Qx6lobOMbDCyI38DSsa2
	uN1g1VlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYL-00000001TjE-1ooD;
	Sun, 14 Sep 2025 14:18:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYH-00000001Td9-2ZVd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:18:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so1577212f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859480; x=1758464280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=j/Ub/8ZhfZool3OgCv4the35MFOZEzIqAeTc8KM5UmhHFz8qi1/tWajP4dSgvnWkIV
         AvMKOo0bY2CrCJ0B8BYlBNDaaxBA9EaFW/PDfl3UcFVajTdZvzdan/i3Q3E/W6IY3XA1
         z1hCy5O+HE3H6yNjfuwgbM25wjl5F5HR3jM1cJmLkIFrASs6VuhtNOIsQvKKIhbMc2Vs
         VnPHMQSpq6J9WOIIQlhsUXO2ZR3nHTqpsEG9THhStmBI0gm8jrscrlFFrBBoxXD4GWcA
         Xznfbj//ZjDgHuGIlkY3Z6MdNY395Q8ADuqQVKgBG2hE2Z8mTfnUqHPgtIl2NN9DDZGK
         UjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859480; x=1758464280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=clUy33NeFL3LVrD+57Efk+lLOkuUQIdQme1Vrg8ZWCkZh9uArtjuqx5Rn2cXbXE6X5
         gWW0xgBxxTcbRxlowR/MAldJgBPboT1pBH2iPbRFICW3w6wBTvY1XXMgyCEWCrriKlIO
         g2QBDRJgfKclOrvc1018skjj/xBCoE/MUmHahGvc+RuOEX2dsp9ptAnz0t3SdiOM1SWS
         8ERJMlogAFzYNCX6C0LqyQgqzsDcffK5fhJpy0O4256QEBOONUOEmzkOr/5j3hm2pL6v
         vFDXAz7JSizDY0qr9DE0NosklEEYJNOX20l6t8UtYTA8yaP/Zu626BYNecilaER5ln4G
         ey9g==
X-Forwarded-Encrypted: i=1; AJvYcCUDjMzGwjCstGnwDlgMBrb5RTpuKcBKLKeDbBHYfNE2gPP+Qni98dF2kB3KbTtQEksabWKb6R1Uvh5UbXnK0FXE@lists.infradead.org
X-Gm-Message-State: AOJu0YxQKF7pTAjH3t0G3jY5TjOKV1bCGYUD07KXg+EfLBiQuxDE9Qri
	emsb1BxnQbTaYehtoSZN3aXDwoxcqwbH+kNHjX/3v0HcVg+tHRUstBlM
X-Gm-Gg: ASbGncvxtHYmC7rIaBQ2ms4tER2rVIGBiIYUfcCgYb91rEkMOVeUHHhcK9l3d4fqmzn
	V9QGv2gRomngVB4mDIjDEMlCBhXxK5LqFrw4U4Q6SjEgkUvg7SKuf4XEfBcciwy9YdKPSmjXaZn
	QD5etVWGpGqECOsEzKYDQxS04BemAtoovLZc2NlnjaW9h5PqOb4aOd+yT7+bDVMB0l4vaORDd0w
	IKkJ6R4SJdH+/oeSSC67TZ0oUUyGFKnIUp4kcXkk9V+C/buQr8rz8iSi9RNubKoKt9T6nO5CFRT
	QIlQyidvTIzcx+LqsRZGGdv5UhUkTjuTgJ5LXg1AnyUD5OBULx3U9isdCS1B6uSo3SP5a6YiK9M
	04clLa6nJzehc8KxjSoMuqV0SZmwB+AUPtxkOt9f0VOvWTyfiL/QreNecVH/1BQqhiydEuDUtQc
	ZvVVInoUjQ
X-Google-Smtp-Source: AGHT+IGob/FXoyz3+A1gJIBnwRTgWRN15gu4QTGHa/hPMhwPvI0q1Q0NHBycPN6rl7zOaTPDOVjCoA==
X-Received: by 2002:a05:6000:22c7:b0:3e1:1cfc:ee90 with SMTP id ffacd0b85a97d-3e7659c4a5bmr6355341f8f.30.1757859479650;
        Sun, 14 Sep 2025 07:17:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:17:59 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
Date: Sun, 14 Sep 2025 17:17:44 +0300
Message-ID: <20250914141745.2627756-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_071801_696926_4A675965 
X-CRM114-Status: UNSURE (   9.58  )
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

The exynos8890 SoC features two dwc3 controllers with one USBDRD and
one USBHOST controller. Document compatible for the USBDRD one.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e90640320..2b1544baf 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos8890-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
 
   clocks:
@@ -209,6 +210,30 @@ allOf:
         reg-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos8890-usbdrd-phy
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+
+        clock-names:
+          items:
+            - const: phy
+            - const: ref
+            - const: pipe
+
+        reg:
+          maxItems: 1
+
+        reg-names:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
-- 
2.43.0


