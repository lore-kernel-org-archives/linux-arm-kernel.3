Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38540C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+FeOC8FNbJnU0Zh3sgJmTz67V2+iCNeGiwTX6UYpvg=; b=R/Njl4oSQcJWGZXvV+XQZSvGkw
	2r8ZImh3mAC38Pr3KwSAoyuJIgmB7iUjL49lng6LnTE505gjWdr3Hn1Kyo50JbMSLGfa5cf9/EaTY
	DAw+TkqmBCEeUNQvUIOT+CjKD9CQZ2qon8sxrDOUR7HJa1miQCZBHyr+h/KHtr37LM2qYD+/6IcQ4
	0RyfbyB7igOBXjpwCSmJzwH+h0NyLqZliYF1e2q+1TgQ+nOXS+0k1BVg77CbYbgt2dUdAm1rJYM2v
	GA9xPBOjPsV4o78s5OBP8ssN4JV8mtdA6+hIhZhNzgyjWbk5B5ldUbam4aZNeZdrHE0N9rimEh5OU
	KYgu8ObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7R7-0000000E0jU-3vsd;
	Mon, 29 Jun 2026 08:33:49 +0000
Received: from mail-westusazon11010032.outbound.protection.outlook.com ([52.101.85.32] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7R4-0000000E0is-1YZU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:33:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLIK6FV+fg52z/ODrVruEnQMRE8AMn4urGr+JEeFrXOYqIZVms7YTdYUXAzGseLI3RkV3q5fQE764R0zs8vQyPt5CbuHNdlyZHgUleUB6uLg8BNu19jkBn32JeMAnkKj8jFbnfCisbEdl7w5LI4npzQUk/vlTlOan/8x+ZZHOglX2XRmD0vEyD3mOSvptIVJrNmswnZI/vOF/NpeP9uTPUna2A1EfsAOtOrPT9iTgoekLJifowdb8EtEsNevvLXBvMmm6c0pP3U0kyBzXz/FwQ9vmtbYXLsqID2I73xKBbukZeWDjKX46TKmH39LnL5p2cMj9Tt8y9ZA7FioApyyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+FeOC8FNbJnU0Zh3sgJmTz67V2+iCNeGiwTX6UYpvg=;
 b=DFjLarvAKZ5GKs6Dwog0c8ISZe29doGrmRAGQ7HVx7mp2/m4aek/spd8UPaVMmRqWQGECT4my4+S/kolewdElXw2QLrzv08+/u7h4tVOwYQcB9o/fYM6lTF7Otfl12Hlf2v83bPdoTPUN9RksLA86SNL6n6/Xs75PrGDRCE7Q2IUTISyp25bGXw4WAbCYva4nV/kFVuY+6octcBUnmwsnjJDKh6duBT6IPzoX7OQHE78lnbrBC7NThtLyWpIddsg3pMr5OYEMMtGowgHI9rar5InIPv3o2Qyp62URShheqkn/ZEWCtzBFZ2csPlvs6cNEqtZiMindWTYO0kaHAc+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+FeOC8FNbJnU0Zh3sgJmTz67V2+iCNeGiwTX6UYpvg=;
 b=MCPTl0fIy5InxcvPbEf+kyF9n+MoZCHhD2vGEWKTUuif/xDft52MX4z9BpsLL9+C+xJ4tNZ+tHN183uQA42HB8HVyRKqSMBRJW23ADyi/Ncv+D4RGdgbGw68rb09W4AVViY1Rh6mgMCsY+cr3ek/yjaMzkw29C6sFiYM3ht8MQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH8PR12MB9744.namprd12.prod.outlook.com (2603:10b6:610:27a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:33:38 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:33:38 +0000
Message-ID: <f3d32a1e-acab-4fad-bce1-75b1bf564681@amd.com>
Date: Mon, 29 Jun 2026 10:33:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: xilinx: drop bias-high-impedance on SDIO
 CD/WP pins
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: mikko.rapeli@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <e01c8e60e1d9ed68c347f1a3741f89149109d8b7.1780496388.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <e01c8e60e1d9ed68c347f1a3741f89149109d8b7.1780496388.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH8PR12MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: a9954af8-a108-401a-d54e-08ded5b91de6
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: FM3XGhXEHISkVIRA6G6ZGNs/ZwGQepyYJey68VxCNY79GFJo8ryP9umastdtqj55F5bFjYPDTG3wnXRWNyk545TQrwYSodXrRXh9DKME3+X6pMJYNotjW3HdDNdfMnNKnytg5Sha4rO1B+WnAmn9BKtLpHgyyTUxxL6Rym8s3R15GjCx/RiAdaO/u6OXZBfkohaAhJiOopSE+9H952EDX2JeudREbLXFmNo+YnrO8qA2W80GHEMRFGTFR405YogBGYRsTVg0PM7H+vsZ/AaaxNdLnZickuUuZnN5P+scK83JGPr7C1DWvMZXeuE1B+73tVwNW3y9bXJfIC0irITGkKqf215P2jkpmQ3k9erwRO3mbVxkW6gwZg3kgM2sHShXzsrFzk18EJDvcaKUevPQll6lboORYHPjBPSRDuMDoqjktoHsHNnWADYeUg8vKjxtzMoagWpyNngKZ1y70cHrfuyhgPZ8/yQf9fgZZOOzBRtbDVf11aLEF+ZV0ckB3pxfShr21XSCg/qUn/j3itDEqBoAHta4N5TzDyoB56PvIHEetseW4oRXAgBgVl86y5HOBKQmHGuJWaqeBps9hB8nPeatIMGhS/r3F8GxZ8TctCnx5mYqYy6Nha3ySqlJOCpnUbD92AR4N0PKa9dvrf34AVeQ5VXBl6rdglsJoM+THMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTl3OFczWWN5MWo0V1ZOeDRCbjg0RTFGTXlhYWIyYVVQUWF1QkdIWWZDbERQ?=
 =?utf-8?B?cndnU2JYNDd3YkwySWZPek1jU3BJVFlXTHlpR2xZVmswM1B2MmJpS2dvR1NC?=
 =?utf-8?B?MWE1Q2VuV2E3anZGbmJkUm1KZXVjR1pnbTBhdUlSRUVCOTFzV2p5eHEzTEJP?=
 =?utf-8?B?MVRIOEsrSWg3dmptU04xemJkZjFoMTg5bUcrSVlSRS9MbWpnY2dBMmdRdXcr?=
 =?utf-8?B?QzAwa2d0dXR0WHZRc3JNQTJFRmRab1VFZ2JHdnpHbW9ZOG12dnpCOHRzUDNi?=
 =?utf-8?B?eDhqNk9idjZVSmxGYkVKVjNwNEtqdWpKYytLcmpjL1pSdW84VTdRMzIzQTRm?=
 =?utf-8?B?T2JiMUc5VXFKVGlUMldva3JYdmszUytPYTF4Y09DWlpWU3BZcVhURmEzMzh0?=
 =?utf-8?B?RjRHZCthRjN2Y2tneWhBSkZ1M0w2MElUeVRPblpqb3FBWnk3U29xRGFIK2lu?=
 =?utf-8?B?MStBaCtBOW90STZmSVZsTHR0eW5iUjh3ZnFBc3JWS0xVYWtoaldNS21Tck52?=
 =?utf-8?B?cVZkOWhYZkowcmFwMHVQTHQ3cEJMNXZEbXBZbS9MV09YcmVyUDVnL2ttYVFU?=
 =?utf-8?B?MUx5bXd2VzFKTmdqdXUvYTFIc0l2RDZtTkdwOUxiSkhQY0JiVzk3UVcrTThv?=
 =?utf-8?B?SE0xaDhmbURvQkQ2bUtuTEFxN3hXZTZaS1c2SnFoOEgwNGVKcko2cDU1NFFu?=
 =?utf-8?B?YmxpTnRFR3Uwa3REZk13bEFUdk1RMkswaGQ5NTV0ZUcyZVRFdzl1WG1HL1ln?=
 =?utf-8?B?SEg2RlhkNnU4eTgzV0lmSWtCdGtqVnRIaDF1M1ZDazFMcC9xNTh5NFljeWtk?=
 =?utf-8?B?WUFnb1B1SHFZQVZyTDJNdFhRWG1aY0MxVWorcDVUUWhGaTNzUGdnYm5HWURL?=
 =?utf-8?B?d2JQOXZZcG5yK24wMk9JSS9LYTc2KzhZUVF2Zko4bG5YSEwzZkh1cFhaV1BK?=
 =?utf-8?B?QUNRblVmaWwvM0tNZVV5blo1dmZvNm1zalYwaGZLdkI0QW9aUnFFT29PeTB2?=
 =?utf-8?B?UFFDbnlEeFRoaTdEenJGNXRMQTZZaWFFT2lhQk9aRTYxMmdvMEpHanZ5VDc0?=
 =?utf-8?B?MGlmODQ1L2R6N2k2TzB3ZXhwUnV0eDRDZHJrLzFuZTRHbjNyUEV2Y2haTnRs?=
 =?utf-8?B?OXVMcUFEMmxSVWR5S2JZVjRQTlppL01kaEtudTczVjA2Mk1OVXd1bGZzbUVJ?=
 =?utf-8?B?UmVrSVRuUjJaenM4RGtKV0xmcnRnR1pvbUNpaktTdGFCdjM3SVFiL1pUWXV0?=
 =?utf-8?B?SS90NkNsOVJ5U3RaQlVtbndzQ2V3NzEyMm02UVJvejF6MDZXTXk1SnBHNUNu?=
 =?utf-8?B?clJvTkhDck55MGFtTzlkMWR4RGZFR1RPSGJLZUJVYklhNkp6aktkYmZxV3E0?=
 =?utf-8?B?dTZCU2xFNWNyV0Z4L3FXdFc0NW9qcHpONm9vNTJjRG13T2RKNXN5M2pObHVI?=
 =?utf-8?B?N2hOcTQ4VjZ4eHZ2VEV6SFc3N3Y5c2pLVDNUWFUya2k0M0FNVGw2Tk96cERo?=
 =?utf-8?B?eDFnNm5BcGFOazRpbC9VUWllc0VRZkJndzRPRFhReDhlVlNFS3ZaY0hKcE1X?=
 =?utf-8?B?RFZob0tUdFZpNnFZZGdiVDBYakVnUHNuUHJIVGQ5cDJ2TnpYSTFxWHROaEpO?=
 =?utf-8?B?L2VJUDYySVNOb0Fodm11b3NzS0x5dzQ2VWdZeXpHdnBVMTJaRGtsU2lOS3Yx?=
 =?utf-8?B?c3hKL3g0Q3NDbWxJdm41Nk9UNVZaUWpPbXFDWlRubldmWXBUTlRYWktwQzB2?=
 =?utf-8?B?NHJYZlo0M3A0Tk9razNJMks5YlNzTXh2Y0tQOXB5dHVXbVhadi9uTGJQalg2?=
 =?utf-8?B?QXlQTEE5bW5BaWx2Vmp4cDR0VGt4UWRvUDVNTkpyZlFiZW52ODFEZWhSMDdI?=
 =?utf-8?B?RGNPQURXK2JRUGEwNnV0d0hsa2ZOYklmSnZRa2EzU2dnRlBHcEhQRHloeGk0?=
 =?utf-8?B?STJId3JQMkhiOWRjekVBcnJlUTE4SGREU1RQbFNTNkhtSW1YTjNqWXJ6VTZW?=
 =?utf-8?B?YUExNm4raktZNjVRaUdyY0NZUFZnem03UU02OHhnNFdTUU5rd0ZIcDYzck5B?=
 =?utf-8?B?Q1NmdGZ4Tk5sYjBsSnZzdFRCVTQrWitlbUw0UFlWRDVtNzhPUGM5TjB6ZHYv?=
 =?utf-8?B?MEh3TmtVVVJBRjZ2dWd4Yk42WlNQUzF3b2xZUnZ6WnBYdSs0WmJaSk90cllX?=
 =?utf-8?B?MFN0bjF2ajQrcC91eHZVRmdGR2NmV0NIek85TlJVa01Say9jck80Nyt1Umwx?=
 =?utf-8?B?czM0MDlyMjFVMW5uZi9oZFhrb2tNUGpUYlBhdGRYYTNkUmF3eGo4MWhEaEd4?=
 =?utf-8?B?czdBYVk2bUdMaHBOd0NUdFBjZDRzVzRXekRJZDlRb25RMEpIR0NEdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9954af8-a108-401a-d54e-08ded5b91de6
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 08:33:38.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oY0EXODYzSsJdV5pshzoDZNsPb5fpEsUstbkJdz4oj+9MdnmBiM5yN4LG+MslePj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_013346_426392_BC22FD7C 
X-CRM114-Status: GOOD (  14.18  )
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



On 6/3/26 16:19, Michal Simek wrote:
> Since commit 9c105255108b ("pinctrl: pinconf-generic: perform basic
> checks on pincfg properties"), the generic pinconf parser logs an error
> when a pin configuration node specifies more than one bias mode.
> Several ZynqMP boards described SDIO card-detect and write-protect pins
> with both bias-high-impedance and bias-pull-up, which triggers at
> pinctrl probe:
> 
>    generic pinconfig core: /firmware/zynqmp-firmware/pinctrl/.../conf-cd:
>      cannot have multiple bias configurations
> 
> On ZynqMP, bias-high-impedance enables tri-state while bias-pull-up
> enables the internal pull resistor; these are mutually exclusive bias
> settings and only pull-up is needed for CD/WP inputs. Drop the redundant
> bias-high-impedance property and keep bias-pull-up.
> 
> Reported-by: Mikko Rapeli (Linaro) <mikko.rapeli@linaro.org>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221586
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso   | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso   | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts | 4 ----
>   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts      | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts      | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts      | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts      | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts      | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts      | 1 -
>   10 files changed, 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> index 923a70d750bf..44834bf1c19c 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> @@ -374,7 +374,6 @@ conf {
>   
>   		conf-cd {
>   			groups = "sdio1_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> index 563e750b0e08..49732de5fa4b 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> @@ -365,7 +365,6 @@ conf {
>   
>   		conf-cd {
>   			groups = "sdio1_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
> index 6aff22d43361..f57987dad50f 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
> @@ -270,7 +270,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio0_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> @@ -283,7 +282,6 @@ mux-wp {
>   
>   		conf-wp {
>   			groups = "sdio0_wp_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> @@ -310,7 +308,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio1_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> @@ -323,7 +320,6 @@ mux-wp {
>   
>   		conf-wp {
>   			groups = "sdio1_wp_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
> index 53aa3dca1dca..737d445dc16b 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
> @@ -270,7 +270,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio0_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> @@ -283,7 +282,6 @@ mux-wp {
>   
>   		conf-wp {
>   			groups = "sdio0_wp_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index 4ec8a400494e..41f312a82bb4 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -320,7 +320,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio0_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> index e172a30e7b21..a5bc521ab679 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> @@ -896,7 +896,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio1_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> @@ -909,7 +908,6 @@ mux-wp {
>   
>   		conf-wp {
>   			groups = "sdio1_wp_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
> index fe8f151ed706..32509083e54f 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
> @@ -359,7 +359,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio1_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
> index 3ee8ab224722..96699be8430f 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
> @@ -371,7 +371,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio1_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> index 7f6c87d4d77e..52441e5c8739 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> @@ -895,7 +895,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio1_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> @@ -908,7 +907,6 @@ mux-wp {
>   
>   		conf-wp {
>   			groups = "sdio1_wp_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> index 428b5558fbba..b34e4c93d249 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> @@ -750,7 +750,6 @@ mux-cd {
>   
>   		conf-cd {
>   			groups = "sdio1_cd_0_grp";
> -			bias-high-impedance;
>   			bias-pull-up;
>   			slew-rate = <SLEW_RATE_SLOW>;
>   			power-source = <IO_STANDARD_LVCMOS18>;

Applied.
M

