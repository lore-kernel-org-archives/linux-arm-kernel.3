Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7D4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7LWlOLtHEVsw7QyER6FfjOKmrZdqB2/hdIwi6Hbs9U=; b=l8xT5AeFcBoXFbIlGGlwEvcLkM
	NiiB6iXiDJf59alzgtfnhmyNnEDtg3fqzJ7oCLCubNj6Y2Pl9k2ibGi4qt23NMDJPp7zMEvuStAcT
	DLGVZZALMpGvumpZFDmfYB0siCA6cCot+ORsmoBTXMZlbgH6jnaupBCRbHjRAjVME2u5Poav1dSjf
	fZzk1XsIGeW9o9Gc/htaexuEXkE29/MTWwVKxufrL1/ULX9n8bSKj3pK4zkuB2ADsNzzeZTIzBtLX
	yF/WbKiSADYfSQ4FgnshbF2O+ggRWQrqgpdyjs+qjEcowFbUI4sWolj+sf42qZim/HWQP3X13OLeX
	Gi8qFjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQ3R-0000000EsDu-2fXC;
	Mon, 28 Jul 2025 15:46:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPqZ-0000000EpJN-1v3I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:33:04 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SDnfmq008418;
	Mon, 28 Jul 2025 17:32:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	a7LWlOLtHEVsw7QyER6FfjOKmrZdqB2/hdIwi6Hbs9U=; b=BIJYTa99Mpig0rQc
	wd+FwDNdRmK1zEh5JSgDPnTn9UH+2V80VAbm09FKd9sUjx1XU9Sfncy0wrTL5KHA
	r4vzSz0kBwT93R8JDq95SOocQkcJsM4s2CrsX3f8EF0m+JoZgfzoZ1Zy8ObRilei
	JTeoLfJ4meHaI8vR3KL8G3IZQ+rXmn6MgFriiSJ6LCE5ioYCmhqCK+OvbRMX5B+R
	HvTYi8on1jPP1fxNHWOB9jSEqHN3WhhLE8PkhqiUQTTz/rMAc3tTBOUQCnVCoMyh
	I9wB2++t/tELyOfJ2Av5cDFVr1AtofHCuvud/O7DPuxFQ3J5GppxcldBYU45sDkp
	Kbb9Cw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484memha9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 17:32:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3E114004B;
	Mon, 28 Jul 2025 17:31:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C6F8787C26;
	Mon, 28 Jul 2025 17:29:55 +0200 (CEST)
Received: from localhost (10.252.23.100) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 17:29:55 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 28 Jul 2025 17:29:37 +0200
Subject: [PATCH v5 06/20] dt-bindings: memory: introduce DDR4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
In-Reply-To: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
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
X-Originating-IP: [10.252.23.100]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_083303_787376_B6E8ABEB 
X-CRM114-Status: GOOD (  11.16  )
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

Introduce JEDEC compliant DDR bindings, that use new memory-props binding.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
new file mode 100644
index 000000000000..f457066a2f8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DDR3 SDRAM compliant to JEDEC JESD79-4D
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+allOf:
+  - $ref: jedec,sdram-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{1}$"
+      - const: jedec,ddr4
+
+required:
+  - compatible
+  - density
+  - io-width
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ddr {
+        compatible = "ddr4-ff,f", "jedec,ddr4";
+        density = <8192>;
+        io-width = <8>;
+    };

-- 
2.43.0


