Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482A7C369D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9kku1LfB0Al5Gh4TT1Vi/bOvGvlWSoT7VeD0UGEjKs=; b=I6aYu9rOn94qA/gnXaqDgipBQ1
	HfcYjmJOfbndVVRJp3b2tfpm3yFBpsQHgK//Non2L3dxJU5EfneyyDSmA7pziLHPbz14vPPj71azC
	yXwdV8chDubctuVDSc2vIVeyRStqu+M1UI2W6L9uiMrvJpu8Vi6qFPoZ7MjvHDQfjm9L9x1FzA2jA
	KcMR4vO+7b3mAqngqAVWIWnSinzsWi+vMya7r1YTBfk3j9/QFfKpA90Ft7QCosHYDVdDxYNktc+X7
	Teutb4gfZBBy5wsbqghrZdILfjFhnTV+vkIvAoKx2fkZXtW57A00Vn/DW3QPmumvhZT6f912OlgRD
	3JiOkhqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tH2-00000004bgi-0I4o;
	Mon, 21 Apr 2025 15:41:32 +0000
Received: from mail-bn8nam11on2062b.outbound.protection.outlook.com ([2a01:111:f403:2414::62b] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tEU-00000004bHg-1S6Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 15:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCe+PEIsJ5y/t9EvTXlk7Z3z03VwYH51+MoN/GPFybybAdhhr0fSPK2ZC3d54GjChbkjsYaH83XaNROWLbsWeRna60blIPg48HUyH2aJT7dGqutL32XdrWQ7ht854Evs6VrILIvjhYp6QIigp1EoA8W3ie5ssJcMA0vxxWUV8q3L94bBUzSUg9FO5EH6YK92eJHFC7UOjKFGkIlSaYNJjuSPPUtbJZk8kIOSRAKpuh9pJus6cah0IrKEuC3Iht1HOnV/uZuQ4HvPrfjeJE7CPWOYzWUTxhJ8jeHEsGGPNuOYRGWTGkrXmSsUid93+Qv0Kk+6O7p7EU7y3qwBwbZIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9kku1LfB0Al5Gh4TT1Vi/bOvGvlWSoT7VeD0UGEjKs=;
 b=lpWSlRGPz5TRwaLCRiXfzf7a7mq2zdYq9J7m7TfCWucbgLwpCd9JG40vrrLWY7nyCKs7GDmtW/ouGbQ7X/uQtuV9HoQVVrMxqkHVi2DeBgkyY8p75qW873IpUNwYb/aJAd6mrfO91B0HtcaBEPnh0s1COHY0AKsOoa5sCUuijtZx1OTJgsRmQhuK9s5JmuADPQ8IdX/mFRlubv9UoifvvluWUk6lsOP5fLVulrkHEjW9ChPMxe2Fvp4NB4RgiwSR1qEvLIbtCtHe0le1tnGzmAMl/UylyyyV2WogsD7Issip9y3r73KLErfCr2t0GCqyOOS1KEjmLjNSNWdm5W0i7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9kku1LfB0Al5Gh4TT1Vi/bOvGvlWSoT7VeD0UGEjKs=;
 b=PD/WRtVR8CT5Y5Dcrkyx1qxs72quSyOeqznViFXNGIUtX8q89Nl91xXqCe7KZXauG/haf3M8veGG+dYaw8pIl4iX1kpCxK5QFIrXPv+5ACqaUeFvNSwKrIOfuHUdCXagr7sR4EFXys+y2OsQAgT+AnP4/xGxI2QM21FIxkS7tMsQT8bbThC8C/7TZaodTNQhJizH+U4EkEVCic9lDncDJQW6pMNGjKI3TLImmpc33xxnpxEP4yShHpzapwPnMg8eY4kGjgyMYXanFQBctj6fROuTmQrQAqIvzCszBrZX0GROg84TbYXCwth3gS7a+GYwREEy+DqXvoaEnYf5AZau0w==
Received: from SN7PR04CA0034.namprd04.prod.outlook.com (2603:10b6:806:120::9)
 by IA1PR12MB8336.namprd12.prod.outlook.com (2603:10b6:208:3fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 15:38:49 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:120:cafe::73) by SN7PR04CA0034.outlook.office365.com
 (2603:10b6:806:120::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 15:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 15:38:48 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 08:38:30 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 08:38:29 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 21 Apr 2025 08:38:28 -0700
Date: Mon, 21 Apr 2025 08:38:26 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "vdumpa@nvidia.com"
	<vdumpa@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "praan@google.com" <praan@google.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"jsnitsel@redhat.com" <jsnitsel@redhat.com>, "mshavit@google.com"
	<mshavit@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 08/16] iommufd/viommu: Introduce IOMMUFD_OBJ_VCMDQ and
 its related struct
Message-ID: <aAZmcpXygg51Gwt1@Asurada-Nvidia>
References: <cover.1744353300.git.nicolinc@nvidia.com>
 <db035b1fad8987558b5c435ad7f9350ffa34aa1e.1744353300.git.nicolinc@nvidia.com>
 <BN9PR11MB527607DFB6B66CB9B502B2648CB82@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527607DFB6B66CB9B502B2648CB82@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|IA1PR12MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 18da25bc-a5e5-4529-8f15-08dd80ea9bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4GmsrmWzPvDEZXAiBP9Z6s6jhgHLQSNtUblUkz46vk5kdh/V1FdhG+DEO8jm?=
 =?us-ascii?Q?mxVLvh3VEJ6pscDOD2gi1G++EYjBUw0K6/OlKK5ELW6qpoFZddRlXBycim7q?=
 =?us-ascii?Q?Ps8Cj3HjF0MFHxaxmMU+rmb9CNWsNT9LFHN90jeBkg7I/mBjZeFhJBgFGoSQ?=
 =?us-ascii?Q?LyAMLfzG16AgQr5QauLYDVP38jbrYeqWO06HAjDTewHh82iynggbTgH5nNqW?=
 =?us-ascii?Q?g5Mx1CJZp4hvQeu9l/ynd20Vdp6wR9+cuNJy0xD8pg7jk61hZuGUQhuIL3FO?=
 =?us-ascii?Q?LB9GWbRJ2C1FPUEnUnFxBZK/WgeMNqDyQDDKyryUfedmYcmlBsMZsBeLl1d4?=
 =?us-ascii?Q?QFSPlWacnrcl/93AISndpcQn+oLqHUBu7ga1QP4dIua8CQrjIrn7kXNPFXij?=
 =?us-ascii?Q?I06KOazYWF/TumM0wWXYfCSC81F4FAvlkD0Vr485poOaPHkdW//Bpve8oTVK?=
 =?us-ascii?Q?5WOH1T+zpJ4ecO25+P3QZORQH+9GKkudZfweDLCUIgCxLbBPbc3iH9DBjSsH?=
 =?us-ascii?Q?n9lIxFvz+9JfjzvzZLPXtuPSUDJ2dH/32C+5OrtqH7QUx3DZBntDnjwvMpyp?=
 =?us-ascii?Q?WzhqB7DuGWP05nlwAg+Wd724sTzCV9nLQNQ8Wyh+5i9LuZw8+AYm993lZ1df?=
 =?us-ascii?Q?v8sIUX5+OAflWw/5MBqfCuC1Tz9n7Ru2+zF/WRrwrdvBrNoRvNX7lExZMSLs?=
 =?us-ascii?Q?8zeR38Yhfy3fLvAzP0BheLYdJvHdsXjvFxafj+7BkLaGBwRzyLjpKb5fmTWG?=
 =?us-ascii?Q?YHevI8VepSocJhHt7n1kCMPDOOcyoiKG1kg+YzHm7DGjIg1WT/b3I8AFVbDV?=
 =?us-ascii?Q?ZnXaHs5Xu6SGS6X6bV2s5olWw/ut28d3b8BjvKPewJ332L6pQ5x8mJc9tHr8?=
 =?us-ascii?Q?EPOaBwRE2RnP96rbv0t6soV7hawQIb6e2q+Xcx6mUVI5rHhI+RDxUpP4L7nE?=
 =?us-ascii?Q?yQxJPLB2+Qq4+N9ydqL1PFx9vzFLTc6CxNfoTAXK8zNwmz2RzSvXVDiW+e9S?=
 =?us-ascii?Q?i7448cWWIpDuKA4UVPz51YzOPrnKBTnSnEXkk6ZiIjAKYXZGnJIq/b4lZEPA?=
 =?us-ascii?Q?0yh1+/wAA1a85fP6j5bETYxv1EaX2sOEdNDzjebF4R5PzqC/JKKNC4r94uB1?=
 =?us-ascii?Q?XFVmSpo4A6lzSF6D9tCH6BCu2n6jy7YtwcZc/5Z/lRlpn1m8cnL4Srwdj3MV?=
 =?us-ascii?Q?mvwSAtBjIZFmGGmrzCpWbGNqckB0VDBaygcqEPQwev5Ecp0XFDu352T/cw/Z?=
 =?us-ascii?Q?ARUT+hWvtwWZWU5i6AslGAuZJquXpyrTrTHqx3I5naNRl7xnCIlRvZQdLe3d?=
 =?us-ascii?Q?UOueEzLi2wDHoDd2CY78VEWg6fXt/zDG7C22an/ZWKnQCj57rjBCEzdpSbB+?=
 =?us-ascii?Q?yc49V/jLDoRGNlNGimjZnaRkPLLnug22loC6Yu2DL31/wQ4cjDYT9J02lbZB?=
 =?us-ascii?Q?NAXjrgd2TDfZpKu8WaaMCJTF1LwIux8MzxGpl/LtKoVXQPbJRG1WlczNQYm/?=
 =?us-ascii?Q?KPw4gQRM903o6HVt41mgfd3vDt2M5C1FpLCg?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 15:38:48.0617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18da25bc-a5e5-4529-8f15-08dd80ea9bd6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_083854_382014_F471F09C 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon, Apr 21, 2025 at 08:03:01AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Friday, April 11, 2025 2:38 PM
> > 
> > Add a new IOMMUFD_OBJ_VCMDQ with an iommufd_vcmdq structure,
> > representing
> > a command queue type of physical HW passed to or shared with a user
> > space
> > VM. 
> 
> what is the implication of "or shared with"? Do you intend to support
> an usage in which a CMDQ is coordinated by both guest and host (which
> sounds insane)?

No. It should have been removed. Was for "vQUEUE" previously for
a potential wider use case. Will fix this.

Thanks
Nicolin

