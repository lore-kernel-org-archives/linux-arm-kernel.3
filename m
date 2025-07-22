Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFCBC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A939/GpJAC3t+1N2NGPjJLrNWs6MhM0fkRM7WTY2FCg=; b=H0UDUX7TyifT+dW3Re0skP7cVc
	xpRuzDKLacJ9W0cYGjwLxwCZ7mCzuvnVjqcN5mldw543tCouk3eftHw5rJNLREOXyB8PQNDlZxqA/
	M+jHz6HNTB8mYWIvpRAlcHB43fTyNGSkAUrn2A7i1j5fivd4x1d42eSoRm+flO9fizpRcVQ6KDBgY
	ifWWUxYm3Bw3Elg2OBQTgcocG4CcGQoFwvoYg5sXVV1jawTgBh0HyfqRgTK4MFzwPfmlzChW4ap8V
	BaicLYa+rtnTAs5vNEvLhBEmpxR8/1GLivGtLsut+F4VcEkzSo/FYn8nFJG4H4BJLjS0+FXlZUOLP
	7xs53mFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEr1-00000002rYa-1tzx;
	Tue, 22 Jul 2025 15:24:31 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDeJ-00000002dix-1vmF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:07:21 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MBoudE012419;
	Tue, 22 Jul 2025 16:07:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	A939/GpJAC3t+1N2NGPjJLrNWs6MhM0fkRM7WTY2FCg=; b=ju5CmOMFiAkTaQuj
	cZCFIr2OSHAq/K04RUzc0gcpbwVGjhoO+f8jE8ExqN7KJOW6YfR/3fqn974KUDgh
	CdRF8/s4dBSWxB6ZnUtF6ihIs8k9BzFfjinVukuzP44RDbfjGFHtsoyfnFVQwvgV
	1z4qMKY12JEAoxgwrrtvSza3GEE8RKHpbb/71FgzKfXRqGcvG8SWnF3F671wIqDI
	OsLvG8QF3efIiXBY4r/9RL5DMN484sKfq/nkxczWqBzE3ARiVzXJnyBftixWGw7L
	m5JHqykEnBbtjzQh2qDpZyveI4eWh+i1jWhQt0tZJsIpmfs8qwxffcX/9ftayINL
	j5mCVA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q26j8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:07:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8AC1E4005A;
	Tue, 22 Jul 2025 16:05:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EBF87A2A48;
	Tue, 22 Jul 2025 16:03:53 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 16:03:52 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 22 Jul 2025 16:03:22 +0200
Subject: [PATCH v3 05/19] dt-bindings: memory: factorise LPDDR props into
 memory props
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
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
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>,
        Julius Werner <jwerner@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-8018a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_070719_842096_4B005A4D 
X-CRM114-Status: GOOD (  15.94  )
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

LPDDR and DDR bindings use the same properties (at least for density,
io-width and reg).
To avoid bindings duplication, factorise the properties.

The compatible description has been updated because the MR (Mode
registers) used to get manufacturer ID and revision ID are not present
in case of DDR.
Those information should be in a SPD (Serial Presence Detect) EEPROM in
case of DIMM module or are known in case of soldered memory chips as
they are in the datasheet of the memory chips.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |  2 +-
 ...ec,lpddr-props.yaml => jedec,memory-props.yaml} | 24 +++++++++++++---------
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
index a237bc259273..f290a25675b2 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 allOf:
-  - $ref: jedec,lpddr-props.yaml#
+  - $ref: jedec,memory-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
index e328a1195ba6..994127dbcdca 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 allOf:
-  - $ref: jedec,lpddr-props.yaml#
+  - $ref: jedec,memory-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml
index a078892fecee..753376a3ad1f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 allOf:
-  - $ref: jedec,lpddr-props.yaml#
+  - $ref: jedec,memory-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml
index e441dac5f154..27e2bbdb631d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 allOf:
-  - $ref: jedec,lpddr-props.yaml#
+  - $ref: jedec,memory-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-props.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-props.yaml
similarity index 72%
rename from Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-props.yaml
rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-props.yaml
index 30267ce70124..0bc919fd8b53 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-props.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-props.yaml
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-props.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,memory-props.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Common properties for LPDDR types
+title: Common properties for memory types
 
 description:
-  Different LPDDR types generally use the same properties and only differ in the
+  Different memory types generally use the same properties and only differ in the
   range of legal values for each. This file defines the common parts that can be
   reused for each type. Nodes using this schema should generally be nested under
-  an LPDDR channel node.
+  an memory channel node.
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
@@ -21,14 +21,15 @@ properties:
       Compatible strings can be either explicit vendor names and part numbers
       (e.g. elpida,ECB240ABACN), or generated strings of the form
       lpddrX-YY,ZZZZ where X is the LPDDR version, YY is the manufacturer ID
-      (from MR5) and ZZZZ is the revision ID (from MR6 and MR7). Both IDs are
-      formatted in lower case hexadecimal representation with leading zeroes.
+      (from MR5 in case of LPDDR) and ZZZZ is the revision ID (from MR6 and MR7
+      in case of LPDDR). Both IDs are formatted in lower case hexadecimal
+      representation with leading zeroes.
       The latter form can be useful when LPDDR nodes are created at runtime by
       boot firmware that doesn't have access to static part number information.
 
   reg:
     description:
-      The rank number of this LPDDR rank when used as a subnode to an LPDDR
+      The rank number of this memory rank when used as a subnode to an memory
       channel.
     minimum: 0
     maximum: 3
@@ -36,7 +37,8 @@ properties:
   revision-id:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description:
-      Revision IDs read from Mode Register 6 and 7. One byte per uint32 cell (i.e. <MR6 MR7>).
+      Revision IDs read from Mode Register 6 and 7 in case of LPDDR.
+      One byte per uint32 cell (i.e. <MR6 MR7>).
     maxItems: 2
     items:
       minimum: 0
@@ -45,7 +47,8 @@ properties:
   density:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Density in megabits of SDRAM chip. Decoded from Mode Register 8.
+      Density in megabits of SDRAM chip. Decoded from Mode Register 8 in case of
+      LPDDR.
     enum:
       - 64
       - 128
@@ -65,7 +68,8 @@ properties:
   io-width:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      IO bus width in bits of SDRAM chip. Decoded from Mode Register 8.
+      IO bus width in bits of SDRAM chip. Decoded from Mode Register 8 in case
+      of LPDDR.
     enum:
       - 8
       - 16

-- 
2.43.0


