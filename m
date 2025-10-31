Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB4FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w81C8PO6GyjajvSZnVcib72PAdJ1z5nHo14vlKsXejI=; b=M4zmsUHDzX9xG+jsR323M4W+C1
	9JZJ6o7twvt0UZKZgUjAoTWGbztk8E7VI0+13STcqo3ixZzRRd6yUFF5m6YZkp4vuA9Rmn2X/aO0M
	VN8BHrqJVcKw6vEWfDijBm/+w6bVRAprc/KP30ffkbpfxkliMSAXnKXRIwd67HgQJdLjJ/GJkRp0C
	rK5AMIgwkHC/3Otc5M1US1qv9hTLtEYdMqC92CJ3GwpMEPz8wIO5+o6qtIc1b72sgU9KlHmRz0x6z
	4QC+2kOSCYx4cIcNRMTTQee6qx82ChfxrRapJs/QoSJ9LTw1etEng03FHOalIdkrohJLywckj0WNg
	TsWo3YiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofo-000000067NQ-1BNh;
	Fri, 31 Oct 2025 12:56:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofm-000000067LR-09y7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-475d9de970eso15399655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915364; x=1762520164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w81C8PO6GyjajvSZnVcib72PAdJ1z5nHo14vlKsXejI=;
        b=sfAJm/KMusPj5VHiELdY2U2HeTEJMPrHGikgj8kat/uy4bXx5nWWO13U9zC/2Qo+GA
         rB0oUU3msEwVLDlWwcCCnTmD8y+BHanJOOwYaIAVf6CujNfxRgBjeUIxXlDXq9tbW+3R
         6VHMkXO2fgKMAGsPrRvjj8PtvTWR4s+q8P4KAe6FgwCQAc7HDUrd1bdpz8VQBtA15lqy
         Uw8InflFdHB7ScgWlIKbLNIu2zJqQQUkabxjEScdc5Kpt1102RD3tpoCG+bknrGUI9as
         6fr33brwb7N5Dhuw+NkN3PnAPGu2d+4rgrUoWDTWWBRh21pwTxG46/IDD5XfChe84lmn
         aeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915364; x=1762520164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w81C8PO6GyjajvSZnVcib72PAdJ1z5nHo14vlKsXejI=;
        b=sSUC+ldSrwZOtODO84Uq7WvLwSXXHEOv22UI0mH+Pyr14HOt0ouGrweO7opIDeHHgS
         1R4gSvGd2Vm/K4shtNC88z5RjuGeFjO1sfnexhtVUS73z8pb7Fg1VHMenwN9qhOoK/yv
         36mYxyJqe/doI+/2LzibOrr0kih5a0/TQbCIBL+SGHw6Fz4rxUkkg46pkp5/MSrPQhGj
         nHe6EQ4t6wSjtm8M/96MaNBp5aZjGS+5pmqMR7royhVIyPOTXg81hi5V3LcfnjWmVuh3
         c1lzPinyqYxce3wdaJBjMmuz+afBTJQBo/1OjnHOrhfJCMt+1OzqdbYp8pj+p5pLhAzN
         HpWg==
X-Forwarded-Encrypted: i=1; AJvYcCWzTV0LTcsY++p/pYA3IwpY9IXC1ti920vxCu++KNklSpcOq4RIxauOjq2FjZOMb8ibHWrHpV/CuRQdDCGckm6b@lists.infradead.org
X-Gm-Message-State: AOJu0YzKiAjgTtVkwzpFRfpdsCuHbnAiHJ+WH48Ad5eKHpPMHVwsFu0n
	gvuvfFbj5wr7nz3MA3wwVXlsLgdLerf0Fj9+DFDdXXgD6RflG3lYGUkNFVZXJcSI1Wo=
X-Gm-Gg: ASbGncsT92OleXDh4LB+HHz0/tLMZkuIh3+yFV8A4JBd8CCxnZ1941Om098MCac/NL/
	0pVLJL89qt4tx3TmM/6K5uKEPLiezpN25JlIxa6imIFh58kFZkxCa5l3ENNSEzvz5T5NRIQaq6a
	n9Ffv+GPlBiE3+c27mddd57exYWgsGe28pA8u6poQ9BFFPzJMMMK5IHNSsF88OU0ZIG0s9rxji6
	EumOlJ4g3qxby6v2siPheLWmMSPk5l1fRV9/Ae6PhSqYdw+0SQOls/p2rHJ6kFlIXXf3FmBX6Gi
	IDKQRoQXqQoMXDV7oCC6uPonnZ1noZHfv7Q23APBYeWw71asatZgv7fXKyynuoIJg4DCTBjui/m
	JektBiYkAMljbz6MMS92zJ19Jv9x1WS33RIT9i1SDTk1h6CF/Ge9RjVq6Kh4HP3KlVTR7HLBGnX
	apgRGTWMYCg5SesW03PMp7KwRNLkeQc461/xuZ1sEto3LT+0hzsqCjaRNFYGFiSRQ=
X-Google-Smtp-Source: AGHT+IE5HT8zyhO+x64QxgSYjKr7L7F+qcefl5D+0FWEsp9ZQtU+HT7k2Pn+gFUE7dvYr1UxapCqpw==
X-Received: by 2002:a05:600c:19d1:b0:471:747:2116 with SMTP id 5b1f17b1804b1-477308b943dmr32724215e9.41.1761915364051;
        Fri, 31 Oct 2025 05:56:04 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:00 +0000
Subject: [PATCH 01/11] dt-bindings: hwinfo: samsung,exynos-chipid: add
 google,gs101 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-1-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=2586;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=52mHw6aKRd81AmHkFdwI5f2O5qzG7/nRl12+OyMNuEs=;
 b=vpkvnaAKzBlUYUyJicoR7s8ZIonwBdHpBvPXSHqnML9kKehWnWDt6lXVGE1gK30tPNuHSi6tz
 tYeAfPhVfVCDtbiE6EMzCUWvpiA6l7oT7wpXfT4MIUlK7O4ZKhTeT4t
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055606_107742_DC646C7C 
X-CRM114-Status: UNSURE (   8.73  )
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

Google GS101 Chip ID references the nvmem cells from the OTP controller,
it doesn't need a reg space. Add the google,gs101-chipid compatible.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     | 51 +++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index b9cdfe52b62ff3a365d61368c39db21facff6565..6d6260be02d47712ebf1e4d31973802e8340cdfe 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -33,6 +33,16 @@ properties:
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid
           - const: samsung,exynos850-chipid
+      - items:
+          - const: google,gs101-chipid
+
+  nvmem-cells:
+    maxItems: 2
+
+  nvmem-cell-names:
+    items:
+      - const: product-id
+      - const: chip-id
 
   reg:
     maxItems: 1
@@ -47,7 +57,46 @@ properties:
 
 required:
   - compatible
-  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - enum:
+                  - samsung,exynos4210-chipid
+                  - samsung,exynos850-chipid
+              - items:
+                  - enum:
+                      - samsung,exynos5433-chipid
+                      - samsung,exynos7-chipid
+                      - samsung,exynos7870-chipid
+                      - samsung,exynos8890-chipid
+                  - const: samsung,exynos4210-chipid
+              - items:
+                  - enum:
+                      - samsung,exynos2200-chipid
+                      - samsung,exynos7885-chipid
+                      - samsung,exynos8895-chipid
+                      - samsung,exynos9610-chipid
+                      - samsung,exynos9810-chipid
+                      - samsung,exynos990-chipid
+                      - samsung,exynosautov9-chipid
+                      - samsung,exynosautov920-chipid
+                  - const: samsung,exynos850-chipid
+    then:
+      required:
+        - reg
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-chipid
+    then:
+      required:
+        - nvmem-cells
+        - nvmem-cell-names
 
 additionalProperties: false
 

-- 
2.51.1.930.gacf6e81ea2-goog


