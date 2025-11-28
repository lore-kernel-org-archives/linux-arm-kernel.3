Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4448BD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdQO8hjipi5SpXiKWNCw3yilSj4Toh7rvCX0zkyivcM=; b=M7e73zvlqCd5QZm5qeOVnlBe//
	rMQXDEZiKt9jLMUBH2tjLgPL8mYR6hU1nzuPfetSQOu3B8TUPwGhmUC0BX65ESNhvvYfKIP5gpN8r
	UjM1BoFd/m7WbIzmDhPDDcotr5gXu/bkgFlxMnmkDaq4qwla51Sb03OORh6xH+0+jVQHwZmz/4d2K
	oOk6lmmx5fKQrMHLyNGhharvcMDcX0R130BdGoCMNHjTTW9MofLOmIBmDyZbPmFS750X0iuV42N/I
	tIzDIzcNmy6ewD4sUVLGB3UxzEP7g0R+20/rwp28HOnlw+WJ7BtPXnGOGPqHMa0t/jx6AnlcLBAjm
	EfQHtEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1b6-00000000dvv-35Cf;
	Fri, 28 Nov 2025 16:45:29 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1b2-00000000dvB-3iBO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:45:26 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JqnD9GsT5zssmie25SE6yk7VPjAHzOl+0V9AiSI+yCBeMDNHxVvhRXLvVS52cOySc8o/gpgUEQo7PM+J1uXiJDyD/iZI8iey3Krj9GfKA7PyhONQ0Txg7VF4+Ro6fold9jvZ4/kBsHV5zDXFsrhhNZfw5f7okehX+0iSYc8/5+u+WXZ0F6OxPIIKwE1OOymD4lkxo+QCXguG+dH/pDuxw16/Sb5rl1L15Dc2YnhPsEUgFX8ohtdSMR5v0hYBznpeVssM6BaShGwfcFXFoo4CVf+kZbrSNnQ2UOdn9oLYuyQavt0r0jGCH0Af+XGQ31JXwaXARCoX633Efsua6dskOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdQO8hjipi5SpXiKWNCw3yilSj4Toh7rvCX0zkyivcM=;
 b=yZWiVGCw2d+vUgzNQo4LVm6qiD6qprEmKV6J2GiENg/SqBRPOKjO5fUaRjhkszuIGu2ucLwB0ceWJXyj+TvLpIfagC0+39360ANXinz6MLKFxBLRGHWH9v3RqY4IEyZR7AX/mTC22S11S1IYT6Nplw6UtwRPUFqg4NbhHxjsxVOV8N8ZMM/S06z886D/zu9hKiVZukQfUNTFXOR5nM1WtFctQC1NScAkCyR4FOydi5cIW7PVOBl2vgSNnIVGL+ZOqzqH2PontMTv0Yf3xHIAWpUibysf6PSc51I+ZJW+GvnYvMrWR3SKyfNb5uHB7TzrhnKXHU+4dUwvu8qResslwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdQO8hjipi5SpXiKWNCw3yilSj4Toh7rvCX0zkyivcM=;
 b=XwkohJ66mbwSLPxbb60urX+G0W39rTAmghPue8CoZ5qg+IciTNn4NzaI3bjRCJ3Nu8I4gTlTJLitF28X6LKXMks0O33ugkwFQhWshyFkfWkC6tHzWpEmO+A5iP9H/xwUFept0uCNtvCEGo8+jjiRbiy52O8Ege+US0FOiw65hZQ=
Received: from DUZPR01CA0119.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::19) by VI0PR08MB11295.eurprd08.prod.outlook.com
 (2603:10a6:800:306::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 16:45:16 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::cd) by DUZPR01CA0119.outlook.office365.com
 (2603:10a6:10:4bc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 16:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Fri, 28 Nov 2025 16:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Co1wBy/iUK9ImIcAuyVbKPznwSBU8O/hiAjWP7aIX9BSAUTrzh0nLM24a7D12epopuW25U/ulaCU+jScgNmgCXB6kLFb5KDf3xIAs6HaNXAhr5YzUobYqfhg/jugBnSvUmgSlz1XaDePkhQSUDiBGyN+bosAP9SdN6D3iRi1+DSu68tZDXflGuoMrRnIS0ekBx4JKG5lLX7kHNUDH4DaJ/IWoYIepxRaqagkqMDw1FB7SkSraUkX6dXDhU3mP8YBBHS1Ka2IngHRi18D1V93dDF0q0Bqdvfv51F7sz07FojOb9ryphpILBICzbWHVyY7TSf2skrBELcsQsiGTS0dGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdQO8hjipi5SpXiKWNCw3yilSj4Toh7rvCX0zkyivcM=;
 b=cA4+/CF/sVb4TeTVVjn5RzLmrBpcYhQrO4+PYAzc7UnRlkDNwNsoFSELzG9+OUh6Yd09CSjzu8Ua/QFqsaXb8QrjC+HeSJ1MHxTmoGWawMbIBXJ1TYrA1wXo1WDHsQXjHBmmqvWvrjqiarn1mBsOi8kROztNNTv0fcRo61/7J3gjOdAfLaOGinaphYkIkbuArSO/03hZMbDBzstWJHwc4t50DzqiNQ2fGpTU2hUjNZnBxcLkRLpU+0dq0fZir5JwjhXnWduiiBOxBnI59TzpXRHYkDIZuNnioGaxNA2xp96tqyhMx/EGyuWvxF6taiV+8JwWBiLuSdhMIlOh1PCV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdQO8hjipi5SpXiKWNCw3yilSj4Toh7rvCX0zkyivcM=;
 b=XwkohJ66mbwSLPxbb60urX+G0W39rTAmghPue8CoZ5qg+IciTNn4NzaI3bjRCJ3Nu8I4gTlTJLitF28X6LKXMks0O33ugkwFQhWshyFkfWkC6tHzWpEmO+A5iP9H/xwUFept0uCNtvCEGo8+jjiRbiy52O8Ege+US0FOiw65hZQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV1PR08MB8011.eurprd08.prod.outlook.com
 (2603:10a6:150:99::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 16:44:08 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 16:44:07 +0000
Date: Fri, 28 Nov 2025 16:44:04 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org
Subject: Re: [RFC PATCH v5 11/18] mm: Introduce kpkeys_hardened_pgtables
Message-ID: <aSnRVJwuRWPmPxqN@e129823.arm.com>
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
 <20250815085512.2182322-12-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815085512.2182322-12-kevin.brodsky@arm.com>
X-ClientProxiedBy: LO4P123CA0641.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GV1PR08MB8011:EE_|DU2PEPF00028D09:EE_|VI0PR08MB11295:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c57e7ed-4725-411d-9458-08de2e9d8216
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?+fdjz6/vM+p+hXaavlWE5rOUlDYxjsAiS1G0hANpOccJdpIvHvvtDZnAU5/4?=
 =?us-ascii?Q?IpOYr98HY8HuorGUrw/edj1eHdkPrd7H4sB7YJvIuo0DRj9Pfz992vH1TYU3?=
 =?us-ascii?Q?wiPwLIrT1KvgwSE8xMEC+H1ujAr8Yzi+LZv6zAOT5y8gWH8CDDUiodjNgsqG?=
 =?us-ascii?Q?tI5QixffZQplOEIOYDt5OeoY+hRgiOsqK8GYeRiGjOqg39s5BbuHgvWGMy1t?=
 =?us-ascii?Q?pL5jbFEddeq2NtT9fzoQ4jmlWfDWeMPKL0iij6Q7RrKalLYYp48MmputW5zM?=
 =?us-ascii?Q?6hkVAUudxBz78n9IejzM36VIh1tGTxqPB1UvJN354gY2fu0wVRtSppmQtLfd?=
 =?us-ascii?Q?+4D39uoLalTrC29uoQ64E1C0N/VOAt41vqmINnI8RuN4cCSGPnB2Ltq5MER3?=
 =?us-ascii?Q?YLz49EtcpHjRpJcYQKarZBnR17GCx0YiGaCDRTwx3UZC47HfnQNRDwDGb1Gw?=
 =?us-ascii?Q?FOqcLcXYiN79oSbtbfI8itCI9Dj7/fJPTaTjx0avpj2HIMbov2k6nwsfVpPc?=
 =?us-ascii?Q?kwoJnJtSj6Gk57RTf1GX64eIbrRQ1zIltq9m0HB3PuDZnR3Zso26Ugt9cH57?=
 =?us-ascii?Q?KTNSupm6xS7qiBNWph3fyOjStr/IuU69vzbf0ATgPk3oBqhJZ5BNYTefqFre?=
 =?us-ascii?Q?ebxm/yMXe9K2X5YbGEszUfs3SSAymhDBr507s4Fk7pQnVI1oso5n4wQuIpwE?=
 =?us-ascii?Q?vAYTNLJq7veU7BBcCUGOIdIpktn1Zv00AzrdELxl+tt5ZMDUGPdWvfv7sz4/?=
 =?us-ascii?Q?zJbNZlVkYyFPyHm0dFCR75a5QQP57NdWnc92bPykX/E/AVd2y817HVbAKAph?=
 =?us-ascii?Q?SV/98IcKMHt8TUu+VERShhG6nhoSfXkQ7HBE4ZKMWFYECS4RWgHTl+JPnw7A?=
 =?us-ascii?Q?KjTYpL1K/SDQaDZKD08ZH+41OG6T6/5f26Cz6+bYz+jZsJY3DkV14Z1nbYGz?=
 =?us-ascii?Q?OyqShyX75FomRsekK31/3MXeHa0ACwQATq+8by73yJ7K1uoPkLrYvcUpbPFX?=
 =?us-ascii?Q?tq2eW4jnKIYPjC7jVv4MS4u4BtyxLgnEaBSrMQD3EppdkG8tCKm2fcocet+b?=
 =?us-ascii?Q?3Asxj4Ugu8yFozxaTtiY8EzwJdHejylTJaTRXozSTrgsk5LbhOXk9Kqaf5iw?=
 =?us-ascii?Q?3Jt9QRLLUv+LXsZ//Hh1Hoei8z72FZd4b0C3QEbOZZOdr7NztLEiMQhY+aYr?=
 =?us-ascii?Q?vY76VyjTFr/DGp9c74w9gRKlZfbbyqn2kaAbQNZ+BNwCwmmFRcL+ko6FxrlN?=
 =?us-ascii?Q?48BTC9426tByCcS/iaC6YtUjYb4xrAXS14C+FKTd1ugRyTLgn9GmiBPibWuw?=
 =?us-ascii?Q?M2NB3Q4QcxjEthF+U4njkO1nlV8vCE8OkXAv3gUgl+JFLg8Enu+3G9W+BdjQ?=
 =?us-ascii?Q?01FOBbIFPF+UVqGRQs4DJldCOSCCOoRRBx6v/cEURfnx96sh33guBq4NclX9?=
 =?us-ascii?Q?422C1sXC3HsMioGyy2KRIjqUDT0um1dO?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8011
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6eff4374-f4c9-4326-4751-08de2e9d593a
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|7416014|36860700013|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2PFJVnnKzunr410LoKw2Im7eaBHrAgvFXBSXolu7fJj1exCwxX7mGu+7K5WS?=
 =?us-ascii?Q?75IlDK0iWAaVN0wZxf9lSY/cCO61Aa5xIWTmX06OEFJG84/hswIqoKhh/6Ge?=
 =?us-ascii?Q?WCdyuocYf7cWbd2L2VpRT+Ha8tADuPSBDgISwS2OiRMKwYw00WAN8kG/dT03?=
 =?us-ascii?Q?X0eA5mI47yNcRVPXBRKcZp1UTvVeIPuWRQKxzPxBO7KEIRc5AH0GBphRANbd?=
 =?us-ascii?Q?32dC1I2ZfiClR2lLy0b87Cuy8ow+Ooi4CjAb+sAmauE5YwQjYiNy2+sY8mgX?=
 =?us-ascii?Q?vvrIAuV1cgEow3aKXzw2BsmyePTQjmoOFsNSGRzVDOKm/WftRqzoilnGTDhD?=
 =?us-ascii?Q?I3EbnVUBotwNJIzbJJEtf0lltTOaJV23EWYtRo5jnphE8VxDVWTepowfVeSd?=
 =?us-ascii?Q?jkLaJeXiHQqOWVhq2SAd0NSY9RUYvk0vshCyl5GMuZz1LKa9cnjqcwYQAO7F?=
 =?us-ascii?Q?hZSDsKNje/YXzo8ZT3hB7UBKysmSNjPIjkjhVIf9KeX223xbRowUCaa/GCJl?=
 =?us-ascii?Q?eWxzWqKp582hGYCB1/t8irxxsOn2c1t4szbNLlcJczfRvmtfAmpouTvZKFkw?=
 =?us-ascii?Q?RN1/aWR0W6smQyZvbyUL+iZontadWpDX2lNY04Il9YuPTv9T2Ms8ts3iaNc+?=
 =?us-ascii?Q?eK8EMUZjTiJ+JnJx1rmlKXkvZIeNHP5GIjZbd9/aSj+raRsI073etyvKCYCc?=
 =?us-ascii?Q?P9R2qDT2weKkE4rLdFE/8d+qlgnujVlcj7VYNLdUwHa6iwIXFqErGufy9hgz?=
 =?us-ascii?Q?Y+yIJUySQLXUsSsLe2M1mT/7TDqUgew2D3YvC1024iYkwxdj7jv1Gz9N3nfV?=
 =?us-ascii?Q?ZYaHyGLSlVWH1x1xXYaJsykfaDA7sOAKkQuGUXQ9FzBbzalpT/1H7TinWE/n?=
 =?us-ascii?Q?Iyfjthzer5bCRMa3Qf61hTvVFuGALRrkdbLxkJGKGOaaMYV5PjRBkK9UOIoG?=
 =?us-ascii?Q?IVv/pBsqB4+N+6z4P2HIs9fT3e8+LTWd+AMYA9m61z2p71DGnMvXgGPpOHNV?=
 =?us-ascii?Q?YNZ79xjlSZSt4ejbmQOExAFxtwyFxgBP3sKwEJO2DMz7T39RZ0Dt1qbD+F3V?=
 =?us-ascii?Q?Js4hHK8DFwLB1gKSODwW74zTQUF5wWwIc6BDPeguCO3l0V8l2mk+I/bKXQ4E?=
 =?us-ascii?Q?IIQdPtWZWYuXgRm0ImJFdnb9U9DGpob2wExbHtTJlXC/E3zxy0s7xUYe2QNg?=
 =?us-ascii?Q?/GXTQXZ593zkhnOoOQRoWY6IKx3WHZ1soBfdkGqRKJyhFmqhQBx05jg2fpPV?=
 =?us-ascii?Q?W569NhCTYBNfGBdpHaQEUviZSqVA7/bYfGPHeLAovNj7gkUPZWs9ir7ZrC2z?=
 =?us-ascii?Q?O7hXneifrKVs6W1z9aAgWMLhwCwjbjU517NaVAzCOJlhBtkaw6O2wCYA1WmO?=
 =?us-ascii?Q?GA5v3VG/Z9JCm44eVGYWoA/M3uIcNKU8BBmminLFi5tG3eywLh5wPqs16Vbi?=
 =?us-ascii?Q?XEiwA6jN7hyzeDCk+lgXBAObYViHywmTxW0YE6pGnK7Wm7imsrxvvse830m2?=
 =?us-ascii?Q?g43jcs7Bod4m3xCdY+IDlFnNDBN3AL5XpDhfALddKH+0TIjs+5kB+yz7WiM/?=
 =?us-ascii?Q?tkIsVJqPVpbyEYe9GsE=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(7416014)(36860700013)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 16:45:15.9348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c57e7ed-4725-411d-9458-08de2e9d8216
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_084525_029146_EAABBD05 
X-CRM114-Status: GOOD (  11.35  )
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

Hi Kevin,

[...]
> +
> +int kpkeys_protect_pgtable_memory(struct folio *folio)
> +{
> +	unsigned long addr = (unsigned long)folio_address(folio);

I think it might need to use untagged_addr()?

> +	unsigned int order = folio_order(folio);
> +	int ret = 0;
> +
> +	if (kpkeys_hardened_pgtables_enabled())
> +		ret = set_memory_pkey(addr, 1 << order, KPKEYS_PKEY_PGTABLES);
> +
> +	WARN_ON(ret);
> +	return ret;
> +}
> +
> +int kpkeys_unprotect_pgtable_memory(struct folio *folio)
> +{
> +	unsigned long addr = (unsigned long)folio_address(folio);

Same here.

[...]

Thanks.

--
Sincerely,
Yeoreum Yun

