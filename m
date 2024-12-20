Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29830E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 05:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM9rEGXLpS0icxeAIg7IUjTukCKS+P+gVyJDo7W4ioM=; b=bzwQ/6eIvIrnCmjnCFkHT+opqU
	W4RBVx3bLI5f+EF9bRkGBTFA5PMQZ2uGPTfLQ6mbZLtKMXhewxIZmxve0Q6nOiGiaCyn+c0Wuvb0e
	+o/6r8gJJIRkETwkYWG6tdyACvNP2lWIGhmBoX97Y2+b33u4bG3MXoCnN/7qusBcz9HZSAViv2G2l
	7JTiO2kfE8CdHAQQjTbb9pRVeMV7Q3wwR81tc6HMT8rNNGovAl/vGtNZcEGFd29+sPR3aGslpQEeA
	/BBmc3pFjjNC2fDdN4/k/yPLGJ//xUCkavIV1c3vmCwD6qdUANulK1tovu9F3fOM+cSgn74jov1N+
	AcgbOfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVKh-00000003xgT-2EXn;
	Fri, 20 Dec 2024 05:13:51 +0000
Received: from mail-am6eur05on20611.outbound.protection.outlook.com ([2a01:111:f403:2612::611] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVJY-00000003xai-1yzA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 05:12:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIVY7tdYpqiH+9UGolNZFo5qUwKxmywGB/nyaxxoJxm1TqyLNEff6JHhyxUaEV9P6m1Qg4rW8zthOdCV+MubyIvhNzDY46tuuRdtF6FeCiklaBs/8UXecdcIZOKg2pJQqznsZ9Eho2sj3Wgs4zuox71N5H621hPr3EwAn1eiB+GxFxdm/XwypIkVp19uJF0npWwHYkREbCKUmCVKjUSTMtIJQMs8JP2XUyk3/nWrB5F9xNB4nYzjkVGtTtwnm80nqVYT2fgDa6bhel53OgH9Ysj6IEJp1fRlALpsIZzF2zWFDx35oUw1ixGec8M+D9ELbxe0yDP0p1/0Cr1Pcp8d6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM9rEGXLpS0icxeAIg7IUjTukCKS+P+gVyJDo7W4ioM=;
 b=op4QqDPgxU8NH/fHkqVK9LY0MAQ6Bf3lGrq/ca4/0rKFWqsDj0Oq6K+GyWp3ZXltyeVkRXukcPLYh9HqHgI623ox2jm10XnbBUOqs3qZWdkuu+rDHoEk9JKxertjDaf96uqhXsHDUM4iw8+FdzgmOD6hjcNtgX/yuZpexvu7X4VYk7a3M4h33yR3WGl7zsYKTKN8K4MwiChJTuRyw/7ySAkpWzkuTQk0G53pCGQnRILZuzql2iHZgyY5GdQKdHS+5ErIFHAF6M+lNPaljqYgLnTfoznSvT42kvuYjiAqSUIzNiE7HCdZKdXWKbUYuTcqLUW0hlj9wAPmvYDXGff+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM9rEGXLpS0icxeAIg7IUjTukCKS+P+gVyJDo7W4ioM=;
 b=llX8NfCG8ECQLedesWe4J1bbkK07msPUyviAFdjKP+CMKzpRNMiM9oheWCBy6lUvI3K8yHUloSXCn8DmetFtzfKig8lSCBZfGcITKolgwQyi851iJKtbOCoAdDkzMl74q+v5IOWbh0KTt11pP5uZlxTXlg972woU5ZTEcYkO28/1uOGyKr0DtJanLXGMxST3m7IFtK3aUA/+r2Si4nSodpOLN58QIMfWoBuX0PFza+jZVRyEdLJXEMXJ5FMLAcAWGWV/KhmmUEuJCJOLYtRV6geL9wZBCiZg8L4k/S9Mk5YjhiOEbkdOAR/5yWtoOkgHdrRuPGBhaBt2xBmdDtaWIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10232.eurprd04.prod.outlook.com (2603:10a6:800:241::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 05:12:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 05:12:36 +0000
Date: Fri, 20 Dec 2024 14:18:05 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] clk: imx8mp: inform CCF of maximum frequency of
 clocks
Message-ID: <20241220061805.GC8295@localhost.localdomain>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-6-cfaffa087da6@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-imx8m-clk-v1-6-cfaffa087da6@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10232:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f897408-55d5-46c2-17fc-08dd20b4eb13
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gbbC0jMKeaSY53/ac3a9p/LkXpwL+54Q/gBHpJphiDmMbY2KeLLerAO23B6e?=
 =?us-ascii?Q?sQzSp24llQ+wSa17m0gP8qsqsZ+lewzcvnw9Q6G3cN3Gy1sXrThiXsX75TzG?=
 =?us-ascii?Q?iAylwj8/mhodW3YRLxBVGFtX3xaQn86FWtYUCmrLlWDrtKMdiL7jcuuaKRn0?=
 =?us-ascii?Q?EaaqLw0bupRfzF5SZZE6H2q18d0wX9pHupgR6afnMGyAWjaM5IN8Kqku+6av?=
 =?us-ascii?Q?AvP1myBijciZStJr5dCAmkqcKrysqYHAxyoHF+XGkWB+YGiIhMu0Zm0aioC0?=
 =?us-ascii?Q?bJU2uvvKrEyLCsRUia+RS0NWMGfj6Umb33zkzP3Cb6y/xcpR2sreVpO48EXt?=
 =?us-ascii?Q?OAWXqeMt0bOkcMmIYkRbxoYm++E53abfXIC6pq+aRruKa50k977ALqAeM/Sj?=
 =?us-ascii?Q?AXWxtfJsDL7IXeK+mSUAk2TYMiMUOwe1GvzBoFJe8lTqfVYdx6in/xm+D3+v?=
 =?us-ascii?Q?Vx3QB+E+7WxZVoxtqm6tJYls9jSQ9Vwpbo9fBoVc0D+r9hMLkNUYCKo1uYkW?=
 =?us-ascii?Q?4a4VK98uqYqiIWKfl+hvVVRvFBzfaA/7E37ZNUVtk1w4kMqqc3lyJDQ/3wJY?=
 =?us-ascii?Q?97ZrB0Rfj+VQjEnTQuyGNXV8lFqLokSo9eA+CvyX/K2/8V/yQuf0D1OxO7+5?=
 =?us-ascii?Q?x/ZPBljEs6NJL1jfUxYcEmUOoZJGIqQiaxpbMHONSI6E+c7A4d46cPNJ+QLa?=
 =?us-ascii?Q?dm7mmzsFalntGxsMtNhnPzZXhGOAinEZYDMWhAGDQn/2aGr2Z545jNEZixus?=
 =?us-ascii?Q?xQno358HeqYD+NEDfbNofUL4GNNewlwWdRrSDr4qnW68P4oSGfw6rACY79Ez?=
 =?us-ascii?Q?rB6MUY1od2Hx6VyISpGKvWoW/n/NVe2AwBOtNJBFUNUkV8pkyr563crSnamp?=
 =?us-ascii?Q?0yXZGP9NH2J8mtmuvnYuVXnnBYUyv7L/vyUIcOpYcm2bLlYXa0v8OikHXW//?=
 =?us-ascii?Q?YDRYmut5MLZpHR5zphehEJxyfgdqoVabqeRUef4tjIGbJjAku2LzMWOifkHY?=
 =?us-ascii?Q?2p5NVPbvWuDGwUwEVJwLMnxoOGhu0hq8xH1XKbu2TDPbFRkevPenlA3eQII2?=
 =?us-ascii?Q?c5QVeWlrYG9GEvgaFLNQFVGR4o1oBK5Cv0IXJsxZe6qrpk2t3mWV26Z3QMXr?=
 =?us-ascii?Q?tWrZ5icfg5LFTFlPm4CWU7pwFBWl++wxrxG2VRZdBGHxltHhIERnxzIkIsG+?=
 =?us-ascii?Q?wPy+Jrzpq8MH2o9HBzfkSHUApUsF5g7931OgaTTHAA6dSS1ejhh0ip59004I?=
 =?us-ascii?Q?hufVHBINFEPN95CTG7Yo+B5TIIScWQMbVFgT1lvCLXJEVNMyQ+PIg5yc0wLW?=
 =?us-ascii?Q?gfJdSRhe3dOIEqdav5jrG2ml/yJHl2PeEkxOXjg84BABdP0mR3a46Kwz0jcG?=
 =?us-ascii?Q?7zpelNLQtdwqyKzVnRXQyFZYwhNMGjPftcmcsPJxeU6gULwPmgytRbeNhGNb?=
 =?us-ascii?Q?F6T/VVhs/+HinardJOEdbahV6uWTeC5R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bigRexxEwrMjFnAh5EHjHduXwc1IsRwYYVmIPbiULRdSEoGqKlW8uyCWiZSh?=
 =?us-ascii?Q?ylv05x5CDIoP80ugQkLuHRvXHV5NMQKgtyqsHeDTI3dk2UbbHQRRAwDxlpMi?=
 =?us-ascii?Q?Iz2E4au08IsA93dQN/PG9GrjuNON/Gn/wjQoiefnW3mNsZ3zq5q3Y5XF+fNO?=
 =?us-ascii?Q?JRcobmXJlyO9tUPDRwZnBODTlMCVDHEoW6FLU8dSCL+xe6UzANEQ38h+Eo+H?=
 =?us-ascii?Q?r1NOvtvFZGm7iq055GzugUpU5Cx4pP9kzf5e3jWEVVUkMEmAFQvgSSGZOaSh?=
 =?us-ascii?Q?Vuf/whhusv7aNOZ4SIF4OMfmHjv5FwoODYE0tA9FfdAfK3p3HvlheD+QbmNa?=
 =?us-ascii?Q?VSBDY8WN5F6AwKkWRDPdaTlhCQVA4wRNF/If6E9H8rfSIfH+HG7DCGnwuvsv?=
 =?us-ascii?Q?8QNSAuEkVSlQSVVSvjMvlnMg8d+KD3xXlmHoe04kx3JBCM4MdRp6s+z+fnu3?=
 =?us-ascii?Q?7Yt74TWasCXTnB2+JwmOvELq5QtTG63+3E19sPHbP1fKbiBCQ/QsbrDLiELO?=
 =?us-ascii?Q?p8v8HikVu5BfJZe2e5hb1sO5/GwsezCGLpm78MwXxp9+vj/d+1KgAAGrIPM3?=
 =?us-ascii?Q?E7zHGW4t2IMzk7ShzCOtlauPWbQYWi8QuSANo4TT5g0vmYcAl0uO3CzWrJGP?=
 =?us-ascii?Q?J2tsBXGjojXJve0lkr6gSzwqO2xsUqvVAfECVemhjy4IsrOUGr2wPd4jZcoL?=
 =?us-ascii?Q?3bDhouDKLzLEPVk9FQ5tAY38e7M6WKw/amTHea0VLz+ctW7/BmN430fj7CcC?=
 =?us-ascii?Q?8r4aED6RGSK6DB5qjjiFRQwCUZgrxP4CO9jx0DkkhLzI4hcHNxAxNVfBlT2n?=
 =?us-ascii?Q?FKVyOR4TmkO87MJqEwWISQukLYUAWdW3tTUQglCVIKWvCJk4H1l0s0O+nhUX?=
 =?us-ascii?Q?phTac0R3gLA+eBXGpGHWQzkKe//G/zZrj2SUcT9ssEzidvwp+gbyE/AHAYdH?=
 =?us-ascii?Q?MOjFWT0r+Y0KYyfsqSiY7Kf7uOWfdXf0FZFXOUzjsFgjKUsSbEQzH+Wm3pVm?=
 =?us-ascii?Q?pJqY4rxJxMmxRDxv7LjGhhQGewlG5afczMJ77wapPrlYXaiXMq+YTufsw0IE?=
 =?us-ascii?Q?XsgDdVHuwCOtEb71+jOgC2+oX3e+KEwCOyMZ2jC+K66pCA8UxzqTYlKqglqA?=
 =?us-ascii?Q?NAObULoyCLLV7M+G+BdqODAmSdJHpS+Wj+5/3ahKOmjLSr905gwCCzG6kg/T?=
 =?us-ascii?Q?asb//KB7ic3bOWApFS2rTZZY96mYh0rDCUV2XYi7RMJvbiMcQ9XlAc7Z3gmx?=
 =?us-ascii?Q?EwAMj7Z+kILPUzrnYPWntmKfAEtqZmFA/UslGixAcKpUHi7bdAicC5SogPha?=
 =?us-ascii?Q?z8p22mN/vvFzIbDMj3kgGwLzjA5EHYEWIpKkoTQfMKZXIjqgBo2A/o7ig2o6?=
 =?us-ascii?Q?iWIT6T+ZjOvUkjOLheXtFL5naQxzdls0gwonmF1fubiWINcAZkh+lbDJfsui?=
 =?us-ascii?Q?zcH/n9pTC6+/YM77IgN2DPpUuyMtRCBlyoWnKfgBYtRSDz60+Ob7k/N9HR+r?=
 =?us-ascii?Q?LFWA2lLRd8KLfH1vZ/HiKNM8KqJEVdH0j+e18znV3xvaQTfIwvNB+y099gw4?=
 =?us-ascii?Q?16lwfpLoy6KJaMZb7AjJK1KMmyvCFoPvDMY50o4G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f897408-55d5-46c2-17fc-08dd20b4eb13
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 05:12:36.8596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIlKlfBIOa9E5VW+E7aIg5CBy3Q3li4KDFs1qoyB8wiCs5iKuEY1JckeqUI6gSqxZGmM7jhh5mTNh4Y130We/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_211240_668505_2A2BE9DB 
X-CRM114-Status: GOOD (  13.62  )
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

On Thu, Dec 19, 2024 at 08:27:37AM +0100, Ahmad Fatoum wrote:
>The IMX8MPCEC datasheet lists maximum frequencies allowed for different
>modules. Some of these limits are universal, but some depend on
>whether the SoC is operating in nominal or in overdrive mode.
>
>The imx8mp.dtsi currently assumes overdrive mode and configures some
>clocks in accordance with this. Boards wishing to make use of nominal
>mode will need to override some of the clock rates manually.
>
>As operating the clocks outside of their allowed range can lead to
>difficult to debug issues, it makes sense to register the maximum rates
>allowed in the driver, so the CCF can take them into account.
>
>Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>---
> drivers/clk/imx/clk-imx8mp.c | 147 +++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 147 insertions(+)
>
>diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>index 516dbd170c8a..3b06990b73ad 100644
>--- a/drivers/clk/imx/clk-imx8mp.c
>+++ b/drivers/clk/imx/clk-imx8mp.c
>@@ -8,6 +8,7 @@
> #include <linux/err.h>
> #include <linux/io.h>
> #include <linux/module.h>
>+#include <linux/units.h>
> #include <linux/of_address.h>
> #include <linux/platform_device.h>
> #include <linux/slab.h>
>@@ -405,6 +406,145 @@ static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_
> static struct clk_hw **hws;
> static struct clk_hw_onecell_data *clk_hw_data;
> 
>+struct imx8mp_clock_constraints {
>+	int clkid;
>+	u32 maxrate;
>+};
>+
>+/*
>+ * Below tables are taken from IMX8MPCEC Rev. 2.1, 07/2023
>+ * Table 13. Maximum frequency of modules.
>+ * Probable typos fixed are marked with a comment.
>+ */
>+static const struct imx8mp_clock_constraints imx8mp_clock_common_constraints[] = {
>+	{ IMX8MP_CLK_A53_DIV,             1000 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ENET_AXI,             266666667 }, /* Datasheet claims 266MHz */
>+	{ IMX8MP_CLK_NAND_USDHC_BUS,       266666667 }, /* Datasheet claims 266MHz */
>+	{ IMX8MP_CLK_MEDIA_APB,            200 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_HDMI_APB,             133333333 }, /* Datasheet claims 133MHz */
>+	{ IMX8MP_CLK_ML_AXI,               800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_AHB,                  133333333 },
>+	{ IMX8MP_CLK_IPG_ROOT,              66666667 },
>+	{ IMX8MP_CLK_AUDIO_AHB,            400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_DISP2_PIX,      170 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_DRAM_ALT,             666666667 },
>+	{ IMX8MP_CLK_DRAM_APB,             200 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_CAN1,                  80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_CAN2,                  80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_PCIE_AUX,              10 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_I2C5,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_I2C6,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_SAI1,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_SAI2,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_SAI3,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_SAI5,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_SAI6,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_ENET_QOS,             125 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ENET_QOS_TIMER,       200 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ENET_REF,             125 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ENET_TIMER,           125 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ENET_PHY_REF,         125 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_NAND,                 500 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_QSPI,                 400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_USDHC1,               400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_USDHC2,               400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_I2C1,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_I2C2,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_I2C3,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_I2C4,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_UART1,                 80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_UART2,                 80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_UART3,                 80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_UART4,                 80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ECSPI1,                80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ECSPI2,                80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_PWM1,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_PWM2,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_PWM3,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_PWM4,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_GPT1,                 100 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPT2,                 100 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPT3,                 100 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPT4,                 100 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPT5,                 100 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPT6,                 100 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_WDOG,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_IPP_DO_CLKO1,         200 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_IPP_DO_CLKO2,         200 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_HDMI_REF_266M,        266 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_USDHC3,               400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_MIPI_PHY1_REF,  300 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_DISP1_PIX,      250 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_CAM2_PIX,       277 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_LDB,            595 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE, 200 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ECSPI3,                80 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_PDM,                  200 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_SAI7,                  66666667 }, /* Datasheet claims 66MHz */
>+	{ IMX8MP_CLK_MAIN_AXI,             400 * HZ_PER_MHZ },
>+	{ /* sentinel */ },
>+};
>+
>+static const struct imx8mp_clock_constraints imx8mp_clock_nominal_constraints[] = {
>+	{ IMX8MP_CLK_M7_CORE,           600 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ML_CORE,           800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU3D_CORE,        800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU3D_SHADER_CORE, 800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU2D_CORE,        800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_AUDIO_AXI_SRC,     600 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_HSIO_AXI,          400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_ISP,         400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_VPU_BUS,           600 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_AXI,         400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_HDMI_AXI,          400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU_AXI,           600 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU_AHB,           300 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_NOC,               800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_NOC_IO,            600 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ML_AHB,            300 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_VPU_G1,            600 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_VPU_G2,            500 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_CAM1_PIX,    400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_VPU_VC8000E,       400 * HZ_PER_MHZ }, /* Datasheet claims 500MHz */
>+	{ IMX8MP_CLK_DRAM_CORE,         800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GIC,               400 * HZ_PER_MHZ },
>+	{ /* sentinel */ },
>+};
>+
>+static const struct imx8mp_clock_constraints imx8mp_clock_overdrive_constraints[] = {
>+	{ IMX8MP_CLK_M7_CORE,            800 * HZ_PER_MHZ},
>+	{ IMX8MP_CLK_ML_CORE,           1000 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU3D_CORE,        1000 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU3D_SHADER_CORE, 1000 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU2D_CORE,        1000 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_AUDIO_AXI_SRC,      800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_HSIO_AXI,           500 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_ISP,          500 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_VPU_BUS,            800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_AXI,          500 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_HDMI_AXI,           500 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU_AXI,            800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GPU_AHB,            400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_NOC,               1000 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_NOC_IO,             800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_ML_AHB,             400 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_VPU_G1,             800 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_VPU_G2,             700 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_MEDIA_CAM1_PIX,     500 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_VPU_VC8000E,        500 * HZ_PER_MHZ }, /* Datasheet claims 400MHz */
>+	{ IMX8MP_CLK_DRAM_CORE,         1000 * HZ_PER_MHZ },
>+	{ IMX8MP_CLK_GIC,                500 * HZ_PER_MHZ },
>+	{ /* sentinel */ },
>+};
>+
>+static void imx8mp_clocks_apply_constraints(const struct imx8mp_clock_constraints constraints[])
>+{
>+	const struct imx8mp_clock_constraints *constr;
>+
>+	for (constr = constraints; constr->clkid; constr++)
>+		clk_hw_set_rate_range(hws[constr->clkid], 0, constr->maxrate);
>+}
>+
> static int imx8mp_clocks_probe(struct platform_device *pdev)
> {
> 	struct device *dev = &pdev->dev;
>@@ -714,6 +854,13 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
> 
> 	imx_check_clk_hws(hws, IMX8MP_CLK_END);
> 
>+	imx8mp_clocks_apply_constraints(imx8mp_clock_common_constraints);
>+
>+	if (of_property_read_bool(np, "fsl,nominal-mode"))
>+		imx8mp_clocks_apply_constraints(imx8mp_clock_nominal_constraints);
>+	else if (of_property_read_bool(np, "fsl,overdrive-mode"))
>+		imx8mp_clocks_apply_constraints(imx8mp_clock_overdrive_constraints);

As I replied, a boot parameter should be better? the mode is a soc level mode,
not just clock controller.

Thanks,
Peng

>+
> 	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
> 	if (err < 0) {
> 		dev_err(dev, "failed to register hws for i.MX8MP\n");
>
>-- 
>2.39.5
>

