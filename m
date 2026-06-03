Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637CFCD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+XsMPHuER5eEIi5VDioDLPs4HRUE0FOTBQ2UO3LDwI=; b=wGBLcswf4IMfz0R4nE9PyqrnoI
	JfoKmuSbBSm98+nLdgBbYr62d7tgVwXeFK3eQabDoHUf/ptd6oaUkvOsRM/y8bi/iDm3YCcvWmwWp
	YgGL+UNzg1i2qPz4rG8n1BG1PIz4kbgnv+BAP2LxYCobvt1tewdB7V+tdemQ4BAo2RwF21Wir+7rs
	s+U57wnS0NtNgpk+AyHFMOaEAYtrXeUPsjlc8Q4uJU53Uk5o8q2ls892LhR8dBHaDchNsUf8aHCJM
	cRjRmq6wq7gzogczAbVdpvYKJvQ5KOyeKoQoL3YcfXL9TEKGP5HUF1VEVb9m0R2Ln5xQLt/N26oUd
	LpRcK+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUi9X-0000000EjZT-3bDH;
	Wed, 03 Jun 2026 09:44:47 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUi9V-0000000EjYf-2BqZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqRi2e3a4mPQbWBBjDZkoOYIW+xzAiZeIGIkGWXfO3+BXBZ1gTfYsojvoq8hJOZWm85mI5QNJbzfxpWV01QcVNDOW7/Ii5Hj8+iZzQ1eBL3nlZlZcc4Kz6H2txsgerZHeN2Zc1jBruI1OhxriLCjb/R+r9iXCF1AM9/gWk5YnhAhuXMatC/z5k7j2zud2lMSG0LrFt5FjgxyOlOtbzSH/5vOid3rszJVlwIdp6W6RwfXgpcIMRzMsm29Yiy6dVIii+thctNpKEWAlwodTBkEZbxUVJ/9/GYHUzC7znCdW2LBpETZlvwkNLFEri2ARVyGIRGS6RqCzufHqTaM0WxjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+XsMPHuER5eEIi5VDioDLPs4HRUE0FOTBQ2UO3LDwI=;
 b=o5Eh2DCqZRkqrzq0tm4samD9FDOUNC/bZ5flQkfu97hn6Ao1xp/95aRFvSol4on2TfIdUI5D6mXJebXaxzgL6U3Ov7PUHzEs9q0O6ub9kOx55DyOJDAL4yW8oHvV6B7zC+vVNOSIDQRqdM9xvW8n/GfziwvBjRf/2StipfJdU88+Eusi7OinAK0DUUDmTCZWW+MZz3pXGdUte0P7vu0me8Rthz0Kh2oCgcClBhRVkkUOmNHC0cprYkhwA2H1CU6rv9yAB29Ej44bpF0JFEY0RONJl0Q4YaDhf6nDwwsnOoPex0f2lRup/2jzN9VyrzZxKQUi9SjhkCadAd55yDxAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+XsMPHuER5eEIi5VDioDLPs4HRUE0FOTBQ2UO3LDwI=;
 b=uTHRks8TP3Nt0vOhlaYm1d1MU2sj9MlVUoWEcASJyPh5tGqXWsqK6aukIjRk+UBEirIJF9nL7gwdSbmBKwlKSnell/bP+PcFK702l8cduRjDskyko3oJ/0Yo7cS9GHrs5gtGwhQjVNo0X5q66qwlKLroHmZAuituGGWuIYCl6Xpgm5qk4WpD4yFoLe6pNTV+kbUAMFpB/J8BvpC7RusgfpoQzR4GpTzWrjbAjXo7TeBVCPIGT5Cj/cfCvfPKqRqA7tg/lmgy6OkmzsDRn1HR/V8vvq9s8EfFZHHOo84vms90lm8nBLLbsTmCgf0x6RyDjhk4LUCDCSqXoBzqYAd8tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by AM9PR04MB8636.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:44:38 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:44:38 +0000
Date: Wed, 3 Jun 2026 17:39:41 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-can@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH RESEND v4 0/8] can: flexcan: Add NXP S32N79 SoC support
Message-ID: <20260603093941.ysev5do557hy2rui@nxp.com>
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SI3PR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:4:297::7) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|AM9PR04MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 119246c8-0ed2-485f-915e-08dec154ba2f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|376014|1800799024|366016|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Y/GuFbJ4kvOBGlDOMGFeNyL1QXhCfy+w4fiAaNqzFuuWg7CobSz7cv0NA8yTDE98F5+DU3iiE1WxjF7SvWgVL+ByXr02BgGfb+aBmgd7UTIkAP8EwomjrxfWjWDSWefwd1b7ZC4o5nGRiGCfhQUAkH4nz7JnTeogkEvlo8E87phiV1UJuf7Hkldme38xGW4qq4V5F+UTote4l6ralX9j+PO1WN5Rnpu9fzkGzxYSUJzDbJosQhFS0ZPDBjWjIDXXX7mHDfxy3ZDPAPrMl2OcGMBdxhU2VCSvfwYPXWkkjBtq8gxAW2OejcTYGtzbAGDUmgPEIvAIqtK4afhC3gbtfQpFldXGCOBdhOzhIoJfr5cFhIHiXBn+OMVsLTNUdNP9GCvlp1Q1kCfhtRNzCgp0/30mU1ZIFVD1JnIpbREDfVtE5eBsJGlDDjSEcbiJ4SjTEi5ZTgq+p11PGNY0XgrZYSgPwkUbjx87cgxJOpIAivrUchKOX8imc05Or0hHzL8sOfs6Gh9hZq7KEt4/WomyrUflC8s6fLDbDNnN7i2wo1QyhZ1rLnLyFyrh6G3WuzyylW0VmQ7+EEl8z8/L+DAOA7+IhmOc1p+NhXDE8nJ0U8SWHB+YNNvG+Bpln5is3keHJnbEli+EG0B9rES9+DvhDwUjhLrqTQ/NHd0LuTw19fAmMx7D+PIbUzLF/4+yqRru
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(1800799024)(366016)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u0IKAEz0bgj1ul94q0XjxxeOSXy45r0N1YQhZ3hMYVbfmjjpb+F37/2oTkhr?=
 =?us-ascii?Q?sg08yksvTbgBMhOEN6PwPAVeu7eqoKr2GQj+8i2GBswRNwhvx9VYKSlqfMYY?=
 =?us-ascii?Q?LujYCNGWzjdkuE73QLQi5yv5sXk0kkYUKc4rw1c4Ty1s5QcqpZ9CaQmQRfYj?=
 =?us-ascii?Q?ipf5WOHoMoxkg4Db2HbB/3tAeqVFEOb17GY55bG3BFbFDST+bu0/xuKAMrNJ?=
 =?us-ascii?Q?eLOkNaESdwRqvRnTOASopz0WajwpP4zenWq6i1IV5SX0RSE3wx9c1xuUZbKz?=
 =?us-ascii?Q?poy3wvYZlho1zXjatsu1I3Mr64JZwFiL4kB9vBQHG0GJehGZFpuZKkeOfAC/?=
 =?us-ascii?Q?7eGI8GiMM42Zx7phfxfr8SH2jvVtjAWCrNLqhOongTID+46Wc9C06n5n2BSV?=
 =?us-ascii?Q?vrYAXyz7/EDq8xpR7YglMspyHf9PAdId+pJsA1zjc1rvJeiU4JIrRNT7RPgF?=
 =?us-ascii?Q?+wibaRDdRAGz+NbJ7nd2xrXlS+VGEMJIgtFBngpCnP8eOBOol8GYSJx5HQE9?=
 =?us-ascii?Q?qvS7pKKBd28acLh5ZTnOT1ur63EYPW26aBwcdpysVhO4+A8laao8wpTMJKjH?=
 =?us-ascii?Q?Gub+rvldXbhsy1UpnPiMHCavr15sh8pV/rwKoW4xmJIHfFUCyEJQcVG6inlp?=
 =?us-ascii?Q?VWRddGjLoL4C53p/Tl9P8HBHuCxWpGeTuB/eGAt+seRSAH5pv6PQDesRx9m9?=
 =?us-ascii?Q?0MKA2aH2UX6V90SaDVhdBvTZj4HP2Z7+XO/tch5M6LKDUMf+o63irfWuEBuL?=
 =?us-ascii?Q?Yzc9S+LxfPARkDRV/Xii0bgZtIiRkW+0jqASFxFHZ2J4RUBe774VlBgrdTgb?=
 =?us-ascii?Q?UDvsG52FNDmHO0h1zfT/Pu9+Q3dN8MRx2E84OOiHnOSElRUgn5LtrYvpVqyi?=
 =?us-ascii?Q?kRgD/B4sZ0akkNEHJaZCCyDmmGjhJsfX778niMgpnC4ZaEH6qhoss282L2oK?=
 =?us-ascii?Q?5iDekYoeLurZcJpXL08HT/Qv0vavLyeL6DiFnTwn8Ighlc8PoCTvS5stZO3C?=
 =?us-ascii?Q?yJpfeNkPCyQ4K+vTOvF3aUqRa46to37VAvFkKquCJgnCslGhAnelhfESVPkx?=
 =?us-ascii?Q?0evoxCfF7wf65aAkCyvCqMU4aYw/SUTiUaQCN9T4JunvUvYW9EN97z19x9ow?=
 =?us-ascii?Q?Vio+P9eWoxE5mdVGUSt9glXbgoACVQsS8JFhvj/+UTfRckxcuGJdL/pwLl4/?=
 =?us-ascii?Q?U1etbwq6CxfAs7C/rpqw1VF3T88+PK0wEKt97QxMCP4Ru8g0IcuoLc8V9P+C?=
 =?us-ascii?Q?VrALuiQOY0n+0FQ764ht7tjP8FXeRFgy3k8ZPDJzAcvuAKkLN6rzIgaErug1?=
 =?us-ascii?Q?pJE27Nr6d7YRvn7xtY+yCot4kd/AiDb5UgzBiHQHc54x7o2Y6Z4F/BbdfU5t?=
 =?us-ascii?Q?e0r6+NohEDHo2UG9HTqWDgzGsX16t0XxlXLY1QSVMJIjFo4PjCqKxR3tQv+Z?=
 =?us-ascii?Q?OqvkYscGxmY57Deo0P/LV5xXyRjSjoXtJWU6F0sq4fJbfptMHC+Q4NfPvCEz?=
 =?us-ascii?Q?4L6wBblLQH2oBmX6KUILqAJU5JOKCe8adu8D/ppPXWPFDeWt7GV6zCNSftoa?=
 =?us-ascii?Q?VxGI1oXEzWrSTJL9MqqzR2PgflPtxu39oIhs2+appfs9rE+2sZBs91mRn2lb?=
 =?us-ascii?Q?Ygy6aMuzBPlj1ldimQHKdwFMp/PEUstbEtQD8UoITqQWyq5BcjIrbk08zOe/?=
 =?us-ascii?Q?cdFgL/Y+KF9UrKqpphSgefLhd8qxp3OrXFAHPnqUvzxRI50T50f0Knxtz9lg?=
 =?us-ascii?Q?a2J+BHWa9bZsCPlrcsdPWrHp3Hd9mVSM3/qkSktvJtdzFZ77oQjz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119246c8-0ed2-485f-915e-08dec154ba2f
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:44:38.2843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gAo4pJcMviydqq7G6qnawM9vLJVI+THeN9Vsgw+9ZHqPOoiMWSV3yRHK6VJfqiDNqmE3Brhx3n5vUFF1kVOam+0uR80sijAs6oSdwX4AYQGZ94+ml0sm5mjFWgiRee0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_024445_592930_65433C58 
X-CRM114-Status: GOOD (  22.37  )
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

On Wed, Jun 03, 2026 at 09:13:34AM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> This patch series adds FlexCAN support for the NXP S32N79 SoC.
> 
> The S32N79 is an automotive-grade processor from NXP with multiple
> FlexCAN instances. The FlexCAN IP integration on S32N79 differs from
> other SoCs in the interrupt routing - it uses two separate interrupt
> lines:
>   - one interrupt for mailboxes 0-127
>   - one interrupt for bus error detection and device state changes
> 
> The CAN controllers are connected through an irqsteer interrupt
> controller in the RCU (Resource Control Unit) domain.
> 
> This series:
>   1. Splits flexcan_irq() into dedicated handlers for multi-IRQ platforms
>   2. Adds dt-bindings documentation for S32N79 FlexCAN
>   3. Introduces FLEXCAN_QUIRK_IRQ_BERR to handle the two-interrupt
>      configuration
>   4. Adds S32N79 device data and compatible string to the driver
>   5. Adds FlexCAN device tree nodes for S32N79 SoC
>   6. Enables FlexCAN devices on the S32N79-RDB board
> 
> Tested on S32N79-RDB board with CAN and CAN FD communication.

Tested on imx95-19x19-evk board with CAN and CAN FD communication. No issue found.
This means this patch set do not impact the original platforms.

For this patch set, feel free to add tag:
Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>

Regards
Haibo Chen
> 
> This is a resend of v4 with no changes.
> 
> v4 -> v3
> - flexcan_chip_interrupts_enable(): disable/enable all IRQ lines
>   (not just dev->irq) during IMASK register writes
> - Split rx/tx masks per mailbox IRQ line (struct flexcan_mb_irq) so
>   each handler on S32G2 only processes its own MB range
> - Added received Acked-by tag on DT bindings patch
> 
> v3 -> v2
> - Split flexcan_irq() into dedicated handlers (flexcan_irq_mb,
>   flexcan_irq_boff, flexcan_irq_berr) to fix duplicate event
>   processing when multiple IRQ lines run concurrently (new patch).
> - Added flexcan_irq_esr() handler composing state + berr for S32N79
> - Ordered quirks used by s32n devtype data by value.
> 
> v2 -> v1
> - Renamed FLEXCAN_QUIRK_NR_IRQ_2 to FLEXCAN_QUIRK_IRQ_BERR to better
> describe the actual hardware feature
> - Appended new quirk at the end
> - Switched from platform_get_irq to platform_get_irq_byname usage
> - Updated interrupt description in dt-bindings
> 
> Ciprian Marian Costea (8):
>   can: flexcan: use dedicated IRQ handlers for multi-IRQ platforms
>   can: flexcan: disable all IRQ lines in
>     flexcan_chip_interrupts_enable()
>   can: flexcan: split rx/tx masks per mailbox IRQ line
>   dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
>   can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk
>   can: flexcan: add NXP S32N79 SoC support
>   arm64: dts: s32n79: add FlexCAN nodes
>   arm64: dts: s32n79: enable FlexCAN devices
> 
>  .../bindings/net/can/fsl,flexcan.yaml         |  30 ++-
>  arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  12 +
>  arch/arm64/boot/dts/freescale/s32n79.dtsi     |  50 ++++
>  drivers/net/can/flexcan/flexcan-core.c        | 249 +++++++++++++++---
>  drivers/net/can/flexcan/flexcan.h             |  12 +-
>  5 files changed, 316 insertions(+), 37 deletions(-)
> 
> -- 
> 2.43.0
> 

