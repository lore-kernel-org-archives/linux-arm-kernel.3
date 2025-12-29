Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3A1D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 01:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSddCpnfXF4GAtS3Ir2QJHZMXSwYQJKu0YOU1dNIGoI=; b=drmKpeyalkG+/zEZa+AMaCzIzQ
	tuAycs708D1wco9VqtJHvt7yqwi3WSgzLCcv8vebVoybL3w32gynutj0zBgVupApfskPdDr1G2nUI
	+g+ZpmQo+lTf3fk0j5A7bBFgpK/RC4Q8WWbXGGyj1U1Rqh3ayB5Y1eq4aaF2NNqvRVI2Qr5Y/l7KF
	YFsSGtrHwin7W4GlxMo/HVYIE9nJpqYCCLyXsGIyEOIj+Dd2EI/KFQJeH2uWy8wcy7y6Jh0JL4fzf
	bfgheaFutbQkHLUfakctkHt04ij5X6ZesODNildLLgDr2AzeIM91sXSmlNwAanoquwyJIrtbDLvIE
	J3stTwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2FT-00000003CTp-12nF;
	Mon, 29 Dec 2025 01:40:39 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2FR-00000003CTI-1cz5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 01:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOQEnkKGhq863jAMMPGdudKfPvHd8niB0CqD/AUH4sC0qnsFtvtfTdrCrjK9Z47eM6iJ4ygowgaRDC6Y/ziYzWnBe0sxBsFc+D423PPJM5Ix4AN9QLxgD/T2G8Jvb5SkEcq4oWEOj8xET1biLMtDcFSy+R3Osh/4Tf/12yR8n9BiQWa28hLSyIkBxWwfHFXASggWfrjFYoXvRk1vXCiW0a1EhldfUPrXgech5uORKe4CEFLe3wRI8cd6Vo/vD31BRsXOEnzNCRic9A+bvH6bwkByLgJ+nHshNIfEXH5yQ+1ps6hmVwZL3agAu4Hj6kxwbrIOLL+n+Epj42hiE3jW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSddCpnfXF4GAtS3Ir2QJHZMXSwYQJKu0YOU1dNIGoI=;
 b=ipPS7CbRgFXkgIzYC8MjLsNIgvfZoyoAQyZbKJ3wir15KxdtO1c03/XMdZ7PlP98XE6WXQ8FyGFXkPg/bCYom219ZRmmC1WGVG9fJohemJJNo8WIDYcwwivZlibygG2ooK+5UC/RMM9Vn9srL4V+LX/CVU/8+Xmhx8ZAY/OtL6+fwocOHkhX3OMosdZ3CLhBEvM+DUF/cmFnp6fPvuFqCNAVXjecGh6HVVPrJh3X2Hh+jDa8I5VPSyPR8OS9IK/nIqOhg354FQmxDYmxwdDogFz1XVdMMDnPS1/4C4UzCgLIiGowp1tE5wFJQ6YqC0E57ch+348+ABV2HTDJjXMz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::25) by OS8PR06MB7321.apcprd06.prod.outlook.com
 (2603:1096:604:289::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 01:40:18 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:300:58:cafe::28) by PS2PR01CA0037.outlook.office365.com
 (2603:1096:300:58::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 01:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 01:40:17 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D9F5440A5BFE;
	Mon, 29 Dec 2025 09:40:16 +0800 (CST)
Date: Mon, 29 Dec 2025 09:40:10 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: cix: Use lowercase hex
Message-ID: <aVHb-kbi2QbChxj9@nchen-desktop>
References: <20251223152424.155253-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223152424.155253-2-krzysztof.kozlowski@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|OS8PR06MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bba2f0-e3f1-4d42-d90d-08de467b38dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?izyqfHxl/FWmQXaRQ2ei6VqtVkguVvl844Iw/7RDrJ64R5ioQm8dL+IBt6ns?=
 =?us-ascii?Q?+xAaBR1+L2w6ufKz3XzxcZ20DgvYJ0S7F9/ejZHn6LeL8vkmzPVnDN3zjCHE?=
 =?us-ascii?Q?WTPhRHfXZxTMAGwIvF4ONFOU940erh2eQibQj8OX+7y5f+uEaO0UR4t9cmIz?=
 =?us-ascii?Q?OtB4ztl6NU+MBCUtSl00RRDpNNK5jiKykB8oBlNIl8bvxFrUVwGAy8TyzfWS?=
 =?us-ascii?Q?FVylJgBn29wKghsVN7GfrMFP/Bd7xz/hut6UJTe/IhgISA5RktDa98Zl3MPt?=
 =?us-ascii?Q?Y21ewgO0ZwvL1lPe73WFyT/oj9nWXnVv3Gwi2NWLTNYiT0bIrKo8k96kO7K4?=
 =?us-ascii?Q?fIAI1AbWtK0SwA1OlnyfdDE4g0iBGzoe2wP5A4Jki+9U5ZKTH5TfSvcCMnop?=
 =?us-ascii?Q?5mhNMV0QS4Lh3TbXF9K44sXa2S6Txb5OiUx17ZPWkCAJmqnW+IrBOPiFJiWH?=
 =?us-ascii?Q?RDKkT75uwLruNYJhyEL+iGYtxkRPrl7AX72c7hmdxZUIvhEwI3eOTPMxPMKl?=
 =?us-ascii?Q?mNab//9I1DzwBQZ2GMyBmMuREroB/SSZO+rEllkwgEykSBUa0VcFarup8eyx?=
 =?us-ascii?Q?J+wWvYsPsmKL8e+er1v3dj17fQxRfDbFqKdO8Knok+a45QymxgDSlbLcQH/C?=
 =?us-ascii?Q?9mFte9rjSKYi0CeaVuTwWC04u8A8rYcmLGGudkUEgyu5/XEeqVSd3BYzpfx4?=
 =?us-ascii?Q?TGtUxrsw1ngUmBbyZ1NaS4YALNiFS34GmnlOpvNZ4HZirxIPYEdTvexMJ/Dt?=
 =?us-ascii?Q?tLQZlSsKeL6hC3F+fvYooyCQVuxECUErur3vqznhE90DcestuvLEC2UBIrdL?=
 =?us-ascii?Q?9qsn0caSi8e9lvSz75YL9oK3fqcjHS9NmI+x9R6StPVBCfwj7bwjI++3nwH4?=
 =?us-ascii?Q?Zqr6dZRjDwayb5DHtDWZgW6Vci0L1gz7BrOE1pxgPeSbDzoPRsXy+z0hbL99?=
 =?us-ascii?Q?HE9B16d0eI4hR/AR7pKDaJcZZchOJcpFAwZJzvrYWirzm67K5yB9+p15F/a9?=
 =?us-ascii?Q?DFrFLtdXXZY8dcG2pax1gRvUNMUB0bHtosLZxdxg+XuQggYKVkVGVR19UQC1?=
 =?us-ascii?Q?qu7W05Lx9jTlKnD+LzFmq1nGKmoBfMEJLx3vYyhSqQuGTAInIPG6gi5GM1W0?=
 =?us-ascii?Q?bGhhpKxVYJMRud9c6aBbZDEI7dvCuxudjS3Rv7FVh+hao4IEsaA56p+AdJj6?=
 =?us-ascii?Q?rAGafXiubq8xAttfzBEjJHk85b/Fwu4+Tryqa2GCGAp+xadqDGV8M5iMIxge?=
 =?us-ascii?Q?yNWeqIVxewGAX6HKipViPknXCpao0i3UcL8W5mePWQNDfTFz1uUBixE3TmLL?=
 =?us-ascii?Q?Qe+O6o5Bja5GoZzJGUSiFWNgDqx+l+7c8YkjFYNfqK59YGjns9u7MHQ/apg6?=
 =?us-ascii?Q?58p+1HBltFKXlp9VfXtN+WO4GgWOW556G0B5gSVaf70OTZ6nBuLrBSMPMg6X?=
 =?us-ascii?Q?t6oApxSJSeU0208yjEFpFym4EsGxLh8rqdlLLwCAvhP9U6OiJLAsFA5RMaLb?=
 =?us-ascii?Q?yfQkLD+s8Cd8LUr/y16LLK0GzAwiBBeOL8xIqVwAnI8Kx3ukwoo3nQb1pDa0?=
 =?us-ascii?Q?IXE+ifUnHW7c0IAV578=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 01:40:17.8183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bba2f0-e3f1-4d42-d90d-08de467b38dc
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR06MB7321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_174037_435171_8B9EB77B 
X-CRM114-Status: GOOD (  15.00  )
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

On 25-12-23 16:24:25, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> The DTS code coding style expects lowercase hex for values and unit
> addresses.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Patches done with sed, verified with comparing unflattened DTB and
> dtx_diff.
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 64b76905cbff..fb8c826bbc97 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -523,7 +523,7 @@ pcie_x1_1_rc: pcie@a0e0000 {
>                         reg-names = "reg", "cfg", "rcsu_strap", "rcsu_status", "msg";
>                         ranges = <0x01000000 0x0 0x38100000 0x0 0x38100000 0x0 0x00100000>,
>                                  <0x02000000 0x0 0x38200000 0x0 0x38200000 0x0 0x07e00000>,
> -                                <0x43000000 0x0C 0x00000000 0x0C 0x00000000 0x04 0x00000000>;
> +                                <0x43000000 0x0c 0x00000000 0x0c 0x00000000 0x04 0x00000000>;

Sorry, I could not apply for v6.19-rc1, could you?

-- 

Best regards,
Peter

