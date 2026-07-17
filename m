Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B67C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqwfrpXoq//4pYiJGsa6tOg+HSdEYu7nHgDM36vpWIc=; b=phCu+qyGqDskYVbvuerphQOSzA
	o8ABVydmqfr3bl0TW2cRW/m0V+JiZ3dSxSRAO8Mg/JvVj4cNFimyuHKU7SXANQhQ7nWowtkEGzOGJ
	ou6oWG2fhVLX4W28WR+iw97nJG6t94sc6tMMyxWo+IEzumu8FvtxuDHP7JcqJUH67T08P5PlbYLru
	eN713G1LGyvHRL+b9EhJJSXRySEyBRvMG16FQ1DNgZ50ZSiLqIZomNsrtFcY4mDLFXXdDPWB4DEUJ
	JrqtkrChfRoA6+KlWpFCrH30uXMyJsw7OiFMw5bVqKlEHkjJmTT+ldN8VaYJBrjDPH1rWoDv2a3ma
	sH7o6Euw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkknb-00000002eZH-3GYO;
	Fri, 17 Jul 2026 15:48:27 +0000
Received: from mail-northeuropeazon11010053.outbound.protection.outlook.com ([52.101.84.53] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkknY-00000002eXg-3DMu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2IANsgKw9Xi4sEq8JEie0wUHeWtAfkqA+sFkTCy4AhbpMk/VVha+Goc/EelloMH4HNDe/2s0oDi2D6rWp3xR65Cb8ShvzQmEW7ry0sCfyT2fdFoCswFwkB6qj+lEh2e/jfc4rpSjQD3EoAKhOrpcJm5trXMz8SFaggTM70PkVsokzTc2TPah6BcCOUYkOaT5J2qRF8IRyeM8zwgWM54kpH55ACctKtCbNz8Uy7dvIzs1DFjzdqp2Yqz12Ngm+9uByQCgdjj/8S9Sd+oNfVHx3mxVl7rZoiVeaJOfaZJ3VAnyLr6313TxmnppJkqt0jZiWnIMGTmS+9GWniU/asCBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqwfrpXoq//4pYiJGsa6tOg+HSdEYu7nHgDM36vpWIc=;
 b=O1FzurJVFrrl4kjs7ipTZ7iX2nIltzOahKk15cf6Egmyz9WsA1qx60tyIaGi4XliN2cxFzNxE8KKJafc53pZ/23PSbxSbHnOh31AbAA/RMlsW0oxx4qxMyxya6RqznWVjkbNZyE8pkZhmyG/i0sUjT3QBLf6MTKqMrM4TSYz/cgfM7pxvUs3njQbLvK644WArA79HgGBjB1WQr/4h/Py8x/XQpExIGFEBeNbqekodH4YWCg9xNRJEVsCqgQCUroFn9ZD7/tOOXFZW533XTm1L+/BFP+mWrCQ22ArOvGGh8tha0o1y09ZoMfB51J4G/CUpfcV9WiRWniYTw/Opm3d1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqwfrpXoq//4pYiJGsa6tOg+HSdEYu7nHgDM36vpWIc=;
 b=eWbIdTH4D6tYVSd7bW7jCRllMhG+fdZL8R8QcVTJK69cwLC2BU8aA95RLVKp6EF/NBmMUzIRsDoMuolhe/xhqWGrcr67mSQSwBZUwBumYM6y9V0f2bwBzuBXyCJKgTtD4cEvcitoUdJUcI/yGigrVzvhJJug7LgO0kCYMRSL6A7QoPAB32osH3oW/3OGa02kmo+tY8KZQYGsc8FzMzDDXzu24jcINoY/biEHEQ+RMpoeqiViVWPEchPc6AfUBzNBHZ1OQlHUcSr+ND2P36lqaOUYCEePxvlalGCZ3Z+VgjVQNKhqEkIvqyJa/OtBaGomD8CfwuPabNkXrCDhs8mcSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10192.eurprd04.prod.outlook.com (2603:10a6:800:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 15:48:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 15:48:18 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	vladimir.oltean@nxp.com
Subject: Re: [PATCH 0/2] ARM: dts: ls: cleanup fpga related CHECK_DTBS warning
Date: Fri, 17 Jul 2026 11:48:09 -0400
Message-ID: <178430328496.596348.6957903689956325995.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
References: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0119.namprd11.prod.outlook.com
 (2603:10b6:806:d1::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10192:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e41d49-2bdd-4b86-6525-08dee41ad265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ORNHcICOuqz4A/nYkHifx2WhJuf/kbl6POzzAhh81L3C9ITCbiPMQZ3FJxm47Foddl+rHBcBfzC5q3lIm2SWLKpcUsjAsSO6ueF4K2mwYUsPfd+w2ifoae41r60iYn5wrMO4MiYJukUxHgb0RWJUefHvh2RGgtgwD2W0UO6wLi3UwinbagiZGSFBf8mMvJIOpZQy8nzhAv1WqVr3fZi8Og5b2V2oO+IBZRUFm7XWDVIbVqPjsi3zMqZERM9cmAZHvZDCOCtGIEZGOMv4Ax97bmhqxGV1blDQAMmttTuTOXzSgjFcuvkVDGGfrsBmKuDHiV9zDj1u49GB64hHZOP43I5AFW5gsWZPCJ17D7jE1U6pmkq/A0n9XWZ2vNH4i4OJCF0ZVIsPJKzrRtHzVd4CZMty/ZETuW5Sdcm3K4aM/YCWjmyIQPJXTkjw8CzCb1k86VwHJtFtO2+hCWJQiY4P/A/bMoA/w9c072Grv0HtWi57kIgNCfgPL/f+aKo+m62pWZwBR8aCxnAtsQejClbpeOtJcnUT37aHFuJlIk7MBGO4pTThtclvaCklpySL6n+bA/OUfbdhCFvL2TktdDtF4KreMU/+216sgxmp28vb271otGMn6sairalx+Nq2suJlJrU0xCmWEKLn+7WqV/oTadKPyYdtVNOpHyoFwL8r1ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3JLTngrK3VxRjh4UzZocGdsU21XN3Z4eERhYjIzdkt6Lys2OVk0cTI2dzlB?=
 =?utf-8?B?QllzWHB4bDYwaUpra2NXTm9wMllYRkRad3NHanJZWnRrZW5ObXN1YWxRL3hS?=
 =?utf-8?B?UGpsY2dyWWlyb0lCaUkzMHRqRzZpT2xueVhnMEpsNFhkSGFkRVpMOElJOSsv?=
 =?utf-8?B?NkUzZkpZVDJYM0paSENwS2tSdkVFblhXWTdEdzNPa2YvYmp4SEp3bGxhR0ZF?=
 =?utf-8?B?RFp5QVMzU3p4dCtsMjllZnM5UFk4QzJsemZJR2g3RGNYemlxbjZSSDJ2MWc1?=
 =?utf-8?B?K0dqRUZDNHhJVEZiUUlSZU5Hbks2akNRZklGbnlvRHRQYS9NbTltbHhpdm9S?=
 =?utf-8?B?TnVOczgrWk02d0FZblJ1Z21icThPbFBJaFVIaHFSdWxVSjNxNUJZM2RQQmxi?=
 =?utf-8?B?R2FSWjBmSWVrSDFYWDFsa2lXWFBEQUE5V2xPekFPQUxuWVpJNDloVm9vbVFE?=
 =?utf-8?B?OVRhQ2Y0clM1ZTNaUUt2S1NuYW5ja0xjNXNPT0plQVFIczdIdlE0MjFvTHBN?=
 =?utf-8?B?YVd6QXZnbXFhVWQva0J3ZlQzTlNLdmdVbG1XVm95Q0NLM3JvSFJlbzFoRC93?=
 =?utf-8?B?c0xQcTBrSk4zam5INTl1OUMvSGFyWjg5elFObHEyYkt0RUVvT0hKeVdkdUgw?=
 =?utf-8?B?K3gyTHltWTducDhHYXEyd2pzUzlwbVAyZjhEbWJxT1AyTzVibzQwdFVKUkF6?=
 =?utf-8?B?bzdQOVduYi9wQlBYWFVPOHhhbEJpNTRxSDBkUjlHRnZVeDJ5dTFSYlV6SUZ2?=
 =?utf-8?B?VDVEbDhURThhS2t5cit0MXRqcDlvZ3NFNnoyZXdWdEFJMHFDbkUzQWcrSytN?=
 =?utf-8?B?K2tMM3JvUTRWVU9mN2ZKQWhydEpVK2ZZaCttdDBNbURHYUxqd2JHa1JsMzJa?=
 =?utf-8?B?WEVXSE8wR1piMjd0NUdTZ0ZGT2pLb3hNQ3NpUTROS0lzVjVkeUZnWTVSU0Mw?=
 =?utf-8?B?Qmlmb2s0Y3g1MjFaeTMwUTZSbHh1VzB1MW9ZR09SZnZJOHlUaFp1alRrc00z?=
 =?utf-8?B?V0tybUpTaFIyOE13cjNVQk9yQmUrTDlRRWtGdXpQTUZLL08zaEYzNXRqcTBu?=
 =?utf-8?B?bldRTC90TVFSckc5SWxpMHl6b3Z5MVpxSTNLdlBSMmNXQWJJUWdkV3NFTU83?=
 =?utf-8?B?bDJJbW13M2t0YzlYdDd3OE9RZm5raDNFdmx5UjFObEpQOEFOZ0RCVDIwUm51?=
 =?utf-8?B?eEc1YUQrNm9rZ2pBejRzTHhyM0ZlMW8xOG14QWJxdit2QUdYeWVXM2VVNzVw?=
 =?utf-8?B?SGVYQ1lHZFlTVVA2MDUyWlc1K0xVOHRvVWtGRHNHSml4b1ZSV2ZhRnpjVWlF?=
 =?utf-8?B?bTRmcTMxUnJjdEk3SXFsRGx3V1ZHZTFpK1NJQmpSQ3NKbllMbHhMcVdhREx3?=
 =?utf-8?B?akZ2c2ZMOXk0ZWtGeUtidEs2dEJ5aEc2bitVYjhXV2IyZVhCRHNxdXlPMzlV?=
 =?utf-8?B?L3JzWkVnSng2ODZYb05aZGN2YzVHUVVYdWhVYXRxYzJET29GbExVZXdwNkFQ?=
 =?utf-8?B?Zi91RURtRkpNQjZja3FsS2MvNGR1bmlkT1RNYnJyU0lpNDJuL0tySXB2OUNv?=
 =?utf-8?B?dWxMaGVINWViL1B0cmtya3lTbE5rNDd6WTM0S1BtSjlnU1ZKSjEyY0ZXdCtK?=
 =?utf-8?B?dDdPc0cwNERXWTUyNGg0emUxVFR5dUhFMFhuZUpZUDF0Qy9QNVp1ZExrZW42?=
 =?utf-8?B?VFoyR21rdDh1YndMWHQxdkdpQ0w1VC9NUjhsc2xMcEcyZ214cktOcDA2RnZn?=
 =?utf-8?B?V1ZqTXFGQkF4NVRwWU1OM0c5dVNnbDh0UzE5ZWh6Y1ZYeVJ1WDJoWTI5TXBx?=
 =?utf-8?B?K3FJa1IrNTdQZXlQNXZKTUJ2emRncTUxTG5sUWlHRE1YRiswcWQ4dFZDbmdX?=
 =?utf-8?B?VHBhQnlxNUc1cHc1d1ZxUXh4cldOQ25wSENXOVRvam1GOWc4KzFXdXJtS3FQ?=
 =?utf-8?B?NWJVWk5XL203Ulh4SGUyMWpwd0J4a3k1NzBvdXQrNHE1NWYydHRPYVprVy8z?=
 =?utf-8?B?bk03SU1CTFNKczZuWStHWlpkYTdKNzZ1KysyR0h1aGExSElicCthc2lNOW14?=
 =?utf-8?B?Q2QySWw4TFhoeU40YnJiRFlhWVhVQ25NbHdMZjFDWlpYU0JFaWFQV1dwcUZU?=
 =?utf-8?B?R1BwdVdBamlNaWlKc05GT1lhc2pzWVBQZy85S2pjUFBtMEVTWS8vcTVhcHhD?=
 =?utf-8?B?MmlWVHYySTVFSkVYdjU0cWE4bFFpV2pSL2wzbmhwL1QvQVY2NmNqZmZYVlBC?=
 =?utf-8?B?bzEyOFFYR2wzcmh2Z0JDNnJXN2UvOFM1SCtqV2xvQWwxeTB5RjlGR0JTUUVK?=
 =?utf-8?B?SlFTVXVxVU5mUER2dm1uTHlER1FoRFVvSDFQN2RZRis4WHhSeUVtblVtblFk?=
 =?utf-8?Q?LZBfYtJ5IC4BCHG0ZD7KCG1WZ3Rtj+ySPxb7+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e41d49-2bdd-4b86-6525-08dee41ad265
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 15:48:18.5396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf7jZKzlAFPjKVItIzt60mdafp5x1GW7ExkLFhltmP2mEmfhS5NQoYNYVdnKGWFtvCAxsyNdMwZJSqZNFzeEFtdVoPIkwXIZnhFTtPJ0eGq0GppBaYIgCBlhlcUFb0lZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084824_905859_BB449E5D 
X-CRM114-Status: UNSURE (   5.79  )
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

From: Frank Li <Frank.Li@nxp.com>


On Wed, 08 Jul 2026 14:55:12 -0400, Frank.Li@oss.nxp.com wrote:
> Cleanup oneboard fpga related CHECK_DTBS warning.

Applied, thanks!

[1/2] dt-bindings: fsl,fpga-qixis: Add fsl,ls1021aqds-fpga compatible string
      commit: 092d1fad3b2c224e465e4ecc5d7a17f3da3cf1a8
[2/2] ARM: dts: ls1021a-qds: add compatible string "fsl,ls1021aqds-fpga" for on boards FPGA chip
      commit: 28228f9ea570a94e1873adda5ee284134af28cd6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

