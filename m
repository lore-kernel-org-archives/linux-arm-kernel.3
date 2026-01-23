Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C32AD72369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjRn17qTj5JIzb79hd2QW4bSxWOXcG7YBW2By7jO6Ro=; b=r+9+9IU6qzbyc6vCQNnqvV4XIq
	v3hNdHe26Dau8KUI8qq43hVUCcOPnNyF1/tPmrBV902AUpDgljT0gNig5Vuu6qM+2HOKvHKRWAaYy
	6b37zIDSET2Lkjt0TsEdSeG58YlCSjdbdTYaYcSIZKWPB+ZhEnOtJ00G/W6Gdc2mdzzCGa3iRbeXr
	SNzD4Zya9eT92aqBdiTqmbaTUJ1Qfd5NoHoj1zNf5kQGqYdbKmOsjnV2ZU7NfllMJceBJ2Baimj21
	QQIqkWofyj2m2phkqJJb+u5kT0h2QFJe3hIMAkENyC8CcE4up4tobq4Se3jR5e7YWjDOaIF9A+GA/
	ADhAxXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBR-00000008gy4-0ZW2;
	Fri, 23 Jan 2026 10:14:29 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBO-00000008gwo-1CmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:14:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0AEooozk4hMZR6x8Nv0A5GopYmjzfDostTy4eueuPkgxpRMfTDwKKpH53YnMO8Mb94IkSaHvhvg+BusBBh6Rvz5cKtFbrcU/meyHz8WWb42QFMAqdhTCsa7eYnULcLYJds8jwTBri4W8T2Lo1wKyzD9YSojVHNY2tOsaYGtc4inY4EPOWqh/6z+UpCocJDIUMasa9t4OzlOtje5b0xOxB7Ol+wFEu4xsuxPUi8qjqnCchV93Ov9qLgYw2BWeObOO3AC1TafRPvFEET0LpYwaqwQfITA9pDPYhw9pia5kT9ggGHBaG0Z+9XzSQ8YgBv8leNSClVNl4xd09XwfKhxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjRn17qTj5JIzb79hd2QW4bSxWOXcG7YBW2By7jO6Ro=;
 b=xaXEvOsrKGYC+due4bjDUyb7o+1rZY0ZC2Pey+HepmwuMu87ZOUeCq3NtdV2rd3zrTxrvgFSKE1th1IYzbAtosw5dyuc5PxbJMf/P+d/jMgcmbnKTy8TjtXIswh31i57vBM+DC76OFegmgUtNUlxDG6WRAJtMTVNtiCY4mLipCttbd0mMLnxT8+fSf9cET4lchvN/Ej+5z777O6vC2pX+2ffrfQkA2LGVrPx62gBxupNZPjwnpBnTVl0HC0Wr4YGpAJI17M5dTqMCewhxXWku9ryIk4Nyx6Fa6kX/wQzYeTyyTVbqgCZNf4vuC5s45ksO5SOKc8bPxhpRpIeC/n5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=dh-electronics.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjRn17qTj5JIzb79hd2QW4bSxWOXcG7YBW2By7jO6Ro=;
 b=augjAaoEUW3lkQw8N1sosV8CJwUClydgsBoHQ01TgoN/RdRk7TaoYkZMu1Nf+ZqaUUYgTIT7nNWSx7hJ8+y3E3VVtNNUrj7sAg0IHtROqzYCliYDum/8w5UHrLzaB2H0PSmF0mZszpMg3qM/SX2lSPvneBFRA85Ef1ZzqYBUTfgbQKmTtwsWAbMtyjX4W++u+3A2kPdj0j3W/OUjLANQDyrEivzLX4nVnFpSOrqXlQKQqPege/B/dVUjyz2hKGOO8ZmRvmIc4lmUDFkzIuJ9Ym1nZo4lKV/6PV6y3R4xM/IV99WnPPx+Km1HzLOXOcog3skXVZhIN7ZMIGc5a22dsQ==
Received: from AM0P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::27)
 by AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:14:18 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::3c) by AM0P190CA0017.outlook.office365.com
 (2603:10a6:208:190::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 10:14:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:14:17 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:15:27 +0100
Received: from localhost (10.252.18.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:14:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 Jan 2026 11:14:05 +0100
Subject: [PATCH v5 3/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics h7 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_uboot_properties-v5-3-5167929d5af5@foss.st.com>
References: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
In-Reply-To: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.18.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6B:EE_|AM7PR10MB3939:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8e7a83-b4b2-450a-ec30-08de5a682af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cysrajAxQm9rNWpTNkNaLzE4RUNDamVQczkyamRpaGc0cmlwb0tlc2dZUHpk?=
 =?utf-8?B?VnZsY1ppVzkrQTJBeklUV2lBWE52cUo4L2k3V1BsV0pKdUhjWVdwUW5BdGNw?=
 =?utf-8?B?VEQxc1hyVCtGRWY4QWR5WjdrRlhScHpDT2Zmck8wNTMwOVhzQjlWSng0T3NM?=
 =?utf-8?B?b0FIcWlwanV3dC8rZUN0VVRnYzBXcWRCVjYyK1JzZzZ6bW1LemlvbFJxdGtO?=
 =?utf-8?B?Q2hETDhERG8rMUVlK3FYRHd6WVl4S3FuakJwZXhDOUtHNERlQlI4eERnS1FR?=
 =?utf-8?B?Y0owSDY5dmZoYjVSTk43b0RpcmVPN20zTTM3VHh6WDI2MDFrOVFlOC9XeG9T?=
 =?utf-8?B?U1V4MTV5ZnMya2hlejRreGlpK2tiZTd5dVFJNTdwUTNRdnpPM3AySzN0bHlY?=
 =?utf-8?B?VHRoZmN0b3JlaVVOb0ttMGQ3ZXZ0MUJFT1cwRis1dVQ5WFNGQTZuUk5CUElV?=
 =?utf-8?B?dDNiVVQzOTFTT1Z1ekI4ZHNHYjJWU0lCV21QSjZiWTBvVHkzTjkza2lLSVk1?=
 =?utf-8?B?ci9kK2c0U29iU0hRUEs3RXJPZFJOaitrSFRPaldVM0pOd3d5YXRSNlcvTGVV?=
 =?utf-8?B?c2RpM0hFZjhVY3orbVppY2hibmJPZlpKU3M5cXpnZmNOOStGQldBTEZOakZs?=
 =?utf-8?B?MDhtV29rR3FZVlNCakNxcHVCWGM4QURFSUVkclhKcEJQRzRsZDVaMmJRUkZm?=
 =?utf-8?B?SGhWaHhXQjB4VC9TeUF1a3FrYk1XSDFjTDZPNWFDcXpJWWRIYk94ZFd1V0pa?=
 =?utf-8?B?Slo5UURRVWFYM3NCMFoxUStULzRmeStvTWVTRXdCand5TSt5Vmtla3kvK0FN?=
 =?utf-8?B?QmhvQ05XNy9vcnczYmRkR09FWXJMbVpxNjhlTkZzNGdyeURkcThJK0ZFNWVj?=
 =?utf-8?B?TTlwTUtSUVFsNTBGeDhwdUtaRjc3MWhIQXlIOEJHc09IWHVFVGN2OG8xaGl1?=
 =?utf-8?B?eFZabGlmWFJVclZhbXBvUWx2QmxqL3lOVjh0UW9tUUtpUVZoMUFlK3JmRDI1?=
 =?utf-8?B?THhEcElNdTV5Tmo5d3VZWjFDM1RVTG9UTnR4bEVEbkJodXN4NzNlUCtRU0tx?=
 =?utf-8?B?azZlWDJ1V1RWZEZERGE1U2dTdUtLNi9RWjhlM3NmK2VyTWRrWkk2NkVoTTFi?=
 =?utf-8?B?WHFncEUwYUJJVVJXN25ZcmRYc3E5cldIUy9iem9BR0drV3R0L2VDQmtBWTlv?=
 =?utf-8?B?OWI0RkxXS1JCNmpIZXpiVWtJZll4cTJoWEhHR0E5OU12Yk1rVFJra3cvSUZJ?=
 =?utf-8?B?TlNkMEhRUUpXK1c2cmx4dEFhRjdUYnVsWjFCWHNHaEF1R1RqaWRmaWpvM3hr?=
 =?utf-8?B?eStnSWNGM0c1WVhPbm01SjNncmNad2w5K2xOQnhGUTlTSzJkZjNHbUdsTCs0?=
 =?utf-8?B?WGFsTWQvRENzckljQmxFWW1Xb3JBelcyR2dURXF5SzlvRmk1NUZhRjNHM2c2?=
 =?utf-8?B?QktSR0tleEdHVWxYNHZ1ditTOFhrdExqc1BmVjRTeHhualMybm1sMnkvYzMv?=
 =?utf-8?B?bUJWdHhRYUk3ZnluM21oTDNkRFlod1lHeVBZUUIrTUhxTmVPN0lNem1BQ2Nr?=
 =?utf-8?B?RExKTHBZNUtxZ0hMREM2Smxyc2pIRW5rSDFqbFdSbDN4bFQ1SVo3eHFyRnNn?=
 =?utf-8?B?ZlluZEpiT3IyV3BaUXhaclVJQmxqS0R6c3dvSUx0Q1lTT21iaGxKL1VzMzl2?=
 =?utf-8?B?NlVlOWJNZmJnQTJkV3pxRGY3UDJiWXpHZGluVjI3ME53NXB5RmlHQVZGT2lW?=
 =?utf-8?B?dmlHUDZtSDd5a3N4Q1ZBTjVwOHFvVWJEZVl1UFRpOWFpNTU5bzduZFl1WXVY?=
 =?utf-8?B?RHBTY0lmQldMZWlZSmx3aDMzOTQrYnZQN2hpa2IySy9OeWJmY0pTTzRSMjBs?=
 =?utf-8?B?akJQUnZDcHpUbjl2SjZWaVJZQjVXbmJ4WHBWc2loQXNNNWMxdjRob1E4M0hv?=
 =?utf-8?B?cE9LSlpkQ2kvYlVRWE15QTZWRXF3UmQ2MWpLQkdIamlWN0NqaE9aNXFHM0U1?=
 =?utf-8?B?VzFJMmUzODlia2Z0bitidDZPMEN6TGxDYllxTG1lWlJrUHA5MlM4WVlBUHA1?=
 =?utf-8?B?VXkxb2lxOThidlZFM0FNQmxCRVpXMFRwYW8zVDdmUVZ5WEp3NFlsSWVwdG9a?=
 =?utf-8?B?MHkzcWs4VG5VOHdzKzZkNDNLNjdXUUpOd3EyUmF3S1N5ek1TL21mZ1hRdmgx?=
 =?utf-8?B?cHJPYWt4N2I3SFF6RHJJamFnN2JNL0tzWTdiT1FSODVTVVJvZk0vRjdVZ3lz?=
 =?utf-8?B?MGJLRzJweGQ2SDdIdmlYV3hlSFd3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: asbhLMhgYyttAjku9ceUqI/FVwTWtD6N/dqMvI5A0VkI5HcDUYGPb+H0SziNn+RcUIfzT7vYpcHfnsf30KQkGLk7Xk3oJgxHvSBE7xHR1etqYKcbqJ03CLAK48q0CYL1SJnMGJnlanrS0NzzqH8M6mEv5NxcsXBcQCgaDWQk6jJAlNDjeSEXJ4tCFH9cPVx04B43UqDVVZhP2Ie3V79T3h8WsfJGZSaUmbZkCUScZ2FDvdTYcD21Xhr9Xmg53izjPkfpq8Xoojx5BDzj89+9shtbVQAZWSrcVtNLD0TbPiHkFgBxUuhSF6fAJrhdqdY62Laio01NyBlcp52KIgRaZVRQoXc9fFci4e4po+0INFhzYqJJ4aZAS9eX0y30rwS95QEnhGFjlQOJ9OAbTkm4ieKyRCleLKXioqjtmEiR3sy10VPYsMmdQVzXvYUvQHL2bk8P7a4XrAZ2hwNoHzEyWuDlwd+7bDnHic8/FzkgQmWo5MUr+sSmcuamQBwQUS3+BSp6xOMN96NSkFO5galIK9z9woadHpRDFNZD018Owq2HujsKHLbTemplGEnds22wm0HwkqrLzfoyal8MMFCBYgRorhioKKelp7Gjyp7oWh2HEi5smjqczOIdILmvgdTIgFN5JYsB9HUQ6/U2ZLA210hHNVx79x613WV+x4SsPKOhDbChuhs5Wu3BHvDSN/j5RlfXWpqwd4A4RvSqMHir3g==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:14:17.6171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8e7a83-b4b2-450a-ec30-08de5a682af5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_021426_955694_34DC8F46 
X-CRM114-Status: UNSURE (   8.37  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32h743i-disco.dts  | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h743i-eval.dts   | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h747i-disco.dts  | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts | 69 ++++++++++++++++++++++++++++++
 4 files changed, 276 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743i-disco.dts b/arch/arm/boot/dts/st/stm32h743i-disco.dts
index 8451a54a9a08..368035d96158 100644
--- a/arch/arm/boot/dts/st/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-disco.dts
@@ -73,6 +73,59 @@ v3v3: regulator-v3v3 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &mac {
@@ -92,6 +145,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -104,6 +169,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index 4b0ced27b80e..ec525411431a 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -99,6 +99,59 @@ adc1: adc@0 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &i2c1 {
@@ -130,6 +183,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
@@ -144,6 +209,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h747i-disco.dts b/arch/arm/boot/dts/st/stm32h747i-disco.dts
index 99f0255dae8e..a481326ad9e6 100644
--- a/arch/arm/boot/dts/st/stm32h747i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h747i-disco.dts
@@ -91,6 +91,59 @@ button-5 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &mac {
@@ -110,6 +163,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -123,6 +188,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_b>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 56c53e262da7..8dddc70c37a1 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -114,6 +114,15 @@ wlan_pwr: regulator-wlan {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
 };
 
 &dma1 {
@@ -124,6 +133,50 @@ &dma2 {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &mac {
 	status = "disabled";
 	pinctrl-0 = <&ethernet_rmii>;
@@ -141,6 +194,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -196,6 +261,10 @@ partition@0 {
 	};
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";

-- 
2.43.0


