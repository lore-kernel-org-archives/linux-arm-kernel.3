Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE72CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDBfbjLibJRdDJTAZ5jKEnJS1gRDpAGgfMC+aNVIcfo=; b=Q/dnfmkQyGJ3s71KoMTZr4uJWP
	GWVKcbUfm9lmGop2Sje1VUWmVw0FZgNsVoQjwU9TtWRYEGnuTK/n7Y1DXNjpF8qPALR9LnzzGIKR3
	bVUDte9jvDYb80tOYbi9KRt985fhjB0+1p2/3cqt5LzE2lgXbIrvZLWQLc0wiK6v89dKOzCrrChGI
	JygTnoom43LyHrpdN06R4FSPmXiOLNMzO3nobUo7sDx07GgV8O7lpBlxjEKyEp/rRAge2eNMQgiFG
	rPB9T7HLF2PjTRYUsLXSqJV6TB6WD1DUo8Am4r8SD6Rc7e6jjEonH7DeGiJ0jWiBwLjt5b9Byyg3J
	rSalkupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo40-00000001VAb-0sl6;
	Tue, 26 May 2026 09:27:04 +0000
Received: from mail-northeuropeazon11011033.outbound.protection.outlook.com ([52.101.65.33] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo3s-00000001V5J-0rjC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:26:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSa/Q8txJBJWUoMmolxNZiSETTQ3ym77Hufq3BNoAltoxg4O38MQ2IFyUGWAGdNzvNC8qLCWxO2mzKJ4kADF459C4+N+eRY4tOY1Dl4Bgz1DkX14sdVCSla7w2dh5StYEUYwbipddblY2OR/LLPYoSTwqicj/gh5fQzNhpJxzjvB6iT/OXuRM3p2obpmiO/5WYSIJDHSKAIzeKVmCQCZp6jEMpDpIfNj5DxJV8NVfSp43psj274HDMC12iUjC8pH1qHQFlHZOVlNCFcyF/dcTrhG4zh0pHDNFrQCigefc1VVdNT0qwXgUTq3KoFk+LDGqoyDa4wBP0kkH7EUZGYaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDBfbjLibJRdDJTAZ5jKEnJS1gRDpAGgfMC+aNVIcfo=;
 b=ZeSqXsz816lEp6nKF/ApGJTksB3a+F9T0owH8icGI0dqdm4PclDW4KC37PVakQIb6+oIbtjVYPnj90gVI7T57FJUL+KTtnfZel0EVkzRGxiDdQBcvDxOog53U8TrHfDZ9qpfRnBa1+fv4fcfLN/jIQjZs3RVt6MSjSwY8QvnLPtBxERtWyKorlhbTN7u/Eyh/JVBhOot8HrwaSToDMp1hq7PVAyag/Y4rqnvQnKkzYJerUX3lFkC2RAZ958nCJNq2JHC6xDRGPVLw0kn9S4f4iuOSuQJqBf0BdC/qQr9+T6y2jBNgaGsaNKJQ+D/I3PrluqYQW64hfsVPg+LsLlT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDBfbjLibJRdDJTAZ5jKEnJS1gRDpAGgfMC+aNVIcfo=;
 b=PBq104QJ6Y/HLJtB61VuOI34KIWQBPS4hVD517wA0KGUjAUUtQGWblYPtBZY3RPeoOj2M+/QwPoOH0M8A5QS5xLvi/Y9ZX+YfW8ygHLbW8WRzm6PYWCZ+gWjffrmSnDITOngV7cRsrkE44uINgKzYZox5/9MdBrH+9KPUU5mkPbEwfaQHSW6RR6sxnhCT4MUaRodF7EXQhlHSSgp0xJFwLQakrOnvlf1rHSlB7TcZBko0C4hsxgssFU53vHtCcnBKlrETYktRZexvBCjSXIViys6O7uVA7IMM8B6Gb9Io9V0lgYJnhe0zOM02MO7Ag82kb3iRQ6aHAmOKwqR0hSrzg==
Received: from AS9PR05CA0323.eurprd05.prod.outlook.com (2603:10a6:20b:491::13)
 by DU0PR10MB6411.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:409::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:26:51 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:20b:491:cafe::20) by AS9PR05CA0323.outlook.office365.com
 (2603:10a6:20b:491::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 09:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:29 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:48 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 26 May 2026 11:26:46 +0200
Subject: [PATCH v7 6/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp15 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-upstream_uboot_properties-v7-6-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
In-Reply-To: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008E:EE_|DU0PR10MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 78067be1-67f9-4f49-5526-08debb08eb06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|3023799007|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /qF+13bYIlFMo6IIYVKQVPCtSmcls0btHUCJRP4h/8erY0Br+EqayLmDyRyFUBwvB6882IJVHnvFHImCibaP0/0fb6OH43SaiufZRxpLV03KwWN6ZCnpO+Lu4KWag91a2XedWyS4s0ITrDPjX4CdlFR6lfydb/fViXws3b6kcp/o4Xzf70UIohq2mdVfm4Wxh36ZN8nPjk7mP0j24FDrHkxzepttDutpA2G49j5savAQce8BmU+nLDbt/2RBFDEB8QjpesMJrE8m66dhIkLYhcmCRDkpe3+qAIvFW2fs7HpRxiL/4NL/jfgr3hQQCO2kfI2WrGZLEVwG2jpEdDiXVO/XlFpV/LodAOwCgZHc6nUfqXD6o8pFdWhN3O/gsGG2PO8HBuKrvEPu81c2XgpGW+HwBoofoWlNQagpFlku+jaOt64Ra0d32rgHJ/HFdzJ4vwf8lpCJh6elFWNU5ezHO316peB3DdnADvlHU0v2XZX5vZRdJtRdZPZVvsLtgIwVaq0wK/ZO0FWBrFKvowmPp708hKHeaCfYJ9sapc55OWhuTbmBoF/q/NFNtyhcrVC5Xqr5vhatAFSvRnA/BWvGR+HvZjgLUkQP6kYRxFp0uvDvW+Le/acIAXzPWpDjO90+r4+gdKINiiesB0bqLtNxvhuMm4VCwM6l5bAKUNCKRvctZQ8OVg+4XvuNxM+7SiCFYurLDqjYN/pPiIX/4kCCDEkhXqMT299RIGeyIsKDSKE=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(3023799007)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rt400WSncOEkMFjObd/uwC08vuhdMvtjkQ7dEgyzH3F1ipgtcJ2oIIvKnubLGtD6kI30emiDoZLgUI7y1YU/cpMgGELUj9t64fnkoFxQkUktPsWvclQMShcIExpF0BCGQSL8Fzo9i9KP1r6jjw3Xl97E5/KRSPeBbfI4bUK5CiZ6rKhwG+5JC96+Qg7ch8rwiEmcx0oaeuovwf1g6Wll4z3IzlDLrFd5b8MEOWRoNGG+0L3LSrNoiWqs67Ex9LOSt39stPTPmCtcrsFnKrKuw8XA9pTxZ8qzCgKG3gedaVzYhwpb47YtHnAKMqg+9HuMH13EjXuNt2Tw+eQw6rkjMjmCDRj1+ogDQiaFEeF/iReK5zsCWEnjbYLlipQkYBiEf+srBicRPnFhS/mXZsRIu+DuM4QxCe6wvVsQ/yp6OyDNw0vGWPHea8VkKMsOpZbE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:50.9396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78067be1-67f9-4f49-5526-08debb08eb06
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_022656_577723_E08E9DF2 
X-CRM114-Status: GOOD (  12.99  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   2 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts      |  19 +++
 .../st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts |   1 +
 .../dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts  |  25 +++
 .../dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts |  26 +++
 .../boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi    | 100 ++++++++++++
 ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |  27 ++++
 .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |  27 ++++
 .../boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi |  97 ++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts      |  19 +++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts           | 151 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  38 +++++
 arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts       |   1 +
 arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi  | 119 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-odyssey.dts       |  21 +++
 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts  |   1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     |   5 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi   |   2 +-
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi    | 175 +++++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi   |  55 +++++++
 .../boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi    | 157 ++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi   |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          | 122 ++++++++++++++
 28 files changed, 1300 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 84f68e8563d8..57443697e6e0 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -31,7 +31,7 @@ arm-pmu {
 		interrupt-parent = <&intc>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index 847b360f02fc..b81b6e168b67 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -65,6 +65,7 @@ &m4_rproc {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &rcc {
@@ -85,3 +86,21 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&scmi {
+	bootph-some-ram;
+};
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
index df97e03d2a5a..4ad1313efca9 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
@@ -92,6 +92,7 @@ bridge_out: endpoint {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts
index 60ce4425a7fd..ac4e313ca371 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts
@@ -35,15 +35,40 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
+	bootph-all;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index f8e404346396..cc24a29fba15 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -92,6 +92,7 @@ bridge_out_panel: endpoint {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -110,15 +111,40 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
+	bootph-all;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
index 569a7e940ecc..db93934019d1 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
@@ -61,6 +61,7 @@ vddcore: regulator-vddcore {
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vdd: regulator-vdd {
@@ -69,6 +70,7 @@ vdd: regulator-vdd {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vdd_usb: regulator-vdd-usb {
@@ -77,6 +79,7 @@ vdd_usb: regulator-vdd-usb {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vdda: regulator-vdda {
@@ -85,6 +88,7 @@ vdda: regulator-vdda {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vdd_ddr: regulator-vdd-ddr {
@@ -93,6 +97,7 @@ vdd_ddr: regulator-vdd-ddr {
 		regulator-min-microvolt = <1350000>;
 		regulator-max-microvolt = <1350000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vtt_ddr: regulator-vtt-ddr {
@@ -102,6 +107,7 @@ vtt_ddr: regulator-vtt-ddr {
 		regulator-max-microvolt = <675000>;
 		regulator-always-on;
 		vin-supply = <&vdd>;
+		bootph-all;
 	};
 
 	vref_ddr: regulator-vref-ddr {
@@ -111,6 +117,7 @@ vref_ddr: regulator-vref-ddr {
 		regulator-max-microvolt = <675000>;
 		regulator-always-on;
 		vin-supply = <&vdd>;
+		bootph-all;
 	};
 
 	vdd_sd: regulator-vdd-sd {
@@ -119,6 +126,7 @@ vdd_sd: regulator-vdd-sd {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	v3v3: regulator-v3v3 {
@@ -127,6 +135,7 @@ v3v3: regulator-v3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	v2v8: regulator-v2v8 {
@@ -136,6 +145,7 @@ v2v8: regulator-v2v8 {
 		regulator-max-microvolt = <2800000>;
 		regulator-always-on;
 		vin-supply = <&v3v3>;
+		bootph-all;
 	};
 
 	v1v8: regulator-v1v8 {
@@ -145,13 +155,86 @@ v1v8: regulator-v1v8 {
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
 		vin-supply = <&v3v3>;
+		bootph-all;
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &dts {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &i2c2 {
 	i2c-scl-falling-time-ns = <20>;
 	i2c-scl-rising-time-ns = <185>;
@@ -167,6 +250,7 @@ &ipcc {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -180,6 +264,22 @@ &m4_rproc {
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rng1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index 5116a7785201..7bfd7da4a8db 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -78,6 +78,7 @@ &i2c2 {
 &ltdc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ltdc_pins>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -134,19 +135,45 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	st,neg-edge;
 	vmmc-supply = <&vdd>;
+	bootph-all;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 /* J31: RS323 */
 &uart8 {
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dts b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
index d949559be020..a1f79659d7c5 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
@@ -36,19 +36,46 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	st,neg-edge;
 	vmmc-supply = <&vdd>;
+	bootph-all;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+		bias-pull-up;
+	};
+};
+
 /* J31: RS323 */
 &uart8 {
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
index a75f50cf7123..4f6f4712d634 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
@@ -61,6 +61,7 @@ vin: regulator-vin {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vddcore: regulator-vddcore {
@@ -70,6 +71,7 @@ vddcore: regulator-vddcore {
 		regulator-max-microvolt = <1200000>;
 		regulator-always-on;
 		vin-supply = <&vin>;
+		bootph-all;
 	};
 
 	vdd: regulator-vdd {
@@ -79,6 +81,7 @@ vdd: regulator-vdd {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		vin-supply = <&vin>;
+		bootph-all;
 	};
 
 	vddq_ddr: regulator-vddq-ddr {
@@ -88,9 +91,34 @@ vddq_ddr: regulator-vddq-ddr {
 		regulator-max-microvolt = <1350000>;
 		regulator-always-on;
 		vin-supply = <&vin>;
+		bootph-all;
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &dts {
 	status = "okay";
 };
@@ -113,12 +141,61 @@ nand@0 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -132,6 +209,26 @@ &m4_rproc {
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
+&pwr_regulators {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rng1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
index 43280289759d..e192d033626e 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
@@ -71,6 +71,7 @@ &m4_rproc {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &rcc {
@@ -91,3 +92,7 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&scmi {
+	bootph-some-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1ec3b8f2faa9..bf9fdf0d611c 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -80,6 +80,7 @@ touchscreen@38 {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 6f27d794d270..f053a70cb254 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -70,6 +70,7 @@ &m4_rproc {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &rcc {
@@ -90,3 +91,21 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&scmi {
+	bootph-some-ram;
+};
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 49dd555cc228..ef71ebd65518 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -145,6 +145,31 @@ channel@6 {
 	};
 };
 
+
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -170,6 +195,54 @@ &dts {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &hash1 {
 	status = "okay";
 };
@@ -181,7 +254,9 @@ &i2c4 {
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	clock-frequency = <400000>;
+	bootph-all;
 	status = "okay";
+
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -192,6 +267,7 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
 		status = "okay";
 
 		regulators {
@@ -327,12 +403,20 @@ watchdog {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -348,9 +432,26 @@ &m4_rproc {
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
 };
 
 &rng1 {
@@ -378,9 +479,30 @@ &sdmmc1 {
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
@@ -394,9 +516,27 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
 	mmc-ddr-3_3v;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &timers6 {
 	status = "okay";
 	/* spare dmas for other usage */
@@ -412,11 +552,22 @@ &uart4 {
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	vbus-supply = <&vbus_otg>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index 6ae391bffee5..17295d67ab85 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -75,6 +75,7 @@ &m4_rproc {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &rcc {
@@ -95,3 +96,7 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&scmi {
+	bootph-some-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 0e65a1862eb5..c4be802ef1e7 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -283,6 +283,7 @@ &i2c5 {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -314,6 +315,7 @@ &qspi_bk2_sleep_pins_a
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -323,6 +325,7 @@ flash0: flash@0 {
 		spi-max-frequency = <108000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-pre-ram;
 	};
 
 	flash1: flash@1 {
@@ -335,6 +338,41 @@ flash1: flash@1 {
 	};
 };
 
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts
index eada9cf257be..9f513045c559 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts
@@ -158,6 +158,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_c>;
 	pinctrl-1 = <&ltdc_sleep_pins_c>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi b/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
index cf7485251490..1c5517f57ecd 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
@@ -75,11 +75,84 @@ led-blue {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	bootph-all;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
@@ -91,6 +164,7 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
@@ -218,12 +292,20 @@ watchdog {
 	};
 };
 
+&i2c2_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -237,6 +319,26 @@ &m4_rproc {
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
+&pwr_regulators {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rng1 {
 	status = "okay";
 };
@@ -258,6 +360,23 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
 	mmc-ddr-3_3v;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_d {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/st/stm32mp157c-odyssey.dts
index a8b3f7a54703..92bc25b3f563 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-odyssey.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-odyssey.dts
@@ -75,14 +75,35 @@ &sdmmc1 {
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
index 36e6055b5665..b404ea3752d9 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
@@ -131,6 +131,7 @@ i2s2_endpoint: endpoint {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
index 89de85a2eff3..5d29c2154b46 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
@@ -87,6 +87,7 @@ &mdma1 {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &pwr_regulators {
@@ -114,6 +115,10 @@ &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
 
+&scmi {
+	bootph-some-ram;
+};
+
 &scmi_reguls {
 	scmi_vddcore: regulator@3 {
 		reg = <VOLTD_SCMI_STPMIC1_BUCK1>;
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
index 8fa61e54d026..4d857b3575fd 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
@@ -97,6 +97,7 @@ stpmic@33 {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
index 0075d9391181..d8eb10339679 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
@@ -122,6 +122,7 @@ &i2c5 {	/* Header X21 */
 	pinctrl-0 = <&i2c5_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	bootph-some-ram;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
@@ -149,7 +150,6 @@ sgtl5000_rx_endpoint: endpoint@1 {
 				remote-endpoint = <&sai2b_endpoint>;
 			};
 		};
-
 	};
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 4cc633683c6b..04e91d02cc28 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -103,6 +103,10 @@ channel@1 {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -121,6 +125,26 @@ dac2: dac@2 {
 	};
 };
 
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &dts {
 	status = "okay";
 };
@@ -190,6 +214,7 @@ &gpioa {
 			  "", "", "DHCOM-K", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpiob {
@@ -197,6 +222,7 @@ &gpiob {
 			  "", "", "", "",
 			  "DHCOM-Q", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpioc {
@@ -204,6 +230,7 @@ &gpioc {
 			  "", "", "DHCOM-E", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpiod {
@@ -211,6 +238,7 @@ &gpiod {
 			  "", "", "DHCOM-B", "",
 			  "", "", "", "DHCOM-F",
 			  "DHCOM-D", "", "", "";
+	bootph-all;
 };
 
 &gpioe {
@@ -218,6 +246,7 @@ &gpioe {
 			  "", "", "DHCOM-P", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpiof {
@@ -225,6 +254,7 @@ &gpiof {
 			  "", "", "", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpiog {
@@ -232,6 +262,7 @@ &gpiog {
 			  "", "", "", "",
 			  "DHCOM-L", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpioh {
@@ -239,6 +270,7 @@ &gpioh {
 			  "", "", "", "DHCOM-N",
 			  "DHCOM-J", "DHCOM-W", "DHCOM-V", "DHCOM-U",
 			  "DHCOM-T", "", "DHCOM-S", "";
+	bootph-all;
 };
 
 &gpioi {
@@ -246,6 +278,20 @@ &gpioi {
 			  "DHCOM-R", "DHCOM-M", "", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
 };
 
 &i2c4 {
@@ -253,6 +299,8 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	bootph-all;
+	bootph-pre-ram;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
@@ -269,6 +317,8 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
+		bootph-pre-ram;
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
@@ -279,6 +329,7 @@ regulators {
 			ldo6-supply = <&v3v3>;
 			pwr_sw1-supply = <&bst_out>;
 			pwr_sw2-supply = <&bst_out>;
+			bootph-pre-ram;
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
@@ -409,12 +460,20 @@ eeprom@50 {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -428,9 +487,22 @@ &m4_rproc {
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
+	bootph-all;
 };
 
 &qspi {
@@ -444,6 +516,7 @@ &qspi_bk1_sleep_pins_a
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -453,6 +526,28 @@ flash0: flash@0 {
 		spi-max-frequency = <108000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-pre-ram;
+	};
+};
+
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
 	};
 };
 
@@ -469,6 +564,15 @@ &rcc {
 	assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
 	assigned-clock-parents = <&rcc PLL4_P>;
 	assigned-clock-rates = <50000000>, <100000000>;
+	bootph-all;
+};
+
+&reg11 {
+	bootph-pre-ram;
+};
+
+&reg18 {
+	bootph-pre-ram;
 };
 
 &rng1 {
@@ -495,6 +599,7 @@ &sdmmc1 {
 	st,ckin-gpios = <&gpioe 4 0>;
 	bus-width = <4>;
 	vmmc-supply = <&vdd_sd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -504,11 +609,24 @@ &sdmmc1_b4_pins_a {
 	 * - optional on SoMs with SD voltage translator
 	 * - mandatory on SoMs without SD voltage translator
 	 */
+	bootph-pre-ram;
 	pins1 {
 		bias-pull-up;
+		bootph-pre-ram;
 	};
 	pins2 {
 		bias-pull-up;
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
 	};
 };
 
@@ -525,9 +643,27 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&v3v3>;
 	mmc-ddr-3_3v;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;
@@ -545,7 +681,46 @@ &sdmmc3 {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
+&usb33 {
+	bootph-pre-ram;
+};
+
+&usbotg_hs_pins_a {
+	bootph-pre-ram;
+};
+
+&usbotg_hs {
+	bootph-pre-ram;
+};
+
+&usbphyc {
+	bootph-pre-ram;
+};
+
+&usbphyc_port0 {
+	bootph-pre-ram;
+};
+
+&usbphyc_port1 {
+	bootph-pre-ram;
+};
+
+&vdd_usb {
+	bootph-pre-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
index 85d93ddfa12a..c8e2c0a4ec4c 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
@@ -349,6 +349,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_d>;
 	pinctrl-1 = <&ltdc_sleep_pins_d>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -396,9 +397,30 @@ &sdmmc1 {
 	bus-width = <4>;
 	vmmc-supply = <&vdd_sd>;
 	vqmmc-supply = <&sd_switch>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_b {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
@@ -412,9 +434,27 @@ &sdmmc2 {
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd_io>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_c {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_b>;
@@ -449,11 +489,22 @@ &uart4 {
 	label = "LS-UART1";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_b>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart7 {
 	/* On Low speed expansion header */
 	label = "LS-UART0";
@@ -506,3 +557,7 @@ &usbphyc_port0 {
 &usbphyc_port1 {
 	phy-supply = <&vdd_usb>;
 };
+
+&vdd_io {
+	bootph-pre-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
index bc4ddcbdd5cf..9c6a04b4c2e3 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
@@ -231,9 +231,30 @@ &sdmmc1 {	/* MicroSD */
 	bus-width = <4>;
 	vmmc-supply = <&vdd>;
 	vqmmc-supply = <&vdd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_b {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {	/* eMMC */
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
@@ -246,9 +267,27 @@ &sdmmc2 {	/* eMMC */
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_c {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {	/* SDIO Wi-Fi */
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;
@@ -276,11 +315,22 @@ &uart4 {
 	label = "UART0";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_d>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_d {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart5 {	/* X11 UART */
 	label = "X11-UART5";
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
index 89881a26c614..3d469e29d41a 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
@@ -63,6 +63,30 @@ retram: retram@38000000 {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -71,11 +95,61 @@ &dts {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	bootph-all;
+	bootph-pre-ram;
 	status = "okay";
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -86,6 +160,8 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
+		bootph-pre-ram;
 		status = "okay";
 
 		regulators {
@@ -98,6 +174,7 @@ regulators {
 			ldo6-supply = <&v3v3>;
 			pwr_sw1-supply = <&bst_out>;
 			pwr_sw2-supply = <&bst_out>;
+			bootph-pre-ram;
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
@@ -215,12 +292,20 @@ watchdog {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -234,9 +319,23 @@ &m4_rproc {
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
+	bootph-all;
+	bootph-pre-ram;
 };
 
 &qspi {
@@ -250,6 +349,7 @@ &qspi_bk1_sleep_pins_a
 	reg = <0x58003000 0x1000>, <0x70000000 0x200000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -262,6 +362,35 @@ flash0: flash@0 {
 	};
 };
 
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&reg11 {
+	bootph-pre-ram;
+};
+
+&reg18 {
+	bootph-pre-ram;
+};
+
 &rng1 {
 	status = "okay";
 };
@@ -269,3 +398,31 @@ &rng1 {
 &rtc {
 	status = "okay";
 };
+
+&usb33 {
+	bootph-pre-ram;
+};
+
+&usbotg_hs_pins_a {
+	bootph-pre-ram;
+};
+
+&usbotg_hs {
+	bootph-pre-ram;
+};
+
+&usbphyc {
+	bootph-pre-ram;
+};
+
+&usbphyc_port0 {
+	bootph-pre-ram;
+};
+
+&usbphyc_port1 {
+	bootph-pre-ram;
+};
+
+&vdd_usb {
+	bootph-pre-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi
index 6e79c4b6fe32..3b5debd0ffc9 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi
@@ -131,9 +131,30 @@ &sdmmc1 {
 	bus-width = <4>;
 	vmmc-supply = <&vdd_sd>;
 	vqmmc-supply = <&sd_switch>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_b {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
@@ -147,17 +168,46 @@ &sdmmc2 {
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&v3v3>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_c {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_b>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart7 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart7_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 599ea07bdb19..4b190d1e5a78 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -144,6 +144,10 @@ channel@19 {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
 &cec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cec_pins_b>;
@@ -151,6 +155,26 @@ &cec {
 	status = "okay";
 };
 
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -199,6 +223,54 @@ &dts {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
@@ -304,6 +376,7 @@ &i2c4 {
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	clock-frequency = <400000>;
+	bootph-all;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
@@ -339,6 +412,7 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
 		status = "okay";
 
 		regulators {
@@ -477,6 +551,13 @@ watchdog {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &i2c5 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c5_pins_a>;
@@ -513,6 +594,7 @@ &ipcc {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -520,6 +602,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -541,9 +624,26 @@ &m4_rproc {
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
 };
 
 &rng1 {
@@ -608,9 +708,20 @@ &sdmmc1 {
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;
@@ -731,11 +842,22 @@ &uart4 {
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart7 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart7_pins_c>;

-- 
2.43.0


