Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB1BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 01:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3OGnfMaF6ttidHVZW35hLDvix/z1ZneywWqGiGVTK0=; b=i+CWbFszJjKgUFviF3aoyzU2uW
	x+2KFkXI2c/NGibGU6N5pm6GPDZXy2y5wmZG6iObTwDkqcScNfeGUdYCydhH+gQdR5R1Iwuqbt5Df
	NoheoE5jk+1cx3RZ0fRQOe2oik5JAJFMQyk1zRJYouT66W1UDg/BIZqp5J+n4xUhtvwuNNgjLm3jx
	4IktbDfoq3eM8Cbk36WKHtnYj2bEY/nPbITCuWbDDDg8tCO4TGForWaeRhtn5Jfy2waVJwy/l1zm6
	ItlFnIIjVkDUqIg/OzTcoB9oQYYDlEfII7l2SHQC0thgcGjw8q9z3m2jRQWFbKjuA/8bEx17ARiep
	UrU5uhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKvw-00000006kvK-2GIh;
	Wed, 08 Jan 2025 01:32:32 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKsP-00000006jzQ-097z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 01:28:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso533917a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 17:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299732; x=1736904532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3OGnfMaF6ttidHVZW35hLDvix/z1ZneywWqGiGVTK0=;
        b=nIOB2UYHG8YBckPKKCIR+V6LH84oAkscImky0WQfJgv7szCyNJrPY9It7pR6UI3ouF
         wFk37DV/JKlA77m2UnEI6eZciN+p0dhVnShjj5QvJoqELeFUsQ2/4NQ1ws+s7boo4lf1
         J0Np36ER7svJHke4Dp1ifg2iXa4rC8AgN6DMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299732; x=1736904532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3OGnfMaF6ttidHVZW35hLDvix/z1ZneywWqGiGVTK0=;
        b=F7uCXf4NUCv5nJQK/bic4zKgmq7nlIafyi8iWzg8+VQl/HwqZipDodqKYwe6DA4NO+
         Yj7LRksmc7SJiBv1cCI1vlcsZTZmIaUbPUyDt6+np9G3XURSXzC7V4nsd33lK2b+Xiex
         tSBe0hyHoZgYUYNdloA7p2t1WScLzYcGDrtneTvDsXvGFYd9FrrVFr0I2LbKTsUN/G72
         Obi83qiicwkXarcCPKFWd6Vim3sOYMU655Ae1hwWKH8DyEjFHnSM5kp669rrHnhgUWEK
         8PzvglD8mSq+1PEsWcjAEgPPBZDmrj59sB/pyojwAPSRIlvRaKirY2iz5U9yD6pPixpF
         jICg==
X-Forwarded-Encrypted: i=1; AJvYcCXQybpYYhI2xBufZyFxcex4QEiP8MG+iYrm4MAkSOcMuLRa4pAxZNjqStATRugn+nG3ygve9TZxnfMq6iR8aZRk@lists.infradead.org
X-Gm-Message-State: AOJu0YxrUs0g7OYPo79rdhs3Rpp6P2V6RkqyKs5NtvnqgYtUm/2HpK9v
	cbFrjblT1f+QN/UdU3FxxhKRSjGQNIbzmjRLZzwqSMOxpH42eUv3Rjj1r3RBbg==
X-Gm-Gg: ASbGnct6u3OiOvXplxefu7Ow/BKp7EvRiBtXfk2eQ74G6rUf4VcjrzeTkPwZ6/yiU/J
	73gQRDx37g0Devq3G5QCNGIqvLIx149wVR/1QTkgCAsK8FH3D8MZEZ/wgw9Nx7JhB5hSpiHr4VS
	p566bOyHZev4Imdarxrzvq0LoCTkIoSZZ5w40dhuOpyJgHdeCaXZ9pd1mdhw4bq4IBgOjEuO7qj
	T8dI9ASs1nJueXtYdNRSUszrmObndLFzCUPoowCMLNf4ZoE9GTZnBCe/1OG4bRRHrQf4QprgRJt
	1X2ES+N1zMho0IHPfUOt
X-Google-Smtp-Source: AGHT+IGRIU+NqXGlb71FFJypyGjyxuINnxFY9kBScDBRLLqASUBsZ/TtCxmB7qxtQamZfY7V7xiN8A==
X-Received: by 2002:a17:90b:2705:b0:2ef:949c:6f6b with SMTP id 98e67ed59e1d1-2f53cc6e0e4mr8060729a91.13.1736299732138;
        Tue, 07 Jan 2025 17:28:52 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f54a287254sm196478a91.20.2025.01.07.17.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:51 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [RFC PATCH 2/6] dt-bindings: bus: Add qcom,soc-sc7180 SoC
Date: Tue,  7 Jan 2025 17:28:39 -0800
Message-ID: <20250108012846.3275443-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108012846.3275443-1-swboyd@chromium.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_172853_073016_B8C439B4 
X-CRM114-Status: GOOD (  15.42  )
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

Document the Qualcomm SC7180 System on a Chip (SoC). This SoC is made up
of multiple devices that have their own bindings, therefore this binding
is for a "bus" that is the SoC node.

TODO: Document all child nodes. This is woefully incomplete but at least
shows what is involved with describing an SoC node in dt schema.

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/bus/qcom,soc-sc7180.yaml         | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,soc-sc7180.yaml

diff --git a/Documentation/devicetree/bindings/bus/qcom,soc-sc7180.yaml b/Documentation/devicetree/bindings/bus/qcom,soc-sc7180.yaml
new file mode 100644
index 000000000000..56f8b75ecdab
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/qcom,soc-sc7180.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/qcom,soc-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC7180 SoC
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description:
+  Qualcomm's SC7180 System on a Chip (SoC).
+
+properties:
+  compatible:
+    items:
+      - const: qcom,soc-sc7180
+      - const: simple-bus
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  clock-controller@100000:
+    $ref: /schemas/clock/qcom,gcc-sc7180.yaml#
+
+  watchdog@17c10000:
+    $ref: /schemas/watchdog/qcom-wdt.yaml#
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - clock-controller@100000
+  - watchdog@17c10000
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        compatible = "qcom,soc-sc7180", "simple-bus";
+
+        // TODO: Is it possible to ignore the details?
+        clock-controller@100000 {
+          compatible = "qcom,gcc-sc7180";
+          reg = <0 0x00100000 0 0x1f0000>;
+          clocks = <&rpmhcc_RPMH_CXO_CLK>,
+                   <&rpmhcc_RPMH_CXO_CLK_A>,
+                   <&sleep_clk>;
+          clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+          #clock-cells = <1>;
+          #reset-cells = <1>;
+          #power-domain-cells = <1>;
+          power-domains = <&rpmhpd_SC7180_CX>;
+        };
+
+        watchdog@17c10000 {
+          compatible = "qcom,apss-wdt-sc7180", "qcom,kpss-wdt";
+          reg = <0 0x17c10000 0 0x1000>;
+          clocks = <&sleep_clk>;
+          interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
+
+...
-- 
https://chromeos.dev


