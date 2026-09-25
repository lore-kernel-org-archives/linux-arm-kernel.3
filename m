Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2A0C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJSuypaXynJqQikfcJPdhWO1iCIF7RzU05UW6qy9qew=; b=mUm/dhphFkRf6880keqq562y0x
	vXV1MtnaBu7kActfXs1HeIpWE5PRY89Q7rHn2J9YcaCwLxThVkzHqpNk0lQDa168V8L93syv/cyLh
	L4svkyOFTXZJS0gTXf1HBsly4RJAZZUDS/LIoW65D4KVtYM3x6jE7CoS6ZmFiEGko5HEzJqZnNwrb
	MK+Iaij0jOOKCYa0q/4Wj/EMDeXScNP0RwIKLcnC1AD7uaVL017Gs/fziiDQ5ZEjrvmky9tdoXjKK
	sQwglL6ROxGYiNesH/sVQscPK+CVDKGh3/UXsIlyrabSk2wYQCKShxVEeuQkFzMDwAag2JTk+N17c
	rApv9Nzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABEp-0000000EDPm-0awT;
	Fri, 25 Sep 2026 19:05:39 +0000
Received: from mail-westus3azon11012021.outbound.protection.outlook.com ([40.107.209.21] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABEm-0000000EDPJ-1xax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:05:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9KGlN8LFMaVy2ExnwG/I74Xym5krVWY+f6F5TLbXkaD4HgF2GBOoIMosgDYEG/yxiz0OBsFRG4+YquVUQVq9CIyUVAnUbuFyYKQq/nnk+4ArxWXVSYQicHeHoppZlcjR2LxbN5RMv51akfGEA+AJqZHxhbZACIpDVOFsa1t0AqoxEm3XPcHb4EyIiV+pDwkBDd7TXlOClAf+FU30K5Ybo20NJu/nUDTEH1L19ETJdPMYvvxZwAKYatd18VkQHyNVXS1msQ+S7CXE9V+VIfeu1RHRhrO89SJAxvxEl6y3RlLbUZx0qxJ6DnecgYnGBVwiG8zeZu6Gc8fKjmDq9m4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJSuypaXynJqQikfcJPdhWO1iCIF7RzU05UW6qy9qew=;
 b=LPaaKZZbOg0zAxvwX/QsW2DrlzyZe7nr2Q/jBMkIGLeMKOcfaQQ85GclSuOme2PqyhUicVNQNQpE2V+IDCeac/6JvZH7sh0dbcx/e0QObhyvj+62ZH1ai82D/SzLcoGgEs9tymSLa8NMfnhTdkXtYSLg3R4Ux2xjatEQ374L2gElX8mx8rfaR8s3fdatMu9KbBw0bjvJJ1akYJMXGCRNw/eRFE4hc1A7TXHWbLFRq0i1mmF9ickPUQ+MKv9U6TMqmouDfXaXdarE6D3x6kfwth7tLBIqwJSEn7yO1u6Q3BfGARt2JJZWEmwfqDu66+TeCJSP0FeWUeiFA1yiDVqjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=shutemov.name smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJSuypaXynJqQikfcJPdhWO1iCIF7RzU05UW6qy9qew=;
 b=sz/h3m13XggOhLI9bpM67zKch9BK9bh/znYc3y7eztJQriS0E22ucyRhm/i39TleWBnuqxFZkHVcN3TlkaZG5Val4hM2GX1A7hx2UyZ9ZzaU4mOJC8ClzX9yWwoTMeuyQz9UWnki9f0h4kvhr6q/vPESNDKY+2glzUJJKxGuFsIKxAGBxXSHxo1ctO/gCfgnRpSV1FHRFCshpJXRNp4vkXO/zVy0OFip5VqHsBXJkBVBNTcRIJSQ5FttfJP01H1jHFRo5Izq7H8TFyxOVuJW5lQKjnBNuE2cdxb3kJLgEMID/LD30avyQcpi9tmvgh/WssM4uF6V/WqGvbub30ML1w==
Received: from BN9P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::17)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:05:23 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::5e) by BN9P222CA0012.outlook.office365.com
 (2603:10b6:408:10c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Fri,
 25 Sep 2026 19:05:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Fri, 25 Sep 2026 19:05:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 12:05:03 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 12:05:03 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 12:05:01 -0700
Date: Fri, 25 Sep 2026 12:04:59 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Breno Leitao <leitao@debian.org>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>, Yuanhe Shu
	<xiangzao@linux.alibaba.com>, Kyle McMartin <jkkm@meta.com>, Usama Arif
	<usama.arif@linux.dev>, <kernel-team@meta.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] iommu/arm-smmu-v3: Default queue depths to one
 page in a kdump kernel
Message-ID: <arbF22yQi9/YxrHq@nvidia.com>
References: <20260925141532.1274962-1-kirill@shutemov.name>
 <20260925141532.1274962-3-kirill@shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260925141532.1274962-3-kirill@shutemov.name>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DM4PR12MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ef0bda-4df3-4eae-3287-08df1b37f30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: fpsNdT2LzgO/ttCOHDxnkasFiAGXu62NrbeF0sp866jD+sIbT+26n8jwSrpDUt33KOlMs1iB21V8EvPcbVxhB37+UPWBMiBhaCARGNB+MEOhgwsj3rP4PGiJXynhCKI0lOe2w2h/s91f9EnzkBza6bgDxQd5wXkTPPpWqKvJBhLT56uUjDz8FGmS86Jz4Fysk0FITp6jz3msoYN0E4lYTJjVodOJt6sGvkEq286nHZpKvWJM6PWGiDTTYep0AjkN7T34jjRcc8hRfwgMHb23eLcv48fFG4KRzEzupSo58rDeYn2wW8967gRzuXhZ5OSP+qxBNup144wefTDrSanPh41PhQkTfiRgHmxtyBYTCZK+1rD9obt+xcdUI/M+nFbKViNF+r+hcHm72MiZNZiMR/C2ycb4ZirKCZsKey8Xkg1AFqvz/3P7bfjpEOEeBXAamJrQbZuJ4w9J2URF5e05jj41CPGBapGzA64PECWgeU9B6+3iXka2EBii6A7T5JZoK5TDFpnr8snZPfOmLw+TgoK6X0R1J2gBXBIzf+1Xjj5OJhYBxE/r5xZJZfDOEG8ahSUM4Dj7KVDmxV2OYBzr8NMCKeJGn6vVHMz7X7VT8n6PkWbLZMW24DhsXJVny3d1S/Qn3lI9XOIj1XrW2jPcPkqV8yKH2HkhLVP1WutOtUKX0tIEFdDJJOcO/NobhsaBm+tEsSzVmJcpbVsGMAhhbQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3FV7EEf+YRFK/1ftbRkEOmoS4pW5cbP4/4dPKXqyvkDIURnZFzMj4xVJERPwkxYF4HBwkJr/xzHFOQLMorFxMiwZSSMau7CYwr0B2s87eNw+hg9O/vtK+MsKOt75BjqEAnFMIarXmHcLAhSmnu8+s1sxkgQ4jK2ivEmXVoQ36uMMJtss7Rx75oyZgu3lQHiFXS8+YqZDUJhVfr1kMeuWs5NRm+vRK/ZxPTrVOJ1w11TyhN7rMoS/W2P1dNVtQWDFCSrKc87TjcuuBgvrjy6+f3MUsjFNeWVeN3+m/t2dAwPhjVx6UuDWi4AO3fF7v5IjBOPR81CUvCH4mqFVIZTz4zRmRObUY9tMR79MM/ke9uM+Ydg/0g2deaYKDsiVLjGk1iK1kRG2ETGrq9wQJuQP4lCg3iiaq7spc0qp8dB0UQl6l4m+V3hJmBkGEt/CI4dq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:05:22.2976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ef0bda-4df3-4eae-3287-08df1b37f30d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_120536_511656_CA2FE4DA 
X-CRM114-Status: GOOD (  14.57  )
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

On Fri, Sep 25, 2026 at 03:15:30PM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> All three queues are sized from the maxima the hardware advertises in IDR1
> and allocated at probe, up to 4 MB each on a 4K-page kernel. The capture
> kernel already disables two of them: arm_smmu_device_reset() drops
> CR0_EVTQEN and CR0_PRIQEN. It still allocates both at full size.
> 
> A kdump capture kernel runs from a small crashkernel reservation, and every
> SMMUv3 instance pays that cost again, up to 12 MB apiece. It goes to queues
> that either serve the handful of devices used to save the dump or are
> switched off outright, and it is memory the dump itself needs.
> 
> Size all three queues at one page worth of entries when is_kdump_kernel().
> The queues carry commands and fault records rather than DMA data, so dump
> throughput is unaffected. A shallower command queue only bounds how many
> commands may be in flight before a sync, which does not matter for the few
> devices that save the dump. The cmdq_max_n_shift parameter therefore does
> not apply in a capture kernel.
> 
> Suggested-by: Kyle McMartin <jkkm@meta.com>
> Assisted-by: LLM
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>

