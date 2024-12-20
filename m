Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030F9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GFGzDi1m2n6SnO/vinbs3Gt5r1iN9VdAulvmUPY3FM=; b=kqd4cFFcpzz3IZY6U9Tc23Ow35
	TTKDRfBqfatAiW2nMIv+497bPoIza/NAun5DWj8porTwRuTwTI4HPIxWNQONTxSljmYGtGK2YG2yT
	9y9k6Yrup1m5mgbbld7w47svSMPWZ1kSTdA1nkWxipGCj3JzQ509c1pBC2u2Jf0/bQ4tlnqrOAfOO
	jOGiYQ8zc2x+UC4/NhUvHBGJz9vOlO6frs3Zq6IZ2K4rc5ATuqF53JCnVRV9kVXjB7OVqxILTMF6f
	uw1wQlE6YzFg413rrVjlmaxRuZbksZ/vlzXauJ0TRum+G4dwwBtqc9SzJWTnJ4+m/ZbXQjIudNMN1
	MFZM59uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObZF-00000004pnU-2Jym;
	Fri, 20 Dec 2024 11:53:17 +0000
Received: from mail-vi1eur05on2062d.outbound.protection.outlook.com ([2a01:111:f403:2613::62d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObX9-00000004pMx-38KK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:51:11 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MnDmQpn5W0UCTH94NwYKzdtgs/wLIxnPrCrbF4Hnd19knK6YpmmT4KZoeSMT0V7ihB4BadwEzHu18MoJJiG0Xt0Gwb5VfzC6GgptMbmbZMi1wKH+PUwKzDeQ9qJDtJQzWGFinqdlWFTvbSVt1rhrf5WcqATffhJhxqnZBUNySlmieC3uT8+m0CBlwFMUT8YYFA3e+/H1AhYAZP0Jsa37w7C/qsa9048oHLy4M83GoikUSQmXM/kJ6ezyct6vUqjnpzbw2lSab3yNkY0h8AVW6dSOLsbbbOFj7Klh2nRf8w3Q5mqtirKRRLOeVkDAke16k1uQ+kl4LMkVrC7V8YGOLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GFGzDi1m2n6SnO/vinbs3Gt5r1iN9VdAulvmUPY3FM=;
 b=nNID6uvZfS9/UZqiSHQJPQmtK4OkHwtBbpziSCgo272z8txmSqjIU1wtxXgoQG6lYN91CXNn9BaN2rJgVZOfM19V9tEhVTFnY67N+CoF0mAYg2eGehdMFJNr0S0mEy2C4IRsq99+TKDktrMTrX3adt9ZfJn3YawsGgAF8CX81LPQ3p1qtaIubIxL01/LdqvI8ZLobDCBVvIWcjtmZpKtuOujYmfaKNcYOZKb+oBjmxsI+ukKbscLrQ0q8ttsZAbRR7Z3nIElhdt+If6avBVNcNBh1gOQdxMqH0UdFbCAn2JQCUjHAMsZGGSx7TRQpJxfCfkz7kdMGpXvfyfNSN4oBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GFGzDi1m2n6SnO/vinbs3Gt5r1iN9VdAulvmUPY3FM=;
 b=kGmbloSTwowhPIv6u+q1xLU1jWHL5TFV0ojRc3IrPFqUMklYJIyPFA4mel8v1Ke5twT45m/8N7RD5XaMqYg6imqugOpSRf1/+Ov94ib6vCdlnqQj2MHSWMcBHLuJDl5/glT01h/EdjXabFol6LfmQbFCBqNArH14V4OZvB3jCI0=
Received: from DU2PR04CA0178.eurprd04.prod.outlook.com (2603:10a6:10:2b0::33)
 by AM8PR08MB6353.eurprd08.prod.outlook.com (2603:10a6:20b:361::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 11:51:00 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::c2) by DU2PR04CA0178.outlook.office365.com
 (2603:10a6:10:2b0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 11:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via
 Frontend Transport; Fri, 20 Dec 2024 11:50:58 +0000
Received: ("Tessian outbound 7d3f896333d7:v528"); Fri, 20 Dec 2024 11:50:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8fff45cf16e77dfd
X-TessianGatewayMetadata: 0YSOECxg//rI1O9KiHAx91JD3Ua9FFbl33fnxibuzYek4jI9nluBevuuGnpKwCs9lC5gBhXDr9QIWk5fudYY+j9C1BoRy0sATLO8fUD+LXoUOnNRj0+XPipyB+NJujg9nVw7YlTKY6+ThUHHc7fbdA==
X-CR-MTA-TID: 64aa7808
Received: from Lbc8b66a43c76.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BC77C0C6-C887-46B8-A415-21FCF5D8F857.1;
	Fri, 20 Dec 2024 11:50:55 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lbc8b66a43c76.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 20 Dec 2024 11:50:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moQXhD8fiLlkF+UFhqC+dxGJONuJRVIWeDNxbIhdBvslFfRuS8WTI/LGL4u8trhUi6lIdHvamFjCgKr7Ss8Ng/5a3AyRWXmRDA4reVBmTFeW/5ody8QMsuPzbac3Xxf8EIBCabfgl1zRByfVHUCrQ6uRq4VmS2Cduay8PUFNH7ufZZXBOEIsNGZ4JQo90CgFK0yldLy5QY/O4xAiGYz+w/M+FQMAu50o98o4joc4tcx5LpNV6zWviOgcKyuyegCluzPGNVk7l2muv8+2Wv3r1xCx4nyeingkV1AxM4kOHiTMTMPjG0KQI6UN+I6hvZcisnF9pBkFdDLM7sIltPXLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GFGzDi1m2n6SnO/vinbs3Gt5r1iN9VdAulvmUPY3FM=;
 b=iDDoZU9sRzyM2wzjDGT4R/+xhJmSS7LhIfpeYXcUUUEdpcG1jmXkriQgiyw7gayRwcEz9pDZZFJGosc4ESzuy9ImYX0ntIjXZRxEaoio3knlStOanqL0nNPtoZp6t2lRLWi8fZ//vg5tuSDCK9N8Ae++Qo5N/i62RvQKQVrMZj85dhwQAPqVPyaDuqaHT15B2vrWt+ZsZNACspILyrUmht892SSgtoO+5jjjvmmGakXIM7FLJoM/pFWdUdKfHOOJ/hr3k3YTsImrjJykRsjFuKppR9lA7cfXmwdp6aVBAd9QMBa0vsfZUzS0HNnTi6qNGbf+z9cu90QRh1TXt4bkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GFGzDi1m2n6SnO/vinbs3Gt5r1iN9VdAulvmUPY3FM=;
 b=kGmbloSTwowhPIv6u+q1xLU1jWHL5TFV0ojRc3IrPFqUMklYJIyPFA4mel8v1Ke5twT45m/8N7RD5XaMqYg6imqugOpSRf1/+Ov94ib6vCdlnqQj2MHSWMcBHLuJDl5/glT01h/EdjXabFol6LfmQbFCBqNArH14V4OZvB3jCI0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU4PR08MB11186.eurprd08.prod.outlook.com
 (2603:10a6:10:577::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 11:50:48 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 11:50:42 +0000
Date: Fri, 20 Dec 2024 11:50:39 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Message-ID: <Z2VaD0K+jNaFYmbn@e129823.arm.com>
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
 <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
 <Z2VJIh2+Z40bZi1e@e129823.arm.com>
 <ac537889-dc0a-4d2e-870b-c5a33279633e@arm.com>
 <Z2VXc/R/nOLGz+Cg@e129823.arm.com>
 <f0c15466-a27f-4cc2-90a1-476ec278d870@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0c15466-a27f-4cc2-90a1-476ec278d870@arm.com>
X-ClientProxiedBy: LNXP265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::19) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU4PR08MB11186:EE_|DU2PEPF0001E9C0:EE_|AM8PR08MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c2c739-b353-41b3-fe24-08dd20ec91df
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?CdR2IU3fXO/HIE3dUjzehiCoP/cf9koYWCtve+RHm89HlJhk8F+MYzm8VFQx?=
 =?us-ascii?Q?mcIeL8tIftgAUD4/hO5ZufKoYFz7QwS8f1byjU/kfb8nat9Q5o01ocZek/v+?=
 =?us-ascii?Q?w5BCDstv5nDfMO1PngMGxBBAhrjOn03yOvLG1JEY+Gr9A/ib3joHPFc+W2Kh?=
 =?us-ascii?Q?zoCfdBcyQkjLBuyJ//Jpz8hL0mDkDmnZSTPTineRLbGl4gXyZFz/hWYwO7Ww?=
 =?us-ascii?Q?rlk+bXovrZHT6AF24ERUYP4xvwntbXGqVGuwl/7MC9H6MmmKx70PyMOy8pKZ?=
 =?us-ascii?Q?rKq0AhYtIg28OKgf+KXAgFQ1HSmPvGkd3ZsCfdXguQm1jimWuMrAr1hoM7Xx?=
 =?us-ascii?Q?5TUUAQdqlAZKD2iHJegbLitECJVAdA5Mvm8OFtfFL7X6vd0udF7FDWonASLi?=
 =?us-ascii?Q?2gWLPhAqY2Q5Vqy4Eecf6I4VxPH2B9HUclfUXFpF+9BvYwc6Y8y4CiPooeI2?=
 =?us-ascii?Q?5rJeYsbbfShNWIy2Hzql28lvKx7xP1NIglUwIWqjDmDFyERPZN5hYteJMTwA?=
 =?us-ascii?Q?7U0c8dyyjOPf1JaS/3YAsSpPW16ae9hOCrzeD6UaZpjNARGxL+5c4WLjgapY?=
 =?us-ascii?Q?m5oBWXh/ALcyp1Tstb3K7bdlswJOLlGgHrrVxkrWXvkJf9uhVtKUCF+fDHks?=
 =?us-ascii?Q?BxzsmeNK4d7uJJ9kJ6qEXX1MaYNqm4fHCmoDK7VH6q8xXSemqLG8Am9fDk3z?=
 =?us-ascii?Q?WUGs0cRb1gCQ2jUcPjwlQSwzXjnSCdHi7eJAsBwLLqdwJR3iq6D0F05tYamb?=
 =?us-ascii?Q?JMuO7L/ses0qd8ZclpUWG6ZkeCOthTzEkNfL+6zkiRupjVmppE2gPF3b7Ist?=
 =?us-ascii?Q?cvelhjfelWieQ03U8ww6khMVOySnTJbz7tgQA9QgyjfPoro+Q2F5aYTXAcQl?=
 =?us-ascii?Q?DlJRiUnvsm3GVXUfjHTI3uRRaKEJ2FLao4qOhYGaH3tRK+0j4L65ylONEYb5?=
 =?us-ascii?Q?ktxS23vuqpVN3szOwVgUGCly6rHvjKt059c4YYegFD7n0363pJFr9f8ZI7lb?=
 =?us-ascii?Q?akRyh1Ut3ZBeTNP3zsnla4t+G9Skvy5YPXV0xiJp1ttyOrzP+gdZ26yVhnS6?=
 =?us-ascii?Q?tG1WA6kOaPWZ3DPanBT/Ls4VhZ3KooAyRzrNSl04AxUmzx9DMkwZglxFVEGe?=
 =?us-ascii?Q?cmPrR7knjey8ZqAG2RnIdQdFqv4bu+v5VWI4wiLV8oZjkEO7OYkUEj1bGFkJ?=
 =?us-ascii?Q?bVHJA2mRcr4rTtdqTt8oD7n4JQ3mJzWG2pGmNbS3Stz5pWka8aIEp9f8vsI0?=
 =?us-ascii?Q?kKOJVQBoKqCKpP3tZnW1rm2Ra8fYLw65ocLnh8TYzIydbiP46YNZ9wm79jwc?=
 =?us-ascii?Q?sOBVyUb/0AxJ3fIHcNsR7VgwKPrqdtQl9JOXH6Np2YC/WkHHjbucCJcp7Ejl?=
 =?us-ascii?Q?j9IF4KQolHWUJF2QDizVeiAVfXO5?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11186
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 80f44d52-35d7-45ad-ab44-08dd20ec87ce
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ybJqT5le03m+q7LnSVqIRzE1oi7c85lNEEbIZDCkoAp3/9LimDVGRPLCZvb?=
 =?us-ascii?Q?GQIIfvlVFsIw+4GpKy0GcBBMNsUmSCORJxs5R+iLjyIiyJIe+lphJAunz1Cc?=
 =?us-ascii?Q?5NQYwQp2rC8RFDEm2N/brdaqibCnjpU3kf7VoiYcGaPzhfmzcP4biYUArweH?=
 =?us-ascii?Q?cP1h06zRBMMvRVuWcw1XK0RLOLnbEjiT5GY9tuTcESVtZlM3tWlatAhJUQ2E?=
 =?us-ascii?Q?8PcNJfhgWjG+e2+G+48j5jCF9nG28j0V0HBVd8NQAXIKZ+KWXxKqt24fmQLy?=
 =?us-ascii?Q?raivsU21XHXfWhwyLCfdOsWPFhB8Z2enRuLsJStzhR+eGcJTHYdsoE4o3KK6?=
 =?us-ascii?Q?xkKnq07GFoj+MeqZxGYbScOl+vWnrtLxosyXb0qlNTvrduB74X4FT7n6oOt5?=
 =?us-ascii?Q?IGcc3qW9UAm2NgoVDOd/Bgv5PigE5ndIES1Zq/Xt5rKng1+5IDnNeByRR6LC?=
 =?us-ascii?Q?EoDMZZo16a1OVs5LgzpBnjgYZFoK53i2gFdleg9hxA+y2quVa03pRGPSMEgJ?=
 =?us-ascii?Q?LU2QOR55Y0h1af4XxpwxQhxaLZYmHQSVPBuvsCjcFUgaTTDGuQsnmja+1Ezv?=
 =?us-ascii?Q?nJ/0Q1JsrwJ/cGZmrHId/o2nfFrrfVnBpdsEhmZBWe+YspaXBUnLt2vv9DXA?=
 =?us-ascii?Q?OTsp+yclOHYW0BBh/6EM74IVU9SZ4hpL/JFyXwxOcfzzCiWVr4uR27ukN2D1?=
 =?us-ascii?Q?XKoebtXEk3UKWR8/PVfBohSKu8IAsqdnURSGqKGAt1XdSt/SGaox2UKpAulM?=
 =?us-ascii?Q?AdnP+FH1OWdOkcpXm46JE4sZg5JPGjGtMWHP62Dt0/Y56i0epGYzxGL96K/0?=
 =?us-ascii?Q?h+KypzkEzsXGBf+aKCm4nV2jFdEUNj++FrPrpDIjddIPWAljLUh22o5smSTy?=
 =?us-ascii?Q?8QOyjPXSmVe3AfX+6d6e1kHvuzrwMMvlwJtdpJYavXX7agEAwRG/hG079SNW?=
 =?us-ascii?Q?2657Fc3B2l358v8lC6HfS/0bLMMtWSGQYCJk9EynXgZ3ndGZjQU6M+KKkl3v?=
 =?us-ascii?Q?H0lhinWv8ZZlgUmOG3y5nHCpcQkHufG6askaYNGft8PmxjgJ0wfSwem3/diu?=
 =?us-ascii?Q?zTujtWxW2mKPw2v7JEX9OTeL5Go5d8FcHTNeZGuzZ8lTy+j1nH+rIp8XSToI?=
 =?us-ascii?Q?urM9nJiuI/aBHkuBB/R4q9I3mKgKjp9GwB0c2RjKQQ+dgB5TjmozKy+gcpBd?=
 =?us-ascii?Q?ymjZZr3tX8hbs43/o3oiARAKjX76KXUPjNESVKIZ3ArdtP0ltL/auQYmY+t+?=
 =?us-ascii?Q?DNNfsV70GbLtmelqdmGqK41FaytHspbq/3PoU1kyk9yOm1jy1HZU/UFQoub8?=
 =?us-ascii?Q?uLt+lEpHUMYagt8cD52kdKVWUrcjAn4QO8PRvJx/BhkXfSfbjC5urFplw8HK?=
 =?us-ascii?Q?gNTCAmRkzs0e23GaV/FIjBhJFlTUMkriPUW+4CItxaD8YOB3+YNGqTK1uWmi?=
 =?us-ascii?Q?NyQWgeydDQUS0tjASECnwbPA777mEDJlaCUas8YuNYSW4lcQPJWg6vddDf9o?=
 =?us-ascii?Q?yDrasXLmnMI2VY4=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 11:50:58.7756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c2c739-b353-41b3-fe24-08dd20ec91df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_035107_790105_172241C0 
X-CRM114-Status: GOOD (  18.57  )
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

> > > >
> > > > > Notably missing is the same changes for the etm3x driver. The ETMv3.x
> > > > > and PTM1.x are supported by this driver, and these trace source
> > > > > variants are also supported in perf in the cs_etm.c code.
> > > >
> > > > But I wonder etmv3 needs to change. Because its spinlock is used only
> > > > via sysfs enable/disable path.
> > > > So, I think it doesn't need to change the lock type.
> > >
> > > ETM3 can be used in perf mode, similar to the ETM4x.
> > >
> > > So, you need to fix it as well.
> >
> > Yes. But etmv3's etmdata->spinlock doesn't used in perf path
> > its usage is only in sysfs interface path.
> > That's why I think it could skip too.
>
> Ok, which I think is a problem, since the sysfs mode could overwrite the
> "config" while perf is preparing the config from the event parsing.
> And we would need it there. So, for the time being, we can accept this
> series, pending other review comments and address this issue separately

Agree. also it has the same problem in etm4.
I have a patchset for etm3/etm4 for this. but it's based on this series.
So, after this patch is mereged. I'll send related patch.
Thanks.

