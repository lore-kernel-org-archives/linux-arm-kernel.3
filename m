Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E824EDEBF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VipprFJAxSItjGuUwxDmhU/95+2yKmVk0VXAe6BeanY=; b=fRmILml7DZnUEncrfzCRt9RFA5
	0W73xC094laocS2OYQmYWgX1eie7xCKf7PE+qJLnyj6sk0qqd8t6LTkrnoXMGF57UFcGpUdY3+Ka9
	bdfC1ZQLmyMFRnCcv2978a41yo6ZRvFdoAy49JrbONYhbVIJHsD/nA+qG6a9oCdErgfBr81Xi8e/N
	NPIcgK8PLdTJNyG78AuuBZ7BSI9RNpBgv0uRHAu/nPnSO6/9CN+T7R2o2HpEimz3t4MG+EZM13H11
	HqpdhMhzzYlRHlw/MpAZRqyc9VwxKFlNFWDYLJuxHT+BtOAQ1pdJ0nWLPxNn8GsyWd4LQ1RNvqhWR
	JHSWSsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxW7v-0000000FtNV-2WVK;
	Tue, 03 Mar 2026 20:13:55 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxW7t-0000000FtMb-2skv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:13:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spMJjIPdT+Cyz17y9OBwtIkgoRlGN3q3eKfc+I8OgzZcB37gyDDjzx7z3eAeS7PcFIQAII68M1tHe8s2MJLKGH1KM4AdzdEGPnOF3ejqeGZdVM15hwcyNrv8tMEbW8wPNDl12rR9wZdGXnJwBJD/VV/o69M9jl+M0Uy2K9EPKN8SjY8iwhiIP8q3pdkyymXye38j866BxKlVRvlLhV4NZcrjKu7J4zZdh195waAn43HDfWOdrkSmV7r7x9KjOgDOsY/IEhvMmgMTvluE8BAl2ZbXSzqSwMGjkeYKm5KSZuEGbb9imqPaoxCH7+ruh4lymI2NumNWSobjDcyzhSmbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VipprFJAxSItjGuUwxDmhU/95+2yKmVk0VXAe6BeanY=;
 b=mBa7+yuwkSuAR/Jr1WMJ35l0ZNdlbO2iTUe277i+e/dqZF8/Bkj9Anb9nv8Xs5StoILQIYMZn9C3+QtkyPYtGcfeCiduFn+KnWG8QenYhEwU7rilibEX1MXa0w5UuppAtY93AgMzs2Z/hZhLbhXgckSHcKKqcJ2tc6SVp+npFSW6Cgejb7dw8unp6hy+w0+aBHN19UWG1Lmv5hEyAR1r7dJ15uUL/6kyHojFstuQJZGf+dRruJi41p/Y7MFQG7rKX8z2Uj+Y+hoGv0wRfAdMsD0hrG1Trlbk6cHfRMwpXUtqIv20EsQHDThND6lm2vVCmgjZKS8qTTdvCgstRG17Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VipprFJAxSItjGuUwxDmhU/95+2yKmVk0VXAe6BeanY=;
 b=D6SqDmGYY5NONocQJLSevLqcLCFPBrCs41kNqH/w4nfNVa4kyOlkwIzkKiDqyOV0mu9r1V9/LlOIPCtccuqlqi4ersrEBCUv8Yfr4JqJmLdr0/VakNHCOVSlgG27YU/iEe0QPBRC69MnCdNeF9G5USspoerGmKU5UeX5YrlsIoV40RzNR23Fid0GM+4bmOofOkd25YL1QnEg/GZOkNQJVeILbqPF9J9oiD8O26bqlmALfeSGcRQ8KHpZsE/pefyXR3GjiWnnCTSAfYa0cMFZSYj74i0KgutGlulB7fvyxpkwKrD3VZHNST8SqviVnQ6HVR5fTGNMQjtamJhI3/yRzg==
Received: from BL1PR13CA0187.namprd13.prod.outlook.com (2603:10b6:208:2be::12)
 by DS5PPF7856D51FE.namprd12.prod.outlook.com (2603:10b6:f:fc00::654) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 20:13:43 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::6c) by BL1PR13CA0187.outlook.office365.com
 (2603:10b6:208:2be::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 20:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 20:13:42 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:13:21 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:13:21 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 12:13:20 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <mmarrid@nvidia.com>,
	<kees@kernel.org>, <Alexander.Grest@microsoft.com>,
	<baolu.lu@linux.intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RFTv1 1/3] iommu/arm-smmu-v3: Drain in-flight fault handlers
Date: Tue, 3 Mar 2026 12:13:05 -0800
Message-ID: <c8075912c23542c9e9872408658dc496063ee3a3.1772568590.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772568590.git.nicolinc@nvidia.com>
References: <cover.1772568590.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|DS5PPF7856D51FE:EE_
X-MS-Office365-Filtering-Correlation-Id: 45576ffe-04ba-4a6a-4576-08de79615e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: ZoLmfj/wrm4iKoEEXq5UM/Befu5SgQf/330FIpB34QqQSfiXcnVZZeKoGe+9SxN5+2xJ/YPkTj0lSajwYx3V20WZp5Q+a07ACmwIhOzKBKzwNhmixQ6qw6IRywU1Ainr4rD/aErnMoAY+e4+LsjZXbqPEE0B3bd2rmGKjg64U63Doo9evUz2KSrTnfz2isupEcw/otQQQV1oRg6r13Xs0WjtJb32PLyR/RTdN93laA6wNqP+yjPyQgIBURh59uE8LFbzuGeioKGEN/6Zxtjm7gUnOQQ2OM1HAm5jxjg5Mo79n0U3VZxVfToQHza0Rluk774ftyVbb1UlMYq6RZC/O2OjFOhbDTvZhLrevhF0S9klLo/ipg74j2uRhjksm83Z6QDGdhermjDCuFFvnxkYUXK/kuUfUxCnZtyiQP8iDLRsleT0CYbsTLFl03QeZ5Bl6Z+9f7en9C3l8+OgYPG+KHNv6Dw3ra9NOngihFDoQg9bTV6zilC6qDHXczIScHB+PLDGApsBHRzDDKq9Hbmlrs8/E+ZJe7y+PFFsQJFgOfFNq7JAQwx+8xQLjp1Krjj/lzZAFItQTME3mxVyik94VfNdCUgNnzuk7YlZfLS/7vBrNZOWRxVTd186xS9yQHodJ1BN6islDDzMCPNX6evpZXzlX6Ad4k/PeqNcgqccMLEGuuFxErlzDPSY0OAVhwfk4vIKZLX3iJg6F6meob2bgAHF9NU6JIaX6QuasvDKYCOYvK0U7zSxDsda4x+Aqym2lh1pQkia0+A/FnVaXot8zUP9VJz4gN563iEFgfe/BSwVTo6zXU37pEXDNugEpzAHTI8d9BDiipTrsNgRFTHEEw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8cjJkGMvAmWT2Uz1typy5p1XuWci5n6HcXkPpv9G13iA9N8Jrn3hD7COpRYKnHnZwAzKrwycXgufQHLlhFkkcr8yniWIcGm5UH1/U+p6MEgaiskSF3yIDW2T1wLnQ/ui/2HkftJfVAffuu5BH3VE+P+vuUqNQLcz4NnO3mI6TTqQNGdVRdxESRxQ99nJITY7k44F1EmQgaJdnq5OLw3j/nEUXKIz/ngTLJ/Rjn99WGqpg/kFbEtfhZonk2fp2LZcWkBhb7G7xVIw5GTbMSLljELIU+n9qYh5F05hq4Nc3Txyg3uGybK2Q71EVhr+dDSPv1O3Ed+R+Xzby30pdUPP8ZLB3Lg667qHmbXK3YWWv+oyzbalfcyF6Op+SB3Wo4Uy1wr52bpJxMI7PBtDwmS+iQwp9EqhKK3tlp0624iTnblRZTUwfqP/SNLEsagIMkcZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:13:42.9357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45576ffe-04ba-4a6a-4576-08de79615e22
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7856D51FE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_121353_728312_55D3741D 
X-CRM114-Status: GOOD (  12.52  )
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

From: Malak Marrid <mmarrid@nvidia.com>

When a device is switching away from a domain, either through a detach or a
replace operation, it must drain its IOPF queue that only contains the page
requests for the old domain.

Co-developed-by: Barak Biber <bbiber@nvidia.com>
Signed-off-by: Barak Biber <bbiber@nvidia.com>
Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4d00d796f0783..2176ee8bec767 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2843,6 +2843,12 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
 	if (master->iopf_refcount) {
 		master->iopf_refcount++;
 		master_domain->using_iopf = true;
+		/*
+		 * If the device is already on the IOPF queue (domain replace),
+		 * drain in-flight fault handlers so nothing will hold the old
+		 * domain when the core switches the attach handle.
+		 */
+		iopf_queue_flush_dev(master->dev);
 		return 0;
 	}
 
@@ -2866,8 +2872,11 @@ static void arm_smmu_disable_iopf(struct arm_smmu_master *master,
 		return;
 
 	master->iopf_refcount--;
-	if (master->iopf_refcount == 0)
+	if (master->iopf_refcount == 0) {
+		/* Drain in-flight fault handlers before removing device */
+		iopf_queue_flush_dev(master->dev);
 		iopf_queue_remove_device(master->smmu->evtq.iopf, master->dev);
+	}
 }
 
 static void arm_smmu_remove_master_domain(struct arm_smmu_master *master,
-- 
2.43.0


