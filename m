Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C16E66882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 19:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5uo3akXm+zdj58duN7oePCv+6uYgkL9ZvPIWJpqZXM=; b=RctTnAa6+966LcZuFzOkTJPws0
	lMR8A3nG4gC8pBJnwCkcclIjy+IuFEDBgrba0tGRo5LDCAjw4UIIrLp+RXk1QsSiUOteiyT7nhsui
	6Qi1DG/C7YoxsDYCYrGMyvn1HITVdm50YgvSenVRyGRPtReAuVaSraY7T64NJSweuwB7HQ6PMcKNU
	KgJLD4O+9IO5+8ZH75gkrLNN5THC9y1SwXwaUy9DhOhGWhqT9bquV83GxsMw5kDa5Kk6y6Kjq3LxP
	q6KSvGS3HXOKtHFjbmz0I3hCBGOL7b/fdhIvdFWDMPwAHp1ay1IHW5CBAkPCsBCqd0gHybk+WmFFU
	saDakl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfit-0000000AraF-1oFF;
	Fri, 19 Dec 2025 19:01:07 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfiq-0000000ArZr-1Ags
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 19:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yp6HJ4X1unzD8udGpkUd44XWlhleTK/cDk1aiREhED1Kjs+VX+BDOm9ukStcUsWUNKDAA7YIuTMxTmaRucaSAE16sviN+Cdw5427bcaP6fEviTp3zMrpLMRqCbI/agVqrntHRm4wtD9D+Gt4Dw/ebQVCOksmMz8kUMGiyjIwa1tbpDNHKNYN5Biqmv7jckX4SFzCQpyj71agRM86iw1fGNwOxa38fVtDAPCN9duG3zVtJv02/MTJp81InJQEdZe1lukrDrEQVyEtN+KvCZEjYJcKoS/d8DMjOtanr/d0XOxjC81rS2KUmIWhQyXxVRJS05r+DUB71sZrhCoeqN9+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5uo3akXm+zdj58duN7oePCv+6uYgkL9ZvPIWJpqZXM=;
 b=yUZWn7q0euXlODbxknjPZ7y1VtrDjUA6QO4TO9m8kPVN6/zHrVuOfJlyEpiURf+6WCI4nGXScn7e76Wzp9TWheyAcJLZoKwJKgjL8sGAJfW5bEmUhwWfJgz2rGauF+KJ5QU1a6COF3kb9xuCT+ekytYq5E/TWORF6vLMDkYt2zyy+ZhYG+pN/II5i6pfPksPUAYOTtuXHNzqtQuhAkbb19fFOnIv/4RcVuHIio3nNtuTJmRMjTD86r5OS8PtGDVnx3mzj3/A+Omh4lrr5NLJ0OC2JySsZIvYW9fuLJufObIX0iLTmmypfKG+6iBzIQ3h2r3Q/v0gwV4gbWaQjJftKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5uo3akXm+zdj58duN7oePCv+6uYgkL9ZvPIWJpqZXM=;
 b=ssnzKUrXYVuGy+LjuG9O9AvwQoWcYv39c8VWJkHXDUTRX+bo5IAhkNjtwAQxHxtBU8eAYsGAqUgz7oTis+UegXy84f9LNIGRCSdaX7M4DB8i6WuWRQI8ZKUBvAK6rMAftJ2mUb6kJOug1Rk7nM4oSD8dGyp70N3mqjbbyhzyI02PgAKRLrCpLWIM7ThYo3ZjM4jZh4PFL8bQgYgFe4eAUfVkhWNEW+xworhWbr+tkYOmLpfb8AitZdhn0GaIIkhYpNzeG1H+HhFEER/oPirlnsFQeP0RAhzPlnkHu6wtCF/z1CRync5b7gW/pw11+Q6KsLMAthjgXSfwhSzk7I/hZA==
Received: from IA4P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::15)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 19:00:51 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:559:cafe::8c) by IA4P221CA0012.outlook.office365.com
 (2603:10b6:208:559::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 19:01:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 19:00:51 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 11:00:22 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 11:00:22 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 11:00:21 -0800
Date: Fri, 19 Dec 2025 11:00:20 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <jean-philippe@linaro.org>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 5/7] iommu/arm-smmu-v3: Populate smmu_domain->invs
 when attaching masters
Message-ID: <aUWgxJpG8nXRv0hG@Asurada-Nvidia>
References: <cover.1766013662.git.nicolinc@nvidia.com>
 <79cd18a1a959ee2e54683e8c465b799d49ec48b5.1766013662.git.nicolinc@nvidia.com>
 <20251219155151.GA373575@nvidia.com>
 <aUWfVzhVZ+Qo1efT@Asurada-Nvidia>
 <20251219185605.GI254720@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251219185605.GI254720@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: de1f5984-adc7-4589-9175-08de3f30edbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vYdgjUv3kFx6x0gjHvFaxkDFIW/BLuusvWT84t+h11I0scznQLQTMtaPwNF0?=
 =?us-ascii?Q?02iuwi6lqoY50frrTve8ibhfxUJ9HHZYQ2ewfujIa1HVsAqM1w3i9ssQ+kCs?=
 =?us-ascii?Q?zW0awwEWroppCdqj49BBJrCpBV7mcqHMlXLJydQpJnDKOJwAz+irDyvqiOv9?=
 =?us-ascii?Q?scPMHu0MJtbCQP+MVpnohAz3D7ZxZBtY2IGYLJ5Wxl+zh60DXwNQyN70dmR4?=
 =?us-ascii?Q?wPkzTlzIaILMMzJFSCOtzrUv4XbkAL/OHlyA85rlahPHhIYb7BtVegN1KrtB?=
 =?us-ascii?Q?NKUJLyRzbDXevVMjfktOxFCFiygiw+OfsgDKoVjoxU+H3kv3MgV8UBEzZiJ7?=
 =?us-ascii?Q?o2qsgWyl38FqE2uUuVkwvXxrqRaB5GU+s1t3ljTxcCIP8oNMd9lSKCMCHmRW?=
 =?us-ascii?Q?+LKdO55ii+qjIT+0h2Q4dLb/h18QD4kh8jQKkYYwhFwgN/Ib0kX+mPGX+QTu?=
 =?us-ascii?Q?Jmu9VWDCgt6Nq8OfLyNsAyrKzA1YIWUsnzBymdPjG2ddDeUoagpjY//PyJOx?=
 =?us-ascii?Q?A3An4anoG0AopWhQQGHYi8CZLl7FzZKXKYC/QmbFbPUh8tcWZexfAmP42xSN?=
 =?us-ascii?Q?sfDyCPAunfEBSMhQjh31gYtmL2vQ0B59xgCIvEWqER0y/2eQew2TrsNEAukM?=
 =?us-ascii?Q?3DUCZf/8MmHJqpzYwW7jqSILO77dQMBqWcsOUv1Le9kfPyn+CoO1Po1FsMpl?=
 =?us-ascii?Q?DcW1WEvRghbcwKmU8Fqe8m0sDJU2XKha2RiHka0u6Dr/Wa56olB75kEGMRzs?=
 =?us-ascii?Q?sqnTSkFo36AJtVvsl5sfY5qgV0j/N5LCvcRp+XoIRtdEmDxILHhDFJHIjibe?=
 =?us-ascii?Q?k+NdmzU0JoUWVjm8AtBW6ZIpHjy1Ib8FqfnpK0fULCX0tKcJ5wo5vPwVT88O?=
 =?us-ascii?Q?w5pDX+Ew6A3VltcWpmy8G1vshscea6uI/thWTBs7ANQMw538+vQ4v1kuC905?=
 =?us-ascii?Q?5gqZ5nYsHdco3DvjrRqwtKMSGdQLiRDBbidqJRp/ccaeeMFa4eA4RSC/3Afu?=
 =?us-ascii?Q?i/ueclZUUloIopPAJqmYfj/yR56KERvu4L4r+7hGIqqJX8LJSzOJAM/o+Pzm?=
 =?us-ascii?Q?MUkUxn6wnFtKb6cIC1u9YLos9DVDHVqhO44XD5y5Xq+QRUb5lTg2gIlYH9KB?=
 =?us-ascii?Q?rmQn3Fj7x4FB4W1KW5GVJ9fsJKj8YijfB6MJMEbap6oxTl2NldjAmR/X7YMO?=
 =?us-ascii?Q?iC8yZOtLWK059XU2jwlIPJc+oCWnBHmtsFmqEitzggseHu2Q8zBCTu95GAPP?=
 =?us-ascii?Q?4cA3Mz0XbxcbAQB/dfEkrPbaslHPDbDI0ZBLSqxeKdoKSAluosomi3DyURXY?=
 =?us-ascii?Q?pJ4NVUvOqDpzgq6gZ+isvU6WDll10XoW4Vx/fIOkRPseSfqYMax/xre5ipMx?=
 =?us-ascii?Q?rekSwE5XkjKubKiVXcp87QD6u0VILl8ZAe6pPVZATxDiYA3l8vrD8DMP3DuS?=
 =?us-ascii?Q?HUQfpqsKpBh1V+Hc7BbtiaUyfCy2+Go7EQ25g6IP1N8MWLr4GL/fW4IPsGBw?=
 =?us-ascii?Q?zSHGIwk2Qd5EOwjpvcf37CqZfEVvodJn+MzoYuemsFcPGsfPKB4itHKcOw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 19:00:51.0705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de1f5984-adc7-4589-9175-08de3f30edbb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_110104_887898_F9349C10 
X-CRM114-Status: GOOD (  21.72  )
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

On Fri, Dec 19, 2025 at 02:56:05PM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 19, 2025 at 10:54:15AM -0800, Nicolin Chen wrote:
> > On Fri, Dec 19, 2025 at 11:51:51AM -0400, Jason Gunthorpe wrote:
> > > On Wed, Dec 17, 2025 at 03:24:30PM -0800, Nicolin Chen wrote:
> > > > +	*cur = inv;
> > > > +	switch (type) {
> > > > +	case INV_TYPE_S1_ASID:
> > > > +		if (master->smmu->features & ARM_SMMU_FEAT_E2H) {
> > > > +			cur->size_opcode = CMDQ_OP_TLBI_EL2_VA;
> > > > +			cur->nsize_opcode = CMDQ_OP_TLBI_EL2_ASID;
> > > > +		} else {
> > > > +			cur->size_opcode = CMDQ_OP_TLBI_NH_VA;
> > > > +			cur->nsize_opcode = CMDQ_OP_TLBI_NH_ASID;
> > > 
> > > There is a tricky little gotcha here that probably requires a comment.
> > > 
> > > NH_VA and NH_ASID both take (VMID,ASID) as input since the ASID is
> > > always scoped to a single VMID.
> > > 
> > > In this case the invalidation logic always wires the VMID to zero,
> > > which is also the VMID the driver uses for S1 tables when the S2 is in
> > > bypass.
> > > 
> > > Which is fine, we don't support an actual S1 table on top of a S2
> > > table where we issue invalidations through the invs array.
> > > 
> > > So maybe:
> > > 
> > >  For S1 page tables the driver always uses VMID=0, and the
> > >  invalidation logic for this type will set it as well.
> > 
> > Ack. And I will drop that ssid too.
> 
> It looks like the ssid is needed for ats:
> 
> @@ -3156,12 +3162,136 @@ arm_smmu_master_build_inv(struct arm_smmu_master *master,
>         case INV_TYPE_ATS:
>         case INV_TYPE_ATS_FULL:
>                 cur->size_opcode = cur->nsize_opcode = CMDQ_OP_ATC_INV;
> +               cur->ssid = ssid;
>                 break;

Oh, right. I'll fix this.

Thanks
Nicolin

