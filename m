Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9946ACD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JipXC9zl8vvcvEWV8ytAzAb0ko1bPw2NpPGFvQ/U6qU=; b=lP51yPCXRfvofBG6CL8dqc1hXt
	m2p2O70dP5+e3dK1vXk4MsZ/Eh3FT5ny/+sd7t0V9j2h8q8ziO3jJjsjGJPdE955+vS52a17SObtw
	KrJEMU2wDxaCqFrrmN9E6xwZB1o1Die2vBMFoDhqaF6a5PSrCd+WO4dERPHTr9m1pQ4r5D09q6dte
	tGFmFVbv4OLRhJw83FmybyYsyfC6MblWWjyFiCrXwF46K4Dkbcx3CdkR31CVKXgzPezw3AIjVj6Ow
	/ssHIJbj6NXLogs919e+JWK8XmgtPKCDRes8+pE1LPXd3ZqAeY+n3dv30+ociXN8UmONDRtXVsSEm
	3lf3HYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu9R-00000003Bem-115Z;
	Thu, 07 May 2026 08:32:09 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu9O-00000003BdP-2VcE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:32:08 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app1 (Coremail) with SMTP id TAJkCgC3THH6TfxpQ34XAA--.24500S2;
	Thu, 07 May 2026 16:31:55 +0800 (CST)
From: lizhi2@eswincomputing.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH net v1 1/2] dt-bindings: ethernet: eswin: refine delay model and HSP register description
Date: Thu,  7 May 2026 16:31:36 +0800
Message-ID: <20260507083136.175-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260507083037.152-1-lizhi2@eswincomputing.com>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgC3THH6TfxpQ34XAA--.24500S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw1DAryxXw48KFyUGry5twb_yoW7ury7pa
	y5CrW5Grn8Xr4fWanrtw109ryaqan3WF43Cr18Jr97Xan09F9Yqr13tFy5Xa4UCrWxZFyU
	urZ0ga1rZ34qk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRuHqcUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_013206_806369_B8F01485 
X-CRM114-Status: GOOD (  12.96  )
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

Refine the EIC7700 Ethernet dt-binding based on observed hardware behavior
and clarify the original delay model for eth0.

The previous binding used an enum-based definition for
rx-internal-delay-ps and tx-internal-delay-ps. Replace it with a
range-based model using:

  - minimum: 0
  - maximum: 2540
  - multipleOf: 20

This better reflects the actual hardware implementation, which
supports 20ps granularity delay steps in the MAC RGMII interface.

The tx/rx internal delay values are clarified as MAC-side programmable
delay components applied on the RGMII clock/data path, representing
the effective delay seen at the MAC interface.

This does not change the intended hardware semantics, but aligns the
binding with the actual hardware implementation.

These properties are optional and only required when MAC-side fine
tuning is needed; otherwise delay alignment is provided by PHY or
board design.

Depending on the selected RGMII timing mode, delay alignment may be
provided by the PHY (e.g. rgmii-id) or by board/MAC-side configuration.
When PHY or board design already provides the required delay, these
MAC-side properties may be omitted. When MAC-side fine tuning is
required, they should be provided to describe the internal RGMII
timing adjustment.

Additionally, extend the description of the HSP subsystem register
layout used by the MAC glue logic. This includes explicit TXD and RXD
delay control registers to ensure deterministic initialization and
to override any residual configuration potentially left by bootloaders.

Add reference to the EIC7700X SoC Technical Reference Manual,
Chapter 10 ("High-Speed Interface"), Part 4 for background of the
HSP CSR block:
https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases

There are no in-tree users of this binding, so no ABI impact is
expected.

Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 50 +++++++++++++------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 91e8cd1db67b..fab95603bd82 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -63,16 +63,39 @@ properties:
       - const: stmmaceth
 
   rx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    minimum: 0
+    maximum: 2540
+    multipleOf: 20
+    description:
+      RX internal delay in picoseconds applied on the RGMII clock at the MAC
+      side. The hardware supports 20 ps steps.
+      This property is optional and only needed when MAC-side delay tuning
+      is required.
 
   tx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    minimum: 0
+    maximum: 2540
+    multipleOf: 20
+    description:
+      TX internal delay in picoseconds applied on the RGMII clock at the MAC
+      side. The hardware supports 20 ps steps.
+      This property is optional and only needed when MAC-side delay tuning
+      is required.
 
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
@@ -82,6 +105,8 @@ properties:
           - description: Offset of AXI clock controller Low-Power request
                          register
           - description: Offset of register controlling TX/RX clock delay
+          - description: Offset of register controlling TXD delay
+          - description: Offset of register controlling RXD delay
 
 required:
   - compatible
@@ -93,8 +118,6 @@ required:
   - phy-mode
   - resets
   - reset-names
-  - rx-internal-delay-ps
-  - tx-internal-delay-ps
   - eswin,hsp-sp-csr
 
 unevaluatedProperties: false
@@ -104,24 +127,23 @@ examples:
     ethernet@50400000 {
         compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
         reg = <0x50400000 0x10000>;
-        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
-                <&d0_clock 193>;
-        clock-names = "axi", "cfg", "stmmaceth", "tx";
         interrupt-parent = <&plic>;
         interrupts = <61>;
         interrupt-names = "macirq";
-        phy-mode = "rgmii-id";
-        phy-handle = <&phy0>;
+        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
+                <&d0_clock 193>;
+        clock-names = "axi", "cfg", "stmmaceth", "tx";
         resets = <&reset 95>;
         reset-names = "stmmaceth";
-        rx-internal-delay-ps = <200>;
-        tx-internal-delay-ps = <200>;
-        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
-        snps,axi-config = <&stmmac_axi_setup>;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
+        phy-handle = <&phy0>;
+        phy-mode = "rgmii-id";
         snps,aal;
         snps,fixed-burst;
         snps,tso;
-        stmmac_axi_setup: stmmac-axi-config {
+        snps,axi-config = <&stmmac_axi_setup_gmac0>;
+
+        stmmac_axi_setup_gmac0: stmmac-axi-config {
             snps,blen = <0 0 0 0 16 8 4>;
             snps,rd_osr_lmt = <2>;
             snps,wr_osr_lmt = <2>;
-- 
2.25.1


