Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18682C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UpTyANNTpkJ6S0eqar41ZvYL3wmKOsnZUARbw7E6oM=; b=4vm1SgPbtRq6PN/7DMVMoNdMWy
	fOOIe01AonOe8yrbttWTX7fX3cLCIn6jTlpYYD91SaYsqHLVKW+4zXMITWZelot8/YqRQvKHipbC8
	jPve1LMbBFgy9VWAanFe7mqQE/N5kPvAQZdbwYTcKIcGRgms1l+S0MgQk2lvjlZtowPz5zQtxI/If
	kWzUTduQ4SljwT9baeHpjqv12kDeUJy+uxuw2lyLMT9+Aujm7xy4+Rc6+f+qdpojF2vqCMDtkFmMz
	O44eSSf6an5yQ2hYkntiQb6AGdWOycQR1MLp8rE1N9qTb8jIHgCbTAdZmkMXJF7jb86bfSaZukcW4
	ClS3Hr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taf7i-0000000AxH1-3Vly;
	Wed, 22 Jan 2025 18:06:42 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taf5v-0000000Ax7p-3krA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 18:04:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=So0sCSx1uQbDphspeR844JAFMuZdJBpsMyB3gnumh4uC3C7mRHOBmA5XpOcxiASTVkaRIy1HZwlzJRAMYrLoqFbxdOS3T+0QoJ8HEcwnbIApISgCzydtrryaeJeLcIQIsyQowL58O4k2lmEfUt9rS1GErseDxY/j7i/9vKzyeoqV2M3pTM0VJzoFQs4okvflP9v7fHFx4BUdzS9ASdZdCE5WNskpKP4jbvgwerm0Na9N/VHeQh4zIEDj0Qn6paoyKb1qQcJNH3tDHpS6i97L1n+eXsvLXmGmSWePYv3J1E6hfU0Lg5APq8S0gyRzNmkcO4Cqeyf/JDCSNmET/W3chA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UpTyANNTpkJ6S0eqar41ZvYL3wmKOsnZUARbw7E6oM=;
 b=vzqaISG1WgQlZCqrwt4jzR9N0AbDIVIU4/ML2KmdGKAn/K2k/lv9+1E0WLkDDF0m/YgJX43OjvJU+LJChZwSEFCal/4oXgfjRf0M8uHGrcXLhr54KSZoONnGi00qvvFdf5Li/HUjIDfmsJFpqelmRq/4ycnUiR9wjpAelX4DQ8SpY3ewztKYh5ffapCJF8wgufOHCB/pKbL4dA1UgcZpBTCBYvJ08Ka4c+y0rYHeq835uv4vtcrWigAI37FkrRu6PstuNuJE7pE7kioxaCednV4+UmGK3Lgh7/a+zprhrxXK1uYG642O8ur7EFcUk5pGoJouVKIzlAYS1xcfEcoIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UpTyANNTpkJ6S0eqar41ZvYL3wmKOsnZUARbw7E6oM=;
 b=dOwOVjh7FUrPmT0JGaopMcZHLXhV/r0r0l7pdTCUJFQNK47vNLQ3+FwP5sq22QwLsShcJW5hclvfOTNC3pgeoRA272cBgpYJf1WSu2cUbapWUSRzSGuVobjaJqDyI8xfDPbYC6030RRvZdJhrq0g//p7Ij23eegCwXA3HBaHatM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB6794.prod.exchangelabs.com (2603:10b6:510:75::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.14; Wed, 22 Jan 2025 18:04:47 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 18:04:46 +0000
Message-ID: <77f40fc5-8bb0-42a6-9e34-c56f3407eef1@os.amperecomputing.com>
Date: Wed, 22 Jan 2025 10:04:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 0/2] arm64: support FEAT_BBM level 2 and large
 block mapping when rodata=full
To: catalin.marinas@arm.com, will@kernel.org
Cc: cl@gentwo.org, scott@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250103011822.1257189-1-yang@os.amperecomputing.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20250103011822.1257189-1-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:806:21::30) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: e977b42e-091b-4472-754f-08dd3b0f418b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3R6OGlveHNYeS9rNEJGVTB6eHVWdUxrNTRvMzY2RFVLdlFtUklTekd1S0hX?=
 =?utf-8?B?cXpsMmxrZ2R6UmhzQVNCbDQxRHVyc1VvaHdGNkNEVk5rV1cwSEl2L0IyUWo5?=
 =?utf-8?B?dHBXWnpUTS9aMmZjZldCdjMxYThKYmx6eDBxQUZjeVJBcW5GVTBIcHhpcW9z?=
 =?utf-8?B?VHhPTER5Z0pPVmJHL09kMnlxWVpibEtJYTBORG5nODV2aFFzcFdLSHd5WjZU?=
 =?utf-8?B?UmxGcmYwZ3VjSE5VUC9GU1JKS0pLZkovcEJPV0N3QnRpVWcxOGIrcUIxM0g1?=
 =?utf-8?B?bUxkTmlVWCtzKzEveXVOM1hYVUlpdVRlOHVQTW4zVEdTakdmZzYvWVVZczFT?=
 =?utf-8?B?TWxFT2pJTXZOb0E4dGRkczVLYWJqZmJ4bWQwd0dZRVR1Y0FSaWJTSlBtMG9T?=
 =?utf-8?B?eDFnZEhpTDU2WnJOeXFURkdZTVFXNThVZVhINjB4bzFNQVN5ZmRMc1ZrdDhv?=
 =?utf-8?B?VnhPUUdpZUQyZ1VyOFJ2VVNyNHEyMzQrNUZFejNVWDkzN1h5Qzc2bmFUeWZJ?=
 =?utf-8?B?ZTFqSTRYNCt3Wmk3TWZJczM2bUdTOHhNS0FIaEx4anUxZU9pOWtxK2R6c1ly?=
 =?utf-8?B?Q2FnQktSWnl3M0lUdFRVMHVMcVhPblQ1MjhGdnhNbm5LbWd0UUxoSXdlOGI3?=
 =?utf-8?B?OTZKaStIcms2QVFuMG5GOS9JV2RsYlRvRFJZdTVKTTNmTzV6bEtIQ1JMQkta?=
 =?utf-8?B?TWtmTzZNOVE4TmRWOXlORTQxMVNvOTE3RS9GQnpOU0tYVzFkYlZUZ0U0VHls?=
 =?utf-8?B?Tkw1TEQxRnMzRVJ5bTlnZ29pV3Z6ZlI0QXJhalRZTUphRHA1QUM3b0pRNnZ4?=
 =?utf-8?B?MjN1YnZYVGxSZmY2b25jSld0ZG5pdnF6OTZ3ZWE2T2VRUk1EYzdTdmxOV2pW?=
 =?utf-8?B?YnVNRnpyc1pXYUtCcDRNbE1Na0VVM29MQkVUT3NmaVByRU9wd2g4T2UyNU1T?=
 =?utf-8?B?eFk1LzA2bzFhNDdxVDh1ZFZtMHNVUmhIbWFISm9YQzNBdTZldkJndGtEbUk4?=
 =?utf-8?B?cys0YXlGUlliUzU4K3hVTER2bE1SekVQSFE2NGI5ZzV2ZFZNS3c4cnFZQ0NY?=
 =?utf-8?B?NjBzL2FZdHF4SkRFMVdoYzNETitjMWlkWUVVTlBJQzl1dUVjcGo3aHV2VnNq?=
 =?utf-8?B?ZXIzeGpNTG5XaVVCOEZZd09OaGNFVm9kME9INnNmdndWN1grRmJnL1NMZHpm?=
 =?utf-8?B?TzFRcklsWTVPTXVKSzMzb0MvOTFYaWt0YkNSSGM0bnEvbURPbGdpQ2VUcWVm?=
 =?utf-8?B?SVJ3T1BFUEg1L0JvQWRrQW5ybG9wS3Vpc0NrSys1Sm50MVh3M3UyT2ltamI3?=
 =?utf-8?B?Q0dPUENIcXpRZVhybE00cGhCN0N1ZURPdW9mLysxYURFcllCYmVuTzV5dnJN?=
 =?utf-8?B?dUgzdmQzNy9YOHViNmJNWEdIaXNoeUw1NXNyUjN6eThnYUdMc3lvT3Z3bDVJ?=
 =?utf-8?B?MDV3bVlES0NzOWk2dkZTN0lKeGdTbWtrbC9BeVdvN1dlbVBpS3JpdXRKcUJU?=
 =?utf-8?B?d2MxNWh4akVua0FIQmtQUVBxbW53WGU5eG1DNUo3ZllHR1UvbjJCSDhMUnNk?=
 =?utf-8?B?Rkpqd0dHYzJJbm13NU9DYmluS0Npd01xTEwzbnpnbEtzNm5rOXZVU2ZVS2tK?=
 =?utf-8?B?N1drSmsyZDV0eTF3eFBPdWd6ZUtEZ0dUNkpMYldkY3ovNVBHcERUT0poaURO?=
 =?utf-8?B?YkJMVzM4WS9xZDVJNkNxdVVMMTJBWkYvM3oyU2p3OWVWR3duWU1MQUNEYmJx?=
 =?utf-8?B?MU5OdS9LRkJmRjBnS2pMK1ZBVXROWlpyOFdUVDh5cWtBcnNYNjJiUG9qNXpQ?=
 =?utf-8?B?SUtKcEVFdmlwbDhDRHNVZGIyY09xWDJrSjM4N3ZIeVExM0JSTXJjN1NHZzZz?=
 =?utf-8?Q?lxoVt4+WJDMrQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N29zWXhnSlJHRFVFWHV4RTFZdVdsb1lucnRxTjVzY09aanMyMUh6MHJpaktI?=
 =?utf-8?B?TVgrODV1MFdBUlBLcTVNZ1BSZm95dTY2dWhJMnpCQ1dVdnRmbHRjcVhZdncx?=
 =?utf-8?B?Qm1TQnpnNTZqQy9JYUtOOHdzeCtCWHU1WmpXWFVGSzU3bUxHdkMwYzEyYjNL?=
 =?utf-8?B?U0N2RnV5cG8xbldnNVZpNERkbm8ybklhZVNmRUFRaCtiS0ZtdDgvdTB4b0Nq?=
 =?utf-8?B?MjU0Q3pMVjRHMmcxT3lWY1dzbWFROWNjc0NGVVMvSllQNmdQWmRxZE1LYjhi?=
 =?utf-8?B?K0J4OVdlK0hRODJ4Njc0Tmd4UmpwZTl0cXNQTzU2OGYrS2ZjKy81ZWk4WTlD?=
 =?utf-8?B?SWU0TXVrbkVXWEVGRVQvdHdTK1Z4T3RYZkovSThBMEJweXV6QXlzYjZsL3B5?=
 =?utf-8?B?a3FkdFZkcUFjSFZ6bGpJQ1V0SkpGRmhNSW5OQUpqb0Q1VG9temxpQndtYWcr?=
 =?utf-8?B?Tll5cjRxWlR6b3RJMFFHSEJETWd3eHMyVzZDaVZXb3hlT2cwL2QvUG9NU3Nk?=
 =?utf-8?B?eE9ZSHhZNHNmL1JJS0tTZGc5VEpweDZ1KzY2V0NaWDBjanVhcHYvRFRRWlVR?=
 =?utf-8?B?YWQ2alZqTU1kc2JKY2ZQZEFNL1N0a05tbld2dis5RmZscUFFa2NIbThvYW8w?=
 =?utf-8?B?eFh5a0tBb1gwU05saEJiZnRqWWhEVFN0WE5MYjN3MTRiR0VZNXVEUExJSm5w?=
 =?utf-8?B?ZU15SXdmbWM3Ym9ubHp6NG5BTS95bW1sa0NKUUplb3E3WjQ0bzM3Ykw4S3NH?=
 =?utf-8?B?T3NYeUVwekZGZklaRFduT0JGZmE3dmZBMTd2ZEpBYUk2UWhGOEhaeCttVlVz?=
 =?utf-8?B?UTBnRVdYajdpelFPTFd6aXVrazFDa2x6bGlTOWIzRmZKMmFpR21zdEp0a1NR?=
 =?utf-8?B?NzM0eERmTS9JeWxVcDk4UUNYdmZBcFhmQUtsUXJVQ2dodTg3U1NYZzNyNy96?=
 =?utf-8?B?Qk5mV2VXUCtaUStmcFFEajE1ZnpPaWpjNzlzMGtFVC9IV0pjZTB4VHRYMXR1?=
 =?utf-8?B?R3NBbXRCWVZCbFVlQlQ5MFpsMHJ3MDBSVTJEc1NsTGN2UzVmT0ZlYWFQUVow?=
 =?utf-8?B?SUFCMUt1VlFCaDJDbG1NRTFnNkVTWHZEeEtuRnFud3U4TlJCV2l0U3RiMkhi?=
 =?utf-8?B?MjVOZmdyNE1GaVRDK2JhZjFVMWNORU1uS2lSU2hwZG55SWI3YXNveEIwSTVX?=
 =?utf-8?B?anlzdnA2bWFHTkJ0bkRzQmRFSlNNaUREeTYvbVh1MGFpb3VINVBpc0VjOVhL?=
 =?utf-8?B?TWtRUHc0RXNUV0l0NERHa3ZsYkViN09GT2Z1bldvV3d6SGE1VjNlVHppVGZx?=
 =?utf-8?B?VTJnckxIbEhqUFRISlJ2MGFVbzVZTHFvN2FMbVhDYmFIZEtvbTAwU2NtOHJk?=
 =?utf-8?B?QUpsMDQ1Nml1Tkwrd1VsV1ZkY3Nua3ZuSjc4Z3JiSUVkNXU2NzJ1WlJVMHVz?=
 =?utf-8?B?YlcyYXR6WnBXRWpXbllWMitsbnNYUUhTSjNCTzh0bTZ5ZStsYmVML0ZpRmRU?=
 =?utf-8?B?TElOQjZrZWU0SWMyY0x2azFDV0c0UHlMaXVCMElyZHZwcDdlaGpkQ0dMbVdx?=
 =?utf-8?B?SU1PZmRYQjNYWUhvTk8wWnNiSTA3akR3MWZTbmxUTE53TjF5Z0xUSGxwcTI0?=
 =?utf-8?B?OVVyV0tvazZEVGxiclJ5NXlZSnJ4WmxkVjE2NFJ5Mkh0dVhUenZXTVpiTTFH?=
 =?utf-8?B?Q2tmYm9MY3BLZGQ5SnZJVEhaUUd4aW56cEtqT1NKcjhla0phN3JMT2FkVWxL?=
 =?utf-8?B?YzREb2JtQ0dyNFR5NG1kbHk3MERRdUNybmZGUkE4NlpkU3NSaXVWYk4vYWV5?=
 =?utf-8?B?c1gyT05vOFB1cFFtanFrbEs2dGplSWVOSGRDZE5Oc3JWTzk0VFhXV3BFNWg4?=
 =?utf-8?B?dXdqNGVvS3VweFYyZlQrWUFGcEZSb2dZT3RvWVpreXpRQ1JDZVBleEpoeDlh?=
 =?utf-8?B?Nm4zUCtqcEdWQVdmUG9hd08rcXhrNkZJQmJyek1lZHRGRzhtVTFDanpHdDRs?=
 =?utf-8?B?Q2IyL1ZmVk1kd1VRS0U2VmlMM2xXUndRTVZBU3g4T0FoK0NRTkNYMmZmT21F?=
 =?utf-8?B?NDZrMXgxQVVwbDVMWmp2NjQvRnJvY1QvNWhtQm1qdm9LdEZXL3RtYm56bG9E?=
 =?utf-8?B?eEVXdzdTNDM5eEpLd1JCTVc2cjM1WHZ1eW53cWFGRjlyY0F1UmRuTEEvRDZu?=
 =?utf-8?Q?3U3wB4vsIidtWIpf2HqFlWE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e977b42e-091b-4472-754f-08dd3b0f418b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 18:04:46.8094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P4U7iIz+z2GZWmCtcfWOXjIFI2rShadMVbjyFujrEFOsMwoYr00GpxkhO+3qWZf1xkChn/gxQNSA0h6gGmR31j8qLmqB2yuE6bcm7x0gDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_100451_944786_DF41F26B 
X-CRM114-Status: GOOD (  27.01  )
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

Ping...

Per the prior discussion, the BBM level 2 feature is advertised via a 
allow list in this version. Any more comment on the implementation and 
patch 2? I expected there should be more comments on patch 2.

Thanks,
Yang



On 1/2/25 5:17 PM, Yang Shi wrote:
> When rodata=full kernel linear mapping is mapped by PTE due to arm's
> break-before-make rule.
>
> This resulted in a couple of problems:
>    - performance degradation
>    - more TLB pressure
>    - memory waste for kernel page table
>
> There are some workarounds to mitigate the problems, for example, using
> rodata=on, but this compromises the security measurement.
>
> With FEAT_BBM level 2 support, splitting large block page table to
> smaller ones doesn't need to make the page table entry invalid anymore.
> This allows kernel split large block mapping on the fly.
>
> Add kernel page table split support and use large block mapping by
> default when FEAT_BBM level 2 is supported for rodata=full.  When
> changing permissions for kernel linear mapping, the page table will be
> split to PTE level.
>
> The machine without FEAT_BBM level 2 will fallback to have kernel linear
> mapping PTE-mapped when rodata=full.
>
> With this we saw significant performance boost with some benchmarks with
> keeping rodata=full security protection in the mean time.
>
> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
> 4K page size + 48 bit VA.
>
> Function test (4K/16K/64K page size)
>    - Kernel boot.  Kernel needs change kernel linear mapping permission at
>      boot stage, if the patch didn't work, kernel typically didn't boot.
>    - Module stress from stress-ng. Kernel module load change permission for
>      module sections.
>    - A test kernel module which allocates 80% of total memory via vmalloc(),
>      then change the vmalloc area permission to RO, then change it back
>      before vfree(). Then launch a VM which consumes almost all physical
>      memory.
>    - VM with the patchset applied in guest kernel too.
>    - Kernel build in VM with patched guest kernel.
>
> Memory consumption
> Before:
> MemTotal:       258988984 kB
> MemFree:        254821700 kB
>
> After:
> MemTotal:       259505132 kB
> MemFree:        255410264 kB
>
> Around 500MB more memory are free to use.  The larger the machine, the
> more memory saved.
>
> Performance benchmarking
> * Memcached
> We saw performance degradation when running Memcached benchmark with
> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
> With this patchset we saw ops/sec is increased by around 3.5%, P99
> latency is reduced by around 9.6%.
> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
> MPKI is reduced by 28.5%.
>
> The benchmark data is now on par with rodata=on too.
>
> * Disk encryption (dm-crypt) benchmark
> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
> encryption (by dm-crypt).
> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>      --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>      --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>      --name=iops-test-job --eta-newline=1 --size 100G
>
> The IOPS is increased by 90% - 150% (the variance is high, but the worst
> number of good case is around 90% more than the best number of bad case).
> The bandwidth is increased and the avg clat is reduced proportionally.
>
> * Sequential file read
> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
> The bandwidth is increased by 150%.
>
> RFC v2:
>    * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>      conflict gracefully per Will Deacon
>    * Rebased onto v6.13-rc5
>
> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-yang@os.amperecomputing.com/
>
> Yang Shi (2):
>        arm64: cpufeature: detect FEAT_BBM level 2
>        arm64: mm: support large block mapping when rodata=full
>
>   arch/arm64/include/asm/cpufeature.h |  19 ++++++++++++
>   arch/arm64/include/asm/pgtable.h    |   7 ++++-
>   arch/arm64/kernel/cpufeature.c      |  11 +++++++
>   arch/arm64/mm/mmu.c                 |  32 ++++++++++++++++++--
>   arch/arm64/mm/pageattr.c            | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>   arch/arm64/tools/cpucaps            |   1 +
>   6 files changed, 234 insertions(+), 9 deletions(-)


