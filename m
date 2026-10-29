Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86288606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=byrbdxF3;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eCDfGciE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c91nhhqYmlIlOlXHCpzl7RZqDnebhYRsWmehhmvKFqA=; b=byrbdxF3Ya7fDHHT5GouwJeVUc
	L25lqmqO0yt7s7CgRkZXtdgzsv2fou35Z6cvUWgjJp9UIafpTndg9VPJWKiLdcJRplzQo6RzPFnQs
	EPPbX8843Sf/5jkHpmshf/3pMqIpYcQvu54IFM45eMKq2dbfC9FLQ/t5XzWZGYU1EtnmobDOkiCc8
	PsiDJOagmDyk85/UUEhrTdRx3WWCGYyMf79NLV9hd9aLjMq+vuoydVXTCzK+rJFXcRnmeYlT8xcnU
	XvL3bdZyJ6vURfHa5Srki/dpHfS8cZGWqRS7mLus9mm7uluQsGh9G+dt0Y1iGYhUq9n6vtJassufi
	eaEmjBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXZb-0000000APAD-44Re;
	Thu, 29 Oct 2026 21:22:11 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXZY-0000000AP9s-2VLT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSpo3yiVyymCeKb0rEEbmrxWipOrYJ4hDc3o7VQ8ekiAN/gkwpOcV4zwebFia2aRY/U++0ixsvRuiZMnrLTH0L+O/JyzzU+SpqVaqUtEUJb5Y7lDX47mJwF1w8h4WDtylUrc/BWsCoXxowm1WpFVhnPDGesNfaKGrbmqD2w37o0YWjauow1qUzn3JYL7+ZsJTQMtDuP2MIuLsC834++ebwz8n5+s07nNtNNeod9TbPqMj3qDA/g7tLuuuAh9+2OQz7oF0TPAhQUNHZJAbdFbTqIUn5og1Tz+FShHeuHcpMnidCnf7iztE+TNDSyRpGIufX/oKIaD76wEAiingVgoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c91nhhqYmlIlOlXHCpzl7RZqDnebhYRsWmehhmvKFqA=;
 b=CyWOw19LW+dOeegTWTFceMpTqMnu44kOxRi3UQj6zSBw6x2c/PqIgHOLlvZilskOJbsML5OxEcMlSWH8uiwQaban0H5jPAk1MCrAebRx2OLtjLZsPRSQbATtR5prV0Zj02Qo5m7Cu1ZgpNiz9of3k7tQy8p6rQdywbeBbpKZTUN5yunvstoFUgxOl2mloyMFuXZ0TvWyYNldX8AcDpSPgA9IBk7NBRhAqPSwTAuVmbSKwcegSAeYj/4PbwISis1dZ1XKrE0g0IXMtTyotlAVKG9YgylgKi8BnQAv7XGtSvXiRePSE54VQjjOKBcDfgYlkjRA6G6d1jTWWM8YSz8UCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c91nhhqYmlIlOlXHCpzl7RZqDnebhYRsWmehhmvKFqA=;
 b=eCDfGciEhsdoacKHXFjfYHN+MoPvjNM6kq4wqd7iyOOTwHXRwBBXjEWE0PShrexTxJiYniTMAkX6lYWqOuXSK/N9JaTUty8gu9uNr2ZDk6NXqc7IghyEqjf5OaGWyvW2jTy9zJgoZNBJFac08KVWsS2jWpzs+6GMkiMTyxT8PLelpSq3GnqY+vL/D01uCEbM/b/YemqX/lNapAWRcwVu9+07pdUZWQS35vgmaFwCzcIcCH8RjxFkgYUE+YzSKNUa54PtwTBYo1Ku8J66NbKfRZiUnaZflVeXGicokh6fwmMxLZQtEhlMnlFps1x23h4DBMGf4pKw9jhp3AnDuOaXLA==
Received: from SJ0PR13CA0098.namprd13.prod.outlook.com (2603:10b6:a03:2c5::13)
 by DM4PR12MB6661.namprd12.prod.outlook.com (2603:10b6:8:b7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Thu, 29 Oct 2026 21:19:12 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::4a) by SJ0PR13CA0098.outlook.office365.com
 (2603:10b6:a03:2c5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 21:19:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 21:19:11 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 14:18:51 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 14:18:51 -0700
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 29 Oct 2026 14:18:49 -0700
Date: Thu, 29 Oct 2026 14:18:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v9 10/25] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
Message-ID: <auO4Nnd8I9DgNgMA@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-11-smostafa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015200903.2735565-11-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|DM4PR12MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 7759ec23-fafc-4092-5752-08df360246dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|7416014|82310400026|261021121427099003|261021135927099003|261009223027099003|10067099003|56012099006|261026121527099003|3023799007|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: r7/nmKaI2d7TawxRBjC+Kbap+IKR+qmtfQPB3VCgACBvfaAWwEUrznoIdXV9aIukHRR2Mw5//N7XsP40ZltMNn9vBYOgqsYJJhsmyf4Bj5YrMBFZiP0DD50tF64ktnRGz7tNFkCl4bMr++ccucoo1YDZ0tTfytseXOzo1TVdKa1ojyvxVBEsatjK/tcDP3CAyvuGUZKQmwENp/iyfZB1xLerSOwuZ5w2t8R004uL5DZH0GdqsJVXksKqE88XOrldFe+fZCpn9SHP7D/BxRHdO1IOu2ZHS947FukVGqar2kJCIO2fN41iETwA24tCgqRToAT7FYHXyfZOgWQXO/z8ZxBt7k0jYiwCMmpj80nUamqPLoe6pLFP24aCBuNluqwJ/aDggygZBSlfa8GFX9HcWV/5AyAcFNOG7BXDaONrn9W3lLYptS6TazwEPIT2SXgKzRFzCgzq0Qc1lqMNQj3MQbOLEDbsxj23eWQoV2orss7NPQA9jNpLAcNxHgbADjg1wu/6VAgUBUEB3tcVDtvG02w1CkQVCjPiQg03KnD9qBFe+9WLmrBBPVPkUlKQ7THV3/r6ETZvKts24Tk72rBx4MVGbk/WF4GVujvQlMRvhK9U4mZWNCE7CZfRtnZEB2yOlTVHL9rVt+6HFub7B3pUdYVcqEsNXh+6a1l/V/tWD9leeNzwrrv5Go6y8SZs69+Dc+2yG2L3KuO0Qs4PbzLgUw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(7416014)(82310400026)(261021121427099003)(261021135927099003)(261009223027099003)(10067099003)(56012099006)(261026121527099003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VpJaBdWm+q2jRlZ+ySwJYST6rdqFlN5IPi+t16e03cpZH5U1zXAS6nuoouDitfVfbaTTTWkBRi1F1S5+MAYPxVYqI3lRS3jTtfs4fla7mqOTF9GeocPyOyB2ESEWyaBu5hBn8Bz3r5t4+3oGXdcYP/PjnpVfUs4MdWIzekYPbTqR09+ufVLNr7I/V+9EbyIjFTrXR9GYtx0ka5piYIke/GjfTLV0nKYw9++tSLfzAXy5VtciMTjA6TUEIpxar+5+LvigLWM6sIV4Ax0cYF0G63bLLO2t1yzL5NHE6i1WIxeo43NeSqx7ebmjA+epzeMnlKJaz9GYOJS+dxz449O+Atil5NofJ8ZUj7l4k7lTpbp7m0JrG70nkGQD6ifb2/FJwgo34VOXw9JzJWkUXX+74RsP1s0ae6JFD0+m+ADyVKHIKR1Bq/xDA/KLgCuHVEcp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 21:19:11.6333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7759ec23-fafc-4092-5752-08df360246dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142208_668834_6C5F1CAB 
X-CRM114-Status: GOOD (  15.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 08:08:41PM +0000, Mostafa Saleh wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Add the skeleton of the Arm SMMUv3 driver at EL2, and build the shared
> IDR/STE code and lib/hweight.o into the hypervisor.
> 
> The kernel driver, added next, fills an array describing the SMMUv3s in
> the system and hands it to the hypervisor. At init the hypervisor takes
> ownership of the array and of the SMMU MMIO regions, so the host cannot
> change either after de-privilege.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

With some nits:

> +/**
> + * struct hyp_arm_smmu_v3_device - SMMUv3 instance owned by the hypervisor
> + * @mmio_addr:		Physical address of the SMMU registers
> + * @mmio_size:		Size of the register region
> + * @base:		Hypervisor virtual address of the registers
> + * @features:		ARM_SMMU_FEAT_* bits
> + * @options:		ARM_SMMU_OPT_* bits
> + * @oas:		Output address size
> + * @pgsize_bitmap:	Supported page sizes
> + * @sid_bits:		Number of StreamID bits

Better drop those tabs, following

Documentation/doc-guide/kernel-doc.rst

Structure, union, and enumeration documentation:

  /**
   * struct struct_name - Brief description.
   * @member1: Description of member1.
   * @member2: Description of member2.
   *           One can provide multiple line descriptions
   *           for members.
   *
   * Description of the structure.
   */

> + *
> + * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
> + * before de-privilege, the rest by the hypervisor driver.
> + */
> +struct hyp_arm_smmu_v3_device {
> +	phys_addr_t		mmio_addr;
> +	size_t			mmio_size;
> +	void __iomem		*base;
> +	u32			features;
> +	u32			options;
> +	unsigned long		oas;
> +	unsigned long		pgsize_bitmap;
> +	unsigned int		sid_bits;

I'd drop the tabs too.

Nicolin

