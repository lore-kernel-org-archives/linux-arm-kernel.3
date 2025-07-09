Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962B6C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dfSnUlzbRs/JYHXaRhRzcO9rF+ehFGsaozJ+ZORW38=; b=VnX2aC6DpNTbS6IHMf73gPodjJ
	C7dXDGa892vJa59XAqTFx+A4SWsiOsvavQ58J/ZRh0hcHXutdJqdzM9tzD+YV5M67CvQa4nBdxg1B
	86SQkFp1MnS9V63Exk9MUE4i5oZvSEG6doGr0Iqd60pw3OjW8Zd026LGLdMkEQKurGl/mhJaiyDr5
	b88tgJ1M26Oo1zkeWe/kqfm71eLgHoS+/QW6HFLZEZf9es8pZQJ1b4MX9uIDIcD4W0jbMGpbsHV3C
	lBiN8Vx05TsY/9QAk5YA+jHm3IGop47Tz4qktwdXQtlwAGtu+pIWmPZEo/0liJgNCCbu+pHGvFpSX
	FHWYCdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUf9-00000008kmU-1blo;
	Wed, 09 Jul 2025 13:16:39 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSQh-00000008NtP-1Tax
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:53:36 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569ArWvs1454780;
	Wed, 9 Jul 2025 05:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752058412;
	bh=8dfSnUlzbRs/JYHXaRhRzcO9rF+ehFGsaozJ+ZORW38=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iqXzmmWvHquJovqbLwnOzjkvr22aYxrepQyBNPBeKZBclXpvbKx4wYtcISfESYBKP
	 Lqg0zzZiWgtk/iAIPmjMEdmqaG6l9Cdmkx8eJboGlt/EKQAzgkqLpcFtOafWRsh/0V
	 Up+4lilPnLsd3VGy5kw6M8Ii3DKAFKI+AiYAK9wA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569ArW8p1934206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 05:53:32 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 05:53:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 05:53:31 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569ArUDW3808468;
	Wed, 9 Jul 2025 05:53:31 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <c-vankar@ti.com>
CC: <s-vadapalli@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Roger
 Quadros <rogerq@kernel.org>
Subject: [PATCH v6 2/4] arm64: dts: ti: k3-am62p5-sk: Add bootph-all property to enable Ethernet boot
Date: Wed, 9 Jul 2025 16:23:24 +0530
Message-ID: <20250709105326.232608-3-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709105326.232608-1-c-vankar@ti.com>
References: <20250709105326.232608-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_035335_476595_550BD207 
X-CRM114-Status: GOOD (  10.18  )
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

Ethernet boot requires CPSW nodes to be present starting from R5 SPL
stage. Add bootph-all property to required nodes to enable Ethernet boot
for AM62P5-SK.

Reviewed-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Link to v5:
https://lore.kernel.org/r/20250708084252.1028191-3-c-vankar@ti.com/

Changes from v5 to v6:
- Added bootph-all property to cpsw_mac_syscon node.

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 83c37de7d338..899da7896563 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -214,6 +214,14 @@ sound_master: simple-audio-card,codec {
 	};
 };
 
+&cpsw_mac_syscon {
+	bootph-all;
+};
+
+&phy_gmii_sel {
+	bootph-all;
+};
+
 &main_gpio0 {
 	bootph-all;
 };
@@ -267,6 +275,7 @@ main_mdio1_pins_default: main-mdio1-default-pins {
 			AM62PX_IOPAD(0x0160, PIN_OUTPUT, 0) /* (F17) MDIO0_MDC */
 			AM62PX_IOPAD(0x015c, PIN_INPUT, 0) /* (F16) MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	main_mmc1_pins_default: main-mmc1-default-pins {
@@ -547,6 +556,7 @@ &cpsw_port1 {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&cpsw3g_phy0>;
 	status = "okay";
+	bootph-all;
 };
 
 &cpsw_port2 {
@@ -562,6 +572,7 @@ &cpsw3g_mdio {
 
 	cpsw3g_phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
-- 
2.34.1


