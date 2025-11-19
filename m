Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B09BCF6486
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 22:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYutiuj72AzwexWavn3Ifz5LZ6EYf/DUSuzt+GHgGuM=; b=RxvL1LpRqIG0kXnwWMx2gQz9ZW
	Euf/SEpKRaMB4lF9Q4XS7m5xfvq46ILkCAMm/09F/rhcd4QroKeQoGeD79I3hEs8hpAyyppj0fFGH
	YPxDsNKJVv58oARLsGXnuWiZoEFO4EeP/63G/T9u0vjw/8ZfkLiQkmIspW/4c1S/OPNljEyi/VRhN
	rNpsJ03iwLudQpxULQo1JtEPxkoNe8yTx+apELSQTAFs+CiSXNU1DP0PsajT3Lg/yuZvOIYQP+27c
	zQh4aCfLyEzUbEWmYOPJi1sq3pApVKNW0WSEebif43SSoEolbD3z8h//XquTPnnxcbqsN+StswSTQ
	zrkE5g/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqdM-00000005n8m-1zBH;
	Wed, 19 Nov 2025 22:26:40 +0000
Received: from mail-southcentralusazon11022103.outbound.protection.outlook.com ([40.93.195.103] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqdK-00000005n8N-0DEY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 22:26:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fhodb+jVsOrHqiXk5joSf5XhJfTqNjYz7tEeEKs3PdOf2Ej2ouWhUD6FubE+R1S0HsFgGaNTO7HVT4HNrBvRGDEHj+v+hRl8hJeknDhN1fPlymtNZYv4eWZpnx9DRGdpvOpZSXYiKpOP5CxohkOOl2J/tuzzIbbLFDo/LNobrliCbI5kgNPs6ZgucwOeCeAxRkhinFM1hPMFb+UB7zqinpCFaX7U3sUMwELQbbOL+mw72tXHQ7bX83KGtkQySuGy7LcTRsyjNFyMYLeZYVGtRSMhcCibKucuMqqwFvU/e2X8d10mK4HY5N7LmJF6rCkWJceTeltk66/fe26ZcnpnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYutiuj72AzwexWavn3Ifz5LZ6EYf/DUSuzt+GHgGuM=;
 b=YL1MCJolDCbHkq9fXNdzlvDmDldfVaSraCAM94/uSxUlkuyMBJYX03vu6bwRXZNW04xdPpGkkEsgTvABw7D4re1Q/OK+fry0tcIFwM2Eb+OX17spO36pKk5mr0PkzCzMO59+h0QHV8ZGC/cnlt8tdeGf2zFRq8qxdQ8kJ4nrIlgJvQafxv3+TjiYE8V0yUmQc+vtawg3rZ5bNrGlS21cDDdEe00cyutnXyA/IfPQcxAeGg9hzs44RzFcgT0qa4GyjTlcok2+lG43Wl/4PpHwiIvtIW18bsYRpjYX2mdvEl8Lp3h14VQeAlp1e5uixA1S332wVoXIDDT0ts42B6K9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYutiuj72AzwexWavn3Ifz5LZ6EYf/DUSuzt+GHgGuM=;
 b=XZqL4QLR8BBJiuW9zaiJbMXJwdaCaRuIaBaFVwM/kxakEHkwn4/EC7Tj7ydzngcaty/c3r+n3WS2jEuBM3gGpTqFLXbmNv2lI9c54bNC2sG4xR8p1FuyecXvlrD4IHBmzO/+d3pKN/ZymZnQ2NoHs0oHKc48sJKvEN6FoSOO+O0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BY3PR01MB6612.prod.exchangelabs.com (2603:10b6:a03:355::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 22:26:32 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 22:26:31 +0000
Message-ID: <6e2d0d9a-9a39-4840-b627-a95a3f47ba8b@os.amperecomputing.com>
Date: Wed, 19 Nov 2025 14:26:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: ryan.roberts@arm.com, cl@gentwo.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251023215210.501168-1-yang@os.amperecomputing.com>
 <176357957114.2095636.13353317001365823131.b4-ty@arm.com>
 <76803fd4-7a7c-4018-b2cc-8e36cba60729@os.amperecomputing.com>
 <aR4yTL-F8yvIyTBH@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aR4yTL-F8yvIyTBH@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:a03:333::30) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BY3PR01MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f4ff98-88f9-440b-eae2-08de27bab092
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2Zzdjg5N0QvdDYvaWlvU2pyNE02MlVkMHdEYjM0bDhDU0RhT2JDcmwzVUNK?=
 =?utf-8?B?Y3E1UFVYOGJDQVUyRDBSdjNFVG5mWmV5N1A2Z0s2ZDRJZ2RsR3NCbjdHdWts?=
 =?utf-8?B?c3liN2d3RmtBWHMrMGRqRmowT2YzYmFMald1MEJnZUJrbXNyamdkaXBQTXJ3?=
 =?utf-8?B?aW9abnBaa2s0UmpKVjh1NW1YK1czNHJ6ODNLVDhxSG5wRXlNNmQ0VVYvakcv?=
 =?utf-8?B?dVhFcjA2b2VzcnB5elk4OGU4MWVBb2lERk1OQzg3MStWQUJEYUJoaEVTZ0hO?=
 =?utf-8?B?Vi9pNFd0b0tzek1PazBvZ29Hc3ZaT0FMU0hiazFTRzhiNUNWeVBZa3NHK2wx?=
 =?utf-8?B?UzhFT0VDcVNIUzg3Y0M0aVIvdTRXVjd4YlB3eHdZVGZXb1ZpeUxmSzVqT1Z0?=
 =?utf-8?B?eStmTWM4SDJ4My8xZ25vcnk0VGRDRlFOM2F3bDRJRkk5Z2doanI5TVkwMGty?=
 =?utf-8?B?MWtJUkhOLzc2ODM0TWpJZThTLzR6TGpPZ1FCRWZOaEpidEhlcEpLTGJRbzgr?=
 =?utf-8?B?Q2Z5Wkp0QS9GOVE4THI1R0lkTmxBK2hIVWdqTGZpNW1VWUFKZFVSTllvaDhN?=
 =?utf-8?B?bUh1eW01L0g4OFFpb3JGMW5LZDA4QVBDTGs1N1g0QjhiN3dBN2tQazl0eWd5?=
 =?utf-8?B?MUFkSzNOd1RaSUgwWHJJUHJtSU9SUzBacnlRRGp5a0o5T2pJL3ppWk9sU3Rn?=
 =?utf-8?B?aUpvNjZyL01Uc0ZkYU1XQW1kWXlrMHJlaUxFbVFVL2RLVXdaYjNhUjhxTDd2?=
 =?utf-8?B?eElXcUtsUVRNWnk5M3Q1SFdSYjBNK3llUytMVjVMYTE1N2ttQ3gwZGEzdVUr?=
 =?utf-8?B?bExDZ0V1MU92U3RiUG54eHE5anQvZENUQS9iUXdBWlhYSW9DZ2NpcjJ4bHF3?=
 =?utf-8?B?VDYvdUFqcWttVW0zdEEwSnJsTkx3MXp3N0tSWE5FK3NzamxPQXMxS2Z5YnVU?=
 =?utf-8?B?b3Z2T0xBei9UQ0V3L0taLzJVN3Rkb3VOYk1UNlF5VzRQTEZZOVRJTDVpOHky?=
 =?utf-8?B?Z3V2TDRjMThYUkVDd21JS2J1RzBRajdHTW1jS2YvUnFtMnBKZEE2cVg3bGx2?=
 =?utf-8?B?K0VXMmtOUXROTXFIOE52Nmovdnh2NmhVYUd4dVZMdWlIeVptTEF5WHVNbkdl?=
 =?utf-8?B?SklERkZpM3FZSlBYVzNTa0RWdlRCZWo2bjEyaStPdk1GMllaS3Y2cThNaVZH?=
 =?utf-8?B?WHJHQVF2c1RNSzRDZllHVzRLcnRpS0VPekh2UU1nczU2SkFsTktndFpYMGhD?=
 =?utf-8?B?RE9wdTQ1eWhXaGRKbGo1bFpTajFsR3JDOGR3Sng3UnluK1RiTEZHa1NWeFlp?=
 =?utf-8?B?TWxUbnpaUktqZEdFSGFCTWFhWVdKbUN1dUtaeEZ0T1l0QW9NN094bE11cWhy?=
 =?utf-8?B?Z2NnKytYbHlURHlFYU5ZckJSNE1oQkU5ckxMQXBsUXV6MnJLaXdHaEpRdzIv?=
 =?utf-8?B?bHYyckYvVWF6WmtaRGhSaTFNVmJUTDE2dEpTMkIvblR6UjNMNmtrTVV4QzRw?=
 =?utf-8?B?L2JaVVdGM3ptSW1ubnV0Vk95UnZ6M0tpeFp2MDA4bEZLOVlmTTRrcDhybThy?=
 =?utf-8?B?aG8rME5tYXJRd0tLYS9yOGlGYVlDaC9NYUJscVJOM2VtOGR3M0hlUFRNZW85?=
 =?utf-8?B?K05DVG9YZEpzdTM2ellFL2MrZ1ZGTGFZY09xL09kaUNKNnpKZ2p0ZzQyb3dy?=
 =?utf-8?B?OUducU9EalRZZURNdXNQSjJnOHBNWHF4Q1ZCMDE1LzBzZ2JySmlTMUl4M2tJ?=
 =?utf-8?B?Mk55REdpOTl6NkpVcFFlZWUzMS9ZdCtabS9nRHEvMWtjSGJFYzlSRnBmZHVI?=
 =?utf-8?B?VXdNcGsyS2hGeUlkVkR6SnRNMjdIYlFaejQ1RzFPVExUQStkNFU3aVR5M1dL?=
 =?utf-8?B?V1ZJWHZtMDBEc3VHckpRVlBIMjN0aEJ3K3hYdk9OcCtrVHA2b29rRGVyT2JO?=
 =?utf-8?B?WDdZQ2hvTmdyWDhxRjFwV1lrK1V5ckZ6MkwvK3dtMzNob0ZNRFNiM0h2RWZs?=
 =?utf-8?B?MVRZQ2tLT2F3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGh3TCtZZ0tqQVlNOXFwRGJnRVJpUTNkU09wcEVRUndpdi91U2RsZEZHWEJy?=
 =?utf-8?B?dFBBR1MvZ1BJUVltbDV0NGtOUDZybE5qTmRkQTJoWUZ2b2JHcjFYVFFXczB3?=
 =?utf-8?B?NGhHRWpQSDdvVU9QQVVqUW9KcTFpZklkR0ZIQTZwZFlPS01TSlVES0hzSHk5?=
 =?utf-8?B?VnVPZGVwam5VNGJnaFUxVDRKSk5QNVQzRysvRURLeFpvZ2RTWTUyc1pyUnNk?=
 =?utf-8?B?UzdoRFBYcERsTHVFbHZNVTNEVVlDTm5jdGNaaEpsOW1wN3ptN3hON0ducEJI?=
 =?utf-8?B?aXFYQ3pIWWZ6SnE5TG1IYzMvcllTMzk3MDhYRUQzYTE2V200RXp3bzRzUUcr?=
 =?utf-8?B?ZW4ybDI0OHBITE9yc0JPZmpoSXNkWEJ0cnkrcFo0SzBCazJQd1J4K09MOVM5?=
 =?utf-8?B?bTJpalkraDdNbFl6V1Zaa3Y4eEpmK2pRVUFzbG1TdFBLVUxpMWc3NEJ4Smdv?=
 =?utf-8?B?Z0FTMWZjWE5xRVR5ZUVSTHR4WCtTS1M0TjlYUCsrNlJwTHNyYnRVMTd6aXVC?=
 =?utf-8?B?VnFjNkhRakphZUhlbEl3NHdUQXVva3E5WW5VSS9ScGZoOGJsVlNIbDR6V3RW?=
 =?utf-8?B?TmJrZm54czgwc201VzZVb1psZ0ZzMTcrZGFrOXZqTTZueExwNHpvU1BaaWtu?=
 =?utf-8?B?R25rS3gybDZtTUE0WmJxNEJFblJaUERLcUxyM3hma2dQMERmRk5FZ29sVDFV?=
 =?utf-8?B?bXJOYnRHRngrZFdodmJJeVVONURWOXE3M3dhZjBrSFl6RE1PZXAxMVh5VXdy?=
 =?utf-8?B?ZzNKSEVQcnBuaXZLSEhIL082a0F1Tnh4NUdHcy9kaUVMVTc3MG4wQTVBUk81?=
 =?utf-8?B?TlExczhINnZvZVhtd0krTUxuU2o2RmdWcFJiMU5oS010UDNqalk3aWgyWkM3?=
 =?utf-8?B?bEcvcktvZUZLQkVoS0lIbExPUmdpUnp6YVk4dk1tcFVlcUw4L3liUmpGdTNR?=
 =?utf-8?B?MVdEVXRJMndacUR5QWsrZ0lTQmxHTmtsYjdPZGlhWjkyUXp0OFlTakd0T282?=
 =?utf-8?B?ZVN0bTFYdUNYU1VFZjBYN293VHBYZ0gzRjBxOCtwYXpGS3NZUGZmRndSTHNI?=
 =?utf-8?B?RlluWW5YRWJtaEFmY1RKRGFZVENMcHFNRmlUUnVIMGJ3T1FyV0I1UllpOHFM?=
 =?utf-8?B?Tm5Rak90UkJ3bEZucW8yMEdpellWcDFpOWYzLzBLZElVTHpOb1NKbEFZalBu?=
 =?utf-8?B?YjZHcHZYczdObXN5M05rcWRTS1h2Qnc0VDBlOGJ3VWVlc1crYlBDbmFHSjFF?=
 =?utf-8?B?ZUpBSW1kajhzaDg1MkhIUVJ1dU1FenVHakdlUWpQbTNpVjNBUmZXb05zOGs5?=
 =?utf-8?B?SjZqWlM2Uk1MZWdIQWtYYnprTWlqdzQwYlliWVJ4YVJUaWVIRTVUdkFJNnQ5?=
 =?utf-8?B?OXUwK1FFcFBTNTZXWnJSOUU4bWNKUWUvbGFIN1lkbWdQalZuSXBJcnhFNy9M?=
 =?utf-8?B?QUVhMTZxK0xhc2NSWERVTTQvMkZ0d1Vsek1aTkJvY0l4QnFzQ0d4eVdnZkZx?=
 =?utf-8?B?Tm5neG5IMzNqSnNtWU82VEsyUVl6VklDaVFHMTByTDlreHI4aHVjWDQyc1hQ?=
 =?utf-8?B?TUx6OVY3MjdSL042Ykd2cTNBK0h5bmpHOWFIejFUMFZuQm5PYmRqRnpvQmlo?=
 =?utf-8?B?RFFRNkZjT0ROYTlqSjV3c2xGMTdRSnBXeHRDUVBXbSt3cmlIYlhaV3NqWi9P?=
 =?utf-8?B?T1AzN2ZISGtFamZhaWlnZVE2Y3NwVmUwaGMvVnhJaXJxQWZieGNTcDF4cXMx?=
 =?utf-8?B?eG9CRC93cmpyR0kzM3N0Rmc3VzFiVTZtRFB5Tit5ZTlyMzNHYk5vZXNmeFZE?=
 =?utf-8?B?Zy9EZnpsNURHM2g1T3gzalI3ZU5PekZYZjdDbmlhMU45dlM0U09qVGtQdzV0?=
 =?utf-8?B?WTNWSkpERVhTUjJsMDZJR2JQYjZGcEtyVFlGUHJ4Ymd4OGlZdk5jUjdkbGs5?=
 =?utf-8?B?azJBbXlVNW9qWUNVZEcydjN0QVhJSTc3djE2OERXSHdQTVZkejE3N2NOR0xy?=
 =?utf-8?B?R0ladDhBUENJcnR3cWNqQUQyNmlIY1c4UC9kVVNFRlg2UWxqV0VpNUxSUEt2?=
 =?utf-8?B?YmZETzFHaUx3bjdjTjVsZEo2eFpzU2UxYnM3NVhsUnZrRFZHai9PTnBuaEFw?=
 =?utf-8?B?N0doQlkxRVJpZVhwZUVkbTdqa0U2eHRIbnN4WjlWME9hWkRoQzVuNU5sWHcz?=
 =?utf-8?Q?B2Q8A9NjwMwUewcTQTwNOXU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f4ff98-88f9-440b-eae2-08de27bab092
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 22:26:31.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rW9ccpgzgKQX8l2QsU1X99mtxjOHdC/8mG2TIMj1JC+dI6oqeBNfK1SDXCaUgpm3PCwMumkL3csfbp8bPjTKLGwTUAETOLADZeBY1K/jtoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6612
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_142638_134410_27D90F09 
X-CRM114-Status: GOOD (  16.35  )
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



On 11/19/25 1:10 PM, Catalin Marinas wrote:
> On Wed, Nov 19, 2025 at 11:37:13AM -0800, Yang Shi wrote:
>> On 11/19/25 11:12 AM, Catalin Marinas wrote:
>>> From: Catalin Marinas <catalin.marinas@arm.com>
>>>
>>> On Thu, 23 Oct 2025 14:52:10 -0700, Yang Shi wrote:
>>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>>> rodata=full"), the direct mapping may be split on some machines instead
>>>> keeping static since boot. It makes more sense to show the direct mapping
>>>> use in /proc/meminfo than before.
>>>> This patch will make /proc/meminfo show the direct mapping use like the
>>>> below (4K base page size):
>>>> DirectMap4K:	   94792 kB
>>>> DirectMap64K:	  134208 kB
>>>> DirectMap2M:	 1173504 kB
>>>> DirectMap32M:	 5636096 kB
>>>> DirectMap1G:	529530880 kB
>>>>
>>>> [...]
>>> It matches Documentation/filesystems/proc.rst, so I'm fine to align
>>> arm64 with it.
>> Yes, it does.
>>
>>> Applied to arm64 (for-next/misc), thanks!
>>>
>>> [1/1] arm64: mm: show direct mapping use in /proc/meminfo
>>>         https://git.kernel.org/arm64/c/1102778cb023
>> Thanks for taking the patch. However, Ryan noticed some over-accounting
>> problems and had some suggestions to code cleanup as well. I'm going to
>> submit v3 to the mailing list soon.
> Ah, yes, I forgot about that. If the change is small, can you submit a
> fix instead? I tend not to rebase the for-next/* branches. Otherwise I
> can revert and apply a new one.

The fix is basically simple. It just added a check about whether the 
address is linear map address or not, and the add and sub operations are 
encapsulated in helpers, however we need pass in the "addr" in split 
functions. Anyway I'm going to send the fix.

Thanks,
Yang

>
> Thanks.
>


