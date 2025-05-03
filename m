Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7A1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 14:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LI/tBN2ySIYxzGT+mGP3EHK3Wc0OOQn3rIjAWwFhxLc=; b=jPYkbNbiVt+e72mCBZmxO4xLaQ
	xsvyRe/0/mfl7tVgNImVPiA+CcYFfHlOZTyS8RpBS/pxyKlg2aG/iKaiFw/H7P/2h3MQ1AiqUAtq0
	NkCadNlyzNKE/k3aKVeAULWoQW/EXaRTTRChd3L1T3bP+AwEUttOKC1KzzPMG+/yNRrJHU8PnYyOF
	ybYyXy+DekpBvVPImol4Jbc3vm1qslPB2kUPgk+7uLX/FNpBB8BnZkvqGCu78wEbwaIs+X1t9VucC
	3/Xwdc8maEIE4iPw8m0hal4jG1yZPShNHjfrYIp6yJ7hO7xcqXdFgSlhnRuK4JKDUxKTlwS2M1n/7
	mPgj7hHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEHz-00000003zU2-3OU3;
	Sat, 03 May 2025 14:56:27 +0000
Received: from mail-db8eur05on20603.outbound.protection.outlook.com ([2a01:111:f403:2614::603] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEFG-00000003zK2-2Qfh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 14:53:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dO/3MY7XDwG9qgui8Vx6x51n6aQm6FQOrqprhwCpxJI31n1pV9jtjBIjN85vuM7Y8wbWK2I9VEDAjw1LeQXZkwtEXV5Huo8jDnZVqbIExwKgR26YinYmSDdubX1Dyf/X9+Mgtop352GxIee6HaUOo53A5u7jkhxhsCCdiUgVURmb6Kfvdmrxwm6NwSjW7w5RuhzsJeeMhqRg8vMuz/LtLi4wDNvgQc/j00TLwVexUlAPf66HQFQ+8a/tbwtkoDQENvJOyw9COZOT6AYocRpPaQE1BMT07UvxfOw0L1K70XEckTkrw7tl6yTkOittaoz4lm6ZFPt3nn1ggvB+cnKJWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI/tBN2ySIYxzGT+mGP3EHK3Wc0OOQn3rIjAWwFhxLc=;
 b=tuslgKKwXXXikMly0GkfImMetUMKH748qKRxu+MQrR8CliiE6wbwSHmawz6gp1upUyv1f8ii6+tbLfs+sPjzvOhsFptZGIjZgZExGS341J+fdr+elqFRoO9h8nbZv+xknocLbXx2oADHb8hUbY4dXM9XPC53N4CKRbtb6bLhi4/mRBISDkS3n7ZHAospi//Qp3C3WspDCa3JSCRvC6uGtxm+4te4/RQR35WoYvDVzUFjijkTng9dVdL1UVlqFnheLgix80mrQCwf01V0u7OSAg8LsfEkEFQItq2n709KvQG+UV1EAI1/8YSU2KcpKYLW0kZvdkr2LkoFf7gV8VwhOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI/tBN2ySIYxzGT+mGP3EHK3Wc0OOQn3rIjAWwFhxLc=;
 b=EAlzzMIrI6XzFA3OZ1V+n1qOhvfryyUcV0DPOIJ/GC/w85F2x/dXsjXFTIgVDeL9LjtDZi9RkyPtC4+VEhBDOF+Djx+gRl/TXO3NT6T+KE+LR4QLVtY6aEnVDNLTJxxXMnKWJmtUexVomD/uQbiMx+DvJl26ArLgxaKMhrKd2mU=
Received: from DUZPR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::7) by AS2PR08MB10010.eurprd08.prod.outlook.com
 (2603:10a6:20b:64a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Sat, 3 May
 2025 14:53:29 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::d9) by DUZPR01CA0044.outlook.office365.com
 (2603:10a6:10:468::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.26 via Frontend Transport; Sat,
 3 May 2025 14:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Sat, 3 May 2025 14:53:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBT6pBqlG+Vl+wBoDmGObaMrBo2e2qlox6J7ERoMZDJh7ykHrsxLoqglgV7N2pAu7TosDVIWk1l6XRy6PS+ec8fzKP9c8F7qaSIVSrG3ciLpuwMlREdHzEwLSoCA8mbsCTS/6xGCnxpywuubJjNEue6+Of7G+uJW7f0+ZB7j6/h+PD3WiO/6L7KaChfRlcULUwgdLuCeeYdPTJfL/rKnzG1Q1EVkns0WvifO1jq6/9NVMz7J+Qvcrkdd3uN6shnIdQFqnRQk5jaZ4YldJ9DDesOGO/rY5fxiShslQRDeFLjqAtgF909T8tZ0nJFO+aGxoQS+tV2ncvSf58aGe1OFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI/tBN2ySIYxzGT+mGP3EHK3Wc0OOQn3rIjAWwFhxLc=;
 b=cNevGUMOoBMezgnv7j1X8wti5gPSu/du0PHVQ/bvD9qPvG0TTyzcs90JVZE185FSkVUCMXMm65o08qhmRAujZM8o0+PS/xmm+7R7YAA8V5oTfnJlHmd/WtQE5cKBUxoFjBrUEce9l/fCyGqvuYzDftKQUfW9xwPTkikMsiIwV5YlSZfWMqjq1p0z7uYed0rYuHgIdFR6svKiByKAZSdcCmqdRY8BPyg1tn9wk03yds+cSFtz5n4glgNBVOouewRzP0t9+28iu/GmqxFo/yHU5S9wxtSUTMn1NjqeslpHW8Mm/IgbYtgJNfeBQ4b7OBqAOTco/4VpKhPUTCweN7WOuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI/tBN2ySIYxzGT+mGP3EHK3Wc0OOQn3rIjAWwFhxLc=;
 b=EAlzzMIrI6XzFA3OZ1V+n1qOhvfryyUcV0DPOIJ/GC/w85F2x/dXsjXFTIgVDeL9LjtDZi9RkyPtC4+VEhBDOF+Djx+gRl/TXO3NT6T+KE+LR4QLVtY6aEnVDNLTJxxXMnKWJmtUexVomD/uQbiMx+DvJl26ArLgxaKMhrKd2mU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAWPR08MB9638.eurprd08.prod.outlook.com
 (2603:10a6:102:2e0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Sat, 3 May
 2025 14:52:55 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Sat, 3 May 2025
 14:52:54 +0000
Date: Sat, 3 May 2025 15:52:51 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, will@kernel.org, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org, joey.gouly@arm.com,
	james.morse@arm.com, hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, ryan.roberts@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Message-ID: <aBYtw6oHZ4eqwycv@e129823.arm.com>
References: <20250502145755.3751405-1-yeoreum.yun@arm.com>
 <CAMj1kXEoYcS6YPU0mBdvijDRK6ZVB7mPYZsCVpz7sYotabrxtQ@mail.gmail.com>
 <aBUHlGvZuI2O0bbs@arm.com>
 <aBULdGn+klwp8CEu@e129823.arm.com>
 <aBXqi4XpCsN3otHe@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBXqi4XpCsN3otHe@arm.com>
X-ClientProxiedBy: LO4P123CA0393.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::20) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|PAWPR08MB9638:EE_|DU2PEPF00028D05:EE_|AS2PR08MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: bc05f4fd-a7f8-438d-0b5c-08dd8a5243fb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?OGuub69JPyA+h4c01TNF+oYDug0kqhU+hPO43WoERm+N8JABN2+EaN8mTGsm?=
 =?us-ascii?Q?RIks52LFcKgvn3lSC2rBCyoGK++sX/uwDBga2nbLzs2fnvNybKMfFEjPofgF?=
 =?us-ascii?Q?xDJ7S1m+ApqSDJKXuD69cQC3gkvltTWWTkVVqTEhjveFtiYmR1BdcdF1vPCP?=
 =?us-ascii?Q?nD/TQK2yOjXPOTu2Mzxpy7RDsqQQxJYaOCA4aqLiqiwouoIN4JNG0yqafBdu?=
 =?us-ascii?Q?aG+LKBcdiNqJTHOBMGsRSNO6LOz64J+TEdeoEyfsWOspSNOZ2v444TimAbCs?=
 =?us-ascii?Q?Uslv2TaSumjJuWm9HhNVv1606o0Ni5X1vgAq5D+aawpZAeTDeonxyDGxZ/AG?=
 =?us-ascii?Q?LHkCTCyCqq6nsBlPYKoa2lQzKPmTzMdYFjvi2tQsiYtVLgcPGmgYyGmGaWG6?=
 =?us-ascii?Q?jmBTxIVqIv4ItBRpZ2FMZnIcKZtDGChqpPeCvJrLIhUtuoiEGradouq0yukf?=
 =?us-ascii?Q?wqu/3zogbYqjrFPjsX+A49OA2GXKPAd81qA2Vd5UtMCvncrY2Npb3SQ1lrVs?=
 =?us-ascii?Q?ecIlJx/0mmyqCB/B610V9/lOLm0E+QnR9xeSM5KaKWMuWDc/Z8LNquRpsajV?=
 =?us-ascii?Q?qG5gctl/qbEb9OSTAjKNTFZ7pDSveGWaG7ex1gv+xnh2ghFXaTcnakqVdTe+?=
 =?us-ascii?Q?sjqLilHO8q+MBYRy5Ziz3rm34IWJhqpEmOtUYrGPzB3APeF6SivqXUbH/UWU?=
 =?us-ascii?Q?ztQMxM34QiHovYC+omDimNaDoR40BXUFXi4PsmdjUnf8q8KN6zrID2Qvrdpo?=
 =?us-ascii?Q?qUmHxXENcppUKqjfxjTf/kC271Mzm85TAbw4lRrJJnbxSlzOiwHr3N/iFZ5p?=
 =?us-ascii?Q?1CWystTMfljxxBTdtDnkOSG3qWwu1KZySMlD5lspLC17ViOpSXpLETvOsfO8?=
 =?us-ascii?Q?ii+XUKnRuPw3ktmGkbJpaB0qBqfEwHkrZ9qpU9vgYDExuKArchkhLBdn2eoU?=
 =?us-ascii?Q?rZxFzVuQZtAxdS55obUyJVmHCVrjOhKxdGhpzTyrY2PRhx+XSSAewYBw9rKc?=
 =?us-ascii?Q?45+NBhLG5npS6b1OFhKZzDxaEDudaE++neydZIyYqABI9FJPpMKg1Zqvu/9x?=
 =?us-ascii?Q?oQvuOFUzYXlAvGMsODbnDeng70H1Di/57jjlw0RYM8lFDs4PvaLB7l0I/07n?=
 =?us-ascii?Q?OJOmAMBpVFf7GYwELI+gS99rev6vSM2cyWXpP9t/0tq3PN87SiKeK8ObnrXs?=
 =?us-ascii?Q?pj+J6S92Qbm3FoT/M7bJTNFWjIeCF5LhqkjuNIG4+rz0h8CkP8DSZnLUKxKc?=
 =?us-ascii?Q?MYsizY1j6mWqjoYtqEKuo7FPOgqw1rJp/2o3Ti6m1DkdaIFFTMvhNuWEl64Z?=
 =?us-ascii?Q?MDuP3kRpE0M79SIUdZiFhhiuqMNIeJfs3+SY3GoZ/fscfM4XIlQWcTg3ey6p?=
 =?us-ascii?Q?FMKkoKj2HoeH704uuP6MYWs+knvzDO+4EPPwUk8UEAOPOOEaAU2gittiG5Mb?=
 =?us-ascii?Q?xsohNfSJ77c=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9638
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: deac9132-9ff8-41b2-eed0-08dd8a522f68
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|14060799003|35042699022|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZJDkDh2g1wOZmyO55MDWQBoEgc5t/KNnhyENbcyqve46kOwG/f8h+7qUM/aX?=
 =?us-ascii?Q?zGdxpDW77zPysYNRtkE/IJzZyCcS1mhY+rruhcwtrgSyR62JEPIMWGA2aIdz?=
 =?us-ascii?Q?tRV+0bQo6s7wpGFcDWtTj/QOEq0k4ABcw0BQcHBxRI3j6IosvvHgvpxuVmwM?=
 =?us-ascii?Q?3nHU9/skxM76tTukNpB12EA3wNSCWuJNTpxKuImy9PJhpKm4cK2W4TS8VDiF?=
 =?us-ascii?Q?jSXRDIZHbN7Jz5rrfw273B0d969dZV5SbqA5nGMennb0X1AtK6QdbT5kgKEy?=
 =?us-ascii?Q?JuCbEomGhj/7kL7Fv6Zq6EB5V0vxOKCxz68v7Gp90clvlU5T2GFIMg6G0/+d?=
 =?us-ascii?Q?e9T615hrgkZnSFIYwZ01qm+kqG/3AMpQylqOuf5ZopaZUtl/MwFBJK+jYrBx?=
 =?us-ascii?Q?evJb7KsPoQGnXbagY2U3gOc47lnfe5Ghv5VCfVafZv4Iqnn78BU2SueIm+ft?=
 =?us-ascii?Q?4BLRLR+PYIUTlwM6E4hpvi+HRl2miU+QiXYOAg5K6BW7NFBli4UHOkY9abSm?=
 =?us-ascii?Q?xj70k5rN70faDt4pcHEZlRXQ8XZyiNlft2iLo9osMALFOmqBJfo2Dt/T6iBI?=
 =?us-ascii?Q?Ae9vmXmLEFS5/6n0fjHoFYS395bi6Y/cYTk0br8UZ2TZh7kvV2VO/SsLYMcO?=
 =?us-ascii?Q?w1lRjcLhVrzZPKH7eLJ0MaMY7xhtUN+TvsfqsmR8scdVeHFT8t7cP/NJZU+z?=
 =?us-ascii?Q?f5s38MgsGW14fojPe/LG5iCqRQd9z7yFORhkC+ifl6XQdGIQEaFMhdx/xyZt?=
 =?us-ascii?Q?f4QM9zT28HJfahTT+eQa+nvNaA3HqsonFMDnJ6iWOnPupUubwFE5BI//Wyho?=
 =?us-ascii?Q?8O7AirddL6UoJlzFPOSGs2E/eBJLKkRh24QI2UXkcRKhsfWWOBQ6pdtzkvNu?=
 =?us-ascii?Q?RqCJp6bjhiZkOkNIO4xV8j3uySamqIAVsvxmuIMXNFWaECAQBpOzz2AzPZsI?=
 =?us-ascii?Q?9RWdTghVoJySDxRp383nwPgPrNt37IGpE015sjx1Y+VOKhN0aXnqYegvcnCL?=
 =?us-ascii?Q?PFxF6OPRtYmeYS9vMhotkP2CUCvcagJ19+4RK5cgg7XceyGX5U5e1CRFeXmX?=
 =?us-ascii?Q?In5dGR3j2UUupbgUM4NjfqBUcHo4DJLSiIAsYpFuWstWdfyQOjIJNB9rab5N?=
 =?us-ascii?Q?Fj38O3h49Okk70iKO4QUD5FbAGAEiKqch/TB3Dzy+do0sv13Iwqqe1ItoFrz?=
 =?us-ascii?Q?EsXxL8LDevexq8RfRdncIPfEn1ll+Hu1qEjIDWArEjhZHBy2DhcG+Z4xwbyy?=
 =?us-ascii?Q?IJJzQq1HlJcfp857XjJdxFpBEGQwZqO8KdlEr6OQS+j1lnaPjz+7KLuxGAT8?=
 =?us-ascii?Q?I6eoUzT7CD2vFqirFArn55ZmIRQEKoykU9tkxk0vJV1gZLDuYv6Ut9eV9a/d?=
 =?us-ascii?Q?mTaKKYDzXKa+1EP/TmhoCOJkPfJqqKSMi+S0iD+bBBUTghlwtQYlVicjrXrp?=
 =?us-ascii?Q?I5T8Lr9SlbkYtdQj7dCsKjrdNHmSka673ahJ4Rj233p3mxGFBtCWZKSYATRq?=
 =?us-ascii?Q?HgRQls3pOBOF8hA6i/cvntWQY895FT/cHCYn?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 14:53:28.8001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc05f4fd-a7f8-438d-0b5c-08dd8a5243fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_075338_763995_E8342141 
X-CRM114-Status: GOOD (  19.39  )
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

On Sat, May 03, 2025 at 11:06:03AM +0100, Catalin Marinas wrote:
> On Fri, May 02, 2025 at 07:14:12PM +0100, Yeoreum Yun wrote:
> > > On Fri, May 02, 2025 at 06:41:33PM +0200, Ard Biesheuvel wrote:
> > > > Making arm64_use_ng_mappings __ro_after_init seems like a useful
> > > > change by itself, so I am not objecting to that. But we don't solve it
> > > > more fundamentally, please at least add a big fat comment why it is
> > > > important that the variable remains there.
> > >
> > > Maybe something like the section reference checker we use for __init -
> > > verify that the early C code does not refer anything in the BSS section.
> >
> > Maybe but it would be better to be checked at compile time (I don't
> > know it's possible) otherwise, early C code writer should check
> > mandatroy by calling is_kernel_bss_data() (not exist) for data it refers.
>
> This would be compile time (or rather final link time). See
> scripts/mod/modpost.c (the sectioncheck[] array) on how we check if, for
> example, a .text section references a .init one. We could move the whole
> pi code to its own section (e.g. .init.nommu.*) and add modpost checks
> for references to the bss or other sections.

Oh, only thought about some compiler option.
and Thanks to let me know!

> --
> Catalin

--
Sincerely,
Yeoreum Yun

