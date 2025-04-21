Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9E5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eleTM6IOsmvioAElaGtXNfhLnDaol+NpsmkGyAlzTe0=; b=ZTkiv5VAT42rY6DKXCZDfJiLeq
	aqTbJL49Qx3gbT4x7bgltL9UE294wxITUDWwvBHs6AT6ejM7DhT+lmxoNi0LDrbujKuQUCfCH7bJ3
	Vfz/DVKlNozdT0PsY8OGoBCJLStNkHla3a0NrRHH7trsLaS7dX7f9KXO7ylYt06QPEtdYhQcj5wqh
	WxZdx6UZGrk/HF4ec0rx2Kc7a23kmDl3o3eMbGH9tDA/9rIh0l4zgigdD/5S+DCPX6Q7qh6IpPHAN
	bvWAG/CEgJUPjPJ0IuXaAjpFGDVpi5trfIoMD+HIwuaSdVFlCIls1VFBDL85wkjQCVty0tFPWaK5H
	mUAFDwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6l0k-00000003jqk-1KCC;
	Mon, 21 Apr 2025 06:52:10 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kyt-00000003jl4-0Be8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 06:50:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAgDqTQEZSq7mnv+fJdddqYDfDzwaM1tVg1lpNW9xoevzSm/CTp3BJldAUNUEXl/E3Ly0Iwa7+cXy3iHZ/5AbiIem9RF7lT1OoH9sAnxazgRwJ/X2fHArb6rFQIzjv0LAJlckCiUiLp6puadgt8GFAxlmz17mHsDck+KBuNjDVy0Wxvd0XFX6PUxG3DZ+ateVPjO3K0RhAZFYEBiF8Lk7AXvx5haqy7nnyITsws+qr28GlWNz/ws8Uzshg990Dpn+cLAugzyAcizgWGbyhqBnkkte5BSN4b4ffJlr1l4pwuXh2fIx1y1qZuqx0IprZSSZ1daS8BjQBDhC9b3QuZ9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eleTM6IOsmvioAElaGtXNfhLnDaol+NpsmkGyAlzTe0=;
 b=YjnfXGCO0/ZpOBSa9nApMwy6ZPVf/0zo3UqlFrniqgEOAOAVcW9AA4B48cvW68z7GLuO6NK5nwpzuyyCJYxHaeK2X2CcjeEZRN1j47ejUtp/zWK/XO8Hf6OMdjKlTGUEDwF8BwBhfSZU3mS+dA5KJVy+KWqD3HTwqP9kSE1wC6yj48/TV2WF0WdDRPE9Q8ZFOa9Bav98mhN7XdEk5Dh2ZdMvJy511NBGNFNoxxCy97ImCfAvBxYrGtPfRtfnyz6YwPDwy3yTMZURwezbldAq13O1FqzkS2b9bAF6BtdwNVYwrhk8OM45nC9MhPxQ11Nhn/569rOO6D5SqH/J+WcvMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eleTM6IOsmvioAElaGtXNfhLnDaol+NpsmkGyAlzTe0=;
 b=TjjdMzl8rjPeIrmVVbYpXEkHO4GwIQc4z2iM6ZxkFGVhEWNa1xh4UfrNDIXQNbe7txzOTFbYQsVVgz2+1jTA9lmLVG+vUXjGywPMP7xgaWyLjU3csV9HYjG8eeZ5RQBoPN7NNBbBNe5uGO5bKf86fL7CUdHmdl6pW5F7dzsh0yJDjAOceYyxesh1EoRiEaACQAMfc5fdmgybGDSRIY/NBbn246WO6yTmOgYkQBqdQr+WJUR/HuvleZNiVU247SmT7mllth/Ky9iOaROBxnuNua2koe8OCUWFk8iOn0Bg8FMVu21vBOhfaCuj4rUsjAJrfTM7F6RFlwPlkmOFcZXT6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS1PR04MB9698.eurprd04.prod.outlook.com (2603:10a6:20b:481::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:50:13 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 06:50:12 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linus.walleij@linaro.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v6 3/3] arm64: dts: freescale: Add minimal dts support for imx943 evk
Date: Mon, 21 Apr 2025 14:51:39 +0800
Message-Id: <20250421065139.3073232-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421065139.3073232-1-ping.bai@nxp.com>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AS1PR04MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: d703efe8-e9b3-4a5d-d301-08dd80a0c3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HxtFidUEhWVju0fcN+tVWSN7Y3c4r0NW9HXkcMW8Ns++rv2Zx+tZ4JPktFFL?=
 =?us-ascii?Q?mbiIna22UV97WFvoPsYTkU3OT0TCQ7XGY4ahXtM5URPZvA5NMbFfYVS88t2l?=
 =?us-ascii?Q?ccGidmqfwjoP18s7DRVIeRlPzPSA9cPUu3DiSTlKvKtvsMw/xCrzop2QIumq?=
 =?us-ascii?Q?LJm4LAjkIBkXUSQ3Mp86zM5H7V4u/5D5BAwVEGP4S6vQ9bl6OC3YtxOKyu14?=
 =?us-ascii?Q?oVZ7p4dThHf/hgqnC9edgcLJxGo3DRgOC5pSj3EEN6WopJFomzULJ+IsEbBZ?=
 =?us-ascii?Q?D9vCdh8KGis4OA30dsAZlD1J88CtHJ0zDVIL9VXJF6LhO8ccsaekTuF2HLlE?=
 =?us-ascii?Q?XW/US6LVDX7bdnjm+pshkM384/FIg9aPyHY1hnbAcob4l6S1ZR8ItYM79hAQ?=
 =?us-ascii?Q?am3zAcznLdQ979yUQQEn4BmFHWoXoEW/jJmm5+kR4N0K/1sGfxIwetZQTWi2?=
 =?us-ascii?Q?+11Na39bomBR4zLjNUvcLzQdANlW9ccpssnNk8io8nn7iQ5hp/KqR+NtkBen?=
 =?us-ascii?Q?djcK7bWYUnSdgrzfGdnpVZNOwDQGirKonQj8Mj2O+bXYfwZtWPbv0zW+fJNF?=
 =?us-ascii?Q?i9xT2xip5029KSo6/f1JM+MOsRJeZGkh9ZvkTe+/TBThu8IktgymWTCX15n4?=
 =?us-ascii?Q?Q+xN8dFrxQJrAUOx1NyZs8oNx1s9LIxRb1/cXSlKdCXrSMr+aUWcpuXc4Ppm?=
 =?us-ascii?Q?PChea3njgFfKUWMDwut3UFC+VcpyAjky8lWnQxyM8xwpS+0DgDHSkpaEXfcl?=
 =?us-ascii?Q?msTta3iHdcg2DKnzH/aIBF+m4aX2sDdinEdx2OxGkhTivYKwxeIBl5er8Qhk?=
 =?us-ascii?Q?vYXQGw0+h/cUxO4T+HZ4dJzdrbpcN+TYp9IOEjthskjdVrcgnwQwwJlcxKSI?=
 =?us-ascii?Q?x4OHNen/9PCBmOnj5Xmtjp6SINTCgpuz1n2lX6maimuVu5b0+IRV9B0ADMyP?=
 =?us-ascii?Q?f1NQRMgBbwpzGIHjQGuqgUj0ISZNlemrUCpmQMCXaMa6QT1458LB0A9QuABl?=
 =?us-ascii?Q?wQOKlT8GI3Xr3SBOsIHlisoISEImM8tp2YqOlqcOF3CfX0NANfRXwEqrQ4LU?=
 =?us-ascii?Q?4bj3rGAjf5mlRKo/FTxCDL+5PS6CrAedmurSrqUUqwNQjN2QCYBwIeaXzy2Z?=
 =?us-ascii?Q?D7DmQqsLvZe8cNf3rvpSmaUGes/qujH4MAYk7tKuDHzWFOY1qihIomzZiHJu?=
 =?us-ascii?Q?f0NSUqMnFm7e0uoIJsTXjFsZegCoYZybrXmKd18ohDfKklsfDMnfYxRYTe+6?=
 =?us-ascii?Q?IFvCVzWRkRq7m9DnJVybMglshmXhwj0o5JyRjU0EM9lpwnQzq3ZLzpqWUAbT?=
 =?us-ascii?Q?3gp51tkVHFwlAyB1OX3uZs21Zpleq7qzrMvXoty7+IrAU4+J8PKE22UCuYdY?=
 =?us-ascii?Q?eOM3haBDVuM0sKTAPWqF5C3qnRjn2kp3SI/QC+jg5jNKXQF/2itXdgr/OInn?=
 =?us-ascii?Q?m6f+PQaEtvmsWkS8HyRl+jolFKdGnNFyFjnt2XRspw2t/S7NCO+E6FxxWqO5?=
 =?us-ascii?Q?7e0416DT/S9GSzs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VfmA1Bq9CKEzBD69AiplNYFs7xF0fsr75mG1zgMojF+YW7hzWiiYbH0WcPsV?=
 =?us-ascii?Q?jlXLykvfW/M7eedYgZ1tTv5CwltHJcSi4Ci6yZda7wzQL25o6f/oWgh+qv0w?=
 =?us-ascii?Q?oFeyI4YzSYtQvM+1WuBhEMsv9Q5FaO0/mafBfVmgJpvemGoH0TUARBXyklj/?=
 =?us-ascii?Q?7FQSgACaF3e/2JsvnjsCrzqNHPNNuGpJkQuFyI3cPSS5gGvdQ/kCvk6pDbfV?=
 =?us-ascii?Q?d3uh7kwYMTYMosZkGTfn03LYtgBwA6DPJYgQoJc73XZYlCxEJ6bKTNYBePgN?=
 =?us-ascii?Q?ynndFfwfLjPyB6jhvUech8Untwvy5abUxco7qgGyn1yHemxPCsRTY8Fgp2vc?=
 =?us-ascii?Q?RzCkGxpgTvw4bVF75XMa50Qv7DdS2J4TQhrweJs3XbdMIccGfkL6Ht7lDT+E?=
 =?us-ascii?Q?G7i8OkF8rcSnMTrGgElsw8SFJ9s8RmPmOQG+5xJMbaBdQ6FIVGx3fqINTOeo?=
 =?us-ascii?Q?1qyjEPzJaT917k2Lea6bYicR5JEj+XsIxuD8Q+c61wBsywcPzmZEiV8wwx0/?=
 =?us-ascii?Q?udnuRDk5LT68Czv30+MkrswIeW39GDZ8QUCt0dF+gLSpIeR5L2JmRcWAmpt7?=
 =?us-ascii?Q?NB8SjcZy9jArCWgJYgp6Grf737krhaEqTEmWwizMfioTielKPFyHpgug/vFp?=
 =?us-ascii?Q?SNzsQXgizR0CzEZD7isNQikfskjNyFrqxagffj95OnKZgoT7syTZgPnAxZKP?=
 =?us-ascii?Q?6dpf2FIr2U9sjYDg2hB3+bFrIWwFVw1i3JRmqMW1rwYjEkv/RQF/8tRLYPlw?=
 =?us-ascii?Q?r3whWYi1tMl6Tneqf8Xt3KrCA67tcMEkZsqNH5N8L8TkFA4WtIlCmM2SGO98?=
 =?us-ascii?Q?nsD1pvwwM9lxT1ImKaq24Q0ry0GR5/LfXPHFS2y/yDFaE3hQ/yFgX4mpSWv4?=
 =?us-ascii?Q?W+nJ+BdoTUMc1qCtIvHmdirxTRugenkRNWWsTyOOz8gGHvqoCJHQLbDmPBRg?=
 =?us-ascii?Q?7hp4ZeSu2m0YS2BoBLE8/VALrEsUruL/iVSE8gHNpiwJ9OUF8DLjV8/rdfmI?=
 =?us-ascii?Q?SNkSZZto+lOPhkh03g82LSVIORnJjyLuHpIGkCJO2nrhdDOQ/H25/Y+mbTB0?=
 =?us-ascii?Q?sE2h18ycncLD3tSs0lGlL9aiOzboIolsjibugxzy0i6TuOIRjXNew8kXsnz2?=
 =?us-ascii?Q?UrbiYyxWyVcT9Y+1jqUIt3B6ubzHNJjnu5yaf3gbtmowoiWbFkW72J0TuIvS?=
 =?us-ascii?Q?wvO+NhaAU2BdY0aH4ezbwxfDOJDFVF2NUWlOMtxdEqQZdxRgtzJ2luUt+cMS?=
 =?us-ascii?Q?/56o0uSnyO4zsMfx9slk9GGr7OmlVNhPUTBpJlr1iRzSCmIBKOHQm19kTZKK?=
 =?us-ascii?Q?qI3PWPj7KBYtAXwwPIjsbXC2F/F9oKq9AzsjKook3WNR503I+pKM83882OJt?=
 =?us-ascii?Q?B8BmpDNLRCIKPe6HeAr1syQwQ8kO3JopNWZHBRRPy+khKR9QfitVr7Ntm5Rh?=
 =?us-ascii?Q?gm53yk6uDxsFrrpa5E+U/zFQkyUt0fskdu39k6RndJ9G1fTEWNKXEGDSiXpU?=
 =?us-ascii?Q?1GvdtkcOCOE0jaMrx4nNH+SuqIcssZK3V+zYtbpXFckxmxIAOVYVW9Vli+I1?=
 =?us-ascii?Q?rWAWE/nG21LcttSizL68gUfqwShiTDE3iKfXC3HQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d703efe8-e9b3-4a5d-d301-08dd80a0c3f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:50:12.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ottPkF0vTELSdAFOtsMCx5nN+OAhT7r5lAJ25gGZS0Akdd8tCitN1jgjQopEUwfuPjJUgyZgCB2gtJ8y4FDFNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_235015_085333_B6A02A6A 
X-CRM114-Status: GOOD (  16.20  )
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

Add the minimal board dts support for i.MX943 EVK. Only the console uart,
SD & eMMC are enabled for linux basic boot.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 - v6 changes:
  - reorder the build entry in Makefile alphabetically
  - remove unused sleep pinctrl for usdhc node
  - add no-mmc, no-sdio properties for usdhc2 as it is used for SD card

 - v5 changes:
  - remove the unused and not documented 'fsl,cd-gpio-wakeup-disable'
    property from usdhc node.

 - v4 changes:
  - no

 - v3 changes:
  - no

 - v2 changes:
  - newly added for board dts
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 195 +++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621..48da25620db9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -301,6 +301,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
new file mode 100644
index 000000000000..cc8f3e6a1789
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx943.dtsi"
+
+/ {
+	compatible = "fsl,imx943-evk", "fsl,imx94";
+	model = "NXP i.MX943 EVK board";
+
+	aliases {
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_SD2_3V3";
+		gpio = <&gpio4 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+		device_type = "memory";
+	};
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
+			IMX94_PAD_UART1_RXD__LPUART1_RX		0x31e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x15fe
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x13fe
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x15fe
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x13fe
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CD_B__GPIO4_IO20		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: usdhc2regvmmcgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
+		>;
+	};
+};
+
+&usdhc1 {
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	bus-width = <4>;
+	no-mmc;
+	no-sdio;
+	cd-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
-- 
2.34.1


