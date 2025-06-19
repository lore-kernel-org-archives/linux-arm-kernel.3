Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4568C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 10:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c9zJXqMlFQ42zPd9OlzwFXSAnafRP2l2U3EofO/aa58=; b=wJKOC1Eeadns/zlJyEWxc2RJzT
	GYPZpS+w3AWNhFCsUulmeOYx60jSCcqScFsEVJe9Y4RyK6WlKkfXPNaWxBIL/3EsDLC7Knm3iOzZm
	E6mB5vEzLwYaYhgl3dwIjytE88p+tk4ae0SBTn0DKuGLMDetuO+O8Xm+MbA+FmiQsP1ou/X0l0Vwa
	GuehxVa25DBRwmfa+kXmuXEupuPPLqvZGHq6VELNsUG50x8wFlPn9O3ELCOM8kZIk0+8Meaelgm+9
	k6HgVZl9DV6FgXsXMXrQsCVxx6ZToBwUFGzoMKAfyEJD2QCJeVbdaEMOVQfYMWSAjNEELIVROw+sp
	cAaUUs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCr9-0000000CnGJ-1qXs;
	Thu, 19 Jun 2025 10:50:55 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBKl-0000000CZyh-2dxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynEH+HSScqo6RDxRNbrYt+TxFgTP6obhkMBxKbGCUP+cSkMzp6ahTLGq6bI+nrb6nESffV5QML8d2qszf7pnXOoGL+3w8BUlSj9OP5XMvKOKa6qNJP4wTi+8DyzK6pZ+oz3veKh1GV20sED++5netHTkFU5iD7FWHR2hLqFo0EqWxkPzEHxu0tj5jXVGOQZnz21j5Y6yWw9r4SNO8q+4rZ4mPynLOxqm5/ZI5pAmitE7jvbUxfYXPcOKfC7czvmUFQKg3dXZx/qIno5KS1MiQcp4yh3wcVTFkYtBaj0dZ6qpCZ4cZQE2Ev7klIJ7O3YXR3FPWOm+lAaaSout2YIZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9zJXqMlFQ42zPd9OlzwFXSAnafRP2l2U3EofO/aa58=;
 b=w7TdqMsv0+3HHEf08Yrz8solfmqt34JsUGlpRvcB9d7x8LxTUalwYTvDiOs/E2c6OSiFlUJlroQ/Spz+G3D6HL2RPG+mhqGYyxrYJuTJtDCb/ubxtrx+8MBs8UI+8aBVhEa7aVzKxmcUu9LWd1IctBF3+OGwHcv7IpksbMp1s/lPoaloh0e3ezE+kXQ777Z/HiDrcMColu9uIjr8/0avbpscoCmHPcynM1vPlUF/YG9HUwq+h/IGNvJoYP2/fOnRWbM6m6O0YwazWh0hgr4SPVXcFNytoZ7CNtUKXoqCspYJrR6sAthuZQ/aNHawvd7DRmfBY3Yixexp2BmNec71AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9zJXqMlFQ42zPd9OlzwFXSAnafRP2l2U3EofO/aa58=;
 b=bzNUYeSHU+jgRPbOZ7IROgPWHw8dTBi95SGW360B3gh2nG6ZTXXpE1/OtNmg7LOHnL+zspeARereJgsG9987AfcxGj9hKutucG84W6PnYQL8mqbzIdk5CtMSfpmYH03IHEgnnzEZNEbnCI+zrYWunuHO07XeMilWe9IzrpSlmgpt9j2k99W0wyUxkf8K5jKX67iEwRqMS2T013TbDYF7v5BlrkL37R1K7xVVNR2A39ViVZIp+9Ss3qMczKOdiBrz46a0HORiw9r6CxXY9ZYMIp4EN0YpPqeNgtjpqeOYI9YXieDQ3h3TIrRCAHMuxCx3kfjkd6OTORG6sxV2X4uCBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
 by DB3PR0302MB9157.eurprd03.prod.outlook.com (2603:10a6:10:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 09:13:17 +0000
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265]) by VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265%5]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 09:13:16 +0000
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Tim Harvey <tharvey@gateworks.com>,
	Frank Li <Frank.Li@nxp.com>,
	Michael Walle <mwalle@kernel.org>,
	Heiko Schocher <hs@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tobias Graemer <Tobias.Graemer@mt.com>
Subject: [PATCH] arm64: dts: freescale: Add Mettler-Toledo Snowflake V2 support
Date: Thu, 19 Jun 2025 11:12:44 +0200
Message-ID: <20250619091247.51919-1-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0001.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::8)
 To VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3856:EE_|DB3PR0302MB9157:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eec5635-232f-4ac2-ca90-08ddaf1186a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TCnEpRwICLdF6pEWdnaZzu7JvJQ06vqHled8gLv02v1GuH67zBc+6lZGF0NJ?=
 =?us-ascii?Q?MpeC6sXBuLJHGKW5guAyG89aX45Dj5qz/eTntG01x37c4ocSGAKUqDTgV8p6?=
 =?us-ascii?Q?dTNXHk4ba2daB3bOmFMkufzggXX5zz5bgI5Tijty9hEpZedaPPgBanyljFQk?=
 =?us-ascii?Q?TndkWFPhsJthohF2T/z/f4cxOb4xqsRYWMJpQtyxSwk2DTK9BBR6dqVH+etV?=
 =?us-ascii?Q?wkzpU2zCSKsojK4CqUz8x71qPVJ2WrTF9D4b+4SSQHBXJ9hXML+w3ldctBQF?=
 =?us-ascii?Q?JqoJd8bTwewlizoRHMeQwOQafMPV2EI8ul0hqzFvIf/T6MW5ShTcFJPMApwW?=
 =?us-ascii?Q?ac2nMTB3RdJng4k7+nvoAaHJeJ1sIuUcBMWENMJwsildSAQGHyrs4i4LgXko?=
 =?us-ascii?Q?SSWTTd3dSHB+Rrsb2wiNI3NFSyR496v/qz6WUcDuECNopiPQjaj+AhJbev1M?=
 =?us-ascii?Q?IL0VVLsDVbUID0yuej8Z+eqBG0l/A3pEYHV59LtIi4RDYM9g2yzUFs+S+9Kh?=
 =?us-ascii?Q?bc4DGS3lQG243xsOkNM1j5uSdEyBAIXv0Y753x8QovHwvixeJt757qU06PXI?=
 =?us-ascii?Q?96BjNRn0N9fL9ggXYL61WOC4g18cHr1VDyILuMIBsLjC6WB1CA6ETb/ILJXl?=
 =?us-ascii?Q?zkycnXTkXpg40ND95OqtU8tU8D9kvGK1/JBQMBWhgsT+P/5rVO/tk9jqh0Z/?=
 =?us-ascii?Q?1trpbNSWauXteFOLJ+FX3smjWfE0hlg0R3F4MJEdZDxEbLlFZGOZ85WuoaWu?=
 =?us-ascii?Q?HBl/28bqGgdbHODcg0Tub+xHQ0lCUjtnmxAOhZg9Ec9EsZyDgfQu/NCEuvgX?=
 =?us-ascii?Q?rTkv7hpRssU5a8dNaEcMkbWxo1XlwUInJZYW3G+t/PTR1Uk/K3Yv+qEIcTUt?=
 =?us-ascii?Q?GGK4/FwCPaoUJQDbQKTjlDIXywK+vkY9XqkvnlWRikRKTQtko/8aXzBRdQIr?=
 =?us-ascii?Q?KG6VUxM4rba1cD7Tki/fzGbHdJM8KC6GVxmwxF/n6SjOXEH/IrmKSE0VP2cX?=
 =?us-ascii?Q?xNOQDJ49vvawZ4L6+3IeCDR7rldifuOZgO/s14W6s6LjMMfZQoHVTbRsPk/f?=
 =?us-ascii?Q?sjki8E9utB3DWfuOUkEaDBJbM7y1OYtETIPBN3ENMzbFfRqngE5LqmaUSDiA?=
 =?us-ascii?Q?j8G/oKwYnQ6OQ5G51mfgQGVb90MZIaccYd8HmXPpD4wxuOOLm+W06tXjEvVc?=
 =?us-ascii?Q?38du/yqf81JvLWKIPCXaaB2oyuRiMDH5+wBbwcE7Q1e1Gp664mBHjBXczchC?=
 =?us-ascii?Q?a5qlKNLM3pYWPu6QVIr+H8yTu2Kw0GbEFQsJLzC8dIr/30+NKiR569OfB9HS?=
 =?us-ascii?Q?BtDi9yNQUaqAtHbq0Z9wT4i/auQe7IUNMyPlpFIYvrFbtTsLZyKLeaqUdhEY?=
 =?us-ascii?Q?dkxRBdR+I2qLs152RM1TN/egc04HljBR9EjfdSw3TJZ9RqKyLD23Gk0rN3DW?=
 =?us-ascii?Q?3BT7jPhqLq+DsPtGZVVyai+m3vseYb3LoTntb5JZY02S6IvSSLcT8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3856.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ednVFbYMDAqkaTUI8Nx6naOOYI56MVqdVNKZYRbxmklK8x8dmq1n5+CkV13R?=
 =?us-ascii?Q?gwLkfY5+Tea34z4dz8XAzFj0ZMqLo48wa5ihVqRYm5Kb690ra5tDocheUgKB?=
 =?us-ascii?Q?SinYdat/IyIL0cAst+ayh3q1FQC9dBmh+0qnxVRMoM7bCcvdRSSuYTyUT2Jf?=
 =?us-ascii?Q?dt93Qi3Kd4iGu7Di1+xKzXeRkI60BQ1ndkCp4GGWupF4QJ68FdsUIaNFfEGm?=
 =?us-ascii?Q?Hsq8ob6ToYehU4fPxE+RF5Fs0KNoA+zyZH0p6PzsSRwj8gGF7GFgOEp9zO/A?=
 =?us-ascii?Q?XkPhtnDekM1hK5vfJADfQ3jEfaclTBF7lAzCJn8naWO/AjxGY0qKejbCCrz4?=
 =?us-ascii?Q?IzXrd2emmSSqUUXn0z2CHCiTlbmeNWFM/WK0zbbUqsFslaML46CXcngaS6Kn?=
 =?us-ascii?Q?Y22ivWB0faIWPFoJF4ZdZh/af9hwxXN9j/FLtlQEORQBIQI1yoQZOrLBUZY1?=
 =?us-ascii?Q?XDL4hZi915n3B/nZQ7AB1pGcHEAsPkrugfvjb1hf8i5rQL7xo4a0dc2fu/gv?=
 =?us-ascii?Q?0+XK5ux4a0eB78xKZ6IojWhOuHAiv8aE4TtzxkraIYmZG4QHgk0jMkHjYkiM?=
 =?us-ascii?Q?i1Nr7eUFxaIz5XSEE98JS5iBzjmtExxB1eIfFo7NjBj3ogmisRxLM0yirKaK?=
 =?us-ascii?Q?dg3myro1Q/RvdfmczaQEC9pUHBCfsfRLnLeRs3i92yMZFZ36TVQW+hvR9soh?=
 =?us-ascii?Q?pvfuKRUa/P576QXOBd+AFWvULcKRx1FaJw47wkTCISSXEKzl7O5u0IZc/8VX?=
 =?us-ascii?Q?w5MnauYB17XwCP9nupNHbTXefRMOARBxwlhX9OMD3zvmJokT74avrscoFOOE?=
 =?us-ascii?Q?w3sl1dqqil+EyYrGfXyb2RUalzcD/W7zvCl1JD1ciCMssyIFdMIyhVgh6FrT?=
 =?us-ascii?Q?0I3qYiDu668wPYSyxFajbbf39M0HXfbmxti7OSWB3tHuSQXays2BvVZT89S+?=
 =?us-ascii?Q?whnOrfdZj0v4iJOssyGQXaOwHJXX41IU22Zr/VSD7giCrGI4gRbd152tTEfz?=
 =?us-ascii?Q?WEGYCFSy2NMxpAR0XTF6YBkB7lp0xUYuGFov0F2JhitkvVDqqYP2MHLNslwV?=
 =?us-ascii?Q?lUeUridRq0ouZHOWP+MfeYpTrluj0Msyv9SGaQPZbcLw5rJv4j0Elaxw1w1+?=
 =?us-ascii?Q?GoCK30J1wy/B3ywo846datpYrN70R1dxP1zzUyYNyA65D+apU5e9oFEUQIFO?=
 =?us-ascii?Q?P0weal1GqON2uossCE8LswTRswI9gOEOWlMlt7cFkqsIPZ0cCk3Ljpkn+leI?=
 =?us-ascii?Q?Y/QCamB/FLAgfXHZCT6WQ8jmfMJktrRfvTawNk82f0Gf3qIYGN2E2nqjI/eb?=
 =?us-ascii?Q?zM3KtsXUleVtNmdyq+vVFziyQwu6yYVSZhmeB4qnY60tkPtPv+bzbrZGCBs7?=
 =?us-ascii?Q?zW72O7U14pnRSlwT+DM7Z2T9CLccgL1Z/XNTzueuydm3j3thbBb3t2Phw0dz?=
 =?us-ascii?Q?bg2HmYaQ24vrbmqfy0uiBj0GUTmWLhb6c6kX9Kq2wg5yvmgpXLB/YN6AHdao?=
 =?us-ascii?Q?LdUIHEVs3/Yv78sCq1ElgykP0lwOQXGsAnN2ZiclM4hPz3lhwL7i9UPO9FgX?=
 =?us-ascii?Q?Kot2KUk1E/RAa1YPQhbNArEVXuJbmtlMD/tIgBz9?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eec5635-232f-4ac2-ca90-08ddaf1186a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3856.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 09:13:16.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gySnJJ1D92zY+OHpBMu4MJBLGk0KLWU6DgskinfrQhGMwwiHosFrz+xIP4n/HsiyGwT46S4CdR7DGgxZQ8YWLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_021323_954550_6F8B6495 
X-CRM114-Status: GOOD (  14.16  )
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

Add initial support for Mettler-Toledo Snowflake V2 terminal.
The board is using Kontron SL i.MX 8M Mini SoM with 1GB RAM.

Supported board features:
* 7" Display with touchscreen
* RS-232
* I2S Audio
* SD-card/eMMC
* USB

Signed-off-by: Tobias Graemer <Tobias.Graemer@mt.com>
Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
 .../devicetree/bindings/arm/fsl.yaml          |   6 +-
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-mt-snowflake-v2.dts  | 484 ++++++++++++++++++
 3 files changed, 489 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..fe5eeb4355e8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -986,9 +986,11 @@ properties:
           - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
           - const: fsl,imx8mm
 
-      - description: Kontron BL i.MX8MM (N801X S) Board
+      - description: Kontron i.MX8MM N801X SOM based boards
         items:
-          - const: kontron,imx8mm-bl
+          - enum:
+              - kontron,imx8mm-bl                  # i.MX8MM Kontron BL i.MX8MM (N801X S) Board
+              - mt,imx8mm-snowflake-v2             # i.MX8MM Mettler-Toledo Snowflake V2 Board
           - const: kontron,imx8mm-sl
           - const: fsl,imx8mm
 
diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b473a23d120..86f2f1580696 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -128,6 +128,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-innocomm-wb15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-bl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-bl-osm-s.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-mt-snowflake-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-mx8menlo.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-nitrogen-r2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts b/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts
new file mode 100644
index 000000000000..c810463a2f40
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts
@@ -0,0 +1,484 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Mettler-Toledo GmbH
+ */
+
+/dts-v1/;
+
+#include "imx8mm-kontron-sl.dtsi"
+
+/ {
+	model = "Mettler Toledo i.MX8MM Snowflake V2";
+	compatible = "mt,imx8mm-snowflake-v2", "kontron,imx8mm-sl",
+		     "fsl,imx8mm";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+
+	aliases {
+		ethernet1 = &usbnet;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm1 0 500000 0>;
+		power-supply = <&reg_5v>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+		status = "okay";
+	};
+
+	panel {
+		compatible = "edt,etml0700y5dha";
+		backlight = <&backlight>;
+		power-supply = <&reg_vdd_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+
+	max98357a: audio-codec {
+		compatible = "maxim,max98357a";
+		sdmode-gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		status = "okay";
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_sn65dsi83_1v8: regulator-sn65dsi83-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "SN65DSI83_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	sound-max98357a {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "max98357a-audio";
+
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&cpudai>;
+		simple-audio-card,bitclock-master = <&cpudai>;
+		simple-audio-card,widgets =
+			"Speaker", "Speakers";
+		simple-audio-card,routing =
+			"Speakers", "Speaker";
+		status = "okay";
+
+		cpudai: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&max98357a>;
+			clocks = <&clk IMX8MM_CLK_SAI1_ROOT>;
+		};
+	};
+};
+
+&sai1 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&i2c1 {
+	bootph-all;
+	status = "okay";
+};
+
+&i2c2 {
+	bootph-all;
+	status = "okay";
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	status = "okay";
+
+	eeprom: eeprom@54 {
+		compatible = "atmel,24c08";
+		reg = <0x54>;
+		pagesize = <16>;
+	};
+
+	ili2511: ili2511@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
+	};
+
+	lvds: lvds@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		vcc-supply = <&reg_sn65dsi83_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sn65dsi83>;
+		status = "okay";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+					data-lanes = <1 2>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+					data-lanes = <4 3 2 1>;
+				};
+			};
+		};
+	};
+
+	usbc-cc-controller@61 {
+		compatible = "ti,tusb320";
+		reg = <0x61>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbc_controller>;
+		interrupts-extended = <&gpio1 6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&mipi_dsi {
+	status = "okay";
+	vddio-supply = <&reg_sn65dsi83_1v8>;
+	assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+			  <&clk IMX8MM_VIDEO_PLL1_OUT>,
+			  <&clk IMX8MM_CLK_DSI_PHY_REF>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+			  <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
+			  <&clk IMX8MM_CLK_24M>;
+	assigned-clock-rates = <266000000>, <594000000>, <12000000>;
+	samsung,pll-clock-frequency = <12000000>;
+	samsung,burst-clock-frequency = <891000000>;
+	samsung,esc-clock-frequency = <54000000>;
+};
+
+&mipi_dsi_out {
+        remote-endpoint = <&bridge_in>;
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&gpu_2d {
+	status = "okay";
+};
+
+&gpu_3d {
+	status = "okay";
+};
+
+&ecspi1 {
+	status = "disabled";
+};
+
+&gpio1 {
+	bootph-pre-ram;
+};
+
+&gpio2 {
+	bootph-pre-ram;
+};
+
+&gpio3 {
+	bootph-pre-ram;
+};
+
+&gpio4 {
+	bootph-pre-ram;
+};
+
+&gpio5 {
+	bootph-pre-ram;
+	status_led_controller_oe: status-led-controller-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-low;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hog_status_led_controller>;
+	};
+};
+
+&pca9450 {
+        bootph-pre-ram;
+};
+
+&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
+	bootph-pre-ram;
+};
+
+&reg_nvcc_sd {
+	regulator-min-microvolt = <3300000>;
+	regulator-boot-on;
+	regulator-always-on;
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	uart-has-rtscts;
+        bootph-all;
+	status = "okay";
+};
+
+&uart3 {
+        bootph-all;
+};
+
+&usbotg1 {
+	bootph-pre-ram;
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	usb1@1 {
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbnet: ethernet@1 {
+			compatible = "usb424,9500";
+			reg = <1>;
+			mac-address = [ 00 00 00 00 00 00 ];
+		};
+	};
+};
+
+&usdhc1 {
+        bootph-pre-ram;
+};
+
+&usdhc2 {
+	bootph-pre-ram;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	no-1-8-v;
+	status = "okay";
+};
+
+&pinctrl_usdhc1 {
+	bootph-pre-ram;
+};
+
+&pinctrl_usdhc1_100mhz {
+	bootph-pre-ram;
+};
+
+&pinctrl_usdhc1_200mhz {
+	bootph-pre-ram;
+};
+
+&wdog1 {
+	bootph-pre-ram;
+};
+
+&pinctrl_wdog {
+	bootph-pre-ram;
+};
+
+&pinctrl_ecspi1 {
+	bootph-pre-ram;
+};
+
+&pinctrl_i2c1 {
+	bootph-pre-ram;
+};
+
+&pinctrl_pmic {
+	bootph-pre-ram;
+};
+
+&pinctrl_uart3 {
+	bootph-all;
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19 /* \SOM_RTC_INT */
+			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x184 /* SOM_DIS_ID0 */
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x184 /* SOM_DIS_ID1 */
+			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11		0x184 /* SOM_DIS_ID2 */
+			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x19 /* SOM_PCB_ID0 */
+			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x19 /* SOM_PCB_ID1 */
+			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x19 /* SOM_PCBA_ID0 */
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19 /* SOM_PCBA_ID1 */
+			MX8MM_IOMUXC_SAI5_RXFS_GPIO3_IO19		0x19 /* \SOM_STATLED_RES */
+			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20		0x19 /* \SOM_HUB_RES */
+			MX8MM_IOMUXC_SAI5_RXD0_GPIO3_IO21		0x19 /* \SOM_SUPPLY_EN */
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22		0x1c4 /* \SOM_COM_RES / version C */
+			MX8MM_IOMUXC_SAI5_RXD2_GPIO3_IO23		0x184 /* SOM_DBG_GPIO0 */
+			MX8MM_IOMUXC_SAI5_RXD3_GPIO3_IO24		0x184 /* SOM_DBG_GPIO1 */
+			MX8MM_IOMUXC_SAI5_MCLK_GPIO3_IO25		0x184 /* SOM_DBG_GPIO2 */
+			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1			0x184 /* SOM_DBG_GPIO3 version C */
+			MX8MM_IOMUXC_SAI1_TXD7_GPIO4_IO19		0x184 /* SOM_AUDIO_SD version E */
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_TXFS_SAI1_TX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI1_TXC_SAI1_TX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI1_TXD0_SAI1_TX_DATA0		0xd6
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_sn65dsi83: sn65dsi83grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x19 /* \SOM_DSI_INT */
+		>;
+	};
+
+	pinctrl_hog_status_led_controller: statusledcontrollergrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4			0x19
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT		0x6
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_RX_PWM2_OUT			0x6
+		>;
+	};
+
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_TX_PWM3_OUT			0x6
+		>;
+	};
+
+	pinctrl_touch: touchgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1		0x19 /* \SOM_TOUCH_RES */
+			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16		0x19 /* \SOM_TOUCH_INT */
+		>;
+	};
+
+	pinctrl_usbc_controller: usbccontrollergrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19 /* \SOM_USBC_INT */
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXC_UART1_DCE_RX		0x140
+			MX8MM_IOMUXC_SAI2_RXFS_UART1_DCE_TX		0x140
+			MX8MM_IOMUXC_SAI2_RXD0_UART1_DCE_RTS_B		0x140
+			MX8MM_IOMUXC_SAI2_TXFS_UART1_DCE_CTS_B		0x140
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
+		>;
+	};
+};
-- 
2.47.2


