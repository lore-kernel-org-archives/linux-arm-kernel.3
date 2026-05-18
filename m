Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C64ACD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HFS/NhNIYDirClWue6ntXNahzmzA6sdQ8PXP7wpXv2U=; b=US2uTtZZ+NNfNOzVtUSmIzctMZ
	0rCA3ARSnoUjoAP4WEY5ukO8arY/h1tmk/XcJIpXj/IAn6R0yidQRHXX2TnW7elzCtQuJuWGr5tcL
	c5OMgcQbsaxumg9QPKpIhpNUiKOrAQthzdICmf+Y3/hXQLTnAOVVut0iMACXOYy1TT/4hKfRnmnLy
	RtCqz0lO9RT0bfzpHRfK2izLD/q5ikBExoTr4VE8LYps9DW72kTZKn1i5y9jWtrakuiOi+dG8RsB0
	vLLmGdwgjfPN7finSTBzGJzTf2H2Q8sWQwOSaVYAF7nbgblTDkO1slmf9V3jAN4RJfsmOiT2Jvk/W
	+OCbS0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsLj-0000000EZwA-3DWG;
	Mon, 18 May 2026 07:25:15 +0000
Received: from mail-francecentralazon11013023.outbound.protection.outlook.com ([40.107.162.23] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsLh-0000000EZux-48B7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQSoTJ3f+TijBJ8od9ziXzfLlst2BgwnVfK0NKzry0UGn+ptFv1u00WEER8K3xWvGBwikHRKdqmQJqK8iEq/4r6WuTJjD1GPPjzf8zVaux4hwGZ5Wq/uc2ofJDAhLaQLnRJoU3C70gQXtZQ2nnaV/hXqH9USrZAwFeNesE7604UUR3OTA6kpBukP87HRbPbnlCiU252N0a6JXNfHy35UTlW+OFus3eDwNy1dckiP3Q+/4blgsxGiMaLahzmPE3KVwM01Oh961EipiNE2i0KY+j7prM4v0of/W1hUVwA+EtFgSE+Wgu6L9OKEjNmKFt4K5BF048hlmPoOgpXr6AQUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFS/NhNIYDirClWue6ntXNahzmzA6sdQ8PXP7wpXv2U=;
 b=Y/w0n3egZN40VPxvWcCvN3/JhB+FkLZOGpu42XyP/JKxVALkFecuRcYtwGdzt4xzQYqdZJ2CSVLjy1cjPSzf2kD6Uoq7hYyR9BY8nGwW5NCMyyltkTD+T2/uq4XqizMvL54GCIZfIC14orv/UmVafVgSASMf5H58QK0f9JLplvBp2MdH1lt8qocK7omsiEJ9JzQ3RS9XTTNcXvVgps2Tekj+UjtsgIfpZCcDf0P5GI910Bzf7D/e9TBtl+G5sldaEMDaVMC631gi7tLRtYbeQGV3e9ddFpZ9qPj4MSjA1PcdIpZAr/3eTpzMKMC4e2g5uF1HJc3d2bI2fJ1BO47HxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFS/NhNIYDirClWue6ntXNahzmzA6sdQ8PXP7wpXv2U=;
 b=b7MbKcJmJLOTx8iePjs/XrneDuU/wGbQBQSG9W9O0fRpX/MlJ1cJrhv2/C3Y2TQO/at2ul5kH6strFfY21DaSyMIOoxYAlFLbOSrgTDVAAZIo5CKAnX6Kjgm+M4R2B3axw3EpBRFta6YnQqSXlnM3OSuT4eXcdFrH7ttYVjSJDwRngemag9etTrQ4dgZ0PozoxHPO+w/M2ygLvcEKz/yyPGRCfpruVWuMy2WdabhGjKD71O7OnzpPfda52tyN91QT0tLTtlTQ3qO8xW8JnaOp2BRVtfm9h32KY5s/IpULJC5N+E5Y9I0kSgBavKIbsfDIPLI9ikMbjefzhBfmqd4aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by VI0PR04MB10998.eurprd04.prod.outlook.com
 (2603:10a6:800:262::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 07:25:06 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 07:25:06 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] PCI: imx6: Fix i.MX95 PCIe PHY initialization sequence
Date: Mon, 18 May 2026 15:27:13 +0800
Message-Id: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:990:76::24) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|VI0PR04MB10998:EE_
X-MS-Office365-Filtering-Correlation-Id: 4526562b-6125-48ae-f5ae-08deb4ae9572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|52116014|7416014|1800799024|18002099003|56012099003|38350700014|921020|11063799003;
X-Microsoft-Antispam-Message-Info: gVN9IBVyQWfnFj+7l1Bid0mcSGJeJs0Jezu+TGhb4k84a0zKaFCFCG4BAApxz76hhsT+L+azm9g3MfgkT0fc9a+uIQ9xMBDpQJSpZu/4KCsDWJxnTWqU32mjW9cG45rIqrqaHBTWQEqaiLYxHoy0No2PBGmyONmVsB2fDuWc/++O57esD/6ihDym0IKPoELV6HpnIYnLlK7iw1i30Xio5B4rqQKdv0qa/+h6bxdBElFASkuLaeE39NaaZgwYy0azoCxFzaOKkdStAH7T3W6hMgVtDfjkzk84upEzJBXLYi1kJXbD2XIaG5Qi9NmQI55H8/jtViDp4xP7J3/0Dn8m6TSo7KWHQ7tYJ7hheMcrEaIXKh3sSlOIgP0CTtAE4WJuDuQYoxCPTkjVjgqqFON8Xxr0Hpr7muTnrQenlNBBsoe1SSTP6KBULaGopCRR/puOUnf2CY8AIj+VA8ZOActf3qfMITdXT+3Y9YFm0HexSfBiW9geypAV7mrvBoOg07PExgH/PAFhnb6mT8mjNrSoKckFDSLMnIRjvHHi3I79z9Q5r+9ODh3t2LVw7/ERn/+Ko6vIUn6BJ/pngPBMC1iaGPVKAI4LMVJQyEldL6SNX+6UL47J9hMCB8saSHNMsddiOn5b+fiy0Jn7fM62MslWN/WU1jwkxqgJsLd7tfzMogXDP/jaFmoDoqKChnFxbK3UvYRjo+y/NEPM3oZAZWZFNx2Z4s4uKkBHNO1HcCMH4dUfvAzo+bHnCbylagjMT+bstClkBrxywveqaqU6O0timw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(38350700014)(921020)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1GlGPqCbyGRyp8JKoc/vS8SJb59bWYMaXIEuHNTQhU7SIGr9KOJ8cm00LH/t?=
 =?us-ascii?Q?kgypoFm2qkxV0cF7s3LAsQlrRhs8x4XuFgylgPnnhcnrB3K1qPu3ED/XVAPN?=
 =?us-ascii?Q?eP4OhGM9T3r4KlnQ/HUOJEbh9Ea5n/OlgNROqCmScQ1NJPukPzhD/n3RXroG?=
 =?us-ascii?Q?XlAzKDIAZ9xXt7JGgQtu5VnT1+DrQsAVUkVOZN5tYnpqxRk4o1wNPuVlFBMy?=
 =?us-ascii?Q?+glsFpyNsOwEYl0SO0/dY9Ja9PrW54Lt1TTzsYdBwGr2OeO7OHMMxJHHBxew?=
 =?us-ascii?Q?zrd+ei3UI76FJNVmycfOjmJHXGOIK1xR5vxuM/KCCRGcZAHHMAevQdJime+P?=
 =?us-ascii?Q?TxWWgmls19LM6SWrFFdL3APJR8xMdYzPyejnxLxAzzNH3YVv/gGHNywEeVm8?=
 =?us-ascii?Q?mGdOU+7xwnGqRtCozJRv+yl+m1aIUtZ9WpzaM1vBX9ZQADhfxi26MKyo8JE7?=
 =?us-ascii?Q?16yNpRh7B66KBYYDf/JiV7JQMV8xUMop+l3C0auzylxke6/LaRHhmXvWXBKj?=
 =?us-ascii?Q?AvhniJXHZDTH1gDuyI3u+ROM+JdTluw0e51EfFjeBLYL8oMwnPsr3bD5i0/X?=
 =?us-ascii?Q?sqUrihF5ZTL19kqGmK6KJABRzdrD362T9HepVMKrj5spa+8atyKSYzMgJnK/?=
 =?us-ascii?Q?fxMqcO8wmO40PL4BGmGMcFnpxPf6CFiq7q+DubGKDLRM1w6WCf4eZqfnVamJ?=
 =?us-ascii?Q?Qe3clzKgYxjnn6KqvAVf0WBmpMEzqCWPbXiMFxf8WERqXD8kYodybGPszt7Z?=
 =?us-ascii?Q?jclnXTo9pop1zxaPQwBJMis65dDciaEP07cPHFuhg2M8m/Z7lI4BFqY35WGr?=
 =?us-ascii?Q?bP8QBMzU7UPPzo/BIGPebSXYLLX98rRWN92RevqAGEXYnxe8CNq0akf8BBPW?=
 =?us-ascii?Q?W2Xg6iaRq+2vOIgxBpEUyNFp2DkcCRnjVT1G3Q/hzv24f8YRnJj06xQnxJC0?=
 =?us-ascii?Q?bRqJ4IV8R3Z0PK4IgtrsAFwPbfaZYSCWdZ9OizTyYu41NGgu4zP0FcI6qfhy?=
 =?us-ascii?Q?jAvwkVeS1w8w8AMxtI3DeoNjX0Pr6NgefJ50YjVEJdybqgxnQZAxAwq/YP9n?=
 =?us-ascii?Q?9d5UST4vhE54p/o0uJRhk2dI8VTLK4QgxzCmlQab4AHFNvI4uCEAin5xWZq+?=
 =?us-ascii?Q?eJBGVAgX7m7IPm+bWU4bIvfGnzSwe39NmswjiqQ/aChoclFsSSjv9JMHR7qh?=
 =?us-ascii?Q?kvJoKG0wifPHzZL2vfjWd/XD/j8Lk+IJcSqhfzfVh/UiaK/3mSiDpYNwBgbR?=
 =?us-ascii?Q?N+8/lhgSCXgJaE7vfVs/N/+jqgjU2ngLPWPc36EKqQeBIJ9NYuPY4HXCx8de?=
 =?us-ascii?Q?hJ45u9tgjnsSXo1CBcrz3XXFaOZ0/BDKOg1wADwA9FVQbYEf8AyLcavYrKgN?=
 =?us-ascii?Q?Kz57t9Nqw/sZPM2sIhFyM9cebX+DACZQZ0HehAInKdgQUhYy2cZgjwHRHC9Q?=
 =?us-ascii?Q?gzvzhWRuFYfbPMcemXFQtjkUjDeru30HlSYutk5bo9YM/G6iGLSxeZO2tVRE?=
 =?us-ascii?Q?2g13SZZRsX6Rvd+eGKHOd+icugyUfgb8hjdb7bZxqfeUJiHttEMt5Gaky18z?=
 =?us-ascii?Q?rpyntqEGVN6PjcYdMUYBrrTC4mN481FOXZ+JABiHFgQUTWy8wxYfpupVaV/X?=
 =?us-ascii?Q?wKW31sVk/La1D+DLYkTxa2n1nttJkivXUD9OhKGnDjqR1VAiN5qxublL3vfc?=
 =?us-ascii?Q?MvhDoCIXb5hIG4+5qtlJLuZXAISmXZYwNWi47l1CbL+BRkGIIEFPiXGY1txJ?=
 =?us-ascii?Q?VS/Oe7mUGA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4526562b-6125-48ae-f5ae-08deb4ae9572
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 07:25:06.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snQ32qS5c8rmHucTt+WRFwFEaQ/HnhMlEmXYp+jNATOUrFvFiafhqOYFzwvKcEBINRW7eHSaFhKFa2/Gg/d1mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_002514_026934_05C4A58D 
X-CRM114-Status: UNSURE (   9.79  )
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

This series addresses PHY initialization sequence issues for i.MX95 PCIe
that were identified through careful review of the i.MX95 PCIe PHY Databook.

The current implementation does not strictly follow the timing requirements
specified in the PHY documentation for reference clock configuration and
PHY reset sequencing. These violations can potentially lead to unreliable
PHY initialization.

Patch 1 ensures that the REF_USE_PAD configuration is applied before the
PHY reset is toggled, as required by the Common Block Signals specification.
Any change to ref_use_pad must be followed by a PHY reset assertion to take
effect properly.

Patch 2 corrects the ref_clk_en signal timing by moving its manipulation
into the reference clock enable function. This ensures the reference clock
is stable before ref_clk_en is asserted and before the PHY reset is
de-asserted, meeting the PHY's power sequencing requirements.

Together, these patches ensure proper PHY initialization sequence compliance
and improve the reliability of PCIe operation on i.MX95 platforms.

Changes in v2:
Correct the register when configure REF_USE_PAD bit.
Rebase to controller/dwc-imx6 branch of pci git repo.
Collect the Reviewed-by tag.

[PATCH v2 1/2] PCI: imx6: Configure REF_USE_PAD before PHY reset for
[PATCH v2 2/2] PCI: imx6: Assert ref_clk_en after reference clock

drivers/pci/controller/dwc/pci-imx6.c | 53 +++++++++++++++++++++++++++++++++++++++++++++--------
1 file changed, 45 insertions(+), 8 deletions(-)


