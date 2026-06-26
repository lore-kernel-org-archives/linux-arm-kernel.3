Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325E7CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q9+7cOP7Ff1QdF+hcpEndtoLM1eH945ZqCem593y5Go=; b=lAtuXzIdHIKG7r3yZC3DiyxKI+
	igtP0g/ZjIVYVgOSNDAmDLhrcqn3dw1oRjT6RReD/fKtvZSeMyTo4RbvgcfpxHjhjinLnwR2Z+IS6
	vLjv61LCgwiKA8VyXonA2G6N8zVugGX4DrxAiZXUCXmxrNAcFtWafOIQ9JmFkZ8a1NxQ8c4A3Ton9
	LfVzoQ81Xp8wPHCDBT59ftql6Z06wrxpohG3qw0Uj0s7hyWijXm/4qZuga9McRKp9lbdHhMJgQ1s+
	OUfu2NYyM8FcsXJJMtAp+7qz0o8F+PZsOTi0IsWzG98lHGQflFRv0wLlq7wHqwNoF22lpGx0jNXEy
	oDy8fdZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwKy-0000000AHkg-1tWx;
	Fri, 26 Jun 2026 02:30:36 +0000
Received: from mail-northeuropeazon11012009.outbound.protection.outlook.com ([52.101.66.9] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwKv-0000000AHk2-0a5I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:30:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ufp1wSzkpTUmRvva+LibKUGXaqOKUUFOPevlh2/VQz1M9cM0Sy68V+ueL5QtwzubzVAz/W735q8O2aUEsEBJj13sR/c4ca5QMJIjFVMKABqKsijgw47LhymVl38vEuexlVJtqA8Vu4BUPLT7z4+4AtbR4JqaNp6s5X9gxat7jEhGYdHQbxJFIvXQTwGnarpKPL4GU7EXBJiIJWxsCbmFhsxkyZPAR3vbvl4X3/Y/ZTbLGQtHTLZViPs65xCQLyhwhj9GQ2gceNYKct4MgjFqUYJ30p+LKUZ9FX29fLveR8rZJEB/ApSXpHu4n7yQvq46BxBskzGnpbt3k8XEtq9TeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9+7cOP7Ff1QdF+hcpEndtoLM1eH945ZqCem593y5Go=;
 b=HuarAR2s/RHT4O1+1ZjVl99W5GOJOfeymsYlNeQoH0hjc7DRp2nrf3F7IcF4lgg56C9lJNFyXYSP/iUbzslwMMwU6BooSt+3wpLYjZlJyLUYi8ZL4nEMhe+tpthcYH30KGryO/lOui2qMbS2hjJSezG9gzpFQfb0aCp4e86XoX3y8D4hlYDpNK0PwBY1nTiNxSUOzxDiUUGdcbQHckXasI1SzQNW/aJFCiXcI9qBJCziV8A9xxhIJKLxBJUWwkREGuDEdulisEVLfjGV9yN7Y8CkHLjaCdL2FiiCS9acgX57Bzbx3H5O+jN8GC93Qtgjo37vu3F6JMV7WNReLvUvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9+7cOP7Ff1QdF+hcpEndtoLM1eH945ZqCem593y5Go=;
 b=D26oByns252f/nqp6aj7oVwM7Ei8b2gz55lbvWPxQmHaOQrFVjKs9tE7zr+lSQzDc3HzKHOLMjraCBTnbaiwwI6uKQ586iPeXTSQk3agtdNDAfF+sXE9RP6kQ+NMlpkRLrTyIIim9s0aRvHosjrdLNdduDppLAuB6u/DR0gWBiCJYJNLciDRsHh1qGEdXqnJgUv29JFT/abcQDAIKYiWFIhMJVKX1wki4GQxYge5KV5Gn8iJ38nChL/ujss90my8VbliwNzwacnBTNuifu4UUFiwURr/Z1qUbXeKKas00Dfg5BI6lgpGquc1FM0AzSceL8lNcsGXiRRuhm6zfcCtxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by PAXPR04MB9445.eurprd04.prod.outlook.com (2603:10a6:102:2b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 02:30:25 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 02:30:25 +0000
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
Subject: [PATCH V3 0/8] Add PCIe M.2 Key E connector support for NXP i.MX boards
Date: Fri, 26 Jun 2026 10:31:18 +0800
Message-ID: <20260626023126.2189931-1-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0270.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::17) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|PAXPR04MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 0071e469-b294-4092-72f6-08ded32ae0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|19092799006|366016|6133799003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: 1K+VJ6/mxwtGj+ORFRh5p23K+iQxuvvMgfj0RzWM2F0XJUEbNJncxiWuc9ssFEONx5KIaGLv2GgJwVBKLUYuZR1alrOlo54sjg7g1CFkfd7JDiq/ePuB59ZOuLzVFH7g0ftWCK4FonFa4MRgNJWCek2PWGfiCznVrEFM7VC38TpOA91NXo3fDYI1UQ9bJyXX3doQT1krl/V9cJzU+JznX94gFE3rQkVa4uvcvSgNbZEe6FXGQ6ZUTFMDA72QJOEbncMMSs1XUaKs2UdQ/jcZ+e//f3uj5ecYWyhmc3q42gZNPJazx16XvLWkui2E0eMZRq7Dt8gypYoqwP0A5aemqv1SwThILKFhKhElEvwpVpOhQZ86JqbxTLoggXgHJRzJ9esM2rjnbSkd4eCUpmooedgBT02d2InvLLQc7CjlEfVwk5Zs0FVEt5nBNuYAxA3WYL2nGn8CF8RNVGfSSjLqGvu9zWNYVi7pU25kRXTjx3qrrLAYstE3g/gfzV1r7QHEn5BaYlhd5rBavcvhqbESV22NePRSoEQ1XBqRSOmkgWJ0E0Kp8bSAQSAWKy021jwO/b56jb/4EsFPbDHEDAo1ZGPa2PuXv09k09AygXDx1K4OYciNN7YXrJfmumEbd2aPvklYoB0AOpIrgUfk4vcglHu5J2+FqO7i+6Q/uotrlqg8FrU8NS37QkyxT62xWsb69NoXH7WPSnVvE7EHpDngoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(19092799006)(366016)(6133799003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WtyecYo5geVHGCXdziDaxiByBcZvs+LrJI8Oj7r/QWCRSCfhQ+J4BGeU+AjJ?=
 =?us-ascii?Q?1hOSCe5+qLqkmhqg09GncZ+TWRP0PhtghxPwgFg9mfOkI29nBvnufpqmoTFB?=
 =?us-ascii?Q?RF+uGBfhgUxYyad/pytKNjcK9Qic22YojNsg1nlUILircaKWwdeeEA8tTu84?=
 =?us-ascii?Q?ej3CL1j188TAzC0n5r8wPk2I65vcrN51nLZNviXe1j/CnP27V+A6Rd7OcysT?=
 =?us-ascii?Q?Q3scKTAHO4j48neHQd8z/puv5e0bkHH024TXO1Qsxsdx66Kp0SBncBldRUD3?=
 =?us-ascii?Q?sMQ1mVcjAAWTVLVOZMbPYjuK3v+zwvETwt+xt0KCu7aLlybQqAWZREy67t95?=
 =?us-ascii?Q?s1D0zad1EwG9RDY/GA5NWkMQxIYmG5N7ATtU54YByZDxDAXGRhw7Z3JqUil1?=
 =?us-ascii?Q?+5Hz86ka+S6PWrLkccsOSzgGwbi7IzrZxPzESyk5uNDCJH1svGv6Om4DTG03?=
 =?us-ascii?Q?PUQ8oxfWbtFxOcJLElVfEM73KkoHndQnbXpp6DICpANj6k0ETdEH9FwWAPb2?=
 =?us-ascii?Q?KGpNbFSd5haF+g1yTA2kpk+I/9oSVXKjwC+UhsgcfNzk2eQgomvd1NTnWyy3?=
 =?us-ascii?Q?VcZ0CT9RiqL+VbIXn0Z5qLKbL8gie7YJ5SiKRgdrP1GXm68sotn6HZpkJllI?=
 =?us-ascii?Q?0Y5EbgXrQ8bhbg7v7+J490ZyvB//XQOUMwlXgDwk+xvNiXPJFsoxbGIpnHQo?=
 =?us-ascii?Q?5cZ8RWQkyc6v2yWpxClNpyq1dBmXahnxS6fEnwWbDBRwBCx5SM+RXTCBJYc2?=
 =?us-ascii?Q?O+tsjmdt8CRJ4BNS0O8NH1Yj6K6JqswEVk+zqVCtXnKIxOU5mEse+DeAFvXr?=
 =?us-ascii?Q?ugJoZp8CIl09NGRQul67HNY9P63x+sAy2vCQLjvxSHDROp7disrPw9eI3BRW?=
 =?us-ascii?Q?7upk+DxH3ICIkCGNTtx3xt4GO8VGMROFxRLt9hq4UCLUB6JTYAg9ihAl1Ifr?=
 =?us-ascii?Q?H6tO6ucLifsRUcDut6Oov08I+1q1s0eSfm/gqgZ5aMxigC1UJNzSbbAPi6Tr?=
 =?us-ascii?Q?C03w5ZkhiXePPe69pUqb6J2Nhi6NQJECCEkMFDSGjzFPvsJ2H/jBAxxPUYu9?=
 =?us-ascii?Q?YBUliPtfhGs30U2J0yGOfnsNf2rugXVyV8npv6NVZRCpN/tNtn0tpocBI0n+?=
 =?us-ascii?Q?EuByf7OoLl6eiZGgDG+H5qSqod62YlZlOu8T79rn93lrl6NklYirOcktxHK0?=
 =?us-ascii?Q?C9uJI+AIaoe10uMkfXdLGk1nUFFP/RTs2SmzR0uE8QIqWeP5nCbrppHfUDPB?=
 =?us-ascii?Q?bKWNHe/z/7IQZLJFjKjpHmXTQ1Bz68ANUYFkGRXGffqIzsTnHPKG/a4804cf?=
 =?us-ascii?Q?CNApVllixm4o04Q8PERZctK7BtOZP1drWLOcvaJ9M74iPoQ3dfGodjzIlV7c?=
 =?us-ascii?Q?dzfJAiPTA05Hi7b9hb9hNIppyipodEoq+sqFiTHjqTI/5WJpg3MZBSg981Kt?=
 =?us-ascii?Q?0U3K6uA8W6nVByzrwAxRLwRi3qiGShD7sR970Tld/O/J10vF31OC3Bd3Nq19?=
 =?us-ascii?Q?oa3me6jM9tpLiYyVS0OfaetB8H2T/e89DAWuJZK+6IkVj+URCnIVghu3lCfs?=
 =?us-ascii?Q?6B4YvjBLYb9jXtshGMB7vqwlo8ES6TtacQx0PH4Cq9bifreGXwGUeilQF/3M?=
 =?us-ascii?Q?0pNxdECGS5dkeavhnEyJ3N09fjO8wKj3dITznfp4wpB4GedMnmtM1ISTk0YI?=
 =?us-ascii?Q?U4UA1Kj3nnUzXlOuqTqXY3YjEktZGg5/nwd26su9GGTnmvE3K5/ys7otuRMx?=
 =?us-ascii?Q?no0/Vlk7BdMq1R0npaoYM0kzrX37xgIQqMqdB/hnwVrevGPpf3rR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0071e469-b294-4092-72f6-08ded32ae0f3
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 02:30:25.4595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNaCgDSTOIS/fTgWhxgM0di9qg1e9eCxyPlHhOUDaASYl2XODa+IgeNX4YmPpDW+FqnFRURvmIXJQknLkx1PeQSZq5PIg1g4Ll2uTpWfvAIm7NQ9lqSLc5SAB+pssA/O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_193033_189882_58902BA4 
X-CRM114-Status: UNSURE (   8.91  )
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
[2] https://lore.kernel.org/all/20260520084904.2424253-1-sherry.sun@oss.nxp.com/

---
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
  PCI: imx6: Add skip_pwrctrl_off flag support
  power: sequencing: pcie-m2: Add PCI ID for NXP 88W9098 and AW693
    Bluetooth
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
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  4 ++
 8 files changed, 250 insertions(+), 78 deletions(-)

-- 
2.50.1


