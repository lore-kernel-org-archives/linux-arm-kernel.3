Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40065C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHrj+slmuwBcxNipILWZH8iJJcwjimoF9S0n+pe/LTA=; b=3u4sjZpNdJ5LHiuEIj46Ere402
	fUqRI8qIp3GXJ5dEBARY2N1Q08yrWX8Wv2cOmXDd+nYAirAFK4nPjG0tWGYj3d1fEFia5/HMdVf0S
	IGgHmQcJncVsLuPxGyEDBq6GFXYF2KtmC7gcTuiR4mYc+LN+Kqvlgt19ykG/yL6WOlqp+nxvMRmV2
	wbTlDO+m1/h3xwFsInocDH1T0a2uiXOgyTvDz4hW8lQ5D332da1ax0KGfjaiAK90KEVQdcl9tjP58
	rvu9LL+tLCp9F3pOChzbx1RFWzAPCems/RhECikUni6zhOYzj23GfgtJhpzk6dcmVYVl579nrBbuF
	2vhV7MNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgn9S-0000000EVAw-3lPM;
	Fri, 16 Jan 2026 16:58:22 +0000
Received: from mail-northcentralusazon11012057.outbound.protection.outlook.com ([40.107.200.57] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgn9R-0000000EVAL-1RJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 16:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaRWeDfcLuTADo82qEeyy98LMtQKA2ZjxYm/dQRhgiFJ1JXTbismGs5yQ9LLAWlcVQmrFbEyjFLKJZDfgAWh8k8/w+jbKmN679Wh5aNz+ZVq/dvJ8ekZ9iY3Vcu3k7ceUtu8+6SBqF9x93b8XQKlQ9iYkEiUr42gtMugMutXdA7lPPPFJ6aHi7VNj2vxj6O8/dDUPXLtmXLvdr9a4BM3s33/JIBmT1BBE8knD+HCJr57H7S/JlTqYh3GzAR0j61ZpwTOrzexTeDO0Zyhfdrrp58injxIXVPNu5P1sI/+CVH7W6IZn9S4hFG6jZpR3ZNhEte910X6einOWtUdLlIHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHrj+slmuwBcxNipILWZH8iJJcwjimoF9S0n+pe/LTA=;
 b=mRwcVObdxNryfWtfDwMEocVx4Sf85S0Ok1QUAldV3rZA+DUv70S8S7vqJuaBSSOmO/lkSMxs5YUqq9YIFnU4z8it61tOL0PiqiKN8ZFDB5X+/K/mH9wdpwzSx9/L0T796KEPrlcp/LDVGqtqv789l7C5qxvD3qy9xg0Q3CZl3ms8O45eOKXvnOUpf4MceNVdqt67hN3DzXPDEniASbt1bs46HyIpiOUM5ERwpb8GVBIuxPzHTjwd6kQPypxg7tlimcXXe0X5PSLpqitygS28Zj77H2ziab62nviYw+CRfmkcPp/YbZjYl+Ft0W0X+J53xNCDbV9KmYXDPx18BmaU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHrj+slmuwBcxNipILWZH8iJJcwjimoF9S0n+pe/LTA=;
 b=RMIX9TX8HDDDKvnWGRsvJxkSQkSB1uFUKs3kJJ1wRbHpjYWtEdpfe/vJSdVPv74MgzgBK+aLsi93dsQVPrRHn8jXP+WPtxLnCA9SVqn865QD9KOszpdRQ0OKDukmP2x90ToWb2L3P0dtvvC2RAFah1AXz/wUjsQrWfV8KkfVf1ZjDgTiQ+kLmS2boYINn7PkRXCePVJ76VEqRkXHZHeJHXrMXawQAryayIKev2jyGihexY1YJ/DhgLuJoYUyqdeQJitEhliUYbY5MYKCDt+dCVD2wKssPtmCYGp6PBhR4rrW3VtutOIhrUCDe8V2cxslXwPdoMPn+QPY1w1kOAURzw==
Received: from SN7PR04CA0208.namprd04.prod.outlook.com (2603:10b6:806:126::33)
 by LV2PR12MB999074.namprd12.prod.outlook.com (2603:10b6:408:351::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 16:58:16 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::a4) by SN7PR04CA0208.outlook.office365.com
 (2603:10b6:806:126::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 16:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 16:58:15 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:58:04 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 16 Jan 2026 08:58:04 -0800
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 08:58:04 -0800
Date: Fri, 16 Jan 2026 08:58:02 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jpb@kernel.org>, <praan@google.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH v1 2/9] iommu/arm-smmu-v3: Add alloc_id/free_id functions
 to arm_smmu_invs
Message-ID: <aWpuGsnyZJWTmgrf@Asurada-Nvidia>
References: <cover.1766088962.git.nicolinc@nvidia.com>
 <1541ea4a9e9c935c2f907c0c5f13a4af2bdc2114.1766088962.git.nicolinc@nvidia.com>
 <20251219170551.GF254720@nvidia.com>
 <aVQfhaqfvfLFNZqe@Asurada-Nvidia>
 <20260102155715.GC125162@nvidia.com>
 <aWnI3Ii3KCFmJV3/@Asurada-Nvidia>
 <20260116144120.GM961588@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116144120.GM961588@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|LV2PR12MB999074:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba05f26-d5e0-4e81-4b84-08de5520714a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NJaeOjYI+uuaj6h5f7AQPxc/Mh/72c7lLwMbaM1azyJrLA0FQ5b3YdZ7bMod?=
 =?us-ascii?Q?jPF0h8SuvtADu4elsEaiq85pI46njF0eD8FBfLog0S4rjEkgSC9cdVY+V7hy?=
 =?us-ascii?Q?SW6U0NunLADCsC+LmzFKgEiwlopxmY5AmDA+c1QrDTsnJUmKEjK3dlmT+/ok?=
 =?us-ascii?Q?MmKpl37xt1FRZWf7fVpDmcbL+fWhBQu8pyD+t3eFcJ0EJUnvkSbR1c/CYoIL?=
 =?us-ascii?Q?w4gqhnJH/ut0Gj5urW7+yTEtOGVt+jqZe04IASRjKZ3Y5/Rb38AM1/V3NuUl?=
 =?us-ascii?Q?Hrr9Le4Wivu2B8DZ3Xq/k+28uaoTlDniHBRQq7a3p46t77jvZuPnKjwQjRii?=
 =?us-ascii?Q?FS1XAPfmFvzO4yr//bPoTvzhF6qvQN2ziCxvv7cHecFJdiHv7fiUdoOnqJ+4?=
 =?us-ascii?Q?9uScrLIGyeNkFPVPH2eUBdX+KdqABdzo6mqS2ldld/fwgbO32gWI3tUCtwH0?=
 =?us-ascii?Q?5/C8EVmTKU6RU5UIgBBGPgzIbbLc1S92SOFfIRWy+oeP2vStz6PgmpN82Cr9?=
 =?us-ascii?Q?Z9M5IqS1o5f/ia0pdeswuqjINRvctg3GXIkV9YBapHDwPyOKZGlakf7RIWqt?=
 =?us-ascii?Q?HAmOcC/5Sqp1MnhnknOZBu16u65rumCAyvCVpgF08VRw8CRcPOgwS9ysSj2U?=
 =?us-ascii?Q?/nnIgzxUHNpAno80NaUhuk4LDWXg8TTKwhl2iwYGMRR6vRYL+/EtTafU/RpW?=
 =?us-ascii?Q?3pgm3P5/Yo11LOQSlFTf9K8XLr3ngYj9pODUeO6W6BEzGRhgsvDgyrQPpE6U?=
 =?us-ascii?Q?Jdv7n7EC7Ed9tWecV2/SppiHNzudbwEjZITLUCh6iO1IBj9GuPsCzt5vnFoF?=
 =?us-ascii?Q?TUjePcyBI7KsrlZgh+DDCtiBieabmGrm+h31Q6PGlhH5U/fmCGUL3TRWvwKJ?=
 =?us-ascii?Q?RAIkjewkxM51USb9zfF2dXC3PNHEAb3i+FC9T0WLgd5DdmPCOsmLKUr1A4rD?=
 =?us-ascii?Q?Njwzd7Ahw3g8C1B+7OlKZKmYedgoRn0vMf+rCK9IXsqLVPCZw8P+fK34O5Dy?=
 =?us-ascii?Q?LRYfAHcIqbTAd1Em2NGxfOJV6XWpxVM8YMKS5BPLSYyxbO3wLAeZsgQrWwm2?=
 =?us-ascii?Q?PxK+b/UgMr536xerLbi7xauglVYNa3CHazeSAdxiKXletauYeb28E3c8M4xh?=
 =?us-ascii?Q?aKbIQDBTcrDNTaGo6cwxWv7yj/GL6SU6MF6X6Ej26UngN9fzmgRjTab3tb+H?=
 =?us-ascii?Q?Rb3+/Z/UbM5booPmeAfIdtP4GgNy/HfYpoFqtaOCA7JculbQijZnJxos3IfE?=
 =?us-ascii?Q?PwBGYbL5PtycxDrjT5MQrbremekxYu90lvpl1OR84kspNA9hKryaZaypWXAH?=
 =?us-ascii?Q?t+m73nOsevYx+yFoLUocIgUpawCWjQZjTak9e5myeEQ2v/HB3+RlxzM2w7PD?=
 =?us-ascii?Q?y4fQu+Yw6QLj6SJOAzDiHH+1D2MLnjh8TTsgtGprroNiwaYEeN0Cs7rTSFWM?=
 =?us-ascii?Q?HA6jAqw8HD8AgiH85ScobMs1hUEWvM7rj8U6ouaabVGiVFhCSW/PFwLPXVhM?=
 =?us-ascii?Q?BDHHkc2kjcpW8lQhImn9zDORTUQFjSZ0Xg1OdRYvh+VMAvHGJBf9y/5ofwDA?=
 =?us-ascii?Q?luRsnaXBuLgupVYPwBJkxC9MUC4XpXVGn4lEsNRTQ4C6NYABoDDn61T/k2AG?=
 =?us-ascii?Q?G+96HLhegfNSiGdY+yi3CyTeJ/js2czu7OGVrEDEdCXLTPLbU7fO29KuGhte?=
 =?us-ascii?Q?hvLaAg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:58:15.9961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba05f26-d5e0-4e81-4b84-08de5520714a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_085821_405677_723C06AE 
X-CRM114-Status: GOOD (  27.39  )
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

On Fri, Jan 16, 2026 at 10:41:20AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 15, 2026 at 09:13:00PM -0800, Nicolin Chen wrote:
> > On Fri, Jan 02, 2026 at 11:57:15AM -0400, Jason Gunthorpe wrote:
> > > On Tue, Dec 30, 2025 at 10:52:53AM -0800, Nicolin Chen wrote:
> > > > Hi Jason,
> > > > 
> > > > On Fri, Dec 19, 2025 at 01:05:51PM -0400, Jason Gunthorpe wrote:
> > > > > +static int arm_smmu_get_tag(struct arm_smmu_domain *smmu_domain,
> > > > > +			    struct arm_smmu_master *master,
> > > > > +			    struct arm_vsmmu *vsmmu,
> > > > > +			    struct arm_smmu_iotlb_tag *tag, bool no_alloc)
> > > > [...]
> > > > > +	case ARM_SMMU_DOMAIN_S2:
> > > > > +		if (smmu_domain->nest_parent) {
> > > > > +			/* FIXME we can support attaching a nest_parent without
> > > > > +			 * a vsmmu, but to do that we need to fix
> > > > > +			 * arm_smmu_get_id_from_invs() to never return the vmid
> > > > > +			 * of a vsmmu. Probably by making a
> > > > > +			 * INV_TYPE_S2_VMID_VSMMU */
> > > > > +			id = vsmmu->vmid;
> > > > > +			return 0;
> > > > > +		}
> > > > 
> > > > Would you mind elaborating why arm_smmu_get_id_from_invs() can't
> > > > return vsmmu->vmid to share with a naked S2 STE?
> > > 
> > > A "naked" S2 domain doesn't have a pointer to the vsmmu, so it is
> > > impossible to get vsmmu->vmid.
> > 
> > An S2 parent domain should be per VM. And a vSMMU on top of an S2
> > should be per SMMU. So, it could have stored a list of vSMMUs and
> > device attaching to a naked S2 could match its master->smmu with
> > vSMMU->smmu in the list?
> 
> That would cause lifecycle problems if the vSMMU is destroyed
> while the nake S2 is still attached and trying to use the vSMMU's
> VMID.

Well, if vSMMU code does the same get-build-merge in vsmmu_init()
and build-unref in vsmmu_destroy(), VMID is basically managed by
the invalidation array. Yes, a naked S2 attachment would still use
the shared VMID, but I think that's fine for a nesting parent?

That being said, the implementation isn't going to be as clean as
your approach.

Nicolin

