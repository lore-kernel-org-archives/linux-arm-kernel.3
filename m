Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B375C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIPKtroqZpvhXYpTbpoPhGwzmrUHIB7e89/hThOd/hA=; b=ngxrjVnpOnPcGBz/UcLixPf6/9
	O0z+hUCegvr9feIIJLWES+elmSw8R2VsARIh+UYF1LUZR0nKlX7ApVtDAJkdNqObN7T7wyhULlxK0
	4KGbmLTs2yPW97n6m7nx/Sb/3cw9OYmsV/BdTK4MqECtW3AUZqpHl0H03UxmSwewitjoqVjoeywud
	EgZqgF44/kF1huFGvdhIABMsFW5gDnYrWjugICek2WJWakkZ2PtYQ21zrM49NQaBNhm/PccmNPFZd
	5tiDvE1mWoJBwF0Yv7lhuvC3u6YIF9+nJjNO1c9oplFn+zbtoKsAiQJYGq5WDqEUKvqtgiJnsTx+j
	nM8hotWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmipQ-0000000DBlj-1gAa;
	Thu, 23 Jul 2026 02:06:28 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmipO-0000000DBkL-0nWf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 02:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNZcSfBvVDDo5hU7D/DC7QOQUSQC7IKdzBOByv7mYtnes/6YPZKbQh1Hz3f14ldOeE1y6uo6WdF/dbhz9IgqTrk9mG73sG48WYVURzLnTSRO38al/aKRdUstJ1SlJ0L/BypRDrgSVxRHEjKwTPmb60OMknGHAVo++MYKITCQwB8Uy1bzdTM2lhPMHtXLeyjStWB/JLTMK5+1hSotbCdcgKf22lp1PEhS7LdAe1HpjV1m9zjDe0cTeMxVPAHPYulGX57jIDSKFJI60lnaKdS8MIt7TpKLlTKFHeqV7Uq1O8suhDFoow/MTvuTHXRoTwiDQUHmo25t0L95mO9AnmTizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIPKtroqZpvhXYpTbpoPhGwzmrUHIB7e89/hThOd/hA=;
 b=EZewqSkKOC1xYgoeqhQ5BjMuv1ab6Wub8pZpWukEzF1xrXlZu9PA5wkHfhEktRg88BS9ExpUP/pfuPKVoBU2VRBTz9V7WhFqJ/l9qpC7ehoVxTo1fj4BqxqNUZFgPIV3pMVcKVYfZK1Kn84Ry2ps5Mpi6xb2zx4YwjdU6ifDbVCzcqgi720YqbjTnh4p1/rI2VEw9oU11CmwEr12wTUxvBI6umiSEMJLTo2SKJoInk//788UO3F3e9on0Ovms4Jz4XifgmFqVPq7bgs0to8rFgqpDIFpWV2zABrF4eiSoETIM6J7qKwE005XXeeLCqAQmGAHh6e+LBGA2p9nwUEXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIPKtroqZpvhXYpTbpoPhGwzmrUHIB7e89/hThOd/hA=;
 b=kZ5993Kxc0x9GAkXyMi/Rlqxjz9VT8qD5cSpwlFgO5+W+eYzO1wB8rb1cRrt1RKMVeFitn5FAfEqkdf5L62SaLzsz/DGgHH4vexAWSBugjnqib0CFMybP2xGUdamD3sN/C3Vg+YIMKQAsS6E6P7DlawOYRS4qwJWIEqyQ8noweRI2TRs4qKFaH+BIE2tNf2ffUAXPvlzTieyR6p/W6ueAPgf+J61s/kkreO0CAfrey2sTwXBkro1IyR7IkTkFjGclq4OD42AI8416lzsls/1R4DvyNVG70F1C9OE7LueJT+8DjjtSQDsF72PKRwoPR4S6lsUniEHchf7iz+rRh8KUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DU4PR04MB11053.eurprd04.prod.outlook.com (2603:10a6:10:589::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:06:22 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:06:22 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: robh@kernel.org,
	saravanak@kernel.org,
	ulfh@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 3/3] clk: imx: imx8qxp: add soft dependency on SCU power domain driver
Date: Thu, 23 Jul 2026 11:05:24 +0900
Message-Id: <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0120.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::6) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DU4PR04MB11053:EE_
X-MS-Office365-Filtering-Correlation-Id: d70196d7-d20a-4184-5198-08dee85efe14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zXyLZP7FozDG8kJ1if3lvWZezhVIX9k5OyvCzAU3q6derSDxHS9WXJaidtKCUn1U7kx3DExMjkyZcLucY2PbZvaAsy4ovsYsCR6Eu8pnqsapoBGDu899boCk1I9pHCYZvIwbS8KwviEBVZggi3Sjj3bXv8C8WINKTbjQDcEffju3Rb1RMfTYC9RCna7u41Uy/fl6PfrewS/v2t2AZYjeMiL/mIt6UpQfY86SPWDum9u40dDftWoX+urK4Z5y9nMzzoNzK9QBgcri3VBx60cBZwG1SAt5r43i+WRZkQw53AjJTfC/8QKJspr5p0YJTDswUENSOAvzubgZC23CQb/AvAZOTD/JoM4EMU+N1Pd3KuZIMHiRGue9GM2ap1zFD1rfnjBWaEkTjbR2mJb3NcZN8IDl1onEJ52+O1eE5Ifnk4ARGBYT3dFNoGUyQyiqL6bnR11T23VdWslAToLD5l6XkW+eJ1XXWHY0uWfLOPjzJpYAjf9pbjPt38BdjmJDzdBvIup7lxPpY6nhNazvlUz8xwn0eDP/5OMuqP7s1DBQEt8Zrt5ZP6mkVm8jdiT8ZARqtlzEjogcUGefRCaZSbcqVCnLfbMdn7hoxD9qCU3raIW01Tp53fVZLoqzXiIBttLYfcj8AXb02oLSDbZf3fMXPYaRrQXQ+3Y4XAiUWTO0N20=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IrP8Ro/MMvudvprwGZeuKNsdJt5r/Bf5V53HaIcp+LUus4TH/QueZ0yUy+j6?=
 =?us-ascii?Q?K22+euxriPS493dBkBfi2aU+xu+WIDCo7b42sfds/CJdSbW1PliCTnjIXr/H?=
 =?us-ascii?Q?1YWupi0KuzDlaV7fuiJ/00YXB1iLnafh+fBJbFC2KhYcGSYQah1EdurDl7X1?=
 =?us-ascii?Q?YXo8URbbyzfUvBqkKwxShZQmTvZsvAh/RdKknKvv2MC8S+uw4Gs0vFsHeEzL?=
 =?us-ascii?Q?PBIhNLgysFdYKToHbbLrm65grnylOAWBfCAFyIw2/KfMoajJZPGlD32XjCkT?=
 =?us-ascii?Q?8f63grIPuhytBjJn6j2CKKoXPaFhE0GYaW/i9PcoI2Ze5yfZbN640hKECf9q?=
 =?us-ascii?Q?JtoqHJhzUVsm+VHZpD2kuIuEWxFeP8/5TLbKJcMwr0elOvkVPEOziRU2ZD2G?=
 =?us-ascii?Q?4gDBAdBTazSiLBGg9GLIW17+BgydJmxhSn/Uk1djTJUWBnJMy4HUQM/o3YAn?=
 =?us-ascii?Q?3UtntvjKgB+I3jbTOg9sZU01VzBTN/ajivx5NS+ZBpex0Mv3g3UG2ciCB9hA?=
 =?us-ascii?Q?CuHZpGuyUAXACfOKcjJquZ9qU2kD6KWqCFJEqfOvtPBapfWSI1H5mgAedGn8?=
 =?us-ascii?Q?6i5VtpZpWgyRx9jTLL6TQQnS/JROUzRwQPoB2BqmvQtQ+L1Y9+le0MwmkBRX?=
 =?us-ascii?Q?mNZMMshWUjT6LvjWlpF5IqvliGk2t7cyQk3tpNcqPoIUiVHYPYAqne9W62Mt?=
 =?us-ascii?Q?kGI+cC2b1IVMzwhvy28Qhz9nH72d/IZjnTwiqxqiyU0qnUt1Pr+X0iVS4dym?=
 =?us-ascii?Q?sZvQud8YNuwxAwz4rW+bfGQTnV8Q9uJRrrUVs4PJzvIlHNG4Gv8iWe7RMDH5?=
 =?us-ascii?Q?1jHioEjHdAQqWH8pdw2U6/p5b0U9/Y9FICuvLIpAqYWAjYvED9FSffcSw8xo?=
 =?us-ascii?Q?iF1kSneKO/Q3Ylfq4DAQ5LQcef3j+pzaOYJjYI9/xpW/NyCDkREKzehXghtz?=
 =?us-ascii?Q?kNvAiPjcMFonZY9QxcDqzTsffXXbtSDwR6tc+pXpSe/t7QR90f5I/cxvV3CR?=
 =?us-ascii?Q?1R04zfmrcwjHE0dabJsL3AEdBFEP2gHzCHHrSs+kj+1N+hdTSbMVBTUtpTq4?=
 =?us-ascii?Q?ekTTC6VDpLy/uua2ZsCbhiWYMCaFA1+4k4EtGVWtV+ufi7KcQK+2Kahkw07y?=
 =?us-ascii?Q?rPyPt1EZ4cneBRt+pH8jcyo7yBtZUoVayh/hBuUC0c6ngknizHXYH8sAGz8c?=
 =?us-ascii?Q?H6iIGwxrBSyZL8Ljl5SpevJQjYHjrQWtd0xWo3uoCmzKVbdYD0pbNHfzj4+W?=
 =?us-ascii?Q?ORKKD+w3crWxUqqnfVeIJzZlSL1xrQyyATeFL/rghTgDP6RDbq7vTuLYOWhI?=
 =?us-ascii?Q?u2oWFFjpHFPcsVnvFwHwgcIarle2mIcEa85qTPxoqHdQtpLyewF7T0y3EOip?=
 =?us-ascii?Q?o49aixLomgyMFCMtEV3b5O7mLONoXeVR+1vFyd8pn1MtxZU0c0y7jp882P2M?=
 =?us-ascii?Q?zqesxsBDfrT/ki82ozyMR7ECNVNNFtgul9oBoMZHvup48XYc7GqlLU9wukLG?=
 =?us-ascii?Q?m8vVSxNRCM1NhaeWMczFrjlM1vbFn/GPaiw+3O3AW+g+FzFO9tiQjyIb3EeL?=
 =?us-ascii?Q?A58dMK5r+GBWteiznPMOWl1ny84Dw2WH/UVQ+78xbYkoA5+KIqDqz/ED7PmK?=
 =?us-ascii?Q?bZ+VAaHRi/CwMr4ftgwBF3OonDnyWbXkYP3TMBR2LBkhsL1thEp+gEvrbZdi?=
 =?us-ascii?Q?QImOV8V24qQtkioUdM0EfKI59P1vc5WIfPX6t5P0XbLZnpD7ABULlBkJuP+E?=
 =?us-ascii?Q?jEJ7tbLZL/PhXpITUHZYX7kDlNaoP165HUaqVh4Ruovao1O0aP16?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70196d7-d20a-4184-5198-08dee85efe14
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:06:22.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iOKP4s4tNkHME1zhbrHLjPaTKOd57n9QAxTZPKePVTejjM+rXZ/IG0GQcQQ1UWhVZfMqfcBlSHwM3A5JN5a2+DhVXmO0Y7k9FV/laXd4wVaL18EVSnokWbzH4IeU2fE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_190626_236903_706ADC4A 
X-CRM114-Status: GOOD (  10.19  )
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

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

The i.MX8QXP SCU clock driver manually attaches power domains to each
clock device via of_genpd_add_device() in imx_clk_scu_attach_pd().
If the SCU power domain provider has not probed yet, the attachment
fails silently with a pr_warn() and the clock device is registered
without a power domain.

When both drivers are built as modules, there is no implicit
dependency to guarantee load order. Add MODULE_SOFTDEP("pre:
scu_pd") so that modprobe loads the SCU power domain module
before the clock module.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index c781425a005e..17302ee628b7 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -373,3 +373,4 @@ module_exit(imx8qxp_clk_exit);
 MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8QXP clock driver");
 MODULE_LICENSE("GPL v2");
+MODULE_SOFTDEP("pre: scu_pd");
-- 
2.34.1


