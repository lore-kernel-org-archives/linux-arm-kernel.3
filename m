Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91964CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 23:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6WAveTRJpTI81HRvkYGG81+o9bPxldRAvLn8qBlcb4=; b=Vy5CZKjNMLYh0ogvqfkcq3f88X
	mejB4djh3/m9XmbhxJr9/LJex2uc7jyjvr/BpSKn1S8xrtQYR9j9Qzv9w6g6SGPvPM0dGPANZAZdA
	KsXHSiZZgvJJ3/Pkj1uvYqs3mxN+NLwJII5yNPh82PxxjF4wilhO2CsDT9NhG4Qlpz1T4Lx8rxnTx
	53kwYx1qLzlMpECCSBNAzsoHrdmE1vwbXpCXIbwjdTxYkXHp7AdtXZa3ceBEhx/PGk4gxr54O/d35
	PyojeuCsNSARRkI0mbx4axNbYkOj6j1eAePr9WSxzD0I6F2T+CY6BSCSWcMCKFXViPNqm4e2n768U
	/8sdLxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWUX-0000000EvAc-1UkU;
	Mon, 27 Oct 2025 23:19:09 +0000
Received: from mail-centralusazon11010020.outbound.protection.outlook.com ([52.101.61.20] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWUU-0000000Ev9m-20gg;
	Mon, 27 Oct 2025 23:19:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuRe8fE4zPgfktyNtevke/1EXcZ638kemfCks7E5ykkyfSlG4711npJdtTtu4vnEm/luEQG3n8/TxJr+eGW5mtMeep1mQ9h1YNlrQ6T+W5r7cg/yMqWGaV/6g5V+X3FU2wkyppNpsvtKV7fRXV7ZtkWBwNeynfVInk/fVqc2gre7CCjFSHYo24tqfJljITWEJ2Zu/6K4ssJP5nYsxS3DWyJS0Ar0SyPt2q5HSs9zgZ09/acLZnL7S0vcGvbcnFDdFAV24O5HbKlR7vncB/+bJSO44e1VK47ID3f5QwoiVSFtNPm48qR47SrG7QdxU5EPZzmvwD5k64x9itDNggRnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6WAveTRJpTI81HRvkYGG81+o9bPxldRAvLn8qBlcb4=;
 b=y4vagTbGGnyo5/vciUTT8hpbFT7wQU87vsUh1kD0C701evscJ9LgC2laAAWr7mveWzTtdL6BZIKni+MVlSLfV/yAob/nPoG70cduBt45mz/iwgWsU9rAV+4eeyn6Jh4dp7xLV96E2ND220kBD3aKCMdMbFtzWYt/l8doLUzleZ7LchgwMUsu96FMDj/lFG3Q9jr2UcVFHsId4GXaQ45vJ3rt4Z/WqpchhlDOgfBq7BNPWOu9CYQO7vxuJhJrBzZMJeubzJGqIuxtHRADIAmCbSDNO5YzNMtC6Eu+mrNdflCoQmC5p4tEScq2oGkgnLPmovKkTx2Abry8uZCgpQfGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6WAveTRJpTI81HRvkYGG81+o9bPxldRAvLn8qBlcb4=;
 b=mdhrGGqowGrSQRVmPfC7jYsXljzMqhFMsZPsEFQgRoZmwPhat1f1RK6o7EN6t8+3WJwIURI7Bai6GieTlugno2NK2/TruZk5ZhPp1kdYzkHQFm3vLZeHTO2JYtu0mkRcQYmn81+PoOsjf3XialMCyAx165jsQeE4mjW0GAzFUxiNn6Xy8oF9nRxCrwioz8wbWvt7+G/5AOpvZd3GLF6CNueUlJ8Ay102A/8abbIyuew9DDtJ4AoSEnJus+mSUJTGxcjx3c/f7fW6hnxxiZBux3yyp41V9HmN00/tE181I8fmGiTrctmKz3sW/HcS3V443Sy3mxPdJg3ZNXSas0dIrg==
Received: from SJ0PR05CA0071.namprd05.prod.outlook.com (2603:10b6:a03:332::16)
 by SN7PR12MB7809.namprd12.prod.outlook.com (2603:10b6:806:34e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 23:18:58 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::1c) by SJ0PR05CA0071.outlook.office365.com
 (2603:10b6:a03:332::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.9 via Frontend Transport; Mon,
 27 Oct 2025 23:18:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 23:18:58 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 27 Oct
 2025 16:18:57 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 27 Oct 2025 16:18:57 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 16:18:55 -0700
Date: Mon, 27 Oct 2025 16:18:54 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <aP/93kMokMgaWEEK@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|SN7PR12MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 339f68d5-ca0d-4de3-8058-08de15af34d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EY0RXe2JNZaIt7N6Sh//f9nfYFie1PnWQ8W9sClSNlojBXTU5hbXHrYyf4DP?=
 =?us-ascii?Q?QrPuv1nnNXO3uPvnQjAW8OUxQsjAZqmMhWD4tjyZg7AJ342dGisInoELu+/M?=
 =?us-ascii?Q?iPdy2IwTDMQcZ1x18Fk4IL03h/DY4R9vbBgv/1BA8Rbv3lP2n5swfX/tI1JB?=
 =?us-ascii?Q?yvcoFp6xBE4gcXNqdoUTH18ZhcAKB+LsibsVfdlEximUuGH6UY5qhivFW5rO?=
 =?us-ascii?Q?A97VdveW00KK+kqAWD96Gb8hGv7C3hKIyh8++D6ci2fhjiVaBnd93ZFLmSGa?=
 =?us-ascii?Q?4O4JdbOyRlyhSHoiSYah8nG14wSszHspI9TYmf6ZSF5J2sNdXF8r1GhQzCd3?=
 =?us-ascii?Q?snOuG4qY54Y9WpCVvhf8lYkKhd7DJRjltqxGZrTZ2DDQzdwL38QzJfhuJ2SM?=
 =?us-ascii?Q?Ienr/xISFC226JmNCxy7O5NJB2q6/2KsYDFF1Hd8JfmyCVWg8UXk3ulc7Eze?=
 =?us-ascii?Q?S/X8trf0Skx1JgXHWzCw3C9TFLmrcAsx/Os2udcTTdle0vAq8KvmT1fLtqsx?=
 =?us-ascii?Q?9Cwx1+U6V7IEWsSMPFvnMKA8XKERV/gHSNZ4HpqKNwms461hL4BV030nRXQL?=
 =?us-ascii?Q?i8rHFFEWhy2X7VvDZAfrcsbVQaYOQnCbrJHFpnFRk4vJwaXwNr95VVATTsq2?=
 =?us-ascii?Q?fq/vmZ86piPDn4TNvLIhp9etOoelGIL5wuGFQ57JDZypjOhnzVEL5m9reU4z?=
 =?us-ascii?Q?JfJ0CZ2NqqAqaJYp035dui3K8rSl5/3Rb1Fyz50h0E+At6TRFjNBQG7mWYqL?=
 =?us-ascii?Q?Okw3d20XVtc5Ppcw1431hs8Y+1MWb2tnnG/KcMr7lvcD4TWyB3fV37IPfs6E?=
 =?us-ascii?Q?hW3c61DBqScTHxo3ATXOgBWwl33bC3kfCEHJSZpp8SaHuR2ux2WQbSuma62R?=
 =?us-ascii?Q?OF7b3co5xk1Ffyxe5dyAwKcAbTrMkqUQ7adPbInMK7oC1TKr2taO8K6+/iB7?=
 =?us-ascii?Q?UeSjArQjgzNc1LUJTUMkW/iNkvu8i4YHiCigeHfxXtCyjnKam2x/srlEaf+F?=
 =?us-ascii?Q?qq1SXRPQYt20+IeliYx9D1U5ULppep3E651EeCyTtZKTHDmSpnG4C5Odojt8?=
 =?us-ascii?Q?0BTTwypxP1pLeNEIME60WAg6VW+V0IBZpKpbpA2AiDnPfYK9F9gNFJ72h1zv?=
 =?us-ascii?Q?AucYZtP59KFiN7McJJYi4Bucaw01yOwdBhY2jyOd+vL0RdWjM0AFyYzjIcLd?=
 =?us-ascii?Q?xdxR3qe+MSJied8AlrI+kViJcp4OKs+87K9uiAC1iHW1PFff1aNlULD4R70x?=
 =?us-ascii?Q?rTQYBfCL5y3ehHAPmyhMaXgKs1qQcAPz/U0sVBpYUbaR2wwSIeA7w+3sBpmN?=
 =?us-ascii?Q?ntY0E0veEiI1IVbGrO+RPnIhU20LDU52Rf7UIuRlO/ABT0vIohYXNY6/HxAg?=
 =?us-ascii?Q?EvBzxn3jkL1kLnvgJcuzfzEoahZ76EkzIJxt8qd0tGkTNAcK1Eqin/JCSBuA?=
 =?us-ascii?Q?ZO7RafIATQ1xqCXd7wBbFVQCD8ubQApGT6kp0oJzpfnBcI3hMEzGyr1kQjYX?=
 =?us-ascii?Q?n6VlFnfMQQT0qHkLpwQa8fIYxwryLtWWllgFEn72XRnQ6uQGfL64iD8HdDC7?=
 =?us-ascii?Q?wlklxl5soIB1pDnpcmc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 23:18:58.2518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 339f68d5-ca0d-4de3-8058-08de15af34d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_161906_573320_28F238FC 
X-CRM114-Status: GOOD (  12.02  )
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

On Sun, Oct 12, 2025 at 05:04:59PM -0700, Nicolin Chen wrote:
> @@ -3479,38 +3545,19 @@ int iommu_attach_device_pasid(struct iommu_domain *domain,
...
> -	for_each_group_device(group, device) {
> -		/*
> -		 * Skip PASID validation for devices without PASID support
> -		 * (max_pasids = 0). These devices cannot issue transactions
> -		 * with PASID, so they don't affect group's PASID usage.
> -		 */
> -		if ((device->dev->iommu->max_pasids > 0) &&
> -		    (pasid >= device->dev->iommu->max_pasids)) {
> -			ret = -EINVAL;
> -			goto out_unlock;
> -		}
> -	}
> +
> +	ret = __iommu_domain_test_device(domain, dev, pasid, NULL);

I realized that here it needs to be under for_each_group_device,
as its following __iommu_set_group_pasid() calls attach_dev() on
every group_device. So, the new code should run a test_dev() on
every group_device to keep the consistency.

> @@ -3615,6 +3657,11 @@ int iommu_replace_device_pasid(struct iommu_domain *domain,
>  	ret = 0;
>  
>  	if (curr_domain != domain) {
> +		ret = __iommu_domain_test_device(domain, dev, pasid,
> +						 curr_domain);
> +		if (ret)
> +			goto out_unlock;
> +
>  		ret = __iommu_set_group_pasid(domain, group,
>  					      pasid, curr_domain);

Needs the same fix above.

Nicolin

