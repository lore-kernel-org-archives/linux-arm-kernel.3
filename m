Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8108D606D810
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ApMrdmH;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b9PsTNz7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b25tkkPNAeRRnpE+CMTponpLZXifzTvvMAoqNcMPDG8=; b=2ApMrdmHGw4nrh
	KoC6jW9IgQP/HkOIt8ABo9wo42JcH7l/q0qwiteMXsH8WQ7gfcR+FKY3D6MoeBwR3msLftznWtWgj
	W5b+hGfB1aqXydWQyxrZMJdJWInlux+w83XEQM5khgnN5J4wMUa4GXfJokbI1VYPvW2yJphVsRH81
	1+b3/cY9YAnPaEpTNe2Kd95iTCOqUjZ0WIh+OE5CF45N7LFFN7zUkzLKWdHvjgi4irFWo2V3eHIwE
	PsTwQVd/5XoemD5qj41qErlRsdiD96ubeIqxaQPpdtoQQ6O9/J40oKunkpahq7QBeRwOsyOC/Us8j
	rfU893ACs7InMTawKwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLR-0000000BZqE-0EqG;
	Fri, 06 Nov 2026 08:30:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLK-0000000BZfn-2LmC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso904500f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953837; x=1794558637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b25tkkPNAeRRnpE+CMTponpLZXifzTvvMAoqNcMPDG8=;
        b=b9PsTNz7w9zvD8j7m4caYFKGA5Qm4IyYu0qhTz0ySlMWOYBH67NkYjxFmcucYjxq2a
         E5dhwjBHRFpqkR37Cbe1K/r/uv23ehwKP4bH4e7QtXZNgf5OAOR+EAz3zTi7CqOtDcAC
         SZiM4kYc1MNqiAy/AWzZUmNrbLjbpLHL4HtVRFW60pA+zKEjMYDXyRhApufs0triRZd2
         2tGelmHkUYGd1VSoveE9MzHOvaE4ijnZAa+WzIRM5OxUckUo7Uw4Pvl+PAFqhkmUWiEc
         sn7M99335G+4KAz4TG4TpzcMPtV+YBzea1VPUpF18SrS5ld8EHN75G3pVaiFKsc8fwN1
         0XWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953837; x=1794558637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b25tkkPNAeRRnpE+CMTponpLZXifzTvvMAoqNcMPDG8=;
        b=sgru1zxfPB+PYuh4xdq69aTYxlfhVcfJw36RN6kNWv7vztT3w4u/w+44Td5mDcHPby
         CLPre4TIUVplh+O0p/llQe7uZVEstHmY9RxL3+yPLNaEWYe+QEOyBmgXx92usI7IBsi9
         yIWjm/90KwlHa5Bk3cYKtxw83yF5BmAZ/wekYfvUXuo9h0zggFkPovvfk87+wueJFsEX
         4l0qArSPnyrs2FMFLAqP6AvoM3zPUfalLcYUrS0JW3uuxEJIR/b6Hx4Ak+gGwTqnG7J2
         1ppClYRsAofVXK869EkmC/fORu7WrpCPT7sdwebOjPRDJFvuvcxFF37VWFMgjdNin7Fc
         gO9Q==
X-Forwarded-Encrypted: i=1; AL+hErEUmleCwI3oeUHCDiHCramWDSqZvbbZB9iECyFyqhyCSH3joEsQE+qmKjdzDao47dy3LCNV+Qy+cPKSFXMeANX1@lists.infradead.org
X-Gm-Message-State: APuU4Z9nAIMWI3Ib8eEokkBNzFe4rtQ8CJHlFWYjEpU2T9jEJ+xeybsm
	XHiAw2XU5fo/3aUfmA8XLasqbpH5EI5Xx+eZMtvAWVCCQ2PGHjobEFcYLvc0sYBvzi8=
X-Gm-Gg: AYBFou3Ftc8nNQu7CxupwPyIgxuRyPTERxGARpc2hILli7BAksF2UolXmhcNYWd/pzT
	ztm+nPmZRltsKH/l2vgXq+iSWoEchs663+YIdCy5Jt4xJCI+62wHJES1QU7znnrZtfgvZY01ViF
	oOIsfnw62Gjsuj0M5A5xqR6p3D60mWnFcixkCjT0eSIcLQj6gSwKXQvnjiPUeBXp/6m2PVKKugb
	UASFOzf71iTDpdQMwlJ+MGZQFIGPDZDIQo5uttCwnSDTa8jZs/2G4Bodl0beHQeHeSmmrjTF31z
	91BqErY/CNAUobruKOuyTovCX2TNTNFVxjvxb5E2PMmd1XfC49Vn9Z+MWfKHLAs96knztebJw4O
	mPTC3uv2ovdV+MMhzZbFIzcMuIINYMzD3U9zJeXVjz4oeD0g3UbVmlW9yomJIBIdYf9HSUYYzA4
	+Vz6ifbkWAyJgoe42lxGgowCQbDYKmsWNxhaoFbViUQ4dq1ANH7qTAMgBWbzPMZx+WFHS0bKt5T
	2MChYyQj7sxH5NmqfXb55dKk9y25F93bhGbwpPAaPllEJpIVxnJfgl/P8pPquRhSsDmmxQiTDNG
	D6m7jrCVrLvNPHx5mIvdlg0dfova3qWdOyMLdddUOSxlbYVzEoKNvPvBKYY4az9rEUpKPmChklK
	hbU24iuIOMSqYJEtWHaMMVDhJhKdRBWvIyuzH+xxCRK1kog==
X-Received: by 2002:a05:6000:469b:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-4911ab4c665mr5700123f8f.29.1793953836751;
        Fri, 06 Nov 2026 00:30:36 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:36 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:27 +0100
Subject: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003038_638465_4130F530 
X-CRM114-Status: GOOD (  12.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 PLL controller supplies clock sources for the peripheral clock
tree and receives its reference clocks through firmware-controlled
oscillator gates.

Add the binding and clock identifiers needed to describe this
controller and its connections.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 73 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
new file mode 100644
index 000000000000..e2b5ba5524a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S7 Series PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Carlo Caione <ccaione@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,s7-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: input fixed pll
+      - description: input gp0 pll
+      - description: input hifi pll
+      - description: input hifi1 pll
+      - description: input hdmi pll
+
+  clock-names:
+    items:
+      - const: fix
+      - const: gp0
+      - const: hifi
+      - const: hifi1
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@8000 {
+            compatible = "amlogic,s7-pll-clkc";
+            reg = <0x0 0x8000 0x0 0x1e8>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_HDMI_PLL_OSC>;
+            clock-names = "fix",
+                          "gp0",
+                          "hifi",
+                          "hifi1",
+                          "hdmi";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
new file mode 100644
index 000000000000..4014314a3eb0
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_VCO			0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2_DIV			2
+#define CLKID_FCLK_DIV2				3
+#define CLKID_FCLK_DIV3_DIV			4
+#define CLKID_FCLK_DIV3				5
+#define CLKID_FCLK_DIV4_DIV			6
+#define CLKID_FCLK_DIV4				7
+#define CLKID_FCLK_DIV5_DIV			8
+#define CLKID_FCLK_DIV5				9
+#define CLKID_FCLK_DIV7_DIV			10
+#define CLKID_FCLK_DIV7				11
+#define CLKID_FCLK_DIV2P5_DIV			12
+#define CLKID_FCLK_DIV2P5			13
+#define CLKID_GP0_PLL_DIV0P5			14
+#define CLKID_GP0_PLL_VCO			15
+#define CLKID_GP0_PLL				16
+#define CLKID_HIFI_PLL_DIV0P5			17
+#define CLKID_HIFI_PLL_VCO			18
+#define CLKID_HIFI_PLL				19
+#define CLKID_HIFI1_PLL_DIV0P5			20
+#define CLKID_HIFI1_PLL_VCO			21
+#define CLKID_HIFI1_PLL				22
+#define CLKID_HDMI_PLL_DIV0P5			23
+#define CLKID_HDMI_PLL_VCO			24
+#define CLKID_HDMI_PLL_OD0			25
+#define CLKID_HDMI_PLL_OD1			26
+#define CLKID_HDMI_PLL				27
+#define CLKID_HDMI_PLL_PIX_DIV5			28
+#define CLKID_HDMI_PLL_PIX_DIV6P25		29
+#define CLKID_HDMI_PLL_PIX_DIV7P5		30
+#define CLKID_HDMI_PLL_PIX			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */

-- 
2.56.0


