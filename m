Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C746C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPJe6Osq95MOVshmgOKz9XrDLWuhm1aRSwm/8kZ5cRo=; b=z0Y5oINVTYurBPrxcdIoLA9Znx
	3Vn+y0WGmU0WOeCtsFuxc6NV3VV/ZlKlF8eqBPPMP3YRcitGBs35dkneAQ/YSpRykxTnNfUa4Eh49
	sVKCN0Q9h8h0G9UvteV0MYyQtVmTkQBFvW2Lu/pMPCJrANUM3hgVVy24MHJHKDL/fFYNkOzZyEDBA
	QgDbu6J/IFu1JG/dZ9tbgndqMoPLOC1ibCyXJcUf6KpagxaEI5VfupdYTGk/wp7joP4nQvNdzG5qy
	zqfBE2eYOaGQ6EusKJRxDc6PkXuYNin7LbR6h5lIGwkf7mTybCQAzBU/KxDIxPqRYugzuSKrwoFv6
	mdNJtZwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9ii-0000000Aq6Z-2R7s;
	Thu, 06 Mar 2025 11:48:56 +0000
Received: from mail-db5eur02on2062f.outbound.protection.outlook.com ([2a01:111:f403:2608::62f] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Zi-0000000AfEA-0eQr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:35:36 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=l4T5gr2/Q8HMoggLM/CGlKNMPJQY2Z3dvWKvFJjMqt6lB1mCK1gK/mgJLAUUiQ4UfypJWQnr6JlQdo00AKDCjfxGzb5P+2/6eifhyjvjNvoNlAACNMgbJjTIMabAw5Y0F5T90TmNvUb9qRGpiBMAFrEgOztrGQ0i6HhumDBnOQIZADrhOyGFiiQTXUZaINPFG8YoAPMNX3EDhtw38ASeyiaRZFfwTrPmxE8/C86ZirgTrX+z3H2N4zXlP67CfEYCH54jdNo2HNjo8ZXUvBK+Ce9wd/FhQBiD9WxbK074w97uUgnQp1oF31JsiUcjs+qVqpV4EprZAeLB0smHm2XnBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPJe6Osq95MOVshmgOKz9XrDLWuhm1aRSwm/8kZ5cRo=;
 b=urBm0W1PSEVJLH9zp5TTpFStuC9TBMWs5OHNmCHNdGQO7y3102xqSFImvpJTwRsJ+EpARb1MOfQelRBQSxMMX2ji1hdkCsH6KHjyQrPs28vbkkFWDNs1Ligo2z57eAsRNNT2ZrfMV0p4vkg7GD5xh/xdA0IIpULcGO87ZrFKqedU1bv5X8yeWt8yUyx+Y2EQmT71pcinI2CajXBomhySSmzw79Xo8x/YR0ROm6a14nUDUD9LI+3lvs4TrTdZaZJOVxgl8z7CJI5hZPl2s/nGYPm2Fen3M0SAF+nZps7jhb6mgrDfhveRpZVmqNAjBEjSphgvWgT9/1l/vmJoZoT84g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPJe6Osq95MOVshmgOKz9XrDLWuhm1aRSwm/8kZ5cRo=;
 b=H2OTzfW6Yy/Yq70LYzZA0VbVDZI2p1Ay30O28KLnEloYDXEhakM7zLGDNQ3uYhQJf33DGe+hlMw5vPrcU4FfP4GHBWBXjLc2CT/8O/qhzaD+yfVwNW36p2l/f2yFT6/LtrSp/2Bx+pURoiGRt61BshNUPIdpYpJslc4WCqUu8V0=
Received: from PAZP264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::8)
 by DB9PR08MB8340.eurprd08.prod.outlook.com (2603:10a6:10:3db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 10:35:24 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:102:1fc:cafe::33) by PAZP264CA0046.outlook.office365.com
 (2603:10a6:102:1fc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 10:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Thu, 6 Mar 2025 10:35:24 +0000
Received: ("Tessian outbound c3a902884497:v585"); Thu, 06 Mar 2025 10:35:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 52d7d0d3841115ae
X-TessianGatewayMetadata: FsjKr7BPJiUQdKOU8popGwcomoCvZt4anOO+WP/7wDcmjUwsaW6UG8AP3PkKwu+a2JDEV+U/kQdBRhxYh4P4vAFNGk6w2JtN0nps9GcTEdH3CfLy9B0C+slEqCbHYngrTCQF5HQO8vzgE29zv0fcrg==
X-CR-MTA-TID: 64aa7808
Received: from Le1a992173cb8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 24FDB75F-50D2-464D-8208-2B8554DB5D2F.1;
	Thu, 06 Mar 2025 10:35:13 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le1a992173cb8.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 06 Mar 2025 10:35:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCmtMxrkolc45Ahf9V2v0BBREEOzy7TZBA0Dz6yoRhLHJDskrLBIzT0MM9NIs18y9tkFSHCtAFTEpf/7kGqt0MFH7lx4+auq4J5hCIOOXpW81tZFXvUONLZlvwR/HSnqeQ2vqrT4DZ1+uCPiWOCa8esfYbhoe535aRXP3YwyKPwaUW2qE8ojC/2vJq1KhnAkALLBf7JO35qaGdX9pEBGSyDHzntmvdugzu2ZTCVLmaZ80aIEic8Sp+nXNXDnWQ2HmYbGHSjzY0Z1Kfdqyc6FeHtGX+H2ull9dNSNysFvMR3vlBPywsZ3UKeKUx2n6zXBSlFZuB883CDWRt+rGza8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPJe6Osq95MOVshmgOKz9XrDLWuhm1aRSwm/8kZ5cRo=;
 b=vGwChTAjhPTDPvKx6i5zj87t2Dh0GaoM38D9o0v7bJ3vtp3OPL7f8O/oSqpF3kCjvra4x3R5//v/dLUVxJI1ehclmou18ZXMCZPl4b+BGIUNYZ0n9XgMY5r69b3fenrQem4Oz+YMiRkgjTsW+ft5VeHsXIIbX6WyBz+hPX4V8Pqdxngvi5LGvkxoS5RtuWvvFVBUyR6ajOXQYFRH2y/jshmJmSncgtrBcdS0NspIvJzWO+P7H/gWMsBUCa4KKsstscXgt41DxiMmdwy3rWZS6xNMlvgb7UgazE2viGKZb5r+LlRAOdb9893e8SIorHp6ALVw85PQKOCbwh1qOBGr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPJe6Osq95MOVshmgOKz9XrDLWuhm1aRSwm/8kZ5cRo=;
 b=H2OTzfW6Yy/Yq70LYzZA0VbVDZI2p1Ay30O28KLnEloYDXEhakM7zLGDNQ3uYhQJf33DGe+hlMw5vPrcU4FfP4GHBWBXjLc2CT/8O/qhzaD+yfVwNW36p2l/f2yFT6/LtrSp/2Bx+pURoiGRt61BshNUPIdpYpJslc4WCqUu8V0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB7944.eurprd08.prod.outlook.com
 (2603:10a6:20b:541::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 10:35:10 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 10:35:09 +0000
Date: Thu, 6 Mar 2025 10:35:07 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 8/9] coresight-tmc: change tmc_drvdata spinlock's type
 to raw_spinlock_t
Message-ID: <Z8l6W8KtWkA5kS0s@e129823.arm.com>
References: <20250306094800.1082950-1-yeoreum.yun@arm.com>
 <20250306094800.1082950-9-yeoreum.yun@arm.com>
 <c7a142ee-d34f-494a-b4f9-921d739aeb59@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7a142ee-d34f-494a-b4f9-921d739aeb59@arm.com>
X-ClientProxiedBy: LO2P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::36) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS8PR08MB7944:EE_|AMS1EPF0000004C:EE_|DB9PR08MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: af68f69c-313c-41eb-ac89-08dd5c9a9ab2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?K3JncWswb2xoRkNpaW1EdVdraW5HTHRiNFZ2YWUyeUVOOEt0NVRZbTFRdEZO?=
 =?utf-8?B?bGxjV1JFZTZtVEhYbTRaRHdUdWZtM3U3NnU5b2MwZm4xdEVTWmhXdjR1VEZx?=
 =?utf-8?B?bFVYUitPWW9weUNSbjlYNDFESFFSeElBdFpub25LNXZ0RlVRby9FcmxiRGxI?=
 =?utf-8?B?N0pWSGRjaFlxdDA4Q0hSRHBtRk1zM1FzWFN5K1VEV1M2TlZEd1J1dGcvRVh6?=
 =?utf-8?B?TzlvYkhEOHdDcnRLTEM5cXU1K3dmeGVyUVErNkQ5SmFRQnRPRVRienUzcXFR?=
 =?utf-8?B?cTY3cU5SQWU4c2pBM1NoSFd5THRBS1Uzd20vVS90dERBMGdleUVuYit5UHlG?=
 =?utf-8?B?U1hBMkFoeXgwVlBDMkNaSlpNSjBiUVk2dDBsTENKRlcxT2FwVkRKSlV4SEw0?=
 =?utf-8?B?ZGkwTUxVRFZKWVRtQUdwaFE0QUtwR1FtTFVnei9CODlTWWJqNkVZNUh1K3Rq?=
 =?utf-8?B?K1VESGVVWlRNem53NnZMaHByZlEwR3YxVEh4dll1RnNXTWRqdDdBSDIwV2Jm?=
 =?utf-8?B?NnZCbmlaSE54a2RBZnJwOGZIVVNDTmRmbjUyWjUyYklPK0pjSFhER3RWT0xC?=
 =?utf-8?B?WHkxMFBhclNiSG54MkZuU0ZCcmZzRnhpTDJ5a0s2aUF3THlyb0NBOWkxZlFn?=
 =?utf-8?B?Q2lhbm1hOXlpL21JQm00ZndpSTB1L0N4Rys2RmZuQWxsUE5LdU9OZXdnVlEz?=
 =?utf-8?B?UWNyMDRPMGpYOVFHcnBGWHVkRXNPTk5vb3hWM2hMa0tzTEt4Z2NLNDlBZ0lD?=
 =?utf-8?B?ekgzK1l3bEtHbVB2Zkg5bDVwczVnMEY0eDVaL0U0K1FCaW9DKzhONFB4d0Za?=
 =?utf-8?B?anVmQ25FVXNMRXlST2k0SDI0SXRDWkZEamNUUWwxdHAyOVVyeStNZm5JYXdK?=
 =?utf-8?B?MnBxUzZsRDhEYlliRFRMa3RhSGtaQW8yNEVPTDRtOWVtdzN1NTFLSDk3eVJl?=
 =?utf-8?B?Q0NxcEhsZ2FCWi9nVStEaldKbDRrc2dDWTZHWXFzT05neUJNa0Y0K29HV1pZ?=
 =?utf-8?B?R1BnRkpoQzM1ZWo4Vkh2UXAraVgyUXJsZTVvL3A5RHpObW1BU29IejFrTVN6?=
 =?utf-8?B?TU1Nbjkwa3ViY0t5K09GSlhKZHljS0ZpWG52amhHMVlkM2lWUmFvREMrUU5h?=
 =?utf-8?B?cC9yZFpOT2djRHRTUjN1UytaZCt0RlBTWERNNEttd09mK0ZMcGxpUzNIS0pm?=
 =?utf-8?B?Y3VrUnVXOHJwb0pDdHZvbFZYaUNhNnM3aDgwNU1Ya3A1cjV0cXFYRzROSGsx?=
 =?utf-8?B?UGxlSzZLcEcvMGNDZC8xczYvcEJXWkk4eUlyUG8zR0QzbzQ5YVRPMXNjNEd4?=
 =?utf-8?B?WE9BMFNiSWpJSCtzZlZxVHhhOXRZMFRjNGh1b05SdElHTzRNSVdyTjFnT2Q3?=
 =?utf-8?B?ZUYxMWNsUk5yM1E0WVRBa1J5WCtMSjVnMUJUMjJwNG5lT1VTbjMyRE40VUlF?=
 =?utf-8?B?NkxmK3daOVdYV0pNQXZyYndtMHFMVi8vR0VZck5PeHpocGdmdFl1UDlrSUpP?=
 =?utf-8?B?bi9XWTdRdDNPSExWaVdhNGxiY3lwYWxiVXU3OXpnMlVaSFZNNXk1ZVdlQzEx?=
 =?utf-8?B?OG1SVE5rbmNtdVMrZzloajhjSkZEQnljRXh4MkFnMGpscmxJN1VWT29SWG1L?=
 =?utf-8?B?Z3M4LzRRYTM0SEpGUTBBVGM3YkU2bWEyVjErYkUyZk5IZGRzM0NFTHBETG93?=
 =?utf-8?B?bUprdGg5bldyMjBoVm4wN2VpWVJUMG4rUXAvTC9SRllBZ21FNDJZL0poanYv?=
 =?utf-8?B?SDlWeVVUa2d0cTJDSWV0OE1UR0NZd1dnQWdXRXNDZ2hTRDUrR0dHMmZncnNh?=
 =?utf-8?B?SXp6VFg3aVR0Vml6K0VLcytDUWZRZEl2ZmpzTnc0RXRkVEFYZFQ4WTdUNlNE?=
 =?utf-8?Q?LFg8Em8k5XsDd?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7944
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ff5f264-ece9-466e-3155-08dd5c9a91c7
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|14060799003|35042699022|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzhpczhmMEJ4eTE2VXNJdGR2MTRtem9wV3F3Z3VmVG40SWhmLzRVc2g3TTVU?=
 =?utf-8?B?THZwQVJrRjlORFp3bDBZUDZGMWVxOVQzL0Z6WExlbGpoK2ZLT1JqcHNmOGtx?=
 =?utf-8?B?cFRLV2pBRFlCR1BWY2c1RlEwUU5kQzlFMnlINnFTNjJaTE5hTUxCMWx0cmh4?=
 =?utf-8?B?SHh6NDc2alVobm9rRCtDWnhDbG0rako2YXpualNqQzhVeC9KYnJpbDR5Z1Np?=
 =?utf-8?B?T0RpYmVtTXpMZDVmTmlmaWF0bmxrdjAyWFhYVk1Nb04vcjk4d1RjU3NPWTgv?=
 =?utf-8?B?VDRTNGhrYW5tMURwQ3ZqcGFURXovSjVib1hDS3k3d3I3b1RRZ29CT3E3akFX?=
 =?utf-8?B?SS9uRlVqcStSV1d6R2o4SlVSVWVVazdyOGJJVElQMStvNG9DOFEwOWJsUlpr?=
 =?utf-8?B?VW9kSlN5R2JVTDhhZ0RLVjFSZHFjM01DZ2RiRGJGbEh0MEIwSEJ2WU5GK3lT?=
 =?utf-8?B?S2o2L2FScXdSVlZ5a2MraVJXblpiZ2E0L2Rkb3QvUFZhaU1mRGNuaE1vWkxK?=
 =?utf-8?B?VnRadEMrdUpXMkdkMElRbk03VWRmQ2pvSC9wQytNS0V1YzI5ZC9xY1NUVVFz?=
 =?utf-8?B?a2phUGFNTnlZbVp6Ni9qK2U5dklkRUZUU0JqczEzMVVpaEl5N1Vpd2VkQVVP?=
 =?utf-8?B?ck5RNWo5V0pybnRGc1BIb3BXMUx2eGc0VEh2d2FUNHJWeHdZbW1OaTlGN3li?=
 =?utf-8?B?SWwwaFhoSXg1bk12bDZpa3dEODlQbk1oTGREdnhEZEdCQmplNnBSbmRPS1VN?=
 =?utf-8?B?VUlOZUdQc29yV1NpaUU5S283N05GdUExSmVkZXdPQS9rWVozWlJMTk5TUWVQ?=
 =?utf-8?B?SDNZeFRuL3Q5RFdtRzIvWitOSjUzNEx6Z2N1TkVZOUVBaXhORGRmc0RzVThu?=
 =?utf-8?B?U2ZGeGw2eFh3cHNKcHlyV3hzN2xDYTFMamF0SzBDeGFFdUlaNDQvM1BVS3hZ?=
 =?utf-8?B?R2NkeE9XYUhwTTZlSzZ2dEx0MTd5c3I5QTNWRG1wdUNJM2R3RC9QbEhMYjJ3?=
 =?utf-8?B?WkdBQjZPbzBXcnR6WmRTMWpYVWV0OE9CWHl0TTVNbGoyeDAwbjJLWnZYNXlP?=
 =?utf-8?B?MDErYVlkb1RwOFVQSnROeENZRTdBQzlOaVB6clRlYnR4enlVT05mNFl3Vi9r?=
 =?utf-8?B?RHI1d0NPOUZ2Y2pHRkFGY2pidTFCMEVva280UUxIUHRYK25aV1hHVzVMV0k0?=
 =?utf-8?B?WkhzcEYyYzlMRjErT2hTYVZTWnFvV0FHM0VNWUo4U3pFSE56bytKM0RKWVlu?=
 =?utf-8?B?MHpGM1NWVGd0UXUyZkRkcytvdkRMeWh0TnIwQXpqKzREZEdDMjJ0dUtXVWt6?=
 =?utf-8?B?T09YRWFDbXlCdHlHQ0kvNlhRSS81aUlkSnpYZThIUGF2c0ZMd0VacVRLSkRL?=
 =?utf-8?B?OUVsOG1hYWdFdmhWeDA5WjVjN3dsTHRXN0Z6enZVZEdHOTlXNmZoY0twTWU1?=
 =?utf-8?B?VHMyKzlva3RZMm8xVG9Jc0VEUFhNNTk0VHo1NzZTN2lqMFVvSGVCd3I3c2p4?=
 =?utf-8?B?OVBWQVdqdFNQRUZGUkIwd0o5M2gvWU1Ud1JrQU0yL0xQdW5TMHZVU3dCUmpK?=
 =?utf-8?B?QlZBUy9TMzBUOXJ1Z0h6N3UzS0NiNnFIRVoreFBYb3gxQUJ4bXZ6aVQzRTRx?=
 =?utf-8?B?dWN4NG5JWUlJMGlnTkhYeW9DM0J2MHV2Z0U4WE1VKy93WDdOMStKL3poWUhq?=
 =?utf-8?B?NEVkakhLTHBRSWFkS09qeXlVSW56UUhRWmNuVEZtbE9HcUJYR1NNS3QzN1Zj?=
 =?utf-8?B?SG1WdjlEbE93elBEb1hzUlU4ZVBtMVArb1BUajFFUHk0WW8rcjJzdmNUNEVW?=
 =?utf-8?B?dVdHVjhOZ2NBYUhEQ0syZjNiV3dRTy96RXdjaU5rTzFQcFlJU2s4RHhOSC9K?=
 =?utf-8?B?d3NQZXdEVGdidmxFdysrQi9ZWDN5UzA4L1hWbmZPY0orenpaYjZxSXpwdDNx?=
 =?utf-8?B?OU9IL0NtaFV6SHpURzUrT0xyRzhUYy9YdFowbG9IM2NaSHJTenQ0V1FpS3M2?=
 =?utf-8?Q?pTCWQN2noOMy5ndSf2Gb23uLVvVHfE=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(35042699022)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 10:35:24.6129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af68f69c-313c-41eb-ac89-08dd5c9a9ab2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_023534_361669_0359D412 
X-CRM114-Status: UNSURE (   8.93  )
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

Hi, Suzuki

> Unfortunately, this still doesn't cover the current coresight next branch. I
> get build errors as below :
>
> "[PATCH] coresight-tmc: change tmc_drvdata spinlock's type to" has style
> problems, please review. This is because, we merged the coresight panic
> trace support in the coresight next, on 21st Feb.
>
>
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
>   CALL    scripts/checksyscalls.sh
>   CC [M]  drivers/hwtracing/coresight/coresight-tmc-core.o
>   CC [M]  drivers/hwtracing/coresight/coresight-tmc-etf.o
>   CC [M]  drivers/hwtracing/coresight/coresight-tmc-etr.o
>   CC [M]  drivers/hwtracing/coresight/coresight-catu.o
> In file included from ./include/linux/mmzone.h:8,
>                  from ./include/linux/gfp.h:7,
>                  from ./include/linux/slab.h:16,
>                  from ./include/linux/resource_ext.h:11,
>                  from ./include/linux/acpi.h:13,
>                  from drivers/hwtracing/coresight/coresight-tmc-core.c:7:
> drivers/hwtracing/coresight/coresight-tmc-core.c: In function
> ‘tmc_crashdata_open’:
> drivers/hwtracing/coresight/coresight-tmc-core.c:361:20: error: passing
> argument 1 of ‘spinlock_check’ from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>   361 |  spin_lock_irqsave(&drvdata->spinlock, flags);
>       |                    ^~~~~~~~~~~~~~~~~~
>       |                    |
>       |                    raw_spinlock_t * {aka struct raw_spinlock *}
> ./include/linux/spinlock.h:244:34: note: in definition of macro
> ‘raw_spin_lock_irqsave’
>   244 |   flags = _raw_spin_lock_irqsave(lock); \
>       |                                  ^~~~
> drivers/hwtracing/coresight/coresight-tmc-core.c:361:2: note: in expansion
> of macro ‘spin_lock_irqsave’
>   361 |  spin_lock_irqsave(&drvdata->spinlock, flags);
>       |  ^~~~~~~~~~~~~~~~~
> In file included from ./include/linux/mmzone.h:8,
>                  from ./include/linux/gfp.h:7,
>                  from ./include/linux/slab.h:16,
>                  from ./include/linux/resource_ext.h:11,
>                  from ./include/linux/acpi.h:13,
>                  from drivers/hwtracing/coresight/coresight-tmc-core.c:7:
> ./include/linux/spinlock.h:324:67: note: expected ‘spinlock_t *’ {aka
> ‘struct spinlock *’} but argument is of type ‘raw_spinlock_t *’ {aka ‘struct
> raw_spinlock *’}
>   324 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t
> *lock)

Sorry! I'll rework again for this. thanks!


