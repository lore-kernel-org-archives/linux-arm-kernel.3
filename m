Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5E710706D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrQMg7KzfUPcLJmLBqVq9K4SwLir8J2qCQufvcigCg8=; b=qiLhpjMr9/Dblu9hiZ8rmv1fmK
	+OiPNj02tTD00KaF6UcIXlQXgdKg2vpNy9UYfPDNiO5vWChLiCKBYW4A9GYcmwd2/1mdPixoOYPiW
	v3UWZaRwOPSOY2OtFQ28YJIN1NTb7JhLJUZkRM0Sk4cEtEXukXhm642wXKHqsz33DqkiGhMKjO0U/
	h1lxBd01fNcPLA9ldiiHv+LOszaEWa1k5ebDfidpncugcIWA6PqF+LIiR+HMHaGZapG5MWIvU52GM
	ryBsvr2AO+U/irE3TuyeQnDwAdRRwDvfcU2AvD/AaBxI792VGAcGqTUYUzeX/ph0jIqB8Mp0wPvBq
	4Z9HEkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OSs-00000001rBd-2Wsy;
	Sat, 14 Mar 2026 12:51:34 +0000
Received: from mail-swedencentralazon11013027.outbound.protection.outlook.com ([52.101.83.27] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OSn-00000001r6V-2zCZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:51:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0SEbmhXDzApeoFaX7SZ22xrW3uYRA+NA6nRom9M/YWWmQnsL2HnJbMw//Jw2Ax+e7E6fMu2mip9qCHSGD4yWf9oV/xfvE5cLhXi9RrsnDSuIoId2lde0YJFdNvTU0GDYEPC4YQVJ9y4phIfDXi+hJwQfgL1wlHqVx2HLU8Q9sWGsMP/SHmCRnOOV8vsFEj1DvBhz034KWdRS1yQTvDXLh/+pY/ITUkksZO56WfYwxxoAOipPrj30XTGM3wWyp+62OZVkUs2BT3Zusa5fYdJRHHe42VNik64lzyzdMmoaAWe1kOG1jh2I5J7oVQcumKd/5ULU84cm4TUtF/OKtLq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrQMg7KzfUPcLJmLBqVq9K4SwLir8J2qCQufvcigCg8=;
 b=wQtjq94oIOL7KEy0xCvEN05dmJI1NaLsZP4NAFsJkF7GcQrt/kUhTdwZfJv/fkSk2KspOvOgU3ZSztm6Zwsgb15W7s/iRDs8sfeaFsTQ/roWA99/UqYjY0nYEXhGbDlHeOvW+CaQUE5y7mhDWaR2OpNAdda5Lq7wfwzhyxMnD+BauX0s58UeSTsm+H5oJhNydWxtH9KeFpxLnTfbvkAb2y9r7Q2+XENgXEENs9U5HOIpHezI6GprD0GzkRn016hbXp+bLlK7cJBGvqll+gCe6AlOuhi4c6/FsrgWqxhS0zIkEuZzeep12hmXG6eloV0b6i5/Fix9eodBSSRHhyefEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrQMg7KzfUPcLJmLBqVq9K4SwLir8J2qCQufvcigCg8=;
 b=B8OMDo6IhiOjZMYCgFHcvqO581MSEQkQSmqZVafvKcozU7CqNiK2s8J7zge7V5tO4DrRrMUt1worVjMZuvwujCxTSD3bIBCGmeSc43kZU37RuhiHYl+npcRt3/0TACVTrFRHK86MKKZVNlHJaOOyM09cXAPGndUJRXfLcMVE8sleGOrtBPgl54ZmlJ8sBNbPreoB4a2hwL3vLk98wdXnHvQGmGI/VP/3JQUvhVzQZbbwZK61rehZRdk/LORQ/e+zpqLBBhPhq0N2NjRS/xj7cGg6EFxpCGFVpixOaXEnZPDVr0fVyDmGwpWq6HeQkW0ow1V+qM6inM+Zd877hqn2jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:50:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 12:51:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 14 Mar 2026 20:52:41 +0800
Subject: [PATCH 4/7] arm64: dts: imx943: Add thermal support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-imx943-dts-v1-v1-4-3ba9b426863b@nxp.com>
References: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
In-Reply-To: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c977704-898e-4ffe-878a-08de81c8649c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: RDIaZ41TfPrOocaVrb+ZQ61Hz7WYhtJ4t5G74SBvjzAqBYwCpjKHUYOgSH8fXwX64RJUZpd+m4zd4tQzPErrPHVk9giFiqAWN/CiZOzfqhgZctfPLNb304aPVTQrlyYpRT3VQUbwpyIGGJE1ocMW08FCjtwUhK84kPpycsyuEzKMNrJySjS9gbg5nkVEsjbQVUwyucrtSSM/6AvwIdSQvpwEkAJA9MczPzd1uRDC/OaZYd4hk9TxAuLOfHaNqTyGF3k4it472nbu5YsdFhTtMZdAJxJus0SEZg5IzG9PAnjrYtz46JFLfdm1iVcpm7/3OgpSTwX08kdtlQdC6yitTg2YNPmHMajbFMbW2eaSckxPZ3Pc+D/6cW5MXpsSsA1BeImnlC8bmPiHTWQTj6SEf0xFki/rJeSGiRWDMJjxp2HsdEvuzszi6G6IM/oqEvB/9we7U/+0XWvd547tkcvwTfhcYxoxBgvfA8h2+5r99um+UOfczVrD9SSpm5BRPR21qUb2tsq6GHwCEm1gjxt0lxukT6KKgVIY4Cz6hFCr4Iq87h+A1IR/3z8qCJan2dZaDQ99seglby/Z/BlP1PsNvOOWwhUAJNKHk42lBpE4XRK1rwh49kucaQxedaQUdBzkoZO05uS9yHK2ngA5nh3OeyCS6fST5+h2WRoszcfx4DDXmd5J4l6cm4EB41ZnrzgwjrMqjtuiG1msGGkwCM8uOUFuE1D3FvGoYrt9lJ6Lyqk6KGU9aLRcX/wKkR5xhpQYEPWj7zA5yfoScqb3fcGQM6krP2pBCLQgNp6NOrHmuDQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZkQnA2bjNaNXQ0L2ltRm9oQk5LMGdFbk90ZmhxaVBBVnVQMkJBOEowWjRM?=
 =?utf-8?B?VDUwc0s0UEQyUlNRTU9kNDNNWXhBa3BEeDdSSThib1FxZnFHVXZpKzBRbjdT?=
 =?utf-8?B?SHJ1MVNmbEtRTHFZeUdxbjc2VmNOUWlQbGFwWTFoTGdnRlhOei9EcVhmYXJT?=
 =?utf-8?B?R1RZZEx5YjNLcW4vNytHeHlUUjVTc1hWcHZ0VEk5ODA2Zjk2QUdld3hEbmVH?=
 =?utf-8?B?OVMyTTBZTDZ4Q2NHWkVyL3BkN2lSd25EYytCTWs0Ly9OWTNGdG1PVU9wRm9H?=
 =?utf-8?B?N21CVTBkaEFJNCtmdm9xRnliYlFSNDBWK1h6RXQ4dU9DV242bko1ZlFFSC83?=
 =?utf-8?B?NVhCK2hKeWRjbkc3ZGo4bW9CYk9FbnNDWm1PeEdmei82TklFdkFQalVGaU5t?=
 =?utf-8?B?MlorQWFqNUN0VGFhaDJRdFVNSEFNM1QyTDU1dXhhcFhXRVY0cDYwYXQ5R0hr?=
 =?utf-8?B?U3ZhK0sveG1qSUozdVhQL25rbkgwM2hRdW0vUjVwZEt2dmFjdGNxUzhORUNm?=
 =?utf-8?B?TGVSa2RMckQrai8wMFNWOG8rTUdScjRocGsxZzV2VzZKWUxFN1pNVVJlN1NI?=
 =?utf-8?B?VGFGaERWNzZqalpLTi9nbERKZ2luNnJyK3BwMWE4YVhWRkdXNHRPOXp2dHZz?=
 =?utf-8?B?bUY5SlBwZC83NE9QUVlxL1I4ck1HbjJycndnM1ExR3lxRTNzZ1VYSGpLMi9z?=
 =?utf-8?B?T2NLNGR6ZmYwdENhcnZKV2JsSTBaNHZvUUsvRkxkVHRUQURFazh4RVdVUzNP?=
 =?utf-8?B?eC9RY0lkNjFNakUyMEkrVW1PazN4RDc4Y1VYdXl0Um83NVF5UTMzeXJQL0dy?=
 =?utf-8?B?NThzS3ZqbFZ0NnhkaGU5V25BNW9lRkR1WHUxL0h2bXk2ZTdGbEFSS3BMU0sv?=
 =?utf-8?B?eWwxSSsxRzVqNTlOeHpQUWhhdWI0MlowKzdyczdOOG1YOEE1N1pXR1FEaGJa?=
 =?utf-8?B?bGdlQ1FIVXZCVGVwRk1ORi9jS0dLeVk1clk4Nmx2QkgvTFIrRTcvK0Y1Z0pw?=
 =?utf-8?B?RnB3b1BKYXJQL2t1cmJXWGFzWmRqU3BCVlRxdFhIcXlRVVZ0MzYzZWlHeE01?=
 =?utf-8?B?dnVrdHNoUFZ3TVhVVVI2T2xFQ3VpcGVoVEx1b0FtL3FuYmMyY0NVRTR0ZkVW?=
 =?utf-8?B?REdDcHJhdDdMSFZNT2pGb2lReXcreWZtWlZHL1lLU1JFZXltN3hRMmhHczdW?=
 =?utf-8?B?ajhkb0EzTWFnUDM3Zzc0YWs0cHNVOVk4djFPN2syNHBlbmFaUkZlRWZURFl4?=
 =?utf-8?B?cUNsQ1NLYzJQeTFVYjd5enM0b1pGaVEyMG10eERzOW1RMERieWdVUFIyNzla?=
 =?utf-8?B?aGp4T3VZaU5qUzkxbmNrUm5yT2Qwalo0ZDlIM3N3Qk1OdmkvNTRJczk0RFo4?=
 =?utf-8?B?T0VoSXhQVmxiRFdZUkg4K0JNenhQV1pnSEVQbzIwTjhZd2FaZWdCa3ROQ2JU?=
 =?utf-8?B?ODliZjFwUEpnWXdaU3YwQ2F5cFI5eFg4LzZBOGg4c2lOcHNiSHY4ckRjNDh2?=
 =?utf-8?B?WFdQL3MxYTF0TnFRRTZUQzhkbkdGZFJ2SlZERjVHK1JnNkZDeFo1Z3RDWHJS?=
 =?utf-8?B?cHdXcnFYRnlLdi93OERWOE1uTnJ3RzJvM2lVZkQwSkM0RFlMMFMxL3JTazdV?=
 =?utf-8?B?UVd3VXdFeS9aME5TZ2haT0MrN01MNENqem1BaFRGWVZEZE5KMGp1ekdIUENY?=
 =?utf-8?B?cmlvc2hMVGpEelJsM1NyNSsvTXdyRlg0NzdmWmZCZkJtWk82eWdjcXpCM3RU?=
 =?utf-8?B?YTVqUFVtaFBXNU9WL2VKeGVNdXQzMUdzNXN2ZkllZWtNYkNocFlWYnhZODVq?=
 =?utf-8?B?SHNEUjRJQkRzWmViVjlsd1NwQXowSFk5OFQ5eUdIVFdhSFVmeEVOZld0SlVt?=
 =?utf-8?B?S0NUV3lxUm45bHVlSytHRWxhSWg3eU9EOWRxbWlwTnRzUlRrU1MydjRlZ2hl?=
 =?utf-8?B?c1ZFNjV4ZnZIM0NIcDRFMlJBenVZdVRPTWlMVWFOTlFob2hKS3IzdWc2VWRD?=
 =?utf-8?B?dHNtaVBoNzZ3bklxNnUvVnd4ZC9MNXNHNW1iVkg1RlJKclBuNXM3VG1oNzVH?=
 =?utf-8?B?QlNYRU8xWG9zaWhGc3hJRFlUbGJVNlVHSzRINllQNlpsUFBkM0RzOXpDRXB0?=
 =?utf-8?B?eEZiN2tqNXcyRFhtSlFqNFNGVThMTXVQYnZ3SjNYa3o2bnV0LzFkTWF4MWly?=
 =?utf-8?B?NnhxZWpFai9vU0FMeGR0VEU5clc2dUQybnNGKzRpRUgwUktnSFZTTFl6TlFH?=
 =?utf-8?B?NWh0YVJ2ZnYwQS9oRlRhaUQwWTBCVDRKLzBFbFV4WnloU1ppaURhWTZOaXM4?=
 =?utf-8?B?TzFWbU8ycEVPanFiK2dwWkEyNFJoelBad3FVREt1RWFsWTZGQ2tldz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c977704-898e-4ffe-878a-08de81c8649c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:51:21.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EI4t8PkiLN8Nugo51O5F1t8LFQDCu4guzLXBj9PrV/lu2Dt8xx71yyZy2wJgKbsD+V4mD0e2WX6QEMn52QZUJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_055129_763056_192A27B1 
X-CRM114-Status: UNSURE (   9.63  )
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

From: Joy Zou <joy.zou@nxp.com>

Add A55 and ANA thermal including cooling-maps.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi  |  1 +
 arch/arm64/boot/dts/freescale/imx943.dtsi | 62 +++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index cffa80e55e17d0ae68347b4aa6f69ace22c1e7c6..7bee64c11255eb65684c4a4070ae287996211dad 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "imx94-clock.h"
 #include "imx94-pinfunc.h"
diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e87771c0775eb799ce2da3aac37c060..4992de330c5b14b072995ade2d7df162aca3e7e1 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -145,4 +145,66 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		a55-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <2000>;
+			thermal-sensors = <&scmi_sensor 1>;
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit0: trip1 {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		ana {
+			polling-delay-passive = <250>;
+			polling-delay = <2000>;
+			thermal-sensors = <&scmi_sensor 0>;
+			trips {
+				ana_alert: trip0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				ana_crit0: trip1 {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&ana_alert>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };

-- 
2.37.1


