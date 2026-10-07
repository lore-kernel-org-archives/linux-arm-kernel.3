Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21A1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRg0HfX228Jtdg6ednzxcSUP8lJG9KWvNTIgYck5taI=; b=O3sfPf3CYEfmKa9APonCTJZXjt
	zGn/t2Es6NkwlGWt7D3DqPpffy6Qn7W2DKJNdJma3b0p350RfdW7TwyKCQWw7NbJGFyTnGU9h+h63
	dRXH9yMi4eBan1Or993UZA7oPKdTTJryVKvtsE/6SSQcUqFPAzbN8auAS0REih1m5rYh6ksiNk3pm
	pKdnJIavz/o5vjorS5iR5RfXGFxznW5nyX6JLl73KhGOoarX6Quawm7Jg4RW6y2MimvLuY3zaHF+V
	HhecmVPZJDDzvL/l3oyxWyLM3wVnhvhwQF1RjC3JclNSb3iY0DRhUxxuc0sh22c4ukzm16l267vge
	6V8qyquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPBh-00000002Dh2-027t;
	Wed, 07 Oct 2026 10:47:53 +0000
Received: from mail-westeuropeazon11013006.outbound.protection.outlook.com ([52.101.72.6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPBe-00000002De3-2p2V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzF4cHrBkL8GPmRUFm8xbARbuQkP0czkWZ01q/dNfbE3PaCRCWG0XngtJeRaKjBW3F9jvaWpjmu6/9nT3cVtOWjYxCvfpKY3txovPU6f07Rw8Sh9t0pjdBRLNKUWgDK5nMFtK+lM6I8R1xcDsF8qmnaBXsZD2eBmmmNkp3PCW9DKmYq0j1ktTKOOr+N+lQlauuKy7ommipd9uCF5Myv98s4oTfkqsETL1X5N2DMDNUlAOe2NftksRIdwSFpR9jRN9gki8zI0dW6YjxDkE3fJZCgk+C/TG1/+r7CaxmOdumK/TeF2dV9VIG2hYjkgIRJgxuNLeqnb2HxBXJrMxJ69Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRg0HfX228Jtdg6ednzxcSUP8lJG9KWvNTIgYck5taI=;
 b=wysYjmHNFYUjxI4psvU6JF1JVvxgujwXVREkb20t0nwgn2movPmRxq4dbIs4bQFJR+PjlH5tNz/A9J1V5hYi7LMYh8DwyRSes9HxpCILEEh+eE9KjWZnUfIqXjkcmSeuqOpHC7dW53h8N4fO2tQt5FNiOKtJ5xh1V0QPVPdiBGNaXVEyhm5Jm49OiYQ9Cfd/1shrSmLBN0slUVeb4WLiyq5hSm5IJdFv4j6BVWO19Tw4AwEIpd11972++9ptVm5gkODBKUVco6vC0gCnKqXMiEcBkG69dsa5Z+/TL7EeYZvvSMB91TDREn7obnQ+C1/b/lvc7P8Cc5hs/JT+I5mS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRg0HfX228Jtdg6ednzxcSUP8lJG9KWvNTIgYck5taI=;
 b=io2VIVTdX2C5NP17eMRr1kbNu0DbrlKPkHncudhzwFpNVcWEi+e4dyedaqPrI1os6ZEIV0n7m5KIj/jaRm5z7RCniloMJtgkoCcv4S9Zggi8Wpb9d8V8cIFdKWJRgHWQMN2hDwytdHmBrgZOM5D+ZLJSZsbVZsdSqVdqCZpcLA/AD0e/PZhaGrqrANUc3cxaAapNb8SWMNMWvIGPtmlPrYIGfHBCRWLv2ZrIVRQZ1GdAQzsfSTXfzBbmxp5LAGkdjMhU5iCdieObvoA2csiqddu/LABDTVazLoHIzxQA+4tUis/J8s+9c6zmF3059AEQx/EjaingVYoxtBuh6plTIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:47:47 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:22 +0800
Subject: [PATCH v4 07/10] gpio: mxc: switch probe error paths to
 dev_err_probe()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-7-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a04f105-8f33-4bf0-1bd3-08df24606cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: m8Ee2pFdv+2juoAfcYcnct9c1yHw3dDIa52zmVuwa8Zz4fdzxzmPwGtFbZ4B71bKgaolhqpnYux0cYjhSr5fSTsGLVF2r09SU7o7FTJZ3rPIemIs5SUCs1hIlI5YjnL1KqNsIj16DD0Df5+OGOkGQyXAhWgF9JgatX5esKPtMJH/knRUOWrcjCd74rwWZlK9bGeAkZdPytdbrYfGuUsf5K8ajF1p54QO8UjbTfB/vfGTkyhsd75L56szMdDCtu6XdtYa+EImeZt5LFhP4tMj5nHD9QR+Wogd9HyFhWkjyGFrAkMqG2Tla289Lpg759SE38kJ8n6aNh8veKZB/DSaNrbhGDkJZxZtK5GOw6rEwpiDgXPY2F+cU83ZSu0tS/Upt7naNZ4fb7fnEJZYZuEPgcg+nk5Z0GMCU0kOKnVFJz8JVC/JTUio798GyIZ8q2UNRuYiyKhd5CR1HRcMbGn+2oWBXovZl4XPq/Djq6+bFmxlkNdcuW0yB0761zZ1FdoL4wdAn1M+iqKRUVuKCILb1t7/sMz+N+8+ntOyepGv0OA+NFyXtpOz8pmuJ4Bos3BrLa7oOMLjxLPEfkjVBdmZ+FR5ys29bipZEuoM2prOT8EwmB+hL4VLJcjhylgvcTnx6kd+jnr0SB9fuZKlU2hxp3rSzWgf79fcdM2Kuz+gOXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTRqa04vSnNHVmdFeStHVnltS2hIMS82RndNQm94Um5sOEZYemhkSyt3cjVk?=
 =?utf-8?B?WTJ5OEEvVXZsbTh2ZWhLVXozemZsQWptY1pmUWd3N1BYcThVVjJwWWtUa0xp?=
 =?utf-8?B?K1BoRnpkL0Q2c1JwU1k3NHRaN2dLYTdIbXVEclgyM2dMKzVQNTB4K0NkSXVQ?=
 =?utf-8?B?WitFSkhFMXA2YnVYRFMrN1ZoRXMvaXByYUZ2cWZCT2IvU1ZncWJrQVJmMkU0?=
 =?utf-8?B?VERrZUc5eXpkS0Q4YkdqSW1QN3dFQXU4N3R2ZmJiRVREcHpwTTFwOE5OTTZU?=
 =?utf-8?B?K0l5akQ1MXVxS01EaFlyUVVMZU9uVkZjd1h5UzNYSVRTNXdmRG82eGV1bEYz?=
 =?utf-8?B?a1Qxc1UzcUNCVE90NXo1UkptY1FjdndzSTFZTkNpazlQVmZFZy9qcWJBZ2M5?=
 =?utf-8?B?UW0rdktnektMcXc0Z2NlNVRIeWdQZU93YWhDMHNYOCtwZFlFM01qT2RzTUd0?=
 =?utf-8?B?eWZ3YXJ2UDhMTE1XcnNSNlhsdWZpQXJEZEdyQ2QyTGI3U3BJOVhlVElLYXJq?=
 =?utf-8?B?dFl1TGNlTzE5a2JuRUpIVk1HT3pPUDFCRHlzL1BDRlNGQzJ2cFRtbzdkWHJK?=
 =?utf-8?B?UGRUSEg1QWpHaTRoUUs0TlM1WmU2M3ltbHRjYXA1ckFGL0NjUGNrMzMvV3Bh?=
 =?utf-8?B?dkpGRXVaUnhCZllna2dtMWZjMjZjVnlLMjFVZTNiTitWSWNXdnlmTWs3Z3dB?=
 =?utf-8?B?cFQ3cWlMd29FbjBDa1BCY2xNQXN4eVMrSGp2dU0vRWJLUkJHSHQ1aXMyT2w1?=
 =?utf-8?B?SStaUjY2WHVidE5BN1FENXZqME5qanZIaTJwaklISXlMbFRSVXVyNUg3b1VV?=
 =?utf-8?B?VmZSMzRtT2tUaTB4c1M0Zys5Wk83dVpKbVRaQmQwaDZTQW9LZlpEUVJqQ05Z?=
 =?utf-8?B?K2ZISE5oUDNlakd3ZjFwSTM5YzRqUVZYQmgrTTdCNUFHdjYrVzFseXRUT2N2?=
 =?utf-8?B?L0tYOFkvbzZoNjEreEVQV3hkL0NKaVFFVUx5d3FKRHNvNjdLeU9oc05VQ1JE?=
 =?utf-8?B?RS9BVUlDOHJBcWppSzhwQ0YwTkZUR2RJVHlGS1V5QTRZNThhTmlCUnpuRmVM?=
 =?utf-8?B?V3MvK0RXUFN3ZlA3STRtTTlKYzlFQm95WXdLSm5SQkdKWUY5ZUZJSEk2SUNB?=
 =?utf-8?B?akYvNTY5QU9nZ1dMUHFMVHJPd3lsc3FqSXpiYjBKMUF2U1BzcmE0eW1NQURY?=
 =?utf-8?B?Y3ExcnhJdmtiSUxxWDBpYTYvdk1tVTR4WHJGcVNIRU9WMkFWckRSRzdtYVhU?=
 =?utf-8?B?SFdOUjh0Qm1Zd3JzeVk5YldrQ0puSlBxcWRhRitRMno5WVNGTjUvdnkzS3c3?=
 =?utf-8?B?SEQrdXdEQ2JLcEg1YmpQREF4bFVQVjdCc2FHNVJLUVRjRkNVa1FFNU9udUl6?=
 =?utf-8?B?UU1VTlBOTGNLRXZneDd5VVFnSU8wbTJZMEl6Slllb2tyd3ZMdXBIdzYzMTFs?=
 =?utf-8?B?RnVRMzVpRk9lMG1pWWd1TTlVcVZwcVg0RlFKZTlFWkhiUFFkWmR2L2gzNnlk?=
 =?utf-8?B?UG9sMVA3MnB6Zjl6SmxJQUUyL0ZxU1Mwbmg1Zm1tcXkwbSszYXRscE1lT1M3?=
 =?utf-8?B?QlZySnVmNWsrcVlUZVRSNU1PdU1uZFU0ZmUxTFJ3S0hDbjlabXIvOCtuVkZh?=
 =?utf-8?B?UFA2b1ZLTWJwOTNGMEVSdGRmQXFRQTUrMlY1b2NXRFV2Q3ltR2NiM3pUWFBR?=
 =?utf-8?B?UXFnUFVBbU1aeUkvVlBReTJpVW1xcXErT3FSYUtzU2RkZFRNSkkrQk1ZOTRL?=
 =?utf-8?B?VlF0UFcwek9pVmNJblpIMlJHc0pZQlA3TmJjWFpuZ1IwL1M2L1ZiZ3NXMjZ6?=
 =?utf-8?B?VWFkdkUwRUp6TVNyaDdMRmN0TzllTldCTWlUbVFVS3AvZi9jVXBpL2lST1Z0?=
 =?utf-8?B?K3IxbTdmK0liRUhyWHV6NUdQMjhPRU9CU2V3bGdLUEJMRHc3R2pxeVNXNG4y?=
 =?utf-8?B?VENrUUdWRGFjckRsak0wN0JFbERQc1ZIYVJzQ3VNREFyRjd5bzRnbW1rTCtu?=
 =?utf-8?B?V2NrRmQ0Z014di9tMFl1YmhYWTQ2eTZlbG1PQW5zL1FUa3NuOFprbW9Pakxv?=
 =?utf-8?B?Z2tSWEovVk9namZhUlQ1Rnp3N3NUaUVmSElLVWlXWUdUU3JBa0dMd085eXF6?=
 =?utf-8?B?Vm1rdnZhWEZaeW81bnV3aitiMm8zUEpDa0ZDbVFTOVRDNi9SckQ4bi84UGht?=
 =?utf-8?B?RWFrZGwwZDFobHVLRmNBTTAwcU0vMFdXY3NnbE5DOUZIMVFvSVJWUk1FWXRM?=
 =?utf-8?B?Z2ZzRFV1L3k2bFRFUms3eXpFSXdYNlgraXZkR2VMalRTZE5ZZm43aTBRSVpy?=
 =?utf-8?B?Y0swR005OFJ1NE40UjF5cVZvcHorUHZZWnJvdHZBczUwbzhFUW1pTWt2aHh0?=
 =?utf-8?Q?GXK75MBfIqEINws9S/ZjdLNEgoo8FgYe/e/Dt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a04f105-8f33-4bf0-1bd3-08df24606cd9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:47.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCryH5x1DvwLEH4l0FjmGlHX5Isqs1rnnTL8p+/C+m3bC68KvRMZYi6FHcSg7KnzRmyLMUy/DbaQA71GQN3E0xJwrF1JWmLKKJfpx/sBV+77ugL2/PIkehVUQrT/FZs6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_034750_739274_AD66DB9A 
X-CRM114-Status: GOOD (  11.36  )
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

Replace bare return statements with dev_err_probe() across all probe
error paths for consistent diagnostics and deferred-probe support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 54b09f1a4b50..f5f9ef1564cd 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -517,7 +517,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		return err;
+		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -533,11 +533,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
 	if (err)
-		return err;
+		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
 
 	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0)
-		return irq_base;
+		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
 
 	d_info = (struct irq_domain_info) {
 		.fwnode		= dev_fwnode(&pdev->dev),
@@ -550,14 +550,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
 	if (IS_ERR(port->domain))
-		return PTR_ERR(port->domain);
+		return dev_err_probe(&pdev->dev, PTR_ERR(port->domain),
+				     "Failed to create irq domain\n");
 
 	irq_domain_set_pm_device(port->domain, &pdev->dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		return err;
+		return dev_err_probe(&pdev->dev, err, "Failed to init generic irq chip\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 

-- 
2.51.0


