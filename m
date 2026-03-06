Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06907FCC074
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 20:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nl65mA9aLs9Jpmrg0/fX8aSv3J8XGdNl4AkrrEB2iq0=; b=iFwMBHzk8bTob0jBnY/nIW9yn8
	CqchCYHEHVVNsf/ACM1fUo/g6aL2xujZxd/HAkuR1cTA3fZ8ewff4frKzKmhZn5iPoEhykHhjBgcq
	WZCeanrZZlgB5kqxxrY0TqRuBmwDfjKk+eE21+fhEZWMwESZvnU9IzYBBhBY7NHKpNcU9ZjvVS9bU
	7RcHmLn/q4kWWHmBWdn1BQJRtvpRM9NkyCEkOQ2M7ZhscBuDVbHgDdurZYds+pU+Zwfn5hS0Loa1x
	XDW/0FGTlrDGbmQ/QInkpMgbopkNqWrCiDx2O9amkLkqn0crpS6NaZd9gnq7Xd1pIKsf3BXOplwjL
	KhxoyRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyblK-00000004Tgu-0DNs;
	Fri, 06 Mar 2026 20:27:06 +0000
Received: from mail-westcentralusazon11010059.outbound.protection.outlook.com ([40.93.198.59] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyblG-00000004TgY-47eD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 20:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8xSP8bpACUbxAJhKcoBMj0o+huHvIaQUVjq2ds2bPb+TrbBr4oViKNusL6vnEi0gDRDTeo4ftU0yAFUn7gL8TNMbL7ovLDqkv91KuZK4lu8y0a17Yl8HAN5TzRfMx/rxMIJPhXuSmAjnY8A9z9IS96G7VQNcAiI59//Nwkjt7Z/LY707TJi8/lJ/lxlh+GTyLntGTEAFrZVboYGp+TZsZe/VRh1B53BP2Le53Tgt0wda4LvGJkkYUu/eqW0yJqT04G0ioX67s2LWKToMnfmUGZf7HGfUh1n09gB8sDNygMHRvBXawBoTyGeVO4N4bmJCdr3lzoTocfp8W9yMa+Xnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl65mA9aLs9Jpmrg0/fX8aSv3J8XGdNl4AkrrEB2iq0=;
 b=lA6ii3wuE++oPspdJYj5S8st7bravw6y1sQ/8NuJLNs2CwMaHn6vfuXAUhkNF2CR7gPvRHqfq9FtBH57PmA84VRSW+e57Mq7lFT4n/fGyub4kpGzWvH9EQqNwB463YQZ4KMiO/AhQ+gxjTqTVycTfRDn2u74x4aClOp3n9orn0PTY2u5rmTR8VjbOmJe6xIA0j6aegpgDU8v7D5WpDS2AC5leLFsyHA4qxrFRkL0GFxBZBhWYJv/z8VJO3F/j2tgRrCnDhlYq31dd1fmNKXNlsjUxQehvqmOd3O+sSqtD/MGG/xNs92YqiWTAaucjGBDG3/DUEofZpzyLjYzmHvxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl65mA9aLs9Jpmrg0/fX8aSv3J8XGdNl4AkrrEB2iq0=;
 b=S1AHiPGy11UIgHnWAMNNg4RlpEB10oBaJwfdEZn7e959Xe3wAlePf8Kl2eRv8iXnxqOXOudak2fU88PveH/sezx7G9MKfBJfdK8W686Gz7DmJN6osqfvVbKjPfLeqb6Ms+FTkXItsHH/VlujlsRWJgmhOns65gUFGGVxLnmTPNy73QnjwuaWqZWZIxyWaULumn69m5/qXISBAks5zBZ3vZYg2kXwWgk5+WcvfB7ZCUYG4Ux+hjHz3y8zG6Cf/6gn+k5WBOZbCCuhgo99zZYdU5MrDanH/SQlrAvIbeEA0vfO56MhvWjisGKl81vz0JetVL3BSW8/xCEpSTMvpJW5Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB9069.namprd12.prod.outlook.com (2603:10b6:8:b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Fri, 6 Mar
 2026 20:26:54 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 20:26:53 +0000
Date: Fri, 6 Mar 2026 16:26:52 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org,
	praan@google.com, kees@kernel.org, smostafa@google.com,
	Alexander.Grest@microsoft.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <20260306202652.GP1651202@nvidia.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <6416b7fe-0190-4c7b-9a62-5da7d5eea794@linux.intel.com>
 <20260306130006.GF1651202@nvidia.com>
 <aasmWvA-sqi0KJwO@google.com>
 <20260306194312.GL1651202@nvidia.com>
 <aasv1HYOKuuJyi1k@google.com>
 <20260306200321.GN1651202@nvidia.com>
 <aas0dLwKmZyL_iOL@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aas0dLwKmZyL_iOL@google.com>
X-ClientProxiedBy: MN2PR18CA0006.namprd18.prod.outlook.com
 (2603:10b6:208:23c::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: f34447e1-3215-4b0c-34a0-08de7bbeb471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: p6hT6a9/bMjO6gvdkd5RKj0yDDp5ZKnJcw5GskXb2LeohlBIipxd1dAmqmqoG/d4o2pp8+dVQDQAC5pvhO86SCxUbja7XmVFN4zeDxMej1Wphyw+5UFMt4vEQOiN4UNVpZ6lf3ogwTaPluxkRts8Jhnjs8Xlva69cVPEDjZj8Btg90Pkz9ya7GXgebWRqm+YD32mmPAn9PD4HXgIFXP4x/ph3WPdv5yRqby828pg5aeeZBChVmBL/ggWySqGurNGOlRG0XyAOcG0F0YVepht1KltmH4g3CKPW/4qUiWXMinfI/0F8U6X+c/Fv3NaGyiimQTZTC9tddDRtddIFq86rGj+JEQiDv4IDSOGAzmF4vjeZWRwXYXvCUvIvhk5a8SrCsx8tA93Pn5MAMvwyVjlQTePWD0OftKe6JpV9RHyfo/jfRrro1vCmLD41Dpa9npkHeWd2DZRModi4P9zKmdZ+UHoosXNkY7y/ujEh2/DLnBUyFrs2d22JP5nRADl8UfS6DIlPuxpE0lPbmDR0uSDPh2r7d8VXJxAHHsDjzUhsth0E/gSYfwiNl9y5Q1EGNmMiyJTT+33FowMVcvk9zp3X8pOEmHZhFHpm8xEe4BS97xRooBEsXSKgpsiMAGR41jV4DrBE/mBsdJkxr9PB2XZ9MOBPzsSDeujw7mZE/DNX0dR6EekNFrm60YsX1bfEUkNpdbusg0LrW8kKaEUUGE8A1VNHcILqJZRi3JDRcRVcqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qfBCN2GJYY9IuvO4fhOWVSug56veAI6NONWzPT4ypBxghpIUiKhTIG1Sqax1?=
 =?us-ascii?Q?MZc9iMPFnOonS+4IErgpjCRoSJvtVlykzgC4PRJV7FDh+TGa3GqKvw/coOpm?=
 =?us-ascii?Q?3QeHOHABQ2SuU69RrvixMRw3W0yLOJCrD7MdmpaQwH8JWS5Lqnz0otR5leQ5?=
 =?us-ascii?Q?8dkW7sRDYk4qULEoV+lfw/anI//GEdZuMCmvdKjJPuWUBy7KElwVqo15UaiC?=
 =?us-ascii?Q?JP03pgWjdrFarvd8iQvyxq2UEbadtqZuTljS98AF4h6u7kmOxg7/oOdS9Q8M?=
 =?us-ascii?Q?wooprT4gWA4ELmvMlzjdP7RthtXwzKejmVI5PeRsl36XBnuRDEIGfxnCNhYW?=
 =?us-ascii?Q?JaF+m94TXh3HWp06yCmBumnHH7IUumb3KFAAVgnQi1/tV4+OSY6ppU0pfHJx?=
 =?us-ascii?Q?VXaCU8pTfP109Er9hDYqNKsc7da8IfRIJk3CVQwNZjzq8/fti51igauj9/dD?=
 =?us-ascii?Q?HwPnup2X7GPNsKgZZCf/KLKJbNY1TedowQVYZzCfAfLlrHA99QJxUNmr4U3n?=
 =?us-ascii?Q?sKWAk7PH6rylDmyrJorefKqdsSVRd/dqcOzAvk4QeAK/B1niNlmaS4ABsh/m?=
 =?us-ascii?Q?f7ser7PxKjoy1b9cJj7GwDdXpU0j1Uy8oumkn9WXNKIJqxIvgaLgj6hqKNBE?=
 =?us-ascii?Q?luB1PS68/egvoP0klB92gKCGiHbswQj22lIrH1vlby2t0AiOsEKfYZkbPF22?=
 =?us-ascii?Q?m8f5rsb27qSZoFWSl6VnlvLON1iH5rchaWC9itPMM4XR5Uf/IOIukqwFDzKd?=
 =?us-ascii?Q?Ir/funk8fuNQgbOxOKMIcFEsO5cESM3vvzt30FpJhZ5t7wLwBsBY+F4UuO53?=
 =?us-ascii?Q?WWJRF2kTdCEggWG+5IOAfbQwLtNiFzzyraeC4tCgJcdxI2l1nfGv3/Zr4fHV?=
 =?us-ascii?Q?5ZUqWAN2OyuoTODRYNf5fcxt2h7sDT51wsz11oeXE/LpwleaXL/lUSYE51E1?=
 =?us-ascii?Q?ffZN/IegcKM/SApR+6exU7A5tK3kiAV6x2MQbx10KLiHGpRzEgRXpeKO2l9F?=
 =?us-ascii?Q?ADW7pV6kk8BNX6cRbE3yowjAnEquMoAanLnq9HhwOO2pE4KGQUo5O2TFh8Iz?=
 =?us-ascii?Q?ApWZegDX62GaQKR0w539uzeJhDNpOTxFd62TwXnkTb6dpxF8pDsJM7zKDwZk?=
 =?us-ascii?Q?yiHr+KsEiQpoemXZ/lbk64gCquOF/ty+QhTgiA+n2AIGcAMxUfEiJTvdRucY?=
 =?us-ascii?Q?3EWUGF54C85slqW0yzbi8Rr/cyi8p41g9ANnHTv88frsIq/HaSgNQD1gZpej?=
 =?us-ascii?Q?x9eBo2MZcs29FDPW7rodZvvu0ttYP+vF3knd3l+kdrcZLxn2TdXa8SsO27a1?=
 =?us-ascii?Q?1l3GtqkAPaZBe4f7lceXPCM+LYYbzHAUND1A1XGh9X8lhfIZePQ/mR38/CIf?=
 =?us-ascii?Q?0EPGN5VDKVHB6LvUyXvKKS4ANl0do8puHIvm3XEcamZEn3ylW+z8BhP/aS/9?=
 =?us-ascii?Q?no06S59wT8NJ0riTR9ke6BC9dsINSW/Zz/SzRAMuAT1ZiVM0YrVwBbBrNO+G?=
 =?us-ascii?Q?y1RNNQnpqXieU3nObDr+P2FTIIVhshq9KsVEWAeY0bCY4Cu0d91ZeWRkjd3l?=
 =?us-ascii?Q?QjaeTWC9EH6UPu1tLR3BEHvYbfG6IY+7M0KBP9zLw/J1tVZ0NbKN4Vfz1q9G?=
 =?us-ascii?Q?qLeqdZ1QSSAdd6kPUEW/Ev9I4mmslkekFXDEjmgVtna/98bM2ILhwuhvrOGI?=
 =?us-ascii?Q?PT/Khyh35/u95tNJyUoTByEHumwl/fBoz/JCJWs+7g91i1Rj15eD5VATu4IH?=
 =?us-ascii?Q?00JgCYKvfQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34447e1-3215-4b0c-34a0-08de7bbeb471
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 20:26:53.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kq1w5kVXvIPevqWhj+87mCnbPEkg3HMn8IG2flPkuS03qnrKj5CXIdzEPK+f5K3/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_122703_045518_75CBC857 
X-CRM114-Status: GOOD (  15.95  )
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

On Fri, Mar 06, 2026 at 08:22:08PM +0000, Samiullah Khawaja wrote:

> But do you think doing the timeout logic without fencing would be good
> enough?

It is what ARM and AMD do, so I wouldn't object to it.

> Currently VT-d blocks itself, until it gets an Invalidation Timeout
> from HW, and system ends up in a hardlockup since interrupts are
> disabled.
> 
> Are you concerned that if fencing is done without an RAS flow, the
> device might not be able to detect the failure (if it really needs ATS
> to work)?

Yes, and then the device is badly locked because nothing will fix the
IOMMU fence.

VFIO might fix it if it is restarted, but other approahces like
rmmod/insmod won't restore the broken device.

So I'd rather see a more complete solution before we add fencing to
the iommu drivers. Minimally userspace doing a rmmod, flr, insmod
should be able to restore the device.

Then auto-FLR through RAS could sit on top of that.

> I am thinking, we can do translated fence and timeout change for VT-d.
> And the device can use existing RAS mechanism to recover itself. This
> way we atleast make sure that caller of flush can reuse the memory/IOVAs
> without UAFs.

Without a larger framework to unfence I think this will get devices
stuck..

Jason

