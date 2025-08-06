Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31DDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3LQpO2npOEp+xwsNPirQutqFBm5c8swK8zM2nt5Bro=; b=iXbzQ7uU2d0Mtvm56I/0RHMCZZ
	0qpHCqNd2ANt+fo0uHKfBx9ZJS92pFmx6JZ0psokTYhIa8r3uTY8XSiqxt9+hGblQIYps9rTxnRKY
	55N9Oad2l4iyym4A6YhWwQKyzi4H0lB9W5eH+OzeG7bXdPgcHRPrnr9hVxo7KyUcDwKzbZzhHILKF
	GklkmFQCp+rWN+Pb9VNaHVDyjzB+mV7CqH2ulovScZpNlWPhXCOj/24YBH6wqYfA9gy8D1HerBW6Y
	WZBe2/X6GJ71z156Cua2S+jCRJVkrRXzSNqqKYzy9t07O2i74DIE/yMHo5phrNkueu4ZnkdyaYIlf
	B25bxNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgqy-0000000Fjul-31tB;
	Wed, 06 Aug 2025 16:19:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgb6-0000000FhvV-0SzU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 16:02:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfrfJq0lui8tbfwLuJVvn7L+NyoKubTFa2Nfs6VRqQzC+sqSku1EIKGYND3Gt7+GTNOt8m+N9Tmq2+iVvj7qSMshqxMZjfeEiIEJrqI0aZaEBx49BBUqBlwxHYr+kYGPTRo8ed4SILbDXLuQ87IpEc+NFrReX9KtX6TL/7kG8+NFhd/HxVWWYA8ZPLx/+XxeF8pWyhWdlbASwcjIu6vrPr7X7Cw6xUqoqfWOKfERFoUbkLtjjAu11JurAF0tiezda2uECv8ZtW4aN4Mlt1Qo5ayc3aBBdj9ZrAFn7VCxbsE65MBCQ0HroUgwUkrKXhcKztCk9hR7h/WTYvUhHa8smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3LQpO2npOEp+xwsNPirQutqFBm5c8swK8zM2nt5Bro=;
 b=UFSVixtwfULDxEuy1E1E4BquK5NSZuRE6KWba2UaHIGPzYUZ7viytpSqzXFU2cNcS++Iuu8R36LANhr42a4Mc2Hkc+su9albQ84xa+hsmT9Grrt50/oun+YVQ7EGe12UdTOTPKdOv3+oMDMPakvpcIjf60aJ3VF+p/K3I1HRM/WE0NuCBlPR3FL+/hRdjV3w/YO2hSc3aH9FMc30lm1d+aPV/MQjtYNorazRpf8X7Nzh9auJZ+3NFBf7V/5wRhuwCGK6EjZ46A7ibWIIUpbaEMGdMdPntXu67HMqc3cuJDRtx+Dp/QWU4uq1Dfkfs8bdXWun6ioHIDdg8gcAxIHGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3LQpO2npOEp+xwsNPirQutqFBm5c8swK8zM2nt5Bro=;
 b=DF6TA5tn2ox10wSAg+dXaBN7B7lhs9UOzEO6ve5e+fKUxXJsA5x6vw2eBwB3P9D3u2MRHMM62f9oJj5pnBKdoSL1CGiY+FOSPB4Ehw7uhRMVkjuT8F5aaOgmyULwGLXmiI5qm1+MJK3gxFDKtCfd0HMd11tGTb9oluhFluafRzWhdsstmgh4fF2T5W2meYcwXBu/oRx5ghEWyJeUrSae29IOsQxFxYPLuOjQ51AnvDBmtrKATEiXtATlqJrQutPUe0PmMspssNhXy+KUxqJ2f03I+f1JeThs9uR8P5LvPCeNpGg3V+iq4EWU20OYgJfKOPfEy5wxZ5tRD7m5peiP5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8322.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Wed, 6 Aug
 2025 16:02:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 16:02:27 +0000
Date: Wed, 6 Aug 2025 12:02:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] of/irq: Convert of_msi_map_id() callers to of_msi_xlate()
Message-ID: <aJN8jOQ8VeDjmwil@lizhi-Precision-Tower-5810>
References: <20250805133443.936955-1-lpieralisi@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805133443.936955-1-lpieralisi@kernel.org>
X-ClientProxiedBy: PH7P221CA0089.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ad327c-3209-4501-e4c8-08ddd502a3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|1800799024|366016|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E5ze58Ypv9actzr8VZrCpG8l0fjymavIc8juMbZL8CVC5NK8VlMnup23Q8tQ?=
 =?us-ascii?Q?iz6HIzCyLMbmBid7dLMfA8KPAz8QDIyNx0IEpP7ytQ9lWDnKff6Rv3tp2jKt?=
 =?us-ascii?Q?y9VPPJ+rM+QlSfQwTNhk6aV5Wgc9+i7cw13tkxpAExd3clhUGJfruw6MnNjX?=
 =?us-ascii?Q?JNokxZkvq91Ib6gHh0e9sHSsMEuj/s+00GdIlULuJAhQoO1BSPSPCtJ0cksf?=
 =?us-ascii?Q?VXeDUI1cmHJmx1GjNh6hkCFJVJA1FMdofEe1Z05BYXUsN2lD3ffZ/3FNETh/?=
 =?us-ascii?Q?n40IKpoBb/jFv1CEl1PwbGcc6ADtJT/Ci9uWgXKPK43jNub8JVJa7efWG2o+?=
 =?us-ascii?Q?oRcT2x7nkG15nUYazpRhvo72nDtm1bN1bB+Ek7pAYOTUoDYk+WsJgH+ARhKj?=
 =?us-ascii?Q?SRjsY/iZneIpmbXR1JiSdcgSv4J2u4YO/ZmiSGTjem7cWhJbBPDIH/YvkpMW?=
 =?us-ascii?Q?1WmPql0/UNlniAA98F84GJ+bPY8rcrgc14JiJWE7IOiONyGSuT55lR0NsVDZ?=
 =?us-ascii?Q?N+hPUkIDuNYSNQaUtr8am2XVTg+Oj9TWqpKP1LK8XYGDOJ+q9YnwrVszJejt?=
 =?us-ascii?Q?bQ7SE/pS8YD3zTMcJF5kXsNkIl3F8kJFJOMGpn1QATx7dDZG+J0NPzCXMrA5?=
 =?us-ascii?Q?juGc8EDZIP1PNiGXaETTaWPM/DZIBuxlP97DDJtUMIONY4I+dbeG7k5r3I9O?=
 =?us-ascii?Q?0xASHP0kya/nV9Euk6ytcuAwrlI5LWrAm7D+4CqNDyj+6w8HS7Z1DHlVpWdJ?=
 =?us-ascii?Q?amHyGNVupbrgr271T3uV9dlT7xeyeEJ/JHUkv+JIUa6Tm7D0zl5I95OZl6Fu?=
 =?us-ascii?Q?VXQZHBtOJ4dn/xSSGNmpCVp9VK6vDfH9AmN7/cb5h9hNUHJaFYqw5hEF5CS6?=
 =?us-ascii?Q?IthGEI+kMKPY+ye7BXgX/J+1vQ27vqmLFiWJwk55rf3CFzNfmg71eR+x/ObB?=
 =?us-ascii?Q?cHNsbEK8hDlsK4cgODv4DTZtJfgK4sk7cmctYhVBrLt4BwGidqgR0akUipEQ?=
 =?us-ascii?Q?GHT1impzFQUEeSSJoI8lF4VXEJUpvb5s+pUW3AAdw4CJc4P+yTNzjcmtXgJQ?=
 =?us-ascii?Q?1mroz4YeODbMGD+KOTJfftArw5kc0Ij4NJ1V2xLVGpaw8OX8LKtB4Ijt/D6H?=
 =?us-ascii?Q?bfE82Dm+GTmNEcW1myjXtnjCQssovTAhtoBavtdszhhh+oj7tXYS82BsIbFa?=
 =?us-ascii?Q?VIe4JlsSMI4/MSUurLRRKfO685wuxGYVgCb1i28XjiWv7vS0+pZFUY2dGjeo?=
 =?us-ascii?Q?MqMIq3Ndz6QlnfW88FFEHt8KgwiC6XabistXU9JKCniyQj9FiG/rlvw100C7?=
 =?us-ascii?Q?SJ7gqc2ypfjit4zcIuJnuFC0aUZ3S2iVYksYDZlKH/DTApSe+lrbiKl5G9k+?=
 =?us-ascii?Q?Q3ORjBIYI6/40wXQtIe6RLHnCGsLimfY9fxfZ1t8taiyJqSXDUBse5s1M5Rl?=
 =?us-ascii?Q?1HTwFH7bW5woJZTHkJWI+NJ9HY8tFwjPXa1Om2siN2959pzPoyhwkLM52lYE?=
 =?us-ascii?Q?7CoDyAGT6dkYKzw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(1800799024)(366016)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bqks+UQxcC6WZC31tSMtRVujrUDQJbMLJXSk4pFAGbIHVEvLNCx7OeKAjWKg?=
 =?us-ascii?Q?auiFzaFsmNYYwd3DTZLK3bXZ0R4u17Fc7Wcn+YlqBdBLKx5OEuvmle8E5mNV?=
 =?us-ascii?Q?f5F45dUD/LZJxWusjee6qdaxFLPkGtmP+dn8cuF9iJGBC3zjJy2l9L8V4Kjj?=
 =?us-ascii?Q?+LDXQejHnHvAWA46ZdQTmS3NXR0h/DiMfGD2F/YhN6oMcpxyOU72Tvk7KTxz?=
 =?us-ascii?Q?h1yxg80+Vr9474k1H7rFpHANTGZfR1bkwGN5nnHPva8O3QK6gkWDWTMVJBH7?=
 =?us-ascii?Q?fd3M9jTFplR/d/9ZZ9Hl2u05Md/tlAE+tkoRKOSvkRdHV68ucGtXjNgOHtI+?=
 =?us-ascii?Q?P9zto4arAsZ0bbiQ7/N5FDpqzlVyVfQcMyuyQEMu+wCcvWyBTRMTHEb4recW?=
 =?us-ascii?Q?U+FWNl216mJq0S6x/Ij3Lkq5g0Rw6sfor0dJlZyhGgyM6mtJ2Qhpx0qhQ0Vz?=
 =?us-ascii?Q?KTa1eSdRT9ykP7O2wqRXeIR3iC02xI4PDMaeGfTiv+SmL39TOHp+bk5kMaie?=
 =?us-ascii?Q?U4BpvVAo7shQdDF1Bt9bFgZtqvXrWQgMIIVXZWR6rZgbuN9BONXDXPShWl1O?=
 =?us-ascii?Q?PMksG9x3q6U7r2tfa94Qoh8DPRRM9f6SX9P55LLQe3I9CxiwwZKYGzBe09Ek?=
 =?us-ascii?Q?4wp+YERAkmlcb+0mR4UO7VDJLOwiBg2IBHDKs2ZOv9XYds/zg5siJcuuO1iT?=
 =?us-ascii?Q?89aRIIFtLcUf2ObGgyow2W68yi9STJlB9a9MLlVf2AMvbraq5IFUxxEMc6D7?=
 =?us-ascii?Q?HRNL4tW80amXEsPwhLJXfWESw5R3yMw1/GIiyDh/uU+N9OQu6rLhk2u0uyLY?=
 =?us-ascii?Q?HDTXmQfFZHKOhx5rLvDzIpQW/d4DBmQcXgdlVYz/qTYSBiK1oV3sdABWAMNJ?=
 =?us-ascii?Q?v2aEb3Y/sbwZ/rzH4mEV27+9l6lChiA15LtCOPVrA3MKe08ewjb+ga/hXOGS?=
 =?us-ascii?Q?CFlFH8dn0IlMTAHDnnGtcLRQCB1Zdp+awjdOxfotcspc2MhvFXDqddHvM77h?=
 =?us-ascii?Q?s9rE/nnu+A3cNGXSXpYNKEJmHEufb2HJw2fQr9qE5zoAxgu5ftWAS0s+eCRA?=
 =?us-ascii?Q?K4OzUjqUv+laGTXJ3nBF37WbmJ5NsDmklNwMt9bhghn0LpP6xSWzj01325vN?=
 =?us-ascii?Q?Fqo/moeTYM2JRRnGdWeKm7CTstLsc2kRE7YE829EyKhzVzr16+osecUR/Za0?=
 =?us-ascii?Q?I1+Z24HLObMLNs6AaFBSw5E2SQz3yIMkEJvt0S/ly1RV3kpu4FQuP8eWk7Ry?=
 =?us-ascii?Q?z9IP/r84YApQ674jTFy2XpbfC32CbgxbbfBRyrB39zLi0mirqN28PTyr+YCx?=
 =?us-ascii?Q?t4NXsGhptaJ3/o50e0JZIygaiikhq1GssULV28GTQtNPWGywnso6JWeGY09R?=
 =?us-ascii?Q?6nmtF4dL0ys0nbJNxLix4sOTxSjx3ejoHkGEDqXmAccf2wd/l7uH5HfjP6v+?=
 =?us-ascii?Q?K84d3GjV+Z6QOEY1naFrD/q/TU/mZhG5b5KRXrWccxJ67jZ+qYRmTE8LxOqp?=
 =?us-ascii?Q?1+NkrI7b12gae8QoUEuhGZyrmG9xIETiR+qGicqlB0v/wqxHzPKxd2FXQMMi?=
 =?us-ascii?Q?pqYA1BZyJaytauVWA9d8rzhvO2Oxrab6qCgM1glx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ad327c-3209-4501-e4c8-08ddd502a3ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:02:27.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA0u0JZ7bVtuuwGIQEVfmC3NFUm4uX01MI4NfwaFcUE1qs6JhGnqgW1Xqkav05PSZki0tduRREJVxJZxXbN6hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_090236_154918_E902AEA2 
X-CRM114-Status: GOOD (  29.49  )
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

On Tue, Aug 05, 2025 at 03:34:43PM +0200, Lorenzo Pieralisi wrote:
> With the introduction of the of_msi_xlate() function, the OF layer
> provides an API to map a device ID and retrieve the MSI controller
> node the ID is mapped to with a single call.
>
> of_msi_map_id() is currently used to map a deviceID to a specific
> MSI controller node; of_msi_xlate() can be used for that purpose
> too, there is no need to keep the two functions.
>
> Convert of_msi_map_id() to of_msi_xlate() calls and update the
> of_msi_xlate() documentation to describe how the struct device_node
> pointer passed in should be set-up to either provide the MSI controller
> node target or receive its pointer upon mapping completion.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> As suggested by RobH:
>
> https://lore.kernel.org/lkml/20250627213241.GA168190-robh@kernel.org/
>
>  drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c |  2 +-
>  drivers/of/irq.c                            | 25 +++++----------------
>  drivers/pci/msi/irqdomain.c                 |  2 +-
>  include/linux/of_irq.h                      |  6 -----
>  4 files changed, 7 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
> index 11549d85f23b..b5785472765a 100644
> --- a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
> +++ b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
> @@ -30,7 +30,7 @@ static u32 fsl_mc_msi_domain_get_msi_id(struct irq_domain *domain,
>  	u32 out_id;
>
>  	of_node = irq_domain_get_of_node(domain);
> -	out_id = of_node ? of_msi_map_id(&mc_dev->dev, of_node, mc_dev->icid) :
> +	out_id = of_node ? of_msi_xlate(&mc_dev->dev, &of_node, mc_dev->icid) :
>  			iort_msi_map_id(&mc_dev->dev, mc_dev->icid);
>
>  	return out_id;
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 74aaea61de13..e7c12abd10ab 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -673,13 +673,14 @@ void __init of_irq_init(const struct of_device_id *matches)
>  /**
>   * of_msi_xlate - map a MSI ID and find relevant MSI controller node
>   * @dev: device for which the mapping is to be done.
> - * @msi_np: Pointer to store the MSI controller node
> + * @msi_np: Pointer to target MSI controller node
>   * @id_in: Device ID.
>   *
>   * Walk up the device hierarchy looking for devices with a "msi-map"
> - * property. If found, apply the mapping to @id_in. @msi_np pointed
> - * value must be NULL on entry, if an MSI controller is found @msi_np is
> - * initialized to the MSI controller node with a reference held.
> + * property. If found, apply the mapping to @id_in.
> + * If @msi_np points to a non-NULL device node pointer, only entries targeting
> + * that node will be matched; if it points to a NULL value, it will receive the
> + * device node of the first matching target phandle, with a reference held.
>   *
>   * Returns: The mapped MSI id.
>   */
> @@ -699,22 +700,6 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>  	return id_out;
>  }
>
> -/**
> - * of_msi_map_id - Map a MSI ID for a device.
> - * @dev: device for which the mapping is to be done.
> - * @msi_np: device node of the expected msi controller.
> - * @id_in: unmapped MSI ID for the device.
> - *
> - * Walk up the device hierarchy looking for devices with a "msi-map"
> - * property.  If found, apply the mapping to @id_in.
> - *
> - * Return: The mapped MSI ID.
> - */
> -u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in)
> -{
> -	return of_msi_xlate(dev, &msi_np, id_in);
> -}
> -
>  /**
>   * of_msi_map_get_device_domain - Use msi-map to find the relevant MSI domain
>   * @dev: device for which the mapping is to be done.
> diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> index 0938ef7ebabf..555c61b1fc36 100644
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -422,7 +422,7 @@ u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
>  	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
>
>  	of_node = irq_domain_get_of_node(domain);
> -	rid = of_node ? of_msi_map_id(&pdev->dev, of_node, rid) :
> +	rid = of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
>  			iort_msi_map_id(&pdev->dev, rid);
>
>  	return rid;
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index a480063c9cb1..1db8543dfc8a 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -55,7 +55,6 @@ extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
>  							u32 bus_token);
>  extern void of_msi_configure(struct device *dev, const struct device_node *np);
>  extern u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in);
> -u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in);
>  #else
>  static inline void of_irq_init(const struct of_device_id *matches)
>  {
> @@ -105,11 +104,6 @@ static inline u32 of_msi_xlate(struct device *dev, struct device_node **msi_np,
>  {
>  	return id_in;
>  }
> -static inline u32 of_msi_map_id(struct device *dev,
> -				 struct device_node *msi_np, u32 id_in)
> -{
> -	return id_in;
> -}
>  #endif
>
>  #if defined(CONFIG_OF_IRQ) || defined(CONFIG_SPARC)
> --
> 2.48.0
>

