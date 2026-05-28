Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BD6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLrMif0UGwQI+RGVPDKk/rtTXelEVd/ce6YJKYw+0D8=; b=T27CPO2YA5MlsBvSBkTnSdq1ED
	5L4XyFzCr3ZvT8a/QfZENq0xBwnqbKR1N4KiqaEnBVwaGukArFXZvT6YIRoY2gvvggNfg3iJo8HGU
	1erYo3xqY1Sx0nWfrJCmGyj4WVSH7h8OG+XZ4F50XcZwifR7JMih15OyhE4fxQvsFC51cQOQiozWN
	n9CGIM7XSoDniMv8ya0WmuydENXy9l9zArWj9XRRuzvQroKDZGP3/T79Iqc5BZDZCxQX2SSqf8RcV
	+P270YGrzoAqgw1HDMLVRFc5Gb5SsYpSY9Tum3oj+DW7PnAsD+uaqffotzqjIy8AaS4jKR1+fbiZr
	s/Ri7LxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfGT-00000006AW9-3X5c;
	Thu, 28 May 2026 18:15:29 +0000
Received: from mail-eastus2azon11011018.outbound.protection.outlook.com ([52.101.57.18] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfGR-00000006AVR-3tLW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foyiqaBtZJDIlO/n4odJWtoDYKeMUBHaQ/Gx0s4X91r0thsvsAQNkrwUNZisqF5kPNH7XVsaBq5PanEQP3WZXyhINKNzwF38YU/xkoSCQLC5dlQYo2I3zdPT0NXgLNlMwzCes3s3RbcmimXuDOpsdBkGSm9yS9KiZAltwsNZQMMuDSYtQZ64PK4ZeEDdEAqGMlCNd1nQcQLkcw9VQR9FZJurK1LYdyXTGIDWigm4XIi8HJP5n8JW80NMsM18d5ikt6NJL8FpxdpMCYjgOvF+yrNy2YqrhtVa14RMhnqRcKiUxomBkqrJLOT1oVEwqhQC/IuyoChHLETdOr7haJIVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLrMif0UGwQI+RGVPDKk/rtTXelEVd/ce6YJKYw+0D8=;
 b=PfMSWxEDAnfH/49g8T921zdvNHtQGLCz9Fd9F4AWrLFrKIWIKX2uymOYo9/8aSCeXQgV4g2eba5T1qoqt3GMRlWhQRKJjD4ED7zdF2ZR9JhrAa8RvaxOjCvxqMcL2PGW2yfkKeDzqe/j5JeQMPEwGV3l25BvNBISk6xE8ASBhQmZMi1WXLvNHuzSpCRBgELI/jAkwdZ35SyEDrCJ0hM+b0OX7gRxt3TAaOJC+xgP12e3P1t0jxhC7snDKUHLReVpzM+sB7Wsuf/YuH9XLT+KXCZh7Rde9GkUvhGLD5F+18d2AiSUDJBV9uudflf3g0y6rvA1SJrJrXNxoWxNpstZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLrMif0UGwQI+RGVPDKk/rtTXelEVd/ce6YJKYw+0D8=;
 b=ALGual8cYiuJlHiC1RjFmg1GWrk9cNHmfO4Fw5nhW9EROHM7jDvDL4JypwEInOJmQjPC9Owb/un9oCl0BhMWawiOO8i9/LLLzJi/BwA+5LZzxcd/CfWUzswz27WhyQzfFCvVAHXVx6y6a6h6Kv7/V34P0bpaKtOlstPYeiE3pMjxivdMkCjZyzIzD/evxdYq6zT7XUvg56KfE31yrXOpQo9Lfbo6hE6GSN4O5BWEiS1I1fmFuoRGJa+uA7GguWonkRAyW6XvBHzJ3+v9De1C5Bc9qOfOLeV+AVBLo3yzJow7RlA8CKvhKMrzP6MtQrAw8foO35DtpIBj0dMUWHko4g==
Received: from SJ0PR13CA0082.namprd13.prod.outlook.com (2603:10b6:a03:2c4::27)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 18:15:17 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::20) by SJ0PR13CA0082.outlook.office365.com
 (2603:10b6:a03:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Thu, 28
 May 2026 18:15:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 18:15:17 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 11:15:02 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 11:15:02 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 11:15:01 -0700
Date: Thu, 28 May 2026 11:14:59 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 04/11] iommu/tegra241-cmdqv: Restore PROD and CONS
 after resume
Message-ID: <ahiGI5nXCeceMngD@Asurada-Nvidia>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-5-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260527221407.1756491-5-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 543ade33-7ac2-4db6-4def-08debce51245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|11063799006|4143699003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 73005ET5xL50vEOMEwmyimicvIxBPg4G5O5fy684ewgt8T5RQRD1wKjvJApClwel/mKNYIXGaEY53fgaS2lCrEutnATpdVw2kijODq4PCw1bOqc+0Qj/IKfyQXJLnuI3rXKhi1roskWctgQC01quVfkLrVPLlqMgpSSKlEH4P3MLavX43HGVhd5xFquGSf4HlOavMHNs+58k6TAsjYUs2Z6IliDvUrpX7TvGGoyNAM84fUwdmXcRkExw/nvt0MmL1UOGX4Ik8DJSMognTfA0KuqlwCMGQgHrTvEaLc2rsHKA1X3AFIvzI/xb0aLZRvAFvhjCDWQzD3pUJdfYtrz1BvjC2Y+TCap06Dm1z6jItsMjIMgkzaEsviofZ8bk+03U3Ws9COU+a0aEtFD0GOlWirk2ZjBKeButeQD00ogQ3gdmPfUqsQpPmltR4unitMa2HLxKWhQCA+sCQnZzlDDXM3/R5GDEBOiWmSXStqJsdRcryZsCHoKEqDMymWhlQGk1bzwkF7NuMbtjSkJq0dc07oN0yNrKzE5TYcnxm7sgvVfmGsIJ/5aJ1Zxi1BR3yTLls971Iifq95O1LZKcW4jlCl1ZisD4ESJOCqept5dWfBtiZCgHX3xRW+gitrugIDacDjpmR3FHvCE2hGDyfrJWX/OSHBjp1cQbS6CHljuXzf4IQPmeSllSqvKsHeviD//4zrvWzAiauwWJ6V0WYnv2DP/aj0eUzlk02NfYj0GqfIk=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(11063799006)(4143699003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ROiZXoNRSmxUu5l1C/RGW5ubOl4CB/UtRUtB4vogvG2ZClTjOA3D1ygMBJXQIswpvSyrdWmfkRKPVjViU2bKct9+3a+OCtdPawf1NhOrTANzP0U0vWIhduxbcfDr+ctlekGalNi/a8fgI53PRh//iYHIyWi6eJisUqvbAhFBIrwSU1xL5fi8xDViYPFTASz3Fr3JUTbkiPW2ZxSZjHFcUmBxSI5cfo4cR2Vx1xug4BOShrne+ySnR/mcdvIncmK4yK7kt4m8YcT/E9Vd/PfZnT7DqB4DYsHlTY2TWROoM8RNxOnuMifcOK9iqc38iJ8DSR2NNxZKa9SdnMAcw20ykKDpWz8YsK1EYNZ1CG2u7pANaWB2jkysKp2iuUL+9VA4wHGIgZQ7YmBR+rylBJ0GdajOtwWx7nnNSowIFHsdMP9uiGhzJyJX3Hv2P4k9+GnQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 18:15:17.2797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 543ade33-7ac2-4db6-4def-08debce51245
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_111527_970056_A462EAEA 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 27, 2026 at 10:14:00PM +0000, Pranjal Shrivastava wrote:
> From: Ashish Mhetre <amhetre@nvidia.com>
> 
> PROD and CONS indices for vcmdqs are getting set to 0 after resume.
> Because of this the vcmdq is not consuming commands after resume.
> Fix this by restoring PROD and CONS indices after resume from
> saved pointers.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

