Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B6CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xSkcHyhARz0Gwm3M7uGEfM6iTGS+L5R+1l8iMR12IM=; b=dz/YJegN/u23PcF+gLARbpkX51
	2/dYTYchEf3GE9v7F/gVWV2hKSQAU2tYPoerjb6W0lTfWm5tNVlFGJ+jb9/841pup2Gs+P9w4ieMA
	l8Kr11+7OXSXLhmWADU+FzH/xz4LCWbhP5VeaugrKm0ux1Qecrw3wzRILlD6WtV5U5NhgG3uuDvR8
	AV7ZXFyYNxIwhe55n3u3d58L4ZIJuoLumWSjHeKrL+BMVqlNUNQP9wteF+Q6eDrc2Nq4NbUB7+scb
	+r3NJPr4KGNL7t4txj1BEicbyi/JyHfHEROv4Jo4YXwVrLZomB3MhEUY9kcg1KJFiMoMPof20HSw3
	ZWK0VPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnK6-0000000FLoe-0SOV;
	Wed, 03 Jun 2026 15:16:02 +0000
Received: from mail-centralusazon11020131.outbound.protection.outlook.com ([52.101.61.131] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnK3-0000000FLoK-14rq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:16:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsHjHRJnxhaQjV+HeWd4PBKJ7HOdazUPvWlf8aO3Bill46Omr3O2azPLODQXaXXVmG9mLMscvFjrHOuJ2+VYsya3A/Rvtz1tRMjq5PtcIHC6RlAJyJciUsF+IYZyvZpB1hf2JP3Xd2J3Q+71ZEGQpzQzMIVxUxwOtqepd7ja4BeUAmDxtnD2Eh4yTkYSW0Px4AfdJDFE5/cIoUJ0ybIELELLqKEpjMjt+LB1bptmKjXVqAUWEHrhJJKxhwaLcduHqVaMrEk1Lx67G8zfisRFUV2BdyPyL++wOdjt0ITMAXNf6mIh5gRlODr35hrkVNrjz2IJCGjzgu4fZaEBQMV+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xSkcHyhARz0Gwm3M7uGEfM6iTGS+L5R+1l8iMR12IM=;
 b=Xz0UeR882uhhv2DdA0UbQEmOjFtjHiHSWEmzJc3yn3AA1H8wkYpnltRvT3DLX06P5zSl1w3nleoHRgSxyZDLPqUkUIKeS9mKbEXZe7SIbO7ftkIpBCsenedajWI1XmztPQxMlHQWUmrDR2+IBABaiOYo+x11+B1OUze5NclnkOe2R5/BjjwnmF6SMGJ+QF06Y6x4EIML9/rMCOGKwFwLox4Z/Ey0bc+Wz42s0Ad/uWng9ndWJ6ZyA4elFkn7Uq7uYhODaAd40wILbk/0xS8WV4mR3WJi5v23oJWvVHtsvxZ1/3rCWAvTg6oZEKk4NEaMOwM5KQaH8jTrgirvQ3uOvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xSkcHyhARz0Gwm3M7uGEfM6iTGS+L5R+1l8iMR12IM=;
 b=jiOh6UcgiwJThxUQNgIl4nOVnIXKT5jKiniHaJK+n2inJkiku7tG33E9nQRmOCfYha+vNdDLc2frlxR405PFBdI3UNhsv8ggcJtmBRRB2oeseHjFnMG2sv++8v0EQowKN8dnelXME5md1c5vbiQ33Pnti3ZoqmSEShOuDw3dJf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 BL1PR01MB9477.prod.exchangelabs.com (2603:10b6:208:5d8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 15:15:51 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:15:51 +0000
Message-ID: <c61fa285-01a6-4ac3-82ec-2a6357a9e76f@amperemail.onmicrosoft.com>
Date: Wed, 3 Jun 2026 11:15:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Huisong Li <lihuisong@huawei.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <20260519-inquisitive-teal-yak-56abd1@sudeepholla>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260519-inquisitive-teal-yak-56abd1@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:208:32b::30) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|BL1PR01MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab869f4-d016-41b0-367a-08dec182ff93
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|10070799003|376014|55112099003|6133799003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3qxYTTbPCktGEEeAVMYOIWF7pvzjsFXVPtRC6+iWIpMyuFDnZnvuSbT49mOiDcTePixXR+iXyDPc/Pt1GUlKEdj0OQUIHe8SEX8n/3oJb8SFeCN2TqN/0rlUrpe0D122aiOZ9avJ+sGqhNpXCWs8IOSBe82FoSJ58jWQTPnxVX7EEYT9GKhqVlCQIZxyh0IstoT+FeH3nalXgjI/+mx44kqoEgjKu8ZR0z1Byiu5VfCU6buYaDUGtmPPBvexMgfON2FcKLGtaX1+RnqGiXAVYq6WJ4EggRE+oKLzFk99lzU6gbwFCmdCSpsU+W8jn7+hba3Ab/U5BAMhurP+GaeoU+25Xdcbu5fGCoNDG4ti46lQDQlFfw1IBHvNS4hMM5nIQFJDkqLbt+/s48bzvehjsTRjBXWIIdBkq9MRCc201fBBxN2iaBzP/ssyKiq3fLeqaPpjxE+rjuNjGDe2CkP0MO9vMd5NxZLagBVqtY0xYnGQwVvidCgptKK4/FnACioveD/3j2Ne5+Q6Vy1FXiAvk80LPNT1vRg5WMzJXJwnUJrjayK4/kKeW91U4a1z/knrmIKwrSmI3qBV/QSk7iLmFlHVJ+ISvkLwU+WKucML25sbonDAUsOaTmguMaAvbo09rKpKbPb1VL/qS4X/G55Syz/0RNoWRDrb5zMEAnBgsDgv7JFoL7geIkhQRVEI9um1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(10070799003)(376014)(55112099003)(6133799003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnVUa0hBemN3ZU1GSldEdmovVFpwT01wKzBZVldRNGFHL2dKL2ptNGJGb3JI?=
 =?utf-8?B?QmNEclFzbHRwbHNZUU9ZTTI2cDVvdzlCd1hINStmZWZiYkhaNkxIcVY1NTNT?=
 =?utf-8?B?YlU0dTdoWG9wT2Mrdm5hODhMYmlmMXFpWmJyamZOZXBIMnRGR2dXcStrd1N6?=
 =?utf-8?B?dTlQWG9UQitMK2c1aC92UzJ0ZGU2VTZlL1B0cytQcWROWWpjRWtJS1padG5k?=
 =?utf-8?B?cHhKd01JaUVRQWt5YTcrQ3ZjMk0vbkNLMUQ2TkNVYU5tUkFrdGZWaVFoaGc1?=
 =?utf-8?B?OEV2T1QrajJhV3o2T2hJdEZrakJFUUc1VzlFMmRzdnBxWjFoa1lhcUlsSkFq?=
 =?utf-8?B?Qm9jcVVDTEJyM2FDeFZTUENZZXkrQ3lDdjc4WldrNE13a21Eb2NtRnRLeUZm?=
 =?utf-8?B?ZkxDZUp5YkliQ3ZHYVF4ekl0clRUS2w1bWxlam5hMnAxNG10ZWF4S1pUZUtD?=
 =?utf-8?B?RzZQeHNRTE1vZjFZblFjVDk4bE05ZVFoUElnZTc3RnBsc2l1UnV2blhibWpM?=
 =?utf-8?B?THU1ZVJEMGF6U3lCNGFpSnE5Vzc3YkJmTFFmay96dlhkcHFuYVVYOWY4RnMz?=
 =?utf-8?B?UmJxSXliWnQ4dEJ1dlpId01ZdUFxQmVMTnBQQTIrRUxGV2x6YW52VVhYLzdI?=
 =?utf-8?B?UjFJQWEvZ3RQaFVwWXBPVDdvZnpBVWdmWG1VMWMyeE8xYVU2K2xHV1FveDBp?=
 =?utf-8?B?NlFMV3NxRXp2d2VwTExvUzM1NFNzMm05L0ZFQStLUFplYlVJN0F6WFc0R1M4?=
 =?utf-8?B?T0JxM1ZmNWp3K21HZzY1REx4L1dmZytQOU96ZlVqQS8vK0w1bWZUd2lCZ2Ns?=
 =?utf-8?B?MmwweE9JL09wd3NJc2szdHNWK3M3S21UdGNqZC81dkRMa29HVEhNVU1YeG1t?=
 =?utf-8?B?SVJ3dTNvSVJSaTZkNWZUWnZ2Y2RTNWhaa2lPRFNVS2R6NXZQMnpXYm1odDVF?=
 =?utf-8?B?NERrTWlvRHU2dkFNaDhrRXkycXpqVGc0V3IyZk1ucGNrYlY3bkxCeG9JUU8x?=
 =?utf-8?B?WWE3UVJYZUN0N2Y3VWM1TytmQUp4ZHFuZmkwWnFJa2xKenBESGFKU1JWMkt4?=
 =?utf-8?B?MDhaeWdMb0tiZVBwY29CNWgxczFKenBiL3ZDRDI4b1Z2aUtaU1hYbHVpWjFK?=
 =?utf-8?B?SkpSdVg1dm9lOENqUVZESlNjSk9lVGhKZXR5WHNaZWN1QXBJVjJ6TWYyMDNY?=
 =?utf-8?B?d3MzOUxzcll1ZnNiY003SDlqRGZYRytFT21udm1YWG56UWFvR1NPM05aTUl5?=
 =?utf-8?B?T1Boa2JmYlNHVnFDNGczQjNxNjVFN2M5NCs5T3JySnVkU1NlbldPOHMwakd6?=
 =?utf-8?B?dFE3cnd2S1l3UkZXT2JKWThGN0ZQZVRyVG5MeFMxRkVrbDRHR2c5Y2llVnc0?=
 =?utf-8?B?dEcyZzBzMkFReHEwZHJVQUw5MFBqMDZaNS9Fc2JmV1U1Y0ZPTFJSbHRGSTRB?=
 =?utf-8?B?cnpBdEFtNm53MjNvRzVKWmpkVVQ4eFp0OUdFUmdGRzhtc0dZOWFzdjRITWVV?=
 =?utf-8?B?eDczcEV2TkpZWEY5Y3pJTFg1U2xmRmdHU3BrOVJENUFjSVJKTmdzS3djN3NE?=
 =?utf-8?B?czhDaFNxZzVpYVZPeElaZWwvSUNYdzlQM2lhRlh6Sk9ZdnM3U1VyOStHTXJk?=
 =?utf-8?B?TVc0bkY3dXlZV2ZMNXNtV0JlMERiUkFQZEduTHlEUGQ2MDB5QnJQeGJ4blV5?=
 =?utf-8?B?NEhzRitsOXhjRUZUWUEzdFNGQytjZTNMNkpQeUMybHFRWmwvanM0ZzZjeGRV?=
 =?utf-8?B?TGFTSmgvaXI0VExVVVBoak52UHRnTGFQTXdxTHJHdGlSaWJvOGxnWjlmdXhm?=
 =?utf-8?B?TmJWQVpxK0FMYTZra2JHQnhmTDc2bzNvaDFhQlRCamNWRXZGaCtiQk5uZGxk?=
 =?utf-8?B?Z2lBNEkvaTdQUUl6SmFBNy9nbFhmY3RBd3V6ejQvVnc1TFpUUUYyb05JbEpF?=
 =?utf-8?B?U2VhMVQvNXd5VHppVCtxdzBnT1cwYklVYXZZVXd1Q2t0YXgySG0wOXNWc1dp?=
 =?utf-8?B?WWMrMlZzSGg1WDF2UWpqSVV2b00rUURER3JpVHBQMnNQQnFrVXV3VnhzMlRG?=
 =?utf-8?B?ck4vbEY2bG5nUXM5elBUZXRrakJoS1ZkeDhqekpMT2Mzdk8zWk1WV0I0OVZ5?=
 =?utf-8?B?UFNNZlBzZ2Q0TFZueFhocktHRkFGRmdxWHJic1o2TVlaTHdXQWRxS0kzbXBp?=
 =?utf-8?B?emtCWk5saE9DZnk2TjVxd0VWUU42MlkrZUtPcVQwWTR5Q2xpK0N5Vk10NWhQ?=
 =?utf-8?B?MkV2aVJKbmdzRGF4VE5BVnhXMVUrenJJb1NZeFp6VWpSZVNmVDV6U0VUZ29u?=
 =?utf-8?B?aFpnWWdnSEJRc1JXbXgzUmxTb1JHL2xsa0xzS1hmSnpMdTlYaDE4emYvTnht?=
 =?utf-8?Q?1ZNtHznDgBgkomGOFm9gtBDQdvLp7xtNQNBhwLEvFS/Kh?=
X-MS-Exchange-AntiSpam-MessageData-1: qRN20uCuKj1xh7g5YxngwpcN9Q7bIDI7pzqfO3snRyoShrMv9WvJh19Q
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab869f4-d016-41b0-367a-08dec182ff93
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:15:51.3435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAxnm9kTuVG9C9faoSYpDvRyMSMgdP7ZIaTMxhZ3xWKN/1ENHOdPBM8ZzcC1isXcZNpAflE7YbTmvb/e/q3LcWQXG7yx6D022s0f6G0IPo3/JFayXPnGtJxQX3/74YQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB9477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081559_308569_726FA4B0 
X-CRM114-Status: GOOD (  28.01  )
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


On 5/19/26 09:23, Sudeep Holla wrote:
> On Mon, May 18, 2026 at 03:30:06PM -0400, Adam Young wrote:
>> The tx_done callback function has a return code (rc) parameter
>> that the tx_done callback can use to determine how to handle an error.
>> However the IRQ handler was not setting that value if there is an error.
>>
>> The following clients are affected:
>>
>> drivers/acpi/cppc_acpi.c
>> drivers/i2c/busses/i2c-xgene-slimpro.c
>> drivers/hwmon/xgene-hwmon.c
>> drivers/soc/hisilicon/kunpeng_hccs.c
>> drivers/devfreq/hisi_uncore_freq.c
>>
>> All of these only use the error code to report, so they
>> are expecting an error code to come thorugh, but they
>> do not modify behavior based on this code.
>>
>> In the case of an error code in the IRQ, the handler was returning
>> IRQ_NONE which is not correct:  the IRQ handler was matched
>> to the IRQ.  This mean that multiple error codes returned from
>> a PCC triggered interrupt would end up disabling the device.
>>
>> In addition, if the error code IRQ was coming from a Type4 Device that was
>> expecting an IRQ response, that device would then be hung.
>>
>> Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
>> Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
>>
>> ---
>> ---
>>   drivers/mailbox/pcc.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
>> index 636879ae1db7..16b9ce087b9e 100644
>> --- a/drivers/mailbox/pcc.c
>> +++ b/drivers/mailbox/pcc.c
>> @@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>   {
>>   	struct pcc_chan_info *pchan;
>>   	struct mbox_chan *chan = p;
>> +	int rc;
>>   
>>   	pchan = chan->con_priv;
>>   
>> @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>   	if (!pcc_mbox_cmd_complete_check(pchan))
>>   		return IRQ_NONE;
>>   
>> -	if (pcc_mbox_error_check_and_clear(pchan))
>> -		return IRQ_NONE;
>> +	rc = pcc_mbox_error_check_and_clear(pchan);
> I think we may have to skip the check inside pcc_mbox_error_check_and_clear()
> for Type 4 channel as the spec expects OSPM to ignore it. It is a separate
> fix, just noting that here.

I think that should be in this patch, for correctness.  It is a small 
enough change.  I'll update.

>
>>   
>>   	/*
>>   	 * Clear this flag after updating interrupt ack register and just
>> @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>   	 * required to avoid any possible race in updatation of this flag.
>>   	 */
>>   	pchan->chan_in_use = false;
>> -	mbox_chan_received_data(chan, NULL);
>> -	mbox_chan_txdone(chan, 0);
>> +	if (!rc)
>> +		mbox_chan_received_data(chan, NULL);
> Not sure if making this conditional is good as some platforms may expect
> it to move the state machine, I am not sure 100% just thinking aloud here.

They don't do that now.  If the RC is non-zero there is no call to 
mbox_chan_received_data, it just short circuits above, so I do not see 
how we could break something that is currently working by bypassing the 
mbox_chan_received_data, whereas by not-skipping it, we will trigger the 
call, and that will likely not handle the error. I think we need to skip it.





