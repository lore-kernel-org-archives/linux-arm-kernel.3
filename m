Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EBFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXi1kp6kpGdpLV4LzeR7/boMPW20OWB00vmJ60xA7V8=; b=Vb8gca6TPTsBF3D4BINQ2SvRKC
	E1XYHvXB9FYZOsFo9dVlHnIVNkBke9jDVIhMQsWD4eMIR1hAFmFJwlF2LX9lxL1gUWk/FZtNV4Ci4
	ZU7vavuPRAKg2MlZXT1bcvfKxwOAmJlxR9jyiSMWIMC01H8RFcLIbYI5bKX6xpgT2h23+s9IjzsBa
	yrKXlFpT039Tk6sp08elO9rNj3qRLoD/UcUed8OGTzRfnZnb53vO17XFSc0Oe/9JZRCQiW8rZUcwZ
	SlfRGAW79e1D149sVtyGCc1ECO5mj9s3FK1NIBehgG5MPIQ6nQELA2c1zlH6Shj8rBmIZDm9y2Hv7
	7heJmtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo42V-00000008FxU-0ymA;
	Mon, 18 Aug 2025 17:52:59 +0000
Received: from mail-mw2nam10on20625.outbound.protection.outlook.com ([2a01:111:f403:2412::625] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3HU-000000085QS-1qtp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFTwEoEzgTvhqCVw8wB7ziFgFEEilolbxBDv/LGeMUVzNyIwE4tLwNeJOwNilID30DMkVRYU5OrCDS45+Hm/3alQAkY6TkdJFLHUrhklSoPPFAbrkWUjXk+0Da+cjbHjVxoU1YOCLJoTgnW9b9Peb8t/0kqXHCFtiLsgt6DVQtXoKWQg+ksV37oIUdw17vtVnIMMvlhdkuXNlC0OoQ6bPOXiHgWJlktce8UsG6g33nuTEUatWOyfBm2bD+EZVVj9TOLfc+/0l3GmGKK8yNk0r9B84odzEFJLxOErBder76lXNk1y7LlwVYXki5IIb7BGJtUU15x87H2na4aPwbnpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXi1kp6kpGdpLV4LzeR7/boMPW20OWB00vmJ60xA7V8=;
 b=g9y8FzgZUAfiZtwQDHvpDVeuOOk1XG5YFpsDyZpk9OygXbPNNJcOSqtKB7t70HaXHlSfymSm8doghPqIDBjvTaDKk4ymIMEbkPF2UCyw+bLN+dODUbsKPIa927iCN/tvGFyPNm8FRVyWkJB7KJwJk8hQJQkvszk92U/6FQdnsVQR6Jr94N+ECOxiAXGxOVVRh6QFyikmr76UMgK49fJ1BCNUmISnPmf3pFAhar/rAeIuZ+liVOb5zOYJTcybY4iJWi8KL2ELWA3raX/AmqvK2GJs6Rj0MKBXeBFolRqZ4sueoK7roWJzh25i5Y+ZWCKf+9E0D/XdxIM5gYG3jWayzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXi1kp6kpGdpLV4LzeR7/boMPW20OWB00vmJ60xA7V8=;
 b=MYHhI+QIklQMuXv2SRLYupfJQuu6vCA6vSs8N68oEqFu6+o2vFRe+06l86TubxwKZX4ClKxI7zN+5Tz3bgwLC1UP5s8or+hci++afDkjqRh0IAk8fjU1GVBOjnJEpw4ASB+h7+Hd5wpXpCpANZft3P5oHLZxKQwni+g9KMk1W86wMYQIRU8bdv36O+FkqlaBewbQX+Jbl+NNUciK5FELA75Tq4MeqStPnYyLCygsSQTL2vzuGWf5+Hw7wkgEr3kVO3tntIWnjg5gzDZZIQPW6tnJ0FvPOt0uCv+ykNWXvZOeM6AOJxzG8UA2ORNqhTmurWKZbrBie+hIxiUOK//Z+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB8376.namprd12.prod.outlook.com (2603:10b6:208:40b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 17:04:13 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 17:04:13 +0000
Date: Mon, 18 Aug 2025 14:04:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jonathanh@nvidia.com, thierry.reding@gmail.com, vdumpa@nvidia.com,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	praan@google.com
Subject: Re: [PATCH rc] iommu/tegra241-cmdqv: Fix missing cpu_to_le64 at
 lvcmdq_err_map
Message-ID: <20250818170410.GB802098@nvidia.com>
References: <20250814193039.2265813-1-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814193039.2265813-1-nicolinc@nvidia.com>
X-ClientProxiedBy: SN6PR01CA0019.prod.exchangelabs.com (2603:10b6:805:b6::32)
 To CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 4396df45-ca3d-4774-629f-08ddde7941ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3IFIDVv2FZGuMC7Otw1xqoveD79jiA/t1LPLnNgZIp0gZsr8ijptsKhEEnyO?=
 =?us-ascii?Q?uLpwCXSoTtQtArPwXllIThwsg7fh2bLYuB4GDRfhSr3qENBOKvRyLvR93N6w?=
 =?us-ascii?Q?kv+AGuBcbED9ejJ0nEqqrXigKmTsrMGEQuGY+NUPvfXRk6kfocCn7FWj6/Bh?=
 =?us-ascii?Q?LxBC+ApAoD7xM8Spal+HFu+V78+asGkKCPT53jBgAYEPRATPnv6/IvZn/bsE?=
 =?us-ascii?Q?LlPdyP+jr7cLB2mi3zTJ7yGRvUDfsuHEtd2Cb11qZMlpJgaDvIIzVVFbxtYs?=
 =?us-ascii?Q?c4m60zQ99PDDZH0XoxddRi9ALM/iXbrwc5x/o/3x3jF9rpFGGRlrY8sSNxBp?=
 =?us-ascii?Q?zEqCjcDgRlQBUVDE0orTJDFqkq8XU9RZ7P2ekw1vV8qLpD1IzKWSVdkG4J+s?=
 =?us-ascii?Q?DjlQVmSM0AxazUXrlSVMIwNyD+sAknglyISCgoexCLQ+QYCMpL4dqs6O/WK2?=
 =?us-ascii?Q?vRe+dsCEx2eAvpMGWH5AGgiXa/Vif2Lq8NPWBXqEomAn8NbaEHfDGcuXtBTh?=
 =?us-ascii?Q?0bI0rq2teV1ctevXtAyucCkTG0ykdkMUmJcOVuOcT/bTK1Z5hWy5hSGarUna?=
 =?us-ascii?Q?Q6mFhKp6iP2mBb8tdW02TTUuBJ3GJgFoOg+EaBsxhMVKSz9ShyEsQEk2F1fG?=
 =?us-ascii?Q?ONjrr26LkuHkJGAblJ+64kh1YDK3aLuO53T11qRtN4zOWGpyP48PKObShnop?=
 =?us-ascii?Q?96ZsDUPXtLrnqCValaA1f1jeSe4uUh1f8eFbKxQiC5rXzUO7pZOky4GlNwt6?=
 =?us-ascii?Q?/DJYTvvWClhDyEiLVYsRTczhZg7vF4GgJA5gZhBnGCNBVZK49Ffl1zShmKvP?=
 =?us-ascii?Q?EURH6aZvoD8KgpS41Jmj4nwy4wApBN5s3NzjDPmDWXrKCWIce1fAUnVsbKaO?=
 =?us-ascii?Q?xofzFzEgIhfLwD9NtbEQrPbAUukFy9EEx/tyU0gnCUkO9QtOAhZKM7r42QDZ?=
 =?us-ascii?Q?ifaAea0ZDUHQGPifvGdvyTM8Dmyghm0vTgE5h7d880j/SX/doHh0cgUuwYpS?=
 =?us-ascii?Q?J41P6DV2EPROhh3UfBCTKZkjPinzpa6VlbSTH7tUzw0u9NTduWUSb9GFh42C?=
 =?us-ascii?Q?kL4HNtyHrg2RfLg35J0hNsZ8Ea2yE8OYoty8XFxI855lidLbCmZlVTQiP/TI?=
 =?us-ascii?Q?0HtS8nLGxddyh61GRChUoanez0C/8svoNyp5id3qeOIkkKyLQId4R0ZH/gXv?=
 =?us-ascii?Q?37c1k05uqlUK8oIfvt5S4sFpWiHCf0BRm2+MULEPDM0nXXyl/xb1u8yO509V?=
 =?us-ascii?Q?2G5YzRrQ6Lzhoh/cc+K4i67dv8VapfqtcY02j8oawmBW9P9L1WoYZFRuBfBZ?=
 =?us-ascii?Q?J9kmjN7ME3AartHoHkzJIf9OGXU6IPUDyJ/jP8lw++4df2bB8v07kj4BYcSB?=
 =?us-ascii?Q?CzsBOiXHHObeorhW/YryKJ7Os7bKFWiMBEz8BE3aLR7VXI7aXk7gD6YuNtvv?=
 =?us-ascii?Q?dzB5x5VY+9I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kMGZvIKT7R3mHjEvdB+ddrw45gyoAAoZNBtD0CxaW4NN6qEEk7CIHrfLzg5x?=
 =?us-ascii?Q?PUvZFHM21gfNsdxtTkIKeHCu13Z7v4DuQrudZOnWCeBIaVUOLZdeR5tzHFeg?=
 =?us-ascii?Q?UJAJAXlCMLUG9egaKiIFGZwcWOsLc1oNY4dbu5+zU2wmioCDnBYV7WGrv5yU?=
 =?us-ascii?Q?518mbNG4erHNWKYY6SrIh2JNdyc3Ikv5XtmHbUXPsRsxA7WrnxDQWsbDamHk?=
 =?us-ascii?Q?OiAVPUbuplYcQ/o7msEBNUIeqe7msdf1gnakmdpnq+PwsqGgAe1ZpaQaD/cl?=
 =?us-ascii?Q?NjytNcnwP/PXrLKS58BTedkPffGOgJr85jTOo29H60DHD1y7cipxJ1st0mkZ?=
 =?us-ascii?Q?nLKlg906JPp3XBEV3EchBs0YKZTTw1WAtxS0CESL+zw2odBMPF+GM+HobmpV?=
 =?us-ascii?Q?DDzbOx1jcMyGXw0VoyuK5FWeFLUC1aSxWyxYcxl2fWV7h6JaXzTOVkPGvAyN?=
 =?us-ascii?Q?K9isvT0735H+3M5aumuXC8wfc6PzoBdlNf8A3K0LFZkDmIB9C0z+NmhLvXDQ?=
 =?us-ascii?Q?3Lc3NYklSVlwZFXIZlbo+dX1Y0xhfMayOZMXF2jbKxWniZl+1p2eFEFuXV2H?=
 =?us-ascii?Q?aB7+b02yuYh/FxQB8/VqPD5aLEJVuQj+c/wexvmZGXfm3RAOVtFqB5LqUbIl?=
 =?us-ascii?Q?53VQvJJVBa2k4OXMK5WJEA1j/CXiZPsOPt1s2oqc0VzmICtQd1k8kp/FZMe+?=
 =?us-ascii?Q?YYSuZL2J4v+BCQ2oohFpZhnLQQVNxWXuLqmBYezVESIJqZkfMumAJE9FvtH6?=
 =?us-ascii?Q?RT4tEv+cmfWIgC+KSRc5cp+LI78iw7eCos8aBTIlrDk9FBz9jKW7E9VwtJsD?=
 =?us-ascii?Q?ZLgr0U1l7wt+73ptvPCxO/HyxlLSpdku9vSWUdvxoj5OKY9maniBzEo39WKX?=
 =?us-ascii?Q?N1SYlD923Ri1merESWnzQxabpbQ74t63RiO2q8+f5t8/QOYP/VkF0tpBIS5z?=
 =?us-ascii?Q?avqvRa7SN795KZK3djyU847MDn1lcR1h/IBQVQCqPcLKkz6JxH8wS3qA4pGx?=
 =?us-ascii?Q?vG5NOEH4IMtHqLtgnjRqB6m4mYdAvl1pau+rLypYAHdPsdo8g5Tqj17h4LHL?=
 =?us-ascii?Q?VYzBqZmLg7QczB74F5BRJb2/TLAvqo7s2EkxnvaUHRwTH4seOLBJvnt8Euf2?=
 =?us-ascii?Q?nNxlrM/su/9F0sJVR2355aJa64RbjXjzGNTrvhjZAibT9Hv7wObwj8QHR2hh?=
 =?us-ascii?Q?HZwXCDlOEd1c/RYKzpaG3+zibWhMyA40nIQ5Ou9wCrOIKJyf653xnn4eAvxr?=
 =?us-ascii?Q?hoqwWgD4wupX4yXfaJhkmsaAMGOASL5wmiHFT2stlOgRTz73DlXNfEUXS0Sy?=
 =?us-ascii?Q?HhiNWySHz5Wy/+XlcWXJJrJTasj8S0vPI6IgFHM1fEGGhGMv5n9ceJ6x++fZ?=
 =?us-ascii?Q?fld0DUrulBLX+AckPSZr4nY9Dn4e8K+KfREbvWK4x1gvqvueYpqBSRaBoAdY?=
 =?us-ascii?Q?sVVhcLHqQjjNDi7u8QOxHN2DD/nmMkCDiyaygPNLwKCwsaxbVrZiLEtkXBt9?=
 =?us-ascii?Q?9Gtg5vkDYnM8pskZKrP9J3MpBWKIhI5X1jmViNO7WVDm3lBQ6P362fdT8fqs?=
 =?us-ascii?Q?fU6zTqRMTy7UHvkJj93XM1AEIONpkjnHYVMg1a+n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4396df45-ca3d-4774-629f-08ddde7941ad
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 17:04:13.3563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGzsLSSWQhX2AQTYmEBbDlYKcONTv5i0bfCYcX5Qw7e1IBzEVjUY9385uoAtmTbi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8376
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_100424_955854_4F367264 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

On Thu, Aug 14, 2025 at 12:30:38PM -0700, Nicolin Chen wrote:
> Sparse reported a warning:
> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47:
> 	sparse:     expected restricted __le64
> 	sparse:     got unsigned long long
> 
> Add cpu_to_le64() to fix that.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508142105.Jb5Smjsg-lkp@intel.com/
> Suggested-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

