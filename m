Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69291C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqq7GSVVPICw+0grt+UvpYKm6nYxELeI1pWA86ZT8KE=; b=CY+vJ3syC4sUSlmW08nl25xGYC
	UukFa9BNA/DZ+ZX2KksAgfXAxyKdnAkeEseOOwXnT1X0mEEEGeGQPamcPI1kmszWmvhkk6vHftUo6
	PXiCXrOtP9holIyWD9Xp+Rs49chCDttk45xocPnzGGdboHmnyBdz7sXoFGHHQ4ClwCXBsw6tlX+f7
	otZJnAe3KUegQvEQleFOy+7R2WU+o0GIsigNK7N0HCqa51zIbfqxGS1gKzV3RxbtSm81tZe9D7QSQ
	ipsI7+uESgjvLM4LdZ0G6la9byNou1xCMQ2bzGeh3PDWGEftkK8KNizNlaLBJTJOKzRO3wYV/LdUE
	nueFEKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcFR-0000000BvlS-2qin;
	Tue, 14 Jul 2026 12:28:29 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcFP-0000000Bvir-3Ny4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:28:29 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BOS6GhcyK5r+7xblENPfjp3BAa20NtAWahGdNzUCpv9g5gMkdIJ1gvGeqqCbYVLQeQs2Jz97gvczPBQb3YtB9cNZbBCjRdncw5qBs+RmVvr3VAx0koDHrd/szQ+efmGIqAcLwkCSAUeOurK85XM5F+ezXB7cEu3RHnvO8E1SD2IaNLQn2YG8/nKKSPNgVGoQFgLa3q83HpFz04RBDKAa1WUJ9T2IjHTPa6dhzXs8hn6QmVPHH9zEaUNE4lV/qWN3Eed4zHCjhA9iIEYnEnGK0Sv0bIl2t/Fqdhp7fgAzxFBU7zveCxDmvide7MP3Mo1dgDSoNMFR4GSJt2kiQi9OHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqq7GSVVPICw+0grt+UvpYKm6nYxELeI1pWA86ZT8KE=;
 b=hX4N2tHUs5X95+i9BPPmrPnDX/gHMtDhcXj0IHX3bGi7S32emcBDQj2VPL5ZcO+lwQBpVuMdQLYR9v5bYXvzBD36pI7FBRra2Hf1bAls4R4blJzbvn7h9lmqz3KJziBat9nzr3rzy+5W8YaNZiYLP5InX8js4p0043O2vOZnDQWCsZAEwLC73hS+Hv26tAp8txYlrllsGolAPsxhXNhoZeIncxd+M4SIvcx+SSI+4XEsN2WK3jBtUD+BGy+rpQWAhvYbr7NlbwDFvql5BbqiFmnjAxl9vwqSIpGETPYffdcK3dHRSjRAd9fiXphnQ841VXIot6NU4qz2lqJzoyVDUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqq7GSVVPICw+0grt+UvpYKm6nYxELeI1pWA86ZT8KE=;
 b=hCON7ZlCon82o30A2A36w3qHtS53TT9wS7l349C1uP9KtdnYgXjHvo2xfQcv9BlnKeqKAEYMINLSSIh7Sgs3h5YG8JGwbxuyrn/MpcRKOI0p5lCRSoQZmx5K4jtraZWwUGnb5pQ3/RWMsJdSb3brV1T3RV/FmzNYEsCOepm5g4Q=
Received: from AS4PR10CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::16)
 by DB8PR08MB5436.eurprd08.prod.outlook.com (2603:10a6:10:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:28:20 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::7e) by AS4PR10CA0003.outlook.office365.com
 (2603:10a6:20b:5dc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 12:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 12:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sj2un2t6XcQgjVVskASbO1Acc6QYtDQcL/BwLjGcaEcAza/tfbsxGckAyc2A2M9Dm9l2vB00O6KoQ0s+wJS/51ACY7qLbfm46aYbDpDTIZQDVvqs++/SzHwa2Adp89yTax1TjQstx+N3SjPIzakRapeq45WLTcUCEPtEM9EdpZ7KYtMhX+nm9jY5WnY8Xff9plq4zwWPyH15z2Ybi+pMWZjpO87ZzANUsdp+yRlU3mTxjXmeAggliBA8ZiiQmd6aFHLiwxXMegvc0ibvxjgXZKh1uPU7izuQOJmxPMi/Xa5lp5qB4C4GNYcY2CCSY7AJPiJbicKgD63Xw4vR4UmSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqq7GSVVPICw+0grt+UvpYKm6nYxELeI1pWA86ZT8KE=;
 b=DdsjqTrtaw2yVjfGP0i2gTiJb5VuHueUINYrR0vAdVaKXoTthtiVrVYvtoRjAisF3X4Ou7yQ+kMIdmeNzp3afEZzHtHe9UEWMX+Pmfhlt8sshjf1QQzD5wduqarW4Sfgz53UvalDLXT+hojFCaGHVL2aXb9Giy+xfY92WbIu3amwMP2RomE6yimpBnzXteWMfptxZUx5dKPT/M7jvsvQ5NEDh+rPpgsrla4YL33lv2y39tgGHQyziWwUbUKwBl8Qgwj+azsY/i8goSPHg6Qmhv/n+i1+5zbZSx+Ws4mgZacl3XpMKOag0mUUlECMTFn/7aGVTB8/j3fArFVdCanCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqq7GSVVPICw+0grt+UvpYKm6nYxELeI1pWA86ZT8KE=;
 b=hCON7ZlCon82o30A2A36w3qHtS53TT9wS7l349C1uP9KtdnYgXjHvo2xfQcv9BlnKeqKAEYMINLSSIh7Sgs3h5YG8JGwbxuyrn/MpcRKOI0p5lCRSoQZmx5K4jtraZWwUGnb5pQ3/RWMsJdSb3brV1T3RV/FmzNYEsCOepm5g4Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7626.eurprd08.prod.outlook.com (2603:10a6:10:30a::19)
 by PAXPR08MB7393.eurprd08.prod.outlook.com (2603:10a6:102:2bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:27:13 +0000
Received: from DB9PR08MB7626.eurprd08.prod.outlook.com
 ([fe80::cc66:a76:1104:9f50]) by DB9PR08MB7626.eurprd08.prod.outlook.com
 ([fe80::cc66:a76:1104:9f50%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 12:27:12 +0000
Message-ID: <c687f89e-d36e-4d8f-8b8d-695f2a8249ef@arm.com>
Date: Tue, 14 Jul 2026 13:27:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/16] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-15-andre.przywara@arm.com>
Content-Language: en-US
From: Niyas Sait <niyas.sait@arm.com>
In-Reply-To: <20260710144520.917375-15-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0509.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::16) To DB9PR08MB7626.eurprd08.prod.outlook.com
 (2603:10a6:10:30a::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7626:EE_|PAXPR08MB7393:EE_|AM4PEPF00027A5F:EE_|DB8PR08MB5436:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ab3aca-1395-4f40-4bdb-08dee1a363bb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|921020|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: YAzx12dLVns8IceHIj4qyGGq63FCztC3lT1w/kzd8YhSxQ9yO3gMSIn1FO9FjSAgUSZINv7uOrF7+5ZuVO1pd2Z1aXKyEOgaFTtfc5G6XHaGX4vPjzqN/QQ7LHRwDLY87XfJ2zw28JP8GcKZNVIsPdlDCEunKWD5bNituGSsKAy8in5DrTKqa/cs1yKEigWQpbtI3HBen9uUNzxqATu+TciA5qYkw++vaQQMA3JEd9MElmwYsdd2d8Gt0L0uckCHoUisabJqwx8ZmOLHOEHhkhyzYLDnD/lXjvzBf+u9nIHZgKkOCEQ5lHtD4Dv3jPrS+sX8EmQnr75vtxYfiMiKlKCD4rMDOGM4e1utBIaHd3Spcc28WOA5UwipqGoOMcK/TqxNhYNMIJWcRJrJDS9qsiVPhYwxx5D3QACEruBtQNe1uJ3hhLgGUAGwYYHUud22Ub+onw040MSU3HlFCaMGKBhRE7xTW7kz4IB6oI56i4ZFwVgidN/bJJXetmQf8tF0m8IPBmaaTdlp29LtNyM+mYi2WMTEOpuhNHc/4WFdbQ0ajKBtmyas0uW3es9Kzbzu0RcIe7RTZb4V8MZqaQwKikCjB3MBzBnx6QQdsrmpLn+TkJOYDA51iFfDq6pVtNK7/2Y5d/TDk69GNLbdf2peBMw6gx7xvWw5dXdsWRJiPeOp1BLEi7vgUC4VzIitltzw8XlOyLNOzCFRVR8pfNUIBQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7626.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(921020)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: Gly+xZ6ArV1Ihbec2lyPUsGSSEhqxmeFvQi1fu5PmEKOmYbXwG99BfMK/HEN9SZpp3SkgyT2Vxhj8/txAArpmm8GHPKiXFt4Pl7lf4EQtALSIXNRpqhw00piy2FMCpLQuYPTi6W1J/QndlUGLn+gYVdlSpY2qqcqymt11WeUmFsq+p5M5ic6++m9/fPYAOPOkJdc6XzGp8bglTzx6mpcUSpRLV7F842CG1/3zdqHEPFkBwLCu8v7SHMmkM4h2aBIvIX+tUiRxLLW+EdzFinawiRIUtuflRq9ju8MMBMnt3gPmBaYlKawz1Rw0o02PFjq9Y4Azlq+S3llkZCV+N90bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7393
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7ca60cb5-14c8-40c0-da30-08dee1a33b27
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|23010399003|82310400026|35042699022|7416014|36860700016|1800799024|921020|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: nHyiF3v13nAsgBeQ+YfvNM+Qn2ZE4txtVo3/yOhy22PnpCGkWtnM3opfKC69ZUQVzrXf3RAu3ZIAWjUvouofvUdtWE2wAbikXFzxOYKCOJQNoYoR+5JC+cd2AM1jZhLE3kV7ZkH+yQjxl4VS8l1NOz8lHf7VCrTzKDsDa4TNCAQnM0M83wVZy58BM3OfdAZOFxLwWgAg/45owfS384pWrQTZtPc4RPzvS+C6K0mPIAMBMArNmS2CxaLRe7DUs8I53gAgwzfahFXcJIgAkPZ+DX8DUO+jaH0L3vEGC7UVzK+DcPfybExYDCpReTBXcHreThTu7oMLGbOU+QCUxYy+jr+60Z1tRdak4y22PsyRko8eKrfekT84jOvkhct6LYunr0gZwUkC8BJ4HVybpql1doa6fasOwJ+3aO/tqD20/U7osiztACgq8I6Cr6UWxXEu+6q35xApDf5v4vOEUZpoTsq/JRScxTihf5+lSypOseEuyuhtZeeSTDjcRCdbfZKDG265Wu8ILHR17eyJQFBLVMNGrkGn1Eq8yQoRp2y303DO+N1BjmzRaIIj6qzHN4f/sPiGt/2kpqi7q20ISG7UN816JLnMG7tKQNAB87FxQ+bHQsr0I1gR6HyddeX7HT2vGMyfWWiM5EOZ5Dp3CwE17ivqGaBfOER10zkLEpSBp4XjvdbFeJFxELsFKFURfzepwaYOA3KMQ0YHkUMln2PMw1CRKjamWNp/2+5Mgm0zl7/jDHm46QM+peVce3hahj/P
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(23010399003)(82310400026)(35042699022)(7416014)(36860700016)(1800799024)(921020)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SxVeDUvWwCG/XojfXcpXaCbFz5HwrNLl4MxqsQUESGbps6gyptDF6GLZRxw3pxdQl6Q1yuMxDxQAxlmu3maPPDr3DnvbMok/446YlS2hqzn9WfRG8zFQGhT+pV3BYlTTX7paBi0HeOL2yAkpxRV+j8dn+xrrAuxtaWgQKfD+AJDMzp8C1ECYEhySOsJUyTU0HcHnAVjIeIjL/sNROBTbUzCMmhzpVAw8ecJZN2ev03CWBX7qyTyJCXCZCbRvGp1Zdl/Bj9igvhQUgi30H2Bt3kGwTgV15jJCJP16rnf6Qf0+Q7Gt2vYq1NSIVDXNxC1cdQ/Hspf3P1681TKb/DKNLowiZYVWTbd6vxjgfqsRmGtQUMJ2QtmVSYOLbcUJDnA8rFFkwFHR60YjeqS3firYOe9p6pyP8WnfksyXWyOzalKm1W+UFyH7edVC6pvK+ZCR
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:28:20.1367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ab3aca-1395-4f40-4bdb-08dee1a363bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052827_902909_7092A23F 
X-CRM114-Status: GOOD (  11.82  )
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

On 10/07/2026 15:45, Andre Przywara wrote:

> +#define MPAM_VERSION_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS)
> +#define MPAM_READ_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS + 3 * sizeof(u32))
> +#define MPAM_WRITE_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS + 4 * sizeof(u32))

I think these lengths are wrong for ACPI extended PCC shared memory.

Length should be command + payload, and should not include the payload 
offset within the PCC shared memory region.

I think this should be something like

#define MPAM_VERSION_MSG_SIZE  sizeof(u32)
#define MPAM_READ_MSG_SIZE     (sizeof(u32) + 3 * sizeof(u32))
#define MPAM_WRITE_MSG_SIZE    (sizeof(u32) + 4 * sizeof(u32))

> +
> +static int mpam_fb_build_version_message(unsigned int token,
> +					 void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory *pcc_shmem = msg_buf;
> +
> +	writel_relaxed(0, &pcc_shmem->flags);

Here the flags are always 0.

If the PCCT advertises interrupt based completion, I think we need to 
set PCC_CMD_COMPLETION_NOTIFY here. Otherwise the platform can process 
the request without generating an interrupt back to the AP, and the PCC 
driver will time out waiting for completion.

> +
> +static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 msc_id,
> +				u16 reg, u32 *result, int mpam_fb_command)
> +{
> +	unsigned int token = atomic_inc_return(&mpam_fb_token);

MPAM-Fb token is a 10-bit field in the message header, so this needs to 
be masked before using it. Otherwise once the token exceeds 1023, the 
platform returns the wrapped 10-bit token but Linux compares it against 
the original value and will probably time out.

May be something like:

unsigned int token = atomic_inc_return(&mpam_fb_token) & 
FIELD_MAX(MPAM_MSC_TOKEN_MASK);


Thanks,
Niyas

