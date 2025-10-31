Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85080CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 03:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5+FJnJoq+VYPyp5IEIXY4mpjHixW/se0uSaZN5w07iE=; b=sA7/VUWWBmZwpT7i5bTqajtaGP
	yxHMceKfWfuimufQuqoJ0CpHdImPtgBHdjnyaGoYrABSiwWp9whhiQKk8hHYyu7GJ9arVZOO1ya/z
	06Xz5MYc5PAY/SOzg59UPHXxBaSWGeA2iLUCc2g7KH0aEeeMdMse2X3HrF3POx2sza6JkGiUSMxzt
	XFjCawpgmAgvVF70bveNd5T4XIBznUuSoaFtMFL9+4fcQ22IXAXKdPSqzmyTOJbKWq9Yqph97xKs8
	rVVye+mYsIQcka98mL8jTBR9hfvc/VIsP6we4H8romxYv356fmZheZILFNcrh7vABhhs7ANbUH6vQ
	QgbDL2TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfg4-00000005Kak-3vxW;
	Fri, 31 Oct 2025 03:19:49 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfg1-00000005KZl-40yh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 03:19:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2dHgRI2OYDG3is5U+C0blaEBO2JVkyYm0MbMJlOmkOG6ODgDwQ8r4HYHa/ba8cRCbrkF1HD5HNkPj31djG7BdrT4llkD2pKFsObZK5N37mMfi12n/ZYiAJqYcCIfHrmBKBbKSKwkLcxOxRfX2J1qCfgkrBFSsI5qgcmg0hoFT+Xog6ceP4GpSynyazw5X8vCn/oRbf15rXLxENRkMbi3TihF2fQMa0ErR+ZM8l+zhdkOIrsYUwCPilqBQUsJFPrWrTjHrhe+RAdWF2zqchMgrdZ2cid7j9kHoKXpqovwFjcwQKp0eKymdPpSynC3s9NvIp8pivCHsb4nBJMHFqRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+FJnJoq+VYPyp5IEIXY4mpjHixW/se0uSaZN5w07iE=;
 b=BqlEs20/aRUJrp5fZt11+ob4VNE4ExsxlCIRWoGMDtxDYiVBkHjFERJQu+X8ek2jm8+iKkdx1Gy+u4d9J1R7CtHQPhWtbzkzzw+E67gyU98Q7mhrZvGSkgw91lA1kKQpV/DP24DjLV4VOKvSh6esc7kicG94fAuaexWmVdJDmo0YWyff9esEHwDqcUrnJrE2N8KxBQNS+c+o8Su3oq8UYJRlzugfOAArOAecFvYdqZG2eRKe+L/tJCY8Sc0V6rMBGtcKciK72riJY8TpkZW2ZIKMI+nbyG1l0Qf7VEsRKwTEYIX8c0mnxN2OZl4rG0CQg6YTGASX2kp6mb1NyZs3dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+FJnJoq+VYPyp5IEIXY4mpjHixW/se0uSaZN5w07iE=;
 b=MFsXy6YsS6nBy0nF2jG8KDPnJqxiCkIqealFotUud6Jrzj7UJj9Zj+mCFQckeFLhnT5eY9yCYZwBgNCgA6vBQL93MNvvWXWH9ShQfuxaYrFJoCERTPTDC1yBT/376AzatkqYcQ3zO4O8pCyhQzKROtqu703XDNyb9lDYSq0PKfxV1vdAj/kV1uJH6l5ghA581d1Lj0tABqplWZdVmygfVsOTDrfltVgamgspl+eQueERdpdh02xwU1l6Jx5BQiuL09DN6KZUSCUUb48rcg/VhG9SIzYbBG14CSiB4sLZtBkCZsG/avoRsQlvMDsMmu4EHwSR2RG0H9piJKsAk6ZZ3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 03:19:39 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%7]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 03:19:39 +0000
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
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/3] PCI: imx6: Add external reference clock mode support
Date: Fri, 31 Oct 2025 11:19:04 +0800
Message-Id: <20251031031907.1390870-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 95dc28a5-ead9-49cb-2463-08de182c53ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EBTMNQzLTR5jrjmExd6wTX0qLuvUMi2tcOQ+lihEyk49q5NQ02rE2Muc4NSp?=
 =?us-ascii?Q?rDJGevNOVpxR19tnirwSR8i5FufYIEFWhwHqzuEfCEq3OauQRkVzhP6AVi4r?=
 =?us-ascii?Q?U7hjA7u+Cjk0fuuo7RFONC12UZIwiNe8HzifRRpQdnpt6c1Cw0ezML1ZGC84?=
 =?us-ascii?Q?9sPdBNvFwgGLqS05zaKT/3tNMX/RmfnegRo3dAg52eChAwQBpgbkc80ibwJX?=
 =?us-ascii?Q?NuIOZMCbCnkemcbZL1YBpr2P/OqlkSVg8OEYSMVX2TPCpjYt0Qq6Gklxv3+2?=
 =?us-ascii?Q?B+8gIHp2nuuIqAqe3XcHMyoWpJiPGe5JWOC4W/yHyw4lLm081yL3FMCu2JzR?=
 =?us-ascii?Q?cOL2t5ogcAaPZh6oDOFTjKwZng98CjBHS/FomOjdVVTpxDWuYiZ0OFiNwoy9?=
 =?us-ascii?Q?6f3v8yKQLPW4gEAF/nS310prM5i5ZEw7Vtb/AjWBhNFeTX3AW4QTiB35KfV6?=
 =?us-ascii?Q?5xOEwQqUprtvhrRb3DJ9cwfcP2Czlrti7/D63mQDKHDFUyVI++M1v0aKIf1y?=
 =?us-ascii?Q?hoB06M/koVuOA3NxT/rbxNGhm7lPYm7CFMDLOArppXSv8479a9psVLGxr0Iw?=
 =?us-ascii?Q?kPbq8jYRZpKJHQlkdopC5ABvKTHsrsaWwd/TBu3F7UnVAHSC0Qm46xzJpaZI?=
 =?us-ascii?Q?4qLHFTRyZqD70TRrQhNBFDk8MZ1aQb0KzezzJu82/WqCwaHMbPbPZoXuBKr5?=
 =?us-ascii?Q?Lj45RUY1FQtumtujpX3iBq2fnXW0hSaa6u6HRb6NwAPyeswqht3f31nBmFV/?=
 =?us-ascii?Q?vTf8zWjRhFd00D1UOiYce0ijnAu5uoePBzHEKcjnjh51c2cIC7aVobkXD7hf?=
 =?us-ascii?Q?PFBM6uUBo4Zhkrr06ROgNGfmP2SUl5rGLV8V6SBvwpjTCLNjqA4A4f7Ak0Q8?=
 =?us-ascii?Q?1aGcjdbsZx/hf40eAZH7Tv4/rtfXuaanYlijZXv05uedt7pH58eiz3kNJU4k?=
 =?us-ascii?Q?VvLTVqfWJjFGGjvY3KOW9sIJcRBkb0W/M/w/O8y3xWRWVpPlzBrCsh4LbnKl?=
 =?us-ascii?Q?AQQbuniftCCsV/m3D2EhZVNys2UIEHAKX595RpBeoDsfZ34X4NNXKUe5Rw8b?=
 =?us-ascii?Q?EPZK64clU3sWvk//MqVxV5RNUABktpJ1k983PJTmG35TzlB3HfPRzedYrI82?=
 =?us-ascii?Q?AWoet4nMvNEb17zcv15T+VGiYf+PX1YoKA7o3FmxlZb7fF9Ww6hiXV52D7MP?=
 =?us-ascii?Q?0WP1Hol6pQKZVB5huajXHYc0NyLGRqdj2AtHHRTsoK/A6HKpXOYj3A6B9lzS?=
 =?us-ascii?Q?8m0sV5QLsMauxYWFP6QDgmQ0cnMTuNENPdktEf12q2VqO+aKt69/1xULSiEE?=
 =?us-ascii?Q?60oWeF405RLCPc/LKK45qEZFlyz9Lbiv8hTdk3NazuG/OElzx6yvoeM3IvvE?=
 =?us-ascii?Q?4AaQFAkh2xPmukHHTXgAwp7DVwp8eCQXVVlGgsyXIaShErBscxc9iOP3gpHr?=
 =?us-ascii?Q?0TAZO2ooNeRjU8e8MoCvKBPf239kQQJVGVVE4ea74Crhh2xnsRzQuFvx9fsg?=
 =?us-ascii?Q?yXT6+ieifJheQIJL5o8+k2sYaMT5/hB9CegE+eGElQwrm5L0/YNG1ftPRA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxVDxa1dUGWcBf5IZ7qHd98jTXnHhI0/tOSeQkLy4hn4ETuK4dHfW63MgEOK?=
 =?us-ascii?Q?cGO4TdjW9T8MMVFqrMcJyPAvM1NBhtYKbf6umbJBGJPZc0ubaHeLwM6zL1K+?=
 =?us-ascii?Q?punMdD7OhwjlWAPVaCGR/4KZ2/BF4CChAVo2yy3YWOQ5aHGGsai2owxQA2zZ?=
 =?us-ascii?Q?PdN2RiifdtZkAYtX1B6DT7VMKJCwMUw1dvkWn/9y0cG+HGvcnjqVRZfSxsyk?=
 =?us-ascii?Q?87AMR0ssdlzXKKpaAeEL/l8q9hpmkGRI51kbRsiA+44wAFmrq0L3sJnfazgd?=
 =?us-ascii?Q?y+QXg6Ae5WWrA1518tPWSRHhRIiyJCEDppYpjLub08S3UBjnTdY6EgFZdOMu?=
 =?us-ascii?Q?oCNQsTI0a0DS67CBOdQh9pL2jkXEPa3ZFi1Bnjh5iSUeWhlHlNts1M+sR3IM?=
 =?us-ascii?Q?nFDnvcNswE9RDImMPFOUYbpvtIjiHD4SUvhx1rdP4ESl4R4VI2mlJXCCiP6q?=
 =?us-ascii?Q?XlehcCS6A0KthxH1poIKm2o9Am6PdZYRlBdoMFJEeOjinniBi3KfDu37PVlH?=
 =?us-ascii?Q?2tym9qU+ENmxBHxwAaDndo/1LWRyRF40ZMVJkv0CmUxl4LYZy5bIRC+W34I0?=
 =?us-ascii?Q?wYpfzdTV4NqAfDElm6XHoFPVqcFo0pxSigsF20gbn9Lj8obUPd+YWVcbCidj?=
 =?us-ascii?Q?cA7nt/Mmipb7QCSCS1SOdkxlPrxZwWX2PzS6E+PcbG91C9noxeimI7sKSIcc?=
 =?us-ascii?Q?xr8ozKKm0LARQ6ntxC49a1QPJbt8uTQ60Bs+RK7FWtbz9CyxPOhfPmmR0zRr?=
 =?us-ascii?Q?pQvWeoKy7zkO6sFPhkbqm50gLiurBlIyZYE8e6dGOdRKDgReQEch1dykmzK3?=
 =?us-ascii?Q?NfoeB31y9V7L504I/tB+3kSTuqOhiPUe4ym+oWBRzvU45z32GaGM5oRmcEo2?=
 =?us-ascii?Q?GvsY9LAnyxJtulBSqnL4nJuyhwajcKlD5oCSc8LnjX0/cCFf/o+f52t53KXL?=
 =?us-ascii?Q?mFq5QBz7GaBPZrfv3OC37NjDAp/LNqGiaN2DCgU93LrKyxeeHJyO7eP7WHnf?=
 =?us-ascii?Q?8B4MQMNFNVMX5ZKEYq6FgSF02p+yeR10xCind3wXvQZQ+RnSl8jlu/8sklhk?=
 =?us-ascii?Q?Q2F+h0JDEKLb8YWXzoyyEurErq+JYfoP2AoNSg5oM8kB5HkjFGCwQdhdwhPY?=
 =?us-ascii?Q?Ycym1K85tRpwgpYBnHCEGfmBk9VeMrksqg/6iH4kvb9F3riEsKDLkxQkkA9+?=
 =?us-ascii?Q?vRSI0pU5sjj87yo893NPkyIX54b2fxqCBHAWriow6porCVpza/gKOTyvdbOz?=
 =?us-ascii?Q?7YH7isARK9UQ83hPZP3IJcxSnZ0Uebw9O6h5GE1mB4/U258tuTTHmGFND1Q2?=
 =?us-ascii?Q?/Or+Q7oaxyUb6agGkvhf+3nbgMCRPxFpQmSyQBwWtabfxv4N4Qi/00Db8ZqL?=
 =?us-ascii?Q?0CLCnq2KJykD0gCioIPZco9M1Tc1swM+rG29VGW6fdyKTG2td/QjCo85UURO?=
 =?us-ascii?Q?gBqdqH39SQVD1zfNfB60V4yKqp4EICFyBQhpjUWPeUqsAGAW5E5bZbXAr6xZ?=
 =?us-ascii?Q?m4WysahRcNs1dv1JYWh/lkwyia1HyysQFAVMG7aTClgyMyWLxVU7wLyqX6+Q?=
 =?us-ascii?Q?gXln5BRhCZlpfYKp7tezsxf6Z9j8lm+Gl6+hsFwQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dc28a5-ead9-49cb-2463-08de182c53ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 03:19:39.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXgOIB4khYIXr207iK3voIiVB2slUUBGt7DLh2G+XdtTgF2eIYxswtHXvvYKg966ZGs/snagYP/DCbAVqAxP+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_201946_011023_830C894C 
X-CRM114-Status: GOOD (  10.64  )
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

i.MX95 PCIes have two reference clock inputs: one from internal PLL, the
other from off chip crystal oscillator. The "extref" clock refers to a
reference clock from an external crystal oscillator.

Add external reference clock input mode support for i.MX95 PCIes.

Main change in v9:
Thanks for Conor's kindly review.
- Enlarge the maxItem of clocks for i.MX95 PCIe.

Main change in v8:
- Rebase to v6.18-rc1.
- No need to initialize bool parameter to the deault value "false" refer
  to Mani' comments in v7
https://lore.kernel.org/imx/20251024024013.775836-1-hongxing.zhu@nxp.com/

Main change in v7:
- Refine the subjects and commit message refer to Bjorn's comments.
https://lore.kernel.org/imx/20250918032555.3987157-1-hongxing.zhu@nxp.com/

Main change in v6:
- Refer to Krzysztof's comments, let i.MX95 PCIes has the "ref" clock
  since it is wired actually, and add one more optional "extref" clock
  for i.MX95 PCIes.
https://lore.kernel.org/imx/20250917045238.1048484-1-hongxing.zhu@nxp.com/

Main change in v5:
- Update the commit message of first patch refer to Bjorn's comments.
- Correct the typo error and update the description of property in the
  first patch.
https://lore.kernel.org/imx/20250915035348.3252353-1-hongxing.zhu@nxp.com/

Main change in v4:
- Add one more reference clock "extref" to be onhalf the reference clock
  that comes from external crystal oscillator.
https://lore.kernel.org/imx/20250626073804.3113757-1-hongxing.zhu@nxp.com/

Main change in v3:
- Update the logic check external reference clock mode is enabled or
  not in the driver codes.
https://lore.kernel.org/imx/20250620031350.674442-1-hongxing.zhu@nxp.com/

Main change in v2:
- Fix yamllint warning.
- Refine the driver codes.
https://lore.kernel.org/imx/20250619091004.338419-1-hongxing.zhu@nxp.com/

[PATCH v9 1/3] dt-bindings: PCI: dwc: Add external reference clock
[PATCH v9 2/3] dt-bindings: PCI: pci-imx6: Add external reference
[PATCH v9 3/3] PCI: imx6: Add external reference clock input mode

Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml      |  7 +++++--
Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml |  6 ++++++
drivers/pci/controller/dwc/pci-imx6.c                          | 19 ++++++++++++-------


