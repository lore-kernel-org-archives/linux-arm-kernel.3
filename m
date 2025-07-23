Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76084C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akqUQfJc807kCu0sYZi5OCGTzmARlWNMPI99bkotwi0=; b=os1uI641Fp88uLTLeCufjxDNFM
	COOUH3MJPGbIybkYlYdkWmLtvjf97r+M4jNXMeFcY8gaqUtELlThmNOWr6LZetB7NH8+UP7Ewk/9Z
	BnHVu9oyTMfwW2IF+e50GZfnN74B7mbAj1yVV/REVNjYJ8U4ff30psCAFb2JrTJDRsMn+sZZcWEpC
	5sC8XJZ7wwMPPsqCftqGR3kuufKctDqGdpraJZ98jS4xlDtgbUPQIcOowvSz4XUhJ816yQ3BUhE42
	d8QBZSxfTX03glQGlSs1nUZS7cUsw6B7pcp3l+penNGYL598IhJHM5fjyKefpR/Kl42OsL7+cSYIq
	3/B8ZVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZoA-00000005653-08k5;
	Wed, 23 Jul 2025 13:46:58 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZDw-00000004zqR-34Fn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 13:09:34 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NC1aD7018432;
	Wed, 23 Jul 2025 15:09:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	akqUQfJc807kCu0sYZi5OCGTzmARlWNMPI99bkotwi0=; b=CsfMsjK1MLOxAD2d
	jTEBa8nOPDPZiP1GC7baAvmn/zusAhHDdwclmLduwytaT+jT1N+uD4yEKvtmi91x
	aIbotWOdGLKjCeQ7XKUklr3BmKhpLLX+2HR1U/qRVQSx1hPgTv7ljqdM2tqvkJaF
	BGZ/R4s2eFs/9EPFedSqLDlgffE83Xf4lwEZVwo04zaCdHHfw/DSRkv8+ulYaFvu
	OXcKzc0kPh+eGS74zeTtbYZMg/6/RRUzBbHL0KcIYgSn5c/hpVyIj4ghJJ3d8Epy
	Vtc5E7I959FvuujuW3QEe3JUppE05LFTA20ctyRPxgg1g4RQshxKS2sqOxANm0u+
	X8mk6g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480pan0re3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 15:09:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5DCAF4004C;
	Wed, 23 Jul 2025 15:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39D07799893;
	Wed, 23 Jul 2025 15:06:08 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:06:07 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 23 Jul 2025 15:05:51 +0200
Subject: [PATCH v4 07/20] dt-bindings: memory: factorise LPDDR channel
 binding into SDRAM channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250723-ddrperfm-upstream-v4-7-1aa53ca319f4@foss.st.com>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
In-Reply-To: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
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
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_060933_036243_DD6B0A1F 
X-CRM114-Status: GOOD (  14.16  )
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

LPDDR, DDR and so SDRAM channels exist and share the same properties, they
have a compatible, ranks, and an io-width.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 34b5bd153f63..9892da520fe4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -1,16 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-channel.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,sdram-channel.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LPDDR channel with chip/rank topology description
+title: SDRAM channel with chip/rank topology description
 
 description:
-  An LPDDR channel is a completely independent set of LPDDR pins (DQ, CA, CS,
-  CK, etc.) that connect one or more LPDDR chips to a host system. The main
-  purpose of this node is to overall LPDDR topology of the system, including the
-  amount of individual LPDDR chips and the ranks per chip.
+  A memory channel of SDRAM memory like DDR SDRAM or LPDDR SDRAM is a completely
+  independent set of pins (DQ, CA, CS, CK, etc.) that connect one or more memory
+  chips to a host system. The main purpose of this node is to overall memory
+  topology of the system, including the amount of individual memory chips and
+  the ranks per chip.
 
 maintainers:
   - Julius Werner <jwerner@chromium.org>
@@ -26,14 +27,14 @@ properties:
   io-width:
     description:
       The number of DQ pins in the channel. If this number is different
-      from (a multiple of) the io-width of the LPDDR chip, that means that
+      from (a multiple of) the io-width of the SDRAM chip, that means that
       multiple instances of that type of chip are wired in parallel on this
       channel (with the channel's DQ pins split up between the different
       chips, and the CA, CS, etc. pins of the different chips all shorted
       together).  This means that the total physical memory controlled by a
       channel is equal to the sum of the densities of each rank on the
-      connected LPDDR chip, times the io-width of the channel divided by
-      the io-width of the LPDDR chip.
+      connected SDRAM chip, times the io-width of the channel divided by
+      the io-width of the SDRAM chip.
     enum:
       - 8
       - 16
@@ -51,8 +52,8 @@ patternProperties:
   "^rank@[0-9]+$":
     type: object
     description:
-      Each physical LPDDR chip may have one or more ranks. Ranks are
-      internal but fully independent sub-units of the chip. Each LPDDR bus
+      Each physical SDRAM chip may have one or more ranks. Ranks are
+      internal but fully independent sub-units of the chip. Each SDRAM bus
       transaction on the channel targets exactly one rank, based on the
       state of the CS pins. Different ranks may have different densities and
       timing requirements.

-- 
2.43.0


