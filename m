Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666F0D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mxUGDWjQ9NguFK3rUEO18MYDJEvo9VLccfwDD5+w38=; b=EDf7urcfRi3Yek1bCVJRJ7+VHj
	OA5ErQ/N2lYO0+90sCDjGBSTsMYNGsde3hwqhpoZnSnl8181TzM4UBhtsn0wK9dYPgd8SewDxJzSw
	JO0vHkMqWBZtzLMtAg+DM8wTPVEYqJLEtP4SeF+XL2+8gC420mi/z23gNSRp4gidUVecY6kkANqo+
	sKJxPAo2t/Oby94JEVFbr/Gj+h44EuItOsVQs3XsEgHfps/NuSeGK9acn8DNzKHlTRE+pG615STlS
	joy9eNWHcdQEoWk3CMevkUs1/5iftAbZO1brGyd+TBux5igO85jAPamfxty7PxELMQJQy6v9XpncD
	30EcjEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsX-00000003zsp-1z61;
	Tue, 20 Jan 2026 14:38:45 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsJ-00000003zo5-08BQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:38:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CABF8148AD3F;
	Tue, 20 Jan 2026 15:38:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919907; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8mxUGDWjQ9NguFK3rUEO18MYDJEvo9VLccfwDD5+w38=;
	b=Mt3JeJBjz6yH+aPyOuHtXYQMkJgheqZYPcbWBdz0Xr1T2YUHCAwx9Dr0zx12yyAzOUaNKg
	K4zwUq4QcOSUSEGacPIE3y/5Q+d0QwyDygU9Tv5YCivxrcyhKn8VfWcXyqXFW1JkAHtYYx
	dorH+CWIrOZ4la/XUuKMfjPrhRHcMzSmpts99hjh0PsfOzcfnoIQB/JxaxiwYZdyadJl0w
	bFIMCGQg/0lWwsjEnq1CyaICrf8Ku9J8Nk4xE7D1/8DAmt55eybJ4iSgXbm1fOJ0ntmB3n
	Hn+6MeYS8n+dQGlP9INgDfoiS+8xmcSMVmD2udnaM55qHsCIiraIZGR6BHAKyQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 02/19] dt-bindings: clock: at91: Split up per SoC partially
Date: Tue, 20 Jan 2026 15:37:23 +0100
Message-ID: <20260120143759.904013-3-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_063831_391541_20C1DA48 
X-CRM114-Status: GOOD (  14.25  )
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

Before adding even more new indexes creating more holes in the
clk at91 drivers pmc_data->chws arrays, split this up.

This is a partial split up only for some of the old PMC definitions.

Binding splitup was proposed for several reasons:

1) keep the driver code simple, readable, and efficient
2) avoid accidental array index duplication
3) avoid memory waste by creating more and more unused array members.

Old values are kept to not break dts, and to maintain dt ABI.

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - full splitup for all at91 family SoCs instead of just a few
    
    v2:
    - new patch, not present in v1

 .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
 .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 15 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 +++++++++++++
 .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 15 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 15 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 15 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 15 ++++++++++++
 include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++++
 include/dt-bindings/clock/atmel,sama5d3-pmc.h | 14 +++++++++++
 include/dt-bindings/clock/atmel,sama5d4-pmc.h | 15 ++++++++++++
 .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 ++++++++++++
 .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 +++++++++++++++
 .../clock/microchip,sama7d65-pmc.h            | 24 +++++++++++++++++++
 .../dt-bindings/clock/microchip,sama7g5-pmc.h | 19 +++++++++++++++
 14 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h

diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
index 84c4801df8d9a..8c89ccc3d6393 100644
--- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
@@ -67,9 +67,10 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
 
     reset-controller@fffffd00 {
         compatible = "atmel,at91sam9260-rstc";
         reg = <0xfffffd00 0x10>;
-        clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
+        clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
     };
diff --git a/include/dt-bindings/clock/atmel,at91rm9200-pmc.h b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
new file mode 100644
index 0000000000000..ab0d0d7a3b655
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91rm9200 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
+
+#define AT91RM9200_PMC_MCK	1
+#define AT91RM9200_PMC_MAIN	3
+#define AT91RM9200_PMC_PLLACK	7
+#define AT91RM9200_PMC_PLLBCK	8
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9260-pmc.h b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
new file mode 100644
index 0000000000000..6a5453cf70954
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9260 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
+
+#define AT91SAM9260_PMC_SLOW	0
+#define AT91SAM9260_PMC_MCK	1
+#define AT91SAM9260_PMC_MAIN	3
+#define AT91SAM9260_PMC_PLLACK	7
+#define AT91SAM9260_PMC_PLLBCK	8
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
new file mode 100644
index 0000000000000..63134ecafa50c
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9g45 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
+
+#define AT91SAM9G45_PMC_MCK	1
+#define AT91SAM9G45_PMC_UTMI	2
+#define AT91SAM9G45_PMC_MAIN	3
+#define AT91SAM9G45_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
new file mode 100644
index 0000000000000..e41ad6d68108a
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9n12 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
+
+#define AT91SAM9N12_PMC_MCK	1
+#define AT91SAM9N12_PMC_MAIN	3
+#define AT91SAM9N12_PMC_PLLACK	7
+#define AT91SAM9N12_PMC_PLLBCK	8
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
new file mode 100644
index 0000000000000..4306d457f8d2b
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9rl clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
+
+#define AT91SAM9RL_PMC_MCK	1
+#define AT91SAM9RL_PMC_UTMI	2
+#define AT91SAM9RL_PMC_MAIN	3
+#define AT91SAM9RL_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
new file mode 100644
index 0000000000000..d3e612f063a00
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9x5 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
+
+#define AT91SAM9X5_PMC_MCK	1
+#define AT91SAM9X5_PMC_UTMI	2
+#define AT91SAM9X5_PMC_MAIN	3
+#define AT91SAM9X5_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,sama5d2-pmc.h b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
new file mode 100644
index 0000000000000..1690a69087522
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama5d2 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
+
+#define SAMA5D2_PMC_MCK		1
+#define SAMA5D2_PMC_UTMI	2
+#define SAMA5D2_PMC_MAIN	3
+#define SAMA5D2_PMC_MCK2	4
+#define SAMA5D2_PMC_I2S0_MUX	5
+#define SAMA5D2_PMC_I2S1_MUX	6
+#define SAMA5D2_PMC_PLLACK	7
+#define SAMA5D2_PMC_AUDIOPLLCK	9
+#define SAMA5D2_PMC_AUDIOPINCK	10
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,sama5d3-pmc.h b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
new file mode 100644
index 0000000000000..85b772ccd996a
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama5d3 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
+
+#define SAMA5D3_PMC_MCK		1
+#define SAMA5D3_PMC_UTMI	2
+#define SAMA5D3_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,sama5d4-pmc.h b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
new file mode 100644
index 0000000000000..15b812e1b9259
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama5d4 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
+
+#define SAMA5D4_PMC_MCK		1
+#define SAMA5D4_PMC_UTMI	2
+#define SAMA5D4_PMC_MCK2	4
+#define SAMA5D4_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
new file mode 100644
index 0000000000000..91f8f863ea076
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sam9x60 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
+
+#define SAM9X60_PMC_MCK		1
+#define SAM9X60_PMC_UTMI	2
+#define SAM9X60_PMC_MAIN	3
+#define SAM9X60_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
new file mode 100644
index 0000000000000..e1dd41fe75046
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sam9x7 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
+
+#define SAM9X7_PMC_MCK		1
+#define SAM9X7_PMC_UTMI		2
+#define SAM9X7_PMC_MAIN		3
+#define SAM9X7_PMC_PLLACK	7
+#define SAM9X7_PMC_AUDIOPMCPLL	9
+#define SAM9X7_PMC_AUDIOIOPLL	10
+#define SAM9X7_PMC_PLLADIV2	14
+#define SAM9X7_PMC_LVDSPLL	15
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
new file mode 100644
index 0000000000000..09d152da6db44
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama7d65 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
+
+#define SAMA7D65_PMC_MCK0		1
+#define SAMA7D65_PMC_UTMI		2
+#define SAMA7D65_PMC_MAIN		3
+#define SAMA7D65_PMC_CPUPLL		4
+#define SAMA7D65_PMC_SYSPLL		5
+#define SAMA7D65_PMC_BAUDPLL		8
+#define SAMA7D65_PMC_AUDIOPMCPLL	9
+#define SAMA7D65_PMC_AUDIOIOPLL		10
+#define SAMA7D65_PMC_ETHPLL		11
+#define SAMA7D65_PMC_MCK1		13
+#define SAMA7D65_PMC_LVDSPLL		15
+#define SAMA7D65_PMC_MCK3		16
+#define SAMA7D65_PMC_MCK5		17
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
new file mode 100644
index 0000000000000..0303cae56f849
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama7g5 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
+
+#define SAMA7G5_PMC_MCK0	1
+#define SAMA7G5_PMC_UTMI	2
+#define SAMA7G5_PMC_MAIN	3
+#define SAMA7G5_PMC_CPUPLL	4
+#define SAMA7G5_PMC_SYSPLL	5
+#define SAMA7G5_PMC_AUDIOPMCPLL	9
+#define SAMA7G5_PMC_AUDIOIOPLL	10
+#define SAMA7G5_PMC_MCK1	13
+
+#endif
-- 
2.47.3


