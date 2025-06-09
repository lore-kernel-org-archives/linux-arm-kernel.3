Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B564C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xg3uqwLau6uRT2rxwp9wbYuLM7oEmnYIWqsqRPmi9SE=; b=ga9d0toJx5xJl2eWj7iZXeykFr
	pDkJTGHiS4DdQmn+LGYvRDyMRgych7b3OSs2AS8AI8ZDmni1ueG/zODVaDmHQr2WD3LKdfVhj1I1O
	u2nH0SGgv2Mg2ir9oPVaZlefWrc6d3QUu3BlgnZPWfzVWd+5PDlQlVJzqv7GAbIAbo8KQeNEOA8ke
	3cPEzuxYF3SeRyphoR3Uu24A8dcD3lLj1mgk1uX0gGsDHBzPaHxu61uqgJ0DATG+B9V+2GqdPIzWM
	5pbvZrZ5kuHsBmmbIPF5Lbs6/O9du9kA6E0R83xuUCwdh1edgwOilAIUkS1Fz+HnNChdVm+XVu9Oh
	Og3Bb57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYTy-00000003jWk-2Gzz;
	Mon, 09 Jun 2025 09:07:54 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYMT-00000003ibo-1rjk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 09:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCeYa5gBC+z1zhKUiF2JHcu72KG/dAESdkG84gDRlVL0F5pGfwoaGBlpXcPittw0Q3wIE6Z7V8LWiFAaxH+dy8hOKTqZXDyjU3jFSisCxNTd5cf6+VY+cFs5rf3cMznxfUAMXG+MriynzIOkKQoONnMfh56TPzAhWKOq1E23zYp39TuSY2x8u0dFxmV9+vpXZ0/q3hnXxjIHhcrGhKwjPerbgVZlnaTzKNeG2/BQ2bAHM4DJGv3ql0mTCQ6wVWSLAM4g3LsgYVqQt98CSWhcUIJR1PMoAL+47c59AZ24FIwkRzUzi+KdD1tx0BKtr3Max039/5c2tVAMMZapDfvBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xg3uqwLau6uRT2rxwp9wbYuLM7oEmnYIWqsqRPmi9SE=;
 b=gFIw/hG/3eyAIUWeMKa/k2HMUgX5Ccq5X3DUdV8qJ9/yV23GcX9tgK19mbk7qrEk3Drytyqvpsuni1FbwO/XdXU9HHoBPNk9wkE8trS9Wh7n1bf/Ahh9W97CcZG+mXll5uU1D+NDH8R0IFkgL9IztQIS6qn0YaoEzZvL9P1yE52gJGunGaPJLhwWmdC4hzQQJJNpJk/nz26V5l3Is8M3l6ivIba42WEI63nl28H0VdHAcJm/JkTGeF7qa2CIoiSOd663RuEslCTcunur5baxNzEuN/zp5edfbJYghsLniTTpkBkOvwwiViXTOZDBZIpq9DlE1/L8zvOkdbZNjGEpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg3uqwLau6uRT2rxwp9wbYuLM7oEmnYIWqsqRPmi9SE=;
 b=P8zKbqbFlNPIsyUGkI7uM3lvjaipzqs6453d3eiyp72lvf2IVlD/74vo8+7ZH3FF+l3caffvTrBPX+NY8I+t//a4C7bXTg9e0uCm3/dDh+t8V1OOe9l6eDfuzHZuWmd/BQ4LhBa0wD7w1v1Vv6zXwdPbdFABo3lez3I6w1SG02it9nm5DhxZEQ8w6Yf3j8iT9qJTUoZwVlEbARn02zB/5elN6MHE4wXv2+dcsLBdDyfbJ3Mbiju5daEQ2+BH/f2JeDbXXZLNs/+WSBN3qpc6mct96TAwFGOrwDe4y80KVHuIfnu9tWqekHlBN84GSlzdKT/MkAgTOAYJPsIWVtJxig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8628.eurprd04.prod.outlook.com (2603:10a6:20b:42b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 09:00:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:00:05 +0000
Date: Mon, 9 Jun 2025 18:10:12 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>
Subject: Re: [PATCH 2/6] arm64: dts: imx93: remove eee-broken-1000t for eqos
 node
Message-ID: <20250609101012.GK13113@nxa18884-linux>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
 <20250605205853.1334131-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605205853.1334131-2-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3cfef9-1f7d-46e9-62f7-08dda7340715
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NKUZXfXeHAdfIFQWZJrWYO1nTxqtTuPKghdZTAVMENu2YNmmoLxwLsHf6mXd?=
 =?us-ascii?Q?VQujPVoPf6fMhLp98whQT1Muq+hTq00Elv4pOFF72bX1IKDY1GScgjmcOti7?=
 =?us-ascii?Q?1zGN0cn90/LaMhtQZEF4bNRk5uWL7xuF+8QE6cjDxUqqY8dBpvnu4UiXuxi3?=
 =?us-ascii?Q?DCjA9wfbO9/iwOXaKT2trBRVAE0yVMTZEY50hntT2vozqS5PEbn+eaoAy/dS?=
 =?us-ascii?Q?zDwm9AclYcz+Bkqkpx4Zz6Pboi+mnf3fkcLwMWUsG9qYJFcJ2EM3gJ8hefVs?=
 =?us-ascii?Q?qxB4NDonfz/KRqXmhz/ki4RGxuumI4CuXRAM4kHwJ4cO2jaE5ajtygl0S/i7?=
 =?us-ascii?Q?MpLHMGPm0hRS6Xik7rcE2xJy91+JCCKIlXItxXXoijHJsJT4G0MHzjfPHztQ?=
 =?us-ascii?Q?JHWwBhHSKGQsCmaGHlbTAkEHbP5ec+QvzpQkDRyIe4S1MCy5iEdWXW9oDykQ?=
 =?us-ascii?Q?zb33cj5Xv5QZd9ztubF1trFm+poHgoYuTCTqlMRAOqAlDSguMhobfDf2MIW1?=
 =?us-ascii?Q?fQKURoh0SROwasqXT0ffA7w8/rP+9SF2sX/vu5h4/+G2KCIAgAPfUSAi4SEG?=
 =?us-ascii?Q?GwirtjrQn2TZTWmsO6UFKMR5qkgUSHeZv9xN5z/GOlCraFGA3Q08YPfuBIRG?=
 =?us-ascii?Q?/kcar5xmodaqhJ+2G+TCdMMK9zV5S6fYI4Z9NiHQ8CHxBVwEpfws+0Vcvu6B?=
 =?us-ascii?Q?cPvm1Vvx6zzzle1sXXJARmv+e9YBD2YxyP6iKUaPWMlwLZ/PMvfHdH8SiRJR?=
 =?us-ascii?Q?jU0Up/BBWxwoFgiB6fhwbZbyyPE5IrYmQqPMGz4I7xR+xptWrWrLeAo2GXqt?=
 =?us-ascii?Q?Z2BYIT9rtOaIyIRXYdn/m1lEx9LvLZbeN5J7IvlcXWku99WM+0x4HZUSM0w1?=
 =?us-ascii?Q?jyUvZhFF4M5DQv9iKsXB9Cg9A/Jmq2Yg5+czO2Brz+JNQba1xyDKH4EF8OYM?=
 =?us-ascii?Q?O7FA1pMtO9AoPSZnwn4uq/B6owQvS90ju4FFI+Z+cXOG4+hq0Pu+ooZKAlhG?=
 =?us-ascii?Q?yBbUHlQhj0LUSfjp2pJmh+XYHRRw91CO7KWVtSd68xWSmzII60RKRWGeq7YV?=
 =?us-ascii?Q?9Za5pWDTuQL3NA/Bl8OhpIyjTtIA5aS/50QZd0/FXo1oWeB+SIrqiRrTabyV?=
 =?us-ascii?Q?O89tVwceri+Nwnc5fKmPBbJKMgsthQjkXqO6Kx/SanVugwsMrjC7O6u5fsUJ?=
 =?us-ascii?Q?3hVyZDIvvKtCjx7JRZeRqrR5umhdc5kTheVjH87pSVs/vS47ZsTKm7U8jWHY?=
 =?us-ascii?Q?vZFbMGTbhFvFc86aq2VPrIxvK9Sv4yLtCaslqgBzygc7D4vQu0N6nTXRFHT6?=
 =?us-ascii?Q?9EfsaEPJKkQvyc9NjX0+pMKvxBOBzLZ8RO8w+B+1Mctwr54trDiyQXPSSyVT?=
 =?us-ascii?Q?EaZdGztgyJvX8l1WX/IpkizYg+r9yfWyh9COG+mwFSmCGP0Ql7mYKLrNXITY?=
 =?us-ascii?Q?PCTVr0vnCsy3KTxeCBtUMsmIkjn6oE2mvPfdFFCXiSeqNBMrk0e5ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G9vsKPkFRR9WlaK/0d+U5EAWquTau82kvuNBuKiWtUxeIvsMQTBl5DVJfmpi?=
 =?us-ascii?Q?0Kt2lM0btTu8eMhM5ABuEBj8z1wdpPyvGhkUWaYxiAeGnGGpEagewpfEHbfV?=
 =?us-ascii?Q?9cz7WbOLmJs4QkQpzCSezR9yB67O4dQr0rowHukrz1TD70h1x7V2OajnocT+?=
 =?us-ascii?Q?GZ2IzYreUuz6koURcO17veZ4eJ/fsdNyQaFMaC3AX+9phGQ6uztT24h+uKVf?=
 =?us-ascii?Q?M/Ymutk3ISO3BxFefRjiBUHdh8BVYu18hYHDYG+KXEYl7QHDzaNB1Sq2YFHV?=
 =?us-ascii?Q?ux8W7eXvWuVW8Z+iFtbaL1Sa521RGnc/F9kbNMaLbCYzvKKs2pH2BiP1Rui8?=
 =?us-ascii?Q?vSYyMOiF9IrWJ904wsjVzXK/IHxCUwmviq97Xm5buyspoYmV2A0F+Hht4CWo?=
 =?us-ascii?Q?CLsZv4E7EORfqbkwiKjXu19e7CgcW192U0I9PRMmNSzR48mvuY69RlehnwOa?=
 =?us-ascii?Q?V+T81vP4TC2chfmvr+TAUJdRON5YMjveoP4SNbdJogXcsaa28kd8RvsGbj8G?=
 =?us-ascii?Q?rDZbBwDEwYZK+a5TopXQTJjiSBkxfUtb35QMPH6nSFkYCAqJxqYyXAIpAW/w?=
 =?us-ascii?Q?276YRvzd4Bq9mediuv5KbpNQ8fgjyDBzJbdPvwCuAt/vRTI+QimDeefoc6l+?=
 =?us-ascii?Q?AT9MamoRbjE/zMIdrCyDG4e1CoPBgwdDfIyUezNIFAA/JIpks/eKKlpjp4CO?=
 =?us-ascii?Q?xsMCIHzvXJkhQRA4+gbKCsdq1UdKNp4tXDTQE4afqQP4ucXCs6J+U32r7rpE?=
 =?us-ascii?Q?mdfneJu8rc+78iCKOMi9JqFl5pR9YT5ngaGs1L0r1Fw+mggvhHvzuAweR7ym?=
 =?us-ascii?Q?byVrCnDB9e99DNQW41Ijw9kb4LRG3FNGU8D/WXNrz8UWmD74udkq0R4g3FrX?=
 =?us-ascii?Q?5mqfghcjdyeAQ0j4ocxk9yKuRA4jxhKFEtKyeK9VOtyZN7BpHxya1POaVMv1?=
 =?us-ascii?Q?tzp2QTi0fxeEpHkOFufOWm8Kmn2cU6MlCOuNYiYJmz/8hXHTRwCyHFGlAURE?=
 =?us-ascii?Q?NjilhSw/F5ygAtfn28FUoJdyTjngLJKp8J48n04fH/uPKjYXVUcH606jC5yA?=
 =?us-ascii?Q?OHsQVe2M+a0qP3ihsGqbKHNbRFhv10qBn1DH6agpLAxHj3oGp+0dhgZF1APD?=
 =?us-ascii?Q?MycqX59K/QHMBnSaiv31sfTj0NHVDrWV/jrcKjccHbOqtzfiHLtxg/AWEsoJ?=
 =?us-ascii?Q?gQ0NaARKzq/vWWSoFlNhUW15n5HbQKveO/kbL4Ai3S6ojBQekuAsPG/ubzu8?=
 =?us-ascii?Q?ab0j7wfy3OtbE39rWHBH+TsiVwISpCYSkHz6E0VtrsfTpmq/Ix+NtzR8F8Wb?=
 =?us-ascii?Q?PhWCrHW3/HROv3mQSFYYGi7Rkd7amO2mRpmUkt+UnXJYcFJv/qw+qUiize21?=
 =?us-ascii?Q?ukMniv3uijAO4ykCx4WlZpspIMiJxkh1kdQdkXf2nwsXAG89GnnNWcfH4h8T?=
 =?us-ascii?Q?9lv+xpT4QbAlyx/DtzdYmIEFDvWuVg9cDj1Lfz5U5ppq3ucGb4pUdbWDcG1q?=
 =?us-ascii?Q?vqadbjjGpkBaWjfnyDyGzHUqFx7JlsWdX2JeTV8qun7t5huSnYK/Sv65aIoZ?=
 =?us-ascii?Q?jrU4EZ1Xpei3Iz41dGwsEkeibDaAIPhgas87uVNk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3cfef9-1f7d-46e9-62f7-08dda7340715
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:00:05.7081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2ZU1S66P+oks4/9JrnGqsIpiptOaBccCQ9X8Z49Vb8IVi4wCH67rFB9DsC5YQgppqeogVXS8PvjkNHiXATYHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_020009_485879_E71CB769 
X-CRM114-Status: UNSURE (   5.93  )
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

On Thu, Jun 05, 2025 at 04:58:49PM -0400, Frank Li wrote:
>From: Clark Wang <xiaoning.wang@nxp.com>
>
>The "eee-broken-1000t" was added on 8mm for FEC to avoid issue of ptp sync.
>EQoS haven't such issue. So, remove this for EQoS phys.
>
>Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

