Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF14CF6BF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwwAIwOMDKErWtYz7rW77T4taH48Yzda6oLWQgjW+vc=; b=1LS8voECawo5Vp0gYEuRV6/l9s
	dztJ/E2JeYDvf0//8zY4+SP5j0IzkjAMTurFDtiAhUYregqe0hyDK7uGXQDVZzJpiH+yXbZ9hQSjY
	7TpsppXoFUS6/iatsNsNs8h6Y3EH8MKgT6MOfhUMcx5YiacSarjJW4bqX7rkUxjAT0KJygI9eHZT7
	3zN8y7GJz2sOql8FSIYY5Bu04GAICUQ9DfgeosGKV1fiqZ2dtTTMOeG0AayEAPXe5JGFm43NMig8C
	EiDF0NQLKh9Uw7COHDmM24f5+HRkKs4ZQh6KezCvlLqWIin5zx9yWlt3YYWlPH23vtQhfbPRC6BKH
	OYINnOcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOIS-0000000EK1A-2Sh2;
	Wed, 07 Jan 2026 07:49:36 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOIN-0000000EK0M-3is6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:49:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmVXW5+5PwG/HYXt6zZrJKguTTyD8j59NA7Fn6qiyLFhehOAATK9rlkczzqBCPePUc57pFnL56WztDb8HURntIylbIfixU5CWDSCCG9CiDevbg3Hp0WapSWHWMGv3vubteD+fW4qNW2FtYELjPVhP3+Y5KbHmrBGc6J1mrZCI1CoCYg3JZnkJH8DJN66URZJktw6SlipOOUvucAXXrHAjVjOoYDcBZtJAjh3XGdqoOpfoY3JWbLnD5yItU7s8ZKlYbfDbEgLt4Cz8YNsdW+oCwlcvH2RRBT3Mfabt3266Unmf6mbhJKJxkYkAuKQCCwIBakodJFRjYpVS2dlFon/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwwAIwOMDKErWtYz7rW77T4taH48Yzda6oLWQgjW+vc=;
 b=a7/Fratucoy0gA16rS6nFre3b217yYQAJz4cKwrDXSWiNxV4XzT5QtClMNxMv3xibSCIo6bbKFe5lueP5BCh6g5/l/9aFf0nZ9IrkBJN2DXF+bcLVEqQWWJq/kgAK8GC7IMrL+7HhNWLg0eSxguASqoN6/yQT2eYSJfv1oHeumaA8VKkgSDb9q3dDFDPYr0PQSYaWwYR4Z1gmkGr96Pmk4upTfDMZtSAKLR+AUyJyoFNlQS+Ov5U82Ts7fOM9Yw2fCMNh1PQn7Wc1XtZa8VZJWT2z7mS5XiTqIVQJ4lc1wmX+E4/wwtvpNyQX9zOfJE+YkDxp58xlTaIE1OgITD7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwwAIwOMDKErWtYz7rW77T4taH48Yzda6oLWQgjW+vc=;
 b=tyT2/oLbZ22gNG1hwY8/JOtPJVgVcwA5GK084x/ob4dRRvzoFsSxXqfk9ClxDpVfwUTFkINbYVw+9XdL+pc0lETu8p1cnP7eqX4EfqYZWZWhKxNkMcutwNKBQDLCQWOAJ/U54TrBnhodXNwtP2xLxtBd4KEvM6QARgPM37pQDBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 07:49:26 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 07:49:25 +0000
Message-ID: <f514d490-75d8-408e-99ba-ee44916395fc@amd.com>
Date: Wed, 7 Jan 2026 08:49:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Coding Style: Format arch/arm/boot/dts/xilinx
To: kylebonnici <kylebonnici@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kyle Bonnici <kylebonnici@hotmail.com>
References: <20251218125034.248-1-kylebonnici@proton.me>
 <5262fa29-4094-4c5d-be3f-2c73ee322ef6@amd.com>
 <zUWWtNtMhwr9_g1C6mdaGPvyls1-H_tCHfdMuWC35MYUzv88iiaEzS9RTUiucp4QU_RhvuTGiNcl_GV684b6h4-DmdnKPeCLGKB1RHEG6G8=@proton.me>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <zUWWtNtMhwr9_g1C6mdaGPvyls1-H_tCHfdMuWC35MYUzv88iiaEzS9RTUiucp4QU_RhvuTGiNcl_GV684b6h4-DmdnKPeCLGKB1RHEG6G8=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW3PR12MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: 718000b8-f6a0-41d6-eda9-08de4dc14781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzVYZ2xGcFp0bi9pNDcxZkMzdDliTS9SUS9kSlJqK3pHVWcrV1UzamROK3pW?=
 =?utf-8?B?WmVNTGwzbEticGsxdVpRSEd0SEdTWWt0bGd2YkxYRlZmMFdPOVQyVmRQQTd0?=
 =?utf-8?B?OHl2TjN6TGtLUDAybjRrZmdJYU9Cbk9WZjVYaEtidjRyY2ovMjRXMUorVVBO?=
 =?utf-8?B?cVA2czdMdGlTejU0eGRmZkdGSlZpb1BqcmxFZFZwOXN6Q2plQjJra0xvQmVv?=
 =?utf-8?B?b2V3QVppWXpGQy9aR3hlSnlhSnprMnhZdG41Q1MzU2gxM0VPeVVDd3lxMDY4?=
 =?utf-8?B?dzlxRGlhOS9OTmMrdENwWXMvRnZIWS93aG5JQjdwenBpUUptZFgreVNPRThs?=
 =?utf-8?B?dk40QVFLWXRqeGl2YzlaSk1EUEtPbGpkZnBRNlhYMDdEWU5rVUFHRjR6OXhT?=
 =?utf-8?B?Vm0zblM4UDNlWExYaUFXc2dvWmdCTFhnM3hxTFc4TGpaUzBYV2YyZDZydFN6?=
 =?utf-8?B?UFhFbnZTWHFlQTEwcXk3Q3Z2c1lZczlwTjRqWGpXbkVQZGtVaFlKQmNnZFox?=
 =?utf-8?B?N0FGTFJqcEJQd2EyeU04WGZ2MGdReE9GVkxCZVV3TldkMjAyOXFTZ0NFRFZP?=
 =?utf-8?B?SXoycmVscGNMTG1zZU4vR2xJdVR5L1R3QWxDNVZnTFMxSmtrRTBPZmR2WFdZ?=
 =?utf-8?B?OXRyQ1dPb2tKWXNyM3NZZkNiMTVDU0RXcUoyajBLV296Mll4UEhOMGlVbHQ3?=
 =?utf-8?B?MEt2Zk5SWENqZ203RjRBZjdlQzhQOGNaR1FUdlRlT1AxcjJMYndhaFNHRWg4?=
 =?utf-8?B?c29aZGVzQ0IrY3lSWU5va1VyMk9MbnVYZ2lwZndmbGxVOE1KNFp5ZHBZeFhh?=
 =?utf-8?B?a3pLcVlrMmxHRVZqdWFZS2NaNUlkbURvaXJTUzNib2lELzZETFRXNkFaK3V4?=
 =?utf-8?B?ZllVYTluMWp2ZWRCbm55VXBMQXVTaHoyWmVBVGFBNnNTRGdFYUE5c2l5YmI2?=
 =?utf-8?B?d2kvMzZFd1psbjhmMjlnQkhnemgzOWQvY0d1SmU5d2ZieGYyTERRK203Y1Vu?=
 =?utf-8?B?TDlaazJYRXlMczExeFVaeHYzeTV1cU9BaU4xKzdWUWh0R0pyQ0F5ak1MajBG?=
 =?utf-8?B?MEkyNHRnT0RIZjcrR0d1cDN4bHZkUkpFS3J2R3BlMkpvODRpRE1nbWtwbWJk?=
 =?utf-8?B?dWNEWHBTcXlkN1hPVWUxaUdwSlFkV2YrK0NqTlIzeWdRZnpVVHlDeWxHdFBE?=
 =?utf-8?B?ZFpoZUlKYjVtQzdETWJIRkduRDlPK3JxVVMwTFZBWHBHTkR5TUN4UVl6K3dI?=
 =?utf-8?B?dDlFZ1BUSjFucHpCelMvYXBWclJhL1FBMUNRNEpiczdSVk9wU29WNk1lcGtq?=
 =?utf-8?B?Zng5QTVVRXdxRk9iYWxYQk8zNUwvQXBVK3A1UXZXbDltRWFBdnBkenVZeEFn?=
 =?utf-8?B?SVhpdENjU0RNeXd0RXVwZXBDSElUMTY4OG1pUG9CeXpwbE9Ka1FWNlZjNEd4?=
 =?utf-8?B?STNZZWY1emsxY2NPWHhPa3AwanBXcllqUS81S0VGbHA0bTFhNUZmcVBZM0Zm?=
 =?utf-8?B?dlNidTdPSHFvelNhaUxXSEx1cHpKaEZYQ1F2MnFmR1I0MlJZZDBDNjhSM1pU?=
 =?utf-8?B?Tno0a09WUGp4UUtadFRMSlZIRGtzV09pY0RVUmNFd1FnVWZIK3Z1ZU1NUDNy?=
 =?utf-8?B?MEpURHBNdkhCdWxYem5zWkFtUUN3SW85dHJocG5haEpvd2NmalRkQ3lSYUNC?=
 =?utf-8?B?WkJQT255eGI4TWFMazB4dnVZcUxZQVFzRm1UYWhWbmdLblBCajk5MjRUb3Yz?=
 =?utf-8?B?T2U2bTlNblZERVpkWU9UL2VJYnFGbHlwQmczVXpXbm5sMW1lc3hhUjJUWHlW?=
 =?utf-8?B?d2N1WlZKQitaSHU1ejh2R083VkpxQnBNMGl3ckl3d2FaNUdudURLUHFHN0I0?=
 =?utf-8?B?aDYyYm1NanJPOHNBNCtPQkUya2htRVNpMHM5OUZCK01nNit0SE1Sc1g4RDU1?=
 =?utf-8?Q?XfrMCAOWdAgJYBy1CXIGSGfflxp0BsJp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGlZNWFFUzI1T042czByOWZCLzVBQkdOcS9XMWd1OFlYMS9jWG5SMk1JTkMy?=
 =?utf-8?B?WUo1OENhVTlFSHRLSzVFQ2djcTZtYVoyakVNZjM2Z05ycWRTUDh5L29yL0hZ?=
 =?utf-8?B?czMxUHNsN2pyeXdzcVU4YkRzQkx3cHJrTDk3S2toRFlDakpsMWpvcTEzejlv?=
 =?utf-8?B?c05aczBGTS94RWhKUzhkZmNyVGpCZmxzdDRlenNlUWRrRHRZcmxFZko5eUxt?=
 =?utf-8?B?ZHQ3T3lTQzBtK011MC9NbFBVRURwdnBDdlRuaHpneWJjZkU0aWNTSkRZSGlN?=
 =?utf-8?B?ckVxL2RsMDgzZUQwL2JpbjloN0JJeVQyOS81eWkvamhaUTBPaVhrVXQvaGJh?=
 =?utf-8?B?NzY5Mnc5SDNqb0hYckJRcFoyN2dVNmQ0YmpXM0J2Rng1L0lCeXo1R1Nkd3dH?=
 =?utf-8?B?T0xZSmgvYW10ZTNIWjl3S3N4Ti9JSkd0N2xvZjFyNmR5TTBVbmZPSTdwa2dN?=
 =?utf-8?B?SlUzNDQ0NGxUbWxFTklzSXBkaU4ydUxQYlY3dWhEakl1ZVNMNjNQZ3BaaGhh?=
 =?utf-8?B?UXFSWUtQM3FxekNCTTh6WWpNZ3ptdWhqc0RnRGJXYU9UOUovYmhDaGpoQ3NS?=
 =?utf-8?B?emZ5a0FoeTBEVER6SWZvRmRVMGN5NktrOUpmV1loNzhLNmtWYmJJck02S0Nm?=
 =?utf-8?B?UUIyT2NBckxuRHoyaVlsdDJHYnNLOVJhdTBneXJxN1JWalAvSk5INkpOcTIy?=
 =?utf-8?B?bE15Ujg0WGtwS0tzUEtEVUVUVDBpS0dqQ0JiSlM0dXVnamFoKzNOUE81cWs3?=
 =?utf-8?B?ZWlvWFQ2WEpiTzROSFV1OWRSaEFEc2pCVU9NY212V2szcm40bzNEcjgwalJr?=
 =?utf-8?B?QkZmODZ5NDBXcHZtU25CbnZtRnBKY1BHZjRSUEpZb3BkMnZvSXVEZG11WnYz?=
 =?utf-8?B?R0h5TWU5QW5JaU9TUWlaLzRMRHZoMmUxNkJuZnRsRjBxQ3djbjZmTE1XbHdr?=
 =?utf-8?B?SVJOcm5Gdko5MVhBbU1OcW5KL2pHaXYwbHRlOU9iN3BJdy9TdkZoUnZJdUFK?=
 =?utf-8?B?U3J0M3c0bG1DMVd6cWVLaG4yVkV0RUEvR3kwRmgvV1h5cGVER0pYeUJBUnF6?=
 =?utf-8?B?K0pHYVUzVXRUbXo5TGNvNEZObkZJa3JzdXlBQnNjWWhTQ0xXZlIyMlM0cUk4?=
 =?utf-8?B?L2ZVV2ZVOE1uaUc1TmVtcDlQM2NyVzdvMHpCWEl0RUdJU0pFMEI2aTMvYzgv?=
 =?utf-8?B?NGlQRkJnSzFwQmlzMjNjQms5YWZSODAyWmhBN3dsalpkWkdqMm9tWjFiakhV?=
 =?utf-8?B?akpqditmZDFFUVRTMTM5dG5wVUdiQXVwWmlYODNibGd5RWE0TDlMUHd2SlFy?=
 =?utf-8?B?cTZFQU5xcTQ2RURPelI2MkJZeTRSZEVYNDNtK3MzeStTcUEwc3RDczc3Unhp?=
 =?utf-8?B?TndzMXRzUkUzenZJK0VvdW9sd0s1TDBvWGIzUXg4WDFTTXVwN0tvUmMwZ2NJ?=
 =?utf-8?B?aVNyT0xNYWcxRFdPaWxtWlpiWjRWOGhCQ1JWZit0U2xrc0hzM1FKQVFOTFhL?=
 =?utf-8?B?YjM3bEFZZXFVLzhQbFpKRU11Qm8vYVV1RVpGbEc5Y0VCY2ZzTUZ4d1EvejBx?=
 =?utf-8?B?bVllSVBtUXgzb0s1ck9BbUd3d1FtUEZMMDdmQTA0MWVZMU1Ddm04bTZoOS9E?=
 =?utf-8?B?M2VlV3R6R09COUwyWk5iVEdqR1dCTVUrcWp2MGxJelFjSDNsdG0rTFVJOG9s?=
 =?utf-8?B?ck5HOFVtKzd0MHdlMEhyZUxGTnBIWDBCaDN5QTJkSUpyeEJPb2NOMzhLQkc3?=
 =?utf-8?B?aVJ0U0JrbWlEMWZVRWdYMUF1RGdpK0lOWDNaQUg3YjNhbzlBaUVoTUErMVhr?=
 =?utf-8?B?YS90Z3k3SkxYRXBDeHBuYkNXSmJ6RXVPRVFwRUdmUVo2MzJaVWJkN1AxbDRr?=
 =?utf-8?B?WUEvY0h0Mm5RdGlISXNHMXE5d3BtVjlvOWIrMVBhUm1lbDJPVGVrbHEwVXVD?=
 =?utf-8?B?UitwbVBGMHkyZ2ZCakZxNU1HQW5FYzJ3a0o2TlczTUlJWmJKVDZVM2Z2SHZ3?=
 =?utf-8?B?dklwUWdBeHFSMHZCZWdSck1hdWx3NTRaL0k1d3puU01VQnllQU1aUXJsUUpI?=
 =?utf-8?B?RmFTQ09EdVEwd08vMEFaTUV4TFhaWlF2YXdjc1cveVpoMVN2M2FCbVpkcm1B?=
 =?utf-8?B?M3VTdnpZYnpMVkVUY2duVno4ZW1CS090UmJnY0p4T05TOWg2RWVJRytOelRR?=
 =?utf-8?B?VnJPdWlHZHBJUlVQRDNJY3FucnFweDdROC85OEJnY0piQUowQXI2bE1jb2ZX?=
 =?utf-8?B?UXU5eVprL0xOVFB4VTVKVEd1NzhsbVNKWG9rRjNBcXova2x3YjVUS1QwQXhB?=
 =?utf-8?B?eitVRjBYMnJ1QzNPOFU3TlVvRHgvMlFYSWJEQXo2akMwem5FZVdCdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718000b8-f6a0-41d6-eda9-08de4dc14781
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 07:49:25.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKz+5MVtsrlwP6dhQ5kw3DPuXNRQeSzuY/6YyFcp2+cPFjrXTtqhueVOwYfyzfFO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_234932_136660_BC551056 
X-CRM114-Status: GOOD (  12.47  )
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

Hi,

On 1/6/26 21:28, kylebonnici wrote:
> Hi,
> 

first of all please don't do top posting.

> Thanks for the feedback.
> 
> with regard to subject I am not sure in what subsystem file formatting would go (especially if we run it on even more files and more systems are modified) Your guidance would be appreciated.

arm: xilinx:

or for 64 bit version

arm64: xilinx:

> 
> With regard to improving the line wrapping, can you share some examples so that I can start looking on improving this?


run it over zynqmp.dtsi file
And focus on pcie node

  @@ -958,8 +979,10 @@ pcie: pcie@fd0e0000 {
                                <0x0 0xfd480000 0x0 0x1000>,
                                <0x80 0x00000000 0x0 0x10000000>;
                          reg-names = "breg", "pcireg", "cfg";
  -                       ranges = <0x02000000 0x00000000 0xe0000000 0x00000000 
0xe0000000 0x00000000 0x10000000>,/* non-prefetchable memory */
  -                                <0x43000000 0x00000006 0x00000000 0x00000006 
0x00000000 0x00000002 0x00000000>;/* prefetchable memory */
  +                       ranges = <0x02000000 0x00000000 0xe0000000 0x00000000 
0xe0000000 0x00000000
  +                                 0x10000000>,/* non-prefetchable memory */
  +                                <0x43000000 0x00000006 0x00000000 0x00000006 
0x00000000 0x00000002
  +                                 0x00000000>;/* prefetchable memory */
                          bus-range = <0x00 0xff>;

1. sometimes commens are using space,tab or nothing. Same style would be useful.
2. last cell on next line looks weird to me. I think you can decode 
address-cells/size-cells for ranges and do indentation base on it.

> 
> To run on more files I will wait for feedback from Rob, Krzysztof and Conor.

yep.

Thanks,
Michal

