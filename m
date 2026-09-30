Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E3CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1fXreIrfN8siXyfkpyX4T38TTZRf8uBsvEgxKyiuEk=; b=c8o4+qwfSf5rdPsO/jhGQZAc2G
	W0Lbf2co+brlSFr2ymdfyZaPmhMRY4rxw38U8Hi9j+BzACtsVD+7USK3bh2P2mEmEF+5WIH6yoGUP
	vvvMUV+84vA2eVCZNmeamvvTw9pg6HNXeaFiHiXR4Ygl6PWYQTW+EK0yZwrsu+mKNHoKytT+WMHD+
	uv6MCpTFYRLC2gO+vFhZgYCcwKIA5xqLa8SDgomHgJUnmKbXdGYcGko09OcN8oLexKpXvf5LMJCcm
	hwJc7fpOLWZBOuz1q8MAihhEiQAUEL+La02BiNnOZ4SxqJWTYKktBBPzUoqFHvD+GV6Sv8gWzETZH
	ZNtNFvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0XD-000000078aK-33mT;
	Wed, 30 Sep 2026 20:04:12 +0000
Received: from mail-southcentralusazon11013044.outbound.protection.outlook.com ([40.93.196.44] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0XA-000000078ZM-47Gv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/BwawnNeNMEgEggYT/Cx2J2N3mRCoGbr9AP6nVPUC3bLckBsTaWzUE2hnBiE79izV/asb5yLW7k1zC7hYVBOsQ1ncdcA9ZDmltr5znwh0oQQg/jrABQcCjojAC96tw0X2G/2B802t4yBIJC28MLnooyr3ndpeFvXamndxm/FJl6s/V6gJcXp09EyDFcWHerSEB4Fh+hkb2WK+oJk1OiiBe4UP9LhMD3XGxYLmggQ0VQ7G1Nn/NvOyPfWWIVz0Rd9Gu1cu0DJL0FKafTJ5DC1dclO6bv6/M0qpNtbRgs8uzJGNAspbMUVIdYGGp9Ag2Lwv0p8GQTOigOhObOTI1hbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1fXreIrfN8siXyfkpyX4T38TTZRf8uBsvEgxKyiuEk=;
 b=dVfBKGdz07pX0p2jyQ1o9WJ4i+f3kKtzePVm9ip02iJyeJ+oBoWwCL8AEY+pO66GmF3WDsiVsvn4Z0HHnfyELsPlbMpImCagSfudzYDIwtCL00q1Jmqx01yopwCiUnWzHT0hy5q0nPFPYg8jSnp+SMXCxUz5NllXDMJODsT9jn26aBezMOLKhaNmIJtlJKr9MO2objtCWt1+ONG1PNSVWVQDkBPUk4D8yDbSO8cP3kp+JRX9fuiQu92PVBP3XwyTuKBJtODMHLRMHyva/qWAW/KtH/H3Jo5V2VXzdkapK4CKN6xB1gDC+d0PRcaii7CtwFOjU8efYjJ64QIrTybJrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1fXreIrfN8siXyfkpyX4T38TTZRf8uBsvEgxKyiuEk=;
 b=GfhqWhI0HIJ9iqS0a4lOSOn6tL2tiFQkULlMJBsEgbD3H/5J3tVa8kb1UAADxsoWeCBsKuyArGIAl6bZD9nOKnmlZoWmHkNebS57sPshjX+U2AmnghnO9OEY7+QFEFl/wJMnHx47PiSTMZYZIEJqkDan/iz9w3AGM0TlQXkbINvncVpsOIAyxmtt4wDyF8loZeL4Xy1n4JD46qMWp4ijuczyH7i3Ajzcd1glDRtuPht4Ce96D5a7D50XkdX4jKwuX2XxBDG467Zt8mYrzlZj5V8bTiLK181zS3mJfOkGNie5GR1yG6OM4699Pa0YnM0nQOPeKIr++isx1SJ4B5QzMQ==
Received: from MN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:208:530::7)
 by SA1PR12MB9515.namprd12.prod.outlook.com (2603:10b6:806:45a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 20:04:02 +0000
Received: from BN3PEPF00022BCC.namprd03.prod.outlook.com
 (2603:10b6:208:530:cafe::62) by MN0PR02CA0026.outlook.office365.com
 (2603:10b6:208:530::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 20:04:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF00022BCC.mail.protection.outlook.com (10.167.248.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 20:04:00 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 13:03:27 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 13:03:27 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 13:03:25 -0700
Date: Wed, 30 Sep 2026 13:03:23 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <rafael@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, <driver-core@lists.linux.dev>
Subject: Re: [PATCH v11 12/16] iommu/tegra241-cmdqv: Add a helper to quiesce
 VCMDQs
Message-ID: <ar1rCw5k+tvlsJXV@nvidia.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-13-praan@google.com>
 <ar1cxFvuzIc2dpmi@nvidia.com>
 <ar1pmNRMKDDJCIkz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ar1pmNRMKDDJCIkz@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCC:EE_|SA1PR12MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa70a6c-6335-4843-fbde-08df1f2df82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|7416014|23010399003|1800799024|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: vubHjt2ZMqn28fguWpHff8RscAsg4RxGrFmUt/7PQCs9HKtoY2kUgQnlt/znp8R+Yruv2iAQ8v5PIXKBmFGqMvnIYnJVbU1ndBSNB9JiVFahKCNp0ckG/Cc+wobnCNVrmV4N6BnfKZ5JIwdN8IxIbOZOUJ4SmBt37RoaXgZKETeo0T6JSWeQ3c40cTzG+BLwK4tteiOEFw3+o6xIxGmjvrzsSyzQWMaDnXlxg9V5MzjEFWwSkt8ALtdrRnEJLYuJJrBK78zvndxk8nzdHEOQJa85iaSF71Gww7OzgXjJhf2ZVQGuySv8yuQcLC0KQ9BU1DhrVE0WRxdOnL/fVlnVB/a1K0y2mDU3FeQXYYDTYEXZmI9oZy3IdqH4HDShs/9rSBCV1/Ul8vMHjKeapGn77ivUXYtXeAdC/TxYmidkRzBr1xEV52m3tKwzwmtIzPV0XWWsy5sBa+iwNU4jWkjJp69hZAoA298ZiH1lojHE0ce6JOuPZhHM26rJiSW1PAxH7BE/QGEa83w00vrBgCv9mqLugFCXRlxrpxuZGJeTY8slynwbTPaG4RLpNzjzUvClmYygbM2DzOsTBXdjoA4LLw4cmZOwakXC0EzjovL8DGo+yVO9LDc/IUcYc6qsm6rdJHKp1HmPrLCrDTyvJs1XSxpQS6a1NDi2IlTEgvmj/Jt8k/sh+3qXFKpogR8c655jwLIOF4Q3geOEhiV0+YxA6g==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(7416014)(23010399003)(1800799024)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TBXQaHaBS/RnquBLYm/Sb9Lvj5DYwBpR4k1nVHr8OdF6EQorX/Swd/8n7EH4ngo6BdgtXIho3v+KQ8ofoYKq0pbwxJ+jRCgMssLhdbA6vpVnEi01xQ0TJ9gr03uLK+bGO810o8G66ofPWFLc+lc6TCryJVF27yO5SyFBQJ4LSFz2Uc//mTr2r6kNd2RwYL+2CA0pEFEHXQrYS4ShME7MRQ5x6Bt9IYHNoz03r552SHqP7CKvoSLQyi+xQxeHlVxVumKV+5CMyx3fLlZwnCm/23iij1/5EuqeScC8Ml+P0ektVAMpdZeUSCWxUsj7SXV15dFX+O4idi3qkX1R2A9OK0zq2FqsIHO/VP2ygRPZPiNky8q3nTpdotCH+LR7P6pO+hmA16d6R/MIrh1oqjp2gAtcsePo02ZHKTBDmNZgpdWEsftnQzOxiDhrFwxtbDYw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:04:00.5393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa70a6c-6335-4843-fbde-08df1f2df82a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BCC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9515
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_130409_024133_4646A8CC 
X-CRM114-Status: GOOD (  11.19  )
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

On Wed, Sep 30, 2026 at 07:57:12PM +0000, Pranjal Shrivastava wrote:
> I'm planning to add an impl->suspend op now.. that will cover this, and
> also the late breaking IRQ changes you're referring to in the other
> thread. Roughly:
>  - set STOP_FLAG on all lvcmdqs
>  - wait for owners & drain all lvcmdqs
>  - handle any pending CMDQV errors
>  - tegra241_vintf_hw_deinit(vintf0)
> 
> I'll call it from arm_smmu_runtime_suspend() before gating the main
> CMDQ, so the CMD_SYNC in tegra241_vcmdq_hw_flush_timeout() still goes
> through and any late cmd simply falls back to smmu->cmdq.

That sounds good to me.

Nicolin

