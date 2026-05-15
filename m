Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE75CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIHeYRIxnN+foIbgDfdSp7j/A1NQWc9zd8vydpkOjAk=; b=aDlh+6OnBwQIIhM81Vlhnz5Z60
	Brg8mbDwe5NtY5cc45HL7jugWvGtvhwIo9Cu5hj4SvwZxPvxSHvmmIFIP6YWLiiBPpXX3KjUxmp8s
	jHO4oQsqfsnrNeT6Og/RhqABtS7BfEEfmrc2+syqmLNSTjVUTwTUmf4Nx8Sl8i/XITtguU6D3RCuV
	J9/h9sIe202Bn1d/QQ3uJ7Tcse1MPOmnGwq2P8eRY5SpijKM+1qY+G/uD4XZ27mAwSWnX8NTlFqNu
	Z3W5NE6zvuZF7e8eCgkCK9v6GXy3pEqffCb/SaIGuZ/I1mz/kVR7ucjprGHJ25/tn+b1wT5wd4hpe
	cR1C7NQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzCg-00000009NgW-2CZC;
	Fri, 15 May 2026 20:32:14 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzCd-00000009Nfs-2MMY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPskRSBx/rh5U7USKi1jmVTOmbW4cMPPaYr5p5KYiGNFmtOUjBkENKmWoxKEAv7PtynJnSL7pt0fLBBLzT5PLTfq+ldOAQP/8ZMglAIBoRP8WL+XQgOloFd8BGlbDu67yi3T+UdrJk2crPLIeAh6ndvQ0lfg02RYDxfw/R3VbETi9qAisfbPmAKU5/VkbyZ3bh3Gf4LRXGG3ndLokP6dsEMKodoT/gcztYTawPMyjM2ReUpV+sZu37tLFA33+mOlOBedm+Cj29DxgIXGnssuehmkyjAy4dZhQB9NjK7NFKrBiN4eJSgOFKy3NWXT+1rb5N3XnVI0W5JoOmqjpWfwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIHeYRIxnN+foIbgDfdSp7j/A1NQWc9zd8vydpkOjAk=;
 b=mqBf9yC1R9TbiAVSHaqiTcBlAYMEYrXAGxvp+E4yaR38RAE1yV+rcBxJNL2B/AP/0YzfhK3eVJqc8oUOJeKFvboVDMJjh/OzJJH2clofAL5kEO9Ag6EwaEJoXKjGyadbxOMF74Fb9LhNu8ubhoVSB83DqCCGJZZMFPsVP+9BEAQMrEzih55JaZ33K2eAfbuEn4PnIjJNBXhZexq14ANERiKp7RVmjDws14EiYKBXSGD4FWWf6yCUfoPsMyZMRxISf+deCajPXZxIXGyrUzJ4WwT4nS232b57kWDVuz98xti63WZJcvVrndog6nSqQvRw42yCg6IEwIz60s0iAWQ0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIHeYRIxnN+foIbgDfdSp7j/A1NQWc9zd8vydpkOjAk=;
 b=Yqc2W+MK/3ZZgWxTLbeZ6U7NqwBJo4gw81GfmXyxSZRhedoNh4XnbEPW64Jur066acdpAwoKkzTLjcVnFc4h+EvrvAQ/FnCtbThitnEjKBGM1kSzrPIfs2p2KMjq70+wpjSTzQXuE9XvKQrmpJCxVdkgMSEA5fXNU5FOY8W6nYIy+H/LiojSfYU6GNjWvtDoh19WihBK21p+1MkJqQo2pEH+s2oJTZHekEBqIse0TPBN7/HW1Loyx7YcG2Vborn7lScSmaj9fK1m7WMJRYarL7r9DrflHsyY93GOVVU48LUAUhZGp4QEShudZHpe1eT2vsy2aEAyAG+Rbw0/bOIdug==
Received: from BY1P220CA0048.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::6)
 by DS5PPF7671D5CC0.namprd12.prod.outlook.com (2603:10b6:f:fc00::653) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 20:32:01 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::2a) by BY1P220CA0048.outlook.office365.com
 (2603:10b6:a03:59e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Fri,
 15 May 2026 20:32:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 20:32:00 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 15 May
 2026 13:31:39 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 15 May
 2026 13:31:38 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 15 May 2026 13:31:37 -0700
Date: Fri, 15 May 2026 13:31:36 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, Jonathan Hunter <jonathanh@nvidia.com>, "Joerg
 Roedel" <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, "Will
 Deacon" <will@kernel.org>, David Matlack <dmatlack@google.com>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, Pranjal
 Shrivastava <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 2/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in
 cmdq selection functions
Message-ID: <ageCqIQs1cMbZqHd@Asurada-Nvidia>
References: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
 <2-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|DS5PPF7671D5CC0:EE_
X-MS-Office365-Filtering-Correlation-Id: eadcdd22-f252-4d78-723c-08deb2c1047a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|18002099003|22082099003|11063799003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info: VY6WzdyQrOG8xvkt/m+/sDupL3i7853DK8P0MRdNQhhXiLm4hCZaLssdy+qQn923OVphB5dSaUE26fUnFp1FT5MNYVR1t+wgTz8EzI6/5oGtSQkWlBo/JcDOnsfS85kqqVnXdT15xyw4jl9skYcY2lAaoVOvTXDEU6VwyLbuGxMCY6Hx36pkJ/xy+oAJQCNrfNcG37lBPCDkJ4jeNUXJnpcOoGGBgOGMN1lGjqWzWz3Zt0D+sQu0nYt+aSF+zM9N34+Oyy8JliN5vkPl4fnlekIXvlRo1UGBDoKCjkh/TZFuLlSgGhcyxTjgS0M9glnj4wfl0lJM2Eh9QlIAXI2KyVU5Bkszq16VkKTvNkZVgVEXRQ6FLz5sSci30/lfCu4dqMtj6fi0bB+2hIzZUrB3mLN48pFE1lF9bvMchR7+eF49Xuk6zSSdiElOAgfemMj3XqoAMWHWsoVDzqhTkFVbTgGjLqlYF2T1t9TOae1PwkcCpxB7kE+obSeV0Cm4DWP1OhF93Zx1QITM/ljHzExrPfYuvz8DECjVCTumfLIv98PLJxfsVHMFrssa8ZxO1McSjWvL6+rSjYgJLmaIRYM3oczZd2EwmgRKdjP/pJXKvq6QNXphViL7P+1h05eRRBAE6jwvFj2s+uju0g5ynCCFtHzTEf6fr8esf3Evo/MRUZjFrODxydKs8YKDWNQht4N6Glv4qD0j6sDQq5y754F/Inv6iw6UE/gte3DmUJOJsLA=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(18002099003)(22082099003)(11063799003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3sSjJHb/gb/1Q78UD2kt4+ymDgRtrg8QfTl330o+r/8N2dNK8AHlbIf3NJljAQy6Uultmhe+LJUoNApSUTtEmVp6AMhVABHFaXTooHC3ELyTtNlf1cruiQbym4AzFmrGbIFGgMJcX42qAQwvY9ItpQFBQneSqrSt7QChdx961S2rEu+a7gdj0Y38wqsIehFGUb+uLfSEyhpJvCCSiQXY1LWOWc2cXeHkoK3WyP15BwlnVbMBhKGppuD/1eJO+RJOeB4H0TtY/7lJaB7pBB8wH/tdn0DAkidR03YB0WsmgBglvwfhIoRQoDDt4g//+005YnBKaW4YFro7Y8gjIjT/PFEpkkvlzUDPUookUp6zTEUeZKaI7qe0F6A5G9ykUuLWODAVbbMAOcFagcp4u1DUsWpnCdl6VSO4EFWOLZft5rYkmv6cBd0lDsa44gfbRrMg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 20:32:00.5406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eadcdd22-f252-4d78-723c-08deb2c1047a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7671D5CC0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_133211_607567_D3B10FDE 
X-CRM114-Status: UNSURE (   8.53  )
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

On Wed, May 13, 2026 at 08:57:41PM -0300, Jason Gunthorpe wrote:
> Start removing the use of struct arm_smmu_cmdq_ent, starting at the
> lower levels of the call chain. Change the functions that determine what
> cmdq to issue the batch to into using struct arm_smmu_cmd directly.
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Pranjal Shrivastava <praan@google.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

