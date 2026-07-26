Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CF8C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFUfKVcWOcUWmCKlgCAV8U97HptbtlCZKYXRFc9G/HM=; b=olLwwZZzHYNxRqJC/EVaiQEs0e
	tO28hkklInslhY7aSXODtH8dQReh0Uim1Klg+hmlvK6NrU2ZUh0+eDpMKcAha5BYkH3CVbNwgAAss
	UXkRKYly0v2ENw1+L7/BRw5Nkr4qgdmKwQcA4s/IMvwPBDa4FhffeG4CjbGwp+maeB02FpK3/Zb80
	PZa0i7c8rVF06tkNqPlub3l1Chb5eKZgMPLI1IchNjMxs1TppR59geJ7wdcQEL5y8Y39vrQzpP3HB
	2pkt8oIilrGklLIuKo8RTLwaQCpYIbEss/GnHYnb4JL1tYRpkNqljPlOdAItvId1sCsVlvSNB6aib
	Ub+noJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2Wg-00000001QBE-3xDZ;
	Sun, 26 Jul 2026 17:20:34 +0000
Received: from mail-eastus2azon11010007.outbound.protection.outlook.com ([52.101.56.7] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2WZ-00000001QAS-3pfY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 17:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjITlDo8nr5x5h39ap58YsduDqFBP00TbmFQF3go1DCKKqd62MAEBgJ6koC3Q4W0JFCo+2gcWxUxxNGqN5v0d60uH9TGcC3OPiIBh6KXNMCUd9xd0z2ajdUC+mKkK7xwJJSfTkYUBbHy0bO8NHqBz2Sy2VYh7sCIQZJBDtCH3+WxGIp4/SoId2XQhke714pqFKgBoi1vLPeZoOWdIx8E/kz6+/aTBuKMo6+CWpPpx51HiES7GyBNOxeiN0vnqilBPeWn+284puVhaaaMOFRViFXS/haDTzp5+pJpC2jYa3EwAgY/UEOxQac6jOFkrcyWCKf7YcL5ezMz9c5BV1y+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFUfKVcWOcUWmCKlgCAV8U97HptbtlCZKYXRFc9G/HM=;
 b=x+p0FTApt6GmRVbkasVpKolQmUT8dbwTzDpzoGER+tPEm15rbpZpUNPV1DpFV7bxo338T9yhcWuycV1l1hXr77YnpI65aUQV94p6wuJ8dqrgnOrwXIumfZEozRexKhSdiMf7+Hkw+XvbHjdISpwkTFWraOpETuh3JaB3/3/VEd+IHY3OlX8eNtQyupdTwbrS3HR6ibsN+1Ov8DXC07RUF0vIwAU/KDIZXxbcCC3kmYZm+1igT60z05mdT/VBXawK7/3PTZjb55TMk2yMsD7Z//OOyZgi6DmGeiOkeJnNZQOhrAdZNYlJGGIlm+gEGwbukeKoVOq5mHKHqREEFS9xxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFUfKVcWOcUWmCKlgCAV8U97HptbtlCZKYXRFc9G/HM=;
 b=KYiU+NW6Gw12+syaj1GDyQSzHNZDZN9dJzJZ1dg/kSOv9lPEZKsaBYE9Iv2uHuVtaHo7G9sNVHaialI3lrHt9V+AMdsGyERl3XuQBdhx5HNUmSZHQ+NVBXCXkkAQ2O8z+t0crOg9EiYZQR42MX9CqnNHTI7OfbJrZINPMjZ50E44wBLYphOad3rc89LriBokhOkR599ifzyLCEHu8BmoNvSr2alqoyBH6LzPgduXrM8wZgdXhW+bbUDYo0VvKrK8hvrx3dnTuDfX6ft4qt6am7jlNi5VNXfXDGd3PxIuWVUBWNBsoX4ggoMdJFOcDUazGy7fOLrmpCEupscdBijX8w==
Received: from SA0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:806:130::28)
 by IA0PPFACF832414.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bdf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Sun, 26 Jul
 2026 17:20:21 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::95) by SA0PR13CA0023.outlook.office365.com
 (2603:10b6:806:130::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.9 via Frontend Transport; Sun, 26
 Jul 2026 17:20:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Sun, 26 Jul 2026 17:20:20 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Jul
 2026 10:20:12 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 26 Jul 2026 10:20:12 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 26 Jul 2026 10:20:11 -0700
Date: Sun, 26 Jul 2026 10:20:10 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Ashish Mhetre <amhetre@nvidia.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<iommu@lists.linux.dev>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v9 4/4] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat
 workaround on Tegra264
Message-ID: <amZByocd+B+fMk/L@nvidia.com>
References: <20260726081904.1408859-1-amhetre@nvidia.com>
 <20260726081904.1408859-5-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260726081904.1408859-5-amhetre@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|IA0PPFACF832414:EE_
X-MS-Office365-Filtering-Correlation-Id: 70efa891-e236-4595-864e-08deeb3a2bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|82310400026|36860700016|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2PNIul2y/MXQMJLmGZOfBT4OXj9aGhlH+B3rMvVF/ujMsh7yXfRy1T/n7+VAUJzOfVVY+xl25HRU6rmRe4w0S4bm17jllpEWIkryexvackLZnpvBmEbZwYNi4BuznxyHO4cXqQKvqpCY8M4g13lbBKMtbwbHZchfBdN63GmMBLc90ZbiAlBzBEzeKSIAsjq6/c8rkY7YT7N0f+Bg517Z7Rph6wOisi+0E6uDWq6H0Hrpm53EpvaEccbCEWXWBwp89il6yrNwWQNTuapnI2fR2SkzqQPjZF9Qt1VOXegSjZY5ohQpATWNBz4mJLQ48NcOmkprxzYOED1zzUkms/01i5NAWW5aBEQl+6UP1tDlQ9Xm4w80DI5k0Z5MXxlQ5yu5WSEprMeH8ZQT+9iI0Chkqw3564CS0ZVwAx6cdKktkwwHFWwW/8LPebjhKUBAo7mBOQ/+rmdMij5cJoai9Mk+Ok2mk9d05ANTZbxodx2/c/3GMkKUEoXufnAfgJjuWd4HLAnI+Ywo+XRP8ow+KFUALsCOY3IoOAz0bb9npvCztkBZbKw+ij6Ioob9XKmU7MKVWOh5sKEeCj/ohLt19Ekd/orwqNarsrWlXuDEZIyCKHVAyycVgS+4pke0ZxzVAvnwsgM1EL/ZK2nEb78jh05tqzupbn5qZ66S4OcOPVxgYRvhOHQeDvFvmSOjgsRlTDqLtFucoi2oFY9lR6+UkbV49g==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(82310400026)(36860700016)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QUZZWSOrP8hzZOfzrtwRm8GA1ePyQ9NBzXWAVGqY3XsOFG1JMLMebHhDqmrJ5GPeTe9nbkY07mNl+2i4BLUuSHbIol9Uri2bQBaI5LXl+td/3tyFVLxr+GG1KS5MpNactIoi02a0F7t3jx35pa+1WsfcrVQELfk3TvG2coF2oKLuCoMO8FphoATq/Mj1YrTlBzeGmGDmaDvOKOw9rXqApb/E3id4lY/n2Oi++SVb7a+3SJyQ4VgDAg56GQHXFdH5MZuSxaegQzEbohW5dsUOZr39OMrn7fZQTpi/ZZC+KrJLCDwXhjdjH+xmDgwO6cdjMjseefyXSjyehD/ESULIqOZ1lcYQTfMTJvhnZxVff54tXn8yB5hoa7omN7caWcSJOwENpJ1WGV2skQHQEZk+8Z3Jl5UVHgHn5VO7KHuWsKKXd/nB3w1ZGyEwCp8IyDgy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 17:20:20.8159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70efa891-e236-4595-864e-08deeb3a2bda
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFACF832414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_102027_957539_1913F156 
X-CRM114-Status: GOOD (  11.99  )
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

On Sun, Jul 26, 2026 at 08:19:04AM +0000, Ashish Mhetre wrote:
> Nvidia Tegra264 SMMU is affected by an erratum where a TLB entry can
> survive an invalidation that races with concurrent traffic targeting
> the same entry. The hardware-recommended software workaround is to
> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice, and
> that infrastructure is already in place behind
> arm_smmu_erratum_repeat_tlbi_cfgi_key.
> 
> Neither IDR nor IIDR flags this Tegra264-specific bug, so hardware
> detection is not possible. Tegra264 is device-tree-only (no ACPI/IORT
> support) and already has a dedicated "nvidia,tegra264-smmu" compatible,
> so DT-probe is the only viable detection path.
> 
> Enable the workaround on instances matching the existing
> "nvidia,tegra264-smmu" compatible by calling static_branch_enable() on
> arm_smmu_erratum_repeat_tlbi_cfgi_key. Document the erratum in
> Documentation/arch/arm64/silicon-errata.rst.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

