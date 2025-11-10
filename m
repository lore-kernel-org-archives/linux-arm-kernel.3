Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB791CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzzUayINz0DQgYFGlyO3Re3d5L8o94Xp4PW2du9u+wE=; b=k5bXt7OfLzfWYkKKhE6OywsFeS
	Qox60mFmrcDShJpk8ZCkyw7wF4p3Mjhi386/Ph8gr4wx4AL9cwAytPRfk3T+LpQ0FNjzkTTEgXjml
	TwFezkIQ6unb6sS7MPXVXva/IaW2vNqKxXNjDyuMpaL5tZ15Xnxt97ImzsZdgb1NBRskH8CFGhhnw
	gf4WqvjtdlbJN/ufAML/cBhA8ePk9fWoG2GDAbkJElnub2OdyMNWcbrAi8hpoFLO1dDlYTDHUKFHp
	IWVXOYQ8eRox2SOhBm8WRQscLNT6gBdywpSL04unPjDs0mxzqIu9Y9UFELLMK7K0scoQTF8VBcC/J
	s0fKYt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQNs-00000005Lhw-0BND;
	Mon, 10 Nov 2025 11:48:32 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQNp-00000005Lgj-1SvY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:48:31 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qUO8C7+jfXP1vA47cAcGM+FRTISrM0/g4GkODkUhRm6Q033UClL1YbsNUM5HW44f2AbXCPSGrzgdyjWTzvmaD/TUs3qsGhHXr+AycUxuQ3Xkw+7BQUx/ESPTTbb99c5bn20YD33JvKoW0itd3LkPzdh4SsGLLVdu8Iz6aYH1lfLVVeuazSuOjMcwqj6pd7WpcTJyPS1DZFJu9o/gbGGujj2VRvksJWZi77TqH2yLKbp0iD3mBRglDnJzjyEAHQv4FGBIoOA/YX39OztocuZfXVpdPZDQt45txwSqa1HPfsOdFC6V8ssTBTl45Pv3AwyX7I5DpCSTQRxzeNhz1ulfjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzzUayINz0DQgYFGlyO3Re3d5L8o94Xp4PW2du9u+wE=;
 b=bLgcukGYO6Nce/MYkZ59HQL2Ce6mAyRGj/DZacjjjdXSnZ4rSZVWlxCYTkfhBtEl8/rQ192WvHRMrvqyty8HlED1kaKNWCSKv+fxAtoHR0YYyo4TmE/4pAkDRf7VlQvP3QrNkGu2VRUMpvBHY0V58EjXa3QeIrlPpt1yi7LDrUQ2bV+rgw5LypFmCkSu0G5EIk/+igni6RRqPePB4hO20yryyw8WNabZu4lZ2Yx4JrLstPH3o4EKk4epKsoWvzXGxp05da8r4tTtpBrQYyGWvkDLHN0yJah72aXe5okzImNlI4GPA8LHMsAV2NehEEQEc4yWM63c2faVC2ZdrXTSag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzzUayINz0DQgYFGlyO3Re3d5L8o94Xp4PW2du9u+wE=;
 b=Pcd6j6yMxcU2MKtfZ6iWIIF78kE9XEREy6La5CxCRb2GwErGfOiry67cJNR4iZjrymDhGyRCnnowC6As9vLwGhIAaPGyrf0Kvbd7Tt6jPE8l7Yb4aJl0mkXV+m0We4L8Zq0FJXBJt8rEn0we956f0OBxvOolN55W0eRACsBtq0E=
Received: from PA7P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2d3::11)
 by AM9PR08MB5891.eurprd08.prod.outlook.com (2603:10a6:20b:2da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 10 Nov
 2025 11:48:22 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:102:2d3:cafe::e9) by PA7P264CA0007.outlook.office365.com
 (2603:10a6:102:2d3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 11:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.0 via
 Frontend Transport; Mon, 10 Nov 2025 11:48:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KefnqFdZgYuDKnpXqEnWAyU0OKTDkzz96OCRkeA++3n3Rjt2a4/MglKbiAcbnX8LJc/0IcDL0WzhuVju1wSnGUrs0DjdU9ZshuVKsfeokEV3v0r5cYpBI/rE+6JaHbTnI5UX/P01LQXm7cutEnRut/D15npHcdTQPIT56jo86JVbuGO5Az4t3Uu2YsSWMaJZYB8cZrlBtSP52pgNdKx0h6o8sLY31AUBlYC52D1jtkWBq4BLP4YDFk9Lw25LyYD29S1gnkcNCnLhqsP+P5Vc/sr6hU72ThiZA6hugS9fNOu1KQMen60+0HouZjTUzZqi0JiITliCKDd25iJxy2ABbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzzUayINz0DQgYFGlyO3Re3d5L8o94Xp4PW2du9u+wE=;
 b=y3zdLmya87b5jFRSXg0XzS6WTwwII/OnMDMkylDvOVBKBzIO0sgriwFjBy7T29RDsakjdBYFNLxaNnM9MWYrzuVFdX4EBwCIywfrHNL00x2BYhtdvGpjHzC99WAwTp2aBBb6lSJ3Ix3i/NtLEGQJ1K3p07BCxbpjnhYLSqATWTqy+WRdxJJG+ccq4iY3uEII1SnlcnJ9NLsVEWJ5TLXWRthPoxqkhzMQxo1s5PPoYjxA9xXW+tXLPSZgflv07n3PjMi7W07KWW/8sWOPRETIYQobHEqimcIkB5xkU/c2eTYHahq8D4RJHnXM6uo1dm4NsqWnFDA+F0T2PkIQbDcDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzzUayINz0DQgYFGlyO3Re3d5L8o94Xp4PW2du9u+wE=;
 b=Pcd6j6yMxcU2MKtfZ6iWIIF78kE9XEREy6La5CxCRb2GwErGfOiry67cJNR4iZjrymDhGyRCnnowC6As9vLwGhIAaPGyrf0Kvbd7Tt6jPE8l7Yb4aJl0mkXV+m0We4L8Zq0FJXBJt8rEn0we956f0OBxvOolN55W0eRACsBtq0E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB7999.eurprd08.prod.outlook.com
 (2603:10a6:20b:582::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 11:47:47 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9298.012; Mon, 10 Nov 2025
 11:47:47 +0000
Date: Mon, 10 Nov 2025 11:47:43 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 07/11] coresight: etm4x: Remove the redundant DSB
Message-ID: <aRHQ3/bXIBcbOkfP@e129823.arm.com>
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
 <20251103-arm_coresight_power_management_fix-v5-7-f803c19aa153@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-arm_coresight_power_management_fix-v5-7-f803c19aa153@arm.com>
X-ClientProxiedBy: LO4P123CA0385.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::12) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS4PR08MB7999:EE_|AM4PEPF00025F99:EE_|AM9PR08MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f57ce87-070e-4f94-13a6-08de204f0c91
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?t2bBb+JsgM/r8v84vXxQwwQyKSBwA7ESijaNKRS9LgqeU94xdLFUm3+Q5xxf?=
 =?us-ascii?Q?gpd+aEsWuA4Wc6q/yKCCxKsnMZWdLOz9zfIL+N+Vg2FwFsVW0pY9n6i5lbck?=
 =?us-ascii?Q?JWz5huEJA09naC7hF/oH3SIqtVVRI+JtljlPwAI/g6U/EPpDObT+wWx+JyBp?=
 =?us-ascii?Q?LhiBcuHHXadjo6zdFqt5ZVpypmOp+QawhXX9eW/nP+f+xQi48ugph4klk+Tn?=
 =?us-ascii?Q?PyifhAXTEehx0UX/oOHjY+PzrKmEMrTZgMAss/swvm6kifLgVGcGvp7602ph?=
 =?us-ascii?Q?TbaCAA/USG8ClqozczRHmXGTYb4rpZzwXBaLv/l/cGz95W63ev5ND6+GEuVo?=
 =?us-ascii?Q?RoUkK4sRou/eZ2pG8HqhEc+FUbt1h06CyVTEKnI9GWPrE9VJexIh24ltJnyO?=
 =?us-ascii?Q?C1I5yMSC1zBxIIuXHAGIeiDOcaVRqG27LUk4NTtaQh/DGgHywYAsJzKSP/GL?=
 =?us-ascii?Q?vTd5t7gko8TFOXK0GjErAmZv8B/T1VeWBIEwPekqu+LHHZ7E7m4fNYat/TJn?=
 =?us-ascii?Q?sH+YBevYz2EZLBdLOGSBO7Do12b4NvZj78KJF9gd9B+l5Fw/VBnfaoN1JOrM?=
 =?us-ascii?Q?D5SU/Y5K9RkOmeTPRiHgn9FWvaG8a12HL3a0sy5Jm0KpFDabXRuh0uNUNull?=
 =?us-ascii?Q?7RFsCLtMLjuWpvpYu7vS3CwSfZkaQW8+pWbu0rq77RoVhxf5LkehJ/hmmzCw?=
 =?us-ascii?Q?VXhWv2YGfg5srBvh2KsxqnOWomXlFP4r4PSkzy+TGJPLzBxuO2z3AzVg/CDi?=
 =?us-ascii?Q?gekWBi1Q63XpUlnrj0Re8cdIixXdpl5x1atKt3pBfr+m7wQShsQyT3QWE0WN?=
 =?us-ascii?Q?IJZSHWNaNTa7dmQuTfSzvhF9OcSgTaPh6djdVZbxp9USJOeC5cGB2lcFAPMH?=
 =?us-ascii?Q?TSFuaj0rpqHBHczzuhzauAV4u2zhMOmUPsOJQoGOL6twSIWlGQMYrqSZV14d?=
 =?us-ascii?Q?KKFwZiotypl8V9GRTK2BBSfCxSqwfyqGAxCHBdzl4gRCZ82430CegZHwvlsS?=
 =?us-ascii?Q?/JiAJhUHeqirH28OkBecDdKhqNNPBBRP6JHfO6IcdTRfrdtobRGrRf81XoRH?=
 =?us-ascii?Q?c7ccbmxrfUayL/9gtUdhksy9+rw1NI3FzcblzylL9hxW67JZ8PP5oBMshR+0?=
 =?us-ascii?Q?2i5Rnffsn787+ehvvnyYTfwD2fv82MgqaWL9kT2uX6XHszxamaJ+EIyurkXp?=
 =?us-ascii?Q?WAvLgzphfQ2jPrVpWNikr5zgQqCNLQAjq7+mOd0C9eHsj/GiY44yVAYgJ/kL?=
 =?us-ascii?Q?9R0hnxBd06zyJmGkwJF52i3DgvUTs3XX6IgeH5YHsDTadWuI+dSlWXFuMQI7?=
 =?us-ascii?Q?2bujilHXPcx++1Y37k0ukjVOGrkpp2BKtKMywDgyvpNkpBTKVVuSLWLXJR0z?=
 =?us-ascii?Q?fzx72jvpJ89Ugj1+NUYA2a0fnqpoZhA9LfsMhn8n85bbEs2bnvXCSdji8ut7?=
 =?us-ascii?Q?nW28BHb9pHDvv6oszxPkK/PxR+t/h/WU?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7999
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fa5dfd21-6dec-464f-0151-08de204ef7a2
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ghOi2rvQopaT9/88wkDO3sVoeDsh026Mx3Awbc6UinKVf1ekk9ygBRK8OOJy?=
 =?us-ascii?Q?TFbDgpqafF9WgYKRGSznsJn6el4f9DzmK0aI6dcMLQBcjjNPbWkKvYceqoRv?=
 =?us-ascii?Q?OrxxC8TE4UDVy/DRFuBMGWRbmAriJjY3kDHl9c9TNke2AopbfvGdox1L/dgB?=
 =?us-ascii?Q?XWCMzxwkSL1M4CGZ01IPZu2VW+UjfLmAnOAg1IkAi8OQlO7OkuyTc5aXxuhj?=
 =?us-ascii?Q?sNnSkQnkiThFrdDTX2ss162J6+51WWztdWvVPEyEsKNejzucGe3tmoDWhR0/?=
 =?us-ascii?Q?SbZZ38y8mWfY8ZzkrlWW/l8m+r1dn4uH2ixdh3EryiyE/EGEGxK+XBdj4q/F?=
 =?us-ascii?Q?ZGwQ6bB20X5RMo9A5YY5xiz9gnzj1EDo4+PvjKpT8pIfR+nj874bL4EvK5/V?=
 =?us-ascii?Q?9e3dqrHN4519VOH2zVj049oZignbGzJnVoFCJdqOsya73hdIXL0ZJXjump9T?=
 =?us-ascii?Q?wMwrGmcMU+ej0bHMdn4BKy+yhFoQ6BVaWMTh+WK4ZIwfhVxFfCWoIia4VmAJ?=
 =?us-ascii?Q?WnePFalYM4+2OZvQNuKC7+h2zvEm2hrCdcOd6RYYCR+v7wTKAxXc5DuLfy7R?=
 =?us-ascii?Q?SxI9GQp26R5SI7Bj4ovsXwUaaiwK8aAjiEYU74QRNBViluZG++ZnrXBOgoI9?=
 =?us-ascii?Q?Lggj8PSkUGu7O7PAqnsG7k2Sh18uo+8CWcPCKJgaov2npCue4soD1cjEJ9dk?=
 =?us-ascii?Q?6o8vqUeGUSvpl9gVMAMzntXsEgbcQi7iivi/3cJvtjfFfNb6UMw/zMiRM1rZ?=
 =?us-ascii?Q?gWUDQmUTRqj4R3fJoA5MPjdeRsacCnMsW6sRMaUHM9eMLWOGODa/Vh5Bt3ae?=
 =?us-ascii?Q?zawS3L2r42jT4afzguICKCy4Ha+D+9YPufGDKZFu4ohhNSkDmD3K2W7gAyPg?=
 =?us-ascii?Q?bl0GiefZhGg4r0vg7+YWzvFTz2LBUmi/xE/8uHoPiFOQgYsJJ18YBjAL0CqR?=
 =?us-ascii?Q?x+gt2QxiPbRw9fviHXdVVC5U3DMwQg7YTI1P8jf7bDDd7XYPwuK5A+7gP9xO?=
 =?us-ascii?Q?Glq72uB5t3cm1N2iC1pY4p8v1Sl3BsMjLtW7dWoviA/Occy3FB2HRp+iRTut?=
 =?us-ascii?Q?y9hAsAaX5gXtzLNHKcQvn5oQfdbDqW7Wysoo0xhyRPFRNnTgsrXa8wH50ejR?=
 =?us-ascii?Q?Nl5noMWT1Y7mSXh+ARiNdqcEODbQdGnvywW7lG+vScz8F04qLtLFEFY/PFx/?=
 =?us-ascii?Q?bq+TtqP3vkoNDjDvvnsYFM+MZmvaS8E/61pKlggjsSHZWH6PyMMmwYG4AqUM?=
 =?us-ascii?Q?LSTxWPr3Qgjogu+peRbhSopbDN/tetnYCS5Vrt9+CX80Szeun56JLjG1SR8t?=
 =?us-ascii?Q?OTbDE6VIBP5qQw6IdqTa7bQ37rJWlabSxK1tHyF7e4j8pz2ucHY5uASRol5M?=
 =?us-ascii?Q?ExzQISZAM1DQCzvgYoL16USUlMIiW1cD4KbcTdjo7lJnWUGAqmNbkG21FsjK?=
 =?us-ascii?Q?so40el+PMTOjzXYKbLQXUVsYomVvuakpTXKbjat3Il6EwQjR8GKRMPFNFYip?=
 =?us-ascii?Q?n6YNukUt/jendEAChdqHv+lUUceuOE6rNI1t2bQobgIW/luRu2ibkebODQKL?=
 =?us-ascii?Q?L2dHsyvjDYBgWGuJAOU=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 11:48:21.7458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f57ce87-070e-4f94-13a6-08de204f0c91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_034829_683698_6E2F7AAD 
X-CRM114-Status: GOOD (  22.20  )
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

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> As recommended in section 4.3.7 "Synchronization when using the
> memory-mapped interface" of ARM IHI0064H.b:
>
>   When using the memory-mapped interface to program the trace unit, the
>   trace analyzer must ensure that writes have completed, to ensure that
>   the trace unit is fully programmed and either enabled or disabled.
>
>   To ensure writes have completed, the trace analyzer can do ...
>
>   If the memory marked is as Device-nGnRE or stronger, read back the
>   value of any register in the trace unit. This relies on peripheral
>   coherence order defined in the Arm architecture.
>
> Polling TRCSTATR ensures the previous write has completed. Therefore,
> removes the redundant DSB barrier in the enabling flow.
>
> Update the comment in the disable flow for consistency.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 23 +++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index fdda924a2c7117a6828e5325d78586b09e75febd..bdf5ab85b2213dfd601391fdcf50960667fa7cea 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -475,10 +475,16 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>  	}
>
>  	/*
> -	 * As recommended by section 4.3.7 ("Synchronization when using the
> -	 * memory-mapped interface") of ARM IHI 0064D
> +	 * As recommended in section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 *
> +	 * For the memory-mapped interface, the registers are mapped as Device
> +	 * type (Device-nGnRE). Reading back the value of any register in the
> +	 * trace unit ensures that all writes have completed. Therefore, polling
> +	 * on TRCSTATR guarantees that the writing TRCPRGCTLR is complete, and
> +	 * no explicit dsb() is required at here.
>  	 */
> -	dsb(sy);
>  	isb();
>
>  	return 0;
> @@ -974,8 +980,15 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>  		dev_err(etm_dev,
>  			"timeout while waiting for PM stable Trace Status\n");
>  	/*
> -	 * As recommended by section 4.3.7 (Synchronization of register updates)
> -	 * of ARM IHI 0064H.b.
> +	 * As recommended in section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 *
> +	 * For the memory-mapped interface, the registers are mapped as Device
> +	 * type (Device-nGnRE). Reading back the value of any register in the
> +	 * trace unit ensures that all writes have completed. Therefore, polling
> +	 * on TRCSTATR guarantees that the writing TRCPRGCTLR is complete, and
> +	 * no explicit dsb() is required at here.
>  	 */
>  	isb();
>  }
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun

