Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C97DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mrc9KkrT2cLU62y0xbay03DEnmjCaXnOa+oNEqr+A8Y=; b=uIcBf3PayJH5J3FFwoA0WvSKqW
	8luibzaIe+p5eYBQSd5bs2GZ19gXLJOG2Dlp/EEbyrAJ/Y2GGgTherBUCvrTLDfNN9kYoZ3hAWFQh
	cQwKwACUkzxk5TKD67GcuGe6iyKSLZrKJmfyYec86H054waoXhi/e2lmx41uOQ5srhVi+8AWY1Obf
	hPBwtwd8jCnj3ymv53yzGlCmDBD6M2u6TO50HvOD18bp2+B/M6ZTzD6V+pZG2c5jEc0T/daXLP4bG
	1J4Vipglh9ekFa93dw7vxLiy6GOY8OljNhZoF76PrL+V5ClkyiVDrYc7CMX/69KfCaVhnOj8HJUS9
	2tE3Z/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfnV-0000000ERav-2wzY;
	Wed, 03 Jun 2026 07:13:53 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfnT-0000000ERaC-2TEt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 07:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7pesPjKhahJljlvPjGJIAFS/3iORk9o8OdLOMp5WimTqEMjVvxFxnCUV2ggmeGUaodP9sQ5G9R4Jmw6NuVNHdABItZOfUTMjZY+hJHdXEeTnzbqVQ9P9va5w4VQ8MZPns0115vW+c/Rt9NdB/S1n8RTkWKx5X+KjPYA9BLBYg9m63y1MONk0MI8kOUOVkGHtfieU4xsvCPNWf3wkfX5X/c0xdy8k1EBCzGidy5l2tr/E2aPS+kfRAKk3BeWUT8DJi3S0ZHP1yW6WxOxyFnCANsQCpYYV8mv0YowhYSAxYgVuxhEdtIrTE7cNChJMU+ETi4xIICewGXnIEC52Gn67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mrc9KkrT2cLU62y0xbay03DEnmjCaXnOa+oNEqr+A8Y=;
 b=VJ+dg88JrHVgxJ1L4KO67X7PvGJnqCWsie2ByLvdWF0bIWd/fjQ3+2xGc9VP+LDBri/HRIL4y3gDySdb7x7l9qU3sPpg4GqomOvGc1+kT1unFmBgWVuXHTf7jL+pE38EL815OJ/uNHuQeDJg4xUWdPOUusbQD8bbTGTUQaI+qdeO7xAf48pnwrYzq+hw0CWv7vqPXwg7pZ6EElr6Owp5XMo9VEOp2BOCR7ugttc0ps69Rl8EZwMQw4DTgBqpr56xHi9TmIIwhUik3MP0yAq2MV4PHQfIFwhA8sPO3NkmpqtgE3x/vETZr2g1ySBwDRkXGezkwQlwMbjVgBcnIHBAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mrc9KkrT2cLU62y0xbay03DEnmjCaXnOa+oNEqr+A8Y=;
 b=R54Xj8OYX9Wto7jPEsRpx1g4vxWv8ow0EoBXCYC1i5rU3m/0j9M7z5wY6YonueXCJl7d3VVIfremSUY6tS2zt1OsHPD8lmOwmRmfALBVU6o1hNr2YNwpCo0dDIzzA2gR+1tsAVHUJ/K9Zk3Y0y0WXknr8kUzJT9aI4KY/cDJKTHr2fn2NNbTlLgvJ0RzgamegB4AaIdDKTOtBYTSYtz2M2+chLSpH2To5s2STNfxzkI1wVvlsUbhiCDWoanhbJwpgETWC00Ih9NDKq72rYPKemIrPpJa0BIjh9VCWlMhAX9Kc36GOHE2eNOZFfHie6nxKOODjsMP3d5Pg0SUCOiE1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by PA1PR04MB11406.eurprd04.prod.outlook.com (2603:10a6:102:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:13:45 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%4]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 07:13:45 +0000
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
Subject: [PATCH RESEND v4 0/8] can: flexcan: Add NXP S32N79 SoC support
Date: Wed,  3 Jun 2026 09:13:34 +0200
Message-ID: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::10) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|PA1PR04MB11406:EE_
X-MS-Office365-Filtering-Correlation-Id: d0324b00-3866-4965-0d5c-08dec13fa5fc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 6jjSuVWSgifgZtfAgA8NX5QhdBawyFCQ5dfIOgmhDLz+VUXUA6tJUlqUzyEmJXALSk3Vrdif6Ut2gk6OFAc4auCQ1AqpEuZiEPiR0khZ3LadTv0Y248r8AksKUMPDDtrjjlIWF3kIsQoyd0OOw7X8eGMwBfx7TzokBXrWsvraYjVby8exh2iVtvvNQ14ELn1cLe6DR4ApBgEcHsfRCEkDIRWqQQVhL6IHo1YKMMWE8luCeOI3L0pL0DjzCNet5cSyAFhBus1P+nKRyNyZvN0uPOHTOyrwNf5lMad9CMD0Kg7askuNtiFoVuW5WbKt40hT04+cf2I3fdgqMgmV4k1xAUc7GqoBvclRSQOl51g7J0x71C9VTwp5HUszvnKBZnhaH+++FWJ5dTBUpnduz0+q00asjGnV9ZIW/frmVroBm5eg5zmVhw1VqycXRPYKLls0WSgtAelzKh3jPAqVfqi1Yk4syOe24E2AExdPYM00/xxv+ZZn6T2vDWu7yNHGoT+Y4DHSPQs4HjDXJn93T0aMoAO2n5AZ8XH009+3EvZubh1oW9Gr7OSyQP25pn12psu9p6F6ITBt0LcXoMJtyohRUme27h1YsBoFHP+cWwyIXi4GHlDKiXv6KGpmMwxgD24JPNPIpsQOOJ4M7iAOhI8XtJs463rn29f4rIVJVmiFLFaEmo5GUd9u9vW4dKx1cOV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVZvRDlJOXhQR1BoeHZWc0ROZnpkd0RmZ1BUaWM5aGlkZWRYRkdiTkY1a0Zx?=
 =?utf-8?B?RXFLeHRwblVsRVNRQnhaQjRJSnBGekw3RUQ3TXJqVDlkMkFhYVFPT2pld0Q0?=
 =?utf-8?B?aVAxNnRGZ2NsVzBsa3ZRSW9tempTYkRiZlVSbmxSL0dmZG5saFNOT3NnaXVB?=
 =?utf-8?B?NzhDNTd3bDMxeFBTcjN2OS9IZEMxV3Q2R3lEU2tSQzc3QWpRZ0ZvMks1b2xU?=
 =?utf-8?B?L204ZUhQMW9OM0ZmcnZjTTByd0tMR01IYkxaWGdSd0JOQTdWc0NOeGIrbysy?=
 =?utf-8?B?N2RyeUExUENFOVlrNDhuSVBvS0pSN0ZCb1FxRkVIa0FTMk9pMzhUeW9kMnZQ?=
 =?utf-8?B?cGRYanBzUmxVQ3p2T0l1QXNBRzl4dmpqYk02R2JGVXNyRGo5VmRRcWIvODBN?=
 =?utf-8?B?MjcyUWU5MndocHpXcDZmNE5mekM5eUVIamkvWWNGQ1ZNTTY1Um16N0VDeFd5?=
 =?utf-8?B?bmJCbzJIRlNCU3laZjFwWW9JMnQzYVpNWENEaG5xRk9LNlZYVld1SEJGaGlt?=
 =?utf-8?B?ZlR6anFKRktJWWxGMjE0WFduZG8vTjBiTERrL3RZOHZQTkpBL1lpZTd5QkpZ?=
 =?utf-8?B?M0xQRWwrNkFBY3FKeENKKzJMNkZJQ2xqNUlXeHpCZU45R0Y3TkRWZnQ4TEQy?=
 =?utf-8?B?TlJTT0kwcVI0YnVjVkt1dGVSejcyb1lsak1odHZuMHdMbm0yUDB5VDk1UUVJ?=
 =?utf-8?B?L1NhRVZobmNjU2luVGlYeEcyWjIrbUZKMS9tY0FLY1g1eXU2TlFVdk4rSW04?=
 =?utf-8?B?NllPcTdDaGRNN0UxOWhFMmViaVNUMTdlZmZOVnNrMGRjRGlzREUwUHN2R1Bj?=
 =?utf-8?B?SEthbkFvWllrQis5aFpWWEN0M1ZlRUNsY0NHZXNoQ2dvTUFhRFFNaUZhbnB0?=
 =?utf-8?B?Q29TVmRWTjFDTnFwdlBCTUxJaG9jTndmR1AvS0gvVm9jMzhiRitTd2VVOE1i?=
 =?utf-8?B?Wm1zM09iLzRVNVNjemRQUng4RWYrZUMrTkF0SFkyUWRCakJ2dkdCN1A3ZGZm?=
 =?utf-8?B?cStxSWRZemlOd24rb0ZqdURpYTlCOFk5RkVaQXM2YkdqS3NZWDRJczhUYlQx?=
 =?utf-8?B?cW9nUHBab04yczRTa05sbk1aRjZhdVZ4azlNTURUM3dpOUJnemZta24yRjA5?=
 =?utf-8?B?b2ppZFpDdlFLMXV6ak8wUTd4TW52MVFwaE51UlEva3pjNncyUXRwMVR2Qm82?=
 =?utf-8?B?TEZSZzdHbEk1UDh3MW1uRTdmNWo0RG9QeFBEQklDSnpmY3pPMEZSZk1pTjJ2?=
 =?utf-8?B?RlRSVUFhbE5aZG9ybEJJY1FPRzBkVWJZL3Z5TVF6Y1k1Vm9FOERHYXRFazdO?=
 =?utf-8?B?RjBGMVZzR2NwNGxiTHJmQzN1Y0Y2SWgyeWVZQ0I5RW9mcmsxeXgvZ3R3andk?=
 =?utf-8?B?WXhjNlZ5dDFxRW9JcExWR21jNENtMjNYNEljM21UNS9ZOWtyT3RjYW0rZnl6?=
 =?utf-8?B?ZWdCb3Y3WDVGN3JwMDloYjRIbm8wZHdONFFqeXN0TzBVeWw1OFJtQXFSamdj?=
 =?utf-8?B?TXJQYXdZYWJzNG1uNU5qMm0rZjdUekhkV1dMUUhIZjlsVklzc0gzeGo3Uy82?=
 =?utf-8?B?TlNwUEFaVGVZNHRqNWNHOUZiRXdJUzYxOTVOaTdTMVZzdEJRU3VYdGlzK0ZX?=
 =?utf-8?B?WjlGekxienpoQ25aNUtnVHU1NWNreTRvODcxVVc4QXpmUk0yL1RCMjdEcUYw?=
 =?utf-8?B?MTdiRW8xRFB0UGhjUFVFNVBEVndvZlJhWTM5VE1CUUpWTWlnY2FYN081dkdo?=
 =?utf-8?B?OVNHS3hrbGV4WTllbHVpWGJmUjRHUUp3ajdxUDBMQmtYUWRNNWhEQWlQSkZz?=
 =?utf-8?B?SjMvc2ZJZm1KZXVGMVF2MHVtRkV3ejEvVWhzQ3dSa1JXMmxqSHMzVndhOVh5?=
 =?utf-8?B?RzhGZElSNGVWN2hSMHpab1U2VFRJT2MzNmY4NUJtTjRGQVVuQ05tWC9GaXhx?=
 =?utf-8?B?bFd4Ky9HZTNSK3dlODJ2dUFFdmMvWVJUSlFkRXl1WGRBUEFHb0F0Sy93Y2w2?=
 =?utf-8?B?bm9CVWdvTDRRalAwWHdQVm0vak9pZjg2Q2x4bUo0TTdVdi9nMlozNG05VEx3?=
 =?utf-8?B?Rk9aSmJSeWwrcGUvMUx2NGdibkFtYUxENTBhTlpwVzlMYVZHOEpkQko5S0Fa?=
 =?utf-8?B?aVB3Q0lVWXp4Nk5tQy9PV1RRN0lZWGNiSmJkZ2xKWmdNam5Ha3pWaW1WdUNL?=
 =?utf-8?B?ZEN5SkQzRUcrd0ZwMmpOVVZQUTBWRFg0bHdxN1RwMHdPRGdZbzdDcE8wc2hw?=
 =?utf-8?B?VmRBZjg0MEFaNWFpYnV6R1p1V1EvYmRPZlY2Wm45Q21qTGliTTIvNGVNWTcv?=
 =?utf-8?B?UTdaWGZhalE3Q2s5d21kai9LOFJDaEQ4c05CVEwyWUl5cjFtSUh1Z1N1T3B2?=
 =?utf-8?Q?3xAa2y/qoq6xhA+c=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0324b00-3866-4965-0d5c-08dec13fa5fc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:13:44.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOhSFephKOzuvLh00XKTSeRgAzUlFVbheTpHxZnmTENs93YAewv0KZBaA9f85wfyi2HqfMrnboBsLG/upUVtmVVj7CL8jclf1OiI5su/Wu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001351_641791_7E0CFABF 
X-CRM114-Status: GOOD (  12.68  )
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

This patch series adds FlexCAN support for the NXP S32N79 SoC.

The S32N79 is an automotive-grade processor from NXP with multiple
FlexCAN instances. The FlexCAN IP integration on S32N79 differs from
other SoCs in the interrupt routing - it uses two separate interrupt
lines:
  - one interrupt for mailboxes 0-127
  - one interrupt for bus error detection and device state changes

The CAN controllers are connected through an irqsteer interrupt
controller in the RCU (Resource Control Unit) domain.

This series:
  1. Splits flexcan_irq() into dedicated handlers for multi-IRQ platforms
  2. Adds dt-bindings documentation for S32N79 FlexCAN
  3. Introduces FLEXCAN_QUIRK_IRQ_BERR to handle the two-interrupt
     configuration
  4. Adds S32N79 device data and compatible string to the driver
  5. Adds FlexCAN device tree nodes for S32N79 SoC
  6. Enables FlexCAN devices on the S32N79-RDB board

Tested on S32N79-RDB board with CAN and CAN FD communication.

This is a resend of v4 with no changes.

v4 -> v3
- flexcan_chip_interrupts_enable(): disable/enable all IRQ lines
  (not just dev->irq) during IMASK register writes
- Split rx/tx masks per mailbox IRQ line (struct flexcan_mb_irq) so
  each handler on S32G2 only processes its own MB range
- Added received Acked-by tag on DT bindings patch

v3 -> v2
- Split flexcan_irq() into dedicated handlers (flexcan_irq_mb,
  flexcan_irq_boff, flexcan_irq_berr) to fix duplicate event
  processing when multiple IRQ lines run concurrently (new patch).
- Added flexcan_irq_esr() handler composing state + berr for S32N79
- Ordered quirks used by s32n devtype data by value.

v2 -> v1
- Renamed FLEXCAN_QUIRK_NR_IRQ_2 to FLEXCAN_QUIRK_IRQ_BERR to better
describe the actual hardware feature
- Appended new quirk at the end
- Switched from platform_get_irq to platform_get_irq_byname usage
- Updated interrupt description in dt-bindings

Ciprian Marian Costea (8):
  can: flexcan: use dedicated IRQ handlers for multi-IRQ platforms
  can: flexcan: disable all IRQ lines in
    flexcan_chip_interrupts_enable()
  can: flexcan: split rx/tx masks per mailbox IRQ line
  dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
  can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk
  can: flexcan: add NXP S32N79 SoC support
  arm64: dts: s32n79: add FlexCAN nodes
  arm64: dts: s32n79: enable FlexCAN devices

 .../bindings/net/can/fsl,flexcan.yaml         |  30 ++-
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  12 +
 arch/arm64/boot/dts/freescale/s32n79.dtsi     |  50 ++++
 drivers/net/can/flexcan/flexcan-core.c        | 249 +++++++++++++++---
 drivers/net/can/flexcan/flexcan.h             |  12 +-
 5 files changed, 316 insertions(+), 37 deletions(-)

-- 
2.43.0


