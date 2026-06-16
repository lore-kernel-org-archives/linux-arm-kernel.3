Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F103CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MP8dptSvpbQfJMED3AeDoH8XgCcXJE1EoO9wokh75w4=; b=tmoddUpz9jRRJK18OdrGLN7tuU
	93HxJhLvGnSgCFgTNulsGXWH9OLbidxjwMRurspAMnHhimpAhmXEEo1FCCbDi1OfWteMyIH50NBDa
	qP5ysajptlKhHBEZXCQsXYmSA14wWrbJ0hF037Fyv7CB/vCPFVlX3PhPZXKVbaJOULvbbeQeY/CQY
	4o7z1ADNCtv9XWgQpboHHoZme1AD8kXRJrlvGsF230znJsX9r576U45sErlKEdx+aBuyZ7ZbR66yc
	rnJOPdAP3rqc0uDD2F+AsbC7IhfCFTpkn6bdoOUOTmZnf87a7GpoOfZXAg43pqOgCXVT1/AjHeqLi
	K3T8wh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTkj-0000000FpVH-3Xkq;
	Tue, 16 Jun 2026 13:22:53 +0000
Received: from mail-southcentralusazon11012061.outbound.protection.outlook.com ([40.93.195.61] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTkg-0000000FpUm-3BcI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 13:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3gM1dTVx0+JCZMTzcPXN8Lh20fu3kY2kZNYjC3kv/RollupqR7UTCgzt/mhIhioTDF+Fl8KS4KaIj3VQeBfc/O7cMgxSFVQTKycJXLcXHlwhHkwnVKlz8IgBNBeYVK2BMlPKJLFr0YFM7bJ9uEczLnp4GZ/6ex+K1TmOQrG6YCIeWS+w75ZPJRRGePDoFVpv44gy+qYto7Vp4xl0Jfr6k2YLCzAoaoBzFmT4t9kiABJhtJJNj1+1lYmwtIGhFrTUs1LED9+HO+pUuKIPmfJboksyHxMeQ/5VVRv3bhBaScZelWoBxP7/uFj+q0HSjg66ewTo8Yicpm31r9Agt8AJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MP8dptSvpbQfJMED3AeDoH8XgCcXJE1EoO9wokh75w4=;
 b=VL3IjnE9aj+D9wgsErNfUh+o44UwtjLoJtmM72KEZn+R8W4trj7B4S2mXnURTSXXBTwTmWZJCuvyDx9EmDAbavhmZ80ocXj1pzjgu1wkn3+i9qcs6DZ4clxpnHEEFi7vyxPnfKIqOCjgxCqEzeavoQByo39ymkHShHYrAcmSc3uB/Pxg6KmYGgVfuEIC078THAP/R/IYQLTxBaCyMRcs5SKBEUfRxN9+MF23RJfnJ6PPiJwLOz1DIJ83nCedzNNR6cZf78JjAOIXsBlDQlQbJLox6gbIFXK4ip2ycQzvZMrA3QN+uv15fNH9R2bd+rqKuGfbgGL4X5YCyS9/G/L5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP8dptSvpbQfJMED3AeDoH8XgCcXJE1EoO9wokh75w4=;
 b=RWqlsv4tJ8CAoC25jZmjOwih0AEiZx+lh1aJk3JL3+iqMZnaGfMtkfsFxTOBYZRV+UOzz7dfhdG+HjUGb/zTfCq0AuTIBhkoGLh2L8DTbVI452I1xyaX2l6Os3uYNi2Iuop7KgFQet1lBtHaRcTc35Tz/im7WMH1IDeazCRMxUBo0Ldo02aZOEiqTHACcrlGpZIpOJiwwV3bWmANcdcyfWcLOeO+H+tj5uAeSo1AngZTGZRqwrcegvnP7bg3O3qUUj4gj8Lyk+UdhZ43VYczyvB5IZgg/H7KU2Kv3P5e4H89HDuMwIGBCKanypFjE/oTLiTXqInVPf/xlGeCjPo2hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 13:22:43 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 13:22:43 +0000
Message-ID: <25495831-f32d-4332-a7c2-fb1463b96174@nvidia.com>
Date: Tue, 16 Jun 2026 08:22:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
 <aiq5VigmtZq9GlAm@willie-the-truck>
 <IA1PR12MB6089049028A73A2078FC6831C71B2@IA1PR12MB6089.namprd12.prod.outlook.com>
 <851c4107-3f6d-46f3-b659-212ce4f69e6e@nvidia.com>
 <20260612124825.GF1962447@nvidia.com>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <20260612124825.GF1962447@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: b0290427-ee36-4e5a-c6a7-08decbaa5873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AYdYSK9XtuxI9dUX9fT4WoOJpnFkcPQyNjPtq8EZtoLg+csdqLA5spf6Wm3LfaON8qmIJdk5Nfftuwqns510h9hQfHyIhVSN/YWdJ0nvVlupSVmRl7fyoNSgNzRYSBYShYVs+3qJzjkd3KzPw66/3msw23UECo5UsDEUvQ8WrH/iWI2+6ULXfeciKLrgA/nrXrkVIl9mvUDgO6D1rqsKSCQFDDQgVho01omD+DdzJjU5LhBHqX/bZEHIyFysuUP8NsbAP0DqGfgoa3oUkOTaI3qid/hDZpCr/w6Vo4+gBMgPuIc8gcNDoroRdr7nVax8UDeDNHYgJy9oG5ZmbyejlWT6+hE0QfbIr7mo/Da4yzgTUuPe1Yxdv5lVFemZ7zToH3IgO+EeRJ0XNfNkJbUy/yBYJ6lpR6TSsBEtSJgu1HDfMjRb7QeoO/kQzizr+WdcN66RRHEcqysnGcGbKGO8KSCgARyZUofn70lZ9BAa9NxQNYy/aYjcK9DojcgW0FkkHBCYeiibtjNOkKuTxtX0JriY7H31pUqN6saGIgkohxLS9gJF2ORKHFADZEBdjGr3zT3F2O4+SypM7HKao0hdR5wjehP5fGURWXElbYhwfpxcIPbE4CwLkUHS9jHxMcdSopAQpunFHmYHBvR2Qs6VCXDU36NnNtaKgCYSqpwH9Sl6x58ArrkCV4gQmn4gNZyn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkxCQkRxUVBOeG9rQXFiSVhJS3JSWFV0SGZBdWJtaTAxc1NOanNQTVdyOHRk?=
 =?utf-8?B?MmljUDVQTzNtRHdqNE12ZGFmNGVOYmFJWDN0TGFUbWlVVXc1ZUxaK3BMQ2pV?=
 =?utf-8?B?OGFrVTVscmFKdzlQalhNSGllRUg1TUVjZklseHBlRlZxaW1tblpFbFJNQkxB?=
 =?utf-8?B?aWJVMERINFJka0xoUWdFRDNzRmMvbCtGNVJuNWx1cFAzTlcvZlBRK013WEZv?=
 =?utf-8?B?VHVwN0dLdlpuNUtCWFg3ZXZuNkl5bkRqb0pjWGpIRHhMZy93YU1yMk5sZWZK?=
 =?utf-8?B?UTBxSGhoSE1hK0FuWmJvbCtjYk1KalRsOHgxSDEyajJ0RVdCNUxKeXVUZlB6?=
 =?utf-8?B?ZzI2cEMzN3BKSHZGRSs4bHYxeTBGeU54bXJ3UEdpek5ueVo3R0RoRVRVK3dz?=
 =?utf-8?B?RWpPRWNMa3Q2VFFzK2svNlIyTmxJOU5xZmpla1Bla3c3ejZka2xYTVZRdldr?=
 =?utf-8?B?dU9ySWZOM0dJd2Y4dG4randsUHF4Z2lNUFBjdG8yeXM1ZCthVitUNDZOdHRC?=
 =?utf-8?B?bEZiRjErV3U0a0U1dGF6NVF3OVN3SVNCRjhEVXJ2UGF0K1lwcEsvbXgvandX?=
 =?utf-8?B?bnAwY1Bra1pHcnBCNUExSUtReHR3OE0zdENwdVhlaURtQXlUYXRsUXFqdUtD?=
 =?utf-8?B?RitqdFZRYXVmMkxjeS9MWmlMZEQxRUxvMit3cFFJRHlpQTltNE51aVg1Ullx?=
 =?utf-8?B?MzQzUlBCalpNVm1lU0RkUUpaRm1GNEYvTS9BM09YNFBUSFNtYWs1Z0cxTllq?=
 =?utf-8?B?YW9aYm5ETGRWdlNBMmVPYTNsOTBOcFlhYTh1Y2xGVUw3MXRwT05YNG00YmJT?=
 =?utf-8?B?V2RyWE9qZGFyNWxhYXQxN2p4ZDNFQWZwellOT2RrWFV6bkRhYTZ2d1JCY1c0?=
 =?utf-8?B?dHNQKzJjcmpEQTY3NnVKTVpFeFNwVHVzV3JnN2s4bTZjVVBYZFhnSlEvZ0Z6?=
 =?utf-8?B?ZlllVTZuZzBJdkg0WDN3dVdpdkovL2FKM0RISnRWTk1FMTFsZ1kwdnFuSDUx?=
 =?utf-8?B?enRHZTJxUHk2c2hYOXdRWExVUXMyN2FYMGJaaG9Ca1l2TGJ2bHBaZ0p1ZnVu?=
 =?utf-8?B?Z3JiSmYwcDZsQm9LcWhNM3EzcEpRSnJHaE1sWEtJZkNvN0ZibkxVSFlZNS9p?=
 =?utf-8?B?U2tRWm9tZ1dvbTlieFV2TGFYOWVsZ1dDR2Z2NGNoMitxK1phMjRyRHk1eFNF?=
 =?utf-8?B?ZUJzSWJFSk5TeXh3YkR4cjUzSjdpeGxtdDVWRFdmT0FOczBBTGtXUkZVR0J0?=
 =?utf-8?B?Ri85VVF2WkNxNURiYUMvRjdwSE8rQ2MyWEJ4U0ZKMXdZOTlRbmh4SFpOa2F3?=
 =?utf-8?B?TWZlRlF5RjBveHRJL0pZNXo0SndEaUNFUnI0U1ExOC9yNk5xSVpYdEtvRW9h?=
 =?utf-8?B?S0d5ekxqQ0hHU1BVZlhQWGlUbUdWYXFhNDc4TlVrcWNDRUxzRnBsTWRVWDQw?=
 =?utf-8?B?c3NkUldRQkhMWmVYT3pmdHpZSFJGeHNvMlV2bUxyZkR4UmxCVWdpMFpuQzJ1?=
 =?utf-8?B?dXJYNjlaV01PcXQ2ZGEzY0E4dVNsaklmRjdzR1lrMjF2dWt1WG5BNVhhNjBL?=
 =?utf-8?B?Mi80bmxnSU1RUjVMK1RYWTcrSFpGUVJxNEw0RmtWUU4vUmt6R2JyTzFPT255?=
 =?utf-8?B?NzJ2VHVkdzVCdlB2bDhiQlRQd21aR1pOTFdZYTEyR1NOanp5WEMwOHl3YUhV?=
 =?utf-8?B?bFc2bk1ybVdSUEdHbGtjbzNhM1RhNWhVTVhHb3NDbFc0MC9UeWtZMDdTWmVK?=
 =?utf-8?B?SlhnaXBVWlVFYjgrYlZhSkJKZ3R5dFNRYnZHcHAzNnNWSkRlcGZuV1I3RkdK?=
 =?utf-8?B?QURMdkowaFByRm9kNGllTHBvOUtzV3ZIV3hZOXhNQmhZMXdMWjZsc2xjcDFS?=
 =?utf-8?B?cHljcFlJTW1PSkh0Sklod1NsMmNPYmRWbjVNbEdGa3hJVzBuU3ZOUXoxT0RJ?=
 =?utf-8?B?OXo4djZuR0xVejVlQkxHL1FJc05TaGZld0JOZUMvUWJLTGdHR05vemxLaWZk?=
 =?utf-8?B?WUc3YmdpbHROeEVMdVhLWk5jUXl3OHhyVU03Yi9RSjZJaE4yaDJzbkR1K3Jh?=
 =?utf-8?B?b1VsdWx0M2dXdkRuemRQSWcwZ2IxTWxiZVRJU0MvVnE5d2hzblJXUnRiN3JS?=
 =?utf-8?B?d3NqaXdlT2ZEUjNmeTFack03VkVseGUvQ0FZYVRuamlqR01lWFJjS0NEWk9z?=
 =?utf-8?B?VHA1cWtzQ05Ca1M0UUd1S3p0clZNM2pnT3Z3TU4wcUNvdTdBbi9xZ1phRkhU?=
 =?utf-8?B?aEQ3QzJHdHljenhYTlFaR0pGYWdkSkJnNFZqN2ZiUEYvMTdkbHR1NG4wOGpK?=
 =?utf-8?B?clBLNUordUhUYzNMQm9JSHlld2hhVEZLWFpRK2lmTFJqd2g0K1FWdnljN1lS?=
 =?utf-8?Q?xcSg1e27+ZRUMzog=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0290427-ee36-4e5a-c6a7-08decbaa5873
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 13:22:42.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0/OpBJPy/nBy7f8rYE7F5pVF7kvmyVgxaA6n5QOW2+KYzcMJcjRfMIi940egDrgK86Yl1VA+u812Sdhe8Y29g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_062250_802766_CB6C1B7C 
X-CRM114-Status: GOOD (  12.20  )
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

Hi Will,

On 6/12/2026 7:48 AM, Jason Gunthorpe wrote:
> On Thu, Jun 11, 2026 at 08:13:48PM -0500, Shanker Donthineni wrote:
>
>> For the scalar MMIO helpers, the workaround promotes the raw writes to
>> store-release on affected CPUs as v1/v2 shown below. For the memcpy-toIO
>> helpers, could you please clarify the specific reason for adding a dmb despite
>> the documented no-ordering contract? Is the concern that some drivers may
>> be relying on ordering across memcpy_toio_*() today even though the API
>> does not guarantee it, and that we should cover those cases defensively?
> I think given how arm implements them today the iocopy's are actually
> the _relaxed variations.. I wonder if this matters to any user?

Following Jason's observation that on arm64 the memcpy_toio() 
/__iowrite{32,64}_copy() helpers are effectively the relaxed 
(write-combining) variants, I'd like to settle one open point before 
posting v4: should the workaround also promote dgh() > dmb on affected 
CPUs (now Olympus core), or leave dgh() as a plain hint?

       
If you'd still prefer the dmb defensively, to cover drivers that may 
rely on ordering across memcpy_toio() today despite the relaxed 
contract, I'm happy to fold it into v4.

     

       
Please let me know how you'd like me to proceed.

     

-Shanker


