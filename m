Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5056BC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfKIs20TGamjHe2YUoTrVlujIh7ge64cv2bHEZE3wJk=; b=ddMgB4u4LUDG20HGGyyw5euQuU
	wkufJGK/Hl9bQ4TDKcoHAdVNIQfo11x0cSOP7NkRSfyF74f/JXnZtMcQcURyryoGBJPxeUB6D6xp0
	fetSeVJK8bZi8PkTY42bpNB2h4jL8n4040p+KJtARTaFUqxxZGXMZiW0LVW8ifcO5QNlY3Ij2N6xb
	3Z+eCVkA4s/5KIl/xe89NjCzRqVz59SPPe1aQBDk6wSjBPbPfxaqDqckpUhjy6n3x68gSNmRzkS1N
	8z8SUEGdsYAIO+4gZulHh67+5dcw8wYpik9P8d4BYYAbA3RsN6sgdVwC98x3bri0ENPhveYxA6h63
	Ld+7DJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3OOn-0000000F9Kz-2IkO;
	Sat, 12 Apr 2025 00:07:05 +0000
Received: from mail-mw2nam12on2062b.outbound.protection.outlook.com ([2a01:111:f403:200a::62b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3O2r-0000000F7Aj-2TvE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 23:44:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l36BHd3HHi+AqKnciSCyvgiW7dMQpww1L8sgCZkDAlGGni33gTOWj7ztGdHrWH5fIQ4ukgmuFBbNxVzIE4Hxwwg/7JeqmIisAKu0MZPtfQcs4uXlkJ8paiIJKr/4uARE6iyheX92CayCbV4aH0RPAdYUP+szOleXDxtriJThbLP/J/D3U5VcXbZCGN4GDHBclCzMYqCBwr0J2CmGnZfh2aAy/T/RElUku7TErH02Lj3n5DD5gSDgySfnptDQ09wDxaqHmcNl10coHeuORme7i/09Epo5+eMWcAvriOQDgCUhjfZCJeDbnUw7wgfVcUa9OjCjOYwulMmuFH4koxt53g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfKIs20TGamjHe2YUoTrVlujIh7ge64cv2bHEZE3wJk=;
 b=On7PSJAfH8v4FIphyz0r+u0UmZVl7SqUouSFPCxDW3FrFOz2vsBaEmoxK4RElqYBx4qDB4lEhVA8C4ZNlbRJS31UQXFCYrik2qX9daMzYyo6CjUT8Uz28K1ii0/hI21KisRXshanNXiDnabfhLCUan/FuDyHbm4G2O1Ul+PWrbokER1hXHTW/hFePdNeAUV5om8AarwjchggyzfJOQALGxQoUQTE7KNUhSaoBvNpGS1ddubwu29HyizyIQuVzEN2yAAAhNLjoB6yqGp59h8yyUmyzmZjMKy1ZrmJ+gYb3JlXSH6QTOcHXAbVD57YgB2N0BQKpFZmU1hQIf07H/PgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfKIs20TGamjHe2YUoTrVlujIh7ge64cv2bHEZE3wJk=;
 b=bjeodZmqDd0sRlIjlDcRwcRtS6g+r0S+IBl958PfgI25ZiqlhAgGcWoTx3H8hUuvlWqYx4YIepqHf/yzt3HjZQ9CxqfKD9kfe/dV85X466jwC2l/nQx816NEVLYmLBYcA85DSx3tsDcQeyP9AQKA+vY+qeXmMA3UZG4P0tU0yXOubIYxDqdgBDHGiB5pa068ou8OeWJid3F6YnXeIvqdQtLup49yVGrFzuqciRSCOeoTNtGlzEYH85B1UBIcX2lpybXsq6wzM9IAdiUgw3jIQbXVbFX32uYSPEqqHDA4K1biTrpo6cyzrZ/NoNgNaGlXkg8k2pFIQANDQsHeklKvVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Fri, 11 Apr 2025 23:44:21 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 23:44:20 +0000
Date: Fri, 11 Apr 2025 20:44:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, joro@8bytes.org,
	jsnitsel@redhat.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow stream table to have nodes with
 the same ID
Message-ID: <20250411234419.GC252886@nvidia.com>
References: <20250411044706.356395-1-nicolinc@nvidia.com>
 <5c8d16f9-246e-45d0-aaac-45b7712cefb5@arm.com>
 <Z/mm2EQAQtOqpVCy@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/mm2EQAQtOqpVCy@Asurada-Nvidia>
X-ClientProxiedBy: MN0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:52c::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 17883d26-451e-48dd-cced-08dd7952c802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i5QD7MSyASJcOgYN0ig9xz7l/ZJaTtfAVO7bn3+3ZA3J4haXRDhHTcthWAYN?=
 =?us-ascii?Q?kNxqSI1AqaWSV2rMzdF84jE/E4euAPppKO1SG3dIqc8S5zameyXhdxun1Mmn?=
 =?us-ascii?Q?FRCwhBtXbb2URKz3J71LHd7IdYsFJWj+Dhcu/vIEDU3YRIhVPD14toP7oErK?=
 =?us-ascii?Q?Ha0juAhajtGnw7SBu7k6ludq+x14+Zb3ng31ZH1qPZrnjM7kHqKDi0Xyzff3?=
 =?us-ascii?Q?o3KDrrIautLg3OESdbCTexONrNrEMI7NT8uploCp6CCkmX8BBzMAd0d0Wttn?=
 =?us-ascii?Q?04LJQdLRkpBxjnYE54Rj5B51xM7THj/mi3C62xvkPnnO3TKBtJruW2Rlmk+F?=
 =?us-ascii?Q?JajwNVOyvTiy6gEXWHVYUXbSdTaUZpfpEyY6KEDctC+IOT8GybRFNtSCZ5CV?=
 =?us-ascii?Q?4XtPnDjc3yumV9yuAAEOogCJV/nqbH2VtJ1xB6yEXLlC4AQhMM+SVOvl1eeV?=
 =?us-ascii?Q?18gj4udL+NvPBwWll0wyLxKOJ84Bw/yKmU0Iw0cS0addHDXm2krUQy6Y7iIO?=
 =?us-ascii?Q?qaDYQsvrNt4L9uhBWHAYmFaM5FGYgQQTgpUmZDH9i3iiHc05R9gJ0vxtBBFK?=
 =?us-ascii?Q?pMelUwLOcpvk3ZDXv54ZLOvhocrVUU+MkLwHMPTo4TzeqNSaO0GxVecTDdTa?=
 =?us-ascii?Q?fIgOGRbPahGWZVj3eBr0cMlTJUbkuMgjmT9MdhEaW6r2DPETZ5R7+9ZKggxJ?=
 =?us-ascii?Q?Eo91konSTKSfw0Xeq+WI4WgXdSy8bJcJXpmHGWBpVEi796bEN7IYNP/IgPGh?=
 =?us-ascii?Q?q19XFuBAxKHjJPsyGvKybDXM2M3Y405AMCUbyJtVJ3zwM3+4lAkRw7CA/Ua0?=
 =?us-ascii?Q?zgrPeLefMSzkCzztdo0etzAGs7ZNk6raPvpEVZNyChHhW1Q5+toz+EuFzvCn?=
 =?us-ascii?Q?KwS9IlNHQFQ0XR8J4lq5NUIKDjkBn8SSYJuL83EK7a3gdmPZrBHZqZcZDtF3?=
 =?us-ascii?Q?sDLXevjTgyvK0rEqVFMk8ECDRc+RNkmVdkw1lq51hH36mB0ecPxh6WvBQt0K?=
 =?us-ascii?Q?KOTi+7PKZKD0KWzmVDMnad18gLbwyRwFXBNbGmHccWFBjrcBb2IqByEKbymu?=
 =?us-ascii?Q?2O6azdnbrkpUgCjU0MsYMwfiyBk7rJzxNqHyam8/yglLUNiwy5m0E7RbRSQn?=
 =?us-ascii?Q?48S2nI7NEOOH46cpREAAAqWiOdS5lfAttwD3DlG9hHOtyJh8xKsVsoyFX+zu?=
 =?us-ascii?Q?N6F7n2mDCVbvrSH3L2+Brj8Vihr7wiaJ0v/Q5zSfVoDFaYbrInzvtcFvyB7V?=
 =?us-ascii?Q?bjSbvkbwEkUL4L1C3V1Jsrs+UE7ZbM3kvZAQEgz0VVICz6/M8ga+7C8AFagm?=
 =?us-ascii?Q?4jKM/EEuXVXz9DLNbeqC9ZgWL5a7a9snzRTfiE9SvdsauJQUoz6MnB607g8b?=
 =?us-ascii?Q?goiOAWYO31IFcvy1Z0543hMOwicJcPxkGP7G8vUtDBALxwjE93cbqlIEHKMb?=
 =?us-ascii?Q?8z1sWNC6Q24=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jhmUNCOqk6jmBQ1+K9wb3OCsFT4w7msCR2QPAsSauBm/U2L0xAo2ld4Knprk?=
 =?us-ascii?Q?ebvVGXOpfghu94DVKT8wipDq4/bcZqPeCSZaZec3NQmBpJ8/xA+j0G4nGaXU?=
 =?us-ascii?Q?nDcFM3DU4T/7cejWaT2CuvWdihlUltemTbc0xPBM30rD+aqLHG3lRiERtMY4?=
 =?us-ascii?Q?GRnOUhNkwzx5G+RscBr2d8ZsWYjpXlYPq80sVgpQKFmb8HPAqaPJO7xopIs3?=
 =?us-ascii?Q?WlEhTvGVz6e+CqNEoutoL4nn2XXBHVwcOroQbvzmeaUaLiulldGC0efnwj2T?=
 =?us-ascii?Q?c0bK+AObAWOkiUbpAAYdDsjSnnUwPj877hmDFEfatGjnLRTYGQ8lWE1aozBo?=
 =?us-ascii?Q?sBfDkcgtw0H4QniheKkRc9ypS8e3lxps0d3Y1WvnWqTsaH1pOosGv1fROhnQ?=
 =?us-ascii?Q?0IAKaWfxVxJ5AIbf0Ied0t4vWYyNAeCsNZpg+sTDjdIIkKhdJKxkjSx+x3Zo?=
 =?us-ascii?Q?BuTiK+21o4aBO7VRFN+pV90A7JbWJvx1xFZiVMtSCYAb6zN0IODnUyZtAhR5?=
 =?us-ascii?Q?mQQb9cmH6Jp4VgX/7HqCO6ivHY5swsGVbYnrL2EqfnxZ0PViAW9Q71/DCQke?=
 =?us-ascii?Q?jHDtZJGNLOeFMgIlGUD46XwC5qxw74ezkExxatm4b3ieLlkOx6v4s/EnoyK0?=
 =?us-ascii?Q?JE1QsG3UBSpKey9bwKrdnBUJDCCQxpSi1TqicODpo4+mwGZphT1rjjkq5F5N?=
 =?us-ascii?Q?n0vAIU6Lh5EnQdcTtorjT6CQK/kDMqtnti6g4E5sZ/2KqAZEOHSQoABnvLvY?=
 =?us-ascii?Q?WUvRGOeUsE0hW8CtWc53A/CuubDhHay5biKnGXgHjyBykenMh1OPqUxpBoNV?=
 =?us-ascii?Q?1ZM2rfUXX8d1ofulzCnyrzaS5BfT0I6E3r/VAIaaLgCHc4YpCHHjXsPidc6H?=
 =?us-ascii?Q?ATnscCN5Ve/LaRrOi/5WYkx63tu1jVQ9UfMOI1KfCOOV855K5y40rlHfHwST?=
 =?us-ascii?Q?ccrMRNyWplZK6tIHtBNgAHgt/ntYLEsrdXmrwL48+mTJaXfdS4m3dMRURVGS?=
 =?us-ascii?Q?Yx67JCwvuNtvJxa8B1YnHnXUfUjdFtMslSAK/RJQ1knhSk9XsmWYRSZpZyyD?=
 =?us-ascii?Q?qCGpBxw7EsUTs4p/zUniYCpiwEoceAgATBSsVn909FESxFC+GT99cAOok3EK?=
 =?us-ascii?Q?G7kejJyaRY4G89Zk6okqq4aycqhsi12jPJgtQoI8uhtQsSwpNZNvq8Xspo7S?=
 =?us-ascii?Q?kxYCr9gP+T7Zn3InG/n4FzHWZQjgUjlT9HY2EsFudILK3Nw3XNbGpIQAd1OG?=
 =?us-ascii?Q?YwE34oS3ZHIegfdMs5THuwrM3xrnmFdmumgVGMm82BqGp1RMr4AYzI/6yS7l?=
 =?us-ascii?Q?idIsjlVKAnbQvlpWBZ0LYk2Guu25SOYA83+6FajnyEJQ/EPin7yPnBbv4oZc?=
 =?us-ascii?Q?9YSLD1kXDC0AqoT6osDp30XLv2g0Z3/mvRcOlP3vAAKbu8iZEVp38yIVPfUn?=
 =?us-ascii?Q?ESkQV3iO2YFnVEcmyq9auD47AinEdiHs6ofW8CqM5nIA8DtmCePwrS5UE3fS?=
 =?us-ascii?Q?NQO09qAOpyMNYzw9GGyejYeS3ehuUcQL0YDgpgu7l4PgRnxTCnEai6iJao3t?=
 =?us-ascii?Q?qhqBoykM6+ZebZXFbTiEP2RBCf6v5tP5vVFfGW7W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17883d26-451e-48dd-cced-08dd7952c802
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 23:44:20.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsRCfr50GcdegleNiMWZWpHEb+Z3eTYWysrcK64vEDF5tQ+iEE/kx1NFbDKlxe/o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_164425_633313_07D49B31 
X-CRM114-Status: GOOD (  13.17  )
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

On Fri, Apr 11, 2025 at 04:33:44PM -0700, Nicolin Chen wrote:

> > The bridge *does* claim its own RID, and per the aliasing rules the
> > devices behind it claim both their own RID and the alias to function
> > 00.0 on the bridge's secondary bus, like so in action:
> 
> Yea, I just found out that the bridge does have a different SID.
> It was actually the VGA controller itself having two fwspec->ids
> populated by the IORT code. Then, the SMMU driver allocated two
> separate streams with the same set of device pointer and SID:
>   pci 0008:06:00.0: arm_smmu_insert_master: fwspec index=0, sid=0x10600
>   pci 0008:06:00.0: Adding to iommu group 21
>   pci 0008:07:00.0: arm_smmu_insert_master: fwspec index=0, sid=0x10700
>   pci 0008:07:00.0: arm_smmu_insert_master: fwspec index=1, sid=0x10700
>   pci 0008:07:00.0: Adding to iommu group 21
> 
> Perhaps the duplicated fwspec->id should be avoided in the IORT
> code at the first place v.s. bypassing the fwspec->ids[1]?

It is a much easier fix if all you have to do is ignore hits in the RB
tree that match to the same master, just don't fail on duplicates and
don't add the duplicate rb node at all?

Seem strange though. Where did the duplicate come from?

Jason

