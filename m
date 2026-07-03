Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DBAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPUYQ14h5dnS+HB/5jpOh91xRJcFeh1FhSU5Ru/ETTs=; b=DDIJjXLnm3XuniXMBV8sLcfoXG
	w4XPPjtKI53Wv9sKAl9NaKHScLtst5olXU9P+DppgDt+POn+lTICJb93CVR3NQ3N0yr9WidhWa7o+
	P8ldfrcoAfYjDlxn8ghxTTvZ5fgfXPHHANuy+6u5UG4msBz8I9Xvh3/zFae4Rbrxf3Hk5OQMNKB8G
	ijN2afgVv2y9YXrolKD9x7r//e1WEe3GkQgPd8X6Tpa314NDBuWtYAiAviKtv/QNT0NFxXw58jMNN
	pglO2+w/P8p5fNGHnAOSP4cfz0BUUK4OFq1HRDdsQciHgG7WXpx/siDwgQeX//JrnCiLn1rZQBUKe
	r16N/SnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWbX-000000065q1-0aOG;
	Fri, 03 Jul 2026 05:38:23 +0000
Received: from mail-westusazon11012008.outbound.protection.outlook.com ([52.101.43.8] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWbU-000000065p0-3Kox
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:38:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5p+DFxShFwy5iQI+zRU6g1PfPtiL2b5D7s0RVN2hloYy5Z9bVE1TNXHljm4M1j5Zw75zfFLTqQGSMH2mI1ulj+sjAfiI6iCQFm/j5ttjTzTOXEdgUVrxpM11ka8rN9VTf7RFOZJV9sRTVnl6AIqo/hXV1ngNurXYSYjUlLRJ6KD2XkAhXOraTo/iF+r2dnhKOnBkaGTElBCoZNPnd7LYTtQfFYz2ibOOMzn7H6xdUhTqGtq6x0cdUQrRu72tmMSqNJM0AITHgnDrX0IgdLOUkggYd7e5xqsjtVo1vVmRqv6N/U1YgF45RDPejqig4WsDoo7617fNT779S16n/i71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPUYQ14h5dnS+HB/5jpOh91xRJcFeh1FhSU5Ru/ETTs=;
 b=LVfNU7N28Z7A5PqUKeKz1opj1rpVoWuzBCXBob4t9BYVTdpqdaSGFlW+NwqadYyMh8s/ikygO6s8Pp/06xyzjRfsbRHVgm5MK9Ar2bPIlvYSccybzKZLfcdkGb5UsuTltOCKcZN5lGdx0DgkeYV3qXRTPb21SOz0wUnMIbUObc/cCNfPPGapEtlGlWh+HWuBcdoj6s+KqfkaYQ/wlLcQ6BugC/LsqwN261SqkCtxs8dvQgui5vqozfBOPD15ckwTT4pEYP2tmyzZsGY2khe7QyysopWUZIKpbMKtoBMgOhyolF1VHJgo9jVi3mBtv8tlI0ZrniwMjYJPqOC+N6NwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPUYQ14h5dnS+HB/5jpOh91xRJcFeh1FhSU5Ru/ETTs=;
 b=HD1IRuJebrn4VMj+/nvAFjkXN1brecvZc4rhBUHm1dd8M/emdt6lQtZKH7ME2bDtDY3EQl8uAfPp8bwY24lb092iPUuSU3aWMho5uXpcr67pEMRZmvgk5XUGqYgpHEjxGYdL2d1pZmBTssolSCfPDhBAufUMcJpCvISONOPY6whaKVqx06DedhV3x65I61jPUtdHV/1Ac5yvwR/twNXLniM0wgL8RTewR0xILMU+Jo92PUm68sGx6Rjgpt8gX4JfgmTIhOhbtfbv+R8wX5vF5EE9Brjh6dE8lJXzyyocIowAuEvoLbc3se3Ow1foxoFYOxKj7Utun8pSSMZC54I6/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 05:38:14 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 05:38:14 +0000
Message-ID: <bc218e15-ca03-4328-af69-16303db3cbab@nvidia.com>
Date: Thu, 2 Jul 2026 22:38:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jic23@kernel.org, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org
References: <20260520212458.1797221-1-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20260520212458.1797221-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: ffcd2a3b-34e9-40c9-9891-08ded8c546af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: az6cYkFTXO/++Ax201MX1Vfocjhj6lEqpKbI2PaXIc5DcaUAwrh0e5nbo98JfSt7XzRJXwZtB0ToQs1O8S7sOedISSbLqJEN/B3ikCJhNTMz2eO4mQ4lf4kYVeaFFbolkDw2b9yT15bnDVTtZ1usW7Y/C/tEy5KWzKfmUbVLbTkZne+A1aijLw5w93oh07voDlBBtEwekWOuIzj6jkRRuje0q9ogAwfnHjIpPH2Waxjl81qYQBEXIaOhQSrzNU09yGKvi8k7bl7WZplt7HZYMJstF6U3nqzico1/LqHKymJb2J7aE0RBKZPF/0t+TeM8ojaFLrRYDCyuZtHEdpHtmpicfUcWzjTuBQMsLJ1PE8f5xWlOdOdiHh6qayrNltVXxdra4WX6d95N/G8gHbgsG+SdPh20AJYrzHXppi8B3Dxqp43XtnJpHXj1h6nrUy/mXO4gkHlwGrsHQdM/QaLUFDDGaxe3pKKQNj6CTTeO6OyoZTvGbObTilSRKSVtAJFR0PdWeq5yb97PpnfBSwykC+N1zdf2Gdf/bU2wrH5/G3avwjFG5+NGx/EcBYOZbOip7wMT8VUfZkwObp2hYUTbf1krSK0oKV/S4c/orAKuaIr+d8kg66yV0RDdjnJhf5swwYPp98hGiV6Ya28XkE8PQ43OPsc0IEOF0eKT22Z4FoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnh6S1FPNlY1bTRVd1FIdzgvc0lGMEFEakdTd0dpQTVXVHE3STdOYjZvemJV?=
 =?utf-8?B?Rjg2MUVTaVJVdDliaEtqc0hsVmVMNjNYTCtRUHB3cGhPY3VodzlvL1VQcGt5?=
 =?utf-8?B?T2o2RmV6M1FTcFYzREg5WU9VZjNMNGtneFRRbHh2SjR1Zm41cHdaakNLSVRT?=
 =?utf-8?B?M21FdU1CL2JxN0dOMkF0aXd3eXRKcWJkSWZtQ3IvVnh4QTFNaHcxeExIZU43?=
 =?utf-8?B?bTJUNlpJa0Yva0RKbklsd3AyVW55MEpnVXAwTG83K2J6ejJrdWx4KzVsQm5S?=
 =?utf-8?B?WUhwOU9HNFNyMGxGU2FQZDRLViszK0tjQkRTcDNXanB2bENZcVdIcVNzbXhJ?=
 =?utf-8?B?UTAzcEkrdUVOdWd2N2YzdFdDUzlndGU1ZDhRb3hYU2kwZHpNUWVnNXdXNi9Y?=
 =?utf-8?B?eFhuUHJCejVHdTBOOS9DMWIrOEVMcUxnN1hMSVlQWVVBTGNFd05BNkV2dDdZ?=
 =?utf-8?B?K2IzL0pHZkVmWE81anIxb2JrRmhBOVJKSTVHalo0SVdEb0tNSXFpMnJLNWta?=
 =?utf-8?B?aEE3Y1YvY3F5UTZSaE9PbzZTbFNVYnh3clVIZkhrV21LNmdmUUhTVy9PL1lj?=
 =?utf-8?B?a0FyaWdYcVV5VmtSRGpYME1nSElTa3VaME5QaTNRcTZhL0RvTkl0MzFxZkw0?=
 =?utf-8?B?SHE4ZzN0dHlaL3NQZkRGWVZkQU5hNm5sdGJEejlWQSt6UFJiRTdRdVhLWWhC?=
 =?utf-8?B?TmV0NGt0L2hQU1hsd3RNa1ZhcXNTUWoxWDQ5aWM4VmRESm5ucHRjMGtUVm01?=
 =?utf-8?B?NFZ5NHpxOHJoVUNvSTliM3dhaXloZGUxR2RrWnhoWHN3QkdMVkRiVGdpOGhy?=
 =?utf-8?B?ZUJEL1JNRnYrcmhaQmZkSkNveE5ONjlmRHUzVlVCWDIwZ0NGSnd5UmFaTmxJ?=
 =?utf-8?B?WldFMUJrZTU1aHJBRjFJYTArSjFsdTNpcWxOaGdaSm9nbTIvVnludG03NlUr?=
 =?utf-8?B?R2VOYW9NZlRBTU8rekdTK2V4SVZsM1pRM2dmeTdndVgxMGhjRVhKcUNnYzJm?=
 =?utf-8?B?WThCRUxLUWhIRnZnV0tWcDlXejh5Mkw5VHo3b1FScWFsd1R3ZXgrTE4rclBW?=
 =?utf-8?B?WG5rWEJDZ0lzZkFpUWRQd2xHRjBKQWdpdW1GeU1tSHUveTBoSkpYNUROU05N?=
 =?utf-8?B?NytmbktpSGppNzh5NENFMzVYTGpoS1RONi9ydkhmTm8vQ0hnOHYvNG9FdTdN?=
 =?utf-8?B?ZDZwMHFEQnltd09hRGdOYk16MUEwNmJkdDUxanQ5NFdWQ1VrYnFmZXRsMW9s?=
 =?utf-8?B?YzYwZ01zREM4d2tzUWhSUTZNcTJqSElKdUg0eERvaXZrYWY2R2hpN21sZG5B?=
 =?utf-8?B?RkxMNE9tcGp1MGQrK3M5SnB1NzZ3VUhwTlBXdm5SclZUejZZRWFHOVBPdUZ3?=
 =?utf-8?B?NEtSRmMrN2J3b1h4SUtEUGJSRlN1cVExOGlpdkppVzJlM1NDbGhZOXo2bEV2?=
 =?utf-8?B?QnVLZWM4Nzg5YnprWjN6T2ZKUTNqZkJ0TVlZMXpYaG1XRzlWQk11czBoa2lp?=
 =?utf-8?B?a1Z6bUhYTU1Za0gvdzU4UzliRm55WkdkSmJIdytrYm5BQzJnU1RCSUFueGFn?=
 =?utf-8?B?Z3FHQ2htUDJ5Ym5yUStKMlZTWWpWSDhaelk0SUdNa3h2MFJmQitBNitTUUw4?=
 =?utf-8?B?MVllc2NYc1dJMGhSMXpEZ3cwdWpMQm1NTmQraVZxOEl6NDBpS1J3Zzl6WTg3?=
 =?utf-8?B?OG1RUXdKOWk0L1MvazJtMlV4Y1ZUNHpZaTYrdTE5dEFLaXVWUmVhL2NIZEw3?=
 =?utf-8?B?QnppMW03NTJQTEhqRTZPYnNYWVJCaDdRTXUwaVJ3bVJ1SjRPRHlVa2JMbSsz?=
 =?utf-8?B?ZkVaRXJ3SHo5SCs1NGxVSytnYVhUd0NHbWdYNVBDNHNwUDJ1RGJUbXNHVnY4?=
 =?utf-8?B?dkFPOFg4cnJma0R0ZGl6TnBkRitVMGd4MTNNd0w4cktIeUFFYXhva1dVcjEz?=
 =?utf-8?B?MXFIRXBOTTBFTWRSRzhQdXdkSWUycU1RUVJBMHA1RlhZREVCYlB0V0xpZlJH?=
 =?utf-8?B?NnpsdExHSUdtdEpKTEd1dFBEdGVDL1FjeklPR1pBUnovNll4WFV1QUNKTFpX?=
 =?utf-8?B?aE1TMnFQQWQ0d3k0SFF4R3Q5RTdHMWNLUCtXTmJ5QVJ6ZjJ2Y3BIN3BXRW91?=
 =?utf-8?B?NHh3aDU2R2lJMDhPVEg3ZGxYNlp1YThYMWdUbGU3cmMwTVYycllBL3RwUWxt?=
 =?utf-8?B?dS9zTnd5bnNyeE1oL244dHYzYmhKM1BlYWJ0MXc1OC9jSE1PY2FjRFBKQ3k4?=
 =?utf-8?B?MUFoYnlpd290a21ESUg1eEg3ak8wazZMTGlBeURTREUycFVKUU5SNENiUDdm?=
 =?utf-8?B?Rmd3ZDdRYld5Y09mVHZwMU85a05HcjJXSEswTkdKTG50ellRdjZkZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcd2a3b-34e9-40c9-9891-08ded8c546af
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:38:14.1534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4XytSl5Uz0LkjHJ03xDm+MkXZkWoVRXFkXsCnZeGN8OWSpzboylHzQrRlrx94j2OJXWe4Vc/RaJS0hReOGNIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_223820_844894_B4877C0C 
X-CRM114-Status: UNSURE (   9.64  )
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



On 5/20/26 14:24, Ben Horgan wrote:
> Version 4 of this series addresses a few review comments and some concerns
> of the sashiko bot.
> 
>  From the cover letter of v3:
> 
> Removing the rfc tag as the resctrl precursors [1] have been queued in tip
> x86/cache. Due to that dependency, it would be good for this to also go through
> x86/cache.
> 
> This series adds support for memory bandwidth monitoring.
> 
> Please review and test.

[SNIP]

Tested-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

