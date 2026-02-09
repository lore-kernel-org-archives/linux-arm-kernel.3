Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98556E7E0A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icb0vm/O7IurgSijYyJJHm1Z4+oK0XG2CgffvQF2Xb0=; b=qFmjJOwY/00fvRAz2+cd5x4C3P
	+HT8krlOwgxmRXqJ51lcl5EKWCqsYO8YypiB86LDjvA6jyk5wP7Sl8xS3a69jX8XvtQO4cQQo2GCa
	o5GhAnlow2GZ8Oqy/SidBZepRO0oCm5em133E9qXV1z0QGnHU3vcDSIXQu+TatT5KfpS7UBpJGYTb
	AZC0pAR8gHr0mFL78eTvecEgugnxomAtzcTDM8w/a0hp6fxxn5XkMqUSSWPjhZ36dauOfxFXuWCSG
	gy8zOYnDfEupiPLeELut9lJxe/Zglg1e5Gdv4JXEGzxGqBbQjahT8/VQakwgYOwSX2TiyXDqPFAEK
	3zAgzDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNsV-0000000FAr7-2JuH;
	Mon, 09 Feb 2026 09:48:23 +0000
Received: from azure-sdnproxy.icoremail.net ([52.237.72.81])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNsT-0000000FAqO-0Ih3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:48:22 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app1 (Coremail) with SMTP id TAJkCgAXZzdVrYlpDjcEAA--.19005S2;
	Mon, 09 Feb 2026 17:48:06 +0800 (CST)
From: lizhi2@eswincomputing.com
To: devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH v2 1/2] dt-bindings: ethernet: eswin: add clock sampling control
Date: Mon,  9 Feb 2026 17:48:01 +0800
Message-ID: <20260209094801.909-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260209094628.886-1-lizhi2@eswincomputing.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgAXZzdVrYlpDjcEAA--.19005S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFW5GF43AFyUCw4DXFykAFb_yoW7uF48pF
	W5u3yUGFn8Xr1fJa17tF109a4fJws3WF1akrn7t3Z7Xws0qryYqr42yFyrWa4UCr4xZFy5
	WFWYqay8uay0k3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRmZXOUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_014821_286442_2C05B466 
X-CRM114-Status: GOOD (  11.79  )
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

From: Zhi Li <lizhi2@eswincomputing.com>

The second Ethernet controller (eth1) on the EIC7700 SoC may experience
RX data sampling issues at high speed due to EIC7700-specific receive
clock to data skew at the MAC input.

On the EIC7700 SoC, the second Ethernet controller (eth1) requires
inversion of the internal RGMII receive clock in order to meet RX data
sampling timing at high speed.

Describe this SoC-specific difference by introducing a distinct compatible
string for MAC instances that require internal clock inversion, allowing the
driver to select the appropriate configuration without relying on per-board
vendor-specific properties.

The rx-internal-delay-ps and tx-internal-delay-ps properties now use
minimum and maximum constraints to reflect the actual hardware delay
range (0-2400 ps) applied in 20 ps steps. This relaxes the binding
validation compared to the previous enum-based definition and avoids
regressions for existing DTBs while keeping the same hardware limits.

In addition, the binding now includes additional background information
about the HSP CSR registers accessed by the MAC. The TXD and RXD delay
control registers are included so the driver can explicitly clear any
residual configuration left by the bootloader. Background reference for
the High-Speed Subsystem and HSP CSR block is available in Chapter 10
("High-Speed Interface") of the EIC7700X SoC Technical Reference Manual,
Part 4 (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases

There are currently no in-tree users of the EIC7700 Ethernet driver, so
these changes are safe.

Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 63 ++++++++++++++++---
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 91e8cd1db67b..8a7035dfd4a2 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -20,6 +20,7 @@ select:
       contains:
         enum:
           - eswin,eic7700-qos-eth
+          - eswin,eic7700-qos-eth-clk-inversion
   required:
     - compatible
 
@@ -28,9 +29,13 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: eswin,eic7700-qos-eth
-      - const: snps,dwmac-5.20
+    oneOf:
+      - items:
+          - const: eswin,eic7700-qos-eth
+          - const: snps,dwmac-5.20
+      - items:
+          - const: eswin,eic7700-qos-eth-clk-inversion
+          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
@@ -63,16 +68,27 @@ properties:
       - const: stmmaceth
 
   rx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    minimum: 0
+    maximum: 2400
 
   tx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    minimum: 0
+    maximum: 2400
 
   eswin,hsp-sp-csr:
     description:
       HSP CSR is to control and get status of different high-speed peripherals
       (such as Ethernet, USB, SATA, etc.) via register, which can tune
       board-level's parameters of PHY, etc.
+
+      Additional background information about the High-Speed Subsystem
+      and the HSP CSR block is available in Chapter 10 ("High-Speed Interface")
+      of the EIC7700X SoC Technical Reference Manual, Part 4
+      (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf). The manual is
+      publicly available at
+      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
+
+      This reference is provided for background information only.
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
@@ -81,7 +97,9 @@ properties:
                          or external clock selection
           - description: Offset of AXI clock controller Low-Power request
                          register
+          - description: Offset of register controlling TXD delay
           - description: Offset of register controlling TX/RX clock delay
+          - description: Offset of register controlling RXD delay
 
 required:
   - compatible
@@ -111,17 +129,44 @@ examples:
         interrupts = <61>;
         interrupt-names = "macirq";
         phy-mode = "rgmii-id";
-        phy-handle = <&phy0>;
+        phy-handle = <&gmac0_phy0>;
         resets = <&reset 95>;
         reset-names = "stmmaceth";
+        rx-internal-delay-ps = <20>;
+        tx-internal-delay-ps = <100>;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x114 0x118 0x11c>;
+        snps,axi-config = <&stmmac_axi_setup_gmac0>;
+        snps,aal;
+        snps,fixed-burst;
+        snps,tso;
+        stmmac_axi_setup_gmac0: stmmac-axi-config {
+            snps,blen = <0 0 0 0 16 8 4>;
+            snps,rd_osr_lmt = <2>;
+            snps,wr_osr_lmt = <2>;
+        };
+    };
+
+    ethernet@50410000 {
+        compatible = "eswin,eic7700-qos-eth-clk-inversion", "snps,dwmac-5.20";
+        reg = <0x50410000 0x10000>;
+        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
+                <&d0_clock 194>;
+        clock-names = "axi", "cfg", "stmmaceth", "tx";
+        interrupt-parent = <&plic>;
+        interrupts = <70>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-rxid";
+        phy-handle = <&gmac1_phy0>;
+        resets = <&reset 94>;
+        reset-names = "stmmaceth";
         rx-internal-delay-ps = <200>;
         tx-internal-delay-ps = <200>;
-        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
-        snps,axi-config = <&stmmac_axi_setup>;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x200 0x208 0x214 0x218 0x21c>;
+        snps,axi-config = <&stmmac_axi_setup_gmac1>;
         snps,aal;
         snps,fixed-burst;
         snps,tso;
-        stmmac_axi_setup: stmmac-axi-config {
+        stmmac_axi_setup_gmac1: stmmac-axi-config {
             snps,blen = <0 0 0 0 16 8 4>;
             snps,rd_osr_lmt = <2>;
             snps,wr_osr_lmt = <2>;
-- 
2.25.1


