Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420F0D43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKjKdh8uIYu5IDKofoXchUb2lw7bLvsxB0RuFLbP7sQ=; b=egFlR+c/BITG3wmIyk9iXPveYE
	gaq+cbZoTjlXv71/CjJ2Mb1L/GiPPWUtwM1O88MtF39GYuKACQcKDGaTLsj+/QZXyOf6103a/3/E+
	ED9e6YJ48N1djeAoRsWk3yRYY7Q4THxtWr4blSZy10nXFvvDAc8/q9DspQgT5OrUFkQHgcqQsahNB
	tNil1zxSNRFCrN6WMoTnaKFSQVcV/h5swsGBLTRItBYImYUCG9Zve55XJG6WwWlT12sdtCOGn9sOo
	TwsHf0+7Nio4BqQ8bvytkWyH/QE9g+XUm2JzmAxXWxpvpmtNhUmobPxfDnf1l75+tizmcztSO3hij
	XqS7dylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Cl-00000006qt2-0abm;
	Thu, 07 Nov 2024 12:01:39 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t901i-00000006Xyp-2AnM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:46:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A7Ak5R1014571;
	Thu, 7 Nov 2024 04:46:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730976365;
	bh=kKjKdh8uIYu5IDKofoXchUb2lw7bLvsxB0RuFLbP7sQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=b7h7yqBBAWX4ElR3KCABGzUdBgEM/B1t37LOzboM20P+KEcnrh+X8PS4VdRZi7v0Y
	 JOtOEPzFWf+bpRPx8Cc9QGlOTvOe/l8+HoO7Hd+iINymUPB+EJOSi14Bo1uO1kraES
	 lbD/d2LxuWbAwSVnP1DxBVc4id/Hm2C6y6ONvg4s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7Ak5m9035596;
	Thu, 7 Nov 2024 04:46:05 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Nov 2024 04:46:05 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Nov 2024 04:46:05 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7Ak5dj123522;
	Thu, 7 Nov 2024 04:46:05 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A7Ak4k9019865;
	Thu, 7 Nov 2024 04:46:04 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock
Date: Thu, 7 Nov 2024 16:15:57 +0530
Message-ID: <20241107104557.1442800-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107104557.1442800-1-danishanwar@ti.com>
References: <20241107104557.1442800-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_024610_669882_655BFFDB 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

ICSSG currently uses ICSSG_ICLK (clk id 20) which operates at 250MHz.
Switch ICSSG clock to ICSSG_CORE clock (clk id 0) which operates at
333MHz.

ICSSG_CORE clock will help get the most out of ICSSG as more cycles are
needed to fully support all ICSSG features.

This commit also changes assigned-clock-parents of coreclk-mux to
ICSSG_CORE clock from ICSSG_ICLK.

Performance update in dual mac mode
  With ICSSG_CORE Clk @ 333MHz
    Tx throughput - 934 Mbps
    Rx throuhput - 914 Mbps,

  With ICSSG_ICLK clk @ 250MHz,
    Tx throughput - 920 Mbps
    Rx throughput - 706 Mbps

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index c66289a4362b..ceceee2affd9 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -1227,6 +1227,10 @@ icssg0: icssg@30000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x00 0x30000000 0x80000>;
+		clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
+			 <&k3_clks 81 20>; /* icssg0_iclk */
+		assigned-clocks = <&k3_clks 81 0>;
+		assigned-clock-parents = <&k3_clks 81 2>;
 
 		icssg0_mem: memories@0 {
 			reg = <0x0 0x2000>,
@@ -1252,7 +1256,7 @@ icssg0_coreclk_mux: coreclk-mux@3c {
 					clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
 						 <&k3_clks 81 20>; /* icssg0_iclk */
 					assigned-clocks = <&icssg0_coreclk_mux>;
-					assigned-clock-parents = <&k3_clks 81 20>;
+					assigned-clock-parents = <&k3_clks 81 0>;
 				};
 
 				icssg0_iepclk_mux: iepclk-mux@30 {
@@ -1397,6 +1401,10 @@ icssg1: icssg@30080000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x00 0x30080000 0x80000>;
+		clocks = <&k3_clks 82 0>,   /* icssg1_core_clk */
+			 <&k3_clks 82 20>;  /* icssg1_iclk */
+		assigned-clocks = <&k3_clks 82 0>;
+		assigned-clock-parents = <&k3_clks 82 2>;
 
 		icssg1_mem: memories@0 {
 			reg = <0x0 0x2000>,
@@ -1422,7 +1430,7 @@ icssg1_coreclk_mux: coreclk-mux@3c {
 					clocks = <&k3_clks 82 0>,   /* icssg1_core_clk */
 						 <&k3_clks 82 20>;  /* icssg1_iclk */
 					assigned-clocks = <&icssg1_coreclk_mux>;
-					assigned-clock-parents = <&k3_clks 82 20>;
+					assigned-clock-parents = <&k3_clks 82 0>;
 				};
 
 				icssg1_iepclk_mux: iepclk-mux@30 {
-- 
2.34.1


