Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675A1CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt+OeIiZC6xw0TYAX7LYrBBfk/8tBSxXm0WiKMs0Ytw=; b=rbjcvYSJEqLMjdCX2MLZt/lppP
	DsETUflwVREE2gGZ9zwA7Kfxu4nMX3aqQn7NLzHwy/78wOOf77/ug1pzys7VSBV40AuQHnZEqCxOf
	2FDZZXZ5yN+QgZaZAeL8W6D0ioASFSKISyh+/Uk54eFblAtwg3kmzcbmaInEaLuW3UQHf60IQnzi2
	wQWhk5+1jNbfaD4B7OamO5ZEso7HA5UhaIUgt0iclLrmhvzoMdIs32qmKH77ImtfPYMhonyGv8LcQ
	fE73xhDggmMv++wzcTRbmc8SPkNwaMtqaU7yqKtHTiQakkmP++V55DBhDwXmu2izRTz0/K0XgoZRi
	z0s2O2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeFW-0000000EHsp-0ZPd;
	Wed, 03 Jun 2026 05:34:42 +0000
Received: from mail-francecentralazon11013030.outbound.protection.outlook.com ([40.107.162.30] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeFT-0000000EHor-41zZ;
	Wed, 03 Jun 2026 05:34:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShQqyX+2O4XS3VzD3tROmo6y8zf1aDDnSn4QttT37X22219aKuYdiXvqje+Ou4I4C56FNp89ZQ4bFgiDxsmNF5anO8Ou90K6Vt5MzwO3enhTjjv6rSUGOSU98xD6J6Aqqbm74b10LnGF2OHetIq4kHvu1MTX62cndyuKMSDqCI1V318s3WIzpPHRytuAMT6bRI8yd3YPWAllNUvt/Ftc7LgYGRUjf0JSjkgAQ0vMjk1qW66z67yoyvRUkm6uw4qXsBeKS3JzNWs84GNqqgJ2QsAP4F0v9UDgPhUgRTOdnHgUy+JcNCjYTeiMPRBEc363+kQpJLo3JNbMbvJ8rsAQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nt+OeIiZC6xw0TYAX7LYrBBfk/8tBSxXm0WiKMs0Ytw=;
 b=dAcwtjaQzHj93cnPUHyRUTDupFxLBECsB94ZZTQBLfu5pgF5m9ZTAiee8mIGSG6XW9o4QqJZ7pIdLM3ByfGAzKwXxwMbtv99nI8JLIw86guPVVLU3DpQBbx1nigF4dNJ8uW8Dpp2eWMETJZOzSLXUgb+yRDexLpEZLGFBHlp0h9CXNWPLhlUXWWMTuDNKctcdfReLZCiNDB1jdwvZ9hOXnkRBGgYzcLSBhkp3jWduSXygnr5dw1Fa+J8A1liJ2/hct3ZiJJBxhQumzuq4JQKzcz1tGXVzE1wm/wJbmtyV+kqpxsYgThpRwSL2TAPWXRN0K+NRPdZwGDQCFLgu7anJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt+OeIiZC6xw0TYAX7LYrBBfk/8tBSxXm0WiKMs0Ytw=;
 b=MwQjPcNdjQ8PuTvEkSgHLwmjMhxdg2DsRkdZZ47EmjWZIqZb7Olv4hFRYSzYGGJtXpilVxx+B3LnxQTyRpfOEUhRfB1hgSzqvbtqhILZcsEXb0ZiwbVBaLhJ8cbFeeWQsNF1l0LNbzaeX6sN6/c+4q5PFXMvwePgKwC/H5wACgfpLguftnsZlHtkD88Wyla4/aad+dKkQX5cJLoP18jhb0t/ibLMnrwZkud9Y1ddU8ZJQx8Os4CxeGHlmII6vvRaqvkAIhy/ZyFoa+nRFR2P7qjBgo1MbA1k2Ul5il6JW7K562udJzNdiffnFwQ198CJlaXkv4fpqaaqVyXNr3V3dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:34:34 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 05:34:34 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 03 Jun 2026 13:37:17 +0800
Subject: [PATCH v3 4/5] phy: fsl-imx8mq-usb: add control register regmap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-imx8mp-usb-phy-improvement-v3-4-7afb8f89abc6@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780465041; l=3073;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=i3uz3mgzoRinmbGZIGPs0vdmGXlsJkbN2arPhg0BuEA=;
 b=eeG2K4NqN5umAAVkD8jFWd0nsmnk0NQgm8AJqc6CEHxcd30YPMwyFm+TsGQlZa8xsbmcO0EI6
 SVhGpMTTE/GBqGW8lVKilhDjl51NguM3Dk3jwyVjenaTDatVZFdBCg+
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c8ce0c-daa3-4582-f630-08dec131cb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: a+SS6K9prcs4npSoRVwSyp2n4ZkxNiiiSVJ3l3SCrcTsTWE+/niXRAYwU9TqM/pllGdh4kHfSBunSUYWeL9LrknT5cEirygM50tbdC3QiXpfk3MjRk5d5tPicUmSlHBWpZxthYt7jsexRLYM5TjXMxM0wVxB4qCy9ACsaezy3rbepcewAfsIUxIARcuGYJ9qQtU34atM/BQDJ8GRNFRE9a5v9K2rlokCLpxcxchflJkyQXGRJeEndMHnDTcumuNUpoMIsXRVPSGbACwOmis1AaAvyguJGJkJNVq+wU7X7DOECPpM/okyWAbNvhCij7c2TMC4YCkQNSLmyUufV5xzj7rv0tW7cTuSVAJIcFCeYAqW9TIfkxmQy4+ASOj/c7cvYDOfUkxFMDHRXf5hdgBBWKwZ8/D22Gzh9ttO/yjJmgkd0V5/9PnIITedQTqSyAzfWuS+e08uquRsA0hyDzu1ILNeKgWT0Yj7LcocpLtAOkWauHZEQppO2bfc0/HvEdEBGZ2FrIROkrM88lzmSV2KteyfVJgzqY50f7/QgQyDBVs5BNOw/ff0dh8J+q4G/dgtpMHesuPTxt2XkeWXL+qETkwNPc5kR0HLcWUgDYSicWKPRdSuEegsFtw6Sz0LGxhkzo3M4KnlDxCFsxbEw4hs69RmuYv9nAM9ar/pIoVt6OLN8HqfdZdyaOtJ2BE9bhql
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3JDcHZlaW50WWJ6WFlaWTBZVVM5QjJEZlo1WFBsZTBZVGtnT2djMmZxNzFk?=
 =?utf-8?B?ZS9XUEV3Q3VEbDhBN0ExN1lyWC9QNTdWMG5DalY3VHBkK090UHZqL01WN0wr?=
 =?utf-8?B?OTRwL0gzWkpTd3NkSnIwaDdoYTh2RXVhc21QNy9rb0MxMiswRVJ1NWl0cEJB?=
 =?utf-8?B?Nm1ZdklJTlRVVTBkeTlXczJtVm8xU1hPSWRDUk0vRERRSzcySVZLQ2Z3K1BV?=
 =?utf-8?B?Y1NRSzd4Qy92QUp3SWRyTjUrNUw5b01ZTFY4WnJwdmdnYUFnQnBiUDROSXcx?=
 =?utf-8?B?bU1HUi9FTGdXS1NiUGprNUhidVlycnlJbVo1YXVDSklMZ1BWZEd3ZmZzbEtH?=
 =?utf-8?B?Ujl0UWlMazVxNlVuR1Z2anliTEl5eXN0V0pBNFI4bWFDa291bkh2U3YvTzNl?=
 =?utf-8?B?Tys1aFE3MHlhTzYvVE9naENKQ1hkTXBkV0tGNEpxUXFBUFUxcVZncitCZkVm?=
 =?utf-8?B?dkk1RVJ2Rk5yY3BpdlpvTXp0UDJwbytVbExaNDBBUEhPSnN1Wmw3NDl5TzMx?=
 =?utf-8?B?SXJSSEZLM0l5S2JTa2lwVHdGandnRFlVS1FXcndEdUVXN2gwdlN1UktubVNl?=
 =?utf-8?B?THlWRGpEQ2Z0cFlIUUJDWmZNN3VsSndTOUY2Z2ViNUFscUNZbGtrWVBaWWdM?=
 =?utf-8?B?NHZoblkzMitqejdtSXFza1BERUlvcmYxQnNzUWF6ZUNLYVB4ZEJXb3FQQThs?=
 =?utf-8?B?TWdZdEVRblhoRzRiWVdJNmowenhwUDAvVWEyMzNzTUNiK0I1RjhBTE1PMS9F?=
 =?utf-8?B?VmRrbSsrQWw3dlRvQW1Ba0p2R0JjSzZPeDlDcG9OMWJIcFVEMlJvZVdJelRa?=
 =?utf-8?B?Q3MvYTJYYkFFRTNZRjZYd0dlUUNkL0l5WjBxeWhhVkEzaU4yZEhha3hDVkRh?=
 =?utf-8?B?a21RNVhHNEdOVWE0cDRRNHJIZEpQWHhSOGE3Nm1nSGlhQ1pCclJlam5Rcjcx?=
 =?utf-8?B?Y21yK1p1eXcrOG81eHIzMDBDRDFRZ0ZCZjU1NTNFWVB1aXR2ZUh4S2RPZ2tB?=
 =?utf-8?B?UUJhQkkzckk1N2o3aUNkMHI4STlkSFNBK3huZzB6N1JVYUVPR09pNEJYNFdT?=
 =?utf-8?B?ZENNdkJEMzBBK3J6c3dkdHFTTW5xdHB1VFhodGxpeFZoc2tUR244TUcxWTBr?=
 =?utf-8?B?MjFPdUlqanRyVUUwdWR2WUtreXdPcVpTMENueTFvTDZiUHlPTTRYU0pDN0xT?=
 =?utf-8?B?SHNSejlsdXAyV0V6Y3ZEcDdFNEU0OWJ0ZWs3a1FrcTY0WjFzUUx1R3k1eDFI?=
 =?utf-8?B?WXR3RmhkT3FWVzNTS0czZ3Y3UStGaUMwMGRIYVRodEVhbTl1QTU3U2xkbGJy?=
 =?utf-8?B?a2ZUbkdxZWxEdy9YTFFWWjBLK3F2OW1Gamdaay9POU1uQkZ3T0x2MjVNWFhL?=
 =?utf-8?B?NEpvVlZuNlVxN3Z3MlJITEtDMUthS2EwQjB2UnlkWkwrUGRJUjJVcWxSMXlu?=
 =?utf-8?B?LzhWakNaMzBGM3RiSWgvMU9LY0k5L1l2SGpiL0lpbXIyaExtUUZqM0J2WFJW?=
 =?utf-8?B?ZUlmVytBN3lybmg5U1k4NndId2ZObFRxemJ3a24rZk5jUnlGcENlc0tOOWly?=
 =?utf-8?B?R1VEdCt3UVlHL2RZZ0tWQlZRaFJ0T0t2UVBZb1FPOWRpMTNSMlkwR05FWHJl?=
 =?utf-8?B?S09VcTVCVE5pUjRqMVhqdkZXYlpIL3ROWEw4TldMUE9vREhMU2d3WC8ybmlk?=
 =?utf-8?B?ZlQycVBIRG1nQXVwczlOeW5sSnNhdEhkWmhoeEFhbHdpSVdlMGMwWFYxaVNj?=
 =?utf-8?B?aTl0eG1KSWNpWU44YUVoZlhsaUVRVE1iaGtmckRTNU9sSTJza2hYZk52Unll?=
 =?utf-8?B?bmFNR09MUGVPei9la3oyUDNHaWJ0dW1qSVpsVDIyd0hjNit3VVk3YnR0YzBL?=
 =?utf-8?B?MVFFWmtNUFNjMGRiRkx5YlpwTFFtcllpeTlWWmFEanRObWt6RWpmYnpwYVZu?=
 =?utf-8?B?UDE5Y2k3NWQwYVlGYllmdUlCZTFkT1RqOUhQMVNUWU9TdGlHMDhBaHFHWmNX?=
 =?utf-8?B?TUdkckNhSVJqUmU5VUJRTnZTeFlvMml6a1hBalpsZHdla2l0VUVCMi9JVy8r?=
 =?utf-8?B?emx4Y1NGUUdXNlhrVFFiem1za1hlM1RYVndMd1lEc0wrVUVaWWNaSjdadGx2?=
 =?utf-8?B?K0hpN2lqelMzVjlENmlkQUpWck4vSUQ2MzRieVhBYjVDcEluMFFIQUhDSDdo?=
 =?utf-8?B?NXNaZnlBek9aTmQ2Q0RDNnpQQldkWTJESEFWMWdTMmZ0VEZ1Ni96MkRJTDhE?=
 =?utf-8?B?WndDNFkwRlNTOXZxZTNhTWNkakdmZVQxNTNXU2d2MzQ3Yk1EZnhGM0VEemtJ?=
 =?utf-8?B?VGJleEsraFdSRnFHNFVxMmQ2UFVkdWRmTUg5V1hNUzltemlWUE1aUXVUYlZZ?=
 =?utf-8?Q?vZ7Q6Vm8xH+IjeRba2kuJgqG6KxQpdBpEnqaR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c8ce0c-daa3-4582-f630-08dec131cb93
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:34:34.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgF3glrB8JScURjN4dM0aXb5KDVSDq9q6FF3zwGFbuZPlrQ7w1USRvT+vNpTO3SkNcLcUUSZ2E+TdidmoOyjFLGVlcKCrJ5yByjpk6wdIpf3KW8L86zagu3jRFYeAk9l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_223440_014860_DD4494E9 
X-CRM114-Status: GOOD (  17.78  )
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

The CR port is a simple 16-bit data/address parallel port that is
provided for on-chip access to the control registers inside the
USB 3.0 femtoPHY. Add control register regmap and export these
registers by debugfs to help PHY's diagnostic.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - drop Frank's tag because it includes other changes
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b0092c34416e..cda88ea1f12d 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright 2017-2026 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regmap.h>
 #include <linux/usb/typec_mux.h>
 
 #define PHY_CTRL0			0x0
@@ -56,6 +57,8 @@
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
+#define PHY_CRCTL			0x30
+
 #define PHY_TUNE_DEFAULT		0xffffffff
 
 #define TCA_CLK_RST			0x00
@@ -119,6 +122,7 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct regmap *cr_regmap;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -665,6 +669,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
 
+static const struct regmap_config imx_cr_regmap_config = {
+	.name = "cr",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x7,
+};
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -694,6 +706,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
+						   &imx_cr_regmap_config);
+	if (IS_ERR(imx_phy->cr_regmap)) {
+		dev_warn(dev, "Fail to init debug register regmap\n");
+		imx_phy->cr_regmap = NULL;
+	}
+
 	ret = devm_pm_runtime_set_active_enabled(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
@@ -729,6 +748,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
 {
 	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, true);
+
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
 
@@ -750,6 +772,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, false);
+
 	return 0;
 }
 

-- 
2.34.1


