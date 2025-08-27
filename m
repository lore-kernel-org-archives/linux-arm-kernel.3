Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D22ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 00:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOFFbWOHNKcPb1ABr7MSD6gkECdDHjwwihei3wCNedw=; b=DXgeWTi0z2gjlz8F7+kyPsodoX
	MZB7jzkZjXZh4LV+AeZDKEMXrCdbXJNTCpb29N/QWEJzpH+JxEayNljEF4oPx3eIByLev0oqG9rh3
	xOcGGgy6+fLSlKib8/FjUHvGKG0oe7M9izPXf/jYLNA8RLqJOiq/HJeAs4SPZTbiiJKKeQDDZB0NG
	/+zI75yVZ1eNMr4wfx9BJwXmJMXDY6QgIZ+RuWC5hTiVgGFd9CCBhW8qenjBOAyKEnGeyigMGQ8z2
	RBzllb52YT27/mkkhSgCHwB2QTbe9CRcVR9rG1P6U9yHwVCVs60F8q5V+Tfg6phfwvSWEd0DSzOdF
	3GmUZnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4Ol-0000000DSsk-1oQh;
	Wed, 27 Aug 2025 00:52:23 +0000
Received: from mail-bn1nam02on20620.outbound.protection.outlook.com ([2a01:111:f403:2407::620] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4M3-0000000DSSB-3xfl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 00:49:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0rMSMI2uw0yXAnuBC4WnNwP2G9RNHWcJCzSk7umIVJv1gSkEOoxCMzbJm1m6+adzfxEPYuph46bY1YX1VaA5siajJJ0UsaDY8ogVr9cTDK2ZQLJSF+rkQBRNjQ3j3+Z24dzYOSanb8Ae0AU/agNgs/EAkBDfWyTVZSZu3YhyStxVWBHfDR4obvvQP3ParelF9OU9TDbsMFDHhXQypvaxit5DFSXSxFWq56VPAks0Z6agbi+VZEKVk5w3Rcg7x9BOt4xovBz695CyDDn2uA7OVvP49A5w7/nxaGHcnxFekSn2Rv+gRMfV0SuaS3LDeIWdBNdtxSZWcLGTfGXk44EWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOFFbWOHNKcPb1ABr7MSD6gkECdDHjwwihei3wCNedw=;
 b=H/KV6lxgWrSnHeOIh7iweoOSwT6CK5BV4VgY0CnyxeC2+wvcZO1/2HLKFX3pyifpBA0P2NLlMvdpZilU7kMpYHAYNZBIXoWitZ2fwpRFvZ1kujNXyohyhx0WzNKuUNumA+m2/drpI+oTuSjomxtg9UtNum20dbH2ky2/i5DtKjhWAJOcXlc5ItzBcOPYK6oolOqHzvUTCwtNjZihmPCdPDEmjNrBApFMf7SsYV94eD5/NhGbMUjErU9W6njWgA/R3LSV3Wd04PrTyCV84VH7Q4E+MmXi5rYsQqx/3rrNcGH0qP2vHlb96WujClzIps1WLEXvC1nBqB/wnVSxNqJQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOFFbWOHNKcPb1ABr7MSD6gkECdDHjwwihei3wCNedw=;
 b=EEW9D/VdFUSuheMY8nx1VbHQtkVSMIDX94bpUe1cFTNrhsguyP2DURloleR0N63qk3YXrCVTWzlDNztsk+kAc9Iqeaguc18egebWM7IJ0RCd4KYtz+PKIetiHWjeSMDJv5h2P3hREHafzIADskQm3GZd7VhbOsWKKSt/wTYh1M6JdQiy93pKSHoOGqaOQ+s7vMIuzmQZn3Z7c5x0SqXcV6ROK8lPEvdDlRydGDX1SN6RfwD0YEsV+PqkY4q9bCVzo5ciUE9RWyjvA37MLSoKWxy80EnSlQkELwZ1nYOSO7CNczuhBBosPhNcORsG+8QKzbDwmaSc6JA4jv0OqXGc8g==
Received: from SN4PR0501CA0033.namprd05.prod.outlook.com
 (2603:10b6:803:40::46) by CY8PR12MB7609.namprd12.prod.outlook.com
 (2603:10b6:930:99::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 00:49:27 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::44) by SN4PR0501CA0033.outlook.office365.com
 (2603:10b6:803:40::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.14 via Frontend Transport; Wed,
 27 Aug 2025 00:49:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 00:49:27 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 26 Aug
 2025 17:49:17 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 26 Aug
 2025 17:49:17 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 26 Aug 2025 17:49:16 -0700
Date: Tue, 26 Aug 2025 17:49:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jean-philippe@linaro.org>, <miko.lenczewski@arm.com>, <balbirs@nvidia.com>,
	<peterz@infradead.org>, <smostafa@google.com>, <kevin.tian@intel.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH rfcv1 4/8] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aK5WCnE/HTtdnLNv@Asurada-Nvidia>
References: <cover.1755131672.git.nicolinc@nvidia.com>
 <fbec39124b18c231d19a9b2b05551b131ac14237.1755131672.git.nicolinc@nvidia.com>
 <20250826195003.GA2151485@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250826195003.GA2151485@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 2683ab05-e9d5-423b-998d-08dde5039366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bm3/r11Wi164C1ibaXgXwG25yfJ/VDl+CPITwc3vOnAQHPhfjqQLxRumVnwf?=
 =?us-ascii?Q?n9KlcwidE8kJJqGAb89PfLa2CvQjQCQ7P3WpRvgWJZ6koc/97V4rG05YbAw0?=
 =?us-ascii?Q?oaurk7rtt9liBYwvOs+Mhn+vzNqGRjifYunq+c4locvZxK8LdN+I3KCg+wyX?=
 =?us-ascii?Q?A04c3euEZPxdX53jGy21ghTXxkdztoW0ttF/ZPLwADDm803+DtZJHt23OqBi?=
 =?us-ascii?Q?MGRIpcQt2vKflnCfmirIS15FR4hLDKvs4EjHdiXI96TWZE6s+oagaGmRDACE?=
 =?us-ascii?Q?3Mqnb5L1cv9UlZg6fWIzgqgzp3XPQ1L7qnyBKI/wzNFrcDi34Y8xv6sqMq0m?=
 =?us-ascii?Q?rjJ+M97lqkEZyHY+y/qzM71ZDy10AZDQen4X85aKCwf3lJphp0Sq4zmK8aqS?=
 =?us-ascii?Q?DU+BHYM2Is9oN7EWMMFxOKGJzrv6die8YbMeXYO4UllW3tWneZt3roPB91sr?=
 =?us-ascii?Q?PK3e5mdEjOjx1ILjlwCL2GBzoGu35D0tlUlS6EpKkoBVMnv00toPUjV/bdpH?=
 =?us-ascii?Q?KVK/5qRjU2N208F4N6VRWG90BvjMpvxQniDiF2iz/V2jrwciAV/eptzUt62f?=
 =?us-ascii?Q?WW8an+EXFEFuEACrU91GUi1zSX+fnFJjTR7hSnBdKIHSUQ07njwScuimXNFg?=
 =?us-ascii?Q?9UaMY1BdYARvQbmYMRiS71vy5MGGsTpwXgfCsky2bhmgXfWPSgytbQ8iu5T5?=
 =?us-ascii?Q?evrEvE7svD/clPqEXb3Nsv5zDfExBhynmml1zE7O7gjOpAhYvOl/Llvzoi7E?=
 =?us-ascii?Q?cl5G2Jj8EavHiQHs3W69fbF0TyynM3zYeoN+7vwMTPQ3ro6Ex9Qc1pXwc1+S?=
 =?us-ascii?Q?X0mus9E80f/euKcXilpaDRG2W3oAHznk3PT9pU2iaYuv9yIpnf4r3uKd07fX?=
 =?us-ascii?Q?duJ1b2m168ohdZGnlTRS9EuL2tsn7xtpxDh+XbPVwCaZusGJKFF68PZzq4i5?=
 =?us-ascii?Q?wlofEas8f6gxTtNPd8TUU48QxFRXo96YofWAiXPAvz0WMVyl5VDcZGzKKonR?=
 =?us-ascii?Q?9L2MphyQOWpliaBMzzuSa1tSZ2u6jpzQVnQQ+pK5U5IUs88qijAqzZFV7sqr?=
 =?us-ascii?Q?c4TPB68BQtqKEiEQ2I954avNxEM188fHQTFiW6o54wbdjKjjUG44hahs2Mhg?=
 =?us-ascii?Q?DGdMPFpLvArOtbfr5UxqJNwYMJg/O6Kl5cOspYvWfrysPvrh+cPiVvHM7wUa?=
 =?us-ascii?Q?1MiD/nctuXUTTtClxH1Uh39j+RJhrGSs6PZenQ23WJ32eQl0XSdaOqXhiWU0?=
 =?us-ascii?Q?Oc9gLHwB48MuDoe3msRJpgo39GpbfVsz7g+OcLOtwXKtClSffmQwFGsJJfVx?=
 =?us-ascii?Q?rMr8aEuCGI4kagopEvL5nM4HdlAP4LmxtRFBaJyh0feuHcMu0rQ659ZGrsmQ?=
 =?us-ascii?Q?54YeOCgoB7e2Ii1s3J8rlPnQqkpEiPrpgNVdaz/YyNWm+9vvYx4g573xyD0p?=
 =?us-ascii?Q?nvBM3unRaDZWaRHUioJz3vSwrU4AX3Lcn2z1kX9z4DMUQG7gq/Z0utmzHahF?=
 =?us-ascii?Q?GsBZoHfu6OTFaYcr2mNrkMlcBKjeQXKL6nGX?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 00:49:27.5847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2683ab05-e9d5-423b-998d-08dde5039366
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_174935_988794_2A76ECA5 
X-CRM114-Status: GOOD (  28.16  )
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

On Tue, Aug 26, 2025 at 04:50:03PM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 13, 2025 at 06:25:35PM -0700, Nicolin Chen wrote:
> > +struct arm_smmu_invs *arm_smmu_invs_add(struct arm_smmu_invs *old_invs,
> > +					struct arm_smmu_invs *add_invs)
> > +{
> > +	size_t need = old_invs->num_invs + add_invs->num_invs;
> > +	struct arm_smmu_invs *new_invs;
> > +	size_t deletes = 0, i, j;
> > +	u64 existed = 0;
> > +
> > +	/* Max of add_invs->num_invs is 64 */
> > +	if (WARN_ON(add_invs->num_invs > sizeof(existed) * 8))
> > +		return ERR_PTR(-EINVAL);
> 
> Since this is driven off of num_streams using a fixed bitmap doesn't
> seem great since I suppose the dt isn't limited to 64.

In the other patch, you noted that it's likely very rare to have
an ATS-supported device with multiple SIDs. Also given that this
function is called per device. So, 64 should be enough?

With that being said...

> Given how this is working now I think you can just add a new member to
> the struct:
> 
> struct arm_smmu_inv {
> 	/* invalidation items */
> 	struct arm_smmu_device *smmu;
> 	u8 type;
> 	u8 size_opcode;
> 	u8 nsize_opcode;
> 	/* Temporary bits for add/del functions */
> 	u8 reuse:1;
> 	u8 todel:1;
> 
> And use reuse as the temporary instead of the bitmap.
 
... I do like this reuse flag. I will give it a try.

> > +		/* Count the trash entries to deletes */
> > +		if (cur->todel) {
> > +			WARN_ON_ONCE(refcount_read(&cur->users));
> > +			deletes++;
> > +		}
> 
> Just do continue here.
> 
> todel should only be used as a temporary. Use refcount_read() ==
> 0. Then you don't need a WARN either.

I did so until my last local pre-v1 version as I found it seems
cleaner to mark it using the todel. I'll try again and see how
it goes.
 
> > +			/* Revert the todel marker for reuse */
> > +			if (cur->todel) {
> > +				cur->todel = false;
> > +				deletes--;
> 
> This wil blow up the refcount_inc() below because users is 0..
> There is no point in trying to optimize like this just discard the
> old entry and add a new one.

Oh right. refcount == 0 can't increase...

> > +			unsigned int idx = add_invs->inv[j].id;
> 
> 
> Similar remarks for del, use users to set todel, don't expect it to be
> valid coming into the function.

OK.

Thanks
Nicolin

