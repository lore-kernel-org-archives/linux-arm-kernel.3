Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED70CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 18:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqqhfiUn7yO+qkyos6zvjgthB4UF8WiPn76nMktJLgQ=; b=OcbRk63VmOEvem9ZgJJD8vj0rh
	xoCeIf/2bENDJBvp0cPU44aa4NCW0H0LHHxGImWkjs8Pxn9aqD/sYx7dGmTnLJfLNn2stVAd4kZzO
	LSAbVwGDh930HASC523kSGlzgd3rIAvihDgU37pcnsSUWHi9EyPsNrQ/f5dg4yiWrXW3Mgecp6gfY
	bFYrCDZ156fApsQLmxpsNR7u03RbQ0zGGcF5zkxSr6tNuVXPFC1pn8xJMBHbWbccceUbEWt5dHqsj
	wjR9mBbI+9cYhOBFmzm1Ewe+UcqlfLO98TCT3nlhGVcAVEVNMK250awv9cC5+E9sdiPszCLq+TSr2
	TShjaJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqo3-0000000FilZ-3F2X;
	Wed, 03 Jun 2026 18:59:11 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqo0-0000000Fikl-326Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 18:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYJUrR4OoMb8wSomHnfTJZq1D0qynAv/cKBxAusK3NrZ/WdvV9Aj/Q7Br5g/hqPuf8UUtzZWn1HWyAzRqT64AFMt/RnvHLBqBmXo6tZo4fhy+zD28SsbMx1awOKsfvqspS2Gz1i5cT7r7ZQtbcVSxZ/9bVaTC4u8L9iBn0HiKyy7/Ca6q1KT0FUhrhNZw1wcEbiAiDjdQn39cdLwFQ6ht+tps6ScgStGX9bxpMRxiAEH6fZHIu6KcvpsYg3UNhHBjk9KflGZWeZvjyO1EXCyJxxwqPW/L/S7NUGNeGzOrYxhmJd+7kcygiRPYRpqcPrNbhJKcOo8yYJgp1m8PHSfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqqhfiUn7yO+qkyos6zvjgthB4UF8WiPn76nMktJLgQ=;
 b=ruPEuHEmSzPTvgekUWd3SDjh+yjgmCRBs/CRv6VAIa1YthppgamutQpZYVixnUph0zl1bytDP+4gw8y+RsyOyCrmxHJYr/2iq/6XB7ZvCWCeykSbCbAaBgzJcFGA5IbMw496/HA9zqNI/pzz4/GSw8PiV3iY4R6PZL8TqbscmTQQliRCDU5Jhgjp2o64IbL/uqdkXjolZSS5ZfzjSohErzig5VOoFloJVJ4xfN5r15ai8V2NNUhhTrPULGIGGnuWrQPaaAfRqyR6D170SWA7dAlVfDpGo9jVmlOOSFgiLXTS+S/kOwLfvMB0h520L9Bhl7xdkif94WDgjImy6VC8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqqhfiUn7yO+qkyos6zvjgthB4UF8WiPn76nMktJLgQ=;
 b=fFnX/DCkLkgIBfXgWNYP0fVuBZqXIzp/zrf3ng0ZxliD8/PLExKIxly/F+zQtw8k+EGMh8NiL7uj28WgIAlZmACY49hf/49ppOlt8IRrTy2jPX9cybQT2rVDIxPWBtJ41eRS/NcWEV4+AHxAzporSQtoUXVX7fZpR3vXBfuiGKY=
Received: from PH7PR13CA0016.namprd13.prod.outlook.com (2603:10b6:510:174::9)
 by MW5PR10MB5739.namprd10.prod.outlook.com (2603:10b6:303:19c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:59:02 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:510:174:cafe::70) by PH7PR13CA0016.outlook.office365.com
 (2603:10b6:510:174::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 18:59:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Wed, 3 Jun 2026 18:59:00 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 13:58:59 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 13:58:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 13:58:59 -0500
Received: from [10.249.64.7] ([10.249.64.7])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653IwxeH1805893;
	Wed, 3 Jun 2026 13:58:59 -0500
Message-ID: <8fe204a8-69e2-4739-8c40-ff72a1e5e889@ti.com>
Date: Wed, 3 Jun 2026 13:58:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: gen-mach-types: don't include absolute filename
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>
CC: Russell King <linux@armlinux.org.uk>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Marco Felsch" <m.felsch@pengutronix.de>, Alexander Stein
	<alexander.stein@ew.tq-group.com>, <kernel@pengutronix.de>
References: <20260603-arm-remove-path-from-mach-types-h-v1-1-cda9890ba788@pengutronix.de>
 <aiBDAQmQFKeN033y@monoceros>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <aiBDAQmQFKeN033y@monoceros>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|MW5PR10MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a902b2e-1d91-4b04-a175-08dec1a22c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|3023799007|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CxFZAOXw1MeBmRReCRnn4kksz/K+QdyrNw3dNN3NYhuzrWrwJorDOYQ0oE6WPnOXT0rJKRiL3ZbbTHJmXpbQtmBWmJXeDN60rhBiZ47Oby7ib5mfTwRQC//GQfb/UvGv55zO4dlQoc1UDdP0x/JD3NCQrf2Wfm3dHOKAMPYfhdVK1WimnxwP9Gpji/9sywnqC4S769gvUsQtRv9quL2DIaRCX2AFvnzis9+x0HOxxwL7Zv4m8gZNI8P3khO/zX6wnChkAC863iWaaXwoiPasLOm02J6secMFHFmvTgJo8k18CLsAWbAwRdOSgoVJbjgEeAZJzy3iFGgv81jK1Vwm3bf0hGdFfpZHuQtKtRWWc02jN+WnRZAVFfhcEJ4qxY4IIKqOkz6K6PYRR9BMVeF0lgUyI3p8Sl9jRU8NNzggMCbSlYG5rdndG1EuATznWGs5TjEjLpR/UVjyH8s/1L7u0Tf41VmsBza1G411b8WNc5ywwpd1GH7/QaGX95y4+1LAOwR2SBWBDFc35zkfVViicwWvYiP7jVX2sIKFI2AsWOmSo9DSgJFesh9+pdZNJpXNOJr5kmIHR3h31mr9v2VIqWeZQni6+JluFXsrv1cw/n9neh8mZA7PDDdEWYxRnCYNmeQ+7iULw5ktrz4FDGYAEqsqWT7o3J1G3sTnRu5kStOIyF8Cyqi8+V3wvRHUe6KISQL/FliXKqOQvBze9Pcf2n7M/cQ7UawiGBch/pnU7H0=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(3023799007)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ds+HForql1kd8wehdG216TB674Wkx/NBgZpc6W8c0mVvP/XKmYusTYg2RHO0rMZjyLdUCv1q2cyvgWROg8h2e1epsI0LKv4wb+0po/wwzRCdKGtEwVBOcX8rN9o9ZX7z5dnv3DnCocsqIdBNlJm++QFfYCzF0vJSLJKtp4Wvax2gIGAu9FMr+Bdufw0vpR8M598uidsiXgGRknMbsqvxoFtMNb6iVV2V29YRD2crpyLu41krlxUWnQtd9+AdvGI8PlRF4Liml10vU2oe3rr9O0+rsyxz+Ms3q6PSXgGvgWrnzpLaQy07YiJmX/uy9mCzV1pkGOHsI+KKeztkYs3TWeFA2NkA/vFiybVnIx2cmuopW/RYe/M7AqT2Z/gK3CL9BMMW2/Vw87+mUHb4YMQ2G7qUSrVnZblNjtR5f5fK0V+1E+eYMPw+Qq/B8A1V3xNZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:59:00.6386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a902b2e-1d91-4b04-a175-08dec1a22c71
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_115908_859528_1C576AC4 
X-CRM114-Status: GOOD (  12.82  )
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



On 6/3/2026 10:09 AM, Uwe Kleine-König wrote:
> Hello Sascha,
> 
> On Wed, Jun 03, 2026 at 04:12:10PM +0200, Sascha Hauer wrote:
>> mach-types.h is part of the kapi and as such shipped in the
>> linux-headers package. The embedded build path makes that package
>> non-reproducible without going through an extra step of normalizing the
>> path. YOCTO has similar problems in the kernel debug source package.
>>
>> Make the path relative to the kernel source tree which is enough to
>> find the tool that has generated the file.
>>
>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Compared to my old patch this is simpler, I like it.
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Agreed.

Acked-by: Ryan Eatmon <reatmon@ti.com>


> Thanks
> Uwe

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

