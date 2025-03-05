Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DA9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5J8KWPZaiUOD85j35BaOyQLzrFgb+PdKrfMI5Jwu7g=; b=G3w8TcgbUfi2hQIDNGBaBcPk6E
	ftBK8LynnlFe9KlevokkUszM4J1Rjadj6NjGp5s2bAb/AVzu9T+q30fd9cSnGs/2Fl971kkZ1sHz/
	pSqp2hW83NI+9WC652WIdp6LICYF0787ftFi81F/ky4kXa4IfLcAGCfj/2BXpsTRlUJJEwK3Fy8FZ
	P/cRsLWlcV19jTh+PSYK8v+M5zklUkZtWsTJGRQgd9AR3pWXmJNYzWnaxLNP1fLG+BfaZcHEUNXSi
	tPRD58zHF6fz4AtS440ZVjt4wKuPJapKXgPkg6pqvnMzgTcE2RIiNpG4CAsB5oV5//9eU5j+oHO32
	Jt6S1y9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkZM-00000007Qra-2wnC;
	Wed, 05 Mar 2025 08:57:36 +0000
Received: from mail-vi1eur05on20711.outbound.protection.outlook.com ([2a01:111:f403:2613::711] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkXk-00000007QVI-3rsh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSYyzCf4yfXuOmJumF8XdGYB0bU4G1TU4TRBDbINRJNcTI0iXRxYKkIIoTFVo89S/ONkZXCZ5M+B+Ls4ND+pBZGCt8kW/CbMJHD2YbX0b/lL5z+RyEAKlGbpsDz0rvR8aMpUSYpU3v+wyJMRX1eGuUkVz+rq3NY3W9zKB6YcmxOAfLhbOJiD1FC2A0JyWhzavRlwnbFgFLAKRHswbHPcaOQaQssal2HMPP0QH/7SEX+nAleKfebo5CADrGaRYxngS6YQSmdBcJfaf0EqC8dHE9TIkGVRDW5c22qS5adD0YEi6+S6oTKbgQQOeJWnlDyHdDR70aYWRK+cl6QJpF3Z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5J8KWPZaiUOD85j35BaOyQLzrFgb+PdKrfMI5Jwu7g=;
 b=mbB3jBdlvzAQps676+1GeW5+S1tNtCHPJDpcNPqoQ5jJYpUKwV/s/ptlL/P6tj3/bVMg7glZGz9mYFmOcJhh5mwamyu682DRdR1sQ/u3QuQOl4Gi6MyYc1FPfNqv40jQq9wIh1z1WWpfPJKCYcMNnSu2Q8YBiNDSB8ng6BB2TLRaF9Cn9Twl1/3TrOJ7IVWeigmw6u5oAAt2oht4x5su864O8MD+MtRv6bJY2qqFaI29Z4PfpYHQRcyvNJ/aCEKMR7yUc24HEYmlzc6sccxEj1kgEL6EInYKNKDdvUgbsNoJNyqWQ0FMEjdb2gUEK++y3ZXHm8/Tvwmdfy7jTZWNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5J8KWPZaiUOD85j35BaOyQLzrFgb+PdKrfMI5Jwu7g=;
 b=Xj+5ncyoQo9qcTnE8Q1CrWhpbR2JYn1Txj5Zv41EESmOVeiyIMSVooWr08ZMmKs1rAqGzCrsNyNERgODqif9FmB/KF0e2EaIyTDuiC1tceeRqnlNk3r4Q6UtRt2D6BodxsWEN3iv7Xxp6u8/26Kx+k/k/qh6wfizJnEPBqQP3gDIh6tWEA979EOZJV2r8Z6JgdtLrXv9Nm4Vhmtx24JrAgQWfDfP8fwvOJhA27WFbvjMXA2dn1lgIzEjjCmX91QjcEz78gwecVvs7Qw/k2sl1atoQtH/hpb8AT2oyptU8WvwhILml79NgvpXYqGv3Lq2e2L8mPj6nnF2/XvuuhuAVQ==
Received: from DB8PR06CA0051.eurprd06.prod.outlook.com (2603:10a6:10:120::25)
 by PAXP195MB1133.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 08:55:48 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::42) by DB8PR06CA0051.outlook.office365.com
 (2603:10a6:10:120::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.18 via Frontend Transport; Wed,
 5 Mar 2025 08:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 08:55:48 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 5 Mar
 2025 09:55:45 +0100
Received: from phytec.de (172.25.0.51) by Florix.phytec.de (172.25.0.13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 5 Mar
 2025 09:55:45 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v2 5/5] arm64: dts: ti: k3-am62a-phycore-som: Reorder properties per DTS coding style
Date: Wed, 5 Mar 2025 09:55:37 +0100
Message-ID: <20250305085537.3976579-5-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305085537.3976579-1-w.egorov@phytec.de>
References: <20250305085537.3976579-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|PAXP195MB1133:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c912de-b777-4bbb-c324-08dd5bc3863e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Ym3ve4DQ0159KzwRMys+SECbqcskC++X6DDQ2yojpW29rnn/E2y9MrBdi6w?=
 =?us-ascii?Q?VQd7DWdECTI23zDGjo8DbJAhQWtte12crKGiLJbE1xhAaPhkMUvxbj+yfSYr?=
 =?us-ascii?Q?zH4QEMv+6KeLXJvot0YMSW0B36vJWiu9xIuqtS6veQzJOAXYhoEtVXzTHJpB?=
 =?us-ascii?Q?Fv/M+uORdLclfxsXFlMRPwgrShPfakoeRDsTQbj8pbXoycqwlEgVdfkcEmnl?=
 =?us-ascii?Q?P2CbO0/fygEMxitDRk6SK9V654V/a7sJl2HPE3U3BOrpeeiJKUxntZBr+HDn?=
 =?us-ascii?Q?08TG4tqjXftfnAK1SMwKOzuCVGzioka2hbe2V5vNmT0IYexn9IssZ68ipAGR?=
 =?us-ascii?Q?GdqJk0/iEkkKPLEIvcNUO7C/eWddhfzehNUQCT2QItPN4jcPhSuNyiy4uRtn?=
 =?us-ascii?Q?znyQxQW7SqVKV2l8Gm2UHU7Qs8352R0uK68EDoChrVEpgDFFI0i9qQSKc/ly?=
 =?us-ascii?Q?ODvVkFy6X0Q8kvlS8I8YqosxgvSCMzYoDTR5mpoL4XeByBMAXuIRF840lnBI?=
 =?us-ascii?Q?CPVR4xWy5iIBpVomwcECxR+LtH7AnNGrKKl7tFY5jGVKCxcROtSq77fszF0B?=
 =?us-ascii?Q?U9rp0Q02eHznjMH48UK4OzR+l7JJu/zwpw9dPYTgWqpLh0PI5wq7wXRbgcdT?=
 =?us-ascii?Q?4vkEXYeQA4CEjHWT2tsK8FhkxIJ/dAezD4KPHd/ZBTg3wMs92eq/da7oeAme?=
 =?us-ascii?Q?Igjr5AKQyCyy2vhWFJJAKdwl/7QSdO0fKD/FR3tcLnqHfjAj+8jjKKAywQJy?=
 =?us-ascii?Q?2ACpndpaSuluHL9dY1EmnR/yR8DrNCAmQIEh2d7qsRQogZcgfU3xnHCU5VXX?=
 =?us-ascii?Q?pIIo2biMIcDmm53hvyx0rUqPQGETunvQOtpM4C9WlKQ0kQUtx2U55Bf3y0k3?=
 =?us-ascii?Q?8nSMgL6qoTpf7fFM7vQkYhBW7hQWjI5BA9zO3UHxNBYgaPW9Ck25vaOFkO27?=
 =?us-ascii?Q?B/PKKzr3hlwf8xWr/5yDIts4vOaFsxIGx18wJvtEcY7fF/hwZJpG+wgy6KUw?=
 =?us-ascii?Q?FMYpj2BJaDQ6pgcCSU/JagjmmgeLL65PH1AON5zUsgkPVV1zI9YYCxgxAr0l?=
 =?us-ascii?Q?joUNowmT3lOoLZmEynYu9/aD5KJljm9q9AvBWZn23ast8sDaT/VxBHywslUb?=
 =?us-ascii?Q?3C4VG+UKUIdKeo/CbRBZUh6QYQSkoSMoC7LOiywGdgx2KpSJI9snXF3NBJu/?=
 =?us-ascii?Q?4fZqISkJYp8C49UxQ0g6Z/g1NYUz91pyYQg5QQ8LywtYwpfTQ0/7ONJcHyjY?=
 =?us-ascii?Q?VAmunYiD9t8MijssyUpqMmGRMWho9rPfBKGb73agmOrNZOhH1tcWjOZ4ewxj?=
 =?us-ascii?Q?bh3s+hT//wVaxyHfKAUY3Oq5UcWP18nrpXL3s1uFIClEyjAYYc0z/D8H1hXh?=
 =?us-ascii?Q?56nC2KlkQjhHbJwkIelHD/21kfiKmoYu+uMMbZZZ3Gr/IWi18MQssV6QHEfX?=
 =?us-ascii?Q?DbWJynmRJ2y/TK8iXy5Rc2yzbi23uUSsRHNPhdKaW/GC9Q8AF2L2SYYgQMpp?=
 =?us-ascii?Q?72rWAF6jzWqc8VA=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 08:55:48.4863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c912de-b777-4bbb-c324-08dd5bc3863e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_005557_035660_893B7CB2 
X-CRM114-Status: UNSURE (   8.96  )
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

Reorder properties to comply with the DeviceTree coding style guidelines:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
v2: No changes
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 7920559e84a3..147d56b87984 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -171,7 +171,6 @@ AM62AX_IOPAD(0x1f4, PIN_INPUT, 0) /* (D16) EXTINTn */
 };
 
 &cpsw3g {
-	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>;
 	status = "okay";
@@ -225,8 +224,8 @@ pmic@30 {
 		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-controller;
 		#interrupt-cells = <1>;
-		ti,power-button;
 		system-power-controller;
+		ti,power-button;
 
 		regulators {
 			vdd_3v3: buck1 {
-- 
2.34.1


