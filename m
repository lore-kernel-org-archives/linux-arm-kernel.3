Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8454FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jzh26vdjbG7G0Nm3rm+vVlbbhRcsrkTRgLg289ahfY8=; b=xQKNagiwwlwhHPdzn/cR3DKoO2
	oGEfMoE+lX3hB3XUxXzJBXGcp8myUs2YcUuftcQGt3oFf9j2aGUPoXoY1mFe4lyHCc9R21ke0rtz8
	6fj0IE854OnR3mq5YfBjG+EI/3DBxIcQwJiJDvIzorcBdqP56dmsXueqU9QKOkJiuPxq2dn9CuVu+
	3uS+sF/O2Wkv4HaOOSRMKJztpx/HWMVmwdHw4ZMMJc6NCTA4AFxrMhgDJ7obx8kXHLaRN9XVmlawo
	a0Xb1r721lUGTdf5SmpFLrUrEjaXPxHflSPwKGsjIK0pVieznE8yXAjsvR3Rh/NpxcnLF1CSLVIAR
	Fr13/YZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eOn-00000008Yod-3is3;
	Tue, 29 Apr 2025 06:24:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eJl-00000008XOe-30Pf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:19:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2792629f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907583; x=1746512383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jzh26vdjbG7G0Nm3rm+vVlbbhRcsrkTRgLg289ahfY8=;
        b=xJjoKPUQaHzw20TkianApexmKmu9xnTCVR2w4uKuUWSDZzdkGBM8hYHnKj6OxY46Jb
         UtWpPlxQgWrBudYoLO/eLL6nb2Sd/JNmw/tgG+NsRY0taL69s5XN6HAUjtnD6losVcuz
         UniVSpzi/EpJNHLYwXvudGMfpWStO9NtMF5Iy5ama0QrNM+v4tYECvrKsSuRNhBV4j7x
         5GnG9OA7qmCPxS6ytoX9mfmujhrjnEefzn7f9+B0/CTkAO1Mrkt8gcep5kNbaZv1nMN9
         wJdIgo1UEzO0+cNWOxkQtmalBwEzN+6W7/F1e8gAHlo//GMzdfjinPITe/X1a2xVzxhu
         Q99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907583; x=1746512383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jzh26vdjbG7G0Nm3rm+vVlbbhRcsrkTRgLg289ahfY8=;
        b=m4437H9OPH07esPEdQjr84/aRYwiBiW3ag27ZHOrkKP+z/wxTMXuDbg1ObE0rD7oEo
         xTVhPJ1LZ9fL1hoxClD1zD15pwmCAFWFe9N83g5t5b5K2dN4lWo1QRKr5i0uKgehnKwx
         RyjEXmEsnVIyM3ArcqKgyNY1YhbQTCkfWjA2uUEK3tR2kRjvHMG/24Apnm+8/THF69Pu
         mvrMryQFFEbVJzj5NQ2ads4HN6IwpPoEFjaZcg5C5BqbGmFAdB8/JvwGNBLkGoJm6/JX
         Eau3bnR09coERAGjFOI6ZNi6VJTD77Ztvhc6W4L4MPZGthmcjrnKwzii5s0AHINEye0y
         Sy5g==
X-Forwarded-Encrypted: i=1; AJvYcCV3v80zmeBaFBxMJKkLYgfEV2zdbRwBCr/i6DqwHHPYgcAznKoEghLfAQYnYdZZ9Z3+dvuhOB46663x4Qu54WEq@lists.infradead.org
X-Gm-Message-State: AOJu0YzhfW+2Q+hXZP00M4c2YjQaxk1h3jFz0x8Yp5GgyDJODfgYP6tO
	aiUHyYpdc7N5qfgl9E6encTn8WLfrMYsyAf4UWXXEZ3DfQH2pTzNf7rJNB39Yy4=
X-Gm-Gg: ASbGncuEIXPPMCbbkErIGDr41eZbghnC1YS+Z6BSRBe7L7xpefOitXuLmrYYB+kmvq9
	TURS/ClxuFxWx1pwvbhn9bPgK4ux5GucEjwl44mPQ1tl1CUix/ARB0woqTlk3JBF44WPyU1ZXj1
	1JHCGl9tKzMCufTK9mQrQ9JnkU0rKLEt7rSgnhn1KO6cNiws/xPHs/vPkBb+Vjxvi1VBWphlo7v
	5JerL64AM+j3meDrknC9qBfR9KwjX8jPhRz66EFqn0vD3VR10UNNxLdbc1OHYmHl+triYxXa9ml
	loTOpL829X4JN0Ws5m5+HSydPiR5Hm6t3Qs+O8RR4aWX3VwJIQAtWwdcNRoWhqUVz5IhYTE=
X-Google-Smtp-Source: AGHT+IFzJb9NMtr1f92/yBh2GExm18tiJRJJXDmpFNGgqHW8ipb8xWMxgVsXCJ0bIiAyHKzGOHvZ2g==
X-Received: by 2002:a05:6000:2483:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-3a07ab85d86mr9231177f8f.47.1745907583567;
        Mon, 28 Apr 2025 23:19:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:37 +0100
Subject: [PATCH v3 1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen
 binding documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-1-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Sp2ayCAa9I3PDRmWW7VLfFW+7irdC0o52an90/gAFl0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG97ya628YBjIwMAoykPzIHd++cHXjeKqJsWW
 IPBkePX5JOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvewAKCRDO6LjWAjRy
 ur4aD/42kkFmOL4mqo6f7UREpZ8b/Vc9BvXjiOZbf4+doh0jZmW7DjW3u33WYdPdjAfDgCKv7KN
 TLVrFjUNyeubXl8qc3Rp046Gl5mQ6I2653ezKjZMF5Wc35+tDnp1aLeowP9fSe1Wo6wb/mhQnr9
 zTBEuccMveKG7m5C6llUBDBo7aSLltjVtYUAFVOlhBD7oH+D0rPOVl+JfwTFcN3hcBQlk0TD1Y5
 Ng+69qVlfV4gP9cpvNQwljHzaLMbYL0AXoZmvnXCcZCZHvhp6g8PAcBNFB7H9gpy5/aZKOb2Wfm
 VRNdfsJHG7PEtBvizuKLU4c+6xkCMngPJ9F4RpmD8WZs1mPoPEQbgpqW5gVkl7Y28JmDOn+/PzO
 3Q7qraOKkwNP5Ke/xDnqa5rJ63WbIK/bUU0ulYocgvXcdhOhbmQgjImRmjQOo7R2S/76eJj0gUY
 vKuk+jtXFw5Nwfa8Dnu5sKyK1fWDRPw1rB2zA6sM9FmUs9d8ZszZHSZ16VresfHgiofcTg+bwh4
 dOYiGFnTs7YCNVs0/fS0tM1I5WxjIs0jNRJ559oILfvda7Y+VP89DKu5pWSgffxmX/kzSEsdPHy
 lgXQOe90G0y8d3JM8f6Uh0g80mVLLV8sGuhfw6nH5o1fV0YroBRUtXbw1CItblDCfnKXkr2bzqR
 EAf5YBKHSzJnZ3g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_231946_541164_80F07939 
X-CRM114-Status: GOOD (  12.45  )
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

Add bindings documentation for the Power Management Unit (PMU) interrupt
generator.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v2:
 - Fix dtschema error "relative path/filename doesn't match actual path or filename" (Robs patch bot)
---
 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2be022ca6a7d0780db3163f1b774e4825a9123fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Power Management Unit (PMU) Interrupt Generation
+
+description: |
+  PMU interrupt generator for handshaking between PMU through interrupts.
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-pmu-intr-gen
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu_intr_gen: syscon@17470000 {
+      compatible = "google,gs101-pmu-intr-gen", "syscon";
+      reg = <0x17470000 0x10000>;
+    };

-- 
2.49.0.901.g37484f566f-goog


