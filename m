Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D6CCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fczutGWC5Go+2yzPn++mRWkgrLmZF4asosA95N2t/ts=; b=inaM02uXs/jxJuscCKzKQBlffX
	bKp3wOf0sHgaujxb+8l3lsZOuw+fOerNvRjal6id1WTd+VRJePK5HApkm6wFYZ8CggalS4AliIEQP
	8xSaj0qA/FempVj4kR0swNAG4BV8fFR5gzzWtP06hTPC3lJKIAXONBxhi2WIdRVP3Rv1DlpxAri8x
	XjACWX2MvYmMM4nw8puudK7+pWnrLM7CHY4oUA3ysxYRARXa1OluCCxbE+Jf9o8knrAMyotGlkMAS
	vfW5lf6SxiOxYREfHA7HP8eHzyY14xtYdgb5JbwqaSTsE5jpXKZKgJi10HcLwxAoC07wzsFq2IF3T
	LK7YTqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeVL-0000000CnTV-1ysL;
	Wed, 20 Aug 2025 08:49:11 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodup-0000000Cgdb-2upx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:11:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L96fSXkzNqVJWwkSqfVJfndf/JSvAkk5eQBlMv7FYkR9DlCrRwDWHW4g1lIpVSZrGLLxjQ/8YmiNHqzfll5AI1nrMW4DCoQBqMrhyV4jpQ4HUJ+/8XHbtQDTjhas4YTYG+npeJQm9+YZBxOwflupixkX5OkJPSV6EhJGmg30VHuGYbMA9JTzp46X9pCK/0zH1c9rYoqeo51PXZf0PJxxpV281uMc3zpHvMkgN+mm5DJ2xUeaW/VXMQHDK0ifHaRYT+waP37Dawcy6730vXUpVfOwFljWj/2UPRvbNeJmiUyHcT6Rb0+lb/RYy8GAQr9UiwkjGxIe7ffVSIoSh/8p1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fczutGWC5Go+2yzPn++mRWkgrLmZF4asosA95N2t/ts=;
 b=NmVAHRHmRDGugzxAQZ6SY8bP9Is6qSpBkgAJCcOwqbOojxYRLx7AIz40ZQJ6qFD4aDlAEBCSrfKRhdT/LcGVBOZlEb07YMmWIDn2ePLqCZ7IfgPwfly9ppOgyqHp0fZBVHLMrEKuF6hUZ/Fd7nY2JkUlECiXrdMA/D7RlR8uRmI+aU+XMxXYK08DuO5ojs6PrHmyIE6ZKS/0lSpsjQxVQGosTovwEZG91yHbdua/01FHVLtfGehCad1pjVgQXxYDEV9jdaiSMgrWC9J6vuL8pnMF6uM+o1/jF8dab8QZsBBtP7wGCfIdfRDpdrs/vc2XioxUZCjzqjXNksxcUcyFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fczutGWC5Go+2yzPn++mRWkgrLmZF4asosA95N2t/ts=;
 b=mfgxTU0Ll6Ro03kL5UKpLaWBUh2NVmxzepB9atn7ZSB0ZYD3jQubGGzwvhnn+RTLMNDxRqG5ECtia4mQ9ElfUNNJBIIkmarMPcGftsoP8JJ9KCye4AKwLvWw6Jkouj+UCQ0HAwryLaeZLPpiRBw4ATqfJvFwCLGtwS7oW3Ha/AeAZqC3oA5+MHE2KkNFmvBKAfZPEj5fzQ6HkW8dNsmO8B+VFibLxy49xuZCZ9AkXOwy7V7FhuI0hlO6zgCEjHlsmyoeQ6a0DyFyNWAtLiTzjS5owtxEmKlZflmg+xJ8KBt9fgVAOGEDsbPPqqKzI4F9mvTQVq3V4P+r2pFO7rivHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AM0PR04MB6913.eurprd04.prod.outlook.com (2603:10a6:208:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 08:11:24 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 08:11:24 +0000
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
Subject: [PATCH v1 0/2] PCI: imx6: Add a method to handle CLKREQ# override
Date: Wed, 20 Aug 2025 16:10:46 +0800
Message-Id: <20250820081048.2279057-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AM0PR04MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acc90cf-a2f8-4024-6dab-08dddfc12787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fBhrE6rFp4kwhjFR98u5XoO0OpJuAb8HWJsyRwk5Ks2GUFonKuD67zh4zUTj?=
 =?us-ascii?Q?t7p16bA+mscgruMg2fANQOdN411C7dMlC46BlqKLRuuEPPeDY3uMxx6XF47k?=
 =?us-ascii?Q?/xP1g8msOPgKulCNQ/UNcOipJD3Rcv7XCBSSIoVJGn3S2yZ8xzxkYCb62nKJ?=
 =?us-ascii?Q?2zOWZun14usmRnfVlpzb6F+R81GTNyXUBE7Ctbm2pgdfF+ArnzXYVXLSx0JN?=
 =?us-ascii?Q?X2P/Z7f5Duo4KqKvGeNfffOOGaSmz7SLBG3YA1T8kYSt+DoNJHgDYy49F3Sf?=
 =?us-ascii?Q?MY6Zk5Ux3L91ims30yUgglK2ZddKHhC1DTAYrvUBLmdW9jEf67d70lcejVSP?=
 =?us-ascii?Q?ZbWw7xd+K39zKdN8b6yTmIHFo3IUTN3PwKshfpvhdJy55O2xG5iIo3ft1JsE?=
 =?us-ascii?Q?Y5KlAF6BC4T8CJger1aoDAkGBJCMQCJrUuKJEORTQxRvVRY5TBMEO5THwwld?=
 =?us-ascii?Q?+3CA4kjZPDNCukWOBbxSMo7T6uCoqdRe7t3+k96XuMyWLez98P3DP/GvuUAu?=
 =?us-ascii?Q?BnBsr43onTPivJWzDpNPSbjfNexh1A35Q84Ke3b2KKnyz9I+gyjgzUIvVtfY?=
 =?us-ascii?Q?C9LWPbHtao0m7VTsnoM+VbwJ3nCHYhCGSvnYyEDDzmaZsDu4JmR4i1OvHY3+?=
 =?us-ascii?Q?tK3x8lxmZlwheoB/2GmFrNyyV0n0rpDZi5Lf810ettraJaeNdnEXlJf2U+CB?=
 =?us-ascii?Q?Qf71kI1ob4hNPVvJnR1e3V1bnuK80fGofgCnpVtYYSzPsuQ/Aujym0+CVsJ4?=
 =?us-ascii?Q?eUNgz72bB7BKT/KglfNrChGR4CvfLWhE12JhhnN2bFdI/ZnSx+DpOkgLo5v3?=
 =?us-ascii?Q?3Wz2n8Wm4usSjraG1Q2ugzz/KsR9F7vhC2o96/rg8zbcTT93cQjYu53IxjI3?=
 =?us-ascii?Q?2GVgD6R0Ltp9D7beIbENexJAlqwQFAh/Wpapm6xHYEn0eAKu5WdTnG5uLIdW?=
 =?us-ascii?Q?BkyN7RueL+T0mYuTZq6Y9bWN6NvaKpYZ1C/ckbJP/F6e3QVpLYZjFMKurM2v?=
 =?us-ascii?Q?w8pWiPYu66ORO3yTmrtw17fN3cTi3KkH7umtGCFdMWWXg4wA5z+Nmqe8TCNg?=
 =?us-ascii?Q?eaLoe9q/kEF2ViEa2h30dlK69cfwrXzR4Upl077vRY8Q3v/AGYaR4VjFftde?=
 =?us-ascii?Q?9bMO0FODqFJRQykxP3O64vdceZYVnSaU+WbAhkj85YC8UQTBBrAAKV5Boprd?=
 =?us-ascii?Q?wXr0GZmupLkdR3ryMwDCIkxH2AT+ixo3zrxAIUOt7eTXVTGtu+VfPtgkZIMj?=
 =?us-ascii?Q?WyowFbW/aQAri0M2ssKLJNyV2Ob/zmuJrs2nYkedoKoncqB1E0fZBFdO2WkU?=
 =?us-ascii?Q?/dqMdvVixnLGszXvu6j10+v3gryOz9fq6aPVoIksuuZfof/cXe2yZe5MvimL?=
 =?us-ascii?Q?jJ7ewmUBlNoCrlylw3m+aJYHKkHtnltaBiEr5tPqjHw88iaAK0VOVB5YIMtI?=
 =?us-ascii?Q?yRM0nlRe3bG9V3rz7AHbhi1JKvLPQQYIcgityT5a1WmNJCfCU1qupV4EiMNO?=
 =?us-ascii?Q?l4YasyjoVtPOfsY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/koduIszp5i487YhzAMpUevHZQXxrG6kUlpSRZGL6p7jk4qP45dJ45PDuRLB?=
 =?us-ascii?Q?EIAldREiBWzXaDXYs/2Q1MWiXAhHvyPtoaYxq+ljkn+4vkaQZoVy6wN7hU2j?=
 =?us-ascii?Q?23LsP4FNj0kde9ycP5hNai150R5NxaoCgheuWFsEH3Hq810MhkMz5f77tWKl?=
 =?us-ascii?Q?FsH/dPb1AnXi9w7GkO6DCdaYhuhdoUQ2U/v8wbUYu/v9gcOLbf1Ptdm6/O9K?=
 =?us-ascii?Q?6MzImgLmgAKRyntzSr2Jsq917KEBbblTqkiELWRFpwzhgJJDe9y/7ncWpU9x?=
 =?us-ascii?Q?YEo53pyE0Xnimyty/Zc8a/g70M2ZgJeTfoqmSfPTj3WiLAqUPj5DCuYd3D6/?=
 =?us-ascii?Q?6PkEN0xBDVq9Ml8emcbNDqLPZvi1ON5i/NK3coVsDmq1UAYWA0Rksr6BfifZ?=
 =?us-ascii?Q?eQgqZtEB3ldjjVSV5DtKlUUDYwyE/2RGsNCJ056h9HOoYJAQfNIPQfiHDgmv?=
 =?us-ascii?Q?o387vhrCAyRb8nfXTrS2ydvRJ1adpmAI596X+oxBhUpqPRUHElX0EXm9nWxa?=
 =?us-ascii?Q?0TDPBc14Py3ry9qy6+YCv9AfSdbz8xRoH2wTFHE+ULQr+C4u91JK9+NS/y1w?=
 =?us-ascii?Q?mT4/p1SgfnQNyXE0yo7QiPYUlTaUFko+7I0kduvnAmY0ilHgS0e3YbNaBJWF?=
 =?us-ascii?Q?uiabsn92az+9n1NVq/EVywDTSRARyJWKZQrfOz45h1UbXUO6UDw7dHoYr/LR?=
 =?us-ascii?Q?9dgEig8llAO/fPxrnM9rqrsSZ0iWfCDXHjyEloz6g10gV/FFt4B4dW/T5zuP?=
 =?us-ascii?Q?8LVe8kR21vqR5gl+L/91lF+kJEZx3ZDfCuKH/6++D8dE8idHoN3XffPk5Mai?=
 =?us-ascii?Q?Gn1K2NfhJypoYfye4fmfAKEn93xPy4dfSOYRs+WPQMF6VBkOOBL4aMrwSNOy?=
 =?us-ascii?Q?jqnIPKqEgII4cKjFVW9Bn63H9xMoDcOqB+Xx19El9ci7DnW+zWNxJGLUMCmF?=
 =?us-ascii?Q?GuyJL7m1sGD8N1oghUg5uHnR1ROSnpP4GCHEyoV9WpomXlF2emjj+N+Q0NZq?=
 =?us-ascii?Q?GEx4VlzD/A1t+Hb77u47aIE8wRDr/RIyJwsaXqtVcZ9RL3Qa6LJPyV9o6yNV?=
 =?us-ascii?Q?e7j7fz36NVAmAAEhaoVMDS73g41hWDZXCGwGKSlyoNDDYA0GXnoQYORI+UVT?=
 =?us-ascii?Q?NWxBNAVeFwP2LgSjBXqFLH29ek605mHXYzZZDX+8GfBG3MRLt829yMoukNVf?=
 =?us-ascii?Q?pv5xeyZCpnBKuYD6OOOoIcCExBl7EaInMXdI4l7vsP5DvA4BCTbrNLISa2H5?=
 =?us-ascii?Q?Z56S9KQgH+gsUj7krat+EeiL9QAnDxN8NHTHkCiJ0jgE0LhGZRksNguGRO44?=
 =?us-ascii?Q?8rLoC/K8Fgkx9RuoWs1U56Otex3kwiBEVlmKAMpCezW6L4t0VY/TEMa3ZdcC?=
 =?us-ascii?Q?Uc1TCmGOA8Chbq+JOOo7vFiNI47W2Dw9N6dkvisjKA3OKud8MbhcAGCRRt7I?=
 =?us-ascii?Q?/q9z0jzi8sk5Pbo8yLI9ahJeHhhpHS6aO0g+Zs4tJGjL0hnYEwUV7e86T87O?=
 =?us-ascii?Q?6ZGza6+h/vFrURNqLhiMkvBkD0KsBNDbQSPqinAefTzer0+8yulrVVcG0Cgs?=
 =?us-ascii?Q?B74uBZjEgP6wfmGSBLcua15Lko0yQVBQXprQNlbZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acc90cf-a2f8-4024-6dab-08dddfc12787
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 08:11:24.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZc2DDobMbFuCIT5DWOMrxHbiWcqfBa0r/iX444tdBgt3b9n/12WrX+snmoIa7UxTboprk+6S50OyT0JKV+F6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_011127_754168_08C1F0A5 
X-CRM114-Status: UNSURE (   9.23  )
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

The CLKREQ# is an open drain, active low signal that is driven low by
the card to request reference clock.

Since the reference clock may be required by i.MX PCIe host too. To make
sure this clock is available even when the CLKREQ# isn't driven low by
the card(e.x no card connected), force CLKREQ# override active low for
i.MX PCIe host during initialization.

The CLKREQ# override can be cleared safely when supports-clkreq is
present and PCIe link is up later. Because the CLKREQ# would be driven
low by the card in this case.

[PATCH v1 1/2] PCI: dwc: Invoke post_init in dw_pcie_resume_noirq()
[PATCH v1 2/2] PCI: imx6: Add a method to handle CLKREQ# override

drivers/pci/controller/dwc/pci-imx6.c             | 35 +++++++++++++++++++++++++++++++++++
drivers/pci/controller/dwc/pcie-designware-host.c |  3 +++
2 files changed, 38 insertions(+)


