Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9422E63C8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q5s8y9l/61WuLN9AJNUPkonRDI8UEH3kuq9Lwgpdl+0=; b=G5wAaxVlsUYj9fS7qWyknOrZGn
	LMiB2jv/gOhfFs1g02GCZ5NCrcmV8GMM8EFXO7r5UyO3A82RjZBawSRLXDtNZxkChhyO07bO6GH+u
	EiP3hKL9epZY+ZBfolXgAZMR5nW3bJl5sWmjuus0So5Foy5otzfz4ZyDR8w4hINO54ZNtKOtfSs6k
	8e0eQfG7kdFOwJjTz2jxl3TKc9DjexQSvOJr1w/oh3jyoYqgAyUc03jlXuQG+OJQRV4xapf20WwvP
	TXZXlvFduOwpSyb6AQZ4eBV6vY0w+pAz42jP5m+3H4G5BruHix4/X7WdiRz59JndeHiOmHqv1I7HO
	Spa5dujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTT0-000000005Q2-0me7;
	Mon, 23 Feb 2026 10:47:06 +0000
Received: from mail-southcentralusazon11012044.outbound.protection.outlook.com ([40.93.195.44] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTSx-000000005Pd-2lzv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:47:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+gSMnUFwc6rmSUgTNmhsxPIBj3N2+306CAjUpQOC5dSdYTNcf2Y3d9atyzgTJ96lbkg6ZNt6MCC9Vrwb5ysBYkH1Lh7UVN4i4H7vOaglS2L1S7dQUpR4yWGYZtmZJ3EmyBgT6q15xrje++hBTXDS/Qp4aAfukblHq9cVtNaxfsO8/5JbihYKB5qWc/CfqLpuAoL6iDsmdO01wwBJ9Ok66BmAVfiT9NSOS4faJ2sC7D7Sm7pkIm36Za4WcxiMdo0vbaBtqBmyswTCEBDCQTezEJ16bH9f3M7RFVH8/evLoHUc+NWcy7u8ygRDy6a4V1Ycf9NKZFnLx1JFJsr+S1tsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5s8y9l/61WuLN9AJNUPkonRDI8UEH3kuq9Lwgpdl+0=;
 b=aNCjU1ViIOOtEG0Qh3GsAZOFVGeWDu6vKISF7J0i/5hdAmOyzDbVnGMLqvJjwK7EK6VnzfLTj5VuQb07rcxq0QG8RRJlEzit+9nj18CLiyzO/iFT9nGk034gZm6iP12Gk8W+PVj+ikZVYcNA51tTE4s+4/fS9nnSj3q+pxnZ0kvCYvRmcZ0cFIvPd120U7SMcAwml+GJFLyW2mP1ZPOwv88dT5YlPY9snN4RS0LLM4Yu9f3GvPq0c4qI7x00jTPcJAWiOph03LXzhYOrtfj4BHIQKyXJ2IJCcAQvF6SdwHnrxB2o3wxozLyjxpzUD8zPXaOOpjowZ3ANlueWPjjIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5s8y9l/61WuLN9AJNUPkonRDI8UEH3kuq9Lwgpdl+0=;
 b=mUZv/9bLSaaeamZRc+ce62vjmsKukgoDR2dbue7QvZv8IP8YvL3xlIn5y5hSJPbRJGFUImMxHuw6Q4sOeQrgO1rTaHg+lxc5RXJY4/FqnBvzelntUanKiqkrS6+g89EDXe+1GxUZ+K8p0/nhu3hhMC3LpArUWTV1nIKhjqvB0UM=
Received: from BL1PR13CA0288.namprd13.prod.outlook.com (2603:10b6:208:2bc::23)
 by IA3PR10MB8274.namprd10.prod.outlook.com (2603:10b6:208:570::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 10:46:59 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2bc:cafe::e5) by BL1PR13CA0288.outlook.office365.com
 (2603:10b6:208:2bc::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:46:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Mon, 23 Feb 2026 10:46:59 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:46:58 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:46:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:46:58 -0600
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NAkrsN644686;
	Mon, 23 Feb 2026 04:46:54 -0600
From: Aksh Garg <a-garg7@ti.com>
To: <krzysztof.kozlowski@oss.qualcomm.com>, <geert+renesas@glider.be>,
	<bjorn.andersson@oss.qualcomm.com>, <arnd@arndb.de>, <nm@ti.com>,
	<ebiggers@kernel.org>, <michal.simek@amd.com>, <luca.weiss@fairphone.com>,
	<sven@kernel.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<kuninori.morimoto.gx@renesas.com>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>,
	<danishanwar@ti.com>, <a-garg7@ti.com>
Subject: [PATCH] arm64: defconfig: Enable the Keystone PCIe host and endpoint driver
Date: Mon, 23 Feb 2026 16:16:50 +0530
Message-ID: <20260223104650.876632-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|IA3PR10MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: f3407592-eb52-4823-d862-08de72c8df14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RNaPbMFMTcb0DG6O/6TTTPLQZtXXydj24hQQeusRTftzmIxwVxMeFC4x2knY?=
 =?us-ascii?Q?6GFSAdT4WT9pKR3H2LR2HQj5kIHESRyXH5hVeqVgRDfanoi4RD8sxOF4qySE?=
 =?us-ascii?Q?gw0oQuhmV7Z3j9gwU/y8Z2rH5yf6J3YJ5/KQa3tmz8NsNSA/671j/3mXJjQB?=
 =?us-ascii?Q?uhITWmt5/nL2xgeD0XgFcbLTo5z/IFDGRWrcLbrSrNHa6EOjS67z3c8KJTMs?=
 =?us-ascii?Q?0sP/lTyM8KzcmvG9MxBFWfooys1+r/H+p9e7DE7biIW2eNX0YxjIwUuMVh9K?=
 =?us-ascii?Q?8TH/jTnOSdxgbwCOCgU5nuSSyofRZitBw3SmDgtXJx7Wt8PGsVydBLoM+748?=
 =?us-ascii?Q?jwfvRMXwD+a+NxyujTlA7zXfszgmQU8ySqvqkGyjzzlGWadgGtzSP6soxOcX?=
 =?us-ascii?Q?xFtM8W8vobWYpntyUnlXNpZDBvBRBDODJfvHOgHtyy0i3TYa2xa3HMoC9gJv?=
 =?us-ascii?Q?iwdWOZJESWl8+XbvL0pC6GxvrKCiQk1rzxweXlGw2Rs0KT4gM5y6OUXFeIcB?=
 =?us-ascii?Q?Rkw/nXkXsZ4GHR/UGlS6FSNIvDjvVi3TydbfGzCzNqWKPJ1FNdqwmN5pC9ww?=
 =?us-ascii?Q?/UX+UG+HnemQ1tn6tP+2vfB1q1Rn5+4fH2VRbwBU4TCuqyifK84KiNWR3+CG?=
 =?us-ascii?Q?At8I6PgB6IsN0nmv3p91UTPq5hYepy9VQ6qn1vW2niumXWMb/utlArl1iKz8?=
 =?us-ascii?Q?5dsWU1zerZHs0fwT9HBP/bseEcNkTrwmmu8lpL1cGahJCTR+HEwFVltzTvcm?=
 =?us-ascii?Q?4hsZ3DHFGFj2LdyyP1bNhN+s9X9TCndcNpL9Omb1L/VHKQw5cHKss6ly4rD2?=
 =?us-ascii?Q?mNi5mxG2aWy9glVC5pWvy+TfI91jMmn3D2XjdpYmDLGSDY6n6gcQu/wpvXnc?=
 =?us-ascii?Q?om/Q9AcbmAc4CPSbWOLk66iyhVokq6cX3vcdLm+yNkAovP5hiD7K7iGICUGP?=
 =?us-ascii?Q?TFHdMFWYxHoGKrTnBHLh79nLcbSlacadEoNW8KN88WQsPmMs8sxG4yOw05cI?=
 =?us-ascii?Q?NKg6uBa/+qBr4RAxZ6m7blDjCru22TpNapuMcbiLeA1vtDnEqzh02/d/5/xc?=
 =?us-ascii?Q?P3Fv8RTErA7nl9sm5//lAQQoLp1MlAEa6yf5COfvjlPZC7pbdxjCaAEwHqxm?=
 =?us-ascii?Q?xgH/G1N3hs6QO44I25WdaVDPlCp3u2LF2n3WNS6b+j1pON5pHkY9USKDs86w?=
 =?us-ascii?Q?1BjZz9i2cJnK+Pw6q/n9ei/RS8DIEsTk9pebImyjow1qDH9T/hjJpZMQgSdQ?=
 =?us-ascii?Q?5f7QtZEnOP85caObbcpOhT99ivdC6jvvVupmOJQsP9itzfLQqFVpkk4jSs73?=
 =?us-ascii?Q?G2A2NuuCPougkWZFsY8ls/N4WTRvEKsn5UscftrIgUAeCbf7pnR1wacuAWwY?=
 =?us-ascii?Q?R3KF3T36A3eWY+ABK+WD2wVg3TfI92mX7KRX+widR3hNimNfr+8g9xg7xqUZ?=
 =?us-ascii?Q?Jo58F7c00VVP6ZpwdDRwNzV4EL/5QdRDN8d7c2+TNUyLt5B5MyP5wIbnCUvj?=
 =?us-ascii?Q?mvvC19xZp3ZEzrRuoDQIypHr2D0pp3DHcKjoBNGKgejBoSIouxnlrpqURg08?=
 =?us-ascii?Q?HAcod96o8dzgaCLBf+Yyw9NU9bixh8HR3KDtjMe1h5qfXupHVcXDDRFPWwDm?=
 =?us-ascii?Q?UfjDBtwNFBJj5N/uMODFpsFlsyHN9iHptlIA9mNG8Y5m9Lw1Sw45TNkoclHn?=
 =?us-ascii?Q?Dp2BQeLgKDBYqT0+aZSouz03J9s=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jINWsogrWpuixUY0K6izABIeno9yMqCUSloLOTQDYRSIfPKTma94nPCRe+i0u3yE5BjFZmZ6g8tQbpsQ+pTUQp+UeVZl/pWERLDVnN6HUsBm+4imuBveE2n5cxCEqMnWzM7UOkx2lV3Z0FEMA+paWwfdVm/ABlbrOBS2rGyc1SSNhYt5fV4iFIQoDiul8Xoz49uC+wAXFE7h6KTg0l029aofAWJkCCS9BOdIHTme4v/nYsEyBcCFScwI1N7ddhbAtLVmNCtKC9DIoJti0olKcTjOG8VL/wT22/GpenwRDM8AGaPMiMAfV5iVPD8ymzhX8FleOvymIcNjN4rYaW6ISaTzINNaZQlqQx6uQEsnIgIliahZbnbz5OcZdQS46xm4xMZ1dmcoBeqmda4K6FYg0/6nHlVhl3FhF7AST/mrArYe8abozDSSIAL+YMkjP/1E
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:46:59.3765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3407592-eb52-4823-d862-08de72c8df14
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_024703_706617_A7B03A18 
X-CRM114-Status: UNSURE (   7.57  )
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

Enable the PCIe Glue driver for Host and Endpoint mode of operation of
the Designware PCIe controller in the Texas Instruments AM65 SoC.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 103f4763b88f..81bc9882afee 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -229,6 +229,8 @@ CONFIG_PCIE_BRCMSTB=m
 CONFIG_PCI_HOST_THUNDER_PEM=y
 CONFIG_PCI_HOST_THUNDER_ECAM=y
 CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCI_KEYSTONE_HOST=m
+CONFIG_PCI_KEYSTONE_EP=m
 CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
-- 
2.34.1


