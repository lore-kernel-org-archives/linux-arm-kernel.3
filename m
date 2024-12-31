Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C8AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g2qZD0/P/vJ/HRqF257T3srRsmW4oyMvUfvnaCfKbhc=; b=3QqoY3jXRiHlnGq/99Zzv57RlZ
	O+nw2Y2E8P4Gv/tncLRuwZkhA0xqR8GNAZrfnqRi7bvfnvCMyGGMT3mTunH58rp9vXP8f7A2kbro9
	72wZTJG2Ig4//OTfyCR1uZDLDm3M2FUDWm1yOm6an9Wi5U4b1+MJ1qBLo0++/G6+YquwZXx30JiD5
	S5OSAl/yEpXjcZC5lsQg3oiLDTZGvLqEUtAXGOFkcpjZdBjix01lIDyYI/qF0p74bdsixcuouX7dH
	fxV0OBl9SvT84O0W58HsuMo6cIpcTXpbGEOg0n4Zhqeeot7ngWoqxBTdYE8NHGZ4TsZ3SE30Jeq3x
	JsnLgaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYTb-00000006vWU-2se0;
	Tue, 31 Dec 2024 09:23:47 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYKo-00000006uGm-052d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 09:14:43 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BV9EOS51611659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Dec 2024 03:14:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735636464;
	bh=g2qZD0/P/vJ/HRqF257T3srRsmW4oyMvUfvnaCfKbhc=;
	h=From:To:CC:Subject:Date;
	b=b9Gl8hB+hJQ7DW8QtOCx0jcnbPdXghIi2kOIipIvafGp+6ZItH93QAOqUemfJeTie
	 9rKGYta7NvMqbSg62ujvN2AYyYmKkZQWVQ8NWZ107H+q776LpTysaLpy3FnVDN3Aho
	 TlHkKEJd1JIqqK6bgYmFp9dOLm2VaI7dRSdkZ2i4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BV9EOd0026986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 Dec 2024 03:14:24 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 31
 Dec 2024 03:14:23 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 31 Dec 2024 03:14:23 -0600
Received: from lcpd911.dhcp.ti.com (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BV9EJgF074779;
	Tue, 31 Dec 2024 03:14:20 -0600
From: Dhruva Gole <d-gole@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Tony Lindgren <tony@atomide.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, Dhruva Gole
	<d-gole@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62a-wakeup: Configure ti-sysc for wkup_uart0
Date: Tue, 31 Dec 2024 14:44:19 +0530
Message-ID: <20241231-am62a-dt-ti-sysc-wkup-v1-1-a9b0d18a2649@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20241231-am62a-dt-ti-sysc-wkup-d3539d0627d2
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735631796; l=4031; i=d-gole@ti.com; s=20240919; h=from:subject:message-id; bh=PpIld9gnQEkQi1xw/86ZrvnKG5NUQ76+TjgiaHmgAhg=; b=EZhfIJFX6vJEZSxrlYZVlji5QHBhHV7onPynlsOv/edJbsxS9vVOrmlBJ9UXMW99YZNpsHhK5 5jIA5S5OBSaDzpRxC0te4wlAfiQ/4pVDnJzqiQ5JXL/w97rTvHUruC2
X-Developer-Key: i=d-gole@ti.com; a=ed25519; pk=k8NnY4RbxVqeqGsYfTHeVn4hPOHkjg7Mii0Ixs4rghM=
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_011442_208870_18CFA7B7 
X-CRM114-Status: GOOD (  17.28  )
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

From: Vibhore Vardhan <vibhore@ti.com>

Similar to the TI K3-AM62x SoC commit ce27f7f9e328c8582a169f97f1466976561f1
("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for wkup_uart0"),
The devices in the wkup domain are capable of waking up the system from
suspend. We can configure the wkup domain devices in a generic way using
the ti-sysc interconnect target module driver like we have done with the
earlier TI SoCs.

As ti-sysc manages the SYSCONFIG related registers independent of the
child hardware device, the wake-up configuration is also set even if
wkup_uart0 is reserved by sysfw.

The wkup_uart0 device has interconnect target module register mapping like
dra7 wkup uart. There is a 1 MB interconnect target range with one uart IP
block in the target module. The power domain and clock affects the whole
interconnect target module.

Note we change the functional clock name to follow the ti-sysc binding
and use "fck" instead of "fclk".

Also note that we need to disable the target module reset as noted by
Markus. Otherwise the sysfw using wkup_uart0 can get confused on some
devices leading to boot time issues such as mbox timeouts.

Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
[d-gole@ti.com: Reworded the entire commit message]
Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
Similar patch was sent for AM62x by Tony,
https://lore.kernel.org/all/20231219072503.12427-1-tony@atomide.com/

Original patch for AM62A existed in the TI Vendor tree, with Vibhore's
authorship:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi?h=ti-linux-6.6.y-cicd&id=197bf739444100c13edaddd1f7061fa94ccfad2d

Just reworded the commit message without changing any code content.

Happy New Year to everyone! :)
---
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 36 +++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index 0b1dd5390cd3f42b0ec56bab042388722b4c22a1..b2c8f5351743857a54385178cce5c82a961917e3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -2,9 +2,11 @@
 /*
  * Device Tree Source for AM62A SoC Family Wakeup Domain peripherals
  *
- * Copyright (C) 2022-2024 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2022-2025 Texas Instruments Incorporated - https://www.ti.com/
  */
 
+#include <dt-bindings/bus/ti-sysc.h>
+
 &cbass_wakeup {
 	wkup_conf: bus@43000000 {
 		compatible = "simple-bus";
@@ -38,14 +40,34 @@ usb1_phy_ctrl: syscon@4018 {
 		};
 	};
 
-	wkup_uart0: serial@2b300000 {
-		compatible = "ti,am64-uart", "ti,am654-uart";
-		reg = <0x00 0x2b300000 0x00 0x100>;
-		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+	target-module@2b300050 {
+		compatible = "ti,sysc-omap2", "ti,sysc";
+		reg = <0 0x2b300050 0 0x4>,
+		      <0 0x2b300054 0 0x4>,
+		      <0 0x2b300058 0 0x4>;
+		reg-names = "rev", "sysc", "syss";
+		ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
+				 SYSC_OMAP2_SOFTRESET |
+				 SYSC_OMAP2_AUTOIDLE)>;
+		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>,
+				<SYSC_IDLE_SMART>,
+				<SYSC_IDLE_SMART_WKUP>;
+		ti,syss-mask = <1>;
+		ti,no-reset-on-init;
 		power-domains = <&k3_pds 114 TI_SCI_PD_EXCLUSIVE>;
 		clocks = <&k3_clks 114 0>;
-		clock-names = "fclk";
-		status = "disabled";
+		clock-names = "fck";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0x2b300000 0x100000>;
+
+		wkup_uart0: serial@0 {
+			compatible = "ti,am64-uart", "ti,am654-uart";
+			reg = <0 0x100>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+	       };
 	};
 
 	wkup_i2c0: i2c@2b200000 {

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241231-am62a-dt-ti-sysc-wkup-d3539d0627d2

Best regards,
-- 
Dhruva Gole <d-gole@ti.com>


