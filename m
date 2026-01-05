Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8630FC79F87
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z76cfDlTSj/8sXAaYJrvDpk6YedONTKs3xCQtRU8iCM=; b=jBUx1tiwvRlhd3RBjK2Yi05jr0
	WSO9YajjWTQW2kCox6KSYEF0HkTLiz3bRofYdUtWClR45xMsr2sVDsbpqekByk9uNbRmO6V2TPoNb
	Q1UrHjNM62FrVMvH5hbF1ETlbDLXqF9/RsnmlH9R9SFr0VuxJ8S0PvmIhvbgm6PBaFck/4E7H+NUv
	5Xtfj8ETuYLuD8MsDv5JC/IaoTJXsXNyEZ9B2E3jvoKrkO6LYMh61A7w/TzvMGmOffSg/YrCBjP37
	uWgcREEB/m+5U2cesQYbqSvD8dHGUhASfZ3ZUvnm8r/qRCoKIZfOd/nDwpqXjI/cAiW25gC480LbI
	RH6iIcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckSa-0000000BQ9T-3IUp;
	Mon, 05 Jan 2026 13:17:24 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckSX-0000000BQ8a-40Ef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJ5hWHbfcD/GzxaILRfWARY3c025b8vX2IMGHjNAuDb0dtEevQd5RcF9jJw5klzxqIw5nIeGmzGaxIJ0OFgrzSH5M6Pi2OmBJBCsdvjXHvVVye4et0Qn6x+8jJm4Bl8m1jHzPN2FwNMvbFUEHKO14XDEBDoba61Et/8lgSbCibKBVbZ0v5CKUQUr/hSs1fmBEWliLjK4MhQBy5TpnUgyRvKgOwt2kP0aX6N2OSZZTfAqu1EESmfqcXPDJXoXaABW9EbP7flW3TgKYOLnpUA7Ut2rclmCHJbzXmY1fu2jKxmAVF4PkydDU0Prehckyz2pwwZvk/OCskSR/nxr/8Nm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z76cfDlTSj/8sXAaYJrvDpk6YedONTKs3xCQtRU8iCM=;
 b=txIc1hMG/KWGQA1jhQ8lE2GV3B8KN+Ng+R8tUjlNKHuYKLKA8huJYl4LMMx1J38Mc2+9gjSmJ91DV7w3JLvz3wFpDcYMTMvvDJHRZZQcxAUjQ7FTaoUIEgDBwjygaiGOBe/mdZn7B2Wv0GjI3kgYaHt8kTXCh8BpKee3Aj7IM8lBc9diOhNUYe3RUmvk0RjPSPCsfRi/v35/a9rftVjESka+5Vp/015r29CVTO+jplTm76U+1y9fns51u7MhLxH6vVhQMaKIDOgqbCKuXoFSwUGwyg/2lD1n8Q+4P6rKvkgWAjqPZrVJXBzy6qBWeOm7O+gluBSsgFsysAWCbzKzZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z76cfDlTSj/8sXAaYJrvDpk6YedONTKs3xCQtRU8iCM=;
 b=M/GvlDukYumcsO4SIJDOzPrV5f9Zl//A46ZgBM/OHIbp5XAODyp2BjEy+k1duIcVpRgNVzm4Fs1NWDZW7rsvTpuXJJljsMmvfVI3YIoR36TmVZZfVcaZE1+jXhvu8tFY8Vt9gzbj+8Jn0J4L6gvvAXajHwG9ENx7YqV3eRSFzHk=
Received: from SN6PR04CA0105.namprd04.prod.outlook.com (2603:10b6:805:f2::46)
 by SA2PR10MB4729.namprd10.prod.outlook.com (2603:10b6:806:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 13:17:16 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::c8) by SN6PR04CA0105.outlook.office365.com
 (2603:10b6:805:f2::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 13:17:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 13:17:16 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 07:17:15 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 07:17:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 07:17:15 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605DHEVq1319840;
	Mon, 5 Jan 2026 07:17:14 -0600
Date: Mon, 5 Jan 2026 18:47:13 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] arm64: dts: ti: k3-am62: Support Main UART wakeup
Message-ID: <20260105131713.foqfyyga2zjzyjzf@lcpd911>
References: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SA2PR10MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: adea2cef-4982-42bf-50f1-08de4c5cbf25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XEA+qptGzYKB2HJycQSbQ4kQT7C4nJe3uQ4ijDBCwuNg3RnzU59BQa/tINTh?=
 =?us-ascii?Q?AtqWDGiy6TTnJ5W7yEHZMnZ7mkGhg/gG7fIEg+5BfQ7YI6dEfnvDWceWwaJF?=
 =?us-ascii?Q?Cx47L+qkPQIE1NY9lu1Tw2xFx7EOLbZfGvR/U1CX1VmV7ziht8obbueOluB9?=
 =?us-ascii?Q?ea+nQBMZc6aitCoM/+xCwZ88TRRuHPpFmO6lNjYVMW7FW84O0o+lOEz78XpQ?=
 =?us-ascii?Q?SgUtqi5DhYo/gbkG6LV/oO2xOYZVtkMBNseWCyS2xfvraLFMsXSBcmANI8Qc?=
 =?us-ascii?Q?uyMgCbEoI199cS/oqDPBuzIux2dr3c6dDiowK1EOdG8d2ZzsP2hCreFrz1ex?=
 =?us-ascii?Q?ww/cCjKiFTR2sxsNqX8oJIrYgoSVXxNzzy5fvAJhdsYS5Z20YjtSzdmL5BJc?=
 =?us-ascii?Q?iqmMeu1NNhqJRdySTuIY9KCRSeJMCFh3rrYkq0dZ6V3l4xYisjqnhIiA+YQP?=
 =?us-ascii?Q?PxwqyFzH2g7gnnx0A4EmPO7o5ZS+ga5Z9fe2+ZHcpFJUbXzCQJjzQnW1poHC?=
 =?us-ascii?Q?4Ro00Y2p4M70eAdtK3i9VeK4s1R1fffQjPgGilUJpl/TQsOmx83dfYNvNhje?=
 =?us-ascii?Q?A62KVUHg8AdXyNs++oX0xmnvSXIaJP67b4yZ+mKIDW8VLvpOX65LW9Q1YTCs?=
 =?us-ascii?Q?kD4lfm4Fd3gCIGRJYYSrsv9sd2iz2JATFaRq7e2JIlfUMFzqmAohuXmD3T6m?=
 =?us-ascii?Q?crS+vlkx1/fDuW5NQzpf3seJasTdb0HGKFi1L8J1FXSnDf70yFlJnIU48yq7?=
 =?us-ascii?Q?yZMKdEI7eK8CxXxcb0WLsxjMyiZEaHAza3gjSt+Kl3IgB3FlGRhBd4ooY5sz?=
 =?us-ascii?Q?133GtMpWsTyrvtlA8rysbUXhQgeZoK9tr5imy1MdgCPeVTW5aU5PS2kOezj6?=
 =?us-ascii?Q?MVyRsU0GlwtdsIA5Xna3xAF8aPHwcDuYiSlDohRByuz5wB4A/60jEWHl2TMb?=
 =?us-ascii?Q?F8l4118J9bqA3/Xzwn4/Pc7tafMb8XE6d+p/HPQjA+E+i0RRVdAhZ+F5XUJh?=
 =?us-ascii?Q?hMdeQaiDbduZby7qFlEouTwE5D79KFXOltV2BR8LQenBDgOh+8Mm3QAJ/yUc?=
 =?us-ascii?Q?A/k02y5L8b6ZFoNF+LaqHrJzXXLDhxMxrViqTf+LVbuTYg3QSb/F144pyCDC?=
 =?us-ascii?Q?QgJAxNpyET+4Q6BHKNXWWLMkdxRJcsH9chYZV4ppOpaQ1Fmzi/PMQqqYpowf?=
 =?us-ascii?Q?xS5vll9chmiwk18IKUI5Lpqr6yOmXr136UrmJaDFnAJA1K3gUiAd3iwXdKag?=
 =?us-ascii?Q?QKO/svUoasMT2zl+4IJF+O4i1Dw1V5ujg3hCTZ7Y0O2lW8Iz3y908K3V2rg3?=
 =?us-ascii?Q?mSwVsXEUV0RJdeHq42fD/8rFVKb9zEMsIYYppC3prdlEmUPke+aRho0zOS1n?=
 =?us-ascii?Q?N69HR95EcMA587HWrUM5ykNr7+717vPLIHFpfngk8g6vgsuh6NGy7XMP/Ytf?=
 =?us-ascii?Q?qK5aGQJDzlVusC5RRMkZC0sR9B2HzeWRiy1YioMIwb79lW+Nr1F7XsEa8Xgq?=
 =?us-ascii?Q?jueLruW1TJaffScCrNUdPIPGyemUoLlP1vR9uj19vNBz4Q59jMkuZruG6kpA?=
 =?us-ascii?Q?uqI5xqj0wH/zndB3wpg=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 13:17:16.0314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adea2cef-4982-42bf-50f1-08de4c5cbf25
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4729
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_051722_211560_94D385B6 
X-CRM114-Status: GOOD (  17.89  )
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

On Dec 30, 2025 at 20:38:19 -0600, Kendall Willis wrote:
> This series adds wakeup support for the Main UART in the device tree of
> the TI AM62 family of devices. It defines the specific pins and pinctrl
> states needed to wakeup the system from the Main UART via I/O
> daisy-chaining. The wakeup-source property is configured to describe the
> low power modes the system can wakeup from using the Main UART.
> 
> Implementation
> --------------
> This series is intended to be implemented along with the following
> series:
> 
> 1. "pmdomain: ti_sci: handle wakeup constraint for out-of-band wakeup":
>    Skips setting constraints for wakeup sources that have
>    out-of-band wakeup capability.
>    https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/pmdomain
> 
> 2. "serial: 8250: omap: set out-of-band wakeup if wakeup pinctrl exists":
>    Implements out-of-band wakeup from the UARTs for TI K3 SoCs.
>    https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/uart-wakeup
> 
> 3. "arm64: dts: ti: k3-am62: Support Main UART wakeup": (this series)
>    implements the functionality to wakeup the system from the Main UART.
>    https://github.com/kwillis01/linux/tree/b4/uart-daisy-chain-dts
> 
> Testing
> -------
> Tested on a AM62P SK EVM board and a AM62L EVM board with all the above
> mentioned series implemented. Suspend/resume verified with the Main UART
> wakeup source by entering a keypress on the console.
> 
> This github branch has all the necessary patches to test the series
> using v6.19-rc1:
> https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/all
> 
> Revisions
> ---------
> v1->v2:
>  - Define AM62L system idle states
>  - Enable Main UART wakeup for AM62L SoC
>  - Rebase to v6.19-rc3

For the series,
Reviewed-by: Dhruva Gole <d-gole@ti.com>

> 
> v1: https://lore.kernel.org/all/20250904212827.3730314-1-k-willis@ti.com/
> 
> ---
> Kendall Willis (5):
>       arm64: dts: ti: k3-am62l: Define possible system states
>       arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
>       arm64: dts: ti: k3-am62a7-sk: Enable Main UART wakeup
>       arm64: dts: ti: k3-am62p5-sk: Enable Main UART wakeup
>       arm64: dts: ti: k3-am62l3-evm: Enable Main UART wakeup
> 
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts        | 24 ++++++++++++++++++++----
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi           | 12 ++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts       | 22 ++++++++++++++++++----
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 24 ++++++++++++++++++++----
>  arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 ++++++++++++++++++++----
>  5 files changed, 90 insertions(+), 16 deletions(-)
> ---
> base-commit: f323ed34dc9831effb1ee95403bc364869d29d4c
> change-id: 20251230-b4-uart-daisy-chain-dts-d01aa40560b2
> 
> Best regards,
> -- 
> Kendall Willis <k-willis@ti.com>
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

