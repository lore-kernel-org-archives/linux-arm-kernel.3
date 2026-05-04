Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B83FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzhrrRxFqUqohnS7p3Tx8+ePbutcLdrDGLJOgNh/+5U=; b=M/2DInjncuPIJQXAnQ8iX2qBjs
	KL1qFKho9X1kTRucdw0Xdkx+qi8Fu6kCG14waTX/PttVlo22aWGt3LCKjRWElizACh+zPNEd2IjD7
	FR9MoJZnDvskkLudHVMnCFXiTZg4oyXpcddD+zfWmv3n1xNMb0jVjhjPRfu7QW/qPSd9r68L2ioxx
	Djd/VmDp4BhxOWL/9jC9K+dX51Eb/pkX7hFwTMQiMqPZtcWVZLqS9EOuuDUHuDqWikoGPc3w31v5u
	v3Ezrx2sYOBY7Eby9j5CIvaMdaeiK6gTYc/0pVBQWb1OKy3RzXw82iH6btt9d4m+fGJvX20SjfXSA
	cyqw1WZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJscq-0000000DBMn-2Ty5;
	Mon, 04 May 2026 12:42:16 +0000
Received: from mail-northeuropeazon11010056.outbound.protection.outlook.com ([52.101.84.56] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJscm-0000000DBHB-01ak
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 12:42:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsN+n5VRoMo1DkvMEEWot9HUdB7tsPMq/77CyG7xTafsAqtBjlMzettPiqdZgx4c/hK63G5Hj6ziAJBW1pifoLThx+QemmHZcar9UcbT/fGxOPYl2jHXnaP52eSHyD/dGdfDfTqHPRf8ulaJfaBX9yy1VuqkRVoZ2Cz8FXATeIKVatPi9V14pUjIfzKChg/ZU/bd6kfJuu0Nf6edY0IZVaOeDgIjY4t175gTKIfYPQqV9SYpZaKe9YnNqQmExC/F0DgmBTg4E73ZgcFdl6qgCvTli13n8LZOX8hxC3et1i8fgLLhGpdEpt150mU37uMETv16ckAwUdg1e08+q+h7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzhrrRxFqUqohnS7p3Tx8+ePbutcLdrDGLJOgNh/+5U=;
 b=jJC4raI56SVro3CKPyCP9bsNoL50QFchQ6h+qyOky1YPlIpzDxjBPhLQABno/ea7LZQo8IqVC+yJ1zg5hLVUYZzvX0aOHJ5qBAF21bZboGmaeyIbApxEeHNoo/ICAdECdkA54nAW7Jf120gxXTvQwzAOzqwc7IVLP+nQozl0vXPDqaQ6O3+xSUbrVTadgjtX4ipTrJmalqzjlHqTKZmXUhBY0XormIyM8KvKDq8CI7GbigKhV5huAg5B5cn+PbrAa12mo3KTGW2Mop+ZJKydyKtWJ50bZ4MYFn701ZgtEqSwBtPolustDz+ny50TrPFljJceCsJRqsK4fzNZ9YCVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzhrrRxFqUqohnS7p3Tx8+ePbutcLdrDGLJOgNh/+5U=;
 b=Lz4t4g7qj488jK/xUhlx6BDmvPadIZaunbRRN5NeNGuRJjpqmHfFUdJgXdDjE/OBVDdXWT0CqDJT9Xq1rAdwQi0PW9Xx3Zp7kVwZrsaQC6EMfv16PxpJV/0FdqRptPrEQDLAfRxd6WmXWIyVUx5FZtpe80Oi+Y0R5bjvd/+5+qhAj0ea8EscB3hBk85AUkODmLQ2YBVJ1bSbMt+n+xuHh7Ngn3jIXqckMuv8P7Bpw4z96EzcoIwxp3ijydpqZBkobrCe7tMhn1SU2H7ux0aHkb1OebhjY+NLuAvAkTFtvvB9uu0tCd1zCKThCMAp2WSAs2j0aXlPTRyHOiG2cD4aTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA1PR04MB10360.eurprd04.prod.outlook.com (2603:10a6:102:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:42:01 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:42:01 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 4/7] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Mon,  4 May 2026 14:41:52 +0200
Message-Id: <20260504124155.3615001-5-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::14) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA1PR04MB10360:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca26c7b-0271-4365-bb61-08dea9da89dd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: ExSii+MxkC9dyHEbQ4Ygts2KEO3dYw6vyOPgdyiuugnce2CgkWr6wBaYOEudeNbUgr1H8oQ+Ow2YELiclNA6mgcu9KwfbFwYykQYoBb6kCJlhtfd+qoCbHziICjFlIqOddoN/lyj+XKCxkACTi9Fe7ZaI7EYeD0/Ib24CPYV2BXFLQWc0Alr3Ak/iDvJie7RfeCfkDwXk39ApXeqyiUGDuZnMDFW62P2MY/mqWI70vtmu4aGnVYwdTWAzAI2XKNMRwu1blyODNT8mzS7gJIX2Wxwtf2lOF1I6KTuqyUjly2RxKaUydRSK7K8sVINMjLBCmeXrEx9r3ZDWbqU1QMsYNUzciO8wYBnP0wySF3eLaGfyOPB7gzCpVn6j+gTfXsXpSEPFI6LlyiY6BToC4hugOhHTPxFbqVXyu1zw5QXRR54f97RXUpgg+ZH+l2UYbGHN7IdFFnchLlQCdFfKInimJBpolrjaphpIxOJWdnkKjXfDYSQvThSjccdxUn24kcOWdr6CHD7PqGEjCmoI/pgilik7LG3Le4tXUXwWMNyqONUnTkeyIrNEi+0yzQd/GqYQl3pq2hIuXKE3nj//ihA7OsrOdOXCmGOgbaqM4VCbL4Iqv1VjyhXPEojL3Omdf6ocmggSmz7b6ud11wVJIfSGY1OC593D4zXggI03AtAUK8zigPzMcVlr11R2Vz0jok1UFDwziQGTcV64lfDL+/JWRr5s1VkmQHglzsayLCKnLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GDbslfoqUYk1+CvggYNU12eYvJWoJfTnYVs5L0NNh40L3Tx4F0Q5Avyx+aZa?=
 =?us-ascii?Q?TdrYI9ovabpBHljb0TuFkRdI9gn4ZRD9qhHD9VvnyvNdnZt1DYIVCkK2Xgm7?=
 =?us-ascii?Q?sINS+fu6HO6J0Pxr2fSXT6PBtLrrhlURSYw1MI3MOtDHTkpSaMDB3xJXK8JN?=
 =?us-ascii?Q?JB5miahn8X4KV5mlEDxoj4Xne9mYKmtKTFu8nlQ34fHLvU3N8nUusTlXKXDE?=
 =?us-ascii?Q?bpm/eOMr/tNBtJZcva504L5+koGAPDglaAIm54NcuWAEc7V6NBimmKpCGN37?=
 =?us-ascii?Q?3wM7+WcgD8/FG6M9Ff2eOxTb/LIZzYAojNDB/SM8bL5b7dDeK3GZbwmZ17YG?=
 =?us-ascii?Q?KZ07TCgLlXfA6tvFIBgTsf5F0BImwBFT/sQW+N6JaIM84BmVWR7H9ZnArq96?=
 =?us-ascii?Q?INcC19LsOldMbkTjxNbeJ+w/8/esT7CFKyHUXEp4iUAMjilnNzFFQH/NprQg?=
 =?us-ascii?Q?I61zkAYLVeuIgnV3C/2pkSAWuMSL+8OpURqjh7ZDsjcJBDeNSscgrQZa4pS3?=
 =?us-ascii?Q?TbKpiBTqOBYeiGlXuFDcIUxVIMqov/AChqNe9lN0MVlx+C6Yjb5ac9ZShrvU?=
 =?us-ascii?Q?Y6XbTxBriU03jxKKg3wBHo5CQtBxyZeevp00tJXxipio53jcMWScjjBg5sCZ?=
 =?us-ascii?Q?c9gPet6Gnub6zUhgbC5J8rJVFBpp9iL5odL7m3ww0u/VscTUhaQPDyfP8TsX?=
 =?us-ascii?Q?zT0mkh2fo+CJbTP+YJWtjXd7u7Ph+yoqU7ZtWoEBJbFHiEWgQTcMC058DNkk?=
 =?us-ascii?Q?mvGi4tkmsWRmBylQ/8ijykq/bnk36uQ0AFcJ7VfXitVkcvHpYAi36rwArM9B?=
 =?us-ascii?Q?2OJTaSSFvs/d2u9oJYQOGMdDxB0mU5fvXiUuFoP2I/oCAppjWOm2byERgbDu?=
 =?us-ascii?Q?ne9KUMd2XAfRm/OLeft8cBq5/MsDRmMgJn5N6eRw/n8j9sdOxxnA5IegsH1Y?=
 =?us-ascii?Q?OymWUgXn/NqJrqTAGTsByOJNdJrsJbOsGy8iF5XMkAN5X9roOMGLQI9aqo6C?=
 =?us-ascii?Q?fzzunMMAN2GVO1X3Dg+ZK+reMbFi/7zYMK+Ar1/n2Xv4ZeFxUn2Y5CJem5pl?=
 =?us-ascii?Q?Ydyqgod/idMV60IJevg+I84a10lDqFKBoPOrg9uPv5C7uY+UYaUqaXypDz/9?=
 =?us-ascii?Q?86T7fI+A1yaXQX4t/MfhygPURX2g3p/9oy6TbmF+rbR+I609CSUHyBabkVbC?=
 =?us-ascii?Q?1YxaZ8Pt2JRfMUrkzvIufiJou5ErwJ/OYCB4xtfu5sYCqA98+a7NCLxpvSiI?=
 =?us-ascii?Q?e3FskV6JHpzHrHZCFNCi3qEXWYZiB/T0Yw+k8S9iBrcwPhuUGUomgYFRXUa9?=
 =?us-ascii?Q?IPVU1BmTS/FMVC0lFhPH37a20HKGSkWCCcxHhqhq3GBIxBbSQuMlNLVVY8zz?=
 =?us-ascii?Q?spt+YGeeMJPi7kOvmAHuII4pQ+PKJqfZhA/Mzosi+zYl6O6WmRwiyazvBpNl?=
 =?us-ascii?Q?e2av88CpFj6Jzo3iLndFrv46WSZIkrJbth5zdy9TrgKJQPPxgbEHdkXy9/yn?=
 =?us-ascii?Q?1EhKy9VI5wZvG4awcvD4o1pBdVnG08/Bp1mY6Nagn2P4fV0z6haxtWuGje81?=
 =?us-ascii?Q?8CzQOTEHBKMCmDY2fZxf3CYOHjwIk+kcCGHyU80hq6BrQwhcy3aC2HpWoR05?=
 =?us-ascii?Q?G24yCsBSFEk6Q9zQPMQfrAgIbhPzm7uwlU+wOGEV4VO0qvAv2UC4UwXgIgSL?=
 =?us-ascii?Q?NC9Pt8f7z8avw+mgeRDJSEJwgAJ1FYqxH43Z8lVDESNNaJ2PL6gf9uOwuFF2?=
 =?us-ascii?Q?13hnotN8EtSWi3u536eQW2U+aHcagaexzRcQ9x0q5Y5+HcZ/Je7W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca26c7b-0271-4365-bb61-08dea9da89dd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:42:01.5285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sw76vBvYQCM3dQU5rDg4HZzhfFK+Aux/jf82lMduC9eHAhDQS5Q7Hu/6Aoa4JgBd3w04nybpeOOCJ2oerZpFr78r5UPH6OGWuJKslqmJhGu6y1JAPsDyFfYKOFRW0R1G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_054212_046322_EED5396E 
X-CRM114-Status: GOOD (  11.27  )
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

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 1c95e0022020..27757f2c5570 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -974,10 +974,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
-	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
-					    ipctl);
-	if (IS_ERR(ipctl->pctl))
-		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
+	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+					     ipctl, &ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
@@ -990,7 +990,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
-	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to enable pinctrl\n");
+
+	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
 	return 0;
 }
-- 
2.34.1


