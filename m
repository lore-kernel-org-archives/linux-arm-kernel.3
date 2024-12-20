Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585ADE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SV/eYDdKUEzxzn2zEZbMFhcVGIha8GxArdIT2A3JiME=; b=uqK8EVsr1NNqWrA4OPxHAspR2G
	tLaSUmhFnsl8qfKUnvZ90xIWf6qWN82C1oCIlH4eNKLqySU4k2dJrGGAifc8VwEZECkqG/Cw9LnlP
	X/m2/iWUZ4Gjx2VOUaqYMZj0YZZPWkujMU4xcahkEioFT0W03QJ3hHb56lR+ETwoHoIRkP4SIw9zE
	xdf0GiK6gBjn4cPkO+bduSPB96tykaLSNe99dVJ516nGjW+iIkh6rSrSq67y7JNRmN3itrbKrAsam
	R3xXuOl+cM/RlwukbybHaITWuftLGXN6dz895bZKUkPtWtMfyNyjQ47xP6aJZ/EypfSNff3+cM264
	PU0Dw1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObP0-00000004nxo-0xVe;
	Fri, 20 Dec 2024 11:42:42 +0000
Received: from mail-am6eur05on2060b.outbound.protection.outlook.com ([2a01:111:f403:2612::60b] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObMG-00000004na8-47Tb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:39:54 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D6ioSCiHmLn9wddbZMtX4i6oGagdLHlUJXmYObeIeKXFRwshex9VrHEfVUiMHEgVht7gMKhrlp06gV0C518n8cIrD+YyzwdhQTxiibN6l0h2W55bG0kSgn2nInxwxwFGnnYOjbgX+jo4A5Z9sKBkck+feUOSpaWLMji4fOui8sREnf0wv/yktFPgNeArSL0P7iqDtAezPzg5pvOs+P9gyDEtrte0OrL/TNBf+CfVBWR7RpSm1xdsm2qIr96yT/K3uhOsLVP5ENQELa37vUCaaem4lGlo71TGRuqK0liDjczEAr8y3zeh/cVxTxeVl4j201AYOE89mNiM81FOHLCNIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV/eYDdKUEzxzn2zEZbMFhcVGIha8GxArdIT2A3JiME=;
 b=AnkxLr5Gf+LAFAMkEimhHif71JZgAkiiYyo3RKhMTx5oGV+3o5GeyWeAmdolD7XjA4B5enrOtAx9DVL8FxB70qusxJ48rgJ39Fexkk6kZncOYt7D+oCLOqs6Axd9GegkCtzx3TFTY4JG5AJD6ZEmPUsCL1s0sjpzJjlf+mg0tL7cpBaviJfH/aX/FNgpnR1Px5+fyJ1eD/nP+T2uH6/MbjAlahzLp4WCOVeNS/10IJ5l7+DqH8l5XlDOANNtwYHewcWdKeJ5JHxZMq5J0lRcXMFDOANNI6iRD3efHnWcxlMHHOCgBSaDPVAWz6JXr4fBZ5uitnjuGLlT/nxJfk9Dyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV/eYDdKUEzxzn2zEZbMFhcVGIha8GxArdIT2A3JiME=;
 b=B6/h5krMNbrhrGTg3NRXyykygQvT4qbNXAT/MMjnigpr3qtDB3LzZ+AbcBwtPlDb6jBW4W+51yYm4cH6XHT2b9xDhzVMXddj21dHiskCfe3+vbTnS+O3zCO89FvSFSh4AYty5UFTMmXhQDGfTnLL1T141lwOxxEWrLhsdplazgQ=
Received: from PA7P264CA0078.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:349::18)
 by VI0PR08MB11170.eurprd08.prod.outlook.com (2603:10a6:800:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 11:39:47 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:102:349:cafe::ae) by PA7P264CA0078.outlook.office365.com
 (2603:10a6:102:349::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 11:39:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Fri, 20 Dec 2024 11:39:47 +0000
Received: ("Tessian outbound 050b604d5e06:v528"); Fri, 20 Dec 2024 11:39:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96ad9075c2614762
X-TessianGatewayMetadata: VqSotO7coeJzeQb/y9/B3pURX+HoxqJJcBCt2wPW6Zr8uLB7eNqK2s+Cx+Gn/lXUxLYJMBBOlNqR2BjHUvq3HJCj09PiXuK9CnZ7ODq87nv8gBOPJWnKuPuYkg7T9x9GtYowJadOcKSDLs6TZtS+Eg==
X-CR-MTA-TID: 64aa7808
Received: from L1020f6caf7f6.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8D464D26-C1FE-45D6-ABB4-C38E4582B466.1;
	Fri, 20 Dec 2024 11:39:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L1020f6caf7f6.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 20 Dec 2024 11:39:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkO1HFhhjSZLqd2dGhmnUoXVygbvn4hxfEG7RItZZXn6yCD4j7020Y3TheL0ch8z4nwWOi7UWepxhxnsYONs8JLHx+1mL/yp7s3Iv9etpdDIaNnbBF8mmTWVXA5VmGCaLIcO0dGyAQ9OXIfzaga9U/E5q5Zzoyum6gtNZjVsqJqr5obd2fuWqwKZ48KBfhJmkUg2NVUCTZEfxxIi02Um8LWnwUhHSNWLx5GMMD3sqIjewmIXoPPePSTyrJmQOMVG3rgfCIBPubZspOpVS02tfK4PNGgFZSO79Kg1iDRqRIsKVuA4znxt2KOoSW9H17WI8W8kLGgk2SWLG82YyC0PLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV/eYDdKUEzxzn2zEZbMFhcVGIha8GxArdIT2A3JiME=;
 b=u0Qg7ip23J5KQzx7spcQAnUhsvvacSqVDiT5p9q0Qi1gBUMEwchrd2aqVFzT8zLawtvz1P5BwoNHa/88DPQC51ZnkO9v9qJlk9uKHqPykCQ1eBpWOVegiZHAm+rnp/cux/zCJRms77cU+BrUS4RO1oKef+unOd9lO0GjbuZQ4cQzCPMsx/IWsvtxuoQJPZM1pOqgGeIsqP656tS5Rzo+2XfLrHhLAj7oFuo9/uVOKgM4F4Shf1c8jO1Jr9DNVgI7upgXwSm//RhDwlZ0BnVUb7+d6SxlaxwhAbNijmWlBS5QqBNxBDTcTeR21DzCMnvLIv++OvMozkgas+8RRhJXnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV/eYDdKUEzxzn2zEZbMFhcVGIha8GxArdIT2A3JiME=;
 b=B6/h5krMNbrhrGTg3NRXyykygQvT4qbNXAT/MMjnigpr3qtDB3LzZ+AbcBwtPlDb6jBW4W+51yYm4cH6XHT2b9xDhzVMXddj21dHiskCfe3+vbTnS+O3zCO89FvSFSh4AYty5UFTMmXhQDGfTnLL1T141lwOxxEWrLhsdplazgQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB8PR08MB5419.eurprd08.prod.outlook.com
 (2603:10a6:10:118::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 11:39:34 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 11:39:34 +0000
Date: Fri, 20 Dec 2024 11:39:31 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Message-ID: <Z2VXc/R/nOLGz+Cg@e129823.arm.com>
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
 <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
 <Z2VJIh2+Z40bZi1e@e129823.arm.com>
 <ac537889-dc0a-4d2e-870b-c5a33279633e@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac537889-dc0a-4d2e-870b-c5a33279633e@arm.com>
X-ClientProxiedBy: LO2P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::25) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB8PR08MB5419:EE_|AMS0EPF00000196:EE_|VI0PR08MB11170:EE_
X-MS-Office365-Filtering-Correlation-Id: 4575215f-2587-494a-d548-08dd20eb01a3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?iBPhkP5OY9kEnlP3KAYBk1ODgPQCtl0B11xpWmyQNPzoGwMm/mO+1MdNtB8b?=
 =?us-ascii?Q?SqhMrcpSnd/B0ARy4nKR9oTVdhucg9L7kkj1ryLVS42Xselme4e94Onxx1Hd?=
 =?us-ascii?Q?kHLfhUMACcp3nH9PGlcXEI11e7EJc6YtlzSW3oPzgfpG8JweAm71y1RnyF9e?=
 =?us-ascii?Q?ayARKwM4lF9XFP0EJ3G/qtnHCxz6hU2lIf9Iv0NhkrtL4oB2mKkmiPF9n5cL?=
 =?us-ascii?Q?C1shG1819reUfrBoAD5aOixek+FUfF64lsf4WUPKPIDR2gRAfzZhI+J5Fivj?=
 =?us-ascii?Q?tNXItVvvxB50QFdAC88wCQyawW3Z/a5VTNXwXsIOAi5jg1Eez6K4Rr8+BsuU?=
 =?us-ascii?Q?M49xoqGnADZ8FOos75u7oCFx23l6G8nean5OpKU3APGMOvVs96QRlYwbQt4J?=
 =?us-ascii?Q?EJcx9mN0QULhRxUT2C5Ou5ZpCYJDU8loaprNQDP7V1D4UXMiz6YTGDEMP3st?=
 =?us-ascii?Q?puBadO/9R66Bhg2qMlWB23QIUyEDEUjyczW4xgNemq42I5bClLNPCfCpP8l0?=
 =?us-ascii?Q?/Ydnr9BwSkRlZawABLkXkIGLIBHiE+itO2CHS6xRiPUNj9UhnnAcmtuL8Pcn?=
 =?us-ascii?Q?7OKXkA6wIadsznYZMSB4okz+wuXkJEkiOSBzbO+BoZr0Aicsrk7d/JeckgDm?=
 =?us-ascii?Q?bpGRR+YLzYMa0tACgRpQEYDp+nLReT4VIsINVpOaPJ9FuPuvvE5W6xIt7kZY?=
 =?us-ascii?Q?D6stZx2QOJndAWpS9jQbzz/8m+MR/N2objS6AfQG+JgNwM1u4DBltxIddwwl?=
 =?us-ascii?Q?FTIIDWPE4Vxe+nOqqgk97jWEObBs4Jpn6SvHdoQyF5qXMM4HUoJgBJ2DZG8H?=
 =?us-ascii?Q?09+zo1PM5ZYOOJqZqnzZ+cFxPUpIDzO/+NmyQZ54lpxiIctFDFljYyXdm4xp?=
 =?us-ascii?Q?t8Kf6P+xVu4CBOiYLYsVpKPkkDKs9+YjMx15UqpOXjuzKgMePC+ZXcs072KL?=
 =?us-ascii?Q?iB2aV5RhxxPGoly6qwDAnrKiI0PYO0ibJabXr2JI1giJ22/+CBdIYeZ5mEdq?=
 =?us-ascii?Q?Y7oBjm0neQEh8BNHSdg/S66NDaSiKQavIMo2l7UY3ouHOHKpzhgNbimBX20h?=
 =?us-ascii?Q?lxb3Rpdd122h7NCDNynFrqa+q9IiAGS5H58OnCVgue54ZkwTUbEzOUhqatCt?=
 =?us-ascii?Q?JUYKFbiJVI/pUOyy4OO8ydfzEDZ8OlXh768pE4/D8XHBlZoLvvGRno7yN1O8?=
 =?us-ascii?Q?5i4jz65qFoa9Yty9xXPdQfy4g36B+8q6ajQm3QvoZi7gNIJNak2RlAP01jFv?=
 =?us-ascii?Q?bHTg0iOsLvaN2mZx5sixQPsswYZdPZLwa2LHbjSjfA0AaCc/wAKlLOcDiKxJ?=
 =?us-ascii?Q?gTfdIlzKdrDvxRpxPnM2mpdbFO2dx4hHhttMYSoTXsVjvwi6FX2LRYpnA2HX?=
 =?us-ascii?Q?JitNfC8iJRZrva1o8xjjuft5Dw8H?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5419
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 547640fe-10a7-44c9-328e-08dd20eaf991
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kpkOaZXzqiXwJaLi9wiwGT+EfQRiBrkrbtZD43WXDlG5JBCa/LE4o0RGBHU2?=
 =?us-ascii?Q?kuAH98z27g22B0Wfu/CCmbYmPWQVksXS36ZY+qrDGr2UO+FJxrKoquWhA2qe?=
 =?us-ascii?Q?vGZU3yCoKYo0TCf+9kapWQeDNEn/2SXjKwS7dKIclABD8D71lFEI91gvGHh+?=
 =?us-ascii?Q?YsmvIvWKk2RMY7KquZa82qTdWztuVMpZb/xeBN4EfjEod7qSgLN0K3UWWkV0?=
 =?us-ascii?Q?kTrh40iA42brUheTYl8vilL+9RGSEthuqbC+Mo8Jdir5vNi1Nzfmr8Kjd2lx?=
 =?us-ascii?Q?asvkGPv4PFwf+blIc6l4+hZzQ6Ko+vV65+JnrpBjtrkF/UefUfwwjp2jqwly?=
 =?us-ascii?Q?g6oiuufZXZcnA4QdRnmUi0n3e/CUCaPHIbHzUTzXjSAgvAfRCaRjgGcKcFT5?=
 =?us-ascii?Q?mUQAlf/CkJn3Sb2dbIlnBOVoMD/Ei/tpfpFaWYQ9Q11uK8jzbiXFHCNTL0CZ?=
 =?us-ascii?Q?UvxKtHcKWbQL076uXd/2LVt1/TfuzwgEdICEK4RMnPrGwvX6wFTQUjI16P0r?=
 =?us-ascii?Q?0KvbL9szhzvD1nvSwy9jhxNAHqziJIMaBAa48y7wsGmrn1aMkolPWLxtiUi0?=
 =?us-ascii?Q?0yFC4fuCiXk/GBjZ9v/AeRW+ljZMqLnZAiykKzhhDEAMYwTgri50ILPJOz28?=
 =?us-ascii?Q?8N/TcXsVwtGHeUDQcm/4zM9Pq4VKLqOoVBvxiFn5ZRgFJPRCjFGPXVudmBBn?=
 =?us-ascii?Q?hkOgD554VJtb3R5n9QYCQdEfKIlogqQ8odBtz0Es2P/2DglG5vD8eMn5etc4?=
 =?us-ascii?Q?OBikSD+1ob0q8BpwtuSNXtcLrjBwShJCGpY4DOAut7y0vWBUAjDVL8CZOCUj?=
 =?us-ascii?Q?8xxURBOL1i4sduwEWeiKfKsBq2kZNuUR2Tk2IS7W3XcKVsP3pnAExa7zHmzp?=
 =?us-ascii?Q?M7I4H8hKK/z4xuKd3wo4bEGaVhBUp/aN+ijRi3N+3iUy6evd2E9LPoEHUgPT?=
 =?us-ascii?Q?/dmu7G3HHrzSK8UIAbm0K3Sykv+mrCqFt86s1NjmQNmwsCkWf3B5n+MIjvGw?=
 =?us-ascii?Q?bmZNeCVPoyqNjZt2dQcfTyvURCBHfBBT+tS70iA6/rQuMLLNVOeJiI+FauR0?=
 =?us-ascii?Q?Z+By9XEvb44Sp18JYpH9J5ObdQTJVitSA1Pg8AYzRomkiCVI5QwQuwVMDo1P?=
 =?us-ascii?Q?RUHSek18rmW8t8QFWq5tdYhJhvxu1g4YV8efbk1rcD+rHcWp8L1JcP6obUxz?=
 =?us-ascii?Q?hYX2EJGvJLyr5PQdfFDGxX5FfY4ZYXa91f7Hb96duofraOqrpHe8YqxZzMv/?=
 =?us-ascii?Q?dd8GuSLEcBcXEf+9IY+aXyM44NLWMQuJNrY4r13Ih0QybwMtkbMnRNvj/fW0?=
 =?us-ascii?Q?aZuXndEYLnaSGeJ4QfVL/iqrW0HjSNMn8CGzHB4hOFHxc/ei/PVMLpf2v50R?=
 =?us-ascii?Q?05rp+UsjlzTrJDfXjDtrurRCuN4oLJ/Vwz9iLGyrrUHSA3l4ZR250Q/ovR7v?=
 =?us-ascii?Q?CERVmHoIX1jTRNIQH0/+S/wdO2dclIPiS/MhUcvye0hSGbxXgE6Gb50YgLnE?=
 =?us-ascii?Q?VM1kiQULhNWYmTg=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 11:39:47.2927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4575215f-2587-494a-d548-08dd20eb01a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033953_321914_82576C8F 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Suzuki,
> On 20/12/2024 10:38, Yeoreum Yun wrote:
> > Hi Mike.
> >
> > > Notably missing is the same changes for the etm3x driver. The ETMv3.x
> > > and PTM1.x are supported by this driver, and these trace source
> > > variants are also supported in perf in the cs_etm.c code.
> >
> > But I wonder etmv3 needs to change. Because its spinlock is used only
> > via sysfs enable/disable path.
> > So, I think it doesn't need to change the lock type.
>
> ETM3 can be used in perf mode, similar to the ETM4x.
>
> So, you need to fix it as well.

Yes. But etmv3's etmdata->spinlock doesn't used in perf path
its usage is only in sysfs interface path.
That's why I think it could skip too.

Thanks.

