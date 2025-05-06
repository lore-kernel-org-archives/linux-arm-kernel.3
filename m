Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D0BC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAFqPR+zX9RG6YZHY0aobaowX1nfrWesXKLPt0z/uQ0=; b=3TFBmgytIzf6fE+7skAm7U++Mr
	9EpuBDPmKVMPPtW9BAaGKjf+NdzwBw08RsXIG0snnuTHgs97sfEi/TX1A5rZWuDWO5dbWIMQmECJR
	0uFbWOv6R472E+A8ls6kBO0QIrv5sncnuRcpHjSPNpFP10QygEzoRs49HrBd/zfCO7XbyABtf4X24
	IA2fvx29Op4abjhJg8Gbo0AG22BPpqa1ya228J9zbKHPHTilTcRned3ZO5SJy5NBU2+TQeTsiu2DD
	vFPr491SrEeUZjNyaLh0vjffyStkpLAE1UWlSGG1ZVZqC10g0MtghvB0uUwy1Q4yYcjbtGSKQ2qXH
	u0XoINaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcx-0000000Dyj3-3ONv;
	Wed, 07 May 2025 02:35:19 +0000
Received: from mail-vi1eur03on2062e.outbound.protection.outlook.com ([2a01:111:f403:260c::62e] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCS8T-0000000DkXp-44r8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 23:55:43 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YQnv/UW+D4MqdfRQvU76RYMoCngoUuINKLRZ2X7xNIIrd6RjbQ9BckZC55aZGHnxUs9aekuXyYab4b4ismQe8F1oUrYojGaqNXxkDwZyFZppm8stPIISpgeylo+tP6ewgWtsPv0D3fpB62gmO8ADlz3MDX7FgDoG4lnfmMCYKmx+CR+0pxu33gWRTneNoRCohEJJqPG02VEVZ9iXp3wr4sw9wOhriWXtx5HXPka2RkISh+PWirCI5+xuYjC83TLw3jVXAFbp7iWCOw3SBJxx0i6zVi8661WMAzTGPaTmMxSA6I5uTxN7vHG9Bqy67q+IXrUJmQUQHQtl2iLlybon0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAFqPR+zX9RG6YZHY0aobaowX1nfrWesXKLPt0z/uQ0=;
 b=bpgXHCqWEonAyV2wmcFjYWfZpqftQp92sWHMtSe4eaY3GDSZMX1vbJgp30fTjYSYmIMU/MpbXVlrlV2k5+EnmRfVeHVE2h4DAxLgRsmWtO9Mn1Jfwt/Vpdu401OXUHCoQN9VRPZ6eFquVTA3xXgQ2CvIbr4C5dpnLmRWqjLXDkd+iFEI7dDfxmNvKjNZozItXaeui9OC8E7JUGlwdzBhKZQiIu4OtBY3sIwCwqy36YjhgJG41dCBXa1rjHHwJwndJKqYCmNzCBusc1Kz902Jljjo1pqgRbJ/IRVNZJjXGV8VxZCgHKyMd+2+5whnQFTTtBgq/AzHgbtkc3euapJWqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAFqPR+zX9RG6YZHY0aobaowX1nfrWesXKLPt0z/uQ0=;
 b=UQkm3T20iEyrysJ+XCxW+7MotlRmKw2XPaJ+s5h6/+wJfvL8FGNV36r+JTRsuJz2EI0rc+9hkOL78BUt+68WN49rGxf5xMBrPfJRORwIYTKAClVW7AXKJ89MZOUe3Lk98v4S0Khinq5hp553LfGdWvb5szxuxJ0F//OLw3DG7gE=
Received: from DUZPR01CA0331.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::24) by DB9PR08MB8268.eurprd08.prod.outlook.com
 (2603:10a6:10:3c4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 23:55:10 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::e0) by DUZPR01CA0331.outlook.office365.com
 (2603:10a6:10:4b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Tue,
 6 May 2025 23:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 23:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARPd0Dsrx54ApoTPvH+b4hDVkgwqz4t0mA19k1pS6l4r0vYIEJGCeB8o3AxL9kxyz4hGA7aY4ZxalA+AB+OQxFMrK9hlyAjnfISC0C0S7UT4F5jUlMsZEHc8jQzI1O2h61EqDJLyVEyI8GTH6VA6DWB+l05PQmVVKKBCVkR3TE3U/Wa8iEDGHUG1Ne9GBIlVdbVnvKxVqu4n2DTU6zZncGci/il1eYARngocIMgtnUoETQ2J9BtfxTA4wyK1oazYFLaReWaluEns+Kf8URpE8l9SjOyyVOJmKE9xEnmZMEiJt3/PR4G9rzSW5yXiUOd+0zOgR0OonyZP0wKAGrVP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAFqPR+zX9RG6YZHY0aobaowX1nfrWesXKLPt0z/uQ0=;
 b=BpdfHRY2lUiaoO/XQBB8wHv9abhqMWACtapYX8qSNAFvC+dMvCFzyYPvfPmhhRsWSD9GHYekcP78Ten4NiZrbqK4Ykg3yH3rYIVlq/+OfH7LPZcsOmYQFMnO6z9F013V+mkJLWqCryk3RTf/8R6mXvpKM0TfvDsvLKt2FjxPcoKG3YvKLqvG2aDHLfqRHUp3W8m13uAHePyx4hhA4y0dgBuiDGS2iSvCRjRZYe0qsYapkvsPQUviBK1ZxTQZ2IE34NdPbDbu3dphprd3SXeTv7EgLGa464j0vxzgQV/Ojz+uOWxddI3trPlYQfvTJcyGnbzuISsmCQCqLED2zho84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAFqPR+zX9RG6YZHY0aobaowX1nfrWesXKLPt0z/uQ0=;
 b=UQkm3T20iEyrysJ+XCxW+7MotlRmKw2XPaJ+s5h6/+wJfvL8FGNV36r+JTRsuJz2EI0rc+9hkOL78BUt+68WN49rGxf5xMBrPfJRORwIYTKAClVW7AXKJ89MZOUe3Lk98v4S0Khinq5hp553LfGdWvb5szxuxJ0F//OLw3DG7gE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU0PR08MB8954.eurprd08.prod.outlook.com
 (2603:10a6:10:465::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 23:54:36 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 23:54:35 +0000
Date: Wed, 7 May 2025 00:54:32 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 1/3] arm64: add FEAT_MTE_TAGGED_FAR feature
Message-ID: <aBqhOCwK6zQmNd87@e129823.arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-2-yeoreum.yun@arm.com>
 <aBT9CA7vnlfszTDw@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBT9CA7vnlfszTDw@arm.com>
X-ClientProxiedBy: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU0PR08MB8954:EE_|DU2PEPF00028D12:EE_|DB9PR08MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: e0adfe01-d0dd-4310-6b0f-08dd8cf96ea7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ZXFCJf4tTKLl2X0U/96faQcQHg0Iyeg8cc4qQ5WMZSPWsrmmeMm3C5eOO4+g?=
 =?us-ascii?Q?ni41lQS9RBDuWfLv6pQ5RrXPicuvspM4qyo44hPbSx38M3vC+ygxJ+H4yl2M?=
 =?us-ascii?Q?jOjB7+MkGRvPuVXhmN/ZIH03JH0ebVopsvBZMVu1zgzwgDb7CgWRT8rqJsSp?=
 =?us-ascii?Q?2t/qMF7EqIBLf+s+BQ1JVImIpDiZqdXOJ4I0iV4jW9DcaTc/N1z1LpA4Hr08?=
 =?us-ascii?Q?hCwn0k2UTGAJtixy77wisscD/+4UBk6SzlMuoz/DbExNzIWJipvQ8TgEGgYe?=
 =?us-ascii?Q?lQlOJK31kEU6QPw0lgBg5mHHh6x+OUyf+Hj8tSKzdRUDfnmSiwIXQshh+3WS?=
 =?us-ascii?Q?g/Rj9ztIQMfwHyDBQ7ClrnY4w2VGOSOrgF4bCq2UgDOgPXVASwIJiVSpZ4fA?=
 =?us-ascii?Q?USwK1jEr36lqk8iBfGh3RnTrbik2FjcvzeaKJr/H99SuSAZhJhw/jWZr8X+2?=
 =?us-ascii?Q?b8XFGa5FDEUwo88brrzb41NJaD+zIs8gKTdQMnc7a/fuN+tQUIUp4+Fi7Rbg?=
 =?us-ascii?Q?Ss1DYFU+kAfnfWBwMSpwhjBnWDyV6vq2gHFE8g9GpiSFNF8BKQVBjjA6V3G6?=
 =?us-ascii?Q?PSCrMAu8JnOb4g9eBL1VYBSoLWrbstUtusYTbcg3wViSpkxF+aMy2lNYtcXm?=
 =?us-ascii?Q?ruqKV+6m4AEd65reVsr/wQLPcK82TlOZZOcuKtFq+GvRnc4QQQQzg0ritfuC?=
 =?us-ascii?Q?oUqk9Tb2UaswxzqBk4lgCpMru7dhL9ig9Pv/+Ru+Qy1cxoN+eaWp7wfR6Dtb?=
 =?us-ascii?Q?1EOKOQdJOymNMhvCl64Hmma4aPVcyEOApDF/doyLU3pSqaZPGv7ow2DYzO0Y?=
 =?us-ascii?Q?bHODvZQmqkxumiwj6dppm0s9JqYVkHzMogCx4+ndZ0Is0V6Ci0PlFFAFAvtc?=
 =?us-ascii?Q?fkEyesw62tijnfm2Dcg6mDLLGlZfFEPzieRcEfNbudSLtc8Q6LNRiTvpcuNj?=
 =?us-ascii?Q?r9UE1WWpyU9jDWrdrqiOVfrVlgi1S+tVXhcCrAp3SG9e5qbRXwyW7hcs6yJ2?=
 =?us-ascii?Q?3VN5NFQfRC24C5AvXkBbua8su2Xw4Q9waV8A62xIl/QNr6d7QrL2WxWhlU5O?=
 =?us-ascii?Q?W/qLbzpMFj3+fD+useYiMVj5H1bWbAGRIQdcTSXvI6rkANNyWk1aJoNlwXDD?=
 =?us-ascii?Q?C1Ud+LlAs3w7zlNYDqrQ68BZELHeKinWrcyzLa5CBBJ2k04n7c+3U1F29YMv?=
 =?us-ascii?Q?RO4xpBdQ43FDNJXxKzAH1P/K/ztv2qPkuAGKxXiQj+pDauD02d9Tldpna5vz?=
 =?us-ascii?Q?ShNoNj1CiBbcM7KB5ucYLTYRfdAJNWx42/ILhBLi6/eiKPfEkMNMCjldEw89?=
 =?us-ascii?Q?6eRVcGFD+vgW7fxjmMdWVRwZWFhS6h9jY5nZnhDa4noyqTynfHF1Nw8YOFLo?=
 =?us-ascii?Q?onMV0SWbxenGsaNAk/AifNO8RSGhYUSVPlM0DjNkTXiM6AADMhK8AwiLCeJB?=
 =?us-ascii?Q?7E8BSAsd2OE=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8954
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e74ba88a-5419-445b-5644-08dd8cf95acc
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|36860700013|7416014|376014|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n1SuECvxjmAJ/u0aiTXyZBxB6Rn4rdz3WFCpPflSNlJGlNrEftnLhp8Cp7p8?=
 =?us-ascii?Q?U5BxBEpLyCRA65lD0DrQ7Xzl18nwkIUOCzhKKsGFWV9UkJesKQvI9YNW9MQJ?=
 =?us-ascii?Q?p0eBe4EAfO3LwwWwh5oieovUi+Y25su75D1QAXYl8Xd4PY/xDYVghIwrX22A?=
 =?us-ascii?Q?gXM31ZTCn0cu+ENxBfRlcfFbiQe4hTXD6NJs3pSWoPMKji/uI252ZmD4ASmP?=
 =?us-ascii?Q?8nce5Ll9nMbZeBz8ME/oyymZG/DKNvmbGfcXIYVJRinp5lf2tlMUTijrjJ8B?=
 =?us-ascii?Q?ukLd6v0kgGJe2CYzQSHvKpHkmi2vptNaVWLyiom7kxhtV+HilH/QGYZCqWks?=
 =?us-ascii?Q?T6Xm3v3bk6naKRchDcE6vgfyG+UyPrelrVE9SVwDFP3wduBgJHNXV9VA0QDT?=
 =?us-ascii?Q?Xcf6QFyBs98FQmy4HuAhfQ0pU1MDaVrxXomYyrAXZGRJkhno8ANu1cKUChrN?=
 =?us-ascii?Q?XoNjBaPA7VTErzuvT7eiLiJfPt95Njh+9Y0/dr54xcvVCDEeeUS7isqgxl6R?=
 =?us-ascii?Q?C4mxF6S9FEfrBCxcaN3Q77DW7LZ7x2Kko2rUVpOXaGALv1qWd3v4/TdeenBd?=
 =?us-ascii?Q?/Sz/qtG15Mh1DkxyLJBfIKlpEBt3xMnOxaC6vJaHKL6hFUflog6whc8xhhvG?=
 =?us-ascii?Q?BzC/ybq0lEF2J4Aph1WtsUYULAr4uYk7hxc76i0wzaPVqUwjjztFGWN6y/du?=
 =?us-ascii?Q?MWR0otppBv5Rjoit36rsgVuNe0LMJNvyXn4V8cg5oBpkwqtWXJDFM47FzYak?=
 =?us-ascii?Q?oLKsHgwUTsiO2kXNZnuWPAVyo4I5cxhUD12Qe6DPlW8sgTeMRjrXKkl/PBMD?=
 =?us-ascii?Q?uatjB9hxdoDk0CXDBnHicw8gvji67MpxR3USFrJMDjjIk99uKxMSMTT74ReU?=
 =?us-ascii?Q?cKSQXJ5QA2NlxpoLJufXFNqdyd0s/v+21q0rLR4j4MKUKqM9FL0Zmm1/nlTJ?=
 =?us-ascii?Q?iPM1qtopo48gXG4atq3uyeuawzQpENhPWsQI/EsN96nMGTJKIfnLrKy4Kvg3?=
 =?us-ascii?Q?SWZcy46Ww/fLgfu7sAHoAHWrx3/emgFPTpdoBJxRriq0BjnDcCU8Kpd5NyMg?=
 =?us-ascii?Q?tF20Rym4nCMvJD5WFeL0Tcb8eHDnrZWO3a2n10bK9MYmSyiwlAleCcI0gmxX?=
 =?us-ascii?Q?qZzn83uxq70PGYJ5tCbhDKDps2TTOBRwOQIFjwcEnapANkuWZ4Sd57nie+3r?=
 =?us-ascii?Q?bFKMoFrI3W8XA6ZnWh7AnBYaLABICpF1uxXk5QpxTjChIUPO9uJ143YZtE0R?=
 =?us-ascii?Q?a04GP7h1p95WNoO4XKeYtujomrdE9r4AS+OTe+jloW9F+cdKj3f5KMJIXkk5?=
 =?us-ascii?Q?He3DsqAwwDwviYIRPXyTL3FHhxFGzxWaqyAZgl2uP/4OeGG1KwaOFTI/RZkw?=
 =?us-ascii?Q?ay9249fEUjKuRCRvr7RvqGyKLIaHYO8SI9woUnNIPnKFluEuYCc3vLTmrZWo?=
 =?us-ascii?Q?345Fa0dDpT3+ZPy9M8W0dKtrZRMmQJnYGmaQqRfIk3xKlSRHfkRtD6KVz9Ck?=
 =?us-ascii?Q?SQvl/3QmHVb3Xt7WWpWRASigOuwCpn8T4tMD?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(7416014)(376014)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 23:55:08.6726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0adfe01-d0dd-4310-6b0f-08dd8cf96ea7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_165542_012782_7B80203C 
X-CRM114-Status: GOOD (  14.45  )
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

Hi Catalin,

> On Thu, Apr 10, 2025 at 08:47:19AM +0100, Yeoreum Yun wrote:
> > Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
> > all non-address bits on a synchronous MTE tag check fault since Armv8.9
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
> [...]
> > @@ -3191,6 +3199,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
> >  #ifdef CONFIG_ARM64_MTE
> >  	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
> >  	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
> > +	HWCAP_CAP(ID_AA64PFR2_EL1, MTEFAR, IMP, CAP_HWCAP, KERNEL_HWCAP_MTE_FAR),
>
> Nitpick: from a theoretical bisectability perspective, I'd move the
> hwcap exposing to the following patch. The rest, feature detection etc
> can stay in this file. Otherwise, one can apply this patch, see the
> hwcap but not get the actual behaviour.

Thanks. I'll squash realted HWCAP to followin patch.

> >  #endif /* CONFIG_ARM64_MTE */
> >  	HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
> >  	HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
> > diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> > index 285d7d538342..e2b13454e38a 100644
> > --- a/arch/arm64/kernel/cpuinfo.c
> > +++ b/arch/arm64/kernel/cpuinfo.c
> > @@ -160,6 +160,7 @@ static const char *const hwcap_str[] = {
> >  	[KERNEL_HWCAP_SME_SFEXPA]	= "smesfexpa",
> >  	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
> >  	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
> > +	[KERNEL_HWCAP_MTE_FAR]		= "mte_far",
>
> Personal preference: "mtefar" (no underscore), mostly because there's no
> other underscore in the hwcap strings yet ;).

Thanks. I'll change it!

--
Sincerely,
Yeoreum Yun

