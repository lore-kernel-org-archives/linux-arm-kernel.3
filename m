Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F82CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAOVHKwF/2hmi+NZFs3WDRazwnigxA/YYu2wM662skQ=; b=RbUYWUDYWNQ2i5PiIgzJsX41sV
	F6bmlj1Jt8V9hHqDbP/v6Hgd15tANmIbFhHt1AhfNjXUR3fkZMW1MTchtMOF1596CqbNEOtFcobSw
	lgWiWHhdskEcehtb6LlYNrQAV4SvXEndQ1I0Y7I81UTSK02+gq53g0DZQ8VA1ZxIoDF3TEbCw3dXV
	ZXBfMRqk2dOrLmYXRykzwRh0+MFr1w9SUariWL7usbIi5alz9audisOzMbfFT3pv36dmRMpcgHEu3
	kTQMKGp9tKblIoCU9k9WH1jF/0NYL0rOIm2bDQPQLvX+4HLMRAmn5gpU/0a2M5dlBSpZO9NnkPtZp
	rl9+ViGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0By-00000000a2Z-0sZb;
	Fri, 28 Nov 2025 15:15:26 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0Bv-00000000a29-1L0C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 15:15:25 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=twYcnAjDIGsMOu4G1VkFpUvnmVgWiGeGFfWI3GZZT895lDIK1CsmZnW3TNJ2/3OB0s6zk2ZNfnJ6+ndM79+uDgkptF8cMadqjrT2YS88aamPahafq2Ep4HrjJiyVKO2CbtCaqcNQF+bZ65ztmLoPHX+rVdzyMDFmMgFpIyqaZrGGADnnV8Vx18tc50ntfygLmLGITrnFMB1Xb9gxdJXrj8WPGaIBZlkp4YhaW8mgpG9s1Q/C253zQuSB472iSx2nEPR3zK885J5RsEO4i78++/dhrPRIuEP0iHYXIp9kWZcrAeEcn9cuRqXh/q4CTuuwijnMJqa/u0gK2ykH2Kxwwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAOVHKwF/2hmi+NZFs3WDRazwnigxA/YYu2wM662skQ=;
 b=G/y1AUZzgJrKgLijZ/HytmIOmKLtJv+045OEanfS2kT8ImHiiA88n1i5UAXaO+DA3Uqi6IPs3P3Y+h6PNANtuvuU8S1wdG85SFFbZ+dqMqAcLkZLtROvL615tgPE0bwc5SjMRBOxNTAmLwsVdDmCwV5cIzdOFFDK16wF27uaui9VmJjof6ulkBCrpB11HbxMa7PDcmURAHn4z1CMadSRyuOU2T3V/maj1+SKPNsSwIH4j4kjtbncoaTkR1fe9L9726p45Q3dXPGCqtTgBgLtWQsqjLw9qqDq6v4Eb75wDLHoLubDexkgWfbLYJ4eLm89RUdNCt86ecter0gXdVqlTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAOVHKwF/2hmi+NZFs3WDRazwnigxA/YYu2wM662skQ=;
 b=AMoEeVXiLUSTkb6aMwXEeLL5k0W7hU1x6nQuKm08m4YJtnuWJMwnW6zn/KkJa7kVSEM7DVPhAMqd3iT0CzctIykf7//nkZPfJEwN/wSe1YaQDKoXQr+inqWreo6UT0OoimZsmaojf8EB/EDGB3Csy+eyOUvEQMgzr2P62yNLWpI=
Received: from AS4P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::7)
 by VE1PR08MB5598.eurprd08.prod.outlook.com (2603:10a6:800:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 15:15:12 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::ff) by AS4P190CA0036.outlook.office365.com
 (2603:10a6:20b:5d1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.16 via Frontend Transport; Fri,
 28 Nov 2025 15:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 15:15:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2LzN1WFH7LcrVj1vqk5ac7qSFMY2E1ymkYaH/F9UCT0Q+LLv+IW/I5TjoB5LG5UCqCBYgLQmgF0F3Aooau6HK4S4xwtyerK62q/F+VhYI4BwMDOmJAw2qn1GNw1aT7e/KHM/2JbkaDHBVqmeH7Ao4Tzo9blAIG1SjMPdK4CdPiGEdJV5WmEIzWZbK8ipNzShlHNVqzxeevFQH8gmS9mzTYc5zUik9L5jxzAtlvksbjrvC5+OGMd0MXrpvV7g5o9d17bPo2Ru04wKASHG/P8Ovc5h3TQrjHieJ/pgrr2IkATnSj1Tjs88CgKk89HUP52TLsIPwk2zmF9vEsbXyQTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAOVHKwF/2hmi+NZFs3WDRazwnigxA/YYu2wM662skQ=;
 b=SpPRXxpqVRlMZQbIgAt/7css5r9TOEFSC87+Z1YEDAtjP6b1ZE1mBjDAG0lnjcf6Zqpmw592qi7y2kJXD74Z8yET6YPsPJAFpKL8QU2gTMIUqMMZ0WLDJM/VzTutJE8t6bYHOiqKjIv/FFbmOU2CGC19JFJFjB7U5d8g5J8xsK6V+hcX7wDhD5iYIz9q4oUGkRl0g1Q7ir2LubgL2xDR0dftJJOCxT1PJUTE33EjqJf85+JTXD0rnVszBDoSouUTCPbSmUZFVL+aZjqGhVuAGfXHV3qVbsfhE8LSwmRMs0i4l+9927SU0bxn9a4fns0sOIqRFnMqrx/QN1jOsCpDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAOVHKwF/2hmi+NZFs3WDRazwnigxA/YYu2wM662skQ=;
 b=AMoEeVXiLUSTkb6aMwXEeLL5k0W7hU1x6nQuKm08m4YJtnuWJMwnW6zn/KkJa7kVSEM7DVPhAMqd3iT0CzctIykf7//nkZPfJEwN/wSe1YaQDKoXQr+inqWreo6UT0OoimZsmaojf8EB/EDGB3Csy+eyOUvEQMgzr2P62yNLWpI=
Received: from GV1PR08MB10932.eurprd08.prod.outlook.com (2603:10a6:150:1ee::6)
 by PA4PR08MB6158.eurprd08.prod.outlook.com (2603:10a6:102:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 15:14:08 +0000
Received: from GV1PR08MB10932.eurprd08.prod.outlook.com
 ([fe80::7b08:8b90:6e48:c4db]) by GV1PR08MB10932.eurprd08.prod.outlook.com
 ([fe80::7b08:8b90:6e48:c4db%5]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 15:14:08 +0000
From: Al Grant <Al.Grant@arm.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <Leo.Yan@arm.com>, Mike
 Leach <mike.leach@linaro.org>
CC: Kuan-Wei Chiu <visitorckw@gmail.com>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>, "pratikp@codeaurora.org"
	<pratikp@codeaurora.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jserv@ccns.ncku.edu.tw"
	<jserv@ccns.ncku.edu.tw>, "marscheng@google.com" <marscheng@google.com>,
	"ericchancf@google.com" <ericchancf@google.com>, "milesjiang@google.com"
	<milesjiang@google.com>, "nickpan@google.com" <nickpan@google.com>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Thread-Topic: [PATCH] coresight: etm3x: Fix buffer overwrite in
 cntr_val_show()
Thread-Index: AQHcXs17ykfpItnc/UWBs3XFE3Mz87UE3d+AgAAFyYCAABPFgIAAHvYAgAALcYCAASFJAIAB7KyAgAABSrA=
Date: Fri, 28 Nov 2025 15:14:08 +0000
Message-ID: <GV1PR08MB1093215C7FBF6603DBA2CD8A886DCA@GV1PR08MB10932.eurprd08.prod.outlook.com>
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <20251126120914.GH724103@e132581.arm.com>
 <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
 <20251126123147.GI724103@e132581.arm.com>
 <CAJ9a7VhD2p3qMGXNg6deYjE8myB5euHR4FcAFwgg0KWF2HO9JQ@mail.gmail.com>
 <15d536f2-0829-4f3f-b111-b15b14236bd2@linaro.org>
 <CAJ9a7Vjia4ENewP48nyDWBcBFbDmwb3vM2JNbNCw4-3yF3ABVQ@mail.gmail.com>
 <20251127092942.GO724103@e132581.arm.com>
 <8c7be69b-2227-45c2-9096-a49ec6df9a09@linaro.org>
In-Reply-To: <8c7be69b-2227-45c2-9096-a49ec6df9a09@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10932:EE_|PA4PR08MB6158:EE_|AMS1EPF00000044:EE_|VE1PR08MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8d037c-f767-4210-403f-08de2e90ec93
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|4022899009|366016|7416014|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?OmOdC+gn+3zT2JWrEmm+euAfEx4x9E9Go4Sk+38PtWT2Zwo6/xKJ2UYjj2i1?=
 =?us-ascii?Q?jMc1QmTIwnUffgZ7+3HqXBnWFtntKKHakvAShROBdQGxm1uJKcfIMcpVLfYw?=
 =?us-ascii?Q?iE+d+NP8ziyAnpRWbsntjpc9fPLyVDiyrstA+C/3r/7hsDN5e8s9BmK79jJI?=
 =?us-ascii?Q?Wfd5K236mUI14lWJ+c/n/YDM5MfqUaImflKjQjGSH0X3xZqKQk6DW6oZhHbT?=
 =?us-ascii?Q?C4jkMQ49R8ayNGbNMOMm7vKBCdoSgmVszfCzUWfmLa+ZGwr7KJNRys3uJ/BG?=
 =?us-ascii?Q?KzwJ4g1WpM6xtN6PHRYTY2fAztB0yU+XyhY5zr5vwzH3G20oDPIW8scbejee?=
 =?us-ascii?Q?r01Y8Tnc9vSW0n2UAod//KxOlr/cDW3g2sUyIMsDo1/eq4dH3wBIAsLCVLQS?=
 =?us-ascii?Q?G2YdcwkUl/w3cOpPmIsZUFxl4YkSmZNlMNltsYwD9NJ6HouFLxaj+2pZ1Xth?=
 =?us-ascii?Q?XcbR0I8HJuwcwlisKXUSmyAIXWw9m+EIYL5Uh/y9qsPQEHyJG6Ee4ObY8VdJ?=
 =?us-ascii?Q?ROwUd4rcdSOAXHKe9z0iI33MiptrOzGvwnNJvt3p3NED1m0ori5Ngh4HAmfy?=
 =?us-ascii?Q?XANqLeLJocI7Ew4gwpebiniwgN+1r+AcAjqNSnbiHOG0f+lsP0iElhvwq5bA?=
 =?us-ascii?Q?TkVZhww54tG8Nsdu201YkpJxaXVaau7+OBQVX2zNecFFfUSp5TZ4iztB4GYX?=
 =?us-ascii?Q?qVC5q9enpeqHqulJ07D2kb/mruRJy9/LvKWUIyIREkA3jgKIA0D/yzaTGxng?=
 =?us-ascii?Q?F6DsNgvHe+ai7mhqKL/w0cSiWgQBqTbzio9AbnuXa6RA/4iEBNEEbzFrM96C?=
 =?us-ascii?Q?hzhDwdx75IBzaoj3HANF7btSZy1Xa8pjXDqDeqnwPLWpq9AyKOHKh7lwRmF9?=
 =?us-ascii?Q?E/fYg2Y/kVl5Ktf1gU3CpK+J18GMAYVG70KQz4m6eQh7Hj2MFh+0qpZ3Kj6o?=
 =?us-ascii?Q?rMYh1kJZS/mZg1rAtTOIiuer3NBPXp3SbJTyOkoRlsrjCzeVoYZ65ItcRbj5?=
 =?us-ascii?Q?SQlbuMrAnqgPaaKu0M99nP+XK/NzN8sEfFlhcmUmPWgt25tI+s6/OC8QKC1H?=
 =?us-ascii?Q?AW7cOqzjxzWFoSbnAVFKG0OL7FERk7AMmsJV9AiBqROBqQsg9gZwYZu6Sh4m?=
 =?us-ascii?Q?kQ0uAD7/9D13Mf6CLyx4HonoyIuk/rV/cJ7tHBDyEXnYUj5jDUncLv4TBTJO?=
 =?us-ascii?Q?ADUceUKzIrDbjXIwpuYqQ69mcfJzb4C3Tguhz+3h0XF3lL/zYpBY4M7tZDEx?=
 =?us-ascii?Q?JBgr/fAKxshw4nZJAjh9uHX4fSsZlGVHzPEnalsw246O2jogzp9FnY0ZkLut?=
 =?us-ascii?Q?/t23VaUPAQcdxQ3lxE/cE02ICGz6lEKSJehM/U/YuOIoThyCjw7+d9BnvNzf?=
 =?us-ascii?Q?Jec9gXfD5hcz7yJRWfQce3hYfAHA6ztPcT7Ymfq4bNjQViRTiJ24WEN8VHEE?=
 =?us-ascii?Q?KM3ckvNNRDuPM3qqtJD/uxyR0M/LjD5vjujXl5d7Pec1fJz6c+fPX4VMPJ3Q?=
 =?us-ascii?Q?t7FUI53WroMHzPHv60B8lGgkuSUFEiQzgowz?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10932.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6158
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 35a0a6a1-15eb-4f31-f533-08de2e90c6f9
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|1800799024|4022899009|35042699022|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CQAlaCgF4BvGuiTfnmvwOQlF7gQuDpttwjWsU+8pVwc7QhUBL5RK1PcEXoe3?=
 =?us-ascii?Q?rJfzm0PDgwNWrB1tkKgLayVQOatcPQnaEflVWn7hFq8qNjfCZcLWxtkDVDW9?=
 =?us-ascii?Q?fwxxUdU4G+NRLqCRdN/Rwy775Wu5Y6zk7ZOHPirsDb/zdxN5TbOnLevFzgXn?=
 =?us-ascii?Q?eaF1H3sVnRoEGbDetd4UhXvfsL09eSWlBtyR6Sbt+a2dyP7+GTs7pRz15C8d?=
 =?us-ascii?Q?r8iMqCSF7FjAx0i+8+DpNGwvAoCnPm0aPnpOJdn+s61rzjqE3oHJdm1JMCUi?=
 =?us-ascii?Q?ClxB8K5EZZEQCv3MTxv6XvGlIAXksk0k3CxuJwXadIHg2IEiOnHem5bckXhW?=
 =?us-ascii?Q?U45hTSkTEsIAbf9qK0N8a9/n+G8hnbFqDxsbMYSydmMdkxclariyoECN2hBr?=
 =?us-ascii?Q?WR+1c7C2y0O8w3uIKg8ZL0Ytf0Ag/N4T8NKteKX/LbptudDEPd7ttvSf+iBE?=
 =?us-ascii?Q?gEVe7gsBC/LVFJJN3BhtuCrwxymGHwzwQIVAKSp88va5FZvW8mu0tKxV6/aC?=
 =?us-ascii?Q?ySUEEvRmiGLbDli4z4FiQqX1Yux0/xlBN5PcIcVHRtSm9kMuPI29t6Olcnqw?=
 =?us-ascii?Q?fZfl9R0fxwCCviE9qPYSVXRas3uK32shxijz0YIgoDY5m9u0sOmhZB98HenC?=
 =?us-ascii?Q?fkoTlpGYLftcdeRySSKF/Jf0Web2JyPZksnazc/c6moF7C72kwCdsrKbhsxv?=
 =?us-ascii?Q?lEzaKHdWFHSMGDbYaQ4MJ8fy7tzVRvAMj3UD4A2uGAsVfrDBTa75riZzPjsn?=
 =?us-ascii?Q?iYoNgiFCWPXLoiQt+pPtXxt7fn2eBy6mkQtfGyBgc0ycRlh/BXRB/fkAZtCS?=
 =?us-ascii?Q?/UJ4z+kUM/gkA1+Z0VZOGMZR4mW1mcXqgR7la2AXaHYNgHVA2yLlRisazRHz?=
 =?us-ascii?Q?yB3vvsBZRvtUgNZNf/TT16B2rYtDUQ0ThfRETrhQFQaaiHcaQnUzia92AbtY?=
 =?us-ascii?Q?WHJ4BZVIrSB3XD3caxPqtyRvcwWcp5ZReBuKx94dTVkxmglH7wiQkmZkQpn+?=
 =?us-ascii?Q?BVacRULkP9PkZtLN6B35/DfztfTAZbTAg/VwKmCyeIZvSmPfMt3FYin/LoZN?=
 =?us-ascii?Q?HIW6ZK51VL4FeokocZCB0W8ynmYXWkxgIFljECRVsIic2OR9g1ZQ+O/z/FX2?=
 =?us-ascii?Q?5S6Vix0JNlNzYim3fMRAJQ2h9YyiUgpAtFdrPH/7CQTDiDX9QsjtdA1xHlcv?=
 =?us-ascii?Q?c7uIYaZbPf98uftdFd8aRp4UIbYFN9iS/+XjEDC6G8E3jIivO1CW24q1Fr9W?=
 =?us-ascii?Q?PZUwQcgk5k6OUuIKkh94BjnvowCdz75xEmt/VBS/Pg/JfjBWWpuuyJML57L/?=
 =?us-ascii?Q?t3JFmcHxNGqrxQ4XHK0xU/Uq/O9Gix07a/O9puNh4Sm3uXYWbqwfKq8++m8u?=
 =?us-ascii?Q?WWuG8kpXhDXyyVBM+T7lMzlv42Nzh4bFW/u0FD+vI906PhNtYY0t4o+AAAMm?=
 =?us-ascii?Q?fFmP47mzwgN5Ci2J/pdOBjHsa210jvVXFIBknmS5NjvrbB8QR3LKYBEdAS8R?=
 =?us-ascii?Q?/89FJHXOAmxzVPjFLL07iUSf7HDkNkm4DhkrQPUR50jl3lqjhItBiT/2szmV?=
 =?us-ascii?Q?nXIxwTnJjHy8lD7Bggw=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(4022899009)(35042699022)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 15:15:11.1490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8d037c-f767-4210-403f-08de2e90ec93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_071523_532181_BD8AFBB2 
X-CRM114-Status: GOOD (  19.86  )
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

> Based on the the build system I don't think what the hardware supports ma=
tters
> that much. We've always only built the ETM4 driver on Arm64 and only buil=
d the
> ETM3 driver on Arm32.

ETMv3/PTM don't support Arm64, so a trace driver in an Arm64 kernel
will only need to drive  ETMv4 (or ETE). There's no need to build
ETMv3/PTM in 64-bit kernels.

But a 32-bit kernel could be running on a CPU with ETMv4 - this could
be a legacy 32-bit kernel on a 64-bit-capable CPU, but there are pure
32-bit CPUs with ETMv4: Cortex-A32 is a 32-bit-only Armv8-A CPU with
ETMv4 and all kernels on this CPU will be 32-bit. If the 32-bit kernel only
builds the ETMv3/PTM driver, then it won't support trace on this CPU.

Al


>=20
> I just found another bug which I think makes sense to log here. We've pre=
tty
> much always turned on timestamps automatically in Perf, but for some reas=
on the
> option validator in Perf thinks they're not supported in ETM3. The driver=
 has
> always accepted it as an option so I'm not sure why. The end result is th=
at the
> command will always fail, and you couldn't even undo it with "timestamp=
=3D0" until
> more recently when I fixed that.
>=20
> Sysfs or per-thread Perf mode would be working, but it's one more bit of =
evidence
> to take in.
>=20
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org To unsubscribe send =
an email to
> coresight-leave@lists.linaro.org

