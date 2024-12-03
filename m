Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73210E64AB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VNFYVSgVDd9mjyatkakVUcOtEEpmLIjDEcLk1xbAyI=; b=Cn2nkZbgi3kt+Dy+J/8ZOKYZJH
	VdlaQOkzfV3i3N+ljZ2ZlLAWkZEwByLv+ExnIA4N4PJt+UOlDLIZ00it+PShTS3hTJXboIv+xeFo1
	knaX2SRjfsk3HanMC71Qe/cwweRFLa1t78anlp+P6QpHFnnFcKhpgVkPqxJuadJXpaZMZqQCkjbv5
	u/We2nFnoCSatP6Qp/a4naZFYDliz3aTTfsiWzgMOmOg6E8OKdRofJqj2HE8jssl9BhI3rGVzRdwq
	k5u9IH9Y09zR74VHj8mfibMRb5+nKZ5E6P0Ia9i3Oi+K7p9/0RVH2rZd/0LIrfLZkxoOdqn0Qd7ou
	2UlajWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITcQ-00000009jif-1QzK;
	Tue, 03 Dec 2024 14:11:14 +0000
Received: from mail-am6eur05on20600.outbound.protection.outlook.com ([2a01:111:f403:2612::600] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITbP-00000009jcN-43TK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:10:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=V5SQx3B0m+WDpzydZlmiOhiVHrjb4PhiAZCQoWgQnxCG1kYQ0rKBsVqY0HIskQCU0+N7WhdCro8979eEJst39P+ElWNinwP9PxfmZI7AvwzP+LOXfovNgwNK7QXJ2qSoOwlczZ/2wqKS/NjQZn6fp6eg3eDx5PFUo0489/xm7WelSP1G/jBngUIwV/dRAtz9pmhdU6E2C+a51bfmN4IfSuM59WmWygk98YO89PbhKNxQu4JhS0N/auJHhiwc7jBC+2YLUzlG5FCiyO5AWA5fHYPFLHJxE5Qb/tHLM92E7lORiU7YcGhyzl5GGSvGvgv42qT7q0BLyhz0CFwPNCj3xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VNFYVSgVDd9mjyatkakVUcOtEEpmLIjDEcLk1xbAyI=;
 b=zKwcuLyt6zK2DKed2PC6DduqJn6u0w+hdlRLgWAx/FqESsAkZ9vzMTARFW/x1NSJtkVDP+liYSiUdoX9rhSpHCE8KEVJZR2fKxJZSbvjgz7trFN5OdN13r+R3Htz5uBoPRk6uEdARH9yUPaf9R7GlkGyKrLVtI5BdNkWxdeyIIDBl9xT7N/I5YsClObLVXMfvzNQ86g/r5n1A8CS0OBI3uqZAsaTqOJSetxQ9X5GfFyKkNAgNaqldm8sDpoMVY54nC22SbgKWxbBznnMPKNj3h4SowCdoryDLjAKy+NUxQ06Bgfj1fE1Sfo5HOSWwNMd3NrI/LcY1O4lMOSqM96Srw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VNFYVSgVDd9mjyatkakVUcOtEEpmLIjDEcLk1xbAyI=;
 b=cHbpvNj5NUwmiGOV8mvLsV72TZwyrLRy42F8aJg4+0xvakTHyA+vXNA4QYees3tn6TjKj03Wqc2tS++okP6anh68U0HEi5bExQ7CMtdH8bW7IAgXEZ1cFS78xQmrrANVY5Jkqp5n0W+qgC8k39dOm+6q1OYl9c0oVKcrrDWNkto=
Received: from DUZP191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::10)
 by DU4PR08MB11152.eurprd08.prod.outlook.com (2603:10a6:10:570::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 14:10:02 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::43) by DUZP191CA0013.outlook.office365.com
 (2603:10a6:10:4f9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 14:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 14:10:01 +0000
Received: ("Tessian outbound 033f0ff3ba29:v514"); Tue, 03 Dec 2024 14:10:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 850ecd7c49e837b7
X-TessianGatewayMetadata: glV0GJuaiET8eOfiKbcmOmHTyZ7MCrfK4EzltL7E04zYjcdmNepZD7+dFU5IkXmYEf2ozFjcbtKVzL2pgxSwTGKccw/2I/YTcOvwRu+/C1yv1b85W0d72fJqV7YPiMgAueYQ90xwd815b7raJhDCfQ==
X-CR-MTA-TID: 64aa7808
Received: from Lb19954a1a342.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6A15091A-ED84-46F5-8FBB-74B632EEEA85.1;
	Tue, 03 Dec 2024 14:09:55 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb19954a1a342.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 03 Dec 2024 14:09:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj9pPhLchHR+ewR6XI71vMN/4FJ771PDs5PvFpNxtvfli0j3Vn2i2P7st8tVODZdTHCYxVUOYU18z1RYaiQdxrKHPofnf1mIgl1NLEY0GunZpeFuNUMWaogKmaqx01WJkDaVa3gRBFel2uW6NQ++RMggd7ADCe9o0D6IhpPxFA9WL8KhkVBKLUChrr7npOTpOILuY7Wszv71Y7MNqYhAheLlVOVcnfAbuC9WyjxKS+EBk9NyXIpJBkSEG24b722WNvOzAgVgHGTr3RJ4p9MZWAVPNKsFxAkCJyF85SHfvXQPHsU00gRES740wPyUqxlIBncVKpgP9lRxh+bzVHbGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VNFYVSgVDd9mjyatkakVUcOtEEpmLIjDEcLk1xbAyI=;
 b=GdQ3ixZM0VkbM7aOMlY9bQguLw4uliRnMehKUKueQ6J2FK3Q1Qik1LxGjg4tjn+J9VQvvPsP/VPCTcNs58a4zFIVNMU8LGq/tNixQFO0OIV1npL/lbyico3firXnmr4LoM2BvchPbdXQXmHnFxch+bU+1qubfscrAtqUfKCsIOxnF8YUhcUImzj8GC++k953WZD9j0RTWMtuCqbnzactd6xlITX5teJ9xp18pTx3lvxGkV+iTEiYlBOZrTUNxeQwyV1jHI1pErrY4k7PGd5dvYJU0TWxJugGGrsNgTEcpi5/24L1UXTLX6VqhObELIcxCMMZLI2mPcUtwj4faltEsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VNFYVSgVDd9mjyatkakVUcOtEEpmLIjDEcLk1xbAyI=;
 b=cHbpvNj5NUwmiGOV8mvLsV72TZwyrLRy42F8aJg4+0xvakTHyA+vXNA4QYees3tn6TjKj03Wqc2tS++okP6anh68U0HEi5bExQ7CMtdH8bW7IAgXEZ1cFS78xQmrrANVY5Jkqp5n0W+qgC8k39dOm+6q1OYl9c0oVKcrrDWNkto=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB9020.eurprd08.prod.outlook.com
 (2603:10a6:20b:5c0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 14:09:50 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 14:09:49 +0000
Date: Tue, 3 Dec 2024 14:09:47 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] firmware/arm_ffa: change ffa_device_register()'s
 parameters and return
Message-ID: <Z08RK7JWG6ko1yvt@e129823.arm.com>
References: <20241125095251.366866-1-yeoreum.yun@arm.com>
 <20241125095251.366866-2-yeoreum.yun@arm.com>
 <Z072CGn6fhnT0hED@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z072CGn6fhnT0hED@bogus>
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS8PR08MB9020:EE_|DU2PEPF00028D12:EE_|DU4PR08MB11152:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d09548-c890-4a76-8e81-08dd13a42dc3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?J1w0WMi17KLa6igI+eLTajVjek0e5SZfadDQrOEdlkG67Ab+5000JwBifVF/?=
 =?us-ascii?Q?5tYF+bE4ZTqJu5hhYxQgSILavekhlgh4SauiCuIMgVImUovK/kfokipxZeDt?=
 =?us-ascii?Q?giDYoX8zt1zhqsr3opg99AKFgq8yXcYGSS9q5TfcJZJQZwy38PCIMl8e/VYc?=
 =?us-ascii?Q?vDMU/m+bnWvCfiAhgkag7JkbGTXZSpjXfZwSit8hfs3lOyfxJ332iDdXYSsd?=
 =?us-ascii?Q?h/z/OHzpMaDPd06A6y1aOMJIkjAr6ZAVkLPvW/LbMvG4Azyeoap+pYH+geLy?=
 =?us-ascii?Q?/aLqcQT37oEVQD4KYW9WgrRvuY9cjPxix4AFwC/jJi5QuZCt3msOPgUesKnj?=
 =?us-ascii?Q?NMwgAJD2l9KJS72+1x52ylWlwEv4c0wLplLqhmEw5ERJLsd1hIudVKk8GfUS?=
 =?us-ascii?Q?Jc3/wQgHqKWKFzfIJt5yzhl1F8rcZgLuxjV1/0fQs7BCx2lVa71NN+AJPy9u?=
 =?us-ascii?Q?QJ/d1c+nvSyLR444TIzYDLuzjNUh/+5k1i+7lzoF79o2JMRlvH/vEun5f2kP?=
 =?us-ascii?Q?1uq81lEknhyxJmFdQ4OCsjgUwuHtN5XGMZRZK6UyJ1thpaYGMq69wlQzpp87?=
 =?us-ascii?Q?eF0237u57RmOD+dxF5NyplzVmFwFQzBpbVFPZZb7A8+/csHCv8HJsktdEZu/?=
 =?us-ascii?Q?a1G42rXQonaOwpIxgLax//2rtKsGZXfuy2P1IhRPqEQdcEvLEQ4D5IARUKsg?=
 =?us-ascii?Q?N1+8PFGAU8IW8Ebk5VQgOetLcBv5A2MZLr1kRdHAZ4RbtwgUV2qhVC0WKlbJ?=
 =?us-ascii?Q?LHGDYCkFfz/MrajfyhylPwH+iguXRQ72eJJPLWQRsqGFx40D5TozQ5RTXZwB?=
 =?us-ascii?Q?B70f4K/PzWKU1W7vOO4HQn9w9SBI5G8q9O+4bobx1zb/21k4qEn1CqBMHT5y?=
 =?us-ascii?Q?bs1Xcd3r9DAG04sHx3ee05wwuuEfLPXHESJbp+NauTHPcdCsAPNlII2YXxnx?=
 =?us-ascii?Q?pZa+uOGFLNYdOGYJu6IeM6Q5JeK1CJYDhoGU56srgTVnbhshglTnaisFMt+p?=
 =?us-ascii?Q?uexmdeJNJoPf1ibee75iOZ5BPleNb79K+fVgBWcokBrn0SqcHjFx9i5+qKPc?=
 =?us-ascii?Q?mEdMHgbbV8TqPjfPC1OiHIaipjhuFjC2jEE9OaMntjJYS2uThP76VkQlKTCP?=
 =?us-ascii?Q?ZApykxRAuFN5QaUgTBJq5dMkVSfdJBXubsxX+pYRrjEVbR20VXd2IZFsteO9?=
 =?us-ascii?Q?451swTaiLCxDF+pm3hX2xLJRhjT/vPgB1dsdbjbrDYOHuw3ZpdHl21vcBDlj?=
 =?us-ascii?Q?+tIa0HIkg8fzl6PMB37ObbAltOIPTsmWWUKuevsjI+mn0FL/KLHVD8UMuKPP?=
 =?us-ascii?Q?G6ytso0VUQWIxXKvf1g7FzC47ziDkIEVh8YYT4TIbUjh7g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9020
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 39baef3e-5b32-41b6-9737-08dd13a42675
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|14060799003|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hp0qSle4Se7OJJdJqrzSSAvU3FyrVAkq4rNn6T45FIfmF+0d9jecV1iU+b2V?=
 =?us-ascii?Q?xm0RlWBd7M3ezfewwIeyuo031w9fp5txSsgNj1GJIjzpP+vkV0+yCE5IeL9v?=
 =?us-ascii?Q?G0mtTFqbA9WwSjTMX/jb5qynu7HSpQYVpTgjpk1caTs++eMKFt1QKi0MEciR?=
 =?us-ascii?Q?wrEVaZSVkt4BWPTn+6mlassaqSUEz/stfn7g6/1B/6ZgGWVXjjLZYFy75Ly4?=
 =?us-ascii?Q?9VheJgDlbZzuIwS7aiZ19My4IHudl3/vYnZ1jCfNKJub5sOchGtSyMs+Hvuy?=
 =?us-ascii?Q?jMWPH1M6FFYFhomxMjbYyBBTe9yebJTv+Zz5gPQsQC4dNpoY095JWEMCQ2OH?=
 =?us-ascii?Q?UNyAx8gPyckLQoEF4oXFH9pr2+ULbVQLol12XTJ/xHoz5zeKtwmS6NaIluy/?=
 =?us-ascii?Q?se7LAhYcWuA4r7KAExhxqGkEwaJ2cQNDjZDK4g3V4m6COeDiJLohUi810p8F?=
 =?us-ascii?Q?jAlIzzXacPovO7KMRg8uFhMAXqhPYPlcKaHoCbvWnSwmRGlTDviS8YT5xCoF?=
 =?us-ascii?Q?xJyWFGsa96Cc4tNnA8ru4OM+gcFeSumGZqIQ1QLISodo2pxqb9lg1bM9q14m?=
 =?us-ascii?Q?vLg8/BrkWp+rJQDLr2+NBAp3jTpTPMC6iP8A0zElwqmkLo4QLfPd33CGRPFs?=
 =?us-ascii?Q?pcKyNdJJJgvx2/lmWj3XuzNb3dhOznC0i+KZNefh8dZOpYj2h4ilfFA07szE?=
 =?us-ascii?Q?XlN1iHQe8XGKx5nj8wRw8Pw2oYVMkuyH7zXkGCbdWwOVBsSr4MU+LaYld/FN?=
 =?us-ascii?Q?OwHGhvw1RIKGXYcGe+TtXun+puLEYLlbvqbyhywAYLQGrFuqGO3cnqalTyK+?=
 =?us-ascii?Q?+jUI1P57NlL8VVgMNvIeEVVxJUFfsbOXl4ObD+HAqKpD/giQcRItleyLLvB3?=
 =?us-ascii?Q?KxNW2uW2JD88s+53JSiP02ipYhRPqdUzMZ6jjbVAwy6JjAl00tjNfzrzxmj8?=
 =?us-ascii?Q?XGT6kj64G/lB2kq8iSDzM+1IZHZqq/pxPesHA4nkSW+BLz2tbHCIBEeBhE/2?=
 =?us-ascii?Q?Q9Jf2+Dy8GZKWR7Z8EY/JsQayj0OqKq5HnQjKAcgmsBtH81cwM7MZemE3Jqx?=
 =?us-ascii?Q?BqZfdGG82r8tQo1F8p2av77RCg+LDOrZIXXUlXw5kIQX13Jc6pzp+m+Ifexv?=
 =?us-ascii?Q?a+ojrSRl6iJSvJB2PDdTz6uS4pQ+kWfR0bLPKxRB5uV4JRRjC2GEG/Uu+nKV?=
 =?us-ascii?Q?SXFQWp/Vj0DcQVbqNvUaZiVvCwxaF1nkkKU/Z1JH+8l7doTQJjrqTcG7G1bR?=
 =?us-ascii?Q?BTqrA8BU5b6ZDjNoyXaxQIDk9nRx/OJS2guWM9D7D+CJIdcni6wFPsM0h4h1?=
 =?us-ascii?Q?BitNz/yoKB1lctfQFTj2C/Il8slMdY86ndlL8Soqafm5ZY4yaMkZ0GmitvR+?=
 =?us-ascii?Q?R5G/r1X4gyVNJj1GJpOSDv6OSChyVd1WACJnjbFBq4eFgDOtXbaKxw41uwHH?=
 =?us-ascii?Q?fS13YKhXIXEdxFGoJCLvCaoDRZZC0jx1?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 14:10:01.9364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d09548-c890-4a76-8e81-08dd13a42dc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_061012_206949_A648967C 
X-CRM114-Status: GOOD (  20.96  )
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

Hi Sudeep.

> >  	ffa_dev = kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
> >  	if (!ffa_dev) {
> >  		ida_free(&ffa_bus_id, id);
> > -		return NULL;
> > +		return ERR_PTR(-ENOMEM);
>
> I am not keen on changing the error from NULL here. -ENOMEM has its own
> logging. ida_alloc failing is very unlikely unless you have so many
> partitions in the system.
>

Okay I'll restore.

> >  	}
> >
> >  	dev = &ffa_dev->dev;
> > @@ -210,16 +216,18 @@ struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
> >  	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
> >
> >  	ffa_dev->id = id;
> > -	ffa_dev->vm_id = vm_id;
> > +	ffa_dev->vm_id = part_info->id;
> > +	ffa_dev->properties = part_info->properties;
> >  	ffa_dev->ops = ops;
> > -	uuid_copy(&ffa_dev->uuid, uuid);
> > +	import_uuid(&uuid, (u8 *)part_info->uuid);
> > +	uuid_copy(&ffa_dev->uuid, &uuid);
> >
> >  	ret = device_register(&ffa_dev->dev);
> >  	if (ret) {
> >  		dev_err(dev, "unable to register device %s err=%d\n",
> >  			dev_name(dev), ret);
>
> This error log will give the information you are adding in driver.c, so
> it is again not needed to change that.
>
> >  		put_device(dev);
> > -		return NULL;
> > +		return ERR_PTR(ret);
> >  	}
> >
> >  	return ffa_dev;
> > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > index b14cbdae94e8..a3a9cdec7389 100644
> > --- a/drivers/firmware/arm_ffa/driver.c
> > +++ b/drivers/firmware/arm_ffa/driver.c
> > @@ -1406,23 +1406,19 @@ static int ffa_setup_partitions(void)
> >
> >  	xa_init(&drv_info->partition_info);
> >  	for (idx = 0, tpbuf = pbuf; idx < count; idx++, tpbuf++) {
> > -		import_uuid(&uuid, (u8 *)tpbuf->uuid);
> > -
> >  		/* Note that if the UUID will be uuid_null, that will require
> >  		 * ffa_bus_notifier() to find the UUID of this partition id
> >  		 * with help of ffa_device_match_uuid(). FF-A v1.1 and above
> >  		 * provides UUID here for each partition as part of the
> >  		 * discovery API and the same is passed.
> >  		 */
> > -		ffa_dev = ffa_device_register(&uuid, tpbuf->id, &ffa_drv_ops);
> > -		if (!ffa_dev) {
> > -			pr_err("%s: failed to register partition ID 0x%x\n",
> > -			       __func__, tpbuf->id);
> > +		ffa_dev = ffa_device_register(tpbuf, &ffa_drv_ops);
> > +		if (IS_ERR_OR_NULL(ffa_dev)) {
> > +			pr_err("%s: failed to register partition ID 0x%x, error %ld\n",
> > +			       __func__, tpbuf->id, PTR_ERR(ffa_dev));
>
> Drop this additional error info you are adding as bus.c will provide it.

Okay. Thanks!

