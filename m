Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D21CC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 02:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDqJ1fA5a5mP/9+4Npmc7qDJwFIdVVri27VpbcmjQng=; b=CKXWWfGHvYdJUAh8CdjBNvHZ/m
	oRg+rDq0uM+QUPgnIfp9A/iKcgEM1oc0qiz87RH6bWzPsLUSZ+1s8rEdZM7Nrt7wsMNnbBJbwOM0K
	ttAM1xrzzz8J7cclPA1wUd9doPcF27QXiUMo+U844x+lRHq4+YLpwcNnq0KZJ8X8NtZSjOFi921vn
	WPJAKiO3ukU+wX4KoiQawpouFq3pszRQRfUdgVKqi6CIJQSCcHn/w0TOsFA4ZFmJxa5OSf8a4bWze
	VdFsgrw0pSN1u6ewv06KqZYk+pGyAQ+/P/NB8/UGXY5MfSIGDkG/kHDfAPvTilziss64S/BW1RvBx
	XCluTnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn78v-00000002Azz-2BM8;
	Wed, 26 Feb 2025 02:27:25 +0000
Received: from mail-mw2nam12on2062b.outbound.protection.outlook.com ([2a01:111:f403:200a::62b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn77O-00000002Are-3W9P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 02:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpWhlsuyvEdqnsqoI8C8BaU3+nsPBRkoEY2et5bthb87Rihzf8XrrTYg+oZAdOH8Mvk4X03McbsTiZNLKf3xSYU0AehrFSLdjw8Wzb/ZMkZJenQcvgNd6WrZwncqE5GfMSdU0RMD0SSUw9MARonLoT1DUIzMubKFwB46HBCjX43Adb9AIqcdQouiAdTpQcSRJh+9222lgulnt1LJWaX/smXgwwBP7jno6jOXNnU6XhIhyUo2umkANejeth66JBeYfWYCrWVcz1tkXLllmY3kViBseKhwuGjisw8v1Y+SQgYktNmAkX7tjFkGeOcsCvFQv5YeOe8xxp3nFkecR/r9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDqJ1fA5a5mP/9+4Npmc7qDJwFIdVVri27VpbcmjQng=;
 b=A7sEzmJz7KRecr+y6Sfm2TaWuC+dRwkahvrnfLutWFu1sRHJtrqvITNyUG7YDJQAHDC4YqucFqllJZdMn4R8AuBHGdD3G/Bp5EF2T3yGoL02AL4VHi+I2Wo8hAuJJ642gZkQfGQ2XTZEHtpPDUaqyz0eYCmm7yueJdysyVpQqjHke6hRWszYLWom6txRNJSZK9N/QljzAND8QoXJyGc0z9s7THig8f9GI+Gq33dVWxm5MZVSknTTIY5vbrq24Zu7feANpiqqY+9gCTyA/6UDvPszr8oMTBZpEstzL++SggsqTy5H3DaIQyL/yXcJ9649tsIGLgKADLnstYHCBqhfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDqJ1fA5a5mP/9+4Npmc7qDJwFIdVVri27VpbcmjQng=;
 b=pppI9/JtfArEl8LHhhf6Pp+SpJ2RB9dD4+fN9YTgKlgM7J++Yph/gNWr9QQm82EY1CjOM55ovjdcxaUFesBtITXpttwUuDNs1ZLrXtzgTce3o1RZ0Qi761gMm9A9rdYNEiTPQJl1N01kzUQjSX9LEIPWJhGY8l/EZbEbLFtkeSsEaSHP5N5Ew/Xdj9Zz3iRdb4jp+Et9N1XHA9wBi2M2WUBbWer7+4XHZK9KPguWggYqfr+/6cmCyj4Gwm6CSDJ7ZbkhFtYU0tCnMY/peKhDU84ZLKWiWkcRaQM8cgUQw/C/41Xv3F9owA3oOuFCHDiqeklHSRrNy6KxHu0xu0pxgw==
Received: from CH2PR17CA0015.namprd17.prod.outlook.com (2603:10b6:610:53::25)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 02:25:46 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::20) by CH2PR17CA0015.outlook.office365.com
 (2603:10b6:610:53::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 02:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 02:25:45 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 25 Feb
 2025 18:25:30 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 25 Feb
 2025 18:25:29 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 25 Feb 2025 18:25:28 -0800
Date: Tue, 25 Feb 2025 18:25:27 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <tglx@linutronix.de>, <maz@kernel.org>,
	<joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
	<shuah@kernel.org>, <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <baolu.lu@linux.intel.com>, <yi.l.liu@intel.com>,
	<yury.norov@gmail.com>, <jacob.pan@linux.microsoft.com>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v2 7/7] iommu: Turn iova_cookie to dma-iommu private
 pointer
Message-ID: <Z757lz6ucDE6Otix@Asurada-Nvidia>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <949e28875e01646feac5c4951b63723579d29b36.1740014950.git.nicolinc@nvidia.com>
 <20250221143959.GA272220@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221143959.GA272220@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd18569-a9a0-49e3-f5b2-08dd560ce06d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5UVfllaPRPtMhKNJroY4eszeeB2fkMXaK5URiTb9NqqK8nNM1DoUZfPiAqdN?=
 =?us-ascii?Q?SslHAEkwRi58ZB+N9gPha3rRCtYgbaxPEIxlUkHHdVIAryxxAKRdFq6E1TLh?=
 =?us-ascii?Q?skZtz/4KiPBogiJwNXiEY7KK2m9E8QhR6ach1FNC2acPvKRCytkgV6/hbvoN?=
 =?us-ascii?Q?yc4UnZDxjrvrNkgtfBsi/BcnLNvO0qmRtQVI88v8ZFzpejOeFBLXQEJxHQfc?=
 =?us-ascii?Q?IH140l2andnHampIoGSFp88Yhnu62WIVyUbwxsSkd1zk74pV9yHtTb1YOB7r?=
 =?us-ascii?Q?jbJgyWNsikS/QM59vczrX7cEZJLEYVzi+1XuGHNmAaHOUelo1MjQ9F9kfDgz?=
 =?us-ascii?Q?S0ibSRB9dyvm7F8E+Ng3A3UDlHnbPp15rXZ/ELQ0/8A3kBEWPBX7IRllmHwP?=
 =?us-ascii?Q?FMEJLyikoXv7IvPjqjqm3kRQAg9FLqX5rfaKyCLdcURHUbkbfUM80mjx4iQT?=
 =?us-ascii?Q?6LwMNfDoKEdpdmP0X7o699iQgPL211XMFY6h/uiymRzA4whhuH29i72srPF9?=
 =?us-ascii?Q?oOq98RUzOQZvZvIf1e/tTCGQ2VWrRFD4y1vtz2GkYuON/71+Zkpjavodvod6?=
 =?us-ascii?Q?28DI9VkUjmkPi0VZ29yJPTyPrlzMhDCNnJd1TkdZHzv2TxLJl6WWTsG2YMaF?=
 =?us-ascii?Q?Ad7QM3ekYlj8iTXaqc5JHBolkY3Lk5aeg71mSAnMoYljGcIq9HBJ+EYR5c50?=
 =?us-ascii?Q?aKvaXkYuLw0buJOVNjFbV46EEOjzqX/esBSm1WXGtdQMLHCovck6ZjcY9tBD?=
 =?us-ascii?Q?nTpaw9Cj39nx5qnlNyEcUznKxhpQqawa75dHm+EtPVq3vQ3kb/fzery33igU?=
 =?us-ascii?Q?C1XpsS92D1ir81OQUpFzl8S8YfC6+GSVzv/Scp1P7EWUxPiMcUvRnlpWvWQo?=
 =?us-ascii?Q?KS2EOPt7vnUw/jvtaHCF2ow+iE4Pm2O9r2SH3MAFhb7dX7f7UESpEnUXixJx?=
 =?us-ascii?Q?3zKrC3ShPVPWDhLsjv5J/CEnoFNzsnld7zxh3Gi+ao65OL10/PX1xo6Ntgiq?=
 =?us-ascii?Q?tbxURNFCoGUyQQrjY4vAItLn9qRHbPQW7D7fdIPRSfnkGnpF/+EFZqOx2C34?=
 =?us-ascii?Q?sZq2OXGkSe2ptEcBFkVC/bR7KaYhBEYYpTh1Wcjv60PAwvjiCZWK5aUJHQ+R?=
 =?us-ascii?Q?FTjQXxuew+DrkPa9qijq07jsyoPjj5DoCz1l2+SqbEefOPJKULZCKxG44Z8P?=
 =?us-ascii?Q?Yx2YQBchwSzxCVy+9z4HqwQivTRYlHm+xjdb+d+MasK6xekQVieDFpjiN+m6?=
 =?us-ascii?Q?L/kRNCJvecE/mR/kkiNlx08LiS3AMC8G9htPDOLi1wbsKmb3kioMe8qpMlW+?=
 =?us-ascii?Q?hltQuq5u89GFVhfCNrM/ZLEqnfo4Hm0LCa15wOeU52Cd3w+d6dfh8/9L/Gzt?=
 =?us-ascii?Q?VDqsoJMvfxagdEVNM4n8QK1tZTSPpzz0SIaiJMqTMLuywys68GTgwh5k9r7i?=
 =?us-ascii?Q?sc0JH+CrzgehXJzw8b2lykLoKHTu8OgVoViagie6ZE9CxKpgQUm5OL9ZePyP?=
 =?us-ascii?Q?tX4TYA9F7kUKg/4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 02:25:45.9971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd18569-a9a0-49e3-f5b2-08dd560ce06d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_182550_889044_726DCEE7 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, Feb 21, 2025 at 10:39:59AM -0400, Jason Gunthorpe wrote:
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 99dd72998cb7f7..082274e8ba6a3d 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1534,12 +1534,16 @@ void iommu_debugfs_setup(void);
>  static inline void iommu_debugfs_setup(void) {}
>  #endif
>  
> -#ifdef CONFIG_IOMMU_DMA
> +#if defined(CONFIG_IOMMU_DMA) && IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
>  int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
> +void iommu_put_msi_cookie(struct iommu_domain *domain);
>  #else /* CONFIG_IOMMU_DMA */
>  static inline int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
>  {
> -	return -ENODEV;
> +	return 0;

Should we keep the -ENODEV here for !CONFIG_IOMMU_DMA?

Nicolin

