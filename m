Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E70103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94oKRwhTxKOCc5T6avfbasAgA93RZvczT3rsQ8lQehE=; b=UleFnWMy0oiz+ghyQUueBOVcRN
	oncYShl/N4y4blvlLdyE1QTrpywd7sZMe8DB3MSni7RQyV5Faf7XLA5rbnQD+IieTxPp9sZ69jluN
	atEX2OMaSI9hvX5+o+Ypp4D+DWN9lT0btPKw1O6xTI0xJJ+MWCu5WXig3aFG05SHiSAIyVIwGcXli
	nlEfEQHHCAytllIEUC3UatHbYEY7JOHMnmfoGALhPAPyNzH5n0xadN62XL89j/6uma7sFQlJJCmON
	nPJjwT2jb7xU7zGdbZRODhn9sjrhaymBqQ9x4ts0zBlafXeCFKpIr1Py1Kmvpu59jJLyCUHzGWP3i
	5LR7qBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sob-00000008hcw-2auJ;
	Wed, 18 Mar 2026 15:28:09 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soT-00000008hX8-37hY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:03 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b980c65b97aso37889866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847679; x=1774452479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94oKRwhTxKOCc5T6avfbasAgA93RZvczT3rsQ8lQehE=;
        b=QdI3BByJQlF2IzhVkyUoHw86S7xTW/qp3msLe5EO1CLL870GDIecmfHqEOByN18LsS
         N/NqItWo/1vvBps9B1fgPaEFDk4XPkRbkgWCDzSCJ2wuon+QYNWMCIYzl5dmDCRl1iLY
         gvL1doZxvvPYz5jDlNn4GLRKUHEmZQ58WJzQVigvpLirJth31ww21G+ZujHgqv70vP1T
         ZhjEoyLRsOCIos8QwS1eJ5dU5SDCCpf5i+/xFhPc9sZuvOlckXd/gReM0xZIr3wNh4Fb
         0U92rSHIhWOHaYU16DRbxnAVLzz6wZzKmsQwhCmCPO+0LWgUNmd+SiX9I3QqeFpP1OIh
         fq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847679; x=1774452479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=94oKRwhTxKOCc5T6avfbasAgA93RZvczT3rsQ8lQehE=;
        b=Lu4bI/gx23szRwEAw5ggncOyomQ/rIf3Ei3HZDTBy0GqwEpPyZGIiw+I+iO1i3FysZ
         KE0YmYy9V7VRaE4SjPVA/z5dMA/Ol6UuIW3hYP1ZfHqH+dZveDEUyBiwokULhz0vXb0d
         pks9v6fqOIr6ygNEfH/Hl9DapB2xfxDjWuUL7D6NMsfY1R9ABrks3q0fiqpwD+qh1S0k
         opHnn1e2SDVN3SC0sBiIWd6OTkjVxe6PWw/6jVwEDBA78PAQsQU5RbHQayrEz0dw8WTe
         iQMqMeNBH2dSKtERwGosDPzb4qm2Ji9OOt3x3KnWETtvdYs3d4iGoicne3lFkFu+1R3X
         IIjg==
X-Forwarded-Encrypted: i=1; AJvYcCXXAU/gwRE3UuVXlgrYM1CmbrqlM554OmbvpoustF9WT55AVPuDUGaQPWS/+EM/sXR5EcTZV44nUaHcpxTJVire@lists.infradead.org
X-Gm-Message-State: AOJu0YxyGyaO/j2gTLEzzsJT8DvKp2Gd2/zBZIgBkndR5YOctKCt6aka
	w0TCEDgPhWQinXae9zMMCEa9lK68flVJbeeqXT6O31XRwAyAvDfqz9XNQA0y615gUlQ=
X-Gm-Gg: ATEYQzwFoQHHzdz3YkLC4NFSX1LfWKwhxmG/ucOpQyg5W04wQkr57hoTPjgNO/UjpgB
	lKKrQ+6hzUrRIXtW//qfznPl78oa8r4YCeJxKEVM7m5GyLONWTyWPaFqy+gepHHqiBX486FbL4T
	JmTKKNuY5hbmDwI+rB1DedgfWoOpt8VVRSO04ndjSHMGJGvPIXiZsC9CG/s3CMYFzXWaeyR3E2K
	n1ZtepPZNDzoYFdm6yBmGIZn/wOQ48VFlh2OvBu+UXUk1EEWA1o0icQjdpSyoPZvE8jB3H9PQuI
	Gp0dtflnk2FARVH5rSuBp8ASY2B2sS+I+WZWiyNWnWb9BvQ+wqiZUDjX4UGKWkY09xNfGl06jFI
	a144UmJguvay4vSZSEQBWzEqPx1J9pIGkZgYvskQA6/uIkaE8tD6zUzo9grFfsemqFb6s3YfoX5
	k2ysGBgi5qsB8W6T0RIKmYCyJ8hh62QLlp4cne+Fhy53mefhgf+mDIr0BhcQ5M+naH0OsvmxXSw
	8xGEHFrfIXpPGs=
X-Received: by 2002:a17:907:bd0:b0:b97:61e2:95ea with SMTP id a640c23a62f3a-b97f49055aamr164540766b.20.1773847679098;
        Wed, 18 Mar 2026 08:27:59 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:27:58 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:46 +0000
Subject: [PATCH v8 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-1-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082801_803355_2C4BDBB7 
X-CRM114-Status: GOOD (  13.35  )
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

The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
an interface to the protection bits that are included in the TrustZone
design in a secure system. It configures each area of the memory as
secure or non-secure.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
new file mode 100644
index 000000000000..a8c61ce069d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Distributed TruztZone Protection Control.
+
+description:
+  Distributed TrustZone Protection Control (D_TZPC) provides an interface to the
+  protection bits that are included in the TrustZone design in a secure system.
+  It configures each area of the memory as secure or non-secure.
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+properties:
+  compatible:
+    const: google,gs101-dtzpc
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+
+    dtzpc_hsi0: dtzpc@11010000 {
+      compatible = "google,gs101-dtzpc";
+      reg = <0x11010000 0x10000>;
+      clocks = <&cmu_hsi0 CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 6358dd7f1632..e8376343935f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10905,6 +10905,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.851.ga537e3e6e9-goog


