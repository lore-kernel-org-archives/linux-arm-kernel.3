Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 23:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPzJYV4MenTb6H58/PRwldHbGmCjqD0WywXAdTUmfOY=; b=2DjSn+fXbfoa6ANIb87lmswnl/
	CV7xVocGBpy/0pKGf4g2IRqmU+f2REvzs8BOL/yegZImADKP0Feb8+WHTFlF+WORz7Dtqt3WS+S3+
	6+kQJK7txqjU3OI8yJCBGHvKWV+HzQlrNZSBFNtOFvlNVAMcLfkojo0PYhZqjAwi2B9PumleCAois
	EBPs2w9GzeuN3plZojUloCyl0JbJW+QJinawkzVTvVMIYaQhX4UmOD6mo7tH3Ac0zaonAJG6ZnVWX
	bYVyrZv0iNZUHAZFR8KGTexUX3HwefraRqo7m0rmU/S3O1AknOZoIn5liWRDxb1tTlWH39xqMSvhK
	GtS7HaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whF6U-0000000G0cd-1VxA;
	Tue, 07 Jul 2026 23:21:26 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whF6R-0000000G0cE-1n5c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 23:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwQAtDmS37WMbERAjxGEN2N3r4dCAFS1jdd0PkZcjBfOxJAZUo2J/0upU610js4NpRwQkGLdnOkMNApIHZtHJTuMjGtoOTLIZviTB0U99K5C6qDh2v0EViykQ4UfUxTpylA/cS89fxcXfyqU+ty0eSWr27RrCPBmoIrEfvAbNVDoKmYManTolMGsoqRtxYu19T7ElsJi55wKQS42Q6nbZ3eRWTihdLkawZFOxMFBIl5aNMh+iJcRPtTkA0mjVUcfWpLDTVKQS+LB5ek37xaXdbT7UyxfoZT7Fg16oy8x10ZbyoV/IlQSsiVOTf5BXPx6xl6H1ImSyRsOPFLVBXYKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPzJYV4MenTb6H58/PRwldHbGmCjqD0WywXAdTUmfOY=;
 b=V5c1VKZS5veSeCDnKSaTOSmZaYXkLil7tMYVsDNF4NkTzn9UVoeCLyQwmvorl6rH4SDYZVxYdKb70fezBk7/rIg8y+DxBb8UiCGYM7th99dL1Y/SdA6XvgCJsNRREnYvwcQwlHYfFV8YbtgpZNWHIM/Q8DEFuBgFKJtylfrz4/E5y2rbyG1QThBndZPDxZ1d252ToS6vofA/X6lflN+ZlyrKslpMqhGNtNQ/JERccrK95KcHKg5rRTn4VgVmE2NcBupxmyU7OHZm3egzS0LIbKM7d8ZrVvxYDEyj5hC/mSOQX3JEUD797FDRczb7MScQKFUxQyJAU+1RxJ+14iIakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPzJYV4MenTb6H58/PRwldHbGmCjqD0WywXAdTUmfOY=;
 b=MJVXSIITLhplcXw9okkiGpDZ6N0O9CbbM5iGis8rTSF5xp86Fx6Q1UgyW61dPd9bdVqkaesKBz1GmJvpoTAaGE3To/sL3Fb5ncXuWQgJbuHIwHSefAyN4bg5vMU8nX+NWQ0le5vJr/lVXDsmXxIJCu7KRqwZXpyeu2RN2yxqieLJQJ7GXSzUm3rSHNTV+YOViWic4WWUYQiAshX40gKB4KIztxo1hf/jAl8tkIgKKziBChC/exinQZqRdsm68iOo4Su0rjoO8B6x9nBlN/ujmk38oFOOm6fHbxSgRBKvP4sLokdyZuJjaiq4kvzgnLFJ+4aR7+zji1tjzukTzyonCQ==
Received: from MN0P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::17)
 by DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 23:21:15 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::1f) by MN0P223CA0028.outlook.office365.com
 (2603:10b6:208:52b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 23:21:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 23:21:15 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 7 Jul
 2026 16:21:00 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Jul 2026 16:21:00 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Jul 2026 16:20:59 -0700
Date: Tue, 7 Jul 2026 16:20:58 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, "Pranjal
 Shrivastava" <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 8/8] iommu/arm-smmu-v3: Support the DS expansion of
 RIL's SCALE
Message-ID: <ak2J2gLgXD7WJbfv@Asurada-Nvidia>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <8-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DS0PR12MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 619bb7ab-4b58-4358-2560-08dedc7e7117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|36860700016|1800799024|82310400026|56012099006|4143699003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: ih6Fzo+rB/u286eW1HPPQxxxaN9KxuB0UY+LwuDm0kcaKB818hRmmV6VjFMbYT/fJfJATY+fK0dIXrbQh0q8MiFrP2pyu3zxdNo7ta/CqIKnlG4X+yMhMIRwLpA/uirsjSOsPa1eDgKFaaYRYUvj21QaTpuIcN3gqYVTnwaA2rQvqBeoicENrfw+eQFHvNZOh138l5IYZzcHkpXfZeA1MEhoIKFSU3qCJEk3Gk8e9kFUdl/o7cwR0+P57q67sbxOWiEepyJTEqlnm2lWp+KD0cfxgcTQfljfRwdI87OlqOE3AnmxlGuBd6T9MMaWPf853Tu/Sl+I/jN1cOaQcup+vH8yI54dAvBtNGu5OS1/t3axvExSBtkrFGfmg76rl23OZokLKCdn4Ikgi/512ieqIwBwKhdjm01PNVoiU2NlRsD0AWle9MpKcFl6X5lHJwWv7I3OtX6Uq05i7tCJXwMQdbdJgKkWQJy1FdKREST6YaBWnMI89dXZrcavumlt4hgfxN+MW+FJcsz0ZjaM1kdweDcmiR/3rb/x13vqrPi4/ZMP6K65F+BxCaaEI3Sfcsy3sdo9gEZiDHJTuJNM2JSoBdLgzoApDJq9ekYjDg8Ckbn6bzDpCBcGApgUlHFlE0jHySE7PuzfsbNey17IRChRBxsCDJGp294tZxJ7X68+CjYJWGJo5cRIhI5iXgiSyoLOk8Jdp9H+ZcSYUSfKNSWK0A==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(36860700016)(1800799024)(82310400026)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M1alDuiBNP0VcOnGIsTEwiXua/JVcVGv8NLdnCJE6q9kc/0OakLiEiwIcEksTeZFOamW73/6c2pjrXp7lK7Y6whcyQgOIj9mh4EDCEaQs7bWRAcQlc9ZM1vJNvL433mYGyAbF9bC9YhlZscSkRHiuAOXY+GZKKHuTGhqQSLjrTs/SylcDeakegbqGFkqZaXPIUceoAHodSSJwTd/vx0koM3sUyheD+uniBl6VP05grDdiH0mVOR9WY0ji58IsL27fhV5lbfKxqUE/6ZeDbevkNSAZDPp+9OHT8CiZ2HGVqERFQ5+GMqPCGwDqzCvaq9Ye7lRYdFVeQXL2AuQvws0lQt81UfUx9XD7d7NHwg8hGqDnGA3X6wdNxFYM2dXoC5Q8I3rZ4RL9fcZkrjdqO46lh1CJr4y/zmSpp3b/ZfobQr4sMued4WYoK0MSa56OJhw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 23:21:15.2632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 619bb7ab-4b58-4358-2560-08dedc7e7117
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_162123_493225_6C9E3396 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Jul 06, 2026 at 01:26:45PM -0300, Jason Gunthorpe wrote:
> If DS is supported then SCALE can go up to 39. Detect the IDR and compute
> a scale max that is compatible for the entire invs list.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

> @@ -5235,6 +5242,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	/* Maximum number of outstanding stalls */
>  	smmu->evtq.max_stalls = FIELD_GET(IDR5_STALL_MAX, reg);
>  
> +	if (reg & IDR5_DS)
> +		smmu->features |= ARM_SMMU_FEAT_DS;
> +

Just a note here:

This somehow conflicts with my iommufd_invalidation_loop series
where we sanitize user space commands, because the driver would
support IDR5.DS. So, one of the series would need a rebase.

Nicolin

