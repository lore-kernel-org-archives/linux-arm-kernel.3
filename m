Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF6BFED3FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrFFVQJFoSFKzwZv0bd4I3UIGIPRzK+St9TtX/c2Vgs=; b=TAv6Nvy/CCDpanSF61pRoddf4r
	guWbPZCASlq6maWOpnZJncNsxXb2kKpc4Bp6SN/mgDVj9vd4DFeN19gFpl6arfB3Ot92ozba8SZ5S
	ThnMogDri67fOctRm0qabmSJnKJ0mpMcU98855HOB8AwuzVCeqp/UnVaYLBarRC+w9vWOYUVVzyPX
	UTKsx42JAGooPjsbAJtcgD5jkU5fDDmu3CLLM5y+WWcnclgplS3ypGIeETuy7r5FnLB7maponE+ll
	ovPi9xjQnJ4pRKLx+oKejbXDG79c72GdjskUM+AIAHBojCQKV0KdyoeAszrp4tnxm9n72+YU1kI4Z
	LxNJw4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNUV-0000000DkJi-2CkF;
	Fri, 24 Apr 2026 20:51:11 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNUT-0000000DkJ9-154u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 20:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJTGeZLah8VBJcTccmriX7n+3LNcXYEX3ZktjuncC5GgpFtC9kH8btUObbDq2Fas6IkJhrVkLTa4edUCdNf84PEe9KgQcjFxpQpI+6Ozp44WQz/9RFK+mTgL657MYOnb1bi5mQGdfmeB37ESoGfd8Bkc9OszorsKB0AxgFZTvjXQyrKoT34Kwn2KeRtx0EWKV1mte/5GAJFelISAUlZ4e7ch4s/w0e3VOjz5Sy3eEYng7HQTqHEHeSQc+VTdQLAPiLPfowf5MJh44ZJpeSMVQ23tKEOdh+ovCjGjzHYOxxSQ9dQqsz6QWUtbGiHwKfndJLVeoVbAI1dPqN8E4UAC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrFFVQJFoSFKzwZv0bd4I3UIGIPRzK+St9TtX/c2Vgs=;
 b=ZeHaHcztpZeSVjuEwpMj6I1LUTnRLGWzM/3CudhuMKk4nsV1bnZbASqoYLQRRvKfVqfc88XPw8dAmYmXymiITJjUGJcGvyjIOmXymvFInP6pSc/XIqaACZ2RIPcziwgJwXKsQna687nWqaXJtZO15RZb6v3Fo/nQBzImlEEQJNTUloz7VgAkzBN8+ebTYLPZRr1MoSlVZMgg4cbO6Z25lhuLYkkWrY7juEAtgBDWi97u7mo/9jTF5YT28N8VpADuTsLeP4cy8QIgh+GRM9XpjpX6MyVYl7VY5y3gW9VjWzO+dX+bB/mLvlbA3G0U+pRGwjMJShb8xzWP+Nn+b7I1pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrFFVQJFoSFKzwZv0bd4I3UIGIPRzK+St9TtX/c2Vgs=;
 b=BTzC3Sv3fYsd2OgNHEG0r5I9QLJqnB3cN5iGcoxKrrVk97wvAaBueWWQvJC2rcZvA98eNhQbHJPD2Jhd3nrcskf9UvdlSSou/vjzkgcbdZPQeFkss2k9Y9CbXhurIcbZTQC+vtOu5/NCw6heCZE38LzQYyXsRCk+BOP6bscdTkRxTvCKsEKTlVsNrwjHbBc3L9Ds/F4M37CDczhXDJTYHgaZVRv6qwmcjMSZZ47oi923xr7YvJe9IGpuUT7mxl9cJt1sEG+M7YyP6ctCjXraUo180osb03cdjPQA7IluPbTXbslXEnwfTXb2DxI7SoLyXWP5rHFmTz/YExzm9E3nGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 20:51:06 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9846.019; Fri, 24 Apr 2026
 20:51:06 +0000
Date: Fri, 24 Apr 2026 17:51:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, kevin.tian@intel.com,
	joro@8bytes.org, praan@google.com, baolu.lu@linux.intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v2 2/5] iommu/arm-smmu-v3: Implement
 is_attach_deferred() for kdump
Message-ID: <20260424205105.GL3444440@nvidia.com>
References: <cover.1776286352.git.nicolinc@nvidia.com>
 <7637d66c0f6c1fb16da4b5c9c4cec71752cf4d23.1776286352.git.nicolinc@nvidia.com>
 <20260424165927.GD3444440@nvidia.com>
 <aeu5/HsLwfhNWpbm@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeu5/HsLwfhNWpbm@Asurada-Nvidia>
X-ClientProxiedBy: MN2PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:208:c0::41) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 2676993b-fcee-40bc-8fcc-08dea2433489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: C+PKvJRDe0tdX1bN+3SmDHjRU2BxXs7r3/opEnl+vCcKikUrjMNh3wgtZv4RnSoADEpjH4xDmcTapcpCEjII/sXUxYBlY3X6ADmOJl92CCUenjFxVjDSzOjvTFu+S4UbK+Rrj+523742tbcd5a2clR7g5T3FoXALxOOkXMZksPRvIhrCP+sy+9h5+G9tVik8avaaTlW7MZxNefeFfw5lIG40szOWB0Xc6rt98IwF01nxdwcSEHc7duoTAyo8E4RRFOK7Ecq2PglX6xk4OoJRCodwuGDMLNp8zfBJNT1rTO3pNRsd8pHlXEv0Qh81O7Y+6i5UtRXyfQYO28uXjc0xKD0iGf2BZ/M1vvPVVn4+m64IUlIZ6PKwDyD7jlbVZkQ9eMxL3coUKBQ1/cyGKN8vJp7Yr/U8xXZC3WpCD+ftUObu6Yhi8RJ1/g0D6DOc4npA0FsEwqaa6zvqqVaZKzVU3p2vroo7cgy4Ro4Jx8aLEI3L4i1lrH24O+WmDMQiltATLeMUWI9vD0HQNlvKjy0fOHYZBaYpC98ecVbU/O1OyqN1WNWFhTIro9ffInBlI7yKy4PpT6SQPxxOk/zNIQ9zrEuZYgYIpbX0kZ3AwQTZ5mAODM3pmrmwyRvXqbXPnOeiKL04TOSvZ/EOECjqv/PgldKiDt2/Ld3Q359SHxhYrqTAXjQpoW2k0S2GSqao8zObHS9GzVOfI+HVTJyIgjh1c1GmcCRRkpduvrhgPPNB40k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5z38jkTC2fOJ836CMpE+++WvYPdGWEqESK9LmkTydS/Pwj8fWcivUDnrlSU3?=
 =?us-ascii?Q?NE5wsKLpbGjtKWJ5eKDAZIE0SETMFcZg7zxCocTtdJrO6SuofP9PvIxnedi0?=
 =?us-ascii?Q?2wZes6MHKPAwkU9jxi/i2GcB7/oNvWZWMlFtOAEYelMOuWEcCg2MQetBc+Zz?=
 =?us-ascii?Q?RBL8VR5NN0LIFRIxydPOcJ4N6O9CzcPVS30CHUDzTRyX3le8nFzGGvnHJgqG?=
 =?us-ascii?Q?JcbRelPEj7i6aCEVXf0VEUj94jIekT1R7Dlp7wvE5+jrjKBPDbvsOBmA6KCS?=
 =?us-ascii?Q?/swtka+H2r6lNsoiFP+LGVnQHM6we3gJkpgMmg7hg/DUbHTCwbw4lS+1K9h2?=
 =?us-ascii?Q?UClgHuePJ876VwqKzMrt8AGta7fD1AWDxylzRQiDgSGHFAlig64v4NWk7cUw?=
 =?us-ascii?Q?cq22ltPN1jIzthd5l4yl1TEB5239ovfX4MrKt4W38UukgKK40g1YZ4s+mce9?=
 =?us-ascii?Q?Y0x+IySRY72DLG+Slh0vE+tnmcAxuUFMSAoZYNoouR2CTctBo/tXJ2lFaHa+?=
 =?us-ascii?Q?eRH0I+rxruTkNHPGtjja8quc7vLqQieEuF399jzHG2A7pcofNHf0fo1Yyi8/?=
 =?us-ascii?Q?k/1N/a4trSfaHq9BM3tRjspASYExhjuPlFDsG3bnW/Fx3ECwg8FG4SQ2GvMY?=
 =?us-ascii?Q?OioR/IQS1z5R6tc2tDty58eK9VD+rZ2RoSLJWS6JCguUIRwnSNbvBeae/YKG?=
 =?us-ascii?Q?1/X/vgtpA0DNYuTPmA4/Q4ViDXsmmeOKJeKX2JoZL4PhnrBIXPCvMGAyo9f7?=
 =?us-ascii?Q?ZMV4ybJxM9tJZMYqT2LtuaOGp1q9RvdHQY8LN3EWiPBxzZ41elt3IzRaw/wV?=
 =?us-ascii?Q?fjGkaXmUkMNafEE5BtMSMpyv8sVGoco94kd1vS4biIr5zrF/JwtUYe+4m8J4?=
 =?us-ascii?Q?JusYdzorBJOVrw4ij9CzOZ6sboweYQ28E6iOMBIg64yGBjiMAbVTBK8m700r?=
 =?us-ascii?Q?N2TVXiJYUT6KGy3h66eoreGjTN77a3tFqd1niqpqJDDSZ7+PE7Odnf5ZTHlm?=
 =?us-ascii?Q?mAwMWlPg56XBHi0iLgfKuWS+9BmMzPDPfmSgeR+jVfONrKgYUghrH0rzXvfg?=
 =?us-ascii?Q?JVa2EhfQTisdYihQD5gF5z+lPB1nZO3OyOhJCsLdzwk0QQQ6+DzeDx7/2bZm?=
 =?us-ascii?Q?q9dymxr8oDn+klOetNk4YHHNb75Renx7Hk4fcvnVBIQ9N5WgIJSTCUAu8L33?=
 =?us-ascii?Q?V3ZvqR+SbWxxxHhAyhB9QlpQ1V2FzaNBY/3ZuypN/QNoixM04y3pzu3PE6sc?=
 =?us-ascii?Q?pWgUzgBYtTVMnjDIpJKRABDkQpyb29QdIVe3seqjtM5446XINkzpHgEoOuA1?=
 =?us-ascii?Q?twLJLsWb21xo3nQ3M98HlT7wGyTq5aKRZves1dmgDHWyUeDbnWa1d74EYO97?=
 =?us-ascii?Q?Lf0aLTDCXTgqPpoP86nqAUIwuLaBZ5mAkP7zLPLhDVmLBP6BtZeKy/cM/1lQ?=
 =?us-ascii?Q?pOmEvu879gVRzG2CORIHbjagE6JZkRBp9RF7E71phXYIr7ISA6CQSKid5mZS?=
 =?us-ascii?Q?ibluP6CLU/uzaiTAUNsdqu+sUd06qMcS+D0Y9B9+NyY8WT/g0x0voA1twqtE?=
 =?us-ascii?Q?tW0WlysqorKeshvNnYcknzNjUOxbYadJvE730yS3r9ftjr1pvf1z4H8P/v5s?=
 =?us-ascii?Q?Bbtwb/3njh11O9WosGTlRqlo7Su0g8jSccMW8LSFDQRe3dY3qWwzMG6itKsp?=
 =?us-ascii?Q?SL5NlpX+M14k0VxVVmtcNqYxt1yooYiWJEx/w/SzEAT5tFjs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2676993b-fcee-40bc-8fcc-08dea2433489
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 20:51:06.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U71m+xCqF9Ij0JDZT30xYqqjSRvmBC/FrLRv4L+E0jXZgCLSxW27y982jljT8S9K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_135109_299427_249B3733 
X-CRM114-Status: GOOD (  16.78  )
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

On Fri, Apr 24, 2026 at 11:44:12AM -0700, Nicolin Chen wrote:
> On Fri, Apr 24, 2026 at 01:59:27PM -0300, Jason Gunthorpe wrote:
> > On Wed, Apr 15, 2026 at 02:17:37PM -0700, Nicolin Chen wrote:
> > > +static bool arm_smmu_is_attach_deferred(struct device *dev)
> > > +{
> > > +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> > > +	struct arm_smmu_device *smmu = master->smmu;
> > > +	int i;
> > > +
> > > +	if (!(smmu->options & ARM_SMMU_OPT_KDUMP))
> > > +		return false;
> > > +
> > > +	for (i = 0; i < master->num_streams; i++) {
> > > +		u32 sid = master->streams[i].id;
> > > +		struct arm_smmu_ste *step;
> > > +
> > > +		/* Guard against unpopulated L2 entries in the adopted table */
> > > +		if ((smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) &&
> > > +		    !smmu->strtab_cfg.l2.l2ptrs[arm_smmu_strtab_l1_idx(sid)])
> > > +			continue;
> > 
> > This can probably just call arm_smmu_init_sid_strtab()
> > 
> > I think it is OK to allocate another level 2 here and it also has
> > protections for SID out of range..
> 
> Actually, sashiko pointed out that this guard is a dead code.
> 
> arm_smmu_init_sid_strtab() is called in arm_smmu_insert_master().

Even better

Jason

