Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FBECD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=; b=ne7l0SpUKv+4Ln4rCGN/QQjmHD
	jcY6ml8ljqoaA+TQFXs+6xLNBG1kYPY3xYtNd75jE0JgZS1C+P53j2oWMvD/Htfftb3TfU8gK/igT
	g4Yvd4avoOOp5QWu2y+GL0mPfokXHtwYnIKI6DGLn4SVNqXfdm+LnHZlhsuw9iTICt4Mkb89WX2wJ
	YAsENxFwGvMoYrJ7Rh9ZDfKG8Gwabsj6SghtQfqktKktQol90qRNWFfscSDMgU4SRtTZrIUBaTnNs
	g95Ca6IXovqzQ/hFXSgi2HLYpV821tfRKUTDQt9AzQ1WuOaCe/KmcpbNwcYvxkY3gCFcHK6XoC0Ea
	D60eQofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgV8-0000000GXCM-3B0s;
	Wed, 17 Jun 2026 02:59:38 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgV6-0000000GXBW-2QNw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 02:59:37 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8424b00710aso3578215b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781665176; x=1782269976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=DJ/UM+AjLl01zjAVMP+Bv6aVBTJSAhCzZx/gWucs4b8OZrYy16OliuRYqV+Kj2Q4Po
         wYQ7quW0fxTm02vGFg1N3UXgw/UqeUURhoV5zup6K41I/WCt8SFuQrrj26iKm/cHTpTi
         6cEpnTkjSsIKPjkNBdeps8RdoH+1gzQOn3b/buP+bboWNwtJJMSLUZJx+aGU0lF8Y2am
         FfGTzQyH4iJe/1SRPh0KdkHMwks49AXpmvDpzyzjIKS7BmMAg7KMyTzJU/4TCWucWXEZ
         1ZA48lY3jzLC9p1HW25eSDjw9tjQVgau5+R0Zma8sQvwHS+mv3bLrmBF2gKEkCuw5Buv
         evTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781665176; x=1782269976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=Hln4c0lJcK6qmrTzKzeqSxTw3dm9NGKsiK1fccgAOC2wZJi5C/9lgsdLoh5yIm+8vo
         H9SNQPH9S8S4fwNUIWQrlxAFmLw4pqrD3+AvO/yDVkjre9LRcz2uDT1k8QwPY9y/0JYP
         BwiLh1nG3ndhqEw4tBMh1CnaLpKM2ZYSFNisDrz2q3xM/JNV68hF2ObsmB8V93IjzIyN
         0fcSRx6IAirhgUDLSV7Rb8tVAGspyNXcTL5lT5/DGQs0txyfcmV+/gV47wAt6cNiw7QR
         VUkZf7A79Xy+sM95XIHhVZxJgwiGPokl+an/PDT/hqrc8zQJPp+n0H93gBE242lLqJDK
         V2xw==
X-Gm-Message-State: AOJu0YykFz4pB/+F/gSU/ATIQ0oUBo9YaqTLIl7bSTQ9VWu7wrDtHlrr
	CUhGXJEWskk/gyhGA6rAc/Hmd0BNDioEz2IKIjMOPEwaQPEZ4Gq2EULc
X-Gm-Gg: Acq92OEyktvf0LhmdjleJ/Rjv2moxOuI4KEZeSJehUSGjnrvgicz3A+PkI5Gs5bDtpp
	s2RkAu+Z9m5PxB4xlDH6U4k8aIa00Eg2mf+rV3ozIPxAoQVZHj2u55jL2gIc2e8DA/NV7d49JPF
	/Fu5utH1N8YvcPWCOGgvU6iWocRnik5pFUbC1LwqXPuw5VCEoreTQJRnKgybRAdwOVJWKjl/d6+
	jyblLubDBH16nss0zK5rI/tW3hBVfDOUfCpIjjNtMR4oVK7U27LZP9ALJC8fdiAsGQL/eoGy/EO
	B05G9djNrjNfVcUDea4wk+slzSDMA9lhxE9/T3daJR0orr64hbr6M/MxhRFC2nK0yz4OcwEcYzt
	hJaJg0ek5ePTLq1tqYztYxW76AcJLRTzaquaaoGw2kuSZbfhOwsxhBfr8DlWxV6BJ3nzqNzT0YE
	qjLd6BQVQOjPbzfvQPs/cuyfoZ6cYmTEeuX5we1cpUkZoXBoSA/qE4racbld0qRowjA3z/L+J6n
	Yo=
X-Received: by 2002:a05:6a00:2d81:b0:842:4bb9:5fe0 with SMTP id d2e1a72fcca58-84524442788mr1866187b3a.10.1781665175597;
        Tue, 16 Jun 2026 19:59:35 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc825csm14212821b3a.36.2026.06.16.19.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:59:35 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
Date: Wed, 17 Jun 2026 10:59:24 +0800
Message-Id: <20260617025925.2539334-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617025925.2539334-1-cwweng.linux@gmail.com>
References: <20260617025925.2539334-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_195936_662584_DC3C774D 
X-CRM114-Status: GOOD (  13.16  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add device tree binding for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels and uses one register
region and one functional clock. The binding uses the standard PWM binding
with three PWM cells.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
new file mode 100644
index 000000000000..47a59bdd14d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nuvoton,ma35d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PWM controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    pwm@40580000 {
+      compatible = "nuvoton,ma35d1-pwm";
+      reg = <0x40580000 0x400>;
+      clocks = <&clk EPWM0_GATE>;
+      #pwm-cells = <3>;
+    };
-- 
2.25.1


