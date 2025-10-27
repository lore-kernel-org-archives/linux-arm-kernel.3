Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD3DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT2gDxHS6fmqJoAduEg6YNtTt9yzmeHx+Rkj58czpHI=; b=iGEq/0puqc7KNO5z12xQV5rYfQ
	5L1UgdTztIObzmK3dpzxns6jnvEaAjCCkJCLMzGGSEt+18SHAQYrVOeLPfSq9Xxif+6TNkY0Mi7So
	NnTUTFA4dVAOB8rJKb69omW+vl30ufpF687ViLmwU3YKu3N9NB0kqQwN2aszsNc9budh/5qaxBywU
	rl/vAhBNBpsopOoGj8JtUt0k9IllB+/UyaQejuE9sbAG+5jSHzxk2Yg+LTtMueTEAK7ET+Hytzwua
	Y5PMV3cwxOQJ8C4Xln1qm4uVrCrQBfpeDbFgDmI65zj2zs9hhoaU2jyNFmRM9ZYPcTt5PFTQQmqvN
	Z6wGdXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIuT-0000000DRpj-2hnS;
	Mon, 27 Oct 2025 08:49:01 +0000
Received: from mail-westeuropeazon11010053.outbound.protection.outlook.com ([52.101.69.53] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIuQ-0000000DRno-3rUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:49:00 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VCbt9w6i4IpXCheClfjXc1CAn7uYsUhvfCaf6ujFW3P/ex7dhWJ4KIGqVatozXzjksnjVhK3zYKfEY9oXcDdeW5J3d7uu33iY35ZPSmOoOKHG1U1SKz0JY2LjS5vMEfXOeylh9FGeNicZcCTHt+f9j5kzLaVPDEiwUms6P8bMOVvd+x2Vt4NONfs/RFlY5Bw8QMphY2eY92HyVGDePdq6kqmPCtkFu70tDUSXMhut6ueasK6ir0ihBLmFBnsIBzey6ViWU6laV8M1Glm3J3bkXTSezHFGfg9IRYyerEb81bL5CKxZ3Zk2NQemWZ8VNuuetClAzV4OQb+y85qNwFLrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT2gDxHS6fmqJoAduEg6YNtTt9yzmeHx+Rkj58czpHI=;
 b=Sqmmy/7kIcX4vbrj5COBoImVvjfheO7fJiHzr6tWLls2N29wMRozAJs9u89hadArrV361HvmOkK73iZNRgv9zyMd2YI+sp24K/aBCYXBbieiUh6mv9GNkaoulxblsL+gxejtA1V+F7xYv0JDodBehtDc0wKJNht8cFvVxJHBiWFTb7hZPvVqllJy0tjDMMcSlVi983NTSlzDWpyEE3PXjvmcB8xssuFNqH14OjE8gKO6waE5FcBbnpAlHLFFUhs5ifxVvDrrr5/K3iGpTPPlS0KkwGbdSMTAsNzUzeM6PKB4M9nFtsOAOCwuBklSJAnIbuEYK9JQngHP0TJXCd7OAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT2gDxHS6fmqJoAduEg6YNtTt9yzmeHx+Rkj58czpHI=;
 b=GS5TlBmNpCGMhtRBMjoKKc/8c2OWa9JfwOwnBVyM2WpG1qL15N81rVIDQAGtd6/h6QU9uZi8szZl6UnVNsRUUa1L2svGoUU9W0eCP+gPiR01WcfcOFgX4t5FIbWR0DBbVh3nlozeNU7yBwCtp6X4QFXptLYttFEn1Opvquv+7g8=
Received: from AS4P192CA0002.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::9)
 by PAWPR08MB11037.eurprd08.prod.outlook.com (2603:10a6:102:470::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:48:49 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::63) by AS4P192CA0002.outlook.office365.com
 (2603:10a6:20b:5da::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 08:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 08:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8RSi+Y6OkP6ixCbqY+13k0SqZ4iLJKaGVlISFSoWwfb566gqW+7REu9VQU9+5iC/4HKGNL8N9or64BE9uBDUSE7x+bzu5i7SrGG+3sZjt3eQxmN80kmXqFlXZR5CmqkuOIWjKzB2Ga5SgOuZ79Pr0Gmt0IWQ4/hiI0CUd3awr7eooOhz+hNw19puMOcBf+MLeJKuDhNUpdtpRHlAsWjbFYxWEuvlU8NVS/fgEpFJ1SWUaQRMUKcScO1LJySuiD107nAYxLlxlq6zM+zoYlzGerfveSFYibsvAeltamrL2y/vtE5Op7kE/L/Uxm0j0lB8ZaeYeObhdJM7R00YN6Nww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT2gDxHS6fmqJoAduEg6YNtTt9yzmeHx+Rkj58czpHI=;
 b=ZOciZN6k+sWpSDs181LDksA+kuWYeJbkA3gF3EuRvABZUo7i5+rxgiQ+EuQSan6RQ74oNA1ien9BjnkmfJXoLtDMpSYcW8WbLfgdBm6IO/EYNRCTf2A4M2VluUE6jPfX7P9Wyr5/cEURPjDydnrByPKeVRO9HYq3nzJp0Jat7bDTn9AN6I1VjDZWAUvCykb4+QI++wdjzOtewNhDuhEkTB5uxF5Sf0ytAoQs5XIjZhwPqagecB3EfgxmpdG8GSfLwR+zYO1/sVAm6VhKAq/VuvfQ7RdIBKb2MfnA4/KMOjFyFY9Y+f6Z+dBGcbJQR3KsBdNw6084H2eKnKJ5KYcSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT2gDxHS6fmqJoAduEg6YNtTt9yzmeHx+Rkj58czpHI=;
 b=GS5TlBmNpCGMhtRBMjoKKc/8c2OWa9JfwOwnBVyM2WpG1qL15N81rVIDQAGtd6/h6QU9uZi8szZl6UnVNsRUUa1L2svGoUU9W0eCP+gPiR01WcfcOFgX4t5FIbWR0DBbVh3nlozeNU7yBwCtp6X4QFXptLYttFEn1Opvquv+7g8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB7505.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:48:10 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:48:09 +0000
Date: Mon, 27 Oct 2025 08:48:06 +0000
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
Subject: Re: [PATCH v4 06/11] coresight: etm4x: Add context synchronization
 before enabling trace
Message-ID: <aP8xxoHQOQSJj2ik@e129823.arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-6-690e69ae6977@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-6-690e69ae6977@arm.com>
X-ClientProxiedBy: LO2P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::23) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS4PR08MB7505:EE_|AM4PEPF00027A62:EE_|PAWPR08MB11037:EE_
X-MS-Office365-Filtering-Correlation-Id: 081a99d6-e332-44ea-ac10-08de1535a5f5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Pbr/kMjrXFgbdstsIDcjO7y8PKFvyfVSQOZ38Bn13MI6IVKlRkKYRpwGwyVE?=
 =?us-ascii?Q?RBVOwY+K7xPOX+E9NpW/ioLLqkehHrZSSvBaapWk/x3oRozswj4ogkIyYub8?=
 =?us-ascii?Q?Vfr1KplkypAQzTxKL4d0MPvbyGDiR8R75SKhVTsjWPZCFrVqfJmU+wO7AJhz?=
 =?us-ascii?Q?9k11eOsUOL+0qs69HHr47oK31wYhO2a6qCPzYR2zkeaK1hgEfhtpHww9pBGh?=
 =?us-ascii?Q?X2rHBOGOrx0Aoh/ioQB5dOWYC2RsqNCmh7HpViLc+QWpivZ2MrhQfz/z9lb1?=
 =?us-ascii?Q?NwZUWv500Vj4/RO8DCzAxhgqiqCYak1gi15lN+4C7SVW92DDoMa49iuWOWtO?=
 =?us-ascii?Q?t+mg5uf8/KaLxVbYwHDDC7Ow7fgtlTijcgUzYCaqj0a/4aFnjg29Pho22jSf?=
 =?us-ascii?Q?b4ZBmGKQbMsgE2rSvbHWRgtpgpvENn+tGOsGJHiBPiqILnrbY84iniMC6eM2?=
 =?us-ascii?Q?W3EI8IFv4i7FxCP9pn8451maJ6Mp0g1SzP83X45pqxKn4bZQOFtTRRzlcyWB?=
 =?us-ascii?Q?gvaPRrj/BBtdDq+8t4Bfbk0klNtukPmQsQjnXoTboZoTKYXU9CBreI1Gebj2?=
 =?us-ascii?Q?hm1hHuW/gFat+u8PBw3SskkYPzXqNYg21zJHDaQW0oDwax7AXq5S85Z1XO6J?=
 =?us-ascii?Q?y3/5eTpZYPWp8Wgk5Py1gkp6voiDeRsptpX3W28oYF6O2tcNtIn9LMjSaHFk?=
 =?us-ascii?Q?VHsjKWWH9Z621yYJij4e+fHxm0vK6YDN7EN4OX0trI8QEI/3VCxrY6G/ckEL?=
 =?us-ascii?Q?yVjnBrNoYkFVnyHjYDfybGa4eMJmfHt0aqWTlJ/LH+qhpa5vL6sK+OMGV1Ur?=
 =?us-ascii?Q?8XkEgu6aCXcSodJ9NpcaHtjJfxxbUTL+XWOvhVynQx9eHfOvH5ucTsc6ySO0?=
 =?us-ascii?Q?+V7OLng5bl4cY41MqoEyx4NkXP9iIunEAYvTPjcPhphc7dnstbRApqUqzHcQ?=
 =?us-ascii?Q?8tFT6NbYVMYUwz1zPJN2Xn/4mnhud3Bi6sZiv//GzxuTqrmHNbOwUiw8/zq9?=
 =?us-ascii?Q?yUF8wAfQRzLOZ9LbPDEi2a6/2B9XJdipuh29/zhhv5Lg0cO1gGhf3Fwne/o+?=
 =?us-ascii?Q?Nhbr7OLqDg2cpPliQAzDIKYIf1ptt4oTKSUUD/zWRYKrosbm4aRvYfOODnzf?=
 =?us-ascii?Q?F3Sn0gFGdZ2dQHPd4ahZTx6LHkmEBhQvks8N4CLcYRMjSwNAmf3aSBO/0FKM?=
 =?us-ascii?Q?ieA+9ey9hPQJr6gWJI47wreJ2oiulHQGdGb4+QG2HDG2PUfzwowBqYDUDsW6?=
 =?us-ascii?Q?gXiUesLG9NpewHwgucWhfdJFv/bFyOdqsQjflQXF7DAd7pRlsxRnurn28M+N?=
 =?us-ascii?Q?UM0qu1dM7D+j7H3XVlAEopbCRJnhfTqDQyi6K06gIudgOuDx1U2YIZONfKTv?=
 =?us-ascii?Q?SyJdb99tlUM55HjLNInjdijwnlCBm/Ss1y4w5joRSl07Wj6BD6SyPrqYjOaP?=
 =?us-ascii?Q?JRSMc4P1e7JGG6SepxzbzcfoBztDF1lm?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: de55bd56-956f-40d6-eae3-08de15358e02
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QmX/r2OgJJzKzZ5HYezAVaStE/Q8n2DtAs+w52gqUSadeRLfCihhyT//Pp8/?=
 =?us-ascii?Q?Uze33QxEXQBXldSMA3IMrsBam0zCKaGn7tEmBbHureAMhvA0E2ZsfqqgkE53?=
 =?us-ascii?Q?xvJWKaBMxxYnVxIBqxMp8sLBQx1UrcpHvoEdUREGcNWmtWDfPmtNUHVckjNe?=
 =?us-ascii?Q?9PfY5zNYotYw+0efEHDWf7HbcpnhFCIstMMGLbNcKpnwTIHSefK7w/4s6mYT?=
 =?us-ascii?Q?7+CryROTuRvuVOgBXAmDD/yHUTyOBgq8RU1+HaYoV5bDhsvWzHRY+9J5qMk8?=
 =?us-ascii?Q?aJJXrvKVq1G5zFfJQov4W2ft2iKzmiICdkMI742TVy+K8Mvj/fE6WFu+R3QE?=
 =?us-ascii?Q?l3QdDQKptkzqORxIRGtRW7oHEMk9qVReAg3Ho4dF0e+xJklAdKRGbVBefV87?=
 =?us-ascii?Q?qQYVIKAVtwXnRttfFiSnj3fS971lKMo57FqgCUVfMY8Zmc+1+L+tmAL7gTOw?=
 =?us-ascii?Q?ZKNYN7GE4kZNif1DMb7DgvGTFPRyScKCOLBP73HdW478kwojapEjYVGvrDEI?=
 =?us-ascii?Q?joETYPqdfeTj9c8mynJ0zvQU6JEFGm14I1XJjDtSKk9TQ/iVWE86U774aQju?=
 =?us-ascii?Q?9/nz2au7Eu9eefwPDo6v/TQUrG5t9ydwNKkj3tmvttj7uwAxL/3wc8MGJOKP?=
 =?us-ascii?Q?tyU/1JI5pNH+8LrKChEjuO2qO5kJdVedEsOyN1nyAoYvHsOheyNeQz+fvRZz?=
 =?us-ascii?Q?j9iQCbQ7c6KKU3tYabPqmiUGLXjKbbQ/KhmjlWWV6n7TtJn+CCdGVKkhQvom?=
 =?us-ascii?Q?v9AAi89KAe55UrRgqs7UOrnvESXl36Fba+vNNBFUxNJMYYaNKvhfoxD59+UG?=
 =?us-ascii?Q?mS7Bhm9Eg6JKjovmSjeNGraAxoZeBa24cB2pfs4Q2raIHQFKYRPDjYXcvmJK?=
 =?us-ascii?Q?ZoE8vpMwT7z/niEdY/2Ylcwu49aszKj51OLPxzjZdAGXd3euxPptu3SsGcXh?=
 =?us-ascii?Q?nT9qip3Trtel8TVulYAawboeIUTHw1x8lc/2vRz5vZZBPJapudCdU/L6DX02?=
 =?us-ascii?Q?9lurAmoGp4WPezkGPhFDF+BxC4BYIu0E5GEZib6zdGcIIcg2pWGPuqMukn0o?=
 =?us-ascii?Q?EVyN6C7IxnX+ffRkA//IHu0PeJ66cLhfbNXv2K7UDwmM5SjEmBi2frx3CYcB?=
 =?us-ascii?Q?fbTNVb2j5MaK17zV1IxMnba6oYrmWJIyqlnhYMgCSyZQLszW3zpkiIOzCwqH?=
 =?us-ascii?Q?ol9YKddTZStQRdg4XedYkPLlCgGB6FRi5FIP/GZwjPzvf5I7VmG4Jn9hTTJU?=
 =?us-ascii?Q?WN/48/iMC6UAOx75VhjII0FkvvZ8LSoeyGzjZwYkliqVThKVeSlPW/AWblvj?=
 =?us-ascii?Q?nUG4EsVIUkRw7XpARt8RnYOAhJcySYxJluTBNkAEh5NJhuh5T1uCrlrShYDW?=
 =?us-ascii?Q?xpfrXBzBMDT8/BVG7ivKKHVYvmyNS0ZF0rxKg5ah2GPteOU15qPs057puhrP?=
 =?us-ascii?Q?hVq1O46H/VVAz8sYOC20AVjIchM5KTfyFQ9aZsnIuKv8RdOSJrU7iRNdGLSJ?=
 =?us-ascii?Q?aghD6jAea54WZw4+AH6bWr4DnzXXe3acI10+EHtePhXSAX3RKk4NfzFQ93RO?=
 =?us-ascii?Q?ezSEaKNAeEEf7HgwDEs=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(35042699022)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:48:49.4045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081a99d6-e332-44ea-ac10-08de1535a5f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014859_049874_6F72C80D 
X-CRM114-Status: GOOD (  23.20  )
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

Reviewed-by: Yeoreun Yun <yeoreum.yun@arm.com>
> According to the software usage PKLXF in Arm ARM (ARM DDI 0487 L.a), a
> Context synchronization event is required before enabling the trace
> unit. An ISB is added to meet this requirement.
>
> Improved the barrier comments to provide more accurate information by
> specifying which section of the document the requirement comes from and
> clarifying its intended purpose.
>
> Fixes: 1ab3bb9df5e3 ("coresight: etm4x: Add necessary synchronization for sysreg access")
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 +++++++++++++++++++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 45bf76901650641d45a0d85965651667a8762b8c..7eb30e85bf03d1eda8212faa3c831338b70f86c3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -446,13 +446,37 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>  		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
>
>  	etm4x_allow_trace(drvdata);
> +
> +	/*
> +	 * According to software usage PKLXF in Arm ARM (ARM DDI 0487 L.a),
> +	 * execute a Context synchronization event to guarantee the trace unit
> +	 * will observe the new values of the System registers.
> +	 */
> +	if (!csa->io_mem)
> +		isb();
> +
>  	/* Enable the trace unit */
>  	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
>
> -	/* Synchronize the register updates for sysreg access */
> +	/*
> +	 * As recommended by section 4.3.7 ("Synchronization when using system
> +	 * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> +	 * self-hosted trace analyzer must perform a Context synchronization
> +	 * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> +	 */
>  	if (!csa->io_mem)
>  		isb();
>
> +	/*
> +	 * For the memory-mapped interface, the registers are mapped as Device
> +	 * type (Device-nGnRE). As described in section 4.3.7 ("Synchronization
> +	 * of register updates") of ARM IHI0064H.b, read back the value of any
> +	 * register in the trace unit to ensure writes have completed.
> +	 *
> +	 * Therefore, polling on TRCSTATR ensures that the writing TRCPRGCTLR
> +	 * is complete.
> +	 */
> +
>  	/* wait for TRCSTATR.IDLE to go back down to '0' */
>  	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0)) {
>  		dev_err(etm_dev,
> @@ -931,11 +955,16 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>  	 */
>  	etm4x_prohibit_trace(drvdata);
>  	/*
> -	 * Make sure everything completes before disabling, as recommended
> -	 * by section 7.3.77 ("TRCVICTLR, ViewInst Main Control Register,
> -	 * SSTATUS") of ARM IHI 0064D
> +	 * Prevent being speculative at the point of disabling the trace unit,
> +	 * as recommended by section 7.3.77 ("TRCVICTLR, ViewInst Main Control
> +	 * Register, SSTATUS") of ARM IHI 0064D
>  	 */
>  	dsb(sy);
> +	/*
> +	 * According to software usage VKHHY in Arm ARM (ARM DDI 0487 L.a),
> +	 * execute a Context synchronization event to guarantee no new
> +	 * program-flow trace is generated.
> +	 */
>  	isb();
>  	/* Trace synchronization barrier, is a nop if not supported */
>  	tsb_csync();
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun

