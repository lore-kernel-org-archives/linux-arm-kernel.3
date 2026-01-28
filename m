Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B43D35661
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQKBWKXJut+eQy+GgMzVO0K+qybhYmpW8h04L1Fy9oQ=; b=q21NNcEYf2qbi/qOTotgln7y4y
	HTF5ltzLD4osOYwXobZ8IRtwpiTEo2O5UyEjL3h4MzO8jrvkDG3vc2dC50mTF+VIqH9GUE3qLG6dk
	0EnViwoslHh4P3Ciz+tJEuRkGKKToAiJVpQBdszpRPyjNhEEehX+yPZpgytdB/4xmysNw2cN5U6hG
	re8G3SQLIbYQwMWpkC6D4QpakMiBHubL/iLEc+pKHHHBe/lHkMHHRF+ZUU2e7A9nHIB5ieaIIWP35
	o0/ZkBL6Q0o2CdIovh+Mo3LxyfUMlgErdSEpjJSlsKwQ1VxNWNiToSbF+JecfW2M4I6KcbsrIqiJz
	FMGpfUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktlb-0000000FEMn-1rzn;
	Wed, 28 Jan 2026 00:50:43 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktlY-0000000FEMK-362u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 00:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvoLBA9VFThGHwUWr6EV3SkvX9v07G5pl/10WwT/8w4BfE6HkYrGUOucKk/k9xEI4sQ7/UIW5zDZaVxR9cpSkV6K9kJ1JXqA64NPygnO6wnvR7ve8T2LCdSilYKqy13uTsX35zIh/67cNZA98WGgBo0BoM3UP76/Qs/hrcuQr4A3mFP5p6ay12AuZvDpGK83nBaq2KmdRE028f2/yvB8AXhfVOTXqjF0GNVhfEdUFnQCVB6xyA0Dz7DGWf3bb7aRBfp+V9isoMLnKWCdbw7e0aGujtQeZrAgfC8GEaReKiDhAR/s4pXctky1LycXVbCx8UGrIjg+mWE+ePojqJrd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQKBWKXJut+eQy+GgMzVO0K+qybhYmpW8h04L1Fy9oQ=;
 b=rUp8hs472CrVFDTAbS9oMY5+PRrVXLTktUDkMppm3zC4br7oZwFy/sVxTg1i/s8vG0S+WUGUUyTVTZZl1aFaqVY2UuSZvWAQ980N+/7S11c7OzzEvR0hfcQP7zlL+jWlzoksy/20akE9hZQvxQwZkBSoYxFIv3XtSbJYbKjzLrIY1wS9b/N1Z4QWfMshWXYkMalyLhRirNWNk94MRSPPtiJej1q+jyAuc9D1W3e5hyM2mA580/21L2E0xuB68GGxsGNZj+J+dpuOhx8j3+n6N3moR1fhJFkHxwYoNXf9ZMe8hXGAJ3S5lGUl3hh9NtFJbfg9lysfTF2Xz+aeCt0V0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQKBWKXJut+eQy+GgMzVO0K+qybhYmpW8h04L1Fy9oQ=;
 b=fY4t69IHhJ7DhcWrs/tAs5Xjz36ju/jRzbWZJtNO3DU07LofmsbMUBzs845Cb9+S7p0dyYTkowZSYey/B+FplEryXe6bG90Bba4k7pTHhRW6UQ4iKWkVtoofKyGDCzTmZzr3SOSyevxklL96nz/6BO8nMfhPcW7UF+IfdZXvAPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SN7PR01MB8133.prod.exchangelabs.com (2603:10b6:806:353::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Wed, 28 Jan 2026 00:50:34 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 00:50:34 +0000
Message-ID: <6dd16954-1b63-4179-9666-564d0a3090b6@os.amperecomputing.com>
Date: Tue, 27 Jan 2026 16:50:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
 <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
 <b3122ea6-7bbc-4c07-b329-3355bbb16db9@arm.com>
 <a0aeed19-02d2-4d74-b82a-f906dc41e240@os.amperecomputing.com>
 <aXd2rud1E0Gff8-2@willie-the-truck>
 <04f816f9-5533-4fe1-99b0-cd405caac485@os.amperecomputing.com>
 <aXe5WHBdHLEnh-Bp@willie-the-truck>
 <f0214a9b-74bc-4ef5-95db-670802ceca4a@os.amperecomputing.com>
 <67570fb2-bde3-43e8-8661-ab62444b2626@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <67570fb2-bde3-43e8-8661-ab62444b2626@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5P221CA0065.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:4::35) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SN7PR01MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a1cb96-f5ca-44e8-3fe4-08de5e073e63
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azZNQ1U4Q0JsN2ZrSTM3S0ExUmowZjViMk9KZm16U2tRQWs2VFBjM3h2QnU1?=
 =?utf-8?B?VTdLTnVkZ25OckVvZUh0MFE1aE1CaTZucmRoWG5ZQTBCMHJwbmxWQ1lla1RO?=
 =?utf-8?B?bjk5b0dGMUhZTjM4VklzSEowL2ZQZDJ6bnRublcrdEJKdVdYd2VIbHJRVHVw?=
 =?utf-8?B?d3FKNGxYZ2tMRTJSaDRYM0Izamp5WlhMbVRDNjhoYW1xTWQzNEFFSVJvRllv?=
 =?utf-8?B?WGtHakNKV0JiZm8wQmVkaVpMYVkrN0VXVjdHVXQzT2F6WEhSLzl0ajBsRnFY?=
 =?utf-8?B?VEUvckY3RnMvYnpIMVhjMVVZdVY0YTVSS3RMNHZxKyt5L2d0NDRCeitoaEgz?=
 =?utf-8?B?dFcwTldOYnhVSDNZdE5RdmxZSUU1UUt3cCt3ZnZiVnJ4TWNRYXFibUg4bVBj?=
 =?utf-8?B?dnMyK1dHMmxNT1VlQkNWV0ZLb2JVa1pTcVd2WkFjZ2RaSFR6NkpHcW5UMDUx?=
 =?utf-8?B?SGYycGh3WWVZRFo1NWVXa1RPbmJjNlhkWXYxc3JZVTQvOXJyVHRPL1NpbkZo?=
 =?utf-8?B?bVorZ0Mvb1poTU1XbWZuZFNiNk1UY1lqbGZzc1UrSkVINzN5djYzb0tUNmpl?=
 =?utf-8?B?TXdETlBXRkFNRG9sd2x5RGVCa1hNZWN6V1pUb3ljQzY4NGFZRVNaZFlBTnN4?=
 =?utf-8?B?UURYQVRTc0JheFhNaFVuTXZJR2w5RGdwZGlEYXVQN2dRZEczcXdGMzRpQXVK?=
 =?utf-8?B?RTJUdEZ1UThWK0tHaFZYZkJYQUxCK2N5eG9XaHBvZVRtNjY5dmtuaUdidlIv?=
 =?utf-8?B?V0gwVTJQaDB4bm81WmtQbHZqcXA5NDd6VkRTL2g3bkxxQ2tObmNGSmcrZGR1?=
 =?utf-8?B?TW5PZ3N5c3VYWnJoWHRCYVpwM0RDZng3UEFmVGNSdWU3Y29INHZwRWRyRU1j?=
 =?utf-8?B?OG1Wd3phNEhVN1RLUXJmL2lyUU1EdFoxenNKRGt2Qm95aHN1T212ZGlFVVk2?=
 =?utf-8?B?NFZhanAybWJZUTkzZlBMWnhQV0diRnplTFFxZm1IOHgxWUgyckozVVNmMWEr?=
 =?utf-8?B?SS94OStqbStNRXdjdzRKZFYrZHVEODRmNnNTWEF6THF1T2pvUkZEVnNsZ3Zl?=
 =?utf-8?B?eUhadzdhWHFrbDYwOEJBd3BWL0h4UThRUE1uSWJucDNvVUVyYWJlamVoVDdi?=
 =?utf-8?B?QllQbFpYOFViSzk2V3JEbURrZUdhUjQwZm94V3gvZUxFN1J2NkpmSmdadzVQ?=
 =?utf-8?B?QjBxUlVFVUJsemQwUE9RL3ZkclU4R2gvT3IvM3R3elgwdzZjM3dNVVhVck9U?=
 =?utf-8?B?cS8wZ0xURjR4YmZOWWt2TWNuQmVLZEpUekhzeW4rQVZ6aFhTYnlWQmZETXFS?=
 =?utf-8?B?dVdSTS9Kd01sODIxQ3lSakNaR1I4RG1yYWk5d1JsQ0htMnFWQTRRQXM1WTRE?=
 =?utf-8?B?WERzSkwweGl2ZHFhMk1sdGd0c3dzdGdhVTZ3RFp3UExHNFVSNVY4SzM0Tmly?=
 =?utf-8?B?SFEvbE1TNS9WSytwc0JrV3Y2b0R5QWtYVlF5THNkNzZ1YXJwenpPaVArejFG?=
 =?utf-8?B?RXFtZ01NUExlUUVpU3JDQWhXMkNsclNVVmUra2h0Q1dveCtkTTNpNTdmUE1w?=
 =?utf-8?B?anY5YllCRlIzT0ZlQUtUUExqVVFvQVgrd3pMZngyWFdqMjFKSG1YOVpNU3Vn?=
 =?utf-8?B?dTJMMXFJa2paekMrTkc2T05TenphNVl4WHRxSXlybU5LVldnbFN6ankvU1NZ?=
 =?utf-8?B?ZVNSbXdKVWZVUlphWHBmckp5UzN0SnZzaC9QYVdxczJlQ0J2S2pJQnM5Rzhh?=
 =?utf-8?B?b2ZWT2JldnVYdGtrMTgrRWtOakZ6OU05VHhZeUdKQWpoRkdqRnZBOUpqaXYw?=
 =?utf-8?B?bE9POXM1c2d4OWEvcEp5U25BU1NEckJ0RUVwellLcEZNbmdnWHBvb3owQTd5?=
 =?utf-8?B?d3JiVEFlRGlIU2txZW01YllxSXRZRkp1VkNmWjRybXU1cFpGcWQyR09wZmxu?=
 =?utf-8?B?MDRHWG1PNjBScVpRVjhkbWlxMTI5YzlJVlptc29xTE81SmYvZVcyWDNRZ2Er?=
 =?utf-8?B?UFJYN3djdTdXZERzYnVMeDNGNCszbFViWFoxdmFpamM0b0pESi9nem12RXlP?=
 =?utf-8?B?TzRCVXpNNVhOYTVKRC9Za29vOUFkQ2QxWThEMXB1WEI0TktOeDRLSVJRczU1?=
 =?utf-8?Q?mibI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEdnMFdHK2FTekNveHJHOGE4NU43RmovZTJmelhIZFVzaFhsdyt6WTJtN29h?=
 =?utf-8?B?aXYwN2JlUEQ0VDllaXpyR0RVYmpMeGlUWFFWV2FScmkzdjJGeVVSZGw1QzA3?=
 =?utf-8?B?KzlLZHZHbVNkdVdPN2h3UGZmN0VkUFRVK1haUFk2ZVNmZWs1REwvbXBrQm5I?=
 =?utf-8?B?Q2ZFLzRjdG5hSGpjNkZ3WVpwOEhPanU1djg2VVMyOFV3TUw0ZVBRZDd2bWpo?=
 =?utf-8?B?QlFqYWcrM1MxN2QrTWl5c1VCL25Ndm5NT25KVUFUUXpPN0YrQjNqd0xoNWtu?=
 =?utf-8?B?NzVZZENOa29rOVF6MUtXMFBDQmZFYWozR0FFUWF4YkhKakE2MDRjVjVKZ2FE?=
 =?utf-8?B?WEt4RjBCQ1FUdFFTR2ZhWlZEK0lJYlJNcFBBaTVFUzlXRWRlNTNGcWd6Zm4z?=
 =?utf-8?B?OVF2TTZzZVJqVHFaTlpWYWtVQjZIbmRFaFgvd1RjcGFMZUJDWXVxTEFBYSti?=
 =?utf-8?B?S0pCWmxYYlcrcTNyOFBXNnFzVWdYTEFsL1Ayd1YyYVoxdzNHV01JUjdVWHh4?=
 =?utf-8?B?TEphdmpkRkRSbEdySFpRU3EzUklyeFltV1EwUS9ha29yYUdESm43K095MFR4?=
 =?utf-8?B?dng4S3g5c2JSdHNaWHAvRnY5M0ZqV0hWY3R2WnNTZDZHMXppT01qczA5WWlV?=
 =?utf-8?B?T2IvbHlnUTdTdy8zQUZhSk9mRnE2UFZZYmZFcnVsZ3lJczhhbE5ZVFBKQjhy?=
 =?utf-8?B?U1VWL2xXUExKN213UWpLMmZ6YWtsQmpvSkhtYnpZME11WnM3Q1VNSFJKd0tZ?=
 =?utf-8?B?Wm5QRmlvQ1RnREFGVDkyOStic1RNSlZ4QmF4NTlvWUtFL1ppL0gxblIwMERX?=
 =?utf-8?B?YVpiN3NnVnJVVi90YkMremdEcitQcmIvWmdQbnV5L3dtQnUyV2NIQ250RkZH?=
 =?utf-8?B?QnFYbW9EZ3ZaRnlIQlhnL2MwalMzb294VjZDTWtrRHpaVVh1N3V6NXdLSUls?=
 =?utf-8?B?bjVnRHg3ajdUMTh6MElvWHJkL0wzSjFlTUZPa1FXZzlCVi82UU5CTTliMFl2?=
 =?utf-8?B?dWhHM3JTYmRZOFY0ZStsZ2NVMlorcGZJV3pqdmhnODVCajFlOXBSaUY3MUMx?=
 =?utf-8?B?TkJocjQvRzJIb2JQdTF2VFdRY05xeVAwQWk2VHJQTUkxSFB4VWRRc3ZXVUhI?=
 =?utf-8?B?VFFoU2IzZmFsY1RXYXpKRUdHdjNjcHNESjExT2hIWUNRMFBtb0ttd1d1cU1R?=
 =?utf-8?B?WXMvMG82bHEwaU5EckZzU0tUMjUxYy9uUzRjQjZKV0JCMFJZS1RXTU5Va2hk?=
 =?utf-8?B?ZlExajV4RytJU1hDYnBMSHYwanNWZ3ZMSkUvMmlNcGxpaGwrdElpZDd3Q2xl?=
 =?utf-8?B?OXJ3U0kyRGtmOU5WQmJ1UmwyZlc0RDU0bTlrS3lFYXF2TzQ4L1MybTFNUHZo?=
 =?utf-8?B?SUE5WWNtMzRBR1d2alMrMVZhZXFUK2R6c2pnUmJjMVY3bktDL0k3dUl3UGVs?=
 =?utf-8?B?OE9PMURPQktXTGttYWN1ZGpac2ZTeXpmTkhaMXY5RkxTUlU3MmhqdEhNQlBn?=
 =?utf-8?B?eG1idHovcnN5ZWgrY0hMMFFpM0cvOHovUTBjc3dVNzNUb0MycUZ5UnFUMnBn?=
 =?utf-8?B?TjFDbWF2azZlL2c5cE5TdUplWlFYWjFUNnI5azBEeTdGZ0ZrN1h4NjA2V3hM?=
 =?utf-8?B?eEthYVRvUGVMQ1BZTTFGTlFwK0x4N2kvVWRwaWl3amkxWjdFRStvdGZKcXZX?=
 =?utf-8?B?aEhrOUhoTi9Ed1oxWEZoQ0sxTVR2Y1VuN0VnMGl6Zk10SmlYU1drYVJlN2Ru?=
 =?utf-8?B?L0lCaU96aUMwcllBQmZMN1JETWVtempFeXBBa3hpekFETS9DNXBpUktkNkpi?=
 =?utf-8?B?bTFVLytmSHoyM3RqL01EMUphbTl6b0l2SG91TW1pT1o1amVJUUk4cFZrS0t0?=
 =?utf-8?B?TEFsR0hWSndxZlhlb1RWbW0rUjl1dVZyc2xuZVVDQ1R0b2J4SGpKY1FkbjRC?=
 =?utf-8?B?bWJHZHdUak0rQ1dCN29qTHhRV0ZTak1TeXYydmZ4b21NeXMvRWYzbXlvTUhS?=
 =?utf-8?B?ckEyK3VLSXExRjFSakFSOVBHeVVoT2JSVGJSVzAxZXBPSTdqQ1VZcHRRZExT?=
 =?utf-8?B?VEtodGVCckc4U3k5cVdhbWhrMFlrNmNtaER2WnY0M1p4UkNTYXkydnNPckhx?=
 =?utf-8?B?d29KejJBZCthZHFnbjVDVk1XUlFYWk85d1A4MEVqNmNDdTQxdHBJeXN5dUo0?=
 =?utf-8?B?NnE4eXhIUzRPSGgycU5XajNuZ3JpYXF6YWxPNWRjUzd2YjR2M1hCMkg2ekth?=
 =?utf-8?B?QXFZdUZDdjYzb2V4eFdpUTVxdy8zd085TVdHRjdkbU5rMkc4YkZ6NHA2MkpZ?=
 =?utf-8?B?TnNqTjluNG1uR0N0N1ppNEFuNFNCWHJXSkI3eGM2VUwzQVN6N2JZVUlMWnoy?=
 =?utf-8?Q?LYvuu0J7yzpZx1Us=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a1cb96-f5ca-44e8-3fe4-08de5e073e63
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 00:50:34.0548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsHaYnPk1F/hunb4H49TBVm7h0zZlFCbwRGa10TgIsOAetbLO1k5LR5S51JRYKgNTdRwDPfRqmSAha0FFYFdu/vNTBw+ELEK+oA22OGdUHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR01MB8133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_165040_831210_51823F49 
X-CRM114-Status: GOOD (  24.15  )
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



On 1/27/26 12:57 AM, Ryan Roberts wrote:
> On 26/01/2026 20:50, Yang Shi wrote:
>>
>> On 1/26/26 10:58 AM, Will Deacon wrote:
>>> On Mon, Jan 26, 2026 at 09:55:06AM -0800, Yang Shi wrote:
>>>> On 1/26/26 6:14 AM, Will Deacon wrote:
>>>>> On Thu, Jan 22, 2026 at 01:59:54PM -0800, Yang Shi wrote:
>>>>>> On 1/22/26 6:43 AM, Ryan Roberts wrote:
>>>>>>> On 21/01/2026 22:44, Yang Shi wrote:
>>>>>>>> On 1/21/26 9:23 AM, Ryan Roberts wrote:
>>>>>>> But it looks like all the higher level users will only ever unplug in the
>>>>>>> same
>>>>>>> granularity that was plugged in (I might be wrong but that's the sense I
>>>>>>> get).
>>>>>>>
>>>>>>> arm64 adds the constraint that it won't unplug any memory that was present at
>>>>>>> boot - see prevent_bootmem_remove_notifier().
>>>>>>>
>>>>>>> So in practice this is probably safe, though perhaps brittle.
>>>>>>>
>>>>>>> Some options:
>>>>>>>
>>>>>>>      - leave it as is and worry about it if/when something shifts and hits the
>>>>>>>        problem.
>>>>>> Seems like the most simple way :-)
>>>>>>
>>>>>>>      - Enhance prevent_bootmem_remove_notifier() to reject unplugging
>>>>>>> memory blocks
>>>>>>>        whose boundaries are within leaf mappings.
>>>>>> I don't quite get why we should enhance prevent_bootmem_remove_notifier().
>>>>>> If I read the code correctly, it just simply reject offline boot memory.
>>>>>> Offlining a single memory block is fine. If you check the boundaries there,
>>>>>> will it prevent from offlining a single memory block?
>>>>>>
>>>>>> I think you need enhance try_remove_memory(). But kernel may unmap linear
>>>>>> mapping by memory blocks if altmap is used. So you should need an extra page
>>>>>> table walk with the start and the size of unplugged dimm before removing the
>>>>>> memory to tell whether the boundaries are within leaf mappings or not IIUC.
>>>>>> Can it be done in arch_remove_memory()? It seems not because
>>>>>> arch_remove_memory() may be called on memory block granularity if altmap is
>>>>>> used.
>>>>>>
>>>>>>>      - For non-bbml2_noabort systems, map hotplug memory with a new flag to
>>>>>>> ensure
>>>>>>>        that leaf mappings are always <= memory_block_size_bytes(). For
>>>>>>>        bbml2_noabort, split at the block boundaries before doing the
>>>>>>> unmapping.
>>>>>> The linear mapping will be at most 128M (4K page size), it sounds sub
>>>>>> optimal IMHO.
>>>>>>
>>>>>>> Given I don't think this can happen in practice, probably the middle
>>>>>>> option is
>>>>>>> the best? There is no runtime impact and it will give us a warning if it ever
>>>>>>> does happen in future.
>>>>>>>
>>>>>>> What do you think?
>>>>>> I agree it can't happen in practice, so why not just take option #1 given
>>>>>> the complexity added by option #2?
>>>>> It still looks broken in the case that a region that was mapped with the
>>>>> contiguous bit is then unmapped. The sequence seems to iterate over
>>>>> each contiguous PTE, zapping the entry and doing the TLBI while the
>>>>> other entries in the contiguous range remain intact. I don't think
>>>>> that's sufficient to guarantee that you don't have stale TLB entries
>>>>> once you've finished processing the whole range.
>>>>>
>>>>> For example, imagine you have an L1 TLB that only supports 4k entries
>>>>> and an L2 TLB that supports 64k entries. Let's say that the contiguous
>>>>> range is mapped by pte0 ... pte15 and we've zapped and invalidated
>>>>> pte0 ... pte14. At that point, I think the hardware is permitted to use
>>>>> the last remaining contiguous pte (pte15) to allocate a 64k entry in the
>>>>> L2 TLB covering the whole range. A (speculative) walk via one of the
>>>>> virtual addresses translated by pte0 ... pte14 could then hit that entry
>>>>> and fill a 4k entry into the L1 TLB. So at the end of the sequence, you
>>>>> could presumably still access the first 60k of the range thanks to stale
>>>>> entries in the L1 TLB?
>>>> It is a little bit hard for me to understand how come a (speculative) walk
>>>> could happen when we reach here.
>>>>
>>>> Before we reach here, IIUC kernel has:
>>>>
>>>>    * offlined all the page blocks. It means they are freed and isolated from
>>>> buddy allocator, even pfn walk (for example, compaction) should not reach
>>>> them at all.
>>>>    * vmemmap has been eliminated. So no struct page available.
>>>>
>>>>   From kernel point of view, they are nonreachable now. Did I miss and/or
>>>> misunderstand something?
>>> I'm talking about hardware speculation. It's mapped as normal memory so
>>> the CPU can speculate from it. We can't really reason about the bounds
>>> of that, especially in a world with branch predictors and history-based
>>> prefetchers.
>> OK. If it could happen, I think the suggestions from you and Ryan should work IIUC:
>>
>> Clear all the entries in the cont range, then invalidate TLB for the whole range.
>>
>> I can come up with a patch or Ryan would like to take it?
> Hi,
>
> There are 2 separate issues that have been raised here and I think we are
> conflating them a bit...
>
>
> 1: The contiguous range teardown + tlbi issue that Will raised. That is
> definitely a problem and needs to be fixed. (though I think prior to the BBML2
> dynamic linear block mapping support it would be rare in practice; probably it
> would only affect cont-pmd mappings for 16K and 64K base page configs. With
> BBML2 dynamic linear block mapping support, this can happen for contiguous
> mappings at all levels with all base page sizes).
>
> I roughed out a patch to hoist out the tlbis and issue as a single range after
> clearing all the pgtable entries. I think this will be MUCH faster and will
> solve the contiguous issue too. The one catch is that this only works for linear
> map and the same helpers are used for the vmemmap. For the latter we also free
> the memory, so the tlbis need to happen before the freeing. But vmemmap doesn't
> use contiguous mappings so I've added a warning checking that and use a
> different scheme based on whether we are freeing or not.
>
> Anshuman has kindly agreed to knock the patch into shape and do the testing.
> Hopefully he can post shortly.
>
>
> 2: hot-unplugging a range that starts or terminates in the middle of a large
> leaf mapping. The low level hot-unplug implementation allows unplugging any
> range of memory as long as it is section size aligned (128M). So theoretically
> you could have a 1G PUD leaf mapping and try to unplug 128M from the middle of
> it. In practice this doesn't happen because all the users of the hot-unplug code
> group memory into devices. If you add a range, you can only remove that same
> range. When adding, we will guarrantee that the leaf mappings exactly map the
> range, so the same guarrantee can be given for hot-remove.
>
> BUT, that feels fragile to me. I'd like to add a check in
> prevent_bootmem_remove_notifier() to ensure that the proposed unplug range is
> exactly covered by leaf mappings, and if it isn't, warn and reject. This will
> allow us to fail safe for a tiny amount of overhead (which will be made up for
> many, many times over by hoisting the tlbis batching the barriers in 1.).
>
> Anshuman has also kindly agreed to put a patch together for that.

Thanks for the update. Look forward to seeing the patches from Anshuman 
soon.

Thanks,
Yang

>
>
> Thanks,
> Ryan
>
>
>> Thanks,
>> Yang
>>
>>> Will


