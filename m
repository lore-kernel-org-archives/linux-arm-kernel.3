Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D27CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHMpGqVICscMKQfna6qM6PLkElW4WmDHGNbL2U7989A=; b=kgjFtisEfhsUHT73ZoS0v5d4HA
	uOgMMs2Hr0lPnOfoy1eMsRnOYrjFl2vWZZ21baM2uwccVn25+/zMM4mTyv6a3ost59m0ED7WTToUo
	voJvNb5sySHQvx/yGJcFWKk8wIPsZItoVlSFIrrEuSYXndvatII98iArMOgGF8YDKr+gMs3GRuPey
	l6hcJY1Ho7sK+iz5KwH7tqsmwnyPuJ3YkXJ6NuiwAvzBoPoPLzxqjcGs/r+M2xotaIzNzjhixQWbO
	Xpbp6FnQsqrXMcXcL2VArLechB3TBMIYWa/0HanDNVk77mNi6/MEETQN80GmXZnDXbVYS8+yszsi0
	ogvOSE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUgK-00000007kbj-3J31;
	Tue, 16 Sep 2025 12:21:12 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUgH-00000007kav-1wP6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 12:21:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTw5MWJUB+aeTcoPW2VnFQRhn8vtzBzH7mjUTe2BYamNxo132XWou7oYFjcZZHVdb5vb9VZ7VuAa6bVtMbbKz3JCla4RmB9BMHZvYUOPTSMYc84PVl3b5llv8/90Q2qHcdVMFIjN6TLXk9sTvmFcCMrO292ddPvhdiMHezwIqKLB0YSpD5hIT9eXL6RWvwl/AY0VVYA4etnVX3i8u+4ZVTHiJFHWNqlX7+2XM6ylW9TDdioNUw80P6L1h/f9NR0HR0cz5DWOEGvotmz8I6P2Qc8VGTu7Uh6jWJK9hT3FjZNaduGd5cjO+WG5rAThx9D6+0LXvSvNKRPf1WncJEgNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHMpGqVICscMKQfna6qM6PLkElW4WmDHGNbL2U7989A=;
 b=ZsvvcYr8JJMVMHc/dkg7oxdg6gu0An5K0pabajXxVN/MVDC7ABSZd7HCT4N1SxY1IzmYHt0e81FZncxE0g0a5EkxF7mD/5OqgQDICvcMQgWR1kbJUigtqlyMxMnJ5op6HswZZHy5u7pZQ1h+RVmuWqJ3W8u0O1PoQkmYVipeLPGPT8QnP8uJisEUlzUkP5lDSNn9DyF+Pdpuwr14rk3+8vgmgx8/HEnz5f2fOIRYRyDS4XScpdrPVM9vLhEfVJW4vxaqHlxekeyMBMlaxplLmhj7PHp7khMUWVT1zNAbCZY9eNi5DqY297yi1Zrso46R9HuWzuyJkLa9vcjfLKgn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=samsung.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHMpGqVICscMKQfna6qM6PLkElW4WmDHGNbL2U7989A=;
 b=aKu87ipkVVk9iqRDKD+kxeKkCUG2OVCCdnOxrQW/KoM+Gi8aqHY0fNoiTjUYXBkHDU/jsWporcQiFwnBqkpO/tsfGNngHjrbqeS0znHA4IT+qarIJNTRszm8cEupFMFsxNBmw0nw5j0IjBU51s54/WneT/LssnYzpVVnCg6ViPWk9oxE7qKY2YirpVmAts/Jn2nc2lC1MQj9UUVF6/4D8wlxUpwz+Z/fCyvhnBZ+B+psrWywRCOh0C2yZHv7JEyFonTErMOr+qfwQ4MFOeUcBUawfzxlb0rtwbWzr7dcdAMbJKVjugmgbuQqyfePpJbMSlpQQK8f+eKcqCChkMe1uQ==
Received: from CH2PR14CA0032.namprd14.prod.outlook.com (2603:10b6:610:56::12)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 12:21:00 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::8c) by CH2PR14CA0032.outlook.office365.com
 (2603:10b6:610:56::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Tue,
 16 Sep 2025 12:20:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 12:20:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 16 Sep
 2025 05:20:44 -0700
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 16 Sep
 2025 05:20:43 -0700
Date: Tue, 16 Sep 2025 15:19:39 +0300
From: Leon Romanovsky <leonro@nvidia.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 4/4] dma-mapping: remove unused mapping resource
 callbacks
Message-ID: <20250916121939.GB82444@unreal>
References: <cover.1758006942.git.leon@kernel.org>
 <087c29da71fb41245b8c03f641f53d624be10d59.1758006942.git.leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <087c29da71fb41245b8c03f641f53d624be10d59.1758006942.git.leon@kernel.org>
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|IA1PR12MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: 56127b85-0a57-425c-4229-08ddf51b7efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wTvWx8SMZG/yWzrzsmVsWnXX2HxOnsK/aXyi/KLgg/kebVHJ8dxBy5ZJldaA?=
 =?us-ascii?Q?aAXUoLlC8EfXGNJzjHxZfmor485RKBnhtYyQS1GUMMt++S9+X3PfYC7CCJRr?=
 =?us-ascii?Q?gOKe3lnHKQckZ0WMG2t4RQ+HT+17VxKUCGIhehehsl7uglvybb+LvPO4C1ln?=
 =?us-ascii?Q?G4t7YmH0uoCynjMGmfz711arfnl414ZTGJjY5S+mrRCfcgP/UXJWhBEqggWA?=
 =?us-ascii?Q?nvudTfUeUrMm7DuW10wNTiAmgmVx1e3Gtcaz3lRlJlBrIH2xNXh21ayq9X4+?=
 =?us-ascii?Q?G1tIcwgkKuiGdb6PGgwRa4Ckb5hPBfsJO2px3/lHwDGmgdTNDMmUsLH3/PkD?=
 =?us-ascii?Q?2BNeBw8J/6hZWk1GGQDiWJ7yEsPqrXlskc0RdZYTmFZG0692GUdoSZiuBBcC?=
 =?us-ascii?Q?TltaHJKsB32yUpn6jsUtvNC3clFXcB5EQPxf5cxUMop6QoTO1Z/qyvQzJDqE?=
 =?us-ascii?Q?R/0bP1nhd/tIz1yGoWtdtzGGQUwFmf78QRmGX7O1Kx+YRxhqKHIfjb0UvspU?=
 =?us-ascii?Q?x6M356TQs8LJBJjptmqxSGYccF731kRENzxjFSFOq4m61t+XKv/nEk+xjJBX?=
 =?us-ascii?Q?dhtuSxtYrNgjyq9/vg6uwbNCX9YdhZwI98bGz7goCAN1x0C9RxKtlDYdaDIu?=
 =?us-ascii?Q?4Pp0BKqAu39XLom27ag8cQlubWkNIRvmptDk3nrCW42gJ43+XPMglMax3kYH?=
 =?us-ascii?Q?PRcfT8WUo87yU2isyKpedpp338tpQkHqqgC1IRQEyZAaGlPnkEFeA1aNqb1Z?=
 =?us-ascii?Q?AyTPDfUHugzwCQuzUHoorTMNbklnuzqpYDsHCqurBSWYCbObiTtfA0tGxbNg?=
 =?us-ascii?Q?a+9rjezuG70wl5GQrSocOMU9DUcxuv0chtIbpjv+QNNUz+wOfVZy40T+GA+w?=
 =?us-ascii?Q?M6vRqFfUyf14IEl6jcGJsjTuxrA+MivoK7i87+effNmNnIbPiC+T/d38Vris?=
 =?us-ascii?Q?Kj0Jhpapk8XfZmZ02jdfafwtxosjOLKZaeJscNJJjOqZbV1PcCHO5ruGA4+P?=
 =?us-ascii?Q?+4+bjxuDt7dr6TOkbsb2PgfgC+cpoyvfiyYLAGFxWR0kXUciY+wyAbe/1CUZ?=
 =?us-ascii?Q?LVk+Aqfy+ojfG9ieaIskhhMw8tzuQXxFJaHL2VBVXOqjRDYawAY1qnmYzotC?=
 =?us-ascii?Q?vXz7I797yG2Dd14PC7z3eRiHaUSr03UE/8aA++uMNfWVfC47dB/DNmL2VZxp?=
 =?us-ascii?Q?+Q9MOe7G4KLU7jCVbSL5u2U1qQyRhcILR0fKBuy14Nf4KiSeAinHxZwfYGTx?=
 =?us-ascii?Q?oJ+nAPsCmHyHTpm2mBaakMINJnqWUN4QgmF0n2DeIPM9nRYXaPKQ5Lxk9mjM?=
 =?us-ascii?Q?B5PpUhdbkZ6+ioiG5m+Rfnh206SadMk9X18Jryz5fRfKu5bJDhdxSATKNypU?=
 =?us-ascii?Q?EnIjtMI9DD59moT9yaLLRvoDmTol4f8F2Ds5+3CaOl7c0zBREK/PF3czhE1w?=
 =?us-ascii?Q?xupfD1ISqGp+kFLei9EVzNsHYliZZinfVDf+IdU+62Hec5DwUrvCYk64Qaxw?=
 =?us-ascii?Q?B/CoiGcmxgOeB4m+hqIcJ1s8yW5THgpXN2Hk?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:20:59.8257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56127b85-0a57-425c-4229-08ddf51b7efc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_052109_518435_60C3CC77 
X-CRM114-Status: GOOD (  20.32  )
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

On Tue, Sep 16, 2025 at 10:32:07AM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> After ARM conversion to use physical addresses for the mapping,
> there is no in-kernel users for map_resource/unmap_resource callbacks,
> so remove it.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-map-ops.h |  6 ------
>  kernel/dma/mapping.c        | 16 ++++------------
>  2 files changed, 4 insertions(+), 18 deletions(-)

This patch is premature, I missed another map_resource user in
drivers/xen/swiotlb-xen.c.

Thanks

> 
> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index 25603cb273769..a2ec1566aa270 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -53,12 +53,6 @@ struct dma_map_ops {
>  			enum dma_data_direction dir, unsigned long attrs);
>  	void (*unmap_sg)(struct device *dev, struct scatterlist *sg, int nents,
>  			enum dma_data_direction dir, unsigned long attrs);
> -	dma_addr_t (*map_resource)(struct device *dev, phys_addr_t phys_addr,
> -			size_t size, enum dma_data_direction dir,
> -			unsigned long attrs);
> -	void (*unmap_resource)(struct device *dev, dma_addr_t dma_handle,
> -			size_t size, enum dma_data_direction dir,
> -			unsigned long attrs);
>  	void (*sync_single_for_cpu)(struct device *dev, dma_addr_t dma_handle,
>  			size_t size, enum dma_data_direction dir);
>  	void (*sync_single_for_device)(struct device *dev,
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 4080aebe5debb..32a85bfdf873a 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -157,7 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>  {
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  	bool is_mmio = attrs & DMA_ATTR_MMIO;
> -	dma_addr_t addr;
> +	dma_addr_t addr = DMA_MAPPING_ERROR;
>  
>  	BUG_ON(!valid_dma_direction(dir));
>  
> @@ -171,18 +171,13 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>  		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
>  	else if (ops->map_phys)
>  		addr = ops->map_phys(dev, phys, size, dir, attrs);
> -	else if (is_mmio) {
> -		if (!ops->map_resource)
> -			return DMA_MAPPING_ERROR;
> -
> -		addr = ops->map_resource(dev, phys, size, dir, attrs);
> -	} else {
> +	else if (!is_mmio && ops->map_page) {
>  		struct page *page = phys_to_page(phys);
>  		size_t offset = offset_in_page(phys);
>  
>  		/*
>  		 * The dma_ops API contract for ops->map_page() requires
> -		 * kmappable memory, while ops->map_resource() does not.
> +		 * kmappable memory.
>  		 */
>  		addr = ops->map_page(dev, page, offset, size, dir, attrs);
>  	}
> @@ -227,10 +222,7 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
>  		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
>  	else if (ops->unmap_phys)
>  		ops->unmap_phys(dev, addr, size, dir, attrs);
> -	else if (is_mmio) {
> -		if (ops->unmap_resource)
> -			ops->unmap_resource(dev, addr, size, dir, attrs);
> -	} else
> +	else
>  		ops->unmap_page(dev, addr, size, dir, attrs);
>  	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
>  	debug_dma_unmap_phys(dev, addr, size, dir);
> -- 
> 2.51.0
> 
> 

