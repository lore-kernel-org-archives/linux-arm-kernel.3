Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4BFC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Hscwx46baceg55waKLJ1Qr477R5dL2BnJoF9SDtp38=; b=UBbaoGxjzBmQTUclu3zxC+RZIh
	66N11i20T2wovXkbMCr9niKHpIblXeQmnlNmsSSdfxojmo/3XKBH2tp/SUMR9zm1NeKUVphVfCQPq
	sDojS93eTm5Nw91cZKv+cVmWpNvdkQY5X+6fHWGTxXGY1Cx96hkTXTuNZhRFcjO/8UbxWwf27VZei
	bEQqIJzzYMQZOCQLJ7zj4fYxkzcRZY1ziCPyjl6axqqhbYR4xRlgSeYdeCm6XgiOWUcTDvvV3VLqa
	22C01y1zmuqwOV3oWx0ATOEZ7m31USHKOfVCch84DI6Qzelg7u0aUNX8lHqXTHTagMIc6xZyyw6w8
	cB+I+gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqtx-00000007O9Z-2AIx;
	Mon, 20 Jul 2026 16:31:33 +0000
Received: from mail-westeuropeazon11011032.outbound.protection.outlook.com ([52.101.70.32] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqtv-00000007O8c-0pl6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRonUmqFZfjpmbdTGV2mPAL7zNGvx4HvV96VcUBOLtdLMPMTBPXc2ETEw7Yu/1+WPzpppafSeDoz0L0/x4ilbMdpqkKptohbQfH1ngtWsVZPPvi1y3NjY3Q513870yNa6nrN1CbbuEX+3Ti3LS+OzbHBJbRLF7g0cwxn64pX5JkDLh9EHFu4cdrddEYjYbOTw9Og5S8c0UtdfCC8D3m58GnlJX+eoW/2CYnF4CdVYqP3aSI7ARy5tWayBnpVJqMV03mkFOp9LCEcVi27LJJmW8CpyfPo9ngqtMj0zurLp64IkTk11CzNdKwOSJ0Z+09aTOrWju2AV02HoNNuTF+rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Hscwx46baceg55waKLJ1Qr477R5dL2BnJoF9SDtp38=;
 b=uJIzNBzCyiEWHbU8wM7e7eZ+Q2JffUcn0zpnte/cAjUW+equWz+aV8Y73WJwg76Bd6E7kJxCydZT5J5q+gh0l3/30NXhNUBzblRNG/XBzzx3f3n2fsZfrtIlpKEokmIMCjbQp7tEhf5J9sZxNV9UgktDhIuZY5htJnMBMxWwKPYlaxuDJy6CEA27QWsyNdC5CjatHPjI4oaBGoLW/mnQwNDIKdflLZ+LQ3D3JMQCsgQdekvgajRx9Ove4/PKmirGSDYb4aTzUjTPMBkXWosV/0JHejLJS3cFlCZgdAc9Dwgrnv2mvjJH62zxsKd8C571a/bMxD58QQDzsb/GOoYINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Hscwx46baceg55waKLJ1Qr477R5dL2BnJoF9SDtp38=;
 b=BZFzEJiPG8Vvot3kNJ46T/q9w8QoEFeM3tNwivdrsuGcQgZI4V9qokOG5kzu83wqYuCUPmtSoRIKbyZ90lfVm5rJTRzFDP9W4iZw4zUntx/sA1ZxThOAvoOcwvd2mQUz4c2oJIxzFZog2pCHD3DvE32effZYY4NpKwC/MKOWZ6iUW3qrLyo0Z7zd1eWuhs9RX2xOnsZYRjxDKDfXpuwP9GGUt1pkAenghPKaGEG/iqZH6W8SKvLpJSE8QcM+Oq0UcOjQX6bthNpGH/8/jFp4i3IY+wkG/04BliEW6Gvp4r/6VsrFQfNYAdkJk0bhXJWnYdfs2+WDnLsBQ+Xohc3c7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by MRWPR04MB11493.eurprd04.prod.outlook.com
 (2603:10a6:501:76::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:31:25 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:31:24 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] ARM: dts: imx: clean up fsl,emi-bus related CHECK_DTBS warnings
Date: Mon, 20 Jul 2026 12:31:17 -0400
Message-ID: <178456506636.3769673.16365529037910734244.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
References: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::9) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|MRWPR04MB11493:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea05fb4-586a-46c1-7b4f-08dee67c5723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IrVSzBqD23kzswTz/T+kTpBhAshh+FadbwvYBtGrkQ98aBaRyhw+y7y0dtyWja94sPV3fsCvlYwlSghLWxlU+dGE21YiAzqHavzAjRj0G1SdA3PpAEzTHy8Yv+eqnpGY53KtY0PlMo5pCMtqRqRVTBWg8/M+zHMqPb74nTIq2AgF1tii9LGwWfkZ2y5ieXK99vkGkZ/Z/64YBRNOfVwoE0rS3f655aYcNGsNzEmXaIPQ+jYii/Y/BwGT7/+qNpBMFbOxZHwxgr/+2OIy+yuYFwplzyFrT6NerMRWFTQ9F65ZjECcz23ngX23s6glKh+82pwbHYz/kU9xj1yZTFsMTnr/AjK1K7DnBRtz918cMT0nFSMk8a+xhddCZAJatHTE3AdXRcmEOoXKeZlas1re0MBR5Y4YlLS3BFWusq0n2V4j5aEe6sBnlt/mPHKRJvfYQNBAG7UrneYXic5YUCcPQ/yJfcfq05emXm47iizOPh6efO7BKtdFoHIh/so2qPNbVjV+aB8U6jsYGQT87S41MsPbiOVF+QjPzZhspJU1iPLwkj+/fA0aKW1Kl5saVTBhONo43TLdOj5OvS0dHZEj/22+i/jCdUFgxiuT69ywJak9v6Bn1IIWSeqUt6/TST/zNkv/+uAJUVqTWo0htsP+OfN4JyUlVRnMyuT34bqka90=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clRISy82Y1NjUzR5VjNiM0hBNGtkcTVNZzJtNER2YldBMkVIRm9Vc0ttOFhu?=
 =?utf-8?B?MmNKNDAvLy8vcXh0citXaW1WMXRsdXRGaVhEc2Z6Z0xWNFRXbndpYnJjdkVp?=
 =?utf-8?B?UHU2ZzQzSVBrZUovNXUzOWQ5dDFIOHVmZXpkM09ERkhIQTJsZEcyTU15Q1lT?=
 =?utf-8?B?Vnhjc1dWajBzV1FHS1NtWHJ6OWhjeGxZaGdFUHV6UnQ3b2lTYlQwd0Z3WFJu?=
 =?utf-8?B?eWpPMFZKcGVyVVhnVHhXZ0hKZUlqazdGOUkzZGNEWWxicXBDUGtibW9qZHZr?=
 =?utf-8?B?TlpZS0JnV0QvTjNxcWhxV25WZTF1NmpBOFgzMlZDMlErTVB0NlFUejZjYTA3?=
 =?utf-8?B?RzJwTmdVMlJ5MGxVckVEVDgxRTZvK2RMSUhpTDhVSmxlbThiU3Frci9OaS91?=
 =?utf-8?B?MUV3dkFpc0tNa2h2d2p5b204YWNVZGU0U2FhMEl2L08rd1VNZE5LSFl0L28z?=
 =?utf-8?B?c2dJeG1ac1dTam5iMERqNUUxa1U5ZG5xaFJVc2RJQUVKRi9YQ0Vwc3psNnI3?=
 =?utf-8?B?SE5PMGNxbTJrY0Q3QzFGZTRnRWtaL1lqWDdTUWlOM2JTd3k5K0VGS085STdL?=
 =?utf-8?B?REFkaXM3d0MzTE90ZmxHZGZXWWs5aWhUOGNjV0gwY3M5U2NoVUdsQVM4YlBW?=
 =?utf-8?B?T1VlNGpZREErc0VzdFh3NUJueWp3VHFKaFVSdzZxV2lneXVrVHZSOUZDRC91?=
 =?utf-8?B?MitCamk2cG9KdmdYNm1vYzJxaGVkZ1lpc2NXZm45Q2hQN04yTmNxTkJtZW9G?=
 =?utf-8?B?eVBCK1lrOWFOMEUwYncyZTF5ZUhvTTd0S3JuL1hrQXpNcSt0SkV1VlN2bVF0?=
 =?utf-8?B?UGVmMEE2ZVZJZFVrNFhiR3FCdzNzN1VqY3lYL1RoVzZuREJ5a2JIcFptSFJm?=
 =?utf-8?B?YnJUWEhIZ0ZCOHhNby82VDQxbjZTekNYb1oxellXd2hyc0ZPcHNjSkMvc2lh?=
 =?utf-8?B?SUlIWFBDRFRLQ3NHSDFlRXQ5L0tpSGVGWUpRN0dLV0o4UzhTVWlZMVJnVGZM?=
 =?utf-8?B?YStyMlFZaVlvRU1iK1NKS2VCTzlSaVJlTjJJUXNhUzlqeGZoRlJ6T3dXb1V1?=
 =?utf-8?B?R2U1a2dUVEpTQ25lcE5kTkdyL1Zob0c4R2dsOTNiczFLUmdiQm1KRzdRVWxS?=
 =?utf-8?B?OXRxWFBrWWxsdzMvRnZ6bDJSZUMvMVJ4Y3JXVS9KbDhNbDJTQ3hRK2ZEdmt0?=
 =?utf-8?B?VzZ3dTAwUW1WUWYwTVJJSU1sWmdSQXR3UUthd0tQcS8yVFlRcjBVR1FGZUlF?=
 =?utf-8?B?WkExZU9XSW1PcWt4TnpFNXE2R3I0ODdnUUVhTkVaeWVHMmhXWk4yaEI2ejRB?=
 =?utf-8?B?Q1BGd3QxcUZLK0h4cHdQaXJmbjB3SlFqNU1kUnA5Vm5DeE5VWWhIaFpDVVZs?=
 =?utf-8?B?L0NxMjZkNklWVW1IRWdvd09ONXllbk80d2tVc2ozY0RWRmt1d3BvOVhja2k2?=
 =?utf-8?B?ZlBQWCs4TnhaeWJXaXBPNURnTVRxVkE1QnZVZHFRTVhvK04vMkx5VjVncHNR?=
 =?utf-8?B?b2pVcHN4YUY0aEJ0SjZ2dFdLR3ZrV3FVRDFvdU04OE5XaUJvQWRQRE10Rm1y?=
 =?utf-8?B?a3lzQnpoaTVpaVVzVnBUMDc0UW1rRkpJVnI5bFkxUUlTblhBT3hDcCtjcFVB?=
 =?utf-8?B?eGZ3N3JNU1hJd2JzcWg4S1paTUtDZVdtbFR5Y3F1aHd3bUFVOU1jZk4yWjZy?=
 =?utf-8?B?SVMzZFAwbURaVUpRaSs4dUMra1d3c29yRGIyb3RhTCs0KzVMU3lJMGVqRzUw?=
 =?utf-8?B?dnVsbEYrWkFpVk02NlBUNUhVbG4zdmk1dWQ0T0dMQ29OcHd2TFF4ZnNIMTlS?=
 =?utf-8?B?SGdVR0NkL0pjaUxNYnIwQXltd1pDc01mbXhmWWtRd2NzUlAzdW9sNTRpQnRM?=
 =?utf-8?B?RVBTMVUwc1V4Y0hZZ1FzZGpHb3hRV1NQZlRtQ0xXOTRhQ2V0MlgvMDRJeGt3?=
 =?utf-8?B?dVJlZkJTV1dMUDVqYW8yWTNZNi8rZnl2dVVucWFKK1Q3TkRsTWxCNzh4QURS?=
 =?utf-8?B?empDd0U5Z1VRR09seHlmSWpPT3lKUU9pOW1kOXhEMHJGVDVNM2dSbTFLYjE1?=
 =?utf-8?B?NFVYSndoZCtqaVhrSk0xQURaSmhMdGwwNUlRcHdmZzJIcWtqR09RRUxTZmFx?=
 =?utf-8?B?dVB1VHAxcDFlVk9sdEU2WGdLT2ZaMWxQaDM3eERiVXVseFZIWHZKWVBUcEZ4?=
 =?utf-8?B?dHJGYkhXcFJWNlNLSEFWMUEzQW9vN0VmTDRVU2dPNHowbS9sRCtBeG5VNGZj?=
 =?utf-8?B?WGxWNHdRemNOT0hCbENHVWI0Q3VKQS90WndtdkhOZFM3K1I5d0JvOE5CUWFY?=
 =?utf-8?B?Z2FPa3B2bnFmenFza3YrZktwd005bHZXYW9LYk4xVENnNWUxUzZndlYzTUEr?=
 =?utf-8?Q?q0ar1ivCM8qmUJ/Uvq0GqvGHEL6g+g3Q5slXO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea05fb4-586a-46c1-7b4f-08dee67c5723
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:31:24.7913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiruMXcl9aIW/kncbq+t1IZ3TPlFC4Oe6TFiGugMEqPLEvfRgDRlk0kvuyj4FRqBu6B72sRvzC2M9bjuIa36QW0+P4QecsBW365BXcYEfdnSteKzTCd2yhLhKtfglkxB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_093131_241958_4F91FCE7 
X-CRM114-Status: UNSURE (   6.83  )
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


On Wed, 08 Jul 2026 16:00:43 -0400, Frank.Li@oss.nxp.com wrote:
> i.MX2 use fsl,emi-bus. i.MX5 use fsl,eim-bus. Since it is very very old
> chips. Just leave compatible string as it and allow two kinds name.

Applied, thanks!

[1/2] dt-bindings: soc: imx: Add fsl,eim-bus
      commit: b68333c76738be779876f0c619dddd4b0a7ddd50
[2/2] ARM: dts: imx53-ard: change node name eim-cs1 to eim-cs1-bus
      commit: 9d40f2a740fd64991919d6f58d741a44f736535e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

