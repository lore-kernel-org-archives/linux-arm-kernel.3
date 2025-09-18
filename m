Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63C7CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dA2zLo8sxwFlgzSwbGsMxeEqLzFx55VlWNpDQlIzC64=; b=0RYHwGG1cC40w1G2URh4SrcKPP
	3rIaHjElSyv3Rstv6ddF1mnIoHxLs7KZoLwf1dBwOiOmz4mKXs/2L/pBnXeD3T/VJYPHA81P7KDqp
	9QtlFRUU4C2RLZ5TNd4y9r4vUpd5P1YjYAIyjCN6cvbJGgX2k0725YcUk6e6iRAbB3BpeHZGS7hol
	2ive56iDWGe76vtuwHXY9YbP6oQq+yZJFBsVhPicaxIL3J0xPWOPri4EnNchr6FvXSpC4cxuS7ZQ6
	lDUyANAURvuBOivWVWlhHUHg5TGo8RinvUzkmNXXPedF91Odp1GvJ8HLeI5WG48KRssBvS3lTJ8Tc
	Y8yKAULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGs2-00000000UQY-27Rb;
	Thu, 18 Sep 2025 15:48:30 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGs0-00000000UPR-0svV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dad7/OoAlLeqGzP9C59xOLvOv/R+KOCZoKreAUN9MaEwKKLmV0BtyWiDrej6e3Udxw9RmmnlkTXaUfqGdTPIFqbV2Qs2VN9qucq3Sq6DDHn9zet0Uj28i9SouiM9A4cbHbvNAnPu4kWaMALHaHmOPiQrysLvsWcIa7hTT5YR+fuA325jroHQ1CYK5fdogDHYDWdwuj6CoK2fWd5t/fdSoLs4t+2/ZOAiZ3Kj6BtJYqADyhNjsbFpTJAgmjbJZQiiWrcR4JHEb6ZWU943l0Y6SLFlUVL4foFRIjduFR0yEwgXa8hhVt+OfYgam1mBWevp35/a/Wx5dtHvliB3VsPOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dA2zLo8sxwFlgzSwbGsMxeEqLzFx55VlWNpDQlIzC64=;
 b=wYuI3h4uRLaGm9VITfaCTeNM/uOghqPTALZrD2l6HqW/iXuwjVBsJg5C21czXjK3gZTyyZdELJb5w6XLYzJdgVv6sGBNgo3i/Baa9wdKsUthtdm2TofH/dbaLH/J04o9i0reIDUKx+ndwVgj5ju48IpNlVnS/OUrGJdr6j/11JBcG+wiQatWh4VXEKB8OV185ZN2SIpEcr40Ig0HqGcOj1nLvWudQUn2FCnMNN6FA5D1bT1HXmHwoMYUM0UH7D9Ju20ngHDvfPRHxovXTn3Oa7WEOrO0COauGO+GREIXH0eNFXtaLgOaHEimQGt+GDor4oPssxpU+FvbrVl3dvZ3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dA2zLo8sxwFlgzSwbGsMxeEqLzFx55VlWNpDQlIzC64=;
 b=IogdLJAi5L0VM1rsdZ4O67TMOwsEzUnCeFnyIcW5HUkTCFF8KlZIMuCV05FitLU2waVDRME4KlE6Xk2/J81Xq+ThQAkIXQKbBDU4tzO3Bb4oLOryGlqITv3WnjtSLWbpnUEOtvxPxtEoDibgnr+rLbfJ9SAQ4vLy4Q66KyJjoGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ2PR01MB7898.prod.exchangelabs.com (2603:10b6:a03:4ca::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.21; Thu, 18 Sep 2025 15:48:20 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:48:20 +0000
Message-ID: <2fdbe2c3-dd31-41e3-93a5-e2995779602f@os.amperecomputing.com>
Date: Thu, 18 Sep 2025 08:48:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: kprobes: call set_memory_rox() for kprobe
 page
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, ryan.roberts@arm.com, akpm@linux-foundation.org,
 david@redhat.com, lorenzo.stoakes@oracle.com, ardb@kernel.org,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-6-yang@os.amperecomputing.com>
 <aMv_nhEuCSHKp5J6@arm.com>
 <22732cbe-20f8-4d1e-b086-e34d0f9bbb35@os.amperecomputing.com>
 <aMwl9mujvFknSulA@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aMwl9mujvFknSulA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::33) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ2PR01MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: ce52b24e-1986-48d2-0702-08ddf6caca9c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUpicmpkQXpxRlQrV1lpMHdtVUFNV1U1cm9NWDViOUp3OFdqVVhaRGFsVVBj?=
 =?utf-8?B?aXNnV21BV1pCNkZteGQ2eVZxM1QzV3BmSytoOFhJcVVCd21KRUU0YnFiVlJ5?=
 =?utf-8?B?a1Ayc1dOUmtKUiswUmZqYVREbkhTT3Aydkl3czNGaHR6M0VzQ1RTbzRwTkY1?=
 =?utf-8?B?blp6S1djTHJYTGpqeHJNRERIckJQUlZSaFo4dHRPRFppNFZPT0FXRm1lbHpu?=
 =?utf-8?B?ZEtpZzFFYU9OUGd1SUZKeG5WR3orbC9vaVNqc3R5QjRSS0tzVnNiejFnSzds?=
 =?utf-8?B?cUVleVQ1THh1SWFvb3JKS1d1TXNjRGExa2hOeXdWeTVVcUJNS2lPTmdRRWZa?=
 =?utf-8?B?MjV0c2xobjV0YzhYeDB2Ri8yeEcxOWVIb2JUMmdXRTIrak9oMThpSlBhTUts?=
 =?utf-8?B?YjF1R2x3Zm9OZkZkT2poL0ZNSExEZjU4NEYrSkdzWlJuQVhWR29UTGJRMWRw?=
 =?utf-8?B?TzdiS2xwbTZxK0o2Y3hvSjhLNkE5MVcwM3ZtYWlPTHV6Tmo1UmNTVXRGR2ht?=
 =?utf-8?B?SWhJakhXSXdIRE80RmNUOStOMGFzVWxOZkcvTkovZ296YkpBR0owckQ3T1FV?=
 =?utf-8?B?VU44Z3RKeEdGQ3RVbzd2dEhBVDJTb3cwdHlwa2lPUE56ZHpnOWQvTG5aZUVF?=
 =?utf-8?B?R01UUFN3WktDK3l2RlNMaDNEK281cWhXZ2NlYW1IcVB2M0VDL3dHNThQMnpJ?=
 =?utf-8?B?eUlqZXlQVWp0WkVFNCt2VlJqdmNPSHdBMGhCanhURkpwZkxVWXFybjNCWW1G?=
 =?utf-8?B?N01ycGRlTmt3L0hYQzhQVlU4amtsb202cUo0MDQzNlJxNGxpL0tiQUE3NTgy?=
 =?utf-8?B?RWlqQ05xcDBzbHpnRXRyYWFEcFZyQVNWU1hyS21mTTRlb3oyL3dCL0E4ajdk?=
 =?utf-8?B?eW9OM284amY1OW0xQzRVNCs2Y0hIWStnUjNFVE5kbEJmdzVOQVJNUlFIU1Rt?=
 =?utf-8?B?ZGhBOVZ4eDZpb2xHQkgxM1ZadERtS1FUSGxxeVd6VWIxR08xeFo4NTFYRStO?=
 =?utf-8?B?VndSS0hMelZBc1BGQlVzSnR6T0VSbHd4aVJRWThFVGZNeExZaVVtZWtCR3lr?=
 =?utf-8?B?aVpUWUlqdHNTVkk5a2NpdHRNU2dMNC9FSzRQbWlQQjlQZC9OK0xpdFRFRUpv?=
 =?utf-8?B?RnV5TEhheGlwM0NOOTB3NmNpSFlmczBIU2RSR2p2Z3FZWjVVbzZjY2YwNTg0?=
 =?utf-8?B?NFRpdEw0Z1NBNHQ0VTBBYUpDd0hnTDRVNEtBNjA2amkxV1hBOWZHV3liRFJM?=
 =?utf-8?B?NWRjMEl3NHVhVFlLTVpvUklaZk5paDlxRUJpM2U0c2JRak5pbFdqZkNudDhn?=
 =?utf-8?B?dVVXWnlyb2ZHMlBZUWhMbi9UL1JOcURwS3dUSC9hZEFoQko4T3ZIYlBlc3c3?=
 =?utf-8?B?RW95UGRDankzaG5VcWI1NS9IY1NrWnVCYVhEbzZ3T0l0UER3L3ZIU0FvcWJs?=
 =?utf-8?B?Y2RmUU51b21RdE9qbnp6NnA1UEJZMUV1VlFycUx5TXFLVUk2N2ZiN2RRY2hC?=
 =?utf-8?B?anQ3RDNBOG5ISCtURXZTeWNXaElzSWRGcVhIcnJhNWdoU01hcEdqZHhEb1hx?=
 =?utf-8?B?SHl0YmRLY3J5dm9qUFRHWTRWN1A0ajBzZXhsdTROQWYwS09FUWxYaU5UVXdI?=
 =?utf-8?B?eDVBQkFiUWp4YlNXckFpdE81bXNwUVRyQ3ZVQnpPMUxEaHgvK2lUb3RwY0lp?=
 =?utf-8?B?bWhqNzdYV3hWNEx6VWY1Qk0rbFFkby9lMUNSUC9DZnhUWTFHdUZ2cTFSdGdI?=
 =?utf-8?B?NngydTRlMFkvVTY3MHZDVWN2NWJhWEFrU0ljeVR1K21Nb1dmOHRwczUrUmht?=
 =?utf-8?B?Rm9tWmZFQ2pGNUNFWGNPQU9aUWVJMHcva1drN3ZqOUgybUlWOHpCc0NKVnps?=
 =?utf-8?B?NHQ1RXFTUHU0L0RwSHJEanNTeEpmV0N2Sk5QNWMyUFNrMlB0ZDRpcWdLeW1V?=
 =?utf-8?Q?+9g9GMN9yXg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWp4dEZEZWVJSmRxZXFZTXVqSlp3Qktpdm9KUFkvR1lqK3V1UWdzTmN4Z0Mx?=
 =?utf-8?B?OVRCOEEzbUswQ1RZbEpnNVlvZG1ONnZjaE9QNUNnbW5yTUxjOGxubEd2cGgy?=
 =?utf-8?B?TWR5cWdMZWxqaXlwR0x2bXY1Vi9oeisvTU84ZjhEVy9HZmRxY3cxQVhFSjZq?=
 =?utf-8?B?UmVqTS9kRk94c0huOG5GOWhDRGovVUNkdk5xQUFXdFlOQVZBUUc5RkZvMFl5?=
 =?utf-8?B?c1hMWEZxQ1VFTm9KV0hSZys3TEVFaSthNzZHMGVBc0pPbHZDaUFDSWNqNkp5?=
 =?utf-8?B?dEQyZkF5STZVQWhsMTQvcW1Nbm9IL1NiNS9LeVNSVHgreUthYkVpWmF0bXMv?=
 =?utf-8?B?dkdSZWo3Z3lFVTU4RTN4eTN3NE05SzhneUZUek9KOFhsWWR2Y042ZXdNWm5Q?=
 =?utf-8?B?SzVSc2ZJWUlDOStLNnhXb250RjdjbE9YUnFsZlN6cGJ4SUZ0UU0yMnRCYUlw?=
 =?utf-8?B?T2NEdkRoZkZ4OVcwb2FZVzJONjBHYVRNRlo2ZW1uSW5iaXZlbHBwcDBBUjgz?=
 =?utf-8?B?d1l6QXZJL29DZUk2NnVGU3BWV1FCcEtLNVFDaXBkZU5uTTlRVEl1ZTc0Rm9Y?=
 =?utf-8?B?TkZIeVlRbHpqTnpxMHVpZFJKT1dIVzhhUE90QlhjdEpRTU5JZmgrdnQwZEUz?=
 =?utf-8?B?NzViSnlHdDlmVFNmNFZDRHJVbUplYUtOS3h4VVVvditFcFRRSHJtUmZlNXNB?=
 =?utf-8?B?bG9FVEZWMHlRbGtOK2M3eC84VDVJSUpWRFVqS1BFWDRScEErcjMwVXBOTUsy?=
 =?utf-8?B?aXgxTWtzNFdJb3Jyc2ZQYkR5L0RSdGx6REx4V20raGdIS3pnRlNwb1NXZ1po?=
 =?utf-8?B?RUpLK0t5R1dJMVJJZUs2QnZhb2N2M1crYUVsRTJ5NXNBZ0VLTXBuSjZXaXpB?=
 =?utf-8?B?NU41Vk1BU0xQSnVsTCtVUzdoNExWUmtuY2I0RllOS1hWQUE4N2lLdWR6VVpS?=
 =?utf-8?B?eHRWVmZqdVZ1Y2JpeDY5VVE3blZ6aGdIeTZFNTM1YWpoZDZFVDl3YXBXOG83?=
 =?utf-8?B?dFcwU3FCODFEMU9iSjhsUTNZUjIyWElYcTdPSWpFcnMrdGg0aHZlUmx2OXc4?=
 =?utf-8?B?eU9FNkp2MldnbC9HdndPT1N4eDR2NDRNTk81cnVsZmxYWWdxQWdZNnlCQnU4?=
 =?utf-8?B?cUcxZHY0UUc2TjJHOVA4UnA4dDU5aHJSSlhuand3enAycHhROVhabVBPWDlw?=
 =?utf-8?B?YnVoMkJ6SmNhcVdBYnhGYmVvNU5wQzI5ZlpEcE13UG1BQ3NtUFNVTTVJNHFi?=
 =?utf-8?B?TXNLT0E1ZVltRzVNeWdtVlRaTitSSVQ2MnZlQ0RMMFJacFJrQnIrWkRrRHVI?=
 =?utf-8?B?c1ZQYW8xTGZxd0pJKysvcytraEhFUHBLVC82K2k5UHhDcEJtNnFsU0Q3U3l2?=
 =?utf-8?B?TVVsRlF4bzlQaU5JS0JtSnl6Ykk2SXYzREFreDlYNzZDeW04M3lONTJEUC8y?=
 =?utf-8?B?UG1Uc09RRUk4OWJyUUVkQ3FCTzdrVElGREw0RGVMZGFrM04zNnE3RHJiNTNo?=
 =?utf-8?B?ei9QSmd3RVI1U1JpdXVGSExCS0t3aTFwZDIwbHFtYmZyVHJ1WnB4Zis4Vkpy?=
 =?utf-8?B?SWNnNzZabXJlSG1EUWxVaXBxM3Ixb2VDTmw2Z0VUZHB2a2xaMjkwWDVMUnpW?=
 =?utf-8?B?R09jamMyTzYraWRRUHZ6aUJWYzN2OFZmT3M5azFrVVdzN2hPZys1VUZSS2Nv?=
 =?utf-8?B?R2t5MWZDa2wrL2NNaU4xQkxCUCtTZWlIM1c3bi9teXYreEdvcFR2TVluWE4y?=
 =?utf-8?B?emZFRWx3bFV2aDIzNDg5Y2lTQUF5TlFiRHdsZExSR0VDSnR0RmFMTHM3bVEr?=
 =?utf-8?B?dytta3BaN2h5azNSbC82TkVteFV2S2xiWExnczRMKyt0SWtoa09UaHR2b2RP?=
 =?utf-8?B?b2cvVzk2TzdVM1MzWm9RcFplb1dhSldJWmRIakEzMllWeFdRMXQxdExzNHhm?=
 =?utf-8?B?d0ZlangveEdjd1Y1TDdPb1BDNElyQTEvcTRONmM2TThFTVNlQ1d2bWpERnBp?=
 =?utf-8?B?VSt1REpWMm5lZGhVTFdTN2VxUmtTT09DVlJGR2ZRbzVYWTZRNmtZTWduYzJn?=
 =?utf-8?B?ZStrdHZRaitweTBPMlphV3JCVDdzSXM1aitVWnlHK0s5MkE1blM4RW1LZTJX?=
 =?utf-8?B?NTVaVXB3dERrSlR0UGN4KzVudVdOdW4rendQQnlxSzFhQ29QRXlaa0lrd1FZ?=
 =?utf-8?Q?QQ3qIDKANuwxXLdbCrk1a74=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce52b24e-1986-48d2-0702-08ddf6caca9c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:48:20.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nReKveKcZaFBQdmjbCM7dAdIHjk0t/3O0aKzSfKyx3rHCeiNUtQ12yJzQCF0KMAzBc5UM3fcqziOf7BJc9DgW0dlzA2kM8AAb+ocU5/cYKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB7898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_084828_262827_96F8BE8D 
X-CRM114-Status: GOOD (  22.61  )
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



On 9/18/25 8:32 AM, Catalin Marinas wrote:
> On Thu, Sep 18, 2025 at 08:05:55AM -0700, Yang Shi wrote:
>> On 9/18/25 5:48 AM, Catalin Marinas wrote:
>>> On Wed, Sep 17, 2025 at 12:02:11PM -0700, Yang Shi wrote:
>>>> +	page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
>>>> +	if (!page)
>>>> +		return NULL;
>>>> +	set_memory_rox((unsigned long)page, 1);
>>> It's unfortunate that we change the attributes of the ROX vmap first to
>>> RO, then to back to ROX so that we get the linear map changed. Maybe
>>> factor out some of the code in change_memory_common() to only change the
>>> linear map.
>> I want to make sure I understand you correctly, you meant set_memory_rox()
>> should do:
>>
>> change linear map to RO (call a new helper, for example,
>> set_direct_map_ro())
>> change vmap to ROX (call change_memory_common())
> set_memory_rox() is correct. What I meant is that in alloc_insn_page(),
> execmem_alloc() already returns RX memory. Calling set_memory_rox() does
> indeed change the linear map to RO but it also changes the vmap memory
> to RO and then to RX. There's no need for the alloc_insn_page() to do
> this but we shouldn't change set_memory_rox() for this, the latter is
> correct. I was thinking of alloc_insn_page() calling a new function that
> only changes the linear map.

Aha, I see. If we have the new helper, it also allows us to refactor 
set_memory_rox() to what I said.

>
>> And I think we should have the cleanup patch separate from this bug fix
>> patch because the bug fix patch should be applied to -stable release too.
>> Keeping it simpler makes the backport easier.
> Yes, for now you can leave it as is, that's not a critical path.

Sure.

>
>> Shall I squash the cleanup patch into patch #1?
> No, I'd leave it as a separate fix, especially if we want to backport
> it.

I meant the potential cleanup patch. Anyway it can be handled in a 
separate patch at anytime.

>
> Anyway, for now, with the nitpick on the address variable name:
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thank you. Ryan also suggested separate the fix from this series. I will 
fix the variable name nit then post it separately instead of posting a 
new series.

Yang



