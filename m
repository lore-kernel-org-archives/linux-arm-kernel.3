Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625EFD31A13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 06:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5raDQlkD7yngFUbUr+tX5GtVA0zWyQTAsrSEuX57wg=; b=Spy7kbmGZIr4U2aTasmlO0NlyM
	lMNAA1rk5igetlujBLF1Z9SmL9KI+dp65Hm1kWJ+9D1E2kKIr8e+GJepK2HFEZ1SZcUxNDP3crZDP
	gzL4H/f979k1ORv3S3xqRk4Rjd36iO0JxdPIwF+KAifAf4Q/glLsYPcRsqr/KWHhPnaxiPf5A1F+j
	SgDBh3373b7ZC0tdTQOmGEfSVJpmMi/JZTPes6+xf90udvbxGmxMBxZvG5IeGcL2uCxIFLv8yNJVj
	2b6ipKMmHteCAv94IcAil7YtXi5J898i5eiGIHZ7s2MwcHk9QKXCqB04Sr2kz3kQgDoGHIyjCvrtQ
	+BBcy0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfui8-000000089Dp-32gs;
	Wed, 14 Jan 2026 06:50:32 +0000
Received: from mail-northeuropeazon11011033.outbound.protection.outlook.com ([52.101.65.33] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfui4-000000089Bs-0NHR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 06:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMQiICliNxVxHgdp2/sQCEqEdaKzDouC6otprejz0zqpMosYrvEgBDEF7GSsnWgup8zVOu+tB/MG2d4FhsT92mIlbYDGrRz8u8cF4FbTe5yh3cC1Azg81nSrQTo7qQqTV+4NAYG8wk6moEghVDRQDGa+UI7905Tg9dWguv4iOQZHdJw4UYG8NUoL5qtFTLL7UD6y1ZMvhV2v32LwDoTesUD1HnpGbNmmQiyPLendV9PnBsHwlF7AdR45h6RyUdiQ2kegUM6wk3z0ZPHwcwMrRqgmfxo/0d7/GC2GRrGazcoQzJP+nFDAEkDtKx7uWkGzHFOt51nFXPRkw7hD//emEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5raDQlkD7yngFUbUr+tX5GtVA0zWyQTAsrSEuX57wg=;
 b=mjfyVi5fsBVVgA/PD1TAQq7xbxyIbHhDqjX6iRdeNYN6MjXdObzLDbWYbUxlEe2cYFPZ0r4r+9F5cbVhDJQMQXEiR7kTgSSoaBvgy0BrYqtUiEX6wzgdw8Jm3efMHJjKDPTxCv9VfL9RXKVYl7b/9MUvEkAQIgbI8MS8pGJd/5EdPtHvWJT7cMT41qhhWX/VSadrWIYznlEEWue0hh7F6+Ec8nGXcRylAEwclhFFjhWx0ej7B9MODaguRgAVfPQ6hutFK+5csxCRqP77jv2Jd15Ei4/MTuijxeU+Yng94sD4jt4h8lZk25yMb1XacYJ++BxQe14uMn1a+wmmLv6c4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5raDQlkD7yngFUbUr+tX5GtVA0zWyQTAsrSEuX57wg=;
 b=PIg6tUhzOidY1rAJWebIXBEzQeTEK8nJh4PvtSf1LGevbaDkPNuSnTDseadUjGGYUnpdwCMPUX+da56kWf23i47h7zST3eiDluZArvOlV37lbfr9n4F4btY2i9lsTC3y/MPFlcFChDLjgFif3btMNa/v1xJUIPPmZxpOh7C92cgyeYqLEBHIETFp90a56677RM/FCyDgCIlDjiZEZJMSljv55f78XtqvD7tTrOJ/D5S03dCysXIHkNwUU0kspQptcHPdYDA79fxuV3sWmQZtqqZgGhukgbjwftaltX1u/SSq3dhOBgbVGDiJsyk4K9aT1ROIb8AhFcSK3Lk/wk0TSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB8673.eurprd04.prod.outlook.com (2603:10a6:20b:428::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 06:50:24 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 06:50:24 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 14 Jan 2026 14:49:46 +0800
Subject: [PATCH 2/3] arm64: dts: imx952: Add xspi node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-xspi-imx952-v1-2-acc60a5a2a9d@nxp.com>
References: <20260114-xspi-imx952-v1-0-acc60a5a2a9d@nxp.com>
In-Reply-To: <20260114-xspi-imx952-v1-0-acc60a5a2a9d@nxp.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768373406; l=1384;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=JpK1fytQJsXl7vqERID6Dn4XLt3B6rT7sru0HwqAS9I=;
 b=uSdN9OGbmQ8z9iLOZ6EMp93UiYMduWPNllF5TzySyNrzAcDn/ci8xTNYbsxupwno0PZnBgRJ3
 mhwohpqfGJ3CNlQed/A3U1R1bFPJ8thY/lWG3OaQ4vfgUWKHzRv3JcN
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS8PR04MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1c9e49-5002-49a8-7c03-08de53393166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTAzVVdINER6QTFLTk11NjNQV0FZdHNUVEdwdnArTW5VUDVwNm14T2UzY3BI?=
 =?utf-8?B?SjBCT2ZFd1hiYzI2MWxzRnlqT1RMM2lEQ05NNllwbUVDWEJrT1hKdFEwVFVK?=
 =?utf-8?B?U2VuQ1FlUDBTUUVJNXFxQWJnd3lQV2tPa1VJazQ4RU5Wcy9pc0J1QUtFbDM0?=
 =?utf-8?B?QUxiZm1uUHd3ZjB2cE1WUlF3MUpLK0JBZUpMS1FLZzhiNVF5Qi9MZUpsc1U4?=
 =?utf-8?B?SnQ4UnFXOG1LUHgzejd2VnBFWkZyNjdnblJoZGRpeUZpWm83R0pWZ0U5OTR2?=
 =?utf-8?B?bUdTSlZUT1dwd200Sjh2dTJrdk1JUlJXQWVxOVQ4T0RtL1gwSXdDVmptWGFl?=
 =?utf-8?B?Rnp1U3Zud1RwdVdwam1MWC9ycWdMSmgzdWN1bjJXYm9FeHlDYkkyNzZXdnJO?=
 =?utf-8?B?YlBxdXlnNTBvRDRpZTZCQWJ1c20yNGxaKytleXQrQ0xqbENHczFMTlVkeWpK?=
 =?utf-8?B?Mzh4djMrR0pzZUFzT213K0RVN3JZMGczck1odHVTZ015U3BSa1FLUGYySUdV?=
 =?utf-8?B?RjRmTVRrVFFzeGlNMlo2MlZtYzk4NUlLb25MOGZ5R2w3L0VUd04rMVpZT2Vn?=
 =?utf-8?B?c05udXhIYkh1ZDI2b3hYTU9hRUVZT2xTQmsxR2ZCV2F2ZGMrQkFINTdSOXNU?=
 =?utf-8?B?cUZhMm5YcWo0Uk9WZGsrT3hiU0lOVklGNDVsMEZ3ZzBnVmFLTTFjNUlNYUts?=
 =?utf-8?B?S0VIQ1FQQ00zdkFyUUY2TXZEUGRuN3owdkt6eWF2SldvUTNlZHZtanE5cU5x?=
 =?utf-8?B?SlR5OXYrTE1ZUVVxSWpLNzM4V1NSODZWWDNSMGhLSjJWM090dWlaNENRQzc1?=
 =?utf-8?B?QTYvWVA4OGNuaDNJTFdEVnlkRDlGc2VWL3RLK3hEbmd4d2Vvb1pOSCtQV0gx?=
 =?utf-8?B?bk1vek0remRZbG00TFB3S29WOVNCZmlvQlFEOFJuWnU1eGZ3YWZVdWNJMm8y?=
 =?utf-8?B?Y21lcE43dCszYXdxdTlTa091Wm9IRy84QVJkTEN4ZUZpbjhmbzNWeW5hTFh5?=
 =?utf-8?B?MTNOWEdUSW81VjUyaDROU0hod0psV1BINE01UDVBalJEZ2daeGRlZlRzNHNB?=
 =?utf-8?B?cHl6RGVwRlFjLzNtcEZYUEJOa2pTRm1mVzlrMktsM2MwaFJXVlFEY09INlNE?=
 =?utf-8?B?Y0pjUFFzNVcxSW1LczJuektPNkxmK3N0U3RSR0x2RlFFM0EwM2Z2eDVIbU01?=
 =?utf-8?B?Q2VIOE1TOWo0cmpjbU4raHlGbWxXMkVwdVM1emNJR25DQ2ZsekQ0bTRXb0cr?=
 =?utf-8?B?ZTBBd1VPMVoxa1VFRjQveENQMkVSYlpYcEFPaEtObmdHbGhMdGhLdDhqa2Vy?=
 =?utf-8?B?S2FCYVkwdVdFem9HNTR3N2R3VnRVTDE0SFVCSW5LWndvdWZtSjhKWWhoSTl6?=
 =?utf-8?B?bG56K3RzaXJGQnBhRDZjNGdhbmE0dWFhUHU2VTdJbEs4dDNDWDg3aDJXNGw3?=
 =?utf-8?B?YVdMbzNpSHZhKzBUZWxXT09OdnlyS1dVdzArMG1hM0pUUG9DZEtwbGtGT3dp?=
 =?utf-8?B?Z2xGRXIzYlNUczlGUVd0LyswODdnQXRPMWdwbE9uWVIwbzBoZXRuK3I5SWZ6?=
 =?utf-8?B?d3lNaHM5Z2R2dHg3d096S0lDUVMxSUo1UWsvZE1qMGhLODJZTDViTFA4QXNX?=
 =?utf-8?B?ZVkzV3BsVGhnOVVEUE5haGFwV1BudUVkWDJuU08vdXM0QXJLV1Y1aUpENUhZ?=
 =?utf-8?B?RTFYRVFjaW9QUWFkNlBjeTc1TVhZSi94d1ZDbUNPNDNISi9nMVBITE1LdDRJ?=
 =?utf-8?B?SlovRllQZDMwelJQNmtzMjBLeDc1V2hCZVY0QnJITW8vUEZwWXprNTBPNGZD?=
 =?utf-8?B?UXNraytCNnhGL3ZHajFvRklSV1l2dGFRQnpSWVo4YXEzNWRKTlh6WWN1RHd0?=
 =?utf-8?B?bG5KZXNvaUt2aCtUWVhsdHUyNEpyU2Y1SEdkOHA5NURaVFdKRXRtS1dUdmM1?=
 =?utf-8?B?cGVaVFlUVG5jclB5aVlSc2pDNDlGTUgxYnRaWG9SdDdNVUlFditJUE8yWmNl?=
 =?utf-8?B?NUd3aTlsdnU2RVJ1QXcvUWs1NHdTV0JpWDlFOWUvN0xac2lpRjBpR2pQbjBF?=
 =?utf-8?Q?quPut5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHprcVd3QWlVRmY3ckpXemM5ZWd1alNaSC9ha1U5d3UvaEo4cWtnenlOMkJl?=
 =?utf-8?B?WmE0RlVWZFlZUFVGU3k0QUlkZm5MOEllMVBtcFREa0NKcU1Jc0Y5OUwzU3VD?=
 =?utf-8?B?UEJ0dldDWWVaZFJ2alFHSmFyczYrSG9Nanc3NlNmREFkV1JUZzA1UUMzdlZ5?=
 =?utf-8?B?ZWd4aGZsNXkrZGNpckU0U0IxRHk2ZmpJQnZkZXcrQlI5NVVrRi9jMmxob1pl?=
 =?utf-8?B?cEtKVG0zSEhySFZvZ1NyZ3ZKVHExcGVaQks3bGZPYTE2dk9HR0o0OGR0UXUx?=
 =?utf-8?B?RXowMUFjWmJ5bEhTU1NXbUVCdXRaekZLTzVaNml5bUVpa0NJaWRHL0c5WDJy?=
 =?utf-8?B?UHcvcElqanFpOTlIMVIvV0w1Rll0SGlRMnZXMHN0VFJ3cHRGYlovZGVKT2t0?=
 =?utf-8?B?TkxOWXJHYUdRTHJaOElyTnpwbE8veFlnSHN1elRTVWt4SEpndG5KS1JHeGtI?=
 =?utf-8?B?Z2U5WGFtdFVocEFVRW5qNVhGRFFSYStGZnNqNmdNS0pVQTBnRGc4M3FscUk0?=
 =?utf-8?B?SUNYQmtRR05VWXA4OCtUbWhxdzJ4amFlTndNOVB0TlhrRVJ6bU9jVElVNGJ4?=
 =?utf-8?B?ZzlXcDBNSzM3dDVrZXMyNzNWY3V6dXZ3a2xRRGdUWXJlNE81VU9uYjJuR1R5?=
 =?utf-8?B?QVRzM0cvV24relFjVWVuV1AyZlovQU5oWVpGc2JFOVNHbG5BU3Y3bzU0UmZk?=
 =?utf-8?B?OFBMdGRQZWVRQ3NVUGZZcXpOcktsbkx4bzZZQUpld0tYSXF1QzNvdjVuYXND?=
 =?utf-8?B?UnI2UXZ4VDZxNkgwRDhOMUtnenREeGtZSXF3VFcvWnVjNHFVRjE2TUFyRzY5?=
 =?utf-8?B?Z2RDRE5DZUxTNm1ndTlQT0w3N1VlYytqQlBiN0E3cFpPRnVvejVSVk4xaFhh?=
 =?utf-8?B?RTQ0QnpDdGZwcng0QjNaYUVieVM0Q2NFMHpGb25BWlNGNWdUUFdUL3Bld01G?=
 =?utf-8?B?aytFdTJKSUszNTgxWHJVVmI0MThPQnpGRUpzMngvbjFuZWtkeVlObW1KaUxN?=
 =?utf-8?B?NXVob1hOL3VRSFpDVHRLL1E3emNJV0wwcHpyVXY2ZEZiZmhvVm1NZWk0eGNp?=
 =?utf-8?B?Q2hTUzlxS3djUU8wOXZ4QnE2ZXRqTzVFdW1jbS95bkRVaFpnSlEwbXF3YUN1?=
 =?utf-8?B?c1B0RGNxYlFiQmxkcW5YeFBFMUNQOWtNSFdYTE5xSXBmU09yL2RBc0s1ZFFR?=
 =?utf-8?B?OUI2TC9WYW9CUFA5cnpjc0JzMFZmS0xmSWdLbGMzR3JCM0NNeThQVWtZeXdD?=
 =?utf-8?B?djExQk5aOEJDTnUzM2FuQ3dYT2NCYlpBQThYSmNFOXVLbnZCVEk5dXdlWWw1?=
 =?utf-8?B?a0lMOUNkVExTMWUyRU5kWVZXMUlYdVBYeUx5RU95eURtYkl5ZW9JSExQN3E4?=
 =?utf-8?B?aitZcWJpVHlTaU5DV24wbGIwMm5mZ0M5dEFPU0g5MHNVb0ZBRElLeTkwN2lv?=
 =?utf-8?B?NlJGeTR5Ulk5NDFaUm1lZHdmWit3dzBpaExqeGVCcXZBaXIyQVAwRVJrNVVa?=
 =?utf-8?B?ejRzNXdVa3QvMXkzSTdweW5MaXkxYkdYU2lkK0hIb1EyeVpXb0tra1hkb1dp?=
 =?utf-8?B?a3NFYncvMHpId3d4cEpSYTNzemREVFJ4dnVreE5aRFZnUjIydlVseTV0SlFt?=
 =?utf-8?B?UXlEZ2IyaXJZamF0MFFsNXR3Y1ZBUnUzcWJ6WTVsZEowVFdyc0J3KzMvcjQz?=
 =?utf-8?B?a090UFphSFFuOUo0ZkpjVzZSbmdrRzN1bjN5QkNTR2FJcTU3dWY0Uys0Zy90?=
 =?utf-8?B?cU44Wjl0K1lRcXpSMnVGWjhuTVA3RGZ1NjJwZXAyeDdtM1NLZkNnaTFFTzRl?=
 =?utf-8?B?TzdqU3FKenQ2SlpHT2xWZDIydGE2ZDhLOXlFN0E5RGtOeHVKQTlYZ2UwZGdv?=
 =?utf-8?B?b3dzcmJqbUJqdUp3WUtVc2JmNityeXROdGpJMldRVnlXQVJRM0RuRkU4ZHJ6?=
 =?utf-8?B?NUgrQ3FtUEN1Q1VUTG5YYmxiQmsxc0JQMzN6UUlydFlEZ1VvREJkYSsvUWJY?=
 =?utf-8?B?dnUyTG9CNUVtUmhoMTc4WkgwWGNwa0FiNFRzMzRuWFBnSkoyZGFGT2JvaGNk?=
 =?utf-8?B?ZDIvK1M5ZUs0VjJNZFlMZjVUZDk3VC9uMEJUc1kxdlZJQmVuUElsVmVOTm1w?=
 =?utf-8?B?eEZMRjBYbmFtQ0wweE5DSXRPbkhsWXBERGVoR01NOEpCTlhnN29KR0VFYmdY?=
 =?utf-8?B?TTNTUUJsNmZVR1FpTUx6MXdpWXRIdGc3b2J0aGs2SDdENGdxOXJIMFBZN2F3?=
 =?utf-8?B?REtoZE9TdzFyeExuV0VoMVgwUmxOM0dZVVNSdEdRaUs1V2VTTk9nWEcraElq?=
 =?utf-8?B?WURwNERabVZHcmNXZlRiZXJIS3dOV0JGdEZSYTF4N2xTR3FYdEdFdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1c9e49-5002-49a8-7c03-08de53393166
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 06:50:24.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXMmMayUrGiGb8+hHW5RrwQLcB6VplTi28GT4seqPD7qokO2dAx7OQkRrH0vd7z9tmjLjZwt52MiEYeePrJweg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_225028_137183_0634F6FE 
X-CRM114-Status: GOOD (  10.40  )
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

Add xspi node for i.MX952

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 33bde271d394d19407562f2a427a8a84b85bd679..0642de798973dc61246e4728235772f7c005ee98 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -654,6 +654,25 @@ mu8: mailbox@42350000 {
 				#mbox-cells = <2>;
 				status = "disabled";
 			};
+
+			xspi1: spi@42400000 {
+				compatible = "nxp,imx952-xspi", "nxp,imx94-xspi";
+				reg = <0x42400000 0x50000>, <0x28000000 0x8000000>;
+				reg-names = "base", "mmap";
+				interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX952_CLK_XSPI1>;
+				clock-names = "per";
+				assigned-clocks = <&scmi_clk IMX952_CLK_XSPI1>;
+				assigned-clock-parents = <&scmi_clk IMX952_CLK_SYSPLL1_PFD1>;
+				assigned-clock-rates = <200000000>;
+				status = "disabled";
+			};
 		};
 
 		aips3: bus@42800000 {

-- 
2.34.1


