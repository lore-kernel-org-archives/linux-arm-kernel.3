Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6680AC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 05:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Icv6vaaEtmCyNWbvWJMcNUIs0mrozuWDQz1ban0QBLM=; b=yXi9l0SWSVrOChIED3EqO1LvEJ
	I2EP/T366X8yei6Hv6eImo1JJGKnjKim8SYUaHtIy3NVHdYUSvW5i/QX+DeK11rxw1q4XvrbTnUrG
	WPByMMfMe7lW7ePS+xERwSuBJf1HZ0q/njI76MG3J5sZWMe6VDxl8imOV5ErW5H+r2EafOQ+BPHXD
	zEhEraQT7DzYed4DTn3pIPWCx35O51/ZaNSn+ZU9i/BY4Uo22WKsSKxKQM6Sd4YMQ80enrrJMsUCM
	4bCohQidCIHyUkCE06pVnnVn581iX5JJvJSwKjZQEEokqQnRXlt7VE1GxvULG1T+dbKDOMUfKMN8F
	ZM1cTPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRKe-00000009ljv-0pJg;
	Thu, 13 Feb 2025 05:00:12 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRH8-00000009lFr-0szX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 04:56:36 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250213045630epoutp019d994369db1611209ec0bb1bc6caa16b~jq6FdE1oe2117421174epoutp01V
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 04:56:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250213045630epoutp019d994369db1611209ec0bb1bc6caa16b~jq6FdE1oe2117421174epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739422590;
	bh=Icv6vaaEtmCyNWbvWJMcNUIs0mrozuWDQz1ban0QBLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9pQRz9tKXVIdWaazDlI05WeNOIafBGwLCxowCnrGhuu7CBUECMMt/CI2qd/G5Fse
	 EoUkFwZQxo/0m7F1n8EK8gKFANqrQaGsiP5cyn6QCWFKOaMOYDpv2z2nQjc63wG3+M
	 jOIcC0J/CcnDP3dbmrkRzH/XYFnmaOajucJsCfM8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250213045630epcas5p1035fd0e649f62cdf575a6dba0c2e50ea~jq6E7c_FJ0881008810epcas5p1j;
	Thu, 13 Feb 2025 04:56:30 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YtjZN10Q6z4x9Q1; Thu, 13 Feb
	2025 04:56:28 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	03.3B.19956.B7B7DA76; Thu, 13 Feb 2025 13:56:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff~jq0VwNbxb0111401114epcas5p1U;
	Thu, 13 Feb 2025 04:49:55 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250213044955epsmtrp2c5bd77e2f6440781abb67fea4d3aee5e~jq0VvQKH71364113641epsmtrp2B;
	Thu, 13 Feb 2025 04:49:55 +0000 (GMT)
X-AuditID: b6c32a4b-fe9f470000004df4-7e-67ad7b7b8d27
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E3.C9.23488.3F97DA76; Thu, 13 Feb 2025 13:49:55 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250213044952epsmtip2cb199537a88602e450ee7f98494782a4~jq0TBIMSB2199621996epsmtip2X;
	Thu, 13 Feb 2025 04:49:52 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, swathi.ks@samsung.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree bindings
Date: Thu, 13 Feb 2025 10:16:23 +0530
Message-Id: <20250213044624.37334-2-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250213044624.37334-1-swathi.ks@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VTfUwbZRzOe9e7K0SWSwfzhSiQW9gAB6MC5YCyLRHdKVvGxtyc6LpKz8KA
	a9Nr3YcLYxkZinzHITJA0mzq+F6FruBABqQQu4CTj4qGBRgEQeOKIGGQgdDr9L/n9/ye5/fk
	/b3vK0YlVtxHnMbpWR2nzKBwd5G5Jygw5NLHDeowWxVCP50rA/Q3ExaMru8YQOjKwRwR/VXv
	AEbPWKcIeqyrDaHnKh7h9E/mQow2PR7F6KH2SpzOG53G6OpnDRhtrdlBL9v+BLSxdYmgJx33
	CLr3we8o/XNRCUJv3LMQ9NKdMeKAFzM0+hBlWm6PIcxMUSvBtFWME0yNycCYaj/Fme9uXmba
	LIsI86RzBGcKW2oBc79TyiyafBNfeDddnsoqVazOn+VSNKo0Th1HJSQpXlNEysKkIdJoOory
	55SZbBwVfygx5I20jM2zUv4fKTMMm1SikuepvfvkOo1Bz/qnanh9HMVqVRnaCG0or8zkDZw6
	lGP1MdKwsFcjN4Vn0lMfG4cw7Y3d55v685Fs8PVLeUAshmQEtI5vywPuYgn5PYBNxU9FQvE3
	gHM9VbhQLAN4t9mM5gE3p6M/dwMVGh0A2s0/YEKxBODiwwZkS4WTgdD+7V1iq+FJrgLoKLU5
	LSg5DqCpYBzfUm0nE+DE3JdOh4gMgCvZdU7eg4yBtytvIkKeH6xr7nJmu5GxsKzUgQn8hBgu
	TEsEHA9H2hpd+u1wvq+FELAPXPyrAxewAtYVjogEnArHV0tc/H7YNVwp2toGSgbBpva9Av0y
	vP6jMBIlt8GCtWnXeA9oqX6Od8Jnf4y6RnpD860nrlgGNq3/4tpKIYDV1xqJYuBb8X9EDQC1
	wJvV8plqlo/UhnPsuf+uLUWTaQLOBx2cYAFTE47QboCIQTeAYpTy9IBl9WqJh0p54SKr0yh0
	hgyW7waRm/srQX28UjSbP4LTK6QR0WERMpksIjpcJqVe9LjalqOWkGqlnk1nWS2re+5DxG4+
	2Yh5lyKZwJkHj/yPz430nG3dPaIaWDdVc25H+I3Tw6/IPr8ssrw5OKnyOxfVPt9Rfth+/eit
	QUvvQqXfjcnoiyjcr114/3BOdkBdYWP5fFnBSvj55qgJ3w+Lsfic0OKd9rckXgeMjTvS1veF
	WK/UyztLjsTOXH2dHY0ZTjCHrllz+M8Uhg8OORTa494gaSX2H9/6pmvJ5buMjoZT+bOzGptm
	T6KI6jMGfTEbq6sVH4xy57I+WfUsLXrnZHBWVf8Fue3Er8n9vidPTZP2Pvlvxy6tLHe+3W9h
	zxjs750OvH/w2J38PW5Y1syVANtZaZImV92cPHW0aq07ZboiJHfjRINRTon4VKU0GNXxyn8B
	huaeV1kEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSvO7nyrXpBn1ftS1+vpzGaLH8wQ5W
	izV7zzFZzDnfwmIx/8g5Vounxx6xW9w8sJPJ4uWse2wWF7b1sVpsenyN1eLyrjlsFl3XnrBa
	zPu7ltXi2AIxi2+n3zBaLNr6hd3i4Yc97BZHzrxgtrjUP5HJ4v+eHewWXzbeZHcQ9bh87SKz
	x5aVN5k8nvZvZffYOesuu8eCTaUem1Z1snlsXlLvsXPHZyaP9/uusnn0bVnF6HFwn6HH501y
	ATxRXDYpqTmZZalF+nYJXBmPF11mLZitXrH+RA9TA+MymS5GTg4JAROJE+3/mbsYuTiEBHYz
	Siz/t50ZIiEp8al5KiuELSyx8t9zdoiiT4wSb57cYwFJsAloSFxfsR0sISLQwSSxZ+pJsFHM
	Ao8ZJR68+s8GUiUs4C3x4OVMJhCbRUBV4kfDarA4r4CVxMo5S5ggVshLrN5wAGw1p4C1xLRJ
	H8BWCwHVrHq5j3ECI98CRoZVjJKpBcW56bnJhgWGeanlesWJucWleel6yfm5mxjBUaSlsYPx
	3bcm/UOMTByMhxglOJiVRHglpq1JF+JNSaysSi3Kjy8qzUktPsQozcGiJM670jAiXUggPbEk
	NTs1tSC1CCbLxMEp1cDU9/nk/P4JH3a47iuqunFVg0v80vM5jPI3lleu3qbwPrj3t2W96Fzb
	2OXb2PvLvZhunLphOtvDJabmbdLcwm6WkGy97ikqS9/lmj618LmtpRrVOYfZ1PXi1EcP2q+J
	r5oi9Sb0+X4N/v3f1vK8urrx6cmr/C6Fob1bY3M+SCYJpCR928P8vPy5S+bXU1rTdymr2Vj4
	713BNCM+9MnRg50bD7VUv73+ZPsW3Z3VzhPOmh7XOlfsdOXT+jRz7h/Gtq0nl6czX63Ni5sZ
	a+m3+2BQ4j1zJ5bb93S25IQ/VdDYNn+B8teAaentdgs/iNTwPbUMuMV85a9+y6P0dSKqrzav
	zpnTcll7WmXBBp0H+x66KrEUZyQaajEXFScCAFwnPGcRAwAA
X-CMS-MailID: 20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff
References: <20250213044624.37334-1-swathi.ks@samsung.com>
	<CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_205634_580614_FAA4542C 
X-CRM114-Status: GOOD (  20.49  )
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

Add FSD Ethernet compatible in Synopsys dt-bindings document. Add FSD
Ethernet YAML schema to enable the DT validation.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Swathi K S <swathi.ks@samsung.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 .../bindings/net/tesla,fsd-ethqos.yaml        | 114 ++++++++++++++++++
 2 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..c7004eaa8eae 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -102,6 +102,7 @@ properties:
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - tesla,fsd-ethqos
         - thead,th1520-gmac
 
   reg:
@@ -126,7 +127,7 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 8
+    maxItems: 10
     additionalItems: true
     items:
       - description: GMAC main clock
@@ -138,7 +139,7 @@ properties:
 
   clock-names:
     minItems: 1
-    maxItems: 8
+    maxItems: 10
     additionalItems: true
     contains:
       enum:
diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
new file mode 100644
index 000000000000..9d7d632fcd92
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/tesla,fsd-ethqos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FSD Ethernet Quality of Service
+
+maintainers:
+  - Swathi K S <swathi.ks@samsung.com>
+
+description:
+  Tesla ethernet devices based on dwmmac support Gigabit ethernet.
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: tesla,fsd-ethqos
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: macirq
+
+  clocks:
+    minItems: 5
+    items:
+      - description: PTP clock
+      - description: Master bus clock
+      - description: Slave bus clock
+      - description: MAC TX clock
+      - description: MAC RX clock
+      - description: Master2 bus clock
+      - description: Slave2 bus clock
+      - description: RX MUX clock
+      - description: PHY RX clock
+      - description: PERIC RGMII clock
+
+  clock-names:
+    minItems: 5
+    maxItems: 10
+    contains:
+      enum:
+        - ptp_ref
+        - master_bus
+        - slave_bus
+        - tx
+        - rx
+        - master2_bus
+        - slave2_bus
+        - eqos_rxclk_mux
+        - eqos_phyrxclk
+        - dout_peric_rgmii_clk
+
+  iommus:
+    maxItems: 1
+
+  phy-mode:
+    enum:
+      - rgmii-id
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/fsd-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ethernet1: ethernet@14300000 {
+            compatible = "tesla,fsd-ethqos";
+            reg = <0x0 0x14300000 0x0 0x10000>;
+            interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "macirq";
+            clocks = <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I>,
+                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_ACLK_I>,
+                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_HCLK_I>,
+                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I>,
+                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I>,
+                     <&clock_peric PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK>,
+                     <&clock_peric PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK>,
+                     <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
+                     <&clock_peric PERIC_EQOS_PHYRXCLK>,
+                     <&clock_peric PERIC_DOUT_RGMII_CLK>;
+            clock-names = "ptp_ref", "master_bus", "slave_bus","tx",
+                          "rx", "master2_bus", "slave2_bus", "eqos_rxclk_mux",
+                          "eqos_phyrxclk","dout_peric_rgmii_clk";
+            pinctrl-names = "default";
+            pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
+                        <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
+                        <&eth1_rx_ctrl>, <&eth1_mdio>;
+            iommus = <&smmu_peric 0x0 0x1>;
+            phy-mode = "rgmii-id";
+       };
+    };
+
+...
-- 
2.17.1


