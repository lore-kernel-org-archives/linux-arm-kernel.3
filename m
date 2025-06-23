Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E5CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxYJdm+vIW2mkVXU2bP4ej7pG694JeHb3sv9IaD0GlM=; b=dF0U9ZiLW8lv18MuzFmyiLZXym
	RTixpSVNo8/ahfoj+1tyq06Ji/tmvBBhGCOLLhfY3YY8juQg0bTWbDtwqKHHoAsiNlv0CCdl0vEOg
	cMAWrO3KkFPSCklNJHpPmWWs4Xe5UvBlJQDQOtJ8aei6nAJEXJ+wlDgdA8VSEKnWYwrSHRoTMpQbv
	B9scDw7r1Kike/L26HaUbq/H0CQSNC2MsuJd8wNPwOJaVOroTxyNLFRP3mHj9kwGB4Z+i39irEBnE
	VRSWRloYNIbCSpuqD0n2J8aALaOunhQRYB8NopvGrOojR5Xef8Ish44cGtEl39Vap5KeHL/aDh6v7
	gI8tbUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdsO-00000002FhJ-2vao;
	Mon, 23 Jun 2025 09:54:08 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdV0-00000002Awt-3gzI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:30:00 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N91VaZ013223;
	Mon, 23 Jun 2025 11:29:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	HxYJdm+vIW2mkVXU2bP4ej7pG694JeHb3sv9IaD0GlM=; b=Zh/vzDdMFPiarDuj
	9VlLwmbUlKhvIXvJ+C5gC/Dqxg/moeDlyqc/tuzr4YUIT//o4Ad+SobW7iSqREDH
	GbBVMfwHtlMNNdqSj7tV4EH7fMsuuuhX7IroRoSA7RDhUqjO2gmNYNTPqRM+IaXx
	wknXBfoH7zwvb16Vamxfhboi5FzsCucqUlthwNWvAhD+n9gJAVMrXlcU+vlDVpIF
	4Sn7n8BfDx9nTF5lZ/rJn+1BgE4d/dt5jpbiJoqkYhaYbNbb7PjSMG+85LHb43kW
	Quq7hf1z9QR/cYjtOQ94g4949HSx0+oWLiDX8pkR85yxD+qt/B30ycXrqZPi4s5T
	ygTzIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbevd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 11:29:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4420940047;
	Mon, 23 Jun 2025 11:28:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D3AA5C3DD9;
	Mon, 23 Jun 2025 11:27:25 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 11:27:25 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 11:27:10 +0200
Subject: [PATCH 05/13] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250623-ddrperfm-upstream-v1-5-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
In-Reply-To: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_022959_201136_30CD6DCC 
X-CRM114-Status: GOOD (  13.53  )
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

DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
It allows to monitor DDR events that come from the DDR Controller
such as read or write events.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
new file mode 100644
index 000000000000..35d34782865b
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Clément Le Goffic <clement.legoffic@foss.st.com>
+
+title: STMicroelectronics STM32 DDR Performance Monitor (DDRPERFM)
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp131-ddr-pmu
+      - st,stm32mp151-ddr-pmu
+      - st,stm32mp251-ddr-pmu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Reference clock for the DDR Performance Monitor
+    maxItems: 1
+
+  resets:
+    description: Reset control for the DDR Performance Monitor
+    maxItems: 1
+
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
+  st,dram-type:
+    description: |
+      This property is used to specify the type of DRAM memory connected to the
+      associated memory controller. It is required for the DDR Performance Monitor
+      to correctly interpret the performance data.
+      0 = LPDDR4,
+      1 = LPDDR3,
+      2 = DDR4,
+      3 = DDR3
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp131-ddr-pmu
+              - st,stm32mp151-ddr-pmu
+    then:
+      required:
+        - clocks
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp251-ddr-pmu
+    then:
+      required:
+        - access-controllers
+        - st,dram-type
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+
+    perf@5a007000 {
+        compatible = "st,stm32mp151-ddr-pmu";
+        reg = <0x5a007000 0x400>;
+        clocks = <&rcc DDRPERFM>;
+        resets = <&rcc DDRPERFM_R>;
+    };
+
+  - |
+    perf@48041000 {
+      compatible = "st,stm32mp251-ddr-pmu";
+      reg = <0x48041000 0x400>;
+      access-controllers = <&rcc 104>;
+      st,dram-type = <2>;
+    };

-- 
2.43.0


