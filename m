Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C716CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMXUb62XOMHTYd1WG1z1UfqZgzXlUR+T/1pRC4NacPM=; b=TX3ZFKqTocYAeufcnKhTYa20ek
	cpiXOWFyt7tXRrIzQczLfkS3EGSapCbCl0Mm3oaNvfD2S0HI4qmPr+mb6imHJ5uTHYQFKUvdewIOC
	JTA1OSqtnFZKERZh/ny6i9SPaKMmHqsTbtOfrVqPpi8u+gc9hb97eYCi7ZQWRwfULMKEbWw6BwIfA
	4EwhWl1C/5Vvm7DJnMxxaRb46A/1u9Mt6XfDRIUrlbksLxgyThu+eCT6bnX0EWyRaPpCnOt4BT2W8
	id1QH1uDKcVW6msIgwyDYZrrkCGg5tnXBeBRs07HpHfCt64Ri3s0XrbnFOt6hofsVz3i3jmsh2vZR
	w6PCd32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmk-000000032W7-0JbX;
	Fri, 22 Aug 2025 15:34:34 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNO3-00000001yEY-3DG5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKoZSGvHrMOGgMNwQ+HPsvFEPEGQvUuSTGdDpnCPOvajr2MQv1rk6kvHgQOo5DDodGwaboMMwEVl9qgGOgP1pDzuZDBS6q3LETdqQOLKFipnStIUwg10l750h1/k8Gy+K0AQqbn7eRCAd/6A0N5LZqvuIVO0/kuwIBuiyiDVqD8EORM+9D8GTBFbfpsba2Ms8DVVsJJaPa+Oo4Gr0XiG6jadXcE9XEt97lKXhC6pSrYZ5eavtfIw0nsG0wHHZvj2OOeAgmdLwoa1yX+ALCRw2Cr8KEWvNS64OHEUUnhPFj77zzPnlgAL8IPsp3b/cCCnBfS/3qbPvmCK/X6P9X46Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMXUb62XOMHTYd1WG1z1UfqZgzXlUR+T/1pRC4NacPM=;
 b=Y7GoiH7DdkUYQstB5ndXoh3AJls9pDChPYB+0CgobJdixc/USi68zWygCGoI3Q/rxft4oDkssy3r5pP0JVfj1Ns940go+0ANK5cr+Fbf+3s/fvMa9RuBfg1b4Pu1I2I4/0037letB7TQgi13bW+T+x+QRFGCWa8mGAbdjU+4uD/nY4nU3I0prJihBikVh63lxZsSrGQqIxPQIjqA+W+J4rxG/J0U47Iiy87cn0wefH2Ltbr/AjI2ZVEL1CoxM0FDngayGKpLp5tjzEZ1XxXH1EarIEiaVbND+UO6fhUUyWBHyN37MNod2F0pwaeKslDK3At3y2NTTmuR4QCWJOEnEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMXUb62XOMHTYd1WG1z1UfqZgzXlUR+T/1pRC4NacPM=;
 b=nLHcuueAIBFiVsUVfG21CARcu2iialToPG5Ymu2ip4VLkl0LEKBB4ix5VPyjv1NRpejJTIOo4gnNDyXL7ZWrnOqfSCDVIMEiDp8KGIu/FF6nzuldVye4Ix5z0oiO2afkNuWE8e/wm08R7yEBJbIFJ0+N0wZ297DJdF31um73IkTIjno3aiNRX5Jx4Cih5eUFiDRy7xF9dSjve7anbTXa4StXwpIIo+eU9FcXGUn2Q8oDyTEvBR+T+jEoiCr0YO2UjeYQ6y/H5PRGx+AZFmSwyD60uDFPT7Jl1CLioODT9rNiDrcKa1K+RufwezwA4jTuSZXQjYWi7itse3DFF9AxFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 08:44:33 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 08:44:33 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v4 1/6] PCI: dwc: Remove the L1SS check before putting the link into L2
Date: Fri, 22 Aug 2025 16:43:36 +0800
Message-Id: <20250822084341.3160738-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250822084341.3160738-1-hongxing.zhu@nxp.com>
References: <20250822084341.3160738-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|PA4PR04MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 6209df88-f44d-44fe-18fb-08dde1581e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YXnGNRG2lot8m+/bT/bqq1Py/k1bhF7BHf0Ya0jbsORZKxm8h4QGWf0w3LKA?=
 =?us-ascii?Q?R1mQNmmQtAVNZpLdfIMfFOmFbV5wiP1/8I9ppJrAlHkPWBOMD8gESq23i8EZ?=
 =?us-ascii?Q?mddzIowjLOZOS3UeqRrZNiu73lX+f8U4ohbrYAH8J2awu4tnuFo4L7s4lkqd?=
 =?us-ascii?Q?avty2rp5fhQZUxwJ30OCtke7Oc2BqnaTZPQnxlG4nU89qF/QECrMmzfgq9ok?=
 =?us-ascii?Q?CZZfAEojxJb8AABeVfgQxB566HXS8mOMdUUYh0RPG/mrKBxZeCV6HzBmqJg4?=
 =?us-ascii?Q?9RtfIAo8TvRGdVffhyAVYVPHL3vlrJJm6NaW6UFfFkwzAEkAU3lZ/eXnfgfX?=
 =?us-ascii?Q?04Z8/GTRfmK+OtID1QYKlOufBsgAjDTxSnUFcEh2HBtkoI3xCjj2FVVOzIjs?=
 =?us-ascii?Q?HrjURXqmuOtEWIW06Df+E/UpSEIn12+jvnrzviBEcZ0Q5La1T5cwzMDZYQ+v?=
 =?us-ascii?Q?zlnVFZqZ9xhPlcP4GUtLuCafoLhIJYp+w1YgYOexTVLyHvGneJb3PxCeh16O?=
 =?us-ascii?Q?PYD6npOs7lH8bOETN1/MFP9OoK167VOPSZgCoreZnjkRYVuS4Trcc2DiN0sc?=
 =?us-ascii?Q?op5snk0BvA6HQEV54s7fcih+KHu6AqeBNY8IpsTVyazD3vc0O6ifhR4ROxcT?=
 =?us-ascii?Q?TS6zhNfAtYKThEIDBQ0yEIexgkPUsD6o2g5552GkXNTpdUUfO1915t8nDbh3?=
 =?us-ascii?Q?Zi68AIEe3njyM9FGrLUUC2CplwiGKlcIws1pShvmTMxdWCQGSCCv4o20mJCl?=
 =?us-ascii?Q?OvNb7YDi3EfESOTGw0aLLP4NSPKMIdHYUuu+xdHE5dqdznkbK6rsI5gkwG5U?=
 =?us-ascii?Q?JXWZuB5SpcWJ14GOa1kQVo/D70JtxmTTg3cJobZFL5blXc8qbtA5NKZ6l0Rf?=
 =?us-ascii?Q?PoTouDOUSGcouO5GRT9vUU7SVuCMm9gK6j/fBZpHaAuOD6Ag4ml/9OHA0cZd?=
 =?us-ascii?Q?Bi3m9z5U7BfjKhM5/81DrE+t6NBYWm/NIKJXvKXua7+vNXtlYzABYARB1SxC?=
 =?us-ascii?Q?t6E/KrPK4EgAcXeomekCeoZd01IjxO3zOQENdYO5D++DAdsgL288gaGLWF28?=
 =?us-ascii?Q?3DLy0Denap3QgZooU0sNB18eAR5ipa+1b7EhYplIpZ47zuxVgwkz6FS9pEbH?=
 =?us-ascii?Q?SgTwFVlLIfaABXv84krnQRo3tTdBdVxafuA8lcXpcEsLqsGW2gjMy2Pgj+Kb?=
 =?us-ascii?Q?ymg1gBrvPhOs2DXCWDV39lvsh0ndwCnX42FOKPTa8oaUIykkxZSi7/538RTZ?=
 =?us-ascii?Q?K/PeYJ+phs2bG0P0w++1upmgGTOJbhuPXfh2+vRbCLNK2QgKe0nNnuaCzAdI?=
 =?us-ascii?Q?lupPLvIv1UyyBv51w6GIUH04TUsXXC6DL9w3X34FU4PtethIJ67t2WGBhTyv?=
 =?us-ascii?Q?EolvYAbMff1Rpmtbelr4pSicd+QDqulBHhBX2bR5wKS4cCpCghI7bCkUFhdE?=
 =?us-ascii?Q?9XUj+gSyB8LM+DAAWxRm2P37wpmrwnGEN1cXMkj1LQwEztqj5hCajdBEVAt6?=
 =?us-ascii?Q?ogXRJS/SzSo1ryI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lK+dU55dNYmO4vFKGtLzr/EYM/QpaUyqZS6giEOyv28oEex4lDh5YFqBZLAI?=
 =?us-ascii?Q?fJSSXTSkwAayAnKFJf3QYPQ0P2PRU7rnNNtvb4PbtlHLnEszhgxoydyNnlVm?=
 =?us-ascii?Q?da8OL/lMcJsMiyCfM8ZnatGM6AAQ8h6Oow/C8fVv7WkigY0xoiFg926kisD8?=
 =?us-ascii?Q?qE4OnizudkGs84Stou4dHI0KtHW0K61yaSj6vae6TWnDLEQVu2xCygI2NfwT?=
 =?us-ascii?Q?gKAHNdJ7AHua3rkKBvYEGBiu5STiSfpbUvPbic39qgr3qq6hsTjrt/ubRqv4?=
 =?us-ascii?Q?66pliTXXfo6q+bAY59CZtoZQJyvMjxGnTCl/NppkQr6JOs831e//20JlSLHX?=
 =?us-ascii?Q?hAW5MmZtgIZb6eUCouAl/4Orn/sDY18MQ9DWrOOV6JaOIwwt2l23DcnuRNLP?=
 =?us-ascii?Q?govAUPt0Oq43SNj6ZCmdxXM7JVagJsQrCvbSRz7P53LQNaFGvRntQ+G3jviJ?=
 =?us-ascii?Q?miWa7aC9TJHqdrPpwNNY6pACUG3XDZkqVD6Vsp6bvY99nLg7nP0Ai+5tyoXY?=
 =?us-ascii?Q?DthfAJUk349+bEOYS6Sk81UWdbc0K2Fh0CQvIfxI3exb5ISejhQ4LduJ62h7?=
 =?us-ascii?Q?HtdZuzMnzB2Ne/1Yl3rgOBw55jY0bqewg9NlysZGuU0n/vIbFr63AV1AqxS2?=
 =?us-ascii?Q?hsglZVIAUnaw0KWF+HGAOuRMShLSRieU34zD4eCmHRzsdqDwQ4Bw/NOE/SXO?=
 =?us-ascii?Q?P14viTZRREjxmYBcZDGXS9EMgCisZZt3xUP2vn/Dc1O4GBSZ6Y7U7gfgk6Z6?=
 =?us-ascii?Q?t2lNEh0BfF/j/D/1jFcGreRfSTNFHo412og4CAu5kK4wuGmbX37Q/rqQ8uSe?=
 =?us-ascii?Q?LfuI8KvOWPKRJfEKIItvAv4fMXITh2oby9eJF5QAjQ2ZkFpjf8D73bWYue8i?=
 =?us-ascii?Q?jQzajo+/2JkDMzqWTjGlHbPzcwchg6+73L3FcDygSrFqCk+KKv8dJ4415Hyk?=
 =?us-ascii?Q?VUYhXF+fa6asD+JjvX0Ov9rKPqzrV71qtSGFnpCFyM4k25Qa6r9CETPeZsdF?=
 =?us-ascii?Q?xUM70S87kfX8QtNy7Ywx5PpGR+DWvaODOa3Z0iADMKdJw9c4JLtT12V1oXLa?=
 =?us-ascii?Q?vR/VdD+YBd7EKPrGCsvl+0u2xBSxi1C6FIq41JpnOF3/VIZwz/Tii1RvUZXC?=
 =?us-ascii?Q?fh3QCrnpMqFueS33hDk+n6HK/vgBvYLcRjWfEbW0bYyrv79H/bKUEpmWXgmb?=
 =?us-ascii?Q?uJHyOveyb3Wsi+Y3rZn31B40YfvSppJeaWOSJZEm6A9Vwgyl2Uv197Q5CzZf?=
 =?us-ascii?Q?tscDUxoDK450q61DliY4ho/RTmTSk/4UPqO0MB/D0EN4ModNm/jBNDg7XZ2Y?=
 =?us-ascii?Q?5SBzq07M2CpQ6P/oBNqet6yY3bT1wm0TuoB34ziwSK9QnFpEQMvjnhTw12Hq?=
 =?us-ascii?Q?ByKdj/ccshLTaE6E8GTB0qEQhmPndukRhkknSuJiaKYzdwdFVavDcfOf/mgF?=
 =?us-ascii?Q?jHoHbvObQMoO+p2pu0wEUON2Dqnr7bCaR5LGm+LayZxZg9XRIE3GTJL0qCFb?=
 =?us-ascii?Q?clwC8QWXkNCBIl5LsWQYkCl4qiyzL9YyIcu9te1X3inuGFNj4F2wExf3/0MM?=
 =?us-ascii?Q?AcP9yH2YrGC+7TzvKyrDd+QxBvwt72Q5y0Uv64r+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6209df88-f44d-44fe-18fb-08dde1581e17
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 08:44:33.7866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxxtE9oEigqT/Hj/Pz+7eNDvN+U6ourp30UDDd2GiR8hNETpGjvRkIognkzHkKz+8tAVTO8lInGHBfagCcI1hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_014439_807089_7C172FEA 
X-CRM114-Status: GOOD (  10.88  )
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

Since this L1SS check is just an encapsulation problem, and the ASPM
shouldn't leak out here. Remove the L1SS check during L2 entry.

Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 952f8594b5012..1e130091d62a0 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1009,13 +1009,6 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 	u32 val;
 	int ret;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
-		return 0;
-
 	if (pci->pp.ops->pme_turn_off) {
 		pci->pp.ops->pme_turn_off(&pci->pp);
 	} else {
-- 
2.37.1


