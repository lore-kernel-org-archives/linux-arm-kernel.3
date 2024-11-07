Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7A5D43374
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t6KpSyeAKEFX4Y1ptno126ddh5DAFR71W88QfI3Atiw=; b=IXlAXcEPWBryB/IMF84NDesEI/
	wzEzFfw8C9s1vqM7cqFLN+OD5pJSGyWCiWx6SHdfRc+JilA9f967UucIW0kjTvxivze7SjPbFNh5t
	golODpsxG2i1hSNVFcV2urygAfF3KGXCu73O+x2g3OIoxkN3YLuhjBkkMOZIP3D/D/ig4Wr8+YCBC
	vhQwlZhLLzvmPX7djrc364waGxOBdSDQJxIqu0QPQxtguYAHsRoXKBHBkcxFbZJetj5KGrhCNCmIj
	gWKXsk/2UYu5NK+TKDvdgManhI+M7rGNmBW+MK/cM6pYzB075pQtzUxpUuSEmh7MOC+d3AeWQd8rU
	uwVPQCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t958p-00000007Zlb-3I74;
	Thu, 07 Nov 2024 16:13:51 +0000
Received: from mail-am6eur05on20627.outbound.protection.outlook.com ([2a01:111:f403:2612::627] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t953T-00000007Y8y-0aNX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:08:21 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RDvYTM0zqAdyBWx3OHUTzMRHQh6j0Zqu0VUWKK+vBCqi4KzN+cP9MfmCl3EfRaXqD4jHspIVRbdqkFWkhPAz/g3TjAf84832GenNm2O9eyRcUlYdRrJVDre9fM7wl4ROdP88wSnTTm4y5WhvV5FOOnKYASq9AEZ/2GW+qo4I5zFqHRC2Q5krBWoxnw2CwlHCSTlvGU562iM+NmakU2zfuOaXrxRMg3R11rk60Fznua+qnG9Nrkol3dXJlp0GTuFloPb7p5yt7z/w3ISjyMcoBnDYfIbDQ0t0C25g7MVHCpvGd8/mJAl7LcobXZCiNaA7iaaHKxfgzZ9YZlw/wj0aoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6KpSyeAKEFX4Y1ptno126ddh5DAFR71W88QfI3Atiw=;
 b=UZI7iaOUPDQhF40SL8vkJaivSX725yevAQJtsZmFbx0JpgWgrhRr+nWP0xmDG5Wp1rkZzuYuVnqnE4iBEiYMpYvrFV7Yi2wu4TBQx6RRUlEEJoUc7CBtjNR9wgmwf3t3dcfUCaDNGQmWlM4u2ihDU0pszbQ2sv1rOE/9DU+QtWdAmgiXoxeFR+4iXbIsqDmo7opOG2baKHT74JcLU2yy+ZxDR9uhB/T7JoHLh6X7irIRCbWU3/djY8pdGJAOiMPw+vXhabmml7jCNSlwDCGvi9s6zm7YaokyBs5naaLmfYsyKQfe0LKxgYkN5Z2ZxBRR5fW1mLJsny4jqRCsUEFBGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6KpSyeAKEFX4Y1ptno126ddh5DAFR71W88QfI3Atiw=;
 b=egs4Snd/xBJ4Dg/HO8xg4lSFgWWwfVZmWVgDesFcIRZrYRCr7DD85hON9y3pUe8MEE/Deutn0I9umffssqTaV4Etz8HXfnBQfPKy0QOS+6nW44lS2QyNto740aCaayRjeLNfBtpW5v2PVE8wFcJ0SSEenHablfntRzQJvzZ9VO8=
Received: from AM6PR10CA0085.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::26)
 by GVXPR08MB7776.eurprd08.prod.outlook.com (2603:10a6:150:5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 16:08:07 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:209:8c:cafe::a0) by AM6PR10CA0085.outlook.office365.com
 (2603:10a6:209:8c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 16:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Thu, 7 Nov 2024 16:08:07 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490"); Thu, 07 Nov 2024 16:08:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bcb763abaaf64bcd
X-TessianGatewayMetadata: 0cUI1zgL64lnHywbukoxbzcsPVH6Xgs5K21eaRo2rx4JHh5iCcvdXRMYI8DharlfZxnxRMpBXIgevdZKZfgRp3fH8QF2/24KpDcln/BK1vLEOS0HfHIGSLh2/MZKmNY5cWlt+q5E/rBnlnsqht8/SCg3DlokwF3vET2FlpOnYkY=
X-CR-MTA-TID: 64aa7808
Received: from La09bd415f79d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3E2E601E-D8E1-46BD-8632-934C5BEE09DA.1;
	Thu, 07 Nov 2024 16:08:00 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La09bd415f79d.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 07 Nov 2024 16:08:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEaHrS0tIDRtr1Vimts3PwVRkNIoCsyqMbTuHkGg3VgqCjHXXxtpgbl2zgnPqmkTuIE4w32qioBEJQpbCxncXPnSdVt7DsApAQTlanIMdtx9dsM2DrddomUpt8RSwDF/qXo1JTObwhPYQb+qgxt+zDymCAvjKG6x2xjvoXofPde/rNpUOPhOXVqgJ8jWs8gX16VYH6LxUGtg9S0kDszt0U8ZvrtY24bKGYCtgIIHhA3UfzAfzMyn/KFZKRM9aiwad3YT8gSdU+uXPcYyEgjXlV8BfqlFfWJ0CR+1noJJ+jO6CYkM5N4pp/QEYy5IYf9O/Pjqo0Q/OpGLW2bUdZaCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6KpSyeAKEFX4Y1ptno126ddh5DAFR71W88QfI3Atiw=;
 b=D1SXWEZKgZTp48Bp1nrzArfplSyFoNAlcdnLknlmljtu+6+q0AE7HdfPSF5GobR8fwLb+/oIsTvnLGL/E0oBTmww3paCtTKOvM0u/B98SivwhnSyqq+8MLcLL2xqGp9y70sd2TwQCm4ROxcY5iaQOoEZaDYouLW5i2V1p52LZjuamIQYyOp7As3LkdO8JAShXyCrJ77pneTORFlQgz7BYrpPcFC6MxBc6/aTRIJdi7QgCwWwdPmKOjNC8Q/I409ZBN2xw2uwHsRuI9Hs7N0in3umToUNhZWrHESFGKnEquzuovKUFSFYMDUhYCMOny+A4lWVfhCiGgcVadFrkGw7/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6KpSyeAKEFX4Y1ptno126ddh5DAFR71W88QfI3Atiw=;
 b=egs4Snd/xBJ4Dg/HO8xg4lSFgWWwfVZmWVgDesFcIRZrYRCr7DD85hON9y3pUe8MEE/Deutn0I9umffssqTaV4Etz8HXfnBQfPKy0QOS+6nW44lS2QyNto740aCaayRjeLNfBtpW5v2PVE8wFcJ0SSEenHablfntRzQJvzZ9VO8=
Received: from AM0PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:208:14::30)
 by VE1PR08MB5629.eurprd08.prod.outlook.com (2603:10a6:800:1a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 16:07:55 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::bc) by AM0PR03CA0017.outlook.office365.com
 (2603:10a6:208:14::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 16:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 16:07:55 +0000
Received: from AZ-NEU-EXJ01.Arm.com (10.240.25.132) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 16:07:35 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EXJ01.Arm.com
 (10.240.25.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 16:07:34 +0000
Received: from e132406.cambridge.arm.com (10.2.3.22) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 16:07:34 +0000
From: Deepak Surti <deepak.surti@arm.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>
CC: <deepak.surti@arm.com>, <mark.barnett@arm.com>, <ben.gainey@arm.com>,
	<ak@linux.intel.com>, <will@kernel.org>, <james.clark@arm.com>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <adrian.hunter@intel.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 0/4] A mechanism for efficient support for per-function metrics
Date: Thu, 7 Nov 2024 16:07:17 +0000
Message-ID: <20241107160721.1401614-1-deepak.surti@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|VE1PR08MB5629:EE_|AMS0EPF0000019D:EE_|GVXPR08MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d75d2c6-4c01-4274-414e-08dcff465e68
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?GhmALTbUfrRj147B8Q6ZgALUP8+PepK+9UE//yKM0+gTEd13jXfxXclnLGg+?=
 =?us-ascii?Q?qzl7+6AehLAWcXcWXaa9Yl1jINL5m/0dpFmltwLgnZ/HSWRRxkWOuj07Q9GJ?=
 =?us-ascii?Q?IiFNdLEKkm7hypQG8TKGF9NUxNaegDz+8qoWaHkuxubJgf8vlbltiNmL2E/u?=
 =?us-ascii?Q?btCivoVOcRCULYTM0UlPVtJc83YmLRUTOFi2fFOKAibrZyrUYgQoCbqeJAcq?=
 =?us-ascii?Q?itLXzCawp5z+8mYdJ3WAfVzGgzXCD08UQkPBxawAPpALUj/Ra4RzzdgQoQht?=
 =?us-ascii?Q?IqPQrAs3Rgfm3zdYCv/Kc0VCXI8u5FP/teN91NrlXoNtpAfH+T+T2JvI7yKi?=
 =?us-ascii?Q?8C/qRRqEJmw8HjV6EKCp7MJ2wtDUJLRT5rC6w299hNwg1cgQ/hV5J8PYsO8J?=
 =?us-ascii?Q?aIikCO3Za6hpugf7yrFRRwF5A69IHTjJ2+vQXIwo9iOL8D5t2VGhaE+YV9mQ?=
 =?us-ascii?Q?ZVYHrPvZWucWSCQLJ1dSRcxxh0bwMcG+H7bz8FmuNRP55EH2wv2qzJZyszN1?=
 =?us-ascii?Q?cB0EyvcTFKF7gYVESeDmIhlXpGi61Nyj07nv7TeI7clVZ36RV1lfkOF0FAox?=
 =?us-ascii?Q?PmQW6dRNfg/YINl8RE7W8h1LFPz1MyDzWEAkGLCnBoCp/e3HZ9gnhZ49sWYo?=
 =?us-ascii?Q?7305IsPy6AI21/Q1x7AxWCQJok3uGHlhtWvotNGkRuZ2p/FC7HhTxI0wQ9I6?=
 =?us-ascii?Q?52Yt66Ir/fM1ikVI5QDPSbm1fYKl4k1DOEyqG524zQfOIbL+goDO2hAE5Xx7?=
 =?us-ascii?Q?ZH1qzQuYYbojOkqE14C5ndCa7LMg+djCB7tZDBvZ7/voZMYsQoxmw2dFKVG/?=
 =?us-ascii?Q?JuKMZ2O/gf1ZAHR3I6IrpOjxLMqVm5baeuC2ygQim8lTlXqebc6Nk8wObvo7?=
 =?us-ascii?Q?snQCKXzOnINS0WtLjOfKUndOOjqFDHBBR5vqltyI7zyAwEEVH623ApiT5ZY8?=
 =?us-ascii?Q?yk7YKtKGiRS1f6roxmuP9u7v6MEofsM7dzuPEbheSFofuV3IzOAjwqNzhqD2?=
 =?us-ascii?Q?ODwql1C3WlWU3BcyVCj0ircbkVuwGuy0f5F9/5J/BBfad4MhCNllzM0Cc3Js?=
 =?us-ascii?Q?lyLYvMkM+5tXUnwY6xSLuMPIoflzikx9ajEZwgJP3fXRaFZQoX0aVN/HPpe9?=
 =?us-ascii?Q?bhdb4IpE3wlQlrSWt22ZWzk46Ri7iueCr2B0VOlIuSZRqBl+nFLA9u5yDf5f?=
 =?us-ascii?Q?8VEiFazC/j2aMurxxGL9FFAXNSQYkxICoOLHMrlqpJlDo4THDy6xRGIaz9Oh?=
 =?us-ascii?Q?EskxcFuECvqymsR0Lota/0339M9s7i+ChIZ342WLZ8dzY4RcwiOS/vEzbccI?=
 =?us-ascii?Q?jQkgJ1R7f6dSDEpaolzX3drKM8jIDKeEULO9eEdIs2iKpLWM7xtODwZ0lscF?=
 =?us-ascii?Q?jpXS/0q1maYBuA43/vJPBb706c9rlCBYJCkFaKccI4K+026L1A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5629
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:14::30];domain=AM0PR03CA0017.eurprd03.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d48b609-cdf9-42de-0edf-08dcff465732
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700013|82310400026|14060799003|30052699003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zNcJNt6juStUuVX8x/5baV/vfnUe/4OkLonSpQPR2bi0EfvbHkqdn+6fGbxQ?=
 =?us-ascii?Q?JZVneadFJJbyYA3+H5mgmZGr8Ut9UluV8G9b6zqPh6BE4Iy6cFGe5klidAZT?=
 =?us-ascii?Q?pHBe6puQPtKgK0Q+FPU3OpiXt9b64bsgZjoczTjTh3B6VkTE4wgNYvdd253m?=
 =?us-ascii?Q?MB4Bdirp76tCmMY/GMEXSolzXf/4045SWkJR1y9Jjs1Rr22tOU8wlaAOmeUK?=
 =?us-ascii?Q?NMTSYcVULArk9dMqJIASOZXtIr6DQAxMj+5CG4EWQTMKnDV3NcfpjgSo9boY?=
 =?us-ascii?Q?oXhwjMqb2Op2mCgLJs0wmY3rZtMzaTsxU9ZpUgxqFT/QUX+fDer7E4uqyM0X?=
 =?us-ascii?Q?E+tTgYi+8TSLH/0DOpKvToX2qShfrfkqcMBVGkU7EkwXqsO6ao1BpTIp9NGB?=
 =?us-ascii?Q?RkJWYM3lL+C1h2usVFGgXpKngB6Mx2shsx7G8ZLpqgjQ2b0BLafaOMVx8+2/?=
 =?us-ascii?Q?upzDsOAU3LrsvYHARdEjmgNWBGJLM3g+KQyIfSwAytJIShFAzGyrLBrO6Qp7?=
 =?us-ascii?Q?vX4xor6SW1texJPULDrm8um1u4JF9+5Y0QvWsZ23YYCNjMxdI+VSVoGZ7Lwr?=
 =?us-ascii?Q?T/DzgD3B8+4coZvliO/C9rRMG0kv9Z93Kl3OqMfn9lh4NhanzUgHaMIICxga?=
 =?us-ascii?Q?LDJ3WZAq9LuareBOV9AJYGT7Ju5LaqmWIKQgkFjcPRrq6sVgqHGoxInFNUDS?=
 =?us-ascii?Q?BBaVfyRboIc54XuJx4W8ciD13DDfzjCgbMbnNIeoB7oLhxeDNnNjj/f+Z7qS?=
 =?us-ascii?Q?L9CNZ+Yu9LI1yjpYA4MyKrKG9veltvWvFubBBatdZLxe8OSQa7CN8Dzfolys?=
 =?us-ascii?Q?Zt+PifkUqCh/tkwBdnMBPMdnEfYp2PS4byL3Yo/a7aALd7hYBooDtfrNs6Gc?=
 =?us-ascii?Q?kU7lhH+HZ86QB7vCjciB95UyxYdeGZPWaGd7h08erHnN2S2MVQvsFVM8YgIk?=
 =?us-ascii?Q?jhSOs21yiAUCVF2JRdL8BUYAZUVbf7758pnPgtCr2zaZFynptWiSdhP4DYbI?=
 =?us-ascii?Q?4jOsGVigBKYWdrr+p5r4htUxDuKY7gWy6phApzfMjkFWuXhfaWWGnP4Kpw+h?=
 =?us-ascii?Q?Cdj6NWXQ8HllYOuWPigtGlZtcM4scnc6pPDBp5Bo5v5e49G3A+MmJbQy9W8C?=
 =?us-ascii?Q?GTyZ3PQYnEIdecW8JOxRc5jp6ZCV9ZgxSj+Db0ADHmVqhKi//t3L+V7gLV5B?=
 =?us-ascii?Q?Xxl3FPuUOGv50M57iFe/R6ObI6x5Zte+bLEzxMYrPVuUrvVAWLnCOYjMHt6e?=
 =?us-ascii?Q?++1Vq4OMawNP0kidG5n+X4hER4gSO7J7jfqPrYUlkDHntKG/f3RfsEsGuNVd?=
 =?us-ascii?Q?NkD+j4YgHZLBo9SacSnf0XHX3cHi7MokapnBbKZFFK6E+ABsLwzSaWtEYbJ/?=
 =?us-ascii?Q?nZ0Q2BwpGoRXH4wKDmzj81dNvUN/N8HQiKnSzasxhFjXiCZrNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700013)(82310400026)(14060799003)(30052699003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 16:08:07.5670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d75d2c6-4c01-4274-414e-08dcff465e68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_080819_353708_10447434 
X-CRM114-Status: UNSURE (   7.99  )
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

This patch introduces the concept on an alternating sample rate to perf
core and provides the necessary basic changes in the tools to activate
that option.

This patchset was original posted by Ben Gainey out for RFC back in April,
the latest version of which can be found at
https://lore.kernel.org/linux-perf-users/20240422104929.264241-1-ben.gainey@arm.com/.
Going forward, I will be owning this.

The primary use case for this change is to be able to enable collecting
per-function performance metrics using the Arm PMU, as per the following 
approach:

 * Starting with a simple periodic sampling (hotspot) profile,
   augment each sample with PMU counters accumulated over a short window
   up to the point the sample was take.
 * For each sample, perform some filtering to improve attribution of
   the accumulated PMU counters (ensure they are attributed to a single
   function)
 * For each function accumulate a total for each PMU counter so that
   metrics may be derived.

Without modification, and sampling at a typical rate associated
with hotspot profiling (~1mS) leads to poor results. Such an
approach gives you a reasonable estimation of where the profiled
application is spending time for relatively low overhead, but the
PMU counters cannot easily be attributed to a single function as the
window over which they are collected is too large. A modern CPU may
execute many millions of instructions over many thousands of functions
within 1mS window. With this approach, the per-function metrics tend
to trend to some average value across the top N functions in the
profile.

In order to ensure a reasonable likelihood that the counters are
attributed to a single function, the sampling window must be rather
short; typically something in the order of a few hundred cycles proves
well as tested on a range of aarch64 Cortex and Neoverse cores.

As it stands, it is possible to achieve this with perf using a very high
sampling rate (e.g ~300cy), but there are at least three major concerns
with this approach:

 * For speculatively executing, out of order cores, can the results be
   accurately attributed to a give function or the given sample window?
 * A short sample window is not guaranteed to cover a single function.
 * The overhead of sampling every few hundred cycles is very high and
   is highly likely to cause throttling which is undesirable as it leads
   to patchy results; i.e. the profile alternates between periods of 
   high frequency samples followed by longer periods of no samples. 

This patch does not address the first two points directly. Some means
to address those are discussed on the RFC v2 cover letter. The patch
focuses on addressing the final point, though happily this approach
gives us a way to perform basic filtering on the second point.

The alternating sample period allows us to do two things:

 * We can control the risk of throttling and reduce overhead by
   alternating between a long and short period. This allows us to
   decouple the "periodic" sampling rate (as might be used for hotspot
   profiling) from the short sampling window needed for collecting
   the PMU counters.
 * The sample taken at the end of the long period can be otherwise 
   discarded (as the PMU data is not useful), but the
   PERF_RECORD_CALLCHAIN information can be used to identify the current
   function at the start of the short sample window. This is useful
   for filtering samples where the PMU counter data cannot be attributed
   to a single function.

There are several reasons why it is desirable to reduce the overhead and
risk of throttling:

  * PMU counter overflow typically causes an interrupt into the kernel;
    this affects program runtime, and can affect things like branch
    prediction, cache locality and so on which can skew the metrics.
  * The very high sample rate produces significant amounts of data.
    Depending on the configuration of the profiling session and machine,
    it is easily possible to produce many orders of magnitude more data
    which is costly for tools to post-process and increases the chance
    of data loss. This is especially relevant on larger core count
    systems where it is very easy to produce massive recordings.
    Whilst the kernel will throttle such a configuration,
    which helps to mitigate a large portion of the bandwidth and capture
    overhead, it is not something that can be controlled for on a per
    event basis, or for non-root users, and because throttling is
    controlled as a percentage of time its affects vary from machine to
    machine. AIUI throttling may also produce an uneven temporal
    distribution of samples. Finally, whilst throttling does a good job
    at reducing the overall amount of data produced, it still leads to
    much larger captures than with this method; typically we have
    observed 1-2 orders of magnitude larger captures.

This patch set modifies perf core to support alternating between two
sample_period values, providing a simple and inexpensive way for tools
to separate out the sample window (time over which events are
counted) from the sample period (time between interesting samples). 

It is expected to be used with the cycle counter event, alternating
between a long and short period and subsequently discarding the counter
data for samples with the long period. The combined long and short
period gives the overall sampling period, and the short sample period 
gives the sample window. The symbol taken from the sample at the end of
the long period can be used by tools to ensure correct attribution as
described previously. The cycle counter is recommended as it provides
fair temporal distribution of samples as would be required for the
per-symbol sample count mentioned previously, and because the PMU can
be programmed to overflow after a sufficiently short window (which may
not be possible with software timer, for example). This patch does not
restrict to only the cycle counter, it is possible there could be other
novel uses based on different events, or more appropriate counters on
other architectures. This patch set does not modify or otherwise disable
the kernel's existing throttling behaviour; if a configuration is given
that would lead high CPU usage, then throttling still occurs.


To test this a simple `perf script` based python script was developed.
For a limited set of Arm PMU events it will post process a
`perf record`-ing and generate a table of metrics. Along side this a
benchmark application was developed that rotates through a sequence
of different classes of behaviour that can be detected by the Arm PMU
(eg. mispredicts, cache misses, different instruction mixes). The path
through the benchmark can be rotated after each iteration so as to
ensure the results don't land on some lucky harmonic with the sample
period. The script can be used with and without this patch allowing
comparison of the results. Testing was on Juno (A53+A57), N1SDP,
Gravaton 2 and 3. In addition this approach has been applied to a few
of Arm's tools projects and has correctly identified improvements and
regressions.

Headline results from testing indicate that ~300 cycles sample window
gives good results with or without this patch. Typical output on N1SDP (Neoverse-N1)
for the provided benchmark when run as:

    perf record -T --sample-cpu --call-graph fp,4 --user-callchains \
        -k CLOCK_MONOTONIC_RAW \
        -e '{cycles/period=999700,alt-period=300/,instructions,branch-misses,cache-references,cache-misses}:uS' \
        benchmark 0 1

    perf script -s generate-function-metrics.py -- -s discard

Looks like (reformatted for email brevity):

    Symbol              #     CPI   BM/KI  CM/KI  %CM   %CY   %I    %BM   %L1DA  %L1DM
    fp_divider_stalls   6553   4.9   0.0     0.0   0.0  41.8  22.9   0.1   0.6    0.0
    int_divider_stalls  4741   3.5   0.0     0.0   1.1  28.3  21.5   0.1   1.9    0.2
    isb                 3414  20.1   0.2     0.0   0.4  17.6   2.3   0.1   0.8    0.0
    branch_mispredicts  1234   1.1  33.0     0.0   0.0   6.1  15.2  99.0  71.6    0.1
    double_to_int        694   0.5   0.0     0.0   0.6   3.4  19.1   0.1   1.2    0.1
    nops                 417   0.3   0.2     0.0   2.8   1.9  18.3   0.6   0.4    0.1
    dcache_miss          185   3.6   0.4   184.7  53.8   0.7   0.5   0.0  18.4   99.1

(CPI = Cycles/Instruction, BM/KI = Branch Misses per 1000 Instruction,
 CM/KI = Cache Misses per 1000 Instruction, %CM = Percent of Cache
 accesses that miss, %CY = Percentage of total cycles, %I = Percentage
 of total instructions, %BM = Percentage of total branch mispredicts,
 %L1DA = Percentage of total cache accesses, %L1DM = Percentage of total
 cache misses)

When the patch is used, the resulting `perf.data` files are typically
between 25-50x smaller than without, and take ~25x less time for the
python script to post-process. For example, running the following:

    perf record -i -vvv -e '{cycles/period=1000000/,instructions}:uS' benchmark 0 1
    perf record -i -vvv -e '{cycles/period=1000/,instructions}:uS' benchmark 0 1
    perf record -i -vvv -e '{cycles/period=300/,instructions}:uS' benchmark 0 1

produces captures on N1SDP (Neoverse-N1) of the following sizes:

    * period=1000000: 2.601 MB perf.data (55780 samples), script time = 0m0.362s
    * period=1000: 283.749 MB perf.data (6162932 samples), script time = 0m33.100s
    * period=300: 304.281 MB perf.data (6614182 samples), script time = 0m35.826s

The "script time" is the user time from running "time perf script -s generate-function-metrics.py"
on the recording. Similar processing times were observed for "time perf report --stdio|cat"
as well.

By comparison, with the patch active:

    perf record -i -vvv -e '{cycles/period=999700,alt-period=300/,instructions}:uS' benchmark 0 1

produces 4.923 MB perf.data (107512 samples), and script time = 0m0.578s.
Which is as expected ~2x the size and ~2x the number of samples as per
the period=1000000 recording. When compared to the period=300 recording,
the results from the provided post-processing script are (within margin
of error) the same, but the data file is ~62x smaller. The same affect
is seen for the post-processing script runtime.

Notably, without the patch enable, L1D cache miss rates are often higher
than with, which we attribute to increased impact on the cache that
trapping into the kernel every 300 cycles has.

These results are given with `perf_cpu_time_max_percent=25`. When tested
with `perf_cpu_time_max_percent=100` the size and time comparisons are
more significant. Disabling throttling did not lead to obvious
improvements in the collected metrics, suggesting that the sampling
approach is sufficient to collect representative metrics.

Cursory testing on a Xeon(R) W-2145 with a 300 *instruction* sample
window (with and without the patch) suggests this approach might work
for some counters. Using the same test script, it was possible to identify
branch mispredicts correctly. However, whilst the patch is functionally 
correct, differences in the architectures may mean that this approach it
enables does not apply as a means to collect per-function metrics on x86.

Changes since RFC v2:
 - Rebased on v6.12-rc6.

Changes since RFC v1:
 - Rebased on v6.9-rc1.
 - Refactored from arm_pmu based extension to core feature
 - Added the ability to jitter the sample window based on feedback
   from Andi Kleen.
 - Modified perf tool to parse the "alt-period" and "alt-period-jitter"
   terms in the event specification.

Ben Gainey (4):
  perf: Allow periodic events to alternate between two sample periods
  perf: Allow adding fixed random jitter to the alternate sampling
    period
  tools/perf: Modify event parser to support alt-period term
  tools/perf: Modify event parser to support alt-period-jitter term

 include/linux/perf_event.h                    |  5 ++
 include/uapi/linux/perf_event.h               | 13 ++++-
 kernel/events/core.c                          | 47 +++++++++++++++++++
 tools/include/uapi/linux/perf_event.h         | 13 ++++-
 tools/perf/tests/attr.c                       |  2 +
 tools/perf/tests/attr.py                      |  2 +
 tools/perf/tests/attr/base-record             |  4 +-
 tools/perf/tests/attr/base-record-spe         |  2 +
 tools/perf/tests/attr/base-stat               |  4 +-
 tools/perf/tests/attr/system-wide-dummy       |  4 +-
 .../attr/test-record-alt-period-jitter-term   | 13 +++++
 .../tests/attr/test-record-alt-period-term    | 12 +++++
 tools/perf/tests/attr/test-record-dummy-C0    |  4 +-
 tools/perf/util/parse-events.c                | 30 ++++++++++++
 tools/perf/util/parse-events.h                |  4 +-
 tools/perf/util/parse-events.l                |  2 +
 tools/perf/util/perf_event_attr_fprintf.c     |  1 +
 tools/perf/util/pmu.c                         |  2 +
 18 files changed, 157 insertions(+), 7 deletions(-)
 create mode 100644 tools/perf/tests/attr/test-record-alt-period-jitter-term
 create mode 100644 tools/perf/tests/attr/test-record-alt-period-term

-- 
2.43.0


