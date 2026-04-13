Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6423EF531C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h27RIqAXbauCPey4dOUREgplC+L2RbYGkXpU23cZBk=; b=xLC+vchBRXUExa1EQyZX0Tl45k
	JQ1kU/Dfk0bvbbMtZnL7KhPbtuxXClHy8u2iaKZR7fd91ndz1YKDW4JZtBNcywT+GSTGCXqxD74Ot
	wwNATf1/L/cDHkHv2T9EJQed4SapwtkPoK9qUKKYwpN+9ru7uS+yhY6Bnypj6hsnAx08oXx7uqiqp
	XN15T3ullTJx+L+NEQtVhlMIQrMBOG1EXseKi4MoYSoVnFPnFX0K7sICe6IiyQo7LXIKOqIYFVrgQ
	pMgOw1nyFHrdnhpKwIMv0sHIA6DdMxn3j5lC2gigKglMePfgybYjLshJzv8JRF33TtQM1srLM9kTe
	U5HwIslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM60-0000000GDCH-3B2Z;
	Mon, 13 Apr 2026 18:33:16 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM5u-0000000GD8P-33ZD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:33:13 +0000
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHTlkY2253730;
	Mon, 13 Apr 2026 18:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=8h27RIqAXbauC
	Pey4dOUREgplC+L2RbYGkXpU23cZBk=; b=MbR40wRBMU4NCYieeLGe7rwTmLbax
	VrK8ZzfHsmfHT9yT/CLnv4iq6HJTDa1EZ2nw+qyVw7nkW2u3gVS6SlxR8l9r8FAF
	uSwPgDw8oAHN/x/K+CyX4h5iEY3PNLEkkKe0XDN4bBMG9VHlWyqIWAlgYrKQ3mnH
	FqxXucOkm1ccLZwLJdlUf1Ph3xeZE+OdSAloUXWKfV+yLjlahbSHmHJX1MJ3X9Tw
	nuUbM1IzyZtFstpCSoispsO+V3hkrPEkT0N+1EEmeKpsIeNhcu9LeqiHhQWxITCH
	gd3gEYeUfUxfp2v2E3QCrq0e85W/74rzssa/wn/miWKUrNxj6vpmUVphg==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dh2kujkad-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:32:58 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 2611026F;
	Mon, 13 Apr 2026 18:32:57 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 8D96D8000B6;
	Mon, 13 Apr 2026 18:32:57 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v6 3/4] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS
Date: Mon, 13 Apr 2026 18:32:46 +0000
Message-ID: <20260413183247.1381172-4-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413183247.1381172-1-nick.hawkins@hpe.com>
References: <20260413183247.1381172-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MiBTYWx0ZWRfX3Jh6sSgOqqcA
 D2kPFVhCXcZtBfaS/BpQimlgBwGdwjqS8WzRpr0dq2gsUNf8aDhDbHj0IXEXYejPQVdFawUCKX/
 AVsYqfLHtWUdMbUaPUKGE6CS/1lnzweVexv/dezYD6BdX0A1uPsaSi2o9enAkOXg6dob+PG+2kU
 F8VsMQQnTxAg+gq5MamF3qbyUgjz7KRElAByLd8WtKRqbvxArShC9/7H136IshDLtIJLTCCvfY9
 Y9N9idfp2ua4nb0JKXVcjHYDhI2Yiy73YrgcQezgmNfznUS7sJUdlgvZX5EZLQjwmBfgDFICfyu
 10lJYo5sWSGaypjSbNjoy30kmxVU+KiJ2nssG/vsDLXMik5a7n5YetQD+RPc15dIXmcNVRSoQTx
 +pANVxOFRRUS8UkSySgFeF4vPZnDbCCc0oQNa2FSU2hDY+GWtPFh4Sk22rZjBy5D+DFZrcb8y+m
 6Z4PDed95Of0yGB//tw==
X-Proofpoint-ORIG-GUID: wV-HMlNhab_5TKxgiDkTjpU3-8hZBP4N
X-Authority-Analysis: v=2.4 cv=FKcrAeos c=1 sm=1 tr=0 ts=69dd36da cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ZSrvDirOKP4VPF05hnFf:22 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=KK1IH8HFS8MDNeiM4vUA:9
X-Proofpoint-GUID: wV-HMlNhab_5TKxgiDkTjpU3-8hZBP4N
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_113310_910346_BBDE5B98 
X-CRM114-Status: GOOD (  15.67  )
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

From: Nick Hawkins <nick.hawkins@hpe.com>

Add SoC-level DTSI for the HPE GSC ARM64 BMC SoC, covering the CPU
cluster, GIC v3 interrupt controller, ARM64 generic timer, and console
UART.

Add the board-level DTS for the HPE DL340 Gen12, which includes
gsc.dtsi and adds memory and chosen nodes.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/hpe/Makefile           |   2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts |  18 ++++
 arch/arm64/boot/dts/hpe/gsc.dtsi           | 104 +++++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi

diff --git a/arch/arm64/boot/dts/hpe/Makefile b/arch/arm64/boot/dts/hpe/Makefile
new file mode 100644
index 000000000000..6b547b8a8154
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_ARCH_HPE) += gsc-dl340gen12.dtb
diff --git a/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
new file mode 100644
index 000000000000..7a3d9f1c4b2e
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "gsc.dtsi"
+
+/ {
+	compatible = "hpe,gsc-dl340gen12", "hpe,gsc";
+	model = "HPE ProLiant DL340 Gen12";
+
+	chosen {
+		stdout-path = &uartc;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x40000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/hpe/gsc.dtsi b/arch/arm64/boot/dts/hpe/gsc.dtsi
new file mode 100644
index 000000000000..1f4c2a7b3d91
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/gsc.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree file for HPE GSC
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	osc: clock-33333333 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc";
+		clock-frequency = <33333333>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0xa0008048>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0xa0008048>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	soc: soc@80000000 {
+		compatible = "simple-bus";
+		reg = <0x80000000 0x80000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		uarta: serial@c00000e0 {
+			compatible = "ns16550a";
+			reg = <0xc00000e0 0x8>;
+			clock-frequency = <1846153>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <0>;
+		};
+
+		uartb: serial@c00000e8 {
+			compatible = "ns16550a";
+			reg = <0xc00000e8 0x8>;
+			clock-frequency = <1846153>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <0>;
+		};
+
+		uartc: serial@c00000f0 {
+			compatible = "ns16550a";
+			reg = <0xc00000f0 0x8>;
+			clock-frequency = <1846153>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <0>;
+		};
+
+		uarte: serial@c00003e0 {
+			compatible = "ns16550a";
+			reg = <0xc00003e0 0x8>;
+			clock-frequency = <1846153>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <0>;
+		};
+
+		gic: interrupt-controller@ce000000 {
+			compatible = "arm,gic-v3";
+			reg = <0xce000000 0x10000>,
+			      <0xce060000 0x40000>,
+			      <0xce200000 0x40000>;
+			#address-cells = <0>;
+			#interrupt-cells = <3>;
+			#redistributor-regions = <1>;
+			interrupt-controller;
+			redistributor-stride = <0x0 0x20000>;
+		};
+	};
+};
-- 
2.34.1

