Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A889C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JZMiFanLoqZP40imqjrEABNZVhNR9wkcWCfBQbKJJE=; b=ulJxIGnc9RpvXJLHnZUdqY6s1n
	QmZ7MdOG54+kgii2myXAjkyTaJM29FrI4VWSA6LGoF89t3SxHidtrkwfcYEouh7mT9Bt9tlXoDRUU
	+XuCtWUoDgPYUpk8HHP0LwwzJbisqYG53MEx7TL8mDu8oN0bgUmQK06rorwOxnGWTbdwxrGLy+1eV
	4ZDVrRqEU2RIDRwQRDhKLzwGMNX3wSwVaHtB0JFMZpOd8uHoNh43IOPPQ0cM7bzqePy4OKrIgjIDX
	+a/QIAa4wb6ZYJAP3hXLxJqUmUQ5/7bo6Be8EMXtVV43w5ptRPPRYv2vsAbrHrqiMLGrV7p8XI7K/
	eTk+zzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8SS-00000001qPt-0VeG;
	Tue, 22 Jul 2025 08:34:44 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8GC-00000001oSH-2Jg7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 08:22:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AS6ZchbWO3O/sbfwYmTTLXtBk00a9f8RSvAEdzNSOdvsuqCQeo9Gx5RIYeSlVJN4p4UHonGYYeY92cGLZOs99oyD6aA7P2NXXBrSyUd8T2uKsKo1RsSLWXIfStGPcX7otFC8DFNV5d9x4Ig4YlLVpGgibmu1AMmM8/isxx2MK/72yR90b+mN37d9m1FyUHc3HdYhSuElPRxqjistUK/F58knSIqHgaZ8n1y7izoc6aR0DB2vyKE3rIjVFobHHuZN+jyttvl/rY+CC9m1WRJiTd/wcJ7hdng+4DeYctxWLxv/XlJZfdFNv9wsQSLMW9862hEwYAQtgp1ms8aFTteU5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JZMiFanLoqZP40imqjrEABNZVhNR9wkcWCfBQbKJJE=;
 b=BgedTJsU7axZSu8C2wLjUTF7wdk3qZZkXTTa0yZvSgv+wIsV4nTra2B/ZrRq6T0BRGX4k0v2SD4g4U0kL8imvWVVGlE68pKJ4kEilngc5stkJ2OIoTseJQHFPODusoexmhxnXYdz4AZoinovGeF8OgnhPcIQhwRgecH3ote6pBmaLud9MRicZlTc44g1VvExThQkfAvl+mIzb9fdtJfphcYiZ0LVt6FY8g6BSl8HYWl2YqTFH80/EIeGRn6L/GVDhQ04JrEA0apP71q6C5OCB3ePpiUV6FhhweZdoL6Bow3qExwgOCh48vClf2TFxRaGe6Z0UcncpWEl4OVy17wT7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JZMiFanLoqZP40imqjrEABNZVhNR9wkcWCfBQbKJJE=;
 b=icIjNPgl2G3X9S8NCpW45ArjTMGUP7UrEG6lSnskgjpJjUGjopnIAxQa0s/AP4HTN2EC6/nKQM6DSgLJdMb+glwbpcfxGjUro3mNsmqxszcsjTYyY3QlSMvJm3QR8LiYr45f+J6GkTdbkV9HLRsdDMXUSKwGZw0F2MZaho0AtAQ=
Received: from AS4P192CA0036.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::29)
 by AS4PR08MB7506.eurprd08.prod.outlook.com (2603:10a6:20b:4f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 08:21:56 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::a8) by AS4P192CA0036.outlook.office365.com
 (2603:10a6:20b:658::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 08:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 08:21:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pd8zNdSUj97YxZvEya9OUypv9jaXD3mZDTJaeGWf7+ZyiRfYC8yUM/zbm8KDfixtqhVR6eye2/+0aeJp2g+s+YOBtaySMspTpOCHlyEvy1ja4bocBtkb+qfaR1G1JTqC2xd+AvD/KKA1JvIgTP8be2QFzJlEqWXTMyUqlkWSvEbOzvYAKoY5klvazo/cFoNpvCl6kn6S0OC5w8ZSTJ5YKOTMn6eHYVDCzNwjMNEXBxGWkXHtWKNtqUcpZk1QD1cQ65Rsj8QaeKtkxhrt86ibju+qTajWkA1qN6TZt04ZhnIEibXd2GLodNsHR322KRqlwj1RhyZmsa9FTOMP+gH0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JZMiFanLoqZP40imqjrEABNZVhNR9wkcWCfBQbKJJE=;
 b=MXyw72paHEAj79wcnje4VxXqcwWxr98MjkZWocxXw3lx/Lj34nbWRth7u4kBnt2ScYMlSYNc3U0PUesUm0bpyvjMeSTMVfT0B8bLCcWlRASAfU/hSZWzM/6hVfOazCFEYpnG9GBMkVnjWVHgW2YLVssVydh02NM14i4Bg1XIbAAEtLtMLakfj9GgpRhL1ngzMF/sqwXmxguEY8IRxg+RNG8s8Tf/SeWmTSmOY9bJTw/zjvqGS0Jr3m8u9cmX+ZfbNjyS2R1+r7Uj0brmMItJSosWPPcTqFh0QciRa+xwbFq8C4RilaklsrYNdB1e67Y9YC8kyOoYsX2BsqkXWqqFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JZMiFanLoqZP40imqjrEABNZVhNR9wkcWCfBQbKJJE=;
 b=icIjNPgl2G3X9S8NCpW45ArjTMGUP7UrEG6lSnskgjpJjUGjopnIAxQa0s/AP4HTN2EC6/nKQM6DSgLJdMb+glwbpcfxGjUro3mNsmqxszcsjTYyY3QlSMvJm3QR8LiYr45f+J6GkTdbkV9HLRsdDMXUSKwGZw0F2MZaho0AtAQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU4PR08MB11215.eurprd08.prod.outlook.com
 (2603:10a6:10:570::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 08:21:22 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 08:21:22 +0000
Date: Tue, 22 Jul 2025 09:21:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] arm64/futex: move futex atomic logic with
 clearing PAN bit
Message-ID: <aH9J/9hZympA5ZoG@e129823.arm.com>
References: <20250721083618.2743569-1-yeoreum.yun@arm.com>
 <20250721083618.2743569-5-yeoreum.yun@arm.com>
 <aH4c8J3-qp9guE__@J2N7QTR9R3>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH4c8J3-qp9guE__@J2N7QTR9R3>
X-ClientProxiedBy: LO2P265CA0271.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::19) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU4PR08MB11215:EE_|AMS0EPF00000192:EE_|AS4PR08MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 5749f934-47ae-450c-9d53-08ddc8f8d23b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?6Vila4Aiw7S6FhIlpCSwaIjiW935nqR+swpND8kRY3MO1JLXlKFgMXAEoUm9?=
 =?us-ascii?Q?r78Y4gB/pkxk9ShYJ+LtvFqBhpNf3EA57hrXCj4gGhH7w+zocG8KEWIrFVGq?=
 =?us-ascii?Q?J6lYRFFTSPtVN/v/5tCKmBojjBbo6NB9vL5LAVv2nEKR63TMAp7rPe5DzuyY?=
 =?us-ascii?Q?yye+GV7YAW1ijiZ/lfMVpdKwsdH+hSVrAw1aB0It5PkfUm0/mTtoZOicobia?=
 =?us-ascii?Q?jmBptL18JmkFofJ7LeRpt+h4XptcwTNO20lv/e5kiRRQoFOpCAm9xPWYrEhR?=
 =?us-ascii?Q?HXC/1o6XJrt56SnIATq+G+3EZLhkCg/AcyLuW0n6px3yZrgNg/bUdiDonsVe?=
 =?us-ascii?Q?tvwyycDcVFZ7GdweqcRJb2BRsgj+WfjR/hI6XVm6xgXDjxM6b9WIZRLTNIe6?=
 =?us-ascii?Q?tu3p7RnSHzOqVIY8CcDb8fPQ8FXHkfalhuW+HaNqBzvFS57T30OpaxJk+gKK?=
 =?us-ascii?Q?6zQgy/HzXSveN/or2dJr0JmlgL1jdnmqSIDnHhLHfTOzSfZkjUtCvDK6pUk+?=
 =?us-ascii?Q?PUukB+lk8l6EtgZlT3g7Ef1tyIgQN1MUwJ6z1YBL/P0Ikno+Txg0K18TR/FM?=
 =?us-ascii?Q?MGePCPvAnCKCiLkmMLh0USLK49cLk7yXoHg4qnDMIawAg1YMe+QMBNrrahHu?=
 =?us-ascii?Q?dBQvqWileuN6UMbVU0Jw8kjWRXVUBd652J0RAIe0gDghm4QIOcAMzD82XgVO?=
 =?us-ascii?Q?67uZYezt+gotTd45KPG7fQ6v5tzeQdFIUHs1Eg2Ehsk3apom/PPPqOu3IyyO?=
 =?us-ascii?Q?fhFBHSC+uWAGj7vGFmAY3j0tI29iAVll08vfIW6MHQPIt2yw9lpFEAg2Mv/3?=
 =?us-ascii?Q?3G/j93dQYA5eAOaqfoSfRx/UU5aXcpYTMVQCSjVguzpwdNiyQ4q2rRvEcrrv?=
 =?us-ascii?Q?1lqkdM0MiGnSz0Fz6B+PgnbU28CvdEZOUx8rI2QWFLyT/SMKpxPa6px5vnd3?=
 =?us-ascii?Q?vjbxBbusJb9RmfIYqBB9tCw9j7y/VdZi2oo/ntLyQfxJvhV39QRWf17bJaIp?=
 =?us-ascii?Q?Ob1Got1IQYITjESUBYKUiqJbm2w0/wstjJGivfkWDqPO+rMTwjYtUtYqI+bI?=
 =?us-ascii?Q?qGsRKrhIhPitb+zf/y/vBBEd/i/+Ds1P+osWpC78U9sqqqPwWLUH5NGAbW4J?=
 =?us-ascii?Q?MzB8zBdz6E8SoXhExmEYLOgTohY1Sn7Alp+wvmTupKQASoqsfkhHrpos4qFt?=
 =?us-ascii?Q?QPygvt16rGRsMZ0lMRQUvOF3UgLR+YV083dIUifzhpVlDc00JGaI8pS3HiIE?=
 =?us-ascii?Q?0f9lC18o3k62Yaaq6lAIO0jGyhEmz+egpv9VLrbDaMhDJPnBiJaPxg/D8GTd?=
 =?us-ascii?Q?QxieiKXzSjRcf0qe29rRG308F6bxvS3QTKw8wuQKWP/41qhG1AYCVEvwiZxx?=
 =?us-ascii?Q?rFW5l2j1PIadjH9fxTMOY5KAjOIDc/Qq7bJznJXqfVYO8a3K41Jc4ggNyGJm?=
 =?us-ascii?Q?SRjwYBI10cY=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11215
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8e88326c-29c7-4d7d-4d6e-08ddc8f8bdf6
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|376014|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U6W3eGBkXlQpKFP5K7mx3j5mx/SrVzu1cem9tGyz/DXN9zHLjD1yZcTOoNMM?=
 =?us-ascii?Q?lwyMCa5NlyTXfuWhahWT0s+Q/vlgw6ns1x11GA1wSHZi/XjN9IFOeFrapKTn?=
 =?us-ascii?Q?HP4H8j9l5XeRCRnC49BPjm0gPcrXWqatTSKa10Hz+T1tevMO48TTCubEvytK?=
 =?us-ascii?Q?d5u5JKdsyAKdFW0hSNRr0Id3LX0ePWwPBsU2VvzFbwGq+CzlAYsbItBfgBgF?=
 =?us-ascii?Q?fnINLbFWmtSrX2FMMYuI/TAfG5kYCyzjuNyDnKatV1txYkgS6EvtG1y0QZXZ?=
 =?us-ascii?Q?1BiiC1ZbWFKDl3NmNf3Oviv3RU9AlEiaID7sHQYy5iqtPMbceyjJM5j0BetF?=
 =?us-ascii?Q?gFKTBWDCc30Rpg33td4D4cfy7UiQ5Q2OC3amPGGOnD9mLGlD8+boPYZwylXD?=
 =?us-ascii?Q?Tw38N4IKPqfAkPsCNkW1NJbOmbWRW09Hr+t0bu8G4hs4eb76FZ4I9eQD+qbW?=
 =?us-ascii?Q?aS07vP/asHPqzF9Ufe4shvcxUF7TwcFplDLwsFdIKB/jHpsoRlhGPowqsfOt?=
 =?us-ascii?Q?e+idIYC1wLF0j+MKkIaXVbDuzfDsYIJgAvYNAwFAGswT+od9pjhNPtcWI/lt?=
 =?us-ascii?Q?JFenWinggoKVo8a55l7pjMxA4EsNUAwM8FLJI77JLUkCbHo98a8dhhoCplR5?=
 =?us-ascii?Q?ioOt2wjPefJKZmwAVesDaWQBhIAyFr1zwRmicsTwweiqHqfGz446ktBswG1D?=
 =?us-ascii?Q?1rU9xNEadBn7enwJUjtV1a2VwMZGI4foAERd/MkR1sSrRU7OCxk9Ui4iAW9S?=
 =?us-ascii?Q?ZZLk+0KvP9JBXr+frCzgrToRWrUv/eXefYazQTracI/vDno7rzvqEvv0vXzH?=
 =?us-ascii?Q?GF/gLdgs/+p++vvukZg9FcsKnlYl5L52RoPE5ltn6JruC0t0kg095X8RKEkv?=
 =?us-ascii?Q?2bvxXKRdXdGF/u/+dEqGUL1SU8fELsomtbgsJwl1guhTBlDBB1tfCv/B97nI?=
 =?us-ascii?Q?dqtOI27xAbRSC9gsRuqz8uX+wZwLFJYQip6/TMoszVIGBHDSYkdGZhCb8+nD?=
 =?us-ascii?Q?WxlJSYHm76h961YLp5ARDUlSx/0ru7kA0AXMEaXUQlxJdH9mt6hyH9cMuPtH?=
 =?us-ascii?Q?tfkuYil2qvntdCe53+2ylA3R0Xn5dymi3JBwh6x3O1qC5UmXgDTQiDyqnz5T?=
 =?us-ascii?Q?HGYvYdSZ982qqMp1WA+2N0sdmAYO5wPHmOy9h9rPmnOC59o5jJ3taY8UTASW?=
 =?us-ascii?Q?TJSJXbJC8GX2GuumzkaBARIwozB/2wzOWNsAtp/mL5IwlDJInqdotnA7LYDk?=
 =?us-ascii?Q?FP1/cOASTJK7VAUXIQgGbqIoLzX3N57RC0dKyC50X8Kz8+rQnbbKbNjCi3of?=
 =?us-ascii?Q?gOuWxcZLQl8fm78NLsBJf+8hCilpHZQMxtWVhmLGIyiF3f8c9kTWipyZThp0?=
 =?us-ascii?Q?6rasI3VcK8MR0EzNlCSQIoT9ROuQChUB1784bnSe1vUy6RD0LTmO68S3qjGQ?=
 =?us-ascii?Q?TPXDJRB7CTL+Vr+kNY4QReAx1BVE43XEIC9ESnxPqDoIRMoro9tg9icmxb4+?=
 =?us-ascii?Q?wsMeCoDRcXenlbjE8GfTW5TiO+qYQaW5G0pa?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 08:21:56.0105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5749f934-47ae-450c-9d53-08ddc8f8d23b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_012204_605349_18DB1680 
X-CRM114-Status: GOOD (  15.01  )
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

> > Move current futex atomic logics which uses ll/sc method with cleraing
> > PSTATE.PAN to separate file (futex_ll_sc_u.h) so that
> > former method will be used only when FEAT_LSUI isn't supported.
>
> This isn't moving logic, this is *duplicating* the existing logic. As of
> this patch, this logic in the <asm/futex_ll_sc_u.h> header is unused,
> and the existing logic in <asm/futex.h> is still used as-is.
>
> Please refactor the existing logic first. The deletion of the existing
> code should happen at the same time as this addition. That way it's
> possible to see that the deleted logic corresponds to what is being
> added in the header, and it's generally nicer for bisection.
>
> Mark.

Thanks for this :)
As you suggest in other comments, I'll respin in <asm/futex.h> only.

[...]

--
Sincerely,
Yeoreum Yun

