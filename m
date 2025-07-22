Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FEDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6NA/yo32+KJdgbOqI/4qK3ib3wbHYMpUOBfolC25YY=; b=4o7+2YNyjRE+Rz3gERtQ0Gw5Vx
	lVgaxXNx6GAOHoI6C+DPMLu+LcbGX0Rpai2RnmNUuK9ZUUjSdGu7isfXEHqi9oxnEJlVgwzSnA2Bw
	bbciyKiuQSdBiDFgFDX0lBblU0/kooayXHd8CljvP12B0dRo5WpVlAQ0My90yxSohmoOPxfyrgouB
	V2LR983gNLLVwbc6R88+Q4x+hV83Tsa8eYFeobJ2oxlMBBNwhG2v9EnODZNKUUgOnocBMTBydOCnX
	Sy8XIJ3cAqV/nPSlUN+8U0MlSAy/sROTzpm1DLsGIJkOAjLCjObDX4cHaI3sO7gV/5+iy6b47DZ69
	Vv1MXEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueE8H-00000002jXR-3ZHj;
	Tue, 22 Jul 2025 14:38:17 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDdi-00000002dah-2I6J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:06:44 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDbY0C026464;
	Tue, 22 Jul 2025 16:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	D6NA/yo32+KJdgbOqI/4qK3ib3wbHYMpUOBfolC25YY=; b=pTmhKY2iLbLB4KON
	IuA8jn88h+Rsr114+Da4dLmzEPnW3buSJmn1S2TsPmklf/KrATVYboO5TAkXfYK1
	5qJrSv3XC7Ob+cyTOGvc786iEEa64N0StvOCDF0oi3M7+1Q4h/G/KUrjGiRUDg+Z
	brX1QeU1TDiw0E/HMuRnoaK1iTRJBBMR6KyUBH8osH54+MvSMU+MIt+CfvGOqPNa
	PhYM+gQLJxqphj/Wv5JXBJsnZ87GqjDOd3R8nHgc7UB6dzzcJ4VSgdSLUOapy9df
	wF9UhjJ2zSFOzXzg6pe/WdQzLpORsdXfCJVqS6CM+aAiVjtMu1Hs55n6a5gpoKNo
	rzUSsQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8pc4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:06:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A10FA40052;
	Tue, 22 Jul 2025 16:04:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B10D7A31E4;
	Tue, 22 Jul 2025 16:03:54 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 16:03:54 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 22 Jul 2025 16:03:24 +0200
Subject: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
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
X-CRM114-CacheID: sfid-20250722_070642_869762_0FFABAD6 
X-CRM114-Status: GOOD (  14.57  )
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

LPDDR and DDR channels exist and share the same properties, they have a
compatible, ranks, and an io-width.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 ...pddr-channel.yaml => jedec,memory-channel.yaml} | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
index 34b5bd153f63..3bf3a63466eb 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-channel.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,memory-channel.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LPDDR channel with chip/rank topology description
+title: Memory channel with chip/rank topology description
 
 description:
-  An LPDDR channel is a completely independent set of LPDDR pins (DQ, CA, CS,
-  CK, etc.) that connect one or more LPDDR chips to a host system. The main
-  purpose of this node is to overall LPDDR topology of the system, including the
-  amount of individual LPDDR chips and the ranks per chip.
+  A memory channel is a completely independent set of pins (DQ, CA, CS,
+  CK, etc.) that connect one or more memory chips to a host system. The main
+  purpose of this node is to overall memory topology of the system, including the
+  amount of individual memory chips and the ranks per chip.
 
 maintainers:
   - Julius Werner <jwerner@chromium.org>
@@ -26,14 +26,14 @@ properties:
   io-width:
     description:
       The number of DQ pins in the channel. If this number is different
-      from (a multiple of) the io-width of the LPDDR chip, that means that
+      from (a multiple of) the io-width of the memory chip, that means that
       multiple instances of that type of chip are wired in parallel on this
       channel (with the channel's DQ pins split up between the different
       chips, and the CA, CS, etc. pins of the different chips all shorted
       together).  This means that the total physical memory controlled by a
       channel is equal to the sum of the densities of each rank on the
-      connected LPDDR chip, times the io-width of the channel divided by
-      the io-width of the LPDDR chip.
+      connected memory chip, times the io-width of the channel divided by
+      the io-width of the memory chip.
     enum:
       - 8
       - 16
@@ -51,8 +51,8 @@ patternProperties:
   "^rank@[0-9]+$":
     type: object
     description:
-      Each physical LPDDR chip may have one or more ranks. Ranks are
-      internal but fully independent sub-units of the chip. Each LPDDR bus
+      Each physical memory chip may have one or more ranks. Ranks are
+      internal but fully independent sub-units of the chip. Each memory bus
       transaction on the channel targets exactly one rank, based on the
       state of the CS pins. Different ranks may have different densities and
       timing requirements.
@@ -107,7 +107,7 @@ additionalProperties: false
 
 examples:
   - |
-    lpddr-channel0 {
+    memory-channel0 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr3-channel";
@@ -122,7 +122,7 @@ examples:
       };
     };
 
-    lpddr-channel1 {
+    memory-channel1 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr4-channel";

-- 
2.43.0


