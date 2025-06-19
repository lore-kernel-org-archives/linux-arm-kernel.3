Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56812C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 10:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yxv22kCNesfdc3xBF5ANxEDpZd52KTA3qcFRETkqjV8=; b=PDtD3JY09XmqjJmSIplx9ht/qO
	7ZfdK2qHAnWbUWsMpEHGKryKQORRFFfE1KlXhHKW7FO/QL9P1A9Ath58QWB4U1UlSpRIXJupdcSWh
	oas/Rdizs+9qeCQob2B79qxH7jwqNWLA1nTx+bv+3kKq3IuCH9Grc2+c/fHqAaGxJzHZj8pYSs9k5
	mI+8HXvHdXbi8+2w7WZBQYBh7XApv+DhPuxK9Va3hKzDTynafuz6Qt+B9dLlswH+JtwW7aB7Ii59A
	5FEXV+uchmk/zSkXPXVBt42uk85f7lto1AKZCMLywZUzoKHUom0XU8V+DfZy1/1zhZhUUCbym27LT
	Wk6MjG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCkY-0000000CmRf-0uXQ;
	Thu, 19 Jun 2025 10:44:06 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBJP-0000000CZhg-2NeV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:12:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThjnB7n9i21/N1CF9MWXffnJy6uolo0IEtRxNI3YWwYNnmsehWuE6rHkiCpsoslp18MTJY7gRG3NO8JB9g0p/OFKjpvCdIu4u/CUkM4fWei/xiUZNUGGuq+OMgstDvFxeAIwfPHUHTMaNEt4oxQYk9ypXZ3ov+kgFAJbrRGWQ6b0Tl4Bpku2JaHg0fQYjjwynVnicONDYFx0jI55gaIwoMsTxMVjQMo3GqNZEFrt+IEckvqov51HLmSqq7xWxUcJP/qFzHxddWBsgx1XqYIZFiCpisNmOc9eaT1UX666Hw6bjdK8vGzi17sgaDARjFdWuL4fet64DSeF9fSwCQZLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxv22kCNesfdc3xBF5ANxEDpZd52KTA3qcFRETkqjV8=;
 b=hXFWPkBjV2SeqpeyuaWjKE+vGnl6d6KTPXpcFxsj7K4/7+E63nrb0WEnw1qYoQ2KuC5VlMu6GWFXf/9JkO5we1ATFE+Y8wHYHy63qtTDUJ1JTzLBaf9eDsypb1746wTM5gsvF1tCMYh1dmuFULPyQhZJDL/KwXHpIkxLinEzUGy+AijQvEg2ppzRHNgRz2cuKRqIoYp/YOSAESiAfyTB4VF/P/B7rYj8dXPONI2m/qgFfnKnDpsbteXvJScFlrD+DaxK8EjkhdoH3pYxsphB2iRFl/FuISbFOqr6uLvRBIixdY0+7jVL2jqgHgQMAqmVX6HSsLUN5MgCCCnWmKNbVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxv22kCNesfdc3xBF5ANxEDpZd52KTA3qcFRETkqjV8=;
 b=F2hC+bDcxsvBpx9jt0Ioq8MTAm7bZOb8EK5F2tPrS1me0ud8U3/lUaTN+ditiwZw1wpl1RnlNQxN/yVBp36W/4kp4vQPnA3DhPdMXlvpJrg3aqU1FfCBLwNGXlLhrkgn+bGdDoDIFl2FWhpyRWFfYgYFMcG4ZQf8wEb4791WgyCZMWVvTzL68bMliboEvRanBLhEoAvisVH2LeDaNh1v6O8fwbo9+2LZDS2kzWw2B14JJ8DuGPjZsqz1WslQL2Cs+PqNpsL80HGZAdwEi8dh4IMkApdEL/ns//H8akeAX88NwqEQtH/daD57XQqZB82M+rVTPTJPFXUEd+U7Vn7j8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by GVXPR04MB10084.eurprd04.prod.outlook.com (2603:10a6:150:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 09:11:54 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 09:11:54 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] PCI: imx6: Add external reference clock mode support
Date: Thu, 19 Jun 2025 17:10:02 +0800
Message-Id: <20250619091004.338419-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|GVXPR04MB10084:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ae1237-2d5a-4390-5961-08ddaf1155a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ks1rw88ORlGxt8rmF/EazljreYiiAacWjNp8gCWTXoDndJPzSRv3kdplGY2d?=
 =?us-ascii?Q?mENFfqCoKxaZ+ksSXeAzw4vTdgr9sGcPC+eTTkGSYJSNdJ4McukiLG6tyAmI?=
 =?us-ascii?Q?sAJYbv1flO3WT8L1OIFZEo0l97h7CoFRHk/S2hKMdoqu8/PTPNm7r/lk0d5b?=
 =?us-ascii?Q?mAhmVDyY/SggrKUprj3vghHWgl6mU1AC6R6RYHQ4bepbVF1ELUk0Sw+WtEMj?=
 =?us-ascii?Q?A59RkO+IsvNm/cKBL1wYRWOYhyv3BT4vqW2aSuOI0geiLU2+hVx7cf21C/YI?=
 =?us-ascii?Q?JyMuByqS5aABoJ8x7fWJIrr9q6p4UaB+Vpi9PhO2JVA9pLbyeCMkD/u8FG4z?=
 =?us-ascii?Q?L8OHvwEz6uFyGuA+azJsZPTtNdIEhWQ1iO5RRhSB1bS4aBl/IK74TJmVVm5v?=
 =?us-ascii?Q?h6DXaDGT13ndMfeAr9j6Hx+tQseJlpTHXlKWj/coauOGc9GtuL1bhuY2qzKy?=
 =?us-ascii?Q?IgiHBPISflkHjRmZfH3COA/FVIYxvNtpUtA3R8IUktGCbfX4aBssuDNsPURX?=
 =?us-ascii?Q?+IkfKFy1ZmphPHHzdAdL+yj8ZoNU0lzCZVpTBiPQ+mpLIqKs0tA34cUSjidS?=
 =?us-ascii?Q?uRWKTtx/KKhD4CTsWm6V4FMtFYFP4wuzESUjDCObLJSn5k7rkTngfGNQWAJo?=
 =?us-ascii?Q?BniZMRcqCG5TF4NlR/2wUl0DaaxWjIfHpq+NIzevdseGRSjL1UxzWYRIZ7CO?=
 =?us-ascii?Q?1WLhqN2rv9P+HF3vYGKp+AKzYAqCA4v7fd3mAUjTdEd1d5rxgNtx1VXfyI/w?=
 =?us-ascii?Q?i+JHGJkBqK3qufOxhPdbdNh4P0t3nb7Lf1xGkv77wV3qLLEslroq/6kNMJ0e?=
 =?us-ascii?Q?tVCNBZI+X3g/1Bqfl86qJkG3z1C+8vBq4foHVU6Vzi+mkyRHrtBlnuJVhgM+?=
 =?us-ascii?Q?UzOlcnxVBe3J2gAx05T+Sis1HYcQnn6HuPtMs6H/fse/4stSHukUNMexS0cx?=
 =?us-ascii?Q?sPuMnkFoCxytNLVFXxRm+A0Cfi7LxWe/1CHIlu5/xQsCTYwNTgn4D8+T2jN8?=
 =?us-ascii?Q?T12x8W8Scw+v0rZRacDJi65GkOy/f0WZPT8ENB4jYGp4dAXKk360BA4r/SsO?=
 =?us-ascii?Q?oL1ydZaF/Z1+cFLGzRA7gCUkCqZb/hI2SsbCvixd1UX3dzWSUKI9Q9L9ufvg?=
 =?us-ascii?Q?7VhhFGESd9LqCFn0rTiA1opHZDT3ZLIGK5Gw1ua/bPAN1dk97g0Gki1pw6wv?=
 =?us-ascii?Q?UefVsNONdE0EB5DqNtIhlwexoLs1GvE8MBszCLm5x/m8V/5lYhCIZSpIJ0mb?=
 =?us-ascii?Q?a2uNYPyRKEMIdP0nc+8fE9j5qM2ka1gMfBfN9sxpsKZgvmLMwuI2Lpjf4NQD?=
 =?us-ascii?Q?556qwFIkiXxvgUN8zFW4N9BrKYlNmQlb+wUeE9h62rj08sW0bWQvqwy45uL/?=
 =?us-ascii?Q?tmc2PgUoyAILZt10Go6PVMggApfiLi4CbAjrHCkMx2z1SKvGAe3DqDkdf5zt?=
 =?us-ascii?Q?z3tmxJty7CpMyuJyLWKBGrpSkPdGdi6FPIS33f4um65m2gCr5WNq6Cj3Gc90?=
 =?us-ascii?Q?GhDUlGN12MgKvdQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+LRZJ9V6FP86FPepsq1Bq4FTApsKVGqtG/iCZWikyUs9RiQAzM2RyM9Pvr+l?=
 =?us-ascii?Q?zsjnSz10DvjeuK/PX87yasyN/AcRWjPeorEShGt0YYIc6XTy3Ks51kYGJUdX?=
 =?us-ascii?Q?/5qKgtcbko0IycWy5vBZZta5f0zZ0viHqViprQuyVkjh48hwEavMy5l3ASPd?=
 =?us-ascii?Q?wfIDW/mGj1vMf1/LMmIfUbBWMasYf0FizKBuXNq4dQJkl9Nnfxauthva1iRp?=
 =?us-ascii?Q?phd2Kep6Dd23VBfBhlWRogeqfKGZmF++FjegDIr/r4mEeoFx14a74o6XlrlO?=
 =?us-ascii?Q?06ZRpRR1w46c/Sj32HBxIBrUmlPpQGol5zTtDb/IhU7RGnJ3Z8v+GfGUvTV3?=
 =?us-ascii?Q?uSgo0SU1Iki6Fi61rwsyQQflMHn/vk7naQvB7A9eTgKGnujHHp3gi3/RZ+Ez?=
 =?us-ascii?Q?l3+5tSdBq/xXEuK2/4odZyT9aLLat724QptM9yMZakiQ5YKoUzg9X8mCKLPF?=
 =?us-ascii?Q?Z3GBjleszbQnBWIXCaa8p0IHs1LhPRjuG9bgMZPR6/6LBJ/+2AR6skxREjeg?=
 =?us-ascii?Q?Ma8suWUDQr2LYXloNVbYiaeQv9LA9owKgtATUmfU8Q14daUkroGQwXRHu2Sa?=
 =?us-ascii?Q?B9hVKhwbnAqhYcyAbaB6Is2ry1OyrEhzdx1LsDN3deLpiyECl+5f3z/836u5?=
 =?us-ascii?Q?9mPrijMI0JX6QX4eOLejTc8ZpfIZ0tItfanbFjsC/C37p8HsQGbr9gNkJL+g?=
 =?us-ascii?Q?w4Fg77S3G8OxouY2jCB+Qon1zTIGkq7jRLLQTYMqFkGUArYTinP0L0IF+iCy?=
 =?us-ascii?Q?ZN2xN2H/miSFVyZTJs9CMuJtTUQGPfTba+jmVtpiv4va6klwLe1AMX8jYANm?=
 =?us-ascii?Q?7jX9C7bE1wzIl80GrIxB0+vqm02dbRVOYRE6lLcO3e5OH20FvD+CNxY2OTDB?=
 =?us-ascii?Q?DRpCPVqlW/2FgNToYeSWnO5yIkgzbAqMGdK98aIVIyHKFcO8vD+gYysGpQyp?=
 =?us-ascii?Q?ri+OzZLg6DzT7wXAcWExY8fQsB55oNUtaL2m7d1diYLtd0nQxxYvN90vCW0l?=
 =?us-ascii?Q?2yYX8aZk73NsKXXE/O1KSRd4dMjnCN1wjA0v51dMh4OdxMS3X3TrvKeyNvWy?=
 =?us-ascii?Q?+CQ4vikcjwPEi53C6bSn090Or8bgcKuXqH3I9303645Zz8Sn2n/Sy8oRasaz?=
 =?us-ascii?Q?g9wlamIyehFelpG46tLTzRmA8SrwhhW+1I8PNmZ1b5sXS/H74rbDZ19WehX5?=
 =?us-ascii?Q?9GAKspmqi2v6lMCPdmjOstOE7M6UzvJasm8QP5euQDE6+pocXa+Rx0STLNt3?=
 =?us-ascii?Q?+bnYR/Q/V6e+XOLdj2h7Re6G6lAkmiZjV+Pnx5e+9PqRNJss5WkGw8eqTHN3?=
 =?us-ascii?Q?Tupw1v89zidXKNnfcag8sRq0EaxzkcWU+DoY9Jy3xZRQKLtq6jKoXJ3v4MvB?=
 =?us-ascii?Q?8IzaDUW+XWhJu6pp92r8TR7yPf9Gblhd5qYGBhQJOsvko1rWh/u1HH8NdzGW?=
 =?us-ascii?Q?Ckb07MSvmkSPqlvDDkvGxmTU8PHF3Qa91gEcxNgT9LDV+weWWH+0svp/FiYa?=
 =?us-ascii?Q?kNZxN7RlpenFn7r/eqpKTlfsQyrLIr4mC+bFHziOr0iH89WSAmagNQEvnvQs?=
 =?us-ascii?Q?RJLvTutp62pcbVIx0eMWi3bntGxeW2AfVu4Yp4Rw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ae1237-2d5a-4390-5961-08ddaf1155a6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 09:11:54.6884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hs0vDlyU0YNcgE4Jk4saeIaK0/ATjOhWxNcvPfhRtjBLujgmS1u6r4wPOP2P/m5q62V2QmuqDAVaIT7a5rsnRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_021159_614335_86984600 
X-CRM114-Status: UNSURE (   8.63  )
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

On i.MX, the PCIe reference clock might come from either internal
system PLL or external clock source.
Add the external reference clock source for reference clock.

Main change in v2:
- Fix yamllint warning.
- Refine the driver codes.

[PATCH v2 1/2] dt-binding: pci-imx6: Add external reference clock
[PATCH v2 2/2] PCI: imx6: Add external reference clock mode support

Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml |  7 ++++++-
drivers/pci/controller/dwc/pci-imx6.c                     | 22 +++++++++++++++-------
2 files changed, 21 insertions(+), 8 deletions(-)



