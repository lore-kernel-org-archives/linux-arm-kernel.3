Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A557CDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqOpgB33k4/mfFlaB0ddO360BTxT44SjwW5dyAWL/lc=; b=VjnC3cpNkC0qNL+y/5wvwuoMXe
	jfBFVDIdDu2W5zwJGT1caLnTCRK3R3xsMDz/WiWkvuV/RWfQtkEKJQEXWnebX75QTUAmFryUkuRyg
	rpGxzQk6CwSPvQUO/bJoxWX0ft/CRMilCLhMpxWrgDDISuoWeoL6eebVK+cBRnlwK9Lzu7T2qJ1Wd
	wuPJOkOD5mBctOm+aNhmel15pWXhkFCTPMa3BL9ftEwThmF1hOy/YxppEqpX0YwfTmrPF+aAXeiOK
	2xG47LUTt8eNmlpl2zfYfNRtIkkzJjr3b9RhLKs0RP+EIq7kMk04I0PvOhhti8ytBDdpqSN4ii5tY
	QN4Vq9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zqb-0000000EDET-3AFG;
	Wed, 23 Oct 2024 11:48:17 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZOo-0000000E7CN-0I3M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:19:35 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e2e23f2931so5275980a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729682373; x=1730287173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqOpgB33k4/mfFlaB0ddO360BTxT44SjwW5dyAWL/lc=;
        b=ThXzv8GUfTyRAR9rrc4zdiyXr+lQag3wLEN/7tWBfvH09moVnwkiEcAc5QavH6ViHG
         8cJDMntLEkJutPO6UPF668cQVnlZglDTWvtNsxLkCysP6Hx1s0AKOf41WR7Jz9CCtXCP
         qrYMyU0Rl1aHKlRyHpaHTHcWajAXy6lcSN26TVHE03YHmr8GkK5uELEfkeEMWzCYfmzX
         afrW1rxv+ztV7JMCypXxyaoKYyeYy0ts1wNSf1irhFM0SM7a6gYNktVKrJBwOiw2lQ4+
         O5DDQiWxJWdXOljIKgkn0h3/1wEASn1l04IU2glkw9TiJATFdvgLhZsWmgYplO8DSCeC
         DGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729682373; x=1730287173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqOpgB33k4/mfFlaB0ddO360BTxT44SjwW5dyAWL/lc=;
        b=IEQxHPFol/LgYAfF1E4mk1VaV1r8/XHoe2RU3xScVZvUdHT+Ip//nbUa0fFRJtQ4wm
         q7qPv/bQWWeWJZ7S5Kou8U00BZZ6uZ/W/bMvNNNR1wIjBzomAA0UNr9hhopBmBmym82m
         kMg38uAmZM/woxnY7bo4aJc3j28Y8obvjlkvES3LSyHW/b7/MDIwiV9A4zmCbzpi43FV
         MlmycXUvo2XOdjo28ZyO7MeWNnhsTQpBo9gS2qxiLHl+Dx26/S/0ii2Y8ahrP9qgIvfy
         2VMbFZDL/lM3bDHdziF2mB13qYVq7C1ZwyaffaQ6NlLz5rEZErDOtXm/kUpSBRlbAt5i
         vEJg==
X-Gm-Message-State: AOJu0Yz5xFIHEwJ+c6PbXLmHWaAphOV72mZR4X0PXvdiM4FHHhp/LXK+
	ua9XaY6RB/WYThWOjkOIsptP1yZJURVLCYLSkiIZsjwXYoYvV6x2
X-Google-Smtp-Source: AGHT+IEin3sjWOtfvIYwT9evqPpZcOOHK7pwuX8tT5ydwm5VvnSgyFGBNyrr28EQmP3Dm/F/cgGiJg==
X-Received: by 2002:a17:90a:9e3:b0:2e7:6a44:daff with SMTP id 98e67ed59e1d1-2e76b5dd9aamr2507058a91.10.1729682373000;
        Wed, 23 Oct 2024 04:19:33 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76dfbeca4sm1123022a91.32.2024.10.23.04.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:19:32 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: pwm: nuvoton: Add MA35D1 pwm
Date: Wed, 23 Oct 2024 19:18:40 +0800
Message-Id: <20241023111841.158049-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241023111841.158049-1-cwweng.linux@gmail.com>
References: <20241023111841.158049-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_041934_126680_B5C12059 
X-CRM114-Status: GOOD (  12.42  )
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

Add dt-bindings for Nuvoton MA35D1 SoC PWM controller.

Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
new file mode 100644
index 000000000000..ed32fc573a24
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
+    const: 2
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
+      #pwm-cells = <2>;
+    };
-- 
2.25.1


