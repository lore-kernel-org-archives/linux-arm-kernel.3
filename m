Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F62E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97XXSflLea4E6xV6V61aDDCo1PQcIA2/S56snjbX++M=; b=xYczeKmmMVPx2WEdNfvM4U/Gv2
	NDuGorPQXxPBzY8rRGg5OdQpQV2hg1vdaS+VH3fGgi3COWkMHiCVGgv1+CGw3nfyTVkE1hWXWWQF8
	hrdn7WEDm0xeoaLflvh8Xs5qdP84nJ8G4+IZb1yzEpaCPrssOjWA4QWBVmo9e1KTEA7JCPg1NTpfm
	UmwDYol9dwnSMJaaGLc9AuS8jnmElvV70adh6wZyDpqSH8HBaS2k0b/qcw4NhIaBcJELg3RfMtOvl
	q7uUjq4bUw3Yj5KuTzAVcsRbtlwoqfvPp1DnJoAd7dw7NeB50prlE0hGgeqFyf3teP01EQf+KAjth
	VDrhyP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrU4-0000000GIN3-2r3f;
	Wed, 18 Dec 2024 10:40:52 +0000
Received: from mail-vi1eur02on20629.outbound.protection.outlook.com ([2a01:111:f403:2607::629] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrSx-0000000GI81-1fH3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:39:45 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IIzvN0s6z1ITt4fDPmD26hwgtQdpADJ9ykC9F54Zrz1hGraF/eiEDQGnZTd0ZT8FuPgVU+h6jy1mHO6LlwKYtZoB4n+HUafrYqOiSBtME6IVeB44+5zAczq/WYuzLRVj9iAObsNxS5YiKUAStB9TefDTXwDnx5NLSqKz6uHMG0OiA2HEf//N5d7PyZ61mGjgwKJH1sGd5aI8Vr3Ulr5JtmG9v8IshDxlFq373hGAktdERkDxzG8EYGdjQtpPGlumTIDmhwsIhNrI5p6SZAbikptGe5yDHe4r0JLJU8FdyygrCupuHFwaCMyTiTUkbOdTRhXDMjdCXrFKDNJSH4U4rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97XXSflLea4E6xV6V61aDDCo1PQcIA2/S56snjbX++M=;
 b=Oi56WQPAY0VGrZadGmiv02lj6j2iyqloeU5RXl5KD2c3J77qcU4ZBPbUd2C9NP7g1sMuw+dDoPvjXlPVMR+MhgAVd2D0b2uGeBKmMUR612ZDeycypufiSL1rV0/RX0QAwDRIYDpOjLrUked5fEGg3CuY+ftriHhTNYggeztcw2nSL9HV2iQbMaKNW2i5rxVXPBFaBpXKvfDQ6DM6LShUuuWnhuHucW8XM1kW3JcYAeL4aW+iFKbvNXMbLhmOShOqbZ7tSo+lwwxBzA9dkR0Rz51il38DV24C66JZfGQSNLTVwgKshvmjLJU1Ea2aXVMGaPWwzXWm1xu5lOG5sGszDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97XXSflLea4E6xV6V61aDDCo1PQcIA2/S56snjbX++M=;
 b=BHV8DHUwj5wGLhpMwdWxlqJ0A8bJynicieWbHl71psD2gjbi9cD2kalzp7VSAGrogLOUAbb3/xE4qkUpwOUlAKE2g0SD5+HEvJG83eRLD+VNjt287Ue8mQ7dUK1RYxv0xmL1dSSObgf9KoDKoUh/6OO34o9NF+csaYjFKW4LwnI=
Received: from DU2PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:10:28d::28)
 by AS4PR08MB7630.eurprd08.prod.outlook.com (2603:10a6:20b:4cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:39:34 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::e2) by DU2PR04CA0203.outlook.office365.com
 (2603:10a6:10:28d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 10:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 10:39:32 +0000
Received: ("Tessian outbound a83af2b57fa1:v528"); Wed, 18 Dec 2024 10:39:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a85d368ceaab7ad
X-TessianGatewayMetadata: YHWAQpftdxU7UcHcE0xisS2RUgFUzgkbT30mhbQybQIKNUX/RMrxTeJLBHa69cbw31Ufd1uFFOCZ1bd3CCK3LwMy/8qSPPEjmV86ZYz43zTffYJMb7Iu9ItpUbGwHK914StkguqOFes2Rjyy9NlnRpMu0sQPjPU0J8944kZftbbtNnVnRBOyBdbpZtSHMG+rb3pHp9B31PymwQkp2Zrkow==
X-CR-MTA-TID: 64aa7808
Received: from Lf3d0283cbf63.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3E280F88-CE66-4AC9-AC9E-2FEDFBFFA9BA.1;
	Wed, 18 Dec 2024 10:39:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf3d0283cbf63.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 18 Dec 2024 10:39:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZMBcT7m0VPGDF3MOQjCJcDN/lTVZ104/MY0m+WR6AMvvSsPGXdZ4c3i46d+hLuJ3hoNkPQ1S47JUdcZmsiEDGh3Hi7LwqNSxq+tkmKZQf2pkcp4LaRcKqsCH6HGK2l1Zz4rahV+IoZCPg0NmDbUXMZYEGiuB8eqW8Tyi0AGo21uNvxv07q5ifrKbsWc1KqzJAkEUqJ6OEvDuJnyw/tXV62ewaFIupGy5CIM/F+dEXe6SSZ1T0vxkxugH8J+Kmw2bw3jweVFa7W/gE0aLUoi3wMYwjyZB9gBglE2KHa50PxTnVg0C7bvWp9d+3V4wx/2Tdc8Kc+ooNcj0q5QVHyUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97XXSflLea4E6xV6V61aDDCo1PQcIA2/S56snjbX++M=;
 b=ferIq97XjZieELPHZOIehK5BiBnONj22V5rWqzjTNwmiagMro3ndOfYdRVkKaGsDS/YrTvE2rN4tTbf0XxJ5zlcswobsEJc5uUDlTvzEfrxI76m01wwzyvJTH3siHZR7ytz0mgwyUNdzSA50M8TyexoGLjL7+HdZc5J+qb9DnKWzvO3kK7x8zyKQVqDwfQDk5rdjEZjrSz9WgDR6DNX52qY9HKkswvgK5e8haavl/ty/kbzEpSX93EudtzomdPhbSTFDYRObgPlPt6n0IT0/sqHFFtFjSS+mwfgELvkzt4KLoPY6tbpN84yjviQyvxX0K3jl3f6eOgGIEbKYd63SMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97XXSflLea4E6xV6V61aDDCo1PQcIA2/S56snjbX++M=;
 b=BHV8DHUwj5wGLhpMwdWxlqJ0A8bJynicieWbHl71psD2gjbi9cD2kalzp7VSAGrogLOUAbb3/xE4qkUpwOUlAKE2g0SD5+HEvJG83eRLD+VNjt287Ue8mQ7dUK1RYxv0xmL1dSSObgf9KoDKoUh/6OO34o9NF+csaYjFKW4LwnI=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB6519.eurprd08.prod.outlook.com
 (2603:10a6:20b:31c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:39:23 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:39:22 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: James Clark <james.clark@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
	<jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
	<adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, John
 Garry <john.g.garry@oracle.com>, Mike Leach <mike.leach@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, Graham Woodward <Graham.Woodward@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH 0/5] perf: arm_spe: Add format option for discard mode
Thread-Topic: [PATCH 0/5] perf: arm_spe: Add format option for discard mode
Thread-Index: AQHbUHrAAGpTiLfU1UmrBw6mVgzbs7Lr0QkG
Date: Wed, 18 Dec 2024 10:39:21 +0000
Message-ID: <GV1PR08MB105212F0EF7B3CE7FAD9CE36DFB052@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241217115610.371755-1-james.clark@linaro.org>
In-Reply-To: <20241217115610.371755-1-james.clark@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AS8PR08MB6519:EE_|DU6PEPF0000B61E:EE_|AS4PR08MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd0fcf8-b3a5-4231-f9f4-08dd1f504259
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Cqllw3CHXZkh33LKUu1rV5Xiqe5k08sV8czjOs4kQLvafh4YVsWbiS4IE/E8?=
 =?us-ascii?Q?/FssqMQl0R5WY/QGibXWtr+unY21q4jJBAXqfUq3Hh3IwWh88PKWRkydFkAr?=
 =?us-ascii?Q?aS/mxqm2MfFTW6dfIFbACNSo4dS+EN7fZD7XjqNopj199MpfXLokPjkDfj8q?=
 =?us-ascii?Q?i2UYFWdBtbiRBCMF/NOBfUNW/YYaGitATMMJuBwuD8pCbEePi6KHbIE7uAm2?=
 =?us-ascii?Q?rvK8I3aipeWfkilZYyVtvP8ikPlnsicAyoaYltol+TanPbzs1RZHkLoy1z/x?=
 =?us-ascii?Q?WBCPseuebNbaIU4xY1JeIqV803zm0S9qOoloqlm8sJLbMvSeHDjen+MxFbVn?=
 =?us-ascii?Q?POfVli2cpL/1v+aWQr5eUy2KyTzAUuFPxpdiWIBkf+sX5vxum1ztUsSnq+vG?=
 =?us-ascii?Q?l4DLMbAJpjFIa+1QRNTHEzkGySTiLknmd+KJrYxjuo+AyFDfkJedOfDWbuDG?=
 =?us-ascii?Q?xkysXNlH59vpEYf4WbWwwE0n+dxkZe3uKNn5pI6UGLC4wpP/YEGKWBQz+PzW?=
 =?us-ascii?Q?pHOmZcG9Y+ewhPB07emNg0jf0+YfpkTwYfTq2w64uMrySs7dphpafxJpJAoy?=
 =?us-ascii?Q?I+HYfo7Dn1TzS1SX2mwHNgXNBZxD9AuypS6IDFq0OikRSgPTnXG3Z6gj3rrH?=
 =?us-ascii?Q?sqrRbxtnbDj4+5S4YqV3pgpsnr5MzEukp/M2UJreYusEp5rmVB+6i08xm/2l?=
 =?us-ascii?Q?c+8pi6MdPUIJFvQ+Mc7X9IGwuTuC+qIJWCYS1iHbkRLqlq9plt+ff2OYrSPk?=
 =?us-ascii?Q?hnQih4ql1u05YxufeBIz5qya21SKvCpE4zClYJFakF1YPtl1BH/M3QHmbl0+?=
 =?us-ascii?Q?zBvDdwxrSpbkBkr3n7/3yLvxGaexzAl+u/+KRkkVq/tHC1tRAF7XOC4JERgD?=
 =?us-ascii?Q?+8bYFKlt5C88ytSBPSjxNyD1o4e9Qo2Ys/MdBGisqdeAavAcibZ0vIBgtZO+?=
 =?us-ascii?Q?xBBofYAS2XMNQSN1smC0WeXPsaLt/FMW1PMNhMXy1ftr82BPIXt4yRgpnxny?=
 =?us-ascii?Q?dPmnnatAJY9a3+KKCwxHK/JOYkVQ2HtY/Bt2O/W5ovit6gj0JDCO1mWtYUFB?=
 =?us-ascii?Q?UXSMxb67WfSEe+JP/DkBJEntuGPdVBPAuFO01FPYF4kzWlsroHDtULakECmZ?=
 =?us-ascii?Q?qUS3D3xXahEmyOvO5EBEH7KSB0R/VavAaHVEnBKoVgOaxh9Rn5TIAwRxYzVt?=
 =?us-ascii?Q?swv2UmTnk+QKohtRRur794CcIG4t0LQjVpLPkXA5hplo1qF/JL4v4fAg3NCT?=
 =?us-ascii?Q?taKBJrODNSq2FtIAHuNVZxeOKBFpvO9E0g0aUXfq3X8AjSBlwnWMZLa8/pFX?=
 =?us-ascii?Q?U3N04T6VWpScN4wR8CXG7ZM9N5st+bfM/QI7gNOpNM4/FqmwYmSXxohgDA8S?=
 =?us-ascii?Q?ohoqOXIxzFh4oBHSvhJWqOtDp7hQUw8idunKdLZBChNIvUZM8kwJdx0YahCm?=
 =?us-ascii?Q?hmirBI3V6a8vqDBqNufoUwSSPtXqeoii?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6519
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4dc434fb-2193-4403-45c1-08dd1f503bec
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|14060799003|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GhDNEVnGtAsxjYLtHVckZVZUQeVU3L5JCfMisoSi4yCYLp5oAr3RoMqjg8iL?=
 =?us-ascii?Q?FeHh8fCuLD84F60iox7ryqiu5ULEzxF9zj17sgPvqqc1p3bI8QluH5Br77dk?=
 =?us-ascii?Q?uecNDrDAwy+CVLMfTHqSX9v7vG0InHFt6R8dD3CkU54t3tXkPZh+tyKx2S4T?=
 =?us-ascii?Q?nFywiHh4ZqhhebenbstWBTFgDgibu/3qTzWD0l10ItfR8iuUJLoA7sJvTz9y?=
 =?us-ascii?Q?ispi2KTtW2a7yqTXEUp3CdGH7xsUY+qWo4HJaAcwkrdb8dI4SsxPi6wUSit+?=
 =?us-ascii?Q?qQtKPUDkVTU5hJVHK3DOLFJm7nwDOybggIaF8W2B25iJRvS3cTkw4Rn2HZiM?=
 =?us-ascii?Q?H6gOtPlhXci7mnbXBV5boPIoraZGvTnZiIMbYDlVn/8iBSsutweI0d1K0SAC?=
 =?us-ascii?Q?yp5XD2G5JzHFx3J+9vH6nzM4ANYC/BtPnE73cqou54zxOV/ICuy82htFWdZN?=
 =?us-ascii?Q?GChUL42JdTu6kDxGNkPmGqS/BuVBtHjdGtNKnirlw2TsHHLjDh7Xv+46khgZ?=
 =?us-ascii?Q?3q/mCsVkWTBpys4HIoIrX04ctoYaJ+aJ6yXPw60GYMRL7BsILf+OOWvnJeLW?=
 =?us-ascii?Q?/XwQy24BJT8ewvP9bP3rvgIbYbEGc2FH0akxXHA7Bdh34PorW81iIf21JOsg?=
 =?us-ascii?Q?LCZ8MANKDhm7DTUys/KHw9/WKiFoG3O1+Asy7b0kGbxdHqr/I454kJTEoAXp?=
 =?us-ascii?Q?nMFJJ+QhejAf8GcjiOjWKsDio7f7b71yPjl86I6nqq+L/vy+6jV0xaPKftEC?=
 =?us-ascii?Q?QHwuPb1yGvc1b2RPWiPtFZNz3r1RfqCMcmUzW5MVkUbTNOoNoX5eAWsEmMSb?=
 =?us-ascii?Q?FSNQBFSAHNKi+eZrg6pu0bKpPHe88H2XgZZjwjzyri6kmVoCNdKKQuQKdiYx?=
 =?us-ascii?Q?tbVNbg7uq3siXdZcKgcODMK5Q2UhcvLvPWacSBTFwxohLIwOBG0/pHWLGmH9?=
 =?us-ascii?Q?lJLymDmZL0WrwcIx0pb2CFFsyWFoDWZNncbibvRWrVAMD8d7AzEpyNuh5DG1?=
 =?us-ascii?Q?Sqo/HweaWEzb7TUhWT1I3qGvyKOBUAYH7vBwYp3wJg7s7GgRjLpsSt7HWoEY?=
 =?us-ascii?Q?0ChHAmSMcQzmpomSzwe4MTH4vHX5Acp/aiWNbx0FwVsgcNHKGL8s0JK9OoVW?=
 =?us-ascii?Q?hbouuhNihCOE9biCJgkfAObBbHAkxrscUcSutw0If9vp2iWKPPayf5h9iyhi?=
 =?us-ascii?Q?SvGCG2sgUizpyUAAgtgRWgfPdP1kRCRwz6hflu3/09IjSbqi6CW8q81kT6uQ?=
 =?us-ascii?Q?OiaqpXr775nxxQ2zGTnOGi81CrG6CfoRiDdkuKlpMVOOBWrXLwnSytEXB6Rh?=
 =?us-ascii?Q?X0vEQ5YkxErOuNZgNp28VwSljAF9L3Z08x6hl0t1qiRgT/DCE1dqNh+862KB?=
 =?us-ascii?Q?liRaJcswptCbu5Q+wdbEiMfS4TpPLoEHFAuTz3DBY+I/S4PJrPxRyhwTlpLm?=
 =?us-ascii?Q?Mrcunuyw2iND9esEnUVCh4wTnGpTZVsiJBu9nP7Bx+RPB5K9lO/1BthE/+Um?=
 =?us-ascii?Q?dbxXnpyGdhYSzmA=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:39:32.6891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd0fcf8-b3a5-4231-f9f4-08dd1f504259
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_023943_600882_45E87CD4 
X-CRM114-Status: GOOD (  14.18  )
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

This patch series looks good to me.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

________________________________________
From: James Clark <james.clark@linaro.org>
Sent: 17 December 2024 11:56
To: linux-arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org
Cc: James Clark; Will Deacon; Mark Rutland; Peter Zijlstra; Ingo Molnar; Ar=
naldo Carvalho de Melo; Namhyung Kim; Alexander Shishkin; Jiri Olsa; Ian Ro=
gers; Adrian Hunter; Liang, Kan; John Garry; Mike Leach; Leo Yan; Graham Wo=
odward; linux-kernel@vger.kernel.org; bpf@vger.kernel.org
Subject: [PATCH 0/5] perf: arm_spe: Add format option for discard mode

Discard mode is a way to enable SPE related PMU events without the
overhead of recording any data. Add a format option, tests and docs for
it.

In theory we could make the driver drop calls to allocate the aux buffer
when discard mode is enabled. This would give a small memory saving,
but I think there is potential to interfere with any tools that don't
expect this so I left the aux allocation untouched. Even old tools that
don't know about discard mode will be able to use it because we publish
the format option. Not allocating the aux buffer will have to be added
to tools which I've done in Perf.

Tested on the FVP with SAMPLE_FEED_OP (0x812D):

 $ perf stat -e armv8_pmuv3/event=3D0x812D/ -- true

 Performance counter stats for 'true':

                 0      armv8_pmuv3/event=3D0x812D/

 $ perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null=
 &
 $ perf stat -e armv8_pmuv3/event=3D0x812D/ -- true

  Performance counter stats for 'true':

             17350      armv8_pmuv3/event=3D0x812D/

James Clark (5):
  perf: arm_spe: Add format option for discard mode
  perf tool: arm-spe: Pull out functions for aux buffer and tracking
    setup
  perf tool: arm-spe: Don't allocate buffer or tracking event in discard
    mode
  perf test: arm_spe: Add test for discard mode
  perf docs: arm_spe: Document new discard mode

 drivers/perf/arm_spe_pmu.c                | 23 ++++++
 tools/perf/Documentation/perf-arm-spe.txt | 11 +++
 tools/perf/arch/arm64/util/arm-spe.c      | 90 +++++++++++++++--------
 tools/perf/tests/shell/test_arm_spe.sh    | 30 ++++++++
 4 files changed, 122 insertions(+), 32 deletions(-)

--
2.34.1



