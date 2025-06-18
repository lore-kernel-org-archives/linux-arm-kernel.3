Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571ABC71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 02:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wGFD82Med0+nIKF9yi8+bzMww+6GnMANxV2u8ukE/Fk=; b=gbd5fgkxXmiUaSEpVYQF0brMAX
	kQVeNYkx0/QfCMd95S78Khe2FfNMlIZ3sWIEs0ouJLq6fquBakbPwilignBviaPZkS0T3uNBfHAK5
	NUgUwNoyNh+DAskPWun4fXE2xTuLip3tAbWOiXb3Y4+Zo+iRj0gRzAu7GNQkjhkEeH6Br14jaz4CN
	VMw8Qai7Pqnl0rk7zKezlOSI3MG+TOKD+tR2wjHImwMbRH1vJONRYUoWxhIJ4YH0t2JfzF8/cOtbF
	isxnjAs4Llceu4iyrsQWYlxaqUe9y/Fhy5PneJT8PDubv6F9bkuMXJs7OwlAQ5ovQla6IzFtVEnzi
	+fdwu/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRio0-00000008qBI-3yaE;
	Wed, 18 Jun 2025 02:45:40 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRiln-00000008pnV-2tH2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 02:43:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFjcDYr9JeQd8dsyBbuv06cN3v0Y/5a79OVtfqQzeCc/rgfktk8yH2IXos2lOD2duVPlzW/wHwhErdBnHsFF6xXDYIIv6kCwMWAlAH+EH9Y2ZkOArkryIxcMCrpleTTf6X5TI+m1syn8wBGkjNtUwlGwFNMcuo7bOMllm73nsZe4utroUyYi9qLh5cxwRZ9TDc07+zWbZp4zV8+Q1wn3ZSRmiosOrEHTkZEosTr6aUHZLPxCuI3Zqs5zHSqdiVaB/Xma14FU6SPDGBDz95ZTvZvR+Is+iHkEUZRft/ruGJly5ZEOvYxTuzNuQNxwL7LVb60nzZolZ220iy4IZMBikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGFD82Med0+nIKF9yi8+bzMww+6GnMANxV2u8ukE/Fk=;
 b=u1sYBKS+qdPiojkGj+8kHmudWYY4klMJjD+YCfeXmSKvPeYstYzb7zSavJ5qF34QHBy/6ixQlHAlzzW+XxxRzTLdPLfiXQlbcM2teBhy4EYKcUfS/3hQ3txNVrQ5Dm+0iufAgNKeUCjh4KjPWtDH/H/Z1B/UKZFT+2DtOoqF1ihQCZPxDfY8OIMf82nVeID+lsi0Ds1xOrlwHEjmlVge+pFDiUyQ73FHQtM2QDe1rm4K0eeMFt2iVU9sqnBiGXh8lalru5xnXIEKx41kssqdKl6YXy20nYALIB+6Lrz6uPddNQ+Q+FdCqkLxFmeT4/ME4Ip44wUW3HN+pwqBERilcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGFD82Med0+nIKF9yi8+bzMww+6GnMANxV2u8ukE/Fk=;
 b=Pv1l3igqkHAHhdLfLjAU1Y1Z8kYqd37se9K6w2HAsCN8Em2NyavZprvb9Oz0G2k+RMnkf+7BXEwue8vaW1l7QuOlDzphI6nhUH+MaiqN+Nm0Yk8rqVbeGf0+1nfnGHulU84qlvbb/E4MayY6jKi/tnXj9h34n2Gi2LUxkrZqiguH+L0w5RTuMz2K/vTaDND2G8oZ0/kdukbC9Ed0mvpb+iCHeOMdfj30Bg5KZ4Z2lQih2sE6SA32nh3IXKrmjPOXLTi+L46MKoQ6M2q02ZYhKZJfUy4aXagZmS7VwTF8CSF+BRJZlxhI6YG+2bQ+Za8kJ6lspDJ9LQzBZ4JZNq+1Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DU4PR04MB10960.eurprd04.prod.outlook.com (2603:10a6:10:585::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 02:43:16 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 02:43:16 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Add quirks to proceed PME handshake in DWC PM
Date: Wed, 18 Jun 2025 10:41:11 +0800
Message-Id: <20250618024116.3704579-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DU4PR04MB10960:EE_
X-MS-Office365-Filtering-Correlation-Id: f873179f-632f-4aa9-afb4-08ddae11e058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LAupJ/tLGH7NpDa8hv2LT4bC7UozdCxCpn+VcKopuAVlGJb6/1wQNHGo0mXO?=
 =?us-ascii?Q?3mAiSt+WePP2zHo3J8LKnKJIB7LRgL2NPCTY487LP/mAn/rwN+N5+Av7o0HZ?=
 =?us-ascii?Q?LZxL+kS1bznSGTxjj8nzu3oqBfS+6x/bRe0XcGqtO3L0PwLEQ+Kyhw2o0Qsv?=
 =?us-ascii?Q?XOh1mqFltS03m+Q/JvhCfvXKJ1E4ziRmGmtHigxKW9dUJrPirAdQMnbG2RXH?=
 =?us-ascii?Q?OaOVxqF/iCK1+ao3dZOKXy8GqQhsPAhF9kYjsFanOEhMwstWIAVQjmk0jvkS?=
 =?us-ascii?Q?wpUr0jWHGyL1kNCHSiaPMEengVe0szI70lL1+Tgg9MIb3AooDWtmQjSfx1yM?=
 =?us-ascii?Q?SxM6Hkgn+6aKsSTslr54RssvRdKxj1TTpuKfgmpoCximBZvXBQB7fMoh6nXA?=
 =?us-ascii?Q?dAWh78+8NwSKUHRXcvu60HIFraMQec18BJvnPYKrIOzRo3hO1HCrFiWZr8jx?=
 =?us-ascii?Q?YmROaefd0nI6FNAG4DwLfzIB6EtzlUj6AD96ljeunNhMpww8yX/dzuE7tcjV?=
 =?us-ascii?Q?cqsvS0O7eizA4nABsATkSlbeHdWc7ZixMPPZovVxzs2aLjnGCq7yEsiyl3k7?=
 =?us-ascii?Q?X/dywa9ga8T55c61/4c9Vo4isMJzi5CdEldN7CYPcU7LqLC/1DOf99qoP/Mj?=
 =?us-ascii?Q?ffS/KYJ0BuAGziwGU/qyrgUJbUS09psCwpGNKyN7Jm+oCPI+8/B8LEAmkP0l?=
 =?us-ascii?Q?riBkE7gObJ0HblJlzDtHWn8ZV1N4etswPqpM68opZDjiG2q+h2RGlGdbVf7E?=
 =?us-ascii?Q?m2fDtxtKxJma3AU/UV89lWXMJhsAZFcFx0TGRNsEd9DflZTpm58Wf/k0Gb48?=
 =?us-ascii?Q?sAqUpAMM4WFO5+VnMLPbHVG9y9sz3Sd4YK46i/7clJ3xpjwrUd6XIjBUtPB3?=
 =?us-ascii?Q?12U38fhawRmMT4cXTuypv5nXgcMx0S1mNbGVFKsMoqAhaaz+eAtAufANGEGT?=
 =?us-ascii?Q?wxbyxyoD0J4ydQF8/rNiYEGI3qHCd/uF+cp7oxxBCYy9bow0VZUzpeHal2CU?=
 =?us-ascii?Q?YW+YUpjb2R6VHBydUitZjMhLlMcVkZI6XE4U3/wtx9plwv88vy2ezUBMf+tq?=
 =?us-ascii?Q?cfwbt5DDee36QCIWyC3rTdvu1Ljag1lRo/Ew+gRTiPKxZaoohrjGRCz/Hv5R?=
 =?us-ascii?Q?KiVbXRehN21uhkbTzfo2YR3S554n+Y4nLv1hEPkvY3qu8a+449/GvEDxLf6O?=
 =?us-ascii?Q?fmxtAx2owHXWKVsryChbUt7pkwSElm5GWkz7M8Coe6ZV2wHepjbJUDKwtz0P?=
 =?us-ascii?Q?jjSv2o3MclamOgB0JIjpwWvvPFjdq+Z7SJHeSruRG2Mwq/2MZoq0GZWOb7h9?=
 =?us-ascii?Q?COv09rgQrlKc38BACTEGV5G1+fJVHo7pwU5NGbhrvd9G3nFSNynwrNCb6dDn?=
 =?us-ascii?Q?mmaAWU6C2mRN2J1CDUcgf5LqYXiWltJ9dqcaLQO1rUAKRjvK0Kh2rcDuQYlG?=
 =?us-ascii?Q?WVcj/M+Vfn2o0Cn04nsnC3wU0oBdNQK/2cJPCUIiAKM9VLVjU93HPJP+B+FV?=
 =?us-ascii?Q?vbsvxV+ZM/sejnOIxRWknLkBV/LUgydbk+t+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XMad7y/hTY1Kigm60WJWS6ISC/xK2olNCSX8onp5Ir0b1oOq0NWSPVs+8RA7?=
 =?us-ascii?Q?cR8C9QNZt0r7O9s+iLi7U+smsedtV4U7UMFL8Ezuqb0TIMNxhBFytoYabA/c?=
 =?us-ascii?Q?jlUeE4WMnaGuchR9x0JY8VrP5baQkxMB7mY8x8NRFn+P4QNiOzF0oYw5pNnr?=
 =?us-ascii?Q?kqWwJQxG5XM0ElKL+lnqm1n9gnAytRYWOp8EOzHsXkYLzkVDuOZqNIa+psUf?=
 =?us-ascii?Q?OstlQYmYRxy5s0oO05TcT1QYaB5McfCzW9bSMUCG4bCINyxoNxZ8juANKH6f?=
 =?us-ascii?Q?kB2FWXXatmYtuANc8rg2O1ri9saMqW2kBnw09LogElOl66Am3ihBr4CboPki?=
 =?us-ascii?Q?zUxSd4d+Tu/KlKzSru3HV5hZmt+kuoUEi5nCQLFV0eY3PalVUhui0ziL2geD?=
 =?us-ascii?Q?ieCrVM/9GuM6ySnoyccqwkpScCLGGsfc6rMDRJXIWX07IRi4aj9s+80CMlbF?=
 =?us-ascii?Q?UVZLx47+u/nquOMsIaF3bjQkrMx8hw/GFfOH4pMRG7/jOHqJ40JRWlbSf/ez?=
 =?us-ascii?Q?EDxkxrl2juoQ/7OFRUefQVBRp8f+Btp6snTCLFl+pHfLbvT106TISS8wTKhe?=
 =?us-ascii?Q?pcP8lE8atB1jQOYR8ferv+C+ZG4i0YmS8pM4tiwPLW0VYpMkNOK2OL2bkso6?=
 =?us-ascii?Q?Qt09ylcV2QVC9Ev55eUazgUgGW1FJCONQfgv3iXg2S6yzR+duQMwNcQk5mcm?=
 =?us-ascii?Q?YalvvUKoRIJgO+bdMYJhn4eJclHHULulhix8nbXOFc6ji0KCaaRAHhsmJZ/x?=
 =?us-ascii?Q?0Vpm0LBtc1xfR/cg9MeG5UP62BjgF2sKqxPtMXWqNZ0cyjurqwuYtW1MYm0+?=
 =?us-ascii?Q?HlxlcRx6Z08aUh99kpFuh8jLaoiM/ZEVxyR0h4fdndVw2adHbDJTBPeov5XY?=
 =?us-ascii?Q?zizhF8UFYT2rU2Ox3CEIxIOFDFt6iY0RpXkcqAsV61wojQI1OoKV+zfqbX9u?=
 =?us-ascii?Q?nPeD5ODVPJzqkLXnPeimfYILOpGF5gixsq4z1uXKnT5g3n6VQNVcC30Mxz/d?=
 =?us-ascii?Q?gxDyD64D9rLR1VkRzGKg49hLWLD3U+Zxmg0aC2IqK2Usav6dKg0RCrBz0V+L?=
 =?us-ascii?Q?5MQABoshRAgkqkh7q0BmL1wtNaYrE/wSV56A1sU8frcTAx6xZLtsbJsK1PGk?=
 =?us-ascii?Q?o2SNXIB+P3TgS+d0JFprxLPMT/yHUV4Bn9e2Ky91Ca5KIfQpCvjQPzjeEKm6?=
 =?us-ascii?Q?siCd0YXXPD4QQZEUvhf1HjG5idRyc0GIQWC5SsBPz93xJREA/fCWwsucc+jw?=
 =?us-ascii?Q?mw7XgvFf4c0D9MtNBjoO2Li3YP+iEqWV0pGuOuYKm2NVZeJxOPT1rmUopU7V?=
 =?us-ascii?Q?gRfbfmaIZPjZHpikiSac5yLq5BuSkYrd4M/wUR0biTlb2yPGsb9wc/KgOxRh?=
 =?us-ascii?Q?bqa/QRH1FJoQ9W45+SMI+3L34LiwU/4MN1hBndMHwyIt4YXI+h4T9lhAfZ/F?=
 =?us-ascii?Q?ncYwHl+8UEBMZPkUlNBZnu9BBzBfTujDgF3nz8FeEbDAFQGVPW91fRhGhu8k?=
 =?us-ascii?Q?efbx/fB+MRL0NRrUdNC4dIZU0TSjJl2sZDiq8Wz2ROQworVNFBCYRATzD5rD?=
 =?us-ascii?Q?aMO75ByFcTetbmfsW1QeoaffD7+lbklbuX0L3kBu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f873179f-632f-4aa9-afb4-08ddae11e058
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 02:43:16.0418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EySn77SvGwLnPCNuaTfRNNoG0gRCgRiSNeVDYETbWVCqdFYlp2Lscqjnl/lfngi0nTJWhGqYx9UNvVSafbr26g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_194323_737462_4F09CD39 
X-CRM114-Status: UNSURE (   9.44  )
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

Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management State Flow
Diagram. Both L0 and L2/L3 Ready can be transferred to LDn directly.

It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
Synchronization.

The LTSSM states of i.MX6QP PCIe is inaccessible after the PME_Turn_Off
is kicked off. To handle this case, don't poll L2 state and add one max
10ms delay if QUIRK_NOL2POLL_IN_PM flag is existing in suspend.

Main chenages in v2:
Add the following two patches.
- Skip PME_Turn_Off message if there is no endpoint connected.
- Don't return error when wait for link up.
v1:https://patchwork.kernel.org/project/linux-pci/cover/20250408065221.1941928-1-hongxing.zhu@nxp.com/

[PATCH v2 1/5] PCI: imx6: Don't poll LTSSM state of i.MX6QP PCIe in
[PATCH v2 2/5] PCI: imx6: Don't poll LTSSM state of i.MX7D PCIe in PM
[PATCH v2 3/5] PCI: dwc: Don't poll L2 if QUIRK_NOL2POLL_IN_PM is
[PATCH v2 4/5] PCI: dwc: Skip PME_Turn_Off message if there is no
[PATCH v2 5/5] PCI: dwc: Don't return error when wait for link up

drivers/pci/controller/dwc/pci-imx6.c             |  4 ++++
drivers/pci/controller/dwc/pcie-designware-host.c | 50 +++++++++++++++++++++++++++++++-------------------
drivers/pci/controller/dwc/pcie-designware.h      |  4 ++++
3 files changed, 39 insertions(+), 19 deletions(-)



