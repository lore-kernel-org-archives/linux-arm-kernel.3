Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C91E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZyIxKBoRPsyetAik7v2j/vTNM5YPp2dxpilL6NyJAk=; b=BDXPaCWNiEKnaCXsA5RkK+IWh5
	Zggx9InTinnXYCXwJ95NrjMaMoyU4FU0NEcPiQ9W36S1BYJvwmPeyc1yap7dOZbAJiDII0fcpovNV
	3mX9AfcXTMUG+aHJ80cQGTitAB1RJhjW0olLjlZ3tkgX/bcYdfu5+3c/ef0J6FRDGYZL2FeENTeb2
	/BSVr98JR2n8+HDUtIJCVLFtux9v1sKeuSnpga8j/E0Lcf/NwHXlUypMIZ0+q+G2SW9mH2ZOqcPqQ
	8s7/mK3CZVPdpUNOiImQ1l7tp0/u8yiY93THNYwiCHNRcb/4wA0qwg9mK1fMjlTz2r+2ZOcSDBiCd
	qNiPGY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs86-0000000DAP0-0h4e;
	Wed, 04 Dec 2024 16:21:34 +0000
Received: from mail-mw2nam12on2071b.outbound.protection.outlook.com ([2a01:111:f403:200a::71b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs45-0000000D9fA-3qT8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:17:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulqBaPMCi3zsAZIOSsscTJNmrWfPsM7nXnY2SwX2/nT9SRjYwdGthE7xXjH+JNQpa35kgVEQdP9QwnwG2qSuvUJFqSBkgActkUAAYrN409W+6/nd3sQfpKjvClKRSVSmACWnVep/f0iY1EuMe2L3Lz9qaTLLkx/HjytX523ypu5jkxhG143nbz/BY+VbtA0vXbkQJJT8YEkzL9y0zWPJz7LrEOxfULQFj4AdfrJ0quEEAQEL/wZS9s9SpMgLbsCRT05+FXvNi+jcgKaE3g4tfBVw74fWYDKAARhyYoIWa1MqcnykIxA7SB4qumTq/iFF5lGPx4WFYDOyrmHJNsVAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZyIxKBoRPsyetAik7v2j/vTNM5YPp2dxpilL6NyJAk=;
 b=flS+sKiBipMQUfpETYZBC+95I2ZC01PRl6q5yzviDeNDnyLC7vLIdas/BwNRAf+IUcGnf7icqicStrzXEfqhHQ9i7UpoF7SFNVdTtN3YfwM/FlSeIcxNi2ikBEZBSir+SU+LGXqG5Q/LpFSqIaRxJjEGUfK7lowoAbuzWTCu9/caDnehGg92ZJh2+RNJVFc4X+xNaZLGmbqls6RrdI1ME9AhoUvaZ+2ERedCchc43f8X+ytzFrJAQo8RIGLres//UiLG1sVQNIaZDGP27FH3Xn49RNi2QjvABXvpe4o1QX7qJz9/RiMM3pfcjBDL2lFqkmpNZDW1l4wTJvJeq5CeIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZyIxKBoRPsyetAik7v2j/vTNM5YPp2dxpilL6NyJAk=;
 b=Sr2x3z9vH1/zug53vWPShEJnbVPxku8Y952tRq9XyLId6ag7XU54FpBAVePDGbFzCiQrCI+KUhKGR4QRfap710ZMWgppEQnwYaHJuKxZsj3vyjJKLyu5SNhkDpN9+IqTZn0r2K+ILjeKSwsEmvKggTQ/43FbK/kOQB69jzioah4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 IA0PR01MB8277.prod.exchangelabs.com (2603:10b6:208:48e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Wed, 4 Dec 2024 16:17:18 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 16:17:18 +0000
Message-ID: <c7b897f3-cd63-4aba-8cac-1c5b40286a77@os.amperecomputing.com>
Date: Wed, 4 Dec 2024 08:17:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
To: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Sasha Levin <sashal@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
 <Z0STR6VLt2MCalnY@sashalap> <Z0TLhc3uxa5RnK64@arm.com>
 <0c09425b-c8ba-4ed6-b429-0bce4e7d00e9@os.amperecomputing.com>
 <Z0dhc-DtVsvufv-E@arm.com>
 <dc5e8809-825f-4c38-b487-b16c7d516311@os.amperecomputing.com>
 <e6b3e6c7-193d-43c4-a8c6-6023458723dd@redhat.com>
 <6aec1d44-4a89-4acf-a16b-4493626b93bb@os.amperecomputing.com>
 <Z1B1VS8PayXsXDzl@arm.com> <4919faec-3e35-459f-a7d3-b5b3f188bd9c@redhat.com>
 <Z1B6OMqEZitgBVEx@arm.com> <f7e0029e-f940-4f08-84f4-e89450d3e981@redhat.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <f7e0029e-f940-4f08-84f4-e89450d3e981@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|IA0PR01MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d306710-495d-4646-5d17-08dd147f1f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aE9hZlhJcnl3SytJaWtBcENZbXRyR2xZa21hcmVBMWUwOFEzWDlpcWhoUDVH?=
 =?utf-8?B?a1ZTUnhLOXFMZHU5aTBSR0VKanJ4U0E4b2pHZUtGdFRKR2pXNW8ycDFtNUtk?=
 =?utf-8?B?amxtN2VRUHpsT1ZXbDYrVnFLbHlpWEUvVTM3eUdESk04dUFZUXB5dlA5TGhv?=
 =?utf-8?B?UmFXd0RtSkxQWitJK214QlA5REJJNFlsdG5VSWp0dEtFSHJJZk9Fbjk3K3F0?=
 =?utf-8?B?em1mdFpzV0RqWnppajVBaTl0c3hORXV6Z0NmT1dGKzRldDRucTNseVdMMWNo?=
 =?utf-8?B?Mnp4KzRtSW9wcDR0aHlESkMzLzJLcEJQQ3U2eDB4V1JmSkp1alpuSTFYYlp6?=
 =?utf-8?B?RExMTzdNR1hTZXZ3SW52a3lzSUlGR2IyWFZnRVl3UERyejgwTkk4M1VVRzVR?=
 =?utf-8?B?N09FTnFjMUlkUFZiUmRtaUQ1OWp4MTJQZzY1V25mWmJnY0xMc1RrdkFBS2Ir?=
 =?utf-8?B?NmhaLzBxU1dxSDdrYVIvQnVIaGlIek5HWUVrbDZJb0VIMzVUK1hYNlpMeHZL?=
 =?utf-8?B?SmY2bFc5cmt3VUV5TGhNLzF6TUlDeDU1anZyLzlRbVhvOEhkdVBFNjFtN3g4?=
 =?utf-8?B?WWNOazZ4eVlySXRpcHJYU0FjZ3lxV2VTRGVyQ2VxK3dGL0tQaEovenlsK25T?=
 =?utf-8?B?U2w3bnhlTE5pU2o1RWpRVHV3Qk1IM0QzUnNSVXRaZHUrM3JZZWg1a0xURENJ?=
 =?utf-8?B?M3gyR1pOTHJISU5FcjdYZkNQQ2xabEtlaHV2MWFzWUh0b0Nwc0ExYisvZko1?=
 =?utf-8?B?OTd1bXVMNDdPSkVWNWVXWWcvQmZjNTVyQU9wWThKcHBmTVB3NkxmUGc1cm5s?=
 =?utf-8?B?VVBYalFCcFA4Y2h0dWJwb2FFUkVEeXlVbjNIeHJVWmdpMldWS2pOSnB6OTQ0?=
 =?utf-8?B?S2lBVTQxckNYZEM0SVNyd0RRL0pzZDBXaEhCM1VJbkticGFZZlh1aXljdUJQ?=
 =?utf-8?B?Zk9NUjNTK1paL0tVR0dUc09US3ZvbzVmY3JWMHBsOXRHOTN5SHczUmhYbDdl?=
 =?utf-8?B?THRsS1hoWXQzR1RvL0w4aitVRm9sbXRmSXhrR0NlNHVvb3RSTS92YjJYSTVQ?=
 =?utf-8?B?NFhiWWRIK2E1elUyODN5S3M0M0lTYlNRY0g2eldrYktUR3pMdEhreEhOUUJ5?=
 =?utf-8?B?K0RCeUgybkdxUGI0aXNrcVUyQklzL3BlVnM0eTdVNGJvblRKU2VuaTVWVmtB?=
 =?utf-8?B?bk5kanU0bmUyMThnTVlITTFkZEpaR3JONzB6SmNNcElmNGlHcTROWUdvWFJr?=
 =?utf-8?B?RkhTOFRiZlBad1o3ZzhIdHBCc0ZaT3FVVkQ2aEFSTkZSRlA0cnRNc3hRYTl6?=
 =?utf-8?B?dkxqMFAzVFFIQlYwR0JDRFl3V1hSWFlLSWYybENqOCtFdGs3M0hVZFl6bnhF?=
 =?utf-8?B?YUVLTjE0dDNnQ1R5TFBCWlJ3RkpKSUxCeldoa3RneVFpUXNCSC9WeVNTNXVG?=
 =?utf-8?B?bW00c1VpcUw0dExZVGNJWDRkcG5icDJHL0Jvamp6aUlZRi9Dc2haaEZSNTNX?=
 =?utf-8?B?WXlpRVFlYkJZQldacURlcXpybjFLSE1xS09FekJGUzFvaGN3RTB1dHQyVTRG?=
 =?utf-8?B?RlNYZ3lFOXZISzI0THJGbGpqVno3dGdZRW0vRzdMa3VoVFVybDJ4cjJaVXF2?=
 =?utf-8?B?c3FGbWFXejM5bWJxc0xYcmpEWTVNeXhFL3BmTzhWc043WVN1dUR1aFN0VzVk?=
 =?utf-8?B?M0xuVU5WajFwb0VZVlo2Y3doaWlsWS9hOGpvMkVlK0pPT01KT0FRaVkxNmFW?=
 =?utf-8?B?c25nUm4vVytDT3l2enA1Zm1OM01jUEEyVTRFUEYvb2NHR0ZwZXpWcGloL3d0?=
 =?utf-8?B?RXRhMzAyQStUSGc1T1lsQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHJEZ21Oc2hPS2JUWW1LSkJIS1F2eTdqdWFkVEdoZ0RCenlPYjdhdGJrVkFB?=
 =?utf-8?B?RE43cTF5S2l2MXZjTkFmZE5CZUc2elBjMUJpYVQ2TFFoWm9KSkh6S0MydjFn?=
 =?utf-8?B?cjQxeEpoeHFrWHcvZEtFU1N1d0h4bzV2eWxqYnd5N0w2ZU5LSnBMYVpQSmNk?=
 =?utf-8?B?dTRHZUN5R3NFaHd2SURrc2NpaHljMkJWbU9Gdi9VcDVHTUlDU0RQZElNSXQ3?=
 =?utf-8?B?VjNGWWQ0Wnd5eW5tSEhVcEZTbkNCRFh5NnFEVzFYUXlCdmxtWk1LMEpsYk9N?=
 =?utf-8?B?MkJ0SHNRLzJqbEh6aU9nSmN3U2tFcmNaK3F5NDNQUXVWbjV0cWJ3amJBMjdy?=
 =?utf-8?B?U0RKNUxvMUg3QlVSWU9Db2Y3ZmhsTGpBVHpkYzBqMVZId0RIWkh4Q0lNbEdR?=
 =?utf-8?B?ZnlMOHNXTklmRDZ6ODhlcHFUWFFoSG9TaEdKQVVHYXh4V25DeVh1ZVBFY3Fl?=
 =?utf-8?B?QkdNOGxZSGh4MXJ4RUMwMldxbkVnMnBTL1YwMzR0RjcyYmw0V0Z0Z2hyMEt3?=
 =?utf-8?B?WFBTWmRRZlluTlVHUGtjaHA2UVFhcnJHTWVPRC9qdFhPNTl1dVNodjRSMjAr?=
 =?utf-8?B?aWp5NzZ5aUNaTU5ObHNBVlRidDZLL1k1TXh2WE92ODh4K3k4SmxFWCtIVzUw?=
 =?utf-8?B?VlA5cWJtTXJEK1Q5RUdlYlFMdXJUdDZDOS81MWh1dStRWHZNL3pxSFhBU2l2?=
 =?utf-8?B?cGtQR3ZJOHZ1V2VMRWM0YjFIZjRURUtyeUxnZTU5R3lYWWFUZzZIWmtPOXRY?=
 =?utf-8?B?OXM3UFREUENLd01oY1FzOUgvL2dIRmloWFpDNFZqajJFbVVOQy8yN0Z6NElK?=
 =?utf-8?B?ZkFwS01vRFpRaTZ1T2tXODdMYm1zWlJvMVltcTgwOHMwVk5WMXN6L2h3c254?=
 =?utf-8?B?Q1dhbWY1aGpPQTAvYlRUU0ptODFOditBTlErcWJHNjFkaExQVmJkdi85TVdJ?=
 =?utf-8?B?bGxnY0UvTkFEUE11cnpSUjR3by9udWNPRW0wQ2hOeWRtd01oMXNkdkNEdFZo?=
 =?utf-8?B?MzQ2Q25nNzRGU3creUpoTEtsVFg2a0srVmhHdFBaZkFxc2RmYVdjaEhqQ2tm?=
 =?utf-8?B?dFBXNmIwU0h2bGlxUzA5TzZFUDh6a3FPcUFXbnBHamtJLzBRMlR0WDdqZXB6?=
 =?utf-8?B?QUNnTjV4WGU3cXZNUTMzbjhtUVk3OURIQjZFQXl6TWk4UGtGdTRLdHJuNy8v?=
 =?utf-8?B?bm90aUZCYWFjRGNrTUlUTXg3akZvQnV0c1dFT0hSMDV2ZXo3b1hiSlM5NkJh?=
 =?utf-8?B?Yk1Fdmd6bnB1OVhHdGhRTExEZjFUL2hMeUtrZHBOeWRjTEg5eVBBKzg4NzU3?=
 =?utf-8?B?UHVBa1hHbnBSVEdCRFRkUDQzNHgxOGRNcjNIK0prdll2WTRhMDZWS1JGTEJP?=
 =?utf-8?B?cER1K2RhajF6NW4raE9JMFVkZTJieXkzM2hTWmU5NTROWld3S2dZWkpsYkFY?=
 =?utf-8?B?Zmh6WkRzWUFXZEJHRkJoVGxtQmUzT0NRaHFEcGlScUJwMDhTK3JBYzJXL2hj?=
 =?utf-8?B?UWlpM1UyQlVEeWZaM2xKU1Fnek93SW54TFpjRGQzbUlSY0JjZkJtZzVjV2sr?=
 =?utf-8?B?L000Tk16ZGRvdVpKOUEyYTBkWXdhSGVPY3d0UEMzbHF3N05BWCtmalVxS1hH?=
 =?utf-8?B?Qi95M2ZmR0dydjU1QitsZTExeVkveTJTMDBha1phL291WTNZdVlmbVV1MmpB?=
 =?utf-8?B?ZE02Q3lzczNlWE5WTUN1MlJVVFRmTmExbmVVYTB0UG0wcWpITVVMLzlVMHB1?=
 =?utf-8?B?Nk1qRmVCSThaYjB3cGVJMHR6L3g1ZlAwS3ZGN1g1Y2FvODY5dU4yUDBHcHl5?=
 =?utf-8?B?dUxpZE44R3ZEM3ZVK2E0aldHSy94MG9VTGx2RStFNE9XQ3lkWWswWVFZNHlj?=
 =?utf-8?B?NUxqM2NKakhSc2loS1ZLT211UG0xS0JhaDNoM0pJcDk1RlYwWWVQTy90bUk1?=
 =?utf-8?B?YndTU0FJY0pKK0E4a3pabUh3THM2NmRIdUkzMW5XUDh3SFE1SmlGekhvQTR3?=
 =?utf-8?B?b09uVGxtWjFob0FGa3lEbXc1MTI3Z2J4cVh5NUhhOENIQTVIVmVoOTlSaENt?=
 =?utf-8?B?TzE1dG1JYk4reUk2NkhYL3JVbmwvMmhCVXQ2ckNvKzhxWVU2MFJwUTZqNUZh?=
 =?utf-8?B?cHZOeTd4VFg1Z0tyd09ZNE4xMkRwOGo0b1ZpQWdqMTZya3o2YkZUKzA4Nklu?=
 =?utf-8?Q?JhJveDNMDd4v490LBDVQbKU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d306710-495d-4646-5d17-08dd147f1f97
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 16:17:18.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGwtTU1mwNkcdS3KD51Q7wz22QI6qazHi3UQB5M/v+4vaqCEkAVFjjorQuMZqrgeN899vitmTiWqTuVxm42dCXOarLupQnTcw0Tt57oNa/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_081725_983535_F9EB1BDB 
X-CRM114-Status: GOOD (  23.16  )
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



On 12/4/24 8:00 AM, David Hildenbrand wrote:
> On 04.12.24 16:50, Catalin Marinas wrote:
>> On Wed, Dec 04, 2024 at 04:32:11PM +0100, David Hildenbrand wrote:
>>> On 04.12.24 16:29, Catalin Marinas wrote:
>>>> On Mon, Dec 02, 2024 at 08:22:57AM -0800, Yang Shi wrote:
>>>>> On 11/28/24 1:56 AM, David Hildenbrand wrote:
>>>>>> On 28.11.24 02:21, Yang Shi wrote:
>>>>>>>>> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
>>>>>>>>> index 87b3f1a25535..ef303a2262c5 100644
>>>>>>>>> --- a/arch/arm64/mm/copypage.c
>>>>>>>>> +++ b/arch/arm64/mm/copypage.c
>>>>>>>>> @@ -30,9 +30,9 @@ void copy_highpage(struct page *to, struct
>>>>>>>>> page *from)
>>>>>>>>>           if (!system_supports_mte())
>>>>>>>>>               return;
>>>>>>>>> -    if (folio_test_hugetlb(src) &&
>>>>>>>>> -        folio_test_hugetlb_mte_tagged(src)) {
>>>>>>>>> -        if (!folio_try_hugetlb_mte_tagging(dst))
>>>>>>>>> +    if (folio_test_hugetlb(src)) {
>>>>>>>>> +        if (!folio_test_hugetlb_mte_tagged(src) ||
>>>>>>>>> +            !folio_try_hugetlb_mte_tagging(dst))
>>>>>>>>>                   return;
>>>>>>>>>               /*
>>>>>>>> I wonder why we had a 'return' here originally rather than a
>>>>>>>> WARN_ON_ONCE() as we do further down for the page case. Do you 
>>>>>>>> seen any
>>>>>>>> issue with the hunk below? Destination should be a new folio 
>>>>>>>> and not
>>>>>>>> tagged yet:
>>>>>>>
>>>>>>> Yes, I did see problem. Because we copy tags for all sub pages 
>>>>>>> then set
>>>>>>> folio mte tagged when copying the data for the first subpage. The
>>>>>>> warning will be triggered when we copy the second subpage.
>>>>>>
>>>>>> It's rather weird, though. We're instructed to copy a single 
>>>>>> page, yet
>>>>>> copy tags for all pages.
>>>>>>
>>>>>> This really only makes sense when called from folio_copy(), where 
>>>>>> we are
>>>>>> guaranteed to copy all pages.
>>>>>>
>>>>>> I'm starting to wonder if we should be able to hook into / overload
>>>>>> folio_copy() instead, to just handle the complete hugetlb copy 
>>>>>> ourselves
>>>>>> in one shot, and assume that copy_highpage() will never be called 
>>>>>> for
>>>>>> hugetlb pages (WARN and don't copy tags).
>>>>>
>>>>> Actually folio_copy() is just called by migration. Copy huge page 
>>>>> in CoW is
>>>>> more complicated and uses copy_user_highpage()->copy_highpage() 
>>>>> instead of
>>>>> folio_copy(). It may start the page copy from any subpage. For 
>>>>> example, if
>>>>> the CoW is triggered by accessing to the address in the middle of 
>>>>> 2M. Kernel
>>>>> may copy the second half first then the first half to guarantee 
>>>>> the accessed
>>>>> data in cache.
>>>>
>>>> Still trying to understand the possible call paths here. If we get a
>>>> write fault on a large folio, does the core code allocate a folio 
>>>> of the
>>>> same size for CoW or it starts with smaller ones? wp_page_copy()
>>>> allocates order 0 AFAICT, though if it was a pmd fault, it takes a
>>>> different path in handle_mm_fault(). But we also have huge pages using
>>>> contiguous ptes.
>>>>
>>>> Unless the source and destinations folios are exactly the same 
>>>> size, it
>>>> will break many assumptions in the code above. Going the other way
>>>> around is also wrong, dst larger than src, we are not initialising the
>>>> whole dst folio.
>>>>
>>>> Maybe going back to per-page PG_mte_tagged flag rather than per-folio
>>>> would keep things simple, less risk of wrong assumptions.
>>>
>>> I think the magic bit here is that for hugetlb, we only get hugetlb 
>>> folios
>>> of the same size, and no mixtures.
>>
>> Ah, ok, we do check for this and only do the advance copy for hugetlb
>> folios. I'd add a check for folio size just in case, something like
>> below (I'll add some description and post it properly):
>>
>> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
>> index 87b3f1a25535..c3a83db46ec6 100644
>> --- a/arch/arm64/mm/copypage.c
>> +++ b/arch/arm64/mm/copypage.c
>> @@ -30,11 +30,14 @@ void copy_highpage(struct page *to, struct page 
>> *from)
>>       if (!system_supports_mte())
>>           return;
>>   -    if (folio_test_hugetlb(src) &&
>> -        folio_test_hugetlb_mte_tagged(src)) {
>> -        if (!folio_try_hugetlb_mte_tagging(dst))
>> +    if (folio_test_hugetlb(src)) {
>
> To be safe, maybe also test that dst is a hugetlb folio? But maybe the 
> implicit checks we added in folio_try_hugetlb_mte_tagging() will 
> already check that.

Yes, we have "VM_WARN_ON_ONCE(!folio_test_hugetlb(folio))" in 
folio_try_hugetlb_mte_tagging(), it should be good enough.

>
>> +        if (!folio_test_hugetlb_mte_tagged(src) ||
>> +            from != folio_page(src, 0) ||
>> +            WARN_ON_ONCE(folio_nr_pages(src) != folio_nr_pages(dst)))
>>               return;
>>   +        WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
>> +
>>           /*
>>            * Populate tags for all subpages.
>>            *
>>
>
>


