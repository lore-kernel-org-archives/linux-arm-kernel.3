Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C381CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulPH8HgwXBWD8/i84Vo9NL3fux9PAfiIcUdXE4uxmnY=; b=kcxGTCqckqWInrldNiL04rb24/
	jKtdUNdS7tMZwt0lIQWs0Er2TDYUTrCE1OxU4IVSiIHxXi/gQzWOMJ7dq0mGz2/yAfKbxHF6N/3pL
	FHa+V1H1ghDFLj+Cq4lRoLY2iBKk3SrihGKlrbG3luh438iD8jRj0tWVTGnB6EUfWluoYZN80vncw
	nvFYc7PakRYCMoKDZJZRThYCrPJh2wSMcClyWKHMSui0Df7JQQpOHjIunws+5zqkZx3StYvQTP4cy
	WkVrC0ezg7uNps/xMvCQgmhnJ1jeF6hoq3/cEnjfzhlNC2vCaxHe8G2naIQ+lpkLDeO8x8edjiFrv
	8YgcuDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUobK-00000001hMb-0SUE;
	Mon, 06 Jan 2025 15:01:06 +0000
Received: from mail-bn7nam10on20621.outbound.protection.outlook.com ([2a01:111:f403:2009::621] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoT5-00000001fQw-0tI8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEoD4FiIE8jLAJFpVo38ItN88G1NfjJJECPiv1snxsrjneePNwLv0mV8FhywqoU6OQfuXWaVoUMhREa5rKqyXt2dVPvlH0ViOftpue20HbI9s7JHuE2Mb3ijVI2a81nzpYdEmglJnIWwLkPXXo3+iMucvP/7AhQPfJPJvg2m41QDM8QQGrevHPsbqdHdxtGojdJtQUY/X8wyWme7XhnHmCIT3Xj222w53U6hT6QJXSm9cBAHnayUleDT9cZqDmYoIBK99W04O25z/scyBPxOl1P5dOSTGuLBPuac0YWB3vDSxoTW93boDPs0rF1NBSE8i35JCWn2U9rxjc1HI15cug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulPH8HgwXBWD8/i84Vo9NL3fux9PAfiIcUdXE4uxmnY=;
 b=Mar8E1M4rMdxAWEf8sXIYtNFvarTpiXAvpOFql9AqO5FwZHa3D7dDJrDwmtlbSkeEAPHNDgWs8jZGWWEB8Up/k6wh/QWe7BAMhaaoS6Vm8CtLzXBFOciY8+wVGAVzhq51sEUEABM9ygCKGOpyGv3HUOgrWFz6YtMPOpEhbNjoGSmVJqFFdv9YHU7GBGoQVL98SioqK5AYEyf//+8JJ1/GMsFj28wnO5QoV1sqjr9wUKZ9FqMXk5MyWpIu36XZsmA//X7X6qpocFCf4FrclA3BwSOVMkfnZ15Uu7ps3nqj/7Um+hUtj5BS3EZEHOeKeyvzm9LVX2LT5E2uJ58ONnAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulPH8HgwXBWD8/i84Vo9NL3fux9PAfiIcUdXE4uxmnY=;
 b=2cOM2yefCl0HQZptgi24Yoes5aRx0gF6QyrHuOJhicbLRH5y6DO8mhqqF4iVMIxxbz1V0zDXhRu354o+MBnBmgNhxOkzokuD9ilsThdCpMQgHEXQbPx8FfJB3tpGY+Ig9ind8QwlnqsEJHiLQrXgMuiw8u23SCjmu9f9x4uNYbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SA1PR12MB8945.namprd12.prod.outlook.com (2603:10b6:806:375::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 14:52:18 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%3]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 14:52:18 +0000
Message-ID: <aa0d28a0-29ec-4228-8800-4304c8df7e38@amd.com>
Date: Mon, 6 Jan 2025 15:52:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] ARM: zynq: Sync DTs with U-Boot
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <cover.1733920873.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <cover.1733920873.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0037.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::26) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SA1PR12MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db1c951-d991-4ff1-0abc-08dd2e61b735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHRYWWVMeGN4ZUlYYzhtMjB4RUlqZnNKRXFuRjNyS0RMN1FkM1llcDR3TUVY?=
 =?utf-8?B?QmhzRjZOcjJQaGhNaEI2UXIva0RycnBqVCs3cEdHVmNBUUd0N2RuTHlGdUgz?=
 =?utf-8?B?bHMwWXJXdGtOVXZSRDhnZ0UycVZJR0ZYUVJKU0w4Q3M4a1ZxaDRyaFdyZ3pN?=
 =?utf-8?B?QytKY3NOM3dpNHdReTlGRzMybU1Idlo0eEZyenFXYmpPTzVwWjZXd0szOVoz?=
 =?utf-8?B?UzJtUXRIRHU5VktrUWdDMlBwK1FHUVltVmY5eURXYnhlaUVaS3Y5TDJQc3Jw?=
 =?utf-8?B?dUF1b3ZvSEpLazNZOTQrOGU2Q2ZQTmorMzFUV2tOTFM1c3ZmdFQ5M0ZyTi8x?=
 =?utf-8?B?L01NeDJ6dDZnaVhRMERPMEFEQm41VVAxQ1h2dWlYWitVdlo4Qy9JZXBKZFpU?=
 =?utf-8?B?TERNMTlIMG8zY05JWS9NMzdPZGdnZml6TnRBd0dxeHlqTStEaFZxOXQwTU9r?=
 =?utf-8?B?elV3KzhnaUF1MkI5UWpUSGhWNWprYzZkLzB2WEc0aC9ocVdvOGFCcU53ZWlJ?=
 =?utf-8?B?UDNZY1ppSXJndFNpSGN1OEZVQWVNbTE5WmFEMGFEQ21CL244K1FzbzYxU0dT?=
 =?utf-8?B?U2VvZjN0MjFEOStSZ1I0U3cvUWRjdU1LajQzeUo2cGE2Z0JiVzc1WnVIaGZD?=
 =?utf-8?B?cUI1YVpDU0lteGMzS2tjVnU3aTNWbHo0SnFKaTVqQlQvem9remRtSEZBNlNz?=
 =?utf-8?B?VUZLb2czWHk0dURsREl0bnZzSmpGYVQ5NUJHSHEzQlpOYnBvVlBMZ2dMRDA5?=
 =?utf-8?B?VlJkYndIK1FoNG5zV1FFNlRqQXh0akZkMFd1Y1lXTkt5Zzd5Z0hVYzRhYWJO?=
 =?utf-8?B?cDNacHUxMFp4R1V5cC9VWm0wSEw4NVlrNVZtVGsxKy8zbUJrSEZsQXBwSUxG?=
 =?utf-8?B?YytoME5xUlhTeHdBVEcxQ214TWhMb3JEaVNZdmZxTDdhRFZZbWZUM25CbFhH?=
 =?utf-8?B?Vm05TUFWNkxOdFRZZ2ZmRVVyUjh6Zk1kUS9tMHI5QzhuMDF0S2k5bkhNYXV6?=
 =?utf-8?B?N3p6Q29odWx4ajZXWlpFQ1VJU2YrRllhMzJRZGFwUmZrY2NCZVYzTjJYby90?=
 =?utf-8?B?bHVrT2NaZzVMcktDWm1kYk83S05PR0I5UXJJcHdaL2dYWWRuUjBRT01pT2FJ?=
 =?utf-8?B?ckdJOHJBOGxDQTFUcmJIdjFmd0VkWG41ZW11N2pvMDZidjN6TkRtejAzamdo?=
 =?utf-8?B?SFNzclRscFpyU25nNlY5eWlYOHlaUTJKZWd6SVVPWVdxcjNsOTJYUWZpQlYr?=
 =?utf-8?B?MVBrMklZMWRCeEtNejJoWnBEVzMrOENQTGNpeExuSzJmb2V5bWYvWlhzZldp?=
 =?utf-8?B?WVNReXZJOHpNcDhRalhaelltY3BmcktPR2l5b1hLU0JCTG10VEMzVHNDRS9h?=
 =?utf-8?B?ZlNsVEU3cHErcVlxaktyN2YzMWFrRlRtQlhtV1NXQ3BNQmxTdEY0K01Mdlo5?=
 =?utf-8?B?WUV0UTM5bzRQNkdLeU8wd1A5WjgvcG5sczBpNk4xT2c4UEkzcXBkZDdPV2Q4?=
 =?utf-8?B?R0l4NExZaVM4cWloMlAxcEdHWWQ5eEpGbllFYWRZY0xrYkgrZnVQbXNpZUxD?=
 =?utf-8?B?SUNPUTkyeGlpQzBnS3craVY0MVpQdmUyWDIwQU1HaEVTZURxQ21BQitRdTlq?=
 =?utf-8?B?NGZBeDZEQWdyWXNMNjNpdGdhNlRqVnNpaWRNRi9Ua3BHM2RzbFVEeElPZjlJ?=
 =?utf-8?B?N2k0eko2UTJReEpuSFNJanR6eUEyY0JBSEVFbm1QbnA3cXp2V3E0ZGRwL3V0?=
 =?utf-8?B?NlJLVTZsdDFSOHJZTWJKaVdpWmQyekJjMEVsYlA2TGVrcGNKK2RUalpQL245?=
 =?utf-8?B?Ylo0ZGtKdmJ2Rlc0SCt2Nzl0R2FmbmRnU01TU1dxdzh3N2c1VzlmTE9ydDNr?=
 =?utf-8?Q?d1YpQkdV1We1j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a25iUU44UnNFTEUrSGRETHNDT0dweUtIbjgxY2x3TWRUTExFQ1N1NXQ3RWpY?=
 =?utf-8?B?UzJCKzNQL2FPR09KYlVZSjFPTlJqcFNPNTF3QlhmV1pweDk5Vzl0M2o2NVB3?=
 =?utf-8?B?cmFaRlphMlROT1FGdmlTZ2xvdkV0bzBrdUlld0JhU1VYWWFOQzE3aXVpWW1Z?=
 =?utf-8?B?NGp6S2V3Q2NsUGNEK0ZpYzg3OS92NktBcFQxbzhEQkNTSC9MYXphMmRNOHBW?=
 =?utf-8?B?YmpmYjJKQjBDRUI4a3hjZFJMSENraTM5c2lMZzBHUS9VZzBRSExDaU5xY2FG?=
 =?utf-8?B?TkJmRVV0VlJtRlhoblJ0ZWdvajFiWFF3c2MxZDlXVkh1Y081TW1JelZVU3Zr?=
 =?utf-8?B?K09JNHZOU0pKeFU3REVXUS9aSndoZ2pWVXVkcXg3L25JNERmVGUybjA3RWNt?=
 =?utf-8?B?WTJveVZxM1FsSEJXaFZlSHJ4Q3pBWEZwclBaRWh3RXpMckd5eVJINk50OXMv?=
 =?utf-8?B?TjY2c0lrdVN3c3B5MTgrSUVNeDVWSDdidEdzNHc5U1RLOHBmdHdmN2tBZ2JM?=
 =?utf-8?B?RXpYV1V5TFc3TkdwOFROY2huU1AxK0tJbStLU09Nenp3M0VwYjZvNm9sN3Nq?=
 =?utf-8?B?RUMvWGs5N3lqMlRMT1ZlTEFGSThSYVJUdllyOVFEN3h5WjZhOWJ4dmRFS2M1?=
 =?utf-8?B?SlpKOThLdXBEdHZqSGxHbUVPRFVvVlBkSkNJK3dhcDlrSnNCUXBSVWh5dW9L?=
 =?utf-8?B?M3c2aHBOWnI1NkI5ejJMZy9UcFdXc1A5ZHBrSXRBZTZkOEpKRk1LYXp4RjI0?=
 =?utf-8?B?elM1a1M2YmRWaTc1WlBtQ0RUNDFpNms2RGxwM1gzQzZNMzhFUEpkZUgyenJZ?=
 =?utf-8?B?VUpheVJoTjFJNWkxTHMzVGtORVJEaDNkbkloOEczVjRhN29qZ3ZvQXJjclZK?=
 =?utf-8?B?Wnp2VFAzOU51bE8wc3IzWU9GMjRyVGovdDN6R2x0aFZWM0RDbjI3MlVxOFBE?=
 =?utf-8?B?by8yLzZXdDc1Mmo5L0tueVpMUmQ5VkZETmtOZXlTdThUSDhJQ2NGRS9VdWhh?=
 =?utf-8?B?akdkaitESlhUVFkxRmNKR1dkcGJJTlUwK3o1aEc1UnA4Wm1oK1NVRGk1MHFn?=
 =?utf-8?B?cFNITWpoTEVyVkZHa3p1NXBHS01mQlBuMkpsdWJhMDBkL1lZUHI4Yzd4UEVj?=
 =?utf-8?B?WjVrSlU4N0V6OVVaNEFCU3NpOWVaVkYwMStrQWtnVnE4WVF0Q2lwZ0lHR3dq?=
 =?utf-8?B?TzZaakI1ODFGSm15Vy8wTkV2TnZQaDQzQkNhcE04b3pIc0VGdGRaY1FRbFFF?=
 =?utf-8?B?b0RjWkIyQjJMWEVIU0t0QTNBcDVVWmREZTZlRmVWbE5DcWZQWTIycGNGeGRH?=
 =?utf-8?B?Q05NNWJ5YlZMbFNWcWUyVzZqeU90NmFqUkRQYmxZV3hZLzZVR3BSNDErbG8x?=
 =?utf-8?B?QUlEMWhvMEdkZlJRUnhBNDJhQXVDZkZvdEhDMStDbFVJRHFja3BrV1hFUG1k?=
 =?utf-8?B?aTZ4RnE4TXgzMXVTMUNpUWtDYkNkckg1UVljMVdJMXgwMUliVGJOUVBsZHBl?=
 =?utf-8?B?aUlja051YnUyanl6SkxZZUlDVVBTNHhWMEgwYUwrcDJTOTMyTDRVVGNqQkw4?=
 =?utf-8?B?YXExcWh4QTZjSVo1K053MERwWXVLKy85ZDV0cTNNMVh3clI0MHc2RWkzR0ND?=
 =?utf-8?B?S0dNZDB5V0lHY0ZJbTA4S1JCczNFU3o2ZVBtTGs0azhNajFzdWNtTFJZVzBa?=
 =?utf-8?B?WmZjYXFFbUZpMmhtNEVpbmVuQ3ZwemRXdjZoUmtIb3BONzdKVXVFYjUxeWlw?=
 =?utf-8?B?cTZZTkRRN1BxaHhEMG1TbmZWZFQxOVJYdlR1L3c2ZmxHQlN4R2RvTGg1RFFH?=
 =?utf-8?B?NVUxcDlGVlhoZHhrYUtwN0R1SmFOd0ZCbjFPeUJ0V2FnZ0V6UDZrSUZObE9C?=
 =?utf-8?B?anJuZlBOa2NhWVlKa09qT3dqR1psSjk0dENCc1V2Q25adnhpWFo1S1FIbUQ0?=
 =?utf-8?B?ZktLd1ZiT3hJQVVVWFJJeVNGb3RZdjc1MmI4MVdEeHJhMkZPREVnazFncnpR?=
 =?utf-8?B?VWQydGtsZmNTVGV4UGlKTWFDeVVvNTg1Yng1bis1OGFybVN1YlN2ZjljaW1Y?=
 =?utf-8?B?Qi9COFp3WWZNcW5ySmE0Qjdtdk9BL3dEenJubDZqZWdIdkhjNEFDNDNMRXg3?=
 =?utf-8?Q?H4AeJN79PbOCAMcvrzncFBADL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db1c951-d991-4ff1-0abc-08dd2e61b735
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 14:52:17.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdv5lpixnaIklPF2tJOg5/rEGjvhwcZgA1830R7AaBHYk/A1bbJxNrNzq/nMkI4w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_065235_368093_C1593788 
X-CRM114-Status: GOOD (  14.38  )
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



On 12/11/24 13:41, Michal Simek wrote:
> Hi,
> 
> over years there were some changes pushed to U-Boot which were never merged
> back to Linux. U-Boot introduced new option OF_UPSTREAM and start to sync
> up DTs from Linux back to U-Boot.
> This series is addressing differences.
> There are still 3 more differences but they should be addressed separately.
> 
> Thanks,
> Michal
> 
> 
> Michal Simek (14):
>    ARM: zynq: Remove deprecated device_type property
>    ARM: zynq: DT: List OCM memory for all platforms
>    ARM: zynq: Mark boot-phase-specific device nodes
>    ARM: zynq: Do not define address/size-cells for nand-controller
>    ARM: zynq: Wire smcc with nand/nor memories on zc770 platform
>    ARM: zynq: Add ethernet phy reset information to DT(zc702)
>    ARM: zynq: Define u-boot bootscrip addr via DT
>    ARM: zynq: Point via nvmem0 alias to eeprom on zc702/zc706
>    ARM: zynq: Define rtc alias on zc702/zc706
>    ARM: zynq: Rename i2c?-gpio to i2c?-gpio-grp
>    ARM: zynq: Fix fpga region DT nodes name
>    ARM: zynq: Enable QSPIs on platforms
>    ARM: zynq: Add sdhci to alias node
>    ARM: zynq: Remove ethernet0 alias from Microzed
> 
> Sai Krishna Potthuri (1):
>    ARM: zynq: Replace 'io-standard' with 'power-source' property
> 
>   arch/arm/boot/dts/xilinx/zynq-7000.dtsi       | 33 ++++++-
>   arch/arm/boot/dts/xilinx/zynq-cc108.dts       | 41 ++++++++-
>   arch/arm/boot/dts/xilinx/zynq-microzed.dts    | 10 ++-
>   arch/arm/boot/dts/xilinx/zynq-parallella.dts  |  1 -
>   arch/arm/boot/dts/xilinx/zynq-zc702.dts       | 87 +++++++++++++------
>   arch/arm/boot/dts/xilinx/zynq-zc706.dts       | 67 +++++++++++---
>   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts | 39 ++++++++-
>   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts | 31 +++++++
>   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts | 35 ++++++++
>   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts | 41 ++++++++-
>   arch/arm/boot/dts/xilinx/zynq-zed.dts         | 43 ++++++++-
>   .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  8 ++
>   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dts     | 10 ++-
>   arch/arm/boot/dts/xilinx/zynq-zybo.dts        |  9 +-
>   14 files changed, 404 insertions(+), 51 deletions(-)
> 

Applied 1-6, 8-15.
Michal


