Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254FCEA4E27
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXXgPqKoUTHLaL9O7rOASzD4TDgFfQNB4LqgvRKw+u8=; b=HH5EElT343kmW6DYyhumwFVNVl
	QirQu3JC0hQAstBhDgWM1QCqRzcCbEJtsUjcuyNPQQA0UYiemztetzdEqiRE1YUc83IEXQDgsn08n
	yygj7LXYldC1Uvl5eiCCu7CMAqwiHZ64n438n9r30lb8o06ms+PWEaMO7e0tNbfeKxPsjSrW6+oR1
	a8GJm0J43wrqlzR4hgzrwFKG3jjo5yM8XA9YYnE0qX8DsdO1D1Ir8qXPJ1RNUYI4ct6BvucFgqqjb
	gkDVJeaa8c28gCXacG4IuQUhAwxt0glba3VDS9ShY0cj5ZKoSNSaz2BDXj1u448MkB7adJs1QtSvt
	CPmZguWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGR-0000000GggG-2yJ3;
	Wed, 04 Mar 2026 08:07:27 +0000
Received: from mail-northeuropeazon11011070.outbound.protection.outlook.com ([52.101.65.70] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGQ-0000000GgfH-0Ihr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:07:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLDyehJa8HgXThlgc8q+Wi0+b1spu1P9Ad/RsZ45h37dXR4D1oAYK2antKp1HzqLnwEOpNAPErR2xicyei8VHeylGHkllJQ+S1sNZfPbGeLlJMmFeO2t43fNUwHcm9FNH5xP83sv2GxRBYgVppE7NI1OHFT9y75rrg79eYWB7WVbmQ6bFn1Wc+RbOidqnzXgHvTlhF0kZj0dBQiOjf1Wwfa9pYPgwlK/rtMIWSnhE4uBFdlhpZOFoLy+ADEtxyvqfmZH1l6bBlp1baAE8cpB1NrJ8VqlrjKL2eKDsDIFJwXPWMw4jjBSNfepfBQFwu+cyUFjfl6fhFPB/gxDVvhetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXXgPqKoUTHLaL9O7rOASzD4TDgFfQNB4LqgvRKw+u8=;
 b=S74MO1CbAuD9qEtW0Dn6ak0wVOsW/yl9Gaq8lCpivJrzdswYdkSctDM/dhgjQSEI/F5YTkD87FRpdgyqkRsdU6b/Q07d+66oe+uq10mtAQXZWzKLgpH+fCJGrtPY49IAoyZ1AqF3wYXK1QWdSEeWmDkZN5s9UsVo5++bLPzslkypTBTFuK+7mRQ5rDDIZCLaAN32eaGIATbd+sgXwko+1G7ZUYP8nF3kYdxi4ilNgytWQ88oIdnY4rMru8NdElGFAAp0pOSQXpLI9KKuSfbbArTdA7v5BU/vqtfUDD9VcVMMRtrB6j1wvFOwWrmhjOKrMT712/5ZY4NFk8hXS3xmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXXgPqKoUTHLaL9O7rOASzD4TDgFfQNB4LqgvRKw+u8=;
 b=NmhjB3G1J1VHMVoey8L1dQiylGNNdt9L3PaaeDUZonDDjJsxZw8F48eqHjvggP33hSyOyk4JuTcGev4yCqUGUemUjhnlMfGFr9o/09WNYOQf3odHrYmaQwW2yjyIoMyqLSoxLU5nzac78FdD4nW2Ew+bkuv9GZhvYll0Ec2W72pID+28vFsXPKt3cfh+8Wrup2X33o61ywviNVuCIVGpjupj1NGr24k9p1QoVrPK+FLafsu+6NEzjXWyDlGUmD2mR42QcPM8WoE1ucEXsnP75Qu3ieKfFyeI/Ek6yTO3wrxSUbM4iXAW7wOQtQmOwfLCKA+EggBNiJhg2D9p5TwY9w==
Received: from DU2PR04CA0261.eurprd04.prod.outlook.com (2603:10a6:10:28e::26)
 by AMBPR10MB9882.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:762::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:07:19 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::3c) by DU2PR04CA0261.outlook.office365.com
 (2603:10a6:10:28e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 08:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Wed, 4 Mar 2026 08:07:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:09:29 +0100
Received: from localhost (10.252.5.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:07:18 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 4 Mar 2026 09:07:00 +0100
Subject: [PATCH 2/2] ARM: dts: stm32: fix misalignments in nodes of
 stm32mp131
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260304-mp1x_alignment_issues-v1-2-19a8013782a5@foss.st.com>
References: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
In-Reply-To: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.5.222]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|AMBPR10MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c31b7b9-5e03-48c7-4681-08de79c50ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: zbs22PtAn90i8fIBDFDMpYGHTW8FSoAs7+LoQI+6NodeGN3FbnYieomLzNa3hkIp6rO7iUTc+2ZjALuEsITJtd+mINKzt0ZDpsl+RyFxIwcOntOajxw3xqxnCXoc1IbsKrwkdnQ/0ngujG5VqcmZtJ3MFcN8SxwNUSd5GEXUxLems2AzYQyE+WpLWfr/x9kTzCKkInTxx3ff+bAoOyqsX3v018suEgMzgtS8sNllqg4Vr3eJ59vMi1WycRMabsb0KUwmwxQtXaZfW4xKo9fV/f9BltVpjuRJ5X1a4/QcKIk/Ts5PWmi/zOtRotugJ2N0KomsBACdC9LHsIGtfcHLuSRM6UnDkNXZ8km6b86TqxSIuh2c8WwS4G5Ul4RLPvQnF6m0sSf7rtPtykQp+oDrJsU878faDJXDKNF7aX+T3yfDqiN1y0f++18LrEVZheBlzC7U456xJ+X3SJh4okf1bqdWCoz1JSDUn2gzCVeFQuZfstdru5Z/Jl/eMnO96/GNL+3OcTpynGjgNwyni1mRsg91DuaPIQZ14VdV0MYt3K3bx1KMllvqT0Qc1sTDXHit/HcUamC+x2TTrArMVpKFbNG5wAc475iLhpE3ORR78OG1YTzJRV9BfjzdMFzLaQSpERjFh095FMkaoIhEyK+9lfCphv3cw82NBoPX/nU1chqORJhpr1KY14lZB8snEWfyRIQiXIA1v/xBm4jwmTrh8IEN2lBBkW1vG8IKDzVNW3n0FyRRUM2vXxYrOUAuvcnV0LInyHrKUCs/JWRozv6KIQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w3lrigXLRjAEG1KSzHCW1qcuSWweWBI5tPL+2EyB+JO1dBqU01WyEMV6Po1weXHj9Wt66CPd+HOzGhxk1usz+Lgm92vqAGBSIxqx7FTfWi4j34ZFsEK2O+x7sszeTTLAxP7N6SVThzE35Fjf/abZ6/rrXv1Jn/wPhiv3ZpFfMNVAoGt47TtoKxIrB8OKPmmzwleWus7ybTACoQCJ/J7aVxI93wZumS6nuxrA3I06fj+IztsAOmsJoO6CzdqES5phy31zR9po9U14+GuOqHnnsuS4qBNBjnJb3kC1+a2Sdo+nhUyx3+smnS2knCZpPsMJSiaSMB90brxxWmu8pNUZCISSwoSM06Z4yxyuWLbt7yk5rH6bq0Gf3eOLLyUuUwgZ6QENjTIRmTybrcrVXlhW/RftNUXQEusPbwuNUaXAgxExm/2lxxVxnxSdaLpGBOzU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:07:19.3555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c31b7b9-5e03-48c7-4681-08de79c50ea9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000726_116136_049DA81C 
X-CRM114-Status: UNSURE (   9.80  )
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

Since the ETZPC system bus was introduced, misalignments have appeared
in some nodes moved under the etzpc parent node.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..93d52fbd0de2 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1129,7 +1129,7 @@ usart1: serial@4c000000 {
 				resets = <&rcc USART1_R>;
 				wakeup-source;
 				dmas = <&dmamux1 41 0x400 0x5>,
-				<&dmamux1 42 0x400 0x1>;
+				       <&dmamux1 42 0x400 0x1>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 16>;
 				status = "disabled";
@@ -1143,7 +1143,7 @@ usart2: serial@4c001000 {
 				resets = <&rcc USART2_R>;
 				wakeup-source;
 				dmas = <&dmamux1 43 0x400 0x5>,
-				<&dmamux1 44 0x400 0x1>;
+				       <&dmamux1 44 0x400 0x1>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 17>;
 				status = "disabled";
@@ -1155,7 +1155,7 @@ i2s4: audio-controller@4c002000 {
 				#sound-dai-cells = <0>;
 				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 83 0x400 0x01>,
-				<&dmamux1 84 0x400 0x01>;
+				       <&dmamux1 84 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 13>;
 				status = "disabled";
@@ -1348,9 +1348,9 @@ timers15: timer@4c00a000 {
 				clocks = <&rcc TIM15_K>;
 				clock-names = "int";
 				dmas = <&dmamux1 105 0x400 0x1>,
-				<&dmamux1 106 0x400 0x1>,
-				<&dmamux1 107 0x400 0x1>,
-				<&dmamux1 108 0x400 0x1>;
+				       <&dmamux1 106 0x400 0x1>,
+				       <&dmamux1 107 0x400 0x1>,
+				       <&dmamux1 108 0x400 0x1>;
 				dma-names = "ch1", "up", "trig", "com";
 				access-controllers = <&etzpc 26>;
 				status = "disabled";
@@ -1383,7 +1383,7 @@ timers16: timer@4c00b000 {
 				clocks = <&rcc TIM16_K>;
 				clock-names = "int";
 				dmas = <&dmamux1 109 0x400 0x1>,
-				<&dmamux1 110 0x400 0x1>;
+				       <&dmamux1 110 0x400 0x1>;
 				dma-names = "ch1", "up";
 				access-controllers = <&etzpc 27>;
 				status = "disabled";

-- 
2.43.0


