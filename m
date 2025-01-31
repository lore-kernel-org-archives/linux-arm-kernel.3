Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10C4C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NYL0SXn1tcvikSRW+MpK/FtRjC8MKAGBY5McNWdT5jU=; b=2zV7cZRuX9HaC3tvZ7xER1x/8n
	4+KbeE+WL2Z8ia7L2LullZeqSEfbW318twLjUGbxn/ot7sy8QZ3TPs3c5vNC6s8U5JcFh8yDRqLZo
	q7G5xwQHdZXe6BJUAEbEKGU7uYlGSOt0tNhG8FTdjRnVPB0mCV/vQ1qKbF3JIp+nxwxEmmlRFLuyD
	zWG6XltOMtC0VeQ3yNMGp7tqh8Ms8Mzcija4vpBmBXgtAp/belRyoewfsGkpOLHtfC1BGulihvpKR
	6mYozWfRj3kOBv2krgwu2XmgeevtDW2iQTvp8gxgjPHF2cCEonfp+DzUWVHBi9gRyqEGJLvnOMdD4
	QNvb9TTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnTu-0000000AKIs-4BHm;
	Fri, 31 Jan 2025 09:38:35 +0000
Received: from mail-am6eur05on2070f.outbound.protection.outlook.com ([2a01:111:f403:2612::70f] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnRK-0000000AK4b-1CCx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 09:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiaRPcYM/Nrb27RrXn/eWHH+Lqnmrjc5TCN+XkTxKhEUDFfjFpTYr0dsscYZQv9kKaljxF564KqXhVifZWr9xA5d4jlYEMqrO+7X3VqhBPwf48k7eWk3IVSh5CN3jNw/Ht17XLSamUpa776HtDnzqtVhM5743FSoF+hp/CCWjM2qfJQF7fconsB2O4Xmc7chOz4nubZcNemapOStvRRynaSa+bhG0BjUdbqUPqgpcSlC8SfvM9K3jZcLDyCOOzqvxFcx9EpJtxvDm+/PuKLsGI0goLZkF/126EZhpAbklvHllL06PTUFJrDHlSOY7C7SdtzHMy9KXZRxqZiLXNLs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYL0SXn1tcvikSRW+MpK/FtRjC8MKAGBY5McNWdT5jU=;
 b=rwqtNttUrI/NVOF1kkukF7O8OzZDb1rLiS+Ici5L7B0HrE3Uw4VJW3B7r+PdSNyP3Dl5DJ/vJQIX4ZWzZ1+FCL8HCft7PelzTCd/knNaCN6qHJxOITyVkGF0SDtGyv82BHLegxCgeg4V5j510W8ay3UG7DVkYBcWQfRFTOdGAySLSedq7SSQ9xeBy0kUi4NjPOOLf19U11/PHs3qK/zBfseHaws6RxzYCvWPZStmhSsrPcNUObHgEiG2EsONwbmpv57itdI1dYm6A1+cnOdwKAdBml0YHzyzQY9ys7ZUX4hjuwsejq1JKUftjyYxFV2RbOTeZ3/Sih0oLVoSJ2PMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYL0SXn1tcvikSRW+MpK/FtRjC8MKAGBY5McNWdT5jU=;
 b=plwEMmlJ2quezLla3eVZ1JjofYvtsptNuHmwGYRIioyArdDNcbKfV5Z3d0oKd403iFQ/HNhawQdJn+qiDi1OhaJ7ZcI1/IkAzBx74v2jrtcD5MU+HPCVfZVVxfxUdWGxpnF/Zp8E0Oq5OL6ifcIiIMrC8637F23AypnbdDOni04yxBbMupMBlsHRQ8VtlqZjnkNS8ZnjO3yr4R26/lGF/Y5BYsaukyqq9mzG3fs50dCmYCC+/j0tsc9XH0M7f2Bxc1aAhI+p60fI8U5UscrNSNhxnGfEFuYJtu8vLn8r8aHrGjjkWhJIAHrFP3JycutXABkGAEyweOMF7E5ROxquFQ==
Received: from DUZPR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::12) by VI1P195MB2462.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:1cd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Fri, 31 Jan
 2025 09:35:45 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::ff) by DUZPR01CA0010.outlook.office365.com
 (2603:10a6:10:3c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Fri,
 31 Jan 2025 09:35:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 09:35:44 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 31 Jan
 2025 10:35:43 +0100
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 31 Jan
 2025 10:35:43 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <kees@kernel.org>,
	<tony.luck@intel.com>, <gpiccoli@igalia.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am64-phycore-som: Reserve RTOS IPC memory
Date: Fri, 31 Jan 2025 10:35:30 +0100
Message-ID: <20250131093531.1054924-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|VI1P195MB2462:EE_
X-MS-Office365-Filtering-Correlation-Id: a36c9dd7-5c79-4c74-e557-08dd41daa281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zhYPzcXKVsR1eC6Ddc430vyd9g8rBIqGsxXUH7j3+4iuFBbRlxOBpsLw7Epc?=
 =?us-ascii?Q?JObk+Sm5EA3/aE7oZaHA8VwguX9p/Gi0A4SqWIVddbGKh6wx8HPyYnHcvUHZ?=
 =?us-ascii?Q?wLkIdLK0LIcBpQPLmiAV/yIOcNxr7csYO6bslAs02/wJeUIeGs/QTLWsgLFr?=
 =?us-ascii?Q?0EDqccymEiAn9Fus7Iu3cwJNrwbOGNnpjozRpL6r7MDDlMVa6GQTXsgP0Njz?=
 =?us-ascii?Q?vATlgFqSYfDznfxoP3Zxd53vnI2rP+2NAv+GBXjyqicXyCby07ZQ1XhDggS/?=
 =?us-ascii?Q?iBZSyjs5ytOhTPs2/2pYoE2GjQgTGK7RocT8my5Aqhe7bTrOEU0Rx4CvWNpq?=
 =?us-ascii?Q?x537g16W70o5tEDdQ8IRZSxNhMQ/IWOmkjqDllLmbhC+bk4HWBPGTR1aMepf?=
 =?us-ascii?Q?6XWkncQrgadMMkOrvvpNkolYcMxEk56s4c1/wfYPO6+aDsJKn2kO+b2z7Wlt?=
 =?us-ascii?Q?sVzCS3eiBUYH7617QfT0xDgztiYmRkcRyEfdexgLcAxvoImew7D2uUJn9x5Z?=
 =?us-ascii?Q?ien64G0C2qXZkQotNfCMzShKQg4DQxNFh25GbwbH4f3lQLAreExwtOWL4zCg?=
 =?us-ascii?Q?+AiuFDVnv1j0ct3X1x1uMoaqZWDJJJDiEQC3ZitEvVtD5lN6xdj/rNMpZlJy?=
 =?us-ascii?Q?n3M9BitQUlfs0WlFrO5A1uMgBa+SpLO/xUyO8XPSvSGKFwXdkyGLttrU/M75?=
 =?us-ascii?Q?ZDCnFKrFJK6ydWIAyvY6+ICP+OEGyPLR1DsqWR4EnoF7T39X8kUPbuijSSVx?=
 =?us-ascii?Q?4PZzbQDS0sH9dLcgUnPq0BScYuRDZHrkFx6tfhA6n+pBRDbB4jIC1fSh27EE?=
 =?us-ascii?Q?Xs4iW9d7acJmHHLwXNFg+1qXOGBPXb/cB2rcwvQSXIFyJ1TTq/PgdJcT6HN/?=
 =?us-ascii?Q?s6XKgdL8TVTA9IDH7DdtkDzFSYqvNyD0dq0E8tvc2L3DSTHx+syU1Btk3Zet?=
 =?us-ascii?Q?G+67h81MX3P5pQ1cWXvslXF184YYnAfVj+wwMd1omGWxbB34c2WiUKLfSCEV?=
 =?us-ascii?Q?lcEzxUFYPsRPJkzAK08MeMW1EEU49+Rmb9gM631YKzSI1A+w6y4T7Rc1OIc4?=
 =?us-ascii?Q?1eXrQxwybIAO49TL/dxslBTFFAfkoKYZVstUx5nNbtZfy/Z78fhRgDT7fYec?=
 =?us-ascii?Q?hIXoy656LDCt6XPJvCW+obvvlFXbLysJQYxPqoso3OZlPIN7/mtAlyhfOdct?=
 =?us-ascii?Q?SLoVkPQJNN1RISmSN5XiNhjxCWy5rzJTCbBhxaJ463GWo9DFIkENRIU9pSUL?=
 =?us-ascii?Q?Oz3PKu+zVFteVrtYYDN0l5ZzBj27/V+5g6j6ZhrC/WBqWgPOdYO+HHjUeWFt?=
 =?us-ascii?Q?4SZVv/kFhiXbEjcwCYGax6c8z38rAG33mEXCe5FjpFn+DQzRBaMge5414e+F?=
 =?us-ascii?Q?5TacXi05Tbijhc7uzx6j/89D8i4rSm4jUJ6fPL73Yk34Lu+HnL0mhpRMAN1h?=
 =?us-ascii?Q?MXqaczHxDXc83s5j5/Nlu5jHqAknPhdKPhJsGjOzJavYs8+Si4LT9Bn0t3tM?=
 =?us-ascii?Q?VNZKMxvft0okO/U=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 09:35:44.0951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a36c9dd7-5c79-4c74-e557-08dd41daa281
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB2462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_013554_323991_A754BD3F 
X-CRM114-Status: UNSURE (   8.54  )
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

Reserve a portion of memory for inter-processor communication between
all remote processors running RTOS or baremetal firmware.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
index 99a6fdfaa7fb..e8d1b88651e7 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
@@ -99,6 +99,12 @@ mcu_m4fss_memory_region: m4f-memory@a4100000 {
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		rtos_ipc_memory_region: ipc-memories@a5000000 {
+			reg = <0x00 0xa5000000 0x00 0x00800000>;
+			alignment = <0x1000>;
+			no-map;
+		};
 	};
 
 	leds {
-- 
2.34.1


