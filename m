Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8004D4660C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MmCBRpuCVY8LW4FGHIIALxzQe3LhY9HmZZ0BwWQSKw=; b=R3zD62EkM83+CjTCXmlwLuUxyH
	vXjkv+e0AZoAAGovoGXJRJ3oSSDjcHeedaBusicghHXVI0IQMc5tH3QPJpmnJJglbp3xGJc8C96Ce
	gkYk+uwQdnNepDwyJPFr1Ct9V3b1qumKsalmETdXnKgYG2WsLHP/85CrqbbxSqQ5pSl37r9yHsVbd
	Zp9g0AvDV9VvWwzFPHO2x8sbllJwZlCqr5ez6BEARy9AeogSwhomvReOrF2IB1CRzuyq8shshQ+ba
	SI5H6ZcWIGaZ7ctsHnOkIBCsVexVGU/u4Y7fDqcKpbGe+69xnACkWMygzElTZoLfcydLxZp1oQp9K
	GSUpa88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgh5H-0000000DxZW-0Idh;
	Fri, 16 Jan 2026 10:29:39 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgh5E-0000000DxZ2-2lNG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjiF2mpRmZAbKvXWZKPmjTx7J2ic+cWyn64xpu7jfQkpxcrlhTXtbRRL6xPtLudQpVDsjZ2xaQdQ7HGSvJopR3JNE4OGTNPoyacCPwJizU+EvHmQa+6ugZfIPuXg9bmCCcSJuBey/cXmjAzLeKCjjwlBDE1Qf4aZ5PPEHnnNEnEfBxPlFelCKseVaIbNRpLMIMk9r/Qw3TjsmAmnurPkN4Q2ENiIDlDHocfOM0knM6tuTVN6KQkKRErHW4BLtrbgTQYEveSqvwPFnlwA1H1L9+Co2GcxZZ90j+qqXzGgIQ/giYWjB5+1jWVM6LU24Serd2kG68Ot1o9K+ew3SR9e1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MmCBRpuCVY8LW4FGHIIALxzQe3LhY9HmZZ0BwWQSKw=;
 b=g3T2wk0n3klL/LXW3dqGpbHE76O3W4jMBs28NztzRa/ww+Zu02bpQ3Ix5XwoE9n3Wltp/oKdktnCe/tlLWWqBaz2DDg4WlRfDJ3Rh40g2SMFsczADWrnvVP3E9So2Mm9r96N3r/x7Yx6pEqcG5XdJugRI+tbXO2FEjxuPxagOzxlYk6Ts/OoPQd+aNrQDqkVpUcEde09H7K3pADsKSZ4AHYhx13cbRx02o/VPWM49Imrv7nmUuw9nRsOpnFZxHFXf/P8zOmvPvs9cl3t66a62amWbsqGY7bOtFWmAMfSGho7dV2U2D+Asm6P6sGbNL+qeKl/mcSOMIBYzP2HmrmjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MmCBRpuCVY8LW4FGHIIALxzQe3LhY9HmZZ0BwWQSKw=;
 b=hB7tSs3mOGcWN1OAmJRZFD9iOpMftvNi9tNHze8UPXbP7QH0tpDCng77xno3SkwEn2x6n++0396GsOPGbeRtLU3ZYYQxZIPe84mzr+I+Tz758OuWgY7/ObzJ2lAfDqlQswduk6XBn7Nc/lsrxqFHpmc54KJS5qbbu+o1hsn9pyg=
Received: from CH0P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::14)
 by SJ0PR10MB5836.namprd10.prod.outlook.com (2603:10b6:a03:3ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 10:29:32 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::4a) by CH0P221CA0036.outlook.office365.com
 (2603:10b6:610:11d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.9 via Frontend Transport; Fri,
 16 Jan 2026 10:29:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:29:31 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:29:29 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:29:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:29:29 -0600
Received: from [172.24.235.213] (gehariprasath.dhcp.ti.com [172.24.235.213])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GATMJX3135665;
	Fri, 16 Jan 2026 04:29:23 -0600
Message-ID: <a2867587-cd97-4558-81f9-df8d47d08350@ti.com>
Date: Fri, 16 Jan 2026 15:59:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-j721s2-main: Add audio_refclk node
To: Moteen Shah <m-shah@ti.com>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
References: <20260112104536.83309-1-m-shah@ti.com>
 <20260112104536.83309-3-m-shah@ti.com>
Content-Language: en-US
From: Hari Prasath <gehariprasath@ti.com>
In-Reply-To: <20260112104536.83309-3-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SJ0PR10MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dc23e5-b026-478f-cd2a-08de54ea22ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlZQVWswcWdXTlZaemVieVpEeHRoaFBsUDFZTzBPRG1RbitmRWlFKzBJVnlE?=
 =?utf-8?B?MDVVVGlYdDFhNXNLUFJ1Mngvb1daSGs1MnAvWEM0ZTZLbDhabG5zcld4VHp3?=
 =?utf-8?B?RU1nREYzRi9DZTBibDhDY1BsamRoOVRFZC84QmpkTlA0THlIVDVvQTVKenAy?=
 =?utf-8?B?OG9sR1NyTmVqRk5qeEkrKzRHQzVVQmZ4a1BqaHdNWFFvdUZJUEVNUkJGUWFK?=
 =?utf-8?B?T3dKZk9kalRGck5PeWRsOGtYZFZkYk5NQVpIZi95YUYrWlVCaGM2Z1dOemc5?=
 =?utf-8?B?TGhPK2FvWXNvZE8rcXpIcXJkaGNuU1JZRjJFU3BZRkRUUW0yUzZxRWFtS0lT?=
 =?utf-8?B?b0lra0tWSEJTeWF5cVRHUW1mQi9DL2pWaGxaQVJvQWhrWkg5ampIR0w5NmlJ?=
 =?utf-8?B?T2dzY0U2T2N2UnFqYUFEUnZBQVdrR0dmMzNNMzVDd09jNXVqU1U4NDlhUTFu?=
 =?utf-8?B?SUtoZi90RmF1Z3VVQ3h4Q002a0dYUGRIWW5ja0FoejAzcCtxZkxUbkNDN21O?=
 =?utf-8?B?eDE0NnNoZWFhYi81WWJUT0t2VWFKVTRvL1E1b1FxYlo1b2hLSWo4TG1pLzFF?=
 =?utf-8?B?aHlsd2ZSNFVySFQxQTNURS9wZ0szL0pQczdZQ2F3N2hXSTIvTVB0aVNaWTV3?=
 =?utf-8?B?U1NwOTdENEJsNDFHbGZrd2dVRzhtQmNYWlZOVGpXaG84cHBsTzNDcWdzWUZH?=
 =?utf-8?B?V1ZiRVd5ZFpsUXdpU05rVzdiQnM5eHlMZS9ybXd3OWlyTmoxWldTT2tXbFdX?=
 =?utf-8?B?Zkt0YlczemttTWxZMjVOL0xUVGliNzhHWDZSL2hPMUF0ZUcrVTZTZENTRFZB?=
 =?utf-8?B?a2FwSUkwOEFPTis1eE53Mko1YkE5dkRpSHRwUWUxR2h4RW4xa1ZPbHZGZjBz?=
 =?utf-8?B?V1FKNkU1V1g1bkdmWUJjWlYvenlaU2Nxblk2cFhMNjRHWGtMWlltcVE0bEo3?=
 =?utf-8?B?akxMM3hhaUN3QjhPblZaTGJZd3Q0eDJaSVlQQXZkT2VqaHRGVWF0a0QxRmhQ?=
 =?utf-8?B?K3ZuV2pybDNWNzNwZUNWQ0ZWRUVSNUZIYktvdDQ2QkFqRExRcWxVTEQ0ZmUy?=
 =?utf-8?B?NzdVUXVtS2FBdXZ0Wm5vay9tUXlhOXR2emRFV3Y3blVSeWd5Yk1aTjlWOFc3?=
 =?utf-8?B?NmZNeW1DM1lrUEdKckRUNEQ2b0NpRUVxcVVrajcyOGs4V3lPSmJwNjU5WDNx?=
 =?utf-8?B?L29menU1SXQyeVJwVDV6eXNIYzRuaVVoekFjd0JSVy9WcENzcmg0eWxzbTZk?=
 =?utf-8?B?S0ZOc1VMdm1Ma01BcXFkNDJWWnluTWNsK0g3NEFWY3pHQTM3Y1FuRVlZQnBB?=
 =?utf-8?B?cStzWS80YlQzVGkzL1lHc2FDL1ZGRjNJWUw5L0p3bUovSk44THUrMzB6NnpH?=
 =?utf-8?B?aTVhQSszSGVGUmFHSXlzckhESmRKYis4aGJ0RmZVUHN2NGxKODIzN0luelpP?=
 =?utf-8?B?OUI0R0NvTkVJcUl2THhiMFFLWHRkZjdJYXFsREZQMmx4cmhodzlzc2E1eThr?=
 =?utf-8?B?bWtxRzY1cTJwbHdWSkMvY2x3QlloV0huNEF4RGlxRU9DR0NIcjEyYmtLZm1X?=
 =?utf-8?B?SzVHLzYzOFFMY1dDbjhqcEdVeEhPT0o0MnM4alJtVXd4dktMUmcvbUxwa0VF?=
 =?utf-8?B?WUVNQTE0dW9xc1JOeFFFdzBaUWFWa3I1cHNWem52RlJ1amlzZ0V4M2hzTmRW?=
 =?utf-8?B?RUxIdmxxWFFWT3hnV3h0NE1tVXE1bTRjNUNNTTU5UmtJS0x2eEMreGs2NklB?=
 =?utf-8?B?MFlISU1Za015cDJKU0ViMkl6djNxYktxaVU5bnZwelBBc1hOMmEvMXV2eUoy?=
 =?utf-8?B?ZjdDQmtsL2dlQndneW9wbWZTTzkyUzcvMzZYbkowQytoc0djekJFMDNDcjZH?=
 =?utf-8?B?TTdXU3EzdzgwZnV5ampmSkVNL0VXdmZERHFodVdValNVQmdPaWczTUNka2lr?=
 =?utf-8?B?cWMwS1NjVEg4K1lpcWNrSTRSa0lyQ3pNRHNlS3JjeVhTcHB1YnIzbnhyclVU?=
 =?utf-8?B?SkZRblJrZ3NTWkgxd3FiOHY2Lzcvb1NDNkRtcFcxcE1SMjhxUnVSR2RLcjRC?=
 =?utf-8?B?L29SVlRvSFlJYVl0VGVoVVVpRitLaS9yOXdBZlFqQTFkcysxT0NwMWhXczRD?=
 =?utf-8?B?QlNUaFp0bkZMNnkxMDJJUzAxT013RkxyUzh3cWtCRnY5UVAyVFBBNGRWOHR0?=
 =?utf-8?B?eEp2eS9FZTZva0VoUnlwa1hVTzdnRlY1MkVwZmVid2ZrekoyRXlPQmxROERr?=
 =?utf-8?B?QXBrazVKV2tiZ1plR0Rqb3ZKMlpRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:29:31.5227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dc23e5-b026-478f-cd2a-08de54ea22ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5836
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_022936_705382_B0FF853E 
X-CRM114-Status: GOOD (  12.71  )
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

On 12/01/26 4:15 pm, Moteen Shah wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> On J721S2 SoC, the AUDIO_REFCLK1 can be used as input to external
> peripherals when configured through CTRL_MMR.
> Add audio_refclk1 node which would be used as system clock for
> audio codec PCM3168A.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>

> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 80c51b11ac9f..3ecc7c973205 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -75,6 +75,15 @@ ehrpwm_tbclk: clock-controller@140 {
>   			reg = <0x140 0x18>;
>   			#clock-cells = <1>;
>   		};
> +
> +		audio_refclk1: clock-controller@42e4 {
> +			compatible = "ti,am62-audio-refclk";
> +			reg = <0x42e4 0x4>;
> +			clocks = <&k3_clks 157 299>;
> +			assigned-clocks = <&k3_clks 157 299>;
> +			assigned-clock-parents = <&k3_clks 157 328>;
> +			#clock-cells = <0>;
> +		};
>   	};
>   
>   	main_ehrpwm0: pwm@3000000 {


