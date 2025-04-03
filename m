Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A04C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvKtgygP6tDLWrHRm/ekROFKDqlYkwaxGfzAiJPsyMA=; b=26zS8vMoVGv71tem39/Oojl4Fs
	anzCEDcqdnAxvBxSnOETjZioEPGOdmnXrS2nUHmP1ItpMJjCz2gO7CAYJmlOZST08j4opVYBoRtfw
	gHWb8Z7QFB5k27Qa4HIl2LLXLserlSC8Ju1YgHF0Jae7f+lRbMlm+VlvRvuvZV8vY//eZPKRQAhs7
	5juCn3R979QXRNBAjvr7WTpzyhrssFl2FqWoAuq5ThBHCHfiRjyKoKO6axfhKWK2tFH8shpts87pr
	W+JEU8u+xRYtq3nLHiRLupaS1ElEYcUUm9cUVt9xPi5oxn5PBrm50i6dsjaa3+gdOJR+T99bdtI+g
	VW+9XszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NYf-00000009NQa-2RcF;
	Thu, 03 Apr 2025 16:36:49 +0000
Received: from mail-dm6nam12on20724.outbound.protection.outlook.com ([2a01:111:f403:2417::724] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NWs-00000009NGw-0UHq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 16:34:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+vHy9wRstqS7hxBXrkLppw4GrXSwj2uF4Mc6AxJedcqvezDGLOhEvqHToCVKquJXRiXs3QF94pkkmWcwvSw3Y63eaP219ux0Q2yV1ONz9DeEJMustWspdgwj4ghK9wPcGTV2bdNMgZbCu5J++Ytyd8F18ZigIoaUkRDQfGZPrfDcF45V85y73ecDf6nn7arCz3dy7cJINDqqKq1ZRC+gcIktzMtNzwDs0lX+IdG7sZVbLV68Jag0RdmfzNP9vzGVdMCB5+T5phkY/y5/SSIL8tIZVAZi+BpJrDw+f1teqxjYXS4gNrQDPEI2Oz35uRL3cKnv6HLR0r/NJBf9nenXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvKtgygP6tDLWrHRm/ekROFKDqlYkwaxGfzAiJPsyMA=;
 b=V1Gq8w01GDtk1h/5C4qiRQpySxVjrXPCt4ToSxWDlX6GrEHmHAfaQ8yvCj2qRQQMQjndrxTvrJ9GGeecK8VPJOvWftbVllBbJ8ZMhpdM0dXo3TBpVHfqVsh8EwA9Y9ODPMBcVnOR5MfMtz/kaxO4ZcgXTviLuOYwrqgHK2BoW6dS2Bvj9bYwvTF88awr/Fj8RVjX2RHliaPJJR3MM7/0SOSiHrz3I3rd1pTst3O+NNxtOCUOe6HyD88hCkKByOdRv2YwlMCZeNb7/jboLic2VJf4WQjhJ8k7p6++GZz2eEQ0v/WEdJWml/fba3Z4hvuxtEQi5JMfVhH+0zOTyU8nHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvKtgygP6tDLWrHRm/ekROFKDqlYkwaxGfzAiJPsyMA=;
 b=0NXdXBgpRHY/jLC2tYTvsAwhbF9aZP9IefGVuHx5A8Zs4HwXIgPgL6/Gk9/+JaBrMtyjfIXckjeie9rwJ6PQ79pwz7Z4/iT5vcOmsCgu+zDqp60sEjGNzBVlL5z/hSGrmyyHHNtK4/DShD9ycm9/7p/qL3SOugeiVsBnLvpz+D0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 DS1PR01MB8968.prod.exchangelabs.com (2603:10b6:8:21b::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Thu, 3 Apr 2025 16:34:47 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::3513:ad6e:208c:5dbd]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::3513:ad6e:208c:5dbd%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 16:34:47 +0000
Message-ID: <39ba304d-4a25-435d-a90b-54447a2a59dd@amperemail.onmicrosoft.com>
Date: Thu, 3 Apr 2025 12:34:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: linux-arm-kernel@lists.infradead.org
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-11-4e9922fc2e8e@kernel.org>
 <20250224122507.GE8144@e132581.arm.com>
 <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
 <20250224140317.GF8144@e132581.arm.com>
 <Z7yY19UtSnND5KTl@J2N7QTR9R3.cambridge.arm.com>
 <20250224180301.GI8144@e132581.arm.com>
 <CAL_JsqKNad6eEBerUOco=SDWxdp6dgRD3FDrSt5OpGQYwwstSg@mail.gmail.com>
 <20250225123813.GA1821331@e132581.arm.com>
 <Z74eLRTcVym4sMqh@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <Z74eLRTcVym4sMqh@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:208:32b::35) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|DS1PR01MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1b28bc-0a6e-42ab-5e69-08dd72cd728a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXVKeFgzZnVqTVdLYkFFaUF4NG5zNTE0TlMwNElTR0trNmVsVmxTUTZTK1Aw?=
 =?utf-8?B?cTFCMzNHRzNGYmVMclFOdm1veDNUa2dDa3lsc2o2SktDQngwNXRvck9rdHNC?=
 =?utf-8?B?aGZFL05IV0F5MnhaMVZPaUtGR3JQSUZVYXRMc0ZVRmxrRUlZWFZYMUthTlJu?=
 =?utf-8?B?dHJPS21rbE44dnN5SVdMSyt6amZoamEraWk1YzJBVm1SUFVSV0l2Wjg1ZGFE?=
 =?utf-8?B?SUFVMEY4MTBQTVdKaEJjNmwyNEV6NWJtUmh2ajN4VGNQZUdTQU50MTVOMDRK?=
 =?utf-8?B?OExhN3dGSzlxWjF6dktkaW0wTE1YMXhIK01Lait4RHExWGtKaW5IdWJHUjdD?=
 =?utf-8?B?MXN2WUMwN2hrRFY3VHBRbHB1ZnZNcEYvdm9VV2dCYkpzSjBraGw4MWlqOTh0?=
 =?utf-8?B?d2piWUkxN3JsOFp4NEU1SzNGcytSN0R0V0g0a3lZdmp2MVIvbzFYMTVCZzlo?=
 =?utf-8?B?Rk9iV3BpcGJ1Q280YlNEWldNL1BXZWltckZyVnhxcFhOQzY0WTNkQzBTNno5?=
 =?utf-8?B?Z0VXNHdZZWdkeGRHTXNWK0pCSTBnWmJZNFVIbVczQWVmaXdiTktEZWZxK1JQ?=
 =?utf-8?B?eHVBbkZVM0hndUNsV1V2N3M2SzJFYUdDZzl2ODlQODhPR3J5MEJ5NWVZbTRC?=
 =?utf-8?B?azhSVTJjRktIdG0yMWlWR1NzZFUxUndSa0tyZXFQaHNRYmYvUnlWWlpTcHN6?=
 =?utf-8?B?V3ZlaUZzYUxCODFYQ0xMMFo0clhNVGpMM3JrcUtTUVYybW51dnRxRVYwSGN5?=
 =?utf-8?B?NFZ4UGJZTDVOZzMwQTNTd1NNem5uK20xUE1Xa2FLeHJsMTVxQ1BUMm9FYUpx?=
 =?utf-8?B?RFh2ZFJMY2lseHhZbWV5OTJHYngyVGFaNXdQeDJsU2NtL0w0NGkwTm5RTk0w?=
 =?utf-8?B?K2o0NEM1Y1dBSWV6NG5uZ2I5M3hwcnM5L3crbVRtRzNGb29PL1ZPRDhVa1g2?=
 =?utf-8?B?MHdDbWw1aGJhVWlrckhsOFFXT2pWZHJhYUQ0a202ajB2MURWVTJFekF5WkZH?=
 =?utf-8?B?M2dha2Z1dkhIT2RIVmJma3hZTit0eUN6ekljbG9ZcUVwd2Q4ZUZ6QjlHd3M2?=
 =?utf-8?B?L2N3UTBSVUltZGk4NGZiR1JvV0RQelVMNzFoY1N1Nm04VHhRMFZpSnpqVW45?=
 =?utf-8?B?QXo2bTRZY2xPaE85YmtzQ2tNNnNVaU5HRGszVDRSMzNvMDZnRnRwdllUTGp6?=
 =?utf-8?B?V3NnaEliNFA3dVdMQVRlcU9FNmRGL2tIaCtFMjVCMjBwcDdZZWNrc1JFV2NB?=
 =?utf-8?B?WTQxS1ZHa1VDQmZ5WjhDTDNzK1R2R25helZzeXF3V1F4ZUplR3JqUTBtVGdW?=
 =?utf-8?B?eUdHRm52VHRnaHltbEZJM3VUeFpWbVlGd01xYkg4dDNnRExWY0pQNXdIZVYz?=
 =?utf-8?B?d2pWTlBrMmxUOW5nbFUvd2k1ZVRoNHNNZFNwQnlxaU9KQWxZWWN1Vm4raVlz?=
 =?utf-8?B?L2pPVEdPbk1zQ0xvZFg3UzRmMEVYTmdDdTZ0aGdZckdORkg3alhZUG9MaTVS?=
 =?utf-8?B?eEtWMDA4Y2cyTHdzbEN1ZHZtUUFndTZMWlowNWVUK3FOdUw3clVOL21ZV2Rh?=
 =?utf-8?B?NGYyMTZJYWtEVFhJSGpFV0cxSEgzQXRnQzJXU0xPUTNkSjRoanluUXFJRTJX?=
 =?utf-8?B?Unh2UWt3YUJXQzhFNDl0dzByQWpldEFUVFJ1cHNkcWN6cXdYdmlIYlNGbkJ3?=
 =?utf-8?B?K3VFa2owSTZCY1RucmZSUEtNTmlLeXNjb01yWnVsaXI1NU1UOTFoSXpGbFd2?=
 =?utf-8?B?eW5zTmFPOEpaeEdjTHVVT1R5K2FUM21tUkRScUVocWloNTVxcTJ6cFEvRHFX?=
 =?utf-8?B?ZW9TcnRUU1MyaHdQZWlOL2FxcTNZVEhwNy9hTXhQTlFKa3VjcThhT0RVeExO?=
 =?utf-8?Q?jeRA7Qn+HqYWT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZJNUVyVmxCV2ZqNWF4YXM1aVM3SmlQWE1VREV5eWc1ZkNpSFo3dE4wTHA3?=
 =?utf-8?B?RXlrcnBTa3lCUlNmekNYMDFUVjZpb09WVzU0L3hkR3huN2ZhVCttR0dsTnZS?=
 =?utf-8?B?cklOOEJDRzVkbXZpYW40N0lsaHNrRVNyWWZzallKNnJlSDdpb1VWUGxkSWhy?=
 =?utf-8?B?MHh3MythR05ja290T3JXOURIS2kvcEFhbG9QM2pnYW55WWI2T2JMeFJMbTBL?=
 =?utf-8?B?TEExUUhaaGhTTE5XOEZCbm5NZ0g5dU01UCtROU41Y2lnaVZxMTlsS3d5QnVz?=
 =?utf-8?B?Y1NMNU0xaEJRR3N3Y05aY2JtTC9RRGVzZm5PSFozOWtDOUJYbTcyRGlMZFRW?=
 =?utf-8?B?N1Qzc2dJWnQvTVJHQjlpMHByRStHcjVDT2tCWmhiNHZhbGdWNmJOeWJ1TUJW?=
 =?utf-8?B?RUQreWNzLzZYMVlIMTdOZjhGM0toYXN3d3pObjRtK0N1OXRVczBaZGdqWTdv?=
 =?utf-8?B?RE1YaEE5aUM5YUJOTU5IdXUrMWUya1BMTGhLSi9vMGVzQkZGMmJIc0Q0K3pj?=
 =?utf-8?B?MjNUNGQ2UVhGWjZIOWMxTGtPTkN3K2taS2cwcGlqdy9PUTZpbFFlYk4ycGc0?=
 =?utf-8?B?b21lSHR5ZXcxdXNyUE9FU1pBK1hlc09qTFhoM1BPS1RPRnlwS2FkdnFCNjNH?=
 =?utf-8?B?RGRnS2JydG5tSTlIT0l3QW5MaC8zTS9ndUUvVStOYUxGK003UEhtQ0xDczBT?=
 =?utf-8?B?WEpzeWNib3c0RXk4THBzY1dKUHNFZk90S2QvanRlOXBEelhiQjJDemc5NnU4?=
 =?utf-8?B?Sjh0c0JEektHWUZPRHIxeGMrUG9VQ2VSYm50S0o1YTF5ZEphck9IVDBaWjdi?=
 =?utf-8?B?L2liSGkxSUJIY0xyTklkcHR1K2YwYU8rNmZUTVdnTzRtV3JuTE45c1pFSTdt?=
 =?utf-8?B?ZTZKRGd1T3ZhY1kybEtsNjZRMlVybjh2VjBWYjRRR3NRRWROOC9mTFJhUlJZ?=
 =?utf-8?B?Z0pIUHlvNi9mZVpteHZMbW85RDU0bkZBNldKS0gxaWowN1JnSTU3dmNBZDd0?=
 =?utf-8?B?Vkc3UzFTOTAvUnNKVXhZZmNFV3ZCS1Z2c0QrMnhXTDlxZkRXUHZTUFViUC9Z?=
 =?utf-8?B?S2xsMzJFQVJmVExrb1QxZVlYRDhOT2UrRDkwMVkrSVI2SStOOXN4WlpnM0Jp?=
 =?utf-8?B?c3F3R2k3Y3orM3ZVYkpxNjlSdkVnVXU0d3I4S0NVSjF4MFJpY2tmcFlPWU9p?=
 =?utf-8?B?TmZjM0Qrd1M3R1crcitaN3NFdzVSVnpHNTIweHpkd3JhS0NjUXdLdll6MnhG?=
 =?utf-8?B?VEVzU09uTnF3U0FQR0RaZjR4ajZLV2x3bDZDdU9IV1RIQk5tenJnd3F2eWZv?=
 =?utf-8?B?NjFQNFNCcm5EUU1NWmtFRTlxRnJuczM5bm5iUi9QSE9oSTNpZGlIQmNxTHNl?=
 =?utf-8?B?cGJkNUIvUjY0NlJLQ3VMbzVXRlh3MG9BaGZiY0JuNFZ6eUJsM2ZFbUQyTEJl?=
 =?utf-8?B?WXY0YU9DR3dlSXV3Z1Z5bFJiQUhnd3NuUk9QRmxwMFF4T3Evc2krazMraTU3?=
 =?utf-8?B?a3pYTUQrQXFRU2RuK25PTG5zVUlYOWJKbXBPYnA0OThQTnNOSGQwUVlKWlNS?=
 =?utf-8?B?cWd1R2RUS3JrdnZjaFNKRnpEMGh2V2k0UlN0WFV5akptbXZQcGlTcmR3b1Zw?=
 =?utf-8?B?OU95dFVxeU5Dc3VLOERRMjZNZlVIV0Q0OGFZa0o0VUFOTDIxaWJOL2NRK3NZ?=
 =?utf-8?B?eFNxR2hFRHNrZjVjVEVtcUlpc0JKYVZOYjFWWmlSZU1ETWd6Yk5hcFJqcHcx?=
 =?utf-8?B?eDdYUWk0U0IxQTJxbTByZkJCNU9OM2plUlhsaWVNODZzOTlML09CeGhLbko2?=
 =?utf-8?B?bXg5bWNaSkRPNm9vOFFhelVVNHVQdVc2Nm5BcDFaU2V5RWxNb2RLYUowN0Np?=
 =?utf-8?B?TXVWa3UzZkZFMTdtcy9TNllwNGUvOThSaW9RU0lFV1NkaHlDazZqOUhKeDUx?=
 =?utf-8?B?c0NXbFAxRklWMEtMUFpSRXBoK01vVmZWU2xKajZtQldISHQ4MWhZT1R0RzI1?=
 =?utf-8?B?OTdvRDgyMitVbE5RUDVGMnNUeW5mbnJ3Y29YS0sydjR2emhpU2ZCZmFhSERo?=
 =?utf-8?B?cFBrc3REYTlNRWtWcVorT21CUHhpQlhCR251Qkh4N2IyTVRpRFYrNEdSM2Y1?=
 =?utf-8?B?TFVpTC82aGVRMnhyR3JDQ1dHSnNlaHpDSGtsRjJCMk1lT0hJWXc5Nkp2NFdO?=
 =?utf-8?B?ZVQyMnlsTTBIQnV0dTNoTGdYaHpqeVIrM0RrN3Q5NTZVK01sdWhMQ3hFeTc2?=
 =?utf-8?Q?kRkyMaDKxnZ77GGZhoOJ0EDQOsPriaqAsmujpzDfzc=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1b28bc-0a6e-42ab-5e69-08dd72cd728a
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 16:34:47.3077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Odthc55emvDv0S/+BOhBp2/GrIYPcKAhRpHk7T5U/68MTKSZs6aBAlmhJ+0q1RoY1y8jgYN1WvzUnfUhPimJutSGgJyyJjpNLl5GE1amfBtBpPtNU6oRcAloL3rr418
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR01MB8968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_093458_220137_4D605479 
X-CRM114-Status: GOOD (  34.76  )
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

Is this something we can try to test? I have the ability to set this up 
and test it on a server system in my lab.

If we can't write up a potential test case, it is not testable, and thus 
probably not something to worry about.



On 2/25/25 14:46, Mark Rutland wrote:
> On Tue, Feb 25, 2025 at 12:38:13PM +0000, Leo Yan wrote:
>> On Mon, Feb 24, 2025 at 07:31:52PM -0600, Rob Herring wrote:
>>
>> [...]
>>
>>>>>> When event rotation happens, if without context switch, in theory we
>>>>>> should can directly use the branch record (no invalidation, no injection)
>>>>>> for all events.
>>>>> No; that only works in *some* cases, and will produce incorrect results
>>>>> in others.
>>>>>
>>>>> For example, consider filtering. Imagine a PMU with a single counter,
>>>>> and two events, where event-A filters for calls-and-returns and event-B
>>>>> filters for calls-only. When switching from event-A to event-B, it's
>>>>> theoretically possible to keep the existing records around, knowing that
>>>>> the returns can be filtered out later. When switching from event-B to
>>>>> event-A we cannot keep the existing records, since there are gaps
>>>>> whenever a return should have been recorded.
>>>> Seems to me, the problem is not caused by event rotation.  We need to
>>>> calculate a correct filter in the first place - the BRBE driver should
>>>> calculate a superset for all filters of events for a session.  Then,
>>>> generate branch record based event's specific filter.
>>> The driver doesn't have enough information. If it is told to schedule
>>> event A, it doesn't know anything about event B. It could in theory
>>> try to remember event B if event B had already been scheduled, but it
>>> never knows when event B is gone.
>> E.g., I tried below command for enabling 10 events in a perf session:
>>
>>    perf record -e armv9_nevis/r04/ -e armv9_nevis/r05/ \
>>                -e armv9_nevis/r06/ -e armv9_nevis/r07/ \
>>                -e armv9_nevis/r08/ -e armv9_nevis/r09/ \
>>                -e armv9_nevis/r10/ -e armv9_nevis/r11/ \
>>                -e armv9_nevis/r12/ -e armv9_nevis/r13/ \
>>                -- sleep 1
>>
>> For Arm PMU, the flow below is invoked for every event on every
>> affinied CPU in initialization phase:
>>
>>    armpmu_event_init() {
>>      armv8pmu_set_event_filter();
>>    }
>>
>> Shouldn't we calculate a superset branch filter for all events, store
>> it into a per-CPU data structure and then apply the filter on BRBE?
> Should we? No.
>
> *NONE* of the events in your example are CPU-bound, and the call to
> armpmu_event_init() can happen on an arbitrary CPU which the relevant
> event never actually runs on, while other unrelated events may run on
> that CPU.
>
> It makes no sense for armv8pmu_set_event_filter() to write to a per-cpu
> structure. That's purely there to determine what the filters *should* be
> when *that specific event* is programmed into hardware.
>
> As Rob and I have pointed out already, the *only* thing that can be
> relevant to deciding the configuration of HW filtering is the set of
> events which are *active* on that CPU.
>
>>>>> There are a number of cases of that shape given the set of configurable
>>>>> filters. In theory it's possible to retain those in some cases, but I
>>>>> don't think that the complexity is justified.
>>>>>
>>>>> Similarly, whenever kernel branches are recorded it's necessary to drop
>>>>> the stale branches whenever branch recording is paused, as there's
>>>>> necessarily a blackout period and hence a gap in the records.
>>>> If we save BRBE record when a process is switched out and then restore
>>>> the record when a process is switched in, should we can keep a decent
>>>> branch record for performance profiling?
>>> Keep in mind that there's only 64 branches recorded at most. How many
>>> branches in a context switch plus reconfiguring the PMU? Not a small
>>> percentage of 64 I think. In traces where freeze on overflow was not
>>> working (there's an example in v18), just the interrupt entry until
>>> BRBE was stopped was a significant part of the trace. A context switch
>>> is going to be similar.
>> That is true for kernel mode enabled tracing.  But we will have no
>> such kind noises for userspace only mode tracing.
> As mentioned elsewhere, it's not a problem for x86, so why is it
> magically a problem for arm64?
>
>>>>> Do you have a reason why you think we *must* keep events around?
>>>> Here I am really concerned are cases when a process is preempted or
>>>> migrated.  The driver doesn't save and restore branch records for these
>>>> cases, it just invalidates all records when a task is scheduled in.
>>>>
>>>> As a result, if an event overflow is close to context switch, it is
>>>> likely to capture incomplete branch records.  For a userspace-only
>>>> tracing, it is risk to capture empty branch record after preemption
>>>> and migrations.
>>> There's the same risk if something else is recording kernel branches
>>> when you are recording userspace only. I think the user has to be
>>> aware if other things like context switches are perturbing their data.
>> I am confused for the decription above.  Does it refer to branch
>> recording cross different sessions?  It is fine for me that the branch
>> data is interleaved by different sessions (e.g. one is global tracing
>> and another is only per-thread tracing).
> Imagine that there's an existing process with some pid ${PID}, and
> concurrently, the following commands are run, either by the same user or
> different users with appropriate permissions:
>
> 	# Trying to record user branches only
> 	perf record -j any,u -e cycles -p ${PID}
>
> 	# Trying to record kernel branches only
> 	perf record -j any,k -e cycles -p ${PID}
>
> Whatever you do, the task trying to record user branches only will lose
> some records:
>
> * If we make the events mutually exclusive, the branches will only be
>    recorded when the user event is installed.
>
> * If we merge the HW filters and later apply a SW filter, it's very
>    likely that kernel branches taken after exception entry have filled
>    all the records, and there are no user branches left to sample.
>
>> We might need to consider an intact branch record for the single perf
>> session case.  E.g. if userspace program calls:
>>
>>      func_a -> func_b -> func_c
>>
>> In a case for only userspace tracing, we will have no chance to preserve
>> the call sequence of these functions after the program is switched out.
> If those functions are small, it's very likely that they'll all be in
> the branch history. If they're so large that they're not executed in one
> scheduling quantum, do you expect them to fall within the same event
> period?
>
> I think that you're making a big deal out of an edge case that doesn't
> matter much in practice.
>
> Mark.
>

