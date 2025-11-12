Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8B0CD4842
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfOW/FDs1xnTjsITjlNfdt5edg69hfP6Ls6kWxo0gFU=; b=1P9BI24wDsFNefQwYcnRJkNiBT
	1OktsWcXmzjGNsbTRn98zsa7EsgjieBuYOrIUBgrb68JfKLcv8FOx/xxQR/I3ehNj9rjvjXSkBa8y
	yz8Pzl8d4nMk9E2HdRgNxRf3f75YBI0Rxy68urONPdkNRLEIl/VeEDg5rHM+rxXmoxHGi4a0hOs1T
	zHNL/5ipXodI8iP03wetvCWOKK2lZK3868rWCiO2fmJzqh6922OUTByW1D8EBu5xGA98nYNSKoMW1
	xYd00tFH2W8G6CV6lgdNskc9eniRwb8HZqxuJSKATOknizOvDjQN1R+rzjZ4M6rux+g2HR9BdhAIm
	uIT8nMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHQP-00000009Ttm-38pv;
	Wed, 12 Nov 2025 20:26:41 +0000
Received: from mail-westus3azon11012006.outbound.protection.outlook.com ([40.107.209.6] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHQL-00000009TtM-2Ex0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 20:26:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuUnioL9dQFwOIicm412qwTZcesh3oxJmF2m05oOIWRoslVMvbJNu3VcVKBiPn38OPSQhpG3r6U6FOWK0CEMe5XzeubkBMPWsdG0l4f4Qa/bYx7eQ7fvhDUQ6jMEUX37FRmItBpPjs037ujJqvbqKCjsBAWuyVyk4riCtgRFjCBfAahyoEWyBgINvzJSzGB7lK3m5vTtNwuTsrAZsr7xf2habBfEqhmiouqwTyN6sSceg//5X/seVqLxoJCTy4t9znyWf/CaDhG0t1AQvbCO0sMdklscp3csZ0c4BaGneA/TyUd7lgxgUaaYdUrHWYhPs+f4xGq10MxBnC+Lf5wLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfOW/FDs1xnTjsITjlNfdt5edg69hfP6Ls6kWxo0gFU=;
 b=TtK/kKyT51WjeSLyjzop2pb9sF2YWP5t/Cm3j7ELDMqlwaafJI9D59ErLQ2aDicQYc5I+tgd3QlKvYDN/OBLbPcV9ljnL7i3Q3Mn9YiplQuMBCpGZSryxEA80MxMU/gCYenulLOD6YO3M5rSQvQyKzRVX+QQOdbn4JiTuAzkDO99d8wUgb6aJoShTKnzCiBjTXbBnt07hp9yDabMB9nGQtSj9Lj+WrJxmkrSUQB0rvExaKIasp7xRoiYjX21elGeH/ZARKVdWjFnldLTtbPnVJhnl5TM2URmd3km7V4zd7rdugORA4Z8qRVTe9og1SxPIMeKvO2VJrrlXVDRMSpxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfOW/FDs1xnTjsITjlNfdt5edg69hfP6Ls6kWxo0gFU=;
 b=YYsxYWS4U2AghhtXzmqi/TfdlP0e8CGtxjCLSdbszl7UQc8aAg2xuMNGSucdRFD7hgESxjofI6dCEBZXnLztCkHne3zNcyxE/Uc4o9y7OVzG1B5G/ipDruKbest9UUsUGtZOR0ChTn5rAfiKMuYv7wKcfUHqV2NS5b+TlrTfeN2K4LATurfTTl5nKKUhdowlYdInsY4uanaESEhWu6S4QZPGIYyL/miYhdEuuwasbM6NJme7R7zuIcEmE6pPfd6aZclWRUA3hNKpao4Hx5EtklVqxfMqQIlMmyVSrXTzXVO8HyDnzstueh2uT8lV9/I4fmqs+3IV5oaVBr7Yz6Cxnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 20:26:29 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9275.015; Wed, 12 Nov 2025
 20:26:29 +0000
Message-ID: <a7891c0d-77ff-499f-995c-d47040256362@nvidia.com>
Date: Wed, 12 Nov 2025 12:26:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] ACPI / PPTT: Add a helper to fill a cpumask from a
 cache_id
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-6-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251107123450.664001-6-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f0c031-3aab-4a3d-3ebd-08de2229c2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0x3UjZRMGxjRE1UWitsY0Jkb1dYWCtXSURqT1BkVXEvV1AzdDRzQStaZFFo?=
 =?utf-8?B?b3MrNXIwa3lYVUJCUEJteWZuSDR4Mmg4b3Vvc2lKK0IrSjZJNGY1TlVrNW1s?=
 =?utf-8?B?L3F0ZTVHMWIrK001a3cwWEdhYm5TM3htRUpPaDJwZHRYL0MvTW80bDlXQSto?=
 =?utf-8?B?ODJzd2w4N0ljT0YybEZQYjBqdkZqeGZ5djBQSzErT2RtZCsxZStMQ2g0WlFo?=
 =?utf-8?B?aUhNOENtY0piSnVtSHFwcmsyUm9haEp6UHpqOWlrUW51UnVKY0dvNEY0aE4w?=
 =?utf-8?B?VFN1dmFzN2FsaENvWnM1cFNYeXhMMUhmRDAxTUJyZTBPQzIrM0VtckpZb2tt?=
 =?utf-8?B?MGlQNitXaUtXTnFpMXRKWEp3MWRFMzdWK2JkeUM0czR4SzE0V1VIZHVRRlRM?=
 =?utf-8?B?VFdBdjdJZEZpQW13c1BPc29ISldIYXhiRWNMOTlZOGlpb20yV0p4NE1SMnhQ?=
 =?utf-8?B?aXdKcUpBR3BzNS9IYmZ3cGUvbUR0d2MyaFBLdXJiU1lRNCtSaDJJc0VwLzBn?=
 =?utf-8?B?aGdVQ2NueHI2WkR2K3libUUrd1JCZVdndWNOL2JEOE1FOEFTK1h1cmxGYThN?=
 =?utf-8?B?dGxSdHcwM0hLY3FHVFJLdXU1SXhhRWdqNjdBWHZoQy9iYkNybms5ZTZaeU5S?=
 =?utf-8?B?RVZ0ditJZ0t3RURIUFFmWlpxVmdNNmJnR3A5R0M1Zk5qcGxWS2E0K0Mwb2pm?=
 =?utf-8?B?YUFrQzFwdzNzTk9jTTdGZWw2SHNsSEVwZCtLTVJPMHJ1YTd5RDZRbVZFSUg5?=
 =?utf-8?B?MVl4clR3MkE0ZDMyVlhpQmNyUGZrUFNjTFdENGlpUHZyRkZid0x0U1RNWkRx?=
 =?utf-8?B?cU0vaEQ4a0s2c1RzTk4vWmo1R1crUi8yNEw4MVZYL0NjM05oVFpsdVlMcGM2?=
 =?utf-8?B?L0ZjOXJMbnVQUzBzcTdRSkhUbVd2bCtBWU5DSlNuM25NRjh3cVZtaVBoSW82?=
 =?utf-8?B?LzJ4RmQ5NWdrSjhZY1NYaUhPZWNPV2EyOXRHeGo4UFY5bHBEUzRqVUovR2h2?=
 =?utf-8?B?dXdLNmdHb3hCK1hyQ2NTbFR2di9Dd3A4bkt2VW9PTi93WWVuOVczajRURTNK?=
 =?utf-8?B?V29XUk5sRnJSMk5VRzhxMDlPRStidUdydUFsaldBWkdTRVNLSVFONW1wb3I3?=
 =?utf-8?B?V0tkS1FFWjZFaTFwRmxBNWlnTW94RXBEV3h0aU5TVGNBZkJnRmRha1E1Y2dT?=
 =?utf-8?B?UzMrb0RvT25xQkRIMGFRUmxRbjYzbit2NXdva245c25BRGtic3RGQ1FtWlN0?=
 =?utf-8?B?a2g4Q3ZEZHo3NXM1bW5KdE4zSTFsbXh0TzNJZ09YUHk4aWVHRnV4MUxPZDRt?=
 =?utf-8?B?bHgwMDUvZXVpd1NpeUdxMUNyTVhnZVVXeWhPbUZ6MldKZnd3UWFjdUk4QTR3?=
 =?utf-8?B?ajZ6TFVmbW5ZYkJnb3FFV0JVMlNuSzZhOU5RSm4vWVhZNklBTy8yM2N5WUtn?=
 =?utf-8?B?c1M1OVVFSUo4cHdzZTFMeU9kd1kxYjRtRmc3UXFTVCt3enRvbC9tSzNXcHpR?=
 =?utf-8?B?NmxIOTYxajNicDZaWUQ3c2EzUzJQcTdNWExGS0hkRi9YbFd4ekJ5RWtZaERP?=
 =?utf-8?B?Ri9RbzV0RWtndmRhdkhpZkw1UFdINGxreTVrRkJ3VklTYzNqZHc3NG9keWZs?=
 =?utf-8?B?a1hqaEJwanBBZDR1YTY4Yy9ETDlBNkcrM2JQRmxJdEdvd2wwOWlZTkFpMFlJ?=
 =?utf-8?B?SFhVbCtZaTZUdjBtZkxZUzdNQk9mc1g5bzg4ZXRMR2ovdVFiZ3VtL1NMekt2?=
 =?utf-8?B?bkViak5DU0hDWnA3ZFJsMmN4T0VXc2RJWFJDeTBaaVRRbmUwZGpMSXVGdXUv?=
 =?utf-8?B?WFBMeFZiM3gwRVVIb2N6U09PMFBqei8wbkx1YnZoL0REdVh0d3hwaUpWbUo5?=
 =?utf-8?B?Qm0wTUs3RXdCQ2JSbEhWNUJKbkE1WUcvYVkvNWZOTzk4R2U3M0VjUk5lUU9W?=
 =?utf-8?Q?lUu6/YUQsfubCwNhkON2Kg5Qfm5GIjxd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVMrYXU2RWcxZEdMd2NYRjQweENmV094cXFMR2d2NGRHWnVIekJWai9MRlg5?=
 =?utf-8?B?NEFWWW5wNWJUU3R2SnFNZ0NIblJ6ZUVMd2lrR3lPeVBlT0syNTVROUlDVHhK?=
 =?utf-8?B?ZlBmSzNoTXZWeG4vZEViZUoxMlpzZ01mdVNPMEw1UG1mZ1FzVEh3cll5dW93?=
 =?utf-8?B?U085Y2tlMVp4NXVlQnJDdjViL0JzMVErL0o0WTFnQUs1YmdXS09SVWtoV29D?=
 =?utf-8?B?VGF6VEtnYVhPMlRrbXBUS21FUmp5S3NjOEpxUjhQYStkbGpBM3NHV21jamkx?=
 =?utf-8?B?UjBERnNqbzZXTytSbXBIK0xOdkRaaWZBTFhzbE1CREF2blV0dUpaUEFjVk9t?=
 =?utf-8?B?eVRocFRFWTRzMGJSRW5Sa1J6NFh6T2NZR0RKZi9FTVU1K3RHclVHYUxwenpr?=
 =?utf-8?B?T1JyWWRFV3V4Rmdjbk9kTTJybGdHRk5sU20ya2xYdk95TEQ5T1JYZWlUM0RI?=
 =?utf-8?B?c1R5OXhLdTNsdmxIeVhqdTdlMy9HQnY3YkxkWHlseG9jTklYUy9Yc01FYzE2?=
 =?utf-8?B?Tk0zY1BqM0l6djJnN3hNL1E3UWxUc1VaTlo2a09KMUJMbzhUbVhwTmkwWkU5?=
 =?utf-8?B?M1pwYnpFbHYzV2RTYmQ5a3VMVEVSYlp6N1dQeWRJdWF4dWFBRk9zcEIwU1VS?=
 =?utf-8?B?LzBwYU9vcVAyQlhEYXNOdVA3WWJFQWErMHc0NzUzcG4wbmNmaDIva3FFaStM?=
 =?utf-8?B?emN4dExrdFVaeUNHOHVtcmYvZmJCeE91QytRS1ZiM2ZZMUFFV01xejd5L1pZ?=
 =?utf-8?B?REhFZk54MGdxYkwzQXIyZFFDZlFXZkRGZzhwQ2tDM0U4UHFIc2pIWGo5Vyts?=
 =?utf-8?B?eG00Y2g3bUFxOUZaMmtGeDkvMU4vcDV5NzR6b3kyTWw1TUg5cGYvVGV4NUNl?=
 =?utf-8?B?UkNyMmxDMERpdDVxYWRnTmdzRzBrNms2REdqbmdGdTUva0lxUExLV0hPNi92?=
 =?utf-8?B?UVRsN2k2K2lMTjc1SnJKd09HS0hPdzJBOG1ibXVBZlZ6cjBQeHZYeWxGUU9L?=
 =?utf-8?B?TDZRWVYzMng1YzFzYlc0RmhJV0VnLzVMbi9DVzNOVFc2SnZ4L2pnL3RreEpF?=
 =?utf-8?B?V21vZU84OTZ5dVAzVjdRNjl3cjlHR0RBU00xNi9JQVY0bU5PNlJvTkNIZU5R?=
 =?utf-8?B?bFFOS2JoT2VGSlJ0UmpDR1NIb0ZEbEdJak9mWHVmY3BmcU94TUc5anZPUFpk?=
 =?utf-8?B?YUJhN0QwN0R5QmpQYkxuRXpNam96djRWOE5KUGN4MFNYLythZkRGYjVuSTJ6?=
 =?utf-8?B?T3N0RTdEMmtrNDBvUzV2S0ltZzBwTmtWdHgvZlRrcks1TGd1T1YzcU9hczQ2?=
 =?utf-8?B?aHI3a0ZjSkVSdERFZVJxVHA0V3g3WkI5VnlrWmozNi85eEl3WXBWT2Q0aSs3?=
 =?utf-8?B?K0RKNnl4amZ2RC8zcWhGMHE5R0NjZWhIYzJ4a01pZTVndDVUV3dpWE5tdi9m?=
 =?utf-8?B?ZFE0S3V5OVpIZnovcGNjcmlCbVBScXFUTU5PeEdrRkJlL005NDZBRGxkNUww?=
 =?utf-8?B?SkJMVmZZV0hXdnRrQ3JhaTNpY3IzbXdzYkNJMk9LaldMTkpDUlBvYkdwSUtz?=
 =?utf-8?B?VlhsYkdyMEVuMkZ3a0xuQXVBWkNpY21NS0Y4T2Z0cjVoMHZ6SVp4andmK1Fm?=
 =?utf-8?B?MnlBT0V5UHJWb0JWN29CYzMyTkI4NnpqWllodm0xc2xOL1JRbG1JTTZtRlhw?=
 =?utf-8?B?ZWtPajRVVitDOW5KMDM1UXZmNVAxS2F4VVIweUdhZDhSVW9yMjAzZ2dWYlZN?=
 =?utf-8?B?V0FFUjYybmpOdzJvQi9KazF5MG5TMTFFVXZpSm05cnlrYUQvdjFYSERmQUJ4?=
 =?utf-8?B?bUJGOGpOaXpWS01YRmZzUDRsTHB1M0tTbWxFcW1GWUt4R1NQaVRwTDc4WmpU?=
 =?utf-8?B?YXhYbjhaKzJhV3pmZEZFR01GbkFFeGZjYXBIdE93dFBoSS85MWhOZlhnZ1JI?=
 =?utf-8?B?TmhBVkk2VEEvSnJ3QUlkTXJ4OC9YejNZWTJXNkp6UXRuWW0vY1lpWHFGRldX?=
 =?utf-8?B?dExDODBpQlBpSk5jWDFGMVBIVjVLcE4vWDFXWjRvcXZKOVdkVHlpY1JWbmxK?=
 =?utf-8?B?cTBrYjkrVThXeTZvbU4xWFRVeThsZlVDMzBTQ0VTZk4xRVo1Q0h4TmY1RWxv?=
 =?utf-8?Q?gfUFX1Fe+2QCjT+P0SSP0DCXz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f0c031-3aab-4a3d-3ebd-08de2229c2b9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:26:29.0772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ct5GG5QMEpmEza6JNPmljAfl+/90HbBiJDrEKJVwz8EJkqpJ0Y4R6i1GEsSsGB9z6sGdT2Q8IWcWpHzt59RI5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_122637_602406_C62DCF83 
X-CRM114-Status: UNSURE (   8.94  )
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



On 11/7/25 04:34, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
> 
> The driver needs to know which CPUs are associated with the cache.
> The CPUs may not all be online, so cacheinfo does not have the
> information.
> 
> Add a helper to pull this information out of the PPTT.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

