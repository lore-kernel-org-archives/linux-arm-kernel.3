Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E52C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 21:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2c+lUhPPYLxaQiIs4EyExmWvTn9RRCfjWpLbE0SmDW4=; b=oyDGyJ5vr8qyn8gN3Y00/mLR9Q
	8CA6prJR87yLioJpDBe/d0520fa2oSpknV+NkDpcc8oRzs3y2M67gF5XrH95sz/IUkLVrSFah+oBm
	PuzPp+cOc8+uxmO65q8qfK+AAUiQKB3fc1ioepVK/gCJWiGwYGKa3GlHph/B0H0RF+XYoTd/5B56C
	D+T7EJmAXbgD1zaSgcKK5OPZZxFkeBjOd5LL+e8ZnFTal3X5TeQFsRAl/9dL1hsO9azizIPgkXYP6
	1bfKlFZLP2iDqRDg1C25kd8xZ/y2qJLJjfOF0+LwfERohvmEWJZgbamuL6r19qGbi6/uZvxi0JQrM
	K9/H/Zzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whwMe-00000003hnl-25jw;
	Thu, 09 Jul 2026 21:33:00 +0000
Received: from mail-westus2azon11012071.outbound.protection.outlook.com ([52.101.48.71] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whwMb-00000003hnK-34il
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 21:32:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMxepAryp6azLNKZE1lg8iR/1jAZoicIcEYe7DH7/pmsZXA6VtdIjGvnsH4gLfVM4azB3mRuSeuse0yfAeEBUSZYdFqb2u/XwSG0DvsPUPdkYTp+lqPK4afxo0jQ2oROUJSxNhFX+D6s7QQcr3F0FSYqi5Bquf9CHJ3pMAF6jHMMEYTqZ/lqAcRoVOwYzEFnvHyE+EYlx1ZDi4UAROpCbzqFmmC0O9jrxasz1N2Fpu/ZF8cJ2qk6rARWFZ9JyrZt9a9t4OGCwLANVZ6vstgoghF8Rg6fgAxiaOkopek0/29P02gEzGWDNIMl2FfSiFDPGBPWGiRFVYrUjDVNoqtULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2c+lUhPPYLxaQiIs4EyExmWvTn9RRCfjWpLbE0SmDW4=;
 b=Hog6U5SLZvQAG2rBNSE6kmt/0sUI3LLBjqnrVdzvWltVaD+TVlll7HrB1cepceikbdj6OljjlkcxAL32KNLg5oMDfv/xM+p0JjSXE+nN6MsxD7vODtNtnZJcFdJBFmAwNmhWwVT6IdNdF0qj0kPmX7YRJJb8VyJXbRLfxkj/XskOFsaERDkLOwjoy0rwPSJqe3m8WrrzZvoOKBLzHXM7gOxKaHeytrVBF/qd4lSEmO+9ziFaivpJ5kPsgI8A111weMOyLYSPC07OT7Nrzh6yEMp/N7ljn7wGUFbFgKbGAORzxWKDITx1CAVuKb64zgqLDoTDnVM1TIteGmo9hPIFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2c+lUhPPYLxaQiIs4EyExmWvTn9RRCfjWpLbE0SmDW4=;
 b=QOp2LOcHD9jRt1b/AaVoNgZSe74nvePB3STg2VVsSfxkIjulsxbMxIzg9nd3enS7yASHMhZLB6FzG3RnGFTd2Sz89xxqfIZJZk9MgGZ4cP3qPhwWeenvv8lNHeaCCAera3Mo5SCTjb+8ZVKoxuTnyEjxvg600e1kpxBTKGjcgIUhydyAnNgdhPzuNeVwApfOeuOhECgtaAUCT7k1TdKW2uOFlMwJ9eb4SBwWlOBkXA7nkqmU/9GTMg08XHUFfz02NZoQmMi/cRjaXEm9Z0iuj+clHfSdxJsxc6bg61N/UHRWGvfH+PsDJ6rQtB5uj1a6SBX1i68PVxiydCuh3TvQEg==
Received: from PH3PEPF000040A1.namprd05.prod.outlook.com (2603:10b6:518:1::52)
 by SN7PR12MB6931.namprd12.prod.outlook.com (2603:10b6:806:261::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 21:32:43 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH3PEPF000040A1.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Thu, 9
 Jul 2026 21:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:32:42 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 9 Jul
 2026 14:32:22 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 9 Jul 2026 14:32:22 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 14:32:21 -0700
Date: Thu, 9 Jul 2026 14:32:19 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, "Pranjal
 Shrivastava" <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 7/8] iommu/arm-smmu-v3: Change how the tlbi describes
 the invalidation
Message-ID: <alATY+9nhJlEN9xf@nvidia.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <7-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <ak3gPqsdg94TTDLJ@Asurada-Nvidia>
 <20260709182559.GH422027@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260709182559.GH422027@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SN7PR12MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad62401-16f3-4e55-454b-08dede019c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|23010399003|11063799006|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: DnQjXUItLGJ9PpRFPPRwKLVXnwMmj3rrg7d4SP5vFxOsEU5v6/y/vcp93DR2GxZTD3JMwozqrgNTJZgEsUoyEPa6AxBf+n+glvDXErYM8nj89KWiSYzXx1BikiqXkL8sOISTqHbduQ8QfkNLQWL9tZi4N/8ZnFTEbEyIKkp3vqN58tI6401EoZbG0V8skYXFb8CSch4ioEhPwowRroSq5fd1rykSTAUfIORNH7iSP2Ykp1NwSc/Sb4hnzDP4iZw7LeZSgOtDOetlNRQI+XPHXOizCWPDXATFD9d6mzg7VNhiHEYh6SnRRKKrP9fNUDRGR/4b0fcrN1Igkx9gfT/Lked7qKPcv+4AeEzESnPBgXZh84rmu9a4ifuHr/bxIZmSSHfklHWB1JyHvhfgg3O2vqsxUa/mL6agGgVKVQOFlSSJxDqxFzYyXnUj8syyezq32yeB/U/PYXiSCjtWD/8j4UdLRvMkQecmAWoxx/uLW6wWdb4tOQ5gJjDVwrWHMgPmBmL7ohgaPgex53Jgv1w9qbzlcdU5pe/WhZeAxpv1QH01F4tklD8Sh7CBnNLQEcXQBOG1nH4x0LKGapSQnkzqvgviW8jCfo8g4C8UxL3q3LUat8RAkmqgb9KtRxbyAPbhptS0l2ZPbAdlfSiThPDKr6j3vPUsqK06VKpPiw8c5paFoPmR6+nvR2e+w8vEIJMpmGTM/vNjy05YaGniMJ0j8w==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(23010399003)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YRJO9Wc+1/T7F3yFGWiUGWufyFJ4BLzfL0AsQWhve/y+9AVa3TG1n6qTdPCDgsR4CVMxMOFmv39F+TBQ3TQYntdeIjnerJt5q0i60bgDrcJTeJGgkD2cSCT/M2NbbwZt9r17ES3If7H3ysEQiSbs9COMVUBoM70MaRIt13C85ejH3tNjpj993ht24CRcDm/uGk8Qe5HuihBUgFjmQ4g0/mb2sfsLTYlee6fTPjFpIOCIs1pAMD9yD24nfjX9dv/OcS/5/upYcSQHiuLBG7s1MJuzCFkgNJz4fAqggRFWc3B37dQemlfI1Q4hhurlTLxrVL62c41UKlBXLYdwQwUaePPckQaZqbhoN2XKeYh6+Lltgv1dIZfoYDcPCDEUnl5IaykY3duwb3L1ETHDf9O+IG9A2uesYmingTSfc8+TiIORrlpJtxL+ZFhq1SgxxRY0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:32:42.7592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad62401-16f3-4e55-454b-08dede019c21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_143257_772019_B32D1666 
X-CRM114-Status: GOOD (  18.81  )
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

On Thu, Jul 09, 2026 at 03:25:59PM -0300, Jason Gunthorpe wrote:
> I wonder if this Claude was thinking about a kernel before
> 84b2baf427968c1 where this flow would have been as-described?

You are right! I applied the patches on 7.2-rc1, but somehow AI was
still relying on the old code. I had a some hard time to fully get
it..

> With the kernel today the arm_smmu_tlb_inv_walk() is supposed to clear
> out the walk cache before freeing the table entry and the gather is
> supposed to clear out the leaf entries themselves. 84b2baf427968c1
> changed things so we always have a second leaf-only gather that covers
> the entire unmap range, which also introduced the double invalidation.

IIUIC, for the "double invalidation", the driver currently flushes:
 1. tlb_flush_walk(iova, size=2M, granule=4K, leaf-only=false)
      // flush both walk cache and leaf entries
 2.iommu_iotlb_sync((iova, size=2M, granule=2M, leaf-only=true)
      // flush the 1st leaf entry only

> What I missed is that because of that commit gather->pgsize is no
> longer correct, it will be 2M even if __arm_lpae_free_pgtable()
> unmapped 4k leaves. So we will still miss leaf invalidation :\

This also makes sense to me.

> > > +	 * If leaf_levels_bitmap is 0 then this is a walk cache only
> > > +	 * invalidation.
> > [...]
> > > +	u8 leaf_levels_bitmap;
> > 
> > Or is that only to implement a walkcache-only invalidation, such
> > that the leaf entries will have separate invalidation call(s)?
> 
> That was the plan

I see the full picture now.

Thanks
Nicolin

