Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9010CEDD8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mT9D4mxJaHrktugW+TtOKGoZWS1UVqUBb8i2CtMbCwk=; b=SbhOlDfnCI/pesZyjMnYCQf/Kd
	xSvfEQOPuwex/QPqsE8xKMJwO2IFOxq5OIRKmS+z4ldY4LW51zv8z5QEX82qWsO/Sd1p25UxVBegZ
	Bp/NFGlOCTzqIfOgGj4tGogyL1IrPoYQLHnx1stv1zgTEK/Xq6sJBQpphcUK34t1lOdpb1yZtW5+p
	Dbcm6mOEA8aC6TRlyjlT5L91GtZTtgXVNxmYLPGdw5j0CVOlgXe5CF6OSncljNTVYCC8QUyC9X/DY
	kQF3ZbDCLErWfj02dOe1r7u+EUyucGx2A92S1eahCvGG1zGw4JSFNxbow/Kb9cJHAkbu8bXJeEboW
	fUIFsQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMC6-00000000VCG-0khJ;
	Tue, 18 Nov 2025 13:56:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMBw-00000000V0d-3IIU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3037064f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474179; x=1764078979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mT9D4mxJaHrktugW+TtOKGoZWS1UVqUBb8i2CtMbCwk=;
        b=Bqlx9QHu2mP9m9nQgInWGkmriEWaAgO5o2cEuBRnKwJtqAdLPnNer7DBnSMka7rRZ5
         L1xQIoplDf1TFfoGgRaybYtq7NvdGwCXFNR3oxE6JNkBoGT9atDs8V5omZdgQvvNVtXr
         9h5BwLDoiE3lw1/zNRl8JF0LyO1EIS44/obbWGEGNOBdqFNbAcp+XcYJR9aYliOP2NPr
         rW1dSLaGOnVEoFeQY6YmjrK7pGV3OvzScsihcQmh4RC7fYMeuSv0tGHy7YulVVfOV2UR
         7JREMyz4SE/A8tWUNl27b+ubsXKltoI3rMp0cVXjqgD7UIlRucuaYmiL4wZQXuU6CEh7
         8QTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474179; x=1764078979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mT9D4mxJaHrktugW+TtOKGoZWS1UVqUBb8i2CtMbCwk=;
        b=fLKA4obQ2+PKEQGBttw/isYvPMqyKCtLZbChw7+rqRfp6B4tmTtPlJmuSeTBt1jzuH
         am+GFfR20lKoh7mpvb1mK2322HXLObY+nwX4DBDHXJiR1lQZAu9St5G8hMHEWZTb9LMe
         dwwfF1iyFVTCq8exsYnOuGNd0Q1bVHuULCGGylnCaoHPIkJjKClEVTOoildcG0BK1NjM
         tbl2h4ZFfdjth//xsgi2xRdK97NiZht8CA3EggUZDwl3LcJpDSzOaLXMWIrjpLMs9H7n
         EBQYN+AyPw7qgvWEpLojx1/TzoiToGut3hXtw1fDLp6dIxwcTuOGJE2ZOvRXzaTJvtnU
         kboQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCIYlzH+6zZU18EAfsF77EeisO41w3TntrPrlqnH++jryUocnX6+HyCpCSEFGpmengAoDGluYfoMGNPfde05rJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2uI65M5/oF7PYQ7QTsl/xUul2mYGWDZEYqqqZ0J04hRSBhuAE
	LUjcxUjiwokLKa20pAZqng28lp+bFb/H35VFd4O2eOlhoWyGkNInBr9GEqH6NT75O8U=
X-Gm-Gg: ASbGncsl81WX1jpsV6bowkr1E4Dp8Nwr/Q+97d7E+DKrPzK7dV1qdlXk3+5yj+SVcM5
	nvZ3xAfjbCFyyHDLmuXpe2deVFG/Lc4IsNJfqiUdYCTbjHHy3WeqdJ86ZXZS97pq5zP4ErDFj9B
	kmPj3Onl6X9ZpgszD10hoCbkRAyNhLq9o7yd3K41/tf33RHIHc8uwJZH7BIsD6refcA4cH+onaT
	e9aQCSCVSn+O8hSJ4pSOo2SK+/kLvYmiXsWjCnGoDMgbYWUxtpEoZ7M0FQrJw3d0fcCsG3g9ti+
	93oCAvmE4423ljVHQNi5KywWWpKEC28vy+QdASuMlQJ+ghAQCll9Oy1I3z8VU0cukFETe3iAKLG
	z39WIctGiguvdvioR2BNWr5Biz7Esb8/HjcTXT9rCeFGymlPcTRV9406o1eDLVLTtn/tRuUGVLu
	eWUZqxtSekP44aaGc9P8nbF71ZP8myMIbg3NbCX04fyTIdOxFtn+Kv6CXqaidFBOgCbxzZWqOin
	dCm5Q==
X-Google-Smtp-Source: AGHT+IFSeYnPbCw3tis4yQRZI08iOt4XrwHVQj4yd7amd2aPdf7DLT9bDe6bDLKPiGXs0lIp0USpvw==
X-Received: by 2002:a05:6000:430e:b0:429:c4bb:fbd6 with SMTP id ffacd0b85a97d-42b5936c4a2mr14623335f8f.31.1763474178959;
        Tue, 18 Nov 2025 05:56:18 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:18 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:08 +0000
Subject: [PATCH v2 1/7] dt-bindings: nvmem: add google,gs101-otp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-gs101-chipid-v2-1-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=2105;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=hE9pu4zL09R2VnRw1hPAh8QPybkRzkJsjvziTMQK6lI=;
 b=rOjp9fByKIiYv2zyDGDmfAh5uHoPJlkPj+pJH/Wo7/4XVrDXytSpx2NxMD3/6YvsMTnrew6jU
 MLbn/+h0vuFCoeJHn589V0xkn5CgCijQecUkHEOp3AFcz3Urq6cHgrN
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055620_861198_8D986E88 
X-CRM114-Status: GOOD (  12.78  )
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

Add binding for the OTP controller found on Google GS101.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/nvmem/google,gs101-otp.yaml           | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8ed65e906a2a1b0c216a09c9444f87af61090b81
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 OTP Controller
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  OTP controller drives a NVMEM memory where system or user specific data
+  can be stored. The OTP controller register space is of interest as well
+  because it contains dedicated registers where it stores the Product ID
+  and the Chip ID (apart other things like TMU or ASV info).
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-otp
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    efuse@10000000 {
+        compatible = "google,gs101-otp";
+        reg = <0x10000000 0xf084>;
+        clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+        interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.52.0.rc1.455.g30608eb744-goog


