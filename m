Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C834C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsKredgvk4q919piDkj9aVJMXH0bGLRCPu7CdMCRZjA=; b=cgzc2wg+Z84qSoIaSF8CvGuoI4
	AZjhIOWFT33h9BNBDbXbtuYp1E1cwqkL7oUiJJ5rCeHSRnG1nIYEpsZgyEk7KhjculkQzUV/3Vswc
	1W2E/3RihdMpetrhefyXorJumphHk5eCtfrWFLsYwhb8xATMLNa1KYj8i2MW51ztmMlyABshA0eoB
	7dPg8nTeQVIryRHTULpdFTdkPRtepj2BM8FmhF8Z52mr9e/h3x/Dx7W3XZqwyJQMJLx09PDGcBPU/
	EXJszfOIa8IDBvIylUYdEsA59n7DP31+lHv5mNqpuBh6T5UutZxinAT+Q6omR4UXiQaPElMEeCxbQ
	JELNpc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkjd-00000006OHQ-3iJQ;
	Mon, 20 Jul 2026 09:56:29 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkja-00000006OFm-2QmE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:56:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIntVNEDzwFn8JV/Jv+MiURQ/kmAdgiCXVDoxrylWmd0dR2dPXvHRpDmp4R/vmmm2dprDISINjPtPiJPrEFFT5GlOFzjqHVcXGwY0KTFWUYqv+kGwXRv35ogW2/tKoaJghWeppZlBoaFyG4Q08E59SCj1+HJ7n/6Z+G+510uZflz7ULXJxJg6aNksZrtv60PpRI5I5MZBTEYEft4ewoi6TNMkSIx6ZnMSK2eg7dAjBxC7rBh/IRaHbpUhewI3CTdJEg0jFDPBxh+O5HIXStZ0GokecUdBFDaNeX4oK0sAiQqOY28p948JlUPScLoKb80KKQ2C8xl2nWM69rA9eMXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsKredgvk4q919piDkj9aVJMXH0bGLRCPu7CdMCRZjA=;
 b=q4p37wczMsnISN2w0kYIxnKY495FXHuwqzWPRqUrQl/LiswnVbC0+pDWDdCpY0VOqnFIhr2C2WzqqV3+gsceoAAhtY1mRWj0FOU9xMJEp80z7vLC3jtwJmbK8tjyLb5hJ0fBvbE7qGgJoPv4m8mS84nOEM1ZLrrbBEZyLqxIIMBHDQysQPHkm5UBXPagHcrKrNwg6C+0Oh/6mZUhjlD0qOmiFs04wkyyo6QNK0VKynevdpoOK99092DHhkYGcNqT3v8RJofMescP31e3ykfgaB5nb+XNuJohkl4A26LRsa5IY5O0SRQjN7sAJ/UVu6Ekpd9h5UTUikkRkZJ3s2KU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsKredgvk4q919piDkj9aVJMXH0bGLRCPu7CdMCRZjA=;
 b=Kfjew4my9DyS7IqRSLR6hqBY7OKcNU9dMI6WaLvN+9HR5rFi9+DL/szP7US9LF9/njs77sUvyIqg66nGStB41BP+pkWdGkcomtAGDa8evSAbIGNKNaL7SGUzFboBg5CTXo0xLEbmMp4nxbD/eglK35zAdAAs6gKelY+0UutWGzP0cnunFmKaSCFVpp6l8/9RfuQ1HOyjweBfzWBERowDDWYgtiGJhCmFJmr16BS9vQx4fCgwD/QEkm5DECRGEuz0l1CVg2TNwuZWw5fe4HIzIkpsYTi5Nw1aDF9CkuZ0UTQ1cuFCOdtD+h4sMKn67AT8YOTslT/UneJSOiM4tf1GaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:56:22 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 09:56:22 +0000
From: guoniu.zhou@oss.nxp.com
Date: Mon, 20 Jul 2026 17:59:47 +0800
Subject: [PATCH v13 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-csi_formatter-v13-2-4dc9a80e4cfd@oss.nxp.com>
References: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
In-Reply-To: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784541587; l=3479;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=iVP3DKKN0pG/k8sbxSrDBSQ4GdarbTCuupDakf5EcYk=;
 b=79gqp61MLkh4PdvIakc2n3IUh1Aw5i7kHnln+RVtBOgUT9boE1hvctf5HcCjbUnPt44GZa33A
 FvTiJ1hg9r/BHYNqIMdKa6qHAHY4eFhIKtg568ZeLDlurESJkLE2Qz1
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c00da4-a2bb-4194-4e30-08dee645273e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|3023799007|56012099006|11063799006|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: r9ougwn1TUpdXbWKWe+zTRdL9up26XXSBkycIQBT1F9UGLVrW1UmsLBMTMuBxn/yJgMIgLJjmoWg+kBmz8nwbnf3ofoD7NpKnh3c++Qhx46BCFIy4CufGIZPP/vpHlTObhS1EnA2nVkLn5dIz+dAgHZggRFXJu0nPmd2DWP++xtFjk/IAs26i4yYw1KJLrdB6uQoHiR0SwBAl9+YWMrKe2XdHmrnvU4+YQT1BcBM+gEC28zX+mYIQxuOSaOO9gtMwG6KJNqFxmpIqG2eDiX04o+ed+1DKqh+1XZj6sBNw9lCB4T0zNFGY8F0SX1HqyEKB9zUIY8J/cZxWEYGj+mwuc9wIpNqkcSrwTfgGPlfEA7yC0u5qtJx/J4cnWdqHu+UP1ijwBkAZzJmTJzU20qu3V3WWri78pQW+IgUk+sbqf9aVZjXFx+70CgmIDOHbskjMKwGB0D3tCFYcCyNt/xhLyBuASDHTVX2Y5hIB5Z9eqxXOVdrnzWZkfnYerxBjIV+yji7LtRPtQ8dA0Yvsodevoz5Lo3h5MBUmFJffUD0yG1kG8jxEYvxz6OJmeNU9LIYcJ48tcv/c+/lm/6ypNbGIgxLP1Vm0HcVrjNvw7dtnpOHRaHbwnqDm+VqmJ9orYwgDDwAOZjdWTT6Ks4SqdMnsKYKIQChksqjzZInNPfg3y/STzDsrZiLrXQZYPLDEjupj76iRNMQHKLdjz8CHHw6pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(3023799007)(56012099006)(11063799006)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0daWVZQN213UE9YNkdpSDB2WU9NMTdPbGgrYzUwQ0xBbllpVG1zZWkveTFp?=
 =?utf-8?B?WXBNN05XTXJKSCsrSGFYOGJkSXRrb29iVzk5Yi9uNTZnWEhWSjhKMWVtQkNi?=
 =?utf-8?B?dTNXblIwTVJBYkpNSDJHRmhpdEhjZDBRYkF2N24rSTcrSWJ5d0wwY0tpbnlZ?=
 =?utf-8?B?UnJ2VjFSME0zeU4wN2xsMHN2U0pPWmVuTnhPaXBUZXNYQWoyREordTVGOHJF?=
 =?utf-8?B?d254S242WEJ1Sjh4YUJZcHIzWlV0T29Na0JJUnNSSWRLakRqd091Qi9XenVB?=
 =?utf-8?B?TTJtNW00Q2wyTHhjeXFZSHZSL210L0xQWEI5NUVCUUNMUWtEeXZObXZTNHZa?=
 =?utf-8?B?dkh6d3RSOXl6WGY2QkYvZC9NanVWWVY0S2FXb3ZJeFdJMWRaalNLcWxTRDlK?=
 =?utf-8?B?Y2l1TjZpVGc4cmZSRCs0NThGbTFudUtjU2dLWG9hWmRIUk5qdEZMUjRWVm5v?=
 =?utf-8?B?YWp4Qjgwak53SGlIMHNyNVBETUlpQ2VxOGl0RHJ2Qmo5THZEUFpiZkdSUXp4?=
 =?utf-8?B?NXNGd2F5bU5sbk01b3pjaS9rS3lCSzBTRXNxYlg1NzdYbWp5a3RSRTZjKzRt?=
 =?utf-8?B?UkZEVVJZN3BYcHpPOFdQTDB3em03bG03MXBYQUJ6K1E5NHd3WHo1OEdYbnBZ?=
 =?utf-8?B?Umppbm43S1lxV2hPd2JjdXRTdXUza2FaWXJNckNWS2hoWHNjMHJLN3ZnYitj?=
 =?utf-8?B?S21hQ2NpWTFvY3l1cGo0cVlCUzh2d0UvblFCYmNBSUp4ZGJ4dlFhem1WOHk4?=
 =?utf-8?B?dFRaNW15VzREaloxNlZJaldoQUFEL3dqaUllWWlnN2QwU2FTbXVYZmFrb0gz?=
 =?utf-8?B?Y05LMnQydnlCRUx4S3dDczZWdFJzS0I4UWlMODBjY0xVNnF4UVNLbytmK2Zk?=
 =?utf-8?B?bkxEak5VMzhNVGRkZ3huTVlsQU9pbVdPT2tRZ1kyMUFxdWJMMU1XZ0VFYUYw?=
 =?utf-8?B?VmFuVU5DMlpnMC9yWUFwcDQrV3JWYVVUM2FueUt1UDBLMXN4ak14NG43dWtE?=
 =?utf-8?B?Rkd1K290TXF6L1BTTU01c1BibkJQa3lXT3RjbUZ4TFVQTHE0Tm5ZRzdSakJD?=
 =?utf-8?B?SitEbTEwYnl4TjhEaisrUy9INmpCVjdGS3VXQVYzWHBiVFVDb0FMZDV0czl4?=
 =?utf-8?B?MkNSYmQrRUhkb2F2YWQrZEx4N0RLZ3A3RXcyOFJtT0JCc1BDdHAyUWIxMmhq?=
 =?utf-8?B?TGVSUk5DeVE2RGVKZVVZR29sd2Jzajhtb3d1KzVjbldZYWhVMzBmMlF6NFM5?=
 =?utf-8?B?TEo0TlBOSk0zQ2syenJNVldCQlRPT3hCYnZGaXNRcmxzM3QvL2UzaHZ2R0tF?=
 =?utf-8?B?SDJHZGNldmJzaFdOMnZTaWhNcDVTbFFrTUhKNWZmUy92L2ZncStOcEtoZ3pn?=
 =?utf-8?B?UndtZDJxRjlFeWZEWlNoQ3JJTE9MdHZ1akF4RUlHUkJqM21hTFRMYVlicUNX?=
 =?utf-8?B?cWZha3NoSFB0L0FJWFRkd3BIN3lqZStid01qYWJXSEZnc05EVktIRWZyN0N3?=
 =?utf-8?B?STFmeEZZSW5WeHpXRFQ3b0tMNjMzcVFEMDlNNFNFY3lCUitTMm5jR2hHV0FZ?=
 =?utf-8?B?c0V4WEdWMEpoR0wvVFNLeUVVNEhubzFoVEowUGRxYWc3L0VHSHdBTVFKNitS?=
 =?utf-8?B?di9CUEwwcFNRY0NNRElZWDY4ZnJ2L2RNdG5sU3hBanFmNmdzaE9aUWVyZG5P?=
 =?utf-8?B?N3NvSm15aUQyeWNLc2tlZ3Q4b09VWDkycE1ROWIzUE1SaUJuMWdMN3NZcncw?=
 =?utf-8?B?NGFBcFdpQXZWYjhqc2x6MUtXZExlMDNPdE5EWTdZc1BKQUkwV3g1VGRuNEkv?=
 =?utf-8?B?aUh0emttSTRxTndmVTg4WGI3enpySnBnb2oybmFPb3NqdWFhdTBHa2syaVFs?=
 =?utf-8?B?RnlUclNpb3JWeUFnTzE3Y0JraVZCQUQrQklkM2ZFb21PcEl4ZE9STGhrU1Jn?=
 =?utf-8?B?R1AvN0QwV1pmMVB1NUhNbmpnNXk1OVVnandUaWFVUDRtVHI3QmJYb0ptVmxn?=
 =?utf-8?B?ZXhrL1hnU3B4RzVPOWZ2TkdNZUVvcVNhWmNhTjZjd09TWUVIZXdRVXZTOTBC?=
 =?utf-8?B?b25UTmcwTlcvL1ZXNk85L2ZWeWFmc0w4b1k5REpUOW5JZ3dReG5zNTAwTWF2?=
 =?utf-8?B?Y0h1YUhVcFBURjVLK3JnYnFyNFhZam82cXNJamp2MVlUM0VJRnhoU29yOXR5?=
 =?utf-8?B?MldickJsS0FYVTM4eUhLM0F6b2pscWNuL1VCQTVtZTI2TlRNd1NHVENvMVFM?=
 =?utf-8?B?QVhmTjR6b2dubnpMVVJTWEwrVkRzb2lmWVRjWEd3b3VVZ2JMZ1VOY01QN1Y3?=
 =?utf-8?B?YjBnUXZ6MW4rc2VYYlNvWTBBWVp1N0FnYVR2WVBDdE83NXBiS2lVRERCcVVF?=
 =?utf-8?Q?mqc6SeNmNrUGzRo/M7EWnlBdbDSiX3sGPN3Vx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c00da4-a2bb-4194-4e30-08dee645273e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:56:22.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qcLHU7lF7ODAxoP80BabyqymTmkSZI8HLOd4YW8MM324PA/OTPZbSkna3fpOZRAVLkkUYFTVe78kIJ38IBRCDDAL9M7GxBfOgyyV+oOU0dy/mCNOqyu7SqG6uABxoPo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_025626_651808_E7645F06 
X-CRM114-Status: GOOD (  10.69  )
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

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The Camera CSR contains control registers for multiple CSI formatter IPs
at different register offsets. Each formatter is an independent hardware
block with its own clock input and media pipeline connection.

Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
with 'reg' property specifying the formatter's register offset within the
CSR address space.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v13:
- Add Reviewed-by tag from Frank and Krzysztof

Changes in v11:
- Move properties to top-level and use if:then:else (Krzysztof/Frank)

Changes in v10:
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message

Changes in v9:
- New patch to address the issue of formatter acting as a child node of syscon
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6..fbbf1b3f1790 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -39,6 +39,18 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  '^formatter@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -46,6 +58,23 @@ required:
   - power-domains
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,imx95-camera-csr
+    then:
+      required:
+        - '#address-cells'
+        - '#size-cells'
+    else:
+      properties:
+        '#address-cells': false
+        '#size-cells': false
+      patternProperties:
+        '^formatter@[0-9a-f]+$': false
+
 additionalProperties: false
 
 examples:
@@ -57,4 +86,46 @@ examples:
       clocks = <&scmi_clk 114>;
       power-domains = <&scmi_devpd 21>;
     };
+
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    syscon@4ac10000 {
+      compatible = "nxp,imx95-camera-csr", "syscon";
+      reg = <0x4ac10000 0x10000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #clock-cells = <1>;
+      clocks = <&scmi_clk 62>;
+      power-domains = <&scmi_devpd 3>;
+
+      formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&mipi_csi_0_out>;
+            };
+
+          };
+
+          port@1 {
+            reg = <1>;
+
+            endpoint {
+              remote-endpoint = <&isi_in_2>;
+            };
+          };
+        };
+      };
+    };
 ...

-- 
2.34.1


