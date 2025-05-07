Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21707C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cyg4fSPJk3Pp4YvqpxqbAb9YBc55YCyV0kWxXjB3HUs=; b=CD0EXEIjR6FjuBrwsJ5ybHzi2v
	ZhPflIUsrsl48P45jlbcOCDBJ4DvV7wgneggORwQAAc3jd7cV5Cxud9kqaXtqZ/TTAhGnUrWyVKIz
	ZQPFsWWFx09Sp332kfqez9vLbGXVh9EuuyRzT6YMIRzCTgoaGGA5HgpsIj6XUV11/byETzmsPX6N+
	kliHP13cEUFFia0V8iKWlQJS5qJwbWphK9yDLskdAKDPoIB2iSg398QFt49JY7dqL3IeTXORibqKN
	TJxzcJy5rjjku/qRDCFGo8KIs98l04DaWIX4qyMOV0r9Y8R30rqJYnuRsnxDdNDwMwrLtnI21WBPY
	0iyJ67nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCX5r-0000000EEyZ-1hZO;
	Wed, 07 May 2025 05:13:19 +0000
Received: from mail-vi1eur05on20723.outbound.protection.outlook.com ([2a01:111:f403:2613::723] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCX1x-0000000EE9m-2WF0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1dPUyyll5r0BdfMquPyE2WnNjmheuMIAkDHyC6Ie0ovsehqZ/t57ffOhMy2K144wp8U1oQEinrmZx+F77iwQRcaz04ynk/AQSPrnx39j4DoYColpNhHpHamxTlN5djTyLaPbo5pUhrXIVlm/+Yze/YJBBg9kLzc+Ldsmh8dhOI5yh4HusomMDS9ZXUFX2cJnh9ndVN8Y+HiRD4udLWK/9e8zd3QS6Vc2Vk/Ct6WTHwmbr6ZJeDh+16CnuVLsK7emCi1QrStGqvrlGxS3XY6G2+3LQdSP5UYl5KUrKrZjiP30vmr8rkYrGUfpggCPNAGOSXh3zi8LDo6sLXH82UBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cyg4fSPJk3Pp4YvqpxqbAb9YBc55YCyV0kWxXjB3HUs=;
 b=LKaVi5+TXUWD5eEo/D8Gc9LBCpMixMTy588meBVf5c1+49aaD2naQJw8BHzLmNQ77SiDx4cW+E+TxOTdgjQAYc1YZbNo6vTDjwpL80XZyu1bJ9fDzAa9jdrGo2FkWVnbo94p748zhqDruO83w8k72bFKC0MeDglBSzcNOoP6ryA3GHVpW7d8lG7G9LBnt+jcmmb7j5DhfIV4ZkAiM6MR81B/5M09LJNBUWGiZQidT+ckzbCosBVk/VhLfa9xEyfj005Ao+DCGEmE1qSLBj8NoAryWcv6Vn9iEvIAKckExB3CtUoxVdkZ46IW+fWsvvnXT0cjYlwZ2AyzB0qjlO1LFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cyg4fSPJk3Pp4YvqpxqbAb9YBc55YCyV0kWxXjB3HUs=;
 b=SquRJtQKhSfemTPI0pD8wV58/Ehl1AMU/ndW6PE0cvm6htKPpA6uPWVFWTAJp/m5/Or+js59btGJsLmGIhEQmIYxqoGcb7aUjx4Oy+RrkcmqDMo/7FXK/LrVrki8MWO33kkl/iu5aC4a1ctwSVqJ+JeuYVZ5SiH+UvS8qM4FwedKoHrRCJfGI7ecfp3I/kZELEugyl4Uni8BkOZtH+RUD3jjwEK85nDNzIc4zxLxOuswLbXIkfag43QK8JIkN0a5HHx9WpCkyLijlHwe3GmDxXCKPX7IqRENw3CbHUDEP6X76C8DKICtYifxuQBiNkSD93nc/JSVa4TGHwRUrOUEnQ==
Received: from DB9PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:1db::18)
 by PR3P195MB0681.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 05:09:04 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::90) by DB9PR06CA0013.outlook.office365.com
 (2603:10a6:10:1db::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 05:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 05:09:04 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:03 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:00 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <robertcnelson@gmail.com>,
	<francesco.dolcini@toradex.com>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH 1/4] arm64: dts: ti: k3-am62-thermal: Add Files for each Temp. Grade
Date: Tue, 6 May 2025 22:08:44 -0700
Message-ID: <20250507050847.912756-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|PR3P195MB0681:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c834b7c-a335-4dbc-1a33-08dd8d254978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG5POFJLSkdpaENyd1JXZWJzNFVwS1FSYVNMTWhUUG15V3p0ZForMDJHQk9U?=
 =?utf-8?B?RGQzOFh0cWVLSCtCTm9QbTE5ZkxoUzFlSTcxdEJ1S3RQRmpNaWFTVm5OcG53?=
 =?utf-8?B?Y3J3dkUySFlZSjEyejEvQVUxR0NUUWR0TXRyb3lQaGd0V1dHVWxETmJ3RHl5?=
 =?utf-8?B?dmZNWUQweEQrTmNwOWR0MW9oV1BPN1V2WkNjckM1djNpVnJOaHdLakdjMW5V?=
 =?utf-8?B?QU5Nd1dzU0N0cFZaenVpVEFqTDZUYzB1Y1VoeTNXbHJpU1NSUU8zeGZzZnJi?=
 =?utf-8?B?VG8zc0pzd2pRdmUwSXJWOFZSNzU3OTk5ZDN1eU1meGl1cWZuL2NubVgwQXZE?=
 =?utf-8?B?Z24wU3Z4WFQwM3ZPN2N1MFZqdkxJRTNpRW1ua1JHZmtKZDc1dS95bUdSNDFO?=
 =?utf-8?B?TTRjK3dEeUN1U2ZnMHkwNU1GcGFRZFpnS0QrR3JUL1NUT1JVQWc1bFp3aXZS?=
 =?utf-8?B?Mmt4RUt3RTlEUmFROTc0cEE2SFlUb1ZKVHVWNkxJeUhmckl6elRsdGtUQ0FX?=
 =?utf-8?B?b3QrUGR0ZjcxSFI2SEtLRVJwV2JaM3ZVUjd6M2llQW4yMnZudEhObHBtWnNl?=
 =?utf-8?B?SDBCeDl5Q3hqMXhQY2xIY1FSdzdISmt1SHc1d2RHb0M4Y3FjanFGWElXQ2VX?=
 =?utf-8?B?Vmlac2c5eVIyN1dRV21HVjVxZVVGY3hiZ2pWTEkwYmZyRWt4dXYveUNRRnBu?=
 =?utf-8?B?UWdUMWd1Ry8zV2l3OWROcDU0LzRhZUNFQThnMVJaejlBeStJNmxTdkdEMndp?=
 =?utf-8?B?Q1N4UnYrYWxJL3RSNzBnVkNFOEhIWGlFd09aYlZ0SzFOVGFGK0xSM1hrNnJj?=
 =?utf-8?B?cDJmYUtEbWdsR1hmWWorVEk1QWFIVlZrTmhLU005dnRQaUU5QmZRZUlldEx2?=
 =?utf-8?B?WDM3UWhrK0VzMWQ0NUxpQUpocUQ1Y1NmOGtOTGJTS0FTOC9DVkd6c09EOU9K?=
 =?utf-8?B?YmljblZVNFBOV2p1S3N0MUJxYjdSVzFyOFlrVW51OFgyUjFvMlB4cXkrd1JV?=
 =?utf-8?B?cEZOK2tBVmM2aVFqRzFDbExMOGx1S09PTU9paFl4UHBZUWFOL050Zk9CYVll?=
 =?utf-8?B?NnJRbFlkS3FGWjU1eDMzNHVmTjlsc2RPSjdIdzl2KzY1S3o2dnRyNlVBSnVs?=
 =?utf-8?B?b2FlRDBXRTFiK0ZYblRGRk1KT1ZVazdpTmhscE5TbGpuWUFRM2R3cEx3OE5B?=
 =?utf-8?B?MnJqWTBUZGFHSnA0TlZxNmJzRmY3cys4aEtUc01veGdPN0JhNmZYOU1pMklT?=
 =?utf-8?B?WDN3cmJOb0t0b0Uva3lDdUhTWUc5anF3UmtUSTNpaXdEa2hGbFhYeURuQ1Ay?=
 =?utf-8?B?N2tDenZaUGR4Zld4Z2lIT0tzS1liMmoyZzNHZEcvRnJNdmVQQnlxTlRUUnlT?=
 =?utf-8?B?djRhc3oyaEpFNGVDd3U3aE9STExSVEFtNGl4MENMc3lYUHVwNHl2WjhaMlRl?=
 =?utf-8?B?c21KanBGNFhOM1NNZjFZMzAwWjYvbUdHZitOTVpJdnlQVzFJL2pQWDdEMkZ3?=
 =?utf-8?B?YzBTYlNtaUZxZ2YweUN4a0M2SDNSYmI2MjNHUWEvVVY2R2RVcWFsMVgvUzZH?=
 =?utf-8?B?Kzh4MTQrT3k5a0dzdnEvRjlncHZoOUtzc1hxS2hscDFDdXV3dTdWclIrMExh?=
 =?utf-8?B?aXI3RklvYmlaYnFMbkhYQVdUc1kxYzJteVhtQ0pGOUREdnpGS1FoZlJKRjBO?=
 =?utf-8?B?NzY0U3JwNDFOWVNFTEF0TVFQWlhnREFYT2U4djhVZENXeHkwa0luUjJlRGNQ?=
 =?utf-8?B?SDFXRjhyL1c0b1N6QWQ5RmxmZzQ1Z2pnTkNmZGkyQk9Ud1B1MWpwMnVCQmhk?=
 =?utf-8?B?YXJMZ256K3BMZ0tUOUozVnVSN0thSWsvMFJNTjU0K1NyeHZXeDljMzJ4VWpB?=
 =?utf-8?B?ZW9yZUtzOGNMU3BkdDRheTBrcmpOQVlXN3Z4dzNQTGtsQTd5T0NmM1lIY1Av?=
 =?utf-8?B?TGZDUzRIRnBHaURQNDczWGdnV0trV2pMSmhPdHZxWWtubkllK1FnSHM3eHN1?=
 =?utf-8?B?ZkRJMkVxcW9xTjRzWS80SVhocUhBdkorZW83SERzcFN1Wm8xUVdVRDBoQy9V?=
 =?utf-8?B?aHNCaUhwMDlLcWFTV2JnQkhOS0xKYWR2emx3dz09?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:09:04.1681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c834b7c-a335-4dbc-1a33-08dd8d254978
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_220917_645894_BCE6EC66 
X-CRM114-Status: GOOD (  12.66  )
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

The AM62x SoC supports three temperature ranges:
* A: -40 to 105C - Extended Industrial
* H:   0 to  95C - Commercial
* I: -40 to 125C - Automotive

Add device tree include files to adjust the alert and critical trip
points in k3-am62-thermal based on the temperature grade.

Passive trip points are always set 10C below critical.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../dts/ti/k3-am62-thermal-automotive.dtsi    | 20 +++++++++++++++++++
 .../dts/ti/k3-am62-thermal-commercial.dtsi    | 20 +++++++++++++++++++
 .../dts/ti/k3-am62-thermal-industrial.dtsi    | 20 +++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi b/arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi
new file mode 100644
index 000000000000..7de461da16ac
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi
@@ -0,0 +1,20 @@
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
diff --git a/arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi b/arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi
new file mode 100644
index 000000000000..a6845a0c513c
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+&main0_alert {
+	temperature = <85000>;
+};
+
+&main0_crit {
+	temperature = <95000>;
+};
+
+&main1_alert {
+	temperature = <85000>;
+};
+
+&main1_crit {
+	temperature = <95000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi b/arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi
new file mode 100644
index 000000000000..eece26eebdef
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi
@@ -0,0 +1,20 @@
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
-- 
2.25.1


