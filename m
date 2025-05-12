Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D530FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsfpdBAiNoTFGN9JNkREh5YE5CVOUpqyAIbwFoCZFCg=; b=WHutaDnI5myfuefWn6sDLceWfE
	IHuCMbd0RWeUot6c2sftQYWB6xvpABeRcl4rm4w/DkuWcFvp4RFszuGGvLNcyn781RwWiHtj2lfgy
	t5S3ej3bwCKV7p7EAyFj3Uq68FOUSZ8owlPYG/tby7VT7UJyAMcteBBDEHmKBudUQ6RijrAsGGzn1
	9xgg+Zj0vhTLAxB2dNn60zVJSROT9JaewAptlZyeo7g1tBFD4z2K9pDcd2H69mJVKDVIj63K9Vbxt
	pcWg2GcDKC/QwUWn+8bwsj/+AFjNwwl2QdCwFfbRR90+Xw7IzEcVnnbAIYTNOZ0Jh9tUYDWqMEOva
	q51JN5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQUi-0000000974t-3AbB;
	Mon, 12 May 2025 10:34:48 +0000
Received: from mail-am6eur05on20606.outbound.protection.outlook.com ([2a01:111:f403:2612::606] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQ1b-000000093OO-1rVB;
	Mon, 12 May 2025 10:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOmZcxTnLOyloMyorxoikytywIohw0DvS+NrfWmMDbKiBIbrhrcJvt1e/c/RRug8n3i+eGEMv6v6YIWVd/yXIHGqaDTjfpLqY90CzAgwd2DTPS3KJIgxPivj71wMAlOoHeA2K5NNbCWcxkwD6nfdyk+WZofmYWL+tUtMxWVgrNQOsMVscg0MhSYSdTWHmbyO6R3QSS4DNR6zygfK1o9DtA3roYV2pVELBSXdb2zBXfGXsLCkS/XJ2y0fMISogVs3iLv4KZZelRkgoxywfK3RCzy1N7UbxC1G1Vp2NX2kjhno00PuNXU3YHqqPEFS5vkYEUuwdNVxuCryIMWxK5FrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsfpdBAiNoTFGN9JNkREh5YE5CVOUpqyAIbwFoCZFCg=;
 b=n0Vr5c/mEe37K4cGLtgJBtNTZEgBlDzk/H1kFoeUrQA3DQzhG101EhfiqMVNz2FpXFwDN3ctj7lLwvfd9fKQQhozENsWN358cD/AXV03NMTYFm8HlB5DFM/WMLDOa0LR3NFtmRzaWf2MF6iC3QERjAsGvY9nXgR1PG+8gvjg7mD2f8XW71h+XQgV4XAgITt+1tFrpXj6IAI5NNioBEBBZvF3pZwG1NS4fyeoUlPp/omjJLx9HpPsuIQV1JMJ+6RzL+rVICSCce+gqq3gToMcmf16jhM+w0N6DVnfspyTvxX8G82UYptB+xkF++WjuxSajEUmnjJh9VsFFPqOXnImMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsfpdBAiNoTFGN9JNkREh5YE5CVOUpqyAIbwFoCZFCg=;
 b=ZSCYumxhnnjeUWCtALFLFsfXB1ggyYJsvVdSPJ+hgKN0hzyAgY3blCYfiT0a/FUlodUMCCLrFO2Y0wS0poz5m0O4UCfehiLrYJ9C4BvNCwtBnXDdzfeB0TMoO6kkReeQStZ8ZZQfviDUmcOu8MOv5HD9QitFL02TmmXVM8bwe18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 10:04:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 10:04:39 +0000
Message-ID: <c2118ab6-a7be-4158-bb51-9b2cdd1838b2@cherry.de>
Date: Mon, 12 May 2025 12:04:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: rockchip: add basic mdio node to px30
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250508150955.1897702-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: e851bcf1-cb1c-4ef5-3521-08dd913c6817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODdhSmVYNmNHR0ZKWFFieUZWWi9nVWQzU2YrZkhGYzlZbWRnUnQwS1d3YXVq?=
 =?utf-8?B?dU4vSlZuYjJCR1J5QXNoQ3dKV3B2dEhIalJDemhKVjNiWDJQZGtuZ2poK2Jm?=
 =?utf-8?B?bXdBalNxYzlZcnRlUnk0VnhsdkFJSVM3cmlweG0xdHhxcG1kSlB5anBtUzd2?=
 =?utf-8?B?UmlrS3pESzg5OWdYejltVDdTT1dseUQyWXFNdXY1Y2o0ZitleWhOSFhpRzFy?=
 =?utf-8?B?djJ2aWZGWmJ3cC8vZTFCckN6Ym1RaitNai9UWUN6TmdJV2RicDZnMlc1dWVu?=
 =?utf-8?B?YXNRaDRuYWpFcnZqYS9PSnovdUxYbldqRks4SGx6ODdrd2s1M0FrUUw4dWF2?=
 =?utf-8?B?bkcvYXBldzdBZW9jQWRWQUZiSHZFY0FzOTAxcTI5VTRsdUV0eHBEbTZ6azFw?=
 =?utf-8?B?UEJOclBBbExqQnREOFdQQUpWV2N5SWQreXV3V0RFV0NFeE12aUdnMEQvS1lz?=
 =?utf-8?B?WVd2a3N6czBWR2NQamVza3haLyttTmprdU4yOVJTdm5qd0Q1QjVLRS9QOHBS?=
 =?utf-8?B?Sk1CUUVBME9SeXRTZnVaUlpGK3FrN2RPR2FIUzhlWklKaW9HYTZMSmVrRy9q?=
 =?utf-8?B?dUJuMWVkcEVRcEVONllQdW9lVWxDMHMvQmkrQkpyZU93OWFkUzRjUVZsV3J4?=
 =?utf-8?B?M1pVZ1ZnT0pocURNdHRleExLbmQ5NXFuSG5lTWpaaEVCUEhVOTZHNnZ2TU40?=
 =?utf-8?B?UkZFakdXNkRWNDhPaUVMQUlVdG5ZZmNaNnRDQ0pJNTNhWWZYMzcvTkpIODgy?=
 =?utf-8?B?THVXQjYxRGoxZlJPZXd0UUpuNDFvdi9IWmYwVXBtcFMwaUlET3MrLyswaVIr?=
 =?utf-8?B?ajNRcUlKVTNIWHRUWWxXU2xVR3pPM3NaNldkbW0vcWJJWFFZOHNaOTNtMHg2?=
 =?utf-8?B?T281MkRpbzMvcUFhaUNvV3k1b3VJdVVKaVYyL0F3QmI5TzJtdlNkaFc2Wjhp?=
 =?utf-8?B?VVc0eEtOT2w3TUYxbUVWRzh5bUMweEM2S1hTQnpxc0ZLbzBuaW05WGR5d1kx?=
 =?utf-8?B?Z0ZYeFo0dGd5REpvM1g4QUk4MU9VVGJpTmUxYitKYW80UVRLTmFwSlpDUlRp?=
 =?utf-8?B?eWpIMTFFK2lId0o5RlZWMytVZEFSbzRFTnVqQzJ5VlpCcmVZQVZVa2JCcDBE?=
 =?utf-8?B?b0JnMnNHVk5qdVMxSzRTbFJ0N2lreHo5bUV3VTBCRnc3ZXpLdnhDVEYvczJh?=
 =?utf-8?B?SUROZTlyc1NKdVc5YkEydFplTUhGc09sVkVwUjI1cXNhME5xK0NlY1FEaitV?=
 =?utf-8?B?RG01S2VpRU9UOHRiNVRLdGdYRlB4bG1mMWNxZEdHOUZ0TVR6R2xEU2l4SmYx?=
 =?utf-8?B?RE9aOXF4YVhmMm9JeXU1clA4NW5laEg4SDFCdjA5dlNmU0tPU2FUelBYYndY?=
 =?utf-8?B?b05QTE9FK0Y0M1Axb0luWnNtbmxiMUo3TXRGOUJxTytmdUtDQVZvZUlwb3gy?=
 =?utf-8?B?Wk5OYWF2cTFjRkEvNi9GUFBkbzhnSjdNSk1LTWRVMjNwblNGd1VUMjJuTlNJ?=
 =?utf-8?B?YS92TUxWSUwrWVBvNUxkMnRjaUFJVkxjNGxRNmQ5SGpzSlkvL3dmbTNBWS9V?=
 =?utf-8?B?M0FYaVA3TGgvak1lTDFWVkxhY1dmUzZFNGUvNWZVazRhQi9UUERvcGRKekx3?=
 =?utf-8?B?ODR2ZCtESmNMNVBnMmhJRTJhN1pyenNTUTk5Qk93MmpIVWpWdzg5UytUYmVv?=
 =?utf-8?B?cEx2TWdrQS9ZcDRCaVcrcXM3VFk2YUlDUE9RcXJlRDJyZTlZUGYrVFdTVG85?=
 =?utf-8?B?R2dLaDg3Vmxqanh1QlNzZFRtS3dJc2cvMDZKQW83RStrcEZQR1VLN0FYUEMr?=
 =?utf-8?B?QmtNcm1lS3I0eFN2b1pEZ1VKUStDUm5XeWZIT0p0WldLTXJ6djRBem8wY3k0?=
 =?utf-8?B?Y3dGQ3VVcEZ6Z2RLb0Y2bGZSekFEVUsrb254dk1FYnFFa3lYbzhzRFZlSW9z?=
 =?utf-8?Q?3usmzvvT6Og=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVA4VURSR0FYMThvVytWQzlsN0d0ZkswYlhIemEwdnUxYXpvVFdGd2RjcTYx?=
 =?utf-8?B?a0ZPdll5bmVQOGRxZURGQ0tEWENiZTNXbW1OMHk5b1U3REpSUXprTlYydjVB?=
 =?utf-8?B?cDRaUTdkUlJsWGJNY0diRnRKMnNBVEVMekR4d0FwK1BuK0svVTBObFV3d2RC?=
 =?utf-8?B?VVV6ZHVTNXN5VFRvVWlVamdHUUR2Wm5xeENHZmVZRWVEY2RyQW5tNEpkbzR4?=
 =?utf-8?B?bmFhd0JaenBUMWdWWEF2c2gyeDNiaXl6enhrQ0tjbTRLRTk0YUptZERIcDhJ?=
 =?utf-8?B?czBMbHpMTnFocTFuTGhJOXNFcjN6dHh1R1ZDeTR5M2xOSE04WjBGb0Q3aHpJ?=
 =?utf-8?B?OWxjMzhPRFQvSitISkdGVmpGUjU5d1NSc2FHbkllazVRVzJZM2pDUmp6SFVS?=
 =?utf-8?B?RzE3NTE5dHNKSGxMU0NMcGdBWTU0MS81Nm83ODVjR1M3RVVCcTZ2dXZQTWRK?=
 =?utf-8?B?dGhYK3h1eTcrRkFFNk91YzdWSmwvY2dwSmpvNHZuT0pBOCs4bVcvaUZSMGNX?=
 =?utf-8?B?eUp2b3hGd1IyaHhGWk1xRzNKNStXODlrWWVMZm1RalpVZVRBcDNPMmxYcWhD?=
 =?utf-8?B?N05pTnhjUzRJbVgvNDdKNnMzQlBGaTJmK1RIU3hTNjh3WDd2QUpsOE5Tb2JU?=
 =?utf-8?B?R3hRS2g1eUhnZ2xXcnFBWkNnTUFEZ3RMa2VnZWxWSzVCcFlaT3ZDMGUxWElI?=
 =?utf-8?B?a2trWE1JNTJGWmg3N0ZabHI2TkpHUjB0OURFL1NFcjMvSU9TNXBlcGVwWnhj?=
 =?utf-8?B?UWJrbTRudVFvTXNYQ0FIaVpybGtaTFdwOU1sNm5vak9VTk96VDBRcFhvbEJS?=
 =?utf-8?B?elJpTjk5dFQwdzc1RWNZQ09ucktDNkNWRFhLbk5QM0t3Q08xTTBQWm40ZUww?=
 =?utf-8?B?NGtNQkZUc3gwaWNrOFFsaU9PT1FjZmd5WURwTS85RERnNVE4c1kvaitxeUNP?=
 =?utf-8?B?ZDVGenduUWRRa1dpeEwwZTZqODBXQ1lNZ1FtOXMwU0lzTVR2VlRrUGdhOElQ?=
 =?utf-8?B?SFQ1enBtYXo1U0VDVnRVTzhwWXRzTHMxd29pZ294QXNKMlAwcFhtRHlRczNR?=
 =?utf-8?B?S09lQ0JVYTdsSXRNMlRPbUxqVjYrOWJXdDh1SVJ5VEljeHNPeXJjZnZtSllS?=
 =?utf-8?B?a3lTVVhmTkRhWGFtSCtUa0Vlcm5wZHZwbmdGRFNzL2lWSS9Rd1YzL3QxWkI0?=
 =?utf-8?B?dm9xNjZaNGR0akl6NnJUU0NTNW1Ed0tsV00wTVVDaWVSODd3cGM5U1ZMcmlI?=
 =?utf-8?B?OXBld0g1WDRDM2NjRitiT1hqcjY3T2MxWjZGQnpPM2NGWlVaaVE1Z1NxbUhx?=
 =?utf-8?B?Ymp1UHpFQ2Zaak5sbzhiUXBoeHdsQnV3VnY3dURUZVllUWNUaUkzUmI1YVhk?=
 =?utf-8?B?N1hZcko1eU10OEFSOGkxd21qcnJqWlI2ay9yUU5YOTVPS3llVGpab1R1ZFRl?=
 =?utf-8?B?TTZVc2pwZDhuNS9aWDl2dGZUKy9VaWV1RVgySXVtK1RpU2pOSCs0SThjU29Y?=
 =?utf-8?B?azh5VnU1VkM4Tyt5VDIvUWlGdndGUjE0RUdJSUpPaGdhUHIvTUVzQUFVYjlw?=
 =?utf-8?B?bUhPSFFHQUhIdEFkZkw2bTJvNWNSME5WMHVHSXRFQTIzR1AzbEphTEhwbE9H?=
 =?utf-8?B?SUc5aWdySTRmdHRYTkFmbTY0MmpFYUJZTGx2emtrSkpPVTVnWkQ5VDZHYnRJ?=
 =?utf-8?B?My9saWhiZXhWWng2V1lxL2hZSHFvUWdBSktBVkUyUGxVQTgxZ2kwVG03cmJO?=
 =?utf-8?B?UXNrbzBKMDlXbmFPYm5nejVYMjNORVVSc1hmbG9DbWFieGJ6bElNbkw2OTlP?=
 =?utf-8?B?QzROYzkrMmhNcTduUDg1ZTlxRktQeU4vRVBwU0pwUWt3b1VRZnNrYUJHbTZm?=
 =?utf-8?B?L2hEMHlnU2RvRks2bjEzZkZkZVMrK2ppZE5NTVZON3Vpckk4aVhOOElUbnIv?=
 =?utf-8?B?WDJMOU52U0EvcG92SkpiRWlqYTlndkV2MkRvRC82ZzhCdGJNa1psTWdYdjJu?=
 =?utf-8?B?MGUzOFhBc3BPbzdodFkvZUZPWmRXNm5SVzE4aHpPemNSUEFQR3FoaTFCZ1NM?=
 =?utf-8?B?YVN4TEZDbHgyZW43OGFHelZlU2dSanYyL0JuNmtOdHhNblpjWDkrYy9SdXZo?=
 =?utf-8?B?ZVFjWjY3RjF5L1dCS2RrdUY2ck1tZys0UlBUWGQySVU0N1A1R0xlaFdLWmJt?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e851bcf1-cb1c-4ef5-3521-08dd913c6817
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 10:04:39.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbrC70eEwxhkzCbsf0M0JYti2KsHqSUhzPREeUuWK1eCuymOdYgwAHzI57ZSMgRCTSN3pVsUwoFmjFfQ8C+PwP/lZuhU9gmcshNO0N4REf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_030443_487152_35CD7DD5 
X-CRM114-Status: UNSURE (   8.30  )
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

Hi Heiko,

On 5/8/25 5:09 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Using snps,reset-* properties for handling the phy-reset is deprecated
> and instead a real phy node should be defined that then contains the
> reset-gpios handling.
> 
> To facilitate this, add the core mdio node under the px30's gmac, similar
> to how the other Rockchip socs already do this.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

