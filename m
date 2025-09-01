Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63978CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z37FTJlnwD93LQ/WmZSQ+y4QT0JB72ZEc+49t27YtsU=; b=XBgZHZN2hqttAJZa31xqKtQolL
	LTuU/Qzcpar+tIO1dn2Cs6aowy/PdnODrboMJXTDWGzCDJm2npfu9dSAZIIwRPyq3atUOMvAry1y6
	bNV2HquApVUKtJZAfeaUupvrL29iaJpQ50AlbIVokQIjOJ2cBEO/ufRfHJ2fPV1bH+raAKdK642nd
	UX7jcsG9j1+LqsqVtYKtAUCbPMnJYHjaQEab+tMh3DuSOPiRQW0dKojhLj6CH4y328C2oeOBRR5lL
	GtMNg4/vY71gt3ZqCxOs+UVVbfpGTANnqKOYwjUFNumBF4UqpBu9SYkKuGNPaiL284NEWvxDejhUP
	pd50otMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut350-0000000C71O-3U03;
	Mon, 01 Sep 2025 11:52:10 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1T1-0000000Brqg-1Cld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:08:52 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oe6pMBA+VwnwIRjLWXd2PXtMlWunBkO9Gv9e6uXvRKnPhasnnrfXUUz9FqjkAHP8wzXTeGm7RaR1jdnRDvowVEGdWrb/3cRguCRoVBB3mJ5RiAzXkZ7zovf50p2I4UB7dvWTkSdIHiOFOftNjnZTQ55Fn+IpQj9q1XTLaEJxA5LMsN2+81xNEqsSKFXo2gQ/uUw8j8qt4C0lyvo2frTjcCXgLO9iDyqDGEGjb7XvKW6QWpmM+IazFqKzDz9GnbYmMJa0KZQ1o6yWXrBXsCX40qZzeBmI7n2PfCtIe0RRkjhYEmBO8w3P3bhkW2BibAz/g77akFpMaWLXTCEik4SuJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z37FTJlnwD93LQ/WmZSQ+y4QT0JB72ZEc+49t27YtsU=;
 b=IXxUvrWr/xUQNKC9OYb973Ongo34QHxi49WiTIoq+07dATNd24kNisP6a8BWlySAMjr8zpMYfsvH76Gmzh6xWX4nOkMWuAHJdbnlPk7V/4f52ua8rJI3UPfbKs34vQPxCTgEeY+iUkNFUyG1B8PEQ9Z7g97kMB1g8PSWedYzTiwjjPTe/8WO8CbG0o9LxfJr76lP1nllK0fN2qGyjacbKSU5crG11VtY7kblfZKDARVbTrG3mAuVm7M0tem5UwnK/xSGHbzTqqUz96olEzge40q/hq7npTM6Ht+RdSs1bG/1mvFPQMj/kspREH9Sp4fO6TI7mirdWrJETl1WEKUGKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z37FTJlnwD93LQ/WmZSQ+y4QT0JB72ZEc+49t27YtsU=;
 b=I5eeInXm/6C9HDaiB+lufdZsyjL70VgFQ5WRdp15AsIY3uGznXrd4XelpSYL8E6EKZOz4TYltp5gR9KORhcU/ynHpU7eYEFH2cPNTMSc5mVwm5zn9u8fPeoxT41ZmeMRPSK15DAcELyH4VnIghkVlciNa9tr8z+jb2McQaGQYIU=
Received: from AM6P191CA0062.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::39)
 by AS2PR08MB8693.eurprd08.prod.outlook.com (2603:10a6:20b:55c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 10:08:41 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:209:7f:cafe::db) by AM6P191CA0062.outlook.office365.com
 (2603:10a6:209:7f::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 10:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Mon, 1 Sep 2025 10:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9GBSGcRhL8VWp6ALdJduufqEQLnNMO3KRsheBq9iq2wgdIGN+fjxkAzNlSzVbDa/Rf+J8XeHVrUTBjDSpoqCPncmTv4Qb25As/PInkVhx35KZ5b34BT9S+2z3GVo8nScFlEep8enE59h1QucI1pByE7baMNC+uHJh1ygZBl4YinMSd4Yjl0I8Z7wriEn+hHWHmeid319pQ05IjFu3JOGqRdMnc5NixhYIsbNcK2t894PutomD1iic8K7ELtgQLM+9ROhxvENxdGVw+y1BPbi2FchGvNnK2jdhbAwmu/q9ThzlZHLUFiXivdZeKZrI3rx+AINH9hA2hdgADjXLedQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z37FTJlnwD93LQ/WmZSQ+y4QT0JB72ZEc+49t27YtsU=;
 b=xsDJvKky5NdDQ0UcWzNx2Px8IOZtShTEpriY+qXv7AdqAeuI6YZ3fLMzQQpzdLVv6+BbwoYwl+23cZJGGs2Ka/UE0VRFtqW2FkY5MeQhrmbL0eEyMlNjnBhTx5S2KAkU7bYNcPV2PbISXCARtivelH/gw/qEf6DfdHINkiBnqD3OrV6VgZYbZnsvO34+EOrcLKXMsHPLvK8NZzYf5Ue0wm5z2aF1qW0k8eSF27a8TXeRbFFHZvDkp7Plbnwl62dYQMHUnpojdpsbSYd4BjrGL3dbd5yiMmnqZZ7u+758pk5lBxw0jCC5vvSqXbxbvDyCo9y0a2hpqDPUFiNydyr3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z37FTJlnwD93LQ/WmZSQ+y4QT0JB72ZEc+49t27YtsU=;
 b=I5eeInXm/6C9HDaiB+lufdZsyjL70VgFQ5WRdp15AsIY3uGznXrd4XelpSYL8E6EKZOz4TYltp5gR9KORhcU/ynHpU7eYEFH2cPNTMSc5mVwm5zn9u8fPeoxT41ZmeMRPSK15DAcELyH4VnIghkVlciNa9tr8z+jb2McQaGQYIU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAWPR08MB10947.eurprd08.prod.outlook.com
 (2603:10a6:102:468::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 10:08:08 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 10:08:08 +0000
Date: Mon, 1 Sep 2025 11:08:05 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	Dave.Martin@arm.com, ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 0/5] initialize SCTRL2_ELx
Message-ID: <aLVwhTQklJdADzc2@e129823.arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821172408.2101870-1-yeoreum.yun@arm.com>
X-ClientProxiedBy: LO4P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::10) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|PAWPR08MB10947:EE_|AM3PEPF00009BA0:EE_|AS2PR08MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 45940d68-0838-4ca6-fc81-08dde93f8666
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?p3CJW9OPDB+KZNWsSEAN1aQCNQ2GTkpt3RgMUVczLqfUaJQklxniZxulr5sW?=
 =?us-ascii?Q?MD+0rUwymvzurCLxUJk1N6bXq8Yp1otOmQK6OlUSyy7aJmkPOebTsPGAJVVl?=
 =?us-ascii?Q?oNHFKPrmbo4fzoHgtqthEF6ckNuHwPg66CFNCzrpZTUslo9rkfjGAM68r213?=
 =?us-ascii?Q?qjw3nfCfzHHAEJpaNhgBJ89h8K34YWzNF9nFQzLijplHLN7VmbQGbeI/mWKd?=
 =?us-ascii?Q?bknuxP5wBgSla39AmXwIWTif3hqwBOQLqPgbWNWBNcRwPcyv6VS1tx8Ecw6+?=
 =?us-ascii?Q?4JC9mCJ7cOppw7f6EwUPEZE00cD5Td/cRQo6gmFW9kgsdjQKmFGe7WI5xtWb?=
 =?us-ascii?Q?xNbpUzxrAaoDFV4MCNi23Zq8/CBMK71tXKryR9rPjXV6/MKCvEpZFnvYGcfg?=
 =?us-ascii?Q?Squr6JKWn9Oo0UfAz4PMZIliFxaCCanm81SKezZD4/6t2NWU9OMDrjPG3WwT?=
 =?us-ascii?Q?1f6str4Dxhzkaq8HyUn3pATDelODAEnf3f+y0NLY2pxQ2PaR+13qLjKcW81t?=
 =?us-ascii?Q?egJr268Pndk1tkYI+UY19cwbvdcynYNZmkwIo1KN3Ir8vV7TUgkQj1tCqg+b?=
 =?us-ascii?Q?52VO8spCU5KOMLxTD8opiX+M0oSkWOSfm/2ENYBm6+mByrD89aSBj870L18K?=
 =?us-ascii?Q?bOQtHCi5i7omtTtb0Ii4S8Tb42FtDSU3NI216LTFMKGlJmv3rdt3OzkbQNNy?=
 =?us-ascii?Q?5zf5cUap03qNmZR1lVeUvTqnmChvdYl9cLZWaTdyjguFjzG5a1d1BmTpJZc4?=
 =?us-ascii?Q?vkI2beonFjOnnqSBO7JeeAoCQymCS80k4d8hmKkjBa3AiK8M/yVcE1uDVP1a?=
 =?us-ascii?Q?PJfc/1xuW78HMEZi+dtVD8V8uyWWHCbXjqmp6/luqo1vP/qlBbDoyXEPhzC2?=
 =?us-ascii?Q?Y33GcDJHvIX5TkUrIZEcrC/ibR0k0kEe5zpk9NCW8151i0HvHV0vah+Q0K9n?=
 =?us-ascii?Q?3N9jIPrDFzgqg/VRz/MVfxjvTOwQcC4heCm4UgyhMOkXl2KH1VXFPneajtGg?=
 =?us-ascii?Q?5+y60fqdvJgw4HNVCUvE+mR9gBZOuNNzG9Y5l9G8OjPrp5qybQCok6+gKWwj?=
 =?us-ascii?Q?a77tszM3U5g+tRgjdZKqEcOMhzNwrxayMYAEDygmcvGshUYpJ6j1l93QASr+?=
 =?us-ascii?Q?bC5ALe8CtHEoRS8CTTAnvJZgtSvCuTKXxuwh7W2vyBQpAAH/MFCL79yfrnFV?=
 =?us-ascii?Q?0UI5SZrpVPsE/dZLRNmTz/uTU/iODzfAftvJFxaITvIc/98KezlKKQr2pe0L?=
 =?us-ascii?Q?uX4pBnG/gkIiDJBNPJy51uv8SDyPkhT2fqlear+eEvHXZKqkzxFbZptY3hXc?=
 =?us-ascii?Q?X8bz2VMmdfSGfi8pFzTm/PImqWsTaCOHeDqChA7d4ucWvHyQiJHABuG5WW5A?=
 =?us-ascii?Q?HJjYpiGR7JaBu1jKMF4izdO6tJqzU3ZuItGeQ0/vf5QfHqDd+PIoHNMUD0rE?=
 =?us-ascii?Q?TwJvdUFrIDIkAc1ZTDOTqPcz7FKe03/bIz6c6wyR4o1K5ei0FYBKig95vCyt?=
 =?us-ascii?Q?nhDZShpM6GeUJTc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10947
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8cf22e57-0809-479a-8635-08dde93f731d
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|7416014|376014|35042699022|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cCpiTIE/qBH9U7josLuL+eQMl/N0vDUrfvLT6ObR1nTB/cuvTj/53sqkknw6?=
 =?us-ascii?Q?dwer1sLsxmFK8JHes7OchUnh6Xj5RRhHed6sx++lykc3yDjVzhe64eSA5da/?=
 =?us-ascii?Q?CzUNa3TH8UvB3dXkX5StP34c5wJ5w2SXqM9HYnj7K9EKrxfJzYhaO3Y7xZ3v?=
 =?us-ascii?Q?Yt1osWNIwW2wH5ghTGN2uOIFg0N3/e1ECQoH65hWeKn3EHbJaCtYjNPuXihp?=
 =?us-ascii?Q?U0e6C7N1nPwPw11llGBObNeyO1afvFIIo6sYeUJ972VXWU9jdrXguABE4YpE?=
 =?us-ascii?Q?4oV8u1lqTvmVa2rWyP7WIGXm/tfhjWSN4Cfy7cnPd4lMmooVMj3r6trzyRyR?=
 =?us-ascii?Q?Fk9f6StV2imAHL0Jf7E5VZCaRG5O0233378oTeUZETW7DReKK7JkOxHmSX9I?=
 =?us-ascii?Q?7NzRE3H88G5P/Kgui2EwUbt6EA6wpfWI3r1H+L4mFY9oRB1B0e4kdxQNce0C?=
 =?us-ascii?Q?waK1/7uqLJ+AVt9bi2bnPk6x5VIOKJi0Go14MSJpGqXHOIA5DeQG7njudYIa?=
 =?us-ascii?Q?G3KBgBALf1lUp/2LRsGkCB8pyDD0xeCGgSdTo8DypiaMtEhJE0r/dHfT0jsx?=
 =?us-ascii?Q?r6zbHf3StV6enFLFt2trnHf/VgJIlk6K/xhBOtJcDy82TwDUatSh/2larIxi?=
 =?us-ascii?Q?zyF4OLC6NkVWQkerfgRBT2h9n+/bRNVblBsnsYyy4u7OEQTyVE+BXaDbn8xR?=
 =?us-ascii?Q?SMuRVXhghOmkjDi9H3MVIojkjAfXwl1mKBx2tm77Cc93A5A8akabqv6oj+7Z?=
 =?us-ascii?Q?DQoTZuxo9BdqzZ2ovaseiBcnuSy1+svIUM5tQty1ylc8C6HjShcJjd8nvQ7k?=
 =?us-ascii?Q?FF3lD+mJmMt4JW6Tzz+2BW2KXHdpBSTqFGRqx/QZpbaRIHwJQ9yb+LuCOdDj?=
 =?us-ascii?Q?iwIhCcfAI4ZhGbezKK2aK3KQI6CPj40/7L8wlc2hqtQiiPDCgFej8+jzdr+6?=
 =?us-ascii?Q?MXyOnTV72GUYZ5oYgLIxr0pdAZKeLvoItBgigavc8VumYSa+uta2ktCRneUh?=
 =?us-ascii?Q?xZ4ciCaExeTYj8RH2kESw1PBLtWS7Shp7esaSFHD1o/rLFwWqHkuBLoR9qVQ?=
 =?us-ascii?Q?/XmB/4qOgN4GWWcnbd0ZIiaCoxFXZCXWnous6DaCHKgd8e3y6cFx9ASzgBz4?=
 =?us-ascii?Q?Bqrb7bj1ZOzZ4Bec8goV8B5cSyE4po1UhTKprsnHqBWX6bDh8m55yVQs/HnS?=
 =?us-ascii?Q?+T+n3E6HKgNouQ9O268TaeVzLcoqrTJTZQ5ry0BkhVwZkT7rX1lSZ8cn5pFx?=
 =?us-ascii?Q?8om7yi/Tw02rWovDA4GzCUqagpLkgclmib2XamsoqrAd7q8b2jKfMkqIyRnR?=
 =?us-ascii?Q?Ed3nHAICRL0Y+qQaO/uTZvWLqCt83NhWaYCTny7Wt2vsUbLTb/TwQT5Ptux7?=
 =?us-ascii?Q?50nuXX1flpW9oJ3r6wcIr1Lid8uouVrjqHQ1wAaHQrxvwjSVM0gS8kMm22el?=
 =?us-ascii?Q?CUzlI4fZrcENPQushWBRPXzOTI2yf+IBCROOta23ynONBoZjKhZ7w9UpOG7L?=
 =?us-ascii?Q?Ga4HGQqVOenER4r1kLRjkyIO9OZY4wnNlszOyiW/UvA8jPP25EF4Dg6I6wWv?=
 =?us-ascii?Q?245fbukOPbdn5aDre4I=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(7416014)(376014)(35042699022)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 10:08:40.2467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45940d68-0838-4ca6-fc81-08dde93f8666
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_030851_476404_15F18561 
X-CRM114-Status: GOOD (  17.47  )
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

Gentle ping in case of forgotten.

On Thu, Aug 21, 2025 at 06:24:03PM +0100, Yeoreum Yun wrote:
> This series introduces initial support for the SCTLR2_ELx registers in Linux.
> The feature is optional starting from ARMv8.8/ARMv9.3,
> and becomes mandatory from ARMv8.9/ARMv9.4.
>
> Currently, Linux has no strict need to modify SCTLR2_ELx--
> at least assuming that firmware initializes
> these registers to reasonable defaults.
>
> However, several upcoming architectural features will require configuring
> control bits in these registers.
> Notable examples include FEAT_PAuth_LR and FEAT_CPA2.
>
> Patch History
> ==============
> from v3 to v4:
>   - integrate set_sctlr2_elx() and __set_sctlr2_elx() to set_sctlr2_elx()
>     without isb()
>   - fix the wrong register setting in set_sctlr2_elx().
>   - add initialise SCTLR2_EL2 at HVC_SOFT_RESTART.
>   - https://lore.kernel.org/all/20250813120118.3953541-1-yeoreum.yun@arm.com/
>
> from v2 to v3:
>   - rewrite commit messages.
>   - fix missing SCTLR2_EL2 synchonization at boot.
>   - merging the __kvm_host_psci_cpu_entry() changes into patch #1
>   - https://lore.kernel.org/all/20250811163340.1561893-1-yeoreum.yun@arm.com/
>
> from v1 to v2:
>   - rebase to v6.17-rc1
>   - https://lore.kernel.org/all/20250804121724.3681531-1-yeoreum.yun@arm.com/
>
> Yeoreum Yun (5):
>   arm64: make SCTLR2_EL1 accessible
>   arm64: initialise SCTLR2_ELx register at boot time
>   arm64: save/restore SCTLR2_EL1 when cpu_suspend()/resume()
>   arm64: initialise SCTLR2_EL1 at cpu_soft_restart()
>   arm64: make the per-task SCTLR2_EL1
>
>  arch/arm64/include/asm/assembler.h   | 15 +++++++++++++++
>  arch/arm64/include/asm/el2_setup.h   | 17 +++++++++++++++--
>  arch/arm64/include/asm/processor.h   |  3 +++
>  arch/arm64/include/asm/suspend.h     |  2 +-
>  arch/arm64/include/asm/sysreg.h      |  5 +++++
>  arch/arm64/kernel/cpu-reset.S        |  4 ++++
>  arch/arm64/kernel/head.S             |  5 +++++
>  arch/arm64/kernel/hyp-stub.S         | 10 ++++++++++
>  arch/arm64/kernel/process.c          |  9 +++++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S   |  3 +++
>  arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 +++
>  arch/arm64/mm/proc.S                 | 24 ++++++++++++++++--------
>  12 files changed, 89 insertions(+), 11 deletions(-)
>
>
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Sincerely,
Yeoreum Yun

