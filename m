Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2477CF34C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhUEAo5rQfJbLlsbXat4WcAJ0vqDg2PEckaSW0bIwf8=; b=0MLM9YmNHZSoyYbQYEs0gM57J8
	mxvxzXMRnNxeVQA09aMVi0btrhtWluxrVMfdnDPe/p1LUzueeybrrvaEsA+STIZvRhbLc5EqjJ8eR
	7Hdzx3wRR11ZX3ahwUXIGDpn1ugh0n7ox/GrS3nSmH2SYSpDEtWR7MAqdarLGq3qq7eQNSjjusgJK
	7gCAnjUsRnyrnqXESIuXE/a7jm9shEtAVTdErvQ+fGPV3WdX/02I+6tHC9ofYHGL0g4OQS9Scfrzi
	46rB9GjUulZMnDHX9zCXuN+W2zZBz2McLcH/XqQ8M80dM9t1PyhVBHc9q4Nsl/r38UnSYzqzT828M
	N4HB8uXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjSL-00000003PCk-1lU1;
	Wed, 19 Nov 2025 14:46:49 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjSI-00000003PBY-1COh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:46:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzN9tHYWZ16lgOkP++OH3s6LGSEnN+TaBc8FP6cbnizYQkO3uvE9fCqyls/LM5UK9QxX2CeHTJZEXQaYx6hKCIFjJ/tw0Yo+ot8HlnwLhBFCWD4W46CWikeIcGDRjUnZzNdq+bOTdJ+Ug0vJNLIpHLCEmTl9uWTekQyEN06BldmrF1y/kEeQ26IBSZu9Ez+qQ/NfpCK2ntCErxYxuKT+ycHyXg9OI0/Zk6eJMhAe6MG0loQO7JqPg5tmgJ1w9OhHNjaqIf29ZtrJM/zyAq+0aHv6xdSD4ZZVTN8uc8jVtNH0XB8YFiGY0sbVMyEEpQ8IEsMEVkouqL0SeLnJfPo3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhUEAo5rQfJbLlsbXat4WcAJ0vqDg2PEckaSW0bIwf8=;
 b=KeBTZsofN8Q3LAasV+TYa39ic2/QwCgdjIKpQ7uxLrRyAUU0es9poz8eN01bMZHV0gR8PTiU/sRWIzo0BxvC7rnpOKHF5ofwgkNZh25c27EfEIJFvERqy/YyxMgPinlaNJFNfbJH920VazX3sl927XRPeQKf0lb8NJp9/xPbHGmbRSeA/n6RuvAb8MDMdrN+xtNbhcf/WcDOeA9HD2sdxKbayjzWzm02sH8fn383CITG1OV2bPrVHUh7Y1SJHdyOSYG0VNGiUXa1MolTdRV8D18tjSEM0ODwrivjKKYaExyeQid7hOrEO848lnX75EyWW2fN3GcdCzPmsAtO7aRx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhUEAo5rQfJbLlsbXat4WcAJ0vqDg2PEckaSW0bIwf8=;
 b=BpMDkjUoNldbdg/Ffjz17/nLXp21y8xMlVviEW6p1tIN38QriS72n9jmkFYoPVtp2XunnLnF478yr0A09haCCXK2IK24ZastxPi+LPt0DRsHxH0YxgxPtNbijPiHE+Gdj7hL6lU9aL4sW1ye9rxTYm7x4GZ84++ryJ4jrqfEegs=
Received: from BN9PR03CA0569.namprd03.prod.outlook.com (2603:10b6:408:138::34)
 by DM4PR10MB5992.namprd10.prod.outlook.com (2603:10b6:8:af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 14:46:40 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::fb) by BN9PR03CA0569.outlook.office365.com
 (2603:10b6:408:138::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 14:46:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 14:46:38 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 08:46:34 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 08:46:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 08:46:34 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJEkVua2042638;
	Wed, 19 Nov 2025 08:46:32 -0600
Message-ID: <002fad46-adb5-402e-8eb0-e4c71b862674@ti.com>
Date: Wed, 19 Nov 2025 20:16:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: Add missing applied DT overlay targets
To: "Rob Herring (Arm)" <robh@kernel.org>, Nishanth Menon <nm@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Wadim Egorov <w.egorov@phytec.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251117211316.725960-1-robh@kernel.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20251117211316.725960-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|DM4PR10MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 48be1bc7-0c28-4fae-f0bd-08de277a7231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW5oRkY4ZjJuNks3anFiUk1EVU44c0ZNSlRWK2FpZW5SbzdpRHBiOVdyK0lv?=
 =?utf-8?B?WEp3V1VyRlFBeVMzckh2ajJlWUJRaWtqRzc2cjZWb1RrNXlnRDlxOU5sTzlu?=
 =?utf-8?B?SnB3ak9QeEF1Qnkrb2JHRlRGYzdRYk1GR3VHb1dxSWlnQUF3SEcxVEtLUGQ0?=
 =?utf-8?B?STBMdUVSZUc5SDlydnR1UTZOZTFxamdkN0VWcXpDdmxXbFRWVXZjTm04Rmwz?=
 =?utf-8?B?bjZDWmQ3NGFkUTNiT0EyMXhVRUhjdExWRFF5KzhaUXVaLzlmcHpEejJ6MytR?=
 =?utf-8?B?MEZJL0ZJZE9YRFY5TW9lRUJsUnpZQUppOENGU3JZZVZJOGdvZWExQmorZDV3?=
 =?utf-8?B?Sm9abzZlNCsyMnllSk1veU41dGlxdDRDZDliZ3NpNyt4Rk5XcHNPREhVK09C?=
 =?utf-8?B?R0RJbXZmMkJMYUt5RnFmQTVGMy9IN3hFQTd5cnR0STVqUEtQa3Q3NlFKVDRS?=
 =?utf-8?B?U1dmRDh1V0RaRTdxL3hycFNacjVseDNMRkZ0ak8yV3I0Wnpma1ZEOHlqaEtG?=
 =?utf-8?B?UnNodm5WNVF0eHFrZ1BIRGQ5Q1pBOWtTRjJ1VzhLN2FJOUV6RDQ2bkRLZkpB?=
 =?utf-8?B?bmtVK3ZVd3gydXk0cUJKRkZEUjZkQzh1c3dQYXRPdXBiaGZDTUhiLzFCc2kx?=
 =?utf-8?B?VDFKSFNaWHFFLzllNGo1NHVxSHg2VE4vRjhGZElremdFUlJra2lsN1M4dFRK?=
 =?utf-8?B?cUxtM1NzSnAxcll3aTlSSkE5YjdXZHhWMW83aURwWVNzRUhnU3JBUlJ0T2xX?=
 =?utf-8?B?cTB1cDk0OVRMZzVSWUUrdjZBemgrbytsSjFMaE4xbWZIR2RNbUJmMWtqbTZM?=
 =?utf-8?B?MEdtQWlDN2pTcXNvemY1aVVuZkRYR0UyVVMycHk3NVJCaGV2Y3B0QVNZMjVM?=
 =?utf-8?B?YkdvU3ZwVEdlKzdhWS83YjdzL3Ezek05UWQrNnNEZC9iRUE0UjFKU2EwSTJx?=
 =?utf-8?B?QXFyY0RHVmhXbld4Z2VxT2szZDZFYWJ1MkJFTlI3Zy9NTkR6YXhML0Zvb2Rq?=
 =?utf-8?B?UjU1NmxQdWh3ZnkrUzBXbVQwYWMrYlRreGFwMTIzcmc1TEx0T2NrMkI1Uy9U?=
 =?utf-8?B?dE85emcwb3F1aTByQUk4dkNyQ0ltSXIzeXhaSE5vTDVCSmlGd2VkRHROblor?=
 =?utf-8?B?UXpaRFZnTzBQS3ozV3AwYzJvRFJWMkFIUEFMMTVpN2s2eHk2UUtlSWVyS0gy?=
 =?utf-8?B?T3BoWTV3MTY3WE9URVF0ZndWN3pPTUZuMUhsYjdCVnVRRGhyVnV6RWtYSHVP?=
 =?utf-8?B?cy9jOFhxOGdESCtrU1EzQzROMm9JTWpmTnBsRVhadXJRS0psanhxOEVUNzUx?=
 =?utf-8?B?MUhuU05EQkVQQ3Q1d3M2dzBDaGdVelRlUzV4aTBEdHdML2w0TDNsZFMzUmtR?=
 =?utf-8?B?TTRzR2lZUnJWZ0MyQlI3ZWJmd0pPRVVqNUEyeXZpSnpUWjlMK1ByMTFibk8y?=
 =?utf-8?B?cE1zREJISWE1bTVseGpKZklZTkpqSnFwSkVsZDRoRkpKdnNDTFBnSEg5bFl2?=
 =?utf-8?B?R1ZaSHkwaVFNWHdxOXNBUlpiZW1CQm5oRUMwZkplVy9tQXNlYkUzRm5UOG01?=
 =?utf-8?B?QURFcjRKSWFBa3F2eHpMcE93ZnBIUGtBZ3FoUW15NWNScVBHY3gySEMvb1Fr?=
 =?utf-8?B?TldxV09BQ1ZOaUtsUnlJMTZlbmwrRjdUWlkrNDBwMjZzcE9hdG5oNTBwZjVo?=
 =?utf-8?B?VjRhU2VoQjlCWjdoZk9zMDFacUd6NVFsZHBJR2VFZ3lGTVQ4WWwrR014OEZx?=
 =?utf-8?B?bTB1cTRsRzUyODlsY1ZJOE5IT0VsbG5YMnJVV3pUSGVmZXJpeXp1SWgyTEhs?=
 =?utf-8?B?SmpyUUZqUE8yVXBLbDN3N1dtR3VrSlFhYmwrYlE5bkdIK1I5b0Q2d2wxZDFm?=
 =?utf-8?B?a25QalY1enFBOU05dDdzM3Q5aEkrTEEra2RMbGkxWjNwMVh0dUh4bHd2dGZ2?=
 =?utf-8?B?aG9nL0E0ODcyejkxNnlLMkJTT1dheXppaUh1MGtVYTBsVnhtK2gzNFlvYk95?=
 =?utf-8?B?THNYTC9taElVcDhWWVBqZHZOd29GbDFCTFlMSHZMc29takNmd3duT054bjBM?=
 =?utf-8?B?VXk5UU1EdUl6RysvS1dyWXZyV3NSSURqZ1JSNm5SQU5IdXVtSHY0bk1jNHJ6?=
 =?utf-8?Q?/+c8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:46:38.7852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48be1bc7-0c28-4fae-f0bd-08de277a7231
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_064646_484356_8B7501C9 
X-CRM114-Status: GOOD (  18.04  )
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

+ wadim who posted something similar:

Hi Rob,

On 18/11/25 02:43, Rob Herring (Arm) wrote:
> It's a requirement that DT overlays be applied at build time in order to
> validate them as overlays are not validated on their own.
> 
> Add the missing TI overlays. Some of the TI overlays have the first part
> needed (a "*-dtbs" variable), but not the second part adding the target to
> dtb-y/dtb- variable.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Look like there is more needed change needed.

https://lore.kernel.org/all/20251119123216.1481420-1-w.egorov@phytec.de/

Could one of you post the superset patch?


I have already sent out the PR for v6.19rc1 for TI tree? Is [1] plan to
be merged for v6.19 cycle, if so I will plan for a follow up PR with
newer version of this patch.

> ---
> This will soon be a warning[1].
> 
> [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/

BTW, with above patch, make dtbs seems to fail w/o CONFIG_OF_ALL_DTBS=y.
Is that expected?

> ---
>  arch/arm64/boot/dts/ti/Makefile | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 743115b849a7..54c4a6ba23c7 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -115,7 +115,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-j7200-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j7200-evm-pcie1-ep.dtbo
>  
>  # Boards with J721e SoC
> -k3-j721e-evm-dtbs := k3-j721e-common-proc-board.dtb k3-j721e-evm-quad-port-eth-exp.dtbo
> +k3-j721e-evm-dtbs := k3-j721e-common-proc-board.dtb \
> +	k3-j721e-evm-quad-port-eth-exp.dtbo k3-j721e-evm-gesi-exp-board.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-j721e-beagleboneai64.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j721e-common-proc-board-infotainment.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm.dtb
> @@ -177,6 +178,7 @@ k3-am625-sk-csi2-tevi-ov5640-dtbs := k3-am625-sk.dtb \
>  	k3-am62x-sk-csi2-tevi-ov5640.dtbo
>  k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
>  k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
> +k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
>  k3-am62a7-sk-csi2-imx219-dtbs := k3-am62a7-sk.dtb \
>  	k3-am62x-sk-csi2-imx219.dtbo
>  k3-am62a7-sk-csi2-ov5640-dtbs := k3-am62a7-sk.dtb \
> @@ -254,11 +256,17 @@ k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
>  dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
> +	k3-am625-phyboard-lyra-disable-eth-phy.dtb \
> +	k3-am625-phyboard-lyra-disable-rtc.dtb \
> +	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
> +	k3-am625-phyboard-lyra-gpio-fan.dtb \
> +	k3-am625-phyboard-lyra-qspi-nor.dtb \
>  	k3-am625-sk-csi2-imx219.dtb \
>  	k3-am625-sk-csi2-ov5640.dtb \
>  	k3-am625-sk-csi2-tevi-ov5640.dtb \
>  	k3-am625-sk-hdmi-audio.dtb \
>  	k3-am62-lp-sk-hdmi-audio.dtb \
> +	k3-am62-lp-sk-nand.dtb \
>  	k3-am62a7-sk-csi2-imx219.dtb \
>  	k3-am62a7-sk-csi2-ov5640.dtb \
>  	k3-am62a7-sk-hdmi-audio.dtb \
> @@ -268,6 +276,14 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-am642-evm-icssg1-dualemac.dtb \
>  	k3-am642-evm-icssg1-dualemac-mii.dtb \
>  	k3-am642-evm-pcie0-ep.dtb \
> +	k3-am642-phyboard-electra-disable-eth-phy.dtb \
> +	k3-am642-phyboard-electra-disable-rtc.dtb \
> +	k3-am642-phyboard-electra-disable-spi-nor.dtb \
> +	k3-am642-phyboard-electra-qspi-nor.dtb \
> +	k3-am642-phyboard-electra-gpio-fan.dtb \
> +	k3-am642-phyboard-electra-pcie-usb2.dtb \
> +	k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb \
> +	k3-am642-phyboard-electra-peb-c-010.dtb \
>  	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
>  	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
>  	k3-am68-sk-base-board-csi2-dual-imx219.dtb \

-- 
Regards
Vignesh
https://ti.com/opensource


