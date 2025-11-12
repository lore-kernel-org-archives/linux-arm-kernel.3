Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5C2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtogQFcSHlN8gkfKXvyp9GsEsbrpcQ/U+ViAyh1NORc=; b=pETzbIDhRe/pGFPHnakJG54K4d
	kcnL5qnfsvfGGUZ/OaV8lByL1jpOiy22XuzUNTwhlbYuHYvh5rFGjr/zRczNNJ8jQEl2+vuQvwN5k
	opwsNcJbLzDuT9SIlGbynKehRcigWynkYXs055aiL0zsnNzhOAxYkFVQ2pu+qOA74J34/p/cdHmIx
	eO9U/x7f6WAhuo8FmIfHwRkiQRaQgFXl9CyrTZUDDCnj97SuW/d4CJJ1XppAK0YzVHH5PZK8fhAEe
	axSlle9iQzqh55HyWxaZ6frLlXbS8LqzVjkofTLDMa8V9SwwJHPHdhAwjN7ClXMsP/baOZ8yUS/9I
	1JbzA5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EB-00000008LHg-0Wnb;
	Wed, 12 Nov 2025 08:29:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6E8-00000008LGC-3qcp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:29:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b38693c4dso218637f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936155; x=1763540955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtogQFcSHlN8gkfKXvyp9GsEsbrpcQ/U+ViAyh1NORc=;
        b=FWBy1WQNT6EopKLzmyjKh+G1sJkAIuND1cBAdRbm1XyN1GVEasDOCVBlIyBCCT5Ta5
         pweLP3ahw4UdZGlBAFYo6sQe9Ik8NK1Mqwcl4gjYsmi6Qv32pzSi0Ut1tjyfFaL4jmiw
         amg0beHGLXyale5fzJMrAD+snSgk4PD31tGi0B4TSnewiOPUlAA6ay28rGMxXRvpc+Xw
         sEBBOuQCCqWyBPkKmTLbp01EDqc4xjNPBHFOlMjbT1ztn2l78fhkWGfggNbKmxqPFyxm
         3OcLr9/6YKGr0IXeE5OFWKpnexMeHyabSXsnmTsR/vyZ920NOf74AY25P2hu0PiUkYGw
         EfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936155; x=1763540955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JtogQFcSHlN8gkfKXvyp9GsEsbrpcQ/U+ViAyh1NORc=;
        b=jBjfgf+gxhL7b4Ahp38oQ+yDCp6eK7WBCCPjzveuj+F2KoJC2B4/SiVYJIhg+P6vt5
         tJ/idhTVuXToqs0W1/xWiwLDhf2B7kTcFDsdqUaapiN+A2wXFt4v0I5hJ+PdkMHRXV31
         xXTUU0KfJka6x7SbU1tAIz+DL6hVc241ZazV7TTgsKpRaqAGDBcwrrQ62E3kUeyJ/iOH
         serTmBrSsyPrlRFJN9iSBznoUuanCPqZjo3Ie+95b33xfCHY56uIcL9H5jtfkvtbamxf
         XjidHU1jVPPM4doM2yS73lSd1LbFFRVzTr+xy/FHaQIhsI+Wt1g8W5DFjVUBddKGfmul
         RM0w==
X-Forwarded-Encrypted: i=1; AJvYcCXYrFzV6JjtQvZPVPqiDRoSTB35+mZh8zGYPG2JqXQzyWms0L4b7+vlRAP4EpOqsVKTimqR45N7poyOy9p0piRc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvf6xpMlmcQ7qrbA/6vxO0IrV+oxpGLVJCfcqAanJNR21LCaVM
	H+tZyNEmggTObVAtJFAsazKM7Lj8awYrqjI2UDTKh5caDgEsXHJLJ9dWwnLRW6tygSA=
X-Gm-Gg: ASbGncv7CH2rkFOYZ4wtDvnRwIE9kmacMYSBwVOjHKVlZbyuJS8SO5gIQzBw+4PdbK/
	dJHG6I2Lhkp0F5znbWpJagQjsQLtQ138YeFVLgziXjVw5+pGp2Lrw1Y2jNQAuKVyAPZ7/nrVh/E
	R5ZUuSaxVB2dqwvT4CodF2P4FKKtVB2WXLzsB5dv35k2hJmC/ZWM5/C7fizAzAYPi2z5HnBNL5J
	Z5WRQ7uhdN9TbxaZa4AD+uLlBf4uiLTAjOZWFAkzeZvNDfoME75QeVrQ1/oOSbe1+kmgF4Yz+Y8
	zUImue7b2HvoFoOcwA0sRmiacE/jCfaXP+/KY9+eRAf/nTen2fhFfM96PdA5+z3bpcLdbwcFaZr
	/UuWaxJx/8mhia4kNhb65rAPE8x2Ik2EEENrkFWt+u5SRUAGT+Pjow8h3/rMcnQlUH726s2gUeH
	32eL+beQfdS7MByL13HHopMCGivGdqV99d77TusKXCcD/RIEJ6kE4elall
X-Google-Smtp-Source: AGHT+IEU4FFylzRDbDiqTl5SDdc681V6U/fIzfBAB7L0TgSU5N2M6VMTglal8026StadrPU/haIBUA==
X-Received: by 2002:a05:6000:2888:b0:429:cc1c:c2e with SMTP id ffacd0b85a97d-42b4bb90b6bmr1430374f8f.1.1762936154894;
        Wed, 12 Nov 2025 00:29:14 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:14 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:05 +0000
Subject: [PATCH v2 1/5] dt-bindings: nvmem: add google,gs101-otp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=1979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=dEcSRRQtvE4xP0095DiinVR5fFEjss1bE4Kb607L5bU=;
 b=OOX0r/TY8rkVTDOz28jm+bgdNooRzs/EvPWQacDtL9RIRn5yJEOAYEXSxltqVpFD4s7fZonIU
 jteQzbYy5l0BJ5yhYs/b58SW4kymeDF8K5hTUQLkv3HwXTDar9OlFds
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_002916_978566_D1CA1188 
X-CRM114-Status: GOOD (  12.97  )
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

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/nvmem/google,gs101-otp.yaml           | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ea87216761dbab9a7a5cecd87a553a6a2a1783f7
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
+  can be stored. The OTP controller register space if of interest as well
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
2.51.2.1041.gc1ab5b90ca-goog


