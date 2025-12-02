Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790E7CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmARQq2Qn5nk61W1GjKlD6ChM/kyZ2N/SdRMZgQYV0c=; b=FqLD9T1uWQOahgdbhBcxdOg9S9
	uoAgsO6mqLGpwb8cmSSAT5Mvgvos9M2LRVoCRa4wtMom8+0/oC6myMk6J+onlWqpsNzxyonxKgawU
	jY0xec0vEphSYR3VQk082CbEzwVK4zfGyvVdznU9RKSSRUVZm7VCuUSC3DlPTYIuT0Lob8Jb5XEsh
	wVAYFX8l2lMK+JVx8mSMhUuAkKVJ7SxH+Nv2bpf+2IZk3k4zhCG7or+MSCy20kz0LVQjXIaR3YngG
	Z0HhQt58x5t9QIyftTT/7s1Zdo/p8nJFV6soEzKW7NvkZMBTkzt3ruyg2wx9KFawNIATwv5zgDRis
	FRZroUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQYX-00000005RlK-3mYX;
	Tue, 02 Dec 2025 13:36:37 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQYV-00000005Rkt-0vgo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:36:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTMgI5v3ydb5YgHQHvzHOLuangOWgiGqORU1F6xKpaA6cQ0Ao2OMcjyrVwQrN25n7Z4z2WrUhxyheLN9msWctdV9FE1vOEq4qQsWEiq3UmnRrbwbSF7X7MUQkQ6FmbTmhD1lx8J2RYXowtO3DB4THQjLDN3JLrRfg0ohDi+3DA3EEvRlgGyHC04R33UoXpdoSUvoU5fJVTTZbPOQEkxKPMWHRoJZKQ2Hj/Q3ved1Gia9y3mSpashmBpKJ93OwEEFXf+kqPfZtMDIeMikS3wF8Tyl3y/M7Sn29y4W/z3xTXh8WMBQhd4MQjcWNUw6vIN+cansZCORDkjxLnLjo1M9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmARQq2Qn5nk61W1GjKlD6ChM/kyZ2N/SdRMZgQYV0c=;
 b=lCpOSaVITlk3tqdNzngXQyqwnhI+MCNH9yoE/viSNzMTol6hp38z/y3J7bR5gSrH0obr3ekGOmmG31+X0A/Rn4l3tsrZgLNprz/k0hWGjS2qAmbsxhhKsw8N09wj2DX6IKxYXIY8vaaJKziJoUboX8FnCmXVloJ9HG0yYHKEsbHyWllYgEePwzGMG3Incg6oWg00hVV2SjfF+BZvlPitXYeugIOVaJ3hnf07wAemLf4sU6/hiq9j0coRnYe2rcTKB7KQJUQ5gMKQnLPqGwGBhi/Ikt2sB4MMUoZhVYPwn0iZGVhX/OtMzyjhR9aQN7F8jsvVt6KWjsKy1RDRw/eKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmARQq2Qn5nk61W1GjKlD6ChM/kyZ2N/SdRMZgQYV0c=;
 b=ru9odXvFBw9hELZjRJZpmZKOiJLgKWA0IQswO4nGM+7KVEPpBeQ4uryKdZb4PtRRLooCjqA5VivGbCKXpb3+Vw8vTCV/U40ybZgg+ZAMBuFmTBQi5CF16xCIkUj07JtQVVPAWIcbHBj/2xytiArptQ1lGBgsIMaPX0iUKernvhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Tue, 2 Dec
 2025 13:36:29 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 13:36:29 +0000
Message-ID: <19d32db7-5ec3-41cc-b0b0-5e90a4447fb4@amd.com>
Date: Tue, 2 Dec 2025 14:36:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/xilinx: replace use of system_unbound_wq with
 system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>
References: <20251104103942.96647-1-marco.crivellari@suse.com>
 <CAAofZF4-D3PT_eE8e4VRX7bCkUV0d9h99YypeYyPhCg+sCFBpw@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAAofZF4-D3PT_eE8e4VRX7bCkUV0d9h99YypeYyPhCg+sCFBpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0214.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::35) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da4b999-ec75-4397-a91f-08de31a7cc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGE1M2pMaDBhRFJPZGF3SldzTHh1akpxTnZ3amp3SVF0eTNhdTBHYWFMaVBi?=
 =?utf-8?B?WHRGRTZwWkJERnIyaUF6UHF5MmpMeWw3bktzdHo1aHBVQzJoVDAyMGJpU1Bn?=
 =?utf-8?B?VnFENGw4czFIbmFleWxLS3VSK2pJU0lQbXJSS29BL3RYektkL1JVcFF1K1hK?=
 =?utf-8?B?ajZpRjE0SENUZk1VUStDdy82akdYTEUxMWdHU01DWE90N203aUxzV3E2cDYy?=
 =?utf-8?B?eWY2bjh3YzhXNjdxaFRBMHlWbG5aVWRGbWw2WVlDVmY0Ti9wN09OcEJCR3dy?=
 =?utf-8?B?K1A0Rk10U05FNFdINDExaWpSZ2FDeFJ0UGlHYUMyTXVNdzJtQ09HRjdCUWFz?=
 =?utf-8?B?L05OMnE2eGNscTU5V21Lb3dXQ1c2aFN5R2EyRE9LWjZUaWFXWkF4c0xFcXR4?=
 =?utf-8?B?akFlQkZtd0ZGeFNEM3ErTEJzVWZuWEU2d3Uxd3ZsZDhZMVpsWmR1ME1rVURv?=
 =?utf-8?B?emdyREJtdVIxTCtNZndnYjU2djlJSjdBV1VBMSt2UXFTaDZOa1ZBS3NBRDZu?=
 =?utf-8?B?eitaMzBMVGdVeGxvVkd4R1NSbWEvTFNlT2NESjRySFlVTEYxMnZmMUZmd0E2?=
 =?utf-8?B?c1d5cU85ZXBLNWtJWFBkUHJNY1krSTZudTZvNnRFVExuWVl5QXczTUZCL045?=
 =?utf-8?B?UXIzbW1LZk80R1d5SmlQN3BBTEJCbFFrb0xaUWFhREgxSzJSeVZVRGh5bFVP?=
 =?utf-8?B?bSsxKzFybUhzTHZPQUJrWGxiRGd1Y3h5ZjB1b3V4SjkwM0w0Mm94RU5CWWhY?=
 =?utf-8?B?bUFwRy9qYW55Ykd4NG03cHRjVnd3VmpidVpvQXBuWitrSDMvc3hPYndpai93?=
 =?utf-8?B?czc3UE1YQ1BYN1FLU2xGaGd3ZCt1REd5M3VZeDVOeVFheXltSVh0OWZnK2Vo?=
 =?utf-8?B?enJhWjdFVFRBUXpoMmoxQ0ZZY0ZWcVlhWml4V2hwRE5MMXlBeWsrZUtFeW5r?=
 =?utf-8?B?aEtoRUEralQxUmNuWVRCZGFhQmEvS2JLV2FEK0lOMWRFOGhCdm96MkVGVWI5?=
 =?utf-8?B?bTBTTC9ULzAxZmJxOWpsL0w5a1VpSXdkUlhKVERxWnlHVXN3N2ovRnBXNGZH?=
 =?utf-8?B?bmJodWdWM2ZmZDJoTk9rUlpISktOVEJyUVRlbk41Y2tNdTAxaDZVSTY4bmFC?=
 =?utf-8?B?NHgxcGlhQnhTMWxqNmYzVzhZZjNTM1RRQ0dDbFl6bE9LanNTK040S1picUlS?=
 =?utf-8?B?dDM2WXdMNTVkdjh1bStIcVVROFkvYVJmS3VZMFdDVUFIdDdOdmRTT3gyckho?=
 =?utf-8?B?ZEhNQ0FDZ2R5UjBrNFlGSVJmZHEwQjVSSENIdTZqNndBUDlHUVlEb0xmR0pS?=
 =?utf-8?B?VThTUkQ5VU9aejA1K1JWOHgwbGt0cjRDTzNZYXdBTHNoQjY2b1gwTFF1OWYz?=
 =?utf-8?B?QXNqS2R1WklSMHZHQ2k0V0hvWG90Ni9yRzd6NVVuVGNSSTN6Z0liN3pLd0Jr?=
 =?utf-8?B?d3EzQStXUmJSQWJDMm9xR0NLUjdadnZVRWQxZ1FjVlZzUUVJL3hLZUVvRXVr?=
 =?utf-8?B?THVDOUMxbUVQUlJ1MDRrVFVpZkttUFFiQjUvNnpIS05QblFJMW5qbHJVQkRo?=
 =?utf-8?B?ZXloNDVHNXloSjh3RVJ5R25tNkp0dEhQalQ1NWtzL0lDdlk5ZjZ4MUo1Lzhx?=
 =?utf-8?B?ek9QV0tpOFVROHNxRmJScmxiYWtFbm45SFEzMDJ4L0JJVTA1YmlkTHFYMGRO?=
 =?utf-8?B?V0Uyd3pxWlBVcHRPaFhBcDdiT2FaRHcyTlIyQ1JsdlNBQjA0WWlmZW44K01W?=
 =?utf-8?B?SW54dFJsd1lrU3F2S1NHejRjZFB4YzlaQ1k1ZitYMk5xRnlXSmt4bGpSOXh6?=
 =?utf-8?B?b09DUGRMVVdFd0E4SmJMSHFyeGRaaExDZXJZVTh2RGhqb1cvSGpmUnQ1MWNS?=
 =?utf-8?B?c3RxbjZWbGdhSlY5SWc2M2tMeGNNOCttN3dVRTlmek9tNEFxZ0ZnczhjdC9Z?=
 =?utf-8?Q?P+9MslrVKf+UM6RUke3jHNiRs0HxtZ0A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmlJL2taSytVd1h1OFdrMDJLNmpvWmxieno0SHpJSU1jRlVoanNXQWxjeTNz?=
 =?utf-8?B?NlhuQ3JBYmhWOUMvOThUd2NtOVZCWXkza05iQ0todzVBb3NsZlFRaW1xNmN4?=
 =?utf-8?B?cGduZmpCNElpdE5pUWZTbWlSRGtYY0YycXJ0aXY4NGRFN0Y1YWtRbE9WRmV6?=
 =?utf-8?B?cmNsMEtseHg0M3hDbVVZcjY5WnVZcHN0NDBnVUtFdEI5aXhjSWpwelFEM1NY?=
 =?utf-8?B?T0ovQk9GK1EralgyNTNlWG11Wlk1OGVuTHVkZVFIQ25JVWhSR1lIemxKRmVF?=
 =?utf-8?B?WmVudGxabnI4b3h0aEljaHkwYWhaU051cWhJWEFBVnhmSTFOcWQvUFIzMFIr?=
 =?utf-8?B?ekxtQk1Oc29teS9ub0x3cEV1eEhaTGlEUjFJczZjK21ibTVZMFkyWVEwZHVn?=
 =?utf-8?B?WGE3NGhaVlV3dU9rSTltSTMwKzdrUDhDZFJYenhRU1U4YWlIaFIzRWQ4RVls?=
 =?utf-8?B?Y3BSZk1pcjVSS0dpSFlJQjdSYkRHbkZILy81Z3Iza1BkVlNOdk9LL3N6ZW1u?=
 =?utf-8?B?TnhQbWowLzIzbTVMNGR0azZZRXZjMERncHBnRllOZFpPTUdpVnFJVE1HdE4v?=
 =?utf-8?B?QS9jVlVzOHRxcXgxTXErZ2pGMndsQTh5K2VOTTJyRGhyMzBWQlJxNTVZWTB3?=
 =?utf-8?B?WTlHSGdUQUZjdERFOC8wYnVKdXNvdmFUemNMOHVGTWpycmJxNzBaNDQ1a05J?=
 =?utf-8?B?eWs5MnVvMEVZVjVrWkhjRjByYlpRZEVUQ0lZY3h4eXdZVnNsVGM3SmZQd3Zw?=
 =?utf-8?B?QVkzYTlFN2pFYjhQVkFsYVQyM1NYOVErd1lQOGpHZ0kzUUdHWHIxYi9IbmdT?=
 =?utf-8?B?bGFOSlFKWkh1VkRKRlZXeWM4cUxFaU51eXlvWS9qN0ZRVndlMmp6eVBiODcv?=
 =?utf-8?B?amI5bWlWTFYzWDJMcTI4Wm0yMWxnaTBoamhCMlZPYVFvdTNESnIzN0daZzB3?=
 =?utf-8?B?WC95YWNFaU05RzF6ZW9RNGE3QXA0dDAzakhRYmZOYU9PdUhvRG41VVZJZVBm?=
 =?utf-8?B?QU5IVThPWUxyd3ZkTUFjUXhMMlZjbUlPU2d0N3FXNFFMN2ZUcStNcGtKd1lF?=
 =?utf-8?B?ZVdsR0ZiMmJvM0hrZHhaMW5RbTQzVVBrcXl1TmlDSHNmblEyM3RYdG1RMFd1?=
 =?utf-8?B?QlVqYUpKK200NngrR1UrdVBqWWNQNXpuZ2ZSeHdKTUtKeWg3T1JZTmtEd3pX?=
 =?utf-8?B?VjNJR3FFbmpacHgzUmhvOGhxK2svZU9tSU1odGxER25pbGp1QVhkdFdGQ3hi?=
 =?utf-8?B?bUxhTE00Q2tIM2dXdDlBNWlFV3NxMGZpTkZ0a1pyNkpreitnSUZraTZoUng2?=
 =?utf-8?B?MU9SY0piSC8xbmhmVVJmbzRCMzQxeW4wcVZla2FmQ08wZjlpcG4zY1lwUXFy?=
 =?utf-8?B?Z0V4Z3FCcDVWelZzdmNrWnJubnR0MXRZOWx3d3QyUGVkcDh3K2tQK0JwSmlz?=
 =?utf-8?B?dTg0N3JQRUh0dlVsdGRzc3dtNFQxdHlFblhpV2lWSDZBdzF4OFlWNmg4U1F5?=
 =?utf-8?B?Um1heDlBWkxKOWtnem5uZ2licEI2cjJ2cHJOOFZSM1JnTElFN1lVaFlkZmor?=
 =?utf-8?B?V3dIdW9HYXhWdVVVajVyU2wxUWQ2dlk4cDZYVE51azAyM01VR3VWa3RnOU1y?=
 =?utf-8?B?aXNYVEp6blJGZlk5WmVtWERydUlTOXkzSm1WcndsY1FUOGF6QlRZMjR5eTZu?=
 =?utf-8?B?R0pPb0o5YVJlZVd1dk90d1pkdUhpZzhNNkxlamQxQXZVd05Hc0liaTY0QlZ3?=
 =?utf-8?B?SStBWUFPTkU4aE56V0NVWVJmdU1VQVV3bnV1QjhqTFBmUGxUSjU3NUkvWm1q?=
 =?utf-8?B?M1pwVFdJbUJRQnR3ak5ObUdFOHR2K2F1THZacHNTVGR4ZGZJUXJCTU5hQ28w?=
 =?utf-8?B?Ym5MSm9wc1c4cjRXYVQ1eW8vK3lSZnR3cTk3QTYzNHZSN0djUzB3WG1ZRWdt?=
 =?utf-8?B?QlB1MS9XR29DTnc5c3B4L2tEVmx4d1FvMmZTaEFoR0dvZ2Z0L1J0a1lGc0Zo?=
 =?utf-8?B?b0VVbjRKdmRDZjkyTHdmZlB4N1J2MXRnMGdDMDlNMW5Bc0ZMS3JPOThlL3Fq?=
 =?utf-8?B?TTlnZ0ZTWGVCT1Y3MGtMbVNRa2N6cFhCT2VwWUFFNzZvRWVmVUlseklINVNt?=
 =?utf-8?Q?DCVb/c7rEfTIB5qVat7m1ww7x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da4b999-ec75-4397-a91f-08de31a7cc36
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 13:36:29.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwgPGB3o6+YuWsOz5/AZ2dtK/n8upyj/294vp2BJ4Ph2WrxtScJ0u0VTTU41isi9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_053635_405208_BEE32DCA 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

On 12/2/25 14:25, Marco Crivellari wrote:
> Hi,
> 
> On Tue, Nov 4, 2025 at 11:39 AM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
>>   drivers/soc/xilinx/zynqmp_power.c | 6 +++---
> 

I will queue it after rc1 tag.

Thanks,
Michal

