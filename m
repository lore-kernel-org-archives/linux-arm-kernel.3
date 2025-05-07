Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9C5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fbmOctjloRnlRDmMRz/OmlYG8Y+qRDh6ehoe0ASkX4=; b=a5i8PWJ2nD3o1Ghh96twzxx3Cv
	UQ0vAQuboGTlUnqBhJJW15bjrsAibSmPfEieSibbL1OTtg/p1YZoJXyoNAs2skjpJTib2KA23hzVu
	e8+Pkxvel3uJQPvBNprMqkAv1o5PAF2dMy1GJnHgalGICej6Zcp+WZRVaxSG2mWdis0jecXeYfPQo
	+yUx1YIHfSzgxzRegZXQkwLV9xkcIGE5gu/CGXc/9zBMzaTfPQ1EdInCtszsybn9TrPqVFs/iLBpe
	w8EYnzWPgM0eWeLqgZUbHVlcLdZar0OFiDMne7/24i/0RZVmWsrAGM90Gbj8QTja0mYxyDhkj34SA
	LinL5vYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCX3v-0000000EEaF-2jSc;
	Wed, 07 May 2025 05:11:19 +0000
Received: from mail-db5eur02on20711.outbound.protection.outlook.com ([2a01:111:f403:2608::711] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCX1x-0000000EEA3-2dqS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rzp9D189P5UakGQJilJUiJUM8Wxks47YaASR2DPncVFhhPclo37vPIaUQ670ouDfalcjghfpMSIMVabfTOgzcF7dBn3d9MvxsMuj11d0UAse9VHjUNmKLDLTy/y02UQWEroFpQlqYYNdWvZgsQvamBi0aveNMKPhmnSy2JavyZ4EkOuP26x98dLXcu9gl+tfV7ZZLb6CHLam/q0tQiigOBr9WKV0Vp5kXuf3B8Eit6bbagb4aL2umnRgNSaGX9H/LY77Mp+c6k1YnjOzejZdQhWa5rGKsEusZdMDtFJYDz+2tMxE3kGyfK8WlZwjYPukk3P8cmBT/GAtWr3SErWggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fbmOctjloRnlRDmMRz/OmlYG8Y+qRDh6ehoe0ASkX4=;
 b=Ygq5BZuAiYVbgT9SP6x1HlvBxi4Hknm9brG3HG1c/oz2mmB1/2B/gjt9kZCqTxxm1vy4izm5fJnE3A88OEZwxmGPhbpEniXdx/LlRVEtDF8wtctxJU3LTvH1JMifzn8BUIaYwro9M8l70cC1zxmpcJzFNSY/QMR92cVrYpE1Tv6gqn7zdCvO6AxzaSzR955lhOhth4AWHVuNAK4SFysLoJeoPCxyWseajV3e403g9qvPhQ1dNH0LVQjj206YaJdsYo9kf4wIx/2FHonrx1JguGtX2SBs1Gp3u862AAv8nDaFCAGsRdXHOL8p8S6CfIyOKVYNrJc7cjRi6/5/XhmEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fbmOctjloRnlRDmMRz/OmlYG8Y+qRDh6ehoe0ASkX4=;
 b=cL8CONTeyL5hVZ29C5QWfQaHXIr8eb9ncUSCWNdoRtBpMP6VGGYnZ1vz7y3t5U1Vtyf7vShKiYiGcBoOrkLNfs3BLiz260pbDrs4UR63wnbHTa9N5vrbyupJXrn4i9wDtGI6IcBUd/8iTlgSq+m+6gl0nm3J4J0oshLe17y8Y0EfJKq9i+FDhr62LP6bY+NHgPoI79jdfC9AqX6db+K6vguATeNqsEPOHFITFIoIZlStYRrRb6W4hnIbljsxSQeqyBQ9vsK/gu9YP5Y/C6U+bAZjhPO8x8oye/0wb3T0TDqzFQ5bbv5cRVRwwKbr+BUGuZNWZHA8FkJ2sgPn3BxDPw==
Received: from DU7PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::26) by DU0P195MB1499.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:34b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 7 May
 2025 05:09:11 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::5b) by DU7PR01CA0024.outlook.office365.com
 (2603:10a6:10:50f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 05:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 05:09:11 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:09 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:06 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <robertcnelson@gmail.com>,
	<francesco.dolcini@toradex.com>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62a-thermal: Add Files for each Temp. Grade
Date: Tue, 6 May 2025 22:08:46 -0700
Message-ID: <20250507050847.912756-3-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507050847.912756-1-d.schultz@phytec.de>
References: <20250507050847.912756-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|DU0P195MB1499:EE_
X-MS-Office365-Filtering-Correlation-Id: 51399100-78fb-459d-3fc8-08dd8d254dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEhnL0VrRy9wcFNiUTMyMkYvTHRJRzJrVDVvZ1lKbjU1R3dhVjQxOW1vYlFh?=
 =?utf-8?B?WFI4NEtuTWdmbTBTWTVJU3ZvNlZNZjlrc2NLZjJVa1Y1MGlxY1BvRzVZUDJz?=
 =?utf-8?B?aXY5cTZCc0diK2k3aUFieHI2RUlyS3RHdS9WS2VsRlozb1RoT3I2TUlXRzlN?=
 =?utf-8?B?T29Jc1BpelBnSzhYZUxvN0JERmNHTjFMSC91bHI2a3ZhZTZIM0xMT3BXWXdE?=
 =?utf-8?B?RWlyYWwrU0VSL1ZleHFJQ0F1ZlA2c29STlRhZU5Xa29VakV6aVdaUVJQK3Q4?=
 =?utf-8?B?OXBwcVR0bk1mQUFrMWNVTEd3MWI4YmxCUTd3REVZdVhqd1dkVlRab1pBQWtP?=
 =?utf-8?B?UnBTV2Z4RFNxb3VwTUZpMm5lWk5EdmhMM21lc2RBcDRlRXVySGNjMnArQnBB?=
 =?utf-8?B?RThLbElNMlF6ZEZIdnJJbmZSUjhreDhpVlJaY3Z2Q2NyanpDY2FEVjdaV0tu?=
 =?utf-8?B?YlJWSG5ocS9VY3lOSDM5bkU3OVgvRGcxaDREa1N4UjdmQkNKVElBOFlCa3Av?=
 =?utf-8?B?TTdLUGJaU29zei8vMU9XSHlNV2tFcU9TbFpCWVZPVDZkNUczVTBodElGZEhO?=
 =?utf-8?B?TllEelNLM205YkhkR0Q2VUdFTnJBbm55aUdmUGVtaDhURnRHb2tEZDBTdHgv?=
 =?utf-8?B?cXNKRWJpUE1BcUFHVE8yYzFuaDliaWhiVk9CWUJ6QXlCMzdHbXJQUUY0Y05t?=
 =?utf-8?B?ZHo0VzlybVhBYVNJQy8xQ1Q2MytLWm9hajlENGZ6NDZmMlRTV2ZEbW1odWhN?=
 =?utf-8?B?dU5zeHlMMVZnald3Ykh4T0JHWlZ2QjVsWlVxQk1FWDA4TFpTMGc0dy8yS2RR?=
 =?utf-8?B?Z3JhZnFBenkvVEk5RE1sYzdkei83RFZHaXk1TktJalBISXNpSVhxOVVqTmNz?=
 =?utf-8?B?QS8yYlBQU2tDY0MrZTNZVWIyWFFqOFZVb2RzUlRHQkkrM3RWZGE4bjVPaDVy?=
 =?utf-8?B?eEVUbUZKS2ttZ2ZRL0xvMmp0YWlwWWlpSmp5RXBxczAxaE1MZUpDdXBnSmhN?=
 =?utf-8?B?WGpxelZjZ2NBWlNMb01LNER5S0FNYjVqRE4rRk5SMWZiZXRyMGc3Y1d1Q0gx?=
 =?utf-8?B?NEdUMzVpRTJrb3hyaW9LbjUrTDFTc1lmcjFtbGpqVVRySk5ONW9UUWpsbnZm?=
 =?utf-8?B?STVabHp5U2xZblQrVFBUNE8rSCtad1BvMENRVEpFSktrQ0RMbEpDUTJqdTBR?=
 =?utf-8?B?d3hRMHZ5dUppdzFiL0lPbXdheHNMczN0b2lvU2JOVWYrY2lDaWZZaGlsNnB1?=
 =?utf-8?B?cU8xa1dvbWwyd01FUU55TVpYUnpNSE9ob3dZaGNlUjYwZkNTR1ZKWWp1Q1VD?=
 =?utf-8?B?bk91NndaaGVZOEpUejhtRXNRSDRQZzVFUEs0QkRHelpnSjdLZnFkOVNUZ0pD?=
 =?utf-8?B?QzJVY3FOZE83ZkxjbGRFZ2QxUkx6T0NuVWVabzFBZ3F3TWpWcFZyR0gzUXph?=
 =?utf-8?B?L0dNWEg2NDN3OTNhRDZFY3poTTN3a1FHMXFqTU5sRzlqNXBoN0cwNjZhOE1I?=
 =?utf-8?B?TWNIZ0plRGk0cnYvRFBqZVhteDZBZm5GR2FSZFpOSGptTnZWaUFYNUV1cnY1?=
 =?utf-8?B?NFdlMmtyeG1oRmN4TzhQZGdWZGtVem1XSE12anBQSFRYU2t0RGdrRFJTUS9H?=
 =?utf-8?B?VUc4cEJnQXlqUFhabWZ3R3VjOVlSWGtueE94UG92R3FkOVNPYjEyZGhsdGZ4?=
 =?utf-8?B?cjd0NFljTjJFYUIxeUdZRVBJZ2d2Skk4UVhoNHFzbDE2eVRvWkozOGpkajA4?=
 =?utf-8?B?cUVMc3RXQmNDV2tYWk5najZtZHRNVitHL0J0ZjVPMm5rbjdrQS8yWW41OS82?=
 =?utf-8?B?VTI0VXN6ZzNSaFk5WTJleFdkSTI0b2hhdHM4aHpRMTRUeG90a0pMWnBMZ3F1?=
 =?utf-8?B?aFRYQ2xOeThvaTRNdFR0bFVBQzY1dW4vWEM0OEFXNXN1SDVvNHlGQXhEZ21m?=
 =?utf-8?B?ckVMd1FRVEh6MWZuQWxwNkk1YmJxUC8xMkFYY3ExdDdjWVY2T2NFbitWcHhZ?=
 =?utf-8?B?TlJPbU1YWEk1dXA2QnJJdEJXM1Z5b2k2YlNqWlZGcDc3M0lsNys3SU9aQ243?=
 =?utf-8?B?dGkxOGZoREJpVy9zNVZOWHRjc3dzUEkyanlNZz09?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:09:11.5221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51399100-78fb-459d-3fc8-08dd8d254dda
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_220917_670576_71968D45 
X-CRM114-Status: GOOD (  13.25  )
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

The AM62Ax SoC supports two temperature ranges:
* A: -40 to 105C - Extended Industrial
* I: -40 to 125C - Automotive

Add device tree include files to adjust the alert and critical trip
points in k3-am62a-thermal based on the temperature grade.

Passive trip points are always set 10C below critical.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../dts/ti/k3-am62a-thermal-automotive.dtsi   | 28 +++++++++++++++++++
 .../dts/ti/k3-am62a-thermal-industrial.dtsi   | 28 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-thermal-automotive.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal-automotive.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal-automotive.dtsi
new file mode 100644
index 000000000000..4d6c649657ce
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal-automotive.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+&main0_alert {
+	temperature = <115000>;
+};
+
+&main0_crit {
+	temperature = <125000>;
+};
+
+&main1_alert {
+	temperature = <115000>;
+};
+
+&main1_crit {
+	temperature = <125000>;
+};
+
+&main2_alert {
+	temperature = <115000>;
+};
+
+&main2_crit {
+	temperature = <125000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi
new file mode 100644
index 000000000000..f6c69db8d62a
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+&main0_alert {
+	temperature = <95000>;
+};
+
+&main0_crit {
+	temperature = <105000>;
+};
+
+&main1_alert {
+	temperature = <95000>;
+};
+
+&main1_crit {
+	temperature = <105000>;
+};
+
+&main2_alert {
+	temperature = <95000>;
+};
+
+&main2_crit {
+	temperature = <105000>;
+};
-- 
2.25.1


