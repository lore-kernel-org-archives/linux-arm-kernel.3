Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E175CC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 04:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Graq5oPHM/ZTYuWvaLkdJcd+VeT0j4xdlqa4jEASiQU=; b=2V7rHjEa9+e8bwX1W9gS73s6Q0
	1bVgHYTrww52ku2gsv2EVfyJkzeiZiLITKHw0LCCz6qk//QAC4TZHIeAT+t9jAuPWq25kx3B0J4+H
	hJUu7nDUWd7V/kz0LHucHHSLR4utB62u3PE147CYINiONUc1VBXfZi84xD9ofb0L/PKJJCEzf0klu
	sJk9mTiYAjKD2bpRVINv/WnYNAra0jMG5Fjrc3dong5M9uh7FDiyCSkLZx10GFoT2mLVWwIe6ZDLM
	scClNj0nmJDMKtX+UV3ugaQDlmG3nwMIzSFW9BHDb4Sggu0wDANT/gw/mo1b1GHkrOliecvgeFmfd
	J0BmvGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN2I6-0000000Ei4A-0Wry;
	Thu, 05 Jun 2025 04:33:22 +0000
Received: from mail-bn8nam12on20617.outbound.protection.outlook.com ([2a01:111:f403:2418::617] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN2Fx-0000000EhwS-2tAf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 04:31:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmVN105MMbiHb6TetFj11SAxmrt5WIIjRxvpEbEblVdBexJQPaQwXDsD8CG41oVbzqTL/T9F0NgY+mYA8Et06jqFioOat8NWQUHKBPW2LQ59TnQBBC214o5RlkpmJk/q6tH6jukjyAu6RiIEee4DjPMEjJvrxy/p8GQG4z0kPzzG/MeIuU2Hksm3pBEMoT/zcuIq6JqSXvZltegvF4ruBpDX/KPVM5Z3GfWdHqq+woVFQ0YlKWpZK0yT9A5LRJbbe8QZQkA0lTLQ1lFQbG2/Swz+67Sp3leWlXDKbZ547aJx1pNyeSbPxqOywZL8nerRwE2WDWMeT17pI+TIelYmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Graq5oPHM/ZTYuWvaLkdJcd+VeT0j4xdlqa4jEASiQU=;
 b=GIjAtyybcCIwON6LBM4+6V1RAahO7kp0GVHDCYcf9yF6K9t8R/igfk0XTiXkVenoN4SBQ+K2LwtHSoKAt1znT5leOsnb0cQjZ0sL2Ep/9hGA/zSRJzzhhAxfKXXaKWedFMhUn+bEfFhJlgTtmeUQGd9SiDdSF0sP7BhHVaw5w9PbOcb3nm8gdqtB2uVL36Bz/6+7SgdX4QGcxUOQSWpVu6o9oGUL0os/qhslUFR1Kn78NHdCE7K5zSQQJtQ+Suz9iyzkrDtvJqBEzovMdqpuo4sPf0pHwqZQbAeIfWNweSYWY/Df2DijlFGdSQaVSv1yoUV9pNMJ0NKlmoGj+v6IEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Graq5oPHM/ZTYuWvaLkdJcd+VeT0j4xdlqa4jEASiQU=;
 b=nxmIL+2LS70BbUbBaQED1AtNuYgfXruLYnxtxORyd3gMj7tnzyDfIdFqGG/d7KxS69lpwlu1paHwWPG8OvW2zH5P7ueoSpz5vT7g3QZgC01BVEs0jcCNzf4RASoFLUTVT6m9NmIO7JyQSJ07o7931ePWI0cCi1NGXuxe/w8m5oU7M5uXtJXuw198D+A5BxVW2ec2tBAA5ha4Ymt5TOw5jX0RrdLiL7oiqYstHgYzq57H9zW8Y9x0s/CgLYL8HKYzoYtv1VaysYS0ob7dddmx8QPd/cs+rDJt1FhEVG8wc9TXYUOx9belA2QfMsY2PZftcx5kNwkQPH+we4NDob30kQ==
Received: from SJ0PR13CA0055.namprd13.prod.outlook.com (2603:10b6:a03:2c2::30)
 by LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 04:31:02 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::c5) by SJ0PR13CA0055.outlook.office365.com
 (2603:10b6:a03:2c2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Thu,
 5 Jun 2025 04:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 04:31:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 4 Jun 2025
 21:30:42 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 4 Jun
 2025 21:30:41 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 4 Jun 2025 21:30:40 -0700
Date: Wed, 4 Jun 2025 21:30:38 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 09/29] iommufd: Do not unmap an owned iopt_area
Message-ID: <aEEdbha8TNCUtTgQ@Asurada-Nvidia>
References: <cover.1747537752.git.nicolinc@nvidia.com>
 <3ddc8c678406772a8358a265912bb1c064f4c796.1747537752.git.nicolinc@nvidia.com>
 <20250528170845.GX61950@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250528170845.GX61950@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7dfe08-f8cc-4a15-239b-08dda3e9c6ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k6PWESUSbdvB68j3UHO2RXSMnMciwn8KuWN9ZzoNeo1GiQxifUtOrUhzN/Mp?=
 =?us-ascii?Q?aYS/BRNokUMrAs1Dfyf6tpMB8ywR2Pydd83PdFSAr5gcjdxL+v9LX6SsMmwM?=
 =?us-ascii?Q?eE+WRmJt4/FDNVRPc3buoTKPAyhl0hMAMw0vElt76qG8xDtV6z/KoUGqd6Lq?=
 =?us-ascii?Q?GYL68yt7cp4Vxg5LrqYlPWvpHqknDJiTUgoFko+g34KM3JzDiy6tdLxwDtR4?=
 =?us-ascii?Q?iMXW3Le+rtPHhoesnVRC9xt84zrGo2JEwB9wJjt4yLHslfSvMJ/HzvMEpiOz?=
 =?us-ascii?Q?zd3A6LPiDpPKZ6hD5+Oj0dBEYCC+UOPwGtR1mdYJCLBhvS/7cLWYU5UWFrpA?=
 =?us-ascii?Q?k0GRIiWfJfhjY/VViTmzdpAuBa8uRT2VdB1kPFAn8HjVq8WdxKlOsulfAVqb?=
 =?us-ascii?Q?PwwMwoXXW2MS591YzGkmBKD/vqsD0ysLw/eSzRPGMX4yskCY9dYUvpE6ZW1c?=
 =?us-ascii?Q?8qib+26jTUxsCKF3agg+Xh5NxiFvxzECd0EvPIfiWckhicO0V87/c/ZuT0yM?=
 =?us-ascii?Q?xiGVG81sVOoAui3szHDVz7VK/HQfFg5OjRlDx4hSZ3dMeH7vYlf4hKiijkJ9?=
 =?us-ascii?Q?T4c0IeQ159H/e1V4LZl9bUcakePbZHDQLyFTZ3zYMEStQtXYcx+3Y9/if3tk?=
 =?us-ascii?Q?rtqu8iHb8WCryhWlpJbXMervoCE51hwv8PIht/fF9MyfURKJG3U3YV7uLTeU?=
 =?us-ascii?Q?Mh7e5v/gv/MUgyPPkGxpfjiqxfvJWlgMxtApnLr6kfwFIx6zyGOh57kBKHzz?=
 =?us-ascii?Q?zLXUoAVLFooKAlpYMIBbmE683NwlubWB5HlS5ulY1IUpbNuJrcTehDAc8kS4?=
 =?us-ascii?Q?ilEFsTaPffbQJBKnwtUmPQE9GHweM1jSA3VgJd3tc9VSIFhbUdjMqfF0Mjvz?=
 =?us-ascii?Q?q2WS1FDDuM2kFYcrlYMKKZlw+vR1yJ67dpn+4Nt7hJbJx7VODNdXSCgTIXRZ?=
 =?us-ascii?Q?8GxhtJ/XRwtL6dVqUbQRywjHd2D1equBSMJV5q1kYn8ETh49Qf9qngV+s44m?=
 =?us-ascii?Q?ygXcvkeNvFnl0Klt4/TnCYa2ls9GCD3osJQJX6Xw3FDj3yAfgwwOn1kkQ1Yl?=
 =?us-ascii?Q?UPqlPJNs32EFepxgMFYaqpTAdXqEyASMgMAavvGlv9DNVvffQUvQTWSGEUh7?=
 =?us-ascii?Q?YTdEELe8dqbAA/o1zfkFF3saXLiI91olCNDXDRYxWMY4A9xLIZJ8P/lyW0Ga?=
 =?us-ascii?Q?6SEvRSQeQbKRB8v/0A7e+Ddcd0X16kYGaLAOpf64KolO4ZP0943EkBHUjdxK?=
 =?us-ascii?Q?1tftlcTQUit5EnLiBfFLrJnWo7l071sJyL676lajpvAJedg7Pz7vMltXZvMq?=
 =?us-ascii?Q?Ct7bymMnjGdAMPfP3I8MGijW6KerqqfpJOfYQsylc5+Jd5ZaQELr+6a8JGqg?=
 =?us-ascii?Q?SXI0vVA7AiwpgdGDfXR42U1yyPj6vqkf5EbVvQXbBpa/n8FkJeIhK/Z5ZotF?=
 =?us-ascii?Q?qp23vsnqeLRJn9IMEyQbhHxWFLM0MtDCR38/5fPAM72ycWQg8zbc4bQVIkwD?=
 =?us-ascii?Q?PHXDZ1E4r0So6PHHd3p6T+z8m1B4DBLF86Q2?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 04:31:01.5167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7dfe08-f8cc-4a15-239b-08dda3e9c6ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_213109_723337_03BBE306 
X-CRM114-Status: UNSURE (   9.17  )
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

On Wed, May 28, 2025 at 02:08:45PM -0300, Jason Gunthorpe wrote:
> @@ -740,11 +740,16 @@ static int iopt_unmap_iova_range(struct io_pagetable *iopt, unsigned long start,
>  			up_write(&iopt->iova_rwsem);
>  			up_read(&iopt->domains_rwsem);
>  
> -			iommufd_access_notify_unmap(iopt, area_first, length);
> +			rc = iommufd_access_notify_unmap(iopt, area_first, length);
> +			if (rc)
> +				goto out_unmapped;
> +

I found that we have to re-take those rwsems to unset a flag:

			rc = iommufd_access_notify_unmap(iopt, area_first, length);
			if (rc) {
				down_read(&iopt->domains_rwsem);
  				down_write(&iopt->iova_rwsem);
				area->prevent_access = false;
				goto out_unlock_iova;
			}

Will include this in the patch.

Thanks
Nicolin

