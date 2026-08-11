Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB28C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8EzUcXXJNL4x6Gk7H03jm+Rg8w7+zTu14hF743xPMg=; b=EhjPDRvIa8LkDOw/avFus/k40z
	Ym3h48Dd9SsgDwaok5Vo0AwbtD5hQP8d6PHtXuryLVWKIKZPKMjxiI9Q9BVkU2EPdN9G4QNoByTDa
	Zv6AXs+Uu7AJZr4m9zbN2dxfsMHqrG5ggJRLDBFf6DG6vvFmHKU/lvCxsBf8VPdAbFaMzTabtywoN
	pLE3aKWCLShfG4sqB3ouwf3qiVvVaatcS7e2e8AMKRqOH9uLhtM/Kl0xcNi9tpZvDJdlCycYCZPGh
	cpQanSYgc3QEil1uU6OU6Aq8Fh+0TyWCxDtrLKsTo1cyh/xmSwIQuQYnxneP0gjV8DW9AhNnFAg5d
	95LlvC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgpe-0000000DVxt-3uBn;
	Tue, 11 Aug 2026 07:23:30 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgpZ-0000000DVx1-45B2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:23:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHyJYJfhyUGMfNg1YdnMTfS6oUfm+fnC7MtQzr516vC/4Ha22Mog99QE5mOBvTz4U27lHEGdXsr4k5rGD8GxbigDpXZ+uY+VWOGL9QZS4TbYoyrBGGQz2qlWO2vAmmnfNRGgGNo2oodT5UXo3hE1RLFXTcX++BfZ0VBTJbnuQniLF5H/7XR2rYmttoEQ8+fPVb4D2Z4m+I3YtpOZbhwKoRS/PjmlhAHalEXm5g4spqEAsFPKgraQCLqeD/P0HE1yoOirtSd1ZMZ/8iWbcsXhzxFevJ8qGeKjouVGFCh1z/F7gH7ZKI17O4xw31+V6E/JyjX5sbXQhF4gWaeuf5bbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8EzUcXXJNL4x6Gk7H03jm+Rg8w7+zTu14hF743xPMg=;
 b=gr/uVu+zgWhYokkIQ6p5+bAcBPkVpL4NP6peLKJlk3lq5SnhkHCNiAIfF4sKqP2cwq3GQpf5/2nSaMHz2PVVgPSRHgU3QeBLjhMFjxpTdjW1LHxLVVkeo5ZvBPI4vp9kYYqKO630/Kt2CeaAUdgIP3CFsmuuMxwN52rqafOER9aMS9iLUIx+3VxG1hmvlAF9vde9YjoPfl2ThB+9DCh8EWJ5GEikg60jCgX5ECAcKfn33WVX2wgIzIT+/kju1MGLApqBc7pKqXusAWT7dcBZOqNWrp1v7r8RHhlXiK5AMBe7wPIboIpcVABVJ+hkVlOA67C0+Cd2tp0Em2OHt0wXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8EzUcXXJNL4x6Gk7H03jm+Rg8w7+zTu14hF743xPMg=;
 b=RYl/adFV5NfaQkgESM0RWorn0VRr4sOuPFseA0867Hqr1i4zIrtnB7bSRgU3Vyl/19Gety6tx8CwN7GjziAUb4xw5NIjxiyNjvVHRN5srL6lCHmDhGUM240BlYzYsK7M+0wooWMUnWmp0zzhfpsArizDS89zRl6MAp2d3PXR2+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH3PR12MB9026.namprd12.prod.outlook.com (2603:10b6:610:125::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 07:23:12 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 07:23:12 +0000
Message-ID: <48dc79b5-8120-4cb2-9c58-657ef3959e27@amd.com>
Date: Tue, 11 Aug 2026 09:23:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: versal-net: Add retention state for cpu idle
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:610:b0::21) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH3PR12MB9026:EE_
X-MS-Office365-Filtering-Correlation-Id: 628c81e4-e61e-467c-4979-08def77966c9
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sFIFMCmgA9JsZlzAWtXs/azWXSnSLgPPYxaVs+pX1CPmQ0paZ0v6NK90dhSPTCuUUBMlDRU47S7O3NRlzIb5bUupHgQpYF33G1wP0DZPKxPRUqOx5Gt9wGRQ/aXITt6crHk0u8dEqVgt7lS3/pmpJ85YGKGt3rNu3HjZg9Vx/rkgnvDXi5c73Yb/7RGnVDKVfpalg5p7IuF7gq8HPY3pBkpjq2YDfgCECkukeZ7f6M8c+ftBgHF8yQJxK/yHgi4Pa73paeIdVB6U0Z7P8n3w9x2v6jAdMOoYjIhDpR6dyJbx/NaCGdZ47DMt+2Sugj2obAz10oc/LluByVYNiNNhyL5wCf32JvISC/wINcJftIOUu/lHRul1vgmSnhBkLUVYHSFAAd0meOk0sUjnZmi8qmHE7k2Vfg9BUasNdG3Heg+R3p2Dx6+H1b1CmYQaCcj96cdl4d+Gd8TGrjE/j6dmZQjhFPlYMWjMhaJBevIFO9nIc2bnXZHFpP3EEAVTS8VnwEm39c+KeKhbEpyj+7dIc8bLEvd5QvCvZqAF3LUDsGQ/S0kSd6k+0WS7vNhXctOMezV6DceKU1k2NQmt4gex4ubzcOTrQnLnq0gavRdxpkKvDqJGa4Cb4s8zwKtpaTxJ8ocE7wYaZLXskjEPb23t+lKWb/MaOYErVJNRut2i/+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUMyOHhxZTZDcUVXMDJUK1dnWHVYU3grS2dOZEpFN3kyaWIxaFcxcFM1L09Y?=
 =?utf-8?B?cmEvK2ZaZ0I5OCt5WkExbytoeHlYWFN3cUlSc0JMMXZtL0FhWEZsdStwTTRn?=
 =?utf-8?B?Zi9xRHUwb2h0djhQUThFUjN4a1RZY2dHNnc4NFUrbERid3U3VVdwNTBIN3Ju?=
 =?utf-8?B?OSs1a29Ici95WGdEZHBBbXJIbktnelU2WGk1Sld0MnN0OXloL2xnZHR0U0hW?=
 =?utf-8?B?d2cxL0hNNk4wdVNKak55S1JxUU9lbWFvTWJMVFNER3hVaGFQNnJzUVo1cjY3?=
 =?utf-8?B?NHhMR2ZtTUZzMGFCZUoyd0NGSEh5ZUI1NzNUbm5xMlBLeEF1dzEranNodWVz?=
 =?utf-8?B?MWhSZXFiMmE4Z0FSMDJuZHY1RXBWSXFocDZUNWpZZUEwd2V6Z2FISW5nM3JD?=
 =?utf-8?B?aytYWENHclhzZTc3ZTFGcEhEOXZ1V2Jjc2lCYnJ0QTZEZVhFazl6cHRTYXFr?=
 =?utf-8?B?c2RWaHI4NmZkKytsSS9MUVdxaEZjdVJ6VUM5WS84elJSZ0c5NmRIWVdETWJG?=
 =?utf-8?B?dTRUbElRcFgyc0dmbFJ6SzBiOUROeGFXWXRSNW9iWHRqbEtoUm1jdWUxRjNY?=
 =?utf-8?B?MWVpQUwyYzZ4RDE0amJJME5IclYwTmQxbmFZQlF1RXNoWUpwYXAzOEswSHJZ?=
 =?utf-8?B?SmZDLy9ZRkROSnJJam8zb2FEMkMzd2kyb2JmNWdOTVF5cUpuYTFueE1VSG9l?=
 =?utf-8?B?UVFCeWJCdjhYQkh2YnpMaFJSMk43UmF3Z0w4R1JKa05tT2dqa3h3bXkyRWFN?=
 =?utf-8?B?ZHNoYUhlRkQ0NVlBZzFHVTlnK202RGdCbUJ1Y1RBYTVpd3g3Tmx6QTJya3Fw?=
 =?utf-8?B?T2NYdG1vbnhKYnRZOC9TQlRoNFcxd3B6d04xR1o4clBMaUZRQ3dWOEFmTkJt?=
 =?utf-8?B?ek5JZjBkS05kNk8rVzJkMTdwL3RNT1V5bmZVdFdGcVNsR0xPd29EbXJJaVpJ?=
 =?utf-8?B?Wm5aR0RWbWhFYm5SYklqRmhlUTQwMFZNMUt6WHpKY3czNW1yQWF5UFFTcTBs?=
 =?utf-8?B?QUordlNLNEMreXYwWVgyRnJ3Q3prY0Z0WWwwOHBRamY1SkZXVFpPMW0waFpp?=
 =?utf-8?B?TmZFcjVtL3ZRTWUyTjZodXpsNHhyQlJnMzQxMDFldU5PallZem5yaTNza29M?=
 =?utf-8?B?RDZ2MmhlQmJmU09Pa1VoczQvQlo4MHhzNWhmdm1ZQVRrd0tPRkREeUg3aTRz?=
 =?utf-8?B?NFlQTGNGRzIrNUFVWlI4MjF1UGlKbzRkcDdaS1F4QlVrZ1l6TkwxOExkZXdE?=
 =?utf-8?B?M25rVWsvZjFvalNWd09ZVGlTeVpIM2Z0YWFuL0RMd3ROT1pBa0FjbjZGYWZk?=
 =?utf-8?B?RWQrNzRQdTkxeUwzZW9VRFkyZGQydkp3K0tWNGxneThmWWlEM2dSM2FmbUhz?=
 =?utf-8?B?OVcxcm9KbWw5S3VVK1RNMTJnV3dlUUhYVkwxSTkvN3MvVXZmWDZPM1ZNQ1Ja?=
 =?utf-8?B?TmMwWDQ1WWJWcmpkc2lHQ3VBTFBVQkRDWTZTSW5xWEExSVVJNm1kQmpSYXJa?=
 =?utf-8?B?YmYwbzF6L2wwT20vSWpMV2tNODZLWTZjZ0diT3RDNGpZa09YWkF1c3lKMWhB?=
 =?utf-8?B?OHhoL2hrQTA0cG9lWGpPcXE4NCtiN21nM2dGTVhuMEJ6MTN6MVFzQnBEdXM3?=
 =?utf-8?B?ZCs0bXJ3TEVTaHF2TXRaVmlIZm9UNDh0NWpnZGtkTmltRkRRT21jTEFpaVpW?=
 =?utf-8?B?am0yUlI4YlN0NGJFZU4wRi80MlFnWWNVdVNzdE1vaVZWY1E2cnVRS0w0WmNY?=
 =?utf-8?B?TzEwNllXZ3doRDdnR0hXRkkxNjV3ZmJKbnhKMENaRTRiUjllUHhNeVZMZlBW?=
 =?utf-8?B?M2t1RkNJNk8zNS9udkZ4WklMQUZ2aXMvOWVjMjBCUVdyVEttaS9WUmNWWldu?=
 =?utf-8?B?K2JmR1pDUHJBa1BXY3FVRS9PZElTNVNRWHNUVVNrYjhtUno5Y01rMS9BTWRN?=
 =?utf-8?B?S2U4N2ZTVkdqYjNFeXJQUzd4cmtGMTgvNnc2K2JQSFQzUjU1WG1ZTE9kMWFX?=
 =?utf-8?B?MFNObUFmQ1lmcU9yRk1iQ3VMT0Z3TFBzMEVkb2JjRGxvNHhmV1Yvclp1dHJ4?=
 =?utf-8?B?eTBoMC9FNEdxK3IvbGZ0RElmMXZOUGRWUGdaYmdUN2RkUlRaQmVWSitBYVJW?=
 =?utf-8?B?bzA0bmN1ZWRIdVhmaTFJQlpNNFdIQk9IT0NUV1MreTNIN0NaQlBWamFvS3h3?=
 =?utf-8?B?ZW80TGYyaVpXZFRFSnl1cGowc0ppMFdjQ3VxRWFCZGNOcXZoYWtRZ2N3VXhq?=
 =?utf-8?B?dEZ2cEJHWjJlemQzTmJyc1BoV1R5bnBNMXBhZzNOT0F2Z2VnVkI5aVI4NkFH?=
 =?utf-8?B?TmhrS0pOVy9uODZyUUszNFVqbEkzZjJLa0tHVms3M1R3bkRTbWpSQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628c81e4-e61e-467c-4979-08def77966c9
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 07:23:12.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lkgU7s28HEp3LVCukpkqickqSWu2MdK/+O277oKkA1A7EX1WeLQyHBs1ybHRpOV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_002326_097201_FBF0C2F6 
X-CRM114-Status: GOOD (  19.76  )
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



On 7/27/26 14:18, Jay Buddhabhatti wrote:
> Remove the sleep state and replace it with a retention state for CPU idle.
> The sleep state powers down the CPU core, and the wake-up time cannot be
> guaranteed because the firmware may be busy handling other tasks at the time
> of the wake-up request. This leads to unpredictable and potentially high
> wake-up latency during CPU idle.
> 
> Replace the sleep state with a retention state to avoid this dependency on
> firmware. The retention state uses a PSCI suspend parameter of 0: the
> core simply executes WFI and retains its context without being powered off.
> Since wake-up from WFI is handled entirely in hardware, it is effectively
> immediate (a few cycles) and does not depend on firmware availability.
> 
> As the core is not powered down, the local timer is retained and
> "local-timer-stop" is dropped. The entry/exit latency and min-residency
> are set to the nominal minimum (1 us), allowing the cpuidle governor to
> select the state even for very short idle windows.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
>   arch/arm64/boot/dts/xilinx/versal-net.dtsi | 43 +++++++++++-----------
>   1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> index 15f767608e67..792bed588ae1 100644
> --- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> @@ -103,7 +103,7 @@ cpu0: cpu@0 {
>   			enable-method = "psci";
>   			reg = <0>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -133,7 +133,7 @@ cpu100: cpu@100 {
>   			enable-method = "psci";
>   			reg = <0x100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -163,7 +163,7 @@ cpu200: cpu@200 {
>   			enable-method = "psci";
>   			reg = <0x200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -193,7 +193,7 @@ cpu300: cpu@300 {
>   			enable-method = "psci";
>   			reg = <0x300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -223,7 +223,7 @@ cpu10000: cpu@10000 {
>   			enable-method = "psci";
>   			reg = <0x10000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -253,7 +253,7 @@ cpu10100: cpu@10100 {
>   			enable-method = "psci";
>   			reg = <0x10100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -283,7 +283,7 @@ cpu10200: cpu@10200 {
>   			enable-method = "psci";
>   			reg = <0x10200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -313,7 +313,7 @@ cpu10300: cpu@10300 {
>   			enable-method = "psci";
>   			reg = <0x10300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -343,7 +343,7 @@ cpu20000: cpu@20000 {
>   			enable-method = "psci";
>   			reg = <0x20000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -373,7 +373,7 @@ cpu20100: cpu@20100 {
>   			enable-method = "psci";
>   			reg = <0x20100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -403,7 +403,7 @@ cpu20200: cpu@20200 {
>   			enable-method = "psci";
>   			reg = <0x20200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -433,7 +433,7 @@ cpu20300: cpu@20300 {
>   			enable-method = "psci";
>   			reg = <0x20300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -463,7 +463,7 @@ cpu30000: cpu@30000 {
>   			enable-method = "psci";
>   			reg = <0x30000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -493,7 +493,7 @@ cpu30100: cpu@30100 {
>   			enable-method = "psci";
>   			reg = <0x30100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -523,7 +523,7 @@ cpu30200: cpu@30200 {
>   			enable-method = "psci";
>   			reg = <0x30200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -553,7 +553,7 @@ cpu30300: cpu@30300 {
>   			enable-method = "psci";
>   			reg = <0x30300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> +			cpu-idle-states = <&CPU_RETENTION_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -636,13 +636,12 @@ llc: l4-cache { /* LLC inside CMN */
>   		idle-states {
>   			entry-method = "psci";
>   
> -			CPU_SLEEP_0: cpu-sleep-0 {
> +			CPU_RETENTION_0: cpu-retention-0 {
>   				compatible = "arm,idle-state";
> -				arm,psci-suspend-param = <0x40000000>;
> -				local-timer-stop;
> -				entry-latency-us = <300>;
> -				exit-latency-us = <600>;
> -				min-residency-us = <10000>;
> +				arm,psci-suspend-param = <0>;
> +				entry-latency-us = <1>;
> +				exit-latency-us = <1>;
> +				min-residency-us = <1>;
>   			};
>   		};
>   	};

This patch should likely changed because default cpuidle-psci creates wfi 
backend automatically when no DT idle states are detected. Jay is looking into it.

Thanks,
Michal




