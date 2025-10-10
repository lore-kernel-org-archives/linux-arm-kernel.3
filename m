Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD98CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UMK01rFYvhc5A/Wqv63OVjtM8Z220x2eX+g0MCjzLR0=; b=Vlxf5onz34gZVT73EXwFNJkdYU
	z5xrut6o4mAw1FOwNbzSkqCTIk+szup8skMAJ8ZNUGUnZzI5Rold7gRiu/NQntnrGsnzpDYkj3rR6
	pt3qqyRy8DszlQXlUhNko22KERqLlGapLOOEDBuLiEPPqsEgKoCyuFbQUifbVnU34h5NEUZKoP40x
	i0MN+eKxzjPseCuzFtVITAKgzBHvi2lt6mAyD5j/O9vruJTfZ7ZN59MqLH3ECKF2lV2vNgDCYYAnv
	SI+NYBWDD8G6VIri48asNjWQEI39AniPLlDRCYdU1XmdDn6VY5cnUIgK7/x1kxwsplS12LSPBbCiI
	/ofGNEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AUQ-00000008HAC-47JV;
	Fri, 10 Oct 2025 10:36:46 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AUO-00000008H8d-3duz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 10:36:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntD3QoIn5X77soT1a57IG5/46uqQamHuJAJ8gbJu2n1y8dKNA2MRRbPBHUjiiVGDd4K0N/gl73SK79lNIYFTaqIM8lX2uklk3EZfaw+MF8bKUpIe9RLS0Yn2BK6pZHKh7tqNc5z8C6S6MN6ksQnAbGEkYh0NFeYF92ZSmweNcZ0woFNr2gHxltH5jTjLDpA6BC989PZLrgU6fiSiygl5/e9WqZ78sR8vHqOzaB22cjzhoZ12LwLEQhhjQoLBfGNcDlQDS8NMK/JufxOgnjWT/tlWvUthde0HTOL4PO1kWnoN71FqrpGJLGJMKb5akD8KrIvDePcHjF4kpY883JilvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMK01rFYvhc5A/Wqv63OVjtM8Z220x2eX+g0MCjzLR0=;
 b=IQRjLV0PR6e288YNRtSPChfkkfSq9robuS92v2/3akK9T9wlGWdyZJdhSo74fbwpFH4OFvD8+ojectj8Br+/T9+pV4gJpqVZOiiYsTnoJcyzLXQdmDE5h0JnluKKirWnkX1dAtq0o6vYQzNnM90ykWDnVFXNDe+B5ZYzzwoWUR/LxZDD+b/UBxZY1avtobbaiPsNdBi0YuGqw9cZbjpuRg+2nF5uN0gzmcHkWXDckebkczDO7W5H0iwyXurULjci97LeyRN04wTr5F4laqT4+ztGrV4sYpMzSM8xbTpdmf8RfnBivZbUq7tJQoYQ5fzFsbMGgsEMzvu+UxaKdDan8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMK01rFYvhc5A/Wqv63OVjtM8Z220x2eX+g0MCjzLR0=;
 b=OpZtvY252qlUPSOxVzMKcce14kuLYlQkayK2Mi+unZkoETxdxuz8PyIuM4Zj9TESH3Thb7fCkaExun/FIVyRpBLG331Xvd1w1PliajWLmtwR6tP/UXpShe8KdtCsobbOdI7wcTkzBdCVJIaDY3cpL1QIzjtxMv9zK0GfoZMFGIYytIWMmF9ZddvZIXxH7CD94nJIfUVchE3932g/6+zXgvABJP0OpuLK8T44NYuLiwB1gx54IRR4UpRN0ncGHj8nQo6KXcsBGL5D6+jJNavkl4YDGSdPC5uPshkwsv2rIJsKlFqQTUdAcPrufh+ZKP8j7L/Xpe0Ca7dRdVijhoUBdA==
Received: from DM6PR03CA0056.namprd03.prod.outlook.com (2603:10b6:5:100::33)
 by LV3PR12MB9213.namprd12.prod.outlook.com (2603:10b6:408:1a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 10:36:36 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::1a) by DM6PR03CA0056.outlook.office365.com
 (2603:10b6:5:100::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 10:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 10:36:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Fri, 10 Oct
 2025 03:36:17 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 03:36:17 -0700
Received: from moonraker.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 03:36:16 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Russell King <linux@armlinux.org.uk>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	"Jon Hunter" <jonathanh@nvidia.com>
Subject: [PATCH] ARM: config: Enable EXT4 for Tegra
Date: Fri, 10 Oct 2025 11:36:12 +0100
Message-ID: <20251010103613.236283-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|LV3PR12MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 572c25df-7120-4530-32bb-08de07e8e2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+LmR4sK4hfXXBXj1s2tpwl4Uk9/I37qrt2kaXbj5x1xcTgJbxSLUUttvmGk6?=
 =?us-ascii?Q?bf+VJ89gLEc+h3BsF1DQuGKL5oBqrOLeI2qSdMDW9wm8Ga2jGLND8D9axAMY?=
 =?us-ascii?Q?pIqzyMwXyekvCci6q3v6fJmwpI9UIEaXh/zFtk1q+2JhJ4cvRd+HtNGeG9CW?=
 =?us-ascii?Q?KMyesIWKbeEkzlfxsbWccFtNwq/qR/3OfbyRV8TVubeZJOhFmWp40ZODOj3T?=
 =?us-ascii?Q?B2WiC2fmKMrIaw7Q33MMHHY5V5Ost5k5l7TUrlAdA65XKjJoJxJQgUw8ZtA1?=
 =?us-ascii?Q?5HmTy7BFBORODQz9ig5xC6MKDlR9KlQ11VOHje6JEXf6UjEHwzPha8eQXzdE?=
 =?us-ascii?Q?GAexk5L5yxEWBMI0dHBytLN2FgLQM3ASFKWEyLDVze+4Tdrblcm6zd3R5fnQ?=
 =?us-ascii?Q?ZNDq05IM+SU+Za2nnMTe09sF8hanBn9J7eLk5s9+KgOqvecoGF86Ca9YEMr+?=
 =?us-ascii?Q?S/xu5QXGhleaoA50hhWTfkBB9W1IvfsrcA9se8IZZSr+wZb+SqWjVX2rjEA3?=
 =?us-ascii?Q?zfPUbbf6te8LT6f3Clv0Z7IIuXu+gP3/Bb5MF5aV+u/COcRQz9tfZD1rQ86n?=
 =?us-ascii?Q?WYCPQIg5aKAuBhNCq9NxzFrqe+tRdH8O8DsvwVirgTXEoXlAOpoSih1tj0/A?=
 =?us-ascii?Q?nzv3mps/61zWU33WQ0QpiuF5ECvPOmRT/OEtPXLehNap6ux+1kK2iIDp/7Yv?=
 =?us-ascii?Q?rKVRUlKgalTwna4D+2ZZ+xveTeb5DnFfVnKB+bIQrhQIkcQZ0iAmA1+zTDh6?=
 =?us-ascii?Q?1cDZx5B3dnV+/xl3flUTUjf5o0qtyaHSqm60rBCIkJY/bjQsNbXSuE9UvWWq?=
 =?us-ascii?Q?sg7PwK/m+X02/28NFKhVEKJWAu/6zkiTlURH0ETJmWCgcyzQbWDb468wJrcA?=
 =?us-ascii?Q?S75mREA1MIziN1ueUnPwZCwRkYD/SEur4BNW42scOcxooB12o1r86tf/pMEf?=
 =?us-ascii?Q?3Fx/HMoO8zk13bgA1ekxuEvlj3HQMcBNTBUEx5Mq94S50GOwicGwYn4XR0kZ?=
 =?us-ascii?Q?zdtzyf3OXzSUxwF5gn9j+XUR4zn7As6f+Bb6B1QA7aoDh8B0DlKqnV3erAY8?=
 =?us-ascii?Q?hc39GTr7kT4QC8coLeFKexaHqR9yU360lD7irJgf3N60BHNjrFlA5bMlsHUI?=
 =?us-ascii?Q?9eniyMYmemR+q5r5rTrhFpiXJI+z93O8BsRAzxXW83PNQwMTracr6xrefIUW?=
 =?us-ascii?Q?GP6jVdMDmheq3FryRwuMemDLDBvg4nhp5KxmMEd8UeLJ1hpT7vavU1Og1CmW?=
 =?us-ascii?Q?Lras5qebUo2PMriphPPTtWZAGEiOxWFPVBYvAhnAaJcZQSyTOx1JmZML2muI?=
 =?us-ascii?Q?RbMA8afP30pUcwtVxNgOS6zKdpjXyvwBObQgBleczF0jnkft3q1tL6fdCtyj?=
 =?us-ascii?Q?V41Pcazxqljtg2a4veIbatTgIj+Ta33Hkw98AtgN+WKh+8lUm8fSv5eC5cPu?=
 =?us-ascii?Q?z2ALO+w1G98P0L+5jFsHAVFh7LzN2RP6/neq7JDc9puBFZzb3CbkNFOcd+KM?=
 =?us-ascii?Q?8bH3EEdh8ulFIeOB2q8PWZXtxm8SXwsE8pmAq7ZkUSdbsNvlUT1v34GbTtOl?=
 =?us-ascii?Q?Pi6jt9cyl3yoP6pwqb8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:36:34.9240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 572c25df-7120-4530-32bb-08de07e8e2b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_033644_937109_1880325E 
X-CRM114-Status: GOOD (  10.38  )
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

After commit d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
was added, when using the 'tegra_defconfig' kernel configuration,
mounting an MMC device on Tegra20, Tegra30 and Tegra124 boards is
failing with "unknown filesystem type 'ext4'". Fix this by updating the
'tegra_defconfig' to use the EXT4 config options and remove the
obselete EXT2/3 options.

Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm/configs/tegra_defconfig | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index ba863b445417..ce70ff07c978 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -315,13 +315,9 @@ CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_TEGRA=y
 CONFIG_PHY_TEGRA_XUSB=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
-CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
 # CONFIG_DNOTIFY is not set
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.43.0


