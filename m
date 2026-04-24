Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06248F589DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QADazFGs8a0/GnpYdxaWb+nGmsud2GZz5RcuzUcyXnA=; b=0l8NCt2LrlaGHQR/Up03Am0lK3
	5Z8w4rZRmENon2+TdM03nxBb9dZiBJjYAnPgIYpMU52BrSxqGg4YH4XKee/gjxOHBBC8a/IOEWv69
	N7YnquMZGs5PMY4PK3LV/H0h+RgUhh9T+XGhkT89GbYL0lKzAuatlGT+4ZKf7oelE3B6finAm7bIz
	+2j72pmRrKEayujQlvs+/1wZ9d+ChHLFMLBkw/R+rz1/peoc5Ejq5Jv8UgvyzMqGV3bUnZlvHeSuO
	9a17qDnhobdFMAXYDuFmxSFMFAx7mZzFPe8tnfTl6b+4vbXMM8teP9jZ91DzGiZscP50bF9YrmHDy
	Ak0mSI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6iM-0000000CXvt-08VS;
	Fri, 24 Apr 2026 02:56:22 +0000
Received: from mail-swedencentralazon11013007.outbound.protection.outlook.com ([52.101.83.7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6iJ-0000000CXuD-1f4k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 02:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxYtrU/hGxBVv95GARc04Rixv/YMx0227alx+Jvu2Q23bgaQQ50hifPnLZkD2eD1VA0lXljfXL4bPkB0PWKit4V/pAAHhivKVEIccPHKrpGrjyxtZz//IbRQGf9qC4PKPhjE97l9Cz7OioieswCfQ3X9vSbzAhTBur82u4hUmRw1yEuy/3FMCuHEFYwxL2Yg9cViyRIQ5nFP6SWs0haj9iQOKhua2A7WznXF6tY9HsRyhadxTetbapAU/MhZWk+uCA6VYScr5scWOCfNRtsZseWIQNkKBDu0AK2hSaaJ8QXMPrlx8JiZDS36YJqXLzhhxI5F3lV+PlkbmtAiZodn9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QADazFGs8a0/GnpYdxaWb+nGmsud2GZz5RcuzUcyXnA=;
 b=eEnwFdNxafQM5Sgwi4X6Cba8cb5G0Q6cvAw6twwZoq7X8FUUceJLdj/kUeG/9NEZgJDmyhRVsHX/TU1qTaSD8e4a6gqYiEuCzOFkVv3Xr/vcx3rLn1Cp5xRYBW8DcNVyMriJ2181az2G6w9BkUTWGD5c1gZvY2Ae+fvZnl8eJFQWdsm26SXrqyx0AogH0BfdW+QWcwzEmZRyPDYFZVVHQAPi2yUI+h8bqkbKnSNBluNCkRdXvZt0ZkC43xG9QBdB5uvcs8Fp+TJ1wnwJafx4gI1D/8Ked9XurvIHQb9heXy8oql/taL8xrPpY17nfsgj1SC/upjInNEpaCxpFCBejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QADazFGs8a0/GnpYdxaWb+nGmsud2GZz5RcuzUcyXnA=;
 b=P46jce4Lg+OT+6Z8cFjSFvm2V24PZXCBmgmRZxaZM1q9WHtAEuKAG1cEw5Ix+8Tv3UHWTNmwgEgz+gj74OyQDZ4zcTAf4kiSv1h9ltk4ER5fWeSAYUb3/XHp+c6lKUYX4hWm1RlHoTZ3gG/GmAuDlGNuiPq5+ZYSEYSZofwUxec8S4EJgC1i0ebIkRD1zKxuGaWuovXbp0WRGnmDMa8rrOh7XMNdzPO9X0lulErqS14YsBN9MO9ZJ9mJcch9BOADknBqQe04LEVUel4T9q9C+p9zx3d3K7Q2NaXA1m/b3Cgw4QT8PRjMzKGuIbiHMwu2fTN6UMaZkIxJi8+fhwvO8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5222.eurprd04.prod.outlook.com (2603:10a6:20b:11::12)
 by DU2PR04MB8791.eurprd04.prod.outlook.com (2603:10a6:10:2e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 02:56:06 +0000
Received: from AM6PR04MB5222.eurprd04.prod.outlook.com
 ([fe80::374c:87:282a:63a3]) by AM6PR04MB5222.eurprd04.prod.outlook.com
 ([fe80::374c:87:282a:63a3%4]) with mapi id 15.20.9846.016; Fri, 24 Apr 2026
 02:56:06 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Add root port reset to support link recovery
Date: Fri, 24 Apr 2026 10:57:32 +0800
Message-Id: <20260424025735.1490772-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0223.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::9) To AM6PR04MB5222.eurprd04.prod.outlook.com
 (2603:10a6:20b:11::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5222:EE_|DU2PR04MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d75f1b-0b08-41a4-ba97-08dea1ad075a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: KDtckg38tOyDVxOYuSVw2LwzV4wUqU3+DOrAF086C2k8snyMng1HBAbiC6rqqZJjHLPiWZ8ehM7HaujSYg4dkz2emv2alvp97ODiWEDKNkN1fTuPLE5XGPPnSNYMQQcRLgFrI4AIWCsfeYjwr/oHQ80Nz7IHEStA1QASqK0LdJtrzuD6Tggmokv+eY2ppXHyzsb4IBGzYFxRCPzyZBmLzOp3hG6JEhSlgltmfsfJiUcIFq6GjQQgxj9JKI3gQ2/hBYKsWm54hGKiw969aI73NU6JVkyd9a0VEblgigqNITW3SOoFcjLh2f88zc2HoJbqojShSkZeobVxgI2GiIAbUElO2C2R4ax2VX+Rbj8IPuH4r+7kjHmya3wyUkDShoQ/Kx+5Ydj8v5D//YJKzaz3gN9JJANbXqP/rQmKTxAwD7S0AyUKukFVl+ky1LSKVkqhYxd1Or3+BvLW63+zz2kiRyteExU/jCGRB6srv08pdt92S12aYxJP9iHwxqgqL2bXm0djCOkJ2LSlpMkVAp+cuCRQxeKYFyKXKiNxOTS80gO5xUy8CygcOg0OthC6KXQ//2cun11njP/TUEOn1WQZw//9VoE2aL92QkZApxENSYzx2MbUOQUsK17Z4oTSf2yOxoHBnFry0nBwPOy0opcGygbhJwAKyBAB0Hsu9xpfMxjQkVM+LBEA2MDWVSSeCDSakEjV5yXr7g9xR4VB0DKkdL9eRCuB4i5NvYitNpwbgn/eZi/YB4HGFAtPvVK3jIKeKhjqkmPJR/SKn+OKwkfIzwQeVo8pOjgSXFiATiiLghVyrkZfUcDspz7AZDfHbve+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SF+ph8vKakQSU7WUpmcCvDlkjaKqIg48HrG+HzKoGd238fWXQnyDaXspvac7?=
 =?us-ascii?Q?bypXWP5MIRdn+XJs8t8q5I0qf+8JlI0j2gL2K2PRUJIehf6gFtiptNOJZ1wm?=
 =?us-ascii?Q?UOWYJmCy3oyOeMRzWR8CFl2Eye6MtynWuh7gpYRSaCEbxdeUIUKr6tXSFk2R?=
 =?us-ascii?Q?7VwRFmSjuuIlhcrXghtV+fzx7J7PZSFVLKbCMUe4vmaHS5VkU0Cfb69JgLAZ?=
 =?us-ascii?Q?UDdIhvwSNUoL0qQ1H+ENPXqK4Nayy20u9YOhCdjGxWMEY82ncmVWxp7Kz0IT?=
 =?us-ascii?Q?r4jiblJzNF8rYBbpzuPfrnuyM3aiaegVoDr1IZ27XxNKOiFTOudIVeP/VDgW?=
 =?us-ascii?Q?bzirsp8agTY2zJcWElEnjT42rp8P1qwIlPVuAjQLT3y8kBERCxPnp+NCkyay?=
 =?us-ascii?Q?RUb/m1k1V4X3CW43pcj+u8/xG9WlafHV1D+uOOgyd/2nbURI9W8z4M25xs20?=
 =?us-ascii?Q?1FK4c/bvRO50EFMja1yFzDsDwmOFfeZve5VOypu2ZHJU/krIT6JAmykBymg6?=
 =?us-ascii?Q?iHiBD15PGDyrqbfDNfJ8pKAlUv5WbpU+RqFFH6qTT2/4gGm6Iu2ju8h4wQJ9?=
 =?us-ascii?Q?DmloYIR1l/XLzjJMpgCRZutQSakQgQrNYYsINZOWanM/aMm3Pzh5hgOMWrKr?=
 =?us-ascii?Q?CIbzda2U9dT2DV01rLnKXbke/Xf9sItKqyI8mlbXNvvjVINujRMUh80m43cf?=
 =?us-ascii?Q?xZuebQQDW0D4h85zm6GLaHuKFfOTSNTeqR5pVRV4ivjS/kAaU71bQoDioYyX?=
 =?us-ascii?Q?zdZfwmmzHrykRjs2PeWSRLzLcsNoELe4onSe3xnP5+womKXEzD79mIA+kGb4?=
 =?us-ascii?Q?vJ4EClL9MhuY+8tyc1Co5leDQ4sK976QHM/vjh1J3E9s0wqqpO4I1xFhr/Wa?=
 =?us-ascii?Q?Ro3mkLeOkyOCpnFegJ/SUUp6O327ML7hmIrmq40JXaCr3bUcLLa4cO0Ij6GA?=
 =?us-ascii?Q?6TAMun7w05qCAK3cNzYRyxfostPFAvqbhvzKkbINWtayYp0g6Uj1asQoWI0/?=
 =?us-ascii?Q?yANZSIdv72d44PmX4Oc3bWTdAaV9YX2kKvsc0Zo5Hhw86TQGz4D0LKnvLSbg?=
 =?us-ascii?Q?w1Y/Utxzqq4QheNv/VHFGKHuyIKCTdsOP9aN+M2IlPs29X3cxQzzJuv+lhkq?=
 =?us-ascii?Q?MABypcHYzD6rOhYyaYqs9oMeQ2jsrEvbG1RUU1oBPyg6hSy+zL/6xgyT1aQY?=
 =?us-ascii?Q?lTRFdGTqmk1smFgkQmmCOX1Jro7iBg1KnMa5k89pG8IhKNpFv2ctIeDD49qo?=
 =?us-ascii?Q?Sou1XhLSL42i1PzyOrz3rx2hT6335z9ZKHO7dEEpkk79nBtkq3iDR1I3H4LD?=
 =?us-ascii?Q?1v9FN+iy16xal6R0Q1+4U7SnekvC+RRMi0G3EP3IxW+eX9DrEXFhBASLaI//?=
 =?us-ascii?Q?3gLGZeAfMBaZuKD+py1AVWdFVoGcjYpVto2yitudQ3ojLlcQr7VycpxN7B6m?=
 =?us-ascii?Q?969iq4fqtfUesbeFgj3WB+l5C9Iju4L7NI2vjhN+3W22kOHb77vl+HhOOjrM?=
 =?us-ascii?Q?QwPjC7EOlSX6E6D9MZsecycJYhiw0/bFXQSwoPnHRjPv451nZAETybVMYsak?=
 =?us-ascii?Q?vdoLLl2pldTD8Qupn4QrKmInSDs3CVKbA8BBFCJKIY2Zq+/E3T5TBA6KC0ac?=
 =?us-ascii?Q?fK5zNv67N0uwwQ16x4lJGHyRlhBJUBt+MXzFZKRnR33NPLQYvGuhIPw4gaCE?=
 =?us-ascii?Q?WzGDQjwnjHVHfMczTskG61cpkwDgjLl2khjRCgczWQK9MLLql1REZpvSeK4a?=
 =?us-ascii?Q?+ryugYsXOg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d75f1b-0b08-41a4-ba97-08dea1ad075a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 02:56:06.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTA4lfBywO4NlKLiyy1NGXX+zv1ymMzvMHf2M64LBRD+sPVS3aHNf4uGFCLtn0NNhMWcZxeVZG9KGmmo+cwieQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_195619_443456_B3E856BC 
X-CRM114-Status: GOOD (  12.74  )
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

Based on the following patch-set[1] issued by Mani.
Add support for resetting the Root Port for i.MX PCIe to enable link recovery.

[1] https://patchwork.kernel.org/project/linux-pci/cover/20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com/

PCIe links can go down due to various unexpected circumstances. This patch series
adds root port reset support for link recovery on i.MX PCIe controllers when the
optional "intr" interrupt is present.

When a link down event is detected, the root port reset uninitializes and
reinitializes the PCIe controller, then restarts the PCIe link.

On i.MX95 platforms, link events and PME share the same interrupt line.
Link event interrupts cannot use only an IRQ thread handler because the PME
driver uses request_irq() to bind the PME interrupt directly with only the
IRQF_SHARED flag set.

To address this, we register one handler with IRQF_SHARED for link event
interrupts and manipulate the enable bits of link events to ensure the same
interrupt source is triggered only once at a time.

Additionally, this series adds 'intr', 'aer', and 'pme' interrupt entries to
the i.MX6Q PCIe binding to support PCIe event-based interrupts for general
controller events, Advanced Error Reporting, and Power Management Events
respectively.

[PATCH v1 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and pme
[PATCH v1 2/3] arm64: dts: imx95: Add dma, intr, aer and pme
[PATCH v1 3/3] PCI: imx6: Add root port reset to support link

Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml |   6 +++++
arch/arm64/boot/dts/freescale/imx95.dtsi                  |  16 +++++++++---
drivers/pci/controller/dwc/pci-imx6.c                     | 122 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
3 files changed, 140 insertions(+), 4 deletions(-)


