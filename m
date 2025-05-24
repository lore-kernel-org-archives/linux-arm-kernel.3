Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518DDC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 03:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGeg59IbrTyhfsH7zb4ORv1bnacu9xpc+yDTvyzrzWs=; b=bTDw6xPYhTeIF1c35hvMP6STXR
	7LpF2+/phdtMtz14Kjv1OMo1aemu202bi3TrEICSPgnrDrnV9kRqgQhFbX8/3JiPgC1ZLeLq2NgnK
	NOUOr/qa8Dt+estz8syXPwD1SIZEFFJ5WYFaErjq0PS6iHZOTaEYrMItZR9jcCOl/S7/dVlpWHgB0
	+pj5skYgNQw6ezP025//9DYY1N/usWnBsKPtN6KeDDBfTU8r7/GO3V6B8F+aTjb42t3gApImgZBEy
	KKoMz2zcBBM6S7+Uera+PfK8W2eiZcdrrz6ufN0CMYig78l1oIRCMHvq8LxoJ8TyL2c4FiKvunysZ
	RB/OxnMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIfdb-00000005FtS-09DV;
	Sat, 24 May 2025 03:33:31 +0000
Received: from mail-dm6nam11on20603.outbound.protection.outlook.com ([2a01:111:f403:2415::603] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIfbM-00000005FhO-1eWg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 03:31:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quFOK4H09wvgqjt/l1/rauDylKtU7EdUASDhex/WxjY6MbZ47x1QO8ragfnxK3JvFWzPTT07Mp9FfCXlYKNBTHh6+BUunfk5q8L6pPdWy3RrCDwtHtNzUjUDTPC56UUuQfPBnerlHXXodk2GIVsqIk8YLqR/DEAoyWZSnYEF8cw67bFRttjMmIGcvLkWnifPkoOAXWNx2qRogEIOF4lQsB8bnpDwDpfIE+61Ryfjkhu8FiRpXBCWcTzq/ar3nUjFalljWNHlxjYG28eP3tQ8ohCX1DZwcNPK2boz91YG3Pjk5Qhu3asPRPL9N6BM5zS/6Jmsu2RRPrXdnrS+IoOnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGeg59IbrTyhfsH7zb4ORv1bnacu9xpc+yDTvyzrzWs=;
 b=MMi6vsXgXJFispL1Q/CeYNqzXas2cUq/U6mJ/JzV8lbawguFZjNb+33uIKiQVF1RgeymuucOZwcNEErpEpdQ2mnn7Tv+eUW2v/IILviu6CuWbh7R+wuJp1sFcm9Kzv01Su/+KB1ocL6S0SLJI5Bp3QWPSrsC1S+fql4fxGQVtJ8oA708htpzQaZtqtfESGHDa8Tu7eSk3s/HUbdtpkVAJWQsZP1VYiZ7krbRfrJdkRZimilV9oPUSQh8nRn28NcnQdtVlGUDq2DD7uYKz28eLIIU/DnAWZQcazyfpbPq7VoNnrDYG3+EhxSVv6HQqtRXk8gXkCLaZFUeBnF2HOfdaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGeg59IbrTyhfsH7zb4ORv1bnacu9xpc+yDTvyzrzWs=;
 b=d/ny2XVF59SWESwYLbdpU2pdP6XnXBslYptxALoHUl6rYokAPezu2fwSpAxNJHFQZTeaH+S5RCYsqP+9E/Nt6GRQFNgf379+x4835ZPxfZbxQAEVxZvV8Ahfp3ZnOMamAS7WIX4qssZ8tc5cvqdxjKS5Vh7qDhQ0lXsNU27F4Zdq/SafiXAu+aN6Ojx/aLFAheYxfLS5AsoR89RM/G49km/TLZZF0cB9gMFpjF8VDkIYSIHngsdAVIfpbfdBf3U62C4e70adksln9EBMlrPD8oQ1IcboxV4X1SN7juhtrwwHFeC5xSDAbQG/ew4H4Facx+h7pz1f0m5Wz3KSHuCtIQ==
Received: from MN2PR01CA0063.prod.exchangelabs.com (2603:10b6:208:23f::32) by
 DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Sat, 24 May 2025 03:30:56 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::d1) by MN2PR01CA0063.outlook.office365.com
 (2603:10b6:208:23f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Sat,
 24 May 2025 03:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Sat, 24 May 2025 03:30:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 May
 2025 20:30:38 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 23 May
 2025 20:30:38 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 23 May 2025 20:30:36 -0700
Date: Fri, 23 May 2025 20:30:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 09/29] iommufd: Do not unmap an owned iopt_area
Message-ID: <aDE9WyUT3z2+asQA@Asurada-Nvidia>
References: <cover.1747537752.git.nicolinc@nvidia.com>
 <3ddc8c678406772a8358a265912bb1c064f4c796.1747537752.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3ddc8c678406772a8358a265912bb1c064f4c796.1747537752.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e1da59-9bba-45c1-27f1-08dd9a736533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wZveVzyhpKsOHDEliWaHu5aBISUo3g/gdeFIkux98C5o9U61UEIdQg78Vz1l?=
 =?us-ascii?Q?qkrDwg6d1zwO2MbEKijw4x8yOIa1+Ti9E/Ruc+oR2vNfQ6fmEpQeCu9QpBp1?=
 =?us-ascii?Q?8i78awhmTdip05ar70erSIBuRPDcM3q0Ktygc5bOWywzM+Dc/1wC1PtXhwpz?=
 =?us-ascii?Q?vFpIOMj2LoBMnRnGJMJSBQZ7cc7tzGI0DByTYwaeLC50mWmfY/8Ih5OwpJdH?=
 =?us-ascii?Q?p98SOZcuXZpsCA05/6vVkjuns0s7WksRr+9ToTDxk1a5g6YCd4CuCSakPTr3?=
 =?us-ascii?Q?QGdrH2CfErp3xwvK3gYVHxr+s4fkjlPDvUnQVfIwCNvUeqxrwAEKLynEl34G?=
 =?us-ascii?Q?WCizktSLo01hH1PhWGgDwxpbZji41M38c8Y6CVjsZmNsy1ruz3laXCYiB+Hr?=
 =?us-ascii?Q?aEZWRfqhRNmv0iC+HY4zd/zc/4T52XF3aH22gkweKIPFk4+5QP61y1Cp2eOD?=
 =?us-ascii?Q?44UBbVZa+sFtcVghXm+obrSlRJGRqPx9brGSyUL541KspSEnF3KMM/lOLrLR?=
 =?us-ascii?Q?DqmvMUX2TSG//QSHP1fQNs28noD0K2/O9rzBFbTEg61t2xc+wjghFntaMzNT?=
 =?us-ascii?Q?y4xtWO02MK+MhVzjGYRuQ4jTlWi07TNw+EsAnz99befjLiUL6f30lKvSt//g?=
 =?us-ascii?Q?/SWPe6piHDN11fI0hSEIkAECMzRKxtZ5FjKFkVIe7eo9IyEAPqdtx8/Lilk9?=
 =?us-ascii?Q?oac+01rRDhwmxyjgaKdvBeroPaHDT8u3049iVZtVGPODTZPhXV1a5nnLsbzA?=
 =?us-ascii?Q?WCO9ZX3gL99qHem6bVUa5DSLjgnHBx8843J2eHDY94BlJ6KTVJKdCA+2Hobk?=
 =?us-ascii?Q?BpLJ6GB68eWQIMy6MnG+zgQRaTf7g1hgX/NXyIosRJqzLoTiJt6eCACNCsum?=
 =?us-ascii?Q?mIM8RQrgW8RhnsnphNwsVc/flP3zehMOORN2e/CyM0PBGOcv36EMf2e6FMko?=
 =?us-ascii?Q?+fsmSEV3sw7Bqz+zku67DdZ6PzE5FyANrMq4w2hwuH5ryaGhqHuiZV2rYZ/t?=
 =?us-ascii?Q?S0FAKD82tJtVq4dYYqlTweO8+VOXd34qoGu/tdKgygxJ5IiM1C3mJiGge/aG?=
 =?us-ascii?Q?sTbopiUfdV/n9ua5GsG21nHzCaMET3NtD73FbhhvfCxblE5mNeKoBFS6k7XP?=
 =?us-ascii?Q?tQRcGWIZOplwkcmC50S8GbI4+HZ0CZlkYXIjtM5zyjqR8XatXXNT1YmnbCCy?=
 =?us-ascii?Q?BWRjDYykjI2r91HhS0ayTs8GdcsUkOggqiAvBQ/WbecmM6iKA5moGfv06Hy7?=
 =?us-ascii?Q?dvI7C3KQnzIt4anl++xulsAysdzDROzVJE2yM36mYen6gAelXZzGdeWjI8b3?=
 =?us-ascii?Q?lDBhX1tHngOKWDHLEY7UxhkfnTG8N58KwB/k3308GdMkQcR0gZ5myvFhDmpU?=
 =?us-ascii?Q?KBFRjC16mwqcSwjeGVAF+EK16j2Wz6MXrIM50cG9+9YuRJWKcuhXoCh196kZ?=
 =?us-ascii?Q?so2DwvtuzVkqT4m0jAhJkWoyjdrqFwv/IafhmSZEnjHY42HgGmtNZZPDvQBv?=
 =?us-ascii?Q?1bbEMaXN93p9OBUS0S0P9yKY0sPiU6V/LRui?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2025 03:30:56.3886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e1da59-9bba-45c1-27f1-08dd9a736533
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_203112_428063_9B6F3A6F 
X-CRM114-Status: UNSURE (   8.86  )
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

On Sat, May 17, 2025 at 08:21:26PM -0700, Nicolin Chen wrote:
> @@ -250,6 +250,7 @@ int iopt_pages_rw_access(struct iopt_pages *pages, unsigned long start_byte,
>   */
>  struct iopt_pages_access {
>  	struct interval_tree_node node;
> +	unsigned int owners;
>  	unsigned int users;

This isn't used anywhere, and I forgot to delete.

Will drop in v6.

Thanks
Nicolin

