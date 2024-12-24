Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA8DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNZekkNhpY/O29V7nA4fN736LYZKMp54bha+ND3RjQ0=; b=ihNc/CK5nkwC9wVauO0XCpNd0o
	MTQQIfIglNlULGTQXRh7hBrwa5Mmq6APALQdj9lQ4DEzobQ20jOzDNp74mIUgh7zD6Z6pWsom0Pvs
	P6l8oH+LiCMoxJAmi3/fOISmuBJl2dg9hc/BMCAI8qDu5qj8UQRCqjHY94c2+DnUqrzK3B/pudylg
	nhH9Hlse4GYJ/rxuxYYcTojq4Y2AvoPXyZOAubV7UjLUyYVLeD7iN82H0jTGzpCkcwhtqjMgn7R8J
	BzYFN5IRZ9Yfk0cl8BR1drzzDF8AifG0n2Dt7vxTVkkm15D1HCN7RaHFryuBWDLIJpFsrN9Hcmijj
	YDOys8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1xQ-0000000Bj9f-3Xkw;
	Tue, 24 Dec 2024 10:16:08 +0000
Received: from mail-vi1eur05on20603.outbound.protection.outlook.com ([2a01:111:f403:2613::603] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1ut-0000000Bied-2IK5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:13:33 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X2RUDssMpMMyGhVa3hEuwSWuj7/ThTNcm/BW9cbGD344xWcdjY0F59MG1Ztbw/BCJN2St3g5ieAp/hUzhSNMrb0WcFk9mvTCCy/hShToimmHVia8cLW0Lgte4zoW3sPKbbSEdQ6z0WGPjBm9e87WbDa3NM4+6TebaCBywqr2Td0pCuNznhUJn/QeePOKJCAOT2I9Qme5RQq7tZAjujrkUFvJzssuRPdVP3WS5WZ5qTOGGoso+z3CRmfhDsU7EcRJhLsSLT8ngUFwiiWc3aUUscvfU0ilm220MQhQn27pSrRv9z4J3xLWKukBK5EQHeW7JpNWPNXLLnGzzgsEKQb29g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNZekkNhpY/O29V7nA4fN736LYZKMp54bha+ND3RjQ0=;
 b=IKTo4E8ZDrxl3WYVT/Rv8CGbXj6fS63Mw7S7dtG0+iLAMLw0yX/HD3jAbNhuvYs7Ct0CSfgaD5RcZtaXDONALtxxJqnwItbP4Ifh7lifgfKKTFhR7XKd2vjfKflVchUaoDmeuF+d6ZbtZbof7O0/P93fYiCzNoWGLXaeOVyqv8AKr8BFpYPhupDPjOh0Bj/BiJVB9zsWvQJn3yHQ/ytmp8ESboZlUH19Wy8wLA1iZbZb1TTibLgEjxpUC2RVWjqLpsYa6hnH3Venv7bVFEPt3DfEzzlrZSeWuZC7GjzW797OjAHlimCnsuYX28ScDU3nYtP3FbvPGiwGnrdy2FRu/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNZekkNhpY/O29V7nA4fN736LYZKMp54bha+ND3RjQ0=;
 b=KHtZwxyVTNLoMtMUQICuaf475Ql3QiNOfrBokFKi8rXNlDf4n82wMYmfj29H3LsATCR1kAFiTUYD7TEka9Sw2rZ0zOVBlXn2RZ2K+Tg1thLyPjbf+O0mVP4a9t7zh8hbk3padz6N6Y8ePjMVf/fdyhxg7FWsIjmG/PwT7bnmnEs=
Received: from DUZPR01CA0279.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::28) by PAVPR08MB9601.eurprd08.prod.outlook.com
 (2603:10a6:102:311::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 10:13:22 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::2f) by DUZPR01CA0279.outlook.office365.com
 (2603:10a6:10:4b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.21 via Frontend Transport; Tue,
 24 Dec 2024 10:13:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.12
 via Frontend Transport; Tue, 24 Dec 2024 10:13:22 +0000
Received: ("Tessian outbound 867970499bdc:v528"); Tue, 24 Dec 2024 10:13:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 161888a4897a417f
X-TessianGatewayMetadata: D7VO+MTYOtNh+rYjjSIS0SWJGSPByUdCWIClRKmD7iMqA0fwtGBSkf04lMg4CK5qautZTLrkDH/zm1aO1yetd8M0U6DiO2gOuE7mjE58kV/UrIlH0dnhPKAz0GalqV7/LmDqZ7AXw5hgkZ0CqK7R7g==
X-CR-MTA-TID: 64aa7808
Received: from L8f92670ffce8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4C1386C2-5C91-4536-84D3-E8796C55F1AF.1;
	Tue, 24 Dec 2024 10:13:14 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8f92670ffce8.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 24 Dec 2024 10:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyh28yoSwqbtPNMZnjKCgvtEmUExDfv1eRpI+innoZraQBem6cGgemqMLRCht34Y7K10Awtxbpeb+yQgtS3eIKYZdl+CEMLJUMob51eZxBNkuBAONQluNgVRwDlxLaTeByTpSEEFToKDPo104VcdpsCuHuwHvcz2d+w72vFFwXNFKFxJOE86DSgTkS5d6rEpiaPSwqb9L1IMvNtuLKPMXROHHkPfD/RjVkD0TN2WaEQumxW1beIMuL8rOtfSYWindgGtVINRmtyQqL0GQSNM+62itU+Zxg+Y/qZIbejRhLrb7dyNFVsddhtZGTxOs84AjJfjNI1Umiiu2N0kVPqxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNZekkNhpY/O29V7nA4fN736LYZKMp54bha+ND3RjQ0=;
 b=wgVtFM9KncNdIHcbcfgvB5Qw4/yrzrxL1zWYK4mxNhWJCBUqyVrUUU2XO7Aa1CyRKfphw0G9fac4jwt6zl+VWlS/dbGX2sfhdlQAPZLBSxjGGoDb1Dn/HpReNR627S+xalykZyiYEVKbDRObR9QyH/L9oVLh+03mqPVy5szWgK/LSBZJMZECyNKFXnWEp2TU1ET2/2fH33gmQlrayAq+VXJV61SNzQ9R3Yqed5QCQdZJpXgkxaArV5i52HYI16AALkxlg7GEorIlLZFrwoqbdkhonFBu/gp1XGPCAwnvL45gN5gbYEDkBJZmQ2pYOqWhxXYZBsnIUonQJ50MS4b2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNZekkNhpY/O29V7nA4fN736LYZKMp54bha+ND3RjQ0=;
 b=KHtZwxyVTNLoMtMUQICuaf475Ql3QiNOfrBokFKi8rXNlDf4n82wMYmfj29H3LsATCR1kAFiTUYD7TEka9Sw2rZ0zOVBlXn2RZ2K+Tg1thLyPjbf+O0mVP4a9t7zh8hbk3padz6N6Y8ePjMVf/fdyhxg7FWsIjmG/PwT7bnmnEs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB8PR08MB5339.eurprd08.prod.outlook.com
 (2603:10a6:10:114::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 10:13:07 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 10:13:06 +0000
Date: Tue, 24 Dec 2024 10:13:04 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nd@arm.com, suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH 1/1] coresight: prevent deactivate active config while
 enable the config
Message-ID: <Z2qJMGPD8x2npFaX@e129823.arm.com>
References: <20241218084833.609876-1-yeoreum.yun@arm.com>
 <0efe4ef1-30f5-47f8-b818-79b4cfa0891f@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0efe4ef1-30f5-47f8-b818-79b4cfa0891f@linaro.org>
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB8PR08MB5339:EE_|DB1PEPF000509F4:EE_|PAVPR08MB9601:EE_
X-MS-Office365-Filtering-Correlation-Id: 641d25af-e144-4002-8ba6-08dd240398ab
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?4RP7WWkWdMLaSQ45AN5hg/JbHj00eMXVWL8Qa+YDI3eAciW2Iv3FCVSLoejb?=
 =?us-ascii?Q?yo2BnOOD/run38mze/RJpvWfvaKAfCUQL84IBMC6EBUrUUnY9hZ6tWLh5ddM?=
 =?us-ascii?Q?5wGxReqiHya0Y2fUzjqxF7dZwqcS5+i+w8ciCOhjXgA8BV3Ve0G175gvGKBV?=
 =?us-ascii?Q?MvjLyJht2iRUw9g+qTlCNJcXGXaQuXhNCM3rdesQs1+At68a0nt9rWiPQ0+y?=
 =?us-ascii?Q?m/HRJMOsDVGh5Yd+aP+vgfgAgPDEZjgn/pgRMhwLbHzRfgn/Zrfue6ocUhCG?=
 =?us-ascii?Q?1TWP4CXAwK4pUwV4clKmTzjLdyBvutVk+AmxB2d9EnKtOEmv5OI1MWGXfpc5?=
 =?us-ascii?Q?fH+mC2KRvrGPYMREzuHAwzsUFL9yrLYmNE7ftBLje8Jt9nUCImKdVXgv3clL?=
 =?us-ascii?Q?ftcmNKIMEec+HHHnVNJjztNPjAWzB/nCAupevPgjKfsMs2zVGRtwWFuoGJ7Y?=
 =?us-ascii?Q?C+PMgRuLdwG5BjqVGwCYDUuKuiadZE1n2+OdgTs6ch+dBUomrUh7pIORXwoT?=
 =?us-ascii?Q?P60RXIabhXFkfYrr1N6Vuqv9txKmaYnI1hRLG036P+dm24psTUEWLPWleQO1?=
 =?us-ascii?Q?oEDunDohzK8CJ0PwwqKIHBTjbHqWY3+smmVlNhq4FplDL2Uk+W8ITQ/m3W7V?=
 =?us-ascii?Q?8l5yViMpgV0lqGSOXveBwX6jtRByl+FwA2o8QNNCBBD+NPQNP+HAA8zanwot?=
 =?us-ascii?Q?YMap548kkYQyBZPqkYpJbVzB53bYcll6iZQ8oL74jVJXdY0C1IHxz+dGkAcg?=
 =?us-ascii?Q?qQKTYvItKboARkNXxtuUwGOH5c2vQXTbNA4htY/JPxbrNiZHNrpT79XdxiEw?=
 =?us-ascii?Q?0CCyxm/jyuRIOrf3N0oNtiyGDp0nK4H3joQN8y1BxW0LxxH6bOMOoGnsMwrD?=
 =?us-ascii?Q?yLnc/BOWLmAcI32cPK5YS8kDGLoDselP2dTPVjl3sm9WQvOy+B7bCzEFFulX?=
 =?us-ascii?Q?aC0l70xpw1eb8JlDAk6YaRZb+RuNLRmuSS5fjy8VWCqvWvHxG+3oNSZEtYLs?=
 =?us-ascii?Q?5dw/lYBK3LkemdMt+c7bPNaa764Xy8tJzdgf9mD0v3purvQB4j470v96cf/s?=
 =?us-ascii?Q?8JwZb0kHHF2chScbv7hJLy+7OtXbKyud0AW/YsXhLMQwCvK+jhoQ9Fq4Z2Bj?=
 =?us-ascii?Q?SmJJfF6B4BW4UyasjTNN7MWhzvL4rLZVb3tKuG+E15gFmu/GGEL7mKwRoNc4?=
 =?us-ascii?Q?nKp7st525cn58fFWoD72kOy4/Sy83x+n6gQMYQlPE9LX7UNBRzWrlnF9BcpB?=
 =?us-ascii?Q?9GVQ2stI/Katpk3hm/B+hGvtjNOsgZXZdW4WZ5rDtO0f1xF9wJ9StC6Vu9ec?=
 =?us-ascii?Q?p9m1d6K245P/YzktZLTTqurId1fMup6FpYiFbyP+zAslwis9DZyovH+tFLhA?=
 =?us-ascii?Q?nVmK8G8f8gwzX+s+PHcHMsew85uT?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5339
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d254090a-8b1f-48ec-945d-08dd24038f4a
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|1800799024|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y+jadSy5XPbQOIUU9wcTqsJM+KuTc3IBpa5PVNgZgd0+JModub9wA9Uzu+Ew?=
 =?us-ascii?Q?hfvQLfa2VsBtZRFWqatGGI379t61+ehPbRsdxnmPhExcFYlTdr9HOImHzBU0?=
 =?us-ascii?Q?rVCrzzeEc1j8OMDx6w3FDvkDAzVhJuKNsS7+fjo6AxB7FsVdfn5hIXG5UFGx?=
 =?us-ascii?Q?+HXHoqI7MpFQdFGI3DmVyIfmvo6DHHwmwussePvSraZyshS6Ke75qh55PR9B?=
 =?us-ascii?Q?BAa4iT4v4TnGrTAJgCqva4F9t/vfqFiefq6601acGYCUycqpSGO4VL59TNCV?=
 =?us-ascii?Q?55LAyz3T65YyV8RhEj/xm8G/F3iOf6QFKL20hK6HAVgZJlo4t5vBDVGv71+S?=
 =?us-ascii?Q?lfl42r9uUacWFLrO4KkBukjC/noYuC+N+kXWsCMJ17YilCH+4o/6itcZP3XM?=
 =?us-ascii?Q?gbP5bXzRhUJoG2tlpDDQIxmU2IFpC0xVq8BhETNiR3L+gN4y0UCiBfcA7Iao?=
 =?us-ascii?Q?k5xWwFOP5QURalKqp2Zz8dRRNM+2UhrASyDSZ0/IaUxSCAi1UYDnoMyFjprY?=
 =?us-ascii?Q?eTKNmZVSdK1BmcBzb14PqJgypFwJb/VoBg8lbCNIzTXUiIL9NSY4ouHQrw+C?=
 =?us-ascii?Q?V9x7kKIYqXV6RMaxBxNzJsIpKZS+AHwKpttFIgBHcvNcFPaV2+S53ISrpFjO?=
 =?us-ascii?Q?CuNDDFB9TMEPM1IQm0foYWkU6KloaZxASZVdP9Vbpr42fsBC0uYyxEXZOE6i?=
 =?us-ascii?Q?T6L9rxXitGjYRH0RW8eEbCDx/JS2I/WVzZGErmDUC1F6MrqdXguFSNsl3usJ?=
 =?us-ascii?Q?EvUxuEZd1tnj4MAR4siF/ywbamPKHmjz/myqaKvRXUNBWw+STzvL2zEhIMt8?=
 =?us-ascii?Q?xrnJVechDk8IqeUe7iS/1qyuGi8dZ5x0nQe8iHVoDZLVsf4ZMg49Ar0rOGhr?=
 =?us-ascii?Q?96om/CHCsrBu3Rp2MpHzDV5aOaLlFt5e4fculFcpt07tickEUlAp/Y/W4evk?=
 =?us-ascii?Q?VJ66NJ8an9B2oeIfOkM7/UbBROSV+4QeRbdawaTm4LKmz0p5AyqPOkZq1qxp?=
 =?us-ascii?Q?fL0MFfKiQs4I0W5Q2SW4NAykhn2uRuriQk3a4Lkdr7Q7eHh4/r4u5bYKQD4S?=
 =?us-ascii?Q?qN2905MBpfSuxgXhxOBiy/OR3Iz6p5/Yl7cHjAM5e8uSvxtZxsEYIw1F26OF?=
 =?us-ascii?Q?10ZMikhQdSGSHB/25hXln/eZRBIbBOoxHYRgPRbOU68CHC793iMhlylvJnWQ?=
 =?us-ascii?Q?OVY2I3qg1WD5rBv5DGmErxAUAx8iAZDezEgdx6rzDaJAwXde6MM6ZybgpvEQ?=
 =?us-ascii?Q?cOHzgC2gGbmmJXFEqs3JHpZI0cF4HhSJ3W7gjipy+3q48MG7J6DK1WrFQs/q?=
 =?us-ascii?Q?4sZQrvCHvIJPyCILxN/dk3PyN4DNtzBL9bZCjDmmD5bZGPFnC+UNdkVshjLQ?=
 =?us-ascii?Q?XlBB/9o0AnEBQeASetWQ18MTzV1jbhAkO+FwT25P7Gt/gPKZkMel+Zm3oeJe?=
 =?us-ascii?Q?tke+DyR1FbrpEujgZHZVInpyhiva/1phmplrAC4zVv+a1amhE1tIxJcGf/VH?=
 =?us-ascii?Q?8L0/nfkJxynCFQE=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(376014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 10:13:22.0734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641d25af-e144-4002-8ba6-08dd240398ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_021331_692520_8AF1F503 
X-CRM114-Status: GOOD (  14.74  )
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

Hi James.
> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > index a70c1454b410..dfa7dcbaf25d 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
> >   			cscfg_mgr->sysfs_active_config = cfg_hash;
> >   	} else {
> >   		/* disable if matching current value */
> > -		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
> > +		if (cscfg_mgr->sysfs_active_config == cfg_hash &&
> > +		    !atomic_read(&cscfg_mgr->sys_enable_cnt)) {
> >   			_cscfg_deactivate_config(cfg_hash);
>
> So is sys_enable_cnt a global value? If a fix is needed doesn't it need to
> be a per-config refcount?
>
> Say you have two active configs, sys_enable_cnt is now 2, how do you disable
> one without it always skipping here when the other config is enabled?

Sorry to miss this one!.
Because when one configuration is enabled,
cscfg_mgr->sysfs_active_config becomes !NULL, so it wouldn't happen
there is no two activate configurations. so sys_enable_cnt wouldn't be
2.




