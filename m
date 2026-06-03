Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5354ACD6E6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZzABiD+Y9NW4W0IfLoq3EPHnlZMdPk1rCC0LnYNhQQ=; b=idiULgm9pq3QrzAQW8rQbzqyEo
	rOxwdOG5P5Gko1TnuwObacVNjzOV29GuaPCZJo4D6LrujERsYwRDxdHqKuAaAUc3mzKVnd3aIAPht
	yU5+Oba+tvgMYB9UrfoFpPhOKdNF3FofnPFT2ifJQFxn442egFTZtYrFXr4INjucuPBnvluP4KWsw
	9UfbrvbuOaIOKM34vhLHLtTd3cmibzA05aLEgjLxjrB/yMH1HMNDELnuBmeR/Wv9mRQZRz0YrTpJe
	X6foWcjBGMMicABGCzhwy9i/C/Kls/KhKzR0Q6xjIAMTPNL/91RSc8lf3gfWizroaD6PPqpEUMiyC
	QTBvSkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfnc-0000000ERex-0f3h;
	Wed, 03 Jun 2026 07:14:00 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfnY-0000000ERaC-1ede
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 07:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJ93M7RAmybdafhvdOpW5IhtpJIhaUSB77Gp7Jp2KzjMzAha6WuFJyBLQtrlznmdMBbzMUQ35HkcmYkoDUmk7G1NiakrCWWzN4kifXOx4c21qG9bsvLc9HkKW3HOxTbRmiz59YpHMY64J/FCUe5/JcokFdh0iL91W3TlO2VycNApmpIx+fqYuivtgMuTVfjlyDtl6EyLM/9kVZxHvg5epj89YItuY4lvBXzRDY0r3lwjovvlq1+Jbohhm0FJtv7mzomIfmEb6zov5jva8CLKECFj4jv1vzwpKsupe45OMv7cWUgqqWlEUN8VFxzvwq+eoGmBejIepyDGir16wtBDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZzABiD+Y9NW4W0IfLoq3EPHnlZMdPk1rCC0LnYNhQQ=;
 b=Xy1tHwq3BbZUoJLBPh+EglHPG7alk3Ao5zrULDMxbXqK+aLCUr2F0IcMIOlYXeoif7BBmS7BWUxjkjQquBdEB2ofjWJKiUBnnqapesyKyoewB7pQt0/vDmGL/RzVaHAr6wg40UDPMaso0b1f9URACfH2CM5fsp092RCYlpRvNM1DHs+/oAIFnuGPQhYee0UyIRJlMb75AWgi9L+GtwjK7+6aHJW7nIb3d3KvRxwiFN0jkl0GSYw3+U8UKMn3w+DPN5ikM//5w+BeAj1LL7SSU8sh0pmpzWXRad/4jN8BXgfDmKXyF9hXlEIvnKUb3vl7PQO9GbrZJ5MC30lxJkBRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZzABiD+Y9NW4W0IfLoq3EPHnlZMdPk1rCC0LnYNhQQ=;
 b=HlePR4QM9ISsq8yfdatgpgW9d1pjk0rx9sqB5ohYy6YcEkcQsHuFlY1tKvVNOH1IIdTGUy+bR18SvZQHXqiDA7qGzdNakEcyGe2stwX+vNlknoEEU94QzlG7Y/lMR2ZmDdvbu+f/P2/V+Vl/UFFh5z2/eFswg+1gLrIN3YLKYhkcytuDu01/vgd6svYcZUeVReXGozrGemRzAbl6kAynMdU+9cTrROonv4i8X3Q7BzuDLVCodC2J2D7mz5WrHRQK1iufokxzZjAT+YIHMgTDc79jMYmIyGfFEGu/Mlkr+F+EEXQb61ubJIwYDKPzCNXrSirhDryZ04UlCMCbOTW6rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by PA1PR04MB11406.eurprd04.prod.outlook.com (2603:10a6:102:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:13:52 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%4]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 07:13:52 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH RESEND v4 3/8] can: flexcan: split rx/tx masks per mailbox IRQ line
Date: Wed,  3 Jun 2026 09:13:37 +0200
Message-ID: <20260603071342.641874-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com>
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::8) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|PA1PR04MB11406:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac1b481-d3e1-4484-88a4-08dec13faa3b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: wuLxjElZz0Ogry2ErvH20hEImWs6FjxZnELTP5z6TwBgv/SFr9n9nPoACXD8rkVRtHvCnRQU38EegOCOVKD20L70ded7bR2Zhf4VvUKK2N+S5ASJCMy6X+x9ZuB2RBjliLt4a6WvX/zMPJiiYr973QQwR/ctkeWPJkcQziM35I/gK7RTvle9xoVCB5eFSwnYfgl1VsyBfCtvSefPL/k2nb5xnWk9FNP128GwTlwyISI21tTnrLRjLEsVE1oMatP+e6m2sG08l5QYUbRYpu9KZ3RA9s22mNZVPSqSsApBit5iycEeIuL2hqL5CPJOb1ze4sVi77o/u+b9YXd374DEj4ufxRL8SFbWi/Li+sy43sJMkflSos2MkmDy9Y9UnBkx0FDXlo/Q6hhdEYvuDySJXNH1J7cATce8bJ5KNVJHSzjlpMGmrkuuwm9nr2fS9VSDrVnrdCoMEt/AND5wvhLNH8BcuFruJnP6kkxKbqPW9/LwzMLY4YToc9I9ZMdr2+dbSGg3zY/Pq6dojBfFL5zK0d5QBK4/TFPoTUNVTJ25BbekRAnXaoXLfJFByZAPI2zwpH63B+qJfDqRhZDq5cXd4l5hgMKkkGQTkwJ4no86s/xfAQMFYrHh4vto3c/b0xBE+wac0bzAMZnoAudc96Vh+SFk6cgm+A+Jg7953UBqNAY/tUWxLcySIYy4bEBbnWV/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVdIR2VDYVNKY0FHS1VTaTR6eUxRUFNzbHlUWlRjcGNadFNES3BSUnVQYTNy?=
 =?utf-8?B?aTV5aHFNbUNYTm1oUmRndzkwZ1Jud0c2VDk2OVQ5aEJpK3FTMjZtT080SzZX?=
 =?utf-8?B?NXViZTIwckU5dzhrc09YeTRoU3E0ZEQxWXlJTmF2N1FpRUZqaHNWNlBGSlMv?=
 =?utf-8?B?WmRwM2Rxc05adlRyTDAzazdtVXNKekszWjVQVHNUNGR0QU1pRUJ4aUdpVTUz?=
 =?utf-8?B?ZFFlb1AwVXo1M1o5dzRmTzZkR25MMFdEajE3dzJ2M1VaSTdFdGlxWHhYTU5m?=
 =?utf-8?B?K093Y1NJRFlTdVJkZUhSNytiSDBzU1dNQXVNZUdVazJSVkRCMnpTbUFZaldw?=
 =?utf-8?B?dmgrMDNtNHBjb3NhV1kxdUI1d2Y1ZU0zRDRvVWM0bmRTdVI0dVRoNi9UdzE3?=
 =?utf-8?B?K2tSQjhObW5JWU00V3BWWnl6UFBDb0RNRFR5elRzUUNJWkNFVXphdzJhdWZ5?=
 =?utf-8?B?NUFYR2k5SnVBV1lWc24xK1pjZExmN29heURhOXprdjNaTlV0S0xXb2EyUVg5?=
 =?utf-8?B?N3BVbnQwL1M3SVlnWjBrTUkrdlBZb0t4bHFPMDJzUUdGMGcxRG9qU2N4K3NY?=
 =?utf-8?B?QkJJWUpEbHNLUmRRZ2I2QXBOK1UvZUJudG9RQzVFbEdJQ0o1VUhmTlFPVVJ1?=
 =?utf-8?B?bDRlOU5pSVhzeTltYnB0YUgvOWViZnl1NlY2MDUwZjV5R0tXMXZMSTFsblBN?=
 =?utf-8?B?QTBSZmErWkVNNTZNYjQ4QjUrcGRqeU83L3VsQTFVSXBMUE9IeUhTVUtRVkhs?=
 =?utf-8?B?QjNGRkVKNUJNQUlSVWR3OU1PR1dVRnpldm0zVWRQZUpEWmxhLzFTcE9OQzRa?=
 =?utf-8?B?dkpKbVQybVg1WDJKVVg0L21mVWEzZk1kT0xiUitqeGI3WWZDMm5KQ0lCTWp0?=
 =?utf-8?B?STNwUlJKd3NLYklLSmcrY0crUzdYQWhDRGZGdGlPKyt6alRKL2dzZ2JJZDd4?=
 =?utf-8?B?Zmt6TjJnRnVyUk81ZXIrZVF3Zkh0WVVuWm1CanFnUkRuWG1sS3JkTi9qbkd4?=
 =?utf-8?B?bkQ1T1dnQXhDYS9oQ2pqQ3JxNnFVazZxSW84OHRGU2YzeGROOXBvUnVyNFBJ?=
 =?utf-8?B?dFNJWVdNcm9Zb2t3YURQUUQzQUdNaDF4cWhmVjUweGhJZ1Z1TzRJZkRjNk45?=
 =?utf-8?B?WjBsc0Y2dXlzM2Z6dXJOb0orUUpvWmVUUDhQSDZIZURaM3laS2ZlcXErZU1w?=
 =?utf-8?B?bXpiZTVhQi9iNUlWYjdYUTJjVjBGV1k4U25XdFlRQUgvRTROd2dLeDhPZmZ3?=
 =?utf-8?B?d0E5MnYveXgwYklvTm0xOWpkcFBCS2tUUlUzdVQwY1RZU1lDREtIQjFydngr?=
 =?utf-8?B?UmZlWjNSbEFVTXdUV3ptWjRBbVlBeHN5SmRFL2pHSzhrUEpxRkJmY2o1azAv?=
 =?utf-8?B?V3RaQS9XbU52Mk0wVEd4MkVSN3Q1QllHd05EeHQzQjN6T0JEWHpBTXhBZEhI?=
 =?utf-8?B?T2x0b1RIM016NXJ6c0lJdWJwblBTUHRXMVlNQ25tMmJTeUFIaUZEZkxhMHpG?=
 =?utf-8?B?aTMrTXF0K2dzbXVjRk40ZUlWYmwrRjRsMTY5cUFGSTEwNmlqSzJDZjEyVVlM?=
 =?utf-8?B?VUd4ODcwRGZGUmJXeTFDVlhFVHZCSldCc2VQWi9hWk1UUXk0SGU4VElBSWY1?=
 =?utf-8?B?d1dqS0t5UDluVWFMK1hBQTBXcDh0TEdqamwyUksrWFU0WGxDNVBIWVR4U2Ev?=
 =?utf-8?B?VC9jbmVMZ0REajhtQ1QrRlNYeWhkSDFCejcxSng1TWpuNlU0RFJtOUdnT1NM?=
 =?utf-8?B?eTgvcnNWbmVVbkQxYzZJdCtBN2dtQnVHanU2V011Z25FOXhLR1gvQnRXYUgz?=
 =?utf-8?B?VVhDanRkTzRLczJVNUtqY0Urc1BiNmJNdWg2RThaYTdYcFM5em5MLzlsejFz?=
 =?utf-8?B?eTJhenZlbFBuYzU0NXc3bTgwekt1b3UzOFhnZlA0S0JiZG5qOE5LRjExNFkz?=
 =?utf-8?B?eFUxclNwRFUyQTlqSmVtaGR2UHk5bDd2WkUzYkUrWmZEN0xBRnlqVnVmSndG?=
 =?utf-8?B?cFl1ZG9Sa1pCWUluTURweXovdGNxSDRFMGJ1V3MxM2dSSWhHT091RStHVU8y?=
 =?utf-8?B?ZDBqQ01RNUlld2diWFFCNnNzc3I0MDZsN2pJVXBBT1hObDJzaERiTjlKUUVW?=
 =?utf-8?B?b000UlBwendxUmJmYmRQL1A0WHZkaEg0bmRLT0FYMUcwZ0xoeDlDZHBpVFFp?=
 =?utf-8?B?UEZEQlZYM3BzUWdYM29YWDJRTldSc2dYd21PWHZyRERoRlhEMHFzZXY0NjZk?=
 =?utf-8?B?anhtV0EwSWpUN3pCTGR0WHA0aUoySmNybnNWdVJmTHVkK28zLzYrMFF3TmI4?=
 =?utf-8?B?S2p1UFl2a1FGMTdnKzRhQTVNU3JqRUVuUWxyTVdpSkpvODNOTUt1VFp0NW1n?=
 =?utf-8?Q?BxCGc35/XpGrfKoI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac1b481-d3e1-4484-88a4-08dec13faa3b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:13:52.2445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvZ1iYf32ELQnxMi6anKHQoFrVzfYt3avr8bp/Zqp9zKcSCzFWBv00IhRud+P4wxQG/COeQrwMc1toCoGYkm9M3n6Fpi6LAYy5yjiZza4jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001356_576877_F66902E0 
X-CRM114-Status: GOOD (  16.78  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

On S32G2, which has two mailbox IRQ lines (mb-0 for MBs 0-7, mb-1
for MBs 8-127), both handlers currently process the full rx_mask/tx_mask
range,

Introduce struct flexcan_mb_irq to hold per-IRQ-line rx and tx masks.

In flexcan_irq_mb(), the irq argument selects the correct mask set: the
primary MB IRQ uses mb_irq[0] and the secondary uses mb_irq[1].

For single-IRQ platforms, mb_irq[0] holds the full combined masks with no
functional change.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/net/can/flexcan/flexcan-core.c | 61 +++++++++++++++++++-------
 drivers/net/can/flexcan/flexcan.h      | 10 ++++-
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
index 7dde2e623def..32e4d4da00a1 100644
--- a/drivers/net/can/flexcan/flexcan-core.c
+++ b/drivers/net/can/flexcan/flexcan-core.c
@@ -957,14 +957,16 @@ static inline void flexcan_write64(struct flexcan_priv *priv, u64 val, void __io
 		priv->write(lower_32_bits(val), addr);
 }
 
-static inline u64 flexcan_read_reg_iflag_rx(struct flexcan_priv *priv)
+static inline u64 flexcan_read_reg_iflag_rx(struct flexcan_priv *priv,
+					    u64 rx_mask)
 {
-	return flexcan_read64_mask(priv, &priv->regs->iflag1, priv->rx_mask);
+	return flexcan_read64_mask(priv, &priv->regs->iflag1, rx_mask);
 }
 
-static inline u64 flexcan_read_reg_iflag_tx(struct flexcan_priv *priv)
+static inline u64 flexcan_read_reg_iflag_tx(struct flexcan_priv *priv,
+					    u64 tx_mask)
 {
-	return flexcan_read64_mask(priv, &priv->regs->iflag1, priv->tx_mask);
+	return flexcan_read64_mask(priv, &priv->regs->iflag1, tx_mask);
 }
 
 static inline struct flexcan_priv *rx_offload_to_priv(struct can_rx_offload *offload)
@@ -1071,7 +1073,8 @@ static struct sk_buff *flexcan_mailbox_read(struct can_rx_offload *offload,
 }
 
 /* Process mailbox (RX + TX) events */
-static irqreturn_t flexcan_do_mb(struct net_device *dev)
+static irqreturn_t flexcan_do_mb(struct net_device *dev,
+				 const struct flexcan_mb_irq *mb_irq)
 {
 	struct net_device_stats *stats = &dev->stats;
 	struct flexcan_priv *priv = netdev_priv(dev);
@@ -1084,7 +1087,8 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
 		u64 reg_iflag_rx;
 		int ret;
 
-		while ((reg_iflag_rx = flexcan_read_reg_iflag_rx(priv))) {
+		while ((reg_iflag_rx = flexcan_read_reg_iflag_rx(priv,
+								 mb_irq->rx_mask))) {
 			handled = IRQ_HANDLED;
 			ret = can_rx_offload_irq_offload_timestamp(&priv->offload,
 								   reg_iflag_rx);
@@ -1110,10 +1114,10 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
 		}
 	}
 
-	reg_iflag_tx = flexcan_read_reg_iflag_tx(priv);
+	reg_iflag_tx = flexcan_read_reg_iflag_tx(priv, mb_irq->tx_mask);
 
 	/* transmission complete interrupt */
-	if (reg_iflag_tx & priv->tx_mask) {
+	if (reg_iflag_tx & mb_irq->tx_mask) {
 		u32 reg_ctrl = priv->read(&priv->tx_mb->can_ctrl);
 
 		handled = IRQ_HANDLED;
@@ -1125,7 +1129,7 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
 		/* after sending a RTR frame MB is in RX mode */
 		priv->write(FLEXCAN_MB_CODE_TX_INACTIVE,
 			    &priv->tx_mb->can_ctrl);
-		flexcan_write64(priv, priv->tx_mask, &regs->iflag1);
+		flexcan_write64(priv, mb_irq->tx_mask, &regs->iflag1);
 		netif_wake_queue(dev);
 	}
 
@@ -1228,7 +1232,7 @@ static irqreturn_t flexcan_irq(int irq, void *dev_id)
 	struct flexcan_priv *priv = netdev_priv(dev);
 	irqreturn_t handled;
 
-	handled = flexcan_do_mb(dev);
+	handled = flexcan_do_mb(dev, &priv->mb_irq[0]);
 	handled |= flexcan_do_state(dev);
 	handled |= flexcan_do_berr(dev);
 
@@ -1243,9 +1247,15 @@ static irqreturn_t flexcan_irq_mb(int irq, void *dev_id)
 {
 	struct net_device *dev = dev_id;
 	struct flexcan_priv *priv = netdev_priv(dev);
+	const struct flexcan_mb_irq *mb_irq;
 	irqreturn_t handled;
+	int idx;
 
-	handled = flexcan_do_mb(dev);
+	idx = (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ &&
+	       irq == priv->irq_secondary_mb) ? 1 : 0;
+	mb_irq = &priv->mb_irq[idx];
+
+	handled = flexcan_do_mb(dev, mb_irq);
 
 	if (handled)
 		can_rx_offload_irq_finish(&priv->offload);
@@ -1473,6 +1483,7 @@ static void flexcan_ram_init(struct net_device *dev)
 static int flexcan_rx_offload_setup(struct net_device *dev)
 {
 	struct flexcan_priv *priv = netdev_priv(dev);
+	u64 rx_mask, tx_mask;
 	int err;
 
 	if (priv->can.ctrlmode & CAN_CTRLMODE_FD)
@@ -1494,20 +1505,35 @@ static int flexcan_rx_offload_setup(struct net_device *dev)
 			flexcan_get_mb(priv, FLEXCAN_TX_MB_RESERVED_RX_FIFO);
 	priv->tx_mb_idx = priv->mb_count - 1;
 	priv->tx_mb = flexcan_get_mb(priv, priv->tx_mb_idx);
-	priv->tx_mask = FLEXCAN_IFLAG_MB(priv->tx_mb_idx);
-
 	priv->offload.mailbox_read = flexcan_mailbox_read;
 
 	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_USE_RX_MAILBOX) {
 		priv->offload.mb_first = FLEXCAN_RX_MB_RX_MAILBOX_FIRST;
 		priv->offload.mb_last = priv->mb_count - 2;
 
-		priv->rx_mask = GENMASK_ULL(priv->offload.mb_last,
-					    priv->offload.mb_first);
+		rx_mask = GENMASK_ULL(priv->offload.mb_last,
+				      priv->offload.mb_first);
+		tx_mask = FLEXCAN_IFLAG_MB(priv->tx_mb_idx);
+
+		if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ) {
+			/* S32G2 has two MB IRQ lines with the split at MB 8:
+			 * mb-0 IRQ handles MBs 0-7,
+			 * mb-1 IRQ handles MBs 8-127.
+			 */
+			priv->mb_irq[0].rx_mask = rx_mask & GENMASK_ULL(7, 0);
+			priv->mb_irq[0].tx_mask = tx_mask & GENMASK_ULL(7, 0);
+			priv->mb_irq[1].rx_mask = rx_mask & GENMASK_ULL(63, 8);
+			priv->mb_irq[1].tx_mask = tx_mask & GENMASK_ULL(63, 8);
+		} else {
+			priv->mb_irq[0].rx_mask = rx_mask;
+			priv->mb_irq[0].tx_mask = tx_mask;
+		}
+
 		err = can_rx_offload_add_timestamp(dev, &priv->offload);
 	} else {
-		priv->rx_mask = FLEXCAN_IFLAG_RX_FIFO_OVERFLOW |
+		priv->mb_irq[0].rx_mask = FLEXCAN_IFLAG_RX_FIFO_OVERFLOW |
 			FLEXCAN_IFLAG_RX_FIFO_AVAILABLE;
+		priv->mb_irq[0].tx_mask = FLEXCAN_IFLAG_MB(priv->tx_mb_idx);
 		err = can_rx_offload_add_fifo(dev, &priv->offload,
 					      FLEXCAN_NAPI_WEIGHT);
 	}
@@ -1531,7 +1557,8 @@ static void flexcan_chip_interrupts_enable(const struct net_device *dev)
 		disable_irq(priv->irq_secondary_mb);
 
 	priv->write(priv->reg_ctrl_default, &regs->ctrl);
-	reg_imask = priv->rx_mask | priv->tx_mask;
+	reg_imask = priv->mb_irq[0].rx_mask | priv->mb_irq[0].tx_mask |
+		    priv->mb_irq[1].rx_mask | priv->mb_irq[1].tx_mask;
 	priv->write(upper_32_bits(reg_imask), &regs->imask2);
 	priv->write(lower_32_bits(reg_imask), &regs->imask1);
 	enable_irq(dev->irq);
diff --git a/drivers/net/can/flexcan/flexcan.h b/drivers/net/can/flexcan/flexcan.h
index 16692a2502eb..22aa097ec3c0 100644
--- a/drivers/net/can/flexcan/flexcan.h
+++ b/drivers/net/can/flexcan/flexcan.h
@@ -75,10 +75,17 @@
  */
 #define FLEXCAN_QUIRK_SECONDARY_MB_IRQ	BIT(18)
 
+#define FLEXCAN_NR_MB_IRQS	2
+
 struct flexcan_devtype_data {
 	u32 quirks;		/* quirks needed for different IP cores */
 };
 
+struct flexcan_mb_irq {
+	u64 rx_mask;
+	u64 tx_mask;
+};
+
 struct flexcan_stop_mode {
 	struct regmap *gpr;
 	u8 req_gpr;
@@ -99,8 +106,7 @@ struct flexcan_priv {
 	u8 clk_src;	/* clock source of CAN Protocol Engine */
 	u8 scu_idx;
 
-	u64 rx_mask;
-	u64 tx_mask;
+	struct flexcan_mb_irq mb_irq[FLEXCAN_NR_MB_IRQS];
 	u32 reg_ctrl_default;
 
 	struct clk *clk_ipg;
-- 
2.43.0


