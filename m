Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1714C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqq/+j9nVGRHup8T5xYrQ07PLz+2ymM9LIsTk91LSdo=; b=ZsNo9eFR+x8mMHAUJk9YiQKgOv
	xp4w9Idp0ZDjzKhKu64e4L6HlxGwmD34YXjmlt81CfR8iqSzT29N71f7jalWVnowosc0HgR1K6xvX
	TakzcweWa8j2/OukwAuxg5uX2TdjlhOJifL0Tb5bhLnUS2SaVJQt05WSUNVaL6VwhgSkU8/phvKzF
	dRWxyfx0dI1/J9lKYdkNc9joDN3Lmrp+QLVBq1rpvGmJ/CnkvZf2v9chm3EsCxwmdZ1JAgkq6VfEd
	kqVuSzdDIzY1Xf590sN1MpAi0oSKERelKQvLDhNu9r/673NJhFl3WGduHPGm1hHInrZOc2GT5V+jB
	S54uNPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nov-0000000Brtd-3mJY;
	Thu, 24 Sep 2026 18:05:21 +0000
Received: from mail-ukwestazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c206::3] helo=CWXP265CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9noq-0000000BrsR-0MMQ;
	Thu, 24 Sep 2026 18:05:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIm2YI1hRHJKAl1RiGBDva/UORrHH/zVQH+d6KhhKA8NhbdUbAXSisENugHMQHHtj8kCnG3nx/6EycNlucUSeID9ujwd78arX2Yrxgf+ub8CT64DCnsvZ0il1YQ6LK8S4esrzpXL53C+wwtImCg6+S1N6Ef7V6atpSOk36K8MiyJgCvj1IHdXzIRhWmFNrGyvOQiABOs91Wr9+E/h45ImnvY5ZfrRqfeQEv5NnHCCCNXdKkvEMc750BlpsAkC3cX7Q2zRUL/FNhoAWBdcWplmfQMCfr0a4+w3bCXxRrTID+wwBgj183g/F8RSm1Fzq4/A9z3zcCKcigWsCfZ3jZBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqq/+j9nVGRHup8T5xYrQ07PLz+2ymM9LIsTk91LSdo=;
 b=ZOhfErQHNpcaMuAPYt8eriN8t5P3Y20cvaf0Rj3ZCTXhoDOeXeYiCpG3xnxT3gl4pYrxBZIZqPo0Zcn1VE7q+9TX42jeMbc6oULOYKQbfPI2y23G6kXYRAakqeZGeVt0RTnZ+jzpBlIL8X+mwrWSC4runBrgTQJppmcpSZD/nB1K46AChPGC0cQwmeGylxtNewPvyVykroGOM9nzFux2DACBE6pu2HzSjfx1RyhI3jZLvTyZ202s9iwLJp+LxcC5YBKwBh05BoPi9Jf0AiRz69HVbq1QK0WcwaU9Vkg3SLOuBzSDs3/kCmcPbyc63m+D/tVxY2/m2N/Cl4zTlmxY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqq/+j9nVGRHup8T5xYrQ07PLz+2ymM9LIsTk91LSdo=;
 b=QkxNAoE17zJAwvRi4rh4WM1vkZ6vE+qO7wrqQR8AI86UOYSLSN6cVGIDqlTe5l07dnXy5ae31GGR2fzE8tMWj6kgPbiFZuLH+XtA3yIZGJBPeYm6AAYediLeM/WQ9+3KvqquVb0EviD75DzWJNRSwroP1EKmc9Z00besFRHckpo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB3399.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 18:05:09 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 18:05:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 19:05:08 +0100
Message-Id: <DLNQUO0EQW7M.29SAT06RE6IOV@garyguo.net>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 <linux-pwm@vger.kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 <devicetree@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Naushir Patuck" <naush@raspberrypi.com>, "Stanimir Varbanov"
 <svarbanov@suse.de>, <mbrugger@suse.com>, "Sean Young" <sean@mess.org>,
 "Julian Braha" <julianbraha@gmail.com>, "Christophe JAILLET"
 <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v9 2/3] pwm: rp1: Add RP1 PWM controller driver
From: "Gary Guo" <gary@garyguo.net>
To: "Andrea della Porta" <andrea.porta@suse.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <cover.1789724999.git.andrea.porta@suse.com>
 <22f454003902173a7230d0aee5fbd7261fcc163e.1789724999.git.andrea.porta@suse.com> <DLM3VDAEVVEO.1STV7HI3M3YXK@garyguo.net> <arPLa_g4mAg1t2rq@apocalypse> <DLMQPQRYTSNW.2Z6C0408NMCYK@garyguo.net> <arP-P_a7OyhtMQyr@apocalypse>
In-Reply-To: <arP-P_a7OyhtMQyr@apocalypse>
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB3399:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6c6fd1-76cd-4dc1-2b46-08df1a665eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|7416014|1800799024|4143699003|56012099006|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: YTv4QQw7Op6JEjBTQw2liaOHYhVcurKdGKfa/RJW1F7mFhcsh+Rj1lrqDYGi3eLsk8aojzL/Giu00UiTJuMdVLbsCR8hpMkbKW7zAq7FtWjzKhcNnFjW6y1LazBol0VKbu93Wpgr853clY2hc3071t8+W6b+xGKM0hcVcRSg0CzkvLGqByFfLOdjgRZ0dgGKJBGAFmo0EtIfMevKxZXoMzV6DHF6SQb4Z7RhFMjMCtGSsnOqLT0WrjtmzDhIK2sA8e9yZTuLOAKv1xjDkffjJ43cR37DJGIc6/al+Wawv6nQt2pF57E9PClOHW8Qwit3B7pZF43vcJvN4pEcCy73DIln2YcfDq2cuVxOi4nm4iDx8O8JqS8lvP4/P9geMRPRDTViLS2+OT8pZYjUDb4sBvOH5KDEI8MxaOVUAS/pyBNmW1JUofcKC87emmIxYfItIiqmzfbp+U0ns4hhoUO9esPGzOisoZoGYGblUvLcl06kQrOG+ykEzqfCNeDaUYwpqRaZil7AqfLIRXyHNEKRPINHUD0d6fQo6fEgMeWdjzqcvajmPMDuqs3rSzFLojpWcMBVBkXqkVHhini2FuHzn8Uj++R0snZQnDl9odORibIGJL9EBNk7ERCLjpVEC5mV/vVTCgCcY5AHH9ewdp6gbPsNxlwidmPsgrjDHVizSZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(7416014)(1800799024)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzhyVmlYWjRJd1g3eFYzVnNLazJBbFRGcEN5UDRHTDVSVXFrZlJLSkVsQVdr?=
 =?utf-8?B?Wmhnd0x6QVhvZXVBTDhaK0lPRTFGLy80K0E2VnNIUXM4RXUvWlRlYXZlSDY0?=
 =?utf-8?B?MlJmN0xIYko0OTBZZ1d4Z3c1dVNFSy9MSlM5eFZ1c1Q0Z1pPYnUxMDlKMVpZ?=
 =?utf-8?B?NXJscHpncHBIc0lTVEFkMmx3aVMzVHlvRVc1Nmc4ZFFqalFRQk1tcnFZQm5H?=
 =?utf-8?B?YmU3NllQREM3TWdPZzZLWEZSUTFUandzYndQN3ZERmZ4VjU1dGVFSFhGd1Bi?=
 =?utf-8?B?TkkrYWxZZmRBSXBCN0sxTGlCYTJKbEdOQXg1OTgyVUJpZXEvdVIwMjZBZmtm?=
 =?utf-8?B?eHY4LzMzVitIcmVvT2tUMjlwWkt3bE1LY2dsZldBRVM0WFZhWGRHcVk4VjVH?=
 =?utf-8?B?eXdkcGluanAwVFVqdmYxVE5Ndk82NzlFK0IzaFQwWEx3NytlTzJ5dmhSM2E0?=
 =?utf-8?B?YjJCSmx6RzFpc0ZWNXdhMEoxNWZaTFhPVTNiQnR2WHJGUTMvaFF0ZDc5aVRn?=
 =?utf-8?B?UmZQL0V6UURmUkxQL2p4c2hDRUM3dHRhUVVybHZ6MGJIWnduRkIzNEJ6cFVT?=
 =?utf-8?B?VkpOQnYxUHg1V0t0c2VwK09vc3RUYzZ5SVdZbzVmZTlKWm9zUzJSR0RtWTlx?=
 =?utf-8?B?MWV0WHZvZkFvUHlFNG1va1ZPYmVUMFpISDFKdk5xanRHcld5THAyY2VnQWdj?=
 =?utf-8?B?ZlZ0OGNCcVZRbmxhVG1WaGgyelpiWit6endWVlk0b0VZOTl4d0ZTci90SFN0?=
 =?utf-8?B?d0lJb2gvOUtGRlZxRk9PS01IajVCSGRpNmhEeVNWNzZnNWJrS25lUjZ6T1dw?=
 =?utf-8?B?NXZhbnBqMWNTbFZZQmgrZmVsckE2L0p2L29LY1R5RUxvSXJITzQxS1dPSmtU?=
 =?utf-8?B?U1BodkFIbnMzTkp2dEhkdi9DSWpZMlM3VWJ1SjRaWnN5S055SytRTHlyYjdl?=
 =?utf-8?B?bWk4bnNVUmlkWXVtTXVWUncxbndlZ0RPZXVEMStFL3ZxdjIrbmk5NGV4OUpw?=
 =?utf-8?B?MHNsSHNzUVE0ZndadkZxSGRkNGVxQjhyYVUvOEk3VjJFTGpWYmRVZTV3TFB6?=
 =?utf-8?B?eEZBcmdZcVNMWTdKQWlwUkhnQkhYWXRMbkovTXUwNEw3aVc3UzBwYlhMVnMv?=
 =?utf-8?B?aUdqVzVLM1lQdTZjY2t2Y1NaTm1LeC9zK2l1VkxGaGFHQzVKMWlMQjVlZ2Vr?=
 =?utf-8?B?SGowUE4yQmZJaFlIOFQ4cHZoVUdFZjh1TG5QRzZLbnJXOEtrS1JBc2trdFlh?=
 =?utf-8?B?OWtST051RWIzeUtJbGs5a3dodVVnR0dVTWpDQVZEK2pxcUtWeXpySmNlci80?=
 =?utf-8?B?WE9aMWJhbWcva0pWNUpYekJHbEgxSHFscHVUWEl0UERSSlhXbDBwYkV5NUxI?=
 =?utf-8?B?QVV4cTFQSU52eUtzWmw5SGJRT2VqWms1UlFramxJL1pNSGhLSzVqbVlJSlhu?=
 =?utf-8?B?b3VFSXNSaDc0SW9ic0MzcjhGY05nUi9uQ3VjNDZrV2FmSUdwTWNqQzJFanEx?=
 =?utf-8?B?RnBPY2N3NkN2a2M2dVQ2bUg0azV5V0JyVG9wanJEZjNyVFhOZndUVERVWU9o?=
 =?utf-8?B?UUVRNk84ZVB0d1A3QjRqU1BoWWtnM1V1UDl1d3UrblR4YWtjcTR1QklGR1dq?=
 =?utf-8?B?cndib09pZjVEZyt5U0s3RHlYeVB0TUc0bWwzWU1Oa040Wm9IRlNQM0RCanJq?=
 =?utf-8?B?ZWRybVpDdW9VaGVwTWdSS3RuSzFnbzNvVm9zTlNhR0ZRTXQ1UjVPSUY5V0xG?=
 =?utf-8?B?cnBHWS81YktBK2tOUjlWTzJxVUZPb21IU0dmN05XbmxLN2JYZExVa3VDTGdO?=
 =?utf-8?B?ZjdXZlhmUXFFTDd2UkROZ2QvYnkxalFYdk1uYUlTSitRSmFsMmg2clN3Sm0v?=
 =?utf-8?B?azZIMC9KSnRzT3FtNUpSb2hEMTE5eXQrc3BKTmNSdkhSb05ZcHdTa0hKRzlP?=
 =?utf-8?B?SFdvQVZ1WmtNODRqY0ZjRyszbGlmS3FuTG5ITXN4RlVucWdzZERTRk9XWHpR?=
 =?utf-8?B?TjR5Q29hNkVBbys5REV2STMyU1VGWmZ0eC9GNkt3T0dldFhYTEg2Q1J6NllR?=
 =?utf-8?B?OTVicHRxcU9WS2tMRWZFNDcvVkpVR2VGQzRVVWVaeE1uWEF6d0Y1Vm45bm5G?=
 =?utf-8?B?cE9oVlVJMjM3MFhoYTVUMmVPSUcrTTJScXBiQ0JGVkZjRnpoZGVmTm00ejNN?=
 =?utf-8?B?MDBmRXJhUGNndDBGTUNhRDdtKzZNSzRYVU54Tmk5emUrZzhYbTdvODRldGE0?=
 =?utf-8?B?RHEzekpKdVZYZXZYbXgyS1BaN1ZDV0FvSUVyazVVcllJc1VGMnhMSGd0SlJW?=
 =?utf-8?B?UHp6aUVFUC9kYW50UU5jRjZ0WU5NbEVVQmU5dmxSZHk2eWtPSkNHZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6c6fd1-76cd-4dc1-2b46-08df1a665eb4
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 18:05:08.8839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVF+Lzi5T6LaKsErisjObxB1KWFMVmiOoUJlWPdIjLaRTkp/sEXEhZ3Le7ZtZQ7gnIrP+6FL5JE3TvCCTmKPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_110516_160284_5B9EB832 
X-CRM114-Status: GOOD (  24.42  )
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

On Wed Sep 23, 2026 at 5:28 PM BST, Andrea della Porta wrote:
> This driver implements only static PM ops so I think both pwm_get API or
> device_link_add should deal automatically with races.
> OTOH, what if the consumer obtains a reference to the PWM device via of_*=
 API (or
> other means)? Thhose calls does not create device link and we would still=
 have unsync
> critical paths.

of_pwm_get also registers a device link. In general you shouldn't have to w=
orry
about synchronization when using supplier-consumer APIs, as synchronization=
 has
been taken care for you. Regulator APIs for example also handles device lin=
ks.

If this isn't true.. Then I'll be a driver core design issue and not that o=
f
drivers :)

I think sending this part with your fan driver would be a better idea, and =
we
shall see if Sashiko still complains :)

>
>> >
>> > True, and I don't have any issue in converting back to MMIO call and d=
rop the conditional for
>> > error checking, but please consider the following, since the driver ma=
y be extended in the
>> > future to support more features:
>> >
>> > - regmap gives you free debugfs view on the registers, which may be us=
eful to test
>> >   the new features.
>>=20
>> Do you have any register that we want to access that is not part of the =
PWM
>> facility, other than tachometer?
>
> Not at the moment, no. But I don't see how this impact the debugfs useful=
ness.
>

I don't think having debugfs alone is a convincing reason to use regmap.. M=
ost
of the users who use this driver won't care.

>>=20
>> > - regmap_write/read may still return an error in case the passed regis=
ter is not in range.
>> >   This will be trapped at runtime only, but could still be useful duri=
ng development
>>=20
>> I think this is rather a anti-feature. Having additional error paths for=
 some
>> thing that never happens is not a good idea, especially that you basical=
ly get 0
>> coverage for these paths.
>
> Sure. Well this is true once the code is crystallized and tested, so it's=
 somewhat
> still useful (only) during future development. But I got the point, and I=
 agree.
>
>>=20
>> You already know the shape of the register region, so the bounds checkin=
g
>> provided by regmap would be better served by an ahead-of-time check:
>>=20
>>     #define RP1_PWM_REG_MAX (RP1_PWM_DUTY(RP1_PWM_NUM_PWMS) + 4)
>>=20
>>     struct resource *res;
>>     base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>     if (IS_ERR(base))
>>         return PTR_ERR(base);
>>=20
>>     if (resource_size(res) < RP1_PWM_REG_MAX) ...
>
> Fine for the probe method, but regmap_read/write also check for the range=
, for free.

Well, you have to handle the possibility of error, and the compiler needs t=
o
generate bound checks, so it's not free?

A probe time check is good because once you checked that the register space=
 is
large enough, you never have to check again for accesses.

Using regmap_read/write to provide the check will give a false sense of "th=
ings
are working" when code runs past the probe, but if, say, the device tree is
messed up. And it'll fail much later..

Best,
Gary


