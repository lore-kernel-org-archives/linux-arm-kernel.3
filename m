Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CC5CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Sl22pSy8y68k97u+TFLyFxhwLXhyEGlfPcBVlZUyMc=; b=emXF2gNrxbjaXuELOnMzz5oROd
	AFw6eR0D9Z2/uBYGZEvyf3a3dj4ir65wucQrQS+rxSLG/hoIrJWMQX8P45d9AKwahQaZO254cgYg8
	kww/3umhI++phiXP5Zqesojxx+38SPcuQV9GUjml0ZWtpCtezDKH2Uf30L6oAd9V1/RzvhmI8L8u0
	8oVjJX2qrJE14qm4HhwHpDOjllZADk4LoLiJTp2DGpFSrOlDC/p9O3XDZLN1quuYiESSugQaV2LwR
	EKFK6AFx9pDMsSO27fqLiYe/prSVNNEO1zkTbrwdKiRuRuGLdHBgtLUwlWftLMPus/0mnrpcXXcjh
	BU1KUNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSRV-00000000WG3-1AY5;
	Fri, 05 Jun 2026 11:10:25 +0000
Received: from mail-francesouthazon11011018.outbound.protection.outlook.com ([40.107.130.18] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSRS-00000000WDg-28Gb;
	Fri, 05 Jun 2026 11:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umMuwJUdq6CHfWIDsd0Un8tHaY12wGvbIHO3K6e2w1T5INLoPeZsNjbZJwn0VFdnkelTO41UABrSi2XjdzwoAIpW5qgxR51udTnOVM+nOWeLqF046ydAoIvg5kmLzjowNSKRglcrdJXEQerUrE+WOX74PSPbgxS4qoH18RzNgEGOHmo1gqNMStKio6JrGp3arFi7RFn2MxIFA2UFXuFe/BC160Q+1mI4dIKNS4PebZhTj/G4KfRGwVrzcMRJ9jGBn4oUDzrfQFffYTaBOQIAAg7qK7w1A/+CweC0jmnSstLHhovvo4YuKTvl6d7vIbaEUzA/2i/eLrLPFO2E0dWITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Sl22pSy8y68k97u+TFLyFxhwLXhyEGlfPcBVlZUyMc=;
 b=ULG8+FUskuihENt8yWSzGbzuKFbbGfAWhPplJLZbMgG147s2VFhl8ZSDrcAznRDzW2uK2LQiIxAMoDX5FGAQL7BtTYNOTZISVhatDHlsvKdDUmKx9nz4wq4IQihIub2EKZQ3STJ/VCJW9FjYbNy95iJGtr4QZyuTUnhbuPdUMnhd7VBn1NLffylTelafYr4l3i/P+jxRQ44uNfIMX32Jzp3MAfN4IPc7YsvhkwlpE55E6F/SuvgHEJzVk12CGZycETn4yod76WwROtgPXwcp3SSGr4PqflUSS9uVljVSQjlZgaL7ymC+kTlnyn4zo4xwDPXEqYHQM2yUh0i3KF66jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Sl22pSy8y68k97u+TFLyFxhwLXhyEGlfPcBVlZUyMc=;
 b=Hy6MboFXw/jxnlJPoo6xHiffucaN2WqEvyWqq83I0wD2L+M4SbKAdVNrGar0iDUejE9KrxTR1W5PnXmUamJ3yVGn30QwRMZBXXOrkJQ8t+0jPUZrA3eAqyV3o6DcogyUDilugBqmBqTcJ4uAgdS0/oWV+743I/rFXr4hxe3GGVMVdJpQrFfN6l4Jtw4U4ZmWMr6zub2DlYSBXLCnFazKEmhpqu/usbJeCR5+sVODvil51JRhsjV8izgABpOO+CIZAw0WHCf3iLUKM/fuDdacXsHOcgXwH2M4VJDeD504BfgQiFzAvqKj5ivLrPXNR10OReBv5m6ThUj4rhwnLRYYgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DUYPR04MB12689.eurprd04.prod.outlook.com (2603:10a6:10:661::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 11:10:18 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 11:10:17 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 05 Jun 2026 19:13:04 +0800
Subject: [PATCH v4 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-imx8mp-usb-phy-improvement-v4-3-b2ddf2f3862c@nxp.com>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780657990; l=4846;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=X/0OvqsY0SjwkGpC8C5QwtrpnsKAIKG4ucTyW+G8b98=;
 b=Bo7j+1OyGfQtpNjErFplpUkslp1HR5roWAxs8UFEmKWVj5Qt4XYSRMCDsCjrpM/jyW8McmDRX
 0iEB3xi0psABk3zQ9MlOE6IQP0AOMV1p6CEjBkALllCO8eA/kWGERRD
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI3PR03CA0003.apcprd03.prod.outlook.com
 (2603:1096:4:297::13) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DUYPR04MB12689:EE_
X-MS-Office365-Filtering-Correlation-Id: c890a3bd-77a7-42d3-0b11-08dec2f3065f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3Yi/PzMvqJSW8xyVBjsFPuujlZVIndKKFtTl/Y1z2iAl4QaSMho2ElghRaP1j8bnuwcYnZQkqk1TYhta7cghsvQQFzvTs2MjPTTvKlQ1SrUIs3RB4izChAa64JHjy+pXsv2DNs4Kgy/Opl3uAQhfcLRo9H6niFqhH5OLXAKPNmPARMdvnLYLOR9C+Ja+HyBJekWz8gOT9lP1c7RM9U5FSUp6AXUhEn5x/ZwglWjw3iZDBxT0hxzUzj5I2v09XqbZglQgtgkXa99luMcDhhRPMufXgG154jqwoxvI9nYJTFOugBQGoKEJo8PEZMosKkwAIhSjnxlypU0bmYTCStRjj2gOHQ9BC+nvO3gP4kf46DzcOuONU8A6EDMekLVbVAD3KvjxXeKb6tPWKFl6h6bdgseGwAVPekXHbJ8jt/T8951792NtTZwCzPIY7GPfB+CZRJZCoD7cW+Y6jn+89NsfjYu7898dsvgJpnfMYbBpxMGbrpRl+sePJT4ZvwQGZYp2QletBZbXezCwo4LzdRtQnV3jexIUIzceGDRMNTGTikVX54jNBt1td6tlAcbTC6KzUTW9i43Z6Gd5GPQFqvlfZATvuD1RRFLxKb0BYJUR000ipZ6kCpdUmWE9r1GMosxuXYewGX3jj02nUzmMIo1EHDZBEM30aHOt4/g1LsgS4NnmfGMgA34xWYEzySA7nDZo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c09YV2Q3YnZNMkdjQUJyejRCQUc2S0lIK3g1Q2ZpQUtCeFNzaXlCdWk5NXEy?=
 =?utf-8?B?WnJwSkJxQmJ6WjIzUFdCd0R0Vms5NGwrRitCdVkzWnRydG1pYWg3UkNHNWNJ?=
 =?utf-8?B?TXBHT204aUw3alh0MzBiMkZjZU1sRXRKMTFZRjdhTFVMUjczZ2RpdTFTeUIr?=
 =?utf-8?B?MHFpeFlRc1VmV3NpdWRzZEZsY0s4V1R5bHJVcHNKaDZzVUVEYUE5Q2FYVFBw?=
 =?utf-8?B?Y1VVQzRtNUZoc1o1cjRyK2ZpS0Fzb2ZDczY5R0ZxVmxXSURZa3VHSHYrc2tX?=
 =?utf-8?B?b0dIR3JzOXlEaVlvbXBoUmthaXUydXpKYnp6TSsyTFVQZlhnVE92NUhUY2JV?=
 =?utf-8?B?bEswV1RFT1FXa0RzNzNCdTl4QjFMSzhuMjJRcVlETXo4V0JMQ3g0c1FDVmN3?=
 =?utf-8?B?SWVHS1JPSnUydEF2MmFKUXNqVnlDV0Q1UkhCWUd6NCs3OFY0bGRLZWt0YWh5?=
 =?utf-8?B?clY4MHUrUTl0STJaQU9YT083dVpTUDZLYUFMWnJ1L09jOEkxdWZEaGsyempU?=
 =?utf-8?B?a1Y2emZhV3UrN05NU1llMnU3RkdkRE82MmNkZitETG5UN3l3RWpKa1FNUHRT?=
 =?utf-8?B?YUs5M05oMlcydG1EZVJiM0d0b0JYZ3M3cFVMMTNKQ3pCek9vczB4RjZMdzc5?=
 =?utf-8?B?V2pWVlN5MFlDSEU3UWRHNGJyVG1vRTZHVXJuMnA0T3FkMk15TkdGUlBEY2VC?=
 =?utf-8?B?U1dXSytpSjVxcVlMWEw3Q2NidEdrTjJqUmZ4dXRjaWZ1U252QjZZTzZsOERC?=
 =?utf-8?B?N3Zud0lnN0FHUWpidHZmZDBhWExhS1F0ZTVJdnd5NDZxbWFYRitZSjZja0p2?=
 =?utf-8?B?OVBEZC9tZlJwaGRTSTdidVNiT3AwZ1VCM0lnbndjWDhYK1pBM3ZtT0J2OEZw?=
 =?utf-8?B?S3NjYWk3ZHhhUHBWT21iVlVXQ2tDbG1wQithSXhXUWsrRENabmw0Vk4rbFVh?=
 =?utf-8?B?YWFSRDE2YXNwMWorRXRVTEcvY3pXbU9NYk1CbkFwY2Z0UVVjRW9OOFpsdnZn?=
 =?utf-8?B?amc4b0o2dFhoNHVnRmtXdFByRGk1TXpQaDZLcnBUUzlGMTZVbVQ0RDBxMko1?=
 =?utf-8?B?cWNna0ppYTNUclUzQm01ckZEVFpPN2tnbzZsZmJUR3F4YXJVRW93bkxWNDFQ?=
 =?utf-8?B?TTFZQUJWSGhvVjBSSnYvbmwreEZ1QllaRXNmWkRZWjFYaVBvZHA4TlQ1NFNi?=
 =?utf-8?B?VGI2Znp6M0QvcEtFTmZzK1pyMXJVY0dtcXFwZHZQR3JNai9yRGtBNzJiWHNv?=
 =?utf-8?B?RHF3YVNQbUlPR2RZZEVYU0ZucnV5MEFFS3QwVXVwQmVHQXFRTDBrZC9PTWpP?=
 =?utf-8?B?cTZrTjdaZ2UzdmVqN2J5cUZ6ckhIODRib2ZMOWJnQm91NzNiNDNiNlU4L0V3?=
 =?utf-8?B?RXJIMEtKbmViTUx1SXhxNGExWC9xL2g2MWNVaC9hU0ZQWENjZm1mVlJTMXNt?=
 =?utf-8?B?OXZOa3pCSDVqZmMxZGxscXlrSXlrNW1xdmxoNldpSDlFNStSNTVvZ21YaG1M?=
 =?utf-8?B?NlNkTXdWV2VRYnkyNk93NXVDdGQvS1NHZFllNndyN3hZQ0h3OXdjUHdFWDZn?=
 =?utf-8?B?SlM3c2lQSWdOTlNlWlg3QW5aVHZzcU9OdjN1YWYrNjZXaWZZZlNvTE9ONjJI?=
 =?utf-8?B?RnJPZ1VtR2VKTDl3TFpYenptekRxRGQ3L1FZKzdDR0R3d0NxWFpzU3VwS1U3?=
 =?utf-8?B?L2JsMG5ITXZLSkRqK3lhTEtSOEFnbXB5MXczcVgwenZ5ZlI1ZVMzTkV1emlz?=
 =?utf-8?B?RE80djdnK1laQnlFSDErcVNad20vOVJaZnB4dkZmanFNNnl6WHZid3hHemkv?=
 =?utf-8?B?NmZxL0NocjZJWnlIWThkaENtTXZUMG5MbkhzYWdrVVg3NHkrK29WRW9XVDht?=
 =?utf-8?B?cmRKMnROY3FMMFpiR3lOQXVodjgvcm43c1doYVJJOW9uekxUaU1tdmxpRGE5?=
 =?utf-8?B?NG9qNDlVOGtkUzdycHorRjQ3ejNIdUltV0ZVMk51MEVrVGd4TGV2SmxQK1ZN?=
 =?utf-8?B?N01BSGpJVWNrM0RpUUVZT0dydmNlWUg5SUN6M1l1OGRJc0IzVXVNY0srZUhF?=
 =?utf-8?B?MVZwaGFXTWdkV0J0cVo5Tks5QURMaHpkYWhSUHpkSWZBODk4STBQQlRnS3dK?=
 =?utf-8?B?MHlSYXROdTYrMHMvZmZNYi9zNEQ4TmNzUTdhU0kxdzFMbmFuNGVOa3Jwa2E5?=
 =?utf-8?B?N2UxN0hPRDZYV2xuRmFlcnJZTTRZM2phRGJuSmpHbmZFVWtZaFZwTXFyY1B1?=
 =?utf-8?B?eGEraTBlRTVBK2dyamU5MnBhVGNJam5JQUpZbWxSZE5XYTVtU0huUFNyOHBx?=
 =?utf-8?B?NmFoUG9XMmo0aGNKaFYvRmt6VXVUWEhKZFI4aERmLy8xZElqaEN3OStSQzdr?=
 =?utf-8?Q?TmEIng7f3CB/grS58JEytNA6wIqoHujt1+FI6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c890a3bd-77a7-42d3-0b11-08dec2f3065f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 11:10:17.4051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjzRieNc46FMOpyCJRmETEwDwJJpNpujhKWyeR0DFyiB6irCAKxEeSVlpEghhMS9bF69c91Qn55jQqhqIh2g37wqNqQb8vS0431YWS+mKpNqRi5XhA6ezqvFuWFMdjiL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12689
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_041022_568956_B7A259E3 
X-CRM114-Status: GOOD (  15.54  )
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

From: Xu Yang <xu.yang_2@nxp.com>

Add runtime PM to ensure the PHY is properly powered and clocked during
register access, preventing potential system hangs.

It guards register access in the following scenarios:
- PHY operations: init() and power_on/off() callbacks are guarded by
  phy core
- Type-C orientation switching when PHY/Controller are suspended which
  needs explicitly care
- Future PHY control port register regmap debugfs access

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - replace guard() with PM_RUNTIME_ACQUIRE()
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 62 +++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 591ddf346061..27aa696f5dd4 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/typec_mux.h>
 
@@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 {
 	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
 	struct tca_blk *tca = imx_phy->tca;
-	int ret;
 
 	if (tca->orientation == orientation)
 		return 0;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
+	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
 
 	tca_blk_orientation_set(tca, orientation);
-	clk_disable_unprepare(imx_phy->clk);
 
 	return 0;
 }
@@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(imx_phy->alt_clk);
-	if (ret) {
-		clk_disable_unprepare(imx_phy->clk);
-		return ret;
-	}
-
 	/* Disable rx term override */
 	value = readl(imx_phy->base + PHY_CTRL6);
 	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
@@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
 	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
 	writel(value, imx_phy->base + PHY_CTRL6);
 
-	clk_disable_unprepare(imx_phy->alt_clk);
-	clk_disable_unprepare(imx_phy->clk);
 	regulator_disable(imx_phy->vbus);
 
 	return 0;
@@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct imx8mq_usb_phy *imx_phy;
 	const struct phy_ops *phy_ops;
+	int ret;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
 	if (!imx_phy)
@@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imx_phy);
 
-	imx_phy->clk = devm_clk_get(dev, "phy");
+	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
 	if (IS_ERR(imx_phy->clk)) {
 		dev_err(dev, "failed to get imx8mq usb phy clock\n");
 		return PTR_ERR(imx_phy->clk);
 	}
 
-	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
+	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");
 	if (IS_ERR(imx_phy->alt_clk))
 		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
 				    "Failed to get alt clk\n");
@@ -708,6 +696,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+
 	phy_ops = of_device_get_match_data(dev);
 	if (!phy_ops)
 		return -EINVAL;
@@ -735,11 +727,43 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
+{
+	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(imx_phy->alt_clk);
+	clk_disable_unprepare(imx_phy->clk);
+
+	return 0;
+}
+
+static int imx8mq_usb_phy_runtime_resume(struct device *dev)
+{
+	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(imx_phy->clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(imx_phy->alt_clk);
+	if (ret) {
+		clk_disable_unprepare(imx_phy->clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx8mq_usb_phy_pm_ops, imx8mq_usb_phy_runtime_suspend,
+				 imx8mq_usb_phy_runtime_resume, NULL);
+
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
+		.pm = pm_ptr(&imx8mq_usb_phy_pm_ops),
 		.suppress_bind_attrs = true,
 	}
 };

-- 
2.34.1


