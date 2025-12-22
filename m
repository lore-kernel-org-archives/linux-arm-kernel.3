Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCBBE677F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlhs/F8IClVmoUeoQn46BTOR0VEDNo6dJrg+YAjVNP4=; b=SVmGNxIN8lZf4FSmZ2/sc4J+kL
	AzC6XnEigTc9w8cksvduQpIkPp5TB/qHs/kesKDJLm95ISWKjwfByIE2ECB5XMlCcmpLVcRjFaVvX
	SixMpqvt2u1A6h9CY+ObW+4ZRqo/mGHvAXAdzDNwTjFPpEnBaMfQH2HLm0X7/b3leFgQThmkJGnRM
	1xBbFLcggHHACnT/66ndKZwFtC5ftBchy0XM9Ktc+FpF81mwdSUwO7naJTUDSPzO7ERFQwf+8B853
	gcelp1uetFfqWbGRtGjEVjss00fp/84mkWSuAvfx8P9XSXmCYkrn0eRXZGoFuExmfx+SgXNjGbLeo
	bslV/WqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXinu-0000000Dy8m-3uWC;
	Mon, 22 Dec 2025 16:30:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXins-0000000Dy6w-0H0P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:30:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso1752865f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421034; x=1767025834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlhs/F8IClVmoUeoQn46BTOR0VEDNo6dJrg+YAjVNP4=;
        b=pt9/615RohpNwsg+RwjbRVhrfjOOj0L2IHJt/NGyt4eLoltxciq5HCPF9g7fpuas1/
         +5nErPzUxVW5N5P7UdNePC32LhBR4LUO4mFdMW8OyanrG85+9IX6tE2RMDJla+wdjzPU
         hmOuFCHRVtZEk/9E1rSJd19GE9kDuqTEyaedbAOJD+VoXKThlp07aqeyBG9CIlnPb7HQ
         OZqO5ONZ2F2wVNRnm6KwNBvjNFXzpkSy/4AWQCG00OuhOlO0FGBaTUN6Ii0NRa5f6UEW
         PN9p3xYES9h7jTQE51DBznCzR46oGNd74Ia8Q15ZoP3LLaVegJxT9EVabb1cx4sExb3j
         WWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421034; x=1767025834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlhs/F8IClVmoUeoQn46BTOR0VEDNo6dJrg+YAjVNP4=;
        b=uRdMb2cHJEZbKIkRfjb7AA25OkbKCpQWtSO5iogDhxZbpNVwQllyE7CgNbV6g81a7S
         U+IhdUczSAZvRVaUEaT+9hFmiCUJECwFgzJ6TWgVvy4472/ilzSL7EqRyCxs93HBsLPV
         kOB5OZaAFh+c8thXMPfW9fJY0xHsi7IwEOAXDmnjhEibmT3bnmNmkub9FzEeJJMp7PmI
         AeFf9R4LlC9JFyG/qHvmyIz9Bb1bjEgJLc2IOmXjVhLm0cs18qlJnVstIl1pvsHxIl8W
         XIf+qU9ryC0EodIVP0gmgBpKWhN+iQ/rmImBtZ3uy4MXfMn26RBIazvHUBopqvxgQL1C
         PptA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzUeLBge0bZwkooIyhPD2y3vhUrtuexwbwtaoWdD7NBPq38jNdXLWI/cokVNHYRHUp6LpSiOPcYHLg6ezWR3e@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1UWSFqlxV7T5TYGVZPyM9HMAhwyCKhqcuqYk6YIjEmpCCGdi3
	oZGMtVqe2Ljv6a8ulgRaE2w1ZvCMauoUFA+ldsuGjwFGx81D+jpfWrchUtrxwAiPjKM=
X-Gm-Gg: AY/fxX6I6sidv/69H1Z8aauPdr6wOm0/PlY4WeaeiR1LqiQ++XYhWO7DAleJXWiv/pi
	CO+GbBp/1qIC2Yxjz5gSqXeWWJMN8BiD+XuN++drrk33u4J0bGGGL3nKAjMGA7HHYETbZvUBVCR
	HQaTjwsnyYWWhKF0QUdtvMl1Ds+hy5a2JJ0doj9X6p5Nlr7jCzxFYSXmNbueqz24N9y6jo9GZJI
	HmTlQAnsehDr6/MVK7fS6u734/AI9FyFC/rvKg84io/KMY5YjRYW9l9O1iKImc6+iFqbYLjrthJ
	j32foFJDDIerRHePRS5+yXWhZABTvuF966mPGl5XvmX64NcQk09fxOUfSjVZcuAA/k3lQ/oOD8K
	zhtB4n4aDZubgd3rfR6QHe39R9EN1EPa/t8WD0G2UtIfapxlHZS9zsqnrQwnIHy9vyuLg0fg76j
	eB8xIiJRfrwJFq7yExaDFHIglsNY8Mpv6qIY0WfSD6zA7+Wf8EffsFGTM/gPKUQwe3VcvjSik+s
	Qk=
X-Google-Smtp-Source: AGHT+IFsMafyDmIztGS5eFQmA3T+ssMBvK+Usv9rZU++fuZY5gKcMu9PEAPmRCs7wEEjvON8LVqWEQ==
X-Received: by 2002:a05:6000:220c:b0:431:752:671e with SMTP id ffacd0b85a97d-4324e4c906cmr14343129f8f.15.1766421034026;
        Mon, 22 Dec 2025 08:30:34 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:33 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:05 +0000
Subject: [PATCH v4 1/5] dt-bindings: nvmem: add google,gs101-otp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-gs101-chipid-v4-1-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=2189;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=McUiHXa4sDY4TxK9myaei/Das6DSOvZ5DH9n9HIK5z0=;
 b=CAQSD5FGU+EphuBCmrULdCUhE7IlVwlUPWIGhc6icc4yiw5qm4ZAkkXHyrcgxE3+TDcTEJzxJ
 juUMNR5p/1kACyIXO1B0V4+ZF5hS6VMH48BNxDvFr7kMnXW3AMP9FVK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_083036_120105_9FDFA1FB 
X-CRM114-Status: GOOD (  12.13  )
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
 .../bindings/nvmem/google,gs101-otp.yaml           | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..99e322c72f9ee1766f3393e604991364c41456fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
@@ -0,0 +1,61 @@
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
+  clock-names:
+    const: pclk
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
+  - clock-names
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
+        clock-names = "pclk";
+        interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.52.0.322.g1dd061c0dc-goog


