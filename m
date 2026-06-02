Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B4DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7sm8HNC1m7cxWSRUAZSUX7WOootqwWJRpN6whIhDb0=; b=IMOwpUq18NlFrT9Rsakjvfmr99
	5nGRwGNPEF0S626ccUxVYSvbeJ9Zyc5meUdOGqVH4TN2aYDMdU83eqr7q3wTaxPrv1VuQucA+gQ3y
	vwSJ4wXBaKKRuWbSdHQtXkgF7G88jBNfIieZaZgs4cE+l+rpsavIbRd3yHMJgynBWROCw2sne7/h3
	oLaubVBDI4GKCSnQXtrbNru1puXzolEpbM1bkBqT9vx9sNvNlyrVa0RTb4+S9zk1eyNI1KVia7G5y
	hXPZvhctagVlXu4ca9v16RdVqCBT9dg83UGCEMOfXpbteSz8R7vpkGOvtMtAx7OC2iyETMWAR7vQs
	U7Wgl1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIET-0000000CMSX-2nRY;
	Tue, 02 Jun 2026 06:04:09 +0000
Received: from mail-southcentralusazon11013014.outbound.protection.outlook.com ([40.93.196.14] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIEQ-0000000CMRg-49UO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:04:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceiIx4MpYHg50Hj6JTayXNzn+mKbby3xauPgj1ny14RBPia3dLUGiTTNrgJz5DM+vGclKYQRuRUU2shdUVIqMLiUT8hFIJ0iJNdseI6+n5QlLYh8GvqnsTmnqbyJp4wDPUycsDYp9bREXcgOHoA2muA/2szQEW4pPuURUjHLOw+aPY8kvmCF9yEEqJCElF+YFaj1rJJMdz4Pe+yfTbeSKD89bK61rhNgqZ9pWcnH9Igzn5y2fZ3hJYv9kC1PlhEn8O7Lh4VTP31ncOHV5MoCx8DrHQiFdSchewnaYQSZAWU00SC/OfEcSz/8cYLGi2xmkOVwl8cTggR1+ckmFoBBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7sm8HNC1m7cxWSRUAZSUX7WOootqwWJRpN6whIhDb0=;
 b=bIzUwiHu9VhXSzziGcD53DwYuleut5k/lY9xj7G0Tz/paajoqZRqVKnMuI9J6t1xSN9YJ/IXOL82jvkrZW+yMN4Zx4br1VE6vr2PfORprSuQBwCq6xSYxeUvWtE1Ao4h4jrciNqxYOT5JeButJjuXpYQ+EZ6fqTdvGQoMsT7T530kLvojBpV8CCPdR8qlhgVkhKhKpoHxrTn2ukXuYHGgixnVkSiuJ11qyREO/cRV5pwE3i+8GVp/jZFz4BO1uA8GxV31hSmUYAg5SGSk5RAZ5LzQ02A8Vf+m8egdOi0WY0hjqiPUHyIAz49yghd/3KyWxwYtDDNg+CfQ/oZ4daCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7sm8HNC1m7cxWSRUAZSUX7WOootqwWJRpN6whIhDb0=;
 b=MMkkPqTdEFH0u3mfAmzPsF+0fuwmhNMbeKDdPQvZ2lx9wP1wsiIUSe92q3cTn01F7wtrAhjYKMkKHzsRsfn/lFphe1CS999XcH+tKSvv8zPHTx4FQGshyBKFUvEoksCgQJdYE+8heWGTOc5s6ihF+RToAc5YEwH89M2J+a4fECSKqmlxk2OAC4KUyY/EO+kmyuH183ZKr5uBFUFhAy9HcyFzT4XPNy3B7GhRwxPqXA1U7GvBptunclGQovlQYgDck+o/6BTniUe4EV5OkWecx2FYtnGJ28BSzrvsNP7H94q4Ed5kWs9QkmDQ3Sl4tdqTVkPuZVebhrNW2fi0c/nmdg==
Received: from SJ0PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:33f::32)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Tue, 2 Jun 2026
 06:04:00 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::1d) by SJ0PR05CA0057.outlook.office365.com
 (2603:10b6:a03:33f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Tue, 2
 Jun 2026 06:03:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 06:03:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 23:03:44 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 23:03:43 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Jun 2026 23:03:43 -0700
Date: Mon, 1 Jun 2026 23:03:41 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 00/10] iommu/arm-smmu-v3: Implement Runtime/System
 Sleep ops
Message-ID: <ah5yPciJTVTjkMfJ@Asurada-Nvidia>
References: <20260601215909.3958732-1-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: e7798af5-8b04-462d-b614-08dec06cbc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: K25crhW4juqEPBy7SiC7zxLQiwc0mJA1H5QkCH4YrbklNyym+UoUtVYCvesthxPY8vbSs6hdoYZ6IA8gsfv7P7KHXPBwq/tCIHeZp6z6iKBZ0hkgE5iILec3BQb1TlHbzRac7ROoxFbQ7k0oMfp1qM4nMh8hpHExtVFCQGuzIvUyAdujBBFqfNG614CCqfw29/+n67IuwlpqQTL/qPDyECLlY9TD5z60RWfvhKgmv1HEVccKg7P8HDMeq1XmRbRxoIzLF0jZBKRJF3lGrxkPiUEN8nTj9DSWb/HpFJjz5YR9K60/R9kEk/aqumQcX0BaOwzK6TYR9jtCCEM0zccgvni79qZznInnVwkJhHWTw19GNVdwwhmPEqpvjaZlglZE/6l0zx+cpVbhNchpLfNleObWy5Hr4WfhPt0ndDh5rORLnak8ugt51slhQThJXP/O8f52I2f1nnisDpYpbzKfy08LZZ8EtOLvkNoN1IBV6R1yrA9KWGmBZ9aF1Q6Myx7sdZ4VXXuHYzg7QveS5wgTOgPrWEvdaP37oPQ55dXGhPUfM62VNqDqw3ZKdc8pihN9hhVCWNyrttrXFpa1jeWKlIdEPCH0A4tZXWxjTY7WBaqdlensHkr7spo4KLVpJ2H8IuM/MsIuXR5r3xRx9o9osPSD3vap+09lTFRyGSVtEL0vvvjl5Vi40XTuX2XKg6aqQtu97+sNqWj/tIWpVy2lB6hlqmCbgEKzdy8+GDZJirA=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F34nU4zEmkacgWr/YPV5Q8WmTslrS9G+JeyWzic9zHlSGozf71eDM1WWP3j95rVl3p8W1CdOCiqk3DgXdqi6RRLlInfKUP+14w5OOghl+EiEu3R5TvpXCpo3Y0s0YTsL/UGMbngO5v8sTmTYvUK/VRmUTnadWeumGPWNbvtSEG7miwZFUV4mQsFLpwnx6LpHmuGOQUnBW+PhAPO+sms9I/sL9lhxn43re051Jq15ZzAZWlMC8lf5fo3qTsjptOcO9hEQwh+CVWLE7Dn4LxC+aIdF2BW7mwo4g6WRq0P7rfidgKQX38B1LOrXSBQUVroSwjT/KTIYRuyqQ+0IZjiwncDpLFjiQHQJm976+QX031Qjsf0/TjWXqP+FqE/gNvFPLVTLMYwuXCmUbzFbmyIKtOH/vRNB/A3k8Xm3wh9Zks209xgrb+Jk5L7+IZXBWFdk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:03:57.8168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7798af5-8b04-462d-b614-08dec06cbc21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_230407_028743_6D6DF00B 
X-CRM114-Status: GOOD (  10.01  )
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

On Mon, Jun 01, 2026 at 09:58:57PM +0000, Pranjal Shrivastava wrote:
> [v8]
>  - Centralized elision logic: dropped redundant checks from invalidation
>    call-sites; elision is now authoritative within the CMDQ layer.
>  - Renamed elision helper to arm_smmu_cmdq_can_elide() and preserved it
>    only for diagnostic/safety paths (ATC, GERROR, Page Response).
>  - Consolidated implementation-specific gating and draining into a 
>    unified quiesce_and_drain_queues callback.
>  - Updated tegra241-cmdqv to gate virtual queues before draining,
>    addressing non-deterministic timeouts from guest-side submissions.
>  - Re-ordered probe sequence to enable pm_runtime only at the end, 
>    aligning with SMMUv2 and simplifying error paths.
>  - Refactored KUnit tests for better, addressed Nicolin's comments & added
>    a multi-threaded kthread race test.
>  - Refactored RPM helpers to use early-return patterns for improved clarity.
>  - Collected R-bs from Nicolin.

FWIW, v8 is still missing a base-commit and Sashiko fails to review:
https://sashiko.dev/#/patchset/20260601215909.3958732-1-praan%40google.com

Please make sure v9 patches are formatted with "--base=" and a public
commit.

Nicolin

