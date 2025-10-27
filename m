Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379D5CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rXMJ7m+JNkhUNKxkMC1qKdP7LeJpFEEYoi9QRb7Sjo=; b=oLGSBD0GEiTIDxFX+3zxKxHFSM
	TO7KPTI3V34XVO2JtUIZrU9WySKRJpOXjEeHjtj1Xr9wdc2a58xT/J+UNQUBtIE5FrUCv7bd40eKX
	zFuUwO/1E5z4Anb57H3TZiI4G9vvVjYMQHe74OfTrqFNYUXbpLEGXUgT67vwRTqU0QnLldyh89QDe
	MOKtookj6LAMNRK9Fz6bUwgpMjQpY4qbwF48N81wPPDIulE+Oq8IOleXNNXso8dD1TqusLpkonooL
	VRIJxYheq/yrQCHFofEIKvetNWhMMFXyov1d0mNLDakDUAWhoR1osp1M0Ruxioz+VrUbmS6WmAkE3
	146q/XFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIzv-0000000DSYZ-3epp;
	Mon, 27 Oct 2025 08:54:39 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIzt-0000000DSYE-0d5m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:54:38 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Wk0fZ0x/FpUQZ9GAA/e8YzYmfz56RhPtsnCoxMwgaTKvLujX7L6KMlB1Eht81e9Fv91VH8jkhYlvJFuCWLAteuzEktVTGFi7psBEKpWvJXFFaxXea/GqFCUl6b8SvrBJxIWVw/LKizSdwi9c+AXbgn36xrpKFwvS0m0KUb8LSPeR41j1l3zNjGbPapL29Fixntk7Ic8bXGnskjmg7z7/IKt/Nn6+P8wPYX+LlDqdGWSmYfU85uI8q6rSWNKKDSiZf5HxBsoZsAHhdQha0Ybje7q4tFBQLpHLZmWFIqWFpXYKUHBc4JH7m8HmIjjKeyw+v4UeA/KOYIpR+7AGGEVqbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rXMJ7m+JNkhUNKxkMC1qKdP7LeJpFEEYoi9QRb7Sjo=;
 b=BUU1EvPGTdagSJFhu6V6CiqBl3+UeVubQaQBtqlM3R2q+e7/6Flk1jWqprzB2C8qe19HpWZXa8+Ot4f3K8XdBT/lHi8nfRBpBTDxe0U6F9YTBxF2F3lBefumu8GiiqNkqGh8skBhGE4y2ZcbieySPAgPu3BItnUM1W52VPTSB+49cBpuhywN/amPv/YnOT9LxoGOUApRN1UAa9L1mxEkZKkKWgAG0DlvCtvbZIKPbQkhxrUusN7CyPLKlUZ+Dr6j7lLQu8uFULaku+EDLKprYerncAnZD9E3F/LP4XJ2GOzuMBS7XrVPpgg/AC2xSySLxCWoHPrPGP35j7rRjt4tWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rXMJ7m+JNkhUNKxkMC1qKdP7LeJpFEEYoi9QRb7Sjo=;
 b=YpjvjAUxlEq3hPo6+HKUgb9rte148vHBxpvUxfMhKBjZ0v3zfg7v0hi0E5mMbhsuTkvDkN5ZzRr6EKGgrNK2fqAyiq9HfdT+7X014GaHCH4M9/grbWmDvqZlfhjV95uFhx9liyho/XipWMz3+BkTt/L/NlfOxR9PqOTbnKZY9go=
Received: from DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) by AS8PR08MB6293.eurprd08.prod.outlook.com
 (2603:10a6:20b:23e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 27 Oct
 2025 08:54:32 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::de) by DUZPR01CA0018.outlook.office365.com
 (2603:10a6:10:46b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 08:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 27 Oct 2025 08:54:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1LXPcFoO/tEN+yT05jPcDVI8PsHSKXdK32vnvBHyZDyEjeSJb1/SDpaXY0KCmVwJ5yhv8E3i/CYLsqmzxgHbXlsh9ju1a4o756Dp9f3VQzR7lo2YSblBHiRsKa4PG2b2FmBzT3hpvNCnYmhZLrZ+e9ut1TX/Ihc3VjyL8jo43MmcwRQ6nMNw+2HICye7dYlFhOtLgdTllfi56PlSiQTLBJLdJVdyC25Okseg44qxUpuid1jNZUatN1OlGYXrQp8qP+tpXQ7SFYuLO4P9wza0mQB9BXPxQ3g8AaKAChXBQIg04RgW+JI4FGhctyQBLiY/UcVlRDUhUzNtlrTrGm9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rXMJ7m+JNkhUNKxkMC1qKdP7LeJpFEEYoi9QRb7Sjo=;
 b=QXsNPujNUt8Iv6sq/3MPoynaL4R94qpJwnBjyuk1LZbAEpfbTzKaieUJpXK6QRrQQxT74tFIc4nIsR8wD4kP47SfJ7I9iw2cBz6hPJ2mRqsFbBQkIU/y55eXc6xfIJnPkS/tdflik/LpoHeewwSXZlFbkzz67B2fbxi/reSVu/wzCXi6if5b4jIYBjAPM1unSQ4ZJ+7rGz3cOyDK+vx1gYPEVs9T9bHPDOu7LTiX7QhA4viAJWR0cjlEZCZrFJO5gcYMveWJEhtLaR/O2t0tY6q3m2xSxJdg1hgoSNVKVtKptCXrOOv/yWqMwo3N3v7iO1/bWy2i/P9Xzgz0QwWB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rXMJ7m+JNkhUNKxkMC1qKdP7LeJpFEEYoi9QRb7Sjo=;
 b=YpjvjAUxlEq3hPo6+HKUgb9rte148vHBxpvUxfMhKBjZ0v3zfg7v0hi0E5mMbhsuTkvDkN5ZzRr6EKGgrNK2fqAyiq9HfdT+7X014GaHCH4M9/grbWmDvqZlfhjV95uFhx9liyho/XipWMz3+BkTt/L/NlfOxR9PqOTbnKZY9go=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI0PR08MB11064.eurprd08.prod.outlook.com
 (2603:10a6:800:252::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 08:53:58 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:53:57 +0000
Date: Mon, 27 Oct 2025 08:53:55 +0000
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
Subject: Re: [PATCH v4 09/11] coresight: etm4x: Add flag to control
 single-shot restart
Message-ID: <aP8zI2KgLxH75662@e129823.arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-9-690e69ae6977@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-9-690e69ae6977@arm.com>
X-ClientProxiedBy: LO4P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::10) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|VI0PR08MB11064:EE_|DB1PEPF000509E8:EE_|AS8PR08MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 607ac738-facd-4b1c-10ef-08de15367123
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?meF4KgbBPxgFpOLgbRzgOTPEa8ARIVk2Ocram+NpMvz/YbdhCZe1E8h6X9Ql?=
 =?us-ascii?Q?xMMDSrdnHiF7Hc5sZ5ESSd4SebZvHQtHqEdGna8kQjzR0nA3b211wEopHZxE?=
 =?us-ascii?Q?jCOLdmpfZZ/IlDgdDbFRD8fHcFOxcpxrKoIL2+58tPzpYhWkVS+0SsKKYXsp?=
 =?us-ascii?Q?Y+ng5UIJgvENvB09bdQDLm34u3xZV3qfTqHfKx0clDk7hgd9u1ilUn8YawP1?=
 =?us-ascii?Q?036iB9NzrVcdIg9B5WMn+cpIni7ReRyfGkMXGFaqUp2tS8y3VXU0gYq4gUVc?=
 =?us-ascii?Q?D2SS+aDVHfWmZR3jcMCUzOtcLah87iIIkBPCKH6Xy11VYU9JSRHTIRZI7iDu?=
 =?us-ascii?Q?mjmidPfvdnyGaa9aEPpXJecxmOvBwq59G2FVwbGXA6UtAhbpgMpHWeSfe5iu?=
 =?us-ascii?Q?QrL7NBM7pvxoySyaa6/Ehafl5nbqyrpIhXYW84pSQAawHiwDB9+SO1Thk88y?=
 =?us-ascii?Q?n66UewOudoyvVGja+O9s7kwpelSieDIhFyePd95hMpP29rBjLDTnopX4v38o?=
 =?us-ascii?Q?FghJ6Q21MboBmTNOGMI1rx50LkaU7zk3+pga6CCGsIb7Kh1CbujPk1Lc2dwq?=
 =?us-ascii?Q?hk3CmLcgtCoHsBP06vGufeutsaUxDNgD2fctNNgnN0hQhwhxob1FGZeUFDbd?=
 =?us-ascii?Q?HJ+MyDgcW/cea7DW08F280Jb5LTOhzJIc8WYiNxmSdL2JtRH2uWK7ul3ggSf?=
 =?us-ascii?Q?35rfPMqKzW9rG+2BsmRUxFVHZAWS0KELek2UJQFrAkeRzJFMMU4TRVHLHu1a?=
 =?us-ascii?Q?8qaWfkwRk2FP9WXJb13fwAPOp911RiRh1PNDZ2dfNskDtDK02rSxIMRb3W2v?=
 =?us-ascii?Q?yARdJgFicTVRhCVrpyYfqVn+AUBO9Q3cjo1nlgxfoso2DWcPvlnypNcw0Up7?=
 =?us-ascii?Q?bylO6BGk6+kSPkWTX3o6vW5eeWC2+qMIv2BRpPu971OC4TcVL1aW9NYCZ7f3?=
 =?us-ascii?Q?oFVq96eFR8UtwZb8XcwQYlK/qDST69YTrYqevkDN4IckjBxrXnrTy2BCNU2d?=
 =?us-ascii?Q?8bY0X8XyuYJtr7w97gO7FH3VL2YhcvHfmbGSx9xBID9KVf8UVfJ32JR+8P8n?=
 =?us-ascii?Q?ogDOND5pEQeyaYoAwLnM5aYWU7XJZjuCI2YkYUSli6LQGmZ1M66L863aNIay?=
 =?us-ascii?Q?h5+ak9EwrQMGNXnnGhQJEJ9qKHoJ9WOfZrE5iM1j9FEEC5LXx13zzM135fgX?=
 =?us-ascii?Q?jwAQhzYFvQXjFGESJebks6071a4P6CyJKkeNY3MijCtt0kZmibuIUs6NFkgy?=
 =?us-ascii?Q?tLhXMM40I2efJ+HH4QCiCkzrz68CKSCV15Jp+0JfhREQHnl1QOSx/2qnL86N?=
 =?us-ascii?Q?54EcpQ3MC/IM6pPDvoTiBrkEoyCvakdyR3g2qJahK5DC1TdPMXMShgWJHkSn?=
 =?us-ascii?Q?8uNY7/pA1l9r94Cfr/T+i0TdjZfff3NV7v1pBCat4KcBQkguQ7d7uByPs6Ez?=
 =?us-ascii?Q?KF1wEL9d3Uv71LAFr4WEW3QqL+63rlY6?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11064
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: eb318053-acff-4a53-9b27-08de15365da2
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|35042699022|14060799003|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Edsf72SZDJxXH2wd0x3OcFGp1YxvekELhJYzYVsn9G4lsI+xHA5mc6K1CYm9?=
 =?us-ascii?Q?GLL6ARX+zgDSUuNlLS1x9YYKHRoFqKixvXPwGpVIpKTTsZOmKuQyd1ydBRd6?=
 =?us-ascii?Q?QIisHkoSSJ6FNLTVoWrNYT/e+5aZcbj994D81aoJrobFUIN/Z2j51IljLe86?=
 =?us-ascii?Q?j+jZjvE5/lDPDzrAmrDQ7iHIBKMo1cHU0NT69nM69jvgiTka6AcPgRcuxd7I?=
 =?us-ascii?Q?VcZIg5P/Bok0Hx0rJQWMoKTfdMQq2J67XZLjVIP4pLRXG+6KqeWKtXiFEO+t?=
 =?us-ascii?Q?gJ0Q/wP0O7ur+9VevKqRdMDZB6OB9Iac0/bMb9kOgn2bJyjgB5Y3fPIlszZO?=
 =?us-ascii?Q?YQiWagfbwuqvk220eVkgdarwi5nj3nXe4wMbaiDALjkXHkdo7EYX/RC33wx8?=
 =?us-ascii?Q?3Tvld+Jq4kRmiUldwc/9T274MxC0m3i7UubHjKq7Js8pD6b3+3pdsllP8+PA?=
 =?us-ascii?Q?cWbQcu5IPwvDjPZ0eebYiPebbFnwzjZdMBIIsT8jzekO8w0KYjNff1DMOjxk?=
 =?us-ascii?Q?EA5jD64LpTGtJR+Dm/xIceDsvSfCWnsF4Oor4Cv36I0NM3UbOttMunnwBMXG?=
 =?us-ascii?Q?5sMWNtP58peEMZZjG/xQgxrMZ5t9Uj449dRnAXBvZEhtO75jBSAwS0FDWJCs?=
 =?us-ascii?Q?jEr3/ytmxdTd7mYdY9xg0JdqJYTb3BjwNjbHbGpAVr4Os3N43RtJ+roTaP0D?=
 =?us-ascii?Q?SOTM4rMohp2VgSxGDApKLnBYSII1m2ngaEfVF54MmA4T8ogttcyFQ1qp4bXU?=
 =?us-ascii?Q?ti3MZaOlAQgIhMlFH8ANEmMXeOgGZyEC9WPtqEW98/4gE2lb3Sph7kkFbFGL?=
 =?us-ascii?Q?Dec2Ts80d6ya4Wv8q45YfkoAQ7wpMR94LPj3bl7eiChKGyLwiIaJUIHt44Ly?=
 =?us-ascii?Q?C54tr0Rrx9pevTlT+IZHWVKvAVdrQXb3wYnCOg6PTCmtZR2gsDR67its9hek?=
 =?us-ascii?Q?3/znYby0xr+oB4Fz3B+Oq4KANu8X/A8oazUm6WxsXPhAINxDEg+K/l5g7nR7?=
 =?us-ascii?Q?UahKBMqfwhj+KrnWbBHDDnqj6RPtM1+75W3ft/JqaFAUfosr1ZH/Rw6w6gkb?=
 =?us-ascii?Q?IlSyHDMDBSGDm70V8gj+ctRXRqlnQtMHk4sVKw5LnnmXEg5nv3aRLtNg99EZ?=
 =?us-ascii?Q?SPz5ERH2MzFYPIiuRSaXxzuxd7/HcCpohAL5u81H9q//PWSPx5iSP85sZ55U?=
 =?us-ascii?Q?MjglcF4lk1azYG+J4AQzU844OOEZX594Oy/AexIn4Zi7q++DHhb5o6osvQ1T?=
 =?us-ascii?Q?ywj9z9lMy+IlJ8dLXebuQ/VtVJ8JCHgDDfrBSftUcdsY1I+NEKuzzwFu/8sP?=
 =?us-ascii?Q?TtWdmCLjGTviTfig2SXzZSMMq2fyYHiX7jn+VPSPRKEsyUYqqCxYd4zd46yO?=
 =?us-ascii?Q?gtY/ii2fI5RyhkAZf1UT5ILSH+yJz6lnfsSooyRnVriC2eKBolw02nADRG3b?=
 =?us-ascii?Q?fAFbh94zq0HXdhKsKBPbzA+N8i+nCcKaPsv7OmHtlxGs8nit6Se9sEMu1Cww?=
 =?us-ascii?Q?gGWpYN48I9AVZGlO55e5xMGErC8KdOEHYmFPWVS7TI6k4ad8sIAbso4cENz6?=
 =?us-ascii?Q?9KMRLu8MtyXWhTHc2nM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:54:30.2734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 607ac738-facd-4b1c-10ef-08de15367123
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_015437_212900_A55019B6 
X-CRM114-Status: GOOD (  19.28  )
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

> Add a new argument restart_ss to etm4_enable_hw(). When passed as true,
> it resets the TRCSSCSRn.STATUS bit to 0 to re-enable single-shot
> control.
>
> No functional change. This is a preparation for a subsequent change.
>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 15f70268e5b605a6881504c0c60b001251fbbddf..4c6236ad241d1a13515160ca478fae839a891e38 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -487,7 +487,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>  	return 0;
>  }
>
> -static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> +static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
>  {
>  	int i, rc;
>  	struct etmv4_config *config = &drvdata->config;
> @@ -562,9 +562,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>
>  	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -		/* always clear status bit on restart if using single-shot */
> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +		if (restart_ss) {
> +			/* always clear status bit on restart if using single-shot */
> +			if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> +				config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +		}
>  		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
>  		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
>  		if (etm4x_sspcicrn_present(drvdata, i))
> @@ -628,7 +630,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
>  		return;
>  	}
>
> -	arg->rc = etm4_enable_hw(arg->drvdata);
> +	arg->rc = etm4_enable_hw(arg->drvdata, true);
>
>  	/* The tracer didn't start */
>  	if (arg->rc)
> @@ -865,7 +867,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  	drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
>
>  	/* And enable it */
> -	ret = etm4_enable_hw(drvdata);
> +	ret = etm4_enable_hw(drvdata, true);
>
>  out:
>  	/* Failed to start tracer; roll back to DISABLED mode */
> @@ -1831,7 +1833,7 @@ static int etm4_starting_cpu(unsigned int cpu)
>  		etm4_os_unlock(etmdrvdata[cpu]);
>
>  	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
> -		etm4_enable_hw(etmdrvdata[cpu]);
> +		etm4_enable_hw(etmdrvdata[cpu], true);
>  	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
>  	return 0;
>  }
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun

