Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF108C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 20:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPKWyoa93FOsfrbTLgOZ7/KKeTUa9E3ZqxDOWHuMo0Y=; b=pswsBGrpXyhlRzME5R2h+oiWXo
	lAXTr0gJz8owJMnYTmSlWU6SWO+3/aJj8oTIrMKMMY0hkY96xGpMMcBueZttLB7YlGwVdZ5pmvP/m
	hZ6kGg0RkWJy7l20ZneTwFkAntzHF5oYjDkWI+iVqgja9YEyjsQcAzjP7oeOufb5Wk5o6M+FgW/pN
	tv6IMoepKS5T6NFqitCNXytyZnF0p043Y42x2R9cqCoLWB+/n+INGFyOurUQ6f67j7FOsFhLBd4SS
	u/ebsMhvQiqHUbfqXnVWFOQL3xuLKkVtEdqQShk+4rLYdjMIcMaLq+yN5nwZP+ryqDb/eUwRSJEE7
	OsiKvSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4sK-00000006g8Q-1GWR;
	Thu, 06 Aug 2026 20:39:36 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4sH-00000006g7D-0iEI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 20:39:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g49ptOOkZ3T4/SM5zDo92KS5FGio0yzZJT4Xlg50mIjiz+y1lQEfQICUE6KlOP348G2wZNOYeqHfJWcBQD/PHZ2Tjge3GUYrbtAU2gdez2O/1yVzpNCnJeFmRfHINiAinVfUDe45PrFj7HCYStSRHdeBurdR7H0dQ3D3Y4eEdQ1laDYlGHyhFe8a8HNNUOgmxAuFCBQGhS88OGNYwEuZ/RN9p4b1ce0zQR+gxWBn/IIkTeg4Q8UYnz2NNnu61KHj0a/94l6S/h4iEeeyavUMHQBnxoh0wW3/weNBxziWmPjydB7DwWtFE96HIw/lzaJP2kWAsSAjrAGSghzvnePPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPKWyoa93FOsfrbTLgOZ7/KKeTUa9E3ZqxDOWHuMo0Y=;
 b=ws+3qfaQpld4jN4gnf8PEFwIm2wv69EinVtG38Gkll3SK7/ABJwY0EqL6w3fTWcgwDI+DSVrkKQhYN7LEQWpazqKkKOScr2ITGpIdRfxcpG1WEoTulu1MtYUr268nZ5PyYfb69i/dJDuV51Bj2bp0IVAZpkf6MgZrKpLyxhwV7+dW4CrdGEpMUmxM9Tr3Ztpu8RYiD/ke1PEnig9MZqvzcZRQqO85mdxvb37TXxHerVjTtyLhi42Mgl0xWoq3GiX6sYsCMEmK2JUocWClfEb6R403wKNMc2UWUv6MTLIMvnGVSokh+9OjQVz9x3NYaUvBqf11nPQJ58AhW9mUueMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPKWyoa93FOsfrbTLgOZ7/KKeTUa9E3ZqxDOWHuMo0Y=;
 b=ju5xkPHnNkBChgjigoQeZS2musosyLfLpL91UQnuBXROGAf8q0D6pEk+omMKHk3VuLcY6pnZ67UbSUI123eC+UI+tM/OfZkXjxau4z3eG5LV4zq3agpKbDzlo6Kl3Fw0gm+L6jbZvJzy6wvBbJnF+w0ut3UqGJuIgi6MLBFsLB6HFa96FHAkbJ2KWBDiN1AfCtYuXqd3XE+V79B4eIOrDinxV6wDSI/UPXPSGpjf2ZOS53TNULErc/pjMXxdqIWIrQPQ4a9szrGgjv8s90NqhDhRQ7+0GRUJZfxTpaEId3ZAH4l2XxgDRw95VGAm79DTUrLm0qCTkpV7Llw8WFeRWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11336.eurprd04.prod.outlook.com (2603:10a6:102:4ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 20:39:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 20:39:27 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joseph Guo <qijian.guo@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	qijian.guo@oss.nxp.com,
	justin.jiang@nxp.com,
	joy.zou@nxp.com
Subject: Re: [PATCH 0/2] Add i.MX952 FRDM board support
Date: Thu,  6 Aug 2026 16:39:21 -0400
Message-ID: <178604863065.464664.7591742953903322830.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:806:24::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11336:EE_
X-MS-Office365-Filtering-Correlation-Id: dfec38b8-ba2a-4d03-d615-08def3facf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bdxq80U4wEKLrHUxz61UKX194QoSXgKNgmMbvzYUjzTNyA1QSX36hRw6V9Mf7X8hRq/mGurhk6PCeN4lSzVuXbTjpzAd71cPv+W7H11MR9OXwc3dK9VzpgGWZURoUcfE1izKZYQPV8r5Qiyi395ZE4kGAIsGMvFXRt1rIhYPq821UpDGswuf3h6eGlUv6QflPmPVkY5sz47Rk1libPYNGFj/x3qDOZgU1MXUlGBlHbEwVE9mY3P0aaY/mSaYz7TTEfYnft1hNON3OCtRnHmAdT3D5h0WCp6Rxv0WJrbMkdUEJs8QAmJdoD+FiExMOjW4iDnadVg3cATEmNWwTMU3LzHGZO4c40AqYQRYifASyaroGNoBm1twYuKkavco+JtyeUw8S+4GoW8SzLb+6jxgZ4QGCGcXnXkoFwfK32g7p1nuLBmQ6EAbARJxjbsAAilLSgKQrcFkyXx4ZHnetHjnpxjltvyPs+aELuy/hCbHXX5BmQIUEAtKLlRRJ3GS2GkK+VN7Qx2eZBRN8pHM/R0YHDaRrLNzS+xrKZp7Qzzk1Yl5WgX5r0azYNjKwjLREHUxex8mX2vFhe9G52tHAdhInqh7+7jTNvaooUHVY52ULK/T4Uir9oz4uPZavw/m/XsslRYUhkqQWXiFfqrnouR5bf4l8Hoa0aTIHxhuPgUSoVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhjSk13KzJXOVFZRUdjdGx4eXJBWURiWVd2enpBdXlsWDE1ZUZkVHNjOE0w?=
 =?utf-8?B?SHcyalY2MlRlUjJCbTBJWUE3YWk3SC9kUk9vTklRdUVJRjF3MC9mZVZEN2tH?=
 =?utf-8?B?cTBENm1kMkZzVVd4TmlHTWo3dnovanJKOWZqWHRvRmplQlhlK1hIeWlpNCtT?=
 =?utf-8?B?cjZnZjNOMWh0MFlSYTh6VGZTUEx0Ym0weHBFQkhIT1VMQmU4OGVSM040UDBs?=
 =?utf-8?B?NWhMWC9JaEd4bmZDYjJyZXZqelAyQytTUWJxRW84V1A4UWoreTZJZlpjSVBL?=
 =?utf-8?B?TFIvTTd5T0p3VUNwUlFvaldpYkQ0a1ZPamxndTZVeUNOQnRRemVWWTI2eW1K?=
 =?utf-8?B?SjZTYW5iWTc4NkNQRjVkYmF5L1o5aWR4OW5tT3hpSE40ZWZuWUxOYUNwY2hS?=
 =?utf-8?B?STBnMzM1Q3duUjJtRzNwbWdLenF1MUljdVpaaHowdkFoRmp4aHBxVlNQV2JH?=
 =?utf-8?B?MWpyRXBDS2o0MFBtQW81elFYQW9sakVGMDRGVjhOTUZLbWszUzV4MGpWTGY1?=
 =?utf-8?B?VHVaN3FjbnhjQUtQakdiNEgwdnBNeGJVMktQZmVnNVY2a2xqTjJnOERGZ2dV?=
 =?utf-8?B?cGZVYVNoZ3BhYnZlUWpDeVR1NXEvY2dxTS94d1liRzhOL2dkRk5vdGcwRTNH?=
 =?utf-8?B?N2JXRmNFcWl6Z0pyS3RUdHFkTnQyS1RpZWhWTEFPMTdsTnJvdmVPN2pZZVB3?=
 =?utf-8?B?M3hwYk9nRFFhaFBycVMvanNPSUxoNGo2QkdEYVhNdUdmdHQrcjh3bThHeE5z?=
 =?utf-8?B?ZCtQMmE3dDhJcHRwVDE3c1RKZzdVUjJEVFI5SHlSRXp1L3laaTlyUlY5RG01?=
 =?utf-8?B?bjI5Q3h6bk5STjJvVUVPcWIxMnB4ZnRIMkd1TmpWKzBUMGhrOXE0MzdrVVpL?=
 =?utf-8?B?SnJEdWY5OW5YdG5DdEd6RGo4ajVjZFc3MG1qZCtIV011aU1xSmU3cHNoUjlw?=
 =?utf-8?B?TG1PYnNyMzBETDFrQ3crSEpxclJHcXljdFRxYTBmYWlBSThCL0M4WjJTQVpI?=
 =?utf-8?B?SmlzMm1sM1E0K0tvYnRlTkdDYitFdkdHUTF2amgrdFpIaGRTUm1Cd1N0SnhV?=
 =?utf-8?B?QVRVaituMzB1c3ZtY1ZUTEg3TldKYmJ0OXpwazhuWVRma0E2S1VPV3I1VlBE?=
 =?utf-8?B?N1JxdjVhYWwwcjhLcnZxdG0zNGlwTzVBY0d2MUVzOHJUbUhVTXZlUWFpV1lU?=
 =?utf-8?B?Z2Y0MU1HUVlBNUJmaG1xODVkenhjS3NqbEtQQWdXZXFwL2k2cXNaNkg4cUtZ?=
 =?utf-8?B?OWx1T09sc0JBRXZKZlNYaStObU00akVtdUxNR1BMNlNnMklYcktqbHNzNmoz?=
 =?utf-8?B?K1dwdFJqUFg0UnRlb0dmcit4Tmt5UXUzOW4ySzhJN2FOcFR5eHB0SytNSnNI?=
 =?utf-8?B?UjlpUnMvc0dkVFk5SnlUQm9HMGNlbVgvaCtkVjh6YXozc2Y2WDlYeEhoL3lt?=
 =?utf-8?B?MExqa012UnI0cXN6amc2VEpHaHVEVHFiQ0Y4d0VIdEszTmJKZmlxYTUrM3hR?=
 =?utf-8?B?MFhOUUsxWEhpSWxsWFRzWnJvUlRGeGY4NUhDZnZwRXNKdE9iZGZrQkgxUXYr?=
 =?utf-8?B?WlErd3kxWm1TQ3lRVElibG11VFZDOHNvdzVhbmx5WjRJY0ZTWFhqUXNxL09w?=
 =?utf-8?B?bE4remhJVld3MXBEbnhVY0RjaHB0VlNsNWN3VHFpWFMwQmN0UG1Ia0xkOXlu?=
 =?utf-8?B?Vm9rK01Rd0RNeFdRM0JBWVlFbEdORzRkS0M5TVR0NFJhNDBhS1I3WkttZTFj?=
 =?utf-8?B?cTJXL3lSZ0tTWXMyRHRtWlBkakhXUS9VYWVxbEducFBxWWJYM2RGMjFDdmZG?=
 =?utf-8?B?dzlqUUV5aWxIRDBnMlBtc3pmaCswMnFoQ0NqY1ZDR3g1TzZOWFQ5MzZ3LzdQ?=
 =?utf-8?B?SjVwajlrc3dnaXh5OHQ4V2FUUVlkWmdJc0NwelFKU3NONnY4RHlkdVJjNEZ4?=
 =?utf-8?B?eTlCaHlHNmtiZ0daNitwQ2ZGcDhtZmZEN2JPZ3VoRTVHYXM5TXBaOGE4Nktu?=
 =?utf-8?B?MVpTNE1LMS9XNS9tS0tpMmltT2l6SVk5NUFlNm1hcndRYXpyTUQxaEpvUVNs?=
 =?utf-8?B?WGpkUlNnZGJhbkJWUEJOY0cwQ0R0UXdnWGNwZWlXbi9EQ1lvQytGU3NWdmdq?=
 =?utf-8?B?d2k5L0tDY2tBdFVWaWlTRVlsUWo3TC9KM2o5SEVWZWF4eVpaNjZMYjBLb2d0?=
 =?utf-8?B?bUpKZjdkcXdjWFVFZHdaMHJQbFRFWGNEQjRmcUFENEdwZTdnUm5Sb2ZBZExv?=
 =?utf-8?B?MThzODJLclM0U3VZSm5VUFRrUE9QNCt4c0pPcHl6Q24yc1JLQmRhQSsxMEQ3?=
 =?utf-8?B?TGNmcS85aGV5TTQ1dFFDdlpsRllxeU13Zk42NW1tdklKRkhYR2JHa1kzd1Fm?=
 =?utf-8?Q?s8y3yI7yuVL6+6n12phrlnepu+3VkzSXea90p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfec38b8-ba2a-4d03-d615-08def3facf0b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 20:39:27.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BzeNemfqn0Mt1wFoFl61RuacIUKjLsMTuI0L7aoigZJoxNPE4kirK81aZDl1NK2wX5VdJZJFbmEtvU/h6EhwIIvWTuaT48og4d8yqkTqhw9LL65SP93rgwWBcJz5PNY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_133933_216859_1B1F4C4C 
X-CRM114-Status: UNSURE (   7.34  )
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


On Mon, 20 Jul 2026 15:28:52 +0900, Joseph Guo wrote:
> i.MX952 FRDM Board is a low-cost and compact board featuring the i.MX952
> application processor.
> Add dt-bindings and basic device tree for i.MX952 FRDM board.

Applied to imx/dt64-indend, thanks!

[1/2] dt-bindings: arm: fsl: add i.MX952 FRDM board
      commit: fc1661dfee875ef8d6fae18a5a44cda6ca0a7bc4
[2/2] arm64: dts: freescale: add i.MX952 FRDM Board support device tree
      commit: 1e951dec1fdf47462cffd0228bfbaad4ce072c34

Remove Undocument property "fsl,cd-gpio-wakeup-disable".

Best regards,
--
Frank Li <Frank.Li@nxp.com>

