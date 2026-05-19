Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB581CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUKQYHsN7UA4UaKAVZCB9R0jrZ9LJ3tLbf2FOEnxsh8=; b=Jdk70MReLWFBrnCAeV57/YkC1V
	+94GKYNpSCcqoQrW1b0KYUl7uaMD3E6Hvp2CK06rc7XQ4vo8k8OMy48iQOlqL0KFtwuAJfjmItj5N
	r0DYhiOi7PPh66wz9CkxJksN/4nlWjbbcAGDZxqXxdCgI6cEIgvf9FsTExnsGT+7PwRv1T0hw3mJu
	U7Ee2rkwYzMyZPIZXIdqHPNLpYMQKiy0kSA12CCtnLqW8WhJwQ6Hxz/NZc99Al8XHkNTCbL808PJS
	bC6gMkj3nYpoNLcrbhDasx0XhNMM/4b3Y6EUGEcw6VbeWtyjF65iYMHhcODJfrRZ3k7u4HuBu/POF
	lOjZmRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFlP-00000000fHG-3Ikh;
	Tue, 19 May 2026 08:25:19 +0000
Received: from mail-francesouthazon11011043.outbound.protection.outlook.com ([40.107.130.43] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFlN-00000000fFE-0MQP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:25:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vy1/HGRBXsZpXaipDMHpPRR5wA0ZF1GfadATLsCQUxdLl+PJuas4f2L36fkwJmn9xmjszYz+L+xy3Hi75w1lkwTQMG867nubywN6/QsoRn+7WO9sFiMNnV9HlmX5Nnw6xMFpCkbUuSvqVeF88QSTyM/enbNSimnvbr0AJkLVdbVUcNDreBjauTq56tiEOjdlnnH2YBlV8D7QsGWuM7FeDZOJWawYRYyBfSZXCEe1wuaulfahCbr16Kss3ryQz/ijgEmHkF8U9ln7j6OJQ7Ebjl03bZJu5M6/0afmDkTtcHsmdya6aQGSAG96aYxm3c+CHKcUddclPdH144pY/7FBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUKQYHsN7UA4UaKAVZCB9R0jrZ9LJ3tLbf2FOEnxsh8=;
 b=vlLnhAueI78BdvaUcKxUdxpBpBknpUaHFcYzmN9flBGHuK4lpnHcRhH8B//Tu6NrZl03vOvIPXjfEiHnDHA963ofpJTeAZUqe4Yqflurn8pcnOTYS+dxGZsJv6SQvwnCsjEX/Gl2O2GQasKmvY0fAWcHGWgTQh5+lvxPtAFRFTqYi0LirFnmpVrKpTfShGIWIW6/S+XawhME28pLfIKsK5hAMNKLtt/7w8c/jXoP5UiRU+YCS8skgNhNvxS+F4inaYl35iimwZ6SCnL4y7NeZd4p4Pe6kyc2fN2EP9oc6uwUERiKfJvLO7i+wj6YVRsUilb7Hpy7spu2hfJpDKWohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUKQYHsN7UA4UaKAVZCB9R0jrZ9LJ3tLbf2FOEnxsh8=;
 b=ZCqiRZS3rBqcQD4o31EYDzGTrzozNLv0b3xS3x3ZXPM7MBDKwx4a1ffvhvSDh/hdpHRk0IzqLJz5taPLGKpQNyKql6XxTYbb0e0OmuNaF2XRYyEztRMx5e28Dc2qOAuXfUMO2sURyh32RSemjhlI1UqMTzGx90ln7gt3mnsUqEcxq8tbqdYHKUjy/X7d66iWH6xxwjnAyfrbLh2YRWle9D15I1R85et5Y6bn3oHzsaH9ZVaNysz4ZufOjWkNxOq9qh4kNjvcGLgK9DkULvnnCaQ88lIdA5QzHvy0Vb2PdWLEyxcdhuYmAyjYrl2GL0BnWkJuv2L2TKgUeD4lncxkNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2611.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:336::8)
 by GV1P189MB3028.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 08:25:07 +0000
Received: from PAWP189MB2611.EURP189.PROD.OUTLOOK.COM
 ([fe80::b400:cf4f:b2e1:d884]) by PAWP189MB2611.EURP189.PROD.OUTLOOK.COM
 ([fe80::b400:cf4f:b2e1:d884%6]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 08:25:06 +0000
Date: Tue, 19 May 2026 10:25:04 +0200
From: Fredrik Markstrom <fredrik.markstrom@est.tech>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Santosh Shilimkar <santosh.shilimkar@ti.com>,
	Olof Johansson <olof@lixom.net>, Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>,
	Ivar Holmqvist <ivar.holmqvist@est.tech>,
	Malin Jonsson <malin.jonsson@est.tech>
Subject: Re: [PATCH v2 0/3] arm64: perf: Skip device memory during user
 callchain unwinding
Message-ID: <agweYAbxRWOs41BE@elx-5cg6022w5t>
References: <20260430-master-with-pfix-v3-v2-0-bd526ec04a75@est.tech>
 <agsq4wZMGth-T3BG@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agsq4wZMGth-T3BG@willie-the-truck>
X-ClientProxiedBy: GVX0EPF0005F6BB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::645) To PAWP189MB2611.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:336::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2611:EE_|GV1P189MB3028:EE_
X-MS-Office365-Filtering-Correlation-Id: faa2b958-6c22-4d17-e0e2-08deb58021e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|4143699003|11063799005|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: WoSTB1VHJOXttLpVWO2QZfd0eEQBFQhl1b2GowHeE6YW/ovUcP0e5rDC6LJpGCb2a1e6WjBHA1mP9yGST+FpoLWpINQpG8B5CEnJH8Du7OyM3F3Q7LtKbgfz9LgMBV5wf2oux56qza0WtvEykmjCNmWBUNZ3qzFpXOs1+Zpe0OPntlfJsQ7iLRPNkm1H1kTz1rx5XJssMzkgJOGR//pksIpq7UPuz2wOIUDj51CJnVM5H2CJC9wHBW7+/4ldGVoaH0CvRqVK7I11ussI0eBzsp721peNTiXltWBmF+DiZUHwZhRf/5e5e0bihl+OmaTRY8yMAsSK8dzwp7CUOJu3IrLRlNkev2PGkJeRMDff8knzESl9AwXOA8S4Ai9J8rHimF6YvHXWn5A8DXiI1acJO5RDc79PdT7Cwo0xMlaWkorsVzV4ixvh4bT+iVZRRccH/pMdVZ1Iq999ndYzMqWoeUf3uFhaYB20nN5DTbjj4cht8AZMnLslDZrgtotUxU3l/MOR/9L1q+E847WwcQHBMeMXf4KpivGcsasIdD6DVWBz4/KLBoOFDanR6vKlPVjM4fDfluOt0Poacq1KDOAda3qVWdPmMljzmAkXpm2FbnyciW4D9B8eQwht9lQhGASlIxxLXZLTR35H3PEM5symH0HnVd68KtLnUK9ytNjIm0BxPXwmJdOUB93Ek19DT6bF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2611.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(4143699003)(11063799005)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHFmTUlndnUvVFRLRWl5K1E1UkhISm5pczJybGZ4cG9aUU02R1hzSlR5cmc1?=
 =?utf-8?B?a29TczVIM0dTNStEeHNWNHhzcldCc01jTFZaeGJxUTljQzlnNEZGM0Z0anpq?=
 =?utf-8?B?QjBLQVZmU2M4aWdPc3VlT3ZxbDdDMURWcldUei9kVzM4R2NYUzNLQTNwMmF5?=
 =?utf-8?B?em5kMFhPRmhxbk83L3BMc2dmZnd6Z24xcU5Lc1NEYVJyLzlGUEN6b0RpNTd3?=
 =?utf-8?B?aHBwbHRqcmRwWXFFSzB2NmpwZVlSU1JlRGYvL0V4YVZtNXlVVy82aEc4UWhV?=
 =?utf-8?B?SndEUFhMWjdCcXdGZ1BUSm9PSCtPcU1Qa05DblU5MldzWFlVSkdOblFBcHgv?=
 =?utf-8?B?OVpjbjJKZ0pwT1VOZkZHLzFaS3ZLWldCUUFBQithN0xiL3l1T3lQYzh6RFRy?=
 =?utf-8?B?b1hCOFJOMm13Y3p4ZCtFcGhvN3VBdHAvVHlXUzlKYk1SejlYdXNUN0Jua1NV?=
 =?utf-8?B?bm10MWpEeW9FQ3YzR3JjTWQrV3lsN2YzcGM4ZEtqaFdiSklPejg1cDNtTzk4?=
 =?utf-8?B?UXFIMkIvM25sN2RsOTZWU01oVzhDZEY4VU9GQUNWYXpjeUZIMFJ6UkdZSjdP?=
 =?utf-8?B?djdCeFFwbGxRbGpvVjZCdTh1UHFTWDFlMjEwL1dVa09RRUpsR05SYXBTYk5J?=
 =?utf-8?B?Y3VtUytUaHJRakU0TDN2MmQrUlhtRUp6M1AzOStkeFlMMzZTMHdsSWdGY3B4?=
 =?utf-8?B?MlcvWWZyRjVTUzVCR1dwbzN0WGR3enpodXdGWWVzOVZ6YlIwUWpNSi84NnNl?=
 =?utf-8?B?SmxUMEdsMHYwdUdPL3J1dzgvSEpZYkNKUkhBcG5yOU1RY2xEZnhGNjhyNC9S?=
 =?utf-8?B?SWYxL3lGa3g2L2t0UTdPV1FGa3o3OGJiU0FPTXRhRHprYnZKclVMN1ZGYW9C?=
 =?utf-8?B?MHNyT1FHbFF2dGhHNW9jSmdwV2UwYlJXKzBqb2E1Um1GU29TMGxzbmVKd3VL?=
 =?utf-8?B?WG5QWUltTS8zY3gvNXRoSTRuNTRrUTI1bVVKcExpYlh0QVJKM2Y0NUxiTVlT?=
 =?utf-8?B?K2ZROEYraTdSNGx5cXh4S24wVW9MSGpoSmpGclJnTEtNTGFGT2ljb0NCczJ4?=
 =?utf-8?B?V0p4OTM0d0tjeUVKUXZwZ1NWZzJSUHp0UVdLd3FaUEJUN0p4T3d4dVJNWG1W?=
 =?utf-8?B?clVlSHNDWmd5SzdmWEIzUEh1R1VjQ1Q3b054bW5PZmdFd2tibFVWWCs4UU5t?=
 =?utf-8?B?U091TEN4eTUvMU5IemJUSGdnVnd4d1V6M1k4TmxuVDh0V1RqZy9nSjE4VzJV?=
 =?utf-8?B?MkhHcTVIZEt1M0lxdFFxY3orU0NoQUcyMHloWjUraDRWUVBlZmsxTXBYQ1d2?=
 =?utf-8?B?cmZHZlZDVVdENG9zaCtVbmRZa25WZTBxT3NacllnMk9oMGV4blFXMERTV1Bx?=
 =?utf-8?B?bTRTTEh0VXZyMU1XdGpXQXQ2d0R6KzZ4OUdVMHV5d1JtNm9rRnRVYUE3RlVP?=
 =?utf-8?B?RE0zL3FPNmE4SzBsdU1LM3ZNRnRiSXlKY2tlSFlGNG53QnNYMVVyOW8wZXlH?=
 =?utf-8?B?QWFMWkRjbVFUV0xzNVB6VFQzaVlzNUxSbHIzZ25QYnZIOG5mNWwyakRUcU03?=
 =?utf-8?B?RktTK0tjUkpSU0pGOEZDWWN5RnBOTWMvbXBaOUszVjRQQnA0QkpERHBHMC90?=
 =?utf-8?B?M3ZXS2dFMHllcU94UmE4cmZ1NC9lN1BoMzJLa01XOUNkSk5qUW1PR3REMEc5?=
 =?utf-8?B?QTNRaVZURDU0VVoxVHl0WjUvT2hsQVdjVUYrSnhTUW5WTVlaV0NRN3NSS0Zw?=
 =?utf-8?B?cXpEbEtFU1NId2hJeWhTdEwrRDloNHNDMUNMRWVmR0dOWno3TlVnR0xFT05s?=
 =?utf-8?B?S3BjNHRXRTF0RStqdmV0akdXUTRkMWNiVU92VDJ2WlIrYXdac1BqdXFrLzVH?=
 =?utf-8?B?NTVFSnhPTVAvZVRKZ0JKQ2N0ZjF0YTlYMU9raGNPTnAvVGZiTVNYcXBZa25E?=
 =?utf-8?B?YUQzOVZoRWNXanRZY1NwMHYrQ09Lc1YySEI5bUpBYUJ6dmg2eVlGMmk4SVFl?=
 =?utf-8?B?eW9OSUtJOUFaQVoxODY2YzhtWXY1NkdyNU4wdFZjb0t1SHF6c1BBV2dRcHYv?=
 =?utf-8?B?YWNwUzJjc0tSVEJ6SSs2UEgxbERlbTd2Ty9vaDBaSk5BL3d3blBPdDFiMU51?=
 =?utf-8?B?Y2dSSzJPSTdHekJwcjljeThyUXgrZXo5ZE8rNHNyVHpQRlJLLzlwOXdjOTFv?=
 =?utf-8?B?MnNqUDJYK3RuL2doYjgvc1h2S0pJMTZOYlNhWUg5bHlZQWtGUzYxRDIyTHpD?=
 =?utf-8?B?UStkdzR0MzErV2RWSjZGVGZHSERPYUFjQyttay9EWHphOXdxTVJsZmZ4N2Fp?=
 =?utf-8?B?QmlXT3g2dm0vVGwreUdldTZRckJxc09sZjJ1U0RHWkRtTXpqUDNoV0U2RUh0?=
 =?utf-8?Q?awvuXZRNpMidQbBU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: faa2b958-6c22-4d17-e0e2-08deb58021e8
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2611.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:25:06.5161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTfOEw2vGzT5PDplDlpHn4yUnJ4Yi4412seGhBLyzEW4lfP2s91E0bukIJ3ERdgLU7juZP04yhckVBvVaYtCpfA1wqwb673lUGulawZHzvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_012517_159043_66E0F06B 
X-CRM114-Status: GOOD (  19.13  )
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

On Mon, May 18, 2026 at 04:06:11PM +0100, Will Deacon wrote:
> On Thu, Apr 30, 2026 at 12:55:12PM +0200, Fredrik Markstrom wrote:
> > Perf callchain unwinding follows userspace frame pointers via
> > copy_from_user. A corrupted or malicious frame pointer can point
> > into device I/O memory mapped into the process (e.g. via UIO or
> > /dev/mem), causing the kernel to read from MMIO regions in PMU
> > interrupt context. Such reads can have side effects on hardware
> > (clearing status registers, advancing FIFOs, triggering DMA) and
> > on arm64 can produce a synchronous external abort that panics the
> > kernel.
> 
> Hmm, but why is unwinding special in this case? If userspace has access
> to sensitive MMIO/device mappings, it can presumably pass them to
> syscalls and trigger crashes all over the place?

You’re totally right, a broken app with access to hardware like this can
already cause chaos by passing bad pointers to syscalls etc. But the big
difference here is who is to blame when things crash.
 
If an app passes a bad pointer to a syscall, it’s self-inflicted.

Unwinding here is asynchronous and unrelated to the application.
Perf interrupts a perfectly healthy app at a random moment. If that app
is using the frame pointer as a normal register (totally legal in
optimized code), it might hold a junk value that points to MMIO memory.
 
If the kernel blindly follows that junk pointer during an unwind, perf
causes the crash. I think it's acceptable that an app (with hardware
access) causes a crash if buggy, but I don't think it's acceptable that
a profiling tool is causing a crash just by looking at it.

Fredrik


> 
> Will

