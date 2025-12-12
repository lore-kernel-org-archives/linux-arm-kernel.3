Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52719D59D8F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 19:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SkYMZASm1sTfUJTMt1hu8GFXMzRAK/LiB3rR26lTP/8=; b=m/nN7ne9Jn4BwXqU6ZYhb/c3a4
	190Q2Vq5P21oy2ne321QgAnm/MbBmAkmTjlbMHJvaJdh20xK8S8Pq9RH2MunQynJ0mxDlMhAnmWfg
	agss8hUu1gGscCGwRRjJ39d2DMJbA23t1lPRFvIBG5UXncOUwJTQYbOvc6Fiyx4PdCeU09QmJvbwb
	z/pJRQi0N76hTBJg3cU0xHBKjd/5p2Xuwe+MOknmfx5VYm4UU+HVMyHVvtoJgJkIZGpgXo4S/iINz
	kR1NuqnaahffXLS/ElpuLmpQ/n/+HZYy3oI1MT/T/QBP2QLJ5fWPoJ147D7242ABXE9Ik1XHqrPKL
	ky+95frQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU940-000000010CE-2eAu;
	Fri, 12 Dec 2025 19:44:28 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU93y-000000010Bl-3G08
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 19:44:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIkYSw+xeFlfK4VlAwV45g0Axj71HHLwym+FESVPoX4efkIdpMawlR9PTfS0Yb1VeE0AsyBeMsYwGhi1sYyhTchND1yM1BTx/JEefPqDDGVnwmde+EcW/8gVQFvCohNICX8IebNlBbvyKPbcNEjFgCu3VqFIC2sMtJ9qjtzJFjo9VJdeEYagYlhAjbo40oOw2t4y+IS8Uv42eFSwCtSLXSEQRTyjNMVOp6n3rrJ1S9s/lvAI00YvqrsyXlwWbVErCxd1z+PysrLeqTOPd67FhA5g3UcrDJPdcFd3aDvDn6XMwpPFgwaNoxHUPN/DRNg5dvbWp/2J8jP7TBTNk/BYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkYMZASm1sTfUJTMt1hu8GFXMzRAK/LiB3rR26lTP/8=;
 b=rlLKW/jjSqdHkf2GAUO2o8oH1F/hWpjCVI1u6UtUuMx2Df14ui3N015RqIpDoStoP/TccKKZiwJH33ru3wELF2NpfyGaHOL5rMbvwjZ+qHKjqWwmFfN9Q7LWbimiuFjSIMqgxoXDfcKIUyk4w8tbFcz1DoMxutIQ5Zf4K4RJfEvcqEjhTb5EQjCbMVG+MVmABMkevZ9vZIO7RMaTH6p19o+p7wZ2rQK4lVJPaJCwzMhC78AmPziJHCnAXz0SutzRBW8GIjb7Tt46fXY2VaeyonuBNnT8FlLzxmvi2EaQ/EpgItRtR1s4LyOD6jrVXuUiQ1d9/RXYX5iUI3qkiwUQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkYMZASm1sTfUJTMt1hu8GFXMzRAK/LiB3rR26lTP/8=;
 b=lLqfZiwG6Clhc3RtqHIZAdnUU9C1RtY0Z7k/MqIfns69JY/kGLy6Aw67BRs3XyWnuQ0Q/Q846x1OP6IyRMO7F6inn/3iCUoL8Ily+TS1+wtwkmGMhkWbDQDQLxWY8Y/snhxA4bq6La2FX3b1q1SQ0L9K4xi9TGSoTBQvQ/W2EuJh86najdCtSWIsmYn7yq0TrvJAr9e9inbkMFvBNOO6bPURldSPDEFq3AW6LdE5FP++WV2Qz9Eo/DGlIEtrCq9xCn9eTfvaAmVVSzU3IhhCNUaa5SqV9lz07OdzOht2uGvCZF3TzRFqgRCwyrxjEb/VjsV8GyzdwRirzXKrp78+UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 19:44:19 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 19:44:19 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH v6 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Fri, 12 Dec 2025 13:43:36 -0600
Message-ID: <20251212194341.966387-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0169.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::26) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf189e2-e85d-4e7d-887b-08de39b6d75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Siqv4DKM6r2DgQFRatiKkVf2dQII9+IGBpyjLcoZbXCiN+KtX7EwAEs0tMeF?=
 =?us-ascii?Q?Qb4dByLqFwfDWtx5Dse7kXiXbq3KT4O4sA7rhPHxDpHk2f3vCJR4FSjv7jpg?=
 =?us-ascii?Q?iF7fXtgLF3Ztb5XeTmMdTnwr2pG4QPchKdGw49I6VBx5Dx7evruMbRH77rhw?=
 =?us-ascii?Q?uX9Pi/jD3f/QGLfW7q54UO8yw9xN2EOG0dqMCUPv2+U9kKbUOKNwJa8GpPWY?=
 =?us-ascii?Q?4ZDbEMG6q0kSNHjo5amNaXOIYl5rHI5JwcmpFgSs0nTNr1vf7vnqbuvgE4qD?=
 =?us-ascii?Q?JTu2TWdMx2qAL6zA6G7NyOnhXBfMRR+ozH20SlOSka7wPvpT0TgjWMMo4Ras?=
 =?us-ascii?Q?jKYMPJIBaYweOTW9yUD24FnuUBRV28vUtGksADRm+TAVJNrT/E21fKhAvjav?=
 =?us-ascii?Q?3eM/ux8fL9ntm8A3zbi/4tvj/+ZJHLlJKgsNY0N3Azl521YfrrH3wkGcNpW9?=
 =?us-ascii?Q?eM4r77uAOiUaocYmDkUXS4b643RpvDF0GMPC4Fg4NIx2U9VIavnpG6d6VYw/?=
 =?us-ascii?Q?HADWyjvKnKmR3P3kPQySFcZ7EWNyRIon69+JQd7DHeZtTWgH5yqX8IKclyay?=
 =?us-ascii?Q?7WtX+1dPxKLQYL1NNiSX3/7RSSg7npP52tUu9M3xQLf64Fw4ZFxaX6firQ46?=
 =?us-ascii?Q?2VmMXy2d3Ey21N29ygtkUkFNkq6ghljNMrirTMaC+zZl3Lfp4h9b5XhJ/pqZ?=
 =?us-ascii?Q?4O0zt79lAetBFGXDqhIu+5kNhl8CRIihbUtIVGqU2wBK5lCOs22F/qYA0Gyf?=
 =?us-ascii?Q?EULdWV7C0Yipby4y1XuPBal+abcYXpAOaipg5pWHRrNXak+4uZcUnzdtmmVT?=
 =?us-ascii?Q?GY/xqfNilgtbgGxzd9RSj2a/C90fPWeEpCgUUPXUSmFtiTXD98BKOayv+8Ns?=
 =?us-ascii?Q?Go5HJW+eUarF8WpP0NVtBkGgY4mfZ4gz0uWvy9Yw2tn7Vey9iJuVBX7HETzU?=
 =?us-ascii?Q?rpITz40AH9UVWaxMf4M1RmqwOHJA8pIdvBKxwbHpQdJQWMPsg/QkydHQl2RF?=
 =?us-ascii?Q?dQXpYRwpOEngmXpEOukd0UV3F7NExF13fmIHHZm+D2qcX+JwMNI6hg3GaCEa?=
 =?us-ascii?Q?+DSY9SdT30+VMwErAZT/YQsR2t7bgVOrddoJxKm5QiZyPWPOheQYX4kDCZ5t?=
 =?us-ascii?Q?AfCxTDuFNX2SFm2EPM/MQld2wrLZiIGKT2pvbEK0cfpRfIsV8XFLoTMpyEZp?=
 =?us-ascii?Q?aV0HNgTrI86nBEMQ0+N3kRziWCPdpnncqJoe690lCXMYf5p+uWNME29dZP41?=
 =?us-ascii?Q?PPnJpOz88E/D4+2vJtGY5bd/fyRY76ZSW4elnL4xKXB5uEMrREEWUTZKNUvK?=
 =?us-ascii?Q?afwrzIDZV97TW3ldWidnpZZv2Ielb2bGChmeVb0XYjfzAkTHaSIoK4m3tkMQ?=
 =?us-ascii?Q?Epb2CqDtje6VemBsSw4MohSK9aN9XVQuOuHqBhUpbItMq/Lfcz0y8wUN/9Hk?=
 =?us-ascii?Q?YHWIluu1D41wLMcdaCQzTWkpuio+jGQw0L8griJu6VjYV+ett7rVsFZYg+aB?=
 =?us-ascii?Q?umc8+mPPkIuBJshvwONN61kx+rnGcUkCAqRb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T/8kuMHNObrH+1jOzQjVKO1p6KD7WF/Ad7Ih1yLPaabXwyt5AbAB/q8gj2Lv?=
 =?us-ascii?Q?2NMp6IdCpDbDuNOZcahxunVZOdGRnuLzxWbzUtg8ronXKoM0SoqYGdPM6w6+?=
 =?us-ascii?Q?LeMBtz1kWLj1Sfw1KoTyUktTzXYxm362/bUZTy/DJj+p1VzGeFAgskBIaitH?=
 =?us-ascii?Q?vxrmEPmgVWKV9ZBgyqQ03NzDdFEqvkiAG05uQugSWgErd2h8+TrHoSm/KqwR?=
 =?us-ascii?Q?2pVCQ8bXzZ3aloMOxFx3TwA68bHba2QIJqrKfGsRJ+licwWcyx5s9tzv1uVE?=
 =?us-ascii?Q?PqgpH1zZLeLuvZc50ifU3jy706zZcPl4uYTJNd1BuLU5OOjPmieiZ0XUn78W?=
 =?us-ascii?Q?qIxOMKdM6RDD2fWL8MNEha09rLdB4UiiVe+87+b0i3IaC2JLv33l1IS9/1HV?=
 =?us-ascii?Q?rToWiAC6SyF29bTIVK1d3jfwdK3TWZV17KFsSauOh6iaBhs2FmPD5YOEUWW6?=
 =?us-ascii?Q?+4jC87kfsXezrE7o64RDoqugCGtkIQ/yg3HKoimwALIEP6ber6J7R/3xkBn/?=
 =?us-ascii?Q?T+xo2CQXe5QG0U/285MyKHQe2owQr23H882PDVMGRskbzoUJR7bbtcGpBsvg?=
 =?us-ascii?Q?sl3mxp1HR4lf9yraMupIy4OeYBOWPSkbN+sZtDpGeUG92CnaZJLW+iHU4T+z?=
 =?us-ascii?Q?G6fsyNdxG/6YaJ19PLyLovQpaGD77qF6dQnPxf8wL10TlEXg0C21O0KRL/+U?=
 =?us-ascii?Q?KSZ5XJ2iM9nbEcyo1w96sH0nVAGcVtQfFv6DXzNNd+f6CFtHN5VkQiLxUTDd?=
 =?us-ascii?Q?Q6ITQQQUqcX/wHcNllSnKQ+FwL5BvVGxal2s3m2Gv+g+HBH+WrY49EIxmRgp?=
 =?us-ascii?Q?rCunbbSUfv0EtM0Pmuajmb0UYwgm6O47eUgB5inmw5FrvZmO7JPfLSJtblv/?=
 =?us-ascii?Q?Z13Qr4NzG6C0XLCOvZaSnTCNKltWCXaaTEqcOgvwt6TeJjNRooBArvme+dtp?=
 =?us-ascii?Q?X9mkuPGRZpdLOY9FYF+bKQediEIGCJ8bFC7+M4mjkCYk/b2VNDjlD2Zt5L6i?=
 =?us-ascii?Q?GmCfkoaMwYVRrXZvFbzkpKdCy2NXETjYycw+OS//SSZKR19ZSbpZsvUCrKDx?=
 =?us-ascii?Q?w8mr2k6BuC9Aoo3TlsZlGEpy/IMzhII5jHRoB5SZAQKZZfsUNq8jB0Y+vcvv?=
 =?us-ascii?Q?KYlHa4cLrtaqZUOZ7ocmv1XRX1Rd32IEd6sWCAHKxe49RFfbhIz+fss5d1ct?=
 =?us-ascii?Q?/LjHEdXnuGeeg8Os0RpZ3A2CcV93P4jwaEB/Z3vOX47pAh8nXOAYQLOzu06c?=
 =?us-ascii?Q?O6m1vPfFuScxGVQeT8JItXGl6wfOtI/OIkhMRxgNydMYe1vftXL8ehSYDBvw?=
 =?us-ascii?Q?alkmds+KmVUk1OeWNeUi8NrRVs02vJubkElVLIIqh/3vvSdV6dGZJy8a5eFL?=
 =?us-ascii?Q?OeSz2JEkNu/35c94SiSPwkhQVqHuzIXMXVoKxIOVnrF0gi5saxxK4VHx4piq?=
 =?us-ascii?Q?gPrIKZcKZoqcXeiWK/VIQ5wExmURT7kbjl8qSGx4jZw78cXlU8PvNqb5lsYz?=
 =?us-ascii?Q?w9Gj/QNgRAV0z4BqVKCryesQ3XQO4THAOTGJRCL5hFy66Y7NC/U1zf1mzLnj?=
 =?us-ascii?Q?pYW3v6/Wp5l6nLFab6p3KA47jH8hHmq7OuAYqWl6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf189e2-e85d-4e7d-887b-08de39b6d75d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:44:19.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVA1QXdcFkjUXfr7x3jBBxErOb47OBHg5iEMlZL76AG1/dfZpmY4UsT71fc3mNOGhHU75cqqFrXbIDjGEFlgxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_114426_830793_2B762316 
X-CRM114-Status: GOOD (  15.33  )
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

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Shenwei Wang (5):
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
  docs: driver-api: gpio: generic gpio driver over rpmsg bus
  gpio: rpmsg: add generic rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  49 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  54 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 232 +++++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
 drivers/gpio/Kconfig                          |  16 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 490 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                | 143 +++++
 include/linux/rpmsg/rpdev_info.h              |  33 ++
 10 files changed, 1046 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c
 create mode 100644 include/linux/rpmsg/rpdev_info.h

--
2.43.0


