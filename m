Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86692CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNaRObJjRjhBZk655xbWTteCERFKn3Z04++RDzWv8Kg=; b=SpXiazW1lgucXdgj+7aOLJvySc
	RETIzeLZwK1iHCLPtjRxpykMipo4NpS3sfP0nujeVEkhOnfMKq5zeQXq+O1vl/Cph3xgmh3bcdEGi
	IP108K6IachYgIioY7GVXSDF0Nb6+cB2R95I8l/atya8zzBcDgypXxm7aIafevfHWkubBhB8Gv0Vf
	7JDR/iQwq4qdyd4zuqOBWUwfpQqZ/6F6mHEqf6J8rC1WUxw2wUgNSXL4T4eeZV2CY+OABvZVUvNtu
	c07iRJqz/Mj3AcpMHyidtHqSAqQubBksTNjt/bULA4B++jScwFC14Hk+7AdjfwZo91nmob4Av1IZe
	N58tp3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCyYm-0000000DSjG-3pIS;
	Sat, 03 Oct 2026 12:09:50 +0000
Received: from mail-westeuropeazon11013031.outbound.protection.outlook.com ([52.101.72.31] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCyYk-0000000DShJ-23Pj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 12:09:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxidRDXlpKgx8I+lDeK0MOFz7jSe/0YMMxIlqucq50GAg+Z6V1QMPwvU/hdiRAIVcIkO1TCMp+jl8F2vX7s8f1wI134+ZtFZ1P9t75Lp7SVdj0s3uBjvbiVRcEcn5zOk6kob5nLCfCIXRRKQcSKxzVCm5b0tbHkrYS/SUYD926AdHQKhsoUrs97Uy3W4Jm5z1JRw9I9gZqKmFPwDffJDlLLqYfCPC6CfoR7nF26BxD8FU5sMyrnwcK5Y272+wF4VbLHojC5vHXqQ/T1yoda2qvIlo705sK5YSShdFt6R/L/CpgMeGXfYOOmEkctqnJ7ATBJ3sfJTW6sfOWQ/tH2XXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNaRObJjRjhBZk655xbWTteCERFKn3Z04++RDzWv8Kg=;
 b=u9/IsIzAgdY2FGV95sBLnwup6FAJlXL72YgChzxMQPnWnT37K0GNxIupkVj+Txou/JkqH2n9eWXYWg1fvzBXikIud5dRn8XGMu93vhfHk7XQqKBi7ZfvjesG2mdyBa5FcTHM0eIAERkEj4MYiorqbOTI0f1xeSVRo13UVfwHU2eFR+KP+iYMl2it0LdPQy0v28Et4I9XF7D6x0ehOY6Z913N17UvNz3gFbvdMPHquFLX4g301vDVTU9PYZq30sOW/lC5kPICGsHT00qzvIR0gD74n/CG6hPeOYLuh01sTFOdGq5pmkAYR9Yhz7RtADeXDYtqe+lHT6uvRSNwKxxtxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNaRObJjRjhBZk655xbWTteCERFKn3Z04++RDzWv8Kg=;
 b=cLmmBYPYrJIBRMgCDEBrK4JlfaOwRVAzsyqSEF2ouOZF1k1eFc7v09BbXgB+tYDpW/0NZppZ21r5XjDpwBOAzpJunqtK/fgHhcCj3GPFCLQTXmQ3tYrXMiwpof0BBjX7U6PsD8ZjGBPhkoa7VYrJheNbSwx5fBA6gnCqRFb3+k5nB86qU5VnAVK+vBA8XxI+5Y059kIpdqK+GIl2ziaMJMb2jpnXhdGRQXoBhSwYGjFFpt8QZUqbML7x/wvIlmg4pFKYstP6ZKqNwG6bRW5zeHor1GOxE9me5ajzGz5qnVaYyycZQYp5ZDr1C5shCcgQZmHwVb+C3An+Mcj8nnioUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:09:42 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:09:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:45 +0800
Subject: [PATCH 3/9] gpio: mxc: cache compatible checks at probe time
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0303.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a06bb84-9b41-41ff-e889-08df214734e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: x9SgDhElGryp24k4TiDa0WQmh5n2MZrV8CKCC7j6NWq0jyc7tSnCY0SnPCifGeW0E/7RZwURHl6biEYWNi/x3HxR8daXvOnLwj52lenk3x5AT9OiUbix5O9FEKkFMkMyBdk4BER/6UecklzR5He8z04EBpPUzhu15XHvxZR/4QV2YxNcMWOn3q96IapgUY5V90xfns9+90GBCseazT1ojUitLd/GRvgfzRnjGBEvZ0Fu5Lwi9N3pYCv7MOAj9vZ9sUS3TlVY1GqoigXHoICtkHHSiPIjpFZ001Wm/mgCdIvbpO9tKxlcObAhlPWjCDufi7zUcNw3eUh8t2L52v2mVLS7rMJyOtlaaDqczXxSAFXFsa9zy+ImL8jLN2TDEqSJZx0LtyZCXtlSmfcvwEQnHwQaWupEKUctjtXwsW1T3Ff/Sh25lQle6QCFPisaUME/fi19ui8Y5yKigfwipB5EKS4N0wWNeeyI0ThailMcmubfUFV70EI8vn541WQf7R1nFeMZ5nTYIrfcKsQeJtKbsBI+PoUipY0fmxzkVL5lFyR3GsiBfFMLTNuOkj0SkXcLpX0nlvstBNDQWoeSy9AL4yjugP9Acr/ofM9dkg6E/GkIoT/99711YB9+6ZBU/R6xQXraroiLv4bYfLJQBCg8z2+XWFRL9wHaayibngIDIYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9CQW5jNVJJZ3Z3R0hMUkhpQ01LdGlyTEhLTjlGZWlvaEpsREYxVnp2MUpO?=
 =?utf-8?B?Sm5hRW5wUHo4UVhxN2hpRjdwWjZHMTZoUm85NTV5QmN5aFNuVCtxRkNhWTU3?=
 =?utf-8?B?OTNZVnJ6dDJiOFJuZnpsRTlpZ3B3S1FSVG5IUDh2SlRvRFBYS25MeEV0NEFD?=
 =?utf-8?B?bnUwOHNNSldUeWZmVWowaVFKOGNBcWY3T3Q0b3djMXdhTUFRaUFER0crNFAw?=
 =?utf-8?B?OEJWN29rbGZ3REVpaXc4Rk03eEQ0R202b0dYeGdEVUI3enVEMEY0K3U0cmpq?=
 =?utf-8?B?ekk0TGNETFY2VEo4NXZrVy9NWFhXYVVrUGc4cFVyWnJSYjRzcDBoMGhvOW5r?=
 =?utf-8?B?WlFRS1BWckJMZzdsT0lVRXcwRnRoai9JcjlobWJnVFlmZzA1TVJ5WmFabmI0?=
 =?utf-8?B?cVFGdWE3ZzBkVUN5R0RYRGtnQStBQW52ZzZkU2xQZTZNanNpRzVZVHpMak9m?=
 =?utf-8?B?ZEZab0hwMjRORHlnd09QVjhBa2hpaTFBNXdPVk1LZVZVZjF0ZnVKUnFHeDlk?=
 =?utf-8?B?cmREc1kwd2xWN3RXeWVoQ05LTUNPUTlaZmRLUTVBV2Ryak13VVBHWS9KbnZo?=
 =?utf-8?B?TlhzeTlMZzBsR0tHbkFuVGVpWnBMKzB1bDhhZmdMMDJ1dm9HVmNVYkJzUTNx?=
 =?utf-8?B?ZDhWeWZSa2doZEFLYUtUU3U3aEFpZS9nMTVvTmo2cUtMZ0R4dWd3MHk5ZkJy?=
 =?utf-8?B?eWM2bUEycGE4TUp5US9PdmlWWFp6OVpPNzJORDlxRExDdEhEV0pqQzhwQ3hy?=
 =?utf-8?B?WW1UaFhscndDR25hNnhrQk5vUXY4Tzg1a29RSFVlZ3dLT0krSmFPbndZdDZs?=
 =?utf-8?B?ejNxUThhT3YxeFVhNVU1aUFXY0IzWkRYNWtiKzJXSVdpRFlXVnU4OTVScnJ3?=
 =?utf-8?B?N0dHNmhLQmREaitTeG1mNk1pVWhwbS9GVk52YnhCbGI1YnUrWkJXWEQ3NXUz?=
 =?utf-8?B?L0MzRVl5bUwyMjFoZG1BZXVhNUpUcEREWHJoc2hUUmlLclh1WkNLNkxqZGRu?=
 =?utf-8?B?b2pudmw3OFdhYjZmZlRPOXRLQzk0Ly9sMnJ6OHlja0RPVVJPenl0TWhBWW5y?=
 =?utf-8?B?Q0lUaitrMTZxM0NNdE1IYnhxRGlEOHBLUzdsWTZjeVJyM2VhV1FuTndzMjNE?=
 =?utf-8?B?VlViWlB3bnNWWHhZMjFqaEVHMW1lMmZ4VlFkTTZlNHVDWHNuOTQ2M3NlRC9Z?=
 =?utf-8?B?UFdxaSsxaTQzRFV2amRWSm51dWZ0TXRlOW1oc1R2QktRRFhoTEgwSTJ0ZXly?=
 =?utf-8?B?ZUl4Vk14YkJDRzB1amtDNUhxaDhoWkNEUDVXaDNqNy9KNzNURXQwemUxWTN4?=
 =?utf-8?B?Y0xRdG9SRjkyTk4wdmlIYVVyb25OZWNqRnFtUkZLa084RUlPcVpLNWx6S1lI?=
 =?utf-8?B?WmlXV0Z3Q3dDdmFtcXVRQ1pRbzNjZHpwTXpTbm5zRFFSMFFRanY5a3ZPbEVD?=
 =?utf-8?B?ZjlJWm9jd2FlbG1yYmJPQm5rZng1amR5endoeGNzVW54MUxlZVhwdmFpb0ww?=
 =?utf-8?B?Qjlza0tRbDZvSUxLWjlJNU93UDFpNWdBTE5iMFVVTXBTZS9raXhQbngzL1VR?=
 =?utf-8?B?cGVIVVBLdk0wTDFtOTMvMVI5bTJCN28rVVBOUEtNOXVzNk03c2JRcGdJckZZ?=
 =?utf-8?B?T0VWZ3NFeW0vMkZuRDAwT0kwdWROTEtvbmNjTWx5UFA4TmNiL2dRSHJQOWIx?=
 =?utf-8?B?WnhGOGM0bGVHNTdpWFZVbU9QSEY5Tmc0c3FlMGtETVhuYmc5aGMxeWZ1L1FJ?=
 =?utf-8?B?ZEVSdktxRVlLK0pQajNBQzVHVmJKcFdzM2VqclZNQTdBU2FmcnNXYnlkZ1Zh?=
 =?utf-8?B?L1Zjd0VhellpUjlJOWFCMXRvbVBUdXhLYlhOTFNWV2ppUUFBNWY5YTdLa25v?=
 =?utf-8?B?THR5UjM5VnFNb0Z3ZkJMb0dQUHRmY1psUkZYUlZlUzNxSDhhNFV5bjRqd1U5?=
 =?utf-8?B?SjM5WHQrNS80TjR3dGptV2p3ZFhMVHVtQXVmcWtaUTVKMXdaNC9nYUNPRFdm?=
 =?utf-8?B?QkJ5R1owUUkrb2pYcEJobEYzMlZ3YmdQMEZITGJtQUZHL21HYVpxdHlIUmxP?=
 =?utf-8?B?V1Z1Vmx4cCtibnhyRHlUUjR5U2NyaWZ6Y1lNSTdkUkEyRmlJd0Fob1B6MjFR?=
 =?utf-8?B?V1JjWDhRMWJoNlEwOUFhcHNFVDZyUUtTYlByZEtzS3A1YWpXUHVjT29TL0k0?=
 =?utf-8?B?NXlkcUw4YStlQ2lFVDlIcm1pNFMvdUtCODRkbVFXSnA1UzJyUnVadzQ0ZE9U?=
 =?utf-8?B?Y2RFZVhmMmtDSFRyYlA2SVNjVkk2RUtPL0thL2h3aWhiRDhteHgyNGtFSjZ4?=
 =?utf-8?B?VWhpSUZXc0R1MzF3M0lURVJkT2RYQ0JSYVFrbThyU3BKZTFvc3hQNHUwQWg1?=
 =?utf-8?Q?NnN90vF7ZiS63vjLzxoL+gtTyOeV8C4qX7R+Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a06bb84-9b41-41ff-e889-08df214734e4
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:09:42.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDOZqfs7fnX71FtCUSAE/yd4cmcycvImcpYH+IeDNxd9NMdCaZdVM+i//n2Z8Xm0wUoeG0ot5avs49AAAnTu9ZdHYGZFcN7FN3RyE7GW+SQfeBR2w7FUa6EqQFT7+x3n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_050946_550784_AB245C92 
X-CRM114-Status: GOOD (  13.24  )
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

From: Peng Fan <peng.fan@nxp.com>

mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
of_device_is_compatible() on every invocation to determine pad wakeup
capability and i.MX8QM-specific behavior. These properties are
invariant for the lifetime of the device.

Cache them as bool fields (has_pad_wakeup, is_imx8qm) in mxc_gpio_port
during probe, eliminating repeated device tree string comparisons in
the suspend/resume hot path.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 8a755ac1af83..1c27232f6a80 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -73,6 +73,8 @@ struct mxc_gpio_port {
 	bool power_off;
 	unsigned long wakeup_pads;
 	bool is_pad_wakeup;
+	bool has_pad_wakeup;
+	bool is_imx8qm;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
@@ -457,6 +459,14 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
 		port->power_off = true;
 
+	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
+	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
+	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
+		port->has_pad_wakeup = true;
+
+	if (of_device_is_compatible(np, "fsl,imx8qm-gpio"))
+		port->is_imx8qm = true;
+
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -570,15 +580,10 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
 		unsigned int offset, unsigned long conf)
 {
-	struct device_node *np = port->dev->of_node;
-
-	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
-		return (gpiochip_generic_config(&port->gen_gc.gc,
-						offset, conf) == 0);
+	if (!port->has_pad_wakeup)
+		return false;
 
-	return false;
+	return (gpiochip_generic_config(&port->gen_gc.gc, offset, conf) == 0);
 }
 
 static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
@@ -586,7 +591,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	unsigned long config;
 	bool ret = false;
 	int i, type;
-	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
 
 	static const u32 pad_type_map[] = {
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
@@ -608,7 +612,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 			else
 				config = IMX_SCU_WAKEUP_OFF;
 
-			if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+			if (port->is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
 				dev_warn_once(port->dev,
 					      "No falling-edge support for wakeup on i.MX8QM\n");
 				config = IMX_SCU_WAKEUP_OFF;

-- 
2.51.0


