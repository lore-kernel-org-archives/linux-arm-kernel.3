Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5772F483EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyMMjUgPkhUGD6AqCCesvqPbK0cAB6hq6HA+aXbgJJs=; b=BaO53MjS+m/C0lZoXEW7ZKC1Xe
	+kCcfGxZRrKdbFMx5foz9Jzs56TdnwXwkvTXVbcfDOFZQmkq5jVMVuxuHQSFY6N/WehW30dUUgsva
	nh1jy7Ngbyo+7VPPnrg1X9fi8QN6G3WhkJ2XFWK9HzGkQIYglrgVsG2l7iZiczckqtYxvY1oebeMR
	wMqdqOrrzXs386ibL/GfIhid5pacaX6wRsqFMd1HcjguT7e5GPUR7z3z9XqAO/J1b9cCrQT5Quuru
	OvODbedMUHOSX1+cxUrrdOyO6/q71TX10OIVnSlvdVGIIG1PO3RKLsXAunURzNdFoHmDSwP6SaOOg
	GcVBTrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAl-0000000HTmf-1uQq;
	Mon, 23 Mar 2026 19:42:47 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAi-0000000HTjc-3fOj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:42:46 +0000
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHsEMQ3110489;
	Mon, 23 Mar 2026 19:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=FyMMjUgPkhUGD
	6AqCCesvqPbK0cAB6hq6HA+aXbgJJs=; b=BKiUo0cpLKskWbWTZ558WRJM03RUw
	tO4tbdPrekSE+iQ4HIJjcJThJRkYwsxfDJyUMxQlzQARkY3N9oWRgfyB1Zbp+G92
	JwdGnahwFazM0FaioreyuXQcgYXePnsfsHeei9F/IyBO56tT2Bl0w3qvgX6AO6lu
	l6J6oybNE/Segk+djC5w12RGSFsqaVHZ5KoFCpb50+whhKOIvkZv9c2ISfa3Oq+g
	1vCS/Mo9JkdW4wg/kw2az2MSUi3Slk8cK8UvqD+OMMunVHFni7bjoAlu+3BFOPTt
	sY91vubFFP00xc4AQNvFxrtm2O2GGA4S+ED2PR3UaaJ00BLa7jlf84mFA==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d3aaxh4y9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 19:42:31 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 7DA8A802BA4;
	Mon, 23 Mar 2026 19:42:30 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 1B9D9811A53;
	Mon, 23 Mar 2026 19:42:30 +0000 (UTC)
From: nick.hawkins@hpe.com
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean-Marie Verdun <verdun@hpe.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v2 3/3] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS
Date: Mon, 23 Mar 2026 14:42:23 -0500
Message-Id: <20260323194223.683487-4-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323194223.683487-1-nick.hawkins@hpe.com>
References: <20260323194223.683487-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Uqob7A5ISlSyTpmMx2jyd3nJua0PLVXF
X-Proofpoint-ORIG-GUID: Uqob7A5ISlSyTpmMx2jyd3nJua0PLVXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0NSBTYWx0ZWRfX1QhdlWKXtGMl
 cP6RkMyuiuzMFyzViLMg3n7OYwRXpLkV03IMhqxnywMh4yysfRSghe3iUUrtM+tCdmMtCqXAaQq
 9YoS+xkWlplSzcy3kMsirPHQCVwF9ZQ83gQiuoDq/F4yr9I86C/1QcqmfmGJ/dklRDzaitIPZry
 cwOylHVsFh1Ix5fDr6nDqHVKzPy8Su/eL3KfZxR0+mQXPSjgDP6/QXVAjzdjcijWtJfAxzPC+Lj
 i7/8D3n4Xl4N/A/W0crnA52Dt2arLFVbGPKDKqdNCt5+i3fXS0KToPZ9LvgsJDSFa23bjmwjlOC
 TIr/8B0eZFzoZfsIk+ykwlE2rOnx4UyZzTAvXu1mPsDM/5prcosa8H6Tgnj/aIBvdVNzwGLj4t/
 vltHbu405PScKXFlmNoGkACPD/6meHJqkjBa0M9eD2JlO/GkQRlvipO2dHRz0YIho+5ybc5mNE6
 xXUG0R7khVvvzEorFuw==
X-Authority-Analysis: v=2.4 cv=bqRBxUai c=1 sm=1 tr=0 ts=69c197a7 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=6XKncaru_qjgLvANlS_8:22 a=MvuuwTCpAAAA:8 a=KK1IH8HFS8MDNeiM4vUA:9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124245_055840_18C2C4A6 
X-CRM114-Status: GOOD (  16.86  )
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
---
 arch/arm64/boot/dts/hpe/Makefile           |   2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts |  18 ++++
 arch/arm64/boot/dts/hpe/gsc.dtsi           | 106 +++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi

diff --git a/arch/arm64/boot/dts/hpe/Makefile b/arch/arm64/boot/dts/hpe/Makefile
new file mode 100644
index 000000000000..804f7c54e9b6
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_ARCH_HPE_GSC) += gsc-dl340gen12.dtb
diff --git a/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
new file mode 100644
index 000000000000..42cfeac99029
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
index 000000000000..3433c4a18512
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/gsc.dtsi
@@ -0,0 +1,106 @@
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
+	clocks {
+		osc: osc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "osc";
+			clock-frequency = <33333333>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gic>;
+	};
+
+	ahb: ahb@80000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x80000000 0x80000000>;
+		ranges;
+
+		gic: gic@ce000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			redistributor-stride = <0x0 0x20000>;
+			#redistributor-regions = <1>;
+			reg = <0xce000000 0x10000>,
+			      <0xce060000 0x40000>,
+			      <0xce200000 0x40000>;
+		};
+
+		uartc: serial@c00000f0 {
+			compatible = "ns16550a";
+			reg = <0xc00000f0 0x8>;
+			interrupts = <0 19 4>;
+			interrupt-parent = <&gic>;
+			clock-frequency = <1846153>;
+			reg-shift = <0>;
+		};
+
+		uarta: serial@c00000e0 {
+			compatible = "ns16550a";
+			reg = <0xc00000e0 0x8>;
+			interrupts = <0 17 4>;
+			interrupt-parent = <&gic>;
+			clock-frequency = <1846153>;
+			reg-shift = <0>;
+		};
+
+		uartb: serial@c00000e8 {
+			compatible = "ns16550a";
+			reg = <0xc00000e8 0x8>;
+			interrupts = <0 18 4>;
+			interrupt-parent = <&gic>;
+			clock-frequency = <1846153>;
+			reg-shift = <0>;
+		};
+
+		uarte: serial@c00003e0 {
+			compatible = "ns16550a";
+			reg = <0xc00003e0 0x8>;
+			interrupts = <0 12 4>;
+			interrupt-parent = <&gic>;
+			clock-frequency = <1846153>;
+			reg-shift = <0>;
+		};
+	};
+};
-- 
2.34.1


