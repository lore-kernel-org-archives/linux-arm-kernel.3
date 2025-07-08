Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91950C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYCyVQSEhyiNgRSZQjKeP4GdTZI8s/pFA0yDOkhv5d0=; b=AtnDBsXtmknZbBgvvxje+7tdw0
	N+jKZQeHToUZkpyli+hdCySBwBckSRrh9irO8W0ZrRKPyVWeAlhb7OCBfTbXIMX6hZePqX19YJJde
	q+vXBGhsgEkQ9qmGsawy64ouUM4vfGWeFDP/0SV/NYwUfvYN58iTCfE1ud4vnmhhFKFkIHY4hFaom
	O3FOGGC4WzBvObQ1Iy0OXBMSQ2PKMuPQuW1HUP//Il9ozjuwb1vBGiy77u7X9IikK2gibPyhfomRZ
	HQBYJWWnw1eqhJj5/KRrnJlhWNKtJd4ARFLt5OcADqiAhZtjX3U65Ew+Ju3FC2q2T48sNBii1w+l3
	riTipCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5xC-000000057dU-29h7;
	Tue, 08 Jul 2025 10:53:38 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5l2-000000055Xu-1k89
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:41:06 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250708104059epoutp0149cff9778a7b4fc1d584cfac74d833d4~QQJQYz4yH2791327913epoutp013
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 10:40:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250708104059epoutp0149cff9778a7b4fc1d584cfac74d833d4~QQJQYz4yH2791327913epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751971259;
	bh=NYCyVQSEhyiNgRSZQjKeP4GdTZI8s/pFA0yDOkhv5d0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jsfx/fallHOJRoEFYjX7BDKTtuakH/46HvCl6HlgiDIwz+1w3HH12cxX8zRYvkZZf
	 jxzVeqHx2MVBGGA4DxcZO1+8Otttm9mgxHPCd0izdGqo1UKUJT+2os47wNwmoB/+d6
	 pyNQt2yKpEm+osBqcnXQ5ZkVvPE0Qul2hiHLQ+ls=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250708104059epcas5p41d1793c5aeb434f28b17499ea46e9013~QQJP0qpLH1625116251epcas5p4r;
	Tue,  8 Jul 2025 10:40:59 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.175]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bbyLx19t7z6B9m6; Tue,  8 Jul
	2025 10:40:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250708103237epcas5p1c4c5d7a5f43c0c88317e74d2f2458a1b~QQB8hGhe-2145121451epcas5p1G;
	Tue,  8 Jul 2025 10:32:37 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250708103234epsmtip1fd36b1a6f6019b1ba42e343ae39083bc~QQB54pvRQ1977519775epsmtip16;
	Tue,  8 Jul 2025 10:32:34 +0000 (GMT)
From: Vivek Yadav <vivek.2311@samsung.com>
To: pankaj.dubey@samsung.com, ravi.patel@samsung.com, shradha.t@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
	mark.rutland@arm.com, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, linux-fsd@tesla.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Vivek
	Yadav <vivek.2311@samsung.com>
Subject: [PATCH 3/6] dt-bindings: perf: Add devicetree binding for custom
 PPMU
Date: Tue,  8 Jul 2025 16:02:05 +0530
Message-ID: <20250708103208.79444-4-vivek.2311@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708103208.79444-1-vivek.2311@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250708103237epcas5p1c4c5d7a5f43c0c88317e74d2f2458a1b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250708103237epcas5p1c4c5d7a5f43c0c88317e74d2f2458a1b
References: <20250708103208.79444-1-vivek.2311@samsung.com>
	<CGME20250708103237epcas5p1c4c5d7a5f43c0c88317e74d2f2458a1b@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034104_764424_9BD30A2C 
X-CRM114-Status: GOOD (  18.42  )
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

Add the dt-binding documentation for the Samsung specific
Platform Performance Monitoring Unit (PPMU) driver which provides
performance statistics for AXI bus masters such as MFC.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Vivek Yadav <vivek.2311@samsung.com>
---
 .../bindings/perf/samsung,ppmu-v2.yaml        | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/samsung,ppmu-v2.yaml

diff --git a/Documentation/devicetree/bindings/perf/samsung,ppmu-v2.yaml b/Documentation/devicetree/bindings/perf/samsung,ppmu-v2.yaml
new file mode 100644
index 000000000000..d137d06b7034
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/samsung,ppmu-v2.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/samsung,ppmu-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung PPMU (Platform Performance Monitoring Unit)
+
+maintainers:
+  - Vivek Yadav <vivek.2311@samsung.com>
+  - Ravi Patel <ravi.patel@samsung.com>
+
+description:
+  PPMU (Platform Performance Monitoring Unit) provides performance statistics
+  such as bandwidth, read and write request, transactions count for AXI masters
+  like MFC.
+
+properties:
+  compatible:
+    const: samsung,ppmu-v2
+
+  reg:
+    maxItems: 1
+    description: Memory-mapped register address
+
+  clocks:
+    items:
+      - description: AXI bus clock
+      - description: Peripheral clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+
+  interrupts:
+    items:
+      - description: Overflow interrupt for Counters
+      - description: Conditional Interrupt Generation (CIG)
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/fsd-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    ppmu@12840000 {
+        compatible = "samsung,ppmu-v2";
+        reg = <0x12840000 0x1000>;
+        interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock_mfc MFC_PPMU_MFCD0_IPCLKPORT_ACLK>,
+                 <&clock_mfc MFC_PPMU_MFCD0_IPCLKPORT_PCLK>;
+        clock-names = "aclk", "pclk";
+     };
-- 
2.49.0


