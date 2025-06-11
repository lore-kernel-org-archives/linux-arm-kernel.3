Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7474FC71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSJsTs3h1sfi+Qi8LXntKf8o9n+pBn9UcakotFM9la0=; b=YZMrOKxRMbeRxEN+Uox6wxWUoR
	JWOagZjUfclIXOqTdlynlHc98H3oHCJ9RuhhQZE0xeB/tzMY4qp20HprSAXHrCpmAYN/TQ+qzJLC8
	yZWFVF736ltBqJSOS/4A0pqtjaOo2VFOvDi+nI2J4WnXhhBlsicmDs4Ia4QCt6P/DyGDn9nnaadOh
	4BYsP2WqkKjWbApDcTqIIGFsLFK81KGyOAsYJr/EVRZ5al9ADnrEReDIJ75+SeeqslWGtETqeZWGq
	mNYmmt1gA5S0ty5hnziWswEMOwtlkLltSPWIa8Uzl57WUcazwz/LHvHfGsVeiBE8OFOiBz64gY0IT
	bI6P/q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRXd-0000000B33d-2Fyj;
	Wed, 11 Jun 2025 19:55:21 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNPT-0000000APHH-1330
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:30:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IB+TVMMT43Wu9yCyUB4lcaWlmvXNWD8DUR16ec7DENY/stitfXREXiSsq05Lm5UbQ6iGIcY49cOKBPj3kT0/hcarBYF2bptNKb4ORbGSsIePLT+2/LFuR1OfM77+t75g3AufuBKdow/9k2CSZLcl9z4FzE0FnhCahrFnRrSdCkQS9u4P9gFwGXHDd2SbFgJ+i27Mql/fPI3DPYvXHk9XK+b3/5iP3QCk9TLcsPwlPtUHOgNcalpydZNKHW22nQfhgS5hdkyDBR8zhL031HMoHw/kEj9JYhuY97GspJ0u4srNxjBWVKzjHMFLMHiGFed+cT48H7qIfghQbYL+CLKOUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSJsTs3h1sfi+Qi8LXntKf8o9n+pBn9UcakotFM9la0=;
 b=ZN/LHmuTFm1bd90Hm0neTqQiYhkyCBK8Y77NMapaKsQk7yjiT+BEjxOnTK+5bFxVk+vbgQa7LMYeQWMKIORnNpr8r8Hkj2okaAty/2mRsLcRS5OdZNOG8QeSXEwiiD5YwVPjbSv5bFj/yS0Wdk/13zKZ/kJv96jCMfoHp/yPZtgwn7kSHvfo+B/XHi2Ipq5xpzN/54jmw41AUed5sW3zFkVKK0z7NpJYhwh8Y357IIgpfTxgSUpdyPcpopwWcYK6lIs4VLuohOBtsagaTmB4qBH/QwQqrkPv6iwhMTxwSlNJH6lyoJF3cWhKKtPcZPJIg0MBkprsRvC/EfYOiAMpGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSJsTs3h1sfi+Qi8LXntKf8o9n+pBn9UcakotFM9la0=;
 b=XtzOvqxYLmyRqwnQKvgJxiHAGtmV/AIGbjcgm0Kx8Eay6AFDHn30roXs2BMkY54HI58JlJDAc8ec1carZjUT3KBTLlx1PgECMe6p7IxwPJ0E5e6Kvd/awwfIXBeTiWNWTFOn28JxIamydwtfXktgE1aKfePwm6j40OwKpU6kJ9o=
Received: from DUZPR01CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::15) by AS8PR08MB9195.eurprd08.prod.outlook.com
 (2603:10a6:20b:57f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Wed, 11 Jun
 2025 15:30:32 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::81) by DUZPR01CA0077.outlook.office365.com
 (2603:10a6:10:46a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 15:30:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 15:30:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnixAZfymfW/kW08SPHRVcwUrFtnyrjOBDjwUU5NXwenj9WJmCfB0Pe12IjTX5AYRuMGZh0pdEI25O7TolNpFj20SDYNfbnz74AEteSdzphQ6Zsx75GKCKFe5vZeqExVZP5bjHVYOH2gqmTBDWNr+PBkH3fR8VUT28V1UQ2gdwusFooG+CHG/FjUMpHAYtficXEm6OLM8kMDN/ayb8xBZ9X59g9QdWwq43uSeD0ROGukP8uuUrKOaaWrZnLvONFsNXGdfKbKHTgstj4eubhhthgdzA7kZvUgnLh2jcOi/pkS4T6HhvBN1qRKQ0bj9AwgNaC3xio9Mee6uWgvC0p2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSJsTs3h1sfi+Qi8LXntKf8o9n+pBn9UcakotFM9la0=;
 b=QQ8kJIqoPwR7oH6Jg2DgPUkpUD1yIjbY2YD12SFgUwgghpmrnS1ZCeKDCg5TrE/g2VnNwxp0VAHOkHsyYLEESLpJqthtCiesbLrDSJUGuxxfULV6QLjz7pTwu6c+e01l2aP2enzNZd6nF5wkKcha4+uTE8P4g0dK4DuYDvWpANZSHJAC5bvlXpA/RmbXh8QEIit9vJVVzuRRU1MGjLTMO6zLg6aFY0B0R3XYvdfG1GS05oTh3QSmRmfINvonrC05OXxtWLYLm75ZrvaOA88ZOLOwKE2NpSnB5WJUPj7A0Vohaa8fC4MlcXhIWKWrr80b31mYA3XzkE/CKN+x80/ujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSJsTs3h1sfi+Qi8LXntKf8o9n+pBn9UcakotFM9la0=;
 b=XtzOvqxYLmyRqwnQKvgJxiHAGtmV/AIGbjcgm0Kx8Eay6AFDHn30roXs2BMkY54HI58JlJDAc8ec1carZjUT3KBTLlx1PgECMe6p7IxwPJ0E5e6Kvd/awwfIXBeTiWNWTFOn28JxIamydwtfXktgE1aKfePwm6j40OwKpU6kJ9o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB7686.eurprd08.prod.outlook.com
 (2603:10a6:20b:505::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 15:30:00 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 15:29:59 +0000
Date: Wed, 11 Jun 2025 16:29:57 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <aEmg9cNGAzqsrTd1@e129823.arm.com>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-3-yeoreum.yun@arm.com>
 <9a78c058-2aeb-43d8-94f8-987507a1a9a3@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a78c058-2aeb-43d8-94f8-987507a1a9a3@sirena.org.uk>
X-ClientProxiedBy: LO2P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::10) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS4PR08MB7686:EE_|DB1PEPF00039234:EE_|AS8PR08MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e0ab94-b8d3-402d-4d96-08dda8fce761
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?/RSEtOeZC8/OOlZSY7jQWidTvYpjh91b8cxhi9PjdCQ+i8hNXUtvbA2Uk/P2?=
 =?us-ascii?Q?s3bUaf89r6EmQ7lFQ4g/g52nNZW00I4sh8ahoJdKUc7HcJrA6iVbUPWF68WA?=
 =?us-ascii?Q?R+x4GSNp7uN9UrhSz+kJBmgTIXZU8G4BZmhHHhiIrEOvL92BeBw5fi8atAH5?=
 =?us-ascii?Q?2dr//dWVMGf14CbBzh8/gnwM4sSyBzEV2AeO2RvJWnPeSLuizWd/OkqYucRL?=
 =?us-ascii?Q?aUiYx6w6K/69XLA1l+/IIrDg8iwwDUQjFWBq7ujvYosv2uv8TcHfMVl29Sq5?=
 =?us-ascii?Q?d1eEp+6Zw3C7K7CWmo6lmoPkxr7xdv2w0FnASCW85TJxOXv7yXbzhneaRU/D?=
 =?us-ascii?Q?G7PM860HBgoGtmwPCAU1sl11MEZyiGw6AnemdfScZEmjHLH9d7/bb9mDcLDJ?=
 =?us-ascii?Q?BNikokcj06pKA2r8pzn990JxSbpHopUbpzeNG5e3aX8Em4bUTlDUUh4uI84Q?=
 =?us-ascii?Q?PEO+63g9kIkyJ59NJJ0sUGmpHxXhy4f9RPenEQtWAtELy8GNu/G38XJYG6/m?=
 =?us-ascii?Q?8p7g7KDYFzp17vbUoKQ5xdyd/5h6nbgyponEWrkvodwuztHwFDX8+o6ThAiw?=
 =?us-ascii?Q?HpJqGDxO2WqKXte+AoguoJYKipNiv51m/dd0Z3wy4RjYzrVlxgbFu2IdY+sz?=
 =?us-ascii?Q?fPgmTkECYeufFGAjstzYJA28J6Tei3vIkyN0xpMid3cDqCmPrE5ZI+wTgKx8?=
 =?us-ascii?Q?kZOgJUxSDIGH0K3146tfEChR7lIGt1g6gRqbVNpWIOXWClHR5J57WTLWLDvp?=
 =?us-ascii?Q?I5NYMOmflYC0fVTi4uppTGNQvX2mF34Sc+ZrMZyxz0FA3N8TrhbbRltuPWFe?=
 =?us-ascii?Q?VYNTGP2AyUiXT/KtmfwkpLrEHuQ7TpVRfBKl21JfPpmKf/bFlXAoIKbKu+6e?=
 =?us-ascii?Q?U4Ar1Fmr4TVXK3zcmoNc6+WIvFeFDVZuCwloQOZ8IfnTrs1EbIBqBInBMnGh?=
 =?us-ascii?Q?DQ8c31jzKaMu9e5VjwlYFpQXIHzH8rQIu4sInvYs7Cr5Yq7aG3rjyMbP3hg4?=
 =?us-ascii?Q?3C1LnjxidDaQO6zBlQeq6E/X+hXcT4dQimijtuMzSHdfewI/qcZJGK+srTg4?=
 =?us-ascii?Q?Y1YQ4ON8e9cDd6nz6x3Vuu5QGdj7M/YKVdytAmBc8VdINVZNYpgV/+2GslgB?=
 =?us-ascii?Q?lQrSBfKbQq334jyzj03qijHQuHI3pY0MX/Vr25t9hJiW9mwJp3aIUVd1U0VG?=
 =?us-ascii?Q?tXS0wcM9GnbNbeaPJBA6mHWdf/b8yGI1UU9Y1CjYdT7xTfWijD3K2G7YL1wr?=
 =?us-ascii?Q?tr+wIzSPHTv6XPDtksSqvLmCCmMmk3Xmm6L2Hkl4SCKxF0W7KBDSRtZg2NE5?=
 =?us-ascii?Q?sQNp1HtRcdxrsTpuj2C9kYDmRYZHVI4PWNdfBRCIE/PErAsodTkvsYeLOaw0?=
 =?us-ascii?Q?MrEHQwKkAqk2Fou7lFTQ5UvMSzJfP/Ls+Hs6nrDHOvV62SqD/w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7686
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2f93bf31-4dd7-44c2-44c4-08dda8fcd3e7
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|35042699022|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BRMRhCoX1tvYIFnHZkyILut9+dkOLNINxMCUKYKke9RI7BEoq06i4SuXyDjg?=
 =?us-ascii?Q?MsfBm6iLeETbxPanFIBhsiDM3lyhZWWOEL+HucT8zaGSXh6OLkoKxBmN8d8k?=
 =?us-ascii?Q?w3ELxo4FiQ3SEIbUFAFKAJrsSgwq+N0HWAQ6ehx49AateiVCLRpfqz8rOEPy?=
 =?us-ascii?Q?XOm6DXQ5s4/eB5+iycRBDbmjv3jN0IvL/maHB/IsNSFBqRWB7LitzdMcGnw4?=
 =?us-ascii?Q?mM3io0aIGYI63GrIk2Uk6REf9BGDCqgbLnqQz1G0sOvVyGxIWp7EkFyaSKGK?=
 =?us-ascii?Q?Ue1bqOhaVvladJfRBUvaTez8FIoo5kLeBPqkY+bs66rVnTs1MXqSe6NhAsi6?=
 =?us-ascii?Q?fU2/1CjD+AQZ+4LlIF/V9OHPUeVLsDJQ2m1jrJtbRZl9dfZE8xkyRk8ZDrkl?=
 =?us-ascii?Q?L7vNdyVxyB9HDqIhuC2JUdBipDC0zVG/OlBqQwRj2YIpW/zmJglmBrQjf4rX?=
 =?us-ascii?Q?vYhEys3TyWqZ+AFXNiJMDQ+WDCo/fG05B7Yfn7bdQ9b0ZWwC/Gg501+i8Ge4?=
 =?us-ascii?Q?nECjDmvECal5WspJ1E3s44mUh2p2J2Z+DZO8iFzaBc11w0/Xgokglhbmm529?=
 =?us-ascii?Q?Q31WcDfH1+SUpiO8Ym58ptawQtP2X+o/tYHb7bG3mSY8tuqL2eqQ2s9D1hop?=
 =?us-ascii?Q?rGxHivD+qn8oqvnIZ9rpZCmlVNa7zUcy0EIqyysVuTDp5Jc90uZouCIM63Yw?=
 =?us-ascii?Q?mnG2yQcz+4X7Afdjwz0FrOW+zijXoZLHLi1GNYkRlPkYZezRoqZH3EXuUuSM?=
 =?us-ascii?Q?1qGsVS/v3fmEMNmsSLkI3iMsEmxt1+yjMVM5DN3cD3wVPZqYnSS2CuaAI8+W?=
 =?us-ascii?Q?7Tmzcj42MBHjbuzXLK48+IXqj6vDVRDa2jICOBcDJOhtHaIYaXiBmy3Yk1zB?=
 =?us-ascii?Q?p8KG4WqBiFiDZD/ci5sp4EP5KmvUmY084UINnEUJgsgVE2SR5cgJUJhBTz8F?=
 =?us-ascii?Q?5vFDwxdoLR61aOZTotlfft88hgT+gKwDYTnZucDR44DHUy2EBSuT38X7OXJJ?=
 =?us-ascii?Q?9g7aOCCoh2YlgNS9qq2hfSdB1R2n/DF6zZLeFs4TDnmRFbDiyeTYt5ovEnt0?=
 =?us-ascii?Q?NXbVy+/LicdjwTCrkA9QSeeGC5EVYskM/LL1d6AAvKLyshP+BzxHqkM0pf90?=
 =?us-ascii?Q?5y/UQQVR/SHq3olYDY1YufraJKJvNG7gmuQBhnsdg1oqGcOAyC3/Uy3QFRpp?=
 =?us-ascii?Q?Z+R87WxJltTTCuqVpXk3FTn3P+526xQ+Xq/jq3tKzXVQr6r5qRaFeSrZSfE/?=
 =?us-ascii?Q?Km0QV8HBTaJfQRaxwjqd/Izx9pbsIn59dia6Zz9zhCHioTkxBvTNePKyzLtN?=
 =?us-ascii?Q?760QZXpUvdpoS5dhcXpAsnEAbdw+XTND6saFSUKpcxHD+zeIpVqmZ8HoM79Q?=
 =?us-ascii?Q?APH8zoRa1SyM2cKNvwiBN83sTSNM0jxWF0aaq0pvgsQtVYYM9dIFOnEQ0Gis?=
 =?us-ascii?Q?hjBY9MMHmcg0dsN2aJoDb2y7BdRQHZdqSZyQhXVen/TfNrVv+4EsObn7r3Mc?=
 =?us-ascii?Q?k1XCBHsgE9fX6gBatbrRGfomX08fMagujE3x?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:30:32.2625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e0ab94-b8d3-402d-4d96-08dda8fce761
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083039_293652_A945CAD3 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Mark.
> On Wed, Jun 11, 2025 at 02:58:11PM +0100, Yeoreum Yun wrote:
>
> >  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
> >  	 * for tag check faults. Set them to corresponding bits in the untagged
> > -	 * address.
> > +	 * address if ARM64_MTE_FAR isn't supported.
> > +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
> >  	 */
>
> Should that be "are UNKNOWN"?

Otherwise in here mentions the case when ARM64_MTE_FAR is supported,
So the bits 63:60 of FAR_EL1 are "not UNKNOWN" but I write it with
KNOWN.
Do you want to change this to "not UNKNOWN"?
or Am I missing something?

--
Sincerely,
Yeoreum Yun

