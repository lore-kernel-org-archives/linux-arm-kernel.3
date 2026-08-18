Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B19C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NjpDOU5NRpMdngLH+Ko355E7BOo+DYzAsLpVptIMEKM=; b=izCdkoF0f8IB7vgnhuhlLeFOV9
	wwe2GVFUe5yjHXvYq9H0uGMMmYGeNfuZ4kYNtku7hSDqEGFtQAmKmdQW+XSO07JMsPVK5e/5M+Thm
	VwkdAfmtKGqg651K+08kOja154wqWXhsdn+upa7JToc0mhbmT6ezlqK1ma/6ZaOxJcqmz5sumXJsV
	7D/9/ORrvPRArMC1HOeVZlZN5637PqqzAOffAeImxj4BcLxfi18C1iryTUOBwqv5JJNNQ+5YrRlDt
	7zf8xA8ActpkXVelOQ42hURLM9ELhu4HwNfwjQDGl7V9XMsU+8fX0nwlhED2Tyy/4RbNAxJ1GLgU/
	lM8oUwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA5r-000000077xG-3sfl;
	Tue, 18 Aug 2026 03:02:27 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA5p-000000077vl-1kS7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIaHTL1fEW109NYARUeCGJaTigFvLyp8lJlHu+NCaaRu/nGzFJ9V/QsZxrNpcFP8R65+ZuA3yfMOJS4ZBh425A6hsFcJoSq42qT5R0GatmnbD75/IImmQNsFgZEsTDmSHvSCVR5Hhg9F41sEMmP4IuMYJbxkhgBumb0Vct87d3Kh3pjJdS9OyXgNcPfDZzdeNII1xC2xkGCF8ysnq2UsldFbkTBqP86f4lrL6/j8Ds6cKzFomgPy/2EogiE23J78xE0+GHRRJN07+S/wglkoL/QoMlst/VP3nN/v7tHLiZ8R6q755kMvkGZU2KKx6dZR1hrZfR5ZwerjnZI3Bbfy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjpDOU5NRpMdngLH+Ko355E7BOo+DYzAsLpVptIMEKM=;
 b=l9xmP1EIXFrVaHKM7auiCuhrrabTxwog4iYI803FilLJeSLZ+sW1tF4wrRWz/kYqP+/O/Ve+EuYaLrv3iCmTst8UDKQ7iSBRi/3HSGMmv/VLIgg7ijZ8u8l2v1XOOcxVSaTVzCIZehSLbhg60uuE32vClUCjJlTFxGv8m+xP7lTDZ4xoQacI5tkUVJiVOPLxg9Is81wKISPC5ttfT0Sl0Z3fMS2t0QwpXTUnYSoQscCzI1YmwYRonmVrPgvOBMN0cyQYhBNz2wZR2KrvtfN7h8EKAux3KglkxQ4SBLDethZ8lBz2sz5aLCZ+OFTTp4ax75DZ5RnTPWBSmFzMVwebqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjpDOU5NRpMdngLH+Ko355E7BOo+DYzAsLpVptIMEKM=;
 b=Th7pq3rw4A79CfopA5hkgT7uLrfRysYqlwkTJW+aecOWaohqCU+UXRF9aX+TS2f7ugy6LZR1rcXX3zm1ro/LWedkSYjfhdtesiuEEIj9njawegOG9c+ewm/V2h8YyMJiM0xtWGRCUKYKUt2gaYewYplt3JSqmBiNplTuFh+kQOXvx4Dh5p6CX2UkV7U8GxJWKHx5G13P3yMJwaGAZKv1jE7x+NJ/gu7jZrIC2I0OkjYu6yvBc/vq3ffY2Qdi1YfOHefW6GiHK/ZcWjb+mhBDXSrS4mSfX5MYbRDArWjyI3LKA8F30k0p6slhjGH7a7Jv4L67Zl3/gc4UgdtJWhk+zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:02:18 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:02:18 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/17] arm64: dts: Add MQS1 sound card support for i.MX9 EVK platforms
Date: Tue, 18 Aug 2026 12:01:54 +0900
Message-ID: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0115.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: c4687699-6072-4f80-71ab-08defcd51cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 29czThuyHTnNZzDfXRfpgI20mWuL2PfrY1Ty/iZlBRVkvJa3YHiGsaHCXMIZnAqDgl7kyE6pnbvPD6PX3upme+tLlJP1HB30i8BBeEGyP3kb91NJBhaim4kQQxQuFKLFQ473TTPYDEMMTZEhXgGKudmt7coneITA6Mg1GWy6xQsBpUJg7ax1wnEKjuqq4th6N4yNEaKDX3hkbtuK2xP6uG1SgLHuaiKhqNyJCgyz85OYGiC8lE4JR4rVxUEqMW28oP25e5GQM6TsoZ9CCZ+lKuUkZgiwlNGvpVDuBQIz7FS4k7X5M7BUIi6ahrsoiZp4MnNSUlSvJtbg3BXttpnLq012NgM9zqvwHmqihcCa9sssrsQYGWsj8JDyXv2mzeoTddrQ9RyoO7fR7c9PnYio1hQdN45ws/t/dAmT6kVRB9JBsQw7tE5549mm0ucJga+N8qbCpoiufhN5oOrsGrIaygb6VqtiO7UzfFDvB1ryhMLhqyaMrL8VkcSGeU8QYl9V/CRek0rHVZaQ1zSWd5kYU0wRBHq6ATgi+RrNpXDIx5JsGv7K9167L1ybSqHAkn7bxfhIiIbMMH5xMdRru1rP6aDd2+pr8pytWXTa3+9irLpU+yNtVO/GZ7FSmRUME52MIrhAS4e55BePqLbqZBPoJi/hppZtWSB1qC12gZYsqGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cmU5dguoI7cmtFozturgfE2W6WMxtIVovUc6yVHQl9W1MmejbwpNsHPzLy1W?=
 =?us-ascii?Q?ogzNm4cEvDVIx6BEIUZCrjWDIJvcmQOV9UKZqRfp/wVf7FnvRcl1RmDtth9A?=
 =?us-ascii?Q?46vjyERQpZ3fpxov9evkeg9TtmrXiNILArWMQNdAVb9JYsc1k8HNSof0GPRp?=
 =?us-ascii?Q?bOeVKH+FT5E4XV99d85HwwV3NtrJ1zsJmdQTLVYLiGxxw9Vqv5yTWbw3xkd9?=
 =?us-ascii?Q?4mR1KIXPcc0rxMw3SZVFz/4gOsK6mHkJ8YObkPvN0Nob2KAUygKINUfLjwje?=
 =?us-ascii?Q?oM8vb4ITqKi/voHo4+Wk0dP3WWzNNft3FKwH36/kkyhkwz6XxPung2X/q9Cs?=
 =?us-ascii?Q?VRTSCiJKCcnprXpaW3aLOltKiwklXn1TOWQSIr6HPf2cJKE+mR3c/lP8ghzS?=
 =?us-ascii?Q?eYZFd+25ziISUj2k32MfwlkE3gxYYCabBo/y4MAc/tycImQwYZRF7D3wzFja?=
 =?us-ascii?Q?YnX9CaQeR5aCOqqyHosOawl/GXCgCj+UOItk8VOQKYgp3L+JTOsjUDgL5cXQ?=
 =?us-ascii?Q?fmNcZCzBQediHPl2Ciyt9fMtBA/R8HvVNui1FYdh0eTKPJhuKo51iW7AVtoO?=
 =?us-ascii?Q?BupJ4mfpPgZpkSK0DOyFPKqu6Eqy0cMUap0YDjRM94avwiYwmrRQpaoR5KO4?=
 =?us-ascii?Q?MKtjE7YYumuzYIFnlerHfXn4Easc6vf2d1n7Jxur8/wRnmG6BdG6ba2ubYNQ?=
 =?us-ascii?Q?oJkdgd/TWVKbkbZE6z90ePG6QlyPaWx0dgkV7MyILNexmzhR9CaCY6LgqCEd?=
 =?us-ascii?Q?hsHcvaq4sWFtf5N7vVGa1zPZH5cXM8uPb9/vifx2sYNlsGwztgzSv4wWbXRr?=
 =?us-ascii?Q?blre3F3M2Owum/GXPbGlCVyHH6AGqjP8tdcpeT3gOKa9Kd4vjp1LeMhPgKnt?=
 =?us-ascii?Q?8M2vZDTxnSp6ubLp8yRghGNaqQ6E7zRw0tDA40snKUh1CcraWMAAdcYuxQaJ?=
 =?us-ascii?Q?fXLWI6fcr0kQIOGIUt1JJh+GPw9ilSRtGaLey3OZ0yX5OGZeOAXcnAou82HC?=
 =?us-ascii?Q?Ujt5pnwyj3ItH+fbzXW3HSACNH8HqnZIOs9FkqdfB/NqBi8aNw2LYrQZ8/JM?=
 =?us-ascii?Q?Le6KuuJenHvnAmu/6i/vS7VCArjDpo6ueOATeDrXTDIQuR9nmPQwFeyoQpZg?=
 =?us-ascii?Q?LRZAf4W4UF/j4DRQRzPuJpd4NqRdMTeNrSYoh5zKR45WS6+bYYt9xSgz2XUt?=
 =?us-ascii?Q?wo1qyhbwRkslrjhHYikEYe5Ov9BaTrI1GL5ibOC+K2TX7Yk8RsMgZJF/Ocz2?=
 =?us-ascii?Q?9I689WcakzfwgeQvyVRIcjogyTIEN9TBM7EQirUDFmfzcuNgEB0DGJXXgLPi?=
 =?us-ascii?Q?bQF77kAAEJO++KjfZnRMzYtG1yUt46Me0ohWYdNNn1kYYPndWSW9AvIlrdVD?=
 =?us-ascii?Q?Y/3xGyQfswYFw6Kwlcb5v2o4M+qMNpmW0bxK1G4ginQWi8zKPAzOgXmtINur?=
 =?us-ascii?Q?0aXwsZERmhK6xDHAeyoK9u57JUff6hPJKFUD0T6ZYVu8aRpB0WN9fsMldPuq?=
 =?us-ascii?Q?nDMnyLnI0MbMB606JyLj+lKev/ckVDEBESBeIFFvL4sk3JL5fnunKXHS0TMo?=
 =?us-ascii?Q?1LXNMAb7aQ+JYksVCs6AsVppNXxVdFCZvZ16CQtxVCfSpIfuXiNlPk8c8cMm?=
 =?us-ascii?Q?TldJFvjHs93lYgCAbq5ukX40grmSVZESF5WuzCs2tL6Fr3+wVNvPsc3B5hZo?=
 =?us-ascii?Q?FnkNRoxIy/hqY+I2eokMFgIAwEpQWDrmq1LP4caQaVWhIK8LNFuQnvmFIED/?=
 =?us-ascii?Q?cL5pSGhMb01jT8ISKwjYK9hYpwYmQSAZJBiYN2QghHbESYtQtFWx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4687699-6072-4f80-71ab-08defcd51cf3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:02:18.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pckMd/q+B7zQ4XouWtTu6/uiAaXoMVOlyQwT2CEWeV3FZfa4cwf3ZRjrKMlMHrqpB1jidu5S0UI6YUV7rdFj9A0QQ/RWNR7gPSuIJLbGJ2FKHSmDFjOC1FRc8WVQAzd/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_200225_459240_0F9F6849 
X-CRM114-Status: GOOD (  11.73  )
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

From: Chancel Liu <chancel.liu@nxp.com>

MQS (Medium Quality Sound) is an internal audio DAC available on multiple
NXP i.MX9 SoCs. On EVK boards, the MQS output pins are typically shared
with other peripherals (CAN, PDM microphone, etc.), so enabling MQS
requires switching board-level pin muxes and disabling the conflicting
device.

This series adds MQS1 sound card support across the following platforms:
  - i.MX91 11x11 EVK
  - i.MX93 11x11 EVK
  - i.MX93 14x14 EVK
  - i.MX943 EVK
  - i.MX95 15x15 EVK
  - i.MX952 EVK

Changes in v2:
- Amend commit message to describe SAI1 clocks assignments
- Remove redundant clocks/clock-names for MQS on the frdm boards
- Add the missing <&can1_fun> mux state to FlexCAN on imx93-14x14-evk

v1: https://lore.kernel.org/imx/20260814072022.4064009-1-chancel.liu@oss.nxp.com/

Chancel Liu (17):
  arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties
    for MQS
  arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx91-11x11-evk: Add MQS1 pinmux, clocks and mark
    conflicting devices
  arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx93-11x11-evk: Add MQS1 pinmux, clocks and mark
    conflicting devices
  arm64: dts: imx93-14x14-evk: Add board muxes to select between
    FlexCAN1 and MQS1
  arm64: dts: imx93-14x14-evk: Add MQS1 pinmux, clocks and mark
    conflicting devices
  arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
  arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and
    MQS1/MIC
  arm64: dts: imx943-evk: Add MQS1 pinmux, clocks and mark conflicting
    devices
  arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1
  arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx95-15x15-evk: Add MQS1 pinmux, clocks and mark
    conflicting devices
  arm64: dts: imx952: Add AONMIX MQS device node
  arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
  arm64: dts: imx952-evk: Add MQS1 pinmux, clocks and mark conflicting
    devices
  arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9
    platforms

 arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso   | 54 ++++++++++++++
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 41 ++++++++++-
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts |  2 -
 .../boot/dts/freescale/imx91-11x11-frdm.dts   |  2 -
 .../boot/dts/freescale/imx91_93_common.dtsi   |  6 ++
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 41 ++++++++++-
 .../boot/dts/freescale/imx93-11x11-frdm.dts   |  2 -
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 52 +++++++++++++-
 arch/arm64/boot/dts/freescale/imx94.dtsi      |  3 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 70 +++++++++++++-----
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 42 ++++++++++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   |  2 -
 .../dts/freescale/imx95-19x19-frdm-pro.dts    |  2 -
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  3 +
 arch/arm64/boot/dts/freescale/imx952-evk.dts  | 71 ++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx952.dtsi     |  8 +++
 17 files changed, 359 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso

--
2.50.1


