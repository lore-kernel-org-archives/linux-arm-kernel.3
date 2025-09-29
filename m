Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64CCCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0J1cItQkRKLU4Pf5cRn9CHeo1ftlxhfPrFjh9SYhos=; b=kTf/U02Iz5CccOWtv7AqmNWhFM
	x89ij32iUOrg8eVNVTuOcpNGI3ohVikgxKjCJzMrYC++yh70TYLaN+j7iBLT2UfVTCgRWOaFG8aX3
	jUY6OXdUESD5RyEbg9payyv0HADVPgp0tnws7iFirX0lPPvZMKpuuKlhXGqD26XYAOOF2OdCXTIl2
	BEZ85t2kwEuOSINVmeTIc0hmGPbCAqzpzD2ui/CCbIMo6zhcj7ZXwa9dhscrbvVeJfap+vyZ6ifB0
	OtdIi72NWTso041mvuBgWf0sz+gbUfGuzzfNXM+HgzAKwEoKotDTCbgkNF+Ie3IrmPjgTskmKGL8Z
	jpzTL+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3JIP-00000003KP7-0J3m;
	Mon, 29 Sep 2025 19:12:25 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3JIM-00000003KOM-3ylG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 19:12:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0pyve5HHxhw17bAtORJcByTr6JYD6VCjy/CrdBqFT208n/eVuXXCgQ1IOl20+fXdwr78ztyAf4prcbQp4Uwtfku6KXYkOZCRG3mVLXRaoMGcmHukZno3EZVvZgeK+vWUKr36JjZykZRQ9dINOmm2/02yZ8hL4O4Q/IhbPJmWvMr7muNBIu8Y5ltZRMtn55fJAsd5gfhgTpVte9nSV/f41SiNAEn/2UDhPOuzkKq8M6rHUsEPJiUjvDm8yzQiYuve+5rZaxvxV1uTxyvvwIyqrUr9n/O7QRNfgO/NIjvVl5moUngwispAuP55UeH1Q6N2qgwPHYJbBGyDirihB4M1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0J1cItQkRKLU4Pf5cRn9CHeo1ftlxhfPrFjh9SYhos=;
 b=NeYfhn8mILGR7KRAwUd7I9pGF9CTQ0PKAvuszOhCf6DCCQrvYwT3LYpz7z27zbHmzF13UpHyWFuUTNkYyIly+ACpc4Zb1zkIGY5nNJ+NMhvWijhqieveB7UsCNLtEFyCQ8AH6t4R7OomaM7uwujL8W7U7zI3HecG+rdaxPGSScYDBdvepfGNkwaVodi9AvanvU+yGX2Yg+TkwCqEpvEvOZilNE3wl1amtYRxISlFCjl91FCbaqAyZIe8VSwc7wvfsVIn5bONRSHoL5xCxFmPlzWlRP7N/enXoBDMFJpCWVWFT5yaBmbFoes9rIS8NnNCy11sDDQESpdNfr6CJFnqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0J1cItQkRKLU4Pf5cRn9CHeo1ftlxhfPrFjh9SYhos=;
 b=P+DLsKEuHsb0kTo+xal+WHBFbL3TbTdmKfmMQupu+Z54k/2DOQSx+/3SnI7G2xjwkJpLMbNHY7CaE5JtO87OgnRAt+9LVVdK2wAdcalgFl/Al2JV8PLDJJc/+zhHFOW6GwVIM1tes3N413O3KlqnujbJmFFHft9OwORgK6Bkvf5fQx/I4I/k2LkTvoEwFn3rwISg8Lx04KmS3yYOYAPNvF3fQ5g3M/bxvtdUiT2max2O541NxH28QVA7yovNu1Uo7rnMU3m8vsC86EEGR1sFjUp63oWroYjYt6QJVoIiin6WxKQw/TZ2So6NfBfeSw3WxQQWuAPuUJYbj7nVx4mrvA==
Received: from PH8P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::14)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 19:12:07 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::13) by PH8P221CA0039.outlook.office365.com
 (2603:10b6:510:346::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Mon,
 29 Sep 2025 19:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 19:12:07 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 12:11:50 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 12:11:49 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 12:11:49 -0700
Date: Mon, 29 Sep 2025 12:11:47 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jean-philippe@linaro.org>, <miko.lenczewski@arm.com>, <balbirs@nvidia.com>,
	<peterz@infradead.org>, <smostafa@google.com>, <kevin.tian@intel.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH rfcv2 5/8] iommu/arm-smmu-v3: Pre-allocate a per-master
 invalidation array
Message-ID: <aNrZ8z92CXs+J1pH@Asurada-Nvidia>
References: <cover.1757373449.git.nicolinc@nvidia.com>
 <f5f635077b791b27b46ea41b5c86a52fd4549a44.1757373449.git.nicolinc@nvidia.com>
 <20250924213230.GQ2617119@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250924213230.GQ2617119@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 397e0242-0cc7-4544-e083-08ddff8c152f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6rEujkXMCx7S+zfcGgfJPJWnj7z2soo8ZyNhYF2zM9IWthRGtHHtWGfVBMnF?=
 =?us-ascii?Q?9CcynTfjsq5hE4+3rfQepgPmUKRbZv5KkKPPzs47U+j7IvXHcYlcRoDQf4Tp?=
 =?us-ascii?Q?+Mse5AXYQSpgbKJUt9lVF75tyLF1XAEyndXx5kwGr7NN6BRuTkjYMwlnfjt/?=
 =?us-ascii?Q?SAiJnz9FGKT6s6kQFeYSoRFH+oYE5j+mPIQVnT/+IJ/cfDqL+CQ38su1ivUc?=
 =?us-ascii?Q?m64S238frKB0Fc0HsPdMLnsWEaiL/f7hVdPFwKlGJHA3W8iyx116+DxpGHyw?=
 =?us-ascii?Q?VCYA8bhLO9XbV8RYV1rCiGCs7+1U+3VHNHG+x3GLhDLnanizWJC1jW/SFHCB?=
 =?us-ascii?Q?arrI5f1HXFwcz3bPnPFaiTcvQw3W8Tc04ioFu6XVqvlm1Ke95sEzE9pK+YzH?=
 =?us-ascii?Q?r9fp2HazpWmbhuNnnHjU6bqfOZ2iwu0+rPepWxdn6s2mkDQeUz9JDl8LMPLY?=
 =?us-ascii?Q?4VflBm4DDlIM1rRgc1cWlZPOuTOuWQM9MiNtCZywwShQ4urFXQupPZiW5wQM?=
 =?us-ascii?Q?sNGPVO4nWTa7xnqDCEZo6t//iLxNzai16BjnsMzKwFeJ0vulK5V3TwKs1zNi?=
 =?us-ascii?Q?3jghx2l4noNAVmGdDj4ADkVbkbtG2Qga65LbwT/7ndEKPkeEJW2Hz21boG5v?=
 =?us-ascii?Q?Psk3wBf/k2KJhI8dhMzyZaeCrOdf/T3YLQt9RHbfRV9ftxDE1Kp0IoLYVtSW?=
 =?us-ascii?Q?Ia1Bx1YGZv/u6onsZoCU3TWlXpnXF80Y+tSUCJeCTyromyM2KKb2irc9yLfN?=
 =?us-ascii?Q?v9K04kEBMraMjopngCDudBzjV5tGBJ5of2obzvYEJp5v4Scgcst72xhFBIiP?=
 =?us-ascii?Q?stezNzOwDte5z/ZkNwvB1Mxq6jfbJ7hsDPdIZO8C2O4OavcJNzo65ato60Al?=
 =?us-ascii?Q?OGX5aB1bwkQce+xgCOpIQ7kOF1g33DakmwYnE3evIaznYz4mtnbloiMiZD+E?=
 =?us-ascii?Q?qgtZrpUmMz777K2Aqat82lFDJO3TKDQDvkwjxQEuG+jOo/lJvj6eNnDzPhY0?=
 =?us-ascii?Q?TisXWfhL+4jFSeJpy2lpF9AMSNXhE9lAKraPolkCR9VCf1erb4/fZBKjPWLK?=
 =?us-ascii?Q?Squh6n+kaZazaET2vTdW5F9Xbo7QImqtl1ZtfKq98Lj6zgZXI9jvITrOfy5e?=
 =?us-ascii?Q?ZGeeq3TedbVQL509PfVlBKSbpfX9mgpJKhUnvLH39FQrgh1kmytuskAFLTdf?=
 =?us-ascii?Q?zxER3JtDGKW2MkkhRknaoYl2laTFHaGWWwjPqx5zYZOyH/JAgvAzXJkwlxcH?=
 =?us-ascii?Q?KtVK7f7PgMFVRknuvhbFiO6Fa7/nF4PU0x5dSey49AC41mvmNDHsiPuWWUC/?=
 =?us-ascii?Q?FGAJFYEgH34agJnRYXJO+7Hcugf79z/5lL9HDkZ5YUNDpxbPp5lu0P7Dosc1?=
 =?us-ascii?Q?/z76VyPptBGkLZMS7g4ig77GAEo7K5hN32I3PIy5kTzSe4/9VIGBQV+3MIhv?=
 =?us-ascii?Q?z11meGP8ELRfrNdYLp3ni4WWvuyDO7GSvEDWaFbZiVy+C2ArQ5AEfKY7/NZv?=
 =?us-ascii?Q?l43wyl3pmMGd9KJcpZ2njhrU8rVGSx6aFFBOOQ9gBTEpR9MWtL86IcUFzUKb?=
 =?us-ascii?Q?Bb9AlFDC/gsTL2wvHT8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:12:07.1348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 397e0242-0cc7-4544-e083-08ddff8c152f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_121222_981525_82A807C0 
X-CRM114-Status: GOOD (  19.89  )
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

On Wed, Sep 24, 2025 at 06:32:30PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 08, 2025 at 04:26:59PM -0700, Nicolin Chen wrote:
> > +	/* Base case has 1 ASID or 1~2 VMIDs. ATS case adds num_ids */
> > +	if (!ats_supported)
> > +		master->build_invs = arm_smmu_invs_alloc(2);
> > +	else
> > +		master->build_invs = arm_smmu_invs_alloc(2 + fwspec->num_ids);
> > +	if (IS_ERR(master->build_invs)) {
> > +		kfree(master->streams);
> > +		return PTR_ERR(master->build_invs);
> > +	}
> > +
> > +	/* Put the ids into order for a sorted to_merge or to_unref array */
> > +	sort_nonatomic(fwspec->ids, fwspec->num_ids, sizeof(fwspec->ids[0]),
> > +		       arm_smmu_ids_cmp, NULL);
> 
> The sort could be moved under the above !ats_supported, a little more
> insurance in case something is inspecting the ids.

You mean this:
----------------------------------------------------------------
@@ -4080,19 +4080,19 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
        master->num_streams = fwspec->num_ids;

        /* Base case has 1 ASID or 1~2 VMIDs. ATS case adds num_ids */
-       if (!ats_supported)
+       if (!ats_supported) {
                master->build_invs = arm_smmu_invs_alloc(2);
-       else
+       } else {
+               /* Put the ids into order for a sorted to_merge or to_unref array */
+               sort_nonatomic(fwspec->ids, fwspec->num_ids, sizeof(fwspec->ids[0]),
+                              arm_smmu_ids_cmp, NULL);
                master->build_invs = arm_smmu_invs_alloc(2 + fwspec->num_ids);
+       }
        if (IS_ERR(master->build_invs)) {
                kfree(master->streams);
                return PTR_ERR(master->build_invs);
        }

-       /* Put the ids into order for a sorted to_merge or to_unref array */
-       sort_nonatomic(fwspec->ids, fwspec->num_ids, sizeof(fwspec->ids[0]),
-                      arm_smmu_ids_cmp, NULL);
-
        mutex_lock(&smmu->streams_mutex);
        for (i = 0; i < fwspec->num_ids; i++) {
                struct arm_smmu_stream *new_stream = &master->streams[i];
----------------------------------------------------------------
?

Hmm, I am not sure how it insures against anything concurrent.

Maybe we should sort it in arm_smmu_of_xlate() each time when
adding a new ID? Or iommu_fwspec_add_ids() itself could sort,
since we are thinking of generalizing this array in the core?

Thanks
Nicolin

