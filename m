Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70560FEE4D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0RV67D/fyecEFKG7mZEfMRrUBlkO6e8nWEIk5ywtHSU=; b=kbXSplAG3P8n0vsNmsTHPXOz6W
	pnSOH7RyO3GgcL3BWkT4UOoigaQ29g8DwoxBGCIE0xh7m2xeyDadqEg01aJBZETlrLD6qY+CzJ1Cd
	XE7lszj+pBClJdw/AoEDReN+3svYXFi6LrBfhBlTInqUacyDWv8ip6uSYnA/LxBAu63/9CAAxh1wN
	s05qPyP4G74sdVr7McwEWTNsddoffKVRtxncof++GSGhy97Xu1E5Ylxlfsd18XHowceXeIimp/f2v
	rKSTAFlIz2DeSkr/5GXtdfoPU1ZQ8KJYfAFBE/x5s/g6RgVsZn40TMCThDvk55ORr0uIG40kQb+uy
	vKPLBqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFNO-00000009dy5-0AjN;
	Sat, 28 Feb 2026 08:08:38 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFNM-00000009dxl-1kcr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 08:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=av4cuUgTJWrZKTPjUxCX5fRiJ86hN3s28UD6LZLw8/1QrGPLpKnWFWhiE1jJrI9bm+AtOeIgs53KVWJLYT3ZL/vzH9/T7ChUxLa9xlJ+2pJdAtL2w5K8b209qmLbR3L35NhoYpYP0O+T6sois1Y0QUvzdFizwDXBOGptg1YetLPR4ZsdKLd9kACOzM4t/LXry+yHsrhkNr77tIMAp4YjYZKfRFKJ+KgjdX50Y/WEKv/Qh+7LLT7CzBHFk7Kh5tl4Nxsamy+nFp4IKDbrKdp+P8OH7I6PwymNOfeYSh+uu3gsbfBAnbEtJ2raz6l9xJKOxBS1z8FNC4sGRgnXactq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RV67D/fyecEFKG7mZEfMRrUBlkO6e8nWEIk5ywtHSU=;
 b=FdCADSWTpWx/zUgAp3d75tT5hTpsuOljlswF4fHyKUG/IKk8BoCKvkeif8FrdUd25qkVaFwkRBDlgcIyoTAlmWLNaOFP0rIaNK/dDqXBQztl0aa2O5Lcoam/3OLqsJtBMEMavQ/7c17eZ21JfHh4zx1wrMmm6NSFSMdGR5ksi+vK9P+1g8KOM7FmTWl2m11zoLQsr8OTDOUIdaMFjp3ydGfiQf3Gg9Gqm4tzk8wcuWc9sQ8q4X0q+OwQqMI1FjGUn05B2rpLx+5eyggkIYl6dqNUIPAuhJi6izYGR7Po6Cmg/97uvUIR6MkwoN2Zog+1v9zNEZzxYWZghaQfxY2lVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RV67D/fyecEFKG7mZEfMRrUBlkO6e8nWEIk5ywtHSU=;
 b=CJO9fIWwvGI+7zxLSbIdtlWHUEiHoqoIcNgsWSZ66xJQjzVndTSrnW6XdZ6b4l6xzt0yvxBB2DH5bky67MUgCQNmvXbW4r6cwxwT0efrsA9xVh9tufeYrf8q8CbfbVoDujE8fWV1R3WTUXriLglCr0vOnzuSQK4ZnBWTdvuWjN2qZRibarhXgAjAXSavVY5Oky1WG/zrXNNFOIlERtTHtXNtDuJCcyOsK1NBPqy6z+oJEeGTY+HQ/6EWc2mDUoZJ0Ynbl1SWTL+kzX66V14ghDGyYEOu3MP/LgpS8eymx7ZnXIDRgOG1tYGHFmuaF7/82foptwvSgqwf6/y+fNcQpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AM8PR04MB7809.eurprd04.prod.outlook.com (2603:10a6:20b:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sat, 28 Feb
 2026 08:08:30 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 08:08:30 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] PCI: imx6: Skip waiting for L2/L3 Ready on i.MX6SX
Date: Sat, 28 Feb 2026 16:09:25 +0800
Message-Id: <20260228080925.1558395-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AM8PR04MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ab633a-007b-44b2-ed46-08de76a08f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: SjS9+70MOTjNsbS5tF6okiWQgi6SY5GqKqzntqStYcIDXkY9rjUow1c7HQTJBi8OjujKGNONpLDI7aRBSUBUdZnAduGcfSjahKOr6Vi0YFIgd9g7TLbPZ5Bw1wUVGUdDGCcbQqSRCw0Dgap82Rrq81YJY9a4qaeAPvXkn/+8Ihs8/TZXhS99VSZLXm+V82gJ8/l7Hate9c2UBhbAfAKcqHpsTeVZTg78nr8QM9he9zSAvagvhUPNm4HebR0c+95MQtuJFNXQT+/l+pUllmGssmSmptuwvPxk07NKtOMDH9ACe5j8L/fU3dy5T4d+bvm23FXwZEGdiUDr+VWiwYJdabsUhJ8fgGrABO7dtPFtQ58+e1RT1q9Ckoj/BSZLeYO3CRDD5OvxMzaOaQjHM+LXGMvkNNOyzlMaiJ/MYv1mlRkI0U8uEgsB2LTsrPuQ8aCDPa3c1jIMsitQIvyJ9MFGF1hSHGZp3MOhQDQqQ2QhxY2fHgc373vftXAt7aV4rMJic/wLP3msP1xClYGOUES/LLj2yFlcd61hnps8grjAxdfJU9KABALToVayJQOuXRz/5m1ZGB3PjrOyiPKpqDFbpclnwCY+MH+M3h05zOL6XSXnt/2jcVSbYgEjKdJfO3V2A3ubrXQSEkvgdmTjPI9A9B9Ofaa1L7dz2zZevVjnQ8qmZE2Hms5L2Jv6OGz/qmALgaO7dRRxq7XDoYwexMYJcLBFJFIQuntyW6GLjhFtV9kvWc7371JljPCh7E93bX5hKhS7Uas1FMm7f4L3+2qkZHmebyGL63gyXsrfPZAsBB4N3TpoJ31KFQwLkhC10WEo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R4F/znfSeJcRDN/YU/2k3c42J651xi7sj15ceU8swyz6H1WEuQlyHP0yIPyL?=
 =?us-ascii?Q?RAG9z7cydl8t3+R/xbU62UmG+F2v2Bb4NQEo1DpVFCMn5+72ckVCckWKAYIR?=
 =?us-ascii?Q?0jTglw3NVQGVKHuHxJeQPQ1/cAfbfUgRwl60pzuG9gYjEKcoySmjpAz4/vPa?=
 =?us-ascii?Q?N/twLWbinDZ/Pnk8+OZmPqqdksGGgLkei6rZlvLVW1EVdDxGa5VJvdYsVyMM?=
 =?us-ascii?Q?10fJlRgVXK38ACgyVzvXCWpZ53O5ZNn9tbj3xG5x9bwtpn7MAQXUYj6nLPWZ?=
 =?us-ascii?Q?t1RgUlEl3YglAV0SZUIVH8CfH5GZoXe3iRBXHSMiNlHNN5wX83Gb2TXI6L6u?=
 =?us-ascii?Q?0NstDx0zjeHeE91tZOl3s71pOWh6+Sjp2t+LHXC/20Yk+8nxkuLVSUkyj6NY?=
 =?us-ascii?Q?AyiURI+tdVM9xHN2p5HZdbkbG+HSoSqbXMJzMrHt82U8Iaiuyg0CQxK6dhnm?=
 =?us-ascii?Q?rkoN6Os3rgVKhk3tw/+jSLF9IDhiepZi/Q5K5c9shn649QdyBwVcWUu7lDya?=
 =?us-ascii?Q?tnCCpL9ssliHOnXphiZj69Tb4FgZvWllMZ3MnRu62cABv0NJl7tbdc5ZXZid?=
 =?us-ascii?Q?LFU5zSQFC0ipcQgvsBSZz9aMuEKVZHkAXa0y25V3wRp5qi6Aojjm8MMx9QTU?=
 =?us-ascii?Q?6yNKFmYtBWw+E7Z8AwSLDkmCuqL6pzk65etypqxpToZqQTwcUvU750XhXWfX?=
 =?us-ascii?Q?xBlKLStC6ffdBvNsRp0JuQrd7ehSL3s9PYQ7RKa3OV2xQbBR8yIa7fB1uXMZ?=
 =?us-ascii?Q?+5o66D7/HeUy91m6xHrwwWX5W9lzuO+Zj+3SEAy6wKXjgH6NQCpNmGjn762O?=
 =?us-ascii?Q?TdRSvMcgxib7V2GkszUY+Z4yIHY6Pul4iEOTzF0h/T9ki2DQYIMdeLrlx5cO?=
 =?us-ascii?Q?yK9Uf07BE3Y7z0t7+F4yMH9s2MiMiDWclxx0jW13YGytLAnSODI+tjW7+cb8?=
 =?us-ascii?Q?BVsDQ6AcJUT5saQojzGGZe64AUVsPPbeNlvbGtO6bv+TupiOuQz1B0KwmrO2?=
 =?us-ascii?Q?JBroH9zl9LaA9aQpbH5Hgc4UgCMurWwjFiz8wsuhFhgWlXuSEDVGwG/CsAJn?=
 =?us-ascii?Q?0KjtiRdn3a1Qhm6m2msHaOg8HfCGHl5B4aA18iTlI/rp/dgGUHJyNspN/hFd?=
 =?us-ascii?Q?ZYXkJdLyr22edVVALkTxWoO3VWutqVPhltb6fump9gMccEc7CBVjCsug9HY7?=
 =?us-ascii?Q?Fon2gNkMPo9KImj9uReHl30h7oQJ8rfru3aozGWAdnPUQ/XB3JAxcubGVgwE?=
 =?us-ascii?Q?+mucnFIQnl5TbLlhofTGdo3txbuQTgLbrri0HgENyNFVTPkv4ga2qugmiV13?=
 =?us-ascii?Q?GPZbXpR1B8PJEvk9Oesg7jM7ywo9c06bZrLmMQUxhZHWNnWf+Awp2UY/O9ts?=
 =?us-ascii?Q?uFN9TUbEsA0fUm45k4ggZY/MzWbjyySEI5zheL4FBx8TEeKFRvZGV6xj11ld?=
 =?us-ascii?Q?xy7KYrlvVrnGRCBBD9VdbY3uOQtDOIWHNuZzx+GnTykEwjWgQEVi+JVJ5E39?=
 =?us-ascii?Q?Tyz0FNxB9nCrB/zSGvChVUErrECsPHC0bzX15IfaJARbkICQl/SbeghFVYeW?=
 =?us-ascii?Q?KJgYk2SlnI3ACJpDjMAJXhyW6f6hpBulq819NFZmKp9pQJhHsRCxmTTg3vVB?=
 =?us-ascii?Q?dv1Y8jgZmwHbIkyT0eXLq7Tn3qq1NlVVL5jaUk2IPBw6JG4xE/rQOHkWP36L?=
 =?us-ascii?Q?8vZDwZM7GExPdzQJ+SPYIgjNUDfUOpu2ZR+6h+9VeVkNpJfGe+GOIY3w7drC?=
 =?us-ascii?Q?iY6+feVnlg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ab633a-007b-44b2-ed46-08de76a08f2a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 08:08:30.5945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJPki6Wwk5s/wPWpiVBxAxvpYmS8D4d/u/TcWtR0cAdytIsL8+BA1OZdF4Pu/iFbtNWcqUx/BVLGBDCFgkaMaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_000836_521942_1EF26A11 
X-CRM114-Status: GOOD (  10.71  )
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

On i.MX6SX, the LTSSM registers become inaccessible after the
PME_Turn_Off message is sent to the link. This prevents verification
of whether the link has successfully entered the L2/L3 Ready state.

Add a new flag 'IMX_PCIE_FLAG_SKIP_L23_READY' to skip the L2/L3 Ready
state check specifically for i.MX6SX PCIe controllers.

Fixes: a528d1a72597 ("PCI: imx6: Use DWC common suspend resume method")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Cc: stable@vger.kernel.org
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 2d01c21b5570..4385cb18e240 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1871,6 +1871,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.variant = IMX6SX,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
 			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
+			 IMX_PCIE_FLAG_SKIP_L23_READY |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.gpr = "fsl,imx6q-iomuxc-gpr",
 		.ltssm_off = IOMUXC_GPR12,
-- 
2.37.1


