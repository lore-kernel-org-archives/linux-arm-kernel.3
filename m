Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpTBnDS+NqaPdCFKtC6WVW+BDxrRSpTB897l9EhNrg0=; b=ukrIprWqzncgKZFfaV8TJUUY2w
	AzxhOmw01eqeZYveheGqDx6h8c2DmT5lGfmyVWWvauWJcyC9EUqdu/Rltr1DR9QvGvpWJpwx/2vBt
	Cj3rSP8e0Qje8FclQFeBX20jzu5obTfUJ3g7hHR97Z52FQ8Jxqqu8za/wpvgTxLL1MtQWl3xTM7Iu
	WFbcDizDGB3dXB51TnHdhSfCZRQf+nmqFSBs5ryKeBNU+R8Y9gWvHDV74qh21wsq6hO1sVyhWZvno
	YGNGjPOsmYt9FmYqFYENVuGPS/cSlHOA2KGFg0lMuMeQ6R1icdmXQ//nVMuub5Kg8gIsEOQx2pQUR
	RX+2XloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNhf-0000000GcsQ-3HMz;
	Wed, 08 Jul 2026 08:32:23 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNhd-0000000Gcs1-0qSu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:32:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqBLAXktZWsTfDuXwlVKiBvjFbNlreuItg5mWiNMx+QAHAt+ksJ4ikwt0xwkd63lX725BWIT3SpdNN6Ofh2bEpzSR5Rv9vUtAmCiJOB80zAI5FoEw6z8/02op2OSd89FaeMCwMjmg+dbFUSKeysP+uxfIIah4UkcH56kD6HasZ9XdmbBWBvoV9aTBgBE1wLpp7TdgcpTZQeck4VHnP+nUlNoZxRbzW1aZWTQkHbln6iX85T39U+dr6p51jx1yT9TdNu05ZLJe2gjfaYqt5pFNEKBoA3bob3LoMnY7IWYx7y3SxDHgqplRipwhLIj6MPZ3Hd+2XwtBpzsgYX9b/tNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpTBnDS+NqaPdCFKtC6WVW+BDxrRSpTB897l9EhNrg0=;
 b=mjW+Erk5B0TMAOuZ1s0kSFY7kRqCgnyIsC5PJ2GRPMPpyT3lmrixCXockgKkbsaXeo4chzr7BmbxKu5FGWP7ZMob5hTsxxNdX/jlFaMSnAe/FRa++esIXvnDyDbTXK+FXGAeT61UytFTFNl+L4YakP/DjmlgpOMcrKj5qLbaUqmQVu1mSt4ICnygLQGnT34/btb0maHUHIiBIseYqBg/eOkEfzWqPnLIm79Jx+F3vDLNEx/1yODUVeEYNSRquA725rwyL9nQDZFNZIGaNm7FvR0ktI1SUhq9O6AzctPzWrow4O6TUEfoxQdDWTs2aWxvf+SCKEHzHHUoX5YqEhzYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpTBnDS+NqaPdCFKtC6WVW+BDxrRSpTB897l9EhNrg0=;
 b=aptDPmyEVNaxSP6S1VHfB7ROvVKzzonx01EJZQ9nr2lXH+JNa3XXTU9iG+9liuF/g+xzHOP456PwyyaQlsVluBgojpvz8X6dz0zkqvh2O4855blJZG21EIZ4UAZ2sUebmI50i01Y2PWMY0XEZyK49y3qkvuxET2t6GfEYE3Zb/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH8PR12MB7423.namprd12.prod.outlook.com (2603:10b6:510:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 08:32:15 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 08:32:14 +0000
Message-ID: <8fd82de0-7f1c-4ea5-bcd4-5c76428e3e9c@amd.com>
Date: Wed, 8 Jul 2026 10:32:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: xilinx: zynqmp-sck: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260706093404.273569-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260706093404.273569-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH8PR12MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c27cac-7a30-445b-1282-08dedccb69d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|18002099003|11063799006|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: gvyPFsEp/8KpWB2oECgnLd1VMpJ8QHH3Wy6ugBG36rSjcQxYAdDaP20OysJDa7mn9OLmzhd6r81FW1tdhOEfvgyxTc2rqvyLfXMtpcyRCsvl8kS40CNuLvFwLhw5BkKnROSDGSTTGTYdbqiC2tNornbxTOB7+IvWxCF3wd92/aN+u+Er/sNpA3wT/3xR7sHTCOQUtvXEeBlJEcG+zxCbBm04dzfRoT3JgBVkWrAvZkPjshrZsozvlfs9MqqUMpG/vWFh4LNbfPn00kjZlH6C2EPh6VlEfFJJzACM1rhWeIXWCwSxhqY1zC8CTdJ60WFCxnhbG3sL5oFT39YDTkJSOaGjXUnep5+Bzy9G4HF8TeLCF9Lt/ijKOTVv8YfHabClMtmBBqr9ABeHNQktXPRkqtOAoGv0uXQySP4/hx2I2nCRq6w6kC/tRPTD3TBr5msWdn5cjr4L8djA1b6CFi+xv12ow0VsLKUGLmfIoMnnoUtuHJqirIROT26fcd4vVR7k3X+wQesYgDLqj0dgljNnzbb5iaPfXlm/hotLCk+PCBzMpQ10SkhRgSGcqrDCpsHHpE+PMfuDVW4asvh528Oc7wvcl5rbuQaElJARBq6m630vSnHFk9pxhKouFe9xygtwX4Q/nMY/Ae1UNYv+zj98AWuv/PmCtLSRWpX8zi/NRA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(18002099003)(11063799006)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVIwYnZVdndnZjVUM0tVbW5PNVdHOHJ3OUVoRFVwNGJVUGZSSmNrZlVlNm9m?=
 =?utf-8?B?M1Q4aFNzSHZZNW1VRy9zd0pLRVJoaC9UK01oWmFsUTZraGErYUxGYmZMUktB?=
 =?utf-8?B?YzRqRmVNQ2R5RGVBMWJyaVZNWDJocDJwU2hrQTBZL2htbm5sWnJFV09yOVMv?=
 =?utf-8?B?SVdMeDM4dy9pR2M0WlV2SFpOR0VnWHdIbU9LRUU1YWtqdG9mdnpUNGdqdmdU?=
 =?utf-8?B?Uk5hZWx0MjBab2JmRFJONDlzMXR4cVJQTWtZVDl5MVlxbFZRWlpDT2gwdnlH?=
 =?utf-8?B?SUUxZlFkZnc5VjJRaFVlRnlhWjQrc0VOUGxOa2lDMEQ3YXcvNmZYS0xrZ3Fk?=
 =?utf-8?B?VUJONmtUaU5nc1NydENYUTU5Z2lvU253NW9qTnRyb2M5endGSFRUaTVoWkxW?=
 =?utf-8?B?RGcvdFRxUHBRaFdjdFFUZlEvMEhUQlM5aG9vcHhSR2NrRE0wZldRcXJRemZD?=
 =?utf-8?B?T29SWkZuWmtFV3NaRUFYbGNBYjAzSEZlTjlLQTBLYnNqYlo3NkQ3NFVNcTY3?=
 =?utf-8?B?WUs3SHExNU1ocHA5MXFxRzdBNk1tak1rejdCWjJodUFpbEp6ZmhzdGJNOC96?=
 =?utf-8?B?dnJ2UkMvKzVXaGZqRTRXVXNjZ0wvMWhXdFJaTXBWR1lwR2w2MDNyWFc4bzRS?=
 =?utf-8?B?ZW5kamRVL3lHVFN2amRRYXM2eWg2cG9vZ2lQakxpY3cra2c5eHcwQWJNYVAx?=
 =?utf-8?B?SW9BQ0FLM1VxaHhYRm9TQkZwZlkya1ZVblppTkQrNlA4UVdsK3FwT1RySmhQ?=
 =?utf-8?B?YXIrSGZaZFNSbmhTbWVYMXB2QklvbGl3SUcxYzEzZlZJUEV3ZXgyck4veGdN?=
 =?utf-8?B?aVlZR2tIZ2s4RmpMbjRUYjRtMnFxdUErUTkrNytqWkJ1azVhSGFkMmc0U3E4?=
 =?utf-8?B?N1g5dmFEay9QWGNKa3ZjbE52TG42QkRjd0ZadFFkSjQzVHRhallDcFozbkVX?=
 =?utf-8?B?aHk1TlZDbmluR0trTDVDeExrVXhsRVJPTFBRYjRrb1ZMajZwUmQ5b255QTgr?=
 =?utf-8?B?bzNIdlNyanFoNE8wUXdEZ1BaRnQ1QUgvVGxWRVo4RWlIQ2dSUkxEdUkxNE5l?=
 =?utf-8?B?TTZHN1JSbzFIT3NqR2M2UFd3K2JUQ0hybHBMOERwNjZwOVJ3NjJLclJ6clpV?=
 =?utf-8?B?Z3owczBKWWRHaGFOa3pJNmZyNnROYmxNZ0phelpEazYzTVVvWTFoZGdJZmxM?=
 =?utf-8?B?c083RkhoNXZIMjhSdDNoSDdXTFhmSWVwcFcyZmRCM1ZsL3ZnblVVR1l1aTZj?=
 =?utf-8?B?b2ZkMEsvWjMrWnhWcnNLd3VDa3Z6Y2FLSlRYNEJvUkZaVjBQSDZWVkczVFJT?=
 =?utf-8?B?a05jNVIxcVhzMVM3SVVKWlRFcmNieUV3SWlOemlsOTJzbWViQ04rd1hBOTBq?=
 =?utf-8?B?NUZ4RUR5b0NrbGZTTWMza2M3WEVuMXZLZEd3ZUdBbFFqZ2VkV2Y5VGhpeGhq?=
 =?utf-8?B?NHpIc3hqaTQxY0FCUGp3YVVSVlhDYVFsQ0hVRGNmd0NtY0ZOZ3Mwc2xxRlBJ?=
 =?utf-8?B?M0JMNnFnVkFYV01NNXpaancwMUFBeStDZDNjZTd0VFFNZWFFRUhpU1Z1NW9Y?=
 =?utf-8?B?TEpiZHVPUEVkSXFxb01XWW15dXA5U3g0bVNJcFI4QnRNUjBNUHlHSG9CSmtP?=
 =?utf-8?B?ODlicCs1TTZBUVg3Y0RWWXc5Vkg5VjE5c0F5WTNrcW43L2ExWitDY3UwTGcx?=
 =?utf-8?B?Y3lNTUVkQ1JaZnd1YS9sOTFaQXZrNElDL1NHb1FONWFuNTVIMnNiWW9DZ1Az?=
 =?utf-8?B?dEkzNkVUWFdnK0F1MEJpdjluZkdLUHhiRTNVdXB3cDFnS0ltcFNHTkN4NHpk?=
 =?utf-8?B?cjBhY1Y2em0vT2hUK2Q4VjllQWxtNXYyS1JPTWNOVVNnVXY1WlhKWW5maEdV?=
 =?utf-8?B?RjVRM3ptZTNkamlJWmZpazdQNVlrR2tkQnQ4dTBlMEpGTXdxc1lnbXlRMHJu?=
 =?utf-8?B?eDlIZUpJOXJNczVvUGVDd1VVaGp1UTRnZ0Jyb216OHFIMlVrb0o5VWR3MXBV?=
 =?utf-8?B?OURmVEdma2xETXp2VXRRZnlPSFFyc1dYcndWZzZqUFFGRUVhdjBvdnJNdEZ5?=
 =?utf-8?B?QTE1YklnekpHYmE2bzg2MHlVMWlQSm5LWk45OFFRZXpkNk9yMFRlT0dKTk5X?=
 =?utf-8?B?eC9ML3E0MFIwSmlMRGNwejhEMmt3TDJiRkU1aWZaNXBVck8vcXgrZlVvSXJs?=
 =?utf-8?B?T0UrYkljV09JUC9hUHh2N1FMdklrUmk5ZTM0M3NxNloxMGk2QUViWU5wSEhW?=
 =?utf-8?B?ZDJrZG94TmowRXJLbE1KOVY5WmYyOTlxcFlvREg2cnI2YzVvNDZLWm5xUjlX?=
 =?utf-8?B?WFdZT0VqUXY1ZG5tV2ZHY0c2Z3U0UHVYVm8zRzVaSTRJTnprWTByZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c27cac-7a30-445b-1282-08dedccb69d5
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:32:14.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9m8Av86dQRFCWLgvUBA3rsiHPE77dcwZgBSbdATIf/gx6nU5eRBYiCImGYxcn7Ag
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7423
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_013221_387312_89B53DAB 
X-CRM114-Status: GOOD (  13.11  )
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



On 7/6/26 11:34, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

Applied.
M

