Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305E2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DQJXt0l7muCwR4Tu6CvAWfQ5w6Raa65UZ8uc6i3ChiE=; b=KYcu4Wgph8FwOw
	/ivxdL2hKMtLh07Bko8n/CyMa7tHqbv8+mpHL94UV6bRHw6BaXVOn5WEXQUW2t5UgFbtC8ZUW6plM
	t3RvHz4uBmaeUZ7y75OC9ZPzWZgHbadFonv3voDUjJtdCYjGK1NbsjejEG7kbCFDIlE1DsgYepGPd
	SR5PkJkK3pqlsGT7FVqWUTPxScWsPhDOTvGHoytkLcq/iPx7QVVNM5S0NWNqWhCsqKmJgYirRGs1X
	D6a52qEVrbVEzU24ZAhhToexXp8XjW+4B+ODYBpLMERwZE8KZnvZAr9Dj108J/VEdo6fcTwlwKDNi
	9FtbDJseJSTY3BnWPUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXWJ-00000002Luu-16Ah;
	Fri, 05 Sep 2025 14:34:31 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSyl-00000000p9b-1KgB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:43:36 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5859hUtQ3294675;
	Fri, 5 Sep 2025 04:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757065410;
	bh=DQJXt0l7muCwR4Tu6CvAWfQ5w6Raa65UZ8uc6i3ChiE=;
	h=From:To:Subject:Date;
	b=uILt6dO8aO/+Eyuu4wil43M6t8OPrdvMKnsx4zqDsnboH8FyGLW5TWmvHfVn2HUaF
	 USuswK75eu10yaCwT+81aDhrldmKj0amSRQN6xyH2CcHVH4HjPhH3K0rY3UKM4MgaG
	 XgCMNFIJVY/Sjh9G0/F+0Ffw83H4MarxJNndk7/4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5859hULX834246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 04:43:30 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 04:43:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 04:43:29 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5859hPaT251827;
	Fri, 5 Sep 2025 04:43:26 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <s-jain1@ti.com>
Subject: [PATCH v3] arm64: dts: ti: k3-j721e-main: Add DSI and DPHY-TX
Date: Fri, 5 Sep 2025 15:13:25 +0530
Message-ID: <20250905094325.472473-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_024335_456865_795FC482 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Rahul T R <r-ravikumar@ti.com>

TI's J721E SoC supports a DPI to DSI video signal conversion bridge on
it's platform bus. The IP is from Cadence, and it has a custom TI
wrapper around it to facilitate integration.

This IP takes the DPI video signals from DSS and alongwith the DPHY IP,
it transmits DSI video signals out of the SoC.

Add support for DSI bridge and the DPHY-TX.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
Changelog v2 -> v3:
-Add dsi ports.
-Revert to phy lablels used in v1.

Link to v1- https://lore.kernel.org/all/20250822124622.1424473-1-h-shenoy@ti.com/
Link to v2- https://lore.kernel.org/all/20250904105915.3043773-1-h-shenoy@ti.com/
 
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index ab3666ff4297..78fde982aff0 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1887,6 +1887,45 @@ port@4 {
 		};
 	};
 
+	dphy2: phy@4480000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x04480000 0x00 0x1000>;
+		clocks = <&k3_clks 296 1>, <&k3_clks 296 3>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 296 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 296 3>;
+		assigned-clock-parents = <&k3_clks 296 4>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@4800000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x04800000 0x00 0x100000>, <0x00 0x04710000 0x00 0x100>;
+		clocks = <&k3_clks 150 1>, <&k3_clks 150 5>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 150 TI_SCI_PD_EXCLUSIVE>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy2>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	dss: dss@4a00000 {
 		compatible = "ti,j721e-dss";
 		reg =
-- 
2.34.1


