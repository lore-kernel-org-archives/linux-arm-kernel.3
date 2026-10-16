Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF196CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0Mp+FT2y1w5C2fg2cvV9czSHeE6CvbZI3w2HRIlyUM=; b=zNQhTbfO1Kv4BjqD+YOQHmrkov
	acMTq9zL5lOy50QVcMnWDdzqTzhGAmlke12PJAUoSg8XQRzZtmd8ICReq5Bolb5/CooGPhk9Uknx2
	cYbN8ugMSfrkJEiN8+qWL6EFGv0nS88lBvQvBafCj0r+vnPZG99m/4MpN6CE1WZW54/GKtoxpWICF
	hQqEghnFt+c3HpPuVpJKwwui4UzCBH2y6RJDd1k1QWqJdez7y8nOvR+uLvLZhO/Hs+Ez2m+xckYdM
	Tik3pHcexUOfJKR43XW6uxHENorFFGgxOLfc0RrxIsGkzjauy5rrj+TPEOu48wDig+Tn4Gavmggmb
	+gzs49bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYYh-00000001qkX-3JzZ;
	Fri, 16 Oct 2026 03:24:39 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYYf-00000001qkA-0I7S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:24:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sa4j5FltquGwrH+HJbjEQRvvthFZxVwjk/kfvNVI9K7NQGvOhkfeBlGsNiajVGL/nRszEgK/x0/i4XGRDroVSDJ24H7Z+UNtRYshtIwgPwdQ+u2g6EPqIPASeYJvxoCJl5MmFWS9jM6tTpruwXngm/6Xqr7pXuwiIYVaKgQa63CRgyTZJNaWge5znW5HAZ1cE/4YVOze8fwo90MI33nsGOJqzxoDdm9Sufz7WK4Mg6vvVhvgkGSVWRZqlI8y8w9oMPe+qnKUXRy3kt0EuPws6mNljYKjPtq1vEHwM0kca7BQQQifqppk54VUSuQhGeGDcvQxwokFH89mZMk77M2j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0Mp+FT2y1w5C2fg2cvV9czSHeE6CvbZI3w2HRIlyUM=;
 b=vNBpKyW+qCqBCqScMrMd4ZYV5dr407cG0DEjk5d7HeestRWPGn5tN8/GoWA6Fo94odteOl6Qw7z7fYm3k+AdJwzUdR680TxZKStdGKlh+JDEjsApXmd7wcDkSkYu5vG0rAAwo85iqH5flujmu+stVySeo1YMHXeubxEa4djHsL3QKzDYNwObdd1Pa9JhwaAj24GaA3xLvQZjnB/D8zjB+LH9pHv45YXkUB6bPlvWjzEh+vw9TZxEuYrM4qvGe5dIEKIP83kyyXHiMUEucZfJ6UbZ+J/MR1eXJIs7XpnzU1XHkXJkGEmm/X/fpWVUuTn4eG75C9AqJwt4wCfRJpxAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR06CA0008.apcprd06.prod.outlook.com (2603:1096:990:77::27)
 by TYNPR06MB8452.apcprd06.prod.outlook.com (2603:1096:405:3b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 03:24:26 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:990:77:cafe::13) by JH0PR06CA0008.outlook.office365.com
 (2603:1096:990:77::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri,
 16 Oct 2026 03:24:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 03:24:25 +0000
Received: from JohnnyFan (unknown [172.21.64.24])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9604C42C6441;
	Fri, 16 Oct 2026 11:24:24 +0800 (CST)
Date: Fri, 16 Oct 2026 11:24:23 +0800
From: Johnny Fan <johnny.fan@cixtech.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	james.clark@linaro.org, jeremy.linton@arm.com,
	cix-kernel-upstream@cixtech.com, bob.zhang@cixtech.com,
	jie.fu@cixtech.com, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH] perf: arm_spe: Support heterogeneous ACPI systems
Message-ID: <atGY5+kzQggCZboX@JohnnyFan>
References: <20261015062908.3565761-1-johnny.fan@cixtech.com>
 <86mrsf1bnv.wl-maz@kernel.org>
 <20261015141926.GC26205@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015141926.GC26205@e132581.arm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYNPR06MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 5281a5df-c820-4092-1d64-08df2b34fac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|4143699003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: A8rze1UTN9RXIAH1b2zgozfkkpgDPuMA82zfeDAqYxepQDyG7hMi2q8pOonovqdAwrcizrRmplcPSeCH+J1+wVpSCV2JmlOW2l+sEcaMVkFDowkTv9MbTp/PcasZ+dk9za5dhNtoAiYKnTo0tZ5t4zJuHtC5/2DNOhKTlPTN4qFFYIiiuXKPTGAj93MBfuFeY++VjZT0I5OmcDIPulexg1NvsCFEQToJh3dc9E+Aqg+oavuyLaRQTwWwflH1ES6msupZaFyhEV8yyY5RwFiQgcD2YN0WlHgSrE85+bhv6OI3cUPJwe6BPvMe8jjHc77V91YFfrrMxTA68xEo1nz46JvhpqtdaS/Sk2u8dyBkO3qoPHn3QBgECj0rMD+mjR6J/hC0anWUO0AET8jvbaMn7zU8P5fyX+ZKRkdrAVtz3MFi9szq+Pz0txRK9ttHJbrg6THZ5DcxnPYtRIsFkI1g/q8Fl34Zum2UGNH73uNy0D1Zw1b30FSvpRx+zMWDiZtwCK5jmQtcZ5J6kqKnAwNtjTZc83ZAI3nCIqgqDgEUH9g41R51IHP+h/6hc+b/Zdujh3J8Uk0NtYl1fkQmgZSuP+mwl2OTVEVplBYaqO3YL+ZRihm+Dg+a2m1bBIj+vzZNlDwa2+1zYBUV3/9ARH+dQBi1qNGFkWM6q/68SKTIv/X2I4fYTHUK0IzU+BAtnZmR
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(4143699003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rJYUZ3idnNMj/tdlf8TF85dZusqIeAaRFtUIF5X7feIrn+80s3XIcdf0/AD/90pbIDkY/rzqI9ZmEtecRjhoKe0/NWUxh954lNJsb8IF/H7EMd10MJ6L6hjCxCT981mjINss8d43wGiOmXfVQ7SVrItNxf9DG0i/62Z22YvCY46J8Ir5eTPwFN8QgbAvtpBiuBsU0NO8JGcIQaMTZCGfzREymxG5V78J9IEzcUaBwL+L9s53Xp85JMKNddaCloKqUqImtM6Jc9auK9Ob/wU3UOuHE0vxXLom3bLn03DPtYu4/LoEi3X/wVU5enmI22F4m9ae8N1WTk0vzu2B5prcUiQ5a4dm1JLNVfREwKdcbG8wTrA37O+2gajXbTJJGbLGoQ5zdhm6MmWIECzvM3/d8W6bpNg2BjVrPgqYtceXeQ1LEENpMnIC0HKIw3IBhHGw
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 03:24:25.3806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5281a5df-c820-4092-1d64-08df2b34fac8
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_202437_131812_641FD9A3 
X-CRM114-Status: GOOD (  13.64  )
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

On Thu, Oct 15, 2026 at 03:19:26PM +0100, Leo Yan wrote:
> The SPE driver probes its capabilities on one CPU selected by
> smp_call_function_any(), then performs local setup on every CPU in
> supported_cpus. It therefore relies on that mask being accurate;
> including a CPU without SPE could lead to accesses to unimplemented
> SPE system registers.

Right. On ACPI the driver gets no affinity information for this
device, so supported_cpus falls back to cpu_possible_mask. That only
works today because registration is limited to homogeneous systems.
The PMSVer trimming in this patch works around the heterogeneous case;
with the mask taken from the MADT walk, both go away.

> There is also a grouping question for SPE and TRBE. If all participating
> CPUs implement the feature, but have different capabilities, should ACPI
> registration create separate platform devices for the compatible CPU
> groups? DT can describe separate CPU subsets using PPI partitions [1].
> 

That ACPI cannot describe: the GICC only carries a per-CPU interrupt
number, so CPUs with different capabilities reporting the same GSI
cannot be told apart, short of probing PMSVer. Such a split would have
to come from hardware wiring each group to a distinct PPI. For now I'd
keep it to a single GSI, and leave grouping to be revisited if hardware
that needs it ever shows up.

Thanks,
Johnny

