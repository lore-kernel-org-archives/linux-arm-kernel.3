Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20B3CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8Fa5f40kITuSEbGVJ1r+/ITpMWCupP24sZx+4tXY10=; b=QDjilWHF0xbN78GAAd3CmQi3uf
	PKxOQ1xzk7x7NEW6iGajJsozxF+1K7MG+kAVjbvW7QgkSBrBVW28QVxX53aIIF0+THS6i+f91e/TU
	SHmyxlW65LBGC5jgMu2Mrz8G+VA+eTvyhNkZqUbKMX8BQQvQYrtk2qcXW6z/VnLvmJhWsHaHmfGqy
	Lrhga/R+YJT9nCfbKUKvToa5stnvM032kTj1RF122UzBBHhZEeJrGRFdXOM+uc1uG4eq8ddmjiIEv
	xDzZuP1qWzt7gsQX4elobdpsd78nK75r5S49GnK2qBQAp9YhOw2b7Xv0cuxn6OM9WYSOwHhXIaS9z
	5/EseuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3hS-00000007vwt-1FDz;
	Thu, 21 May 2026 13:44:34 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3hP-00000007vvd-3W9A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:44:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHYmRJPaZIk62Iwc+9stwrrU1ZhYABC+zHqjr8kS1LQwaPgcddH334HQGEDDHFZ51qqHmFlhjGoVCx2zCzZP5EkP60gU8vfCLcH/AAJzJIMlE9q7Vc4o2BsaVvsLov5I45TWNUCP6l/kG6KEEN3Ill0mo3cZCR2p2hq9DDkYiKLC2zR1jwxHhkUpl1+iJHYU1fspg3146qUfhsQ0tvWzPriNl52xZw1kxnLIuUK42FyIsKwGgIC5w4WBsbVcvzPqecAI9AYzVddcbpO9d7KlypPfxFrihIJH3aDgm9v3xB6KyDnfrR2jHlj5QL41UAMbsrhqFXmB0gAx+IBjNGykAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8Fa5f40kITuSEbGVJ1r+/ITpMWCupP24sZx+4tXY10=;
 b=QWKed5xFGOl2Y0o99/1sVN0mDYmTow6prI6EGMHwycwoamW/0a/o9yZrd4fdZw8a4XDe5E10Ev3E4N+FrN4iFzZATvQJQ5nTbnVsxNYJBywAHy28AVsEjqPyCsvErIsBNtt7Gqoh64WxeXGSpVgNSADAakDlz8Ifj1kCEx0RyXqXSUdax/48QNwlnHT4pwFsfl+HwTBs1mn5GSYZ277D1awkUfj4dtm8ei4IMPU/o3kiNor0vZutvjtEaN8dVF4NSwORu3VeJDxshxro3lLRA3VaOIKuAnrXPDITuCUzo+4MUNqVyjr4f8KS8a/aojyhGY5Bs+49G2iW8V+7k/wI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8Fa5f40kITuSEbGVJ1r+/ITpMWCupP24sZx+4tXY10=;
 b=uOTiGsd9bOGY2l9vJtjqHZpME/bsSFF7zZZCdBaH26NZbbNwVzprnYJC0Dcr1GEeCYq9CB1fny4xao+7XOIttmjX0S4XwD3XGjxnoJwgHpXZg6KVW4q2ngGjlsUwmdaP+5xyx9H+3b30uQ6zkZSZmo/sJ2wDS0jbePtglpZGncNwstWN2VdfA7WwmZ90+0SyvYPMZ8TqDxl2YNVgg53Mr+p0ENobgJA18Zo1meQ+2JoeNwbaeZlpuxXpkRQWbK9Swd4HvG88v55sxvn7IWhrUQsmhkXCkp/cIJDckXJtiQghUnUAaW+VC/j5EL4knaT+BxCeFdnJ6pRhyGn9izLEBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM6PR12MB4354.namprd12.prod.outlook.com (2603:10b6:5:28f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 13:44:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 13:44:11 +0000
Date: Thu, 21 May 2026 10:44:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, joro@8bytes.org, bhelgaas@google.com,
	robin.murphy@arm.com, praan@google.com, baolu.lu@linux.intel.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	dan.j.williams@intel.com, jonathan.cameron@huawei.com,
	vsethi@nvidia.com, linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v5 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <20260521134409.GG3602937@nvidia.com>
References: <cover.1779304390.git.nicolinc@nvidia.com>
 <b6d2f24356621c504e47633d9e96a7274c2859f3.1779304390.git.nicolinc@nvidia.com>
 <ag43NP4UiS7Z9T6q@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag43NP4UiS7Z9T6q@Asurada-Nvidia>
X-ClientProxiedBy: BN9PR03CA0775.namprd03.prod.outlook.com
 (2603:10b6:408:13a::30) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM6PR12MB4354:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d13a84e-a6b6-4e00-e06c-08deb73f09cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|22082099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: FjkQ1yw3nllFgl2xKtKJM4LCq9w8L4rz9tbtTuLhePoABF1hIImBMsGZUORuxwcDo+UQgMVBdb8GJgu+x0qMYYorSEGffC6JZ5qal/lKWU6V9uQyRSwkrD9xffaBqHCKhKPmbFsLjKicSsttv/6J+s5KrVoLK3IfjMebxgBL9P3K+xmb+a6/Qia3XAzTMuFNMHtjBkTTUMYAakqgxaPXf+hpruMEGa+srA1Uk7qYETmrBzvBzz+fjfWGJbCIJrd+ihzfZ/l1yiZA2rSk56YB8wVy0XVQIOKNo6imv3GccGVdP0qC2g3AgLk5yXSsnXn44APs7rur3tT50IR5h6VRyzuHtMvFE8OzO9EWpgYe9ryA+3v0QGdq1Hcb2ETjOXMfAY/YT0xsL0nhKYt+UOvfJOHCnKZ+ME1DJ1ZJ+eLkEUOoqzEvFgyQaVkhWf+gV0FqHpinoIdvSBh5/2oGc8YAsFpWeyiLkxES5ZTN3FKRGQrIvcbJr3+5zS2r3ZMyCNKy3EwUmD4YP9gFdEJiCHGWsZmhC1C9Yd9+mfhHkTukqYrrrb/5fzV9wK6NvAW/3ufHyuCgsQRaXLJr/lFKWidR4MZqeIQstgyMCoHUJaCb0aLX4AA5C4INFC/77K8PLADHguUbIRRDz6l77gA+JdDwgVZnePugQpniKLjrVQ+tqbUkYNVphY7gvDJx6p5Uunr6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/TKIQihKz8r23lQP2WSz4pmks4g/sWBhWej55/BmwLkeoLTVAdorzdPBAUnc?=
 =?us-ascii?Q?LVkBJuNH/1mDamYIAMNRQsM6qzBHPiUBbcg5eObqBPZ+BEGR9fFyjt9aZE7x?=
 =?us-ascii?Q?oTULmet7PEJRhZbZJJx+CD51ePPvROuPPWNHl/dSitufDL6AyU8PNuhRoSUw?=
 =?us-ascii?Q?U/XDxx/Ml00Esfd/8B1QWGKzi1TJpC98pOtldt3+16qGk5gQc04PrUWmgp13?=
 =?us-ascii?Q?nXR8YTAGn79pGhor8capfDKlLXXzmmo+QOJMmVfwP2pB5HuorGVROenc46qS?=
 =?us-ascii?Q?VflcEi6MNqo69Lk0vlfOswI87l7VEbli26DwgmETddw0ShR+z87ZGC1rwrg9?=
 =?us-ascii?Q?nPDfWU9Yr2GrysldtCGK8+GcVOdNYWLUpA0na2y1qZwQS0mkozOCiScZHFP8?=
 =?us-ascii?Q?U474ttaWn/Vrp0J9HrVEj1vqVS4k32lQtO7BkjlHZac9aoSE3mgewnlc1Wpw?=
 =?us-ascii?Q?mag8v5jqN5ADTr0JIy8ls99UMXCUP4AXRNsTQYqxMa8hax7dpYU71WCz0jId?=
 =?us-ascii?Q?U+OqMIQEaCtveg1KZpJIwfMKPow1kXOQMkFfdMGSusK6um1F3mWpDwxKEZ1M?=
 =?us-ascii?Q?plAXeC07+HWO3nC8zFTVrBhOXf8nzObwU1uY1zpavnxkC3ZGrWnjGefVGFaK?=
 =?us-ascii?Q?fvO8vZLTKmkGdg4/5aCqQonia5LprOucIW8VCy644nG/I8M2LpkyRRN25x+J?=
 =?us-ascii?Q?wneUDh5dp6uEygAOxj2VCZcQJ0aLnrgFfDL2E2r+ZazBu4f/R0bDVnjiZagU?=
 =?us-ascii?Q?YttBKryUh2xdKH6cjN2t0LxXwDPlBprcAD/sjmpWH2z9fFbUKdn9Bqv07Y38?=
 =?us-ascii?Q?+cT08OyoSjY2QKsloG/Zxie3ERDA/QUobdVxvUPMfRIWSqI9OUdRFLKw2XJJ?=
 =?us-ascii?Q?YbT4Bkx6qMrcO4QFKnO/CTOWDBMKe+AStYfO9x7NaOngAv0vTKyPizmYoL9h?=
 =?us-ascii?Q?emRxWYblqxVjavCsE0qD1J5Abnm6DxP4TvOVzOkzZtsXJmD/kROkxAl/b1eb?=
 =?us-ascii?Q?cPin55f/+bpKpYbGYpKeCWJU0+rgZcZwEbg4H+1Kdj8a8P/cr1JhuM6JpvTC?=
 =?us-ascii?Q?g2ex05fjKcHvCLBs2f55zFWx95xXYllwl4acBpQLYznMm0sQbdOtsJQH1yJX?=
 =?us-ascii?Q?irPTUnQYVOZ7tOEhMkEASPtb8+XPHoKTOmXZ9lKTSbWO9a6dnrdhii2zf+6L?=
 =?us-ascii?Q?5brPRYn90PMn2b4Oat/a78lUCai4C2xSRExoEKVHt+Pxe5zj+GyuvgLjWbpk?=
 =?us-ascii?Q?2ZZuacTuqz9/hoJhVq3wDnnwuugVfM56gWKACK4H1A7EzaujWLcVeSGobHVn?=
 =?us-ascii?Q?l75ZXG9n70xq7O7R//Ahr8ydp+XZxRGQuE6/1KmocGKF7EUpiQuyVF14HciR?=
 =?us-ascii?Q?lqirkiLR8PxyqZTfZqFnms3XH4WKdVa9MITsgnV6TKkcEfcKVqv8+LOdV1J9?=
 =?us-ascii?Q?tXA4TkaEsSkmRclQY5taCOa6OAqkqLmfBCCI1SBkvilHoKmULcnzRRgngwKb?=
 =?us-ascii?Q?co10vqF21lyPHadAkuSt1ti8KXyaBKRcgMdfeByeqkLlkiOeayC009KpN1Tb?=
 =?us-ascii?Q?9fPakepCQ/3ghrF9UhmCEgi9SR58dLRxvpCjo2WM1s8njMVzBaZb8fA63IlS?=
 =?us-ascii?Q?sq5C5D/b8rwW4JvOxxExs71vk9CjvyQiHTFmyF5SlKybF3UVwe0Q6Hfa3Kls?=
 =?us-ascii?Q?JNcMIY7bLZ1uhxyTR1nzkSyNtVfLJZay0gEspID5qpTTa8IZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d13a84e-a6b6-4e00-e06c-08deb73f09cc
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:44:11.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WN2cuEpLCbji/p3aHkkH8HriZHGSPCuc7m3p8msJPsbFJuGCta+fSfte6S8Uw+E6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_064431_879204_342D1D07 
X-CRM114-Status: GOOD (  11.21  )
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

On Wed, May 20, 2026 at 03:35:32PM -0700, Nicolin Chen wrote:
> @ -3870,13 +3870,15 @@ static int arm_smmu_blocking_set_dev_pasid(struct iommu_domain *new_domain,
>          * When the last user of the CD table goes away downgrade the STE back
>          * to a non-cd_table one, by re-attaching its sid_domain.
>          */
> -       if (!master->ats_always_on &&
> -           !arm_smmu_ssids_in_use(&master->cd_table)) {
> +       if (!arm_smmu_ssids_in_use(&master->cd_table)) {
>                 struct iommu_domain *sid_domain =
>                         iommu_driver_get_domain_for_dev(master->dev);
> +               bool ats_always_on = master->ats_always_on &&
> +                                    sid_domain->type != IOMMU_DOMAIN_BLOCKED;
> +               bool downgrade = sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
> +                                sid_domain->type == IOMMU_DOMAIN_BLOCKED;
> 
> -               if (sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
> -                   sid_domain->type == IOMMU_DOMAIN_BLOCKED)
> +               if (!ats_always_on && downgrade)
>                         sid_domain->ops->attach_dev(sid_domain, dev,
>                                                     sid_domain);

Only identity should remain with the CD S1DSS STE, BLOCKED should
attach the normal blocking domain still

Jason

