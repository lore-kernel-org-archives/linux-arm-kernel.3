Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6253C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 20:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dovhsmHtOjdD7RxyKH7lPde14nq6yUywpyk9cPmEBgA=; b=ZiH6NMp1a4YannLj1haaX2VoD6
	MnoE/aXm2UZU71uklXdoOZQYKYGi7zM2Hctz7xzk4K4x+ywSFKGh9Qmo/8mWJ7gnKcZctU78TMd5U
	FojWsvzSoj7SDyF5l6bN/snctV1qqxH0XrXYn0jqwKWhWT+qhEL9scPot3lIsiUOmN3K3Tc4F/qM8
	tMBWo17DLNwPXAM6n0zD50TKQEpyoAZ1uIwtOVc3V2hn79BqIrgV8fP1HFXsDKfm5DJPInG4S2QWi
	6ymm3BOIJKW4Gf1MgKUG9XoHQ+CrBCVCpmDbtJVFGIxxBPM0iYBwWKsPHe7/lTgaa2TlEMsc75LOc
	M2Jrr+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weexE-00000000Ams-0fIP;
	Tue, 30 Jun 2026 20:21:12 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weexB-00000000AmW-402m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 20:21:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4LI62yKiaHd0ggjrBBTKF7IcBT9y/0OqosLe2bQIyJAGwBPRhp/cfxwgEdhHNKv83o6Dipo+0qqShxfqn6lN4Q6Hvg40yU7V/uR07Mg0VZIArYnWxCsJMirzFJfoliD0xpYI7u3/Vl/5J3XD6ujz1j+E9lPhlhQhvGFbggAMKVtoll4WxFUI04x6uj1vDn0H5WFGnTWXLGdz2s6Q4WqI2Xa2ZAsLG46V8LYlTwOtIDnNiZpUNhfK1poOGhpaMt3YWdPhkNWCX7sisKd4GVf2FYn3YcU9P2IFoFwQaPo2X1vl9Lj+LzPCQSpcKQErcgJ5cZTfFEpEI0J9zcfFUvlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dovhsmHtOjdD7RxyKH7lPde14nq6yUywpyk9cPmEBgA=;
 b=mu7GONbzbV9MU1LSvrOVOEr7BO6wMogIHCd1icYo/Pr7FMljKgi2yLv6HnbuQV5Nz0ueNHCyh4eY32gSKxxvmedRmqP2CmlJucEM7xvTCYV/FiU8S5VDCU0Qeydwl2S1rYStvNVLS0OtnAPNiVe8y0Nsu2g86vgYU8Dn+kHUK5Pevur77uGbOHpGW3G9lBUWi4JLcRLZOr9nf5MnbzW1Vcb0w7he/AQL1pY8BuRAil6Pzjqj9NW5kVlFFJAe036UKDfP9ODsjURWeKVj8hxxGNqnb9YTo3opfOEJcbTX2g2kVRwEsLmQvDzG4ZbmXaiQAH9Z+qKMs9jpUfF5PZy4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dovhsmHtOjdD7RxyKH7lPde14nq6yUywpyk9cPmEBgA=;
 b=hHp5xa2StpSkI68QV13LterP03oUS7/PHsip2z8oHAzYDxiT+VN+mGilHur8yZRm/lvKZ3Vqs2KnSW8/sPhA75QlfTYMdZliPFfQ7mPy+OPEWJRMSLe/pXRhein784fd00gvUDN8NGj1mU2y+UO03OFGFmbMxPyOpzJuERypJsK5SbJuxtmqH4JHmOO3/NGFCobwry+BvX/Q61JHFPkPpotQXYu7KPCPArbWqDwdO/a202aE9AH5wWk2JIlaHf98SYq2NehtKvmYEg1U7ZEse21pFgAD0Cu7dPOVSxVoS2MbwZnWCCjmz9TUnAhG2G3rvYoQ2h6LHohD5h3XsWmtxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9712.eurprd04.prod.outlook.com (2603:10a6:102:26d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 20:21:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 20:21:01 +0000
Date: Tue, 30 Jun 2026 16:20:54 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	vladimir.oltean@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: describe the Lynx 10G and 28G SerDes
 blocks for Layerscape SoCs
Message-ID: <akQlJlYaZkaZI_jh@lizhi-Precision-Tower-5810>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630110459.516364-1-ioana.ciornei@nxp.com>
X-ClientProxiedBy: SA1PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfef399-592b-4119-d6de-08ded6e51a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: v2PcB2hRN7mUYiAOpuKF0TUrpZ/snRSWcanOzdBM8eiTBWzHGKtmuZzSMv5XrVjId1QWhU7GncQELAJVcZ8zr/EJpN0QKQNr6rfR938wsh0TkAek9rEVzCgzkv+KUGNvvQUhYM8o20DZBxSrKNs1S1Dn/ulF7ZLbFesTWzYckSWMYVghMGoScYdulSJvXnPpAGsiMNZqMlT4ZccmIxj60uTFMfhMS/e+bi6Ro4xPfC5Io3itZePfHwuPk0dkCfN94BEbfWCfK9qmi4Zn1H0jJ24Wf7kAQGKMAtYdJ2Wq/9HpnOKtpwY6domOfZiPWDUEetKKLY1h5D3afwDbZaVP5LSPawhGmZuJw4g1VVvdC8AVu9etyeDMS4nJZ/4YVf1iEQK1QE7uOb+CmRQzjBkvQHL7JY8Tqg1vOj9Bmq7UUHuqboFZ+nVUhufqfH3ahuhibhMfuN2sq0X2YUTm+brDlmYWmraoXMfG7ZpzVEwWbPNYXeEnVyH8EeruuNtEXS68gw0sLuiu2okTBZoiDmOgNNKigoeSIwnAtG9k0cEcjzPSrZhD0Bf/HHcjToWq6uFxlRg6G7ek59LpM/Mv43xeZn9W/qv3XINg1avpF8mWtUcCNW7obG2qM8eL35zlu8MRAUVgcmTfKbg2OuYn70OqNf7SFAx9OCHo5DhEYmtLYMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wX416WyTCTuWY5nTxoSbwSX6lmBrzP7ky03NCeYxf/aqwhdprnBZBlBhUEhw?=
 =?us-ascii?Q?8y9ZGGBdVKvvZlvu2iXSoo+hFFfebrzPHceU2UBQM92RkaNZ/Crqh8TLrK0I?=
 =?us-ascii?Q?dXHFYgE78d0s+MTwnQ9h/PMHEjo709NRkoUCeHKv9Tw1kdreYhf9tXrJKMC/?=
 =?us-ascii?Q?7TluSbpO9B2fXwE/zSpr6cCkzwefB8X7+ttN62pFTBpuEnV8W7nh9QuUGjYZ?=
 =?us-ascii?Q?sqbx/j11LeW+MkjXMFkIftwRIgZ1YLcLHBh46WCapggJiutmQB/3zUGdbqQq?=
 =?us-ascii?Q?sXZ5rOSiYOX3W1e6V+Qdx1uhD+Wet4KjaTiA6pEyveJXx7k1oQH0csUA9+/i?=
 =?us-ascii?Q?QAxTvlMJ64nPaCUF0CEx0Bs4/R8ma47cavRjINolPV0kUbkOw0ZpdYlvvBKu?=
 =?us-ascii?Q?FzYGkqNbpoFs2EUVlL2+HR/fnA0nVZSgagapEYayOEpYS/yHVqhkb6zMRi27?=
 =?us-ascii?Q?lwatRn0KSNlotGoDEp0jjZ0a3YaqqtUZOjh/rzmhGomGa8/nKaGclIhneap8?=
 =?us-ascii?Q?Wt3vOg3IE1+0RN0NUJmnEgq4cAGmHVVGGgOF5/m2bvpAKYSPcM5f2VV472lt?=
 =?us-ascii?Q?ACo80Ij5l4Z1BABtogjju55NTAQ5aUtbi5tXQRXBP0g5QrpbM3SLJJVJVvJ3?=
 =?us-ascii?Q?lkd5Pz8oEqAYdoOjRCsOkVgbCognQkxH1Syx/k0CjZsNg2IXHaNj7fH2mDwq?=
 =?us-ascii?Q?QgplQj8fJnkZNvHPeq4nB2G0KyeDcHJTIveHdXHRpVItSgQev8XGP/OfufJ5?=
 =?us-ascii?Q?IWyA+0YO+Gq4I9gDyoDlCAHn+4EXcBJv51PnEb0/HAi1BcCrM1xFh+ZTg/Ym?=
 =?us-ascii?Q?BMKi0fdcnj00cUCD9KNjJFBD0u6a5VQwz9oTZshDgy7NOPm9TcoOihgMt+TG?=
 =?us-ascii?Q?F/y+7Gwb1IaEgHmNNs8v2QzzUdTqn0TC8p9g4Z7lwVG6Piyvw9Qd0vTgGTOm?=
 =?us-ascii?Q?m5amVijuy3PrOq0OCWkgZxmt2vbEQv7vEgZQTP0DRj39k/rpGHwzTHCDo+OY?=
 =?us-ascii?Q?8TdEsNQ6wGyctlfU1QgyJM2h2IH2xJ5Yg2QkQQgPjsBSeGzSTGuFxbrmGofW?=
 =?us-ascii?Q?8elAzmlCOPXFAbH27Zj8rvIcCNFFQxsYpxRpzVDBcbiP+/yfyzAQ2j3T1qHn?=
 =?us-ascii?Q?WA6Kml2jpvs1kUgRyrfnXW4m3+OKNV4eOby6YnbjiSKjxdtfwfNkMUGL0erw?=
 =?us-ascii?Q?P6BLkYtopYhgGmzHsNkah5FVmoJQ2GaPn6WwLA3j5T9NLTqjcAkKnV0nM773?=
 =?us-ascii?Q?uEUsY+EP9bBgdam1FZFLmulI/5hrWaHRB0v344mvxc57PjHHcwEKgEjSgj4L?=
 =?us-ascii?Q?O+Ie7fqzcRIDxCJgHTIfvmpAB53GFJbaFz8W2fOJvGAEnjJe74SeyXwoX68o?=
 =?us-ascii?Q?DqI2nCBtE3b2OpX7/DpgKVLjmT1C0xmtzldiV8d2JxTrA9H3ySv6JQPA24CM?=
 =?us-ascii?Q?WqMT6sdY6aFZjHx/LCl0AJ6SgsGkQ+Rzj76KdAxrb1YflfhFup1qRHoBkZS/?=
 =?us-ascii?Q?cC1SpzVJnXdndVFBWbf5KadNpXkXPxMe37yClzJdVfTN51Zk4RKYx2Ek8gpx?=
 =?us-ascii?Q?FfETuUXzN1Aea+hBBZ6/cBbkfS+mLseV53dn459EoJveMvoexATHKj0aMVYJ?=
 =?us-ascii?Q?tydLe/NRyPb/Hw0IDJp7foFUemtCHaErr97vsvdnIISaR/3LbVzzf4dTYUSp?=
 =?us-ascii?Q?34amPiol7C3QvGjnNKuMxrGtxbhkEMTGAaKCBg5D61d+qMeVJDCLrrC3WHSr?=
 =?us-ascii?Q?BP9bBSEqgGKuxRDClWdlJeW813Vo8yuuDhAX9SnsWU3GhDZfucjo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfef399-592b-4119-d6de-08ded6e51a2b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 20:21:01.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyCYHn6MST0dps/sf9Wc2g9RKSqMbexodouqxA1e+DZaRL4MvogPtDnKV1M4TV0iWeYswnCjcb2jYpUHPLpWRP66Vm+N7NQRitzdylMov9MAnE2OfGgAWkQoilxsPs1T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_132110_009737_82DFD8C1 
X-CRM114-Status: GOOD (  14.54  )
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

On Tue, Jun 30, 2026 at 02:04:54PM +0300, Ioana Ciornei wrote:
> This patch set adds the device tree nodes for the Lynx10G SerDes blocks
> found on the LS1028A, LS1046A, LS1088A and LS2088A SoCs.
>
> The first patch also transitions the LX2160A SoC dtsi to use the
> device-specific Lynx28G SerDes compatible.
>

Next time please cc imx@lists.linux.dev, otherwise, patchwork can't see
this patch.

I sent patch to update maintainers file

https://lore.kernel.org/imx/20260630201618.3497941-1-Frank.Li@oss.nxp.com/#R

Frank

> Ioana Ciornei (1):
>   arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks
>
> Vladimir Oltean (4):
>   arm64: dts: lx2160a: transition to device-specific SerDes compatible
>     strings
>   arm64: dts: ls1028a: describe the Lynx 10G SerDes
>   arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
>   arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks
>
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  29 ++++
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  60 +++++++
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  58 +++++++
>  .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |  98 ++++++++++++
>  .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
>  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
>  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 150 +++++++++++++++++-
>  .../dts/freescale/fsl-lx2162a-clearfog.dts    |   2 +-
>  .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
>  .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |  24 +++
>  10 files changed, 427 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
>
> --
> 2.25.1
>

