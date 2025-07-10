Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5B2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YZP1IHCkKgGJxtZWFZ9jQ09/UfLFUhUUue5jAcIOo28=; b=opomXc4MAtyjw3EOAHlCxZBZGs
	VLcetPrGquXKGPaM0GpMWG+0chpyeec1/x9oXqAxv9TGzklYE0REoUIQ49Vj+CCtjTyecL/tTDam5
	UxLSVx+BgmiGReuxDQX6FEbpGljtxind8fo7oYYZvJUp1+AMfl9vCM7iLUTYH1HGjUxIR/Xkpsv/G
	6B0DNPw4kxWcEvWH2h/jHQBvmWQgfLLjjMx+tqGqknP3rtw/PpcQ8n9LwovirhroRVlc6+YRpuPwl
	zjHJIvTWjFq8aOcTJamWH9136CYwhbowzyBWbh9elZ4ZEF5xS0t6aI3oYfA702PctfDKXtLOiMivu
	2RVKWI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlZh-0000000AzHo-1R94;
	Thu, 10 Jul 2025 07:20:09 +0000
Received: from mail-dm6nam12on2060c.outbound.protection.outlook.com ([2a01:111:f403:2417::60c] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkX9-0000000ApVv-33dk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:13:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkPob4wQEebJfASPBV/HUQV5pf/fu+UfDvkJUFjR79bhKISSo/vp+sfx3kgTrQhljBT9jRkdHikjdXBTeLaq/4QCtNDPCV22D0zcMyIWAm/wfQfR5LQhAkM/VwPAKjkrT1BEKip+2gF2g0hv7664x7lDTjTBl5vrJEw8mNNJfzR75qWZAGQilMiTfG/bsEUAcZVZdcbWabIf4Uj08DrTw+PZi+maAlvL+esOkbwuvH5ej7h4cW89VSonCZCPh2I0UbQSAAz2HzvBuQP2wR1t5wnxuEEyxN4KQCh+796gbH78qNJQm1j96oKqfq2B1ysX9f3sK/qHpFm5P79svwGvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZP1IHCkKgGJxtZWFZ9jQ09/UfLFUhUUue5jAcIOo28=;
 b=WU5orYkApSFxZvL5KHTt+7NowJDb4c5s2Odw3WAUIepIXybfwZYFn2PWlxq2EefOnydFq3Usvz+0zjK+zJVH17ycwXt7ZlFOcnnSSct2HAZPgUu3gPJ3pL4wv7pzxIK+e2IlfmeWFOVGiaWCeOxuo070ksih6JwsLFY7U8PVlXhhOcfv/+G4ICkZlYFW5svHQsuqoZZwySlZq/7rmpnt+WIX7224XZBpe+xcSKlYEkO8iQkGCq22HR20hBBehSGnjV2w2aaxPvOU1aCq+YEJBYjN95tTC/19iUcpeO5yx3kfU7xGnPq8uQL9QG98WBTb0ad7my294pr6gqFEwIvuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZP1IHCkKgGJxtZWFZ9jQ09/UfLFUhUUue5jAcIOo28=;
 b=zi4ivypXM6+spAg3Q/aleDGVcVU0nehcdlqKsvXDkfDQLEelerVEsjFKrMl01Btc2cWrH9saAM2aqXvkqbATBsmcJdro6gfv4KgvwQ7dlh2mPh+RoYWieB2j5th/p8KeNrSIzdvexZQyaF89LhyRLIyP3GI35VTVkv1z9IgLZMU=
Received: from BLAPR03CA0053.namprd03.prod.outlook.com (2603:10b6:208:32d::28)
 by CH3PR12MB8305.namprd12.prod.outlook.com (2603:10b6:610:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 06:13:21 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::3) by BLAPR03CA0053.outlook.office365.com
 (2603:10b6:208:32d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 06:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:13:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:13:19 -0500
Received: from xhdharinik40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Jul 2025 01:13:17 -0500
From: Harini T <harini.t@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH] arm64: versal-net: Update rtc calibration value
Date: Thu, 10 Jul 2025 11:43:09 +0530
Message-ID: <20250710061309.25601-1-harini.t@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harini.t@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|CH3PR12MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae1a2cb-d2d9-4bf8-f537-08ddbf78ded5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qMkKp42NLEN1bf0uOAylpx1rUM4iI3GgcLLbY0J6VLYfLAWevsSYtkvwHX8x?=
 =?us-ascii?Q?Et4O7dI2AKlPeI58RrCkWscV51knegXgmwV2kjLWUi71RKXv7FUlxNgnonQ+?=
 =?us-ascii?Q?PtLg4PoZ8Vk8+pEEFmZapmr8uJTV358KusuBojMcM400efQAivNGMNCf9R62?=
 =?us-ascii?Q?P/gxai/ZcbC3891753kfOmfCmW1ZQ7vLzEE/EaeJ5rmCbI1V5GOgfPyoP+UZ?=
 =?us-ascii?Q?UZ8nbE6E23MQSL76EHZUvnKUfiLjfAmddPgNy1tK57Ar8zxSETvhLwL/s3Ib?=
 =?us-ascii?Q?cNqF4GzV7PJMSrUmUNmYlXZ54oHCZcWnnn8EoN23ts3wmOMl/0CV0lcSvzaE?=
 =?us-ascii?Q?hLtULFjj0u9t2qlyLGRBFRbfFWYoZwBlEj1mkFDrwUi5/DUNtOEUY0fsCPWy?=
 =?us-ascii?Q?WSOqz8U7y+7I7F1XMWZRg/rkXpTKjGUPMUJlmLjnrwDkzozfPFggFMNDrqK0?=
 =?us-ascii?Q?1IB9Uy9G1dRLRQ0TJN4lMgehd+rs53QtNX8ihKQmEkEjg5HchxxOoCXemrJ4?=
 =?us-ascii?Q?zDIH+EE8+9UdOHnHCEDvoDX1N0LH5zvaSUy5ceYRd1T/Zca1BTS+GTKr5Thi?=
 =?us-ascii?Q?H7AET68HWUx7Iaq2KDPjlX2p94Tn8k1xBVPCUnBmOXP80j2vkWuLCLTbH4Wc?=
 =?us-ascii?Q?9wTq5zEypDNbe55qWIgRZxeQ8mxOKJWVU60JXj4hnRSoKfKblMlSGUl0sJsq?=
 =?us-ascii?Q?AtYYTr4QZt5FJjAGbLFa5sPQbenhmdutJePp/AjngX+DCfjZiA+96gD4y8d1?=
 =?us-ascii?Q?Otpc1e59is4MuvbK3XgR5tvYXYo41IBfvXLGU8EzMJkpcJztX1JIjHviKP21?=
 =?us-ascii?Q?swglzG+RE9GGAlifre9/f3gZDUnnrcvyhRNxuVrwbxArc9iVzDNsZoPo/lGB?=
 =?us-ascii?Q?sJb7dYT2QeIuGZ21D+vFZ8a6OYLf7xsJDZ2mbRPmGrrHBflFEOCjp4D4li7m?=
 =?us-ascii?Q?xlgmvt00Uk/8EKcEKDYrAS96Ya8ydP48EdcMvspphEsAnFriD3HW7Fm/zoxJ?=
 =?us-ascii?Q?fsK17+59RqECe+3CpU/iTfmb7atnc8n2isicjPalAqhuWwISq9/pLL5JNF5v?=
 =?us-ascii?Q?3iOYVKdBRAIexvm22wX1DNbnnshKlsOkfdH8ZCfn8rHXILDHu8eshQlxPEpt?=
 =?us-ascii?Q?2WWqCWP/O1x85eHNRqQLMeXScS6lYIwhtpz4asrg86WWtWwRMj8xyX7v55wb?=
 =?us-ascii?Q?go3yaHmF/rr96kqlEyMRrLsmIPhagcV3GPhYO3ZGvAZ13+bLgl5BL84X2yhH?=
 =?us-ascii?Q?OsMVZHCRvFK6SRv1etJobZGn5tHAc+QMGzikO8mbOywq0gaUDWECY3bp1zmL?=
 =?us-ascii?Q?9BA+iaPT1NOhW3m7StOQ9EjGwGh0v1xJ9BXAXFDGd+TaBrzy7vd/M7sOW0l3?=
 =?us-ascii?Q?QeqFw3g90ACrocy6Wx5DsYRLYdpj1qf17HanXn0hUrk5Ww0WOgc4EQQxzNpo?=
 =?us-ascii?Q?cSuTixi5cYdgMP1XTj99Hyp4gNAdtLItatFp0fzRCkGPoS/VyB0Oa4kKtoB8?=
 =?us-ascii?Q?/edG3HHW9qrRZFOl+A1W0cvH/s9XKKU4qEh+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:13:21.1584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae1a2cb-d2d9-4bf8-f537-08ddbf78ded5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_231327_801732_53334FA5 
X-CRM114-Status: GOOD (  11.29  )
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

As per the design specification
"The 16-bit Seconds Calibration Value represents the number of
Oscillator Ticks that are required to measure the largest time period
that is less than or equal to 1 second.
For an oscillator that is 32.768kHz, this value will be 0x7FFF."

Signed-off-by: Harini T <harini.t@amd.com>
---
 arch/arm64/boot/dts/xilinx/versal-net.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index fc9f49e57385..c037a7819967 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -556,7 +556,7 @@
 			reg = <0 0xf12a0000 0 0x100>;
 			interrupts = <0 200 4>, <0 201 4>;
 			interrupt-names = "alarm", "sec";
-			calibration = <0x8000>;
+			calibration = <0x7FFF>;
 		};
 
 		sdhci0: mmc@f1040000 {
-- 
2.17.1


