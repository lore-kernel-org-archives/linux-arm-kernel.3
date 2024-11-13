Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EE1D41C38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezUZUBpfTn5lX0jVgbBCSPADKDHBLLkKbCQkyiQs3cI=; b=eM3CddwF8C4HSxuI8jbQ1FXLzA
	6tBp0WQVA85qN1DK4EDqbtOilwN4MFnPXpZCfuXe/3ug5nMuimf72e/FhBzHgvns6FIqIOXcClYxQ
	TrL/sVG/Suv1RiJGOhkVvL1JuoBdFX+a6suHE24MbTPCmgDjaNPQklYr6JITarWFqbIFJEtu1M0Ug
	sO2Qr3mOY8sqhWD5C7pLoClZ32USoYzFFLvISsNJ1TBhVx1nU4DvKGp1bUdRPpfYgg2OteHkU+WLu
	VfEYqPPCmft9CQTYdQwQUzjr2XaIbnb8RDKYJB8Kt2s1SDpOSAatGkqktA6MlLKhW9nFsGKLS+Zgn
	s4eZlP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBJl-00000006YTW-3qv3;
	Wed, 13 Nov 2024 11:13:50 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBGC-00000006Xxw-1nCP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 11:10:10 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ADBA3YF032469;
	Wed, 13 Nov 2024 05:10:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731496203;
	bh=ezUZUBpfTn5lX0jVgbBCSPADKDHBLLkKbCQkyiQs3cI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Rt8mGv/sKN6UC2HLMqWZpyhJX3gVte+QQxbH1AllliS1vEDoAuLSNX0JP+PsT2FGw
	 uht6k0Q+30NcRddWzN1jdrkfFfRQhJt9CiLtg04ppIQxScmc4y6OhDcEKAbqjhxqYX
	 fh5JB7YXakLgYB4wYzHAyMcD6Ew38MA3hAdlh4dg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ADBA3wK031291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Nov 2024 05:10:03 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 05:10:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 05:10:03 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ADBA2jZ077257;
	Wed, 13 Nov 2024 05:10:02 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4ADBA2Xk021307;
	Wed, 13 Nov 2024 05:10:02 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock
Date: Wed, 13 Nov 2024 16:39:55 +0530
Message-ID: <20241113110955.3876045-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113110955.3876045-1-danishanwar@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031008_624930_6EE47534 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

ICSSG has 7 available clocks per instance. Add all the cloks to ICSSG
nodes. ICSSG currently uses ICSSG_ICLK (clk id 20) which operates at
250MHz. Switch ICSSG clock to ICSSG_CORE clock (clk id 0) which operates at
333MHz.

ICSSG_CORE clock will help get the most out of ICSSG as more cycles are
needed to fully support all ICSSG features.

This commit also changes assigned-clock-parents of coreclk-mux to
ICSSG_CORE clock from ICSSG_ICLK.

Performance update in dual mac mode
  With ICSSG_CORE Clk @ 333MHz
    Tx throughput - 934 Mbps
    Rx throughput - 914 Mbps,

  With ICSSG_ICLK clk @ 250MHz,
    Tx throughput - 920 Mbps
    Rx throughput - 706 Mbps

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index c66289a4362b..324eb44c258d 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -1227,6 +1227,15 @@ icssg0: icssg@30000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x00 0x30000000 0x80000>;
+		clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
+			 <&k3_clks 81 3>,  /* icssg0_iep_clk */
+			 <&k3_clks 81 16>, /* icssg0_rgmii_mhz_250_clk */
+			 <&k3_clks 81 17>, /* icssg0_rgmii_mhz_50_clk */
+			 <&k3_clks 81 18>, /* icssg0_rgmii_mhz_5_clk */
+			 <&k3_clks 81 19>, /* icssg0_uart_clk */
+			 <&k3_clks 81 20>; /* icssg0_iclk */
+		assigned-clocks = <&k3_clks 81 0>;
+		assigned-clock-parents = <&k3_clks 81 2>;
 
 		icssg0_mem: memories@0 {
 			reg = <0x0 0x2000>,
@@ -1252,7 +1261,7 @@ icssg0_coreclk_mux: coreclk-mux@3c {
 					clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
 						 <&k3_clks 81 20>; /* icssg0_iclk */
 					assigned-clocks = <&icssg0_coreclk_mux>;
-					assigned-clock-parents = <&k3_clks 81 20>;
+					assigned-clock-parents = <&k3_clks 81 0>;
 				};
 
 				icssg0_iepclk_mux: iepclk-mux@30 {
@@ -1397,6 +1406,15 @@ icssg1: icssg@30080000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x00 0x30080000 0x80000>;
+		clocks = <&k3_clks 82 0>,  /* icssg1_core_clk */
+			 <&k3_clks 82 3>,  /* icssg1_iep_clk */
+			 <&k3_clks 82 16>, /* icssg1_rgmii_mhz_250_clk */
+			 <&k3_clks 82 17>, /* icssg1_rgmii_mhz_50_clk */
+			 <&k3_clks 82 18>, /* icssg1_rgmii_mhz_5_clk */
+			 <&k3_clks 82 19>, /* icssg1_uart_clk */
+			 <&k3_clks 82 20>; /* icssg1_iclk */
+		assigned-clocks = <&k3_clks 82 0>;
+		assigned-clock-parents = <&k3_clks 82 2>;
 
 		icssg1_mem: memories@0 {
 			reg = <0x0 0x2000>,
@@ -1422,7 +1440,7 @@ icssg1_coreclk_mux: coreclk-mux@3c {
 					clocks = <&k3_clks 82 0>,   /* icssg1_core_clk */
 						 <&k3_clks 82 20>;  /* icssg1_iclk */
 					assigned-clocks = <&icssg1_coreclk_mux>;
-					assigned-clock-parents = <&k3_clks 82 20>;
+					assigned-clock-parents = <&k3_clks 82 0>;
 				};
 
 				icssg1_iepclk_mux: iepclk-mux@30 {
-- 
2.34.1


