Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBC0C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 03:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmfQY6nGpykYvyIIoKOPoq/jItfrTOLE/rItYuH+Doo=; b=UKPdojZu6VW3kS9iRk7AMOweJ+
	FeNRq1QP3eeO1XSgbP78/rPJZRGLk7iYPUX2JIdI34g+CUcqiR60QZZ6nsvLiS6V8VKILa/H1EjJD
	ct18YDQ7b8e9+OMQwEVLnMwWjH8h8RtK+xaiID4D4mmR74WVNR0JoJL+he85zzoTyLqiiu0tsv4RN
	MjzqsDBLXXr5Gth7GFg5hHAn2BdQD5YwNw/BG91UQjxbZDhTnUDwVcVoIBF+aO2uk1vz36rjsavA5
	t1kM3yyO8pdRtgoEMp1lEyGNi1k6BszVjPxRmz5ZowvRI3iED077cNjWoO7dokNCy27QgyYSVfFLZ
	hVUe6lEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNYj-0000000Ao72-0qWP;
	Wed, 22 Jul 2026 03:23:49 +0000
Received: from mail-northeuropeazon11011070.outbound.protection.outlook.com ([52.101.65.70] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNYh-0000000Ao5Q-0FXg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 03:23:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIokfU6Gk+SQuXpoFsvGG2x0XQLlXsEyTprRUuY8J9qwson6f0EWTVbIrOs2P7sBaS1+5B0IAhEP53nun7EyjrKNIPjfieBeuFB6w+2VgEsxq5ukxNtePo28V0h/ZxTmjYmbxqgXploVXGC6gtoj8F9lgvtmGCaKBqXAo4FvfZfJPXL6xyXHo2pgRT3GMKkLgnwT5KzZyfklh3o/bGKYz5ENkUN7L9iwmHdZMskBmOmF2P5+MCTD8NX+HTSc5Gat7sUKnXlFT9ul0qsiFJyLF7geMqKcK8BpsBFQbvAEBONZtVbjzJdRJ+q3sionLFgvM5UA3wIDW2t/YnOES5Sgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmfQY6nGpykYvyIIoKOPoq/jItfrTOLE/rItYuH+Doo=;
 b=nWX6G4qS8tHJI10k9TmG5bJhdLKiwnU8lCvUstx6zsiRAWHE+ODtu6qYK5LOZk+1qzWgX5J1vr7/AzLUIBP0cIXXjv+pcoM3fT/aEG5C/bMcJ9uNjCtbB7/01U7LLvpNZehqYaZE3Hk+6p6CmGVZbEsdHxpNtM8mn3oBDX1QPmhNOs6TtFziv1IniijxQRn6ROqCtG7LefA6eFawC85y9xP0+AHOW4o+AvEi5WqlwS2GVEktwK2VNW1m0ZTkbxqRS5JO1rvCccRKxdXm3xjmH2IyDCmQnHObOc1Hc8uHZC707wJL+36If5iI0zXw86nrKAlhpSIVL7/S2nRI5KQe0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmfQY6nGpykYvyIIoKOPoq/jItfrTOLE/rItYuH+Doo=;
 b=ljUb4D8cjM3kjs2NULPtJjFipXhNZmhK1w2BsvaPpcFT02mMA8G7mHwVhF+/C2LDI7T0U3JYLv6UdPY5YHoEQ7OvG1cHyua2LJY3/hQoBEasuY8MoW1+jTUAP+X5+mk59fl4fwmiqf4B5XFsXabGr66par67NSzfVV0rkdlNWcLJqHb6k6+gCUqHk2uXCT30DQUswMNaeTD+aWJotp8Qte6wt8ilL5jTH3FJOLP0kfr/4/K+4Kl7cNWv52K4UKGG+M/WZy2A7C8hz5s/bKtXhrYPExbt5Ze3b3eHkArhvSWhzGcpV305ouPmL2AwytX295znDXXD829WgD4ZMDAUXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AS8PR04MB7719.eurprd04.prod.outlook.com (2603:10a6:20b:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 03:23:44 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 03:23:44 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: robh@kernel.org,
	saravanak@kernel.org,
	ulfh@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] pmdomain: imx: scu-pd: allow building as a module
Date: Wed, 22 Jul 2026 12:23:21 +0900
Message-Id: <20260722032321.2693300-3-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722032321.2693300-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260722032321.2693300-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AS8PR04MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: af23f042-cd38-4c3c-8ded-08dee7a0a1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|23010399003|6133799003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: I72NP0scmLQf8tR24yOzUF4pNyCWTGNFuSXD+iLfR1MyD5ZndhgQtPC+pIfRJG4TfcKcc8o9Rwya/ltjhweKf+E9d65iGCVs2gY94IxLwjdSEM8llzyz/W7TradUX6IdreudzweHpnFBhbipRxtirD0NtovqKQE0KTTqN5YubjrJGPHkFPJWMUi9KGLqA0qcHW/lFalzcc/WH1EmgjLIshpIURtguNlqb/3fVn0e0FzLgKupzTAYnzMSnC0LaV6AY7s0Fh97fOaMbxkhsDCFfQiOAcBtuhiaORy6tdsPX1wczk2spIsTd3VnPELTWOk+D5d5CWLm6+UA7uXgoTurHZ7WQzS23RQJumEaF2hklGiGr75Blm/nSg1eSdk0bG0akhJganysry4wvdR+hATDzXK3SET2iwcEfBvZlPi+bX+CopDUYjw1i5QOPF9O+JwvYJOU6pkvJVBzcT6KQB39PjJ9hZn2PMP+RSjG4rOElDuSCmwFy0LqxLrqka9EHiHj++PgqR3IaJvBYTmtCg+ZjMLHr5IGKpa3ripv3aLEIXp2OZmHemEa+Liy8uRcy7MEXVPUQiMr8qQXNeswoIBamzTMNlzjj931lTHuHSugaIGDwJ3OJ4hYow3D8I3wcmhYOf5r/bzXd6cHF1JPXCt0heKMdpsd6qVs1fT9F+ihk3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(23010399003)(6133799003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7OfOIxqNtAWROldEtkbCq/lUOcdNoO+QNJFQNXkE/BDsIsBvcpTphR1IDOb?=
 =?us-ascii?Q?pQpyccNno3G9hHNOuZW3w4OHA/hc1vZjQ+m0p8zLwS8dYySXex9Zuhk10jXa?=
 =?us-ascii?Q?H+0UK7K+Kvc9brcqOv8btPjqcw/9IMEYafgzgA+YR+IAbrjoJRm3UdsE5Hqo?=
 =?us-ascii?Q?cZUr9O+u1zMkKzYAw657msjOStMN+NfGIZqlc3imp+L51EDw1bObu6RSl1as?=
 =?us-ascii?Q?mVESUsmCW6311K7sD/l4sMtXIWc91Ah/I2R0CydvI4VCzwzfutETR+ZUJYA5?=
 =?us-ascii?Q?KJC8kizxHl+Z8Na5+Z0v6tjuYp2VdWy2PH1BigOFA5AYm0sizTJQOmSe8Prf?=
 =?us-ascii?Q?i7I6lRR/RiO6/sBTPc0cTkF0lTNNsbPX7b5Lgg0bZkY9Dl0To7XfTPE1ss6L?=
 =?us-ascii?Q?Xh9muVEB8Lz/E9S/LEmD5+xBWprnjGlAxj382Td8BMvB3Vf0jCBrD+gdSrwP?=
 =?us-ascii?Q?3etlpInmrLZABCPU7rbP0cGcg46rwUIPs97M5QtHQ+p94wt/ZmoXvmHQINza?=
 =?us-ascii?Q?BdctQ1o1iuIpP14ZZ7SOY7iztuiWgykeNQE6u61ErDRatJPLxEqfhXRliw9K?=
 =?us-ascii?Q?EUtZjLhwLDZCeXL1j1msEuzEbw9wcCWLUlwmsZxFkBntYsNpfdHX/7yWTgyJ?=
 =?us-ascii?Q?Sml2h2dIxWWYhAbkFJ2bVnqiKWIlWuWCnuh/rYFBcewQgfFGKR7i8sEToC3a?=
 =?us-ascii?Q?rE0h94H8sgo4ymX5215lMdENIS4XEZoUvAV7kL55h6lm+1u476lpwewqzK33?=
 =?us-ascii?Q?ZW1EkTTynyL5gyvyhwOYi10AcZsWZZVYl+IRhD/CoUrvJEjb0yPx9Giwilqw?=
 =?us-ascii?Q?XQ+ZD6tXbwMQCsiM7jOy+Hyj+gYdEYNNXe0QFNZSznQ41Clf+W1lURDgUhnZ?=
 =?us-ascii?Q?EexR4jtDtjI1lLjzf89UW8j9/VlowCWixfN06VIfxXSTgeRraK0CJKgmEx+C?=
 =?us-ascii?Q?KrbhkJ+l7mew5WUYy6Iv1h3gQgDQVGGr5rA8eHCWhxjQoRJ1/JNG6zJV1ym0?=
 =?us-ascii?Q?P96YPXMASVYjxrbAL+7jsa/PaJ9wamCSGmCyw3F/B65b+YcBsb9JPK3jTXRh?=
 =?us-ascii?Q?o23za39w8J7UjTITJejEGfvwptLQVnDDuMjU5ZtrnN2npGNGXfIGpw1edn1C?=
 =?us-ascii?Q?nleejU/KYJRjjLhs5MWODvATScVx5PoqmX0lLQ6I7sdAIHmjUPlj9PXHsP7D?=
 =?us-ascii?Q?hBf7BYY9/PXjrv2d8ootOLEH+wrYLUn0VlZzEO/sh//dHC4Xs77JI28OPlKV?=
 =?us-ascii?Q?lO1Uue6xCpXFn/+E3i8jL3kd9rvD+TWkF33c8jOk80jVLXgolpEc3k9CTs+F?=
 =?us-ascii?Q?zQ8e3GsOnnM0rlGs8j3qZsU1ANMj2/DppRa78Om2E2GjkSR2XKgmCi4SQC0I?=
 =?us-ascii?Q?K88rT0DvrLQv6RfWWCE2kdFchc34tRWcBc56yI9fAvWPgV01ySc8Ccxp1KgO?=
 =?us-ascii?Q?xIvcwEdrcmb0pevn17BBaVuXgkV98SoDMDwG55/0XdTbugczzsiuuthRSHb1?=
 =?us-ascii?Q?Bt+7xOlihFwXjfnmrjv8QCo+qGlZ3/VOfAi8UqT6/5vJAwyaEgij6OVVjYZO?=
 =?us-ascii?Q?TlX82IZK6uPYFGXYCwhvC1WxNnq63VRJCX5qsr8puHKQBKCuBUHna5KfOrZ4?=
 =?us-ascii?Q?5YRhbCJOi/PII5dVilEK3hesG7dIgOCGzApLt+THoHps56TgVxwIKz03wwvL?=
 =?us-ascii?Q?xlNL37EPuZLH7DDNlcKUayYrG5O2XgktE+rFWgQp5i5yQmTBcmBYrH2rFPU1?=
 =?us-ascii?Q?juwfMxRIp8u28EG1eeu9lPH024fkdk554T7JdPOYghrzKtnOT41d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af23f042-cd38-4c3c-8ded-08dee7a0a1e6
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 03:23:44.2170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GEX6moKNOO4x8l9e5jR92PLQ1Kcy1I8Ur2/3CxCw6++kC+lCGfT88fttfBDi+2JvdO2NWzQ5nZv3/R309GY+F9IqwooiZyLwtNL0kyAjqftbDQuo1ZjOBoJ1qqp+nK+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7719
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_202347_108217_1C0FD621 
X-CRM114-Status: GOOD (  15.91  )
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

Convert CONFIG_IMX_SCU_PD from bool to tristate to allow building as a
loadable module. This is needed on Android devices using the Generic
Kernel Image (GKI), where SoC-specific drivers must be built as modules
rather than built into the core kernel image.

For i.MX8Q devices running Android with a GKI kernel, the SCU power
domain driver must be loadable. Without tristate support, power domains
cannot be properly initialized, preventing these systems from
functioning under GKI.

Add MODULE_DEVICE_TABLE() for OF-based module autoloading. Only
module_init() is provided without a corresponding module_exit(),
because the SCU power domain provider is a system-level resource that
cannot be safely removed at runtime.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/pmdomain/imx/Kconfig  | 2 +-
 drivers/pmdomain/imx/scu-pd.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/Kconfig b/drivers/pmdomain/imx/Kconfig
index 00203615c65e..472e9dec6bd4 100644
--- a/drivers/pmdomain/imx/Kconfig
+++ b/drivers/pmdomain/imx/Kconfig
@@ -21,7 +21,7 @@ config IMX9_BLK_CTRL
 	depends on PM_GENERIC_DOMAINS
 
 config IMX_SCU_PD
-	bool "IMX SCU Power Domain driver"
+	tristate "IMX SCU Power Domain driver"
 	depends on IMX_SCU
 	help
 	  The System Controller Firmware (SCFW) based power domain driver.
diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
index 3ec33667a308..24353e203491 100644
--- a/drivers/pmdomain/imx/scu-pd.c
+++ b/drivers/pmdomain/imx/scu-pd.c
@@ -531,6 +531,7 @@ static const struct of_device_id imx_sc_pd_match[] = {
 	{ .compatible = "fsl,scu-pd", &imx8qxp_scu_pd},
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx_sc_pd_match);
 
 static struct platform_driver imx_sc_pd_driver = {
 	.driver = {
@@ -540,7 +541,12 @@ static struct platform_driver imx_sc_pd_driver = {
 	},
 	.probe = imx_sc_pd_probe,
 };
-builtin_platform_driver(imx_sc_pd_driver);
+
+static int __init imx_sc_pd_driver_init(void)
+{
+	return platform_driver_register(&imx_sc_pd_driver);
+}
+module_init(imx_sc_pd_driver_init);
 
 MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
 MODULE_DESCRIPTION("IMX SCU Power Domain driver");
-- 
2.34.1


