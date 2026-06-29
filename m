Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BCAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G23TnTBAW8Awyrq//tztj7Rumij+q4FcXgUTqXhoXGA=; b=chweU/xnUuXiKZTAt4DYpX0OTC
	wd4R5K02roF+aqSaaTa0IKqYKbz65RA3Hx/lvvC5HC3UYHvVTcO3g5QsDjf4OBBhlgmbN4E8wpvQZ
	926ta1vnwp4RHiqv9s/P8cF3f6FMjRgPoTfMbQCpXRlcQHqLf44cbeMhOtDODH5HRdkkmwkz8G3D4
	auTAj7vUrJbLwrahpbKx+LUpYzBEeh0xD+69V2IPY9smwNL4HflCdxGjCD6pX9/W4HWQZFUrStkx/
	NVXOCcYzKlN6kdbqyPCXBb6R1m3svOD9frFLnMt1AcxVeyPfhszz12+VZSYL5iDYTmp+QCkK2uMGf
	aFW7OfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6ie-0000000DwMs-306f;
	Mon, 29 Jun 2026 07:47:52 +0000
Received: from mail-westeuropeazon11013050.outbound.protection.outlook.com ([52.101.72.50] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6ia-0000000DwKM-2Xz7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeIgRE/rqBCtTiX8w5wqApBdIRIARbwOLzVxviiZqgAd576Wr1C+EZ1+/gMPgQ4oLI/+cClR9R2Lc+a+JPoY3WTdnRdxtwezM9j+Ay/BCgRVeWZh3NkUw/n7k4Ta7v8RI+w0ILFVoMkLz6vZzuSjoyEekvuUPkDDXmj0hVFTdQNt7RKW9jMn8pMs9ahTko7ZDhA1E9psK8nMHuXzGiKPPzp1dKZPXLUQdK4Eu70hJYXDJej0a2KxsniB1kh1LCpGaWExqdQ2Q2msxjr//EPbPL9/eRW8OC/2eWD5aL3LEaLy5rXgZRjzEupDWj/0Re4R1cuHVIFoJh8ZC0cjCWM6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G23TnTBAW8Awyrq//tztj7Rumij+q4FcXgUTqXhoXGA=;
 b=QjVhl31Rhk2i3Os6LO4l8c1iFALM/+HRSMRe6gzGqOnk+u93O20ho1ycl4azV5j+yMeicPe5Qwz1Pdt4BHknx53rVT8MazdQKInX9nO/EpPakQwUUdPblybgK30ZjMt+qBhyYD0//AXzNMK0/nklE454ir1p+mbV6diT5uwExLlUwTppe33gUKVwtI5TlCekY7xttyWbi2G796bnGVnRKYheclN1/UT/nihtvyVQsE7ELLZdFe0gYLCS51YMoaE53gyA3a5Ua3AsMkaz2gi467GngqKr0Vokm+kWudGOW4/xH//tTVHPRecGW99ScMRBDcrplJpKHJb+TohIsvZlJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G23TnTBAW8Awyrq//tztj7Rumij+q4FcXgUTqXhoXGA=;
 b=C2m/VlIke3ocLcuerK+DW1wi8wjA1luxQjt29cSZ6FLvjnjF+4q1JB0RGmYYjXwUL0TRKVowQKLAS1ySLRpDnaBEQ6dlqJ1VxyUJT/u7owjF/Mg8XXAVj6KRYW+GfH8hX16/MpAz4uwAIlrCLK/BoqhgmTygYUuLt/BylXjgHMlPaR4y3103U2HKL3z1ig1bLyE7OZDV/edTnSDpkoipH5rQLtQF55sR0rLHYU5k8elJXmjJFuA5yVNPdUO5IWj+83j1hRy3SceVQ+nIJbe+9vcs/M0/q02PYGNe3itMe/pYhvgdSXArKNJ23HjtuWDFklL2EwP5iCJrUzEydAu3Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBAPR04MB7462.eurprd04.prod.outlook.com
 (2603:10a6:10:1a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:47:41 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:47:40 +0000
From: chancel.liu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] arm64: dts: freescale: Add IMX-AUD-IO add-on board support
Date: Mon, 29 Jun 2026 16:47:30 +0900
Message-ID: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: f06adefb-0efe-476b-77df-08ded5b2b23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|1800799024|366016|3023799007|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: sRCUGKEx0k7I0p2UjUKAj3ZfECZ+HhQJxW7UkOangiPwhkcq/y+IpmNB98eR+ntWaZNJZV422ZO1CzPj8C2dl6POyT/3bPn7A/QPic3RCLhYp2A0L7OL4y5nr0vzJN1ee/AaG3IeM8T4wJdGzUU4lv0Yk8sG6d/x2iozU7GN3QzZ7cikq/D+9Z9NXe4MZZG4XL5NyO57lWQibjUA5Ay/SGEgcsH5HFXX3Upphkd1VbM7l/LddQC3ssvD+HLq23h3Uvo0HC20YICGMZrTQX2XnuJUKvuBmIdwOoRO1wpm3HFIC+zTUnBdEOemZUC6a0drTqO+bfTq2CJhz88dpxzU5wZ046LTnZM9sesxYqFsZG8zMm1oQvciUaabL3FYL9Ya5ZyZra9Vch3ttNgridMHEm2/TQVaRhnCJ8Njh40AcxGYyt/LGUeyzi/byRj+oQkRGOJXHTkDdkCvZWRKExYKfEs54f5ErxaOF3wnLdZatGp9QxB48l7LjgNIU9UmY1prn1sn4urhcX+OONqN0Pbh+l/rMHN+6mZo+PhqAlzR7z7d3S5v3j3nmhPMfHzNu9Nex4AeUoLBtUcg24PhM2enV+w1YygVusINmFsPym41pxbuG+/BVNgdZ9YuIBHxEIQ9jCPA0K9YPQcIwKjxXsMx5WsaIuYHp3lRj+gyOj3inWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(1800799024)(366016)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eJJ9fCz2jBmB0/j+0E1uLiceXONTlExopYeOAXmw1cVAtTY3+bspHBd12EvT?=
 =?us-ascii?Q?KuVi4+KHgnK4t9AWP5U8/6DdaIWOgKeS5eKKIuIxxAgERCl0MPNa12nkVgRR?=
 =?us-ascii?Q?VcXQIVU8Zd622aqb8tS/J15xI5jSE8NHKWdd12xbOsqk3j3N/yLAtSHqvikk?=
 =?us-ascii?Q?nTYRHDwLPcG2oBTsSQWDBEVKwN+uB8u2gQsIcGxr0K5JqL5bXIuR1nAQbnav?=
 =?us-ascii?Q?9BQedVMedN7hpCu7otLk8/OkSce2TXQgXnjqZ1Kz4qvzFnUBclSwFHXeswIh?=
 =?us-ascii?Q?rhJZsRFOyKAeZa7P9kqKlrN3F3+hcYAyPdftVakAKGGynBLPmEh54/cof75r?=
 =?us-ascii?Q?PE7JZI9apU/gsumtVb2QnUPTdaHSm919BwCJX9qks0KQKmwvpho0ZJBgqK/T?=
 =?us-ascii?Q?UnzNsq8yWQAjuKq9gT1dlyAZt8L2nhQ8jpujKp4Mvljd3Mjw+sOSYA4ssNR5?=
 =?us-ascii?Q?PHHYb+ZQ2O+n1SYFd5OweVs/UK8mi7DWNgL9WejbnnfgPXDHLLK029uwrwCe?=
 =?us-ascii?Q?rzVetRuAcdqtRlR/b3ncZL/UuytSzFab80r+vvsNwA1JXENPwaS1KA9HA4xR?=
 =?us-ascii?Q?wrLWbZBAk3yZav/tOpfzG+A8kTMVu0XTXg4yNBL/jEUJuyDV+9igMy0VmcPa?=
 =?us-ascii?Q?sDXHcXwf/F+3icr0/R57FozAmcIIfwGOOS9joBzla86G/9s10QwGpExi+7v+?=
 =?us-ascii?Q?l9X7SSHSSrjDTTP6buzfHK5E8PT8W22Nx+D4ivRn7Eb7nouVkwarqXas+w/M?=
 =?us-ascii?Q?yvQEvFRpNau1Oa2J+5zCM0d5m68a+c7yD3ZVA1rZkcM1YMDxFoSHNqrKU5W/?=
 =?us-ascii?Q?zbAN+EPSGBQI81hKu5+EzV4F/n+EiQXU6yQYJxnPMFlSgzjTjbKrbZyZaiMl?=
 =?us-ascii?Q?TjJP434XeXIoVdSpZCuNiDw+r1gZ+4ZFlSU1yevgTRJ9ugEFemlznzPiEMoP?=
 =?us-ascii?Q?hEjB/3crpJqfqKM2iNANTyFIv+idEXfou7YBx0gcWtBC+d/fn1uPI/yC113E?=
 =?us-ascii?Q?6moTpLTn958lQTlSk5MDgpfJu+S/Kss4WOIuljzYRl07FD4IETKFVgW3nv7z?=
 =?us-ascii?Q?0OLcPaf/BZLzEOf8UxjxxChQPYvyfygf/5NqXpedw4dxq3L0bQr2TuOTvz5w?=
 =?us-ascii?Q?fsogVKl/+tKAM5FPRR059F7oJIkF+Wd2TpiCwQQVwxyp66hRNBFgJeD7xod1?=
 =?us-ascii?Q?XIS3zH27qNTTGvu1O+h7Wh3cJX+rMpDN8Ddp87wV1xQygMv6faBbkmEfoiS5?=
 =?us-ascii?Q?WxmQdCRNwkGEZ7XVJQen738/2qh7+TxwAJjxXrN46Ae4fo1MgWGHkM3rUkHn?=
 =?us-ascii?Q?qWUneW+umjdxXI1vqPK2HlNtz81dQdVDhzHpV/tFsNyO9LQxCUZBYOsGH8Sv?=
 =?us-ascii?Q?8JcTxElCY+E1MRvRrCDZ6lPycx42tjAKd0qnavFzMgkJXI5+nZJZIyePFN8d?=
 =?us-ascii?Q?bzFR+DANtUSFoDaXaGV0NB35Wsen92mwrQMJNMYmpOpUOm0siQfoKwc3q/L9?=
 =?us-ascii?Q?pgoY5xG522ZidrxlSubd8KD1qcrhmtaZNAdEOSct35kfOZvAi9yrA2V1S/+P?=
 =?us-ascii?Q?F1pk2BvagOY0dm6ug7J7+490BgT9THmsHkZToHyxROFb91vBBwuiHK0vtVbx?=
 =?us-ascii?Q?mODBocrh8jLtIM9Uiydvxmq8p9WnIU5i98hdia+JJ6sPfAOceUaEY/7YNKJN?=
 =?us-ascii?Q?1LC6Dvop/k1ZZvbCO6q2RNV+2SoegvLW7wLilRB4OAMFOkQkLW0/6uOKj6Nz?=
 =?us-ascii?Q?E7si+8DznUxxkFE813kVoL0F1FwE0mmg754E8zxX79iIcbUOcBSX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06adefb-0efe-476b-77df-08ded5b2b23c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:47:40.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fESrcovZt/qY4jXDPW4AP9wvPukHEkG26B2Uz+bS/OnmCMh0GGTsEFRlRMt+9Ic3RiHorRgjZa36JeK6fjJZkyyPUmHc9UletmoJ/ugqemsDsJBd1ZRcdE/RBAC+Ox7v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_004748_653239_287B3DCF 
X-CRM114-Status: GOOD (  16.38  )
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

From: Chancel Liu <chancel.liu@nxp.com>

This patch series adds support for the IMX-AUD-IO[1] audio expansion
card on the i.MX95 19x19 EVK and i.MX952 EVK platforms.

A connector is present on the base board to attach the IMX-AUD-IO card.
This connector is described by the fsl,aud-io-slot binding. It acts as
a nexus that exposes a constrained set of I/O resources, such as GPIOs,
clocks and interrupts, through fixed electrical wiring. All actual
hardware providers reside on the base board.

Also update the EVK base Device Trees to describe the connector and
required board-level resources. Add a DTS overlay to enable the
IMX-AUD-IO board.

The approach used here is inspired by the discussion[2] where a
connector is described as a nexus mapping board-level resources. One
important difference in this case is that the IMX-AUD-IO add-on board
is not a hot-pluggable device. The board is connected to the connector
before boot and remains present for the lifetime of the system. As a
result, the connector is modeled to describe fixed, boot-time hardware
wiring rather than runtime attachment or hot-plug handling.

This series depends on Miquel Raynal's clock nexus binding/core support[3].
In particular, Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
must be available for dt_binding_check. This series does not include
these changes to avoid duplication.

[1]https://www.nxp.com/part/IMX-AUD-IO
[2]https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/
[3]https://lore.kernel.org/all/20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com/

Changes in v2:
- Drop [PATCH 1/5] clk: Add support for clock nexus dt bindings. Same
  change is already present in Miquel Raynal's ongoing series
- Drop PWM properties from binding. This connector carries no PWM signals
- Rename compatible from fsl,io-connector to board-specific compatibles:
  fsl,imx95-19x19-evk-aud-io and fsl,imx952-evk-aud-io. The i.MX952 EVK
  uses fsl,imx95-19x19-evk-aud-io as fallback
- Add property constraints instead of redefining common types
- Fix inconsistent quote style for '#interrupt-cells' in binding
- Add required GPIO nexus properties and reference gpio-nexus-node.yaml
  and clock-nexus-node.yaml
- Make gpio-map-pass-thru a const value to pass through only polarity
  bit (bit 0)
- Modify dts accordingly and some commit messages

Chancel Liu (4):
  dt-bindings: connector: Add fsl,aud-io-slot binding
  arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
  arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
  arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on
    board

 .../bindings/connector/fsl,aud-io-slot.yaml   | 113 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso |  57 +++++++++
 .../boot/dts/freescale/imx95-19x19-evk.dts    |  55 ++++++++-
 arch/arm64/boot/dts/freescale/imx952-evk.dts  |  70 ++++++++++-
 5 files changed, 295 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

--
2.50.1


