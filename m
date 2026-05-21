Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46972CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83y5pKdH8NzRCqN88c/mzwXIs4acaJNTconqoUXqoZE=; b=tc9CR6NJmgBqlyPwBfbg9e9wXh
	M0sWdqvshUfswOonL3PdXXOWgfrRIKZQvn4olMf/Iakqw7RtSr8kHS1da2cr2DkEG+u9s81OL45lj
	hOYNTfivT/z1ZFUylCFJIRXPvYRhyUdaUTM4P2Uqs6RwH3Ixy1WZdTMZYLArDFKX5eKL2TS4CMo9L
	3bJB/Ry0VAMQakXxGsaO6YL5lKV7lyMUuKI6P0wnhuyZ0Ju6wp6Of6XLK/YNHb8S8YKq31QJtXxTG
	bC4AglQO8DJqJ5SsdyjM7/vKWA7VqLIgRqusF58cd4XSwo4/cMAzRYyHmeDJnhtke1G9c6bp3zQio
	Hol7YpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8sS-00000008snh-0apl;
	Thu, 21 May 2026 19:16:16 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8sO-00000008ske-2uX9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 19:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3H3zb5SDDuqPRRr+yHwYpz2mhHj4pUwKdf79YavZnQpWoVfr6zHhmXAwpfp1QvkK96pkUtEC8zXD+pFVPPKYs3jYFuTEvCB6Y82mabQ6tYOpCD0JS/1KR0GWw9NzxRGJNHcmWCicP6IJsKnAvuu2DPHpQrx7pkCHAdtlUJOKNv4OJu9YJGD+AH9hrTsDB7nTLOVdGKIwe/qggcsc95ioA2fAQgfHmgkyTAoKT1bWVf2k+jh+wQeSg7BZdKbYkiPDcNCxFnS71E5r4vlsaEvWJ8qPjXfJiwqW2P5yPtSEDWOKgK0o5I41omRqRAH1gKGc4zAhvcvuDAyZ2CFcGHuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83y5pKdH8NzRCqN88c/mzwXIs4acaJNTconqoUXqoZE=;
 b=ECcZeoa6rX8V/CT5sbXNhyzdGNzBNEwuPmofbTnjcJCAnzE2a8Kb4oqbgPoDfZQkT4X7lTqtKRBYyH/U6jRgp11U5dW4mzw9GevKb6jygeO3ENffamAEHx6cQmFdxk05FwzftDwKSTQpDPW1ueAe0zca6RBq0bxoJeprgEmXD5xF9D3bkUL8yBY9/XjSAmTN8CQUQsp2Bpl1l27vMCoGMd76BcJT9gQ5TVM4zlx+iatZjBKyGnQyhFY8RgVidAJwVSxx8k2hBYVcvRn2bAwDygw6QLwfNX7dwv4RXeyhzyowVMm0oiKyH49YUhUlDvLqAVAI0OWVGOu4sg/behIUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83y5pKdH8NzRCqN88c/mzwXIs4acaJNTconqoUXqoZE=;
 b=GSK9eN6tLCeUOD3Yv9P8b/1PTjUIIs+gSbcan0lMNaDBjbawF4vSyg86CSlnSgjSovdcNrs7uen0p0UIO4JC892N+ac+DB1c8E+fiqbFB6XlkdN0d6PRwBLirD+5VtdQRO6f3O3m0OKdCqWuNMBB4CgYLhXWMkayOoqZKYVhULl3H12wy9Z2DclRFOsEtK5qzoEgD7sN9Eyj7wNk/d9z46f9pkLAQJpMAnBpAnLIDWh4PSsxcGCGkh2PmPYiB6pPoqRKLsQGcNILfqDFQ3sXrQ9QY2Wp/ckvUcSOtP6XMqeXyG1BTaWfx4HlPEHC2Rann2RSjzEOXIWo35WKBMDgEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 19:16:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:16:08 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 21 May 2026 15:15:42 -0400
Subject: [PATCH v2 4/6] ARM: dts: imx6qdl-tx6: remove undocumented
 karo,imx6qdl-tx6-sgtl5000 and keep only simple-audio-card
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-imx25_dts_simple_warning_2-v2-4-c6557df516a9@nxp.com>
References: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
In-Reply-To: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779390945; l=1393;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ow+O6q9QCCndU93/Wyi6kLKPEZK55H4d2GjSoUWcjL8=;
 b=cYVEhSf1/f7BUTlvKSNLQgJSqmNi83jKNrtlj9mGjLYrhaHXURLB6tqrJ/1KGGeI5vZq4myvc
 E8h2SNHkLJpAZy7IQdpfNxj2IdP76Bq++WPFJ8oZdVdX4qDrqRmMvu0
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ddee4a-401a-41ca-14f3-08deb76d69bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|11063799006|18002099003|6133799003|22082099003|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info: 4A1BtwvTxKVAjH8RNSLKjFHRLlaStXxiCkQ4OuBByi6HqKdVrUsgbCW4c2NcRKPydMoCgABv2XbJMlWcWuoQmMfHItyoAGzy3BDu+wHxCK0h6680OZnZo4sP77BUxQPl+ilFLRk4h/FhzrFlgvFxBpsS2yihEeJHRyEO3mC/UhaOYDd3ktjM+B6/bk40GP7pdVFbYIjE7jd8tuPSbhSLeWmqyXnugA7wFLqGP2sHEefajqlLbYUU4b5R8+csdX9EPA2wB+QnyJFpWbxnmbZbYhEyjnVwJe3aI6peetXvYLG/EPUtoADa651MttLGWNqP7Kdoruoe2JvxTG2imZFSEECmhBJE+Tc2PIvatKQszOXaQ/suIOPjY4Wqskkp8VGlhQ1z9Uo0u4QZaot87af0NFWpCDx9axNogLL0Ug/PYvdQTwW+ffQxl+X2yroGQweSinvrqhHCDnDqqIVn1jhmjjhuMQZyH8Z+JCtBCEoPD+yktgY/ZBxpTIZfkgIDt1A3Mb6VLtxXbsNFJb4seKiFaig2GVX0YUiyYqk5yprMJgn9WLOl7eoFeR4F29ZG8AjsXdr09LeCsUc+uvW6ic81j2e0aioZtGbtJmDMVrdBEyXD9ihD9diuUPtOQlz5jZuEz5FtrODCiN3dM1ZsjPIOLXFwGOaW4joqmhk1dAaLzkAhM5ktWodBydXsQgETafWg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(11063799006)(18002099003)(6133799003)(22082099003)(56012099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZzV0M4a1BwUU9JOFZBSjVCQllkYkxzVXBydU9lQ01MekRXY09xaXRaVERr?=
 =?utf-8?B?TExZVk14ZWNheWlmdXhEb1d6d2N2OE1uUmJaZEYzdFN2NUlTV1Zoc0czWkV4?=
 =?utf-8?B?Rm12RWhZOUtaenRpZVNES082YWRweXF3L2VNaTA4bGkxZXkrMmxyTDdYeFJJ?=
 =?utf-8?B?b08yNjRGQUZLL2pmSHRSQVUxM2hHSk5XSHhlRTQrNndLK3lLS093NzJyYXVU?=
 =?utf-8?B?bEdWVTN3RmoyNlVLYyt3TEFVell3SWNXNlRTZU42SnB3NVFxK2twTmllc0tD?=
 =?utf-8?B?Y1pHSUc4M2ZGM3hNOHJuMlhndmhZRTdDUys3TkNmNHovQXpGckxYdzJyYkRR?=
 =?utf-8?B?OENPZWd2MmZoVDRGdFFBd29xQzlaWTh4U0EwUE5ta0FpTkUvZjZZdWxVaTg4?=
 =?utf-8?B?d3Q2TEo3R3A4UTExcVV6NEF3cXR3Z2c0anNlZHRVOU1CM0h6L21RV3FvT3pE?=
 =?utf-8?B?V3FZTDJXM2F4UlFNeW9yajQ2NVdiL2JxKzZWMy84ZGxXQmh1dEdNUzlvRm1u?=
 =?utf-8?B?cWhaaXB1MXMydHJXbk9nb0YxSlQ3cjI4Z1VvZlpGUE9wTXFnR0lHaGpmUE1n?=
 =?utf-8?B?UVc3azhnck9vbUl5OG84eVRuRGNxUE9aamxWWXFnZWdxOFdhR2N2NWlrOVJQ?=
 =?utf-8?B?UEgrQS81aHU2S2svYkhxcVVweEdHWFd4V1E2VCtsZlc4bnR2V3d6MFFyVmJi?=
 =?utf-8?B?ajRCMGVqdmdjeXh0U0hkRTl0UEJ1OE9xQ0NUNkFNUUtZMWlBS0QwSHY4QXcx?=
 =?utf-8?B?TzJyVktJaEdwNUMrVDc0QndFMnowbFVEd3dXUUs3Rk1zeU5WS1dhdTh2R0dO?=
 =?utf-8?B?czNXQnBnN3c5OGRJUkJOekRsY1lqRjNzTjc5SnpSNjJXRGlJWDJNeEg1RGlJ?=
 =?utf-8?B?aysxczVyWENjNDZvZHJZQ1hEQVdlcmF6OTk1WW5Gdy9kRGpRTkhmNFM2R29r?=
 =?utf-8?B?TkpSaGpvdTIrcmVFd2xnMlhOVUIrZC9BRjZseGRJRzB0bTFlbUNxR2xaMmxI?=
 =?utf-8?B?M3RCVGVhUEthRXRYL2EvZWJDUmdHREI4b0Z6QVAvUmtGU3JMZjhkWlZNaVZY?=
 =?utf-8?B?OEoySmFYNzZmY2hldGk3Q0h1dUFFYS9TU0NiT28yNFJLbFhDcVpQZERyeEV1?=
 =?utf-8?B?a0VzWEwxd3E0U0c1YWxnRWhGYU4yYWUvMTBJRk9UN2dUQzB1M2tON2JtbEY5?=
 =?utf-8?B?VjVUQk9iR0MwQXVKOUpNMlI4Zis0MEFTemR3NHQzRTNaNTN6U3hVRkdzaEE5?=
 =?utf-8?B?ak4vSysxd1VQVnlHejA2UmZvVFFDWFF6M2ErRmFqZ3NTdmhpMkh0dHd1enV5?=
 =?utf-8?B?Uk9KUnhxMGZiR1cwRnRaYnQwcy9KWFRhc281YXlVSGNiQlhYTnppWHRzSjda?=
 =?utf-8?B?bmxqSUNPejVrTjMvRXk1Umh0MUFqWXA4YitrRnNmNUg5S1M2SEJtcHJTSFUw?=
 =?utf-8?B?bFA5UEJEZWkrOVRKWUVpNm1CanhaTkNkSGNVMURwelZYUjVGbUZyMnRvLzMr?=
 =?utf-8?B?TW82ajlRdDB4Z0llSmx0WkVMUTgrZFN4dy9DdUZ4Y1FXSkkwQ3hoWnNxSVdt?=
 =?utf-8?B?WEtHMjgwQ0IxMlNpUHdPTlFneTZwb2crSFhqdS9Sb09aMUtyOG1vaHV6V2Ni?=
 =?utf-8?B?TmtKRWhvMGw3blN6VklFdGIxbkEzREpJUzNtMUJ0M0ZKdVZkUzZxOTRrRGFD?=
 =?utf-8?B?d1o5L2x6NWFEcHgrTU9SOHNLNXVUdUtNS09zSW5DellLUkFva005MVd1ait1?=
 =?utf-8?B?d3lXaTFnTFl4VUN4aDA2UkVzTFlwTi8vQ3RzVUVVejlCNzFCMFJncEhjWlcz?=
 =?utf-8?B?Ylg2V2xsNlhvYmNDOUcwRURodEtJTGhMSDJ6THA4bVh1SXRhc1VOZWpyMTBa?=
 =?utf-8?B?REsvMHFKeUVHWjdxMGdKUXVxVGlsa0p1anF4SVZRNnp0VXM1RmFxRU8waU1r?=
 =?utf-8?B?TmdncmFKaFBCT29yM2w3a3I4em8rOGs0bDE3dGhMRU52QjdWaG9EZ1JRS0t5?=
 =?utf-8?B?ckxxcEtiY24xTFNLeWx1OG5Jd1pYSFdndGR2RkliWW9JWkppZ0NsSzZLa0lS?=
 =?utf-8?B?T0JXYnRpMXhDR0RKRVEvdXZ6ZCsxVk11aUI4RDVaeW54YWFrWnlpS09DblNR?=
 =?utf-8?B?OUJEbXkvbVUxMW5FbWRlSkhHNUhCeHhhaE53SFNsbTBFem45dTZ3NnpzS3Zk?=
 =?utf-8?B?aGlrMjl5MGlFbW9IR0FwMy9JVVROdDNmZGRUc0tLRlRkTDZleXUrVmo3Zlhx?=
 =?utf-8?B?WGJHcmdpdDF1dE9RUzFSTXpDQWxEaGJBdlBpaTdKUmkrSERzWkFEdmVSMUx0?=
 =?utf-8?B?WGxCd21WNHFjOUpVcXhtWHcvS1Q1VFFwNWo2WFlWdFhGaXRSa1JWbDRiQU95?=
 =?utf-8?Q?hZ6uLIYUauG0aJ9M=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ddee4a-401a-41ca-14f3-08deb76d69bb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:16:08.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8BzBrROwpTi9WuvE8J1POJDz+JrKp8wKym4eSJBMi6t+chbU/W3p20sPo5BhyVu+QenRje1AcVyk4p8WD5Ox5GbyMOsnReQ9ByFdQyxO8+Fx8gJqNNwJ03umDcO/c2v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_121612_748166_1973E30E 
X-CRM114-Status: GOOD (  12.39  )
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

Remove the undocumented and unused compatible karo,imx6qdl-tx6-sgtl5000 and
retain only the generic simple-audio-card sound configuration.

The karo,imx6qdl-tx6-sgtl5000 compatible is not documented and is not
referenced by any in-kernel driver. The audio setup is already fully
described using simple-audio-card, which is the standard and supported
binding for this hardware configuration.

No known users (such as uboot) rely on karo,imx6qdl-tx6-sgtl5000.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
index 57297d6521cf0..ec1528ff3ea01 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
@@ -148,8 +148,7 @@ reg_usbotg_vbus: regulator-usbotg-vbus {
 	};
 
 	sound {
-		compatible = "karo,imx6qdl-tx6-sgtl5000",
-			     "simple-audio-card";
+		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx6qdl-tx6-sgtl5000-audio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_audmux>;

-- 
2.43.0


