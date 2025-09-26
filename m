Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1D9CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cuxjqxQ8CNRPSSYECwUBuMMXV4X+BLivQ95oh8Ujf8=; b=oxwH4TMtto6lZDi6+uJrA+XoSr
	FC19Ba0HZY5AIq1t8l1zSFygxH+NbnSZ/0XLjHWyo5u9PO0Y8m6tQ9ygkiVr+zU7/kq8LDvUhOCUY
	tlsuYhTqYAKQ7Ed2ipjcLGZBdGCK2A3PMzpSBWa5uKUWK9HliqdccEKFF8xwR5Dl3BqSPJKdrbkiO
	Yd6QYS3DqVFi9fxgDZI2NQefJH2IFsIMuE3lpBzC5UrkkwrAUUv92Lnmu4SeAjSy2Py6VyM7gQRx7
	a+oe/4JZwAyBVlS/ek87mVOkGl7CT7j4cgMH0O2AZdhcOmmMfgPmdhq/enlAdDAtWP1JXfyBoKfuQ
	cN3lPnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Cc3-00000003MY1-0RrX;
	Fri, 26 Sep 2025 17:52:07 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Cc0-00000003MWo-00qO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 17:52:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWxYr2ED7HFKGRxKaLnXocFwl4OrDy7emk2mzH+0aysaV46ytWxGyIbS6P17X4ndND7AP21xm+QhdVaKKJFkM3gURiaJqAoQ5AJN7zv4+AqPs8EOWQK/6lCNndDjRYZlsevx5WWolSqJT7a/NM8UC1Ar3O+HL/5AmnZ8UpOKrpafFWuyrk9HSrl+YNeyfD/3o3rRb3PlRdcPzhdNbcCSFYquZyi4W6nUmEQkgOoSwkuPu46cXalnt5cm4rmhrNrbjbn9+tmr8jK8hTzU/U8+Zm4W8dNF2eB/pIRmesG/JWFjJhoOrzZt4xdzG5bmVYhLS2IU0ItxSVtTslnUtBm5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cuxjqxQ8CNRPSSYECwUBuMMXV4X+BLivQ95oh8Ujf8=;
 b=rVy0+HH8fp+yM/Ea8nX3Qt+TCS9OLTPPgSo4VnKwf/me8A0Ev9e9lYYk/2vPAjg8lDcnBjnckWVtyfJfilPJB/Ki5q2bOht91TWRHOdqSUmpXsXKpnPLPo4j3p2p4CCeiG0jpPSQtxMhHA715+obVnijQIPP1QbmMJ/8q42kWeUlbWpC6MthFB4Rm2y+mZRBbjUI2DtkSUFkb21qw4L0wLv2z1i5AQJ5GQrm2zcUJgTomTX6x7uUC8RqJ8EDyE7Ahai82BYI4ZPeo6eA+q2xOL+XgZ/CXmkDZ4CFU/Ln1MRbFSgN7KX+J+iTuX4SKSnQV9CkzX099x4oJPvVLon5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cuxjqxQ8CNRPSSYECwUBuMMXV4X+BLivQ95oh8Ujf8=;
 b=h0BKv4K/UbFVGEBHAXDWqqLmLd7XGchxS5dAphpCfQuFi/Itw8Kyql/VEPYnIQ4t03W8d0kVtEJEiQ6mudDpR8WMQTZYxJCu2Req/r5RHeBbP+WyvU2wQZveyJLMUtV933kmew0pgCcni5TZ8BFWtl8Z/kdLJccVE2aQBlgB3VY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ0PR01MB6400.prod.exchangelabs.com (2603:10b6:a03:2a2::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Fri, 26 Sep 2025 17:51:56 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 17:51:55 +0000
Message-ID: <bda280c2-8eb2-4e09-8f46-6ec7951a09cd@os.amperecomputing.com>
Date: Fri, 26 Sep 2025 10:51:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: hugetlb: avoid soft lockup when mprotect with
 PROT_MTE
To: Catalin Marinas <catalin.marinas@arm.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@redhat.com,
 akpm@linux-foundation.org, will@kernel.org, carl@os.amperecomputing.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250926162034.1785899-1-yang@os.amperecomputing.com>
 <1038c7c7-81d6-f273-6fa1-93eb7206d5ed@gentwo.org> <aNbFtaVr8f2klqdD@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aNbFtaVr8f2klqdD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:930:d3::9) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ0PR01MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbde6ce-a750-4219-5bcb-08ddfd2561dd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dklnQnRYVTRNbkNrNHJoMVU3SWJZdTFFOUMzazg0UUZEcVIrcmFBMUVnUjJQ?=
 =?utf-8?B?MlRENXdOcUFHVWxvR1pCM2pOTnRkSWsrQTI3bU9OZDFZclMxdldUQW91cndJ?=
 =?utf-8?B?ZHpma3QrTVE4OWFjWDVITC9DQlprUTFPVlBBNzVkT0hqVm5wRkY1U01tR1U5?=
 =?utf-8?B?ZXU2eVFERlJiSFlURER1cW1zRUFjckRPUmwyY0hiU3poYjJWVk5YejR4K2ln?=
 =?utf-8?B?bFZ1Vk1VQTdOckNSenpGZFdrVmpmMDJXQk40VHE4WDdlMW1TYndRZE9YVVhH?=
 =?utf-8?B?b2VUMmVTM09IK1NienBzanhLVzZ1bE9CNVZXNnl3RGxQS0FOV25aWjRtU0FG?=
 =?utf-8?B?M24rN2gvWGVBZnM1L2EycE00bTllYk9ZNFl6aGJzNU5iSnF0UDk2UEV6d3Nu?=
 =?utf-8?B?V0ZSNGFWU1dISFB3YzJwOFcwbDRPQ0kzZkFkZUkvQ3lkc20rc2hFbjlFSUdZ?=
 =?utf-8?B?TDRhNTJVZCtLL2Uwb2xOVlp4Y1IxdVA3N3hqdXQrUGFWajlwZnE5RTlqdmZU?=
 =?utf-8?B?bURuTTFrODIxY0VubVJlaE5lTkw2ZWZncnEzNjU2RkRUU1d1K0VsU0I3ZXFy?=
 =?utf-8?B?aTBiY2dhQnpaaEVTOVB4d3lzQXc1R252OW1jZ2VoUDh2VzN3aUd5Z2RpTFRZ?=
 =?utf-8?B?MjlMYU5uRjVJZVE2YVEyc243TEVsSWN2ZWFhRlp0NGRYQ2hpL0tzK1NQck9I?=
 =?utf-8?B?VHpONFBZYjBTaVhZaURDMXNDa2hXSjFvaVlOZzJMb0JndTNIc01NcTZVeTEz?=
 =?utf-8?B?R3F2a2hSd3BNU0wrUzYxS2ZmR3FoWTQwRzZ0aWxVRFpHaS9vQlU2VVM0Y1pi?=
 =?utf-8?B?WURObUphSVNoaVgwMzU5bExIQTVUMDQ4ZUVaR1V6c2dYdjVjYkJqMDZVMCsy?=
 =?utf-8?B?NWg4RWgzSmdCUTdFL2p3ak1scElXdmJDaDBielVxeGdBdGZFS25wR3dvb1Nx?=
 =?utf-8?B?Z2RWdzVxeUViRVhDL0J5U3pYU01rM09RdTRoN3dkVk9kZEdleXZCK01MbWFZ?=
 =?utf-8?B?V0t5c1lIbmQ3MFlTWVlDTERSaHFzVHBqVFNOanRPeEx4R1NuZHdIYW9wenVr?=
 =?utf-8?B?Z2tSL1YvY0ozcUtSaUU3OTN2KzgwdWxWVXMxN3NUOHlobWV6ZHowcnRDaGV2?=
 =?utf-8?B?RENwMjZjR2tYWVpKWFRnQngxdXhMR2YrNHhVK2FFWjFXSDN1cHoxcm9MK0VQ?=
 =?utf-8?B?MDVGQkpCZWQxbWZoSHk2alhzUXFFalpNZkw0Y1NtSmg5Uy9KSWJtczlWK1dx?=
 =?utf-8?B?aktOWGhqMUE4ODBvRTZLdjIvODc0dUxrSzgzLzdPME41UnBQRVQzb1oyTGZS?=
 =?utf-8?B?ZkZXVGc0VG5RZzZMUktNR0xhNnRnYnk2NnU4TDBHZ0t1b3Qvcm5hTkkzazdW?=
 =?utf-8?B?bmM3VW9sVHJmNnZuSVlVNkc3anUwQVFTWSs2YXFCWmFQSHdtZk1DWFh6RFBY?=
 =?utf-8?B?ZkxpVUQvZDlienppdUZWVmMva3lyVWhONml0LytKTVdUZElRaG5PVE9qK1g4?=
 =?utf-8?B?S0JLbzhnSU1CR3NWYzV4TXdFaDcvMk9oUnhoZ1AwTlhIU0EzY3diSk1DelVq?=
 =?utf-8?B?SWUzNERhNGZvYVRkQ0tSdlQ5SEhKR296em5SaVBValNBMlJ0T0IyaC9URGdD?=
 =?utf-8?B?UlVBQTJ5RjdqNjV2KytZYjlXdDVEWVlFb2dnUE01R2RZNkcvTUdBR25nZUs4?=
 =?utf-8?B?ZEU2cEF0VXE4MnpaM0RORmVDdHhDUUN0VHNpSkJYWXJSS0F6OXBMZmg5VjRT?=
 =?utf-8?B?RlRSbWdMaXBiQmFzcjhEelRtV2F0WC9WMTdMcHJ5TVFmWU5VdHZGNFc1ZWVs?=
 =?utf-8?B?MlFIbGM2RVVtcnFYcXNIK3NPcG1ibXVkbWFzbTg4WTBRd3VjUU1IVVh5Vk1O?=
 =?utf-8?B?Q0JPRUxxZ1BlSnFCQlI0bEovY2tOZnhBTHBoTlpVYkhnV0NXbDNPU0NsQ2V5?=
 =?utf-8?Q?39/LZrcU1BbL/cFUZ+OR5jrrqmLNbbn4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXRNaTdzREd4TmQveHlEY1N4VDcrV0RGZ1FHWDRSREpSOGNPeWdsL3A1eGxU?=
 =?utf-8?B?V25yZzUweTVpRFVidmwxcFVaNG8wR29kUndMZkxqRS93UWsrRkdTMEgzZm5m?=
 =?utf-8?B?UU1oRjVZWnpHMHQ3ZlpaaGx2K2RnU0h0T2RBdGdUY0FKVnB5TzFaYnVrWU1n?=
 =?utf-8?B?V21wWVk2R1lIbjNndGNvakhCOXVpSXhXZHVReExEQllmQjZaT0pjL0ljd1lX?=
 =?utf-8?B?bnF6VFZyMHk0T1R2a0FYd2x0cTJBK1l3ckxaTHlSVnF1V2dUTndoL2dTeDZO?=
 =?utf-8?B?RVNtbDBEdTdYZlNVL014bDQ0b0NuQ1hZeG5XYnlZYnJON3ZLNEFkTDVlQ1dk?=
 =?utf-8?B?U05vYThZTG9HZU1rbXN0ZFdhYmlQUCt6ZzFWUCtoTGlTMGlyeWtMcGQ4aCtS?=
 =?utf-8?B?NkJwcVhMckVKUVNyM1JkSjRaTDZPN0czSTVWWUdFQmNkUnRkRmQ4bUR0QzdQ?=
 =?utf-8?B?d2ljcnQ4QkpWdUpTa1VKNyt6cFhyRXBWa1FvSUZ5ZzZrQkhzWTJNZHNNOVZI?=
 =?utf-8?B?T3BWZ0dGb0hneU5oM2lCcFdSMGVwUS9pMzhYL25vSTBEK0d3OFVPdnBDWmdj?=
 =?utf-8?B?LzRPVS9VekdJQmRFaFFNZ1RuTUdITXRQaG1aLzhFbXNjNEE4dFMvYk03OUwx?=
 =?utf-8?B?dXJHUGx4OS9zWDVLR2pRcnFUS3MxRlZYWmNOc1VsaXpRRWNzeDdnWWdEdXNt?=
 =?utf-8?B?b3p5NTZnTmNZWkRXRWYxbE56eSsrbnp4bXRka3EyemJXSlNwTHJuM2NiOERJ?=
 =?utf-8?B?Sk9sNlBqZkVUK1A4WVlLb0NnT2JYR1R3OEhrZTZrUmVnUFdJNUJRL1FDTTlM?=
 =?utf-8?B?T01GUVBVR21ra3ExYm02ZU5VdTZQdEFyaHlVZnBWRHY1cTZ2UDlUbERWcm5B?=
 =?utf-8?B?MHZvV29tSk9HbXNxbnphckxnNXBtR21yWTFyeCtzek1adG1VMXpxYWxiekFj?=
 =?utf-8?B?VnpxSFZSZk5NSkJoUzI4c2FWVUV3c1RRVmxISWw1NHU1a0FKbTdkZU1GR2hw?=
 =?utf-8?B?VlhYTlppRTFlK0VMWEFnZkJtNEpHOXhXVGp1MFVIMUZPTGJTdkJmOHRTM1hH?=
 =?utf-8?B?b0ZwS0RhbjBidW02Z2dYZ1J0QnFyRVY2eEp6MVl6M1NaMEdFREFFQnFCZlh3?=
 =?utf-8?B?VlpySG9IblN4Q2d2OVFkSDRWRExGQ0dqOVU2bTVrazBJRkExZUVsOCtDL0c0?=
 =?utf-8?B?a0hpTEdpdUd1R1p1MWtIeTNSK2JvTVdXeFE1U1ZWWGp6dVc0VHlXeTZqQjQ3?=
 =?utf-8?B?cEl5YzAvalE4K0ZJTGhRMzJsRDVZTWlubU1VOWRsQWRaKzBjR2gxL0Q0TlhU?=
 =?utf-8?B?Q1M3cENEZmRGOFhFTnF3MDEya3N6RUhDaTNHVitlTkpjL0NNOFYzY1huZzUr?=
 =?utf-8?B?ZkdvMksraUFTQ0pseVRKbVhEMjFvQ3lDZFpmUXRnRlBNWEhndDJaNXV6cmdl?=
 =?utf-8?B?ak4vQVBKOWRiMGs0b3JlNEJYMzhVWE9FV2dUSTRnZkFjYlJlUC9pTjAvbnJI?=
 =?utf-8?B?WlVoRXJtRnUvZ3hSem5KNk53TEhmVVh3aENna3ltSkd3SlUxWWkxcmFlaVQ3?=
 =?utf-8?B?RVdwellHRFJaMURyWEhhQjRPOFNiWVlXQjlwL00xNHVUbW0xdEhPakUwM0Fs?=
 =?utf-8?B?S1hsR3kvQnd1OWN2SlVLeVZrblhVT3VFWDBCOG4xU0ZQSHovWDJFS3h5N1dn?=
 =?utf-8?B?WkJjcEVTQWlzTlRXNmtDVEdtaGlWVHpyUnJUK2J5WXB6RUxEaHptWnNxZlhm?=
 =?utf-8?B?MGhPV2Nma0dKcGxhb0ZwR1N4UHhBc01qVWhkNTZZYmgwRjJRTlU0Z2RPZ3hy?=
 =?utf-8?B?VzJxN3lwYVk5cjh2eDdrdHFlZExQRWVOMCtxTzM5SXR1c3p0T0MrSlZ2WUpa?=
 =?utf-8?B?cjU4NG4wMW13eU9KK0MzbnE2U29wUVFGQTFNem1qd0loWitkM1pOOXNXaW1L?=
 =?utf-8?B?WTVraFl6Y1VvSE15UTJ3QmVlMGc2RGZ5Q1gzSDJCcExodVF3MFB4RUNMTW5F?=
 =?utf-8?B?R1JCTWtEQ0owczN4dnV1c0VHWHBHa2M1S0V2N1ZHZlArR0hzamtXSW9CTE1o?=
 =?utf-8?B?bFJtY2FjU3Q2YWlFRmFpOGVPYkFweFNSS1NZaWdRNGhwRXhCcTRIVEVnMW8y?=
 =?utf-8?B?N0QvMG5Ba2dmRWdJWU1kMU1wcFNFSzJLNWcrV29zWmlUemNqYnVCNmNnRzBn?=
 =?utf-8?Q?tWXrkU38JIzQP1Y89epQ1V4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbde6ce-a750-4219-5bcb-08ddfd2561dd
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 17:51:55.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46XTR03F5oyXWGQdb/0OuSYkMrwD62O8DIDJGtgs8oIynMAe52PxjQpyoGQyobK81dcrsAeFUqDHejqSiTcxGI7PVAhXf9oSMqJPjBe+AkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_105204_060169_95F7340E 
X-CRM114-Status: GOOD (  16.04  )
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



On 9/26/25 9:56 AM, Catalin Marinas wrote:
> On Fri, Sep 26, 2025 at 09:29:54AM -0700, Christoph Lameter (Ampere) wrote:
>> On Fri, 26 Sep 2025, Yang Shi wrote:
>>> When calling mprotect() with PROT_MTE, kernel will initialize MTE tags
>>> for every single page in the affected area. Soft lockup was observed
>>> when doing this for large HugeTLB memory area in our customer's workload
>>> (~300GB memory):
>> AFAICT this is a bug fix. The hugetlb path should be doing a
>> cond_resched() like the base page code does.
>>
>> It is not MTE specific. If other processing takes a long time in the loop
>> (setting up terabyte size mappings for hugetlb for example) then the
>> softlockup could also be triggered on non MTE workloads.
> Yeah, with MTE set_huge_pte_at() isn't just setting a pte but also
> clearing the tags. So it can take considerable time.
>
> The fix is indeed not related to MTE, so I don't think the Fixes tag
> should mention MTE (but I'm fine with a cc stable). Let's say we change
> a hugetlb from RW to RX and have to do cache maintenance, we'd trigger a
> similar soft lockup, depending on how fast the system is.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thank you. Yes, I agree this should be not MTE specific although it was 
triggered by MTE in certain workload. I will remove the fix tag and make 
the commit message more generic.

Yang



