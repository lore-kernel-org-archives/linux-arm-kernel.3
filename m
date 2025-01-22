Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B85C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjKbHUhKIJMkXLzkTcsutHZdqojMflu1pzGGE2yh95o=; b=ONvIsLm/5eC41BIYuKcc37x6eO
	bPncqwRSp+AwNcKlsCpdenV3ny2YJGaGPUQ8G9fvLUqEZGO2LMj/q+TV1tszIkA5icr5XahO48JZL
	uJ69g1N5cz1QBn4QU5/Ogp7TlHn8e7L5CK50eNbzzVHl0wqUXA59xBrLbZhlyKy8VGgOvSWTZqKgj
	Qy9zJ8vE7Ez1X/cc8X19pocG+ug/BqqBTub89FYoW8rVlF5moNV5vJKEurMwT4752VfkASt7YwVqS
	1NgKPsJdsQTS/5wbUh6VKTi/Q1laZvvvYnRO121gGeuYsq4b4e/lnqTjHKHJoG2XopzpDz22YOlZl
	SFa2yphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tadFg-0000000AegW-0anc;
	Wed, 22 Jan 2025 16:06:48 +0000
Received: from mail-sn1nam02on2062d.outbound.protection.outlook.com ([2a01:111:f403:2406::62d] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadDA-0000000AeJZ-2a0b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 16:04:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn8khQOGHw7CSvoisxLPw1+8+RBIEOiwNnmhoEod0EDoLeR/rk41fM+mkO8SsCE9TEfcsEm6MaXu5pyGq6ETppsttv9zjdLtv6UnDQH5K2A/gRFEshk1eWRPth1Snsux1oBQKdHtXbvwkCD/cE9UDEPCr7ujfjhutc1Zc4aDs+ez/FIfKaIaUduFi1ukED7vGEL4vGsl5if1DOTwxZTZxFNDMX9UiwjXeK1lBVojAbViMWtKg8NIdjhFckkVWlkpfIPBwkhZK89o88+sBNl5qhr245L/oknxSD7ZxMSXjEuhoRMX8Td+XJ94bjUkS5YjSE4jDdzlUolHEtJ0xl/KEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjKbHUhKIJMkXLzkTcsutHZdqojMflu1pzGGE2yh95o=;
 b=NHTSlttvXizXk6sfECr+Uqv+aCClVzOrzetlo5LQFEPmAsGZirwL3pL58PsskP1NwXN2rGuSLD2ykRPrVwjc+EYzELFlp7j6gt468d1wjrcNkF/b2L5HFYopvzwetA6HPrz3OysylcoqcwVxbejccckXbVEX6dWbfnVeXRjP4Ap9540We7b5qFwmfcoBsXP683za+QhMUnQW+lq8zBsuDoawfgMohgIk3PErqf/7lUeFnO/oVUX66j47eXQQIK1OQbaG/k0765hKkioY3417H2zDOeYogYGyLpVuYnyEuhAvFLhxPe05oX+gmR04w+rR5id+Z+7eosM7v+8/glaBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjKbHUhKIJMkXLzkTcsutHZdqojMflu1pzGGE2yh95o=;
 b=e4jUSl6ZlCgHggV/LFLw78tSNrOXLnfv690YHq9IkaOm6NywZCCXkwz+/QPMdWoNRfLEMdolGM++neMhw+qoWZC04LtB74rC82UPiJla1NFQToLkUPD25tp1SD/9rf4RY3TYihCA5Lpnj/0MqCRAdGTkItG9Q2dW95dMwo/IAls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 16:03:56 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 16:03:56 +0000
Message-ID: <c17c80fa-8f1f-4b19-814f-07fed18d6be0@amd.com>
Date: Wed, 22 Jan 2025 17:03:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: Add new board description for Versal
 NET
To: Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com
References: <20250108113338.20289-1-shubhrajyoti.datta@amd.com>
 <20250110160056.GA2939302-robh@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20250110160056.GA2939302-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0284.eurprd07.prod.outlook.com
 (2603:10a6:800:130::12) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: e97fd2d6-9049-4a29-9058-08dd3afe5fb1
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enJaZTRvQ0k5cW40UlpieWxWOGxOeExLSEtGdFZGLzlFcUJuWUlSZG44NmlP?=
 =?utf-8?B?ZEgxbTZXM0ZwUndQQWFjR2dSM1REOEdVc0NhMS8xYVY3NWpKM2FSejVyQUlQ?=
 =?utf-8?B?WFNFR3JleGUvMUhNL0xkQzdkZERzUXp3NHNaemhOaGYvOFlKUUVwY2Y2ZW1z?=
 =?utf-8?B?MjJlN1ZMbzRMYnMxcWs5MUkwaldVdWRXUFF5c1ZOck5ucTRWSUh0ajI4T2V4?=
 =?utf-8?B?YXIvNXVMTVNUeW5ja2p1NjlsbjdLSnRubVMxSmM2N29jcmpncCtZbFY5bW8x?=
 =?utf-8?B?bHhLMkdBYW9ya0VpRmdRRHVxTlh1N1ZFNkEzdW9TRGg1ZG9reit4Rk1hWE9z?=
 =?utf-8?B?REcwYmpKQmhjK3lHZEVFWkxxUUVJVGRWYU1rQkxVOXFweDVwbEp4MHRxejU5?=
 =?utf-8?B?UG9UMHhNWTJldXBsSlFjYUNPeU5qakU2dmNKc3BLZXNBMzAwblh1TldhTTBT?=
 =?utf-8?B?NHMxS1hXcHp2MXNRWVg4bzF5azM4cnFleUVGN3JMei92UmlJdUZrRjQ3c0xW?=
 =?utf-8?B?N0ZtZkxoTkt5RTRJUExVbktCVFVWcm5iVWRkMG5jdTNaKzl4RldObEN6Snkv?=
 =?utf-8?B?d3lBQkVFOWFyMjFkTFJxdkRDWWs2ZWQzWFp5MUVPQ2N0R3hKYjdZb0k1MEVH?=
 =?utf-8?B?OGd2T0s1SzNLN2ZYRkZHaG16R2lpeGZkeVZDMUk3TXVSSWFRdnhLQjJyamRN?=
 =?utf-8?B?aHplbFAvUnlrT1lhbUM0RW16RDNoWVZwV0lhMUd6b2FIWmVnRzVvZUtiREZm?=
 =?utf-8?B?SmYwdXhwMWdyME5IdEZNT3cyZ2IzNzJXUVRKZklOZWhPZC9xWW9wYXVHRDVK?=
 =?utf-8?B?T1RMendKdWFDRFdISGNsc3pNaWRtczFjY0RZSDNxSjR0TnJJaFVkeWlPR3FY?=
 =?utf-8?B?UG9qVnkzd01FR2RJUmhnUU9BZDhTT3U4SkVOSW1xYlQ1K0NrcS9DOTVOVTRy?=
 =?utf-8?B?SUdZL3h2MjRWOFgxcVpyL2krSkVSUFgyc2MvWHB3MHk1b2FBTUFnRVo2S2t4?=
 =?utf-8?B?TjlKZkhXeEZ6UkU0OU9KUGVsK1Eyd25MWlR3Y3BuODdPUW5QeGFKeXdjazk5?=
 =?utf-8?B?UWRUalpJVGE5d0xPWG5PS0VaUXRIWS94bkhVRVkvcGZmVENvQXZRRzkxam44?=
 =?utf-8?B?T2J5bXBuSE12MXdXRXNKazc1bEdSZFJoWStsSWx6ZXN0b3FraHRRSVlRUVNB?=
 =?utf-8?B?bG0wenJhQnBHcEdOQzh0V2N1Ym9Qa25mZTZTNThQRFhLWmFzRGcwREhGZUdt?=
 =?utf-8?B?TktHM295QXphTUdlWVBPem5XZDdZSFRDVk1zM3VHNXpyamJiVTliRjVXclhk?=
 =?utf-8?B?UXhXOTNIREFieEluRUs3bjdwQkhRQS8zZnFkSm9ONlZPRWl3MmR4VnJDWTBO?=
 =?utf-8?B?ZDM4NFJZRmgzeGoxWUdGVWhrcWtGTU9YczNuaDJwZTdsNy9rbzR6M21aUURh?=
 =?utf-8?B?MWxuSlpZMGM4eGVycmt0Z2IvM0VVV0l4SXlVa1p6UmpaemZxK0F6czYreG9S?=
 =?utf-8?B?V1Ayazh2YngyL0NiSzdWbXpSZThxSlhZc2V1STV3Vzh6ZFI5L25kYTN4c0tX?=
 =?utf-8?B?VmlIYS96ZGJjam03ZW1wU3lmem80bWZsRk1KakQ3Y1dxRkJWRW9mUER0STFX?=
 =?utf-8?B?MGt0TUFSVHUzTnBvVDdXMVNCYlg3TUFIK2ZacUhoOXZNQSs1SER3a3RLVnBY?=
 =?utf-8?B?Qk5FWWNLL0xNa0FKbUtkSU43YjlORWNUbzVkV1k5enRVS0pBRi80bkVTK1pw?=
 =?utf-8?B?NFBRdTJveUdIaUxGd1dacVc0UzcxdVJaYWlKUmNva20zS2JYaVVRMCt2cmhP?=
 =?utf-8?B?cVhIaW5Sa0c2bXdYRUR4aEtiTG1PN3lla1BDY1NESk9PY0tIV01Wc3BtcG5E?=
 =?utf-8?Q?zbfVjDeAZoo+M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWttb3FuSTZBbnJZeWxqb0xsMlNwTTFyM2xhS0c0Y0JXZGJEZXFNRkhtSXQ2?=
 =?utf-8?B?UnBvNFNTK1NqM3Z6NG1nRVlBUHVYMjl0MEtzNDlQc0JlNEl4aXNtaUZVTEJD?=
 =?utf-8?B?N3l2dDNJVFV4SGYyY0RlQ1lQdlh5T2xDTjg5Sm9BVVZzMFU3TEFmdzJqVXM4?=
 =?utf-8?B?V3JML2RxN3NyTkNWdEFCbWVhWFcwdXpaYy8vWTgwcnBUQVNZQnUrOCs4d3BP?=
 =?utf-8?B?NlBFVHQzVGdiNUJmWDJyQjltNXV1RHRjWkNvNjI5WGl1OWFTZFdGSjM1UzJO?=
 =?utf-8?B?N1VGVkxjaFhPS1hmSkhhYURjMnp5czhzQmV6bGtGd3dVMUZkNFdleU9WbC80?=
 =?utf-8?B?SWNDM1VLYzl4NUdJWVdyQ3BnUTc5MjRxSkNoc05LTmJqbnhtNzU0OHNpY3Br?=
 =?utf-8?B?UFpvYTREdnErVERQR3dqUFhIbklRMUl2Z1hscG8rQ3U0c205dzQ3VU9DdTZE?=
 =?utf-8?B?djdJNG1Dd0t2eFkybDZMSEt6K0kya0RuaEljLzZhdk4yT250dzlzcHBtMklW?=
 =?utf-8?B?RTMxYjdHTmRoeXJVWDFJUVpaMEsrdmRRU2RYUVVSaUFOalJyb0tHU2ZvVWh0?=
 =?utf-8?B?Ykg3TlJLT1dsdG11Tk1DU2FRTWE2ZFp4ZWVhemRVc0c1L1hRZE1LSVZ0cnA0?=
 =?utf-8?B?Mjl2TlBzQWFWb2ZmSTlRaTVyVDRISms0Y2V1TVdCTTViTWZxSlpyZzBYNUg1?=
 =?utf-8?B?MVVMTGJ4UEsvZ0M3Mzk4d0VlaW1TSjJCOG9qNHl3aXdOcnZKZndLeElESmpy?=
 =?utf-8?B?VW8xbGJaMm53VDNTaEMyV1BMMDZ3MEVTQWFrRHdnMXM0dFZTLzluRWlweVox?=
 =?utf-8?B?OTNBMVRGUCt5ekpXYllLajR6NWJ4eGNJSWp6V3pVS3Q4SnFXVUFSRGx4a3ZM?=
 =?utf-8?B?cHJtN05PNjM4V1l1UG1RUVp3RTA3dmRHUkJ5UzR6S1Vhc1dFbFZLdzFjazBT?=
 =?utf-8?B?RzJVYWR2RzBUK3d4UHNkU1lhenpEc0hva0dzdmJ4SmVGQVdFY1RZZ1d1MFMx?=
 =?utf-8?B?NEc1dE8wNDdOeFpKYVdhLy95NjNVRWc4Q0dDTUx5dVZNVUsyS2xUTVMvODFH?=
 =?utf-8?B?Y25YSDZTN0dlMi9xZUcreit5TDlaY24wUzhIUXMvTDlXUmNrTEp4WnZtaERz?=
 =?utf-8?B?aXlHYk9Ua1ZLVnZQdzJIeno3ZzRTRi9kNk9reTZsUkE4WUNHK2ptT0lPR1RM?=
 =?utf-8?B?ekN1SzJBckluei94VHZmOHJLaFE1SjZMTmJwL1ZDODEyVXpsc3lRT2M2ZWFZ?=
 =?utf-8?B?QlR5L3JKWnIxdk55TVU2ZHpNWlpXaFJRMzRrdmsvVmlRRmdiZWRLWEFESFJO?=
 =?utf-8?B?QmNuOXYrZnFodVhQMTNFNEdSV0ZnVHZsQnltOXJhc3V2Z2NCckJwVi9xcyt5?=
 =?utf-8?B?VEdvdlNLdVhhM2V4SE5GbWk5RnM0TDRPWkIrOEluVUZvNklJZHcxL1ZTQWFZ?=
 =?utf-8?B?QTdnelh2MEM1NHEwQTdnS2Y5aWVtdGQrdUI4c0ZNNDhSNTNiakNld1F6a29P?=
 =?utf-8?B?eWpQbHgrRDB2a2tUWTE4KzNkaksyUFdJVGV0SHRvbDMxUWZBZTJlNHVkVHNn?=
 =?utf-8?B?VGhnKzRjZXQ1a2NUaEZVeFA5ZjBPbGZZY1M4MDRiS1Rwb09tclBpRXpWWkRy?=
 =?utf-8?B?eVI0N2ozOXJHaCtxU1hqTjA0S2phK1pSMUpNZi9QLzNxVUpJcldwSmZ4L0ZP?=
 =?utf-8?B?OHp4NHJROUUzYTNkaDg1cGlUNkFsWitkcFZhcDgzOUo1elc1YjJ2U1NyakVJ?=
 =?utf-8?B?Tnl6M01laktLRlRrNUZZSUQ3TUtCYVQzVHlOMTNJakpZYjQ0bm5uRkJkU1Bu?=
 =?utf-8?B?YWJTZ0lZVnpBMjdheXNESXhXem1OMStiaktRSTlSMkhjN0YycHhWSHhFeDVF?=
 =?utf-8?B?SEZ1R1dwclAwcEw5QTBEYVFhaEtwM2MzWW9LNVRMd1QzU1NBOGZKUVZ4dWNp?=
 =?utf-8?B?Skg5VkN6UDc0Y0tsSWZ1Kzg3WkJCdkQzb3ZiOTlYT0ZHVVJaZGk5QXRkMlBu?=
 =?utf-8?B?RU9uQTFzcnVpWDVLdjlMYi8vZFVWTjdGYnQzdTEyZytOaExrYmVTMU1WeERN?=
 =?utf-8?B?emV4ZHgwbTRKSzBVVVRyOFdyWHFBS0JMNjJBRzFMek05NExhaUpiRnFSZHBN?=
 =?utf-8?Q?dHzTVDfFJhCJ1/5VF0fU9fEnt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97fd2d6-9049-4a29-9058-08dd3afe5fb1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 16:03:56.0957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUUPbPU8BO0EstKCBCu447RqAex9gyXZ9PFtd5Hegz5RBjF0qGWM1e1GoAE4Z/c+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_080412_659018_8006CBC9 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Rob,

On 1/10/25 17:00, Rob Herring wrote:
> On Wed, Jan 08, 2025 at 05:03:38PM +0530, Shubhrajyoti Datta wrote:
>> The Versal NET (Networked Adaptive Compute Acceleration Platform) from
>> AMD/Xilinx is a next-generation adaptive platform designed for high
>> performance computing, networking, and AI acceleration. It is part of the
>> Versal ACAP (Adaptive Compute Acceleration Platform) family.
>>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>> ---
>>
>>   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> index 131aba5ed9f4..e0fa36be7e35 100644
>> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> @@ -10,7 +10,7 @@ maintainers:
>>     - Michal Simek <michal.simek@amd.com>
>>   
>>   description: |
>> -  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC
>> +  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC or Versal Adaptive SoCs
> 
> Perhaps make this more general instead of adding to it for each SoC.
> 
> Also, the '|' can be dropped while you are here.

What's the way to generate documentation to see how that formatting looks like 
when | is used?

Thanks,
Michal

