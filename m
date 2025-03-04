Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43A7C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gX7AczAfIzTX7yKhUf2VYzUG1/yScjw3yjQ03i1agqY=; b=Hlu8tHFHElv3vjE8BRfUW4cp1E
	2wbAjgrZ45iSkG/zoEirS4c5gs6FH1WT3PdDtlWnqWAhbKnhKD7Ze+AzGh0MFOG7Z7TTpnyj4BL2Y
	3G3L4uzcnz0WQk0pnaulbMvK67VaP24jb0eaTTDpOiDcZyxiwAksoBn/e/sqHNCDhlOBCRhkGl/w2
	IskkOJXcHB8dCIS4kmuJ/WJgjbPv1w1mIvlEE3D0SkbuM+unpkY2LefB0/YGv4BVDWPR/Ukulns3Q
	kRxLMg/hPGkJEzCw4OuKq6fcXfgGT7KkZEVvlFo6dWr0uk2YTTEIi5jJw9B42LU/UoEmmwR4Lfxnm
	B+TajGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOdW-00000003u9a-4Bgp;
	Tue, 04 Mar 2025 09:32:27 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpObb-00000003tdF-1pAT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:30:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJHRuYJ8AeJ3fE5bDOdgkUrVlxkfwr75UpPE5rfPm5B9P6MT3f64VN0kOfNfm1d2ndDru3hhXyGaWsvkJss33QovNzFbaVFaQXvALcFfPVYCu8nC+8B3S1YiLCXL9HY1vEYMh+e79DyyMiAX35Ih5Yl0W7o0DRpt6v+uf0j+jHu1PYFdAElIyf0u8L8rdyYFryLO8r77WOJeEV4Fmmx3BpSfl0w9lQ5XHMIKAEMgXRXL07oWaVABl+CKrvG8M58AuID62ek1zkZyU7Dw2A4kVqmtFbFdOKjnj9ETDdpWhOg/ExSK+juHIFFzYwt3RtNmFl7Xrf103hS7SckTCDQoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX7AczAfIzTX7yKhUf2VYzUG1/yScjw3yjQ03i1agqY=;
 b=IKN722sOFk4gt+GaYU+s6lU4+rzOxbGNNVGV3r+2N40f62bFoaY330Bey41IG6DgtXqyFrdi2MrTLgHE2bEof54Ez6Ryz7Forlf4y/IW7SvOhIa9zQwQrC4KN8gBg3UfH9hHnSrCm9ff7d9pAOqxPNBSoLCCQJ71bkOdIgYQgDv1Qyl5xvpodipZ+CHH5o9eeaSKA3lDatZXP41V6paOwxBaaGSOlwHZJ0rZ5ZDld/i8Ez5SrGCrrEVKGwf4eRuBGzzBe2lfM2/yvdjddv++fZ/uPr6WpmQODL1/APTUAOZ5MuJGizXYO0qZ8K6TQr5M8NEsIfKKOMdehNRQd+Pa0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX7AczAfIzTX7yKhUf2VYzUG1/yScjw3yjQ03i1agqY=;
 b=GCUm9xiMFdQjCC3ldY9AdGCXTwuJ4aqIIMG+kIU/SagrgLWXQfOC2cyiDFCA7MjDEFPiZEfZW1kFsgW6LUFT0Js+iDERzoXFE0jqb60HxoEgsmKayl6BhgkIoz1rPqhmKCGhD0FnzLVa5R4vyineWhIjnFDgrmavuNpB436FoSNT+9Hs4rDTvqMDoduask5wPCNjeLHbinOrbaofoW/f6uLfL0AwwB9j5+Tbl00DJ5r2eLKQTd0sfis0NGOeXcZTZC9kL1LkHJsJFwAkVUK29X11lOMJzCVzaYnWZPGD6ICqDS5UKFOyQojgbcv5Z9UmsoXj7hvr4nRM9kv9HLEPRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB10381.eurprd04.prod.outlook.com (2603:10a6:150:1e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 09:30:19 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 09:30:19 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v2 0/4] Add i.MX943 basic dts support
Date: Tue,  4 Mar 2025 17:31:23 +0800
Message-Id: <20250304093127.1954549-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GVXPR04MB10381:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e876a9-7136-43b3-cc09-08dd5aff2deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Or1tE3UD4IwlUZyWwrk3GARHox+OmzUpaNfbmq1mOJ7Dva+zQZltV4rE3xYM?=
 =?us-ascii?Q?RP0LzFiVQRwnLM4x9KmOp3DDMZjWkEaunnhbTP+BiPurnCzKzlUaIpDMTJl0?=
 =?us-ascii?Q?+UGcdPC1Sk0SlUXnA0Hl6eHQqM6Fvq84JhnrjcL6oNA1/gJopoeL9+ZJe+N0?=
 =?us-ascii?Q?7XUcPWa8XhYXb+xSeece2PMB5VHUrAK9+ihdf+qVuGelJ0sYWzmL6UB9S2ZL?=
 =?us-ascii?Q?yQtEaStmviAzD6QclUOC+TnKuLtoYk2AFzw/WNLqlmJYUs/GqRbJSZpT6lTN?=
 =?us-ascii?Q?0P0ZnFuknAVLRf5jLewt6q1Xgu/V4FDkqtjiihE5HAHZUiANOYQyw/WW/Klx?=
 =?us-ascii?Q?7bpA2z6MEbba7L3nfO8j9tNtkFRZN6dioXNT9MjmXBnfu5YKM8kPwn3gIA7O?=
 =?us-ascii?Q?YDK7lA9qEvQxfLEhTqzN5/oBWvntZA/LklGyydiABK6gzrvGai7+fSicPrE6?=
 =?us-ascii?Q?YFCLGquKZD+N0M7AhKaoEf9+8vH2N6JZR/OtQw7ho11lfA/Q2azZu6zeVKMq?=
 =?us-ascii?Q?HExtfKeCb6rvhXtFLhacwBpRCNbEW3RF5mMelNwfIOu5DDC5f+M2lNfftupY?=
 =?us-ascii?Q?/AETcptXozzmJ3gNaXrkt0R/QZnlMVmZk8fItqKK4lej/+0LrU8qUnBwNDNw?=
 =?us-ascii?Q?7xWPZ8TyySYo6sxqGQCrZLJIzG1xq51/B/swHD3rX2wzb599fOxrkJzkCm0k?=
 =?us-ascii?Q?GNwi2JhHTn5fDfAmXqoL0fXSiBY5qXZiyQUgSWF5v7vR8gskFcfOhBw9jdjS?=
 =?us-ascii?Q?jska/1KBU90P1fghnkIAnFgneFUbtvhomWU1KkUG9THvNevtPVtjAkdkFq2r?=
 =?us-ascii?Q?RQVRQdVH5SDzaf4qjK6iAGDqj+E3xghCwYEFpK6KdpEGQ3LLabSK3KMCaSy0?=
 =?us-ascii?Q?yNHJE/VtGdF61JwUdfqwEQ+xiNCPEhcJDbxtRV7bHbjccigsbyPYDeA5fMHk?=
 =?us-ascii?Q?KDo6dMYv35dSZWI3vZNwOH8jDoCk835/miP/GktsC6ma01Mhu5Y0fwRaSFFY?=
 =?us-ascii?Q?gqZOUIbtZqLs50Ns1Y6BW7a1Q6zaROxNbQa4FxLmBOc2Z8Tb78EH5CFHm/0H?=
 =?us-ascii?Q?QcxHGsIDL8o2Qh4rR4AjOYl3md9iDH/ndzMFIUDJ0N5QmdFj56j5ZTogu6CS?=
 =?us-ascii?Q?dpZF8MpkuOWpMWWundc/Crd31uFAbs8gbaMJlnFEVF1tS3Tla9lXz7JMo2+G?=
 =?us-ascii?Q?tSyQSl5Xxn8f+uf1fYJyb7MqtY5WXnhooCfkvGfeI/bIACGtZDg66k2ZNq2I?=
 =?us-ascii?Q?bUwVaqSaMa7ikNu+W6t1QHNwFl4vAeMLBIFTw1s5CVUoo4qPt/jRwpnJBDXp?=
 =?us-ascii?Q?HUGDVlHGWG8Zq2BlT6d1ECOmwX/Y5JRYGx0zhuJQJum5Zeskt0MR19aEdeQG?=
 =?us-ascii?Q?8r9QVoMiEZhfw+RghGlpU5sxdroX0sUV4euskeP/yka6jHamey8QMOYzMBCY?=
 =?us-ascii?Q?1ZSzI2n+h8Bapr1LPaoSsEUKVAafzxE7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zqSsQSyZsCNt7+gHqDrCp5pOBZtTBN+BwB1c51kS4HQXWEPzFawzB2oCzRKQ?=
 =?us-ascii?Q?gt3W6YYmOW26TudHin+IR5h6nJyOa7JkJ3DQUzvx1Ddu5B7UULZMKBJrhr7g?=
 =?us-ascii?Q?g796yRuu9d0MzUZCZqk4updGUT8taWUsR1dyt97h/ZJSIfkMGuhG/6lBMBr2?=
 =?us-ascii?Q?qd6lkBLhb7Fy8q+R0aVYs1KcM79Gk5EgSApYkU3CY6qFM/aIiidZuwUkmU44?=
 =?us-ascii?Q?KyUv1JP8FnNComUgZ20Cf5H8meqFcBCq26GVrzu62SGB7FFQ6CHajwBOY7q6?=
 =?us-ascii?Q?EMeL0i43RxGz05+wXelBMBq4Z9eB9A71EHi4qnvFK7ta6z7C4ybwEd28Tm/q?=
 =?us-ascii?Q?Py0FXXj+oMfun9XCA73u0Hy+4bYWrEKwKfws9bqTWACvhpgrQgcCLeJZ4PUe?=
 =?us-ascii?Q?FiuHIZh/9u+kcMR/UJe4W612/0Kog32jG2Ruo/9TqU+tTFO3biVYKzolXlkC?=
 =?us-ascii?Q?qxe7jmuZFHeeeGOyr9xMeXhbx5hNg/lqyV576RdK+zuS0s8upQIeuZ0SGCMg?=
 =?us-ascii?Q?hH5+XP287qLbXHLQTACnjY3dod+KfixN2QtPbZNJ5lK1sH4HYABKURtxMd8I?=
 =?us-ascii?Q?RtwtQlDbV0u9hVv0IcIjQ2bzo420LqyVfTYljUzcJfiFmeMnbeigjE4jPbe9?=
 =?us-ascii?Q?htwbe0uoUQVtO5lc5D10isUuZYiey7TCljZM9Is3EbcCUtgIpNQGjF8NGMJD?=
 =?us-ascii?Q?0DhjJH/4H2qtFZpSQqWJHSrImuREwa6uAXHVLqj+zHBaLm0VAQ2UE0G0s12l?=
 =?us-ascii?Q?AcTywfguwq8meI0aP/pMLF2FUZdfwSeBL+EowG+PnrxAi+2kT5yZbslm9jUv?=
 =?us-ascii?Q?0qD6hxdOQL3F355UpWpP0iL6FwPkKh2j2zNLzRjiqk4/L2VFUwTV0FT2Zbwl?=
 =?us-ascii?Q?HmVtwJlTSKuW4qEY+SiCYE/onx1K7L7nI9qqvTinnw4B7ua++ZCueLXx6dR3?=
 =?us-ascii?Q?hd3fxgMVdXUrzukF/fRBXwrvvWar1O+YzTWCiKqA4CM2LlV73Q43VJOjCv44?=
 =?us-ascii?Q?1cIeJ83AZNHk2F9Sk8wnp7ma4FL2kYoNg8c8EcDgkamdVi84MQmuNIJ8qrqH?=
 =?us-ascii?Q?7jYMKYdPhBpeaHYSRTVwwnuZGPJHck96iuqwV0+XlxtCdhcgwF1gUuw37x+A?=
 =?us-ascii?Q?Co83IY10f5tGuSHid5wL0vm8fWTj1hrjK3v6zEQs7zWn3EHNN68uJs2UZTDy?=
 =?us-ascii?Q?BE/kKKECf2hJVFx0izVidpvSgnR8xGS4t181SnyJzQYLejLRUSxeg9ZWAfSs?=
 =?us-ascii?Q?WlOinsnG1lRHRaoT0x1ivuRdsvftl/EvwmrnnC0a/rqN98rMMHZEA8kd7tfv?=
 =?us-ascii?Q?Y2ntEZZJiMSFvok09UU5lCYyc75iOL3sLXanP4tJNiW0QbwlgvdGUJraIhTA?=
 =?us-ascii?Q?QaSZfbqRTPxScamqQ/Lb8IP+zQXexLyA0NFfTQg0RqNuYRkBRviRJEU9zchz?=
 =?us-ascii?Q?y0zQIRefqdo651K5iVNAywdEJ6RnX0UoRfnIwJAviJEDZLAVPInLo/8SmTDF?=
 =?us-ascii?Q?M/9CzK26yKMP//zxEydofe0wK9CGFUCnuAb/7loEEWU5krhvhiavxUHDCUsC?=
 =?us-ascii?Q?tYZ6BvBZQut/2DKIkaXScMKnocAR6i2NSkxUjc8G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e876a9-7136-43b3-cc09-08dd5aff2deb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 09:30:19.3299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmEmev3oWEt+TkYOhdYd/62ySAbJOPqqTpfCpG2+SXODBiIfIgd3FhnYPdqLGcs6Rpl9Cv5aZAFQngsnR2KFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013027_953949_A74F5DC2 
X-CRM114-Status: GOOD (  11.46  )
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

i.MX943 is the first SoC of the i.MX94 family, all the SoCs
of this family are pin to pin compatible with only several
peripherals differance.

For i.MX943 device tree support, we split the dtsi into two
part, one for the common dtsi that shared for the i.MX94 family,
and an i.MX943 specific part.

Jacky Bai (4):
  dt-bindings: dma: fsl-edma: add interrupts-extended property
  dt-bindings: arm: fsl: add i.MX943 EVK board
  arm64: dts: freescale: Add basic dtsi for imx943
  arm64: dts: freescale: Add minimal dts support for imx943 evk

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 .../devicetree/bindings/dma/fsl,edma.yaml     |   11 +-
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 +++
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1542 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
 arch/arm64/boot/dts/freescale/imx94.dtsi      | 1141 ++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts  |  196 +++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
 9 files changed, 3280 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi

-- 
2.34.1


