Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1738ACA6009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 23:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5dyDI4MnqvkKg+OhKWMFhFTzM4fD8p/xguEzXihwSc=; b=UnlX2LfHVWGxUJwOxOOP2Jw6Ni
	lp8a56NhStVSWgsCiVBS489TIYYkuV5u5ka5gAPLTSKPSOtZc6JfUc8hYSqzvfzJf/8sDRlRrPBUQ
	JSBdIhsck8uKgbtxkm4A9nc9VY1IojrUU1D99xOuFLycbeABiQtvqCCe5K6oeV2sAXTIyHDvq3uU2
	5qf5s/+sBahsQm9o21BnuJRCieayp9FwvwYsLxQ7UdYnlrWK3P+PKkBwYA3gp9QKhCL7e3kaMLBrV
	dK8MxGAFmxbLNUSkr11aaRsV3V/uHF7yNPV/rxfxVp+Ef8hp8dXDKoYf7fH9zu4j6U+4SKjUQl4ge
	i/q7oPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbUY-00000003In2-3ipz;
	Wed, 07 Oct 2026 23:56:10 +0000
Received: from mail-northcentralusazon11013036.outbound.protection.outlook.com ([40.107.201.36] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbUW-00000003ImP-28Y4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 23:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMAiXJGDe37gNHganGJpHwyFaHh6RWj66p/L/6N41W/jw38PJW8jv/r7qaXM5OY3yLSfM3l1eJJMwdFcMqlGHBfPFRIJWdBL4D5O0k7057mumxXhF+2U+y5iWOdo4u9nXVtIQZ02GP8/lnWuJNkYMGWnmJxpZ80FfXB7VhfJhSTBpSRXBj6vbdABjwV/Q/685o2f/vUAZSv52AtXJM5RxLYEnFSrEd9CwG3wPLD5f/FvD6oVy6piziaYuCoAilS4AbwzahOmcTZqRXe8txdzc3fPW6FX4dpLHfig8HSO2tVrloJ1kuOHlhjdWpUwRXn9OWpFkeAjjiTxPjfrHfWWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5dyDI4MnqvkKg+OhKWMFhFTzM4fD8p/xguEzXihwSc=;
 b=lAlEZVVm9WQH10CUJi3k/sgXX6mEVZfvlrKCumDx3jaxAVxnK2wm5xB/Iwg1egSdv+V2PIViGqBNqud7+V631RDxqnCZXzTTuorDkSmCqBbA5y+IfGgiFCZDmDgRjUMCKMVjDofxws5zAuml23YmLcv4XpowtlE6QJxNPvO6FsvmNDSkkgApojgAAcfKiZvs8iOWXkAgEuPL79hDAmpuClO3n1X0t7jpKpyg5uR0Ra6AtjdyriRKjuInxqP0HFEt07+tG27mnBGFaO1JesKkZ8djtWTg8lFconniJvcqjmhWxoxthvD0vIlryBNS2UDp5vNqCdaxrxCRQUm/muF7aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5dyDI4MnqvkKg+OhKWMFhFTzM4fD8p/xguEzXihwSc=;
 b=k+QMJ/5zKJ6CyEut3ZbUYd2p0lDiOzGV8rT61RocKF+LuHsD5AB07nFcX8AOZV7RFEG3t+BWsycrqB8N+K29jIJiQb2v+sKS1hcvLDT19F8VeCcjl2EAZRtoQMKtGb3PuWD5wHA6gtpPPSuIGfHoP7si/nBrFXQQLPtHow7l5FMM3fDSfGRhz4STSpdn1vylYGavoYdcn5J2HCsM+0vOqZOMotuXWR111P+3DsjCQLE1YtOWdrcNLymMYieywGbESD28G9u8alJpcfq4IvGQzsuh0XDKL1gllv+H79hSlagHCde79aJUglwc+nWs8xKRffa8yYCni/V0dMxM99Eg4Q==
Received: from CH2PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:52::15)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 23:55:59 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::a8) by CH2PR04CA0005.outlook.office365.com
 (2603:10b6:610:52::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 23:55:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 23:55:59 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 16:55:42 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 16:55:42 -0700
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 16:55:40 -0700
Date: Wed, 7 Oct 2026 16:55:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel (AMD)" <joro@8bytes.org>, Jean-Philippe Brucker <jpb@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Peng Fan
	<peng.fan@nxp.com>
Subject: Re: [PATCH RFC v5 3/6] iommu/arm-smmu-v3: Delay stream allocation to
 inside the mutex
Message-ID: <asbb+ffdovx+q6Rd@nvidia.com>
References: <20261006-smmu-shared-sid-v5-0-169a59c671d3@nxp.com>
 <20261006-smmu-shared-sid-v5-3-169a59c671d3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261006-smmu-shared-sid-v5-3-169a59c671d3@nxp.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|CY5PR12MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 138d88ba-2e69-4ec3-d880-08df24ce8928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|1800799024|36860700016|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: IemfLYRC98xVGG+bW75Kt6zYQWq7QXx1IF4GbNJV/aWV/Nd5IdgFQjgK+vTDb5EiAaNPhJ/S1UhAEeD2IE1+o7h2M5aEDAW5fVfh0R8JNFFZnBNYvqAfjNSn0lyn2IZwHBfLIcQ7G1uYXJsFSPrNdelEx76czYm/Iqkz/N8HiQQdunqRq+oM3nSOBSBt/i/l2Yyro2ow7Wt4d6IJHsCJ/hXH/1lFdJnoBP1uiSTIeowPL6Sc1Km5e101QsE/X/9xZ8TO4UP7fJ5YIkRHgO0ZWuPtbhVDSsZw/qGExZlCnGQdN8oTZ2SfxLTbX2CI/f8Ub2A8bp9WsUNtTNDI77StM9Y51DikTM6UXuGKhn39tvwE13tQpwwc8qPRKBFzx6FXURjGDHp9ZB9qEpJhngMyB1lfism1AH6Pe5/t2t4NliIcoJSh/BwpNqwSbqvuH2k+veQUGY7RdsQvpLh/roG+ilp9CgtSY7PeJL4RGPTyIZ9YnzQQE/vFUPZ4JDrIiwc+CIDeA4CeC7JH1GDPqYW139aGhd/S+aAET2tlkmYJhHNJQOvO5iqiIaYOuPYM0nn4fJxfEwYP3rG6A9BnuKgfBeUu+ISuR2BG1mOnK6z0TVbuZ8kH77Sxn0Vnkewh1bQlgnm+ZxjL4doSmBac+KoO70oktffZTSjbwxAInqOvt5yAPHJzVxasSfogz+8Idh3YFXx/JdTWY+KHmRGxQdopvg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UsVT06X4YM+gUvEPq+y5ZQ3a2g6WCnzerQC0+ezEUBwNQbbOUaorS+qa5LgiQNB7xwxqwzoPB8Yfbbvt4evfeG0hvIf9oQ7NjPymHlSlNLV7k7KMwrwHXyiWCG62H3IEHvoXzhgpFfKv3CEBueatJdEmy5Qq78ldZFY3vvCku5yV2EgkQEYfR3fUFzdL03i6P1d0fvES8IHSAYOe1tGOv1OFBU+C3pCe4vyatgmbFiq+a25iQkBeT1mbR4ylsJxuXOGHHlct1bxI5jxeShlmAxX7M8+BqrmLbd3zbh12dvL/qST9L6H4VMNSBuh0w220u28/dscY0qt7TBZAFMJl8VAm2Zu2x1MS8Xavxp3YS4taSwdYk2e3h77tpqAbBcKQ9O3pGMfZgfzeZ/Ys6QFkZiiuVugylmMYh0C6mzxhoDLsZOUHkGdUUfXiS6PsqRU5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 23:55:59.1275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 138d88ba-2e69-4ec3-d880-08df24ce8928
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_165608_576249_3B5E1299 
X-CRM114-Status: GOOD (  15.55  )
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

On Tue, Oct 06, 2026 at 08:19:09PM +0800, Peng Fan (OSS) wrote:
> @@ -4110,52 +4110,29 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
[...]
> -		/* Insert into SID tree */
> -		existing = rb_find_add(&new_stream->node, &smmu->streams,
> -				       arm_smmu_streams_cmp_node);
> +		existing = rb_find(&sid, &smmu->streams,
> +				   arm_smmu_streams_cmp_key);
>  		if (existing) {
>  			struct arm_smmu_master *existing_master =
>  				rb_entry(existing, struct arm_smmu_stream, node)
>  					->master;
>  
>  			/* Bridged PCI devices may end up with duplicated IDs */
> -			if (existing_master == master)
> +			if (existing_master == master) {
> +				master->streams[i] = rb_entry(existing,
> +					struct arm_smmu_stream, node);

This can be cleaned a bit by moving the arm_smmu_find_stream()
from PATCH-4 to this patch.

>  	if (ret) {
> -		for (i--; i >= 0; i--)
> -			if (!RB_EMPTY_NODE(&master->streams[i]->node))
> -				rb_erase(&master->streams[i]->node,
> -					 &smmu->streams);
> +		for (i--; i >= 0; i--) {
> +			int j;
> +
> +			if (!master->streams[i])
> +				continue;
> +			/* Skip duplicated SID pointers already freed */
> +			for (j = 0; j < i; j++)
> +				if (master->streams[j] == master->streams[i])
> +					break;
> +			if (j < i)
> +				continue;
> +			rb_erase(&master->streams[i]->node, &smmu->streams);
> +			kfree(master->streams[i]);
> +		}

Add a helper to share with arm_smmu_remove_master():

static void arm_smmu_free_master_streams(struct arm_smmu_master *master)
{
	struct arm_smmu_device *smmu = master->smmu;
	int i;

	lockdep_assert_held(&smmu->streams_mutex);

	for (i = 0; i < master->num_streams; i++) {
		int j;

		if (!master->streams[i])
			continue;
		/* Skip duplicated SID pointers already freed */
		for (j = 0; j < i; j++)
			if (master->streams[j] == master->streams[i])
				break;
		if (j < i)
			continue;
		rb_erase(&master->streams[i]->node, &smmu->streams);
		kfree(master->streams[i]);
	}
}

Nicolin

