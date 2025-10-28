Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8011CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=; b=QpQEnCPYLLdvoCe5JmoPpwbPDa
	zpA5J8DpkZCdjYEJswtUJpQO1CI5BxQXxbZgZXCry8Urqaw4PCKv9BT/CqypKSLiTjvGlGmpnwrnb
	z0EYtMk1GLTNOsHGuH9NPu8S2TWMazvJj+UDhX255h0xtS4o/6y0NGXZVfoIkqkTUNR6QpJMFiGbl
	3unvo5/FQe4xxKoSD/UV1JjMzCYhui9bA018gJ7xvuhbJt81mgtPbscYcDWP+IqWSpIy9Cg1ZJ1N5
	98soyBQe5MJWLmUkPpwDMVZZIaFJiPCqG6pC+/0XSGbT8WQwVd1WPPSn4UocOH51f3wz8xR1WBtG0
	vNV/sy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeui-0000000FWau-2Jog;
	Tue, 28 Oct 2025 08:18:44 +0000
Received: from mail-norwayeastazon11013017.outbound.protection.outlook.com ([40.107.159.17] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeue-0000000FWYv-0Kpn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 08:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDVm4ra0yBBSnHmDLV8Q3ucdJYR/mVIN0kMGj5anzFUREQU5MeUdoKLEi7hh/C5wGdCX+UBg2oh6KnoDfq6M2w3rGrpKVMawWjFV6b+tQQPh8gwftO9bmR7oH9DIGrunM0IhIdDIwHf/U4b3b6lMMtceuzREDylf0wD458Fy0CBX2ZTx53lEkx61YBToKR3egu4LqhbrDwG6GzhSb57wD5nKYB1jFPPFmkQ//PlH+dK2Ra4zSUiwtXFlZakRdytmpJFeTnMAp8DG2O411KVN0GPfU2fJwxptFbSKnup1epu+OVNkSboBxdTy7YooDbnVerjj4ud9ZasZHLcIj+y+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=;
 b=rUzZXPuU1nYKwrsIWZCfdu6089BocwMZFllhtD9ZU2ULNqHb1RtiqZah+YEDTDP7Zwnn1RScRfa1qGs1EvigS6cwo1F/VQ0EJaM5uo2UZaXyaJrk+ReAU7mtDk+aajWx8o8ySmwvuG3yK65uZ6CNdxkIB8p6EI2LjxS/brzL08eb8u/taeZw/tFiMI0g1ZwJjMCZwkdFzISP86a0Lscyp7bt0IPaxwA8lUbQhvXTJAs8p8syRfltIWtQuR9qaWZGI0u9o0sP9AyCDpCGYU4EJnuvR0WKc6ozQBP5a8rvQn1AmrpAx+LfmFyDTv9PArm2me1Req1+I4tASM+0nzmhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=;
 b=EEEKKMTI0pk0xyaqPbOOP+rzCTtdmTSiqvhSBV7pKw2GcjM1Lgy3Ia+aonS5xsmfHwJr6BXrcR5AwHmkYpw1/jBete5EiC26b5/3W8jcEUPEUbbi6JGfh/p+CCIz7EyY2/T2DAMl6T33pz+CziObqfZJ1WM2XcU5T3KgXFvf7s19IAsrJgMi8LupOZ0vMlEN5JftzCrVp/YpvFMSYpi1NrDZksQbYgcmrpWP8dl9aVignoqFF8LWZpJpjGinMYlw2saeVA/o85RHxLbfYgv7ZRM2DeQ6zSuUeoPWt//R72MG1aVy1F2J6B5lhUUa0syPE54ldDFDGaoYEMN39eCb1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 08:18:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 08:18:35 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 28 Oct 2025 16:18:01 +0800
Subject: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-imx95-rproc-2025-10-28-v1-1-ce9e7db9edcb@nxp.com>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761639500; l=884;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Gn8AanCwjay2JI77GrtpgXF6F5gweYuV9gKPS2j8sc0=;
 b=ZjcKKkEzdsjfhT/uEF/RDxEMySxwpU5Y3VvNWp1oRqiRgjdXlmMon4tdT2/B5eh2cCb1np+L3
 X0KAO8J4hVlAh3t/HkyB11qanJ/DpdhpsuF/+f7q6SDlIK5HVrVmuvH
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 71371cc2-8a2c-46bc-6a0a-08de15fa9729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkQ3THVOSjVuaGl0T3k1QmVPYlp0NFgxOGVTaERCWStmblQ5K3pXT04yY1Zo?=
 =?utf-8?B?d2pRU2JvWjJPdm1LK2ZCUFFEbUx6QzBrczhxcVZyWWJCVkxYN0ZicnplOHNy?=
 =?utf-8?B?enU0RUNDTzEycitFVFBIejNZc1dGOFRSWmNXdW90OTZiMVlHS0IyTjRTbi9p?=
 =?utf-8?B?Y2xETFhtL0hGUlpwRGIvTEo5L05ZbFhMQjQwRzltdDBQSStST1BzZzZMNSt1?=
 =?utf-8?B?cWJWWjk2dXBaZEkxdnAvSHdoeDRBQU10cUoreHRaZjl5aEE0VlkrQ1lnYjFG?=
 =?utf-8?B?UnI5b3QvWlYxcGg2RFlJU243Mms4RnRNa1JpMHpFOWk2bTBRTzRTaWdFUmUr?=
 =?utf-8?B?ZmJHZHFKa01tN2M0N3dGMzR2dU9ML3VGYnorbEUxQXVsZU9OclZJeWNUQzBz?=
 =?utf-8?B?RCtmR1NzQjZURGp6OThvOTZxaXk0NTlwWXFhb28xMzQ2VnN1Ry9XSjB0UUEw?=
 =?utf-8?B?Z01JRm1IMEowZi8veTZOck9JQzEwVEVObnlvQkhlZG1Bc1phc21odEdWWi9Q?=
 =?utf-8?B?NHdXYXFwSDI3VjZIR1kyMU41YS9odW94MUFveXhoSHRqM1oyZGVGV2YyQytn?=
 =?utf-8?B?ekJXZTFzb25va2NFWkw2VnNjOENEeklPMmJhYmdVVTRCM0Q5OFJQNmJ3eFY2?=
 =?utf-8?B?dUxQQmJMUzV4YVdCN3l0S0hqYXNUUUZFSVg5RUdNZEVZbVIrSlVjR0lhKzkx?=
 =?utf-8?B?WnpMclJaOXZ4TjFyQ1FsZ2ZYb3RSYkxuTm1xVUxUYmNPV0RRbzd4WDRvdzhp?=
 =?utf-8?B?clZHUk91dmtFeE9lTkZHNEpBVDJXcVFnTE1uWWhTYUNVcThNTS9neW1RMjNC?=
 =?utf-8?B?THFkZGZhS3F4dXA1WjdFVEZKU1N5ZGNHTFFodlJaaGt2d1N3UXFWL3FDZFZC?=
 =?utf-8?B?dHBWRUx4YUU5dWQxSnRsSytJaDhjdE1QMjJTcWhGRjlaUVVJMmR6NDI4Q2wz?=
 =?utf-8?B?WUFRaFh4RFFOeGp5YUpmZ1craWdXeGQ0TFVYNjY2NGh0NFJDN3NPaGlReHhu?=
 =?utf-8?B?blM4QmpvVlgwbWx4bElVKzlOSWJLNHN4SDdpYkIwdHJlcytTVGIweVozeUh5?=
 =?utf-8?B?bi9HR0hoYUdyR1RKai9TU0pmSWEzeUJTdGR3SnE3TWZmZG5NZWQ3MkZEdVZZ?=
 =?utf-8?B?dS9hTXZqTGdkNmtFUXBLS0V0c3htanpiVkNERDI5OXZXa1NxbHlIZjdIanBP?=
 =?utf-8?B?Qkh0SWxVRGk3UmV0VHRvWEdxTTJlbXBpKzJvMWtYTnlVbkZ6Z0VtdzZpV3Bl?=
 =?utf-8?B?a3JjMTNwNUc4TGV5WTVIcGVwSkI3RUkvMWEwUTBqdXB3THpTYXJzR1lvRDNZ?=
 =?utf-8?B?cDgvNEhVbFVEQ28ralgwcTNXcE1jZGw1TXpLbldVUmdlWndKS2FrQnhKb3JZ?=
 =?utf-8?B?MmtzdWFCTExIWW5MZEpDOWlBRWZVV3d5VzRCUi9hT1piaUp5dkhoa3dhc1U1?=
 =?utf-8?B?UnFjREdscVZPemZNUHAvZUp3TDBUYVNBTHlVLzhTUDgyRmxnK1AzMTlTSlQz?=
 =?utf-8?B?U1dMZTVyOGd1d040TnRtMmpBby9WbnJ1VjlSVDJRKys0L200QkhwdWZEYVQ3?=
 =?utf-8?B?aHQ3TkVHa1lVcjN6Mmx4R2JtN2QxTE5icWdsbWpZMXlNSTVOSE56eHhYdlpi?=
 =?utf-8?B?ZzhoMDFJSlFGaUVWSDRxYnlNbzJQRjZnaXRWa05GNjBucWtqK2xIMkRrSStz?=
 =?utf-8?B?Wm9xYjY5WVM0OEVzSkoxZXBZSytvZnJFYzdaS0d1WnUwcFFGWWRZK0FoSU9m?=
 =?utf-8?B?aURHZ3VwVGV0RHV3bHp2dy82b3JlcEtwU3c1VU1meHdoSnVVc2pQQThZYjNT?=
 =?utf-8?B?RXF4aWM0TDJlVi8rb2FqY3czQkNseUhPWTVoUWdRQXNiNkpoeFJKdjJuL3hG?=
 =?utf-8?B?OFVIc00vT2ZJYi9wcEVoRVhCclByaTZhQmxVaUUwNjArWnpWRG9aenRBVC95?=
 =?utf-8?B?c0NGczFUQndrT3BuVlZTRjBKOG5RSk40VFdLQTAweXNUcllYZlNFR1dGUHRR?=
 =?utf-8?B?cXk1VkRjT3NTNFd2VkY2Rm0xam5QY1lLUTFrRUdPWWdlWlRXUDhNdG5zR3ly?=
 =?utf-8?B?WHlnSlU4Ly9DVWZqYVgxaWVvZGVvU1BNV1NoZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDZ4UlJ2NkF2UU5HRDlWUEFTZkdlMzQ2VEhYenh2NTloZGVKQ0YrMXVRVjBB?=
 =?utf-8?B?UlVhOEozSTR3M2hGQVh5dXRyQU1JWmNOUVpyUVJKbW54anZ5RFRzUjB0WUVh?=
 =?utf-8?B?MFpEMjI2ais0MXNvcUhiTCtySkFkK2ZDT2oxQUdUa0poT3dNeHdRR0drNzIw?=
 =?utf-8?B?RE5CLzBKbDZWNkxWRHUycVRsQ1dzc2lYeWtLL2RuQ0Y0TFNuaGRnQ2Vpb2Rj?=
 =?utf-8?B?MHpOSXVPTi9JMXBIOXBIRXVWZHJJMy96YXpFUGcvSGNKczQwL0l4MW96OXVk?=
 =?utf-8?B?dkIzQ1N1RXljR0NiaDhnUlRtYjhNeVIzbjQyaWo1S3VzTUFRVHVQTlAwRFZG?=
 =?utf-8?B?QTYrLzYwZ0JweG01b3BKdDRuaFNWc0V0U3NlWjdWaGR4TURDb1FacHBKSlIw?=
 =?utf-8?B?cndYWUFSeHlYOERIWldaQW5ZZm02T3pndmVnWUNYM0Z0R0pyaTFiRjRRRmVW?=
 =?utf-8?B?VUt1czBYelBXVEhjVm00Q0xJUEdVcTBMSVB0czJuOXhCcXRUaXNyNE1SN09M?=
 =?utf-8?B?NWFTb2V4cldQM2JkamIyQTZ3c0lyZWtxS01MbG11SDFteEpsRkxscE1QdzE1?=
 =?utf-8?B?TFFwTk1zdGl0eEozWHZvV1I0Z3hPWjhyU1c0TjVESEVjazk2WlQwMGUzVEo0?=
 =?utf-8?B?RStxT094OG94eE1nYzZhY29QWUxxbzUyQXlJd0VKNTRXWlNjWVkwcVg5WmJx?=
 =?utf-8?B?T0krMTk3MWMzY1ViRTdTcVgvNnphejJaWDM5c2d0WStrQ2twWnBhWnJudHRG?=
 =?utf-8?B?SWR5SGpqcVd1S0pIaXoyQzA5cnhlVnNBZHZzOEU2VVA3Yk12UHROa2dkSlRh?=
 =?utf-8?B?NFBTYVdFR0xiRGo0ODVrTnlscHMvbEY3cWpPQ0FNNFpXeCtuSnJPbCt5dmRT?=
 =?utf-8?B?enVJMzJHWWtRSUJmZXo1cWluV1hjV0FDZmxabnVmNi8ydUFOdlBGQnRYK3lX?=
 =?utf-8?B?eWVpK1V1OGZlR2ZZY0tSbjhWdDJGdXJNekZUTkJoZjkwekdPZ1pXdFlzb3kr?=
 =?utf-8?B?YlJQQTBsRm5ISFU0Nzd5Tm94VDVGY2Q4Q2w2dFkrVE1EZnBRbWNZbk5vZ2Rp?=
 =?utf-8?B?N1VJRWpZTXQzWUkyZDZFbzNSRFMwRVJMSWNRQ2kwZkF4blc3OTdzVVU5WXg3?=
 =?utf-8?B?UWRjbk5NUTdZSE5ubmliNTBnM25TcEJZN3FWL3ZlU2tIUWhUNGhHcWwzM1d3?=
 =?utf-8?B?K2VHUXFwRHdrKzZiVTcwNzdkek5peERDcUoyZi9hVGRYM1VyaVNuYzRiQUN5?=
 =?utf-8?B?cEFpUEJUcUZ3Z0FGcTlwcG9LcjJIb2VDYlQvNm13M3g3MXJpeW1PbWJiOHhL?=
 =?utf-8?B?QXBYc0JkUXU1MXlhMWNwam5zUVVocldIRFp0UlkwMUo2OHVVQzFvaVJtMlNu?=
 =?utf-8?B?aHFJK0lSMHdCbGpjWHVCQnFyQXl4cTdXOHdSZkw3dTRPMGtXWVVNcHZvZ0pD?=
 =?utf-8?B?b1diY24xendIdU5xUi9mWXFBNXlKY2ZjbXA4SU51WGgyWk1tZUVHeVY1YjJh?=
 =?utf-8?B?M1NEZkR4RVdGRGs5UzZ2VDI0by9LeEp6WS9yNHFqQ2RlYTlEUGlEQVh0d2pK?=
 =?utf-8?B?VGNqbEJQT3hnQWphR1pienp6RHQxQTBsdlorcEhhRTZ2UEs3Z2pHM09uQU5k?=
 =?utf-8?B?Q2szdmlWTFBWMGZ1NzZPaGZXRi9YUUJyZ251OStROE1jN1ZPRXJUVWNPVXJK?=
 =?utf-8?B?aWpmc25kSGdnRnl3YkJkTFR2R3hDOVVlcU9hRGR1SlowTVlNRVRzMjVwRWsr?=
 =?utf-8?B?YUQyUVBXQkdQWUZzRE5nbitQYURlVURkby91a1dWREd1bVREYU1ydE4yVGZ4?=
 =?utf-8?B?VjBnMmdPQzRuanhaUXNMdzh0a1ZJSFlLZ3hQS3FQd0FpMVA4VWo5L0daUkk4?=
 =?utf-8?B?OE5DTUMzR3NpYzhYRFV2dUNHM2lJVXVFTm1HbU5BR3VvU2hBYUFGVXNKdmRN?=
 =?utf-8?B?RHhQYnJvQTZGaE9PbmdETmFRMkhsNHcyaUFpcHkxSWdlQ0pWZ1p0L2daWFlP?=
 =?utf-8?B?b0hKQ2Z6S1duMUxqYW14QytnTXYxWnZ0eFZVdGtiVG90M1A3djVuU0QrRE12?=
 =?utf-8?B?b25WTEJBOXhOM05sbU5jOFhCUU0zQWlXaENPQlNXUzhQeHl5czFkMU01NEth?=
 =?utf-8?Q?6neJaBT1dRMlWv6mx+WjCitOB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71371cc2-8a2c-46bc-6a0a-08de15fa9729
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:18:35.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMgxftGSmuqRDWdR2mqK63DxgYZECwhWp8K2/vZfjnsh8hdHvjfRlJ6P4hxWVKK5Ic0QGGP+znFhr6yG2Jgogg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_011840_133273_B8064693 
X-CRM114-Status: UNSURE (   9.58  )
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

Add compatible string for the Cortex-M7 core in i.MX95

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..ce8ec0119469c8fc0979a192b6e3d3a03108d7d2 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,7 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7
 
   clocks:
     maxItems: 1

-- 
2.37.1


