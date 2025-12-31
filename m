Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A56EE644A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yN+DEQYMigoIbp4uZakvph53mCa3sVo0kJqQRdipZt4=; b=ynRisTn2dlS263yP1XR0TgLDhk
	4o/iVO5n2RbHmG8aMEVDZ40tC9W8MqhhWS5PGBqectEUCbm0sp/Nnr75yuHo9IfPPhxDouFom3AKc
	Y8APL7+4/CfTFJYOVEsffgkBYvMSloi2bynZWBH+pPXdZWxpppz2h3ub1+Bt02FLk5oPTxIFwb0Kr
	GaitZx5Fw52vP7Mmx2tAfqZ3Cwkgg1uj6rOgWrdw63vf4wQejXWriFWYp8pJNUxfNRBTlBuldE9Hf
	RKiBM6HG42u75VkFARKsSdncMcmZqqPCCybWnFVNdMI1gqk3zNbknAiUwhntAv6j+oLaoYqxW/qOI
	sm92M2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4D0-00000006NIx-25q7;
	Wed, 31 Dec 2025 21:58:22 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4Cx-00000006NHZ-1M1n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218298; bh=m6gNIGhK7toImZVqMZtJJKULpHHlQQeBki++9hHqtC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N7t1u1/e6Bew0SFmjtBB7aP0l77s+ltdieHLeT2Q2fLuI2MzPKoZC3/cHRs0997D7
	 /E8g1YPrzcTwDGd+vSDd+2qnFDwLAaKbBHAcxhb3iwWSuS+SCRV670901ZYmrKHIMx
	 qw161Wy5+dTp512UNeaJUxJi8kEDHk1y+s9VP/NTj4LBFyYWPpOXnE6MnYQZp2CBYz
	 lywNykYqQG9KjAi1HX/ITPDeqbd3kXeQgqz2tETbOpfEMJeQqbNa11VngJGJ0dEVkl
	 fb32PcqBHHW6Idu8IVd+c1HIQ/GhcJQWp/IDRCWVISLEJmE/leS5hW7RqdMK97ZHwT
	 U6ovMltryXy+Q==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id E25483E97E3;
	Wed, 31 Dec 2025 21:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218297; bh=m6gNIGhK7toImZVqMZtJJKULpHHlQQeBki++9hHqtC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a8F4uhbyJ2inAJPpdUDByB/Rcs4ax3bkNbRA9mAxokL9uE6/4+GIpKr+9MvynfFpV
	 SK+5TWzrBsqo+aujuuAQIe6ISX/wLT5DO1qKhpyQOsFya6bZoO3yA81HpXsElIw4Ot
	 Up6Q4xDzzbhXzWmqfnDq7PHwyuNlgCPln+cNTX3bzIt8sWNKl6G0Id5jlanYNMR+X1
	 +aOFdFqNeMTDSYBtkz+6rM1YkEKE51bN6Q6vsKDp1nIb0Yz4eduN2y6R457hqQx3G6
	 aJ71tVqDTWmPwZq94Pie3VAD1Ac6VmKUp718kq8OQoEIbOBI3e8kT3H30fpaliMfQX
	 wf4XkcEJSx1Vg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 5BF403E99A3;
	Wed, 31 Dec 2025 21:58:17 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: mfd: nxp: Add NXP LPC32xx System Control Block
Date: Wed, 31 Dec 2025 23:57:50 +0200
Message-ID: <20251231215754.2222308-2-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231215754.2222308-1-vz@mleia.com>
References: <20251231215754.2222308-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251231_215817_946966_951EA89E 
X-CRM114-Status: GOOD (  12.80  )
/bin/ln: failed to access 'reaver_cache/texts/20251231_215817_946966_951EA89E': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_215817_946966_951EA89E 
X-CRM114-Status: GOOD (  12.82  )
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

NXP LPC32xx SoC series contains a System Control Block, which serves for
a multitude of purposes including clock and power management, DMA muxing,
storing SoC unique ID etc.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 .../bindings/mfd/nxp,lpc3220-scb.yaml         | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml b/Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml
new file mode 100644
index 000000000000..b993dd15135a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,lpc3220-scb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx System Control Block
+
+maintainers:
+  - Vladimir Zapolskiy <vz@mleia.com>
+
+description:
+  NXP LPC32xx SoC series have a System Control Block, which serves for
+  a multitude of purposes including clock management, DMA muxes, storing
+  SoC unique ID etc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nxp,lpc3220-scb
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^clock-controller@[0-9a-f]+$":
+    $ref: /schemas/clock/nxp,lpc3220-clk.yaml#
+
+  "^dma-router@[0-9a-f]+$":
+    $ref: /schemas/dma/nxp,lpc3220-dmamux.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@400040000 {
+        compatible = "nxp,lpc3220-scb", "syscon", "simple-mfd";
+        reg = <0x40004000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x40004000 0x1000>;
+
+        clock-controller@0 {
+            compatible = "nxp,lpc3220-clk";
+            reg = <0x0 0x114>;
+            clocks = <&xtal_32k>, <&xtal>;
+            clock-names = "xtal_32k", "xtal";
+            #clock-cells = <1>;
+        };
+
+        dma-router@78 {
+            compatible = "nxp,lpc3220-dmamux";
+            reg = <0x78 0x8>;
+            dma-masters = <&dma>;
+            #dma-cells = <3>;
+        };
+    };
-- 
2.43.0


