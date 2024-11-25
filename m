Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B20ED58D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8boKGVrlj4YP0gCCEwVR/29ay+2+KupxaHaJjjhE2w=; b=0H33ghilODCfZokfo5HzZeI9Gl
	XMAxQBTDo0/cmx0dEAVPoR9uRghIY4dbv8CKBuw7js+jScvoWcEXlQSP+2jm0QFgYiqm+fiWpu5D8
	kDXruXpdGywdswxoc6rP1GHF6RoA2mhwapoTrDK5/DfH9KCVRNJGgZODBRzIEfpjIRt2s9AAy0Afg
	STaQmNp/v3kZYyc2yM7zrsxSncRYXYyix2TieAwLSVCNRtbjE0tNVaha7SwufHxstnUfYtLqu3/t+
	PyFyF50pD6N17Kygz1pLxymaE2kFwrMAi8roF8p3D2exHjA+6E43GtipLpzSQMoPVquk/Q/LBMhPM
	Apr36KkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdB0-00000008mjF-040F;
	Mon, 25 Nov 2024 17:47:10 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdA1-00000008ma3-2NAp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:46:11 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z1rQzbTqy9++D3cTejvwVOp5+rLcQjrbH4E5VtsrhzFOnKXcKy7ORsIJFhtx15l1T5dyWUBMocA9p6IVcMBcXIhq6moEk4tnutxpwuUW8BSJ2fVBeIS5qnwM6T964zyRvbHT6JehgqEGhyDDIqSjJzlRnZs+x/5mYSWVb3Ofyx3ilpz+oJQd+4yRZqQkRaHlvRpvEGSrI/DOZ+d9Rv5EZfnXUpqYf5DKyNr2qwZQg5Ll8VHdxSGx2ZIfbj++awYbxl9HKBhns5tRXCkG4iY3xJZ2LuE9ZQkfoGIjKAnYrMsXpos9jrBLnE5ZMlWeNzqlIY+3n+ntKDrr7kthjmvU2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8boKGVrlj4YP0gCCEwVR/29ay+2+KupxaHaJjjhE2w=;
 b=tjA1BvT0U7Xtw53Eh24qTXykse4Bgqs72YewbMb4im89L1yx7nQtqg0DPonb3CySyZW0a2fgTr9vxJDMErW9ZNaLVunjn/UdSlV6M8/Lt3CRrbuu1vPipIf5sC2lAgCMH7DJ9vlFaWQnhY4JnLHhBAb4eCEVQ/34aNIpPewx/Jn83GSjQw7NG3nj50YD2xkNer63/cwipoScffPNfvWW1MUS3mz7/XbcxNoreg8/i/AHwiq0fQ/MeDoAH9en5kzKClRyqwdI8ExM0oW1kAs7B9FU9kqnzYv/52fNk0Iw6H7NEAZWjpNmQET3GBCS1mipYToKOlh4Jxtqh7HdI2wSfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8boKGVrlj4YP0gCCEwVR/29ay+2+KupxaHaJjjhE2w=;
 b=VKx23wiNDBKJqhLIfEXEG89aqPyvc7AN+ELaujTuSDbIomzJEFR5kGDJZoWSk0zdipo7tb3wkI9TjT5Ly7ahIpxhbir6QHxkmzGJK2I/q2Oht6r368/ejmp+m2pNUfEMmqu8qID4t0XpBir6el6p85GXDkbI93xiFbqJwegWv5U=
Received: from AS9PR06CA0008.eurprd06.prod.outlook.com (2603:10a6:20b:462::22)
 by VE1PR08MB5584.eurprd08.prod.outlook.com (2603:10a6:800:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:45:58 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:462:cafe::5) by AS9PR06CA0008.outlook.office365.com
 (2603:10a6:20b:462::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19 via Frontend
 Transport; Mon, 25 Nov 2024 17:45:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16
 via Frontend Transport; Mon, 25 Nov 2024 17:45:57 +0000
Received: ("Tessian outbound 23e15691b630:v490"); Mon, 25 Nov 2024 17:45:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 136df599f3b04c8c
X-TessianGatewayMetadata: yE2Jk0e5nXYqrFLg+VEzfW8Sm0VNBm7Xp2XdxVrwoqbKZBwBA1TKLjBPdJaKVEHS0sBJlfDNEzmIIMBnD09SIOqQGtK0ciJkprtX9wUNSWRHB527oqGumZcQRWHJefj9gluu9S3GNtQswkQfBLZnHA==
X-CR-MTA-TID: 64aa7808
Received: from Lf966c29ef734.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 44FDFEFD-DE6D-493F-A996-5DC04F362456.1;
	Mon, 25 Nov 2024 17:45:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf966c29ef734.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 25 Nov 2024 17:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBBoPhb5Gki7SXRGArizI7zeSP21QKf5NVVkU5+qCUw/lvGFCWZeNiyEUiojP5U+Wwcha+UE81n45mk8miFugQYGS8axorvjyEXnxk+um4BrwRknUwMpTbAIK19csP4TuE+x/NwaKTlO1e3VupbywQ92ziIy/ncZn7YWC0C4CwkDMdh+ujMs5UGylokBaPxkamm5TKux8kDkzScCVyrihUweYKqFTaHyIBRf/26HexK4bIyqOi3LdQ53xQ0iaknBn4T9yYHSJBhhq8SHPquJ7Nu2+Ou5PeVBji5E2SO164+egkUez+xOMQa6AugujeF3dHKExQTpWlg8ygdReDuRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8boKGVrlj4YP0gCCEwVR/29ay+2+KupxaHaJjjhE2w=;
 b=cSnScOcB59yIeaH6SshDvDSd8IcljLBPSaAHkOIjZvLbsJQNh8P5P83T9diygjobdirieaOeuXI8uTlUAuGFzrpe0RuRuju5eZ3Fnlh85KHy7MNX5g4euI/PlC4TDzBHVd5JxrBm13Npt+19Hdjz9SsoDfkCkyxyCLQZS8rqrj3aZ4meo1MkuUfYx4Gxd7WfBm5+YANvZ8aiRZpLW8Wb/YhIVaTatkUPGGGxUYEQd3jdmm/9lSTiT2tvbiJGO7gHSOTOuo8MDOssdWIfsTk5J9dRyF4CFxuNvskk70a7J2i6UhyA1qlP33OgeaXQDOUlcNhHVK5Hvp7BTKaVcnSStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8boKGVrlj4YP0gCCEwVR/29ay+2+KupxaHaJjjhE2w=;
 b=VKx23wiNDBKJqhLIfEXEG89aqPyvc7AN+ELaujTuSDbIomzJEFR5kGDJZoWSk0zdipo7tb3wkI9TjT5Ly7ahIpxhbir6QHxkmzGJK2I/q2Oht6r368/ejmp+m2pNUfEMmqu8qID4t0XpBir6el6p85GXDkbI93xiFbqJwegWv5U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV1PR08MB8450.eurprd08.prod.outlook.com
 (2603:10a6:150:82::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 17:45:41 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:45:41 +0000
Date: Mon, 25 Nov 2024 17:45:38 +0000
From: Levi Yun <yeoreum.yun@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: broonie@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com,
	pierre.gondois@arm.com, hagarhem@amazon.com,
	catalin.marinas@arm.com, will@kernel.org, guohanjun@huawei.com,
	Jonathan.Cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] efi/fdt: ignore dtb when acpi option is used with
 force
Message-ID: <Z0S3wiugr0JML/cV@e129823.arm.com>
References: <20241125170758.518943-1-yeoreum.yun@arm.com>
 <20241125170758.518943-3-yeoreum.yun@arm.com>
 <CAMj1kXG4A4h3=bZC6kSrwsZa7p4RZ-uN5N67pZUFLOQ2RJE64w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXG4A4h3=bZC6kSrwsZa7p4RZ-uN5N67pZUFLOQ2RJE64w@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::16) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GV1PR08MB8450:EE_|AMS0EPF000001A5:EE_|VE1PR08MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: dbbd3891-341e-4f46-9206-08dd0d79045a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Qa29XnwI/wgqfCV689aSzpAv+MSvwpT5uusEvHjx2NnC9wssLserOrO3tth+?=
 =?us-ascii?Q?n6MENwzlG6J/ZsIwh65SttUq6OSy6NLlo6Q0zegkJX2F4oGG7qTBgoD1XL+b?=
 =?us-ascii?Q?2V94jx8WJTybAjkk/gtue5mqPmGfLbqel1dFIjCcHV+FrakV9Z+FNpCT/B8u?=
 =?us-ascii?Q?dLvU89PGwQaEYBiYibKEvUTsm093LOYexXhGexwQ53nPXc70JQsrx0EdP19h?=
 =?us-ascii?Q?H6e2trqlu9DutfQ30I2EUTA/Io/iA3VfokvlCTpsL7ijATTpX1PXxqEhnpO/?=
 =?us-ascii?Q?NmUf9ux9al6Wjy0aWu43Q4YvXvF0ecHIMKL9uP4zib1+mfEqf+gYo052FsNF?=
 =?us-ascii?Q?PxwJydjqEvqg5u4hSb6ilSs3CCyIVAIdA6opaJNUx8YfIdn2dHJUhtvSLdFL?=
 =?us-ascii?Q?4i7mGb9oyC6Fn4JGxAnHO+tI9OI6/mZsJQwvI71HscPEWmUE9LByAOZZ+Zif?=
 =?us-ascii?Q?Zwe0ZTpl9NvR35SAjdUpQ07P3vJqG2YvcdJ9CNmtxeD0N0inLEVEH/2UNUYG?=
 =?us-ascii?Q?Day4UC40NCixPBetk/Sox1Ji2jdhLjCS9Jogmirs2ULfmCH0H4Wxk5iENJZv?=
 =?us-ascii?Q?qzHVkKQSWXlCa1KjgfuyI9IvLSKQxZliGNTHw1zOeBwIYmVkLJORQUl6IAH4?=
 =?us-ascii?Q?aoLVkF4ST6899NEfXJMO1yPh8vmwtdmrr84UJ5EuEKXRzjmHuKHIsFWT3Fe/?=
 =?us-ascii?Q?qRJ8+QEOus1l2hrtB9YCW6bRQADt0XH85o0Jtij5mB1WbNi1vY90c60iOvAJ?=
 =?us-ascii?Q?WG2xIL2CPm/70XOgGYrR7tUzCq2zBKkBIJxI1EVsy9S8qi1NdaWJ2cEWAP+2?=
 =?us-ascii?Q?XepUBJTELlt3UV8F1B4iv4x6ezeVGsJtXf3QGKgbQnqaFP/q7gifNDqcN+Rg?=
 =?us-ascii?Q?MdXspv3d7I33kJzTsgw4ePOjBidv58eUULaGPrOU9M5Gmdm2GYWk+q+CwgMZ?=
 =?us-ascii?Q?+1Y2tkGVeDDfAHIx/OSC+n2CG6GQQFAK9y11Gzl9VQyshOFs4WSP50lCmxjh?=
 =?us-ascii?Q?S/ANllea8gD7LJ4K9Be/vcrR0MtOCZy510VA8VX3w4sfrwrwHS6Xphzxa54g?=
 =?us-ascii?Q?XUK1HNC6ihzUY04oLc54YVbpMhlcTPitfxQpKjKkPMjGzmHxTkgOCT4f5mC8?=
 =?us-ascii?Q?G1zksdwSE+lVbzGlYsLx3fl+MNdsQsH+i0A56TQAIOTO8v8oDxGBm9gPwZWK?=
 =?us-ascii?Q?9tBWZ1Vpbs2hTsylrJldw2oVUCZ9UB/4Krv/Uc8ylhXgft97XqEiRotJFGEL?=
 =?us-ascii?Q?SBH8LWLVDRiRqIYUi5OjlNHsbeqOOcR4C6uMR1peh8dERgdAr69IzedYyMNx?=
 =?us-ascii?Q?bLCf86cEwHg/DQDiCm9cY7Zx/BJXA7M6Ow54BIV5wk4epg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8450
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d8809dd9-3722-4401-5b14-08dd0d78fab7
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XceDy7RnflkgaPEBZ0kuC9or9YL3PJWFKryZvd090JZHrbzEdHg4xg7IFnRH?=
 =?us-ascii?Q?6TA1IuAPKTtj+XG/Pg91VP1pBqcRR7Un4LzONI85mHuoBQ5MLpTnLTgVWkbg?=
 =?us-ascii?Q?ki4h4coePA2KpH18qI1FAd2shEo2BBO8smPA0iYGIxPsbOQ435NmB6Xy4uUL?=
 =?us-ascii?Q?QnmR+ShSoKFXXusG6InGYo4ksGGai9ZzwB6OPUEwlrH37FB2LkyydWO/CVSj?=
 =?us-ascii?Q?UwW39ENpgagziuBWfnIyk9wTk25on/+Kcw89tgemsCjiiffM5zYw1SjHXxhH?=
 =?us-ascii?Q?zkGKSNOp6ysPDqtxEzxetPZKeu+X/5Or7utDs4s+z1fiPCjtRJPGCu6afeYU?=
 =?us-ascii?Q?x+ukexXMtPZy3MmZdvHS3VDPmhKaP8As/soCEWo1JZ3jag0jGIhNPXPcQBA/?=
 =?us-ascii?Q?x2BJ62V6w8xGme04K5oBfQgalHN82q0e7STv+7RcmmujhvTjNczsnXJvLeQ+?=
 =?us-ascii?Q?wcCQ+OnFUdLnrJ1/heUt2DB85/Yid5L/b8ZkFloM360nRxuctvGqdIcZMU2C?=
 =?us-ascii?Q?yJGbYNaoFgui0IIg9YuxwaJU0TAFwy1v2rrrPn7c9we4ZUixpbABJ0XQbleC?=
 =?us-ascii?Q?V8eVUF6KTYSsICoPLg4CUzDajURCFBUMHzVsNd0xs5Dn9IX7z5C6wQBqyhaO?=
 =?us-ascii?Q?4Ge4YVC6WoxcsJY0eLDOkD6CDGzgzYAPvfh/rjhbXdcTHjpCjzsMdo9urtqH?=
 =?us-ascii?Q?h+4R1rppKTXQSG+9ZIrUoM4u7DIKWLpLOZBgnt+JY7WI/smTaStl9KCmHAb0?=
 =?us-ascii?Q?o0RyWq7AH7bVx1nLNex4/x8rgeO8lVPk7VI2tqMphARp9UjmnyvvpDKaJb44?=
 =?us-ascii?Q?zaaGWYxqH/XVyNfx1v32ZMJ3FHtD+lw9GYj3pNJJQcBdq2utyFcTzGd6MqzG?=
 =?us-ascii?Q?f9qxyfY9T2QbmaA9EojoBujMyJyVConbhmFopDKx5x74Efn3/jot8QEH2zqI?=
 =?us-ascii?Q?fFj99XcMW+OxWAZOmQ3ZB7kjj5F+UPjcZy5uLtg0nwVcwMn42mUF7GpeXCQN?=
 =?us-ascii?Q?Xf4yEW3hOs0BSIuix5w4K4fz8ZTvrc+fIWi5wa49iwTfTQVcjgLS4dFf9J+X?=
 =?us-ascii?Q?3+UxGc0M/XBxTurcMM4U9KZO4m3dBnZbDoyp5cdHksgKekWTBSgS+bBSrfCP?=
 =?us-ascii?Q?0lwDjkACqw84gobfOh2hLMsldb4sAqdeXzv75owIuXKPJwzsDnYpG84tV2KY?=
 =?us-ascii?Q?n5eLHAaG7MEtjxYVLxTQL3saJwlqe5ks6WZDzGzJDv/iphxyN6+IJZlgFqmi?=
 =?us-ascii?Q?wjnWSDEDqaFv7/aH7f5HAkSaM+lQtI+2s+hMd+5n/KFmFXAPhRw/vAQ3fKyM?=
 =?us-ascii?Q?VHx0wqjaCmN3Y8GdnrkjGx51tWbofV/VmAoXFqc8Asw8i1c7hIQK3Fdwxnh6?=
 =?us-ascii?Q?0fKya/amUt3SqhEOs3D0p6yVhoRn9FOhM0xlzpZuAxQ3H68JEXX9ayk1ZZfK?=
 =?us-ascii?Q?OzcUaNDKx8k+G5Jt+J6qNvtvqLOR7CYw?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:45:57.1101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbd3891-341e-4f46-9206-08dd0d79045a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_094609_604109_A442AD3E 
X-CRM114-Status: GOOD (  12.60  )
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

> I take it this is working around buggy firmware that passes both a DT
> and ACPI tables, and the DT in question is broken?
>
> If so, this should be fixed in the firmware. The EFI stub does not
> reason at all about ACPI boot vs DT boot, and I would prefer to keep
> it that way, especially because this code is shared with other
> architectures. For instance, the meaning of acpi= could differ between
> architectures, or they may not implement ACPI in the first place.

What I concern is that It doesntt necessary to check DT
otherwise if the FDT variable in variable storage's contents is
corrupted, it would complain while it check in early_init_dt_scan()
thou the dt isn't used in boot process.

also, although acpi= could differ from architecture, the force option's menaing
seems the same over architecture (ignore DT boot with ACPI tables).

So I think the check the "acpi=force" option to prevent loading DT seems
good.

Am I missing?

Thanks

