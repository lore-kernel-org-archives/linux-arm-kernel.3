Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5557EC54FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7pB/Us9Nxk2oqAoJTRsSV5IKkj2OBQQF+/LDiXvwl4=; b=H4GJ1ijlk5ZtNbSkKt1FEjEsVN
	UsMhCM9QpCScrvwYNatS17pee33LQOhzfOPl4kwGJ9cnbcwmAewfh1g6M43g8nYXGAVD7/8Bcre4m
	Sez9feKj4ovqSyPIRuVjhJofaLXN3hUDg0xLM40kVGT5L/sbpmN/FKtnaltitdr9l3bJ6hsC2CMIo
	q3IzaNKERCBCWTJoaG52VnaLkEeOMi3h/74wM655BwVXL95Uc85IpCfP5As+3B1mxOjnS1Z6DDXvk
	Xmb+u/jYp2IuEo/ZuQT7pwcht62CVjbzGuTryMsKWVMK9cCJZf7qY6Tr4KByNMwjPwG0nFXSaIE0V
	vaT+8enA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMKg-0000000DRyE-0YLM;
	Fri, 20 Feb 2026 08:57:54 +0000
Received: from mail-westus2azon11012060.outbound.protection.outlook.com ([52.101.48.60] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMKd-0000000DRxt-1gT6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:57:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpxt02sDaaovtoxCXTFGCEvT46KWYBKmlDbCAPfYu8D3eezbPa2MHW0i7ii700WJchY+V8e+5RTtFPonw7Uy7pwSfQ322yrDZRsLdLs0sAMnVHyEl32bo5duylN2hpgr3t5SwGMuMuvr9CHaZ/iFXVEQ9WBisy+lQaDg9b+pde1NF312a7kIwjdhgkU+9r+dt8Z6fXTvcK6fiCt6IuHtnzddBXhftMaXBNAPQSpLiUR+ssJKKw1U+/rpjgW6Z2FiefHH2auyf1ngaHF/xOiIl28slCxETwURdktOOKerrFqI6ck/E9FvNqryVclJkHV7EUekboVTxgIg4Tyql4fPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7pB/Us9Nxk2oqAoJTRsSV5IKkj2OBQQF+/LDiXvwl4=;
 b=vat9BKVQ9S6Gq1AWkT7OVbXucpl5WiEZSd1ePJkADej1HCVarf85TzuG9wjTK9I09qg7Gkmz+sALXZkkFfSZjl7cnQvMgTCfTftCxkWBTcIU5Shm4MabDocIP1dxVgH8CnDtQ470BSPE7M6vVRUDGFEc8yucLKzDNG95F1aYyam+LBXSqD4jTGojskp8dE07VzXH9lObVuwQ9nb+VM+PNxXmFjD2bSlRmiSpZ8oF2Qi7EJAnnuoNQiT8kFbEEz3XPhmQlZVFLGd38JPeP7dqF71+GmUYJayNHUruolVughAzHIqebyHXBs2Utt5Gg3qrZ2paNra1JiXIML9tvc7IMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7pB/Us9Nxk2oqAoJTRsSV5IKkj2OBQQF+/LDiXvwl4=;
 b=O3Jjar0uzyvTOqnrkWwbQmubocTqz4RL5Ooen2PsRanC59g3vIIy3roW1Ia6cwyX88z/WWKK4aGvhP6XpwOwp3WEPXMEdB32nA9+7oSL+xNur9jCfj0rnGxatFedLNqotyX8zJf+VbnHM0WaN2zHBOCmAJh3yHNJoY9EVrxVzmU=
Received: from DS7PR03CA0159.namprd03.prod.outlook.com (2603:10b6:5:3b2::14)
 by PH0PR10MB997641.namprd10.prod.outlook.com (2603:10b6:510:386::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:57:47 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::36) by DS7PR03CA0159.outlook.office365.com
 (2603:10b6:5:3b2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 08:57:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 08:57:46 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 02:57:46 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 02:57:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 02:57:45 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K8vgKD3594572;
	Fri, 20 Feb 2026 02:57:43 -0600
Message-ID: <e651f6a9-5867-4326-bd98-10a37bf26019@ti.com>
Date: Fri, 20 Feb 2026 14:27:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am62l-evm: Disable MMC0 internal
 pulls
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
References: <20260212184246.2316659-1-jm@ti.com>
 <20260212184246.2316659-3-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260212184246.2316659-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|PH0PR10MB997641:EE_
X-MS-Office365-Filtering-Correlation-Id: 010d3f8e-8e9d-4b4e-c3c3-08de705e1dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEpOV0ZVMldWb0dLTnVCZ2hXd3RqN3ZBWWFFMURQNG9HTk82amh4MDdzaHhT?=
 =?utf-8?B?dW9mNndPQXN4U2VTNzFCL05SeW1Vb29UT05iMHRGV2x0RFp2L25IZVJWUlVT?=
 =?utf-8?B?SjZqZDVkSWNyTmdtSEhZMTZEM0F0QWZ6NXljeEFOQjk1YndzQmVmak1TK01F?=
 =?utf-8?B?VGIwbmRDOUFWU1Z5NVdmRExOVmRjMjFkWXVBSlBFN1FIODJBMWN4WTBYdlBO?=
 =?utf-8?B?Q2pFeU1wcVNkaklJWjRqbXcxcEkyTDhuZGpjSjRKeGxkaEVqM3pCYS9PM2lX?=
 =?utf-8?B?dG9sZkNkaTI3WGJ6L2JoZk5lWGd1aExpLy9GMHUxdlRvOWpTbkhVRnkrcWZX?=
 =?utf-8?B?cVhPaTVXWE10QktsQWl0OFJINXJtc3NSaGd3eWl1VmtRQ0E5OFhQWHR2a3ZN?=
 =?utf-8?B?TDZuU0FJVTJod1JuK1I3MTR6ajRPQXIyM0NXeEQ5VEZ3UTZNdzhwNjZvS0t1?=
 =?utf-8?B?amZHM3VsRnpWc2VXWDJCZHcxRlJoV2JzM3g4OHRZR0lwbGt4UlBSeVhDeUJC?=
 =?utf-8?B?K3poeUtnYzVUNlFpWXZtdGlxQnloOUV4ZHV6bng3cUdNSnA2Qmh5dCtaUnF2?=
 =?utf-8?B?WVZFVEllTHRlNEZ2ZEFieTlFY3hmekY3TytPQXRraGxNUFJBa1lxOTRLdXBH?=
 =?utf-8?B?Z1oxbnNycHF6SURvYzZUWldLVGZ0U1YrRnovTisweXYzeldmdVdkYUVmaGJh?=
 =?utf-8?B?WTg1OUgwdkhmTDdVbitpQ3A0TjV1RlU2bGRZM05FMUFMZmhYRXk5MVRNaEFk?=
 =?utf-8?B?aVZNd3RZbVdISERwMnd6SlFVZHJCUEhucW1pdDRRYzF5NFk3Nnd2MGtaS1JR?=
 =?utf-8?B?eHhWMzhuWU91Mzd4bEg1UndGVmYwR1VqT01NcWlsSkxFL3JSN3FzTUo0L0wv?=
 =?utf-8?B?OUhGODZwTzhxVXBNby9VRXg0eEpUMTJvWGFwOW9abUZPL1daendjT0x5cnlp?=
 =?utf-8?B?aWJ4QVRBQXNVNTlvcVJSL3ZBQWhtTmtGSDZsYlBTVDdTQ2s4VnhqYUxCbm01?=
 =?utf-8?B?Tm9rcVVsWWhJaFgwNEVpRmROei9JcTd4dGNqZEUrNi94eTExelhpZU1DaHAw?=
 =?utf-8?B?a3BDNVhjVis2WkRRc2wyUDZtL1l5L2N6cFdWelhLUEtvSDdYRWVrd3lVdERw?=
 =?utf-8?B?ME1CMTZWT2w4a1NYK00ra1BCTFhmZ0ZyeWVGQ3l4S1llWWpKWHEyc1RVMjVj?=
 =?utf-8?B?UUxSSFlLV2E1VHdKWktaNEJzdGZveURXQWFUNHpucUFTOUlkN0pNbi9lbWVD?=
 =?utf-8?B?VE0rK0dBUXFvSUpRaDViM09nUmRHelpqNE9PNnpQN25idzNsWnpJSDFJYU5W?=
 =?utf-8?B?Q3RNM2xRR0NUalJGMnZXT2YxOE40Ri9KYU1SSkgxQ3YxQTA5Ukxwb0l6anF5?=
 =?utf-8?B?ak1EL0xodXQ4WWllVjVXSEpBZlNneWJmMTlIUGNSb3YvYXZhUG96MzNjQUdu?=
 =?utf-8?B?MkNSWDl4L2twSEVoU2p4cUd3bGRhbm1iVjVBcDVraGxiYlFhREVlRFprN0wy?=
 =?utf-8?B?b1lIeXgwZE04bDZiVXRVWUpxbzRQdExNMk5BdmhycGtEK0Q3Qmc5dnV2UXhv?=
 =?utf-8?B?TGRJY1lyZkw0dU5DSE11Um0xVTNrNHJpamZIa2w0bDhyTkhQK3BPNWZOYlRp?=
 =?utf-8?B?Uitrb0xtNUUyanZqdXUxNVFtSHhZalRQc0ZxSlpITURLVjk2NklxQVNFT011?=
 =?utf-8?B?bzUrd0lPdlM4L2RIT2JTRUlrVTFNWHhTSzdFSm5WSUNDaHNrYVg3VXozWE85?=
 =?utf-8?B?ZU5xZUVVREN5cmxsRXVzN0U3ZDdhYmZlSUtkaFBmZ0JDc3NocU01MGREdm9E?=
 =?utf-8?B?NE5zS0VaZm5xbVd1TG55WmV5MytaN2dhaU5WeHpjckg1eWxaS1l4ZVRKdFNu?=
 =?utf-8?B?VEVjelh5NTFLc2RRTE1ZUXFrSVI2OEhnR1JYVWV0VHpmUFN3VldIZzZFYW93?=
 =?utf-8?B?VDdGQXZUVXhhOFdtVXFWYlI0WitiMkxKUC8wSFllVzZZdEEzREZzc1RVUkF3?=
 =?utf-8?B?bEltYUl3L1kxNnIybko2T0Y1SHlXY2w5QitZVG8wY3RDMk5RY2lMNzBBOTFG?=
 =?utf-8?B?dGdSYlNSQmtPKzVhVUJjQUdsbGw0VFBIL0poT2tJK3R1RHZUV1VudlpwWThq?=
 =?utf-8?B?ZXY4YjZVRVNRa0NwUHp0c0ZhSGZoZjJ0aktnbEVraGJ0dmh4dWQ3NHZFa0xP?=
 =?utf-8?B?bGo3ZFF6K0l2WkwvZ3l6Wjlaa2Z0N01CT09STm5QK3NoMXFQRlozYUhncWRL?=
 =?utf-8?B?dy9XOFlQMURnTzZmSXhwSzM5Y1lRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DQKasTidjyH6ejPFgifmhQLKvCDd3pzJXtsk/4HwlKiACorDbAPNagiuU5OY3Nk0rLXXh6z1ab2/l6cvIqw5kGNWsKPbEqHwtlFcARih+a0dvuHmNIcy8BnZQGtgHIM7FirHr8FNwhtLKESPGx/DoD7p0IPkdvcQgqlfCe/kVuiGx5UdsLm6Z+yQqAq/y9BV/h+YK+/4vYMRKRJfyb7DZ//ONzrXytQ6ovB+/gCyuY8BP/7nRJb0WGba5FOE9lCzS6zex8gheYFvlzVkbZjxo3lNvhq8YpT86utfaOfKGIjTApelii6iusElS7fC0AuGTzgC05AHo5ODYgRlLRmwND3BeGXBQAh3IL/W/eO3krL4/auGPHBEVutlFBl18Pb5Lfj098lx5tN+cEsGcd22I8XuGBfUkLRt1CkOS+aa/JeF/T0tush93Op1oNPD6qI8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:57:46.4605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010d3f8e-8e9d-4b4e-c3c3-08de705e1dfc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_005751_468686_D81EDAB1 
X-CRM114-Status: GOOD (  11.14  )
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

Hey Judith,

On 13/02/26 00:12, Judith Mendez wrote:
> AM62L EVM has external pullups on MMC0 CMD and D0 pins [0]. Remove
> internal pullups considering:
> - having both internal and external pullups reduces the total pull-up
>    resistance < 47K resulting in a value below the spec recommended 50K ohms
> - having both pullups results in unnecessary power consumption
>
> Fixes: 00fb4c73b67d ("arm64: dts: ti: k3-am62l: add initial reference board file")
> [0] https://www.ti.com/lit/zip/SPRCAL6
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index cae04cce33736..5085cd255fcd5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -253,9 +253,9 @@ AM62LX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D8) I2C2_SDA */
>   
>   	mmc0_pins_default: mmc0-default-pins {
>   		pinctrl-single,pins = <
> -			AM62LX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (D2) MMC0_CMD */
> +			AM62LX_IOPAD(0x0214, PIN_INPUT, 0) /* (D2) MMC0_CMD */
>   			AM62LX_IOPAD(0x020c, PIN_OUTPUT, 0) /* (B2) MMC0_CLK */
> -			AM62LX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (D3) MMC0_DAT0 */
> +			AM62LX_IOPAD(0x0208, PIN_INPUT, 0) /* (D3) MMC0_DAT0 */
>   			AM62LX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (D4) MMC0_DAT1 */
>   			AM62LX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (C1) MMC0_DAT2 */
>   			AM62LX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (C2) MMC0_DAT3 */


Wont the change result in mismatched pullup resistance and will the 
mismatch between D0 and D1-D3 won't cause potential timing issues for 
modes with tighter timing requirements?

Regards,
Moteen


