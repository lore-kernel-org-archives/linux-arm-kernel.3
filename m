Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39CBD3940B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a6SvAAMmIlskCZySnBfE+WgXdPDcwuBizsXzL2rM9us=; b=VnUXgNifG1Mmg8RFue9Jsvala+
	kruLAQwA/JzzrHjZvq5PYfa0h5je2fn8zTgrM136LB7LSP0UVZuAOrNc+4WNV67N79i2t6GjOoKjK
	zjuo2Fd/xNBSf2Zw45aZUSK/RxroiIUDsTLgEz1fNBkZaPBR8E75nOV0SRGG5YODWXtJMCbjjcN/N
	exS/aHa0Wtoswtpik9v3GEBIvn6Y7rz0Fg1lPIaSGjh48KLPE2IGCI87CojcksEzLzHXQi2AzH4oD
	40//q4wudUZ9D6xppubBqis2ZqW8rV8oKbk7SU5iOTB52CboZ6tJqjpcgRZghpwokK8NTdoipBXjM
	D67R3iHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EzI-0000000HM96-0qdU;
	Thu, 02 Apr 2026 10:09:20 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EzF-0000000HM8i-2xSL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mY5pDQkwagRdHzWWht+mP0fS3g6t9uwUdbcChptBP9QlOUCjbLsBYjJnHpws1ldITevkbXukCsdlj21l3cjZHWfAreoVOjBWfo9dhZ3r2TQd9W2Y4b4cTrxrqVfVOCTu8YIrZU47ii3Jfrqvs2K4vJxHiBni6evAC6LQPB+OFij5BwiYyEE8am9XFOkEjMPUp7jsVuuvCQbD8PNXMYus/vh5RB/f7A7c4EPx6+Qux3KuqOfoYWQlr4ThDb+PlxDmPvBOuR7q4TgaqjnBZr83K78bNwNRA0iORLEuqkuuERHEt9+d7FYYAwr91x/BlvHK4YijHykyIsf26XN/ssMu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6SvAAMmIlskCZySnBfE+WgXdPDcwuBizsXzL2rM9us=;
 b=S4uQl5vbrWxdQxda1Fx6fr0mephuZ0nTXqwx7wgcCxTSIMmwHqzbgX6+ZzUsxk4NV+DYJEDfZwRYk2NX+Hx3eK9G+Mmj3yp0/Lk3op2HJY0377mkgMGj7OGvKihMGNrE0uF2Qf9KPdt+aM/SjA2qNcc+BdoMd2vMb94sJ05K9CBKeK0E558C6wkbjkf7Y7dYumCrgTDA2RVo//l+8umYvuC+79bKFZiH/qK/C7Y3e3ak+wbJ4IoFtZ6L4zJ32BFCW27kxO8hA38e30xkdWdz4tsgmDbJJrkjYSdbB46S5uaD64rvCnP90EMJiDdEpbqDLhl21bBBc6mD9cQDJi8XrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6SvAAMmIlskCZySnBfE+WgXdPDcwuBizsXzL2rM9us=;
 b=nnI7KgJcxSG8J7j7dotLAndKCftIeBLw461WKjLyLNe1uooiY/oqe21Z4iS/6tuWJI85e3hfJQkJIF2hI6vPE+VHOrWwJ+AbAVeTVu1jDa5mm+H1i59Jsld83X42BrxJe760tFKxpU3YGmFaVMhs2wqp6qkMnYeSPduSiLuqSbp1F4+/8yqAGncwVLRIxzS3XT/EJv2hKzZL5As9XGGECDxlEcsqwquZZZRm4PXNwijX0G0Gd4ioea+CdXYLLKdukbaubuzpkfkM6yOp+cjBwJ2n594RdGiU8IeNMZtz5uMuvTZil2McxRcO7R3p4HUCSO1YCmhOx5GtXTuuoJgyqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8706.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 10:09:13 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 10:09:13 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/8] PCI: imx6: Integrate pwrctrl API and update device trees
Date: Thu,  2 Apr 2026 18:09:59 +0800
Message-Id: <20260402101007.208419-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS8PR04MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: d990d1a7-eb91-4ba1-765e-08de909fe401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: I9IsGH/ddDjhg2rgJUr7wknSBX1e5SfLSm0GaBOtkrbbn9Gn9KWC8qWw7TW2TOdXc2VJWfBBsfPm68xiF65X5uQnaNLlSb/TXqfrO3FZgA+vvjsoSLgLonD1nDZHYkOLIAqWHUun6AO5OzDSJfz5a8vBl95X3CdTvuzjOlRhAQ6T+R3kOQ/W6hatrHX+52ELOP32AFDR5NthuBxK3sUa7vAAVs1qDyYgoxgK1s6gjCUKgfno6H7CZXgddc7azFiFdsNHOglASd2GAf7NpFWkPOUA5oQ0zzI03wCIw3MgzngRvocXSUiHFnJTLPk4Pojy5oGezm179DhhOQyB3sFjocdnW9Enemd+cS0CpxSiBGSHpulabSDCOPCAWyyP0Lvs5/xy6Loz8IFj4OseUqBxUdigc6B4S0lWWKpbIjrKX+whDX1Ki846IjqqIpjxiBdyHB3ZMjxJqt6b0x7GjHtsiJp9kgtzVN5aNFl5UusjnGLTWQYzQAJhwNhSYpdSvJ+dMftzkwjiBcRgqMk/xx5IPMFDRTr3kpKrnPxNICnC2w2WwTC3n8T+DuBOht3l43/WCC0GtXw/WbX6L68ETT9lWMC7EoECb/s1Nvh3mnaIC9EhmIwtkvnQAZjRmQ8kCUyIoi9itmWZVgFQwmjlFiAdY+EYa08Kn7EPfC0qOi7EJI3za3N/NnnI5HC99jOuIslnHy1Pfhp+QCXvLAXHijstp7BEABun7Oznigpc87sN80VfCGEfSSQAPulL222CsM8zqfYtJFK4d5S6mbgddG79XpiBAvhnJ8tg50Q9ORzM7e1fRtGhn5tGp4l17ngKiWfD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eLkmDjf5LIxUiUODzfVyVTQgoo/y9kFGYa7CWkCtAD6BXyuKLB1/lfMcAx5V?=
 =?us-ascii?Q?xMqVcGmJESXyRFaGQSRY20pW18pwxD4HhI9j07ciHroLPWR8DktdCU/4N7NE?=
 =?us-ascii?Q?trf+NFyFeCSBBOcPp7BIer4uGsYtEc7MCuQPWn+Yfu4CK4NPVfFMNBwfocIi?=
 =?us-ascii?Q?9ljN3BScAUW8Od5jfHgzjZZFy8a/LFQz9c2/1m4ByYsT338326WI5kZ+rXJw?=
 =?us-ascii?Q?dlNU3FL5QvnZU3dXusB6iU10b/ghmA1vCsqDm4g6oLN6f/FnGRRVX5cDQqFj?=
 =?us-ascii?Q?nfglVPr3XopG5H3WZnNER8PnEgvFPAgOxSok1H5qTUrU+a9PtmSeqr+CBwxY?=
 =?us-ascii?Q?PuZ30GunoPR5edoZIUpIapBTBr9zJuY/1CTAPUArC7w09x5APsdL9P+FirTI?=
 =?us-ascii?Q?2K/PFYZZAldoVZ5pWAF43Lmjgj+MEa1kZ6KiEMfJ6pYAi5lvjh3n0Yu5qSel?=
 =?us-ascii?Q?Qa8sXkLkX87TfZh9z6A4Ao/X/jReg9DGsyFbVwA4ax1RJUPKokjpz5KKgqLI?=
 =?us-ascii?Q?LxpSBshBCGu2LpYvnsoWYFN2lN8qcic4s2w9PzwCNyDSyYInB1037l/70E5K?=
 =?us-ascii?Q?b8Tiq3jZMjTmCMfu3HG4RqnnTdfrMHFyeN+/nzYjgyzq19PPY5d2ENJbrSMY?=
 =?us-ascii?Q?uEywj90rgNcf6h942G8ZM/5u2Y2OHTYkRunJ3KB0Waf2/MpRNBa/96+yOemw?=
 =?us-ascii?Q?IKqWGDslAQ7q2p9mvWCEyE7JzbHCjQlp6zcsPjvxN1hk+Hd43MbVTz+zUDQT?=
 =?us-ascii?Q?2qo/Sa72JjzJ4iCz0MGv+bETlmJqM54k+PkYM/t5xEtujQY2in6/1PZVXIvG?=
 =?us-ascii?Q?PiSmqZfXyst7VckeDP1KadTVL3MfB2BvQUoRRq0nlAnzlf0oRCl5lds/+Yog?=
 =?us-ascii?Q?iKmBc6kbermLznJrnx8aBX8d7WGdwR+ZIJvV/FhqWhnU8rdePW/6XCgKDZGd?=
 =?us-ascii?Q?VJjrXBM4KcjsdOok4JZQSHSNCGLKWaR5XanQEZvmNDys7uHZGgmR/NzMcWab?=
 =?us-ascii?Q?v5BUKbfyw/Z//qYKirLTk66ybOC4CxeRP9e1tqR2cwKJp23n3x9TMoZvGKVB?=
 =?us-ascii?Q?RHDF8Bo22BnXFkNYRPoJN/MNAgNGrlFsNmtYY0GSuaWLAP90z/8UiiCkXBky?=
 =?us-ascii?Q?BJ2bAOR3k5b+VzP4FfMb1wBrnhvBVvuqV+Vd6HE0KexD5YC5nO6N7654q9xb?=
 =?us-ascii?Q?cnT316zGyAHuSnLoVKvpK6S9RtPjeebC39ALqzcYEeQyWsqziZ0tKXf9GcSE?=
 =?us-ascii?Q?BRelQhzbm433LvVOBNl2K/HVX7U+pReMSmuuy3eX8VHjK4ymbQuiDGpXMSNq?=
 =?us-ascii?Q?8ZkCwKY2XNAWwHZ5sstCwRdnpSVyrDrhNkjfnGA+VK+GbPrmEPs0bHQNHoAg?=
 =?us-ascii?Q?5nR3qQNYkBxhOR5q90kABY7oPqtEzw23u9A3csOT8GIpU/mD4EDU3hNhqO55?=
 =?us-ascii?Q?MqrGurOZ8ev/U/RfizXPTjQq2qmtIXOAzWrKC19vT5zup12AR2O2PBwPLnd9?=
 =?us-ascii?Q?6yLcmYsptIsnxiULAiPd/8Km3cSxF9JSDYamsKwhsPqrN1w5GphTdhFuvJ3L?=
 =?us-ascii?Q?BB+6LKKa8WkMY/7qBrvLOlPljV5WBEXy19DGHrvmjq/T/uNEo+BtKVqjApDD?=
 =?us-ascii?Q?UJIIJ4o5QQ2VMcj+vTXJX8RGWWZy52joj8y6tt9Gd4+lbXTJdFy8Z4L9TtfQ?=
 =?us-ascii?Q?M81TYmVjvt/9WFFsnzgA29rgYPM3/D5NkI+d/kXV7xUvY4kznGNQz5hKr8xZ?=
 =?us-ascii?Q?jH5sffjwVg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d990d1a7-eb91-4ba1-765e-08de909fe401
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:09:13.3452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzHUY0h5tAyS7/EZ6QdH5za7Tl6EfKLXIMG0XXkPbXQTz9BBsLaGefjVnOWRBkAHP4k+GTGmjB++mwZzmPjaMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8706
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_030917_956255_21231BFE 
X-CRM114-Status: GOOD (  12.71  )
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

Note: This patch set depends on my previous patch set [1] which adds
Root Port device tree nodes and support parsing the reset property in
new Root Port binding in pci-imx6 driver.

This series integrates the PCI pwrctrl framework into the pci-imx6
driver and updates i.MX EVK board device trees to support it.

Patches 2-8 update device trees for i.MX EVK boards which maintained
by NXP to move power supply properties from the PCIe controller node
to the Root Port child node, which is required for pwrctrl framework.
Affected boards:
- i.MX6Q/DL SABRESD
- i.MX6SX SDB
- i.MX8MM EVK
- i.MX8MP EVK
- i.MX8MQ EVK
- i.MX8DXL/QM/QXP EVK
- i.MX95 15x15/19x19 EVK

The driver maintains legacy regulator handling for device trees that
haven't been updated yet. Both old and new device tree structures are
supported.

[1] https://lore.kernel.org/all/20260318062916.2747472-1-sherry.sun@nxp.com/

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Changes in V2:
1. After commit 2d8c5098b847 ("PCI/pwrctrl: Do not power off on pwrctrl
   device removal"), the pwrctrl drivers no longer power off devices
   during removal. Update pci-imx6 driver's shutdown callback in patch#1
   to explicitly call pci_pwrctrl_power_off_devices() before 
   pci_pwrctrl_destroy_devices() to ensure devices are properly powered
   off.
---

Sherry Sun (8):
  PCI: imx6: Integrate new pwrctrl API for pci-imx6
  arm: dts: imx6qdl-sabresd: Move power supply property to Root Port
    node
  arm: dts: imx6sx-sdb: Move power supply property to Root Port node
  arm64: dts: imx8mm-evk: Move power supply property to Root Port node
  arm64: dts: imx8mp-evk: Move power supply properties to Root Port node
  arm64: dts: imx8mq-evk: Move power supply properties to Root Port node
  arm64: dts: imx8dxl/qm/qxp: Move power supply properties to Root Port
    node
  arm64: dts: imx95: Move power supply properties to Root Port node

 .../arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     |  2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  |  4 ++--
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  4 ++--
 .../boot/dts/freescale/imx95-15x15-evk.dts    |  4 ++--
 .../boot/dts/freescale/imx95-19x19-evk.dts    |  8 +++----
 drivers/pci/controller/dwc/Kconfig            |  1 +
 drivers/pci/controller/dwc/pci-imx6.c         | 24 ++++++++++++++++++-
 12 files changed, 43 insertions(+), 20 deletions(-)

-- 
2.37.1


