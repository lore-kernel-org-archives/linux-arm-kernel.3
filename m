Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE0CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV3zHUbx1e+LhTjQHrHCchQZpY4e/gFltYNW4sD9Hjk=; b=cFlVwpND2muBvBES1zW7QMSJOt
	li3CTaW55k9bXeWeGzcUqWhLzXDkaL/GzRqlSWONvMlPy/hN4/nLMbepdj4nUO0OoUfOypNOPAO6g
	g8Ks1ty5GxuVlu8iA6sIlQGdDrReGXzV4G4QK/DaddsI9hFwgs8FaEbHGu2cD58fSB1I8y8ZjMXHy
	8meu6RUvfwRpVxN+BLtQ0/o2sA+UjM4hMB3v2yaf/s4ybn3gIRQx7Zo2jBc7VLUszLMxz6PtUyBkz
	kcnznfKm5OD5q6cg2ae4YD/ecFsuESsebyEo4bUcPyRJrplgOScF/deLC0wHYqHsg3A6+eRUMVPlT
	XZQHg9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxn2o-00000001NzD-1kKz;
	Sun, 14 Sep 2025 13:45:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxn2j-00000001NwP-1FT3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:45:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso25508125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757857523; x=1758462323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV3zHUbx1e+LhTjQHrHCchQZpY4e/gFltYNW4sD9Hjk=;
        b=Q+vrKtq/ovi9ckdhw9bMpHux0jwuUyWDRoZqgaHbZxbsOXBfHMW2BT+avfJ/i0aXSK
         STBlVgXWtsq91JocuZve63OlRnjYJR3Dff2vip0kBPDEGVshUl4Zo2TIMxkZHSmbnDkO
         9Yb3FiO5bJeBO5z2u5C9ACC78Ywh5iW5FOqJHYnw1kL1ypwK36Yl0aZ/+xpq3xG9Jwdq
         mMJtj/xjesE4bvUIaCf0IvEBF62GqekhRGyt1fJF2s3HYUcyOlj23NcYdJjz5ukwdyu2
         0AAox21Blm0+x6VVe6oP3W4+DI6Nf7MbVoRBd+kiDb26GCC7mJp/qyKOtcPNtyYbA/pS
         bU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857523; x=1758462323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PV3zHUbx1e+LhTjQHrHCchQZpY4e/gFltYNW4sD9Hjk=;
        b=HDIs/XHxQ+kSubejoXJmc6am8mqNm6hcg1VXuLWyMsFMg0epO19OgxV5y96kMXHDZM
         ELDFgGw5U5Z92oW9qnGc0c3Hwa0MKonUFYFcpNlQiTmQuojExiKLCaWRgksx5quZfaP7
         SfecXy6XNIvY8O+jsyA0kJ8JJN9d64qiS7EnDYRmblIEHsrE7JW38ozJodEPTgQwws+w
         yhn2idiBWFQCMd6QpyUKs1wHHbCWfzfCZwx8ILLQZ0yIwXEfS60h8nxqX3uZyl4DvNMw
         ymCVD5wwBgutA/z3+FYjVUz1Pg0E1IhebWD2yQ/OzxtdCrO3XVR/AM0tmhD2wZCVfLhU
         DWVw==
X-Forwarded-Encrypted: i=1; AJvYcCU4qr3dPK+5udHrtdMJ3boJO/7+xKC4PKYCwMfG5KvviMzZrEqZLVp90CS0u6xrghqIaNRtvndqO9S+dLt8R40U@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8qxZHhKyhTRJqiG7WDoFp/HgZ9Uq+qXTLVJQOwufisSE3N2Tm
	rlvWW4iuExQFA+LDfg3lDSnpLh/83fdNRoTO9VkAcl+v0nxMtR5sOCM4
X-Gm-Gg: ASbGnctfsaneYXKv1ZE5KI7YEJcdYSezosaYLua+gP2Cs9iyMZbrpazWkhJHWXJ+q9Z
	+ux7Xaoo8vmCZws+hkZBvYznE+qahO26R+Sh2cdaBvsaxIZhKPhVfL5pYqt4lurUGSEsPVw4dxI
	zF+DnYSmZdsfhX0McCh5Xc37ENM/e+WBXc/DgYqAccrPN0+Bp7wv53PUJjaPcSYHgP411Zb1Vw3
	LJK1gbPMRffnQmBU4ncYZZHbcoumgEk7QPEjUZZWFgLUfak7R4NaqhsCN6oyB8cOdLsaauZ1j+c
	2ZUsEzqQXF6LVdUBzk5nP8jP/FBuCJ3IIaW5uFp5sbYr31cwt+PeRhy2n2vn+ZkYdhcq3MX5tOa
	6077jZagJooz4sAt8tcGf/7KvttmEzHansKSnAvgrw4BuhS6uIAm7EkYyROzVQU/Hf6ATDc1MLW
	QXjLmHXo2K
X-Google-Smtp-Source: AGHT+IH4PxlS+eMu4I7zsqkF333IE4ZBIXWlFwsih4mbbMUXY1y5US4lIdGFnDdmKTKa+deYcjSRTg==
X-Received: by 2002:a05:6000:2408:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3e7658c1c6emr8490202f8f.28.1757857523258;
        Sun, 14 Sep 2025 06:45:23 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea4b52b7fcsm1467591f8f.33.2025.09.14.06.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:45:22 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: input: document Samsung A552 touchscreen controller
Date: Sun, 14 Sep 2025 16:44:56 +0300
Message-ID: <20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_064525_352291_BFC251BE 
X-CRM114-Status: GOOD (  14.29  )
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

Document the Samsung A552 touchscreen controller, present in devices like
the Samsung Galaxy S7.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../input/touchscreen/samsung,s6sa552.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
new file mode 100644
index 000000000..af151e245
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/samsung,s6sa552.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6SA552 touchscreen controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6sa552
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  avdd-supply: true
+  vdd-supply: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vdd-supply
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "samsung,s6sa552";
+            reg = <0x48>;
+            interrupt-parent = <&gpa1>;
+            interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+            avdd-supply = <&ldo30_reg>;
+            vdd-supply = <&ldo31_reg>;
+            touchscreen-size-x = <4096>;
+            touchscreen-size-y = <4096>;
+        };
+    };
-- 
2.43.0


