Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499B9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3n86wRe9IZSAMbgPy0NJ7zrk274LUDm0lOSKaYmRLw=; b=tUEph6U+oshCbgOOVU2iGqR/BC
	ZnNZiln0mnAzr6V8aKlNOVBGcKFKHL9cYKLXKA4kVEv0gyff7Euuf2JoZQxygW8tCLe4XF/XG4POU
	s0YO1/t80k5JL+QniseRKB88uwg2Lxy+TZeox9OvsmuNOfEhmaWkStbuMQ0HA0TmxI/CmFlDJADT/
	CgHTiluhJjZgbf3wIPP66i5Vuq3HBzHfsqnAhCEee9lSiozchiRtcSrxiGQeasnMUiAs4JhHaxD+n
	etZnHNesi5uWGuuxrnR+X426AaharyYwZDhxH9jyeYSaflmL2KcODelWDF8gXUQY0rdanT+3cSOn+
	JN1Py3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSh7O-00000006JnE-3LJb;
	Thu, 28 May 2026 20:14:14 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSh7M-00000006Jms-1Ra3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:14:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVbWeMXZ1nmJ91qfMtxbwYFnekhGNcpEIi/kU0M6stH+CGQKsGtw531d+SG1r0oLbnHmw1y6Y5M9z86f7e8nSiQmPlVJjT/mu3w6L/cOnSolzoAeMssh5bDHI9kO9j7zWzj4SE2V6TFhpsPpAzulBiUdt87W1nuMLCVPiO/KBp0hnf1+RjUX8QqSMGkffRWejQ7PTU20IVkZ9zuyYUp3h66Ww5AcTjrjxoATzO0Ibx1ky2FF41tDnefPfr0Le0Gypc2R/Rd4zNR/NKEqjTiRzkScgXhfCUxiH4RKvK69VNtkpnir+q1j2H9e4oNCtRuBaSCcL8X/+bpi3psY9NAsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3n86wRe9IZSAMbgPy0NJ7zrk274LUDm0lOSKaYmRLw=;
 b=LPuiPteRPmVvOr/a3iYUeocz+Go/r274one5v5h1tNgCBVQFogFoz6Kb6hNYmjMbmqFCua+Rl9eKzyBjYhyD3Y7hvitFiJxjJxQn6VUgtfwumTgZ868fBwOWX45Mg2f5gZrY0QLiV3M6qvbAH7heJU0mBuL6HpufIJJzouDYaC8VkGN5hneMIbP3RglclrzTE5Enbs3LC3ofY/mUoQzCkujO3sFLUO5NfU6N1Wydt5dRMIdWqe8lX0gcB97V2aR1DwqSt70LzlktaZrq9IDdvR/6NuW59m0P3WdzKYzf7OzAufMU3I/BHjnWYbz3ajotBwmhPSwL1VBzvGevzcG24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3n86wRe9IZSAMbgPy0NJ7zrk274LUDm0lOSKaYmRLw=;
 b=pquasIDrH2OJDMv4vTxd8pmWRXGrW57ArMQVMfGl7lv61fn4TM2c49cy1j9rZw431nKLATpO65JWS0C/h4Mz/XzV8NGO4SrIpd45GbFEvuEOzSBVi/jR4+JBZM6LFhvsCdtKUQgCWP/xranUv0NhVrWVv9ydcV2I0hbwaT7D7BdaEqn2aCfzO7VPeNKZgoZirrLYxmLe/dgeKTY1lgcDG0i/TSxsObzcuF5+RGX+Szd1vpRjHruvHuPDxFAxlSFW4PTTSBFxnQn83bmmd/2lroYkERQLdf+LIaHeDNqsMVDHFLFPnmp/y0Qu1oIBhHviusv6XMjU31Lfdlt5SfoaYg==
Received: from CH2PR10CA0001.namprd10.prod.outlook.com (2603:10b6:610:4c::11)
 by IA0PPF0A63E7557.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 20:14:02 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::9a) by CH2PR10CA0001.outlook.office365.com
 (2603:10b6:610:4c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 20:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 28 May 2026 20:14:02 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 13:13:42 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 13:13:42 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 13:13:41 -0700
Date: Thu, 28 May 2026 13:13:40 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 09/11] iommu/arm-smmu-v3: Enable pm_runtime and setup
 devlinks
Message-ID: <ahih9IQ9jPS34mZX@Asurada-Nvidia>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-10-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260527221407.1756491-10-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f945aa-fb0a-4ff3-7134-08debcf5a901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: KRWwL1pIf8PsFgrn5yfjYLTbE7SxkzDWHyhpPfM06Xc9eDgU+7aOwxWo8+j6RlGSdz0D4pN/wCxdlOCiGfn0Q9MuJ4QYTCKhFtCBuxhc/+UlnaWwy/HDliVhsqMyqhn823pHv190LO/hiUP2X112fr9Omw1xCGNHYHkr8wpo4yqQNn2AW7JiwL+aIRKwJ+/4O94q+9rKOF2xvZlDs1XChN4ml3WIbgcNeQHYSH7dDICOXtSaEqqZa6I2oWhirYS50yW+pTsKV7HIO8MZBrlq4hVN2T3yLXZUreiVRdaBDizVgIcRm8nAkBsw72WzgEQd4S7lJPLfvJPtB7FZ/hQrTnbdd1cH5xn1Fuk44bor32VdEjsSgcprhJoVp5tRFJvheaWmO5DFq7/T0fyInEpdjohTvufSckdqEHOETMv3jYTOdi6RimbAHijM4myot3c0lbktUuaHsDEOT9yF1Nsulf6QcX0QnF3i/53cfd49WeMt1YZDybByD7wVGcGjbOt5N+subrTgCdy09eUGIBH5G6U9IUM/Na3FP3ZMBrvN3URz4wZmRb3pz/howhAaGDVpuz1Qe1s6Tgk6CwqBQT/lrW3fGn2TPtOdO+PcssYN/xqtvtc3dWXj/EoY30ROHg597rlr1kQxHgJ6mM4793bj7cuJT8ZojScdI5WEDzCtR15Qr0DBFEgI5TMrXXhRkI2Uns1etjd6QsInxmMTh3Bv4p3Al0mOsPynmuICobiEGwQ=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xnnDRO8ZKJtWTQp4enNVdKl7AamQZcb4GYGccBzle++iv9u5ieXP+VbpOgtDXJxLZF62pApbkNdmV4ty/QkNvM/ZAbyX4aQ7qA7Eai76UJxXRzBhU80DhjRbiRl9y4UjgWAYKbevWyy+HOu19DFV3P91yYwwCiWndORxIuMMZCcpOixgA48p13Wxknp71qCkYvvyP3z94fAq0i6ZyPGOhfrCjbHOFmS1tCGTUcAZNu/YroWl1WRL9XY+WkXUSBphAr/8zMJQepZ7rjtcIMFGRSTrpC2JhkIktX7W0pVvMb6sHtoSKKWLgVELbztPfHlLmwn7fdtpcS3mL5I037SRU/yQAXHf2M3tMcxK3txgJlxQIxdFaCs6vAK6UzsymIIDEHhyy8vFgPVXS6itpvBiv67V/AqtYZpLjqy0gydRAorqvYEmIxhu736lfBbHvnaP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 20:14:02.0198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f945aa-fb0a-4ff3-7134-08debcf5a901
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_131412_407481_5C880EA7 
X-CRM114-Status: GOOD (  11.80  )
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

On Wed, May 27, 2026 at 10:14:05PM +0000, Pranjal Shrivastava wrote:
> @@ -5592,11 +5595,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_disable;
>  
> +	if (dev->pm_domain) {
> +		pm_runtime_set_active(dev);
> +		pm_runtime_use_autosuspend(dev);
> +		pm_runtime_set_autosuspend_delay(dev, RPM_AUTOSUSPEND_DELAY_MS);
> +		pm_runtime_enable(dev);
> +	}
> +
>  	/* And we're up. Go go go! */
>  	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
>  				     "smmu3.%pa", &ioaddr);
>  	if (ret)
> -		goto err_disable;
> +		goto err_rpm_disable;
>  
>  	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
>  	if (ret) {

Can we move the entire pm_runtime_* piece at the end of this probe
function, like arm-smmu v2 driver does?

It is no-fail, so we wouldn't need to add the revert path.

Otherwise,
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

