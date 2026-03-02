Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2574D58E43
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 02:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9X0pQB0h7RMWoFe0LdtBhzPyvjyQ0F+JKWx4b1TrX0=; b=r3aF8h06SwKrexfTIzxy5MjAKK
	sNoxe1lcD7RW+jpXrw0tVGKTg8QbJjUZWuY3DSZbXWeSMhEAzlGJN8X3L/sfBpFseBy8v56/9aTE/
	7bXAtqnzQ0Fr6r2zvJxEvMwq40pg67nR16P6koFbDeRGFYNc90pDz4w4seWSc/hsk1f6r+VUqRoZq
	SdlUN91B8YrvQ1CDuwPhpZlBmmYNvJMlF546PVuhAaLr1ZeqqQabWva2v/8yn3cJI8gySm4niF7/p
	l12+V39e+qyZFI4G9l8CawzLlRLPoU5rToGbOVfeAbv+o72z6aQcSUx5l6QbH75zWyrwYoeAOtoBx
	NhQgoZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsiI-0000000C5k3-467p;
	Mon, 02 Mar 2026 02:08:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsiG-0000000C5jJ-1oxl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 02:08:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8273eb7798eso1627666b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 18:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417327; x=1773022127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9X0pQB0h7RMWoFe0LdtBhzPyvjyQ0F+JKWx4b1TrX0=;
        b=hVImdW3wpQLJgVOgyHMOQA6+TkAeEMuHN5CW010wPFaoqZ5pOA7W61z5CuNl/3Xjox
         BBKDrWquP8v05EAOrsBqzutVTky/SiClscQenPkKksN9BeTEO4J0IJp7LJb6vtl+lekX
         ONZbhrlf1JNt8UVChhrFz3KGa1rcaofVH9LwN1NgHWzKyIMgw9DDRJFP1/1AKG6B34Kz
         mkTjW3qQfkBkKny7hU+Irxa9QGCEIxD+oSLS06LF5cXnc/sVSx4crWDIaOD3aBfrNon8
         bgT95kKRFL68m1y8+ZGrM5ua6HZBjcmVDtYBxvsZJBD5Xcq8+eo0SkKbD80wo78Ji3j/
         0zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417327; x=1773022127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F9X0pQB0h7RMWoFe0LdtBhzPyvjyQ0F+JKWx4b1TrX0=;
        b=UrnsnRM+7pW4JKO8DkQgaNwBu3kqLukjU9UbSYVZ49Z/c6dyEmJL2u/bl0/QeVh353
         3d53LcNoVYpaQjyIAz573GOULGL9kjE+qGQMgLTIayc9IvOzA+WMppqBi/o3Vrva8XYc
         iqpWszObJ5m2xkd8aohjS/ndD3Tvyw+wXbUaVWIE0NNNwJCAyAjQNwORGTUB7RhOpnEB
         9bFr0kLwYtGOtPYWWlbYYqeYr6/H+xO46wQcJ/Kv8ZyZxBAV2lorBpFTnTtYuMxJqK+7
         AmWjEDEoQjaTkLoD9HTcJ52cDF1CukJUnhlfYUwIhsXQPO75V3aTmMHRatq6e7bs8dy0
         kR8w==
X-Forwarded-Encrypted: i=1; AJvYcCV2/Ix5hbwtZHqcNn1zleMOOC9I3q8kn0JbEsr2t7rlguP5xnQGUzSb6lQSlvjtGgX7lDcMbUfBqfLSbZFdojuH@lists.infradead.org
X-Gm-Message-State: AOJu0YwflDFkhQcnZ+hkg7TzphoVa19Q/Jl4UTavxqnPabEMNAaTL7sW
	2d8C3tsfXz6l84zgQNlpKQoAiF9x2pRjedSsMplfw/BifACBeuIpvd4z
X-Gm-Gg: ATEYQzyFZm7AQzCKblz7p4BegVc206xyMLfRLtgvLR3YCP7WrKmwvkPAsPj5VRP1SDX
	KzXvs5JfiLd8cPxqRMS67Aco6cyqYK+ODXfKndAQxdtj0eB6Ce36o+99reBsUJAWBDt8W9NQDR6
	W1BSUTgGZosE6TrWHBOp/mzn8aWifJiyRl9rIHQarxbWoxjrXsjl8+uC6aeoEF+jwdLDtUhGyyG
	J1/zXBbXklj55zCD7JB7nI/inyzVd4zWH7pELWLS8GH/qYD93yd3Lhjy87SvsCKuz4Lhgg1PlsT
	VaDtQjOOLAzf2nvPTH+CkZuhRp3xBV9V7L3kX8yZOJCqo9oo15L6GC0ubBeG8gpbw2VqH4frACu
	ATw82GzvR34yaavDusJMypgQuqy/YbLyd9jsAvl1C4VDcUR8tkjJ7LD4vKHacC77PUHxaOyBWCa
	z/hcfSEEJRsjIclCnFlCrR5K5Gcf09hR7woAgXz6ndvvaAZ6Oil/3tIGDbQj/fjO2EB8YCFC4OO
	/KZFmY4Jg==
X-Received: by 2002:a05:6a21:118e:b0:394:5d0d:9217 with SMTP id adf61e73a8af0-395c3ae7761mr9855958637.44.1772417327548;
        Sun, 01 Mar 2026 18:08:47 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35987523629sm2764697a91.7.2026.03.01.18.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:08:47 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: andi.shyti@kernel.org,
	ychuang3@nuvoton.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zychennvt@gmail.com
Subject: [PATCH 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Mon,  2 Mar 2026 02:08:20 +0000
Message-Id: <20260302020822.13936-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302020822.13936-1-zychennvt@gmail.com>
References: <20260302020822.13936-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_180848_476827_23E4A55E 
X-CRM114-Status: GOOD (  14.81  )
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

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..fa8b01e2c5b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description: |
+  The Nuvoton MA35D1 I2C controller supports master mode and optional
+  slave mode operation. The controller is configured via Device Tree
+  and supports interrupt-driven I2C transfers.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x10000>;
+      interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


