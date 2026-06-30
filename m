Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85562C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yr0aadfrNXL03G8hyRR4WaFkTg2/Z1hbqTtUQmWYexQ=; b=k+1kyIcQXpZFwzcesiL0M7sbQD
	TnmoaNNFz3RNpBEUGS0QkCroFATHoQI58Uk2EaBkhI2lyFDao+JSPIzUbO+CcU6bpX/3o2sZ2mDLF
	wNrwOYpKE5cRNewG2cGD7ADa4/DRjqpJIsnMdoCmXGqOXPduA8ExbjkzH+EnpydDeDLfSA+j2xJvu
	JwEvSPJU4QXcuXqUHKLZ0busSTvqbpjV0TJbiHRUxfdTWYFAB1ojor7YwMX7e+ukIKOtKKNH+HOpa
	0YazkQwHng41VzrLaDWwWCD/NxSg1HC3AuH6pF5PrOur80DhSFpCuvBxMvDkhQI4Ly/IHx1VYB1to
	wA9lxUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVjI-0000000GeBr-3Cfw;
	Tue, 30 Jun 2026 10:30:12 +0000
Received: from mail-northeuropeazon11012069.outbound.protection.outlook.com ([52.101.66.69] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVjF-0000000GeB9-0psf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:30:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jF/9Hzvu9YnKKuMwnXBLocrbZyeeuLGi0vASWoazoe7KDUO1cu3reffqbrdBVaERWCDCq5D424LoXyYrG8oXpEDMVSq8gPYf3J+93oERHnullWfpTzDfFPFkzSJxQebxECLM0qsF7eqd7m9cbNVS1NBjPuRI+Ttk8NyDOwYPxHqaoD23VoXQoN8DmnNM3BpwHOjfp8Hi8a2DhWXtnsuy3IKW5xDfIURjTS/bcYP0a596ynSMbiAO9i0zUpuFZyXYV9z/vG0fCVbA2cimXhomLMcYot+w/l203Ly540Wpl/Dr3DVl9EIwPIPOJdWshBEx+x8heOsI9wjooRsNiF2fHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr0aadfrNXL03G8hyRR4WaFkTg2/Z1hbqTtUQmWYexQ=;
 b=FGdzigr9t6yq3FYWgbGoZ7OFx5E2GpFq4Q20MMlA5v18IXcR77S8PsIHuWHLKUvxrAkUibEMD0ip0VsqDwKZeFZO9WnfFflcFh20+L8U6dRr3xJbnQMKC1NiN2sZo+3pEFPvUVN/nS66IKODbvdaBI7AcM3c+7XYHTFT3UdHftXXpAAbqo6guzuZ6uxsaYt+06oxOvF6Q8nvvUWgaFWLYLs1qot6g9U6X1nrAnNNqDYRQPh/zNoLLM4rLTK5ayFpX0uongc5O9EprMDdu/a4ftXw2aKdZzLzAGj4652+mqmI+q3asnoJfBcS9+jVu7LhAOXSwq7cLHkpLoVhHCFjyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yr0aadfrNXL03G8hyRR4WaFkTg2/Z1hbqTtUQmWYexQ=;
 b=yJNs5K0RrrSspt+18rl9QErHXWCn87E+0vEB/7X8oqJmvIjnbKlOI1wdZp5Tl8FpkOa2jtCUIqT0eQBbjrQuy3zK0c7llCCBoMA67cqfouxhefHTV9irpgDr0dvTRpT3YGrwehzLDWRF33TxFSM39td6pGEsZuQvHSr9rqc7wWeJEB0qnwOfT8obZXYkWEaTcLOwxb8KrMEQG17EQpYlPqy4f6nGxKOYXlZO7GpcZ5Asc4HQurB2vC51b6KNJWImH9MDBSgmFrSjNlcZHqlHfomnClHtLOPvnVgCIZN7U0k2lS7OTDkJpu/g9pL/10zzDSbm7t36c9/Bgq3Jgrebqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS8PR04MB8547.eurprd04.prod.outlook.com (2603:10a6:20b:422::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:30:04 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:30:04 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	amitkumar.karwar@nxp.com,
	neeraj.sanjaykale@nxp.com,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	brgl@kernel.org
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-pm@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V4 0/8] Add PCIe M.2 Key E connector support for NXP i.MX boards
Date: Tue, 30 Jun 2026 18:31:31 +0800
Message-ID: <20260630103139.3823329-1-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::11) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS8PR04MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 7565068a-ebc8-454a-d8b0-08ded6928be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|23010399003|921020|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: pFKUMtZuN6OMSjiHP/kzS9h1hDGgkvXbhjOCU9KFeNVZz3kfFzWs8Ki9eOWgHrpIUxRmtyWEBmlzdYGRcRgk3IreHGlNgIea6rud9pOR7abb4BrT68zyHFPcbhMWTCxMP4q9VMMCIfyPh3SrpDdqHcsA5yg3BVqIoonQvAfhLSmGmnO7wqIyN2yY4gyRzKLiqiwq6B/ZRvC3K8foH+fCnP5QiRDBQa8eHx46LPpaUrJWvCiazPd6zg/4g2sFhdsms7RbkHbIZF5FgubQgR9lllWx89kCwKwk72pK4KhonxrBlnHpr44yW0bLG8hLwE/4v+hG5HCCvF1zcBFKYbOZSNkyPoLGRWbn0fuZ7dJF7m65fGVDB0bdV+uh0SBKFV0OVo3Gj9nv3oGv2mHBEHi+IODdX6RDuJ/3N+bECQrZ8ig0zwT4nQItKrlCuVaPVw1KKYqwGUHfjwg4cW1ZtLUU5QecgNbQFp2qtixurbbeo2jCNdE/yrTOEjieiR0tp6nH3Hr94/64doH4+wC14TfMhq1BKJ3BPQ1dZ7kysNdBhHTp5bWKB29/ZCKmUlsr2YfroPysrYB8A4QtNOMfEUA+ZsXLRRVEsMmmvesGGMTtLjDg8prkjGbTXmVkFabYCFLSvaHLKSsv6XM4HdGL20i77WYc22AgtS+B27NHwika//9MmjF8sjQMEsd06y7IKvu9AJM2205fEP9ofa2RMcr7BQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(23010399003)(921020)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?usrWwZse5v8++Ii8iUmbHgtypl9kOZ5UNhCjQSXer89qSIcgn4x11KCD6Q00?=
 =?us-ascii?Q?ESBXhS9gYqYwI3uEMpvhAvXK77r71Q74pNG177gAKnZwOYpfYgdkbRLNki35?=
 =?us-ascii?Q?AnJmuGDFHyMZXAfBCjdkSY7JXgPI6RfQDEieyUFTOgeP1zv98U29wP8gRyTf?=
 =?us-ascii?Q?21FCHRd1wgZUCZpBAQPhufrpBTr2wUWjH4/Ekixmgefa+3Hhu5gg6Ce3OT5D?=
 =?us-ascii?Q?MvD/mTMJcTDfdd5dSKuzqpIw3PYxqadXvVpH6pgpG0Ap0v8rt3oOYhfpBA6S?=
 =?us-ascii?Q?sryENKmahGMzd7zcZLoHDgRjEzir0awmjy+HNC4d5vcZIyW0hQvXHG6W39ab?=
 =?us-ascii?Q?rxXb2glwy70mfZv6YQ7mHmF191MQCv9lHQBoN7pmFOEIGEsKxiqE9iCfOv3p?=
 =?us-ascii?Q?XeR4WKBq6BckKFX9fgJ/jDV0+xsc0D3PJX1sa6wuJ6IFxRg/qbivSEJbUzyb?=
 =?us-ascii?Q?8cYQPt7gr2CNnVcWsG1oRzL5ytBvmcT93BFKbmhsk2xxeAvoD3mspKk21RSa?=
 =?us-ascii?Q?vNqidgCA/cOzgOM5YTZ7A5kKYpGfESl+NkyQBoon4cH03jBpvofVskVOXHnE?=
 =?us-ascii?Q?wUmazZfruTi7voEM18ECZOJgfzT8tv3UE+X42lIHfymLUqq7XmpxEzBFcWg+?=
 =?us-ascii?Q?yWbTsxuIW9IwS0oBlrFrZoIlOl3Iq2IijJGz8LrxwwSCtN+sGJLvQA07fcvq?=
 =?us-ascii?Q?Oord7MQ4AG5EjUF5Qnt2H+mmZoQFqsIPIkteO9xvGSz8gH7Pw+bUhec+84ED?=
 =?us-ascii?Q?WDvvCrmkWO2I6AaQYc2igtcsQPJABEPKzbc33mGpBxYF/2oa1ix1z/i16o4C?=
 =?us-ascii?Q?TVHVxyrv6vz0RkjdMB8lp471POesptIz4G1gnl2yEFbyPpWXyV0k0ob0rGYr?=
 =?us-ascii?Q?7TWrP4N1Hv6CyVxM9wI8w7E0dHUedtZrU43+dlKG5Wvakxt6kEOC1lj35qqP?=
 =?us-ascii?Q?NIP+X6Eg5r2gHTwEGQUYU4mYeuSo2/wYVFNa1ppqlS2ENkcF+3zF1dizRSIW?=
 =?us-ascii?Q?v0BRknTX0S7/3hFtvc1nfHm+nG2b12APy96QF1opMIfNKvsbx+XLaerIi94R?=
 =?us-ascii?Q?MusDGEU6SuI0O7AwNiVuWf0cUC9uuHzu74y3C1TkVfgN+/JGJYudX//Spxbc?=
 =?us-ascii?Q?zTJuTDC1FspfIll1ZogCR4BRtv64NcKOA9jKEsAqa7Iqs5mYCYw495yGKi78?=
 =?us-ascii?Q?6Fr6Yic49Z6e7qp9SMc3wHvGNxVPLbsJ+aZCx6WiWjJICJdFfOi45C4Xq1+a?=
 =?us-ascii?Q?HNQFS7mj7Ex/F0oLF6C05YosSmkT2vmfmda7p1wfaAdi4yAgAZxxDpuaZGUu?=
 =?us-ascii?Q?nGYyLKd6d4ooUqDed/jzxa1/xAfYaTjoha2dhY/VBa4gRDfWxKwQ6zi5BKVm?=
 =?us-ascii?Q?wI2j0M/gcQW9nFjv9MoJ8saaBhfTQU/fpW++/G6etYEQVlfJBjPC1EuvbOFZ?=
 =?us-ascii?Q?8Aj/U0S9VbBD3zccD4c19vu0Vc31uA+CF5nAhvmBwSszvzNKlwXzBV8rsa4P?=
 =?us-ascii?Q?rH3so6bO1GL/6VPEq55APvwTNsYXQ2bvJMCEaip/2IGALATumLKw/6G7lBAz?=
 =?us-ascii?Q?T9r7dAWaajqXLmNwxmz7WlyDcZV8ZeMYZiB46wZp6l3PgNdijxhnOmPt36AJ?=
 =?us-ascii?Q?qNqDMe3AyfIqo2eO5deKxsq59AhMFJjcH0aeSVasGM4DxYJn6MYuXGZAeAHd?=
 =?us-ascii?Q?mjH2jAezcN4U2PhtLW+tsfd1dKOUkio0T4msIAEJtwNcufxC65ljabYfP7dL?=
 =?us-ascii?Q?utyg0tH7wUT1RWEG/eUt/wgRq6EoGa4GknwrhtdUosbuC3IaR1Rs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7565068a-ebc8-454a-d8b0-08ded6928be4
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:30:04.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSu7V5Y9Drp7CwvlLyGvaC6KpJwxExVmcrkvNftasnasLAdwbLTlbKckB/YTidBQg7MpavWu5fWfGVOQAif+lI31j2QfjzDzHTw8988JwCE7T4rnO0s9fiPtMyLog8u0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033009_245496_50A5979B 
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

From: Sherry Sun <sherry.sun@nxp.com>

This series adds support for NXP Wi-Fi/BT combo chips (88W9098, AW693)
inserted into PCIe M.2 Key E connectors on several i.MX EVK/MEK boards.

For M.2 cards that rely on PCIe L2 link state and wake-up mechanisms, the
card must remain powered during suspend. Patch #1 uses the existing
dw_pcie_rp::skip_pwrctrl_off flag to skip power-off during suspend and skip
power-on during the init path.

Also the btnxpuart driver is extended to obtain a pwrseq descriptor via the
OF graph on the UART controller device in patch #3.

Note: Patch #4-8 in this patch set depends on the following [1] and [2]
DTS patches.
[1] https://lore.kernel.org/all/20260616105201.3214395-1-sherry.sun@oss.nxp.com/
[2] https://lore.kernel.org/all/20260630060710.3294811-1-sherry.sun@oss.nxp.com/

---
Changes in V4:
1. Add a seperate patch to move pci_pwrctrl_create_devices() to
   imx_pcie_probe() as suggested by Frank.
2. Rebase the dts patches based on [2] patchset.
3. Drop pwrseq-pcie-m2 ID patch as it got applied.

Changes in V3:
1. Move pci_pwrctrl_create_devices() to imx_pcie_probe() in parch #1,
   similar to other regulator_get calls as suggested by Frank.
2. Collected the tags.

Changes in V2:
1. Rebased on top of 7.1.0.
2. Removed the power_off error handling in patch #3 because pwrseq_put()
   would call pwrseq_power_off() to automatically clean.
3. Collected the tags.
---

Sherry Sun (8):
  PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()
  PCI: imx6: Add skip_pwrctrl_off flag support
  Bluetooth: btnxpuart: Add M.2 Bluetooth device support using pwrseq
  arm64: dts: imx8mq-evk: Describe the PCIe M.2 Key E connector
  arm64: dts: imx95-19x19-evk: Describe the PCIe M.2 Key E connector
  arm64: dts: imx8dxl-evk: Describe the PCIe M.2 Key E connector
  arm64: dts: imx8qm-mek: Describe the PCIe M.2 Key E connector
  arm64: dts: imx8qxp-mek: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 56 +++++++++++++-----
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 44 ++++++++++++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 58 ++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 54 ++++++++++++-----
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 55 +++++++++++++-----
 drivers/bluetooth/btnxpuart.c                 | 14 +++++
 drivers/pci/controller/dwc/pci-imx6.c         | 43 ++++++++------
 7 files changed, 246 insertions(+), 78 deletions(-)

-- 
2.50.1


