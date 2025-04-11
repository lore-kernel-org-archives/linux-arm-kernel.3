Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B73CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e9LI8VdJWzvGwvWyJvwbcvffdGYsX3wJ0VFrvvQKvgI=; b=xcCSOHzcQ+Z/XsM07sGwlByu3L
	K2JfWS2LpguP9SJQIf6oJymtoWd/O23VKvyYlTo6HvHe6TQ7PBzctDXYzW4McEbDq15ZqDmpaNvlA
	/lKA8RiGFjOi9bnx8uE9tAmVhwccJlFjHxniBNuC+EBjTHogZZf99k501mkGmfEDUYKM2b5NIy/aM
	xEd4Qh5imneG94EXOvYhInw9RRR5Rq1w/GIh/AGtg5fXRdWIzznxQcgPTszyN82P4nXHxaWtRCl47
	5l2TTCI3/twODW68hOW67tgPhm3ptGXHW4nA9PENsisYOERYgWVnkvmB6cUeZJewS3Fe+z0+GGGZH
	rzEEhYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DTR-0000000DjqI-0uok;
	Fri, 11 Apr 2025 12:27:09 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DG0-0000000Dh9L-0dTL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:13:17 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BCDCVh2068790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 07:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744373592;
	bh=e9LI8VdJWzvGwvWyJvwbcvffdGYsX3wJ0VFrvvQKvgI=;
	h=From:To:CC:Subject:Date;
	b=wCSiWD02X5Oal4gMz3HMAUcHAmPsRCjaMHrBX/lHPCZmJMvW6fFvD8TQY8TS/X5v0
	 wTgCGlitCJY+0uvwLEfvw4wlmvD8wAhSTqEyOw0wf7XIfJphejBitkr5kuO/Tz7v7R
	 /Dxu5trogQP/qZvh152ZnyXkci+wsToB/SjjPunE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BCDCS1123695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 07:13:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 07:13:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 07:13:11 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BCD7aa011992;
	Fri, 11 Apr 2025 07:13:08 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 RESEND] arm64: dts: ti: k3-j784s4-j742s2-main-common: Enable ACSPCIE output for PCIe1
Date: Fri, 11 Apr 2025 17:43:07 +0530
Message-ID: <20250411121307.793646-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_051316_353027_B18F08DF 
X-CRM114-Status: GOOD (  13.56  )
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

The PCIe reference clock required by the PCIe Endpoints connected to the
PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
and J742S2-EVM is driven by the ACSPCIE module. Add the device-tree support
for enabling the same.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250411.
The v2 patch is at:
https://lore.kernel.org/r/20241209085157.1203168-1-s-vadapalli@ti.com/
No changes since v2. The dtbs_check warnings are no longer seen with
next-20250411 and no changes were required to the patch itself to fix
the warnings. Hence the patch has been marked with a RESEND tag.

Regards,
Siddharth.

 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi     | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 1944616ab357..591609f3194c 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/mux/mux.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-cadence.h>
 #include <dt-bindings/phy/phy-ti.h>
 
 #include "k3-serdes.h"
@@ -126,6 +127,11 @@ audio_refclk1: clock@82e4 {
 			assigned-clock-parents = <&k3_clks 157 63>;
 			#clock-cells = <0>;
 		};
+
+		acspcie0_proxy_ctrl: clock-controller@1a090 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x1a090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -1093,8 +1099,8 @@ pcie1_rc: pcie@2910000 {
 		max-link-speed = <3>;
 		num-lanes = <4>;
 		power-domains = <&k3_pds 333 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 333 0>;
-		clock-names = "fck";
+		clocks = <&k3_clks 333 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
@@ -1105,6 +1111,7 @@ pcie1_rc: pcie@2910000 {
 		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
 			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x1>;
 		status = "disabled";
 	};
 
-- 
2.34.1


