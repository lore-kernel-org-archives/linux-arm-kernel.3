Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32777F433D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 01:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WzidNzjTPe33O24lsN3rTABTPL9bRxEJJVqrWJ6CSds=; b=x01KMdZcIJj9hsOr86npzZJrUW
	PiD7JMlEtt8cDFSZuTo/9k4u1+09/8fa/T5An+SRuBXB31b9mvyWdb7ti/7T/I/jiznjBBrZ3nJm7
	3BUappfWEzLlWR+Y+ynK6Av5933rC85pDoOT1RlNn6s5qEuqF59YHQrOjp54zgu6F53C5BpBuY3Np
	MnL2034tOio2bUPp+c0Fm8kXvu2sg5BZ2PeOPt+6V6MEbMy/dV5pJrMqVjyQmvyIZ5IiW+4Vd1A83
	a+W3PP4rKRq3+aHJslp8pXWAc0+rsC/kcoheF2ERrbaPalQaja5I80iLOw13mhj7h54XrYbqQia/Q
	Y79kmdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDBy6-00000001rUd-417J;
	Thu, 16 Apr 2026 01:56:34 +0000
Received: from mail-northeuropeazon11012045.outbound.protection.outlook.com ([52.101.66.45] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDBy4-00000001rUJ-1AiU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 01:56:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX/28ca6aKE+Xv8Pdpdh2nWlTyMbuiYLsNYoZe71XDBZp+YzS9MZT3/hnzHAMo4gdsHM3GBibP+gdJl5X+VWsn2TX6qHLHl7aheawrSyfoo2Ah5mfDIoiX9JT6lSqvOSsGm9YoqqYrhrMGT3KN5eV8tc/p1erEY+H/ztlgrVVDS4oyD+25dU92wlduy16yPbvzEiP+DsrFLMaMKT6X8qf9NLi50edIj9JrJJO9xBr0IsNTYxYXIc6v5EeglcMSp2NxDfkoDcJcnBgfOAHDhHwuQwE0EgP9X6GiHkw22exf2dYW9ODohjVkE2ZHABg+DL3sGDC7NekyT7d5L+d7kZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzidNzjTPe33O24lsN3rTABTPL9bRxEJJVqrWJ6CSds=;
 b=f2frdWpATqDDuJJx4LsPN6bxp1eyOVh1UiXglLsSBDjGhnmbxysnvpRoTRsDDpgY7bINtQJ5HybDBS+KwZkvg8NWr8J5Wc8IV5UvffE2XxvNftZp4awePTiNnRUbpzkNH1VMYnyBbrhJ6d4qu0qOort1LsdGazKKVsjZAwY/+RX0d/4+AbGkJMDDmXzd5d6gjOms7D1pdqK8xqMyzD/l+cYdtjamAf5EEFZBEjZ3dKTMpllG+7k7z0KmXsIIFEV1mMB9t+yuwKygLN+LkPKCHffIaiexE1LKmHhSYT+kEXtjMETssLWd0h4TWBfZutLQ3VGbQIfz8CO6q6CT9/KZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzidNzjTPe33O24lsN3rTABTPL9bRxEJJVqrWJ6CSds=;
 b=OhITTc0jp3Hx2DfEc2ty9sWGXUzfVGLfeEXq0hbiQ/annQe6Jl63kqW8XNdbQx0jh1N87Nn8Hz0/fQg/JFvlE94aU0KWlGLlJWfRFqt8NrNgB1wqwmAxAuvKnA5ZmTBaPwfAqdjGDH0dxUXy1yXr46m455Dpg7NpCVvSVpF9z4lXQkmMTsbIugklKLIddrhMu8tbg577l2QF+m3u3zYVS1IGQQAdqDZka39AGDiBiyf/FB1ka6yZFsbP4eqBAfTEDuSp3ZVaZIjz2BGzE3jAfbD3hm6iTBqUaPOTXb4v1VGEOjuvilqjbPCHRBPEwPVDy0RPTaTvQYerfWyGB0ngTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by PA1PR04MB10700.eurprd04.prod.outlook.com (2603:10a6:102:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 01:56:25 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%6]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 01:56:25 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: ulfh@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xuegang.liu@nxp.com,
	jindong.yue@nxp.com
Subject: [PATCH v3] pmdomain: imx: Make IMX8M/IMX9 BLK_CTRL tristate
Date: Thu, 16 Apr 2026 10:56:05 +0900
Message-Id: <20260416015605.3536244-1-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::16) To AMBPR04MB12334.eurprd04.prod.outlook.com
 (2603:10a6:20b:732::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12334:EE_|PA1PR04MB10700:EE_
X-MS-Office365-Filtering-Correlation-Id: c801f6d2-7315-4b19-aea2-08de9b5b5dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: khYzbwJ02vLMhJmi2+de/7Q3bcKqq6q0QQaY7qeJ+tGhYHrhJFOQyQ4E+s2OLc61YGRP7aFfQsmVMjnTj/21B7WlyNTMQCJF4V/UVWVjxF0RY5L13CnjQYgI8kYnanrjfOkyqAB29ZuJZ68AZzE18OQfs+FY4nHKvRTTUv+BFtJYAO4VSFIAhJjWWJsSiRRu1M5hJYn8abIu3dbSYCUkQpVVS5yN41iNG0hbL0HjNXAqOPRpFYjJxWlYZDnVjPQfpmCkk4uPkJ6HTg4E6z/ft9+5q9Y+4UaxxAk5UUbrza5UoSTLnaqCTs9bq732MyKYHt/B72KxnyTHl/ZbRoSgAWBwBiWSRPR51x3orIUeEtdMet5F79yHnjQ853QpO0LfxsAa/V78rjbZrLw/bLpruKAsdLecVy2B2seVFxjW5O+0zrzu5i3v8wnxBjcw1dtvTLtnUKIMNI9hOepCzxdc35dmznjTGXgSyPQ73vjYmNgjJnkf6A1v95IbO7xjIZpHPZHKD5vrQNwC0UwQE2umHkWGb6fkFxsa8Jw5m/wxha87YzR2PayaS7bZDYaaXB7hBRUw0+8p2FxCihb5KzOBYYdnNtu0dxThWYAhQvBM0IEHd5WnJ8LHAgzGgV1HljevTq00JRRC0j0HbMuDfKKhMpteynDOElEaPvW6PtahsnQCYtVrZn8aCUUiomGJc6P9TWGbQymnXCz6356ml2wbDbDmRM7m/VCstmqqXk+6d8ffmICgaN0e+Eoi2WsBSC6oymSWQj2tRKeQII/Rhd6BS03NS8pUw96RYpIy/PymCG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2iGPdWCrkQcHi955SgAfAuBIMZfo5tIJWiI3nnHEoj99m0LWn2jJh/sPxGh4?=
 =?us-ascii?Q?k4PuqWGsrrdq3FLaX8L8Pd59CI8glnjLacn7+GNjtRbtY8MDg9UKBLHGe8YK?=
 =?us-ascii?Q?MNZLkW07kebOpgDOkySxCRBQlDAy7B8VUqeh8jv2Ci17evhcVzCBLzsJTeNX?=
 =?us-ascii?Q?IRQgO15Q2qWpKRpC9SXomiHxlgQKc0m3Y5B1cB7HogK/Cjs4Hkxo6+RxIuZD?=
 =?us-ascii?Q?NL/22B+vwEpujGVKyZj1efnDA5+ayBVeUGKcYlZj2uXxBBRLqYopIgM8OYYW?=
 =?us-ascii?Q?IbCfDgLB3SPoBboY6SZTD1a8hCpsymjb6Lxd33kmQ1YDVDbA4LeOuGhkfFgD?=
 =?us-ascii?Q?BtxHJniJnqAwi7ktLhqyu4j2G03fVpXVg7pMziu+xQfKkeOJixjpMNYRzF7Z?=
 =?us-ascii?Q?jQSesF/QIJSnyI0nSQIJiWwsYh0lYvdPTIayqTKbX6lTDVXXPocZ3VMxjdbn?=
 =?us-ascii?Q?daLV+qoLYBG2/n3skxBDXQHvTE4ewDPvU9m9Hm/cpDVmPjzS7hhgB/FCWZMJ?=
 =?us-ascii?Q?7B5/UPm3RdrP/NkQj9IZdvvfQSqiVPiB0kCZVjUdOV0PnFi+Lgx/5EMpco63?=
 =?us-ascii?Q?DQ9VYHJzdJIHtDRr8PQhMQQxDQMvrpHT0Ss8Mt/MoGjlj5Pjq+BxVSdLjppt?=
 =?us-ascii?Q?ozwMMuiv7hhXr4wn91QWhu7+gUPU43DRrf+o6TKzaGjlC1iT9fpaiqMrGkmg?=
 =?us-ascii?Q?NCpDRvEx+OYIQQCgybQwNeLU1p5vWgCjjCA00khoEG8KGdMHIa4N8t6XpB+r?=
 =?us-ascii?Q?ovor2W1XL5bqfEHPkX5AzbeMAnEKB8rHRlAHfk2CTGJm9YEYaF99he+glXiF?=
 =?us-ascii?Q?b8uUyvuua6VMxXD+7kCWE0RlBC5emokLXy6xiZNN2FMOCg3+Wzxeq1Eg5Wf7?=
 =?us-ascii?Q?F3Cr/D41Hzk6B0LCGCjvx5SB9O7g7ULeBp27YckQtr5Yccv3bipVuINr6ZU8?=
 =?us-ascii?Q?ul691S3npMrIORJ2JpEa018DocLtE6zJMtpkPf2fhfeLFvm2IKVYOWldp+d2?=
 =?us-ascii?Q?kSfnnXu+Zcf8DYQ5QHceS20p7WwImPZkwG7wSvk18JZy9EjFfDzowqh88ufH?=
 =?us-ascii?Q?ltr1ohN2Pxu/BlKNq4gGKt4FXkPFpzJ0i4y7ZGEvqqw4hyrGpA0BOVnCVFM/?=
 =?us-ascii?Q?J7fkl7lnKza/V4fuc2m4eRGzFsu3gyDlJddOIE6lEoRsRsWP0lw98UQ3jAQT?=
 =?us-ascii?Q?CJclhhFsAplIECIrx+45Gb+l9oMn3V7TghuvS8EwKUNdhiA6FcJUfccIJNAw?=
 =?us-ascii?Q?1XJqNWUWIJTmuyOGwXE+ka5JBGNmGlzHDr+eiksuD6dpaV/5YXy1e0VPRnBw?=
 =?us-ascii?Q?XQE45wupR45qeRY1RFGxJ24xZqyIfCghgpKzO6vYS502WXMvqCkMncXoO7xl?=
 =?us-ascii?Q?SHMdKdah/yfWBraLeDCHD8fzPywF3yxvppUTjZLWF00Unsg3WXvo2OqUT1yS?=
 =?us-ascii?Q?pygwyhkv59CwTZeHXL31ImMge1gE6Ix46QpHCsV9GtUZZ5YFDvCDVtgKDYQ0?=
 =?us-ascii?Q?dY1QQa3koEXDPJEY6nLqAp/GPtgR5w6PXzHfVnhPR1yWlPCtXXy6a8JwFF3A?=
 =?us-ascii?Q?SdZug/1a0f3iQ6D5L/lXrTKJJ+L3Dc6eN0HDDnLRMeFkSl3WDi+jE06BA9yY?=
 =?us-ascii?Q?0f2q/eBrksCmErSe9CIR5HrrPEJtwJs1pQdA4kiUd7iWVPUg9e8C6qPiit3A?=
 =?us-ascii?Q?i3phy2ed6NSVN1Ek59gChh068MID8DwoHjP1XbLNuYr/jMQXYAHBI3uklZbP?=
 =?us-ascii?Q?2tRPuVuv7A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c801f6d2-7315-4b19-aea2-08de9b5b5dac
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12334.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 01:56:25.0782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHqCEJCtZFN9r7PgKDQp70baDAMfilZ1CPEvrYzfBhUV695rdtQGf9RKy0206XeyZQ2s6ycUoSpCedVRfbXo3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_185632_331322_3BFB09D8 
X-CRM114-Status: UNSURE (   9.65  )
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

Convert IMX8M_BLK_CTRL and IMX9_BLK_CTRL from bool to tristate
to allow building as loadable modules.

Add prompt strings to make these options visible and configurable
in menuconfig, keeping them enabled by default on appropriate platforms.

Also remove the IMX_GPCV2_PM_DOMAINS dependency from IMX9_BLK_CTRL.
This dependency was incorrect from the beginning because i.MX93 uses a
different power domain architecture compared to i.MX8M series:

- i.MX8M uses GPCv2 (General Power Controller v2) for power domain
  management, hence IMX8M_BLK_CTRL correctly depends on it.

- i.MX93 uses BLK_CTRL directly without GPCv2. The hardware doesn't
  have GPCv2 at all.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pmdomain/imx/Kconfig | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/imx/Kconfig b/drivers/pmdomain/imx/Kconfig
index 00203615c65e..9168d183b0c5 100644
--- a/drivers/pmdomain/imx/Kconfig
+++ b/drivers/pmdomain/imx/Kconfig
@@ -10,15 +10,18 @@ config IMX_GPCV2_PM_DOMAINS
 	default y if SOC_IMX7D
 
 config IMX8M_BLK_CTRL
-	bool
-	default SOC_IMX8M && IMX_GPCV2_PM_DOMAINS
+	tristate "i.MX8M BLK CTRL driver"
+	depends on SOC_IMX8M
+	depends on IMX_GPCV2_PM_DOMAINS
 	depends on PM_GENERIC_DOMAINS
 	depends on COMMON_CLK
+	default y
 
 config IMX9_BLK_CTRL
-	bool
-	default SOC_IMX9 && IMX_GPCV2_PM_DOMAINS
+	tristate "i.MX93 BLK CTRL driver"
+	depends on SOC_IMX9
 	depends on PM_GENERIC_DOMAINS
+	default y
 
 config IMX_SCU_PD
 	bool "IMX SCU Power Domain driver"
-- 
2.34.1


