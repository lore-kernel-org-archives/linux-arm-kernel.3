Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEBBCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 01:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjmE4/GQkXt7V3dcXuGUPdIztA+pqnkTZU8q50F6+qQ=; b=Go7L/mqRa41XbsCRKc7jiOInr9
	fVTBC5b63TR24tpkO4lWVYzzy0s5J0aU1xOl6huUn5HrTsvF366MBGBk8Z5APwqX5e1SGktractaZ
	G9Bt8GmILBXwEwDFFXtxK1rsb6NpJ8P55rH1pfw2EDeAJl0j0KXvHqVnS5Opezhq9jdfP9dxKEDlw
	TL4jMYvUUEpthjQI2N82vLZcKdw1BiY0w2usBrHOsNwhluheSksDc8Lgi1zkCHAjWNmyHVm7OPp6a
	pXq2JrheUhD+1OrgoowVNEsnb4wpy4ASudeDLYMyh0l0ZUbZV1PPOW+wkMHVdx71GjAzfsfZKP1yA
	Zy+02/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7kn-00000006dIS-0jLR;
	Wed, 10 Jun 2026 01:29:13 +0000
Received: from azure-sdnproxy.icoremail.net ([52.175.55.52])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7kk-00000006dHk-06rC;
	Wed, 10 Jun 2026 01:29:11 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app2 (Coremail) with SMTP id TQJkCgD3DKDUvShq2oslAA--.7314S2;
	Wed, 10 Jun 2026 09:28:53 +0800 (CST)
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
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com,
	horms@kernel.org,
	lee@kernel.org,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH net-next v8 1/6] dt-bindings: ethernet: eswin: relax internal delay model to range-based constraints
Date: Wed, 10 Jun 2026 09:28:49 +0800
Message-ID: <20260610012849.874-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260610012727.848-1-lizhi2@eswincomputing.com>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TQJkCgD3DKDUvShq2oslAA--.7314S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWxJw13tw4rGr1kuw4rXwb_yoW5XrW3pF
	ZxCryrGr48Xr1xZanrt3W0krnxX395WFy3Gr4xJ3Z7Xa1qvFs0qr15KFy8G3WUCrs7ZFy5
	WFW3KFWUC342k3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRQ6pPUUUUU==
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_182910_362233_15660F1F 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
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

Relax internal delay constraints for EIC7700 Ethernet binding.

Replace fixed enumeration of rx-internal-delay-ps and tx-internal-delay-ps
with a range-based definition (0-2540 ps, 20 ps steps) to reflect actual
hardware capability.

Mark rx/tx internal delay properties as optional, as they are board-
specific tuning parameters rather than mandatory configuration.

Update the device tree example to align with the relaxed constraint model
and remove delay properties from the example to avoid implying they are
required.

No functional change to existing DT users.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 65882ff79d8d..4e02fedae5c6 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -63,10 +63,14 @@ properties:
       - const: stmmaceth
 
   rx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    minimum: 0
+    maximum: 2540
+    multipleOf: 20
 
   tx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    minimum: 0
+    maximum: 2540
+    multipleOf: 20
 
   eswin,hsp-sp-csr:
     description:
@@ -105,8 +109,6 @@ required:
   - phy-mode
   - resets
   - reset-names
-  - rx-internal-delay-ps
-  - tx-internal-delay-ps
   - eswin,hsp-sp-csr
 
 unevaluatedProperties: false
@@ -116,23 +118,22 @@ examples:
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
         eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
-        snps,axi-config = <&stmmac_axi_setup>;
+        phy-handle = <&phy0>;
+        phy-mode = "rgmii-id";
         snps,aal;
         snps,fixed-burst;
         snps,tso;
+        snps,axi-config = <&stmmac_axi_setup>;
+
         stmmac_axi_setup: stmmac-axi-config {
             snps,blen = <0 0 0 0 16 8 4>;
             snps,rd_osr_lmt = <2>;
-- 
2.25.1


