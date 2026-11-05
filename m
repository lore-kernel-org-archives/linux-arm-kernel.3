Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC5606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4PTyZSME;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lkVsGZuq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P2T6CKmHWpBZfkTNwwS/vpOZJAIEVL/Se4l3mW8T0iY=; b=4PTyZSMElkbj1pjnVwEipu/Xq/
	GkAGQXvEih5fIJQRFcfsb0Pc+uSxpkv+2gbbJbT0pWrTSyopP6wHyfJC24bzbvUGYS4uuO33eclEu
	OIvyok2XMaYBD3XwcZEQ0hvo2lvKiBs+j/9nUPl8ABN2zHTp3LYN9O3G1/p//fVlCMcbran/pcXrm
	JfL+kSwQRDnI261/bKsLIckl2ZSCccDaJQ9SWKBjd/OHKsaksmW8rxVmOyQQZKcMljGiaVNaC+BLr
	9zZfq4m8aepqIoUSiGPw1exhTIWlUaxuzIsjflk7mtH+E4i1Dz+O66BC3eSDWd+99EPDdmmSFeqqS
	m6NwmGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4fd-0000000AfxQ-2vD4;
	Thu, 05 Nov 2026 21:06:53 +0000
Received: from mail-southcentralusazon11011037.outbound.protection.outlook.com ([40.93.194.37] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4fb-0000000AfwO-14qF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:06:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEOT3v6ZJGFv3nFn0e1oNjC40nXQMdbb+8cHvyNYu9spgyRDmVT9WeNhS6KHrPX3fVNOLjE8C5BPAC5QZGQfSD3GFGlsDLTbtUeaSRkC3n3F6wTdrMJhtG/yXrXihzcgFjKvzVSe/Q61jMFxy8+tx9X0tNIqh8PnO4XrCRHR/N1g5dOOTz2fTt5vokXnqM+BUUiimDlRGpaOjcBW6RvPkc/cWEp2AtpWQtJDEoCS7rczV6kwvEfRlzaNrhpXVWJO3B+Uk1ByakHHdoUg069VuyUuAlbP2ae7kyG2bmY/r+1VjnwU3F9lVDE3zhe/itA+FELMXj0Toei3wuy157Yq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2T6CKmHWpBZfkTNwwS/vpOZJAIEVL/Se4l3mW8T0iY=;
 b=uLJifsCl3GSsMt2z+rPByPtZQJdt5jCPqpA/zT6/wMT2rd+ORq7pYW/uSZCQtAnV07eh9S9Sql//AL++uAml9W3mtKCRx+3TyesrQw9NxsZ2e+FSnKPnpqHRlJBYkZExnwJjGJZ08MOBut1ygNQkyoucW806O2nfnTBYiuQNEl9wXCGMgW/kKhFdOR4f34h1zRnxIQ6yYbSg3U5JqS9/UFZ5voUlM3dXfmgRCCNVOi0lxQRsHJwtF8YrPBym6Txtr5BLujXjAaaqQXVzVySz4XQupcOt42XPby2Lbp571a7lBC5syqX32p3S7auVyl1LaH1oMf0Nqb9iVAOlNfdmQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2T6CKmHWpBZfkTNwwS/vpOZJAIEVL/Se4l3mW8T0iY=;
 b=lkVsGZuqzrwkMukCMTuWaL3wQGPeIpCmoma4SYC39pxZFtOdbh+j67y4W/eEytBlEqmc6OIBQoxlvE3apWVe/w9xEVFlywVtNBxIP1QRbljG624Xsl8TgJ1JGEqtuMZRSK1xvvHsOfarqwuGxpssqRZb+xOhSswwyhorHlR+lKrSn9cHau4yrDqW1ZOnFtvkZuZAOtf0i3GZBv+qZXhBrpNnPjBd21jksmbHy5Hj7P37rWdHqgyHkRQPidiW4C+d7ynH1U9XIuvpfmPt3r1Vtnokso9cQCgHLXxAT9UnYgnfkUm/zx57V+IdRAewbw5AOEQizywVoHDPi+3fx/ywpg==
Received: from CH0PR03CA0238.namprd03.prod.outlook.com (2603:10b6:610:e7::33)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 21:06:45 +0000
Received: from IA0PEPF00000042.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::33) by CH0PR03CA0238.outlook.office365.com
 (2603:10b6:610:e7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 21:06:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 IA0PEPF00000042.mail.protection.outlook.com (10.167.249.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 21:06:45 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 13:06:26 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 13:06:26 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 5 Nov 2026 13:06:21 -0800
Date: Thu, 5 Nov 2026 13:06:18 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <auzvygiGRTWgJXzF@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015200903.2735565-12-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000042:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: de21331c-00ea-411a-5487-08df3b80b2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|7416014|22082099003|18002099003|6133799003|10067099003|56012099006|4143699003|11063799006|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261028144727099003|261021135927099003|261021123027099003|261009223027099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: iUPLOmUxuYI7cwu0tpKalLgPaI9Ts1cPImR5KXEEzbUhGN3Sf0OtAisz4xdSwt3GxiN3A65xIye2gz0zndtdx9NDg4txbNboUXpCw+M+K6fnGCa9HTql0SELwTFXg/ajgkn7CxiAT2AfZcWIbLC1slZqjU5XVd7YgGEbhfx1qpfsQqr2Ja74/cxGhOBcSMiOwnAv3uV6X8RNmzBWl+Qx0ao2BnN8Sf7KA5oWdcX1qbL9dAQ2bDcdXxim9rjVzHLjV+GB2PZLN8Pk5DL7m+whjP01UYlpgVMjzfJEIbuBDtPAC0K7CgQohQEfosJBMLmUypG0SFU6knnpxHO+Sguo414zV92GCEB8WZyeh6+JypXuuaiV3ZX14RKU9CievvRQwEHtd0NYsCxXVvKx8lWpQwJjx9bdon4vRTdX5ycrOBW/9E1wKmqEl4fD+bbJeJLO5unaxPynPFNItkwt4HuEm1Bjz7KflbUnCOAira7tsxY6FovfHCHqtEXIWpSAVINXyGym024qN4u5fZOFd7JpVFIgauP0KiAZVYgkdy/IseXpgc6EKM7kY6MnMxzSyUDd+2WVvAFWs+W2oqqbqTTgAFeYMoxhcVvyxqlCxaJ9wd/lCjzgA6I/LHp+yB5z3fniFBwwrOOlZ8xjZxL+5SSZcud9kyq5s8qQraM5hi1XvvPdEVeTLLUVw2e2uzHMdGrhDs7Lw0QvgsgkwFuKj8ZPgA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(7416014)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261028144727099003)(261021135927099003)(261021123027099003)(261009223027099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NAaA4ymnz/9lMUzS84GJm7W6C4UsOvPayYrLfwLu/ezLpuo1CiF/Z1xJvMA5hCqibH/tn403UNw8v9K08THaiTZp37o9FXS/GAsvEdgC+WHFHNAjJDXT2evhjiC4MfKbGtd8HY038hrA+tKwH5dnPuvpy2T9/Q1NiCXQNDO8fW87wncmW4xtPVD2+4qYDI0Y+1TlX7IIx/EITVPqS7LiRxGbTcSzsAVR6mR3v7vDVgdE1BFLhVXjALPYeAOkbkUCZGzlXLIDrbS3V+hW7T9mZ9/SpDn8zYbi4GpyDwCPKTFXOohfCx2j8Rzo2fxRkW6HySLDRFKcgx84KBOg1a2RBVWaKc0JAZ1/KTmCt7sQj4h/qmqheakXLQYd5sCQHeqrOfzTzBQU8N+RSz6a4RE/9Gy8qoEGGHpdLmJ/x1O9Wm3suxmkxuJS5gEjDsK1k8OS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:06:45.2728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de21331c-00ea-411a-5487-08df3b80b2fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000042.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130651_339519_54EB8A31 
X-CRM114-Status: GOOD (  16.82  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 08:08:42PM +0000, Mostafa Saleh wrote:
> +static struct platform_driver smmuv3_nesting_driver;
> +static int __init smmuv3_nesting_probe(struct platform_device *pdev)

Could it use a different naming than "nesting"?

"Nesting" is widely used in iommufd path for nested translation.

Here, it could be smmuv3_pkvm_driver?

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> +/*
> + * Two devices are involved: the aux device bound to this driver, and the
> + * physical platform device bound to the pKVM init driver, which only uses it
> + * for discovery. This driver keeps using the platform device, as it carries
> + * the fwnode the IOMMU core and consumers link to, the DMA configuration and
> + * the IRQs.

It would be nicer to have a diagram or so to show the co-relationship
among different devices and drivers.

I assume the regular arm-smmu-v3 driver is a part of the picture too,
when the pkvm driver binding fails?

> +static struct auxiliary_driver arm_smmu_driver_emu = {
> +	.driver = {
> +		.suppress_bind_attrs = true,
> +	},
> +	.name = "arm-smmu-v3-emu",
> +	.id_table = arm_smmu_aux_table,
> +	.probe = arm_smmu_device_probe_emu,
> +	.remove = arm_smmu_device_remove_emu,
> +	.shutdown = arm_smmu_device_shutdown_emu,
> +};
> +
> +module_auxiliary_driver(arm_smmu_driver_emu);
> +#endif

Nit:
#endif /* CONFIG_ARM_SMMU_V3_PKVM */

Nicolin

