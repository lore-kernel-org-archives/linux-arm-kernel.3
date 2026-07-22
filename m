Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C202DC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 19:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KicxVulK3HqmHrROj2ARhu8cuKUS1FsISSK81263eY=; b=gajlZhetlXXoULBm2i4cgD6bwT
	3ivLWbk71xpR6IAlJ3W8qOfH/m4eTg7D+ZlzQ4G5aufiodNyUOoYntsLJZbeQHresQVKmp4Z6HXib
	jZduqlHgP21GbxAAKARgQ/CrBnVvBWBksY1NOymWAWIAmcIqq2Cao01vsSdFb/6xFx1gdgm6n3u2k
	ZiMIaXYfNCoypP/drCajk/SGMpGiyLPitvPdYUu/PDKKYkp7qAQS2gIq5PYxYg6YsmigCL2979CFV
	tTD+2qSdFqCdpwZ44jIhsrvjXH727L8Ezx5Ab5AV+cYcj4Y2fzXhDlA5WAFtIYQHWR/aVpsV6E8mS
	9qbU9B8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcEH-0000000CcHx-2iVe;
	Wed, 22 Jul 2026 19:03:41 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcEF-0000000CcHb-0Eml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 19:03:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wniiWiFSfBmzPCBjjUK4gKPwpePlO1avKT5jZ/tgW99kXBhvYIZQSOyZf0zbP7oWHWIbAeQgDPh4BkMNOlpweA0k9tXi8kwICLswdy2u8ngqZsz1VA13hr3ttAPW3Dhk1TLHBpFqzNkDZrZ/GdgWyNeXjFakR9/POCYLYKow/FSR8O0fwz8sq1Mrox8/x9O41ufRcCz+U8KkdTpTFBHxtilXe5BSlPEygul4WxzbVw4VMdNh5Uj2HWMdZ8f+sYT1RXO1LHvvZW8svjn1Hlub1KUT65ojj10f9xIL55GJ0meB3m/QT2OFX5BoBHUWUP+fblNnq8L9yvdA790F/aGF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KicxVulK3HqmHrROj2ARhu8cuKUS1FsISSK81263eY=;
 b=TLum72O6HvyC/AvaMi/VGj/k0wKqpJwOj/ltGTxS+5FztrNsF4oRbfrlo9ekWR0yeZFqAA22Ce35IrYNakOI3zTd3c+zxBthvZrKK+TBavL/gd51gR8MwBCCI3l/lbMQxYwVE4deyCnrg8Zu2ncPUURFKQPZKeDN+LiIesLyHAE7aPPRj+AuRebu+B4BqHZIyyoF21g7mGHy4pezcTmzF91XP/HAFRvxAsTpa0kN0JwaU0qGyTk8kDnBLP85vEIBxxKCxu4Ta2pTURd2WyUdDYhvzw5gyLEwYKX9FHvy6OF8JcFl9ulTMC/w8MebuNuIgWHUdsULVXi119S9saeeuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KicxVulK3HqmHrROj2ARhu8cuKUS1FsISSK81263eY=;
 b=UowvK/OPqtivwpD74pxtRzuRkEn6J9yibrjEeJaRzMaX4TlCct1r+ru/sSHmXopkn2mYQuLw3VbqfZ757Z70OtouxetQGJ55BkoUJ9gtVAtVyF9n33YTVmRtk4G8ruBESN2bILoOJ3AiqLPDG5BSQYnOa5DotegjzwOEiFnyg1Wc5KCkV3EfIl1MmWS2I+e93nDYxD62IBJZy23AFS8iJ/nhj/v4aYYLPo1noymkMwhKkWE7IIU1yLk5gNTRbkyLs2HMjsixGiBxe9Rm5RwMF/PYTL0Pya745t3+idnVGnViAwuFvVK3wxvY/1Wk18F0xdLWuYTULSyxr2L2d2aA+A==
Received: from SJ0PR13CA0106.namprd13.prod.outlook.com (2603:10b6:a03:2c5::21)
 by SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 19:03:28 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::8e) by SJ0PR13CA0106.outlook.office365.com
 (2603:10b6:a03:2c5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 19:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 19:03:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Jul
 2026 12:03:00 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Jul
 2026 12:03:00 -0700
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Jul 2026 12:02:59 -0700
Date: Wed, 22 Jul 2026 12:02:58 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Ashish Mhetre <amhetre@nvidia.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<iommu@lists.linux.dev>, <linux-tegra@vger.kernel.org>, Jason Gunthorpe
	<jgg@nvidia.com>
Subject: Re: [PATCH v8 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat
 workaround infrastructure
Message-ID: <amETqr7ZBtgt2DKu@nvidia.com>
References: <20260722102033.1122277-1-amhetre@nvidia.com>
 <20260722102033.1122277-3-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260722102033.1122277-3-amhetre@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f23fddd-d67c-4d7a-7140-08dee823ea18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|22082099003|18002099003|11063799006|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: v9Fjq+3Gku4JNpMuypQ9962zCf31x3T0R4Cb2MUBpGgi8zjSr1WfDLxoUjKgAqfXi8JWxo1jbhKleXf0bjdGtUZcGXg1+gEGR3yPpwgT5WjU8ajqY/lFtayoDrAt4dnqKvj5iZP+SGdvfyqSmK47bDcpdmCf1b2nznon+TFQ3T7yeK9QpBOXammnb70N9DzIOSih6igBdATpH6O/7aROq9HXvbXFRneBCeWwtqFF6GtsYNVdAwbb07tCX6Omirtmz97KxR3gbgkgM45FV+E89HDUwtnc/WF9p30HcsTij/r1KZsOp2++4wceKi4n0fCa57SMebx3bG+q9lBE034ZpHMiNmW4j9OR4g/xGcJVQEIICt7JZ++K0KE/glZNH5JeFdY9FajvMNOb4vTRuaDzrcqWqwWfexEDA1ILPLctk6pYxeR2dL40SpYuGZjSwa0ThlLltZG82CLtQpJTAnEvrOVdJ9OE5dpAO6zI6lXUtl/ezXYdo9Tyb6bo4Ro93rFeIKZAIornqX3gQRQc13HK6e+bo1t6dQGnC22870oYXJe38PtGGnkmQaFVaTuvd5OXA4HjHYbYXmNN1z9MOw2i2stAZR/t4Qrk3KooxLULjTnP1eYa4X5+ce8ol3wWkWqsUi7vwWqbhjr0Sj0Shl10j5Wn91xkQGnBkPqRH+GL/7i1JpwPQWF2tNAKXv/5L7zb+VwMeKMnk09RWpjjvfI2HA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J4Jp6cdtqM7XZx+htLaP5Juh2BvsN5SiNSbPa5/7JHRDGo8TNfaO+oNlHaheqKAx9EaWVpPt67Ro6F0srqR+85a+MdKh35LEttKWklu+Udjf+5IDvf4kEBjhdHZbm3jvCajD6vprBjKbd+UYjCf5zwqJQkGaUF4uYjUeGT8y9lCY6SvnmZw6y1tblmu43sijZOUlWUMP2uBpV2H9g07DmfYF3tyD1vdwnQiSCWFaS23rWRBYkXqVy9zBzmtGDM/20D+ZEsf+ubUmk1GhMDgLS8D1buTgjqX3cyQPibkr+ALRHq6Bp1cpfixlBmuG0Shfgfbj8RMqsqMrzudPCM5nkKFcRZhIzONges9AtoLjj9BCGVRMNhdmWrl3bryQFRR2Bj98uhFfmJEUX+gQWPqLVieksHzr0RgdOAPwtv9uRp3feqcLAXgbNz75iZewGYna
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 19:03:28.1853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f23fddd-d67c-4d7a-7140-08dee823ea18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_120339_103043_362AD414 
X-CRM114-Status: UNSURE (   9.03  )
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

On Wed, Jul 22, 2026 at 10:20:32AM +0000, Ashish Mhetre wrote:
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index c909c9a88538..9508bf50d14c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1207,10 +1207,15 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state);
>  int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  				struct arm_smmu_cmdq *cmdq,
>  				struct arm_smmu_cmd *cmds, int n,
>  				bool sync);
> +bool arm_smmu_erratum_cmd_needs_repeating(struct arm_smmu_cmd *cmd);
 
Is this needed?

Nicolin

