Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3A9CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPgaijotZZHjsQlulVJL79F2xvE0dbz5nLrb7bEWSLA=; b=dbyUInWcCUlPjN0W7il1Aw+A1/
	88N3fARc78y8GBRuFLSVlhMKnvQzLRKtHCxS2Twzh7EB1NDxvGdaSTkCx/wutSEZzAZzLP2o+MTeV
	DiFUmHFaj5BJp2XqAuAYlWi84yI2SvbHIQK827cBvOyAdOunQ9nLaMUbgT7GBvG354opwfA0097EM
	HqWltxMVzvjHvnRxraMq1qn7D40hq6QIeApVQQJcmD3rshtAsCqIE3mgUocQFOTH+4eHCTJyXhZkx
	kNs8+qNU3BVXeXxtEK/yom4RncFUnapyz88YRRwFXZlhTJemetYWqBiB0wPWaRJ0a3t7liiQrBxQa
	BfzDk1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6y-00000001hUK-2K4D;
	Mon, 19 Jan 2026 10:03:52 +0000
Received: from mail-francesouthazon11011066.outbound.protection.outlook.com ([40.107.130.66] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6u-00000001hTO-181U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1ebqzWbJ4UKSPx/Q9Q+EPcf/hnkvU7NdNAW019IPAxAz0wJt6F+p40s7zPD8NQNvW/ViGuROOR0Y/S4/Vmued5Fsj2yE0ymaGymp2BUdEt1pZgeysun9z9NiVhwRrFxsnGB/D6tUT4UekRE2dHEMRaOyZ7k0kGX5MidSRLbn7fSGAW+tetPc4FZ90qBlQZKdX12s+5H/doOeUEqzrhP87IDnfTM2d6gY3wdDptLUxjVzxAHdp6Nxoq9ahEuwmgyLgzjhDu2XQrtm1ADAJyS/aadY5+zN5Qzm+T575lWHodZS+IOMh41NMnEGD+J6/IlcOtAqRzXN7G5Jw6Er+vKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPgaijotZZHjsQlulVJL79F2xvE0dbz5nLrb7bEWSLA=;
 b=Hmm2FBZKMPOTQaMNN5wb77iTTkwXf8NZ9rwfVYVXaRHhtBrx59TCbqJrS695oOZ1ZS8L9HPjT+sb7pwNaLbvHWXSkpYGkagHfcyksCJMrAJPCklZ/M82EGBqMvLNGykokDuMX/2rwluY5k5B5WHLBKkrJjzRTpTX+Tf9KqxfO5vovuBBgmWd4TyfugBJGUFleEq+mMLuZlRxjePUM9iFO/V4J1eIqLBsn2tAiidmxoyKmSOQg7e4jTIOdqoJWj8/vz6c0EzHGSrniXlCW8hlBLsBeBGA8g7VzJjz6pcyRcXW+CI2qyda1APevyInErWzAa+r3BAmH/cY8oeKGfBXlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPgaijotZZHjsQlulVJL79F2xvE0dbz5nLrb7bEWSLA=;
 b=KBMN892/au/3s9+oMmSTUsFc73iwE4mZo7tzheHCt9vE8MJavNABsyf31VkkNr/9f6mpY0J41XGt6nEV6ihLNKoNd5Kk/YfsF+61BZaelMeIG/vdhgqO8eDt31d/Dz2QrmMd268HTmKjJ9e3UrhP3JrbGWsi6bk7vO0zxrpTz0JkinKfeCJvPerhsdWapSQmApuLgZVIeqshDBwd+wEFieD15sx55S+EzRTi3LR3yjVilj+CxbXaBSVS4ZxFYfSlzCWTXE+aJXf/mSWn7y/Jo4eoXsaS1OImLBf6DySRnalY1l+ahId/gHzcu3J2hvapJvkLlyS9pWo+xOKSDzMqAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV2PR04MB11979.eurprd04.prod.outlook.com
 (2603:10a6:150:2f1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 10:03:43 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 10:03:43 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO in Root Port node
Date: Mon, 19 Jan 2026 18:02:26 +0800
Message-Id: <20260119100235.1173839-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260119100235.1173839-1-sherry.sun@nxp.com>
References: <20260119100235.1173839-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GV2PR04MB11979:EE_
X-MS-Office365-Filtering-Correlation-Id: cff83b43-943e-43bb-df5d-08de574206f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zcbPT2oIL0cnY0C3bc/YsoC2qCjmn/BYH2Ijn1S60GOo226C/PRgf+ha3/x7?=
 =?us-ascii?Q?KV5tYevYR8Z4lf19+n6z4Urph52OqVevG4CJ1nNtn1bp6TmEziEIpx/l9BBH?=
 =?us-ascii?Q?DmXsER0oYmQZLEc4KVnW/+2I2+F1u9DYkquUnVSc3TarbJU1kuJY6IqxFbHT?=
 =?us-ascii?Q?xnTVtPia0FeoXJZfWrcBbu8CUf/5vouZTTlswhgAz2ExowERpgKslKgqQ+3Y?=
 =?us-ascii?Q?qvUS/EriDyWiuz8nXtD7ugXZdFWEZZNKFmK61TWCcbn+b6M0Po4YC0qngVJF?=
 =?us-ascii?Q?IeNnjXhiP6nvvVt27ZfzO2vFsO5i2l1mR4R4um/4Yg0f3DcFnZei0gYLNaJy?=
 =?us-ascii?Q?fU9OMR0WaaXd3dnv1SMCxpkeGCmHJQ+Z2uvMyt9JrEQe1pBTuYonzW2uADgr?=
 =?us-ascii?Q?ohkqyWhLqMHeqdl0rmn0od8Eve/EmBV8DgS7HNmFyrJmhGu0Owk4aEtB6gII?=
 =?us-ascii?Q?yFyxRTchOXHbEvvq6erBBtYwbbk7U3NIgeEQMHpfE8LoUTsp9AuxWCCCokpM?=
 =?us-ascii?Q?ohhAU9QDEETNRxHmApvnotgM+yG/oPUEMXVM2zn8XjwiZIEarwl6X4W2gM7a?=
 =?us-ascii?Q?LZeQmntPrMkEbSOetLH3pUnACBzxh2S53sXraWKVOHmJFj8uriBFsmwCsRje?=
 =?us-ascii?Q?yce1vS02O7T+PZGBE0FsCVBygXva02cF83UUcHhaLjbeOVaMzI5IHNPo8B0k?=
 =?us-ascii?Q?9QAcN+Rt8ZLmXxrLMv/ENOQ8zzJuhOxy9dRrp6+ulWe1SMwTIzlXj0T5Aykz?=
 =?us-ascii?Q?BB3o507gA5BKJ1mQ2l1YvGkS3CRWS7Wu3hoiSnW2wjlNxTxlm+8ucDSjeKvE?=
 =?us-ascii?Q?2WbRQu+wIiWkhZs6qz82hylsIRFPHac1nWr2BS8OO1VOOTySOF5tpfZ6kZYh?=
 =?us-ascii?Q?EhZ9Xq4VfUzcp+45d3qKiJqlogh87+oTOtUA0wz1tafz5JntOgdvJy8LCr66?=
 =?us-ascii?Q?HSwhDLGfwV1Gy/6gsC151lKyJDcvecfMoPP6sXVJB5TNbfVKmO7q+7A2fFpU?=
 =?us-ascii?Q?o4ln9nP8rpFVw0m3e8t2+XFQnrO1puS47JI1T1z6kNBb63T8hqzOBVXLmCWC?=
 =?us-ascii?Q?oPrCyTWZA2379xNYsRtxdJhqB3rIpEBkhkPXBpKBwcJ3NeDw9r1gUG1Il26x?=
 =?us-ascii?Q?YwjlFy8vD9CM4hPNH5l6DfMkElcD4p+mSQYCCE0TNlbypsu+HUHjXZ4eMa+M?=
 =?us-ascii?Q?2lpZ67RMdHgDgxh4DAOrzkow0OCI3ahFTLOSO5FSloVuK2T4nDvFLV60fjRy?=
 =?us-ascii?Q?Ve05RcAKQ8VwshGFuRJKvVq6U4rbb6AfpbLbpP9Hr8hA8znXX3+jKtm8COI9?=
 =?us-ascii?Q?e80LRW/k/zj9iKeNcv0mXMBMNxzepbGGw9D6m2qgScT98P4qiaP/jaC/t8T5?=
 =?us-ascii?Q?v8xGfrKhZhR6aKVyMy5Crfzm3KLO0JKc5Oqcb6AbKC7WRn42PnaAjOnnScyM?=
 =?us-ascii?Q?Z4eOaMdnInM9jrH+Ff5b6dORDfPlqLsdIOy5+v6SrgtG7BQGysYU/YbF7J0x?=
 =?us-ascii?Q?Mznp5cmWqTqGhJ5+mqbXpHIN60U9hpEzU/tJD7XRBkKeiS6Cl/qUF4IzUyms?=
 =?us-ascii?Q?23SIOAo+bZd5/XCCzW7vLyMZjFTEinb2BE9OG4Ti/ghh+gkJ386GhSqT72J8?=
 =?us-ascii?Q?UvwP8vtBJyoXjLLQ3lsOzfJrEsSxuWKJ5ywR/9aGZ0qB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2X6uDNGYNkws3eCcP8kBlYjQT4SAIgLktILvq9oXHicPrAdfOJSy/0lHf4nD?=
 =?us-ascii?Q?Rm6YkEOZckSSarXgOWdiEbVu5jzXxc96/gksm1BxjuGm5yBrsR8WeepSPZyv?=
 =?us-ascii?Q?WtDwzL6Qd+r48E73l/Sq7u3/SJIjj560qhrTEWRTJS7D7SwTh5Mu6nNkPk1i?=
 =?us-ascii?Q?kZ4f5SiIg/5+KiWlbODehYTHO7drC01PzSIkWB3mUKBl4vCzJtH8C5o1OSR8?=
 =?us-ascii?Q?mgWnFnHNj3eQaAkM86RU7SEb/NpwCYQ78Enu8O+jUhlxE4FM0kTsMhjcTijv?=
 =?us-ascii?Q?Q71MmJwF5eaiRGzSE21CskZJB5OCp/h7/cNKyVzKsYREWQnci3OBuykfu1AG?=
 =?us-ascii?Q?nRaTHJ3gbrkLkBDF2XaFWqe2Li28VyRh/PRP/HjN8H1vUZkPccJFTqNhIOEa?=
 =?us-ascii?Q?CCG8bauS+yLd+lTAUnBj4+83O/6Eo+Vfy+C3edOB5s4kKdW7BKqFyFL7Sedy?=
 =?us-ascii?Q?ZZDa/HoyFy3Ys0bZvsDCKO+Wj0oEUvuk95isMrhsV4c83dTtlNFsw4kru1RY?=
 =?us-ascii?Q?kZxdftIRMz0Imb7xJ4+Uge26emlhlfrGlOkDrDgnvFfKi122TyrnjPP/fy+z?=
 =?us-ascii?Q?LrEyl7fp9VEiWwzc2IBkh9EZcSZLuf6L+ddIVAI+7OtRVZRMY9qgldqbZF0K?=
 =?us-ascii?Q?MTrmXMvr2HYEJR4dK+auGeQFfKEFP7OyGUt3rA3S6LkXsBvL5dRfkm58H2B8?=
 =?us-ascii?Q?l7LZvpsl4Dne/6yFqnTD364y/3GEZPw3j9PiQUkcz1o3TefMNdrsp6GQmR2y?=
 =?us-ascii?Q?doF4VVWFiJ9hB9FTs6OmtQbyP5rvF7ThvW0TcUAqjn2siywn+ldstnwGiYIJ?=
 =?us-ascii?Q?JitagI46IvPoRyqYmAnVBk7u/EScpD1VkySdW0VVJqTaQj69X/2sRy0Z7qNO?=
 =?us-ascii?Q?W3QaS1nLgZrv2/4WMaal/vqhtlUeFM2A4wqGjCNQIdpCC0W68OJ0AHPjEAel?=
 =?us-ascii?Q?vPOjzwJg4rbz9ZFjDaQMlc2eLTbrCayq3i2zo5fFZdvgoSF+ZtqZvnzFQJo7?=
 =?us-ascii?Q?TQd3tUaxY+0KrTr7cVpICeAAhVvaEidL3VzfE+nnApKw7sHk0KTD1hpdszxk?=
 =?us-ascii?Q?GS1oqnoacaRou4dv2zGUTVgNwWTm6hLO2fs4S3zNSfFOP8JC2doxYHOywaJe?=
 =?us-ascii?Q?xHMTjnexuBi3j6ESMs7eIe9zI12CBvJSrmqC/YCtUNfQ16ccXaDGKNEguznq?=
 =?us-ascii?Q?Sy77AvyelbuKm9W/4H7RrME/O3CXrqoFU7Ktr0U65P8wXDLY/+iI1wo/WCEi?=
 =?us-ascii?Q?llifI8noyLNU++5EE0fjI9+mX97Dz4y2PZNFHIDnOg7Mk3SJACN/ixNcQxDP?=
 =?us-ascii?Q?wPMmBBK6DRUqWtVddTY4DzbqbYDg0VjAKD+YOr41APRdXdgwFpW1KvJk8Ntm?=
 =?us-ascii?Q?Vff0oCf59XZZuOsGe0+ulgGkpjeZRhhCeMJzn5L4EQnt7exnBh6W6aU5iZ6N?=
 =?us-ascii?Q?j5X2GLU62Fk79SQkUKT6jTsgsAGpoa8yyISPlhL+QGw1U2WRsvuv9NqVkTdw?=
 =?us-ascii?Q?mArBCaIPxyMtsdMC21QKbkkwp1yaC4TCMXdV+08E257j36c78VP5/S0UUWkx?=
 =?us-ascii?Q?HxgCaEgFXJdFRuEmUjY2kg69dxiGcQc4TyVdQtYPDbVu81uzTljNoBySddi0?=
 =?us-ascii?Q?ZtjXGapdc9vR40DhF6PpJ1mJWsABcLR3w0tUtQDCEpnF5/EKdMUtt+6RlZbB?=
 =?us-ascii?Q?WLlQ4Q6UUz/ayf5ZVVAReI0HAXFqFWu43Oq6crqejp0VeY24Dm95WfneATA/?=
 =?us-ascii?Q?GzZlw2jgWg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff83b43-943e-43bb-df5d-08de574206f6
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:03:43.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vl76kpUbTbpHiGlNRNGBWsd7JL5yiXugpHZg/yQRIhy/R5yJXrT85TVMrl9rlY24eFLu6HuuQCrsbwGKxOo4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_020348_311478_E8A954D6 
X-CRM114-Status: GOOD (  11.12  )
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

Update the fsl,imx6q-pcie.yaml to include the reset-gpios property in
the Root Port node.

There is already 'reset-gpios' property defined for PERST# in
pci-bus-common.yaml, so use that property instead of 'reset-gpio' in
this file, for backward compatibility, do not remove the existing
property in the bridge node, but mark them as 'deprecated' instead.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../bindings/pci/fsl,imx6q-pcie.yaml          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 12a01f7a5744..74156b42e7a2 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -59,9 +59,12 @@ properties:
       - const: dma
 
   reset-gpio:
+    deprecated: true
     description: Should specify the GPIO for controlling the PCI bus device
       reset signal. It's not polarity aware and defaults to active-low reset
       sequence (L=reset state, H=operation state) (optional required).
+      This property is deprecated, instead of referencing this property from the
+      host bridge node, use the reset-gpios property from the root port node.
 
   reset-gpio-active-high:
     description: If present then the reset sequence using the GPIO
@@ -69,6 +72,18 @@ properties:
       L=operation state) (optional required).
     type: boolean
 
+  pcie@0:
+    description:
+      Describe the i.MX6 PCIe Root Port.
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -229,6 +244,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/imx6qdl-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     pcie: pcie@1ffc000 {
@@ -255,5 +271,18 @@ examples:
                 <&clks IMX6QDL_CLK_LVDS1_GATE>,
                 <&clks IMX6QDL_CLK_PCIE_REF_125M>;
         clock-names = "pcie", "pcie_bus", "pcie_phy";
+
+        pcie_port0: pcie@0 {
+            compatible = "pciclass,0604";
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            bus-range = <0x01 0xff>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+
+            reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+        };
     };
 ...
-- 
2.37.1


