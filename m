Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72D0C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=; b=VZPT6RuOHh/Fzj17Yq68XITZFC
	R0E+wrZ6FWnmvY7Y/p6mfmSiwe/8wagsZFJUhEhr46QTMexFAMae4w4MRVGa9uXl1L7TXDL9XHhDc
	4f0kGJ3kNofMBEJMti77xKcFWJnJzMVaBZv/gKbH6WelhwHXHgAVJ0R+fh652BaZ91HqIonuKwId4
	C0KAwkeasqDITWdI0nY1dawvI1z/2/2gEPuJVGaDYWbqxEZiC5Ly93MtfY4wJKeIcJ8DSXAf48kX3
	P9VVqysWJzvz5iOnoObNDIlZ6CwdomW3sCjnym/aR6P6R3wupFarHCSND9ppcMkI18w1MCM8vJdEE
	9Xy6K2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPDU-0000000DOUX-1Y85;
	Fri, 21 Aug 2026 13:23:28 +0000
Received: from mail-francecentralazon11013019.outbound.protection.outlook.com ([40.107.162.19] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPDR-0000000DOSp-0qSK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+tkqDm/aC0JauBlQB53xKFvn1dVEgLA/t324CETCOF57pKErbcHV4px7Az/S1KXhmbVyXrEOohKCI7RPjjvxHzkdvYufyuDBVfaorwVCvjjSwMCVin25ndSHnx6sn5u8pZfKNExbM5BAoYnwJBr6zCqYzl3lEEo73ObVdzUsSL915wGYd03VSDndkV5InADXtGTkTbP0phGwS4C7vTX4BNdoxujCY/dptnxudfvPBRk13mEupP0m51zaX390MEr64ac/jhF96D/YyrRNvJ+JV0l8BlBTUvutiFL0x+e/VllC7VAYTpS2d3gTc+QLG+Pm/2tmMsPWwBJkGPc/xrIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=EDXkqa2GBtzvExCVYI3g7RAQ8WHjgxIZz4iqGXGNBPK7Qx3obx8O7GP6cb1mCA83ma70OtK9iwgHY4tZaDlHOd1OJIGgc0KeKBN6OnXcO0PdMI+c7qgKCFBTEtT8uUbDzGDCCbHbok5FjenSTb8l+P2G8tiAtLx3J/YOoSbzjRGvX9nw+0xXNvpCxbiKKKC/JZMyxWsBehNgTYU5ZataMItAtSjHRat4PXG7+VVsJ6z40RKFr/sPcr2wvgxfVBmFZa6S7ja78SmkSLWX2qxUuYWWdddITU1i6iem+7OScl2r/Vb+bBX0F4wVa3VYjDnFqhcQrmGFHJfoMm/xsIRJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=GcfWTaRU+Kk8WUNEfN88mAlFBnpU65CtvbGdDNdkJfXaxe36dFRulcgwkEdNXJR85PsLnsypqM+erlaux6ru+Nma74JqhiVLC6+HY6QMOB4VcI0rC9KO1qjPL1ECQ1KjNOquERGt4UtLpEsDkkJozIKA1xy9MkDOSm5q+KJX07s/BuuP3QtW96uhSaCkoSXMl97wnN6DnFSqolOgsrqOeNYIwbKjlHFAsurr57YLI7+YmaizYe0DEd9mh+T7s1SjDiZQtuKKTPv7XvRb7pCIKScuLW6dEjCOT2YbmKHflfRDvQsnlzVsgTHr/Lu7HgEyFwqw9NgcIjOAkqXkS6ZEgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMZPR04MB191951.eurprd04.prod.outlook.com (2603:10a6:20b:7c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 13:07:50 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 13:07:50 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 22 Aug 2026 00:06:09 +0530
Subject: [PATCH v40 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-imx-se-if-v40-2-74fbce2f2f95@nxp.com>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
In-Reply-To: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787337485; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=3cggXtrHEh+enre37E75yrGlCjqMarZZhXDdG5PH7gocNXdhc+vPeBy6PkTfyY6XdrcFcq+d9
 wFFV+1nro3yB4U8Ci4bl7eknO0z14Z0JgJc7rrLfhlThWrAMVQtwguh
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMZPR04MB191951:EE_
X-MS-Office365-Filtering-Correlation-Id: 9188553f-6160-4a78-cce8-08deff853419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|7416014|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info: e1YqOVRz3f7Y002ak8MKGzrJyqiQOYv2sKxLQRIMY9/UVOiF16kcVzVIZhfKoFk/BFacwUzsQIc5U7muShEQtKqQWmRo6ZB86EXsseKV12G7EIBtEp5f1fHjLcmaYLh/hINTVIfALTnQ/ltQOzURGZBfa6M8FLrRwA3iWIJ7yLKpkx6+GIAAeW/gg9x3VpWgHdMgb0nzEudtFdxbZ7y2p89i5SSwey/KkbqccqNhZdiivJ42V9V/R8dsAKywlDDqbw8aNoLoOY9lACxJIX+C5j1M8jQrlLABBFtHE6qJBQ8PSLF3+PcMaFTSSEhqPodIa9WQF08STxNkr+2sYXyVa9LPlpO5O9e5CfoTCUWZxrxK9rsUvF4PJARPIJpfwkebxPKbyqCYc2JUUmvqxUIvNWnHSl8M3SvYrAKTK+i8dpxwOACDHelbtTBs0DMMyvP9LdFUYSgcX+BfqBbXxjySl0M+28Ko8Ts0Gv+sIkmL0RBrlob4HZuvD7N8+MHGa0e7xhx2gFAtUk9sLSCkZJdBaBRFdusPkMRIoqnJaIzDqtwpQ9Wzjb1UxuVyc+ATI5+J5uBJdvuI1CXsQdokZ1WDjzNXeH5GXpMUE8O7RUcZyo1rVtaUSj6wjqxuUABiVdW+bV8d6wUcIjAgXqQDBqkmsjaI31b3UDw4mK1Uud9+1aU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(7416014)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG1lTFZRYjFwanVYRTA3Vy82Z0NGVlNEUUtTS2swWXhqYTVQSlFOTkYvKzhr?=
 =?utf-8?B?WGFzSHNZSGpFaXNYOHFVU1hNVmx4SkhveU5aQVA4b0M3RTU4eTFVUzZXeWJj?=
 =?utf-8?B?WmEwSDJadWxTeUd3NjJheWpYN0FrTkQyMU5BZkNtMGhSdkoydVgvUWM0WmJt?=
 =?utf-8?B?ZHRDblJzMHBvQlU1bFBNNnNRUjJSK2hXOElueXVMNXIzN2V1UmU3eUdMY3RB?=
 =?utf-8?B?bGY4S0xCaUxBb0FPdzVwS1k3ZmJJT1JSNDJtR1dWY3dSakhidUlEM1p6T2xq?=
 =?utf-8?B?WFA0aEYrVGh6cVB6MUhjN0JMdG9CQk42Y2cvRmcvVzNNNUZqeURSNGRGaVo5?=
 =?utf-8?B?SWpucWNsUWsvTDlsekVhR1JZVzJReUZFM0E1UmFET2FWUWRubUJHY2lGQTVC?=
 =?utf-8?B?TW0yNVpNbnlsbW1ydUxmb0YzL2RYLzBoaXhYaDFnSTVSVVZidjJTKzgvNzhh?=
 =?utf-8?B?Zi9NaThDcW1Ndm9qbG5TQUFqOW5Wb2EvT1lxTDRDUExmN09BVFJsUE1MV3d4?=
 =?utf-8?B?Q3dYVTlOTk95bmh5YnZHRk15ak5ZSUo1emxTQXJzV2FIZnI1Y1pvM3I0eDhk?=
 =?utf-8?B?RnlWb1NlS2psak8yOWFNT3FNZllweWJLYk80U3BQMmduTURFK0xqWjBKUndF?=
 =?utf-8?B?VkJzdlhXSTQxbVo0T3I4RHNOR3JhVUZLQ0RCR0FmbU10dGlpWS9Wc0NRaER1?=
 =?utf-8?B?UG16SXBPSDJ6Tll0a2VySUROcmh0MGpCTlhUNHRjR0FpSTc0djNJazFaTno0?=
 =?utf-8?B?U0l2UDI2RmxSdnBBSVVxUHJhVjlzMEhHbjE0dEkyV1llc05PbmhCTGxBT2dS?=
 =?utf-8?B?Z2FXVGFSVFRyN2E1NmUrSXNHK2FPL2lEV2dvSjhWc2VENDVtMU1RUzdWa0ti?=
 =?utf-8?B?MEZ6T0lkVUNFNFlELzdCV0c3RkVCcVNlSnBxOFdMNU14bm92OHB1VmhpeWc1?=
 =?utf-8?B?MXFKK0syVkpnZ2xYY09mMEZjVi9Oc0xjdzRSdXFzLzdlVCtLajlXc0JaREMv?=
 =?utf-8?B?OFREQzBIMTBpS2x0MjFzWVZyL2tKdHlRbEh1aWM0TTQrUElZZVBEamFycXAx?=
 =?utf-8?B?YnlNTEJ1Vk5CeWlwcThCcGpPQkRCWUxpYkpuU1haVGJ3a09UbStzM1hjZHcx?=
 =?utf-8?B?WkVKd0ljcm0rejh1aG0rVjJkUFlYSm1heWZHL2svM1VDdzVTKzd0bUY1NWdE?=
 =?utf-8?B?bGswZ3V0ZjE3aVFPSG1ac1JhaEdFY05qekJZNGRQR1ZIdEFNc2NKNG1RT1ND?=
 =?utf-8?B?N0QyZk94d3BhRGhwMkZWbmw3OFdSOWpjcjB0REtnSklPbE5UcFB1WGhzVEFh?=
 =?utf-8?B?eFk5TWZzV09sZXlOSGU4ajZvSEhHTzF4b3JrZUVTdEM3TitsMk03ZXpObjN3?=
 =?utf-8?B?RWJPakJZNzgrYWl4L1V6enM2RG03VFlDbEk3U2crM2lHT0N6THJGS2FPY3lQ?=
 =?utf-8?B?VENaVTh3ai9QM0FmZlMvR25tVkJXZ1lNTzNVKzJhYzlCRkNUOXNMd2pBMmwy?=
 =?utf-8?B?T3IzendBOGc4SmwwMEM0OHExL0grd0tzMmdIaHcyRG5jYU9ZSHRCTUVzNHRx?=
 =?utf-8?B?S0FaQVNadTA2cVhxNm5WT0xyRVVQa1p0dDQxeDM4SGlUZ0FheGJqc3A3SmFG?=
 =?utf-8?B?NTdvelFBKzhQZFZ4aHZuOE40UXlHMzZGbHdmNFBmeDlMNnRxOEoxQTZCZ01Q?=
 =?utf-8?B?Nk5GQ0F3WUlkU29IUWVjR3pJTWkxRnZZMnc3RzFGZmxTdSs2bEtjOW9hTXpM?=
 =?utf-8?B?MWkzeVQxRFYvaElSUFA2MVYrdjdwVHUwK2pmS2NzaFlITVAwaG1pZnhNcGdq?=
 =?utf-8?B?OW5Sc01LL0hVL2NaOWMxKzluVXorRkNyazF1SHRSUkZrVFNGeEVIS29JRzR0?=
 =?utf-8?B?UGUyY200cGZBcEptSzlaYUUzakl1QkwyL0ZjWW1wdzI3L1dxalllaWtjVWlP?=
 =?utf-8?B?VHZmQnlvYVcwMVArOUZMZGJSYXZEbldOakVBaTNCcmtGMnRIcFU3VWtlNU0z?=
 =?utf-8?B?REloR0pUMWpxYjFXaHF5eE9ZS004b0RiTmVYWDlhMWQwRkVxQjMwNHBFVHg3?=
 =?utf-8?B?ejNLNld5MVdGeWVPSkJjeURvcHhENDZ0MDh1MmRLQm9BYUJSV2lweGwwTW12?=
 =?utf-8?B?dFNBcUVEeERneWEyZ2Jvbkh2eWlVbVB3Y1ZFU2o1KzNxT3FGM3E3QTBwRnRU?=
 =?utf-8?B?bUdzdXFXTlg1anRWdlFDNVh0bXE2d3l5TTNnMVhkblIxZUNHQ0pGV2FhOXlX?=
 =?utf-8?B?WU85REY4M1Z2QkE5bHMwUmlQS0dLR3QwTWowamFwblh0cFJ1eGR3THJyUkNN?=
 =?utf-8?B?NW4vTi9YNVE4dFpLQ2NMSkszamtNOHd2eVZDUlpySzNwc1JTL0NGbTFrK01C?=
 =?utf-8?Q?onqx+qUxQdgwjDIMLB0iJ9lfPz0WDc3cIqksI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9188553f-6160-4a78-cce8-08deff853419
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:07:50.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcWqRhSCa+F63aKm4UB6es9K+3hopbZif6wh5odOjiLyDIfHV5hKggZHx08CDPjqNYiax/UTGeR6Hb2MsVGX+204h7QzuH//6VTj9Ei86W3C+OYl9na97JXq+tyGjfa3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB191951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062325_238077_304F25C8 
X-CRM114-Status: GOOD (  12.31  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0


