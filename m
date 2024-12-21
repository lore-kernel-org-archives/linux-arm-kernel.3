Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7292E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 17:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2u9B/SwHKymlA4mFQ9/eIcJA9pb6XvxqVFnPxJFAI9Q=; b=SpqseYyocregMhF3Nb/BJ2qOPv
	QwWiWskDNj7fZeyrpsCZv4E1cjb6HUoKEXvq4OPy5lyMv0BtDydOu2Q2tDnz7YsPj3yFSLVYpvebO
	F4IZJ9FiAmJgUHp9o98BhWnkcIvhS1aQkXtnmHGu5/KIK8CmMf7uAqS6e7RCic+DFIZBV12+P/Kut
	3YQiOn0yRG7VJy/jkdKnqijmWio5pFkgDhyXq3kqzjKfvTJPV8Jt0xMjc+uPmwb9VZ6babYL+OClo
	rvEho9Dqwo8A1ST6G73bO6uThwPGZfUPTdTvSsBorIyidZNbAOVwGE2MNHtGTHS15PoOttO34FO+f
	3E4+L2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2wP-00000007DUP-2dVQ;
	Sat, 21 Dec 2024 17:07:01 +0000
Received: from mail-vi1eur05on20602.outbound.protection.outlook.com ([2a01:111:f403:2613::602] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2sZ-00000007D4h-3pL4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 17:03:06 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jlod0mNhfRE8gZYx5XnVxYcjjSXUCDa0V7ImtIPei1gLeGUcG1KopReoA60QmaAdCAMRutamPE4xTz/XorSKrZYj2TpzsyIoiFqmVpnxDHG1SORjYxW9QnML+4KglQpGzToAU9DLmU1trKP3/JRhR3f3MYOsDu72+N1Px60JI0+SehilRWMwZNca60wx/btuOD3USx7MVbP+Bm3pSU+0MKHuw9PtyFwfRM3Gk/p+RKKWJ2MdJblBkj/NxGrCGHzVQjLWWi4cOTcLnMBHZMIpHG2aWB8EFlby661TGhj5N9Pn51vQ0kbWQzMwI2e4WZ6Sl1QZbDzzTy+A0c6w+lkOcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2u9B/SwHKymlA4mFQ9/eIcJA9pb6XvxqVFnPxJFAI9Q=;
 b=cS7T5R5nQv+vRtSy4Eq6z15osbYYsE7GXWR926AKKAtXAuV/qzF+KJvrNCy3VNxAtaUaeuXmbw9gYqmKj/QYwYogjGD0BrPS8mDBZz7HUBcXrk/aSzmo1bs6LcbneXI4QQ1QifsvWKuHEhynDrug/URl1I55wPNLTkb2egl3/rlMC2nSBYZA/xY/6+u/rK1B4uskZ4sSg+PWP0XRW3OCKrWyAMkdoLpDB6Yu9Y1xH4VYFuzktkk0s5R9VBEmUqX6hJFnfzmmEfLCRApxN6s1owrmumkE+PmhocYPtWY93GgonJf5/b3MuHwIGLlYlLibNoOCo18hPRIjn9BhjQimMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u9B/SwHKymlA4mFQ9/eIcJA9pb6XvxqVFnPxJFAI9Q=;
 b=rU7EXM1n0cT7WIpFOhMoNsSEdvhqO7u8b5kZnETlqekpPsNVubU8Fxb5PkKUL0rKeF6aKW8JlSLK2wVezeSh5Hlfk0ixCvsbzhIBdlQDWW/fM+v1FLU8I/5R93vQXbj2HKwd7gbc0ryzrAIA07BwPc5kvZE7fYBNzYp1ARWyEUQ=
Received: from DU2PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:10:232::6)
 by PAVPR08MB9579.eurprd08.prod.outlook.com (2603:10a6:102:31a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Sat, 21 Dec
 2024 17:02:51 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::77) by DU2PR04CA0061.outlook.office365.com
 (2603:10a6:10:232::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.18 via Frontend Transport; Sat,
 21 Dec 2024 17:02:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Sat, 21 Dec 2024 17:02:50 +0000
Received: ("Tessian outbound 050b604d5e06:v528"); Sat, 21 Dec 2024 17:02:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7defbd9267b4941
X-TessianGatewayMetadata: 2AdGQ42VwDO3dj9Sa8PeSzwGTohBGphy0YJuGEoEV8qx5P7BYkjOczxJ5+8f4+bdphBoD1f3hgH20A+GP8WdcxxfEK6Evas231AaqWRsJM80+qi+s32mnN5Nh8bazcwd0sqjaULkAIOFUXFu5WCMMg==
X-CR-MTA-TID: 64aa7808
Received: from L47691b039012.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8D6AD5CE-072F-40FC-A79D-31F0B771B0CB.1;
	Sat, 21 Dec 2024 17:02:41 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L47691b039012.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Sat, 21 Dec 2024 17:02:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIt+e5xZmtUZzSZylDH4lY19Ff/pr0lMmaWVQM03rZj2XaIRf7/Ewo9pJboS/gT/8mCtDT7NVqi6ihmpvl/z6w1AOVvSt7UsawCZPD7O/2SlxJreyUV8x0gBlI/ceJlHcR7VBxSp624HhzqVcNPpf2J90h25NCE8SzrFo/Aon/jorq5ffhNb6hux7qoa2uOUSnugB7Spjv9c2OikElczLuTHz8t3/fXphOxWdRtzJ2tF4L5D2BsitNKs5xnOVT6UtG6c/+k1YwbaLQFHsnL8x8hwpjNXdsHaKRajKAyGPxMO2c6nTpSb5MI6EgH6o+Cd8zPuqE5vgusYzk9tzA/ztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2u9B/SwHKymlA4mFQ9/eIcJA9pb6XvxqVFnPxJFAI9Q=;
 b=lNc3cbBHGnEtzHORotGALb8IWGBV2IKwR7gLsVQ1894bHx9CnVnP7aedXSaKMcIHthTXVR6/cZck9Fc2XKiNGrF1CcTQDOPRJ4BMf+7Uvebmlslapq0I8z/RN/17m2m7WKATHN4xHQFxMeDPyyjTxvj0E/HG4Roib8u/D2iGOmOL1jKELeNhbrJCNipTJ6Eb7bKBbU29OY+C7Y0ipDdEJXHIupZaVZTaCI865pK5qFKQcZ6w8jWxmaQSU7/MXoBMHl6i8iTiXVdh8Yt1VPdfc7Y8ILdWJt6OBIN7TiAdDGIyv+hJPW3EiFPy2jV5xxIqIMKIyTAJ0kCXSpI5HU9n6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u9B/SwHKymlA4mFQ9/eIcJA9pb6XvxqVFnPxJFAI9Q=;
 b=rU7EXM1n0cT7WIpFOhMoNsSEdvhqO7u8b5kZnETlqekpPsNVubU8Fxb5PkKUL0rKeF6aKW8JlSLK2wVezeSh5Hlfk0ixCvsbzhIBdlQDWW/fM+v1FLU8I/5R93vQXbj2HKwd7gbc0ryzrAIA07BwPc5kvZE7fYBNzYp1ARWyEUQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DBAPR08MB5685.eurprd08.prod.outlook.com
 (2603:10a6:10:1ad::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Sat, 21 Dec
 2024 17:02:34 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 17:02:33 +0000
Date: Sat, 21 Dec 2024 17:02:31 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Message-ID: <Z2b0p8XiBsa5VM27@e129823.arm.com>
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
 <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
 <Z2VJIh2+Z40bZi1e@e129823.arm.com>
 <ac537889-dc0a-4d2e-870b-c5a33279633e@arm.com>
 <Z2VXc/R/nOLGz+Cg@e129823.arm.com>
 <f0c15466-a27f-4cc2-90a1-476ec278d870@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0c15466-a27f-4cc2-90a1-476ec278d870@arm.com>
X-ClientProxiedBy: LO4P265CA0213.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::11) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DBAPR08MB5685:EE_|DU2PEPF00028CFC:EE_|PAVPR08MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 301fd193-a685-4491-7b8b-08dd21e14d10
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?84jkCcGJnF5FkSwrfPm/Y4WWim3rJyYY58vZWxb9LTcHXiclu6ZEkYSba4jb?=
 =?us-ascii?Q?o2GGhajpptgJvH353ng85IaUhjiNE3Zn78CB4K78W6ilWu5h8L3MS1Rg+8EB?=
 =?us-ascii?Q?8U3noBOjFWBct3I/H//Ll7evMbGskzgUdyYF5EJLTAs6g2wMc2wqnGy2Hm4G?=
 =?us-ascii?Q?mFtfm62vuASdsmjAleZIZuiqbxaSrB1yTf/OmK/eq6Ejgfn8APCA5jodX4PA?=
 =?us-ascii?Q?feQSZQgU5N7c+aIbeMPZ2FEloR6D0Gu2sgxXSi3L88trMMe2BJqOGP862gXA?=
 =?us-ascii?Q?8kKFYJ9ORJ3hXs9o9MIl17ew0WHHA056I52eL/txrMNKwHn9+8xWbTyH7Fm4?=
 =?us-ascii?Q?qRRsQTB1NwiUbMq9jAoOeJrZl2pRgp2Z6jsO6mATadnQAYTmj3wYVU6f+c1k?=
 =?us-ascii?Q?pwn34Gdwe0QjwtKBjvBOBsEwzcRILyxgrGUMwFliFgemA5vRwh6PxnnK00S7?=
 =?us-ascii?Q?N1ZLSxCNhsof8N/JD1v+bVheFEmQRTubukyxt0pbG69VNjWcjfJ0SPvA8NMB?=
 =?us-ascii?Q?pxj6hQcJGVsGgxSv8WfD1FtI8lZ0o0D1+Li2X4Eqm5ibVaEyLq1X+H64dXak?=
 =?us-ascii?Q?Ikc0cAJQJ4kq0kGso8wGNXm39+EG7AFNiRcgXTXoIkTKCiDhyjh+vR11thNO?=
 =?us-ascii?Q?69yTY5rSM5PFcWB6eLpa61bVCCyAKhqURZJD469oA6rpql5ZuVBwI8vl8eHi?=
 =?us-ascii?Q?WzRplMR6u90Q/SKmyxlGShR5jhzuGYqSB13QXCe3Redb2P1SOL71Vff52qb2?=
 =?us-ascii?Q?YiOCFdzCpBgifeuL16gf4fTs8SpdjV8qVqRmIabotuq1lX/4m/fgl5d10lKZ?=
 =?us-ascii?Q?SNcIJs42BLz0ApRwjkOwryqim3uAKzELdH2BM/NizRZgUDK2LM7YZQKtpOKe?=
 =?us-ascii?Q?kyarKRxXAnIAloPrIU6BTXqrAEU0rendkPpsaxfh5qBKRWDuEO2c03fVa4b7?=
 =?us-ascii?Q?vRZ3z4HGjOdPPOs6lJHh9p01Vep3MqE4bC/Gsk+SNBL9Uj+qvo/9yrf5j/Rv?=
 =?us-ascii?Q?va8SidVmRljx41duimn8mIYZUubjGfWzkDw3hdWHrbxecI2PCFKwzbmCsFSV?=
 =?us-ascii?Q?Z3F9vHfDQWwt1Qir+BYkkjpE4JU7Jr39zN7wb0U5xLGNeEPgNRa2TjwUuDkO?=
 =?us-ascii?Q?M6s285asxDW0oTztykZCy9AMYiOW6gcPgIISCcyKzEVQs3hpx770TKKX5T97?=
 =?us-ascii?Q?223NiWhreRS+PXovg6URzs+Yrojg9TLVGxYHotp5+2MjWwweBBSTNoTQN0GV?=
 =?us-ascii?Q?V1EGUw9+gPs87BEzhLL1HFMQKVaM4v2EdR32m0xRQtD9aqMGmAze3B0xYaTN?=
 =?us-ascii?Q?W4LJb7eJ+YMQnj1UdhKGPyXL/75FX9yUIykCbcXfvGW3uesSCY5T/tMcjvPi?=
 =?us-ascii?Q?CCncg2jfJ6fXOLsS2a2ueyFQYevW?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5685
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ab22253f-8911-44e5-5c61-08dd21e142f9
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n3ak2ElcBU7gjOAmTBWu6IMq/Z1s5no5k8icolasZ+JxVa6bmK2ZLU8sdCQ2?=
 =?us-ascii?Q?lsO1aIsmJGt7u5nD8PNXIV8NJgxEa2pIlYdFF3+RBZD/JEZbcShVE9GW6gwW?=
 =?us-ascii?Q?Dwa8n/3JiLnl1EqxyO+bmOYIbVgsIr42Wcm+JT0mHVGpCNVheEf8oYeaw9sF?=
 =?us-ascii?Q?dg0wOsuWag5uEWWxW8jrfprWpIdZzHnSp4jZsRYdEx02evo7ZaFThiUXkkrw?=
 =?us-ascii?Q?oAoFbyK9DDS5Zz8WDH1shpGVV6GnRg6UwEex5GRlTqqh8v/4IEwqU4HDgky2?=
 =?us-ascii?Q?zO5S+5aShiK8BqnVhhXMKU1RUIA8NRIEg8No1ueKiOfDnJir0dFLvPjymT9A?=
 =?us-ascii?Q?CtxWWIKlHHk27UqCXAKDIx5EihrQK/lcnaNSXMWeoEICbRcIs28eAbY2lcnl?=
 =?us-ascii?Q?p0u/75oZa4vorokPWjlJFt7P7tdeyfpxkgiI/bewAWNVXUrk57tidzfAUZlC?=
 =?us-ascii?Q?jKj628uv/vXqhjzaAkgI6azOQhPwOvPF9G3BDkm/SiBiDrFtudBTjW89Aita?=
 =?us-ascii?Q?bwxb5wCGLM7mw6zGCYHvGBMiHn3o2ii8tREGQtEapp2m1c4vRRuNuVAA1D3t?=
 =?us-ascii?Q?y6WL7hwB5C5CR7jzmakMnUYtY8H0UMmzD+WkOmSzICY80/peSLD8r5vIVD0r?=
 =?us-ascii?Q?ePcLo9HJrVR8uDfT7pW7l2Ya7opqyHGYQyX02TlE9mUf82E2GUTsN+y1lLsg?=
 =?us-ascii?Q?qbbIw8RdBXBKHq3pTKrURaH4OP0fUFTQUNH4HP0QyCLOqNScsTxwlUHaSYrM?=
 =?us-ascii?Q?KtSqiYHV5wVfnW1SfpWMAv02BClqkBw+RERBcJ7R6H2hUorGRsBp9xexNgjC?=
 =?us-ascii?Q?1jyghrmnGKhi4HX9euQibfW7SxocIo6G2+wDDKpftLpsLbSnE9/k0jQQBSrL?=
 =?us-ascii?Q?wYOP8/v7hVharA47eIhrIpBabc5m3WwPQaKdDmFkCuqzWDp4MICysh6EDEFf?=
 =?us-ascii?Q?NdE//Cb4lecx+5Gg4gpc7U/HKAEHsnyRp721hLz4PnmCU1anY6arAxl7RIEm?=
 =?us-ascii?Q?tPJEfHiYjYjjnzvcW9bDBhmzAlxnIG4fqI9zluiNToAzAwaJcZ4WHtHQvAXL?=
 =?us-ascii?Q?VTinPLxt3gz9qV1WPQRS9LanQPWbCUnuo5D2SkhmFKJ72UqwDIYouPYqspuM?=
 =?us-ascii?Q?vNaHtJw+j9TQGgh/t1D3ST4mZJKTT+w84HU4BBRCycD66yTVlOIx4zdgO4Fp?=
 =?us-ascii?Q?2xs/x1eNtTVc1NBOuJDD1d7EWB3mr4+BN6TE7Is+vTJwun+sChwDlqYwT6iD?=
 =?us-ascii?Q?CeGH6X5cHpXONd3DXYsX0x/Iiqwv1Ze1MMzk9BaZ8P9417zhqY/SoJ6eF5z2?=
 =?us-ascii?Q?JKoEVUhmKS51f8ov9bNeltLhmY7iOp+Km79QD8srzL7ZzBdsudaIW3cHlGfD?=
 =?us-ascii?Q?a6STS1kaDu9srfd2CMTp1DwXKmnbbRZ7PWgWe0PFwEnYOYqtPre8ZOZjFNFP?=
 =?us-ascii?Q?Mkan6VPbEfiyq+KyZhmp3mAoPrd3KLqd4ucJ16JC63lToSbdH7Ky9PQY3k8O?=
 =?us-ascii?Q?Ahf2bf+WNDZ+fZA/TOV43wdZmUItU7TTpR7/?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 17:02:50.0606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 301fd193-a685-4491-7b8b-08dd21e14d10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_090304_270885_E4A75989 
X-CRM114-Status: GOOD (  19.26  )
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

Hi Suzuki.

> On 20/12/2024 11:39, Yeoreum Yun wrote:
> > Hi Suzuki,
> > > On 20/12/2024 10:38, Yeoreum Yun wrote:
> > > > Hi Mike.
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
>

Here is the patchset fixing above one:
    - https://lore.kernel.org/linux-arm-kernel/20241221165934.1161856-1-yeoreum.yun@arm.com/

