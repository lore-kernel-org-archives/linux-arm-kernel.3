Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D4DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zi3QYUt4497VQi8/brVLSql052PVjZUdReYIT6X6WRc=; b=KCNtLwf95rPTPP0QT1eCnMFqNo
	8QzSeY/Uynnp0nzQ6xjM4XkxDTVLffQ2ufUpulWOtbHtApOjMtjtkeo6t3ZdttzqKcwRhSr90AhvH
	TWOyuTkK3+bDLxAnlyqwX8kywCld97WymJ6Nyyztt6UWR3grQOrIw5n6GI5OltZtdpUXNAHprtOSz
	qgbcgv/o6lGl+naG/R8+zrToOYbgKwu0fLFXU8fH3MB7SZGFrFW81zNvMRgWX2oEZPCQtIuOvbae4
	EfENz6tvhCyuUSAa77eha/99Cx0FxPn2IeW4+nZCGB1vNM5c40+dyARgDMPmTrqTuZJ8tcWz+O6pI
	Mpag5mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GXL-00000002wsY-1ZJq;
	Mon, 29 Sep 2025 16:15:39 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GXI-00000002wrW-2dsa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:15:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYe1H5t/K3GMsCzAbVj4mnOfIkia1pk30g8TG4YkjOONRofVEN5gcz9wf9b2vuSW0wRMj3Pg4Yywtlh89RqMz2FHUSKeqVdiXSKeLnAX01DHSnPtknowtSVXYtS5HTLRrnWLzJo+Ya1vTZu0q29a++wQmloIBHvKwuA7d7v43jFvhVVnVb7jceVO6+oiZLfLBFke+RFtp3bj3kt4kipA1E33ix/egizZaBCMidaaNmwgE7CDTn7IZO05A61nICMJHlzTvxkYQ2vx2lSmJRlb1FLR88KJ9z/M83OYwkZsmu1z0Ipdqd1SD7UsiEtbgmnGpAepwEsSiDX4SRoRoGw6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi3QYUt4497VQi8/brVLSql052PVjZUdReYIT6X6WRc=;
 b=ZL50ZOWuv7+YWkVAf2u6r01WCMNgZKgLpDbbHmlNRvW+QJqdsx7y+moUPxMp9fiHcG4u/oYtIuhVgW8fOaiWmaDk/cJJpaMbDCyGGR1onQeuyJVU2KTaBcs/Af0lXbQ4/ey+6xDketOYcvIJXekWfQzC4cy6CO+NDXwl8F/lfGcrfw4suYx40ScscFRJxvYWmjLzcLrUw4cuSJL/VSrpuFKXO2QKlezsnbsibwXi+WigKDwHDbuLQhuhR2X2PyuR52BrDZnwMGCtr737NZlmlrhZvHmXMxxhiP50+T6R+QO6bVrZ265SO/CysvMCZ2WobRwTZ0XXo2PqhDH3ReQVbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi3QYUt4497VQi8/brVLSql052PVjZUdReYIT6X6WRc=;
 b=hAIxr2NZJxAOBu0EdWpPDD7U5htwTsReYocKKgIyqLDLahtvdj5BkWxe43lMYSDvlU33BoS8FFS5CzTF1bOiri5Pk1XuRLZiuznh81SoQOE3pfzdO3hfo0I4KcmowwCRPz0e12csVetAvsx4oE8BU+Ynl9Kw6UBag/lC8BPznxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB6715.prod.exchangelabs.com (2603:10b6:510:97::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Mon, 29 Sep 2025 16:15:27 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 16:15:27 +0000
Message-ID: <e7575e61-fa82-4f4b-b413-85732930f075@os.amperecomputing.com>
Date: Mon, 29 Sep 2025 09:15:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: hugetlb: avoid soft lockup when mprotect with
 PROT_MTE
To: David Hildenbrand <david@redhat.com>, muchun.song@linux.dev,
 osalvador@suse.de, akpm@linux-foundation.org, catalin.marinas@arm.com,
 will@kernel.org, carl@os.amperecomputing.com, cl@gentwo.org
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250926162034.1785899-1-yang@os.amperecomputing.com>
 <a01ccce3-51c9-48a3-9c8a-1651a0f8dc37@redhat.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <a01ccce3-51c9-48a3-9c8a-1651a0f8dc37@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf88240-2be4-4f1a-38e8-08ddff73670c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHhhYllCd0R6WSswVngzMUE4SUUzb2ZXUXZnWjhVZlRZb3RLMVRSYUxCTGFn?=
 =?utf-8?B?OEJNOXF3UzRhM0M1RXlmVVcvYVlwMkFwN0lqVlJuOGhjVTkzamdVQ1RsK1Qw?=
 =?utf-8?B?ZDJmMk11azlMTzh3ejJ2U04xQUtHc1ppRnBEVFJZMkZROWNHV3BBdWl4b1hD?=
 =?utf-8?B?aWtFeFVCYnU1UXpvclAvSnVaV1h3WHcvN2lIZXRtbGxwRng3dGhXTXd6ZmR3?=
 =?utf-8?B?RXVoLzF2ek5NcXFmUnFrUU82SzNua09vU2krc2laWWNYSlZXYWRqcDg4OGtn?=
 =?utf-8?B?VVNrRnZHTE9LbldId2JZb0lKSG1xbmxjTlZDQXJOczR0Z1BuT3dVV1VEWTRv?=
 =?utf-8?B?UUhWZUczNFJPSWNUcVIvV1VyUEgxanRKQmE1NTJsS1NXOXcwZCthc0dHR1Yr?=
 =?utf-8?B?QmxFQ2pYdGpaUlJLZFI0ZGxEZHB5bTZROXFrVWRDUElENEltK2kraWVWVVR1?=
 =?utf-8?B?UmsxcWRzR2JHQ2o4V29TYlhTY2tPUi9ZTitEcDJWZGo4azRrUVJkSkYwNklL?=
 =?utf-8?B?M3pyNDRBNGhkU3hMYldLVDQzczYvbXVEMklmb013V0xBdkE5a0tCSWNET1ds?=
 =?utf-8?B?djR5Zk5mdEg2RmdrZ1NSWUMwSVZSNWdTV3dzRk1QYnlLWXdpdEFvbnd1aml1?=
 =?utf-8?B?NWNpK2FUSXhleXZNUERvTFN1RHdtTlhxZlhUdGJwMHA4QnRzM01zeHhqSGsv?=
 =?utf-8?B?SWFxSVB5clFjbjd6Mjh0ajhOb1BBZ0ZQZFZ3bytsYWRzVkpsU1NYZ1BnR1VO?=
 =?utf-8?B?QzN5dFgyWTRieTgvM2ZGM1dhSkNNSFlhdFk2OW44QUthS1k2MGxVRjQ0MnpQ?=
 =?utf-8?B?SmpuSndXb3hpeldSUStxOGJUakdTbGt2WDZSM1R0dU5kZjhGZEZDdEZmVmZ6?=
 =?utf-8?B?M0hnYXI0MFMwZG1xbU1pd1JQazBDYy9CQUNIc3h2dkNmbE4zbk1CUHhXcmV0?=
 =?utf-8?B?eHJkd3F1S2MwNkY5cHhYMnlPQVlEL3ZNYy9HenY2VURnV1BkRE9aanBhOVRo?=
 =?utf-8?B?VVkvWlB1TVlnanlSWENieDkrRHhJblhzVkpTdFpJTW1GNHJTekFMTFd5akVL?=
 =?utf-8?B?TjBINWo1T0pFYTE0QlFEWmNqMzJsc2tWYmZaZVIyR0x6bjhubnovL2trdTlk?=
 =?utf-8?B?dFh1OGNKRG5kYnVnSXRPTzB5YUphZGdQZ3E4UVZNSUtVTEw4S1RXWnp0S1dO?=
 =?utf-8?B?bCszOU9WTmVoV3RuWWkzMGRvOTBPT2hmZVdvQ0szS0ZWT2N4eUkwYlMvemEy?=
 =?utf-8?B?TFZqQ1BBck1pYnVCRUk2aDc2ejlvTnBmdWF0WWhjRU1pWTFDU0pabU03UW9j?=
 =?utf-8?B?SGNVNVhSRUpMKzFiZkk0REFsUkJaN3pnQ0psdjc4c0Vvc3NwYkpCZDRJY0Rt?=
 =?utf-8?B?RXhpYzJIejZXSzhUV2wxSjVvMGg5VFVQYisxVCtpTXdab3NiYkp4UUUxSjkr?=
 =?utf-8?B?STRvSW9LbUpQTCt3SWVxOXdpSXVueDREWFZOaDlscjhkZTcvdStCMkFkUGJ6?=
 =?utf-8?B?dElENmIrMWIzUm9uRGl4dWtUSEdWaUdVU0VtYm1jTE1ZenZRQ0VLSU1IeHZv?=
 =?utf-8?B?YUk5aWhBcVNoR2FObGZGN2RURDFXU3FuWTFCMFlzV3RDb1VKSUZXMVVETjVC?=
 =?utf-8?B?WWdxQ1RuOGhVRlFsTjd3b3RjTzJMVHRpMVp0WWtreURKTUt6LzdUYUdRSjIr?=
 =?utf-8?B?ak9aQVkrUHlITytFUS81Z0NScldvVkgyUEl6SkhUaU1uaEhvMndjRWhaNFQy?=
 =?utf-8?B?b3VNQisvbnphNm9qNDBSYnR6RDAwam9oa25mZ1I4WlBUVys0QThhQkRmQ2xL?=
 =?utf-8?B?MkVCUkhaaFdrVnRKVjBPdlkraUhLbGErR05rWWtlN0ovNlNKd1JyUmhYZ2dB?=
 =?utf-8?B?aHlqWDNHK1NhdmdaZ3lHQzdSSWJhTmpVSFU5SldkbUxDbW42S296ODZvY3Jo?=
 =?utf-8?Q?bdVKjZ9mhiAWhICeWFykvTIHIF4IYKOo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWxCSFo5QmVQZ1RhaXVHWGh3R1JwS29wVC9oQVZqd1IrSjl4UXBvUndCdmVm?=
 =?utf-8?B?SXhGcG9tNFNYc2pUSUFlbno3OC9zQzlVT2xkTUk4b3NJLzAxajRwRDlVd2xO?=
 =?utf-8?B?RFVWTUlVc2l3U1h0RmxQS29rM3hJcnN0anRzdGJhWlZXenhLcVR6ZTdsZ1kv?=
 =?utf-8?B?a01wYUlyeWpLQkh4eFFwMHlMMVVPYVNYVFJ3UVBWeWlBZFFUbVBZWmNyMjYv?=
 =?utf-8?B?UENsQS9Kekw3cTc2Ym9SUkRYNzc2Z3ZpSEt1RzVDcmJyODJSVlUwL2h6cHMr?=
 =?utf-8?B?VnplOUJiRXgwOWNwTGI2Nm9rcDAwNDM3TzRyek5xNWgwaDBYczdualc5RWZX?=
 =?utf-8?B?MTZYMkJLaEZ1TVcvd0pPVlBsMDVzWVpIU2lIUFJ0VW01eE9SdlZwRDNLMjN3?=
 =?utf-8?B?VGRXOG4yclpIdEFTKzBTT3QxQUk5RDk5aks4UE1Rbk1vQWVueDVRWUJTSXVm?=
 =?utf-8?B?dTN5TUlCUTRENEV1blcyY0ZjZ2Qwd1YxbFkyZlFNR2NvQzNtbzJYcjFYR1BK?=
 =?utf-8?B?Z05PcE5ZRCtiWDU1MnhoMGQycDZuZ2xIY2FFbzZ1bnF1OW1HSHBlTEdBc2xW?=
 =?utf-8?B?WEdXc3NWcDZnOUNYUmFhQkdIQnl1RVk1cUdXZVQ0R0tyV3k4dGRNOVdGTHEw?=
 =?utf-8?B?Q05WUzA4YXkzUTlCRGRyNWlra0FvZEVuais1ZzA3ZkRwTHJZYk0wWDBqaVJy?=
 =?utf-8?B?OHRmUnNYNG9KZU5qQnNiVlF6MTRjb1pGam5wclRTa2dzaUFJMDNBWkJQU2RW?=
 =?utf-8?B?bkNZazQxbk9ISFlhMmIwSXJjYjZyYW52WllWWmMzMVRZK0RBemIyck1lMGg4?=
 =?utf-8?B?TDdrck9aZ1NjYXc1TUMyN2YxVGN2N3JEd0p5TXU2K2c3MkpNbk51RmM0Ni9u?=
 =?utf-8?B?bmhiY3hkZ1pJNlV2dzVpUnVJQjFtaDI3eGthN3Y3b2JreXpVWWwvdDc4V2lp?=
 =?utf-8?B?ZmQra0wwQitjdVFveFJ3SlRyVUZFd3Y0RHBpNFdTL3hoN21SL0FUTTdSUVJi?=
 =?utf-8?B?alhkeXdCeXFoSGhyZzJEUVRhVDFJZlc0azJoUjJ4cW5WZVZXbUJtVWhYYjNs?=
 =?utf-8?B?ejVrT0tZUHBmc1FDK2JkaVZJNDRub1JtZ084YU9VTGRuZTJ2dUVueUEweUE1?=
 =?utf-8?B?dHZINlVCaTVaOTI0RlZmM1pqd2VhcHZXNXVNcElSVW1OZGlQZHRPZ0QwTFBQ?=
 =?utf-8?B?S3Zrc1VuRFBSVVFjbm9xSjdhWUNubXJ2b1lzRWY5bG4rZTBxZkVEOHozbWt2?=
 =?utf-8?B?VjRoMzdqVjB4dUp0dUR0eFFwM3BDbElkM3pYRExmT2g0Z29aU2pheHllV3RT?=
 =?utf-8?B?TFA3RlRYdnFGdklaL25qZnVsK2h3NjJRWXExVWZzcmVyYzRJOHhCWllrODJR?=
 =?utf-8?B?Y1lsbVhLdmRRdDJsTTlSVEw2dFhRcXlkNWFSNUx2WVh2aURycWhmQm5jajVs?=
 =?utf-8?B?SzZkY0dSYS83S2xYRmtaeTE1TW0zT1YvUlBjN1dvVS9EeGJUWWlwdzNKVlBa?=
 =?utf-8?B?RitKUlNwc3pCdysrSWlmSnpNdkUrclEvSHdXNjZEOTVIYzBoWUFRWjBLRXNa?=
 =?utf-8?B?bHpQTUhLQXduRXM3ZDJZT21La1EwTUczdmdZS0VFMHhiSUk0QUVwTnpZSERY?=
 =?utf-8?B?RVdIQUlaWXFJT2pPRVdIS080RWIxckRKWDc5M1R0dk5lTjhlR0tQSVMrbC9o?=
 =?utf-8?B?bjcxanpFNCttdDFaaVUwWWdhM0t0Q2FVRUJZUFJYdVlWQk96V0VQZkF4YUI2?=
 =?utf-8?B?dER4eWRobDJHcGdLblVpR2NoWG9lZjlhb1VxTWJpZkJpZXkrUlZvVHhvdldW?=
 =?utf-8?B?cTFqU3kzYzBaV0UzWGZnVVZHZytjcktFRHduS0ErVVFna1F5NjhMNEh4Q3dH?=
 =?utf-8?B?UFMwalJzdmxWa0UrU0dPSEVQMVhJTFVtTjVZRlNYN1oyL1lhcEF2TStsamdY?=
 =?utf-8?B?bGNLUGhhY3pFS0tXNWVBaXIzc09Pb01ObTB2cDNPL081YW5KR3hCa3N6enNa?=
 =?utf-8?B?akhIRHZyOXRiQ29aSUVBQTExSlUvQ0JLby84MmpNVjQ1Z1FnaEdrVVMxdVJz?=
 =?utf-8?B?NWVmb0NnZlFKU3FuRVowaGlJVkN2Nkt3cHNoZWhVRkJwTi9HTHFIM0VzbkE5?=
 =?utf-8?B?VzlJYlFnQWRhQTlZRmd4bWo0Mmw0bUh6U0NVUkhSd0J6bkdFZUxnTm43RUo2?=
 =?utf-8?Q?Ysw6UrbunHmmtjxhxac8QQ0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf88240-2be4-4f1a-38e8-08ddff73670c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 16:15:27.5535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKG41bj32JIVH9rrzS9M2+GJE4+YK7S1vQdQCHRXqIm+RbTzY7nj4NRAxY6Ka8OCtGS+WW729O1sbEFdeW42xT/oXknaxqWDptJGKI16tCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_091536_662953_7561E5D4 
X-CRM114-Status: GOOD (  12.12  )
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



On 9/29/25 1:29 AM, David Hildenbrand wrote:
> On 26.09.25 18:20, Yang Shi wrote:
>> When calling mprotect() with PROT_MTE, kernel will initialize MTE tags
>> for every single page in the affected area. Soft lockup was observed
>> when doing this for large HugeTLB memory area in our customer's workload
>> (~300GB memory):
>>
>> watchdog: BUG: soft lockup - CPU#98 stuck for 23s! [t2_new_sysv:126916]
>>
>> CPU: 98 PID: 126916 Comm: t2_new_sysv Kdump: loaded Not tainted 6.17-rc7
>> Hardware name: GIGACOMPUTING R2A3-T40-AAV1/Jefferson CIO, BIOS 
>> 5.4.4.1 07/15/2025
>> pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : mte_clear_page_tags+0x14/0x24
>> lr : mte_sync_tags+0x1c0/0x240
>> sp : ffff80003150bb80
>> x29: ffff80003150bb80 x28: ffff00739e9705a8 x27: 0000ffd2d6a00000
>> x26: 0000ff8e4bc00000 x25: 00e80046cde00f45 x24: 0000000000022458
>> x23: 0000000000000000 x22: 0000000000000004 x21: 000000011b380000
>> x20: ffff000000000000 x19: 000000011b379f40 x18: 0000000000000000
>> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>> x11: 0000000000000000 x10: 0000000000000000 x9 : ffffc875e0aa5e2c
>> x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
>> x5 : fffffc01ce7a5c00 x4 : 00000000046cde00 x3 : fffffc0000000000
>> x2 : 0000000000000004 x1 : 0000000000000040 x0 : ffff0046cde7c000
>>
>> Call trace:
>>    mte_clear_page_tags+0x14/0x24
>>    set_huge_pte_at+0x25c/0x280
>>    hugetlb_change_protection+0x220/0x430
>>    change_protection+0x5c/0x8c
>>    mprotect_fixup+0x10c/0x294
>>    do_mprotect_pkey.constprop.0+0x2e0/0x3d4
>>    __arm64_sys_mprotect+0x24/0x44
>>    invoke_syscall+0x50/0x160
>>    el0_svc_common+0x48/0x144
>>    do_el0_svc+0x30/0xe0
>>    el0_svc+0x30/0xf0
>>    el0t_64_sync_handler+0xc4/0x148
>>    el0t_64_sync+0x1a4/0x1a8
>>
>> Soft lockup is not triggered with THP or base page because there is
>> cond_resched() called for each PMD size.
>>
>> So add cond_resched() for hugetlb to avoid soft lockup.
>>
>> Fixes: 25c17c4b55de ("hugetlb: arm64: add mte support")
>> Tested-by: Carl Worth <carl@os.amperecomputing.com>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>
> Agreed that the issue likely predates MTE support, but likely in 
> practice only PROT_MTE makes it pop up in practice.
>
> With a refined subject/description + Fixes:
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thank you. Dig into the history, it seems like the fix tag should point 
to 8f860591ffb2 ("[PATCH] Enable mprotect on huge pages"), which is a 
2.6.17 commit.

Yang



