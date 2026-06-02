Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDF0C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O17P41K3+j5WqEFYjvnf+k9v12GO65cNTzH0T3NQiz0=; b=CtehACMSeQLUNWqoC6ROvyPJYn
	pdNUzXRwA2sOL2nDRSaU82oS0FSN+5Jn9w0eUh0mrZl8OjGDPro025vIpJBjsVe0zbHABMSS/xLx/
	r6Ziv13dhZMZ+9WLuAWwOBQGuVLCCPJ6RSF0LIX9pu2Zpe1cfisBKYvNb+3VPzDvu/ZkmlnRFrdF2
	hUvpZufD0ra6kaQOAtYnEo1xd5LTSbJZ27ig9jEOs1RMVwpZtL141Wyft479XqfL3vxO6X2sFf2MB
	IIVFFQDVuEafG3BLmfNRlDbLsLz2k91bX0gA6JCtVBVc8F4Fglo4g/rTiOw12uK5gt0+/a1LVMCfy
	+FvbiJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIdf-0000000COa6-3VqY;
	Tue, 02 Jun 2026 06:30:11 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIdd-0000000COZT-0vMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkwLJNjQDrveUb13NcmuSmUS57pAvRLugpy5npjRgltJSwBjNbKJ/zHMru5wQdExC5cwlVDYzopYMstogk5iQNEzgRharz2HYOuDTnNNKxczzeKYL/ilxYgvIeNn6mydmbcjnvB0hjqqiG/7xQhO+CZ1M95yGKzNKHTXHVPbkJK4pdu2OOi8bfSV+99xKWYsrXyhb06CEFVY4Vlt4A4bc13tYjw4IHNfoM+lOLy6Tq1IJCalo9AopcolP15thDPUiRKqTubc1qcVwxI/2RdsCP2YLJ7LA+oTHTszTyFVwVOVpAXsx5FK/yCLaWbFb5+BERyzuYHZxjtjZMG8z3iZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O17P41K3+j5WqEFYjvnf+k9v12GO65cNTzH0T3NQiz0=;
 b=PKPcm40iPC7+qY2hvM62T2yLyWeWeqv+EoYj2X65G/rsuKO3R+yJidwtlk7mWpg2FKqEjaIxaEPFKwks1qK8w6LVl+bh/9kv4LyJLWWF8BoKShv8c36UAcQ/Gib0MIdivVVwCvORpnMCnlIzmikF+V5DynM++HuToc8hUVsWW8hznJiPOJHxCiwaK5Hz6EAUcCy3Xq0ynjEyt1rXTzM1coz8kgeuSucV25y5vWpwFe7ysO2DX8A0m3E8gcOl+miaWcM/xu8FLWXpehrKZafQn4FRTUJ3d9M+If4D55Jz4pTD1xZpy9JAQA0/GBregv/jPs/xKJQL5NCpCWgMLq9BfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O17P41K3+j5WqEFYjvnf+k9v12GO65cNTzH0T3NQiz0=;
 b=UfRcMRpavsNKlq8BJFRsm7p6lCRaqgOfnV6YHm9rn37Z95qVMR9LmWL8Z+tWNt9nP8Qfigo39C8vhjttnYMLiQujulD9BVOXOO7XkcBkTAnTXY2UoGzIgvD2hLv1jbDlaZhhryGZ1cBTlXfjq0QkynLDX9mNa8Qp3UF0ur5YTBhu2kZW1zJ8E8xoLQbr3CBVrzEf+PojS+H8/a2pBXC8UhlvmLkK4SAYavVFNeLnWrf2KhRuwWglANnizHuWWgxRyPFuoJx9UUErFQ0TFmGV++0y5c/gx4WscjIiEwaHpEhHRQgPzHbcBWyws35iGX8IR0Uy/fADx6w/DAfD9xvovg==
Received: from MW4PR04CA0227.namprd04.prod.outlook.com (2603:10b6:303:87::22)
 by SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 06:30:01 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::a7) by MW4PR04CA0227.outlook.office365.com
 (2603:10b6:303:87::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 06:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 06:30:00 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 23:29:42 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 1 Jun 2026 23:29:42 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Jun 2026 23:29:41 -0700
Date: Mon, 1 Jun 2026 23:29:40 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 08/12] iommu/tegra241-cmdqv: Add a helper to quiesce
 VCMDQs
Message-ID: <ah54VC0TUch4XsaP@Asurada-Nvidia>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-9-praan@google.com>
 <ah4gYCgSO1bBOUTj@Asurada-Nvidia>
 <ah5QB0Hfpi9wZMLY@google.com>
 <ah5xRRn0IjdWiF8F@Asurada-Nvidia>
 <ah52eZh0DJ8LFL0x@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ah52eZh0DJ8LFL0x@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|SA1PR12MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b8cce7-5727-4736-eb4f-08dec0705f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 6XN3FEdBp8iUQTST8jLGLV0+tUB95Z0/WAuTQWT5EFGTMtVSnxSQHaJBqfOIT6ifrN3Gefnpl1EQkl7g66DboeOr78F3nv4EJnYfKX+xfy9l1/er/Uq50rrYfWf4mW/vY7t2SSQOD017sapjrM2hRrtqbB8Frfi18FeCJleBqWEzWAPYH/CvssW7txGIyQi4dsVwKdgTHYo+sucX5VjFCOm+AlIhIBTuj9iH6JE4U+xNaUcM4oeu9czAQ8fAjrm7pKzM7lT5rJyNSf3u7xPLo/pPI6IeoSyIuWxJHZFc0l+NttRx+CPH4do7Dkz6YUw3MlTOjnqIYvUBXDbGpoYDDbG6LcsFGLmhceHHRZm3Dcw0Lpxpf00zxRRRwkSz6UOQ1JbLO+62OfnPYqefjlwdE+pijl/R/ibp/bU25Jp+g9NFAvbVvP6lMfa8qQMvr+ARzvL0lqA0iKHYRqnzrOuLLVrgpCjCTlAhZBYLoGQ/NZQOhMZACuznSFoL7CIBiDrYirmdWnG0bnN/75toF3SzaTgEs7ieSKkGCgx0WCaJxZPRX4sNFUJpmguUN3+Jlq6pE97uxw2lm0G8U4HKzsrDqrOLDQNyIDWS32DyAHgfd5FowaDMg4I62weYQXRm/BSRy3BevOSaxWqSbGFZGoyTtw+KzpxBeG02mCTljWTgcMGZ3hf1FzXpz9IJDUZgED66JmRCFo6snzpBUkFbVPhwrAFEXcvob2p0Fe7Z2Ue0kNs=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1yBr5W+ZpBOLzzYNP+QOkf2JOmGkHaYFCsif2QErrMiiG9unz/+GHc5Vd0QsUUXKbjANMttXu5bEq4x59BJKBgJAkhyeECv+CGmPRBTnvmaH/LU2N0BJSq24KYtEItINn83vLlQo5n9bLmWqtxt4CPHZP/wWxSSOv3s7n4pUB5l6EC6NKWAWhlypb7BnDsA/7ZcXczaKMk/l5EbZGF39mIiGCzADGLUi0TQJCweUHyFb9jW7CXruxfGhwCvgsYS9xIfx25c8whckpvgsxVhKByKpf9Ks1Afoqm3EAHl9dZc7BOpc+mvZjfA8oW4PX6L8sxgqpZN8joJESyl7B2kOkiaC1Da0mw3H9IBkyi19grWY+Cex5QBqH4f1nRqmw0ySIGVXcRVWCptxAcPkIoF1XIGL1k9qRbG3Po+A1bqUmPEsBdm4ytj3hCpIaL1WOfX3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:30:00.4377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b8cce7-5727-4736-eb4f-08dec0705f90
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_233009_290796_06B68616 
X-CRM114-Status: GOOD (  13.26  )
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

On Tue, Jun 02, 2026 at 06:21:45AM +0000, Pranjal Shrivastava wrote:
> On Mon, Jun 01, 2026 at 10:59:33PM -0700, Nicolin Chen wrote:
> > On Tue, Jun 02, 2026 at 03:37:43AM +0000, Pranjal Shrivastava wrote:
> > > On Mon, Jun 01, 2026 at 05:14:24PM -0700, Nicolin Chen wrote:
> > Arguably,
> > 	atomic_or(CMDQ_PROD_STOP_FLAG, &vcmdq->cmdq.q.llq.atomic.prod);
> > could be even stuffed into tegra241_cmdqv_drain_vintf0_lvcmdqs(),
> > where there is a for loop already.
> 
> That would be slow IMO, because we'd set the the STOP_FLAG on ONE queue,
> then wait for it to drain and repeat this pattern for all vCMDQs.
> Ideally, we should set the STOP_FLAG on all vCMDQs first and then wait
> for them to drain.

That sounds plausible. Please leave a note for the double loops.

Nicolin

