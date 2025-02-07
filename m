Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91998C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 05:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e9vOdaB5m/wkdSLT2ixocThpwlKon9UoW+KLh4Sdemk=; b=I5+uJeczlIPG9P
	gqIeno9f34Gdqdo5KYUxrw5fj3Md4ID/4nR+7RJIo3l4oHD9Wr3wVpk+a0tbQXVis09qR+eNHjPgU
	/JbHZdhLdsnUUifT7MzBgatLyrl0UhjaICLLCAyZYdL2cJMQERunvYV53K29duNLcPuJrKd7yMe//
	GZkovgpGZMi2UsPe3eoJ7qsoF4Cs/Yi1GUIinGJ0iaXobVIXHbhEtGhlvFsGWaVyhRVAhzXMVp1qh
	a9n1E27AQBm2DC+W/IGp3R7mJEUi89A/kABLZsYISvRfTsTg0oY96S1zhHy/zlxX7J/v8Fd4DBAR7
	0R5nbfEMCadySVfFbKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgHH1-00000008QJv-3rWc;
	Fri, 07 Feb 2025 05:51:31 +0000
Received: from mail-mw2nam12on20603.outbound.protection.outlook.com ([2a01:111:f403:200a::603] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgHFc-00000008PrV-3RLP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 05:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ES7R9YoHqLLIanBZGBe3MXMhJRu+AGZKEiv78GkhpbW/PqQcszDGertP71Nn8567DlyPnkdxB8MatzTVasRmRk0OyE7zUCSOPptPVAeHSwiyMHbbM4hRGr9KcGu8p45ZDk6vTYde4cYNPsyAHoooRzmyUdVyjolDjHgySRwVF6UpEQWmDIci0B1Stomme6iF4Us+UJQfonnWQ+qNc0JzvuU4enxSzHrZSLIQ+RxCRClWtlj1X269n//daABPEm2B1ybrGiekLyMa8D2YOqkgBpBvmr0sQdXTVowem/ur+rgfAeAPIzmAh68alGsbVld68Fy6uRY+FYkpBTrJwUb6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9vOdaB5m/wkdSLT2ixocThpwlKon9UoW+KLh4Sdemk=;
 b=sjzDqhfUsWDp+0IRmmQD/leeDCY8F6yCOMePwqSO4/9CVgOSH84ToMACJu/QW5wqz/ziRIKDJF49pAR+GrMbtRY1YhFBRlowXAz2FVLpE/OSbfIDEl95hbTm465ijJpbK9WPl8ImUSRMQhy688E1BxfOKRYpF58RF7Yrxy91OVCoO2zIZXgyyyXHntNg4kuAVGEmtQE20hP5g3dkhlId0G+d37MlX1ePLHJAoBwwQ/pB5RzeGSzozxCNig+aWgKmXDAksNpYC9wdURifpmQ5EkNTLaIsiuUWEuAHPfy2Dk5T0lwraBq+ItVaYMVJ98JYo8cXgxdkVLnp2supjTwFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9vOdaB5m/wkdSLT2ixocThpwlKon9UoW+KLh4Sdemk=;
 b=zVz07xuTe4hapgd38TRlI+j4hw1fzEaxXcc8m4DSS3YMzoaa8/J6l3GBEs9uokmsSvckWHK8PfKhKIwM+fbKqXJ0d9gObWcYN3IDoTzqHAE3qDxaKos6TBo+BHuG3H6gLp3i24eR7YaVGe5y8LvPO9odnNRirYZLjtmWnGPhz9g=
Received: from PH8PR20CA0015.namprd20.prod.outlook.com (2603:10b6:510:23c::8)
 by IA1PR12MB8221.namprd12.prod.outlook.com (2603:10b6:208:3f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 05:49:56 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::6b) by PH8PR20CA0015.outlook.office365.com
 (2603:10b6:510:23c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 05:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 05:49:55 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 23:49:54 -0600
From: Nava kishore Manne <nava.kishore.manne@amd.com>
To: <michal.simek@amd.com>, <ronak.jain@amd.com>,
	<gregkh@linuxfoundation.org>, <jay.buddhabhatti@amd.com>,
	<srinivas.kandagatla@linaro.org>, <u.kleine-koenig@baylibre.com>,
	<praveen.teja.kundanala@amd.com>, <siva.durga.prasad.paladugu@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] firmware: xilinx: Dont send linux address to get fpga config get status
Date: Fri, 7 Feb 2025 11:19:51 +0530
Message-ID: <20250207054951.1650534-1-nava.kishore.manne@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|IA1PR12MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 12846602-5469-4078-63e7-08dd473b3fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pLqZDoFzoHl2xQ2J4k5SND2KxcokwykJ5+tjRq6E7KaW2yJPOO2CtmxCr5Az?=
 =?us-ascii?Q?ccunvaF4KypmeI/l0mXM4rddr7ZWFaofNXrRBFMmUPp28YENH8iM48n2ZP9e?=
 =?us-ascii?Q?93caLbGKQigS9DcDElWqH673E3jCBJxPH311ExUjAq14aZRIiRmBjAFarvK9?=
 =?us-ascii?Q?rEgJ02WKYA+Q99o0hILI4rzeRKaKPTT8dS/uke/cbma6oeGz4y/G1TOwtHAd?=
 =?us-ascii?Q?cb/vTyc2dbUVd4SUmePUi2pq+LFNx+ZdE1fp7ilEqgpyx1gmxuvaDmdHun/E?=
 =?us-ascii?Q?N9hI69ZevOSFRqxYIIbmDa6hrqx2epNc24CfKRkKbZIIJepO57/m/+XODAnX?=
 =?us-ascii?Q?Re9RLFW4aM/0w2qq+aTEwWpLgtePesKVZvb/iJJK5OHs1pxyXBfMPIH6/ATF?=
 =?us-ascii?Q?7g7ztsVu+oaYe2Sl1fAxeKYDKVxAZBT+CncWtebEhWCzAfvXIi0tP6WwDuRi?=
 =?us-ascii?Q?L2njDJP78eYEk+1Yf/qXyVQ4SME8e1DI0q3ApkfbPmMsN4K3f8Tame4x01aA?=
 =?us-ascii?Q?7VZqPAYFPWqPRP6zOohzp9CG1GuCWnDIm/kgj0vGCarAhoML1X4U7CkkKoKk?=
 =?us-ascii?Q?Bb/51IjiS8x21h1rYbB01DYU8a+eb77UuPbSaornGI9/1RcOnqJZTfKoQ9tW?=
 =?us-ascii?Q?XAaqiHypIpSCwqJUEjDltCb9EbUPnC6zxumiL21RXgF76Xo1gA/AI4AjTU3n?=
 =?us-ascii?Q?crOHmwACXacBjdzZ58X66oP/V4+pD+YQYBYTfrPA6wtYdF9QW5cyjyCwySyY?=
 =?us-ascii?Q?7jIgY+2MgO2FZ3Y4FWEye8F22x48Tx7OSj2eV/T7r0yEE4NZTy5KLXWDDjD9?=
 =?us-ascii?Q?M3kJlwt0A+1+U/aPV5KSugn4rLkzzzpiq3xYN43yviYRcYI5TSUJw48N5jV+?=
 =?us-ascii?Q?6ZGhuWUliOK4K51EWHlWCfe6A5Rk0wuqIVJvrVJ2YUAIwfAF6zMEyV+nEjuo?=
 =?us-ascii?Q?HvE+JInsfRBf2XufbPnSQBbctj5/XAC9H4JUGxlKFfZb7UinfbKKxehgV0YZ?=
 =?us-ascii?Q?O7SckmFZ3WjfGS3QdBlApxagVUsSOv93EZClUM3H918SotCfQ2DKf4T56Go4?=
 =?us-ascii?Q?lZyrIzWxI5C4nd2mEr4hiFDJqxIhJHuSup//Pk9lnMKt5o/DmIMqYh7noLlm?=
 =?us-ascii?Q?BabEEFuBkav6ntvf7XP7k2/2XrkUNcmMMfKEPF5ilqZ/CT5B2BGoxTOwPR99?=
 =?us-ascii?Q?akC16MRziaAyg3jyuCIdzwgbCOvvgGkU6zZRn0LlrM3GpptUcDCYZIsnAx/+?=
 =?us-ascii?Q?RsY95/5n/eneo/ysNXWBAHcclP/Ls4AZm2zGsLowY8VwDpwM+NxSA3kG1BR+?=
 =?us-ascii?Q?lD+xmb1UWJh6mFPxTn91mQ3qjKvvjEMevnDn0W25seGQdaUey5K8esq3lecz?=
 =?us-ascii?Q?w1tDDyhiyp5ROUltD5qU6OPyonB+NiPPX329VcGM9s94Ip2E6eiEkEuPaPFO?=
 =?us-ascii?Q?DpxNVPo7gB6izmhn3RAECQxFaOo1D4iO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 05:49:55.6403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12846602-5469-4078-63e7-08dd473b3fe6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_215005_008403_9380D8CB 
X-CRM114-Status: GOOD (  11.32  )
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

From: Siva Durga Prasad Paladugu <siva.durga.prasad.paladugu@amd.com>

Fpga get config status just returns status through ret_payload and there
is no need to allocate local buf and send its address through SMC args.
Moreover, the address that is being passed till now is linux virtual
address and is incorrect.
Corresponding modification has been done in the firmware to avoid using the
address sent by linux.

Signed-off-by: Siva Durga Prasad Paladugu <siva.durga.prasad.paladugu@amd.com>
Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
---
Changes for v2:
 - Drop the specified patch:
   https://lore.kernel.org/lkml/DS7PR12MB6070A83267558A7D545E3383CDF72@DS7PR12MB6070.namprd12.prod.outlook.com/
 - Rebase the patch on v6.14-rc1 without any changes.

 drivers/firmware/xilinx/zynqmp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 720fa8b5d8e9..7356e860e65c 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1139,17 +1139,13 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_status);
 int zynqmp_pm_fpga_get_config_status(u32 *value)
 {
 	u32 ret_payload[PAYLOAD_ARG_CNT];
-	u32 buf, lower_addr, upper_addr;
 	int ret;
 
 	if (!value)
 		return -EINVAL;
 
-	lower_addr = lower_32_bits((u64)&buf);
-	upper_addr = upper_32_bits((u64)&buf);
-
 	ret = zynqmp_pm_invoke_fn(PM_FPGA_READ, ret_payload, 4,
-				  XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET, lower_addr, upper_addr,
+				  XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET, 0, 0,
 				  XILINX_ZYNQMP_PM_FPGA_READ_CONFIG_REG);
 
 	*value = ret_payload[1];
-- 
2.43.0


