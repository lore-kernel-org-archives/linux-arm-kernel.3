Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99695CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=je5WBqN3LLLBjD1+o+Li8vQci5/X7jcI13+0p2+bfjU=; b=tkd/imHWKqWfUwdvl2Vs/j7A3H
	XCvmKAHoiwUq0OyKT8VoLvdfaha9O7RsvzXNMi/qioxUjZLO8zhJb3rpuua4l1Q5VENLsJpR+1UmD
	WozV5OLAbI3d0lxwYDg/kMsTUkK6fQteQAsCjMamMZcu4a5KeSNvyIrVKRl7Xk5rzI84vDbEvVc/h
	Fecai7aT3SEgcd//dyQY2+HQFnO7icYDB6BMRhtud5XcSuQk4nnp1mtxGmX3oRSzGQ1DRj0We0JUi
	IGb8zzKeMmPbipUNsPuHlDxWXaLJNB4P1PXcLT9wBZGFA/qXStzuAPafMM+F6tkEQtaeq/zxp4hbl
	XbVz+Lyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFq-00000005kEn-2O2j;
	Thu, 28 May 2026 12:54:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFg-00000005k9o-1RDL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:54:21 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D166A19C5;
	Thu, 28 May 2026 14:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972837;
	bh=cXTxhQvbkhNHIuITv/zqHC1dhGaHaPn+/IP+fceB4pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mk/IpA6Daw8ESYdr6AONFalUBmnrqsvVBlWHIcx1t94DF6ra4HgOAMcJYGmKR1VPM
	 FIIatUCPuwDWw47IS0hCUX3Ev1cvMnxgpVDwiNhESQGH64959rQ/hg8pdEDJc5NRGl
	 a3LXGWKj41seQs2PtxsLIKk4/bMmnT+9p6HXTcuA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 28 May 2026 15:53:47 +0300
Subject: [PATCH 6/6] arm64: dts: ti: Use syscon and simple-mfd for the main
 conf region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-ti-main-conf-v1-6-a54ac5c8d081@ideasonboard.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
In-Reply-To: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Swamil Jain <s-jain1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4100;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cXTxhQvbkhNHIuITv/zqHC1dhGaHaPn+/IP+fceB4pk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDryOjwwVGeZaCSX9groidyKtWqkmUmNWzicj
 NFjsz3exZmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg68gAKCRD6PaqMvJYe
 9YjWD/9OpX/j5BFmJmjNaV5+xjkyicyuqO2d/itjr3K8PFMtLYy1mq60XiS4yvBTkb0aan+dKT9
 qzyNncpQCk4lx3ljwYk4SyJavbsDzV9eSfWWEiMmr5x65NMEqPxGYjGxs9is861ynfFqxOZ04Vs
 ITHoiB5gmlOoquqjp/ude0UvaYLzDpRivAYN7kEiaHMtLPVq3I22Nsio3Ce7ggsxdoZltd6W1NP
 Uq6Z7+m15SVZJUsOmV8b7jbp6uv244BK1k3VJ8bCCRTqQZQVJW9An+LoxT2lvMqVUTX3Pw17CvE
 mXqIphJZkptt6S9E8lFjIuH4+ostIf0A1UTySsxaO+CB2m0gH0foWSmzMEW/KRXAs2rrnL1AQp5
 x+QNaGl+fAFymQ3RNQbKXly8ybndSHbs7QAPHRw1Xrb8D6zS+74HUudMrW0MF67szeeVWcxV9V1
 Yhng0xM+Ho/DXlbv0toXYBSbzlNEkxE1IO9IYlmxZw5stg7/bMVUhV7gXv4uHd7EAuBb84KEt0J
 eNF+3m8kNsjMWfytGYdnDF4hEovOkez2jejuJf9H7UBqVhnzKDMcl/k51b19DI5jKb1FBXuJoL/
 B9QqP45LcJ8keUSiMVf1p9b1KcTEUaYjA1nwLQYPCPiR12Hai+ZwHcqjoXMUK9M2LgFgdKP/11L
 8h7mww1uA9HtJcQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_055420_547531_471C0771 
X-CRM114-Status: GOOD (  14.74  )
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

We already had a common binding (ti,j721e-system-controller.yaml) for
the Control Module region for multiple TI SoCs. This was not used for
more recent SoCs. These more recent SoCs just have a "simple-bus"
representing the Control Module. In a few cases the
simple-bus node also had "reg" property, which is not correct for a
simple-bus, but we make use of it in this patch.

With the adjustments done in previous commits to the dtsi files and the
bindings, we can now use the TI system-controller bindings in am62,
am62a, am62p-j722s and j784s4-j742s2 dtsi files. This means that the
node for the Control Module (labeled 'main_conf' or 'scm_conf') changes
from "simple-bus" to, e.g., "ti,am62p-system-controller", "syscon",
"simple-mfd".

While, as far as I understand, this is an ABI change, I believe this
does not cause any breakages: the old dtbs with "simple-bus" will
continue booting fine, with the child nodes getting instantiated, and
the new dtbs with "simple-mfd" behave exactly the same way.

With this change, we can use the Control Module as a syscon from the
drivers. E.g. on some SoCs we have a single register in the Control
Module related to DSS DPI output control, surrounded by registers for
totally different subsystems. Instead of having to create a new syscon
child node for this single register the DSS node can now just point to
the register with 'ti,dpi-io-ctrl = <&main_conf 0x8300>'.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                 | 3 ++-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                | 3 ++-
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi   | 2 +-
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index ffc71ab623e0..3f61f2a9b2bb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -42,7 +42,8 @@ gic_its: msi-controller@1820000 {
 	};
 
 	main_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "ti,am62-system-controller", "syscon", "simple-mfd";
+		reg = <0 0x00100000 0 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x00 0x00100000 0x20000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9287d7be7cc8..2a5cadbc11fa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -42,7 +42,8 @@ gic_its: msi-controller@1820000 {
 	};
 
 	main_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "ti,am62a-system-controller", "syscon", "simple-mfd";
+		reg = <0 0x00100000 0 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x20000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 7c2f03780885..58805e287496 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -40,7 +40,7 @@ gic_its: msi-controller@1820000 {
 	};
 
 	main_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "ti,am62p-system-controller", "syscon", "simple-mfd";
 		reg = <0x00 0x00100000 0x00 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 2570723efa4f..cccd90d43446 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -46,7 +46,7 @@ l3cache-sram@200000 {
 	};
 
 	scm_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "ti,j784s4-system-controller", "syscon", "simple-mfd";
 		reg = <0x00 0x00100000 0x00 0x1c000>;
 		#address-cells = <1>;
 		#size-cells = <1>;

-- 
2.43.0


