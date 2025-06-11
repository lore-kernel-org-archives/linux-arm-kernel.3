Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2345AC71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQ9i5heX7xs1cLLLZ/wfxqSkA4VcTN41kybJY2ai8gw=; b=ljO1IvcjCrc+9y76pG7EEtd6ry
	rgzexvSR19PaDBVVriYQrSMhmJG/BM4LDJiViGsml87kErZzM3j7JaCqU1zoBzkZYaGujOxZan5Dr
	65/7t+HXQgsdoWJ3Mo3h6lJXbXUOjq6ZwqHHwFUFvF7tzph8WF6l0PAzOylA1/ybWWzXdOGpIu1S5
	rDUQnNaImnhgjll/a5c8ZNDKM4qo880nZdxpCrKIpPtFbJukrIlf1ZV4pKa3jB0zV1b3FUHo4fyrM
	N/aw+39+gKnm/mrXNuAFkRf4nVOzy4VucYdy8GNtnc9P2zxQXauCoTb3TGamBMT4KekINOLXGeDjF
	pOV/o0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRVw-0000000B0cA-0Fvs;
	Wed, 11 Jun 2025 19:53:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMp0-0000000AGQI-10la
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 14:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XQ9i5heX7xs1cLLLZ/wfxqSkA4VcTN41kybJY2ai8gw=; b=qlSa5m7loPnZ4cCBnsltj/aofJ
	Cjhmdu0Jrpwd/TPT7+kxAtqmDR96ykETBFN2Dgi1tRzA16taBTqakWEOak+MdFa8O7DebQmmg7KGt
	Fvx1AKZSLcX2iPGml7TZOiHNAutRY2Qah7DBr8yiYMhd05A62NIX3t4Jp20RMdu7Fyjcfee4CfLKX
	9mZ3tZJ4zeSikwgNfNo9Ju/CfVF3Xm6KNhYxCj7BbUlCT30VQ4YbnGdHA0q0q6HhLIHo7I86m+OXG
	LU8LLClKqxT/gfRsQ8UU7o2N64B+6RVu/4ZL/2mtFcMlwgGoYp+Kf3eL0NbZPIpnTkC32l0EYXJxe
	eYjckDVA==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMox-00000002PKz-0Nbn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:52:57 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FSsOfgSFVFIQO1Sd8qTnaZHMJ1ffi/CQDT4sDeNbLq+el5HO4YcB1ySG4GLCNF0Ph3o+mWDuVo1PddnCWqIf0b0xRH2TqI5fuIJf0Rus3K0W5/UevltpujEuPzvLvCsgp5EmBrVh6hWem30brdDrshe6ajFIGAPyMbBnCZ6+HGM9RG65is1Q0H9CppHoJIgIra3JT54ZVSewSLQlqgIlhJn/EDhzQdvOA2+scvKkLvZVMySh9mb2B+/OGuFYTtz8xoGSOrI874FK95bI5/pwcvq5L6DJmhkx25cWZl9kGcH40Frv3moUuO0DwEwznc4begxJUyrZHS4/j8MwM1tOiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ9i5heX7xs1cLLLZ/wfxqSkA4VcTN41kybJY2ai8gw=;
 b=Aw9qSbA7jcf3L7X3+yltSoF+vdidMACdy4hVh/UfTDveUTyFlpTe+rnayyW/ZrW8Wd4o8Ejr83Ie0EuF19DaVsd3usq2jplk5ktb87YiPlv3sq+X6kh4XZn8cMOYAGtWg9B3yAfNzemGLhsYBi7GxKfuFL3GiqToc8cSsQKr3shjP+pQNZD8ls3KJJoOTh2rKBuVvPs8iJR1nn0xJjmCxXrWKhMa2TNNwDyg3XCcTurSs6VyGvkkEg1w3/e1Hc2CXL8/k2xyobbl2Oo+S5T1Xf7fK+0nF6t+G9xdn9d/al6m98z9q8LC2LISJvuWnYjqeds4B1jdFcLEYpkn0+Ysyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ9i5heX7xs1cLLLZ/wfxqSkA4VcTN41kybJY2ai8gw=;
 b=FVlVPuR5CrDCPoo9+pRz0nbFjQ5w7/I97kqBbGlAMkFl++Z+n+n2n4MxfqpOXSPPCFQo+4JAHz1QYNfr5jPn7WojHvBGz+3cEpdT01vtYDiOQ9W+Qa33vo758shSlv85NJfKVts/RjZ2BqvnOAAA/c8Z/YaRV/ZobJV3iRLVQ6E=
Received: from AS4P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::7)
 by DU0PR08MB7905.eurprd08.prod.outlook.com (2603:10a6:10:3b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 14:52:47 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::8f) by AS4P191CA0017.outlook.office365.com
 (2603:10a6:20b:5d9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 14:52:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 14:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJHp9A1fEWAwMXaZlB4OZqFGtZd51nEAuF2byxX0ixd2iBjMIGF3WFnmbIR+aZybOU33LrMUnCPd4lOJYeRLlkTxh7tykY1V4bmDgCqVdpKeGawJcY7a5cqym9teMB1HSMe23ORAFIhmXYWuGKPlpmCdfpWYTAVROh964TKKbfek2ThRl+7YnP+MKyc7M+gxTVT72A2M7PJ2sQLVI257c7jnREAGgL753dM8OgEkaXRcdeM/IZRZ9KXfAN/VhCGAqv6zO4NpSc1hdVfP9SmwSPRi/nHm7mEYW5/3HGlFofiO/bMtw+4O2+QSJ08ZnHCv1LUo4QdKieLqDJ8lO8fKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ9i5heX7xs1cLLLZ/wfxqSkA4VcTN41kybJY2ai8gw=;
 b=H42k208UTvcnePW4j1mkcNpoSXejTeRgXhGOqVWyzP5I2HILBQ0SpLmZdCz8bJaXxnbKOrmRLhXXDt6+7FQh0qJwDEL5g0aN5YV6h3y/SOY1EFIlcSr7r3Qkl71tbugxrvTOPPBSU6r80eSZt/81hjJyjN4H0zozDPgD6RNoPbMa5XtiQY1J1uq59+iEi/sJNerDlRjP3utmoau8PUqyUQ1KBlu8lVNyfJ+lyPg0WLMlFEtKs+2yPRLi++C9BN1qQB7oRR4BeA1rp6m6XUmkdoljr2WvsW6vyMqjQUQWxCivMjpCRCi52nf/ZVxGesL9p2gG3d0nq7zpT+aHjAFEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ9i5heX7xs1cLLLZ/wfxqSkA4VcTN41kybJY2ai8gw=;
 b=FVlVPuR5CrDCPoo9+pRz0nbFjQ5w7/I97kqBbGlAMkFl++Z+n+n2n4MxfqpOXSPPCFQo+4JAHz1QYNfr5jPn7WojHvBGz+3cEpdT01vtYDiOQ9W+Qa33vo758shSlv85NJfKVts/RjZ2BqvnOAAA/c8Z/YaRV/ZobJV3iRLVQ6E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB8682.eurprd08.prod.outlook.com
 (2603:10a6:20b:564::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 14:52:15 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 14:52:15 +0000
Date: Wed, 11 Jun 2025 15:52:12 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: cpufeature: add FEAT_LSUI
Message-ID: <aEmYHMoaW1sCdqyN@e129823.arm.com>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
 <20250611104916.10636-2-yeoreum.yun@arm.com>
 <ba043c27-710f-4f0b-bbcb-64175bad5df7@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba043c27-710f-4f0b-bbcb-64175bad5df7@sirena.org.uk>
X-ClientProxiedBy: LNXP265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::19) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS8PR08MB8682:EE_|AM3PEPF0000A78E:EE_|DU0PR08MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 964452e7-58ea-4149-266a-08dda8f7a198
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?w6KPS+JdZuynybfpHi+4fiXA9UkaVGj5Xw2bJjvOUMGlj5ajAyA0ESgus+m4?=
 =?us-ascii?Q?JKJE6CoSr5B3/zeTpx2riaMccxRNfEr5RZJhjDjWLy8tPMIXdoTRLpOBVzy6?=
 =?us-ascii?Q?r1cKLxUt1LQYor8sjJ3wErTPGDLU9XatopinUOWtZNj5wMHH4Mr4HlLZ3Dwg?=
 =?us-ascii?Q?N3VnaDnPqhB1t+q2EgBdG44IzbR3o3gx84YN2rQTjxTmovGDjw6OD/LXx7wE?=
 =?us-ascii?Q?Ci3MWp58k/zNfPSeT+5TkIqwMCNI5Dd71Uy+2I5a9ak4EBIlORo/sSriN8ln?=
 =?us-ascii?Q?RZV3xgkLqNJM21ai5hp9rGMiWpKbcpyX6ZV47cDD3GamXMyOcOPoEpfH3wT/?=
 =?us-ascii?Q?eOnKrtCVjAu0qNtgxNYlsTB6Yqq3QI/7gBxUPEDtl1GfNsPuGDAPZ3PoVoo7?=
 =?us-ascii?Q?X3haSvjcLT2uNJwe9OYkhgjZcFX/yhFA4ZQoB/sT4sk7YUGPF/kBr5fw2kiM?=
 =?us-ascii?Q?0V8BI9ioqyDc5wFcITQzNPdtucqV4OJL9l5UCRafgL6jsBOs/3DWoiapLXpY?=
 =?us-ascii?Q?Ty477YQ2iNE3XO2k5UFgh+mOnMTQ7OKE+BcuNTZC9vjNzQIiB4Nl6p8tOYU1?=
 =?us-ascii?Q?qbv7IdyF80kHWvll4Wa8C9M7uyYLXMsK7BEWrjXQovl7WPm5UnPZfFfGqibN?=
 =?us-ascii?Q?OtaKNZdU0Ox2zgELIsSCljNi+v6hiJimOZeA9oLnd3hdeJGLg6OO7WdkiS5+?=
 =?us-ascii?Q?jnCZFg5Dp2243xGeJwCmJ7sXaJd9NAcXr/+SlYV+NCRoROlgE62wl+H5MObl?=
 =?us-ascii?Q?/73rAHtWAaPVbuVGgKjj2wWGHDkamDhSZ04Gd6DG7odVP+ri4QQEfnfhOddU?=
 =?us-ascii?Q?noxcc25wEtIwJAtpjV2WyNOZBYPpMY9nJSbILp7OenxdYgdIf7spRESOkIPg?=
 =?us-ascii?Q?3+m0Wj3b1O8SStDBBIYHHoox2E4BJcbHdDA2ZxwE47zyvi3aIXWh4HqXlEZT?=
 =?us-ascii?Q?4i3xon9Z41zFMWim7P2ApdDESzobeple2mM2vPTFWDKFPNLaiJBDEI/Put3q?=
 =?us-ascii?Q?DyEpqpzkbrTBNKJpuY2UGUlGryoEoSjf0XBmn8ZSYvBLlePb2ovCAL0diRkm?=
 =?us-ascii?Q?awFGLHvZ4Z6a39LcCB2ER8RFDifwOIrtOUY7uhmtQXK9kW877LXRESyYYLn7?=
 =?us-ascii?Q?c6lA3S4M/lIC6IrdRM2T3oplUu0Ohu3z5s5RnxLyCIwCCSDjvpvEWY/JwDGX?=
 =?us-ascii?Q?RzAzlYGE6nmd8/NcKR9rK/M9/dwb/07uojTFbZK44C0eSfArWI01WlOLXiMB?=
 =?us-ascii?Q?Zv8FpEJipqlTRuQdP7xFEGZBV5T4LfklMKNEhNgg+M72vj/6Z16NFUWm93Hz?=
 =?us-ascii?Q?HGQFdirtoA45Cvhu+RFE0t8NkA4+NVF3mtyykrpmGyYKk3MAYAaFbgzDDBD2?=
 =?us-ascii?Q?z4Dx+HVOJyMx8Bg9HbSwUOnB/kWTrnTFT8eEKeHBrdjMqs3j+bt/0I5qofCs?=
 =?us-ascii?Q?6fHwFA/PucQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8682
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9da4da84-750f-40c6-dc99-08dda8f78e23
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gUXG0WI30e1MYaCcxX5Vt2aiXj8pNdqT2yT/Xfa32P+5n6y9B5zyWFTs1Oxs?=
 =?us-ascii?Q?boJm1uj2Ilueemu/kSi8a/V0+LfAN5MUkxd8PIX//jjZcD7hi5m2XKTEAuqt?=
 =?us-ascii?Q?SChHyQ25/HFdsqzCL0N9O9QVq390RJf4EE1mIkIscpOqQnltw2dqhDkexh2N?=
 =?us-ascii?Q?rp7SJ43llvd0dVPXzLLYZNwXBv9t35qqKTBKx4MuqthmPaMKUcH1yfZFUWJa?=
 =?us-ascii?Q?ns2fhKr7gfB3cC3QWt1sa4BBOuME4wNH1R9QsNjzSVK4oV8IIgZD2LqPQRQe?=
 =?us-ascii?Q?tt1+BVNHuAxmGzPDCUY6giy+ikC3tIZxPPVrCXdKMXMJ1bSTQxkUPtNPrUjT?=
 =?us-ascii?Q?rucLk6Nl5iXKT0aO1CRql4xVhCE3X5bSxvT8AO3mlgyyATUH8zNJY5fkHRyR?=
 =?us-ascii?Q?yWLu53ki5/uKjVtT8ChpIv5qpqmMgfp+2C3t0Rd2uXpZOMHvEQjW8ro0KEnM?=
 =?us-ascii?Q?n/T/EFuhwxszWGuysL61km5VuBqwXD3uXzTDujHQXSPcstMurvDIjDpg3/+D?=
 =?us-ascii?Q?9hqb6iZ40Sn6gdTIJtE2WNL5NNdzw1GJn64Ni3wzJ5/SXPmu/1Ki6J8G8kOx?=
 =?us-ascii?Q?nhNWJRQGzusUd9SEjaTPdl+NJJFGHeJAij753yiSwiimhyeCQgkCovSjk5CC?=
 =?us-ascii?Q?KBCs/bBOPxQigzMrMrnKP63TL9vq8zD41HNh59lo/UYQ6d7u/xWMYzMBOeY4?=
 =?us-ascii?Q?ucpj1TIpO/IpsGGJ6EdiPVnOChzk0T+jKagDAWsfvSS6mLcpJV8TZ9f/zugK?=
 =?us-ascii?Q?Vpq2pofJRv/2JIF0io7u9gtxKeUpzPAPsHdf5Y1XJuUsNUtfEk9bt1YQ0Fd8?=
 =?us-ascii?Q?BgwsWqG+VxGKJdCfEla0GYx0Ov4ghvrnTALayOv17ReXFXD+W5zBAErz20Fv?=
 =?us-ascii?Q?AZKosh6i5JHz1AA5KCOd87xbgTzaO+/6EYFz6KLQFMmcvKmohK/57l1Hy7MQ?=
 =?us-ascii?Q?quq6yuWTRqpKuVDUeGv7nkmX7/OlbjW5eh6cMjRdHc0KIfV2jlzYBR+g3YyJ?=
 =?us-ascii?Q?LOGT0AONVG5OFEHD9q5wKbtVrxIGK/k2T4S0IIRScyyctsc9KirjIQuU/G5j?=
 =?us-ascii?Q?xahLbl8tgZpUbKkrSbpIr6XQY0jI4o2mHzwnr3MBfYuIboGjbwFdS9k+4164?=
 =?us-ascii?Q?Oau7jGExZ9zMvL2KZ7ThR/C0wkgFwZ/tJEVp8ZnrHap/sG7PR2ka7YIHPjyz?=
 =?us-ascii?Q?xH9XqRFmfPUF51AoNyhLEWdjdGvMih8idZscB6XGszS/PEefk1hRU7ZTZ/7w?=
 =?us-ascii?Q?c8KfnGns770VWmbc0PCBlXN1u5Gat0wcAdGEfW2u0H7EvgSQFtiKI6pFC55b?=
 =?us-ascii?Q?yb9A3iIIUMctIamxt1WZGtepeX8PxczDsuYkINA4uLyCHFKvIQUJPLY7qHcH?=
 =?us-ascii?Q?J94N93ELlh2u8MwmUl5CPTEDK3RpDt5lJinV3MNsDA574rvJDZxuMkFoTVO8?=
 =?us-ascii?Q?TPNQC8JQwTNoHQzxEq2HbDJAABzAdgjBzerxNG6V3hD5sLqqggVnhxmYp93I?=
 =?us-ascii?Q?KoJj6cI+XPROY2sOsbNe7VFjISdmkfDAp7oR?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:52:47.6074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 964452e7-58ea-4149-266a-08dda8f7a198
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_155255_255121_9EF16F00 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Hi Mark,

> On Wed, Jun 11, 2025 at 11:49:11AM +0100, Yeoreum Yun wrote:
>
> > index 10effd4cff6b..d625f4987aa7 100644
> > --- a/arch/arm64/tools/cpucaps
> > +++ b/arch/arm64/tools/cpucaps
> > @@ -59,6 +59,7 @@ HAS_TLB_RANGE
> >  HAS_VA52
> >  HAS_VIRT_HOST_EXTN
> >  HAS_WFXT
> > +HAS_LSUI
> >  HAFT
> >  HW_DBM
> >  KVM_HVHE
>
> This file should be sorted to reduce spurious conflicts.

Thanks. I'll fix this.

--
Sincerely,
Yeoreum Yun

