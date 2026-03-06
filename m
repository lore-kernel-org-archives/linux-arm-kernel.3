Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A35FCB61C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDC1bvv766jK85yPMeIbrjQkPNPu9yUqHXpCfrBNPIc=; b=vHzWOEQVsxArE4bc6JMiCVPSyS
	ZO3Vn+lCyAdfqlj4Cx4T4+EtW6kitLMYkdR0WPKL+syxVSeBV73XfOENYbJoUjXDjH1wD/+dPrM2w
	xxNnXFXRROjuONtFqp4gG+8iBW+eh2fwfuYzG32PP1IOasVuMCZlaYr2rZhNke6zZwdbKJIQaYZSf
	S6hvhOZjeqj0quroa4I62EzFtBXeZVOKQi3fNoDJI7WOiibBPw/nYl/+5OSp3E0/5slQPFJ0W5JRb
	yJZqhPEk4mjh+AqA9cVp7e2tABWdCJFeaXU2rV2CUxi5siaJ77fAtaMKuDpxa55TqjaUXYaGaAQbA
	qOy4XacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXWa-000000045yL-0cga;
	Fri, 06 Mar 2026 15:55:36 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXWX-000000045xb-3dBz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COQNWWfRVaL0oJW7OhI2DpQS+K5UKF3Y2cnvuPRiv/r/6gs0l3U3udW1iLvZ1h8xMaDwAXYszvpQli3zM5UVbxknTMia3mtOCq+MOUOBKAhE0GMjyecKAXYerd47m/K8kHVC3Y6Oj7ojJ6VWOgf0EFqo49iJaMo93aVJa0RNFXZtIcbsMyZGs4aB1RFH/FTKh1QFqrLHr/9dD/jLAj3+CtlUM/LmQcXQHUaU8/MzsJG0NN7H0soOxJLI0+b6Q4hsC5WYgachUbIzZBNpaiVrAcZqCGvvGHfWQOwfA2huKxFVJU/fldy/kAbZYCi/0Q88sWOfz3lm+QjPs3lMV+xFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDC1bvv766jK85yPMeIbrjQkPNPu9yUqHXpCfrBNPIc=;
 b=tQh1VYmOXwZ0VjQrmZkPX6EjdQ6HOoGuN7rTUmjUU+CPHenXXtFDL9Pa+Dd27B7JFlzaPruTSiq+WzP2oMtvZ2x0wWgvc3dcDoNfiEpVSNQ6pg/EQzKexu8XS5hd8kd7DTT7+8yfpKmO72L+YBdAxAMIo76WIlRO6LeLZEs4mM968pGFLspViF8mHjZOwhtJjpQUCAVYa0NXTstZczrtILBpEdon7TKPhJt/VhE8dyC3w0+aya/lGm0+PdS03YCsw8q1lJERP+lzYXyr2GKSysAzqLCdWl8lklnUGALlSR1jMCbEnc8+7GKxr79hwXrcOR/K7Rd8COwCQKMmjfF/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDC1bvv766jK85yPMeIbrjQkPNPu9yUqHXpCfrBNPIc=;
 b=hYJvcoyHwYnjRD/cEfGTKF+OdWgKTKkeEufM1upoxztObSuDW4yl+3cvkXuIkMmILJXiqPnrMpjBqBaPm5bLPISG28vYlHTYKa+PS+jQzb9vQ39ysMsxBWBUMKyS4nKbhVXH1SZ5tficGt3CqxGThQnhsLD9jZGHWd+3SM4473Fe3KFTpkDyZb7fvMiPf+A886lhtxA4p0pg63jzeBzM9U91FJIxNjTS5TDcSHSt6nqo/nnUnfPlY9m7Vc0U4gHRp3dQhhRnluoXWL9a9EA0E6j1kthXUE5IBwO2WKDJ2l+5mrLJ8p4XtyMkpYL0HjSPDaiOqc5T4YF6yJ7P36RVvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10720.eurprd04.prod.outlook.com (2603:10a6:10:58c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 15:55:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 15:55:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ian Ray <ian.ray@gehealthcare.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/5] ARM: dts: imx: {bx50v3,b850v3}: Update device trees
Date: Fri,  6 Mar 2026 10:55:07 -0500
Message-ID: <177281203001.262555.3373988433657530450.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0192.namprd05.prod.outlook.com
 (2603:10b6:a03:330::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10720:EE_
X-MS-Office365-Filtering-Correlation-Id: 273ff0ae-59f4-434a-38ae-08de7b98c937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: lEwFNpY2Ja5v4mznHDJXc/Yc9XDPYIgJQi1lhPXig+blPYGp8+YBQJ5O8rfa8UW1EuvrHZg9v0oCwcuae2qHaeEQojhVGbMCZ42C+EE2DoHTW/Ukq07OE3RCKjxdXMlmqCtPj76D3R2NYE8ZjcDKsu567HlFC36iRgLYAYg7l3XVwN39gBkOddCq7rMPOuzWcLKK6u2AKXKm+t86YJJMSKU3XiX2f6/BNmh+vfyFYWQMpevJKOCLetmKRxybtPsQOIHG/351o0MLea84wD2XW72EaTHoLYyY71ds2EesyewX5VDaym0Lfa3dlgMHuvnGwzooaX305tYwTeYQp2/PuxGcfu/bN18q4MijUYAYEeNJGibvTMV/3EcspQguCHN1FhUttdg83sw7crzni9Y9XLyf45aHDsBB2ftUQxATSIa26ZO++IF9tQRdGXfU4KLhmeh02gD22v7Y9AWXvQB8UkVAGRJTHpn5+xI46T4rG0HEIdQJLVMyEAW6prLWZpVmUgdPkcpollcxXRXz66uvFtibnZBwd1ukwISts3EzGDyX/pPvwl9Nc6ujW4NrtpTkcG6KaMJ/3lgDxUeno15L0PeaZkrdtbBb+hZfJF6RgotKxnPClDKNojHpE8O6yfaXjy9/9q3DNhv/7vd9ITK4Odv/wr3KsrQbBParjhV/wwIZLc94FBhD25YOpa0ig3YnnSl9NpHoeN1i27MP6CVY3QEG0+ELlr9xSCs/3EMwwC8rRuUw6PLKrQmRINafmj7WHan9JgqbgpCgNzlsh58LXNr6e564816zmvUdqHww7oA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlMyZ3hHeWQ4K3ZucCtZQ0FBRUJWYkpoL1QvZkh3ckpBbEhLd01Ub3BtUzFZ?=
 =?utf-8?B?WWE0cGpOdzR0U2ZPaXlURGR5NU5ORnRSOXhDU2tkMFZFWllENmRaNDdHeUFi?=
 =?utf-8?B?UU5sM0kydk1ER2RtMXFYMXBOekhnN3BITHgvZHZWeDluNXZJdTJDQVVBU2Jy?=
 =?utf-8?B?NENDVEhjY0ZsVnN2NXZOc2s0ajl1NnlyMVY2S2ZwVTNNVDJ5TllHUERueEc4?=
 =?utf-8?B?Q0ZDSlRVcEQ2YlhGZlRDRTl5RVMzSGFSZDlUL2xEWElObVRDQ1VRN3NhQ1Z0?=
 =?utf-8?B?Y0x1L25zenRmWkdjbWxVZW9Eemg1Vjk4bnpyM1BnSzM3MUFUZm4vZWJnRzBj?=
 =?utf-8?B?bVhhZjZFUHJFelpmYjNwT0NVem50TWFDWlJCYXllZ01DRXNxak44TVVkVjRW?=
 =?utf-8?B?bktZdHRlbTBjVDVTQmZBdEd3TWE5SitkbmV4UWlQMG5jaEFubm9rVnhsV2Js?=
 =?utf-8?B?VWN5Z1cydGpwakI3YWYyTlVWVThTRXpjU1poUHVaR3N0Wi9wWHBpcDljb2pO?=
 =?utf-8?B?aC8xRE1wK3JOblYrZU0vWUVNRHIyaHh1YUNqTWc1OFFNTEwxTG13Vzc5UGE3?=
 =?utf-8?B?bCtmWG4zL1BqRnpqUFcrUlB3ZlN1NndFeHpQRjZqRENzSmpmbXZoT0NvV1pl?=
 =?utf-8?B?bG1jcWExcVlUcXlFK2k2QmNkZGdHYk9ZUTdSbFliMjRVb0dDaTVQZzI4MXRX?=
 =?utf-8?B?S0wxY3JVK29yWHRSZkwwcjJTbzlRVUsyQkUwc29mQk9aS09NckpxWlA4VFJN?=
 =?utf-8?B?VnlpeXYxNUdZbnUzSHpHZWM4WXV4c0paWHVGVnkxREM4Qjh2UmdOTHIyRitv?=
 =?utf-8?B?a2hoQmk0aysvYzhkaTNiZitLVE5udlBUQmlMOUtJbzBlY0NiUU5NbzJXYXNh?=
 =?utf-8?B?NXJITkJqankwcjBpY29vckV2YUFFckhCU2xSU3B6M3k3UytzaHZyNU5BdW52?=
 =?utf-8?B?Ym56RW93S1Z3TXZBUklYdzFvY2hpaFFJWkltbThlTkg2TTdGYVJqYmJxejRx?=
 =?utf-8?B?cGVVUXh2K2RSamYvNzVKY0FNWlZjNUgydkJ3NlZlTU5sazNKT2c3SXV0SlUw?=
 =?utf-8?B?dld3QUVpUjBFWUJQWGVvdk00QXRVMFNaV2xZN01PVW50aDVyR0RWMS9UWEFP?=
 =?utf-8?B?MCtYc0RHNVcrT3kvb0JSbWxPUEc2NzhUbUU4eWFENlcySmVRTWI0UlNheEdv?=
 =?utf-8?B?dytTM1o3cTIvZU4rV3R5L3JrYnZncmhXeE13RFlIMlQ0M2hKdlgwSVordndE?=
 =?utf-8?B?YUhjT2tDYllBcGErZ0lqd016NjRlSy9JRXFzUjFkT1lEQjNCcmFFWXhQUmhV?=
 =?utf-8?B?RG1uT0pPL3poWHQxY29XTE9XSXpvR0tiRjFCNzNERkswdUpucG5jRGNvYjg3?=
 =?utf-8?B?WlZoSkpZQ3lmeXJkc293bkxJVlQ2bG5aWVRFbFFNazR5M2JtZzM0Ui80dito?=
 =?utf-8?B?aTZnekZqeGhHV3BhRVdiTkc5VWx6NG9NQXF5TkhvYlNRZitrdGkra0xpejRu?=
 =?utf-8?B?SUxsbFpiQXo3UllVKzIvS2lJSHhsMXZMSUhjaUhLUHZxQ3hmZ2NlOG8wZHZ4?=
 =?utf-8?B?MGlhTFlUb1QxamdTUXgvSmpFVlc5bllnbXh5RGdOa0FGM3JJZEhiVnZna2Iy?=
 =?utf-8?B?TG5lVjdtQVdMRGlrSS81VXdjd0E5c3ZuQlU5TDRQZG8zd3luajZPdy9XcDZU?=
 =?utf-8?B?Si9sUlZ6cGI2K1ExeWZzb2p2aU5xYkVKd3AwOWZ2c2tXM0crNFBSa1dWMFBF?=
 =?utf-8?B?RkNieFZkTGRvdHhFY0hqcVZJbTZHQ0FISWx6NThqQ211Uzdzc0xJYVB6bS9i?=
 =?utf-8?B?b2FkZkdkTlNhM0EzLzNuTWV6MDZXZ1FhdkFpZWNuaUx0NkcxblIzTVJLMFh5?=
 =?utf-8?B?OTUwcG15a1MwOWhqS2Q1bXA0TE1tMEV2RS82L2tENHNXQVQ1NGdEVGNCd0Z2?=
 =?utf-8?B?MHg5dXlRRXE4M2lQNUU5SzBIcTgxR0p6UHNUdVVuQ1FEMWhvWWJTaXA4eTF5?=
 =?utf-8?B?aXVaVmtrV01rM00zd1NBZXg5YXJZVUVabVBmWXNmcDY4ZHdNRTdUVWxRWWxH?=
 =?utf-8?B?M2hFZzhIeWtMclgwT3VyaWFhUTBuL0xqTVhZNUVKNVdhUDdjajJZZDRjMHhK?=
 =?utf-8?B?YVZlT0dBQkJPL25nYTJWMjFaMUI5R2dpN2svNlZXN240K2MycExGYlV1V2ND?=
 =?utf-8?B?NXlvVGdCcjN6UTF6SmwwU1IvaHB1WHkvcjJ4WXFMQUtJWTh0NEJ3R0NJMEQy?=
 =?utf-8?B?OXlmL1NZZjM3MWxiZThMNFh1bWZjUU5GNlIvWllqenUvSVc2NFVEWW8rOUh6?=
 =?utf-8?Q?4wfynPW8VmHRyVh7HS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273ff0ae-59f4-434a-38ae-08de7b98c937
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:55:27.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQdbtBohf/SuvCNjW9Q5SxoDg2rGStz82hA/8B1iBO3leEkTu3wC9/UR/+o/0jFPZzPDaNE6Gugx2T0muRMJ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10720
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075533_917753_88B077D5 
X-CRM114-Status: UNSURE (   9.12  )
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


On Tue, 17 Feb 2026 15:55:15 +0200, Ian Ray wrote:
> Configure PHY speed and mode.
> Configure b850v3 gpio4 line name.
> Disable b850v3 usdhc4 interface.
>
> Changes since v1:
> - Clarify the exact warning message in patch 2
> - Add patch 3 to order reference modififcations correctly
> - Correct the ordering of reference modification in patch 4
>
> [...]

Applied, thanks!

[1/5] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
      (no commit info)

    ARM: dts: imx: bx50v3: Configure switch PHY max-speed to 100Mbps

    Configure maximum speed for the switch PHYs according to the electrical
    connections from PHY to RJ45 connector.

Update commit message by Frank

[2/5] ARM: dts: imx: bx50v3: Configure phy-mode

    ARM: dts: imx: bx50v3: Configure phy-mode to eliminate a warning

    Set `phy-mode' on network switch CPU ports to eliminate a warning:
      mv88e6085 gpio-0:00: OF node /mdio-gpio/switch@0/ports/port@4 of CPU port 4 lacks the required "phy-mode" property

Update commit message by Frank

[3/5] ARM: dts: imx: b850v3: Use alphabetical sorting
      commit: be700cabe4c485ef629f8087c43183cf106f7e5b
[4/5] ARM: dts: imx: b850v3: Define GPIO line names
      commit: 26ad38fce6d8ef50316ea59f1ba3f2811b11a16a

[5/5] ARM: dts: imx: b850v3: Disable usdhc4

    ARM: dts: imx: b850v3: Disable unused usdhc4

    Disable the unused interface, to fix print an error message during boot:
      mmc3: Failed to initialize a non-removable card

Update commit message by Frank

Best regards,
--
Frank Li <Frank.Li@nxp.com>

