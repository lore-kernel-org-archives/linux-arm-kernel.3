Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C52C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXx+IdeNyJBBjJPMwm1k3ZPLsON+x6xls8FIuE1Nvg0=; b=V14AGC/DxoyaiVDmKFT6pHMjss
	Uzc6xonh8Lc6AqLAUyaCLmHRFupCRhBvgpOkM+0gwjxp8QFnyoamPJ3EPi+t7rfJBdoTCY6tjNLJ1
	NxhK22tkxRAbm+F0qoZwMrO8fuaLlMPJ6n5CtEhfbZu/RujLmfK/2JwxFD3Ko/fE+IcX/Jp6pSefz
	7etgaO4KZRl/qJBhy7+LknwqG3M5lDhNuQYTgesl7kVCWUSsdGqYPZdzzxvKqwjidKGaFfUtMHPTg
	OWOqUmgY0yHNlTdFUiV6Isn8ITVEQZQpVGJDiI0l7ZMt0k/bbYW17fTWgt5lxor9kLLqep1/zz18A
	WUL/Wq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1mC-0000000EZgM-3wVs;
	Tue, 07 Jul 2026 09:07:36 +0000
Received: from mail-southcentralusazon11013037.outbound.protection.outlook.com ([40.93.196.37] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1mA-0000000EZfu-0WGJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:07:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISHldHGLE7gYP/fhn0OGkQ3YVPYd86wWhL6dDAJigOr4obO+dSFjcynk6ApXq5NXe8QaIyA/Sdy3pCKrn56W6AIcb7MGKmp6FsXReDI7t434qpFJbyBzEn9iyHMTaoPF7WVni2d1XAIoQaZJAeghn96DbdDyodYF4YHpMSGONSAX9xmSW5Ow4FU25MFIqaiLJ4DZ6IthaWlW2V6TkqtdosaJlHABYhbFCvgdl/orHabc52E6dqOF4iq101X5+DTbrOUzDqKRdYb8GVrTw5XgyC+eVZXBAAFXP9zP/Pwlzy63CXxdy9GKoxExpjS4SoDwO9kPlv6h8kjznKrP8VEBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXx+IdeNyJBBjJPMwm1k3ZPLsON+x6xls8FIuE1Nvg0=;
 b=KC8HfxhHHV81lBlWi4jhgbWehStKOU5D9FbYRI9FPEmrqW8dNoDNem+at9RAEriWeIlIAQqa/OQG3st6xNaRIqk7Z7Oxj/5vmop01Dv96ZQgK7rDtKE7I7rYX5lH5RXx1Hvdy2+JWjboEjt7iw2Og3Xt9/rIFtV6xrk5cWw12yfKSVTHQ04ouzuAn65HSGEnX4Vc0kfSSR3nNvLm9NodfMCtkWrR3HZv5ovhXjp0U39RT3l+PMRJSIGW2GM/tO66yuoOE0kDgnTSC+xyyezS95YzwncEbHFd0riSjOgC5jSg2aOUUpShFIAFU83+t4iVMNLoXxLdMy9HZ27MOVfsmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXx+IdeNyJBBjJPMwm1k3ZPLsON+x6xls8FIuE1Nvg0=;
 b=Q7p2LS3/MatqFp6Ps93AifE+TapAo3ISPg9v+3Fh/bPjRzpAo/Y4pKYhhYZj+wj3WFAWbqrccgnXn5NS5sV8BwstHD9MIsM1WMMX8OFMCFv6mh6j3iqzMuYiHpTxvl/UfZZAchWEiJRTcC6HSXMfrfLxskHUcHQsdPzpG++hAs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SN7PR12MB6792.namprd12.prod.outlook.com (2603:10b6:806:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 09:07:23 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0181.010; Tue, 7 Jul 2026
 09:07:23 +0000
Message-ID: <7b669b2c-eb26-4bc4-b118-15dbe9b86355@amd.com>
Date: Tue, 7 Jul 2026 14:37:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: xilinx: zynqmp-sck: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260706093404.273569-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260706093404.273569-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0217.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::13) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SN7PR12MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 194f503c-8923-4135-2dad-08dedc07281b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gYNTql2vMGZ6T/iVL8DoSZwpZsX/HmCNhNlT+gi6l9QrCK9NiRmL/TQTXfQf/Qbsnpb7zb8EaPB43p4bZy7YxiyqTFvLfQgfyI01ABZkxo2XZxYedttAlgLTtmiuROpaEvSVHczN+kNsufjio1q8Jda0kmMeGFnDcctLBbFbiXZWHWjHANkbopyA0mn8cJAJ3Qc0FmT3Q28MVTqWIQsxMWxRsOtL8WzFzx3wwTlwDLy2MEY9LrKWPAcFQVxiunDBAtxFagezFH+P4Prt9T1xerfEAf6lcwg4f3AmO+KkuenCykwFRnwA0d7w64sdOtxR5iOHLbuJ2O+JoZ92/vZMOH59bfNIxSKrZHHPnZNldZDgA3rC04A/LEN9LMKO8sZlkvoebW0iatdCH5n4f2CRnJXv/DUJfPQ8vi/HRhaC+W9bP1ifZGFd6cdPW8xC4W5BbcFQvkb8vrGhHF0BdrSirsh/2dXvMVwMzyFoK7eYRAGkERMuXY32czm2ZXLqnGeUBZZgFAohDkqkUm+89+OxjO3yWYl/JsoRkS1Uymajvaz0ihAbUxpDK5mIt2lnryBEaF1WlQxrm23JG3IccU5K+KpTuCE7qUwMD0VnBJZBsKU3FGVydaIY3dV4x34l+wAejQihh3tY0aiYXJvgIBWNFttGDAmG3yBCT/l8QwNt27M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUc5THVmN0NkL3pIVUlEVk5XOEYwOGJnbkpTUFF4SkVORUg0SGQrZW1YQXNt?=
 =?utf-8?B?eExMc0RoUXBpRGp0WFNsOXBpS1VtVWl0YVZlNXE5K1NhTmtVaW42OEprOEgz?=
 =?utf-8?B?am96ZkdLT3lXelIxRy9qZG5JYjcyTEZCcEQ5Y1ZtUy9kRXRxMVMxdXgxUHl1?=
 =?utf-8?B?d2VTVVFZTkFMUk9UTzVIek1uWWhoWk9LRU1YdzJ4aXBQS25jWDJZazNHQXp6?=
 =?utf-8?B?OCtHNWpKbzRZWlZqTFRMeEVMN2REQXhoclhTdFRhR3dPY0ZWUmZuRGVsTkts?=
 =?utf-8?B?bjh1a1FwTnczeUsxbWdMUnFnRmY2aURUdTE1YVEralIzQTd4SS91OUtzWWxJ?=
 =?utf-8?B?T0dsN0FVTXNrd3ozcldDNFVOK2xLQjhqS3BNWVp5elBGQmtqdE8zYURBZlBT?=
 =?utf-8?B?YUtKbjdxRWx2bUNSRlIyUklxMjhaVStMYzBWNXQxd1lKRFp2SXovMkMrL0Ro?=
 =?utf-8?B?THg5WDg1Nzk0UnBwOW14TDFoUjNXQmhhWjNGL2FRQzFKRWphL0dMZDJyS2F3?=
 =?utf-8?B?SmtRcGNUVXBQaThDUmZRQmRYN1pta3E3d0N5VGQ5T09ZZEZIMHFQU2lvSGRS?=
 =?utf-8?B?VmZHcGVoTkpja3hIc3MvTTB0OHM2Y3RWaGhNTjB2d3ZCVEJZdTZGdHo4QWUv?=
 =?utf-8?B?ZDlwVm8wenFvNHZZN0VzMFk0Y2F5MlpEUFh1a2ZzMEpROGlHVm1uNy91Uk9L?=
 =?utf-8?B?RU9ZL1BVZ0lrWUNVZE9vQ2JzUEZLRmJKUXdvcmVISzZISG1rNHVwV3UzdFJ3?=
 =?utf-8?B?Ylh6Z05mK1g0NHpwV1NIcTVIcHk1Rk9xS1ZEYUxTOWQ4dmZHclpLeHFrWVFW?=
 =?utf-8?B?MzlTNGhCN1dnMG1Ldk1KYklrWlBEdEpFZFFIMkxsZkNDbTNCUlNJQWFCNWpz?=
 =?utf-8?B?TXJiKzdRWFBtL0p6YjFxRUdzTXAzNEJWZkdsMEt2OWltUXRpeXE5ZnBWOGY3?=
 =?utf-8?B?WDVJYjc5dHZyS3FPZG5LZ1h0dEVoZllNUTFwbXREWUFxanFXMUxEbVViK1ho?=
 =?utf-8?B?K1JmdUhub291c0YrYlAvbzhlTDdrb2xqam1pd2o0aFJiRnRjcUw0TnBmWlVY?=
 =?utf-8?B?NkdrMUIxcGxTdFBMVk1wMjJ6bkNvYitZQWFENkNZZTBtYUpkc2lPdTRwb1N3?=
 =?utf-8?B?ZDNObTMxdWhFc29KbHQ1Umd4TkgzbEVaSVpISVBKYXRuU2hWazFDTzlaQ2g1?=
 =?utf-8?B?Z1FBRlppQkNOYjBYRFBJQk1PbnhJQXJhN3VMemZuaW9DNHdPb2pEQ1NuQzUz?=
 =?utf-8?B?Y3czSmRnZVVQQStZQThFc2hQRW9PMjBHZWNMQVNpZFdKNXJrdStFWGJ3T21t?=
 =?utf-8?B?cVdobWVkVldEMS9iaTJCME1zVHloRW8xSUJ6dkhOZmF5Mlk5eVNaUjBZUnZu?=
 =?utf-8?B?STBTTWdEK0cxQlFBd1BFRS9Qa1RyVDlmQWVxWml2UlAvK0pYT1ZjMEVzY3Nv?=
 =?utf-8?B?NkhnS0ZkWUE5UFZyTG9EWVp2OXlLYUpQd0ZrQlR2UFd1N3QrenFCMVBQN2lh?=
 =?utf-8?B?ZWZid1VaRFRXdGpZZFRld3dINWJQYzJzSTRBMlE0clgrNG5WNXM5K0dtWXFT?=
 =?utf-8?B?d0laTlcwVnhTL3dTL2RYRW9PWXRCSjVoM3h6WG9maE5hYXBWYjhuaTlnQXB6?=
 =?utf-8?B?UmwyWlFQZ1BSTUltR1VlT0ZKZXFLejN0K0IyVWx1SnM2RFhaL1hPY2Z5WEgr?=
 =?utf-8?B?czU3Vm8zMTJPbGxia2ZzUVVoLzl3UjRkeStZWXpONU9CRjhOQzRYVlZsZkdt?=
 =?utf-8?B?bWZMdGF3eHZKc3p1ZTlEck1nZVpKa2pSZHZHYjFOVTFsNDBSeWlyYzF0VjV1?=
 =?utf-8?B?SGFFZHFYYXFoMnZvdXprblNMU0hValU2SDdQZEY4U0laNzJaN01saE1lcDFZ?=
 =?utf-8?B?MW9BNnRCcVJDZFgzVWpNL01uSGg3SzFyNjJ4Q0hWOSszaVljcVNBclcwR3pE?=
 =?utf-8?B?dUdBWVRxV2FnaFlnS0xOT3VMWjNzQTNIelFvWHg1OXpybm9tY09XQWdlMGJP?=
 =?utf-8?B?U2o5Yy95R3E3Q0RWRk14bjRiRG5UTU52QnhpbGVUSmptUHVEZkJkZHZvU0p4?=
 =?utf-8?B?dm9pWndaSU0zcFRDT0gxYmhLME9uWW5Ra2dqU096OWsvczhnaE9nbVFlVWtm?=
 =?utf-8?B?UjhPd1lpQ1dpbWNLcURON1BiOVFhbWZzOXRXdkd1SFNxR2RQWTNDRGRjYy85?=
 =?utf-8?B?NjBYYWl2b1paYldHVUlzODJkNVk4eXdWYUVoQkYrbGt5cWQxeThyRmZZT2RJ?=
 =?utf-8?B?WlA5VWNaRUROTlFLOUdQU0FWbUQxL3pjTUh1VnZRSFhVTlZoK2o0WklhVEZq?=
 =?utf-8?B?a0crUEpFRlBrblZsUGpsVzZRTHlZTHNYWTNtODNRc1FndDAyWWNQZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194f503c-8923-4135-2dad-08dedc07281b
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 09:07:23.0108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRtr4ftkmsY1iQ0FVru0//PNzRbQJ+hV7zYl/snNmOS+fBrh16328pvLlCTs0Hvl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020734_172031_B0C334EF 
X-CRM114-Status: GOOD (  12.84  )
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

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> ---
>   .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 36 +++++++++----------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> index 44834bf1c19c..52954761c9f3 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> @@ -218,23 +218,23 @@ &pinctrl0 {
>   	status = "okay";
>   
>   	pinctrl_gpio0_default: gpio0-default {
> -                conf {
> -                        groups = "gpio0_38_grp";
> -                        bias-pull-up;
> -                        power-source = <IO_STANDARD_LVCMOS18>;
> -                };
> +		conf {
> +			groups = "gpio0_38_grp";
> +			bias-pull-up;
> +			power-source = <IO_STANDARD_LVCMOS18>;
> +		};
>   
> -                mux {
> -                        groups = "gpio0_38_grp";
> -                        function = "gpio0";
> -                };
> +		mux {
> +			groups = "gpio0_38_grp";
> +			function = "gpio0";
> +		};
>   
> -                conf-tx {
> -                        pins = "MIO38";
> -                        bias-disable;
> -                        output-enable;
> -                };
> -        };
> +		conf-tx {
> +			pins = "MIO38";
> +			bias-disable;
> +			output-enable;
> +		};
> +	};
>   
>   	pinctrl_uart1_default: uart1-default {
>   		conf {
> @@ -392,9 +392,9 @@ mux {
>   };
>   
>   &gpio {
> -        status = "okay";
> -        pinctrl-names = "default";
> -        pinctrl-0 = <&pinctrl_gpio0_default>;
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpio0_default>;
>   };
>   
>   &uart1 {


