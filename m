Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6273CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZE0Y6jamwmoD7fUIichW/2pSicJrid2hdTHCdGVgy4E=; b=x1pZPC9OIgtOenDH/K2C5l1z9J
	7VLfozHl8rbOSDVDLfQ5yAwRvTMcAoofJV//GdlF8ssqpZbwUsAQw2RUIMt0m/4T3GDN/NwzSTZWI
	kZGDpqnHBfgn1Fpo1XIDXfzFIH1WDYj0Mdpo/psWcKxBF/YKlhT4b3oasOkgz5cU4H+uvrRyg9vdu
	lr5WUCzPQBBq1sFFRi/R2g/knlTHigYghGjdJTk3tb88Z3m84lw/hJ2Tvzjrpneuq/TseQ+NMGk+X
	ZA0z4+WegfVssjwAhUxyL9XFoCBiwW/8UwAacA4cCn84kl1OJ5mMsn8IkNHRV4ENYd/T3tT0TDYVv
	V/rAeACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuG2-00000002XzD-0fV5;
	Fri, 15 Aug 2025 13:14:10 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqsc-0000000257A-3LLJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:37:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZO+PQKoTN8zGPA8ebSmx2f+X4AgzC3nSFOuLOz2fJY0++VVk4gtT3O96s7XnuOVo0+f0JpHZvIH9D1e6dgEh/xy1/5kih0khfZwfjrDNja4837BbE+gtEAHVR3LMwOJsDwxuVDSufDNUcpBaALNlWUa9Y8mwgZ5zb0+PD8CVAaalWsEunrO7xjfMKQh9ywbbDJwfYD7DGPCJ+rH4w8eBjweu5tXnaKR4n1CFIxzUb3gbNWGu0uoHBFeeyI+5e1sL1FHajQ+ANQBJeTo6teBZGhUClB1N+5fgfxyTwTDyrPOKIFb8UoX7EP9rh+/BC26ieC4kRNNivvM/LO+Jr9piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE0Y6jamwmoD7fUIichW/2pSicJrid2hdTHCdGVgy4E=;
 b=oKm1e0fHHL7bFT1ciaMQ7Iglk53jmffEPceqCPeLzSc4Yg4P+bmTg2HQb27JoIa5oUX9uwOzQTGQ6jQcZ52wncUZgS4Z1hTUbyR2FTporb3F9yDAD1qUBJ/uSW8mbJQU9iV6vMTf61f9Yrt5rpC7vq+7scJRxEF7w1BTjMM3+mDfMlpnmxXGsKXBT+9/V1Gj1IOaTTgY2MxqJYW7yzV/jlA+c2YHWct9WQ6f3WKReKjrqCp3AZJiWI37iOvZQZS3GLJZz8Oqr7joJMdluw/xoQH9geVhCLhuljS9LKihQVbxWZqPWSSKN/K4u4KttMJkDzCBT+8OZJvdTGjVrOLZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE0Y6jamwmoD7fUIichW/2pSicJrid2hdTHCdGVgy4E=;
 b=BzMOSqjwfQj+yddu1syGdTju1VqdEqueMJMKkqaEoxJ855piaOW+qcYDBnMrwz3JPukwVCFz+VsD5pVDNOUGVYtOzFr1fxa4fS2S/XL6nSbhRd/SCYDg8tpvb4TkzAKA3z8bJIYlphoilncHIrwLHnLR5SenopYzNx2se+8pWc11nRCgsbvCIEHeitBneBsbmkvgLbczUKJpowQrlfmO71S7M3jSjnTqRXT2hB+cLzNt/7ADSDm0ZtOc1Q+WmE1IZeRs8HayNyn2j2lJFXU9ofcBjH1YuN91xC5QEFMM0sPwr+uSZ1H9KuqzIzkAPMgM0vg4Wv4iGuM6bChf5vhcHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 09:37:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:37:44 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Fri, 15 Aug 2025 17:36:31 +0800
Subject: [PATCH 5/5] arm64: dts: imx94: add DDR Perf Monitor node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-imx94-ddr-pmu-v1-5-edb22be0b997@nxp.com>
References: <20250815-imx94-ddr-pmu-v1-0-edb22be0b997@nxp.com>
In-Reply-To: <20250815-imx94-ddr-pmu-v1-0-edb22be0b997@nxp.com>
To: Frank Li <Frank.li@nxp.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, John Garry <john.g.garry@oracle.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755250614; l=769;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=fItxamcJZcGuIeOf/1RUtWftuqDtQ717F8gL0YFNbv8=;
 b=Qg9eO3/JN5Z53uSslCrm08idG/eJxbabS0yR19OEoRdq1bJPW6Tzwv8NKPk/vC9yzBYZZfG5w
 2Fy/WB7HStsCAW0P7yUt1hfCX3Ku4tUfDP6DjrmaG+nKz8fMhvGVGu2
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SGBP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::28)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 332ac762-d946-4581-b1f6-08dddbdf6286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|19092799006|52116014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjAyZEpGWlRFVk9kS1BoSkJXM2Q3VUsxU01ad2p5RjhPeExQMmswUUQ3eElL?=
 =?utf-8?B?alFLL1hiZUhuTE1abENQYlorNnQ1MTk1ZUF1Ynp0d3JpSXBCa1FnUEpHbUM5?=
 =?utf-8?B?R0RsQklRUjdtc3huQXlRTzdqQ1dMVnhrVTR0TTh1SHhINFlKcHp2WHd3UElV?=
 =?utf-8?B?SVFUSVFiZDNpWTZQN3R2SXBlTXIzS0hRa2p3blZIRWY4eHFhWWhzZnpjMStL?=
 =?utf-8?B?MG13VXZxQkZzMXF4SG53RXRGWmNMb3hPaFRqZWNOS2xybkxmT2FwU1NFcVND?=
 =?utf-8?B?SFhpY0t6d3VTY08yTXY5Q3NDRHdvNFZjZTRjVnJZSHNUbVdFNVFmdFpUQjF6?=
 =?utf-8?B?NkxwTUdET3NWY3Z2czdYRHBOOUdLWnJqNmlFOUdveFZTc21xVW42cTZzYzR4?=
 =?utf-8?B?dE4yTDZ5b282RFFsQlRPUEkvQUJaRmR0QVlReFQ3cjJsaldYQTFGTWJvVjZw?=
 =?utf-8?B?emFxV1pxM3pNS2dKRHpKaGpuV2lqbEhoTnI1RDdDZDdEVWYycU5QK1VyMDV3?=
 =?utf-8?B?YkwwSXJHcTRQcEdOdjNQTEVqMEpza2ptMFh1T01ieThGZjRqMDNucVdhNUsz?=
 =?utf-8?B?YmluQzI3MUFEeTEyQVgyem40bm0wUnFKZjRuWVdvUG05d1pTK05YektEbVh5?=
 =?utf-8?B?cFZ2cytjbG9SaDNZZmFIbU1wR3ppVS9MbkgxdWtzZ2doM1lPUFQrMkprNzNU?=
 =?utf-8?B?MDVtSGJmdWRGczRPQkNQeFkwWTVWdGRkbjlyOCttUjI4OE44dVVJb00weTcx?=
 =?utf-8?B?eU4wNnJNM3F3Z1piSEhqR3A2RGs1RFI1WE03eTZqcXR3dUpiQ2JZNTJ5L2hn?=
 =?utf-8?B?dG9Rb29jVWFQbEpXUEJHdHlPcE1laFE2S2lVL3IyakVPZzBnMWhFbnBRcEd0?=
 =?utf-8?B?ODUyQmhQY0lzdCtZUWJ0b09BKzN4cmp3MHBESjdybWdId01KRW1lZFhHejdW?=
 =?utf-8?B?ZmN5MEZnUEY2UEJBYm1PbS9kU3VGeFdyQnF4MFhrRzNhYkYrNW9ySzcvbVc4?=
 =?utf-8?B?czFwdERsMGFyelJvaHNVQlpSWGNxNnc4ellHdjYxY1ZOMzhvaUt4Z3Z1c1Z4?=
 =?utf-8?B?eE9TOUZDbjJTYlhCSUtlWE5kWms5ZVdBdGRnTmhXbHNLWTJ4c0hHNmc3QURC?=
 =?utf-8?B?M0NoRjZocmdzR2JQQzhYUkVJVXg2dkV3dkZ1UlRDWUtaTFZ0SVY1SlJWOHpa?=
 =?utf-8?B?bytaa1pBd2VCd2NFWklJUElmQUZ0dDJDRHZCNUhTelhtZ0RjWS9oWmtQeVpN?=
 =?utf-8?B?YTdlVk1VdGVqZVZ1RjkzY1hvNXJOc2xUTGRlWkpFdkpENXVZRnJPVTgvby9t?=
 =?utf-8?B?c1V4VE0rZ0RzRkhieFJaMjlXWk1Kb1dPcjZuZW1RT0hRNW5HdzJvSmlNMlVm?=
 =?utf-8?B?WEtLSW1TTk9sSFpSWlZWVTA2REh4LzYxdDBlcGxuUEFlS3pGR3kyTWhRSHNB?=
 =?utf-8?B?SS9EZjkrWUd2cDlTNlJyWUVOOU9ISDNJeUVTUThUK25pMTI2SWdlVW5malFt?=
 =?utf-8?B?OTBudFd1ZnpJWERyVlhUbllLbmgvOW42RlJOOFNkU3NBbDJCbytLZ2pnMVJV?=
 =?utf-8?B?YUJTY1RSTU82T2lEU3ZxdW5YQkVaM2ZjU3BCTERlZk1wc3VWbkdScTk1ME5l?=
 =?utf-8?B?dzdRaWJEdFhlY1AwNXN5ejlha1UwV2dvUGxDSnJtbE5CS1N2UElwZjN4dmhj?=
 =?utf-8?B?c2UydElxRHBnTjRVa05Nd1g3WVdaQzNJNGJSNUxOeTZyaHd2S2k1dDgrb2tw?=
 =?utf-8?B?ZHJ0Z3FNVjV3SFVBMlhMRG1ubmRTOVhtakxLZkNKLzE1RGhhMFBFaGFUeGJC?=
 =?utf-8?B?NnJsWHhlc1pBTm9odHA5MGxaWmZsNWMyWUJqOG1qVk9aaE5ZdnY1T1NnOC8z?=
 =?utf-8?B?cjhzR3hhWmExZHUzSFBSc1gvbmlxS0RsRFJraHNzSWxJQ1Nsbk96ZXk0LzJT?=
 =?utf-8?B?MXlaUUUzQjJ0NWJNV1BRcWgzYVUyODVqdE44N1U4bzVUd1lmYWUzdjNHekRY?=
 =?utf-8?Q?WrbwwKJiEhzm3M/mR2cfARM6X2aFH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(52116014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUYwenpPV29DaXJ2M0ZxcHl3MEErdzVRUm9BVlFEVDBWTm0wUzB6bElYeFBO?=
 =?utf-8?B?TktjVGdmWThseTg2UkQvWnZBeFpZeml2NUUraE9aWnExQUVHcUwwbGZnMXpE?=
 =?utf-8?B?U011USt3dk90N3M4ck5vYXEzSmtrcTJCS1hTWnVHVWg0b2hiZEFzUFJOVzVI?=
 =?utf-8?B?R0pOT21XZHZIQ3RPQzR6RzFrbTB5SjlxcnI4bGE2bXVzd0JqZlhIV0h6N0tF?=
 =?utf-8?B?dmlHb0psQU9XK0FjS3VZLzA2eGdDMVFvbUhMbFZmSzBid21HOHhTWG43MnR0?=
 =?utf-8?B?SG0yZllvNDBEVWdNUXUzZWJsMHhab0ZGeG0xdlJwSWF6WlEzZWEvaFI4Vnl6?=
 =?utf-8?B?UzM1MndDaVRuVzV5S1RUQ0JTNEJZck0xekVXZWxFQml6NnVmNlhJUVFZWFZq?=
 =?utf-8?B?ZVFiUi9tQ25vRmhOSVNvWWsvRjc4SG9XeTZLVlIwaEY5RGhTSFBNeHI3YWs3?=
 =?utf-8?B?YW5sRG9yTWVQdXRQYnFjTHE2QW8zVnNiZWZCVlVQaUhaREhyUjcxaUsyZUdt?=
 =?utf-8?B?U2NUeC9YSnJ6QVdGOVZoSGxLWklCTTZaV21xZGpzYWNmU09WRFdmWDJmNlNa?=
 =?utf-8?B?MjNzWEJmRDAyRU9GT2ozS2hwN0hLNnJaRFBzNFd3TzJzc0ozdzY0bXN3enVI?=
 =?utf-8?B?L21XaEkxcHgyb0F2OUxrdXhxcFREazdHNjdqMTFSUUxjR3JsU2VuYjVkM2Q2?=
 =?utf-8?B?ejl2M0s4QjBsTzJMYWRMUDdBMjlBeVRXZE9vNjAwVDR3eDhCVEc4RTRtZnJ6?=
 =?utf-8?B?UW0yeEVDVnJKZk51b0xsT3dyVWxuVGQ1b3lGbUgwT0RvRWI3OWlLK2VGdmRX?=
 =?utf-8?B?Ym1lNStQTElmb2JVVHBDQlAzYmcySGtSWUhua0tYMnlEREVtMjZTOE9scXlR?=
 =?utf-8?B?SGVVcUdJaWUrdEtaTmQyUTBKNzJVLzBZOXdlWVN5YkxHTVZwWUErVjducWdq?=
 =?utf-8?B?emVlbWV4S25jT25ibzBHZUp5NkdyZEpLSjh5K3MzZGlyV0dNQUJWcDg0b3Zo?=
 =?utf-8?B?eFlCUjBUMko2eGlMZUtIaVFUcnNZZEZQd2NCbGFIMW1wMkRjNzJIWWYxeXo0?=
 =?utf-8?B?NG0vK3Z6N0cySUVoTUFpZXVPVjZNbFNXenRWdU1SUU1MTGNpRjFjOStJaCty?=
 =?utf-8?B?TWZMSGRVN2h0YW5MWDcycEczZmtWZlJiSlhwaHhWaXhOQTV2cVNoNnUxY005?=
 =?utf-8?B?VzJJLzlYMGdVZjA4M0M4T1ZQN1NaeXVEY0RudHd4M0RZeHRQNTZNSzdKNEJG?=
 =?utf-8?B?dEJZYWpudEwySXlPUS9iWmduK1RWNXZ4YU1FVlRTNnRXbkN5d1ZHTFZjNDNQ?=
 =?utf-8?B?dGRYTjY0NmFIQjBKcUNSNGdjZE83c2lQb3k3SWJVeEdzMlJnbTBnbWJWdmlz?=
 =?utf-8?B?NUJ6ZStHTk9WQ3NOZzFCSEV2K0MvZnhHS1FxSnJ0NW1ZcjkxcThMTEdMUjBS?=
 =?utf-8?B?dS9iWDJDTE1saHNwS2dOSVNqcXlXaWtZMk53aHVnbEUycFowNktKc05sazFP?=
 =?utf-8?B?UlNnN1d5WUFmOUVtcUptbmYwb1FhaUpVNUpJTVVkQitEcTVqeDZ3aG1jcTJZ?=
 =?utf-8?B?MHZQNXFFckttRm81K2RyR205VGlXVERuVFNEZkxaZnJKY3h3NXNvQ1JGNWd4?=
 =?utf-8?B?YXNBVUFXSitaSTJwTEtLU2ZkdjJ1NzFScFJuRHRNbnEybkU0eEwzUEJEM01v?=
 =?utf-8?B?MTlTbWJMZFJDZ1pacyt0MnhMM29qaUp2dC9YSEN3cExmS2tvQXZkN0o1aFZk?=
 =?utf-8?B?cGhFVmJzazJiOGtwQVpGWG1lL0cxbFQ5SkEyVGtYaFJyUk5WaEx1MlpyZlpi?=
 =?utf-8?B?TnhzN1ZYa3g2ODFCQ1NaSnRzQVczT3B3d0RxTUd6VnNZNTJ2MHcydFFHWU9T?=
 =?utf-8?B?clJad0Q4NHA2Z3RXVFV0VVdMNlU5MkpDemdVS1VCM0pKMTE0dENDNmo0MEJN?=
 =?utf-8?B?Sk9YRkZ3dXRpcmN6WEJ0SW0zV2lwSXBQSUlJRU4wQnNHQXNMOVhwUGlVc0VY?=
 =?utf-8?B?NGZ4QUc5TzlHWTN4cU9DL3FmaHdpMXVEMS96Y0Y2UnVnbFJCcnRCZlVaR05Z?=
 =?utf-8?B?VCtXeE5TVEJWblNHNkxqWksva3kwQnFXc0ZMYVVScDFZc28veGRkUkl1STFz?=
 =?utf-8?Q?XtkD+rFP/NgL+OXa+bdNuKQgg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 332ac762-d946-4581-b1f6-08dddbdf6286
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:37:43.7455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAmVarG8XKbJGvN3LMR9yXYIp3BqzlIGfVQhGnmYhwL1+2JcOGK7R/94vwme0492Xp5tb0jlnuTJeqCq1Q5T8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_023746_849732_49B4799B 
X-CRM114-Status: GOOD (  11.06  )
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

Add DDR Perf Monitor for i.MX95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 44dee2cbd42d4bc765c33a9ce663ceda095b6c66..6a2d86d67200facec76a7880b4a2268b4191452c 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1188,5 +1188,11 @@ wdog3: watchdog@49220000 {
 				status = "disabled";
 			};
 		};
+
+		ddr-pmu@4e090dc0 {
+			compatible = "fsl,imx94-ddr-pmu", "fsl,imx93-ddr-pmu";
+			reg = <0x0 0x4e090dc0 0x0 0x200>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };

-- 
2.34.1


