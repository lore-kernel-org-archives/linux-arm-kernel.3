Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EBAC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8HVkUi0UPc3WDD/OQrHyMHWa9mmT1FZwUucYVnBAjM=; b=dWPC9+5twS72o6s1DnUhXPdXL/
	ii2yde1UlWu/sxUJcWTd6PFTnEkEJOZZFuUl6cK54vFk+BqELBANZ3ftNUy2lVhHkqN8j4i4mgLzB
	ps+B0sEqEYdDyXjG1Holt7N5kVTNBe5hw8M5ZP6CqXugaSTRWlSTd+dEhld5OhYG/U6Ako1WcQ5WZ
	k5CUCsD8FIRvMX8fcICNSU7ljXvz1scv54zRzW1llls3sJCnnEcPz+Hn9S1tT91om2Np3I47Hc6q6
	7tsZGQT+NPoeWSFrInoZP/9+r73rRFYjfSq1Yg17UQmJKyqLKVGCgH3uL2LN0zITY4QCrQ3EqCaS6
	UMLBAWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcm0P-000000050E5-3w5p;
	Tue, 28 Jan 2025 13:51:53 +0000
Received: from mail-dbaeur03on20720.outbound.protection.outlook.com ([2a01:111:f403:260d::720] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tclyV-00000004zz0-3YuJ;
	Tue, 28 Jan 2025 13:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUF/302JdVt/nUky7II5i2vmeuyz8DzLAkJ+oM+Nbo3mbFgeKmcTP72QWGqp1DpFDiay1lPcbs9maOAm7Q8DJe5EU2lShXi8vHiil93oi9rtRyoFg0iD/FEYqyfAZ4sRxLTi3oOKWc5p6nNCu2gHVWBOM1ZE/4/UbxbmWieBhQROtTBwFxohC9kVBo2XTStLoSHv4fqBn8ubiBmFRNzIJATCZrLa2LkQTrLVdWxEPo8bNLDmlyMJcSXonGS+ufSCg7+x9ft4ub6cqXwqxaXPBfG91pmWxbo6RxHVPLSRoItPt9VhGDJH+kqcDE2ZVYF4lycby+FSFeTDXy2XjicI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8HVkUi0UPc3WDD/OQrHyMHWa9mmT1FZwUucYVnBAjM=;
 b=lmE8VFo7N8+JQqhQxp2JTqCwiwlgDaISk4deV0Z9ynchVcQu+CO7pU7GC4zXLHvajzbdGg6CNDVBgLclQbMX+RKog5TouI/U7aFVRm7z8iGWfadIZyqAoA/N319EJnEExOY/0XSWtr2SO4ZeeCNLzkapqt9hEOQtoLEL5faUj1Lfe0E2Cn5hnOp8A0umsbZBP8Wkev4uVsct+Vf5qZIxHS0BQPYbNdGrj4UTJNaxyuyZk+DhfDxm29/dNuX23Q6KJMiRNEoThstq11k7fGbpWbpfdhV9MjMDMpbqH7ZKLBpb96S+XoGj1JppUP3v2EZKRvbhPIAQhafLhIJcWHIdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8HVkUi0UPc3WDD/OQrHyMHWa9mmT1FZwUucYVnBAjM=;
 b=UtmZK4eixSYtpQ7sjPmxU6MO9bvlvdjMaIN1OvNl4CXbh2G6vIqvBluMti3Me9AY3QoDOV/sYJBgxsv/K6NkBuVz8WafVYO6AgQkxXy3KS21fwINtajToqjeyhk3ela8JUzFEDgZrIMfcv5KyGI5iac9IhafPaYuEqq4rLillGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB8PR08MB5436.eurprd08.prod.outlook.com (2603:10a6:10:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Tue, 28 Jan
 2025 13:49:45 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 13:49:45 +0000
Message-ID: <8641ce0b-2f7e-462e-a88b-f71295529a91@wolfvision.net>
Date: Tue, 28 Jan 2025 14:49:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: rockchip: add overlay test for
 Wolfvision PF5
To: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250128-pre-ict-jaguar-v3-0-7be2f09d390a@cherry.de>
 <20250128-pre-ict-jaguar-v3-1-7be2f09d390a@cherry.de>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20250128-pre-ict-jaguar-v3-1-7be2f09d390a@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0162.eurprd09.prod.outlook.com
 (2603:10a6:800:120::16) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB8PR08MB5436:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d2cbf8-fff1-4ef8-06ee-08dd3fa29f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVBVZkswMDdzWFkrQzZjUmlzWmIvUDQwbHlMa3dCQVdxeHVacTBFbnNBL3o4?=
 =?utf-8?B?L29GUTZ1WEhyWGNDYnlHT0Vkckk5REdadm1uMFp0NHRBVE1MWmQ3QUttaWNr?=
 =?utf-8?B?SWFBcEJVYXZHQ2FvRmovVzBSbTNCNVpFRlFkNCtncjlQZFF1YWFlNkJySHdD?=
 =?utf-8?B?YkZrd2FZYU52OHRrdnM4Z05Sc2h5TGQ3eDRUSVVDUHcrK3NMZ01weE1TUmw5?=
 =?utf-8?B?cm5RSWw1dzhtLzRFSTJuUVp2OWFSeUF4Q0dFK3FxM1VnZzlEMmkwZnR2T2Jq?=
 =?utf-8?B?UnlFazVUdDVZUThrQml4a1laWXBpODk4WVBUcFVuRjUvME1oSG5TREN3dDRv?=
 =?utf-8?B?Q3pzNEsxV3RMb2dUejkrK3ppcmtqN1lhV0UwNFJKZU5PYzZEbXNZRXptL1pT?=
 =?utf-8?B?SjJSdXFPaXlBMzdwMlZ1aVc5L1JVMnIyL2M4MTMrZnJxNTg5VlE3NGQ0RjBp?=
 =?utf-8?B?cnpJd2crWVl1Z2pXQVJnSU9MRWZaL3NvWlM0T1ppbXhiVTk1Y1NnSVBDQm51?=
 =?utf-8?B?Z2dKd1NpZU5tbzdqMXVvcnR3U0EzMFhGY1lRWnAySkRJWnVHMmlwMnRLNE8w?=
 =?utf-8?B?V25POUVGbzYyR3BRMFdJeDRIT01yaSt3cEQ5a0N5eHM0WEhQTnhLaWpEZ3ZV?=
 =?utf-8?B?bGYzSVVCWStJeE1WVHE0a000NGdVZitBY2UxWU83T0FLS0NjajRPVi8xSDRT?=
 =?utf-8?B?dVJkU2JFREpOMFpDYm5qQ1RtK2VnbFh6UzlXTEVKbjR3N1hyUGpOUVp5ektE?=
 =?utf-8?B?b1F0WWU3OFc0cGI3MmZ4YTBCSVc0T1RreHBMOTBsVmlYUW5VTWtWbmQzQVpI?=
 =?utf-8?B?eGxFM1NBSmF5VWt3eWNQZGRkNFJEblNxMXFsS1R4YmZjR3lUcGFSVUFGRjR1?=
 =?utf-8?B?WVFtV29rSE1BbnNwRnNpZ01TaUUyaWptdUtqK0VuY29SRVpvQWsxQWNpWHRo?=
 =?utf-8?B?UTZyY2cwak9VWHNYZlBtUUt3SHZuZTlRbWllWmZGUDdPWi9xN2UvckRNY0RQ?=
 =?utf-8?B?OFF6YmxWRXRRV3FFNmE0SWxJLzE4UjR6K2JxSDlUbE5uVWg2ZElwRzdOeEs5?=
 =?utf-8?B?aEEycDcrM09WWnFVZVpuVVpSaWw0SlJMUTdpSXdRS1NMWC8rSW4wcnFkWlE2?=
 =?utf-8?B?R0VjRkh6ZnVucUNKME5OUE9hLzAzSlhrWlZqcG1udmR3VVRqNmRmRDkrcExU?=
 =?utf-8?B?L05DNnNYYU5NaTRLZWNYUXIvU1JRYlRuTnl0T1FreFhjV3ZBMW5Yd2NsMWsy?=
 =?utf-8?B?dXh5NkNrQ3F4Z2p0NnlqV0tXLzVrMTBRb0N1OXlkOHlTWkh3UTIwQUdxREVM?=
 =?utf-8?B?SGxtVWdSbnFJaG02M0psOTBjRTlFazJnN0lEZG5TU2RSWGVaVVk0WnR1UExz?=
 =?utf-8?B?U3VyZk9Ma0NuMHlYcXZQNGhxaXIvOXZDY09Rd2lURUZWK2cxN1JVZDlVNWtN?=
 =?utf-8?B?bXEzbUp2U3FVTitNUU9GeFhVYVJiMmpXMEpDaHJkMWtMUGRNaWpLNldXSUxL?=
 =?utf-8?B?UjlOdVhWeEV2VUEwM2VRYVVPRzZmU2NlYzRVdnJVZFBMb09yUjdIamNrNy9Y?=
 =?utf-8?B?Tm5zZTB0ZHZOUzhpOU51c0xLTTd6aFRVL1pkcDdMT2JOMmxKTGUzNmF2dlcv?=
 =?utf-8?B?Z3BqMVNGMGllbmZkSE5mUjRCMUVBSWxCYzFDRk5XTHJRejdkcll4RUZyaGhu?=
 =?utf-8?B?ZnRzNzBKK1FVSE45bHI5a0s1T2UzM0huZXd1b01SZTlQUy9MZHBEVDRsOXFl?=
 =?utf-8?B?UXVxRGFiaHpXSTlGQVROYitYMzk0MVNTRUdCcmh6WjEzaXU0Tk5FZXBFYVJX?=
 =?utf-8?B?QUdFRGEvNkxveU55aThZU0dwVGlWZDd1Znl6MThVdG9mRTcxcG0rayt3WFVt?=
 =?utf-8?Q?XQFtnOoImFpYG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzY0dURoNWsvQ21vUk40YlQwV202U3Rkd1pRbWxpMDNmeHhOc1Q3QWI1UnR6?=
 =?utf-8?B?K1ZidFVOaW1vWHdjUjJsdFRxemtMUVJySjZsRnZyNndieXYva2hBcmlFUmti?=
 =?utf-8?B?bEltQVppNXdkYUhrS0JrZkdBTnY2QmNkVjN2bFkxMFhab1hHTVM4R3NPanl4?=
 =?utf-8?B?MUZ0WnBQSXBwZk1FSXRwak9MNTIrRVpnQnQxWjhUYVFJTlBrWTRWSVR4QTl4?=
 =?utf-8?B?em8xcnd5Wm1leC81ME5aRUZnd1RKQ1J4czRCYVlhTGZENmQvMWVlMjVmUGg5?=
 =?utf-8?B?bjhrREp6emRiZzZQbnlBR21PTkJaUU1JdlJlYUZ2QU14WGVnUHh6c1YwZ3Bv?=
 =?utf-8?B?N2l6cG1XVzJBckZwczB5eW9IR0ZuK3g1c2VCdmFLRVNFNGxkTXU4eU94UGcv?=
 =?utf-8?B?Zms5NnRxMytNd2VaS1J1WWdTQ0hvcVhlamk1Z0ZlYmZBeGs0Y3hKT2dUT3Fq?=
 =?utf-8?B?di8wSG1ZOUtUdjZxdnVTeEJxSmxXejZTdmFNeVBmRVByMFFqdzhRcnhPOS8r?=
 =?utf-8?B?YkRtZnBNNWZ1NWFxODFWdEpVKzViZlh2MUo4RnFyUUZsYndBWTB5RktWSzVo?=
 =?utf-8?B?ZnlKcUdUZHZJNUpDcTk3ejdCR0hsdEZ2bmk1S081K0dxVVdEeUxsQzRnTmpS?=
 =?utf-8?B?TDRWV1ZMaXp2NGUwOUxNckorbmlJcW5lZTdxME5ZWVZxNy9Sei9oMVh2WkhO?=
 =?utf-8?B?N3h5NzV2Zzhzd1l0SEQyamNIWVFQaFV2cjBZVEo5MlRlVTZycWxPWjQxMVZs?=
 =?utf-8?B?ejdOTlpnRTRzL2J0UDVYdmVVeXNvWlZhOHVtbnhjUXJRSXQvTmxYQ1VGNDFD?=
 =?utf-8?B?c2huOGVDbDd1NGVuSFJ5eDk5MkhWOEpXMkNEUHAzd1l6VFVvaEVnaFdQajZh?=
 =?utf-8?B?RVN2a2JkT0d2SFFTaWdwTXlmREo5bCtremwySFNUbnVzczRlSzVtNHZGZnk4?=
 =?utf-8?B?VWdUOXkyMVdFQXd2TVZZSDlrZHlxUFJxbWJ2bU82cHhQNm5nMFNxMHVvOFgr?=
 =?utf-8?B?TXdrMy9wM3RBaGg3UnVKRkJQZ1lnMExmVkNDT3YvLzFNdEpNK1Jkc1B0Uld2?=
 =?utf-8?B?K3A1QnJaVWY0MHJLeHNRYnBmSGV2NUFMeEtYZEpMekFXdWE4c1R3SEFWMkQv?=
 =?utf-8?B?R3pwNXdqdEptd3E3UjAyNkI2elVvUCt2ei9VeDhaTjZ0SUV3d05wbVNhWkxu?=
 =?utf-8?B?UkxJeEx1UWN2OWh5S1FuQnRtN0dlaVUzQUQyVHdjc2xSbE5QTkJZNGg1R3VZ?=
 =?utf-8?B?NkNVU1l2MHRacXBuNUdlSEF2aTJqQlEvYnRDRHR4WXpEN0Z0R2N1cU93QnJ3?=
 =?utf-8?B?MlpDNUcrRUJuVlFvNkdaQ0JSZEE1RWlkc1YwUWRUSEpKOHI0STNCakcrRkxO?=
 =?utf-8?B?YmJhRXBWTytpUUsxU2xaQ056c2phK0pzeW5ZZXU0akZ5eGJ3WGxUWTZTczlL?=
 =?utf-8?B?dmV3Q3VSVTJjdGNIMGcxUWd6NGhZM21HREIyVTN4ZndMalZuTmM0VDlVNzd6?=
 =?utf-8?B?dndRV05rSXNOaGd0TUZGVTEvT21LZHJLRU9salU1RzVnYkFTNXRyTWVOd0Vk?=
 =?utf-8?B?MTFqdDhqZGRUaXhZNkZTVUlOdU1ZRnpYZTN2SzlpUmhMd2JIMXBpK0pFRmJ3?=
 =?utf-8?B?Mm1aK0lITXlVbGlYdjQ3elJocE9TVitSUGxTSE14QWRJUHViZnAxd0RacDg5?=
 =?utf-8?B?QkJnZnV5YTVOdnBQYWNINHdUQ2l1M1cvZk1aYWJXbnREMnFRVy9GYjRHb1FI?=
 =?utf-8?B?QmtTL3R4U1FPQmZlYTVTSjdaNGd1YmtKTG5GWWFpZ1JvUnVqSTZ3b0RIZ0xq?=
 =?utf-8?B?R2dKTjJ6MXpvb1dDR1FyYUxsSmh0VjdoRE9kKzYzdmI0VU1zYVVGeThPdStF?=
 =?utf-8?B?Q1hNU2hsMUVlM3JOTWJaakplUzJjZTlpMTR6Mm1ObGhRcTNhVDJLUlhya1ZQ?=
 =?utf-8?B?T1E1V01OSXFiRmJWMXNLUCs1d2NSS0Q1QkZrNkJCY2xuMmJ3QU1acnhROHJC?=
 =?utf-8?B?a2M4aXp6QWF1elpidEZScGhNcTRJVFAvNHlhS2pUVE1hbWg0akZzOVhBd3Bi?=
 =?utf-8?B?RVptQWh2bUQ1SGpyVXgxVHUzYlo3b3pJamg0Y3F3MktvSmdrbU9ZbGs2S0U3?=
 =?utf-8?B?SHMvOG4yTUV3SnRFNE1ucFhkWTVCMW5lQk9lOXB0RjNDL2wrZUdEYjI4bjdl?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d2cbf8-fff1-4ef8-06ee-08dd3fa29f98
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 13:49:45.3009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlBBx+IyZDsMnlEq2xXMygTHxpOfGKfOmPoTTkb3JGzswS05AtHNMYTyoPquwzPontkU4f+0aXXXMTCQ3Uej005Kv11mGAQXIkDL9F9PBc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_054955_911010_C4BDF9B4 
X-CRM114-Status: GOOD (  15.03  )
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

Hi Quentin,

Thanks for your efforts!

On 1/28/25 14:04, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The Wolfvision PF5 can have a PF5 Visualizer display and IO Expander

Nitpicks:

s/Wolfvision/WolfVision
s/IO Expander/PF5 IO Expander (for consistency)

> board connected to it. Therefore, let's generate an overlay test so the
> application of the two overlays are validated against the base DTB.
> 
> Suggested-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks and regards,
Michael

> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index def1222c1907eb16b23cff6d540174a4e897abc9..bba9b2f1c761040545bea561878e9b63f8c29488 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -128,8 +128,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
> @@ -170,3 +168,18 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
> +
> +# Overlays
> +## To build one or more overlays, overlay application tests must be added below.
> +##
> +## dtb-$(CONFIG_ARCH_ROCKCHIP) += <name of overlay application test>.dtb
> +## <name of overlay application test>-dtbs := <base>.dtb <overlay-1>.dtbo [<overlay-2>.dtbo ...]
> +##
> +## This will generate each individual DTBO listed as a dependency of
> +## <name of overlay application test>.dtb **AND** make <base>.dtb keep its
> +## symbols (like when DTC_FLAGS has -@ passed).
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
> +rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
> +	rk3568-wolfvision-pf5-display-vz.dtbo \
> +	rk3568-wolfvision-pf5-io-expander.dtbo
> 

