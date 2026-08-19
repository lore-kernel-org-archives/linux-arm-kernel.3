Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D92EC5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 19:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsT5jcwj57++uy82WBrt7ZTfDxB/wqK2acENMxFBxbY=; b=wVE4h2/Op7wWKWoAKgC1YxkRF1
	drTUs8s020lWe3uxz8tSoOFq34sB23OHnQYb4ffH9AzBjEnG2msixzc+UOEzLx2nMMTEmcu649iMb
	2+DGsMzzvaPczL86WrpLPElecdbkBjuBNJ66DAqxK5QIGEZ1+AKNwf9BnOo/PCS7laSHCYGxqtRm2
	V82Tue7n8DRCkUrYa/7B7JqTnRdZBjzys7wn4oIJ06ZORs1KlvMDIVuEEBMH+IkHLD8XSTG98t7DJ
	0lzzG4JTicUYalNziUhFnmYWwbBMxNKsRroThSI+2aD8C3tHa2KZSbK1cB+O+4IAsvJlvklPheUXG
	WfE1SHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwliv-0000000AR3w-1Vqv;
	Wed, 19 Aug 2026 19:13:17 +0000
Received: from mail-northcentralusazon11012049.outbound.protection.outlook.com ([40.107.200.49] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlis-0000000AR3C-2aIs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 19:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGHZ1VMGaEmfktaDmHgJIjPDfpu95rkxZJroOYQ99GLmnASsZZF95ITkF4uKwGXoPz194wFTlHS4HFs8LdkVHSNy/wDyxoJMzwrebXFKtHvn8Sz2UpX3hRMd3LcFIFuU70182fYJO9IgqNOwFtMt1ejkeQamW0kB300iB6NDkOVOKA+PVIxDdFg+b0dMxVJ4BVAQagzDGF2tJfCsiPXNId368bMVqq0jGMeT2BU4/cSVB/v71x+uFE15AqBnmkho7IN55XNsore4lTHLcYG6W4nSkxTMbFKvo846v7t/y8Xjrqq6s55Lj3Fs8nMmLbA8bU1FRSo09buOnqANcbpGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsT5jcwj57++uy82WBrt7ZTfDxB/wqK2acENMxFBxbY=;
 b=DNzXGyi5O/dsRg5MXyE40GnNQj2ulHOl6mSwNFHh/LwpIFAcFAm+T6F6Oqo3+abkJ7PFD2l53ckvzkWNi29qVWZTqW5gZGR9mb94O/PAY10ZycLNTPp6VZOcaOlo85YGGvlBHf8uFdjKGY0luUuo/qZG3HaBv6osw5DFAing1WwU90S4UF84bLJrQg60crUvFV4psoshbYjt0CUKBQQYtJp9/CIm2aNvv7qH8UJBGml5CD9ZZXkGSpzMqmJDd7kUwZAvDUGUOWvZHCzhpAaptWYuY8/JMB9Ft4gte+MD/KLtTXm1MD6ePuaMJHxQ7BvPco+mL+sn+k/pWFzKJAAOIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsT5jcwj57++uy82WBrt7ZTfDxB/wqK2acENMxFBxbY=;
 b=SKJAqLCBeDFfz2/Bjs0g9kRZOGeGZR6TBfOM7/GMMsnVuePgjqrTVvRuI5+Az1eD6qwO9xHJIx+muzuRnvF3hxsuBEcBfhKyGisI+Jj912q4qMyffiPSqpuLDrafuo+MW2cOyrh114F86nRIiqST+hb+jwkfdl1PvCwzC3B93To27WC6T18dfjJCQ7axh596UkGSCANO7SZiQrird6K0D6izdPKhbOI2MjD2F2QRthtH6mKGdt5xgkJ6ANgcZ+IaRLCG7fSK47GjqBoa6N3xsiwDg98gOLcudJGWwZtmnrGVtAoygoXTtVFaorMAgMfY4sTE8P7FuAGViUoHW1bqcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:13:05 +0000
Received: from PH7PR12MB6882.namprd12.prod.outlook.com
 ([fe80::6d0a:d79f:abf2:d544]) by PH7PR12MB6882.namprd12.prod.outlook.com
 ([fe80::6d0a:d79f:abf2:d544%3]) with mapi id 15.21.0315.008; Wed, 19 Aug 2026
 19:13:05 +0000
Message-ID: <c5f0fe8e-faa2-48d5-b6a1-370ba36b19bc@nvidia.com>
Date: Wed, 19 Aug 2026 14:13:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_ffa: Unmap Rx/Tx buffers on shutdown
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mochs@nvidia.com
References: <20260818224404.3694580-1-csoto@nvidia.com>
 <20260819-aromatic-albatross-of-virtuosity-2406c5@sudeepholla>
Content-Language: en-US
From: Carol Soto <csoto@nvidia.com>
In-Reply-To: <20260819-aromatic-albatross-of-virtuosity-2406c5@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To PH7PR12MB6882.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6882:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf79f62-b3f4-48e7-e888-08defe25e58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LWULOGLldyXEA7WlFCepW37kUUD3Z3qIT8UDDh8M+P0YmjbkiyVKw7s3fx/i1+S0XkFHaBHMrBsANI3EFw29dLlArR1Zm1Z/67IU0iQ7eH3Yilc6YNk7jrT34BNZGSn51tps9Jb8tCtwEAwEZ+9RE0zWuMA2lHdTszPJHo9WcOUljC5kWY0gE2jjWEfF/rPbbimsIHFfvw1RTfhFYilge2jrTGqsC2Hy5oBtiIsNInMwAXycuczqPRbmqFa7CzUqpQBnMBc4+rvB7DbtH8p9TxJOOcJZW3sccR1Ln9g6PgeRyPpSVvvCG5coMCeuL1iv6gQIXqiEjbv9Coag1ue5tDtdtArz3fPCNlVrqCWwd0pPn8/IaMHckurq5Ny3aWrtFiAni95Qd1zdfE4yfS0ADI0hGx/fujQCdCPrArzRrM9AUg9ro+Kjqwo58g37n8zFLiwgbrYfsrtjCk4nllKzLJvKHlP4rawNZmuk0XYIgwYcNKZYe1kS+hOFTqQ6MTK9bOtYUknT0xKNEBGNIBy4nkQ9GZXwsKHXbAr8u7CjjC5toJjJjaAMuGt5Uc2QAG/THg2pEGIJplsLwmsO2ebICd3jkSpp9B75c1YZhyraiSwP+ieaHn76H2qWXtaWugeX0GEbQ6zZxp2ZD88CkJiQ4Sjq56d1r6yH7zPn4JYORJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6882.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDh6NFJWZjNPU0pMYmFmQWJtc3ppV0hnMTMyR0tXZWFtV1Q5YmtZc0toQUdQ?=
 =?utf-8?B?NHdTSUdiMkRKZm9kNE5wN2hjRHlnRlV3bWUrUXBVdmljd2VqMGk3NDRZZ3BJ?=
 =?utf-8?B?N1UwR2taVDBIbTRtZzg2Mld1UnlvUVZLN3JrOUtaaXM0UUFlVzc2eFJtQk9J?=
 =?utf-8?B?L0M5Tkoxem93TjZpZ1UrSUlvV21maHhDQU1wRWNLRTBISzVibjVxRjF6Y1hV?=
 =?utf-8?B?Y2IvVW0wUmNEZEhObWt6dEEzbUpJZDNJNC9TU0tTcktsZUVTNXpDZU1qSTdD?=
 =?utf-8?B?Q1FENlRHOFJRT3VUSzRGVkI3bVkzN1h3NHdTcWl4NlFzNmFGSFJKOVZONFhM?=
 =?utf-8?B?Mlo5VVhOYnRjOGFERnJwM3paeHUwYWhEVzBjNTM5eEVlVkJyWUM4Nitpa2Vx?=
 =?utf-8?B?OGYxRGdZWkxDSGJrQ3FhemhGMm5MUGswUVRxenBYdDc4MzJVVUxuaVpjL2Jy?=
 =?utf-8?B?ZjRZUHJBb3g0KzdoR2FHMG1aRmlXdHR1eVNJNGM5bDRhS094ZnE5WEFjN3Bt?=
 =?utf-8?B?Y0htc2ROYmdoNC9Fd05STC9oalA5VU1yYW5JSmxhMmd0VllBOFMxb2VZeHZj?=
 =?utf-8?B?SUlNaXVEb1BmSjBpZEJIcnliUGdNV21FSjZyOGUydXFHMTNKRjF5ek1TYTNK?=
 =?utf-8?B?TUtvb1BRWHhoa0tVZW1pM25VTitFbXhnaTJEcy8wNDYrdTFHajY3bWkxem8z?=
 =?utf-8?B?c3VNWE4wQzdsMEhzTGcxVTNOZ2VsYkw2cnF2bk1POGtZRTlINXFQSnQ0QmlQ?=
 =?utf-8?B?dkZaWUJZMWpKc2piTmFBSUdzSFY1OUhVcE54dDBEeElSaW11eldtOTZPSkpE?=
 =?utf-8?B?TjRaclJ6a1JIQlhMcHI0YmxzdC9iaTcyaUVjdlFTM21TRS9kM2ZaWk1OWStO?=
 =?utf-8?B?TkU5U2dyaTJsTEthT2dXcm8zVC9kaTJZNmZJbFoxZUZFSktrRmVucEF0UzU1?=
 =?utf-8?B?ZlhBSUh0K2h5REIwT2J4UExZOTFFUTY4Q0tmMXVtbE5aYzQzZGViejFzN0FV?=
 =?utf-8?B?d0NVYVhvZDFFZGZSN3EzaVRYeDRsV0czMEhtUFNKTnZNWEhoVjRheVpnVDV4?=
 =?utf-8?B?NnpZWDUvNzFEMUFtRWxhSUN3RWNZWjhFSlM0ZVZET2NJaVJHYktMTmFEVVhl?=
 =?utf-8?B?bklsaTRvL1BFVGlrTW9Xc28rZVZ6d1AzRiszTnEyc0k5YXN5Q0Q4Q3lEd25G?=
 =?utf-8?B?STVZQmpPb2tPclBNeEx3eTdnRkVEajZuRWYwdFNMNkNJNXhQN2drUEI4dHYx?=
 =?utf-8?B?emVVcVpIRzZ5K3dvZng1MWxSaWN0U050ZC90ZnE3eDMyT3dOZHVPV1hDSS9T?=
 =?utf-8?B?cW9vaWt1UmxDSTcxYlFDNjNkUzJiN25hOHlPWlZJVU1raUVjUjI1ckFKZEpO?=
 =?utf-8?B?b1kvaU9LUCtyR1Z1WWF6NFJJcWc2WWJpN0dwemt0N00yS2V4ckpCM0V4ZGhE?=
 =?utf-8?B?TVVQSEFjWWVGUmk3L00zNStXU1RIM3NEMG96UEVvTTNTS2Q1VmdTNW83VytZ?=
 =?utf-8?B?aVFWeVZTZ0RGOWJ6WG85a3VzNXErN3NkWk8vbU1mQXFURzVRVTZNdCtSWFF5?=
 =?utf-8?B?NlhjK1RGWFNOdnNpME9ES255cDZ3K1pEaXVtVW9rMEFDZmtiQUNocSs3bE5q?=
 =?utf-8?B?MTBlZUxyTDRzSlpqMm5PZnNEN2lPdmt6ME0reHAxcUZ0RFUxNVc4b0lTOUoy?=
 =?utf-8?B?WWRZSk1oOUNWaTBad1E1RUJ4NlpkTFlBU3BhSlBrTXJXdDNFM2ZNZ2RuOEgy?=
 =?utf-8?B?dldxY3hpY2hnL3VlSXgrTDk3aWhEcTc3SDVLaHdXcEducFJkOTVsMEZUUkhY?=
 =?utf-8?B?MGIzc1hRSEU5c0ttYVpSS2Q4MnVjSjJhL3gxcG1MbTh6YkRpZGZKTjBzblhu?=
 =?utf-8?B?WkFTVWZiVi9MR1NYT0hTZmVHRHMwcWFIYlNlY2xsN1pvNUQvZkMrT1pRY3NC?=
 =?utf-8?B?MmdxRGw0Ym8wUXpueEppSVlOVitPNlFZRm14ak14Qm5adnplVXBGRURndEF6?=
 =?utf-8?B?a0JJbVJibjFSQUVhT1Bsd0pHcm9kMDZhdml3aWVYdXZBTGxiTElLMVZEZHVB?=
 =?utf-8?B?VzNQN1EyS1NxVk1UOVczUWVRdk1tcTVleVY5UDg0KytHVDRIbDNMQWdEMjhm?=
 =?utf-8?B?b0xNWnZPakRBb3VTMHRUalBuOWRCV3p4dThyclRlUURYbk1mdWpPbGg3V1NU?=
 =?utf-8?B?UDZYS2NiVnNHVUFWUWJZd25YRGJjK01CdGJadzdwcDhlODYyeTVselpiN0cy?=
 =?utf-8?B?Y0MzNkpNQ2JYWUVySHh5ZGJ0Uk5CMXp1dWxCWDFyaHhOcGF6bkJua3Z0SFRv?=
 =?utf-8?B?SWU3Y3d6am5xbzBxcVZqc1BEYjJ5eW1aSzEyMml6MjAzTWxzdUVyQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf79f62-b3f4-48e7-e888-08defe25e58d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6882.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:13:05.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0bOoji45Qn3oHD0bobsDcCWMOtEhUk2SB+tKaXbS2MamyblXWji+BE+ehFgBkNUouKZFFh47XGTKBiJXqZpBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_121314_672835_4A0BD337 
X-CRM114-Status: GOOD (  11.32  )
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


On 8/19/26 2:08 AM, Sudeep Holla wrote:
> I had posted a single line patch here[1]. The original author/reported never
> got back.
>
> -- Regards, Sudeep [1] 
> https://lore.kernel.org/all/20260729-nostalgic-accurate-raccoon-ab7d7e@sudeepholla

Hi Sudeep,

Thanks for the pointer. I tried your patch from [1] and it fixes the kexec issue on my setup.

I also tried limiting the shutdown patch to just RXTX_UNMAP, but that is not sufficient here.
The next kernel can still fail notificaion setup with:

ARM FF-A: Notification bitmap create error -13

So I agree that using the normal FF-A cleanup patch from shutdown looks like the right approach,
since it tears down the notification bitmap state as well as unmapping the Rx/Tx buffers.

Are you planning to submit that change to resolve this issue?

Thanks,
Carol


