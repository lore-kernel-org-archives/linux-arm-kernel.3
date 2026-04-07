Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5330FFB518E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 03:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+hmUl9dxWxiG4ObwHrwM27BfvegsoQByUVBgaVmFl4=; b=KU7jUip5GuVzJ+tEdScYj6cbwv
	CS2DvyV7vSxMJUr08iKIdxuvJb/9+m+FLJEWzFj0OOCHkAphsSZSiMgj2VOOllE+6tsdUX5ZiMLSe
	v6VFUZ6Nv7j2+LzLX+J1277uLJasIKY1jjDOooppdFR6946QMssVyPJOJMTnbsvUtS3aMdK0yfKlW
	3W1kBgiqmras3rriQGa3189GX/lt8w6Z49YKU4eC3IsBlTmc3SGeUt1sUUzrsS0URUkW/TznM9gAo
	WDk/ScHaXUu2WP7y4yCH7tT0gyNE1MPaPv7g1Eyhc99B9cg/DVTm5qls61S8JNoLGQOjlAnVX/zr1
	DIOqrInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xQi-00000005qhf-3wfh;
	Tue, 07 Apr 2026 03:48:44 +0000
Received: from mail-northeuropeazon11011061.outbound.protection.outlook.com ([52.101.65.61] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xQf-00000005qhJ-4BSj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 03:48:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2cZvsBP8Lfjm5FdAaWJXLkTT7CK4gbYEVba7EDVGIEX7OK4B9Cv3RLbCxKtPzKDy7iRqYtZsVKYozcAdNC+G3INhkMwjCdNlH69a8OPAzRL4z4Vjs+WMFHzSM/WVpllVslRZntZX5mvQj0fTtqqEmDNkvOt41Pg/fWR9Ipqxo6vP/OdGkPmaRLu1MErm/f/P8A7yzWWyeVnCdfV9OBydOEMfINHXbU8teZxcs2kJL+FnuKvJRljCDOSrcPP/s+dzhAZHU2AivJ6W1gtve4c1Xs4t/B+3lYm9n+4++0DWMX3crDtda98nA3IvVSz0XM7MhE4L0F8OZDsWPkCFWb1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+hmUl9dxWxiG4ObwHrwM27BfvegsoQByUVBgaVmFl4=;
 b=zCV1HEsu99wCHQ8/KM+q4DAa2Wmw0BhYaqf4n6ch+YTCMCc8YEBDz0gdzrGGl/TwO0+aMKQLdoC0VU40WQRzla4drGtaMlD+CGODTC0vzPwiVCY8097QK/JmcmM9S+HCMLdTqmtlqPpQCkuBXULsSViuFCbQQruhNQGfArwlWqfZy3hd8Io5BP55SypzA+QJHT278SLpZjkSpn45lRpB48TFMDzLEt/MuQl4zf9/n8sQzy9Tt8/YkHPgzDiP7cO5FNbL0PhujoKN+LYN6bVcBjSvLrK+WiQUjFMdPieiigIv7JdiCLz7NRLYPUdv0rxD30vJ14UtjecPODX1XYcSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+hmUl9dxWxiG4ObwHrwM27BfvegsoQByUVBgaVmFl4=;
 b=nPc9mK7ArswhmJpzSPvEaVyUpcBJcnKoGvat9gMEYEoA69mq6s5ugB0TsURNUVODhCrA6tg+D23OYyAebNEBL+PqGz1leHEL+sylw464/LcL2i0WKAFCmiU8DitWLRKdFGLsFHr4eMkvkJFnjsf/OxfcXTuCQtAMoP/kXUhy5j6A/ivDmY4J+8DTVp88xwOTxYpFX3l1kCS/JE0hSCP3I6MI71HO0CKekDC6R0T/AXVSXiWWRiQY+hMXJd1xH6rV+x5/VaZljUrMfpGOzRq95RiLxqGedGIuaQNTt5dmM60rwpOT7RtpphZorAvb7agrZJZF0cQa+iIYK6sFAm5LcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10342.eurprd04.prod.outlook.com (2603:10a6:800:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 03:48:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 03:48:36 +0000
Date: Mon, 6 Apr 2026 23:48:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	dmaengine@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: imx-sdma: Refine spba bus searching in
 probe
Message-ID: <adR-jGAH5cDlWtwa@lizhi-Precision-Tower-5810>
References: <20260407032755.2758049-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407032755.2758049-1-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: c8072e8d-7815-4604-b349-08de94588c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: IvW4BjjNWiaymWuZFcYtumQcQX54ijlR1HNPPnvxPYQp+l1R+vg4GspuzZJ3U9VPTEWyQQeFS2B9q6jWZCCOK00iuagfs8fsZTX06CdvcIJNqpQ7++U2j+AaqMyy6fzW0DJV7/I5hXi+5DUQnw0sL3RLs1YqVpoil0rmXz8ikVgol32UekD8xSmDhD/SRSTB43HWxM41i95wPavK9uabGKaBd8b+rBKtbSlGSZs5/jgOeaiH4ycUbaDpHZbiI8Kxv8p58Flvjl4eJv4ZLAnNYcG5hsxdtZFvfzOqvkQJDHareFzJYlNjOnaKADa1CvisfGgrfahlXbasoR/XfzyTbMNW6N+9DpJ9hYyETWDDRNJ9enhpFhnS8qlBearW3Yzsmt5qPFzdKJ/G3q/gDHfMuf4i4+5n/+g3HyCkRUYi9FUs9jSX0CeSpZv1ydUXcDpgsENppfeJ2UJAggZwJIXLZd2iN7v85ciHE7CvHpGZ3MJM+kramMmk6DjnWuHkTSsJ9vaEN9yxIm1rvsiIWoF3e1V12XzNwVU4F2n/3fmaV4E3oLt+jw7dJS7ByMB+YT1xDOfUNAbhuVbFlXyqaFE99FMZC12JI3xVT2TAIUIl1h+ZyWdEqSJttBmIob97tdH+jc8Ade7TJ/SWNt+Az/Flwo1HEKiCcO4xd4ZPyXirHjeqDiY2ctkt6XLPYg0+AnTzYSryiv2BclihOf6wPHn6EPOkbnOhATpP+sj/FlCtmGatnKaO7Jl6ieVKrsuG21HsL4CIF+4p6rlesQQ2AjTDw9iw03iUR38usguZ8aR4yMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R6VpzV6hbmVM56L54KCwNcdfzuJs5L24nG/nfAu/+h7TgKoGwXzGLGhxrhUd?=
 =?us-ascii?Q?bIYBn6ixkuKRjpDb/NoYEPpJnSKBColRSMwLhaE50UPyYkFET8SS86oA/n1S?=
 =?us-ascii?Q?ARjj/ecEIgx97fBBTf8/YNdWEh6vGjxLFeAmpF5xNqyxaC/6+5RCafb5oula?=
 =?us-ascii?Q?cuEi3jQkC3hBhy/j15Dnb7WXBv6sedDyGUWqTfJ7BOMewm4+hXFFnX7mc9hH?=
 =?us-ascii?Q?UGA5YTrfIuGoZC2mul60AQ1JbStVeJhLwadEXmguorr29qkU9eZFU4EsI6Jr?=
 =?us-ascii?Q?I55caFuLM67ykAVvPHrAAr/w+7ogbOq+UUDpv5tuh4wah7omXxbcIKRu8p3F?=
 =?us-ascii?Q?8tfluEXKjEr3wlvbkpGwN55r96pNs2HdS7aDM/pk6j/0UDy9pKXIO2eaN9Zs?=
 =?us-ascii?Q?Bg1v/ajdbAKkx1mgp+rXOczv8nHkMmi4ACpjRjIgV4gn8NYe4TUbFNGYP+DA?=
 =?us-ascii?Q?pbdCl19Mtm4PsZ0kapmNwPTySPPo+ZkX5vS1LyQTICcSzbiGFgZ6NbQAWrbu?=
 =?us-ascii?Q?uzJz5P+4fnlCgYT6ZHQFSQxInAynePkPVSHKmXdXYxhukFR3zTW8ZicNMQCe?=
 =?us-ascii?Q?Vp0j9k02UTAYBt8ASjc9ytxg+QTAkMOxCSISbyl3uJgr9zKOifZbAZUEbMTJ?=
 =?us-ascii?Q?F1OvwKgX9pTNRODyH3gJVRsUeJfsXzp3AsaQDPlXa97H4Nf5DH8GYuNrDtYX?=
 =?us-ascii?Q?94uqX/e/DBdIpWrXBvY2tbiHyvfWfpQllihPn2Rd/jGQtOMCAciROJKmIh5f?=
 =?us-ascii?Q?XkCpI9duJWI86RjlgXfTnn28fjKTq+GFX3aXnH+9kuhtUUwM2kAgFvY35Pjd?=
 =?us-ascii?Q?GkT1z2ttIbiBuEyDVGrECfm6YPuP0Z6ZOwfPxzO11/xpH7/Y/j7kwolpZQGw?=
 =?us-ascii?Q?A3zOyn7WFkKyVEND2XizG566UL8YkXi4eDhWw3ls0m0LZbZSWkL+niRoVwHm?=
 =?us-ascii?Q?UK5nMXSTvx8sU055VxgxvN9VUTT4Un/5Fs6E3YDKoREvKmUTc7BzM8+xZB0v?=
 =?us-ascii?Q?2cNKqDokogLpx9TanDPfWNY7aSldumnM5XoLz62P2GpLMxbtbSzZIRi6KbTv?=
 =?us-ascii?Q?rUVETo1dF6+JdUqeDJxbGwoOS+GDD86o9+e01mos7IG0DV4TqS8mHHUjHfSa?=
 =?us-ascii?Q?G3Eh6jjDH9Zyx9bwEQqbQoJHiZ51YV9zON1T5tV5KSBJmvML3864UAM/lfD7?=
 =?us-ascii?Q?t2CdkHSz7d9yMzBnZY/97CURFT05pbRwL+N+W6vparmv7osiEaBtkH+ttQXn?=
 =?us-ascii?Q?wyL9FzfWq3LY6F8xsXxvLhU+8PusxJ73ZbBSQ/UhWIp8WB/EBXMhfnHK/EVj?=
 =?us-ascii?Q?GmWRSCHapAVP2aI1rOd4Xh3LTvE3Q9dkRstflw7BJ0cRnDeghYjRkkfRFJza?=
 =?us-ascii?Q?7HZOrbTMxpBWjMAiTDYivJ6R998e66CIMrpkDDrXUd/ONpinrj0qzkCZbI7A?=
 =?us-ascii?Q?zpU45xvCIMKOsMeoaMcOtNNqY+B6jm94NIPSwImMD9Pj4TviTvj2gssDxWy6?=
 =?us-ascii?Q?dK85NWrT6683Iz5ttpTu4uoIgPoj9NE9d1DsZ3tMpJZmeuozyBiasJgT5Mbu?=
 =?us-ascii?Q?Nl0H937+smpPloD/UW90zu3sLh7SsWOMpvwUjL32SCMND61/3SbAJ1D5Nk9Z?=
 =?us-ascii?Q?TMRWHtd5XuaKFPkdiGfNzQhu3UxX937dcgSBn9xcPCbmBbac7PhrMC4nVXNR?=
 =?us-ascii?Q?diGE0iMvRAKLNm/XBxtMA4dAVFoJ+luqqtw0UZXtImBixK4R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8072e8d-7815-4604-b349-08de94588c19
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 03:48:36.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwp5mhOqzfs+E1GLX0UGt5oyDv2CtBy/k4fzGF9CXzSWzbLlZkC7oTeJEYrq9pDd4L9khUlyUc355/C3xRNRSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_204842_044097_5C37B339 
X-CRM114-Status: UNSURE (   5.86  )
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

Update subject: Handle multiple SPBA buses during probe

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>

