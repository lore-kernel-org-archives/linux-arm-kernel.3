Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B872EE6688C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jWm8IOqguoFG1louptjk3W4WD90xrzw2qWzNqJ7hK4=; b=KpF4voumZmSp1PAP7srYDg0hSf
	+bDbvsN6KXF0Em+/tlKGhKYYlX/zVTS+4g8kkvNGC4UpDISgqwMBTHyly8s2MoymGz9vXGqbjieQj
	98niFu43/JhfGbjI++jAop2TrvUXu/VaaVwUDsQJk2UhQ/zKd0n2hIXO4N0Jd6EKihkjvgQ5s4mL0
	lcIg1o1G1f5Im9JmDLMJ5mFtPim/gyYdaGYTa0vCuYcX5KCBgR/xS9pkwdRE3RToVfsVXsbi0UgQ8
	z00vDVWb8r3bqmgdHeGoRV4pinNB011yIZDxMJWkfE07S8Zo5jlQ2VtWj3w6FpP1o2S4kZv/Tv1Ll
	nBj7i3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhWo-0000000Aypo-1FUO;
	Fri, 19 Dec 2025 20:56:46 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhWm-0000000AypI-30zU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 20:56:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gx6vfcCmt6hZrumzoo5o5iKyqLi5YnwNP6mZr/r74x5QIjjrNPhwU+HkdvsH1PUb3Ac9UFQ2NFYx/OwhrbhywTsHnxuEBMKnWTfR21cGMtnaSkxgZT3p6toE5q9bnuV7xIfkY0O9k7tvdHZUw540OLoD4aBanNiAbiqyLJFexCUZ700bvKMGvGXAUaNGBuoJwea3zLJ0h6ARyzl6L4EZ0GVuReXx/mJ/xCw7JfHQttIz3JJjgLfXnr/gnVJDb0/2xX+TMrI/wRgcbllYuhyl/93jwLuH417dgi1UI0InHjjdX20B1zuu3Z/873H6mGUbbGFbVBCOW0t5lLsuUCGezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jWm8IOqguoFG1louptjk3W4WD90xrzw2qWzNqJ7hK4=;
 b=HYVjj0wRUuCh89rKmgmoGuK/MiypjqZL2HtlLMMhJ1k63mrl/2kQ4KH+sgAu9Anopcve6nsykjfXU3NeggoCw4GzFgE/X2V5nQG01WTU0KEk6wk0GwqrvPTD7s4n4kZpD+zN90ZaXe684nPsAQ6TRgb4BPhfde2JO9ch8Ujork8xceUJzpmGaGhXHG7soYa6AGK6kF2+bgo6tAkr2hgJII1x2HLzi4Oo4l3yizTJILhNK2BaDJuraJv4nSMIb8WwMTgILFnM/mtDzoqqdd7896TYDQaHDt41CizseR+w4u2CeRu+hyQPoQEOoLqO/zJIpywKbf6PFi6il620K5/1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jWm8IOqguoFG1louptjk3W4WD90xrzw2qWzNqJ7hK4=;
 b=RUvwPNw5mSbNAFaZeH+ZGoK3rw29o0gz/9419IvZWWSLZ/m9PqaxaTszYF++UlGuCXU4EeP9GckYDdwHRu4jSDgm0M/Pfwh9LVYFovN8rOM7jYDFrxSlxqn4SGj/6eEChmwz1nh+4ZIfTbGhNlLk13J7GpgMH64yLKC397+X0vnofAMH9Sr6CfH7wNTfSW/137/6mRJeZpv9nGvViafaxkl6z1hojN9YVGXVwyHRmfKuHtmYJDthofm6uglqNl1nvQrrJOS+L/3ZtEXSSq3RO+uwW1zxX/dLJMoqVQbIt1HHaGJJAvzwPezH08hM5ZFzL6gADwHSSKnXDNPdcyarlw==
Received: from SJ0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:a03:2c2::11)
 by CY8PR12MB7732.namprd12.prod.outlook.com (2603:10b6:930:87::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 20:56:32 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::96) by SJ0PR13CA0036.outlook.office365.com
 (2603:10b6:a03:2c2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Fri,
 19 Dec 2025 20:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 20:56:32 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 12:56:20 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 12:56:19 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 12:56:19 -0800
Date: Fri, 19 Dec 2025 12:56:17 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jpb@kernel.org>, <praan@google.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH v1 2/9] iommu/arm-smmu-v3: Add alloc_id/free_id functions
 to arm_smmu_invs
Message-ID: <aUW78ZV2D5aM75yN@Asurada-Nvidia>
References: <cover.1766088962.git.nicolinc@nvidia.com>
 <1541ea4a9e9c935c2f907c0c5f13a4af2bdc2114.1766088962.git.nicolinc@nvidia.com>
 <20251219170551.GF254720@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251219170551.GF254720@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|CY8PR12MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c5fef9-cbc5-4149-3d56-08de3f41172a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i8B0E7jxBTFlaTvHQkrWdDS5xTa65iFXXfcl+dGgR4EGQQohDG26d5UMxpDI?=
 =?us-ascii?Q?zjK3UR7tE3E79KjGNmQWV98JzU69/XfUYg1gQfXyWpHL+AQ4VOGw64MGoKRh?=
 =?us-ascii?Q?49Hgp1VYRIX/5z9dluJaAMf0tP+Qgt2lP5uk352hKsIahXCkZPkmUBb3x0O8?=
 =?us-ascii?Q?c+ZsQf3xf8T4Q4rsjEOuQ+IwIOeiKrrlFI2UyfIm4etTPa8EHY//g4uWhSGK?=
 =?us-ascii?Q?xN0wWz3B9Ktrc3/RZp5xoWoM1uC3yUwDGub1R40tCRB+EOYP2eX01wtLf3N6?=
 =?us-ascii?Q?BNG3FymMJN6UImkHF503Dciove59ZK000lL0xd3IqsejdelveT8lPFy6665w?=
 =?us-ascii?Q?3elS6rJnoJw1ucV1E/4GMzJ7hcsQ6hJ2omVUs8Mwp9hBwP0RLNj1Hz8zkRUl?=
 =?us-ascii?Q?iSZ+lYzwh1w+ZDjJW/6s/pav3GXDslUBOiSLT7PWWtzdrodmivOqZ9yn9T8c?=
 =?us-ascii?Q?05FVfm8SS2g0sFRCnDsoOkW3lR3SueXs3NLmjnJdcJ7XilSEhftM/1emnpgw?=
 =?us-ascii?Q?TssYQHyLeKSsw2SBl+xkH48Xh5OFLn8ud3Uxr4aLVQdoZ/EXClkDxDaSy8/7?=
 =?us-ascii?Q?N2/W0dVt3u3uvXD5HCtOiuZ4lfl9PgSqY/llOzglJjgkZovORvLkrGOL43da?=
 =?us-ascii?Q?DxPNsDISLc7eBA96UGlJc6CBPKTBzpuin9P34G5OTP3MQ9jzIiz2Xu5U2vz9?=
 =?us-ascii?Q?sD0e65sEpqp2gGUabhBOU4ndaI3h83mvXBxwfLhn4XIofRGPRXkB9PDxMRX5?=
 =?us-ascii?Q?Pd55AXhCBk1Zq/qBoa2qrJkzBSyGF/102I8tnMAg+Yr79b6G0ZJ0I7sHjGKN?=
 =?us-ascii?Q?7ZrSMYoHwlYmNQmHUCHhPKLmXP01okKhhaNHOSznKzOu8ipIPM++fB8wRbRl?=
 =?us-ascii?Q?PkSL3efA550PA7hii1kw8RxF8eT6kK8F1Eu5CQMLAjPnjIWARvFhX1pdemNd?=
 =?us-ascii?Q?hGtaEC5SQmtD9+7SpurvLyH1C11UD+e5mIx3lcOKsudXsqqjuWq4f0/N8yiy?=
 =?us-ascii?Q?FXRfHs25le1JStl6Ajm68iALhj2klg61xFxjVT6R6lAuvcb+kpu21nIcVpt4?=
 =?us-ascii?Q?dsjPCt3aS6rAw21liliUOSYOr75O65Ithq+S6uQz+8qdLyPROsb8c8W7bTR9?=
 =?us-ascii?Q?fogy/MIIAExgwK6DgtDgZzEamP0+xev5QFf+MmcsWfDyhAYy0XG1+kTpU2pa?=
 =?us-ascii?Q?8HjOAdJRihUI52EbXCofXauJ2qDbylcZzWdxQyRHu+elJCYt3VCXrVps6r1s?=
 =?us-ascii?Q?XdDWTRS9H59XXB0coPd4oO12ZvfDMdOilaWoKNOKAMOcxq70MogzNx5+2kJ5?=
 =?us-ascii?Q?a/KprlzHUnEIOXUpOQi56xl+/zXTe7i+Y7++d+act8nuYO1138Fv6smBHdRd?=
 =?us-ascii?Q?e1LUPiCgj9JMF1XxGhSo+gMixymNIM5s8rdC8VtlLU9asEqJM858w45AuIiy?=
 =?us-ascii?Q?ub30rpUyZLBm67xGZlK2Buud8mkoXkHclnt9fvcqcdSqt54A2hbbkyJFU7uo?=
 =?us-ascii?Q?8ZgKlhXfOxr0u5zAcZmuI048ETby6ARC8Py/2mLyzG/BV/DVxeJSq3RjjQ8M?=
 =?us-ascii?Q?Azqz6DZxpTNv3M55Cao=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:56:32.6825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c5fef9-cbc5-4149-3d56-08de3f41172a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_125644_755970_2E0755F9 
X-CRM114-Status: GOOD (  17.99  )
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

On Fri, Dec 19, 2025 at 01:05:51PM -0400, Jason Gunthorpe wrote:
> On Thu, Dec 18, 2025 at 12:26:48PM -0800, Nicolin Chen wrote:
> > @@ -720,6 +723,9 @@ struct arm_smmu_invs {
> >  	rwlock_t rwlock;
> >  	bool has_ats;
> >  	struct rcu_head rcu;
> > +	struct arm_smmu_domain *smmu_domain;
> > +	int (*alloc_id)(struct arm_smmu_inv *inv, void *data);
> > +	void (*free_id)(struct arm_smmu_inv *inv, bool flush);
> >  	struct arm_smmu_inv inv[] __counted_by(max_invs);
> >  };
> 
> I'm not keen on this at all..
> 
> On the allocation side everything should be stored inside the
> invalidation list, we don't need function callbacks, just get the
> information from the list in the first place.
[...]
> @@ -3289,8 +3422,18 @@ static int arm_smmu_attach_prepare_invs(struct arm_smmu_attach_state *state,
>  		invst->old_invs = rcu_dereference_protected(
>  			new_smmu_domain->invs,
>  			lockdep_is_held(&arm_smmu_asid_lock));
> -		build_invs = arm_smmu_master_build_invs(
> -			master, state->ats_enabled, ssid, new_smmu_domain);
> +
> +		/* Re-use or allocate an IOTLB cache tag */
> +		ret = arm_smmu_get_tag(new_smmu_domain, master,
> +				       to_vsmmu(new_domain), &invst->tag,
> +				       false);
> +		if (ret)
> +			return ret;
> +
> +		build_invs = arm_smmu_master_build_invs(master,
> +							state->ats_enabled,
> +							ssid, new_smmu_domain,
> +							&invst->tag);
>  		if (!build_invs)
>  			return -EINVAL;

I had this when I was drafting the series in the beginning, but
later changed to the callback functions :-/

Again, my intention is to avoid iterating the array since merge
and unref functions are already doing that in their first loops.

That being said, if this get-before-build is the preferred way,
let's do that.

Thanks
Nicolin

