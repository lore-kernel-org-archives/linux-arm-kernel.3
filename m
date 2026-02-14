Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6D4EF99E1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 08:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dj3OWdeENCIuVX3rT5YkrxPfw/NujIXuD3SgDX3n85s=; b=F4eKaY9Jk/o78ihDYXCIZcKTtq
	vjjHqbwUZYt3Y5GsUusi0Q5MGSQomWAzEEe5R/1oqiHDxTuaTUAS3dz0Vda/EApb6EVustQAojb9r
	+XVlMJLLREThC29KfMaVFTJLCJVcak1szFUwUPSwmcyVHtksoQR/bS9QI/GvujdMo2Cu+ALiyDckl
	Q6YqBPVuvTYPk6e9F6TcCOal16lIQWPdw5YLqJmRzQFQYG9mensAdcMuvBGmEpMyu6PMFhVpNeeJO
	5LuypwYzrLDoioyEoQAmHKA5j/UE8+u8M06rLtK4T4RdbLhVwBFXmPjISY+n00Y5sj2cqxlo3oKXJ
	maefmxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrAwu-00000004OVP-3Fpv;
	Sat, 14 Feb 2026 08:24:20 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrAws-00000004OUj-1Pgj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 08:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKTQaLYlbnYU8NmDpriiVHgoJsP9+VzBTFFxXv3muqCkyVeFHt2hMyeAMF/zNUTRC4Ga6Pc6+eh3OjV7A/kxLtw8hy14s+nI3F7SJPgHpDfSdhsBS+aHhkStZlMKkNvWf+okZyChbYP10sOUFwXWKJ4rQWHCWQJHsovEryE8Ds4TAb69Mys3xQee+3Wvb5KqmQY+cZDHnSoB27lVlM/am/UGe9Raz6H+VG8YiEXzqPpUEuhTLdbduKMWN2dNGgWzT16U3a+UyMdBy8ZQxQgRWOeb7oLncLOlQo2YQRB2y3yplvhDgIXIsmbfA2AM8koN4SiM93+uzGPt0Abi2LntEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj3OWdeENCIuVX3rT5YkrxPfw/NujIXuD3SgDX3n85s=;
 b=fa42S3AmqZZyKMvEvEN9k1Y5C56C+lk04ozIp/fUn4IeBkjjChqiPualZ0opuhZBeWR/LXFPEjdjw9wEj/qBnNETm7GAn+rXMEiTOxVI6C8iBS3QM3hEOfNUnVtXovUIs9stgr6ATtDXcNj1kHf4nrmr/EoAW6vzx5oUcWuqgDBLRv6Zx53ohOhHPtc6sRraOk0/kDEelJNZ0ul7jka7Dlc+ckRgasSgXCfU8lx0UIZ6rIltKKwM7xNLHrT/n3HJ14tba+My7t8AucOiea8Kk3bCKqzW5fZw5lfjwgRO41rYPiYTkYGZ3dUYzK/AkNsuJKX3CUoRs7YEMzb5RYmdJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj3OWdeENCIuVX3rT5YkrxPfw/NujIXuD3SgDX3n85s=;
 b=INuRwKwnycVwhSy6VaVUZBs8Z1BJEvrgdXTruVsWv5mKOppnfWn5K8ms1GVP536CRrIUKu1MB5IQbAKThX6l2e5sovynpoeG0Ktv+R1/wJoxogqoQ3E2Qp/7YrX6NtCAwArU317z9DqiwgHa3bUjtgy6t4p4Rhrl063665iD8oY=
Received: from BN9PR03CA0802.namprd03.prod.outlook.com (2603:10b6:408:13f::27)
 by MN6PR10MB8070.namprd10.prod.outlook.com (2603:10b6:208:4fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Sat, 14 Feb
 2026 08:24:14 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::72) by BN9PR03CA0802.outlook.office365.com
 (2603:10b6:408:13f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.14 via Frontend Transport; Sat,
 14 Feb 2026 08:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Sat, 14 Feb 2026 08:24:13 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Feb
 2026 02:24:13 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Feb
 2026 02:24:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 14 Feb 2026 02:24:13 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61E8OBYp2164935;
	Sat, 14 Feb 2026 02:24:12 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <praneeth@ti.com>, <khasim@ti.com>, <v-singh1@ti.com>, <devarsht@ti.com>,
	<sen@ti.com>
Subject: [PATCH 1/2] arm64: defconfig: Enable PCM6240 ADC driver as module
Date: Sat, 14 Feb 2026 13:53:42 +0530
Message-ID: <20260214082343.2109890-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260214082343.2109890-1-p-bhagat@ti.com>
References: <20260214082343.2109890-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|MN6PR10MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 579ae7be-4436-4d4a-594d-08de6ba26fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IxlUV/lVKCO0WN4vzYncUtYFpfsod5GyAKuAiCzLPZPj1immeuQahFyND2/E?=
 =?us-ascii?Q?9czy4AZRaSh2kJoaaS3EAZOG5Q14aFsKvfVnFx5JdxYE54NeS9OuPfL7x6IB?=
 =?us-ascii?Q?ubHS3FUbFtDr+eOUZ0EdPHAJ2V7dHpy6q3PGlvwVm3p0UCcMTBJxpwX9Q/VD?=
 =?us-ascii?Q?1HN7L7FU538NBI7cDasAj+OTKLbu0efS36MCVGV5oL4n18l1n5vMWbCFHoF1?=
 =?us-ascii?Q?QYBcDoaRo0rBQSvce0K62pqHljYyvzAjX8JPc3ddIm6zyUf9267Y+lomnGZZ?=
 =?us-ascii?Q?N+8QEIENSCR0MRNcD5LwuMluREbxiLO01C0ylJKJsRXXpg+IHAviOdPoj/iY?=
 =?us-ascii?Q?QxzrIsYu2qzejc5GPxSq5Z55N9Pho+WJ5DVMtslW0xryu545FR3zBTeeBlGR?=
 =?us-ascii?Q?YuScrPul/tTl7sK/gHpMc4pfH2c5THFt7TjWpl45KgkxMGehP0uHILhcWV/e?=
 =?us-ascii?Q?zZEXHtWgPBLgRkh32ZKexuz9decMQSV6HUczhoxaoiUghbyp4U/lFBICdOx2?=
 =?us-ascii?Q?ysgDwoRTbXzI+gFuz817Uk10Ot6pZSTCIrUQ/tjIrF7Vb30fLOTdXkgf6Eeu?=
 =?us-ascii?Q?SExr0cREf9vDywa2F8mtjS7UMxcdZdMJRVfByLBbUT0XfqmqbML47b4HAZpa?=
 =?us-ascii?Q?+utN/N+NuMC2UUJSflKSLZiK68gA1GTFd26KrK/OQE5KpGIOezTnJn3Qsj8C?=
 =?us-ascii?Q?s9FT71MLzyUVaQRkdCVq1Y7VJsHS/2YUPwB8lnavRyjPC6UMtymFupe9R7B9?=
 =?us-ascii?Q?RRKmWVzaSwnz60wDBX2vf41OL2MeqfmCXk4gp11dFvefKtOp8tltUApQrl8o?=
 =?us-ascii?Q?fB/qfirqzsY7kKAkqp9RDv3wQRGlv0bfVdOPsu1JehBSVSl30aqcTU5sc9hd?=
 =?us-ascii?Q?RuXlLp1OehGti9V/jDB1SJRlVeNxPizQVWU+1Kxv3RdQEnVM/7pgyAvKczYm?=
 =?us-ascii?Q?2G1XTrh820XsrHu4T2cOQjr7M67cGpTVRX+kvWxMTe2J0H7NsFFBkLA1kwXk?=
 =?us-ascii?Q?PdAkXyh3cAKG+qDSAysvbflFDhbzP40WRrl1pqoVzuXCDk7aQm9hTfN0ywA9?=
 =?us-ascii?Q?fvBafpV5ttC2preQX9QurKHpiF4igNL1z/lGHEOPOusMOKzLZv6NtCJbgS+4?=
 =?us-ascii?Q?ArUYh09Y2hchXHObKLCXav/K9Ecnhg+NWtFPC+d43lrp39A6Bq5XG6sDhAXi?=
 =?us-ascii?Q?iCC355q+gaXgnSKaM34rkTX5MwqmDc629pa2kARUufwCZV8O6OsT5DTRIban?=
 =?us-ascii?Q?PCDvYWhJ65/LcinQnhHwNnt+YtB1AHVtz15EFXW19meGz4teuys+LLWzQVIO?=
 =?us-ascii?Q?8CiaJPCzOrmWwNNJueyQI4d9gRApE8YTp3Ho2bN2jj4a20/7Q2w0zGfCJ7NU?=
 =?us-ascii?Q?nrWQMzTUyiTYyjK7ne/idFsZmH1skmI+DutiKS59u11oc13+WKyRcZRMpqrP?=
 =?us-ascii?Q?jwd48N3AkkYOEMQhz/ZkBgT+OcFCe/ZegbxQcmqQJ9YkdN7eMZEDWWfUHzy+?=
 =?us-ascii?Q?O53Co+xpu1URPSApCe20LR5OYIt5ryn22XYklzlrAhuIQRwFWrbkNhK+e3dU?=
 =?us-ascii?Q?/BI8zy+NI2xj0lrfSbznY06e1rqUhs+YvVO2hrPz6oMAnXoU/kJh6PNjMkUv?=
 =?us-ascii?Q?LlZUdBnmMLhrNvcRU2MUuy0PSLiB/rnDWODhbO2NUG5eHg33fcWWx3bh6+E0?=
 =?us-ascii?Q?2g02zw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WWn6BnTXjKKEvMkJTap+6GbH0Nc96k0EZWCJXC3IFHxTJYvfD9/JANVXWxnHW/xNcn8Nel8cyEZKDyiLpcrq58JIl5GuJthgv5l5ZXQTmY7gmi5Rif05DNoRh809YqgLGMwYBpl1CnfngVpXJJJ4h4IJ/GE3NJk3bFc/Wsp3EkLAoRCoVS15ApmitV0YCFKzPInFTFmlg91l5AqAueU4vigAs8//xvOB6kaD6T3mAs0x/VGsHrRrhpQ+csEXbpMqsnmpVI+DvVV2B5GXQkkqPHMTYnicyAm2SOMGTZ7YZ9AjN6g0A7cdIYj0FyiaIX7QCKr1TimIQTNu78K5zK0V/zH7vwvBuHNegKlYpkJP4VQkKo+R6Bz+7xLDHXpOmzfrxRyvtmUwhGtHDjLlJ7z9JKKKP+wc3+ptd3NTqyr1bErtG5J0Pru3xvav4DP1N33w
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 08:24:13.8414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 579ae7be-4436-4d4a-594d-08de6ba26fe9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_002418_376619_61FD755A 
X-CRM114-Status: UNSURE (   8.24  )
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

Enable the Texas Instruments PCM6240 4-channel audio ADC driver
as a loadable module. The PCM6240 provides multi-channel audio
recording capabilities and is used on the AM62D2-EVM for
professional audio input applications.

The driver supports up to 4-channel audio input with integrated
microphone bias, boost, and input diagnostics features through
I2C interface.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..35a36496a603 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1147,6 +1147,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
+CONFIG_SND_SOC_PCM6240=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
-- 
2.34.1


