Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A61CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXU7RaJKTFUJXHYjZs9zqt2PIWARDWFouzrw4hHIjWM=; b=SNoW4t7XMZgFqa1XD+PXM05wcj
	3ECU47ezoTqi+ttY57ZdXjs4d4sitEmRcuU3eXtoQV9Ygm4MpqUij1JVCU9U/1yldcXOYOC7ebjVl
	QMpTNIjYARkKiPi+GJjTMzO7qIiq7DzGr6m6Rh4v/fCaq86qixB0sr7/fDnu65nSbhMMahBMBBMwL
	TNB8szPWNCemKmGt3/Fe36xY4ou/3Oki/aRAgy5PQUmNCiznc9qkRO7bSV8r+rWT9lVPNE+nyOVB4
	1hMXsMA1gp6e3w3CGSWKad7mAIY9PZE1YFIxyvLWPBsGyuuvXqmcr7G6VG647vyiAqVaYXopqGeIv
	1SbmWfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvwl-0000000FOe7-3BgZ;
	Mon, 18 May 2026 11:15:43 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvwj-0000000FOcz-1s7S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:15:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pe+Yd87VvJJhdzmoccRD1N6oy7QfZymHrgv7iUqaD0Dh/TsE7KGfWPKtN74/BthbciUyPUShovq8Hn4QbrN00lN6L3B7lBHjv/tKiteQK2uI1z2za99CT4B0iUgKoB4WLsK94r4mxmBZJM6OJQGF8vt0KNuwpDA3uPjKB3ykDQBLvcIF4fVBWjwa8yTPSbudMdAQuPFN7jyPrnZ5Cb4ZmFY9UYMqgrL1hGI1qtNLB1t9NzKw7vJTNPzMfnor/IxgSwnE7la0G9WbTLS4e+LFhogS0F6SYbWXsYTFCznr5UYnsA/+ixWa+04TFw1onSquqnkGDcY75dpCorX8a+baww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXU7RaJKTFUJXHYjZs9zqt2PIWARDWFouzrw4hHIjWM=;
 b=y7p9DKl1MfE2MpYq17PkJHaNgER0HSvOwaPrz39YtmnqKqOuhEZzaip3fPCAnNPKNN4FVqNz63yBzs0r8umRm5WLaTk5rsqXQwbO0vQG7qKrPV1oDftVUQ8tz3aXLldPJW5EKuPqKAYXGp7bCaucHjuG9koDN1HqZVIKvNcD0uy5oV8S1jLh2kSiu/lDGcbacS528MMu+JXdq0Z+BU+bS1qZR5xBf4FR2jABXYKMmAF/tyOPthETwR6HqlCOG7KuzgeTaaCOVXZTAyMWJf4GOoClueaP+z28I4A2GF0wd51eSCapfW7mo6uB1Jqe9Sg719hEzR0c/j+gKU7tAbzQmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXU7RaJKTFUJXHYjZs9zqt2PIWARDWFouzrw4hHIjWM=;
 b=JFGsI0wMvMuGQaDd9Cb8uxYiuIUzbUJM7kUpfW1d8l02DRkr1MIHol8DxplHwaALNT7Wzvhxz/EnqiYTO8z5UReGW/MEShCE8FuDs22laigPP1TcpX4XRQidoCOwq5vLzUQpTZXVg1/WJX8JteeP2bN/UgxUNdd75lFWKn4KnD8=
Received: from CWLP265CA0496.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::17)
 by AM8PR08MB6356.eurprd08.prod.outlook.com (2603:10a6:20b:36b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:15:32 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:400:18b:cafe::67) by CWLP265CA0496.outlook.office365.com
 (2603:10a6:400:18b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 11:15:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 11:15:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcS7URUsYWq/oM5aaxZ0KhL3psm46WnzPCIHX4GU7xcXaJsVY71+J2QI5R83gtS6ubK4jbOeXJEZNNIDarV3sqrXEnQIeZI3xYqjX04HWlchFQzUcj3ZjGyEDm3s5MQMN9tsv1A7RZviYt+6L7aBDSlTEM6HjuA3UV2b8N9bNoAWKPRMzCd9113dYNDfJqGDggWzuyjUCIB5EQcPSkDmxmhuLzK3RHfbR/c9Ac89l8NW89p0/GMqJcWH0IWNyE0Zks7k5E7CKMeXHWbf8qseEAmbeOCQJWT1W4sAEXFk11JOqBidakr6dmqeRQAtWRXg9snOEXwen03jsip6f9slHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXU7RaJKTFUJXHYjZs9zqt2PIWARDWFouzrw4hHIjWM=;
 b=upa5Aszj12k/bF9mGnlWGM83yQDjhAnsJYevcrXHxQGCcgoxc8YTLtJErltWdxwwqZqd69mlrTQyVpdvDdJkuUXaOrFi5nfwQhCftQjizPzlVEooE3mDd3QURWXoDEnWJpQunrHjdnNelfgBPe9tTq9p/KmeeAFbQk5/yf6+rxi9A8ay+cxOAWyN2xwB0kNnWS+13L4cnBy8P6Chg4VHkkl0AF9xoAGn0A0Kybzqw8HErW0sY23aM6dRsDaZ9Meg2lSBcpcgpP4uEMBMft4m8/zF1F/oAVSH2wQysARFTEW1t+pLYENt4sUXqPD6XvNJkUCoxki2dDTZ8dFg6MK98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 172.205.89.229) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXU7RaJKTFUJXHYjZs9zqt2PIWARDWFouzrw4hHIjWM=;
 b=JFGsI0wMvMuGQaDd9Cb8uxYiuIUzbUJM7kUpfW1d8l02DRkr1MIHol8DxplHwaALNT7Wzvhxz/EnqiYTO8z5UReGW/MEShCE8FuDs22laigPP1TcpX4XRQidoCOwq5vLzUQpTZXVg1/WJX8JteeP2bN/UgxUNdd75lFWKn4KnD8=
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by AS8PR08MB6600.eurprd08.prod.outlook.com (2603:10a6:20b:33e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 11:14:25 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::4) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 11:14:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 172.205.89.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=172.205.89.229; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (172.205.89.229) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 11:14:25 +0000
Received: from AZ-NEU-EXJ02.Arm.com (10.240.25.139) by AZ-NEU-EX04.Arm.com
 (10.240.25.138) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 18 May
 2026 11:14:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.240.25.138) by AZ-NEU-EXJ02.Arm.com
 (10.240.25.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 18 May
 2026 11:14:23 +0000
Received: from e132472.cambridge.arm.com (10.2.78.53) by mail.arm.com
 (10.240.25.138) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 18 May 2026 11:14:23 +0000
From: Niyas Sait <niyas.sait@arm.com>
To: <andre.przywara@arm.com>
CC: <ben.horgan@arm.com>, <catalin.marinas@arm.com>, <fenghuay@nvidia.com>,
	<guohanjun@huawei.com>, <james.morse@arm.com>, <jic23@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <rafael@kernel.org>, <reinette.chatre@intel.com>,
	<sudeep.holla@kernel.org>, <will@kernel.org>
Subject: Re: [PATCH 5/5] arm_mpam: detect and enable MPAM-Fb PCC support
Date: Mon, 18 May 2026 12:14:22 +0100
Message-ID: <20260518111422.3269965-1-niyas.sait@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429141339.3171205-6-andre.przywara@arm.com>
References: <20260429141339.3171205-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|AS8PR08MB6600:EE_|AMS0EPF0000019E:EE_|AM8PR08MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 572e2eb0-14f3-4029-5069-08deb4cec648
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|11063799003|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: eF2jCQxvJPCfYVHC3gat3FWf9EWELW4YsAgBjLz5w0ZVaVWw/tiTb+H3u3HibRk5UCzXeZxEKgiAxDJusfUD+q4G03ZDXO2M5Ht5bSfgoS9sCZ5JoDq06IcIO1lEelGp83aOfbmHoDn5K0eI5jFtcSUPQeKnQg7bbLbIQv0uoKTTUTVx7qJVBjHc626OkxAJ6pWYCG5EbIltequqJQgdDdGbBEreZvfeviQd06O4Fk4xrY1326RCbVciRVaT9vNsqURB4voYR9MQLAytzdKgP4LzTCPU3IgZqLVk98Pcl7yCvpaEXgpeAoIDFxQmJwxor6foV4vXn3/9MpHy+AzxjOgePkco/5g/7Q/V4QjkP3yXVws5FjIUBzZrKaKgC6BLb7G6ugH9HNZWP74j5jADWitWWmD7ADKbvVbAZ40ezka3qIxHQXkeFwGTn+g/aDKyOhlW7PyibyMSv7EDeWxU3O4LkuzsYRjxT1ARtLsi9sOB9Jdw3qbJDavAyUOsQCBV0qHYJvH8cWdUF6Fb/9TRorLS8i1Ea3vugTKyvuy7EKMKzIxTz+DUhBtfwlI72FT33DiZTmMO2dquIZn0YqBZyIVk3H4WFDYNyFo7RIEa13h57kszWlE5X4gqJ0xrCWcEapGxyKz7G0gsdsdkIOgdYgS921+LBxs9HroxJ6TCj6pkFoSJpSLcIknmeQqTXJZhD/KwrUVv+3D/c/aT7yqhxt2Ly51WNwbXXFlugrCsNz4=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(11063799003)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: d7RkoqMPHie8LqvwJlmDcpcd1LmoDrdnsxMbUw6B5Fk7xWe0ASrCen8uBt3sVCSaY1tC3QPStoty291mq9VBZR2BG78R242eervLiphfLwJZXSmFOpnT/445RsB0EYVZqX6Oom6dUJwd3r1adyub7m/mcOQ5Rxr3C6oGDIeaTIM7Mg7UBYJYMW5PcZg9lDRjbz8JHaBQK12iAfwnx/7HRou5HpOxjSKJPgUO8eiFeryY3dw0LM+662fBBeZNHSMmOUF1l1i/0I8epN2ceZCGOc6bohMG87283pxl/lc6jxnxV8qzxxq6nbeeK9o+A9+FY3kkJ5G2f5NWjT6arXC8Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6600
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2137985c-294c-4a59-fbaa-08deb4ce9eb5
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|36860700016|35042699022|1800799024|376014|7416014|11063799003|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: OThiUaMTf3hTZRLcbwG6x4we/PhyCrVAf3bR8NlAL/FFoaVOb6LZ7aV5jVPhBnVUH+ncEHV84NouyX3Ddla2TAsRY+w0HzH2gYAqAKFR6RZlQQUu0e5LqDa1s0RQ6K2aLNgC4aV3ak7A/i9wjqwIuc7hgBG441AS5xRzd70N8bEK27X3Tayg5tzlCgDPpwQ4VbroH4M9c6EJEpC30o3its+aAR5TDLPPQWp+0dhFwrQxlBsUCMQSjCXuPgdPss0FfH2XGtoIFVW6gzG+Gq14lcYe33W3FKooqcpdO/PhTrkjM5myfvHFGWHjcNEq2I8I0gHAi5gsBa7LuTAY66acc3/CZeo5oQX3qpD/VA2mPHNzqx90an00cVd0PLVNmPLvhfiaESy722Bl/UNuZTPXOW+Y+ijR3beTRhxNsvVPu3kzsp9xqIXqzts6Fa0R89K8G5cKb6Rw4aa5M+ilo2Kw5n45BMnZOtogq2KstVzzHGYTK5//bxjOLMlvF4Dyoeq4k11FLQg3b7mf9Sseo1TZUutT+I3FkqfQFOnR5yOOUiPnu8DC1+uCXRfqerwLDOCypzzZiRn0K7dD/wg19ZxHUjd5iGTJmCAbybWLBjz3IqaIrzWbA9uidrjzlgHtJ0R18uzmTiuF+Cnj4me1mYc1ZzDdpmF1dnLqrhGNLrZK5C6lGSfuVKRVBvtyOTH7BEsRcS4/Orsb97BmKFL/Lrwl6ZKyhlM3QWYy2TrCtEiWPO0=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700016)(35042699022)(1800799024)(376014)(7416014)(11063799003)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cD0ZAhfpPuKxky4gDADdVDJd3f4Of6dGQNu+MYMog6FV4NXQkIRzQwF4igxw7iLC7vAVieEOqpYU+/Do5watrZg6zP7dUQZVMosU2VJWqjp14Wtboe+gzFvzr7gqx6VMO1/UblG3HOPhQM+F7wkrLe5+p/uWlxYqIGjbhcOn5R9vRNBuVjoEnAD8TcZfRxBpeBLloFWDvTwYLqMz5lqnGnr31Av91dV3zwOM66pzRriT+Gz1OcBFurieeFTu39n04hTr7YwbZNsBy37IEliNXm/kQQx1tDgvSbUt9x1j4D03RpI2Ppd198be1PW4wNmKPrhmKMZiZqLIhdaPt5eB72c+0KrY04atvugsBSiPOjsdPHnchqB/vjKUVyRPwREH0gaHrUrc/LOOQqfGkhFz4T2vjBPyNF6bKntIyRdAlUdwasQXDfoFCJrlNQb5kv3Y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:15:31.5145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 572e2eb0-14f3-4029-5069-08deb4cec648
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_041541_491016_9AEDD754 
X-CRM114-Status: UNSURE (   8.87  )
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

Hi Andre,

On Wed, Apr 29, 2026 at 04:13:39PM +0200, Andre Przywara wrote:

> +		msc->pcc_chan = pcc_mbox_request_channel(&msc->pcc_cl,
> +							 pcc_subspace_id);
> +		if (IS_ERR(msc->pcc_chan)) {
> +			pr_err("Failed to request MSC PCC channel\n");
> +			return (void *)msc->pcc_chan;
> +		}
> +
> +		if (msc->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
> +			pr_err("MPAM-Fb PCC channel size too small.\n");
> +			pcc_mbox_free_channel(msc->pcc_chan);
> +			return ERR_PTR(-ENOMEM);
> +		}

I think this allocates one PCC channel per MSC instance.

MPAM-Fb spec. allows MPAM manager to support multiple MSCs and does not
require seperate channels per MSC. Each MSC is targeted via its msc_id
in the MPAM_MSC_READ/WRITE commands.

So for systems where multiple MSC nodes point to the same PCC subspace,
should we share one pcc_mbox_chan and serialize requests through it?

Thanks,
Niyas

