Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727D6D25050
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyriEpNvAu7vfMhJEb80/ldwy7MAEpby1aQ+1lXm1zs=; b=cTzIQlyu25b3AOUY4N1bVdHG4T
	qt+SqC7N+cEPl1cJishM5w7ZTfLqEiK23oTDkXCynDP7FYjCklhywTCdOBB0TrUjo3gEPUaF7dKdO
	RUhSsBCNsN/T0S1ftrJOtT1I9g24Siovyv/lGAYWT/+ZdCxu8/t+EckV+JQjCfaSVlMbeMz+I4qYy
	XJp3Fbq8bBsbyUiEwVtzE6VilfLx51R6CUZKikdn4ey3dB3M3ik7TQZHSZxw8EFVwtf4ouljNrAp0
	Sjq1szcLAtt7QZMqdHQbMQcIOr2qseJdJ7ydh1b7nCoyD8SpBYG+6g3rM/BbrLJnNbI03oPAtnBIv
	JnalbZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDfR-000000051XZ-3exp;
	Mon, 12 Jan 2026 08:52:53 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDfQ-000000051Wb-05Op
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 08:52:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouA29u4btAMCjFCRd06Z67/x9SD9muZ6Krj+VmTuGaIbFFZ0zKpCsiW/uK/ek6zeQMCWNwBG36R97R00m/TIBNW2mzaEz8qbm4V1ZyXqJHLJXlZP1Qw/OY5A+gGZmUrhmhEEA3cNIYkorykz5kpUrHphVqaTDAIOxyUHawglyP6vDd7fhw2SlAbtXf/MSQhPMOtor5zkdQwgYuQxQBnZgkowOAPQjlXKW+nyyumSZxpqcwTNiiRT+lWdU5OUB47wMmoKkBPT+rGwa1TaFhRnZKFAXQLn7ffZKjMkYe3iXi7ItTq7NOVsszfPPG62fvbDd3bFVs1ffAH97VXQvJQ69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyriEpNvAu7vfMhJEb80/ldwy7MAEpby1aQ+1lXm1zs=;
 b=lSiXWH/YAdJ3RVpL6QOI21el7N4IN/VSc9pHyQIkk85h+tjGuzYBQPIOYC6fZ0FnDZUqp6RqXO9Dc43PFZfqg4SZBJd9o4c1PS3CA4CZscNGmEcEXSLHmUJYC8AS+wk6S3Zq1ykgZIrEYzXsjG3b/WMgCymyCIMA+++c7mWU3KTe41kmBCXUIiUeL7RLOijKuDc+N/eUeA/yAz7wzq3HUQ+gPiqITT+TJgIklWBt9fhDjWNgohgWbyqNQtuFdM/Xp712XwBk8diXM9Wsclv0DiHku0xeBs/lm2G26gDDe5f6WRodBP0dhAnpoUigPYJB5MfQznxuNhFAal6zRxuVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyriEpNvAu7vfMhJEb80/ldwy7MAEpby1aQ+1lXm1zs=;
 b=xOBUo1jIdEG9VPlndwqD9DMtWzc2DiS1yKoQ1Om3T/pJxBJgxDAmKS07O7JMIc5jJva1pTQLHgl0nfkCPNVmY9dVcE7Cd0uYkLTHTmTcuWmcoOBXn+1kxjNbyXHe8m7Xfx4pBlCC6VTMiMcNTGXM7DNMBJiCUMUQydeBHH4ZeVM=
Received: from BL0PR02CA0073.namprd02.prod.outlook.com (2603:10b6:208:51::14)
 by SJ0PR10MB6349.namprd10.prod.outlook.com (2603:10b6:a03:477::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:52:46 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:51:cafe::74) by BL0PR02CA0073.outlook.office365.com
 (2603:10b6:208:51::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 08:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 08:52:44 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 02:52:03 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 02:52:02 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 02:52:02 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C8pqh9090613;
	Mon, 12 Jan 2026 02:51:58 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <u-kumar1@ti.com>, <p-mantena@ti.com>,
	<m-chawdhry@ti.com>
Subject: [PATCH v4 1/2] arm64: dts: ti: k3-j784s4-main.dtsi: Sort the nodes in appropriate order
Date: Mon, 12 Jan 2026 14:21:12 +0530
Message-ID: <20260112085113.3476193-2-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112085113.3476193-1-a-kumar2@ti.com>
References: <20260112085113.3476193-1-a-kumar2@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SJ0PR10MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: df3b6cd8-494a-4ccc-6cfc-08de51b7f3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eTMmEmKtoSgjNzVETwctYI+AdeDqWUaAY4mzwhRav5yJdIOaxmEMNpl7FF9D?=
 =?us-ascii?Q?pUUVuW5tJb11nlrhdIzRdPPhEvgk8Z7VdypFzK6DDD4EjYqHL9cek988MeRs?=
 =?us-ascii?Q?4WtdWzQ7H+tw+LYxd0jtK9tUHg5DO+A0NYznPMQ/On+k4y6ltWua/zewz82e?=
 =?us-ascii?Q?6qYDk3cqnb3rDVB4Fy4dJg1x6cRDjGu9m60DJy15ig+o7UjWdAhKoNpZrk41?=
 =?us-ascii?Q?bVawihJFTn7fUklYVqUzSYe+PWw6t/oDDGaLQp2JeQIvo3Eb7irmh6pwXrI7?=
 =?us-ascii?Q?Z7rg3f+HEGEYRAeUmKRh9JOoF0/ht33hiV5RqKiaey7NrN3XEOWo/LtZR9wU?=
 =?us-ascii?Q?GEO7S2wbFvBVLYO/z+FrtpSlMzPFafJsB5aVG6WnBZ68srKsGNWiFxKG5Jhz?=
 =?us-ascii?Q?LbF/It1A3VsOdU5i6jYbPq9rXYHWnqyeonyI0YtYJcuSxGa/gPcLetCDyiMr?=
 =?us-ascii?Q?45jfNPL64pzsOJ5ltEhSNYr+EA49o6sCT+b6p/ljAeaf4lkPeKK57j83llGG?=
 =?us-ascii?Q?ue/M8sNQJ9TkqHzIRncSkwUwyvn4wZybyExdjAAARD4zdkBrlCPBd6e6qFK3?=
 =?us-ascii?Q?YmIMQTAeLntPXi7Um6UdsolOQw3XZd/kgVDrNj4KMosGad59VQhBg7K7Fmpq?=
 =?us-ascii?Q?8OlivRvcdyRGsqDIq0pql9mE7POHClnmWT5F4iQNxx3bu1wTsp9mbyEWnD/j?=
 =?us-ascii?Q?jadgFj0wkwOEo0clDj9bn/d/N49PEi1gmXsEX/mc6UnM9zo9kKEKsXaxuq9D?=
 =?us-ascii?Q?mNT12Wm8blxpBJjXNaEfjWaS+S9ZgALALpcO+/uwSwPKSqhMGmuIPGwiQI7p?=
 =?us-ascii?Q?P5uyvBqkXFLmwUcMqmCrRpowTmUT3/sr0IZTvHsbjB+o+Pr4C+QBoOQAfzCN?=
 =?us-ascii?Q?ewk6vfuknJQvYkV8cdvDepz6lMI34vNCzq/TxhVcqOZqSr9nZTnk3JVaZPS/?=
 =?us-ascii?Q?OJxTDMOV6keSrf4OOGk4Y5HPPaj0+ZDPtd2M+ZVsHRdK3PoMiMDQzSQ9HbMi?=
 =?us-ascii?Q?+ciw/QN55AhCi/UUAj1BH3qmtU3vB7IPOMxOw9q+WmZ1667HUcmJH+R3xUz7?=
 =?us-ascii?Q?IFDJ2uQp9KfM8dvG7VxET3/H+HQsVJUV4FiExlKYz3xDiB/gv+NlRUG1Hznm?=
 =?us-ascii?Q?HgHnDv28yu2BorgxcBRAbidtW+sIYQI+m2k57C1vlGNG/AL/N8JbJ5vUl+gp?=
 =?us-ascii?Q?dNQfiKA+4R3EkTDL1OIlU06xwwHHn6LsEqGbQmutIbvJvZtPqNBLhjGQh0M7?=
 =?us-ascii?Q?S33CLLna8udg9Dfr8+6UsQlTG48QhEuHlDzDSmOralViLNtk2Dz6ZoOXxUT8?=
 =?us-ascii?Q?GMVdew64CmfQ7SQYAgE3+RmQuh9aZu4uhcqneZvGJ5GfmHPw8zvpg+iwga4J?=
 =?us-ascii?Q?OODN0PJ9m36crkaE1iTRoJKkLfVOkOgmNUXpR8bD6wNiO80Vdb3moTLTa6nh?=
 =?us-ascii?Q?robg6G3+flV2D9iWLHSyJ91741a05dnwV37OxB7CYAdFbhDfDMjQpHMg31F/?=
 =?us-ascii?Q?Tx9VxreUIX210YAzNgatBo8ZWkYpqeyRvS5bKgBU4zgV4Kgrl0Mx7F1f/haE?=
 =?us-ascii?Q?L/5MclvR6y3ZQEfAeKA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:52:44.4374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df3b6cd8-494a-4ccc-6cfc-08de51b7f3e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_005252_061924_DEB2B095 
X-CRM114-Status: GOOD (  10.95  )
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

The device tree nodes should be ordered by unit addresses in ascending
order.

Correct the order by moving the dsp node at the end as it has a higher unit
address.

Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 0160fe0da983..5b7830a3c097 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -6,19 +6,6 @@
  */
 
 &cbass_main {
-	c71_3: dsp@67800000 {
-		compatible = "ti,j721s2-c71-dsp";
-		reg = <0x00 0x67800000 0x00 0x00080000>,
-		      <0x00 0x67e00000 0x00 0x0000c000>;
-		reg-names = "l2sram", "l1dram";
-		resets = <&k3_reset 40 1>;
-		firmware-name = "j784s4-c71_3-fw";
-		ti,sci = <&sms>;
-		ti,sci-dev-id = <40>;
-		ti,sci-proc-ids = <0x33 0xff>;
-		status = "disabled";
-	};
-
 	pcie2_rc: pcie@2920000 {
 		compatible = "ti,j784s4-pcie-host";
 		reg = <0x00 0x02920000 0x00 0x1000>,
@@ -113,6 +100,19 @@ serdes2: serdes@5020000 {
 			status = "disabled";
 		};
 	};
+
+	c71_3: dsp@67800000 {
+		compatible = "ti,j721s2-c71-dsp";
+		reg = <0x00 0x67800000 0x00 0x00080000>,
+		      <0x00 0x67e00000 0x00 0x0000c000>;
+		reg-names = "l2sram", "l1dram";
+		resets = <&k3_reset 40 1>;
+		firmware-name = "j784s4-c71_3-fw";
+		ti,sci = <&sms>;
+		ti,sci-dev-id = <40>;
+		ti,sci-proc-ids = <0x33 0xff>;
+		status = "disabled";
+	};
 };
 
 &scm_conf {
-- 
2.34.1


