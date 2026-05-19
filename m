Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F93CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgRq0V0WeZe3a6+K6qWmvExkIgNUFNA3wuFcNcFsOtU=; b=sqzUQ7NOinDax4H2vCeySSeQ19
	oai35H4u99rk+pA9vLlCl0+jZqi++oLnhO2Sj8zMnnKsgWc5gF+l9AGq1tL0NnCrBUAxFdvJAnhly
	wyNqGj8062CUoLEP4fB/mnYo7xwysuE1sH0qa5UEmsdNT7nn1EyIfpEDxl0DZ/AeArzf+dbSqUArq
	khmP1JIbX0oRUQM/EaTLPj+b5vG8ytPkfoIW+L2uEt28IHI8uKfOxglrL/eBW3Cml+FQ/CdsKnElq
	mbNWl5Frzau04Epf5+1KYYkt//KNd5AUVzulAsU/Bhk6trJn3Qusi9NeV/agMoyZzTnK9JC7IzV+A
	YoOLpxkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIOk-00000001HZW-0A1V;
	Tue, 19 May 2026 11:14:06 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIOf-00000001HUr-3Nq5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tedHkDojJj3ZwJSol4tkYSmwDW2eixefUyvAM9UAlJKaDAUiAKOmujYfnXHmafKYuhwOQsY0ZP8Evz4e2o/mTr/R93l4SIjw1xjIoA6yggt1VeeobFDV8nkLpPZXSlPh6SKAcprUQc2i0yyMSw2SuRTK5RiN2xtuCDjsmL9F01OdsKgUs4+mnK/ILMdQUIdw1aGzaqCiKKXs6oJojBy4Pqu6S+J8gg3utxky9BScLFRc+b0ACg3grV7zlUKEovnMzvUmao44nZGZh7ItqKOTwIDU1++SV4pGhiMZqNS5hQrSfo3TWZBZxs9soHfXgD9IbAU7bqYwpwmQA0KhSUZP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgRq0V0WeZe3a6+K6qWmvExkIgNUFNA3wuFcNcFsOtU=;
 b=HScIAL6C4pjrg7EEkcoCUjBoB6MYpbxGKqK0+TPbHDx6CpH5LY5TUhoUTIFg7GD3kWf6gWwmJ0IqOk6fiFGArqOc4BwRo4torNA9FRBrXJOkAnghw0S3jTUhdI/uRaPk8tXKeqGdmhXJd4Bckf7QluJa2+uxoFwNHZ7LnnPmSfJ+NjrsB76/iEhOwUT+fRwikEY2tWztjafMnfAML/SKPoTFFl2zZV4mRbWp0kCFkj6HNhWvaeGwU603qqaN2XtS9DF6acdCZn5ps8ruiMDzr7Q8QbVu9k2CCM42VX5QfNPxYlmUTTjw4J3zT7Y4QFEn5mjMxBls4bTMeNRms/qq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgRq0V0WeZe3a6+K6qWmvExkIgNUFNA3wuFcNcFsOtU=;
 b=FwC7/luqpFZQQyNq8O+u6iSbdlGl1ZnfIXXN/EyzH5bsqrMvHlQwSAR/sgi+z7iaeuHa6WYlGhKy1tWVfQh/6wTJYcZDYIAE2RbcKqp4FC2mj3qoKVY4GhiPvuz6E+kUHu2H0dnvBjrHRC0FPR4BWriaE/bh64ejGtYTLq2nxs3G66Ge+i4xZciWi4BKTFVLGjYx+tQzxEHv2UvrQJ49xdIB3CpulcW1oLGKH1blAlZHLPfTdWu3vQ/YyMoQmVJVR4FB9jr6JqwV9vSYeRdAzbkWZ7NILyd+CC2h4oh8l2esP2gYAFcv8/b2ESdpBaGeLK/px4R9n49/jH+yzKGuDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by GVXPR04MB11542.eurprd04.prod.outlook.com (2603:10a6:150:2c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 11:13:58 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:13:58 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Tue, 19 May 2026 19:15:17 +0800
Subject: [PATCH 3/5] arm64: dts: imx91-11x11-evk: add pinctrl for wdog3
 reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-b4-imx91-qsb-opt-v1-3-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To AM6PR04MB5765.eurprd04.prod.outlook.com
 (2603:10a6:20b:ae::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5765:EE_|GVXPR04MB11542:EE_
X-MS-Office365-Filtering-Correlation-Id: edf952b3-43a7-4db8-e79f-08deb597b908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020|22082099003|18002099003|56012099003|11063799006|3023799003;
X-Microsoft-Antispam-Message-Info: qW8fc7GiPsoOUqWxmnomPKU3X8bIBXwZ/xuCqKIBJdg8hgHi3xLbyK92r0c/8h/tteX/IOtORsicqHxGPL3pcArr8I2CKhJjE5S99xhhrmFphNeLpqj+jA7jTr7qxmQnQ2hYd6tzTAq0lT5S0Py3cMQ3l4wBzMM1JBR1jwzp6euo4VJB+zhTCPPkCLNhPNkMUxaV2pwEXzA2Ofd+qMkNm9FCjgGLw544q4iYrXZteQBDDTkzWfHfTdJx0MJ2n2xQkKn2GKgxje/IeZDMa04VAQ0/kAj2hxpyeETOy4wVvtfi41uniy7UM6NIdyiizChonOQH/v/cN1MeGA9Q0tTcTSE3/eh6sF+1sl6qHRwo/RZww9KDUw09bQU0Ol4dynhAYwuFiQhxm/Vwccgy4bTFOJcpbrDRXZr0H8wQ/x9+MNnoP/8IcBSLnVrnQf2RBz0Ov8YLm/529RhCATjUXynXTN9G8snxuH7Ox7/mDiYtDtg0qVs5ySUQ9fBgu7ba2hrMrgKpT9qo71AAOzQAE+Me/foOfDVaDWMouCGeWfFFFGtrVfYSN1wqRPR3KQ7i9V5IRON1kilI1mt7MFQQOE26Bw3WTJzH5/Vlm3/2J6fkabEUZ3KXxXuO/cynaCeQH7znVwP4Lst22ckVH2BkdXdjctxBTquV1bsguuOKPVSBZPGWSMEwIyN+DzdITVDtnx6RNFo4idotDPKhy6dYEnlR+dN06zE+x/NhyemBgqommoMuLs9Rbm1Xgi9W/3bDfuplCTs0rgEbzV/oH0hOjGqS2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003)(11063799006)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NktodGZNYXRacEtJMGhJdWRNY3EybUdoZDE4bS9aUGZzSjhtNFh0aXVXd1BE?=
 =?utf-8?B?U2NVOTlnWDJVZUpWSG5zS2xmSGNVRVBTRFdWN3MwQ25VeTFGeWFXYmo1N0pm?=
 =?utf-8?B?aTZ3Vmp2a1ZXc0d6Z3VzclRSS294Nk9hVWNhZERRRXRGVnpHdGY0UlZmVEFN?=
 =?utf-8?B?ZXMyWTBiRzJ4TmdGdlpxdUVueDNSV05qV2V2d05CdjJOMXZOQVlCRHJhY3dM?=
 =?utf-8?B?TlEyTzdTSnFDME9TYkN1aHZXeU9ZNHZHV0hCV2U5UmtyWGtlWG0wdFlFNTdn?=
 =?utf-8?B?WVlOenNvR0VxSVBVOTlhUHlsRDVCQlh2Z3lpbWZwV09qSmRPTWJmZ3BBZ3Fs?=
 =?utf-8?B?OG40MW1yaDZBaS9PWDlTQUxUTzZ1bGpyNjdOVlFYUU9BcHdCc1V3WXdEVFFp?=
 =?utf-8?B?SkliOXBvcjNGYjlEWmNuMktSZWpFNEx2cWZZeXZ4QW5ISjJVVDZDcmU2bjdC?=
 =?utf-8?B?MkY5MlkwZ2phYUJYTWl1SWw0SklRK09FUHJqNjBKQi9xOWZ4L1pGY1gzVGw3?=
 =?utf-8?B?c2F2VE1BaVFtY1FTZUR2dTdLVzZ0T0ZnMzlvL3FiQ0FlQ1NrK3FQb29UdVlO?=
 =?utf-8?B?S0cwTlJiVnBXSXJ4dmlPSmNldlhTTXM2V1RNZmVjYzJIZWZBRFMvMmJsR0Yv?=
 =?utf-8?B?aUhkOXNtSVp4ZU52RWhqN3JHUnhreGdYb2xyVGp3U3gvUkRBNUc5bVBJbG1t?=
 =?utf-8?B?ZUx6eDV6QnBSODI3cHZ1eTNEQUpiTFFCUk1MT2Q4bDhOdWhHeGQ0czYzNGND?=
 =?utf-8?B?Y0pwWFRMQzRlK0xUTlJVeTd3MTR0ZGdwUGFzYTBTQnQwdEJHMFVvQnJrUGY1?=
 =?utf-8?B?aVN4VnRGTndlQWVwN1RMTEt0dlIvd0JRSDU4N1k5bWFSVEVJNVFlSmEwWldh?=
 =?utf-8?B?QUhYNWRQSzl5S0dDTWVoaG5BUEU0cFhiQW5XbGdnWVV3K1VtQmU1SjFpYmc5?=
 =?utf-8?B?NVhISzJybGRBTDEzUUJmUlUvaTZPSmRPMUU2YTg3eTJIVGhjYitrb1ZSMmk2?=
 =?utf-8?B?RURsV3JRaDFHZURka2NGM0pIWDQzRmhhZVM2clZzS1RNNlBhMVUxK0QxQnpR?=
 =?utf-8?B?UXEwa1pjT2tRRWtuT0ZLZ0dtWnVTKzM0M0xqOGtiMnVBNlFBcGFVTkUwWHF2?=
 =?utf-8?B?UmJmNURWWW5wdE56OXNFenQzWVViVXlqWkxBMnNCbXg0cVh1VzV6dFUzcWND?=
 =?utf-8?B?ZkduQXVYTXErQVd2RXh5QnlOYUdoMldNNGp1Qk45bGkwdTFDOWZQL0tFN2hZ?=
 =?utf-8?B?ajdtV0dGWEtMeUpRSy93VGVVS1ovMS9PZ0VTVWc5QVdTYXRld1lKRTh5bVJG?=
 =?utf-8?B?WGVIK0I2QkpTdlJwai8wZXNZWUZQLytFQ096b2R2RGZ2eDRMVmxRU1E2OHdz?=
 =?utf-8?B?WkhkLzl2eHdaZ2xQUlU4TkZrV3J2SXdzRUVVUmtzQ1NLa0l4Tm5iRjlDYjlZ?=
 =?utf-8?B?dHU5dlVudlVuNWc2V0NyaUtmc2paV29sMDNVUDhaY1ltS2RDVSs0ZzIzNEhz?=
 =?utf-8?B?SlIrc0JoOURCQU4xTTRxRnl0VDhUamM2Q2ZQaHEwcjQySHE1NW0rTEpMWDQ2?=
 =?utf-8?B?b1hHU1J1ZVBjMFFSN2Q5ZHNseHhhS0hwUkdCcjg3Y2g2bVZHMmtPWCtZaXRY?=
 =?utf-8?B?VFlvbmhIem1xYTRsaWVwOWh6Tk5sOUllRStvRkkwRlNWaXVVV0tCL3BlUkVr?=
 =?utf-8?B?Q29zN3BTM0JYK040elljeVZneWJqSjR2UlY4Vmx4OUx3T0ltT2xhWmtXMHNS?=
 =?utf-8?B?RHdjTWhXZHVEWUp5a2NwZkRtSDFYdWZmVXU4QW9CS2tDdmdLSng3ZlJSNyt2?=
 =?utf-8?B?Q1NLQVdscHRTaE1nTXk2Z1ZaUUNLVnlTUC9EZEJTZWtuajBERU8wTXdiUWov?=
 =?utf-8?B?Vm8veGFVOTVqMGdOcjRTS0hSS3ZFT2hHNVVRNW4xNWlNQm9WYkhLNWEwU2Fj?=
 =?utf-8?B?d0YxOWpFRCtNVFZVWkEveG9KczFGTVo0d05zdkZZdWVzSUJvQjVmT3FkZ0Fl?=
 =?utf-8?B?MGVpVzJpN2FHOGhleWxLU3JnMUZra2hVUGN1QnVGbVVTWFdZNkovNjM0bSs5?=
 =?utf-8?B?TFlBV0ZSdXdFcGEwRmtVcTdNRGFUN2YvTU52OXB4V3dFWGc0K3hOM3QydkJk?=
 =?utf-8?B?SzF0QVdESWZBRHE3c0VOK2RHU3YrVFZObXJpQ2pQM1VhWVpWckhGZTZmZkFG?=
 =?utf-8?B?OWtqdFRNOFdDdzBpWFRlK3hiYzBOY0JnanlTNHA3bks4QmJIeE9NczIxOWph?=
 =?utf-8?B?UklhcWlGVkNnRHVqd1BjTTJ5M29ZbGNpdGdxeElhTjNhMmtOeURqRk5HNnJE?=
 =?utf-8?Q?J3BF37nuDEr1TzN0nA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf952b3-43a7-4db8-e79f-08deb597b908
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:13:58.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGdRypw8fHKOE1zNwg3dv5jSedQaB5S6VWSwbvKpk7A1lVH5tBq3LRkj0WF1jpop
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11542
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_041401_857463_EED5D563 
X-CRM114-Status: GOOD (  11.87  )
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

The wdog3 node enables fsl,ext-reset-output to assert an external
reset signal upon watchdog timeout, but lacks pinctrl configuration
for the physical pad.

Without proper pinctrl settings, which could cause the watchdog timeout
to fail to reset the board hardware.

Add pinctrl configuration to ensure the pin is properly muxed and
configured for external watchdog reset functionality.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index de524f1921de808ee29895852fcbea37565a7e07..3fbdcb87a2f3acf44c15b98d7b6ee212fb62699f 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -586,6 +586,8 @@ &usdhc3 {
 };
 
 &wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
 	fsl,ext-reset-output;
 	status = "okay";
 };
@@ -947,4 +949,10 @@ MX91_PAD_SD3_DATA2__GPIO3_IO24                           0x31e
 			MX91_PAD_SD3_DATA3__GPIO3_IO25                           0x31e
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX91_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
+		>;
+	};
 };

-- 
2.37.1


