Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6FCCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 02:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylTcisnamqVDiXOTck8+M/9vQSIsvrcc+9hAhb+ikk8=; b=k1aXfDfuxOk/Ho0FJ+o3V5uxPc
	eFPmL5zJJhgcp7hT/HEbhj2b6LX6sbbwAGD50qFYZLGMequpi3Rf7QhnV+7RS5q1fE+KnkwNZPD0F
	eVfMn+Ut4aQTCpRLKVPxbc++7npGtXS4+vradSyy40W2N4kZwzOPL43gAhHtXFMes5lWkMJoeRZcu
	m5DimDsG8UnAgVLMIHuDqdYFOVjK6+ZDZNEG7I9VsBne7LZ8nEfTAv/5zG50GFxVOGVjhC4qkyW+I
	JivoRHZy8h5TspajvyjJLYfTS6Ix3pFJNVKCtSvXP5WCeJ75xaw2/oY/7Gzo0VOeoDo4qpwmwhInJ
	HK1BzBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sRk-0000000C60e-2OeC;
	Tue, 23 Sep 2025 02:08:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sRj-0000000C5yf-0QWM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Sep 2025 02:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ylTcisnamqVDiXOTck8+M/9vQSIsvrcc+9hAhb+ikk8=; b=EjXr/tpGFqxpi8A1SiwHABZrQr
	eieeRLi0p8moFAJGqhJKv54+ddZspcXS3/hp/9EP6dRG6QNVK3kSu6u3t9vvv+l0wsfkdNpLzPP1P
	ciSNTgT4i5E4ywoY606z3IApJziEOrjSlxJCxDiLUGxujm247Y7bYbMbxC7Vraq5zNXpTOFvCYtZW
	31kaC9IvKoi9kbtOzPFHCoGdkGZegX4rVOwLHmMVKkYPFN4wiHhokxbZ8avB/EMFodX4r5iX/1B31
	9ZeaCAU27mvwGR9mxe5N2FJShdywDdYQDdtR4ANUl7ZfWTFTPNfE9t53NBEqxTtbGuBivlf9uIYgE
	zrzYT3Fw==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sRf-00000008RT0-1NAy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 02:07:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWs+h3VKi+m4azgDlUThWNFuJSg9YTg88v4tJYNVoC/zvKDcfWqizX82elbTk0fMlOiyv7WZcXhWioygzktnV8HdnjAgHDyg8JKJDqawsnfDQz7qt9yCn1A8xkBbypjW1nFsxubCEvENMqxSw2rDo/XmO9nRt9CsMCl3ym8A8fQK4AlZCgybhmcvkBoRKCWT/DQ4spiRvA84Xspz4SAf3rzRuvBVVqTgN1nLvPoZEopaKY3kZDFEefwo0UbP4OMsXezVjfzTbNiz8EHk+IfG22QFfFlDCuLbeYWZRBlJeWnLqhUYsSLp5ST4k+WGL3XQlqebTIc/xR4SI2W5pzRPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylTcisnamqVDiXOTck8+M/9vQSIsvrcc+9hAhb+ikk8=;
 b=FoKiVvKjcMyeBi6zSOxLHaAdUkXIfMNN//2sqCOVNPb6q7eSeI5+ZDmXJ0lqAt/w+YlA2rlwQ1sD7ZjvTGfpat1XIvnPUo69gpLrp+jCoFVi0se03/i1+ftFAIshNYnbHLGBps/26rtFR98tfAszDXLDksEkocKvqnlmTi95ydF5zH3QucJAV1wHAiwRwDy+Ce+u4Xv2E1wBmgvLqurja0cScs+4RkKwGSV95CK/yfDRMdJgnFHWC+Sev/DhFYAO4t06FGL/Qp85DVPCAQ1eK7KiWsinhtOgsLMlJ3oU+h53xhYz/r/FXJlntm8cpf14RkClhKWUNLS9LEYeBOYBfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylTcisnamqVDiXOTck8+M/9vQSIsvrcc+9hAhb+ikk8=;
 b=laI5cSOWKghAaAJ6F2vlNhpW4zjn4HFBGigauHztoO7bi1RIUujCOMn/lmrgYBo/pa4BVdwTSwzbNrR8Me1GeNFBAXoaITkWUIDMOUfS6BdaHM9bNw/eq9s/GiBCeLHNL3HswsdZlinLiXtMyNLRAF1yrT3VEC56z8RKO4PljlaKAl0Jrc5mLnuteRZJn6yL4oiMwHZde5Zg0+EMtCkoV7vA4SrXbmYJYDyJctUsDt/4Sv9/dhsotQFO3VxzjHZNorc2IYoF3H1TNUXu9+Luv1pr5WfQW98ePQx+BE05Zu9rCf31GRblEx29tIs+R2Qzh84Z+ZFtHjsHXjQN8y40NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:50 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:08:01 +0800
Subject: [PATCH v2 11/14] drm/imx: dc-ed: Drop initial source selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-11-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: de8a23f1-fb26-4b7b-2718-08ddfa45ff3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDRmL2hCaFRLZ3VNZUpqcUlmMlpwTlFzajh6QjdMT2dWNmdNRWFONERBa2Vx?=
 =?utf-8?B?MFBpTklGTjZrT3dteWxNa085MGJSSFFFbzR2bzhCNTltOGF6Y1NVODNDTGxo?=
 =?utf-8?B?QnhLbi9VTWFYYW9qYmptM0dpNFRoODlIbzlmNVpaS3dQdGlCaCtuV3lsb0ZP?=
 =?utf-8?B?czU3dFRHeVVEdmRzSmFTY3E0a29sbldvTWpyQ01jR3UwR1N3bzRwdlhqbjZR?=
 =?utf-8?B?cHlLUHBKTDlSSEw5Tjl0WFo2eXRRdytQd2xYZ1FQSjAwRmNMOHpPNXNxa2pX?=
 =?utf-8?B?dzhXejBadEU0dzNndnFxVkRVUHJQRjgxV1EyaTA5cW5oMmFHODJqNTRBUkMz?=
 =?utf-8?B?TmNlNmhYaHFvK2VmT2k1K3lFcHdOQzVEczJvQXJhdWNmY3AyL3hNY3RFL2FG?=
 =?utf-8?B?L3REZFRDM29LTmE0dkZseG9PSHEzbFMyUHlyUjdZeitzWFFiT1NJTWx4RHRm?=
 =?utf-8?B?R0tURU1Wdm1VZjFZRnBYTWtIVDZkcDdnSkpHdHdDeGZDN3FURGRUQ0NlMDBF?=
 =?utf-8?B?QVFsZlJ4QTVzTUg3d2pyelMxNGdVVVRGTER2RDZjeXlWVFpGeWlBUiswRHli?=
 =?utf-8?B?Q2ZFdE8rbVNWdklmRDJXZkRkNEQ0MVZxWDZMdGFDWGh4NllFU2RYZmdhYW40?=
 =?utf-8?B?WkozeG5NelAwd3E1TnplMlZDcDJVMlpXTVpkTmM4aVpxdFYvY29kUVQ1UE9H?=
 =?utf-8?B?c3ZGQlNWRmlnNmlySDJuQkVOWlFKTzA1L3huRkExYUtRc1RKOWc2WWd4SjNm?=
 =?utf-8?B?K3czY3F3TXRJYkd6dWZnQ21LUVl6Z0RDZjBRWXJQYlhVUmhPWWpEbFlLZEph?=
 =?utf-8?B?VzhIWWU5MEM2dUx6UUQwSXBKeDN6S0k0TjViKzVuSnJaNHU0YlZNZHliN1hM?=
 =?utf-8?B?czgrNjBjOHJjTlgxakpvRklIN216bENVZFRUWGtMa1h3KzBCaWZHTm1HMXh5?=
 =?utf-8?B?alVxVDcwbjZRYXM5TTZOT1dDcmVmZ1ZjNnBPYzYxUkhpTjJ3dytFaVB5MVpw?=
 =?utf-8?B?TXZqL2lmYmhJVFB1VlNWQ25pQkwweDdZTmRaWDJuVW51djlnNUpDN0ltR0NP?=
 =?utf-8?B?ajA5NkVFNkdtajdvVEtUZ2tLMEJpaFVmSW9xbk1kcExzUVhybzRZWE9DS1hE?=
 =?utf-8?B?YzBNU3BJbWIwZjhZQXBMZjlEeUZXODNHckFMOEt6VTVhTmVJdFB1a0FQK2d4?=
 =?utf-8?B?L1paVnhqL1FJd3hzblpXK3ZWU1pFS3FQUUR4VWUzRmdpKzBwajBMTnFYWW5r?=
 =?utf-8?B?WW1CSmxaQ3BwcmJwazkyMVZWSDZlcWlFRndEV3FLVE9peGszVXNqY2xqR3Rj?=
 =?utf-8?B?Mld2WGNYbGRxdnZoRDJzZm8rRW1LQzMzdVhzOWd4dmNDN0ZKaU9Dd1N1ZFV6?=
 =?utf-8?B?SEEzcERac0FGVjgzWW9zLzh6Ujg4czJEVHNlZ3JEMTYySnI0NFFQdmIxNU5h?=
 =?utf-8?B?d24vRytXK2NtOVVGaHdQdS96UlowNFZ0RUx5WldaWVE2aWZpSnVXVitZTmRF?=
 =?utf-8?B?c3VHR3U1QytVODlMby9CT2h1Q2pzZkNXTHh1RWtSaE9QQjZERWwrempEZnFO?=
 =?utf-8?B?L001a2IxWVNqNTlYOVBSWHVZUk51WkFjaHFWTmlPeDRIVXlleHFEc1J3YWRW?=
 =?utf-8?B?SmZWRkx1WkpNRVRXSWdyb1ZEUko2ZDFqcjQzVFdxdEJjNmdRdXNXSVVrNE15?=
 =?utf-8?B?VnFvdFh2SnJVakR0R1hQZndtVERHc3E4aWJTTUxsUXlXYzIwbVpoVHVDVTZC?=
 =?utf-8?B?NmxxQVlCQStCcmFJSDVhanJNN1h2anEwYWR4MXp0MDVUeXNXWE9IZ3FITk5L?=
 =?utf-8?B?OEJUUGZaeEY3cHE1enFJdzJwenppeXZISG4xUWVERGs4VTJaMEpCNlRrWFlI?=
 =?utf-8?B?cUNsdy8wL3R1SFlVY0pyM2xzZnRscDFZVGxMS0txVWxjQlN5UHBQNkdBZ2VL?=
 =?utf-8?B?R1JiZ1dUY3hvR2JST05KWityRjRsTnRkcTVQd1l0V2VTajNrQndOUU5wY2hl?=
 =?utf-8?Q?6cC4Zz+RsvTaY4fR6b9GWMeu+XlD+I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXZtWm8yZk1wdXdhVGxkWk1pYnZGNE5JVVd3cGIxOXp3MTErUENDK0NxUG5l?=
 =?utf-8?B?cTNrQkF5ZUdyekJiMDdIc3RiWk5vRGsrc3pTR1B4b1IzK2Y0b2hpOTU2SHZH?=
 =?utf-8?B?QXg4eDJTU0ZIVTI3VG1EUi96ekVKeXlLRUNqUUcwQmVPWDhHZTQ0REdhOW1U?=
 =?utf-8?B?QUl0eGpJWEZXQXBSQzBYdXgzZWUzZlJ2QUY0aDh6ekY2eVV5Yyt4SlQ1Mndy?=
 =?utf-8?B?SnRPbm9NcjRYSUh3UndxSUZrYWIxM3NnK1RJUEdUZVBQZTg5U2g4MG9pSnpR?=
 =?utf-8?B?bm5hSk41blJTTlowSGF3ZUx6andZMUNYVDIwWVU5WUJyQnNhdWtyQi85elRF?=
 =?utf-8?B?cUQ0dVNUUDFkSlVoclJFcVh6THE3YWx0U3lXaWtNNER2SDhTZzFva1N0c0dT?=
 =?utf-8?B?Y2lFbHRyakZUcTBsbm5RMVJBVTM1VU45RjNGbjBGeW1zT2ZRcHp6NkNjM3kr?=
 =?utf-8?B?L2hwOHdJNUQ5RlFycjNFSS8wQmNBRURCdzJaUmRmeGZEc2ROWkl6SmxXZEhH?=
 =?utf-8?B?RkVDQUFGZitpWmkxK0U2VEZrSlY2eUc0eERiZDQ3VzFoOFZHNnM2T0grVjIx?=
 =?utf-8?B?NklrTnMxUVoxNzcvMGhid2NQbVk1TUNNSW55WVJrcVhHeHpVSjQzbmtSMlVz?=
 =?utf-8?B?TmJUUEt0aFB5WURBOHhnU3MyRjJpMnlINSttYUJkbk9XK2VXb1NIbWowdGJH?=
 =?utf-8?B?bEFvLzduVlBkV2NTcTZtTURVRTRMWmhLUUh0T0dzNkxRRXJFRlBId3Z6aW1R?=
 =?utf-8?B?MXd6R2lZVDNzekprdm80U0RDejQ3bjJqL3BzTWhWcGgwSHl1S1VZTkhvUG9M?=
 =?utf-8?B?RDBXL1IzSUFLUk9kcEI0ZUlQVHErcEU4dlAxdDFKeFI4eGpHczhva1dRaVl2?=
 =?utf-8?B?N3FEMmRZRExSbGZzWkZXRUE4SGM4UzRxN2xUUW1LQk04K1RqaXYyckY3OW9E?=
 =?utf-8?B?ZkJuTXVOV1lqeXljL0VOQmxtM29iQjBGRWpVQmQvbFhCSWJLS29GdWpZK2J5?=
 =?utf-8?B?OTZHK2R2aWtDZlVXdGw0cGwzWmZ0OUdPa0twY3lIbDYweEticWhnbkFicHcz?=
 =?utf-8?B?M1dzTW8vclVOUjhUR0RiNFNzZ1VuNkVIU2FYWjczL3VwZU1VNGo4NWNCbGw1?=
 =?utf-8?B?a3ZTZDdDVDRwSW9qT2pVYkxFYzVLbFNEanJyZitWWDhRV0ZQUWpiUXh6M2gz?=
 =?utf-8?B?dU01WFNENjI3amRldmtET2Jobk93TkY3NllLWlhnbW9KcXlmNXU4R0Fjemx0?=
 =?utf-8?B?MDEwOVRSV21qQlpiM1FGQml6QThMVVBPTllVSElzZkRqWUFhaXVFS25SaXI5?=
 =?utf-8?B?MG0wUjVCRmZjMmUzZlQ0NDVIcTZ6azVldEZWTXBEVDZiNDZubnNqOStUY2Fq?=
 =?utf-8?B?bG5oNGxjdmJkYVZDSWJHUi9jL1l0TmtmOG9CQi9UOUd1SGFFUjFWeE5aSEla?=
 =?utf-8?B?MStYVUd5UytVMUhCOGRmVk9qN3hsdzRPY1ZrVkhMMmYwZ2JKbGlxcXN0MzZH?=
 =?utf-8?B?NmgrT25GcUZOcGN0WEwyaGxtdTVRTGFlUWEwNnJGMlNUSjZvL0VLVGZWdVJD?=
 =?utf-8?B?QXVNV1F3YW5nNXBuYXdFWUg2Tk5qT3Z2UkthSk5LNzJNS3ZGVXV2cHlqY1JB?=
 =?utf-8?B?SStTN3ZxTzVKY2JXeERBc2UyaXZKRXJXaWpQTUp2S2pmMjFlVFhzM0JsR054?=
 =?utf-8?B?UmwvY2ZWN3FLckxSNG9jQlE0Lys3ZHBMR1FKdlY1YllJQ0lkTUN3WDdzWmFV?=
 =?utf-8?B?SWxoS1c2QldyQUR2YXNXWC9qK0tyR1FHYVZiVjYzZ205VXBmaUN0bDF1U2Vh?=
 =?utf-8?B?WmVoTVlMZDFETCszL3A2NHc3RVRpMG84K2l2UzZYNG1XSTMrL2JuVlRUNUpu?=
 =?utf-8?B?VE9ZalM0QXdzRnhyelpraE1DeFlTUUFPNnVNWEZQUHpZaFJiWFZDWUxtQjZN?=
 =?utf-8?B?TjVPQkZoTUJiZFNobFRCalBId3QrbWpzTEhKUWZhdWRkVFJadEdzK2w1Rkoz?=
 =?utf-8?B?elN2QmhXN21jWkVXbUtEQTBtcVVVeTIvdlJmZUhpdVAya1JqZTBBNU5ndmhS?=
 =?utf-8?B?OWsveGlZOE9PaThzMlhKVWNjNnhGWlU5cEljNjQxOTRZM1gvZ1pSMGVOMC9v?=
 =?utf-8?Q?TPG5y67DOD+7jFcSoInXFnyLd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8a23f1-fb26-4b7b-2718-08ddfa45ff3e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:49.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FixycHNkPp3cYedgtAfa2nJamI/sG+tEBf9FyCw/7SruZE2mSfrDUUlETNruXwGPvJNNBeWSgyjfdR8V6nDVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_030755_629033_08FB170A 
X-CRM114-Status: GOOD (  11.73  )
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

It's unnecessary to set initial ExtDst source selection because KMS
driver would do that when doing atomic commits.  Drop the selection.
This is needed as a preparation for reading ExtDst source selection
when trying to disable CRTC at boot in an upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-ed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index b514790bb765329295553f89d16ee1167ef411dd..1b141ced57b895c24b6358332cbe5e308dad7c01 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -203,7 +203,6 @@ static inline void dc_ed_disable_gamma_apply(struct dc_ed *ed)
 
 void dc_ed_init(struct dc_ed *ed)
 {
-	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
 	dc_ed_pec_enable_shden(ed);
 	dc_ed_pec_poweron(ed);
 	dc_ed_pec_sync_mode_single(ed);

-- 
2.34.1


