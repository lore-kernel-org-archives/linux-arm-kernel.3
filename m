Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B28D58D79
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 18:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3to7bnROxcdJ7UPgm6j4IqHmVtroLXL8I2+m2snwMMQ=; b=Yvujj8DsT28PgBk5fN0XAzrZNA
	ua48jhpYTo4k9h8L6Qh4/dsfVZ1sg3f76gqCi3RJhmdYW2cVqRdCWWAllA87J8sZP72/4Th6WYtlT
	LVACyBQG3q+Zc4YFuq0/WNQlbe/2UET1i3K7xxC1X/o5rVZTgmY4mH4/ySmoKQ3CwKaI8PgUlPRte
	dXAsycZxidCQ5e2qmMhGMPcipz3tOgYqGef/jDxmeLuUozPfeLcrehJzzst1F8hPTPbzb1DqpoP15
	Dx8S1tI18SJ7JW8KaYq5Cg05GxqsGZowkhLXHluQ5kXnvSNveaTp8t4xvZfeM1P43ebXXtjUQ9ajT
	BFrumvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFde6-00000008qhz-03ed;
	Mon, 25 Nov 2024 18:17:14 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdd5-00000008qXw-2XWY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 18:16:14 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tRYuCjGdy0Nu6v+LtxmbDNzH9dGZL8ajbm8zpeGVMmdyTlDaZPOJBYSwbBwbyry6i0vvyUFcnou91WJWDk0jN4dBWi1CJZ3t43bPZfmTEeeZldfySP6Ts6SKeEJ4xTNVNkMju2EUWYTIW3jIFIJX/Q2TMQa0AHpN1b5kNbQUMXxaL5vL8aZbl7ewDxnAwjsnDIVTjr5ezauTTOAG/TRcDsKk+3ii5YmDa99Fxd97Cb/4r/W7TDDGHntq1pGEVOi9nQgEDwNNxk2f2Nr8nymcRURmsG+LKq9XLskJsz5ELkpp4HB0cZc842cj4x5wAajnRYXNnXibAC8S7cxEoyWjXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3to7bnROxcdJ7UPgm6j4IqHmVtroLXL8I2+m2snwMMQ=;
 b=hI/xt+zgxjT/t8kdG3i+y3v/NhfUsJeOdLEbsIZ4xbeILqZIXaAJMnr03iC/nN4IjUPGRWOlzj+LSmN+u2qD878C3eyt4HkClrH7v1unGNbt7zx+oj/rUtdcdHz48nkGNXr4wXLWaZdB00EmCRfGagD05Lg7NFBvkQ0AYYCAbogyEXaL4AFS32MpNr98E6z6OpxDAjqoKM7wYQRM9A7oVI1at6bma+7+TS018pyhVjfUBoIEgwwHEauMROSH8anqt5PR4RPrarod0cauEE4B/0yRLqTcY07+m5veExU6rTg+SRfW7i1AbtSRo4WhFUIYVE7SiVKs4qVPXP7WYOQPPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3to7bnROxcdJ7UPgm6j4IqHmVtroLXL8I2+m2snwMMQ=;
 b=KA5Lbb1J0kvdqlvpRWqyauqsn8xoRPI//Kf5RFiAQ4uysZZ8sES2upY/GsQ8H2zz0AL7MQLEHyO5ZPWF+Dkcvhyee8A/55GKIZwYZYwDwo68LcmHvooqej3tREK5evjAi4X4BVy85slOaAY9iE8o42lN8bqBJoQcXGmRpZsU2dA=
Received: from AS4P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::6)
 by DB5PR08MB10286.eurprd08.prod.outlook.com (2603:10a6:10:4a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 18:15:59 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::63) by AS4P192CA0008.outlook.office365.com
 (2603:10a6:20b:5da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Mon,
 25 Nov 2024 18:15:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Mon, 25 Nov 2024 18:15:57 +0000
Received: ("Tessian outbound 99d3b165dfe9:v490"); Mon, 25 Nov 2024 18:15:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a85c8667282573d4
X-TessianGatewayMetadata: YYjayfv9iFl2aE2CAZjD+cXLNaGoeYkBctrn82VXoJrY2o0JrRRYnY/weWTL5PHPwOkRg+VpnTZADJBom+pRDO93z7og/IVqX8u+cLqz8H5TourjC7JnXBY7b5mrS3sIsl7LXqXU1b3/Bt7e56e/EQ==
X-CR-MTA-TID: 64aa7808
Received: from Lf15ac837755d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9737CEE4-1DB4-4F8E-9ACA-B6B7DEAB8906.1;
	Mon, 25 Nov 2024 18:15:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf15ac837755d.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 25 Nov 2024 18:15:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJnwKX4fjdKitsjFUdZbZbeeh2HuqxQZtj5O4g+VsczvR6Rci0yKD6vmZI42MiLaVi0PM+fSAAdCzd4NZPR+FfZbh9oKL4gpaNY8W22lG6h+fAPLOByBuYBelzuZEwH7KFEv8tQVTdXoIJS7HZ8DXhxF3DKL9IhUd1E5Kzkkw3r//p51tVGMizeg+jPl44RH1ev9EUD0n/HcmqHTxxghAKe5zXRXhyczwruS9+0+zRuam6i1Or1NIhtebU8pZ8U8ujrvs6yxvtGqP9OUE+fM+YN8nR+g61QOzm5iDALphNq1CJazrf+hKUNRYyGBugyADP7gpvZewLvevH/scCgIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3to7bnROxcdJ7UPgm6j4IqHmVtroLXL8I2+m2snwMMQ=;
 b=fuAQlj5m95cPieudTlgkLwS+nnIqCB/vttqsJvlfApwDx3wfB0/nlUGYo3xI3KI550ULnhhC5ewc7X6zqVKcjgYs8NefFr+ToH/nI+DH4g1OeQAnOpvOd5aS0zT54iFYXhtLn2xh1lmF0pRrVk4tlCZBwmHJCBM+PYVe3HZxKBhN6LU2sszcVO5MsrwNLKr9PWRJnkbAhut9+Z7bBqiKmNy0I78/Bup+9jNlziEzUti20ul82lDZ0LDjzuden1ck4t6Mdm+oHcGlvlgEgdqkNLx9z4tTI3jiUgboH+Plwij2ZUkG9iYh0xg+BFaJUHKaTO9Bh6jmn2/RVDWQZNjBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3to7bnROxcdJ7UPgm6j4IqHmVtroLXL8I2+m2snwMMQ=;
 b=KA5Lbb1J0kvdqlvpRWqyauqsn8xoRPI//Kf5RFiAQ4uysZZ8sES2upY/GsQ8H2zz0AL7MQLEHyO5ZPWF+Dkcvhyee8A/55GKIZwYZYwDwo68LcmHvooqej3tREK5evjAi4X4BVy85slOaAY9iE8o42lN8bqBJoQcXGmRpZsU2dA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB4PR08MB9192.eurprd08.prod.outlook.com
 (2603:10a6:10:3fb::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 18:15:42 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 18:15:42 +0000
Date: Mon, 25 Nov 2024 18:15:40 +0000
From: Levi Yun <yeoreum.yun@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: broonie@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com,
	pierre.gondois@arm.com, hagarhem@amazon.com,
	catalin.marinas@arm.com, will@kernel.org, guohanjun@huawei.com,
	Jonathan.Cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] efi/fdt: ignore dtb when acpi option is used with
 force
Message-ID: <Z0S+zP3u4781zNwo@e129823.arm.com>
References: <20241125170758.518943-1-yeoreum.yun@arm.com>
 <20241125170758.518943-3-yeoreum.yun@arm.com>
 <CAMj1kXG4A4h3=bZC6kSrwsZa7p4RZ-uN5N67pZUFLOQ2RJE64w@mail.gmail.com>
 <Z0S3wiugr0JML/cV@e129823.arm.com>
 <CAMj1kXFOdGaYiVWOyFEK+Lz97YdzAu+AWj5trZBTL+Xc_DXnmA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFOdGaYiVWOyFEK+Lz97YdzAu+AWj5trZBTL+Xc_DXnmA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB4PR08MB9192:EE_|AM4PEPF00027A5E:EE_|DB5PR08MB10286:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ef49c3-51e2-440c-6623-08dd0d7d3566
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?+LuooSZVYk2VPTgrVck6HnCYmxrzvJM9/wy+XxtMrgL6kly9Hptlft3hN0zO?=
 =?us-ascii?Q?pzsU/C7rkVEM86MKOTRl+9igL+8ODEQwjw+t4Gzfar3wr9/LSUyvqlC6zOZp?=
 =?us-ascii?Q?VbQq+E8F/5gTscLxMFXWRPw2h98f1nre+WQ51rjR9mpuruGgZ5g7bUrKkLio?=
 =?us-ascii?Q?XY1h4qAU1BAKCO+R4ia6Vbzaw1W0aDLCM6DQ/dZvG82ftaVk8SX3wMU6p4EI?=
 =?us-ascii?Q?6nLo12TxKWxCS7/rxS1utwJBz9LEeQAuC22alWXMDJLheIpoa4AKKPN6CnfC?=
 =?us-ascii?Q?fm++aYxdnib2o0luSN8CrtkpA+3Xf8bQTczEn5UM8wVgC+CjmIankKKpiZjL?=
 =?us-ascii?Q?FfJ6JLsfm2YnhlX65sMtnPsooFuBZMC8Os7tf3aPZBy07kG18VlGkwNC+kCm?=
 =?us-ascii?Q?/TFxDWLNM3cOWCBlqvdQLOl1zAxpKuHfdByAXO6Xh6mpUQ1DM6e9vuduBUEa?=
 =?us-ascii?Q?CFiovcgEmnWArF1ajYPSjyOBTLyW8AZo8yCjnQDL1jCWSz2PKr9LJE521VJR?=
 =?us-ascii?Q?3+Gt+FWMnuRQeK7AgBNcUEwEEw37GS/mMGOLiaYjkjiyvRKVRaSczDjDN2H6?=
 =?us-ascii?Q?2APCe8xMTeWeHAVEauyUC61vzuEhi9aYHR5Af1i9HSIbWEpEpYDMJXYm20Kk?=
 =?us-ascii?Q?N7qZ9OLgsLN+YAPFzFkphQrCrBPluBFnntCVvSXyoRB3DG1n28UhT7LxxYus?=
 =?us-ascii?Q?/pmsH742akdB5R/BJpMtSgo43WIr7Ufc8Svs/yeHWnwixNYAuEMflcxYqPzk?=
 =?us-ascii?Q?K4CO6T8pP5jEQlXChg/NrKCgrYtTxi1q55EesX6WBHnBVhN2PfHA7r40Yc85?=
 =?us-ascii?Q?esYj3mE0O0sAotztNnvdpqi9FB0p0Gb8e3icd5pG7EC0mJTusDPHB2Iv3rl3?=
 =?us-ascii?Q?B4oP2lFeubTTTmXbva+5QnrVyEU12tZMV/KIeRTSASexf/JYBldKL8qLSaxG?=
 =?us-ascii?Q?VlvJ/HV0C+RRiN2PBEKlEtnZODzffZyKdbXzXEOGAFlM0CNOLHB+032sxP4F?=
 =?us-ascii?Q?K6EX9iVUVrClNkfi6gNle12ODws4y3popJgozIslgFXQIZwEHzZdJ+noqNYA?=
 =?us-ascii?Q?oSaGw6eJlIol7JCiLQFG8SKL2Sh5m/I2h3XV9EjJLY8rQ3t29sXhUsQgTJxO?=
 =?us-ascii?Q?4b9L/TyhfCTAiFVJNV4XO7BLNcV1DZNRTkaGKTEnLdjSkt1DdSTMS3yFdHEv?=
 =?us-ascii?Q?jXNloLCdkIwXE2wu+Z6UBMhK0rd/ZCP8RNdn1F+5gPt/DChA6yCev17zTJ6s?=
 =?us-ascii?Q?bxpiz4DDCgD56vB+Q9cIUPa5rh5m1ccZIoeQL6Xh5KblN0Ys/ln/r2Xpwlcd?=
 =?us-ascii?Q?JreQUco4DJGlGGzNIwgceQIyC75vB7qIm8hY1q+5HmvhFg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9192
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f60c983c-6487-46b5-c984-08dd0d7d2c6c
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ebKkxDqA78CXMB7f2uD5z8Leay0BtRFlmSopCmrOdm24MPrLzhTKguyKmyCj?=
 =?us-ascii?Q?VlzW7hfMpiT8JYd6rFYWr2eD7JonKmnl2FzWnNC4e7+/RnArPOeocal3r/YP?=
 =?us-ascii?Q?xLNzLOzGUBAlP9qHtCKOJGH82Pol8VmKqvlc6i7Ngvw5XhulV4K1v3Yv1FJH?=
 =?us-ascii?Q?SY8cflfacOXbNryPaJUd9VO+EtZSY139RPCKx2/kuxxqo/ZzTEAvYcFEyKQt?=
 =?us-ascii?Q?Ym9R4xGNE3x3PpK35eBNQS/OdpBkKxgsuYbwL5EjXBRgF9aZMadQVOu1ukm0?=
 =?us-ascii?Q?v9LKxuLHwfB9T+BVd7cu1/mIjzLcfgNi5vsSzR+nuhjAgdfeMoIjGtTvJ2pv?=
 =?us-ascii?Q?cFso3hPjjehmT3d202O3YcIOSXvLF9+1aihAI5hjmk2ayTs9MLdQWHXIf/z1?=
 =?us-ascii?Q?kqNA99X98tI7prdrBsIlOi13f/EirzdHqNLPCd1SA68SSl3jSuwp8FBmocJF?=
 =?us-ascii?Q?PO4jhHFRIulKzyZA1P+C7dWpQ2S9K+zJnOKThAlqDwOl4lJEvoWhtXbfiZTO?=
 =?us-ascii?Q?gkE8/50Txzb1Jd0ZaTtQTmol1Sht8sSvAQcn0DxNt16cG8kuKf7j+stHSWjc?=
 =?us-ascii?Q?YyCgdcFfDZ2mbCrpcLeMfXOtahVAvi5EwHk2RMnZuYSJhiL8O1gGDXplVkZN?=
 =?us-ascii?Q?9jgKoKTwQiZTL84HGoUmpanMfWJO1/NitDiYozaZHsVJ1HnF2rFnTb1lUhDL?=
 =?us-ascii?Q?8t5dKpzk5vN9Kj3PSFJaUbCwq95MvrydVBE9NigFDnKPsccNC9sthQuRbFFf?=
 =?us-ascii?Q?AG6IHEIpnyZ/aENlTzO3imzCtyAUaaW2seJ3dAI6Ux8ASTrAw8nLGs9LMogo?=
 =?us-ascii?Q?lRcWRJjCR9rtrFlccNYlR168AqPLrTwvwV6OqVnyTraDrcfW1A22jWXYUgVB?=
 =?us-ascii?Q?LyI14p9UQd/AtzQafW7AJWhianwOiClkJAgA3bkDhqmkyYULu/Ovsq6FATl8?=
 =?us-ascii?Q?yitXCCNN0P+P+0McneTa0tBvmC80PNT5W6DGfd5sbd8jEjBwFLHK8R3wTu8C?=
 =?us-ascii?Q?trj7Izcx/KJcLJMLCUap8eiK4KvilOmsL84QrclRr+qkDDAbZ1itUE2VaSv0?=
 =?us-ascii?Q?Su8POzKJirRWXSedpuxa8hfq2fpavdkdaQe4kz8pX4BZLTqIECDxE160aUX6?=
 =?us-ascii?Q?Of59e1o48jWaMAtHzj18OBg/irHnUc2PfjuwD9unJ/UXIj3kScQjBRZo8/oE?=
 =?us-ascii?Q?/b1M52/mw9H7HfZmMDcYcf88cB5cr7I8idb9QqcyMQ7da0wZRSNxCplVdpp6?=
 =?us-ascii?Q?T6dNbpLv03p/PtL07Q8CsiFMqLCnCw/NVFpB3A287waspg9Gx41bC30FUSp3?=
 =?us-ascii?Q?BSxUIZUMivPepibG4EHl2TC38fAEVk2gY7Erl7EPhDBl2iP1rG3g2IOZpH86?=
 =?us-ascii?Q?m21z8PK0RkiZcEhyX0eZPki9tG6/T+/xCzhPnjPTHG5ihg8QDBuvSFGAVPtf?=
 =?us-ascii?Q?6/dgZD2IBFtZCnoTtDrVr2a4d+sJ7ZaB?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:15:57.3986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ef49c3-51e2-440c-6623-08dd0d7d3566
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_101612_733538_5F2D0322 
X-CRM114-Status: GOOD (  24.13  )
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

Hi Ard.

>
> The DT is not stored in a variable.
>
> If CONFIG_EFI_ARMSTUB_DTB_LOADER is enabled, it may be provided via
> dtb= on the command line, but I have little sympathy for a user that
> passes both dtb= *and* acpi=force, so this is a scenario that we can
> ignore.
>
> Otherwise, it is taken from a EFI config table, which is just a
> <guid,addr> tuple describing a location in physical memory where the
> firmware has placed a DT. If the firmware puts a corrupted DT there,
> the firmware should be fixed instead.
>
> acpi=force is intended to force the use of ACPI tables on a system
> that provides both.
>
> > also, although acpi= could differ from architecture, the force option's menaing
> > seems the same over architecture (ignore DT boot with ACPI tables).
> >
> > So I think the check the "acpi=force" option to prevent loading DT seems
> > good.
> >
>
> The EFI stub does not care about ACPI vs DT boot, and I'd prefer to
> keep it that way unless there is a good reason.
>
> Which real-world problem does this patch aim to solve?

Well. I had lack of explaination. In case of Juno platform, it loads
FDT from "Fdt" variable from the storage and install it into
configuration table with corrupted Fdt because of FDT stored in variable
storage was corrupted.

In that siutation, If it loads corrupted fdt, it prints error message
while sanity check in early_init_dt_scan().
This kind of error message would be confused to user because
user already specifies to boot with acpi table only with acpi=force
option.

anyway, what kind of way to install fdt into configuraiton table is not
matter. but when the dt installed in configuration table isn't valid,
it could produce the error message which seems violate user specified
option.

unless check the acpi=force to ignore DT, I think it would require to
check the installed DT in configuration table or passed should have
simple sanity check doen in early_init_dt_scan() so that error messsage
which makes some confusion for this situation.

Am I missing?

Thanks.


