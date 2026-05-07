Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2675CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3xEB/08io/Uc1tU2NNcDNCUkYSjEV6IRYFI+N5YoCcU=; b=dxynXP0sx7olGfKO//uwk+pEar
	CW8WeXOvTv+gUOauwNQf1892Cn7IBiAIA4VPBDsJdzQb/GhqO7OJ+bp7zzi/EKhA6PMb1Gp2CbnRH
	LD6P9QGBrINVVCm/js0gD+MUeHLyaoLTshJ5bmJhFrN3/DgRX0yWzI1GJ6Iu1NHhjsDM3Mmtzg9Mn
	p8y41M1FKhRSC7/dvXGf5AnGXe1b4egIjFzQ5YM3LD/vf/qbD2JORrqPN2bfBesr/uHxA2+Fm+j8C
	6LO4aqUldw6V/0U+Il5ZLcAOW8HVsnOT6f0q3OPg42pO8G5qQ/XwOhYfcV4FbG7PCCotprd1tuQVz
	GnQ+fYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsa2-00000002xD6-1QeD;
	Thu, 07 May 2026 06:51:30 +0000
Received: from mail-swedencentralazon11013069.outbound.protection.outlook.com ([52.101.83.69] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsa1-00000002xCI-1kTO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xe0mVGlbR+U0VV/SFkxQnIn/SWz95N4YRQ47LBrCDkxwvrLaTCBQg1JSiJo3alA3dYeHNNaHy06IOl/x1vMCkEoffZSSsQFeoZyrJI9a2wQjhAiSV8IZskorqXQ15a5ZzuMtHOHvve5958g8yvSIN2BLQf0wl7ASQ9oqko75E9myst2U9rkNFRK/8VPbm2bn0g0yFMwD1MDSKvP+M9d8CPaXJBzXfDPrv0p0V88eIWu/GsAaWZXNxyHCh7uVBna3EMngDMw7zgF1yuQwWSoJY1hU0qyKa/cXu2mIGbhplPe7Ptjsgj+QkOoNVKZoYaOtKn4q5gWerRH+5NZJBkMCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xEB/08io/Uc1tU2NNcDNCUkYSjEV6IRYFI+N5YoCcU=;
 b=tzip2/hEx+h/TYu0KscKEgdkX902hj6wJGQP1lNPjoG1ETSLax1W9pImuh7fm8AxIbIGwpRCxBunIYO/KsAl14WXjS18CiFmKuqtXLD+sgkcTvfrLhu1jbbLVrnNg86FUr93JzTtidpobcrQzhVc/+xJg8xpT8cGnLLMEbvEHqfEkZob/wJ+4aaMs2vnxEff316BcuFCLUjQb+e90VraznL0KnvG+AWpHwxmPGdT0yEUPZibAy6JXCK0u4VD6LuDVBvL77RFGynaFQINR/ln2W0ptPsS+vE1es8Bnx+pAq2TPSUVZpZbIcH8Tku4JEMmclMWk8oYCMRQ6AD8oK1p3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xEB/08io/Uc1tU2NNcDNCUkYSjEV6IRYFI+N5YoCcU=;
 b=VrDL4gavlLdG2No0FHfDmSKeKywUjug7AwUswI/+ZRnrqKVu2/AVlsHWSv1CCyCHnXvToSN6SnXq7dtt7CEyFySq/D9pdSPXERYsK74r6dmqiYRgmi0Q91xKr1Abd2rfTSJ4sPFP+W6N36oYkVhljfAxA32T/kTXY05fMDd3j2WYTIb0FPYAikfAnDNcaSdB8Up/w1qrolhuo2zXgMqVbBuTcuSp/o+FFLP7/qlAW5Xs++ABRlf8zDBk+MwlhxxLai5gjZ8EO9E9ktgtLPP9Cnb0PhegEjh/vrV0SGMmQfkVAucmBoj+zzKreABMMggQyc7MGpFCJ806/RVvl4RVRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU4PR04MB11815.eurprd04.prod.outlook.com
 (2603:10a6:10:622::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 06:51:23 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:51:23 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 0/3] arm64: dts: imx: Disable PCIe by default and add overlay support for M.2 connector
Date: Thu,  7 May 2026 14:53:27 +0800
Message-Id: <20260507065330.516142-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DU4PR04MB11815:EE_
X-MS-Office365-Filtering-Correlation-Id: 774ad1cf-0e3d-4a72-db31-08deac050d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: YmeMOo+YgSRxGKfI6sc7HywMUJyKALhvl1e3IXXLQelcDpqAqCTXtBYBJp7gFQuaUPsNeqfwUFI10qcAFaBqtAl3U19x/GiLOKuM9oKD8ZTfbedtJ3oggqQQsFIDmSP7YTnQP2WgrwAhOKMgseLj6Xj+osbijrU/UxCEVgAa2bbjoXaOmFBxVzOjA1T8UQB1OA6KX7BqvNQbkpnW003Qniokq+0KoMKjWZyrVLppEkAkzHBZTkxQNOoozkuzIAy77BZBdQ38TMa1BDXQcBKZJ2EFdUBbym7LBexonijKmmDVnijsUQoaXTm9Cmdlv6mMxWmSRLj4PR+Jn2bAFgu+NhgkHnv0lR01QncWXkWvNZKB0DyyT7FKOzDkvglt6WNA3cy8yqVjqWJUYzVBhZ6YfQ14c0j41EwBEJNTZk1IjH9gZPezz0XYipuIAQ5EQVhIBbrSegw+q+bpyXZ5aLjxf5VAJ8QobXitOan5MY5gjzztRCeJlzkN5iZHd6m+Vt92HxUVXAh7kHDtLCeywQ51GQDQ2uGkRWSrFlMJyF1JbA9RFfj38sffxlaP6/wPbgOOy7k6eL5OpWFwOLZL0thtcRbfHqjZRJzWuEExqbALRvZRD9gBr/l+ytF3mE6F3CnxWmzSoFyTkGcYKIIwCpdYBlBcYSo6WXaRfkS4VjtjT9ddGzZHmqJ1MegDP8n8YiIITH8/2oSpvXoVqW0VEndVmWHQ+mB6UCG2mR3KKlYs9tHZ4TquNC/IzA7AOFGUjOhU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJY0JI3avh2G+RFHgOSyc4v6wzUnli42Pi4wWM9PfC6zHigeTwP4rfYX+0lW?=
 =?us-ascii?Q?NhWNkR/1c0J1sra4T3yqs05mr6X/gicICenzRe4IihQpv4q0ZgXTKogItOuc?=
 =?us-ascii?Q?/HzAISKsWdOoVDkw2wyV/UfN6WGT7s2DcGcdZ3ZimXXerwGxN9VzmHps0yYu?=
 =?us-ascii?Q?R8ndtdF+KuCM4qGgpqsyWPqfSGleLhFuiB7sP/PzBGjjGxSelhBJ0bgClDkS?=
 =?us-ascii?Q?k5rXdZfB83c8c/DVgvHTHqbKCKuX2tKKMYkgbgY8dYaeqA8GouUdkY5KsOed?=
 =?us-ascii?Q?b8VL3qav1/1eg46SQioqyyrGMifQfUddkXeaknMV40DFkYlc78exz1uml3rA?=
 =?us-ascii?Q?gFxOn5GYolizm8w0SPp3SJ+Oil7YAMiTuU+wTp6IC2RU9MjN19ZC51qHWAzO?=
 =?us-ascii?Q?9BXWHnHSsBtsMWaFiYRoqT1Qsd2alDYPy8IVSnBvp7fO8v3Id+wZ0I0HMQeh?=
 =?us-ascii?Q?2pedswHLO8/mmMtcN11CekxlKwJua/db/+dpM0F4LxNKJ6dsK3iCCfVidmqK?=
 =?us-ascii?Q?NmrzXZP/l/0MXs/7u7GZj+oWWDOUF5i/dOr9qFFnMsMYKSnWyASc/ruDA9xP?=
 =?us-ascii?Q?wy8w5+3SscPjyEKQzfwmqwd8sjm83ZYQ8DILKF7ODDYFJhCNur5A9MGPVmiH?=
 =?us-ascii?Q?Syb7qOvJOfzqNzKyAbawJrJVzldSkx3QMHxg33AKwXcovTQwUCzTrzPek9Hx?=
 =?us-ascii?Q?nl8MBnf/kbNj+QNTMLGKRYhcl6ZzoqEQtALm7XNLADJd9lgcJzk/tCZZioba?=
 =?us-ascii?Q?5PB9elE59pwNvsC4UrkydKh54iZHQZKM8pfRWb9ldkAObv92+GmvxRsy6Jvx?=
 =?us-ascii?Q?t0qUaWTrmEVMyG93avYvHcQyLtE/x98WLnXz/vhKGnncE+pKH+4o6wFk/4vk?=
 =?us-ascii?Q?bQE+SPSQR/YPjcnwMx1A19vHow12poRe+vFGQxaFpJc89hcUasbRi4POvTti?=
 =?us-ascii?Q?rlFNXEzdmpxY940u5FHuAvwqZEpCS5grJPtZZau2+z7N+nWeQZXU68ZcyCz6?=
 =?us-ascii?Q?RkS23iJmlxocDkji+ALobVe+A6y640ObAqlqdsvHLDMoSrHt0KeAOsdBkhKb?=
 =?us-ascii?Q?YKpwce/dyfFTwlRFVxJ5ejiQTYzR9uUV/gfKTh92vgIz50eqdLg0dcYRtVfu?=
 =?us-ascii?Q?uv9aJ6xE6hoK/43VP2TqS1nepkwGvZ7CWsGGikoAL/V8Gh/DJaZ0Q3OGvMOA?=
 =?us-ascii?Q?+tFSWldwTPb2hn00rG57+OdK2Q/dcHXc2ahW8DDFjMl3IFjQZFAYeV/1K54X?=
 =?us-ascii?Q?DHfX4BHfalOz4R83WeAklrszB46bLnOp5RX8DMerI1mGFrMFj6757GEXhdiZ?=
 =?us-ascii?Q?mGCcyM8DfKQXl0OoVlW0JqH/Br9WHsGqX8Vi9BqxwfKo38HmQl7ohxdUs+Ro?=
 =?us-ascii?Q?AqPUH+YMcxef8GgObc2EZoB3mlj7LoAPoLG+ObVBz0dqM+C8NERIjJhd9BFu?=
 =?us-ascii?Q?quV8AlU266SHC8XHMxOn3Jk8eCA5jRaPWdr5l7C0pXm3vPIReiL69sVG4YOf?=
 =?us-ascii?Q?ZvWFG4OplumstQ8/RrS9NrMYHLxGTebbhCwqFJeDuAqti/9yDPDzCx0Xs0tx?=
 =?us-ascii?Q?QVGvAz9dpaeSxTSJicXPCZDUdB9Q5iRG0T25u0iYw/6DV/fjztICzkhAjFBq?=
 =?us-ascii?Q?lJQninSQi5lKSOGCbNmE1Dw8Pq9LPuWp30azXNCzd71AdzHGBYd5Uim/11xS?=
 =?us-ascii?Q?vXiuTtPedRuq/5HrOI7kGLDx0GhURiWbZ+Q0fDcgpAzvhG0CTUDZYmXIGH8/?=
 =?us-ascii?Q?14443khl2A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774ad1cf-0e3d-4a72-db31-08deac050d77
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:51:23.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvL8607KYbVenfr1ydC/JRbyBNR5x36p+eqzDzdSd8jvGS4htlL59BFC8lBHkEZ/9blSKwxxANXZKlljt6aM9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_235129_461261_458A76AA 
X-CRM114-Status: GOOD (  13.04  )
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

On both i.MX8MP EVK and i.MX95-15x15 EVK boards, the M.2 connector
shares a common regulator between USDHC (for SDIO WiFi) and PCIe
controllers. The non-deterministic probe order between these two
buses can break the PCIe initialization sequence, causing PCIe
devices to fail detection intermittently.

The out-of-box module on i.MX8MP EVK and i.MX95-15x15 EVK are SDIO
WiFi (IW612), this series changes the default configuration to
match the out-of-box hardware (SDIO WiFi) and provides a device
tree overlay for users who need PCIe functionality:
1. Disable PCIe in the default device tree
2. Keep USDHC enabled for SDIO WiFi
3. Add 'm2_usdhc' label to support overlay
4. Provide a common overlay (imx-m2-pcie.dtso) to enable PCIe and
   disable USDHC when needed

---
changes in v4:
1. Rebase the patch set to Frank's repo imx/dt64 branch and add
   base-commit information.

Changes in V3:
1. Add a common overlay imx-m2-pcie.dtso for both i.MX8MP EVK and
   i.MX95-15x15 EVK. 
2. Add 'm2_usdhc' label to support overlay.

Changes in V2:
1. Improve the commit message to clarify SDIO WiFi is the out-of-box
   module on i.MX8MP EVK and i.MX95-15x15 EVK.
---
Sherry Sun (3):
  arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
  arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
  arm64: dts: imx: Add common imx-m2-pcie.dtso to enable PCIe on M.2
    connector

 arch/arm64/boot/dts/freescale/Makefile            |  9 +++++++--
 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso    | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts      |  4 ++--
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  4 ++--
 4 files changed, 26 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso


base-commit: ebdfb84ecf7a0bba26d7a04edae98dd600fd4b42
-- 
2.37.1


