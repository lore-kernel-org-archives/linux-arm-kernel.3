Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F81CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=; b=jKLSoFu6FSp/LQ335SHNxG0uvk
	z4d8nQHGTpeIk2Aizaz3BTS6GU2HoQrqrFWQfWiMyJ+chxCpRysv8V8mBTqZ3r6Exz/pN2P97t/Z/
	JPFOUGQjkDE91+BWqvSDcS1ILYJsAz8OH9lXABT62E0x8bTHVgnkT+8ykOlhGy5ToUBaE0TkBgH0c
	OrP1SHCAqz+Xts+fLnN8pjXNQq0n7bbIHn/85m4EN11FoHqXTU5y/92Ouroaa5wNzXv5tvSpbnS4/
	2xmmY6zjd4e7DZD/wpQvNlvcM4+VqFZzYC0dUmQR/te1vOpYzjL3oVCDkFC3d9i8SgRp0E0QMaARx
	C+aGj7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYK-00000001Th0-020X;
	Sun, 14 Sep 2025 14:18:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYF-00000001Tc2-10xF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:18:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so29836995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859477; x=1758464277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=bZPSKWbapmeaGsvFSgQJJGqEBJDXBT74gb/ZXKQ4PhhNBI5mYZKm0VcOz6gkMCGTHZ
         mmSVzMfOUem14vGcFWMFRu/p/br97a0RIijV8yVgqVjmkU6PoEhhB/vXCNOn/iWnqbcb
         70loaXgTcFUYXd7qR9G9jJJER0MYiDBX2J0TraMusiWpe5xV4zKAh7/O1c+HI3+PfjpA
         Fg/AC1/yAiAUGF9Le3zccDNE6AViCvcJ+gEZTZsnwdQK4M1NzO0B9qR6T2yiFLLSdNij
         3jBzbqR8TM6i4z7gEIUrRhV/hvo/gMi4WUBfsCCKDiSL04eDOFKIfxYNCG0DqRLmTz/p
         Askg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859477; x=1758464277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=bp5nnjgFD73bZ5rppEN1i5LwDhOXgBt6AcRBhDaDNYT8xtoBWCGe8nKE8rvoeso+UG
         WdLg8JDewAjfDKagRDzXqHYP/q9goQ8lMZX+dzbjE/0jFqUVQS7Q2R94e/QFOfDJ4Shh
         thBJ8gcciXk9nksuELY8PaSJ3IldPpcs7BXb7EZHdn8BnJk3tamY283yoJKBJxPksNcg
         zRsoLOlRs2I05gWd6sCowsxZRXUlHDk/PHSktobk6N/bgZNtJPxSfSQsLTnhLvoBPt3s
         LF9I2f++fiaLzsiLTxWKP/jZe33kO+KRgx9Ar1MDSPLkrIOGl3EGSERXUyOOzI7Qo5GB
         nfCA==
X-Forwarded-Encrypted: i=1; AJvYcCWwcvrO+hHJ/N+uSbRqSu3Wl5pokJfmReE970vRknFJxI7SgBx0By7skyNfSU8aWwxYgwS1KPURMJmRXYctNNqR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1+v2KzovA6UgS3sWIwQa1XocbcVwapJHtiVaYDw08KXyACr+k
	5ycC4LTAQKNnwrKrz4eTQ8yqYu7U9YrIli/7GcPNR5NANXf48PuDcDTf
X-Gm-Gg: ASbGncuzKYGsQ72Tzk+60q6O1mLMhHPWszAJGK93juKEUXHhxaEGAW2GD4TyLn8hcOl
	43iRrY0fSq3VFTeJ7euAvpxJL0uDkEWBzRn0wWhRCrvO96rlF+TvMIjzACPq4LrDaANrnIWvFxb
	Ov3ppSCFgRPCu6UbovzesTd65Peau07kzzZXg5q269IYacQZLCIzHxuwKLTBNfXhBqgjYxYNi08
	UcFsPFICR2Fg4tRIc1e/RjLHkHDZwnOPIrUZ/SpQ14JHjgfTrRH2Sj8npLYW0tpFwqV2hTEHCN/
	R+srRAr+z0TFDQRpb6OUgmcm69bb3BuDt8PmBR4jxsopfL8gzVDcaBlf7SeA1SyDj3Cx7mZjcBC
	HMuglkQp2hGii5B9pjVtghFq4qWAAiXR+VNoTszAWQ7MfzKKE8DuhOIRPDXve3FmQyKvTjyV0oQ
	==
X-Google-Smtp-Source: AGHT+IGZa2TxgX8agd2exKpvk7TmNbKmYcyR1Hha+oaP27Kljq84rYHxWKx4npcT6+CgUwnc/mAUug==
X-Received: by 2002:a05:600c:40c4:b0:45d:e775:d8b8 with SMTP id 5b1f17b1804b1-45dfd5aaff0mr93879005e9.1.1757859477068;
        Sun, 14 Sep 2025 07:17:57 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:17:56 -0700 (PDT)
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
Subject: [PATCH v1 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
Date: Sun, 14 Sep 2025 17:17:42 +0300
Message-ID: <20250914141745.2627756-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_071759_298591_3076F212 
X-CRM114-Status: UNSURE (   9.68  )
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


