Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9C7106B53F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaZZNlwpALKqnIOmCpcXtoxybd3Z4ZmivEBsw9olzeE=; b=q5NYZSWtpo9H0CRp9X4M3H7odd
	rhvdSsdmirA4Ka42JYfnl6bD/nKrRO7l0JIRuTcxhTWyAxNTB/Kig6/93KdUPG84zpVkPGTShYyDr
	Gx6/11AxACSoRKxJxt34f51JRIcSl4NgBz5IO56Mn+LFDgfmHp/VnZjDvNpS3wEuCej6aKfo+7fy9
	h8qY1zMBsmZFskuvS+wlcx1Hr/PGAoLTlOXlJDOnu7tQPFnFNKCgkGlLbwCE0/foRbiki0/wJYQxU
	EHT8C42iUQxeEAA5UsBM+ymrsHVnnp+194e+r8syHru+TRN9aqe2X6XSr/SUrJovStvfVskY0d8d6
	pbPc8BZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OyN-00000003Xj1-0HgH;
	Wed, 25 Mar 2026 14:12:39 +0000
Received: from mail-centralusazon11010019.outbound.protection.outlook.com ([52.101.61.19] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OyK-00000003Xih-2Q4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:12:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcix3eWZrec+nT95W+JLkSwdRVB2NTzMDicglykDwbCH/9/b9fiRzW7ncgxxtl1QFioV0EQMIKQgzBjbEbdPxSlek3CevGGyHl8kBrHBnS1P9SQ8SHqSy3ZjgEJ1bQHCqlx/3HC6ILoUApMTFz5gYDbrMh5yOvNU/sjT/cYBJHW/CdCQkrk1V8P6tNgZt4LQRP9AV0t21EubY9Ddad3wKV6MNZGowclGbhY7kuwDSCgYaNHOYaac6BE7ZJqKeVR1eNEEnv9Np+tMjnY+Wg7h4gwUJHjkH/LanE/EW3JOjby7IiUISq9XxPmKYzphNvkmTgij/+i2w3VnEPrzw5GbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaZZNlwpALKqnIOmCpcXtoxybd3Z4ZmivEBsw9olzeE=;
 b=JwljUWtH2GTK4FSjep3saxJ+MwbX6efxYCd1nEIZOeyDK3Sx1voJ85L9+EJu78CGS0F0cyNgauycqf5ZCpHdrGqj2W+e86pdJqurFQRGR0C0gpWm2njmRc8WjAL+MzWJXQa1NiOsDuekjELAAFPDpejCJgiMQpj9pndtJ613aptkUkWSkBiQF+v80DWG/hAILbgnpOUdcoCETgr/63yDCo0vW/i6vl0accJ8bvYN1h+v/ZhC1zJbbzqUNPGB2eW7O66aQCF9MnGYFYG5zKiDixywBZfyjDVSsYvs07fYV9wCNusRI3axvAjCFy1UDMFURTjfIxiEKIJvs6WISp/DOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaZZNlwpALKqnIOmCpcXtoxybd3Z4ZmivEBsw9olzeE=;
 b=K35os7zjmn2Yba1ZP+7lleJzcREnuPQFnRju/0o0TZU8cdF6IMbffB/DV5WtejTIi7O11jcuTAJiGEfD7YHSRmLfbG1sq1soCanulPPRHx3Xzcc+JhIl/YbNpq9wZY6II9sSJknfhfIruoKNaqY49bmKDChaZVkGFGs4kr+CDpaQOC4YAVCdScaQWvlJI6uVkvvh09RjIz0iQt9lqjFIoRcJVb0O7+7Hwu+D4ouH7ZaCMAiIKlSE4a2EQWxHNHGjVxinb5AT82Jb+BbJdRm3YodH0RjJ5rSy89qvlavxjk4Awm9DupsjUK3oLxnqy9GtSWQYv4FD7uzhSh/rCHfyrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB6639.namprd12.prod.outlook.com (2603:10b6:8:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:12:26 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:12:26 +0000
Date: Wed, 25 Mar 2026 11:12:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v2 0/7] iommu/arm-smmu-v3: Quarantine device upon ATC
 invalidation timeout
Message-ID: <20260325141224.GD67624@nvidia.com>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <BN9PR11MB52762F94146776026CA203248C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <absFXmFcpG8O7uNB@Asurada-Nvidia>
 <BN9PR11MB52764771C48B39C09F129F218C4FA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <abtpCXAnqLRnbG1z@Asurada-Nvidia>
 <20260324000321.GX7340@nvidia.com>
 <BN9PR11MB5276DBF0624E0EAEDC54874A8C49A@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276DBF0624E0EAEDC54874A8C49A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN9PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:408:f9::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e30bdb4-e6bf-4cea-c15a-08de8a788a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: iG4FJiU+jsnmhau4F0N/IodLn7Be/r3uFkUbLiC/Qp44ddb6VkIfmZsqiQPAkdznmt5zMxyBR42xQNFGABG9dSvf8mGkzwUYvQJUvMm9DYLykOHknO5MCEqsO4rR5gy2Bs6nSS89ed/HDVGcy3Tmz8NLFl2WPg9g/2yT04uvoQp7yt+zuVGjuHyh/a6T6/AVvAHS54P0FI5y/fv2SoIli2SegbKN3WQbRuHUaICyw0adTv9KBl1alo5V9ZySnfiSITf/6SNix2h+fyjFFmxiOgRLf+6n+3cUEjTpoSqZ2J0fKufDnot5ZxmpmXg56yIkaYmI1IuDKtrXpFB5LRZQceTcvAlmuPe5+N4PtLVGA5SCPhT6780x9Dg1liC7birDwxIu7Y3ZLNpLLuzUPFyelRAHkX2Czvr2V/Ze7IC6hxrM1LQo4tVELKAcqUZCAlpWIiiwMAPp3+QNfxlJByfvFEYQ6EuCDuG2uH45wRiPiorZHQhgc3mgEENozPK+GryBf60iVv6Z3ticQxa9FG9pc/IrecABo9tlq2dJ4QM933x+3K1yf5iC1EC2Nv+9IiJ6j+kcsYrxBQyAeWEel/nt/jrWudhtbQ2aDi4AYgMLIKfmYJVITwnlDhfAsst5nktx9nIgLw+CP2pFLzSwOYW56AP+5ikso4zTRcA6iAL0mUUk+bsOqRgEKXQr5YPdp2HFMHndo8g6mDPY1PHleAh4FqNkcWXHTVVulYlLnJe/4Y8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lTK8mNWRDSe+ytW0BPwqenammNUprh+rr4HxMa6hL7WEZ6xmtenPI+3cNjOC?=
 =?us-ascii?Q?bftaEyJx7j2Z7qANLY08UCghfaPMw/K1k/dfRkfR2nAengwJ36qn9jgq67cl?=
 =?us-ascii?Q?W60ylT9ITMBbuW7JAIoQ6MUwiiKRL0nahLq/vxCc+k8Fl7FCJmE64rklDdn2?=
 =?us-ascii?Q?oUrkitTLPezQcIH+uHGGsIlb8ZrujnMZINTuK50JfBlqOsCOQ3xOOQjsjgZh?=
 =?us-ascii?Q?Jyj3pSnIMaFrlYgqCagbPvK4tKjqG7UVilBhLKhKRZymt74XPnlKjtUwrRm9?=
 =?us-ascii?Q?tuqwf7J7HwESjlZ2mqjq52EQZyfn4NDIoomFc8XX4aUhzlXu0bDJ+xyJGyCr?=
 =?us-ascii?Q?1bHnqHuX4fZFhQEgx2u6rsX30egenUabWEFPgIXzrjtybt9bNxrp4RRvv2ib?=
 =?us-ascii?Q?fGfEeLCMv5U6ljLq3C7FmgOZ2Y3MdtwKzxRhQeh5keSjkyIFBwwaDDPEkF5O?=
 =?us-ascii?Q?6Svu1zPvNGs1lYKIcZ8yj5aod/nLENnZKgAIurBAsTtNCiWM63qzLxMkdsYu?=
 =?us-ascii?Q?BAreKlEvSqXStSLQ10pcYCSCKd8F/+xXAi2Ude0tmoGgfYgguHsr5pt5/SfW?=
 =?us-ascii?Q?8AxKCnxd4bqfuzcd4UW8E1l5XVazTlI/L7qB1xf66T0C9+zUlivyUayxfyP6?=
 =?us-ascii?Q?h/oEm2Z09BdASqWPSq6VepQMjXMdWf/q5wwXNwia1wg/oD0oklNBnU2c05tF?=
 =?us-ascii?Q?jQTDbjiaa37Rg9aDcZnbi/v1LTR0Piy66onGzeOa3/7g2pq82/D75LlRBR8l?=
 =?us-ascii?Q?CgRDeX93hUk21hCP2jMJo3NlxwAk2VO0dDoi47Q19UihYiVDNrdTJZD/UzPp?=
 =?us-ascii?Q?JeMrVIk+HcAQPQKUYXXrdJoDTWs2hTnJ5f+HPVQHH8sxVfx+XTof4J5BM9UG?=
 =?us-ascii?Q?3hmx+OUhFRMrBFGf4Pv/gOf3JtlwPKm2KB6ZTcOUlNfCV8JR8cBOJZJBlyaA?=
 =?us-ascii?Q?ppP+1INIo3DIoFC5TAS+/onb9QbvugdtAhpwlZRwOhvyqayYE5jqCDESrDgx?=
 =?us-ascii?Q?l91Ps2xpBUrPwFFhDsexObSuAPS5RQ/NVK1h3IOK//MvZ3c55UGuZ+8cTqai?=
 =?us-ascii?Q?Gdl8DZaocb+5/mcJ3mNzFJfigs8eE7cRAXQGJpCV06XmtGl780WK8zvnE4p2?=
 =?us-ascii?Q?3A+aaCP7ASfRsjg16MUEJ/1nXGoRp7kTrh27zxozHnFOH93rfnXZz0N0FVAQ?=
 =?us-ascii?Q?WpyQl3IJ1CRS+6NUN5tSYJxHf8InpR2De8MmQGBj62xZ1XCGHOEa0joIrCtn?=
 =?us-ascii?Q?8CHZF+KGfHI0d9vBSr2ZwZ/SevletUsLOlmUaIcTbpP7aWFtI53iJdueiDGr?=
 =?us-ascii?Q?b7BUJ8YApX+pNFXBov5EQfSokl4Z3qx/RGfLt+KvWUmfmSmXM/7O17sw/VGP?=
 =?us-ascii?Q?Q34nO4ujNdZbAF98e3X3jufsdPZqk4jB9UXUG/Y5PNUvZUMNQ3d7W0eM1gaN?=
 =?us-ascii?Q?WSF+5ITVN8eT3JVtPrFLWQ8mRat0QPCfaWcLx5GFoDi1Xt1rGP6l1iCrgS1/?=
 =?us-ascii?Q?f5zy/WCwHKhUarMHUgSa0AYYaei3zD2g0+iROMjI2B1hfYu3KmgQHwR/Flpz?=
 =?us-ascii?Q?8rlcfWNYqP8mOhRKc38YfApX90eR+TkeUzHrHtokubsHsNY77r4j4loC7eQb?=
 =?us-ascii?Q?RKO8JfNe9BwlGfBPavBo5UPTGJ02YWygYr0e6ubK515C0ATgPCT1nLAAhCra?=
 =?us-ascii?Q?ELkiDxrZvqu7sJcTlMNdMQAqm6iTEgnIbUGoF1MeEfjQxpMX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e30bdb4-e6bf-4cea-c15a-08de8a788a89
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:12:26.1006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWArQAiEzetfILr0D7DFF82OcTVHl1yoPBtxat65Iv9StGjWN+SwLRCwmcQdxM6H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_071236_615842_64EE282B 
X-CRM114-Status: GOOD (  10.64  )
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

On Wed, Mar 25, 2026 at 06:55:40AM +0000, Tian, Kevin wrote:
> > I think this is more of a feature (RAS support for SMMUv3) than a
> > specific fix.
> > 
> 
> Not a RAS guy, but below is what I got from AI:
> 
> "
> RAS improvements typically involve better error reporting, graceful
> degradation, or improved recovery - but they usually don't involve
> scenarios where the system continues operating with compromised
> security assumptions."

Right, so currently there is no RAS in smmuv3, if it hits this error
it continues with "compromised security assumptions". Adding RAS
support is to avoid this.

Jason


