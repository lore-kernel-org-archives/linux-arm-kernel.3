Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3081DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUpYSzydPpFuztaOxz5jpPB1qeEDE88vI+GDfXR2JDs=; b=aPR5VZM1U9EjsO47Nswp6oVPws
	wH3ht+6B9iQq9jww7iwTDc2gqz+xDE2WDnCwbSVZwArTHBm37zbefzMjQBnQyjDXKIsxQ92KHnPMM
	DkNds3zAWlfM1yjOGShPOAANZfIBBDaQstJKNsgG2bkcHC7V6arIivcm/m2QrgIK9OIw/595dVjK6
	Fqj5mSEZC4qQjxDPYl4JUVazkONeqR69AC4lkADsMcGwp/x+ca98oA2RGHC1foE8wLYxDbcTfaco+
	bTFvthbfSNyGfHmTqU22zt5hFaK5tpTUek8q34OidciKIMI1U9N+dWhORa2K6uiECHQr+wIAq8bj1
	MbI+p+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFEc-0000000F6GR-0Da2;
	Fri, 11 Jul 2025 15:00:22 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF5z-0000000F46X-3prl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:51:29 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BCHMEO027003;
	Fri, 11 Jul 2025 16:51:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	EUpYSzydPpFuztaOxz5jpPB1qeEDE88vI+GDfXR2JDs=; b=RDp44xPOWxJZY40z
	xycNsFnCPzbrvds0kW9WNedRnbvjMu9DdMo7HZCA/Oe/2ZUB0ifhTB6KiNEKtu5y
	QgMOGjUzgKsMiaiMrOj9wHTiGH261jFmYznzez73rHJZj4kVSvaBuIe9laRuyact
	6C6ODWSg+Nvq4qXwhs+sn8iRp6MyAXT06QfQK6op+dEXqRGrI0nuetmuNQSd3m31
	UY4sZpJ6siIErRzz8xE0r1xQpJPKVDYQ/iPfGEBl3A7lW+GiHhuVWJbKhdo2GYPZ
	p7r0q53Vk4dhRqvNPXhgLG1bQGkpYGhlM6yXcfU+hyH/stzsfp10TSDISScdJ1+O
	PXQqhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfmyt2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 16:51:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22BCD40058;
	Fri, 11 Jul 2025 16:49:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2E19B4BEA4;
	Fri, 11 Jul 2025 16:49:16 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:16 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:48:57 +0200
Subject: [PATCH v2 05/16] dt-bindings: memory: add jedec,ddr[3-4]-channel
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250711-ddrperfm-upstream-v2-5-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
In-Reply-To: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
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
 Goffic <legoffic.clement@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075128_596230_B522F70B 
X-CRM114-Status: GOOD (  14.98  )
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

Introduce as per jedec,lpddrX-channel binding, jdec,ddr[3-4]-channel
binding.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../memory-controllers/ddr/jedec,ddr-channel.yaml  | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml
new file mode 100644
index 000000000000..31daa22bcd4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr-channel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DDR channel with chip/rank topology description
+
+description:
+  A DDR channel is a logical grouping of memory chips that are connected
+  to a host system. The main purpose of this node is to describe the
+  overall DDR topology of the system, including the amount of individual
+  DDR chips.
+
+maintainers:
+  - Clément Le Goffic <legoffic.clement@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - jedec,ddr3-channel
+      - jedec,ddr4-channel
+
+  io-width:
+    description:
+      The number of DQ pins in the channel. If this number is different
+      from (a multiple of) the io-width of the DDR chip, that means that
+      multiple instances of that type of chip are wired in parallel on this
+      channel (with the channel's DQ pins split up between the different
+      chips, and the CA, CS, etc. pins of the different chips all shorted
+      together).  This means that the total physical memory controlled by a
+      channel is equal to the sum of the densities of each rank on the
+      connected DDR chip, times the io-width of the channel divided by
+      the io-width of the DDR chip.
+    enum:
+      - 8
+      - 16
+      - 32
+      - 64
+      - 128
+
+required:
+  - compatible
+  - io-width
+
+additionalProperties: false
+
+examples:
+  - |
+    ddr_channel: ddr3-channel {
+        compatible = "jedec,ddr3-channel";
+        io-width = <16>;
+    };

-- 
2.43.0


