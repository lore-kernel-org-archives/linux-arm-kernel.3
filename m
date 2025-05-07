Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9724CC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noSlmrVzHbhntWWQWKhZ3Btrkfo9y0AsHHuKLSJmKEc=; b=M8nuLU0/Y+0DLeZsSPuM7nwIQC
	mdqylOr8P3xrkOWlTT9DYYLLYU0EMhNu0bvMncvfM7DgDTgijzl8bT9sMgdxArGj1j6PjriymsaFo
	Wg0RvBPy22yxyA6MQck0xs3F8r/5n5cYQnoYLE+lcVnRl92BbbqdQA5xL6cZGdTgxEdyWb7t0tFTv
	HJnKovTCcuwmclWcOw1M8d35uQM584etwSLxB2ou09wBEcYLIS2WZHOS4iGc1czAxI5N/lNniksp1
	WM0hYx43xemR6dXUKkbAcab8OC9DAL8bd1Gt4AIsRzXAn8rcZ96xkNxxLh4fHGg8oyBFuTOakxp+m
	/v5ufxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0u-0000000G2Ev-1czg;
	Wed, 07 May 2025 15:48:52 +0000
Received: from mail-co1nam11on20601.outbound.protection.outlook.com ([2a01:111:f403:2416::601] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgRy-0000000FuhY-0KNQ;
	Wed, 07 May 2025 15:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4JIQG/+u+Nx+2USOdXs7u3JIqSZnmcXqmOD2eM+5x1zckxs1SCDO0yy6UCdYjEyZbhdPsVt6XsgU37lBUbFGA0ywPQ+vx/ESqfeZQidfd6p4W3WBd3mwInFn4M6QnYHsVdtBZi9CJXVS+MT7PWWGXfD0hFGmeWsK/zS5I6/dDcdpNGcqcWoZcZQ3saw4ChWxRUyR6HvodnQPIoiXrOr45JnjLySgXwX0QPhPSVyj5mFaMdH40r175juvxuwIVD7C4k7kfjStKEQZdl8UC2hSK4DE4uDrrQrpsYSwjQaneq/G4HFcRHbCBO2sPS++lofgG9biHzcJ5mmJ7Dqp9OTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noSlmrVzHbhntWWQWKhZ3Btrkfo9y0AsHHuKLSJmKEc=;
 b=be0Obno1vP6GV4bYeDZnsh2/NN1OwUk0rnfoL+jjIWKUDNsW+azLsBBhIRdm4tauc0odjG242gyQ6tC8/gfhbogT5GfKYTkqQAdLbqMlGgxwMD08iGccepMqWcDwHQ/FGuHIEFtxshcfBeeFNvvNtWY2dJ4apMutUCZN/Dz7Z2do8LN6in3EFj4pSOn7WSYQm/7I5MX0VxTol71MwDYRdABRja7RUacALhw7xrVryFQzHYrSS86gTLiqKiGijhvDbRjYocLndZeWV/7zJUO94PqjCPMTtHpLPJcksEICyG1/qoCQf3queR5SV4r3cjjWGg3hngN5C+EEHt9FEerstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noSlmrVzHbhntWWQWKhZ3Btrkfo9y0AsHHuKLSJmKEc=;
 b=sCi5+vuAYIfFKDU5R6ywYoiap8FDzNpq77BPSI2IOzB7dhNOMhZXXKty39mCnMJ8TjTCcAiXsB1bS05LF4GKlXE9kyBGv2qmLPFkvacUUZbW0ihUj6DTtuQlCXd06ZKzmIrHnwrqtkyTMZ0fVC8u3TyLP8UbfGsaI/nBUwqDEOIWVXtAVJhb/ANpkWpTaOn7F/wKku9ldmCCJv1ruXY5QkTLNukvrgviIRgVdcSbVswqJ/tfUYnbmbRzKPDnCFUooThXhwBly7fYOF9UdbGr7MN2ENaH8xN3GO3bKgGMwfQfk9IsLvriuaFrp/n9n9vzavGHnmrSLDkrd8fHypWsoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Wed, 7 May 2025 15:12:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 15:12:30 +0000
From: Zi Yan <ziy@nvidia.com>
To: Nhat Pham <nphamcs@gmail.com>, Barry Song <21cnbao@gmail.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Date: Wed, 07 May 2025 11:12:27 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <5D8BCC32-4932-4030-AE42-C0009D92A7CA@nvidia.com>
In-Reply-To: <CAKEwX=NyZnNmiERFzwMUGQ8CJ7Pqm_XqHWMQoPjJKnBQefZkiw@mail.gmail.com>
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
 <aBqzcIteOzC9mRjY@harry> <A3307E1B-B741-4C23-8053-72A1CA04D923@nvidia.com>
 <CAGsJ_4yBn7j3WpCttPB0PVuRCYTYBcDbW2221AaPNLOHSmKADA@mail.gmail.com>
 <CAKEwX=NyZnNmiERFzwMUGQ8CJ7Pqm_XqHWMQoPjJKnBQefZkiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR0102CA0067.prod.exchangelabs.com
 (2603:10b6:208:25::44) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA0PR12MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: ae180b5d-d4ba-43b5-6eb7-08dd8d7995c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG84KzJNY2wydzRsdm52YWNuNmxTN3lieWV3UUwzMU9xVzhEWnY5dnkwWFpB?=
 =?utf-8?B?aUNQQzF3SzVoSFNsWHVxYVdCNnlZdHN6ZHlJOW9lcUI5L1dIZ0ZDUnMxMzVN?=
 =?utf-8?B?MDd1bEEwU2wybHpSbGhDeG9peTVQWlhPUnk1NGsxYUxJY2xNcC9XMGpGdW5P?=
 =?utf-8?B?eWo5VjJLNzBveHZyMWxCYmZvVXpsbHFUVUR1Q085VHgvSkdlZjNhdzYvNklO?=
 =?utf-8?B?aUVndzd1MHRJQTdZRUg3S1ZIRHo2R3JvWkFmaVhQSEJaRUVySm8xdm1QSjJk?=
 =?utf-8?B?andVVk1mWFJEMktzbjJrVXpadnQrekUwd0s4RjNaSzYwNkxjV1hLL3JwMjZD?=
 =?utf-8?B?cm04ekEvc0NUZWwzenRyaktUMEpFdmJwekdtSmFvemNYTXhENFNVTEhzVDBp?=
 =?utf-8?B?ckJOKytaWHI5dHBxQkEzS2d6d3cyYnl5aVhDTWh0VXB5V2tjS2QzcWlXa252?=
 =?utf-8?B?U2l2S3Bnc3FyZ2gvZmF5Ykp4UDd5QWhVS25hbHl0K2Nmdm9ScFhFTlJoenky?=
 =?utf-8?B?TUVKNkI4RGhkUEdXeW1MbnYyNWhJY2kxQzFtazFEMXNZR00vSnEwV05zZ1h1?=
 =?utf-8?B?MnBVUXV1UVU4eVhIaUxNcXU0TlBRR2d4V2hBR1liaTh6VWpWNEtzb2thaGdz?=
 =?utf-8?B?Y2VwT2Zhd0oxVlpxeEJTbUkrekZBUURaQ1N2Z1FSYVJKenpyMzdyUDYydXlk?=
 =?utf-8?B?VldINHFlb3F0WGlzT0FCOG91M1oycDlQNFlSNFh6ZzZzVUxqbmc2R0RjeTVK?=
 =?utf-8?B?RFZTazJKU09mVS9qVWdVMjk0LzByZTNha1d2T1UxbG40Wk1oT1Y4REkvaE9H?=
 =?utf-8?B?R1VTcktLaXF5bnNIblBkaWs0cFYyOXBaSEFydkFldGg0a2JBcTVYcm90MURz?=
 =?utf-8?B?bkhNUTVpbC8yTjRPb0FjaTFJdzB6RTFJTGZKOHV3RkEwd1l3TXUyZ2xabm1K?=
 =?utf-8?B?RiswaXBDRmRTM2N0eGxWZjB5aC9ReDRMcFJ1eTdFSWQxaVAyaVlqYUdKVTVx?=
 =?utf-8?B?dE5teGZCNFVvUGkvRURtODgvL1pReG1obW1WUk9oOVBPbVIzajgzdE44SUtO?=
 =?utf-8?B?cXQxZUV3TmhydmZUUDRFNFN5Smo1RXBkamhYcDVocERZT0RLdTg1aDYzNmdM?=
 =?utf-8?B?YzRWRWFaU2dCaXlXUjdocTdPdDdRY1pEazgzU2xCanJJTkFCTlhDbnFCblN0?=
 =?utf-8?B?bHdVcXRkSUJmZkE1cmo1M0RWbllFUmZHZ3E5cmkwTGhxTk9rRmMxMkJiUG52?=
 =?utf-8?B?WW13K2VjZFBoS2c1MjU3TUY0azdWeVZYdUJvVDFPWDFoZFRyM2ljTlgxM2lS?=
 =?utf-8?B?N255dlVheWZTRXVFRmEvVThpUkJ1YzhzZXRnU2x5SzE3ejNjaVBxWm9MZmlh?=
 =?utf-8?B?U1RUUDhLSXFJK2RZRWJoVkQzOGVVMmJ3NW9QOHlsRExteVVlenpwN1dya0ts?=
 =?utf-8?B?aVJhaktybTVpTXBhMWhVRmwxZHVzY0FLbnVlck05KzFaWkhQakRIWSt2VXpB?=
 =?utf-8?B?eHJnS0Uzdisrb2V0eHdWeXE3c082c0lKbkVIL1hiQVNYRWRpdWlKTm9EN3JD?=
 =?utf-8?B?UHFrcmxlTDlpamtHY0tLNHBlUTdvb1Njc3ZMR0hrR1JUOWxPcDhQQ0xVaWc0?=
 =?utf-8?B?cFN0TXpUQXJ6YStFUkFxbUg2aCtoUTlzQUNVSklKbFc2VEhqU3g0eUEwQ1NW?=
 =?utf-8?B?YUZHRFN4UVQ4dFJ3eVFEaGErT3VLM3UzNURWZVgzUFM1aFNtV3psSG1ueFdo?=
 =?utf-8?B?RHZUbndvYW54cG9nZHZROHFQUk1YYklXa0diK3AwRDJMZlFuRVZqNnpSQVd4?=
 =?utf-8?B?MGV0VFZkRk41ckg5VDRlZlU0Qm5CRWZJbHRqaVBJT0Z4LzlhdWtSSncyd2Vv?=
 =?utf-8?B?dXEvWVVuTHM5KzhDWEtMeWN6TnlyOUVqNkpOalhmdTErRHo1MFpYWHVGYW9H?=
 =?utf-8?Q?m2oJSJ4AxDc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDN0SXpwMXZLT09rQlFOMzdWQTVRNGlWTjRUUzJRenV6amRjK0szUnRucjNh?=
 =?utf-8?B?NGRxZUFSM2c3QVY0RjFsMytaaVBtdmh0RnNnZFVaK25ETjdKQXFLK1BBbnlv?=
 =?utf-8?B?dXhvRVNoVkpDOWNwVjVXcWUxSzd4SEdneS9DaVlrU1RwUk5nSnRPQmRBVkxq?=
 =?utf-8?B?R3Z3bjRTd3ptQVNleUVXdmh3QnRuSUtQWlMwUm9HY0kvOVNYZUxDdllFN05H?=
 =?utf-8?B?RnlQL0Vaak9heHZvUFhPTGJISWVIM091WXc1SmptYTUxb0pmSFdHRzNRMG5N?=
 =?utf-8?B?STVpc3VjeDl5RVJPcVpwblRvQnpRSlE0UjZ5MzdlRmhHdkYzU04walJ2bkJM?=
 =?utf-8?B?TzJZSGR1MTJneU9vd2dTOVlMSXdoL082T1dpRi9zb3o4YVZsL1BDUk8yanJF?=
 =?utf-8?B?WGFialNrWlNBd3NZYXBRQlhPVWRmaERFSnN6cklENWt6TlkwQUVNcVRzb243?=
 =?utf-8?B?WnlBRzlqVEpPRlV2alkwQTA4SWZ3QXVweGluVi9zamZKdDVnZHd2MmxYV0lk?=
 =?utf-8?B?UUlwSFhNTnlGQ3NLNHcyRmE1aFNOb1hrVHBEZkRlYlROZDNYRWI1Y2llenhn?=
 =?utf-8?B?b0xzSFhuMmxzZHlqd3lzb29qSWRVTUFzN3JjM2tJaUxDYS82b0Q2Vk41ZDFt?=
 =?utf-8?B?TTlyMk5vODY3bGUxKzBXQVhzRHV4VkxsNHVURlhJQktrVW9zVVAwcm5hNm9r?=
 =?utf-8?B?R2NxeVNPcXc5V2R1WmRGSU1obnlSbDVNZURqVk1ZZHQ4R3ptN1J5ZUUwbUJI?=
 =?utf-8?B?elQ0eXZPOTh4S25XRFNrbkk3R1FONVNFMUsxZEZEWUFpVm0wQ25ockhYb2Mv?=
 =?utf-8?B?dUhLNDVaaUtwMnB0R2huSjlMVnhrYWhOTnExM05hM2FWUnZGZEZvTm5kMjl6?=
 =?utf-8?B?QTVvbXJ6bTRzYktEbG1ycDBsWHJKUVhZTS9uTjN0eGJFdThjenVKZzhuMjh6?=
 =?utf-8?B?Y3hMWXd4OXBtUUtNQ2ZoNjgxQmFaTmNlOHBSOWJONHhiZHlzUkZQT1g5Ui9I?=
 =?utf-8?B?Rnl0SlFzS0VpMDRzajZVaDE1MXNsK3JHdkd0NHpiaGlyc1ZWRVNLdy90SnR4?=
 =?utf-8?B?b2gvK05aNXJCT0NyNWZteG1qemtvcnNmQWl4L0h5ZEdEL3B3UmVYWk9INE5C?=
 =?utf-8?B?aStzamhZMGIwWERsaGNFbmwybncyMEhqSTVXcHB3aWJaWDdjUVFHYVlEM0tk?=
 =?utf-8?B?aXJJWHJLN2FpbEcyVU9FaDUxQ1AxZWlqMlBUaWI0Y2lra1dNY1J1c09rRjY4?=
 =?utf-8?B?ZlIwRmVaWHE5c0dVTmtSR2IyRE5lMTFqN2RmYk80M1ErMC9aUGErSTgxOEhw?=
 =?utf-8?B?ZmU5SGlyYlR4ZFhGM3l0YU1Ddno5bVY4Y0EzSHkxZis1dzV0c3M1QTNyNnVo?=
 =?utf-8?B?anBHdTVrbEhKN2Z3UnNnZWl5UTl6U0ZYQXFXSWcrTU1DYkszenpEU0pxT2Rk?=
 =?utf-8?B?VU9Gb2U4Qzc2bWhib2JiMXRqUmlGcjVCWFFSQXV4LzIyZVovL0o4N0wvVStX?=
 =?utf-8?B?ZTRnZXZNeUxOQk9uZ2U4YTdXM2YwdllobmxRa2prKysxYW9hWXNJWVkzZWg3?=
 =?utf-8?B?RUI5bzhlU01HeVlPRm1wTWN5WFZCb1IvV3FBdFFpSEdSc3BPVVJ1ODJEZ0ZX?=
 =?utf-8?B?VEVlNmNWd0RxdXc5am1mM1hXUmUwZUVZeTJTUEduU1dLanJ2U3kvaEFjVEZ0?=
 =?utf-8?B?QXdTZ2hqSEpIbE9qWVV1bWc5bUZLbEFtK3FmZU41TDFlZ3ZHbldxRldQbkFq?=
 =?utf-8?B?TGpHcXVUU2h1d1drbGpKTXN6NHFXK3Nacmt3MUppOWwwNVAxcHBQTlFVS3lG?=
 =?utf-8?B?dlZsN2hBOHhYSHhvNGF1SjhneWh2WU9ZMGZxcTNRWnRLZERqdDcvWTBiTnJG?=
 =?utf-8?B?UTdYRkg1UGFwZHp1aGNKRVlNZlRacU4wcXRiTThXSlljOWlqNUxLQTcxRlJp?=
 =?utf-8?B?ODZUeC9LY0ppUzJ0dGpGRXdmZDlreUJzcFI0UjFqNEk1SVNvenViYzRsTXBT?=
 =?utf-8?B?alVtUmY1Vk9jaFduVjdwa2liMHZHR1piSVRyaXpQQlFTbXJOZ1l2OWcxRUt4?=
 =?utf-8?B?VGcwUGZHSzhtSnl3Y0JSdjRmbU53WU83aU1MWXlRdjdoUEUwRGVYcXlZZnA1?=
 =?utf-8?Q?8gzpZAChA0NXYKzPpkhEtDxK1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae180b5d-d4ba-43b5-6eb7-08dd8d7995c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:12:30.1304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hILnnq/QXUEY7LS007Z4+xKVMssPHqr0ovIOvzeGYmRwyJHK+UK/j/VhdS9d2Oc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081246_118497_10C501F8 
X-CRM114-Status: GOOD (  19.34  )
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

On 7 May 2025, at 11:00, Nhat Pham wrote:

> On Tue, May 6, 2025 at 7:04=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>>
>> On Wed, May 7, 2025 at 1:50=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>>>
>>> On 6 May 2025, at 21:12, Harry Yoo wrote:
>>>
>>>> On Wed, Apr 30, 2025 at 04:26:41PM +0800, Qun-Wei Lin wrote:
>>>>> This patch series introduces a new mechanism called kcompressd to
>>>>> improve the efficiency of memory reclaiming in the operating system.
>>>>>
>>>>> Problem:
>>>>>   In the current system, the kswapd thread is responsible for both sc=
anning
>>>>>   the LRU pages and handling memory compression tasks (such as those
>>>>>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can=
 lead
>>>>>   to significant performance bottlenecks, especially under high memor=
y
>>>>>   pressure. The kswapd thread becomes a single point of contention, c=
ausing
>>>>>   delays in memory reclaiming and overall system performance degradat=
ion.
>>>>>
>>>>> Solution:
>>>>>   Introduced kcompressd to handle asynchronous compression during mem=
ory
>>>>>   reclaim, improving efficiency by offloading compression tasks from
>>>>>   kswapd. This allows kswapd to focus on its primary task of page rec=
laim
>>>>>   without being burdened by the additional overhead of compression.
>>>>>
>>>>> In our handheld devices, we found that applying this mechanism under =
high
>>>>> memory pressure scenarios can increase the rate of pgsteal_anon per s=
econd
>>>>> by over 260% compared to the situation with only kswapd. Additionally=
, we
>>>>> observed a reduction of over 50% in page allocation stall occurrences=
,
>>>>> further demonstrating the effectiveness of kcompressd in alleviating =
memory
>>>>> pressure and improving system responsiveness.
>>>>>
>>>>> Co-developed-by: Barry Song <21cnbao@gmail.com>
>>>>> Signed-off-by: Barry Song <21cnbao@gmail.com>
>>>>> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
>>>>> Reference: Re: [PATCH 0/2] Improve Zram by separating compression con=
text from kswapd - Barry Song
>>>>>          https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@=
gmail.com/
>>>>> ---
>>>>
>>>> +Cc Zi Yan, who might be interested in writing a framework (or improvi=
ng
>>>> the existing one, padata) for parallelizing jobs (e.g. migration/compr=
ession)
>>>
>>> Thanks.
>>>
>>> I am currently looking into padata [1] to perform multithreaded page mi=
gration
>
> TIL about padata :)
>
>>> copy job. But based on this patch, it seems that kcompressed is just an=
 additional
>>> kernel thread of executing zswap_store(). Is there any need for perform=
ing
>>> compression with multiple threads?
>>
>> The current focus is on enabling kswapd to perform asynchronous compress=
ion,
>> which can significantly reduce direct reclaim and allocstall events.
>> Therefore, the work begins with supporting a single thread. Supporting
>> multiple threads might be possible in the future, but it could be diffic=
ult
>> to control=E2=80=94especially on busy phones=E2=80=94since it consumes m=
ore power and may
>> interfere with other threads impacting user experience.
>
> Right, yeah.
>
>>
>>>
>>> BTW, I also notice that zswap IAA compress batching patchset[2] is usin=
g
>>> hardware accelerator (Intel Analytics Accelerator) to speed up zswap.
>>> I wonder if the handheld devices have similar hardware to get a similar=
 benefit.
>>
>> Usually, the answer is no. We use zRAM and CPU, but this patch aims to p=
rovide
>> a common capability that can be shared by both zRAM and zswap.
>>
>
> Also, not everyone and every setup has access to hardware compression
> accelerators :) This provides benefits for all users.

Got it. Thanks for the explanation.


--
Best Regards,
Yan, Zi

