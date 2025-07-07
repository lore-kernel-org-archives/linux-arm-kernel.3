Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1383DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rbAxTmUrHxl5TAViWpA6SZ9E6uPxsIKRZ9cDtJet/HI=; b=nKNLJJ8PJ+pHd3sdv5JdHys5Ls
	eXNVMBglCGAXLkaHaBPIPNMwthTgZT0kGjBIf+ywqky2gzKFU7Z6Au5+p/X2g6y4qWNaer4H3GDpM
	a19iifpQPGnocK0QlgC7opEqmjGoEShTds3FXPfvp14P3wp60QMOUaAm4cbuVNunMhJIqJg+dwYiy
	8VxGMU7Jvq3XeoUvjeadhs6mezQakVJuXoRPrp9oUquu+GkYeSKaP8coPEWdMJqKXSYRaYvedRn29
	iHcQ4S1OQgDdnuxB5FlX1tbPyHwlUe0jInFLFZyqj3+7TbDww68D3gP+xFqt7OsVMWe0H1EHJ46J3
	bR5BViEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfYo-00000001ZXR-40ch;
	Mon, 07 Jul 2025 06:42:42 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfWW-00000001ZJP-10R9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 06:40:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eubk5Wfhzc3eX75AaqNZQZrdnwX9OSpPkSaj+sgGHYDeKo6YzQLzpbK8gBbAkeSvPBHD+sqmZ42ywuSAw1fIsGS/Zym9AuhHzqTsaCNTT7pOwNlSvsvvxAnUxeKzVPCnE6xUHVw9SdxcaT5ToLfR6035JpzELedssRg8NmcBgcnal2ceFGMO6F0Ea2/OxAUFccM017sHwNfVhtXYpwe09cQrSU19SLSm/RxqfQkBMulzB13LwQwJP5uq9XnKEYIGvSfuiXYgfgeox3rbGl5VbxRvaSpzS6fn2DwLoIqXmM2c2gmfydjAvKjgK5QQ56pJxzxHsJSdVbf7CGTj0K39ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbAxTmUrHxl5TAViWpA6SZ9E6uPxsIKRZ9cDtJet/HI=;
 b=bdQVFHQnHaaHkaV9XSuSzvHqLxgIPQJo/o/lt3bx2PYTp01mAXsTtJB1xcU9FWgqkh2rwPGyJ9P5GuP25maIVC0Ssx4aBxS6HeH4by3xyy7M43mEJY10hjbkjW0/9tlpBXrNQe2/mJ5kAr2gAftg5eA2z/OnGGtzElgW78AYW6waDXc4UtD8e7n69AFOSn/yeUncdx1SGCr38+dhjcf4bRp4AzAibZhXBfjio/im9JBsd5qWQ+T6Q4VLGDEbDrjh85zxVmhtEDPOCFq/3PomvERs3x43clPed7VbP4Ux5w0ALt72glOwHGglHo6mhv13I7yNch/qSI4OEnE+EUjt8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbAxTmUrHxl5TAViWpA6SZ9E6uPxsIKRZ9cDtJet/HI=;
 b=lA4YFy3WKdrWlCXbarynHV7Dun1VWDVFiQppydVNUYsHxs6zrDSwduM0frLrLn0cqiYPtHEDAbiIJGHINWOkiORNqKajSqsqORDCwS4OfK6+i+IAc1Cw6GgSnyACkcSE2VTGhUAdCrB4Jie+bgT0k3HxOZE8cueHoJXhxEa2IrQwqrcAV7jUOeWvTkAJMp0u4K11Fi3vy7Sdx4KzIUtaybBs0GUegrmDnbOQmDD9+e5UEwSTKRo2QSYn6QydfoIF2r86dRTTOEwg0NkOGZvqxB0yw9HzUdAAioup4Lb3XYf6pXNKMY9ZM1ugPzR58c32yrDzj7LJngu3Mu5QoXlVZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9470.eurprd04.prod.outlook.com (2603:10a6:102:2b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 06:39:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 06:39:56 +0000
From: Peng Fan <peng.fan@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] MAINTAINERS: Update i.MX entry
Date: Mon,  7 Jul 2025 14:37:53 +0800
Message-Id: <20250707063753.1684144-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 8051fc74-7cf7-4aa7-a8f9-08ddbd211630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4FVWPIDw9R5k9DfnYHA2Y2/sIEr15IsahsOMTXy6FLdvP5LQdEUiGEMyxtyi?=
 =?us-ascii?Q?wnZHds+t+wgtiaXtWfwisMRKpsYGQ/+vmaQs8P6sD4QTrtaq/6erh+8uG1AZ?=
 =?us-ascii?Q?rpZnbq5N1MI3/OZTkElqJaw7Q1eNSuQ/P/09JCFVe+e7ZSbm51ItTVxnPJyZ?=
 =?us-ascii?Q?GpP55x3wwxXAHtUc7LOIj+NVbfkswppMb1j/n6mQT/T0f+/Ju/wlu0xBS/tc?=
 =?us-ascii?Q?wSDX8xrk9BAAnGwhkTxdqqUXtVQmbf6xSRCbVSfpk0ks9Li6SfsQqsotUEH7?=
 =?us-ascii?Q?HW8FEz2AllpcdnrEOwKNxEH2tkCQCmAe6QsFEkDhnQFGf1En5kFXxIB0fDVL?=
 =?us-ascii?Q?qztyWcnD/iKfWdp8mSLHrcqfqeB3eFACaQJw+XaIiDkKkdBfzAcDp1aBOZD/?=
 =?us-ascii?Q?N3gIMZQip6D2Qu9L9TjHMMb6GCc4C6QtkDwou78wruDgQM15w6dJeWbfczW2?=
 =?us-ascii?Q?vOQZTxO58oVMmBWHRQ8ESkiYbkIVec11bwOjjym/xY52OE0GbH/lHjlypZUY?=
 =?us-ascii?Q?l9+A1bpPiuFJIMEkN+tMrrG8SyO69ynxwyrx7vF2A6dSCgQsjzi19g735GR0?=
 =?us-ascii?Q?eVq0CeIAKri9DMcE8uw2Lotsi0A4aEejD2kdbKoVaaT6Kybc4HdEB4osVkNG?=
 =?us-ascii?Q?B5uNMt0W6YTiS9kLAa41kpE2ijgGNGd/5WkYx/XW5Ot4un08rGFb9UEafz0O?=
 =?us-ascii?Q?hgtVXUQa7QWS09HQEkhH7QHQVwdh3ewIFWrlWYUilaYIdB6zMeIpI2ytXBc5?=
 =?us-ascii?Q?Gy+eECLrDjzlJfgj2x1B5PT/LYHw8UF+uFP3L1UyfNr2hmtXVK7x2YC/7rH3?=
 =?us-ascii?Q?Uc8bCjNksVwSyeM+udh8XhOI7cmbVxaGMW/081waSU5Cc5xqWj6h5cF2L1BY?=
 =?us-ascii?Q?cdS8pH2knAWhs0ayLQ0jVqOetUiK6U6uL1bGAyK5xlzKI9gqvRKkCnj+T/py?=
 =?us-ascii?Q?1DinCagiin0Pc5+J3fJD0goLdRJxYgPEEg+ZnFZ2epf5QvKCVmYcD0GN5Fgs?=
 =?us-ascii?Q?ifr53LNtXNT3p3THMIrxdJNYJ6JKlSzuJVO7ArjAG44X/Bvqxv2rKg5OkVpc?=
 =?us-ascii?Q?E1T6v1nU4ZgRFeciZ38+i+RGbSej2jGRaqnEYkCyVyZM1VI6mOPEO6qrtQCR?=
 =?us-ascii?Q?Y37zzJd5u3Xe2L0Kv+a5nNkNnHVWw3R7D3IEGsfLnjBiy1FURrVgGwdUQRnL?=
 =?us-ascii?Q?mktl9WDxM0SlhqwniuQkbX9L4h/k/txw5XOIHCwg1SpCjY2GLT7ueConBNOI?=
 =?us-ascii?Q?mXIdomfN4QaDBPnhJozZeSgTwMwNyWn4+gDmXQHAvHbzU3KwEZ2mWI6Ll0nG?=
 =?us-ascii?Q?B/DGeosUgROltN13hBbu1gVsaVJfklEy53c1Ux5E9etixrfvvVAfeGT1dUhW?=
 =?us-ascii?Q?oMMrblU3r2IwvH+rZ2mKtWWqTwdWju9mHl2QG6anLvTGv+J5xaBEfMRHyvMl?=
 =?us-ascii?Q?pPzec7F3WDvYOq9EoZjAwUKVnrI0ov8oWG6fVMQzYZbJcNZ2uJ1/3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0L4w7lWk3xWbt65P8XqhFqNOwa+nuzUcIaYUB02Zws69mclLhbsvFp1hY4id?=
 =?us-ascii?Q?6T0gs+IOSKbJMwvutA83CsSdcP3DxQNwjzecPPC/rV8/5oKEFdchvlUMonjq?=
 =?us-ascii?Q?7xAv5TZjokZc/uvXc9AmsbZdIs7O1NzLNDHmOZ84enWBEZnG4jM3OYs7RawI?=
 =?us-ascii?Q?SocxSaFmXIt3zepDatqJNOo9XRwLRnEho0a7FhjKo3+yytsPczFVHqN6NjCX?=
 =?us-ascii?Q?hMF7/l/HmpMATfHXoKq7boEKI/3dBotciAUrHAGWMKaBnCyidQMYY/4LZhrG?=
 =?us-ascii?Q?1tJMrvZqw2UXDB8J0ZNFRJ9FN5KWDO8GTYPpYoS2GixxHh2FdWlTd3PX8cKd?=
 =?us-ascii?Q?jXjGU4BCb+behQclsyaa3XKqQHKRQtHdyGpd3RjtS4bEUJuxxoJrnKh/+F/+?=
 =?us-ascii?Q?UgUgyjuXtqZJ7TI43owdc/gSwqEW4YfWkKSkOh7GKgzgiyxO/z2TPIpJPaO6?=
 =?us-ascii?Q?PccTN1VR4xl/neBnlo6GQ+YCghcGbVSFJUXYt1AwtKtW8fI899NAkDpUfEUh?=
 =?us-ascii?Q?MtRDYo+g2UvxP2pzBdGQBc6kZoMkvztZ5p3gMth4VFF0oGYM7+qUOuh3o7MF?=
 =?us-ascii?Q?i2xlHczo5hdqET2Dn5ZZN55kx/JTeU7xAfcRAD9H6i2kHpdItzbYLqNlUqD1?=
 =?us-ascii?Q?9SZBeAJ0ZMGRiVfUTlrBtC4Em9Z1GgI76XzDjVPXOyvVjubWN5JFbH9BFfGM?=
 =?us-ascii?Q?BxBs2tvDFrBGWXJ/TbFAe3kagefUDifH+Qimb9oR/t2MF8jKxakZQ8zXNww8?=
 =?us-ascii?Q?KmRMMn27oB/78gJkhkSTCBnTy1jxBPzjtrS2+LiN/E+Eh+EPY9wX0viliUsJ?=
 =?us-ascii?Q?Airn7Jw9J9YqO9Yp++6NbCMWKimGBHm61dbMN4oeLpK4Cmd7pDjUT6yGy3R5?=
 =?us-ascii?Q?Rp9Yig7RVQn2rLtKhAayPkoidk4l4329AtszSAJgOt76+AG/eDmUv+C9UH0O?=
 =?us-ascii?Q?J4RW0vnzBqNEvSZ17R3x8pO6Ei/M5WtyiLCg161Ho2FWMmMHvBrQ55J4ZN50?=
 =?us-ascii?Q?+Rlp1f2pzeNZtifjvzr2VCnvdTtAX9v9OBs6/f+nVHo/xaZp4TEDD3hrQYLK?=
 =?us-ascii?Q?R0jJlgSrOSbQ4g7MWCXQRp7Wkx++Lo0Z1+VojEF0AuesGHIZsvv0v5Co2jbn?=
 =?us-ascii?Q?L+yMXoMi6SB3WIz+FW52CL45J1pUoBS7kR7TfhQXHoLQxZFKEWI+G2p30lQq?=
 =?us-ascii?Q?6z94VBAvMLVwIqu363+zlDDQSx8k5aGkVUT7tRAV5vwE/teW+IbVDS45WtTu?=
 =?us-ascii?Q?UH+txcZisTfYdW1oRoVUBklTEpMwPStNJ2LZYRbdDPM/YsXgwIJlaNna2laz?=
 =?us-ascii?Q?ndCuerOnqGmHogp8osUOeSoAfFAUlIk+QlK5tFYkNLNcyj1ymsEi1jX0pTnE?=
 =?us-ascii?Q?5LZka+/KJAIKbTHinhzhyntUPRYHlwX7AbdRI904x1v9X7IUDOK0fQvruDMv?=
 =?us-ascii?Q?3UHDPMcErJANl8Xr9MTvPXazSauYiHN66Edpl0k3HZL1cXOb8TcNK4L3HemU?=
 =?us-ascii?Q?UgtrhX82Grtrq6l13k4Pk6bwavXibPy22CnC6aruO7pxUam6oCDro53vc6cR?=
 =?us-ascii?Q?D9M0J4cp4XNLVL5VXFQnxaBz+kESkduV3TkHbXQN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8051fc74-7cf7-4aa7-a8f9-08ddbd211630
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:39:56.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1RUVjtTQ6GEYRZx5DYtnG9XZOZNDxQmUkCVOPKtVr+xsBjQceW8WqmaUY7Bbga4uskRXX4xqmFUsLB7DqGNmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_234020_274765_18A5F38A 
X-CRM114-Status: UNSURE (   9.33  )
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

Add two patterns:
 - Documentation/devicetree/bindings/firmware/fsl*
 - Documentation/devicetree/bindings/firmware/nxp*

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8be3e0fbe72b..b15ca3e13ec3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2596,6 +2596,8 @@ L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
+F:	Documentation/devicetree/bindings/firmware/fsl*
+F:	Documentation/devicetree/bindings/firmware/nxp*
 F:	arch/arm/boot/dts/nxp/imx/
 F:	arch/arm/boot/dts/nxp/mxs/
 F:	arch/arm64/boot/dts/freescale/
-- 
2.37.1


