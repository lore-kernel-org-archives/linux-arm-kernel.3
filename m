Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73541CEFD19
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 22:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWw2ZryDlKdIX2qq4ckNwpfLkGrW+dyYIEnNyAzU/hk=; b=2IoMUS89wHgxeCPA68bJzObxBT
	XUbcC67lvMNpgWnzPmjjwkikw2wsrFBCzRvnBErgpmJNomv8ki+i6BByaObD97JARxQe3FptDYveV
	7WwVPEkAdIeCtzpO8DgXv71GWbpNO+oYH3LKYOGHhVzFHBMwxSkMm9edrRePujGHVOkvbds9y+UFA
	AkF3OhLwKpth98pDhijnmPzvhNc11VrbcUZLcrstCrr3p8fyI4FpUt4YjOiUIXeowY5coJ6yBJVWS
	Yzkl5VlXvtMJ89Lno7QvqNPati2vIE4spoJeCbKN4AadZpeFwUzLcfpWoyXrp8OrdJ0zLpYwBN0Wq
	nA7jyHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFiY-0000000DujD-1B24;
	Tue, 06 Jan 2026 22:39:58 +0000
Received: from mail-northcentralusazon11010029.outbound.protection.outlook.com ([52.101.193.29] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFiU-0000000Dui9-0aw5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 22:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeaxcqdnVYrVUzhyR7qIRZ8ctj5Vu1P6foTQn7wenXU7u6M5GGZpgUEQUtZ+OTheKnX7apr28E5Qg20SQjcd/u3O85a0JsQaxRlNNB2sKWV0BLMXoaKVcpobIrCB0zQO66UYVJaivv51KvY35omjm4nnWdwGSC+qU+NyzBbuphvdYDhkdTiV/EFyLvP9NVlLda65HlQjGPO+3V5Prdy07sMhAXGoDje+Lk1cjfZm+DsndTJk2MYdg6JNS0VtSFB76PxX2koyjKx50r8rSIaK2/aKN8dOPvbY84Z+mqSSshz2EKOSvAlIeZZwhDmZqplczOBkYjfCNI+HNqGNId09+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWw2ZryDlKdIX2qq4ckNwpfLkGrW+dyYIEnNyAzU/hk=;
 b=Y/N/AV3tWkl0FahzHn1VX0eXHUVOmPSsxjE7B1dvyMQYHj/BrTPJvuHtzc1ePH6NY4cQU0ygSOSGTjPGb3KF+Q1/PSB9cGi1XUq8qpIwml532GUw9S5j9vT7r9q4kIwUmEVHV6zHv8v4gvNIOiRnUBUeSnrslV02Tbih3Kr+0rUl7HsrNj0QffD3EbnGx3fx3TL5c6KtK2pM6fsJSD32NXknJH+0s3MA4pqbLfXgRN9d5xBfwiN3Uii2aeq31s5KyYjMGo1aJUCIaJyr4bBnKSONOtUCwcNXnGC4hNBaipTrgKnjlpzsibvYTxmoM4qudmC/UYnV/csguhhEpg176g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWw2ZryDlKdIX2qq4ckNwpfLkGrW+dyYIEnNyAzU/hk=;
 b=m3wZRlHlF/LqxefD6un3iLS94kzqIl2EOkOnayFSELjaUj4HE5bUz7ZUcyP4Dqn7ksFdIAMwGdAwH8sUVyDaCoRbuVefL9XyF3am3gwhsVT+g8Q3etni9pSSNrNLZjm14CE3rXC695D5Z0K3jo8AVOuHTR46T5lmLeAcjnAo+2M=
Received: from MW4PR03CA0163.namprd03.prod.outlook.com (2603:10b6:303:8d::18)
 by IA0PR10MB6697.namprd10.prod.outlook.com (2603:10b6:208:443::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 22:39:47 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:8d:cafe::68) by MW4PR03CA0163.outlook.office365.com
 (2603:10b6:303:8d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 22:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 22:39:44 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 16:39:44 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 16:39:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 16:39:43 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606MdhS63586904;
	Tue, 6 Jan 2026 16:39:43 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 6 Jan 2026 16:39:22 -0600
Subject: [PATCH v2 2/3] arm64: boot: dts: ti: k3-am62l-wakeup: create label
 for target-module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-wkup-uart-wakeup-v2-2-fb4cbd56c827@ti.com>
References: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
In-Reply-To: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767739183; l=956;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=rBwScZZOALzI///KpW7r8Dg3n2vevHBlYilxmmGzAxA=;
 b=2XmWzMx2NFi82OYj4MjYuiefp3oEjoNJVnchNGLKdyrBCB86pGalMUtIqeW+kUMiEToXWA9fn
 OFV00y37+4QBUwMniZhjebVbXpSLiRXQha1RMsJe1iIiK4iQyj/I2Lb
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|IA0PR10MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: c33d96d7-8654-455a-3dbb-08de4d747d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R290KzJ0bVhZRzFtTGdLTk5sVGs5QWFOYmdmekFra2RwOTBKQnRwNytVYk1r?=
 =?utf-8?B?Q1pvN2I4R3hzSzRoYzdjRVBjNi9xSFVJMGhsOTVNV3ZlVmRETnlIVWg2M1pB?=
 =?utf-8?B?L3RZQkp1ZDBLTk5kN0tqZWNBazI5a2FFcG5VNWNTMkVnNHA1UCtWUkgrWnEx?=
 =?utf-8?B?MXZFVVpqRjRoTGtrTWd1TmhYcmFtcUFidWFhNmZOMUxUdkV2cGp5NWk5dzJp?=
 =?utf-8?B?bDQ5UXBqc21ZSVU5d1lpWFFnaVdmREFOaVpvSGZnVjVNY3VoanFhRzY2TEkx?=
 =?utf-8?B?L3FZaUR6UW1Rc0wyYlVvMUUveXBTaTB0Ly9OV0JoNTlEanFwbkd6azJSVW9z?=
 =?utf-8?B?NUNYTFhqLy9EZUpnRGNxbDEyQnVQUmd1NENTSzIvdmtWZC9zV3B5amIyUWxi?=
 =?utf-8?B?NE45cXZhVFBTeWMzUW1iWU9vSTRsOXNuR0JlMklxd3VSZVdwY3VtNW1qdFk5?=
 =?utf-8?B?UlBXbzhqNlNIOE9aWHpVQXBxR2NOTnB6Q1FzRGdLUklQSzJ6Q0FnY1hLN3g2?=
 =?utf-8?B?eUhBcnV3RjIwYmhvTDVsRGdpMTM1VmdId2Uvemg0d0VDODZETzhZdC9UaFVC?=
 =?utf-8?B?a1hjazBiNWFhZmVwaUtPczBVNHg4TDk5c0I3aEIvaWxBU2VBM01pVFFhbkdU?=
 =?utf-8?B?SUlzZEFoZGVjblFEbnNONExCV1lFcENzWS9rYmZ1Nk5JYzBRbVJPVE1NSFVU?=
 =?utf-8?B?Zzk4Uy9OOEpZTnRMb3M2L2hoUUpMNHFnVUthR0l5Zy8rczdpMWs2cklGMG9N?=
 =?utf-8?B?Q096N3E3bXhsOFpWM241dDgxOVFTVCt0TXBmNUduOGlLd0QyU2tOMDJIOVF0?=
 =?utf-8?B?cC85dFBjVENLbjRBR1ZLOUIxMjl2WlNaMzFjNk5kSmRxaFM4eHBjQldZR3Z5?=
 =?utf-8?B?aWJpYXE5TmNoNWpFc2NCeFdnbDN5K3o0ZHkyZDhnK3JVZy9iWkJjYzNJc1Jp?=
 =?utf-8?B?aWRzL0NWaW5KZnlqU2pla0pDSGJrbjZtY0s4VWlmVk9sUmd2OFIxc3ZieGdr?=
 =?utf-8?B?c3FZNGxFelBmTCtyZGpYdWJjZ0RVMVE3M1oxUFRaL2tQOUROaytPVHVZZFJG?=
 =?utf-8?B?NGdRWGlqUkFDak1ody9RdFdkNGdqZ0hPQmtzTk5lLzI1blcxdUJOd2tleWhD?=
 =?utf-8?B?YmUwNERUbXRLN0cwZ0tPZGNUK0t4c3RRTSszWSs4a2JBRXR4SEFHZ3F6RldX?=
 =?utf-8?B?WnIrVnlnNEVNaGdWRHBLa3o1SExkOWsrVjNvaWhYcFNjZHNRTWprUGVRYkJo?=
 =?utf-8?B?SHA0aVdBMk8rNUkwQ214eHg0TTNQUXNzMFhJTTdhdWxvalh3NFpwMTZEU01P?=
 =?utf-8?B?WmdTaXdRcy9VcitObTcvVnlmU3I5WktEOHJaS2FRUzMvTlVVR0FLcVV3MnVk?=
 =?utf-8?B?UDE2c1l2VTNzeUU4Zy9HbWw0NjN0VUZ4TGwwTXBkWmJ0N1Zqc290dmtMZmFk?=
 =?utf-8?B?alNxUmFjallibHg3VFRLVGdZVFRSYW5qcVNQK21RVHIzaWthN1E3UXZVdEha?=
 =?utf-8?B?VTRQNjJZVzZUR1B3SEJYTVRuNHpoQVZsM2dkTFMxQnEwRjRRdmFZN2MvTVly?=
 =?utf-8?B?Z0FHbWJNbnRyemY2dVgvYjNtOXgwRVJwdjN2QkN5L1NzVjBRd3lYdDNYMm1n?=
 =?utf-8?B?M1V0Y0VtSjV2Tk04eFhUQmRBRnVqK2l0cmRVeW5ncmNSaU5MY1kyVDNkTVpi?=
 =?utf-8?B?cFBCYjRobVpBV3loNUhyd25nL0RNcUNWQWZoUFJLTUJSNGtjclNhNTVhSm9P?=
 =?utf-8?B?eVVDWlM0Mmt3dWV2NGpVVkhmVi9TTGVRTThJUC96aXZKTGYrVk9wcUxBdkxr?=
 =?utf-8?B?M0dpUGsxQzZlUWkyY2lIV2dPL0xlNG84NlUyUXBLVEpkaHZyTk1HYjNEYjlp?=
 =?utf-8?B?UXc3KzRNYWxubDJnQ3NWQ3NaMFpMVGFqQlpVMWc5TG95NUhJdUk5QTFWOWVv?=
 =?utf-8?B?cE5YdHdvMC95VFBFdk4vZzhBOTh0T09WMzFHcE90Sk9xTFZvVzhZbUhDOFZS?=
 =?utf-8?B?TndQZk9zY2JPS2JPV1d6eGhBdlZ0ajNSL0lTUzdtWDFOVXZJRldNVzNreUFt?=
 =?utf-8?B?OHFRRGYrQ0twbldqRC9Ud3gwaDdGVGhTRjQrK29TUnFpRlBDQVpqVEdyeU1Q?=
 =?utf-8?Q?rIS8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 22:39:44.7043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c33d96d7-8654-455a-3dbb-08de4d747d62
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_143954_274435_DD9C82B3 
X-CRM114-Status: GOOD (  10.52  )
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

Add label to the target-module node so that it can easily be referenced.
The node specifically configures the SYSCONFIG related registers for WKUP
UART.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..e9d638d9ffd3a52aa6e0df70f6003879bc292358 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
@@ -81,7 +81,7 @@ wkup_i2c0: i2c@2b200000 {
 		status = "disabled";
 	};
 
-	target-module@2b300050 {
+	wkup_uart0_interconnect: target-module@2b300050 {
 		compatible = "ti,sysc-omap2", "ti,sysc";
 		reg = <0x00 0x2b300050 0x00 0x4>,
 		      <0x00 0x2b300054 0x00 0x4>,

-- 
2.34.1


