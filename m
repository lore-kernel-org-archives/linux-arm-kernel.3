Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAED7D5C0EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKjKdh8uIYu5IDKofoXchUb2lw7bLvsxB0RuFLbP7sQ=; b=adZ0zI2qsDFn0xVc7R/Gwq7w8I
	rF+sneZ9ge0hwehBJEGzbSBf+fAPeKKuGNI3NRet56HxPt7StcQlHKN7AlA1qyKPyvXP5pmR6REd2
	SwwuxLPTspzA06p6lDDh5lLhYEI5/q2IemPxo9qtEagsF7CrWkA/yrNtbnLG90YGPpBU+bEaaHIdC
	FFAevchhRYunP675x2bg7nKTtE6nRYofWIywwwOsaTR6uRMeJVALeWykEHp63oMFPslbZ68emyp9d
	asJg7EBqbBGsWqMDeaOL91Io3AGgzFtvHIklUbZfst1QfWOQaGmgBGkhTxZKwsJzXwutfbqxWc5zI
	VJy4Wr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qru-0000000B16w-3Lhg;
	Fri, 08 Nov 2024 15:25:50 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pzq-0000000Ar3m-1vsn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:29:59 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8ETrtn2085974
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 8 Nov 2024 08:29:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731076193;
	bh=kKjKdh8uIYu5IDKofoXchUb2lw7bLvsxB0RuFLbP7sQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rkMpewprgc9kC4J9M/BvNFcAlPvrISO7sbKgSr04Bqq1vaGdtIQs+D/kwXczxMyPM
	 3ylS8MhK2+EEYRJSuVQq8gEMxF2gknzNYBOnZtoQrlX7ss3e82WkK0yb+ZlS3INkFW
	 wxpswgKbF8Q6Mi5XPMubSaVr5ePOtoFSsZ3+b6i8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8ETr7Z072923;
	Fri, 8 Nov 2024 08:29:53 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 08:29:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 08:29:53 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8ETrxo023832;
	Fri, 8 Nov 2024 08:29:53 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A8ETqta032072;
	Fri, 8 Nov 2024 08:29:52 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock
Date: Fri, 8 Nov 2024 19:59:46 +0530
Message-ID: <20241108142946.2286098-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108142946.2286098-1-danishanwar@ti.com>
References: <20241108142946.2286098-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_062958_597304_17803D8D 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, vigneshr@ti.com, kristo@kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
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


