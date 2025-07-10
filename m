Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64828C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWDPqbbfYGSiT45F26qLKVykJ3iARoGM/A8R/24bBls=; b=q0uWCM8YTaCEuhE2IpwVek8tto
	W/Kgpb8T3SLgy5ZrJU0qOXaiFTU2pwFxckmpABjFF1Va3RRCHJDS6xh2gWtCZ6oiKtK9fiqbcgYUG
	OSYsH7pB13oTG+RmGCOAnnil0OZSUdHMo/w/w+6h3/18T+rXDZTLeCA4YuclCNUvzjkhlfV/edq4j
	mL3Bx+s9U3Ud6+TZe7YMFF3Dr/U7t8Wzi7Li1dzR0VbqI4nPa7pEygCXM9r63lAiudvSME9swpzZI
	4SpJhYpA4GgqHxrFqQ3hMTwb2QFTZniXrjIrDAHmA39mlZKCZJVBYWzYKFC9h8K/86BuMy7TuVh/y
	WEKN3A9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuhM-0000000CX9a-1ztD;
	Thu, 10 Jul 2025 17:04:40 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsQW-0000000C8vL-2hov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:39:11 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56AEd5kQ1174302;
	Thu, 10 Jul 2025 09:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752158345;
	bh=xWDPqbbfYGSiT45F26qLKVykJ3iARoGM/A8R/24bBls=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=VpiNC6MQl2eUjiMgwKW6ikBm+M25313lYfKGUABrbaNwFjseL6xLoPDuaOE2PrCBq
	 NW7mSCyCwjfqILI1y6kBaMBAxF2TJCDx1m81PyPTxRl/ykuinUB3dlCI4EXwTUmq4L
	 JaAue9YyvIvRJw81hti2FGqKuxCodik2e2tBH0YI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56AEd55G1320943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 09:39:05 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 09:39:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 09:39:04 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56AEd4dI1518686;
	Thu, 10 Jul 2025 09:39:04 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Thu, 10 Jul 2025 09:38:59 -0500
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-am65: add boot phase tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-65-boot-phases-v2-1-d431deb88783@ti.com>
References: <20250710-65-boot-phases-v2-0-d431deb88783@ti.com>
In-Reply-To: <20250710-65-boot-phases-v2-0-d431deb88783@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2984; i=bb@ti.com;
 h=from:subject:message-id; bh=izQ5uWHo2tTliCItBz0mifpMQDS5rB8XDNZSog2nUHM=;
 b=owNCWmg5MUFZJlNZHd1GawAAZH///7/be/fun8TaPfvvvHGnvcj/Ve0rPW73/t7/6n/quXWwA
 RszQxQ0A0PUA0AA0aGgDQaAAAaDTRoaAAAGgDQAANDR6h6TI9Q8kxPQjbRQ6Gg0YgAwmmmQZGmm
 jTQyaZGhoDRk0yBoZAyMgaYhkNBo0yaBk0aDCAMJtQ00DJD1GjTR6mjQZBoaABppk02iaMmgAAA
 yANDCMhhDEyGQyYgNNNABiaYg0aAEHKFXGBFZgITMOOlpIkRE6F8KpYQ0IBQ4je0DZhtNAfM2U5
 /QhrwRHhk0zX2H5QbtRknoppiZhrU2GOFYh5+hKRU/c5AsGdE+5okLOUOaY8D3q0XRjOFXfuzYI
 qaQjzfL/QPiEqRuqCOy1YBUpUKTxJUZqZ4JBBCEXhXxHTRifRUuf7nwF0H2O01eWR3qVTVifCvL
 UQZAdPcagI5giniUj7aKORMwKq3AVC/jiLsM7iDkxqxXbzm0zGSo2RyWW/CUZswnivChVo4RiOm
 WF7q+ZDp14pJ+ILu0jRdZFc/4t9FRJiJ5E3VK6+cz9Vas05OJS+rRdlP5DILoIr7okEi+oSIQcS
 76XwHiTgnHe6I+XnIIDTtUTNDfzBqABBesysw1IK2XMuHpF6yU/2BN6UHk23v0CfHblmBvYKQzh
 IEAbBNDf8XckU4UJAd3UZrA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_073908_786357_9F2CA81E 
X-CRM114-Status: GOOD (  11.34  )
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

The 'bootph-all' tag was added to the dt-schema to describe the various
nodes used during the different phases of bootup with DT. Add the
bootph-all tag to all required nodes for all AM65x platforms.

Mark the mailbox and ring accelerators needed to communicate the with
various vendor firmware and the power, clock and reset nodes along with
the MMR for the chip-id to facilitate detecting the SoC and which
silicon version during the early stages of bootup with 'bootph-all' as
they are used during all phases of bootup

Signed-off-by: Bryan Brattlof <bb@ti.com>
--
Changes in v2:
- removed tag from &mcu_udmap{} node
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi   | 1 +
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi    | 1 +
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index b085e736111660ed0dad5f127ef0c3d79c52fe1d..61c11dc92d9c27fc9e47123698c17118cd522be1 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -655,6 +655,7 @@ secure_proxy_main: mailbox@32c00000 {
 			      <0x00 0x32800000 0x00 0x100000>;
 			interrupt-names = "rx_011";
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			bootph-all;
 		};
 
 		hwspinlock: spinlock@30e00000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 7cf1f646500a16c1d1bac6dfb37fb285218063b3..1ea20ee695875b1812e132cb92526c321172e695 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -211,6 +211,7 @@ mcu_ringacc: ringacc@2b800000 {
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <195>;
 			msi-parent = <&inta_main_udmass>;
+			bootph-all;
 		};
 
 		mcu_udmap: dma-controller@285c0000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index eee072e44a42f5f66423200975016447d22bdc46..d62a0be767c814706e146bcf95ee4ff84461a515 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -21,16 +21,19 @@ dmsc: system-controller@44083000 {
 		k3_pds: power-controller {
 			compatible = "ti,sci-pm-domain";
 			#power-domain-cells = <2>;
+			bootph-all;
 		};
 
 		k3_clks: clock-controller {
 			compatible = "ti,k2g-sci-clk";
 			#clock-cells = <2>;
+			bootph-all;
 		};
 
 		k3_reset: reset-controller {
 			compatible = "ti,sci-reset";
 			#reset-cells = <2>;
+			bootph-all;
 		};
 	};
 
@@ -43,6 +46,7 @@ wkup_conf: bus@43000000 {
 		chipid: chipid@14 {
 			compatible = "ti,am654-chipid";
 			reg = <0x14 0x4>;
+			bootph-all;
 		};
 	};
 
@@ -107,5 +111,6 @@ wkup_vtm0: temperature-sensor@42050000 {
 		reg = <0x42050000 0x25c>;
 		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
 		#thermal-sensor-cells = <1>;
+		bootph-all;
 	};
 };

-- 
2.49.0


