Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A208109C038
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmoLzAB/gmWxPftuiKSNnQ62dpy+38CyvV6yg6ZlYKI=; b=qk581aMezwNwY1rDcBrTgiNd6T
	tSsn7JTXBPydGsXh5wyS5KGsWr3Qa2ChZY7HPq43dZUWRRffVfiZF0HPnTXW3vu1MRyBFGXWHwCkh
	P92+N2D0Is7WLoGV5vy7drwFZPSjHSSBg1r5cxAF+Z1FGfbfXZFWztahx+O3VZF4C9laz/iBm6ur9
	a49KCM9jWxtx6ftP5bMIvsaBTUj5vnVHQEr8AHCXeOZ97NwrWEA6ISCDr6H6cQ9hnyjxNdNvitpAn
	XRxJsDSr6n59Vr43nzQUM29frVbVtSiJgXBxUM0DFmV9dFpvTKIM0Y3r0QROD6//9LWc+DKYxQA93
	PwG6nEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f7T-00000004vFL-3OJh;
	Thu, 26 Mar 2026 07:27:07 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f7R-00000004vDs-2sRy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 07:27:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9SbsgxrF24pqFpx5crTxJMJt5Qq7ehjfFI6rPsGHBRdhxKjxN0HACy0TYgTYIqSs9jGQEnRn6lzEZI9rwu6ER4ZZJT8ShXvZt2Bqj3034ltOT483FnAVi4d3NiDZEc+wRlbexkD6wxPZLdR3eDPksxRtQ4VuRoJwjxRb1qvG3JQqx8XEvrRAMRKnNnlgz9CIaFECkK0LeGeuVJca+sq5DIujYUyPqFY2Tf/sNgxTLoNRc8IE/fUuRgyrzrzeXQ3wPj/XvHMmQ/c7Jj9IXh5V8Toe3QbjXQqDLGChbTGhJH6TYFNqjLM5wvUCqaeelCmj3VEv6bX4t8/SXCaI77TFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmoLzAB/gmWxPftuiKSNnQ62dpy+38CyvV6yg6ZlYKI=;
 b=UrK9s82hGi1Syt00Bq48dR+4xm1zXowzqf/i9Dm9GRR5Ead0AXwyMMXt3y0NxiHlif2sgfHSrihifFaP51iY/Ivf3OOz3NOcVzKQUkQyWKuq7bsW3D2XkWISmxtYPsMBwrPt7Kb2dVSSOxlcD6pbhmfz2tb7thklnhJWWw+uNi+pj9SCF5o3HB733CK8h8tGI+JXFiYFdPe9ZONoKyfG7RSYzHaiE92HRHmOQn4QNnHrdLpIsvXbitXzjwK+4LQDX8KDwnVv0pVnszIU3XIeYkaVbgM1aiy0pijigsWZ+h6FV1stYTQ+H6KxQ5LI1UY9cg61gpziGPsN1eNpO6mH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmoLzAB/gmWxPftuiKSNnQ62dpy+38CyvV6yg6ZlYKI=;
 b=WNk9MieEZgfv1fu7qO+8m+2YNtdB8/sOaFVDWa3XudlZrM3OFizCJJ5zesqlDHsXf2geNde0cpqxaSXNn78VTxdxvGQcx82z6XOuhAIkD4dFKofPt42cd1gXhp15AmqE0BYeXpHWzsC8uWOZQ0HsTq5/87VmoM+mn/PMqYaJG0Iqozb3IAzLN9bFCkE4b/qjG8G888O/oqObNKldwIaU4+TGp6EspHClnAHkYV4tAwJaAdyHFo5edcKL1q1K39JKaJJ1CIniGGoWwUZJu1sJ9394u6RZdTO90DHmeSMbVosGJ9oYTO69BEFbmEPvNilayW7EFC+9sS4J5uBkZxubGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:26:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:26:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:06 +0800
Subject: [PATCH v2 02/12] arm64: dts: imx8mp-debix-som-a: Correct PAD
 settings for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-2-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 53eb2fff-a88f-4a49-d013-08de8b090268
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: m2UoOzlHoStQHNZO3YxmoejTdX3JRRYzgoMZR3YpGyIrGsCS6A0WWkgjU7JpdN+GHj9sNAlB79WPWsXYEGmrE0NfWgxN1VjPbuYgDLMnaUjNKnY0vo3Pnly9RM3l8ForE9kEpM6FTyJDnbQnZyd3gXHiUq9naq64TWMPdOdURcHl2wXmNxWDWH3ZiTfJiVv5EiGW4B0a70r/0PC0VIe8BuXA4k0AEZ/UZSROPFrzKlKs57TZT0BQHQ0HuOE8K1JSHHl21P0Mt41qIFlJBTua7nyzpbtTCsq9euNf57lidG6NJJvdkBpQ470Jg7ppJVvRfa2LH5i9ZMsSgw0Rks0AQo/vBzrO1Ld0FT7vYfrvH5RRSo3qyGy3xRtiXA+0GIGkCVJK68dhOl8UXYLwZkvO5U9SyWC8au0MYh1dYMk966gB+cRQa1szST6hiBlFwnvptwHQACer6FdFhuz/yMxbwQCWc16kyeicAKVntrpohMGMeofj0BfoNf3exX21oyToyCG+81sNr3VTcRUWr2mgU5cTRW/UljqLuLcReFFnS7PFbdE/kdBo0a6rs5iL9f+qnyfwutr0cSO7B0qyqlpgesbYCmtPL/p2eSDC1BAioirxYVDpfLvsKAuOU1Bu6S5UKYpi7t8lmQMNK02Gi8jJEKGO2dbeNAjKM07qzfQkHunVqCbxj/uazfeeYMxKYm1MK55jXHLj/2xcSNU28R9UE4m/cT+xuQKsEuA3SPRIHtnMbmMhKgEeYDO4dBVsNwZ4L6kbx+bOkCRjU9y6VtyxCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDV4anoyQzJER3BSNkJJQVc5WEpLaDJ5QnE5SUxsQzg1bHc1eC8rcHJ0Mktp?=
 =?utf-8?B?dFNRQmd6c05xSDNtT2l4NkdyUCswVllwYlZrcGs2SGRNK1creDhseEhVOWIx?=
 =?utf-8?B?M3F4QjVXQU9zN3gwbno2Y3prb3FKUEExQmFGKzFoSDAzaDhFM1ZOMmttZTZ5?=
 =?utf-8?B?OThRVDl2cWltWis1M1JJVldtMUF6aFJBQTVjdVk3MnRwWjdPVWFsSXExRE85?=
 =?utf-8?B?Z1N4U0p5MlhjY2RKb2dHSmxBUnQ3TFdyS2xRaWJGcmxDVWhsSUt1UzFoUUJI?=
 =?utf-8?B?Qlk1d1pLYTk1b2VCRTVPNnhlbGpaUnRkWmZnMlZuWDAvVzhpeFBOVU9rUjhx?=
 =?utf-8?B?YUFJSzdXd3dWQWlyN1FhemFoMVk0TnJGci95VS9HTnpTanVNSzAweDdveWtv?=
 =?utf-8?B?ZDhnZ3RlTHdJOGEwQit6aFI1UDBLSlpyWi8zdkh5SUJhREhjV21WTzFCeUJN?=
 =?utf-8?B?WFFqNHlhY2xDcmE2ak1ESVBBOE42VHdIeXRxUWdTbDVwNVpJcFlXajBUV1o4?=
 =?utf-8?B?RVJoVjU1VWdXVU1CN1VtSm5IS3NtaTh2eGxpSW9TNWNtVk1IQml1NkhGMmlO?=
 =?utf-8?B?LzJTVThLVWNaTmk4eWI1Skxha2FkZzdPNjFDOTdTNDFWbGxVQ0dRQ2VlQlho?=
 =?utf-8?B?NWtRelNJVnNyc3RVd3RxTVVwclVxNFlPN1FaaXlZMDNiM3JUZFNodElueG81?=
 =?utf-8?B?aE1ONUxiL3RaY2hCNjV5cXRHMzdPbkJjVk1CbkpUM1ZOR0xBeUt1L0J6VkJu?=
 =?utf-8?B?Q1A4YnZDdUtmZjIyMkx2VTNNQWRGcEZqK0JKcFdFY0ZFclhPTnpFWGkzQmhw?=
 =?utf-8?B?TkNVSm5wNmlyTEw3VWdkMFh0RklYRnZ6aUZYc2JPVFRLUEFDeFRlT0hmb2Ey?=
 =?utf-8?B?Y01HY0Nsa2dNR2pDQmVmM2JjTFJDMitiTFh0OEQ3ME9Tdk85bkJBTFd3QVB0?=
 =?utf-8?B?S3lNOVZMSmNHRDVtYzJDWm1OYSt2SHJxQ2JoNUc0SHpRenpKNm1HOXM5YUFm?=
 =?utf-8?B?T2hVaE92K28wdFlqQ0NGMGNzUVpMeWpBRGVyQUFpRTVaZnprSy83Y1lxVnp3?=
 =?utf-8?B?T3FsbjhmWWRxaElXMGFETjBBZ2VVU3loNUlGVGNQaDFoejdHeEF6dmdWOFdI?=
 =?utf-8?B?ZTl3eitPU2h2TUhpc1dybXV0eHdIb00xaXFMZ2xBWThtUDJKNGhYdTNndnAx?=
 =?utf-8?B?NGhwb0t6Wk1mREo5Q0RaRkEwL2NMeG5pR2xnbm51cCtPMDhDOXhSUDVzWGYz?=
 =?utf-8?B?RG05bnJ0d1RqMDQ1ZFdrSlFYZ204Sis0cEV4YVplMHdxK0hwOGdET0VpbVhl?=
 =?utf-8?B?QW9rcWhEdm1TdnMzS2owcTM0bm4xUUJMdWJJd0RYSHE4NDZJRytSOFZSOTND?=
 =?utf-8?B?dkI2MDQrVU8wOVVvdkRhK203cFptSUFSVERtNjNwckd4elZjMldmdUNCTHo0?=
 =?utf-8?B?Ym5wbGtrQ1lCUXMyamkrVGQ5dE5kUHhKaWwwVENGNG1uNDFkcDRXMlBSb0Q2?=
 =?utf-8?B?dnE1MkhWUjZGa3FNVjVqOElYSGMzRElicDdrZ0p6eE90dTc1aE96N1BJaE9H?=
 =?utf-8?B?WXd3ckl4L3hiaUVTRDRKUDJYRXFYY2hXOU5KcDdhOXRweFo3cjZuVjhjMHR4?=
 =?utf-8?B?dXBZT05EWmM3UlBDeXhLcXNyTzA5SGxNUHRmRlpuZXJucmFXZklDT0w3UjB5?=
 =?utf-8?B?Nm5ZTTdrM0l0TUNlcUI4emlqcE9nWWFLdGhXRTlxdXYwN2xYVGk2UmxYR25Z?=
 =?utf-8?B?cWp3WUoxU3pIc1oxWlljNWJySDNLME9KaFl3RTJqcUhnbDRXM2dlaEs1bVo5?=
 =?utf-8?B?Mlp3SU9CWjErRWgzYUcrQ1RwRExJZTkwcTN5dDdFbUpCakM4UTVHbHpwUWRl?=
 =?utf-8?B?c0dCSm1XcmJuaEVTSUlnRkJkNk1XV2dLOHZLekdJb3R4d0RwSXo3cWZrZk1L?=
 =?utf-8?B?bE5xd1FBREpkOUZHaTk0TGFEalppeGNpZGN0ckI0TmZlNk9BL3czYzdIUjlY?=
 =?utf-8?B?LzJSZE84dDlpRFgvQ0kxNDdZUW9nTjRzMUhEbXBkQ0sxbWxkQ2pWM1NyaVFl?=
 =?utf-8?B?YmNkcFoyN0VQbTlOcjQ2R1RFUnZkUzhRaHVIczMzdEpydFdWdjZkVEx4WERY?=
 =?utf-8?B?VStOei9wZmYwYlVsTzhGdy9ac3R1UmpJRVY0Z0s1czg4Si91SFgwYmxiNWRx?=
 =?utf-8?B?bXVTWU53QmNQWXM2QndRTzZsK1BweEMxWHJIcXBXd3MvNkVUVjcyK1NGU094?=
 =?utf-8?B?bWJFZ0FMZFhqRlpuQ0FmTUZjblZ6WW1sdTgvTDF3RVYvbVhlamFUNkhPOTcv?=
 =?utf-8?B?S2FqdkxtVmY0bWNBditEMEVmd3dTOUhSd3NzRnZpTm4rb1ZUS3RmZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53eb2fff-a88f-4a49-d013-08de8b090268
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:26:34.6019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tt/IYAXYiAMrnddLWCKj3PdKJ+zF50fK6EfKrJ+QjHcTHur0+ukct4OXfSuYUwfQ2Pc0bHfD9ZfW+Lma81BqOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_002705_735855_05A9C842 
X-CRM114-Status: GOOD (  10.50  )
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

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there is interrupt storm for i.MX8MP DEBIX SOM A. Need to set PAD
PUE and PU together to make pull up work properly.

Fixes: 21baf0b47f81b ("arm64: dts: freescale: Add DEBIX SOM A and SOM A I/O Board support")
Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Closes: https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
Reported-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Closes: https://lore.kernel.org/imx/20260324194353.GB2352505@killaraus.ideasonboard.com/T/#m9a07fdc75496369a7d76d52c5e34ed140dcabfe3
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
index 04619a7229065be496611128ecf6848c9dd7102c..1471ff361b54cba05bb0e0734aa6e8d149309025 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
@@ -499,7 +499,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x140
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi
index 91094c2277443c1585dfb7f31dccfb27aa1bcc8d..b31e8fe95ca74500fdc459aecfeb3f4b573f4244 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi
@@ -241,7 +241,7 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA			0x400001c3
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 

-- 
2.37.1


