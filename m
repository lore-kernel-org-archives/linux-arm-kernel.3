Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BAE107BCC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlP3AqA9GM3LEsAA6xBK1EnC865DDqYOjx/6DNRnqoE=; b=bXD5iubxL09jxk4hRj/NYNfCFU
	Ws7smREvJhYvQs2H2dTMrG2R8nCBwmQX3CiRSfqfDkkUjYC/XzGt07KsJXOYYhKZp7WQxb+1DM3NO
	EaE1hvbEDGuGcnbTNyIWf4h/BCcQePZ28B7dsEeFAi2G2xRpsRfSUo/Bme801wEeFaOFKKfYiXpti
	4S5RaErY3z6+NA5KwOveYZdTDVPifkmHdpW9mw93sLmj3OGID9jzttQpzEzYKoEAMGrr7P1HbHkYb
	0uxjR4NihLCyg+gzMFjAsVzjEckHljd1T4RFpBMaAmFkeynt5YKKeE/ol0Gk3N69vnUlrtSxi8K6G
	IcwxW4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w152g-00000000c8S-2l8a;
	Fri, 13 Mar 2026 16:07:14 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w152e-00000000c85-2cg5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:07:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6h3ubS2EulKqAE9F0A0Azt+DfoaITUL14PljtbY/XN5sEVB1sRH2ooYDhgJVCDBNO12p+mbAxk3TwTarNvRPZAFlt/Zx81PDgH2twcHrJ+sh+8wXm3jgETH5LTKeiBRLehvtmdDY/uHpQ4dSGPy9NOlQ03s8VGTDgnm2wcBM2YeYxU4afq4QHAAVAHg0kJPEX51rKHmxqKZp8v20e+VDdo7Rhkjf42HZBHdNzw7wCAf/JkrVFxd+zOXll084996ZURAPtppFqWtP8GYw3x6Z3qYTMPv1561iSYMv8TOlMdQ1fW0ZyJ/k6Xdwc/03Jxu8Bs79D1HXtxo34QPUUesTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlP3AqA9GM3LEsAA6xBK1EnC865DDqYOjx/6DNRnqoE=;
 b=kyun9N6eMJ5NyhVVFJws6B7p1HVJ4aOWgZKqHJbpLq1B4ePpWSapo315tqcXtSEdk1l5Onf1pJAE5eJZVwOSbEFB9oWjqWEIYSplrHlTxedSGowD/XLyR4yQXGG4jSid8jtZldZum5L6QiQqokl1Q//yrGXZ8I86StFgMDqDbJp0HI/BgXWWQJ5tjQq8tB7TenyhHD45iGEoxkwGsC15OwG5cSG6IXv+AUB7SuxXtzbmjXyQLU2AqV8ume9Kd5YR1AyOZhInQu0IZaYB8yd4nVnnV6l3LQvVl0GtSo0UOnJtVqx+pKteHYNO6mEWiQ3b3NQUkSiBSHiwZiERH0blXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlP3AqA9GM3LEsAA6xBK1EnC865DDqYOjx/6DNRnqoE=;
 b=KluUghwah1GUuMIO9qvUAsXl/dVil/Z/HQr9fMXTj97ZDEE16p5rTz7QzzuwaAknbvH6+4j9NMxbRBTJFaficDSYZmXDGoez9fXMcozGacCpDdtkisfbRxZRj3ERFgv8ordDe8bTxh31qthh7w8PjsVDqCnSVyvrGwJ4RY0ycbg6LTmQXDnVnFzdZW+s1xyffK0iaIUBKcUQQ7nBDA8DQ5pkE1iKXoJ/mjH0JoPPlIaqxnpLjvrvLktFZwEmyuYhKQw4/1IiYwUsGwl3x6HC9aTVXkMEsNvzfm2Hgvb+vTXjq0s+MeldOiB4GB87zx2ESIz//uxDWjfsbAvhZdxs1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8659.eurprd04.prod.outlook.com (2603:10a6:20b:42a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 16:06:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 16:07:04 +0000
Date: Fri, 13 Mar 2026 12:07:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Message-ID: <abQ2JA1otRfY_9XL@lizhi-Precision-Tower-5810>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <50e9dc6710d6b2fe48a509e463e04e6ae8b21e4e.1772898346.git.stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50e9dc6710d6b2fe48a509e463e04e6ae8b21e4e.1772898346.git.stefano.radaelli21@gmail.com>
X-ClientProxiedBy: SN7PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:806:127::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 567e5ec7-0273-47f6-fec9-08de811a9124
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: xVlzfpwsMKMsRqyi4JQMOwFsqX2tFWUzLwOwaRc0ttVvMZsg5MQwB6KtkQlfM5koIp3thhFMHuNYFOEk2eH47sEtYo4SgCc7F51fQT5yQRAj1YGyCMN/2h3qFC+pSVD+XhkDfqnLKUfYU1a6AFNpR+HMIn1jmf4BSlVFD0y8wFMaNHNdz5/6cxmk9E4ryOHtAPxZ2Pr2FkM32wa3Z13/89h6J59qRO9MyZLr3AkdbXQbU71X5k7pkKkEbFIeCQfH0uqTxgHkQsAUySUYz7o0gAtw4Foj0hvZA8aXjtZh4WfVDIOZ6GfZS3lpJtoLQJcxVxxrTY5QShaOXwVOpBhWjwle4pznZTal120hAnDCkfXu96BAz+R4Wfxp+U4CKl6FBzS8MvIAJganGQGUUo6jsixIgyvN9YaA+xHiWOMCbUEADtkdUOPvX02OOHWbqdoI34JXdLxnxiSYhlFYg7fk3eIz/I3Hfz+QB0NIZszGWoqNlJEEv95jM3ze/T5ZMU6onTJBXloMFyNYDL9mtU9i8IIkKsNVEUAZzxIf7zZNaybCehAWRBdoZHtfrz5Q8pxgQrDRmtw66sa4fsk0wfYI2DyygayiMGaYN/Tk400P0Uy+eaWmwoXsgx9atR1lrap/TsWK6o8bfHlnDP1FmspZitZl13a1HitIMD+m7sCsnRi70C2LhGP3TwEkbQxCWkaaY/i6XS2DAPVzU8XZygvIMRamSbJqQYye7C6Fz2xnfF9p6ikBdRne+ynO3ELPpCBnE32YoGUCI2Q1Ql3RUk4Oun8xEXpLbPWimSajIijGehE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZXXwMvF0Bt54TWF4tOAzfq39lKYPKmOlo3JTQK7TelOruFewdsIDoVD/e0u?=
 =?us-ascii?Q?nMndn5gvpzxhnjNdTyOOgOvjQshydApknKS99ROeFZyzbwZ6I235y+3hMDIr?=
 =?us-ascii?Q?mEDzoUcYU89f4Axl0LbsaKoEfy570j5mo4fm0iKj2TmG/RrRQZLboLHiOt+Y?=
 =?us-ascii?Q?Vmx+IYkBl4xNNuZ5QaSVMoOU/AegwBUGIbzAobD16AXYI0lMWpkn+QQq89JV?=
 =?us-ascii?Q?DUIzDUsUOSVaCaEDczfpmvW044c0mVJHJ3OZSX6kNLw3nQhs6PpIL2ufT9hb?=
 =?us-ascii?Q?JRiBb2/ZA/gZ+DM+3v9uA3GGXKVR4WSkzpnQ9Y8AinoKAHBfePWa7hsJk2Op?=
 =?us-ascii?Q?aXxMQzZ4C8jojvwS9vpyFXwOEcImj9m/L2bR5FDo7ce/DUzMa33RgVjXgyws?=
 =?us-ascii?Q?Ykqo+pANyHxPTBbwwRZPS3Z0r+5MeO5SBks1e8/aYxkZOMExnlMxbvU1tthg?=
 =?us-ascii?Q?nHUexejMup4Hh917MCtHCLU0wQHXS0eTkezSj1iRw1oOs+OCgOafqbRx9XAA?=
 =?us-ascii?Q?qRLxrz9s+OjO49tVY0I1zg/NZfwZdIPM1UVXZ8fLfeNSsircs+LlEVAfCoim?=
 =?us-ascii?Q?rkjmSPI1b1OsFViNpzHYDOh5pRDNB+jDty9Y5AEFaYBCiRafSR/UlFHz+5L5?=
 =?us-ascii?Q?az3ugHfONCat/pIKds6U/W8KOteZE9xEkVSzxklpCBT+MEgf5xo+Dv/Gvoi8?=
 =?us-ascii?Q?h/g8kI4OHMrxyINs/y7sDC0GppGvIPCgbR5rvSJR085Ab+XKt1BG4hMYMR14?=
 =?us-ascii?Q?KMfEFbQoI7XnRx2WCSrODPyV3ar99fYFVYsJfhY/5wixwb9vYFc1Kw8slK8O?=
 =?us-ascii?Q?kzzVIXd7zUzXheZvIiKMv8Ur/mqbRbRBiyr+qVGDudY8bim54QIzpAffGccq?=
 =?us-ascii?Q?I2mTWeJvRc/vGPyR4tdEbZ7PAExlw/FYtlR4cu3+XIfTETejx+KEAnztzu4H?=
 =?us-ascii?Q?ggabQP5MXatxQ6wA2NDjUTU+Ngb95AimERq4VfCmpnPH0dXN4DTiR4cxrtN8?=
 =?us-ascii?Q?fEqi2SgHwgImCQVU+pwAs7HwIt/2JB9sf01tiV0XsfyOc/LbYzd0vgpC1r0A?=
 =?us-ascii?Q?Gnqh7h1Wvfl6JURT58dXa6qNGR3zucQFRgPNChQp9mHBve7Be1H6LILCv+1w?=
 =?us-ascii?Q?aFpFTs4PaX3D8kbdzzvlHPdvKfu8I1aTuW3dAroylkG3VRCCxmjJu+otR8Rl?=
 =?us-ascii?Q?gnjtygvkARvm9aoHgKsE2eYZUFcRfBfisfoYm1ax0PGFl4q/Zra+ddjp/NU+?=
 =?us-ascii?Q?oeKaa9XSdZpdnor7YGlT/1pTlxZfEhe/XETWZOAcOfwUhwzMEmmN2fUZwnI5?=
 =?us-ascii?Q?FPiF0zZ7H9NkYU2QzHFPk7Us+Te/fgjAmvJfccj3VcQWLcJOzQ1BUfB5+K31?=
 =?us-ascii?Q?2l8WFLiKWMeKMYK78zT8ucO3djfW4lNomt3U4/ZTOxT8xjvmMS5KW/6vVH5K?=
 =?us-ascii?Q?kaRbJT40mMMhjdZEqD4GJtFfSiVy2AXVvXJTFAZ/sY+U8Ml2D6yCPbUoVYMx?=
 =?us-ascii?Q?uShPM/6ePt2RU1E+N/sr0hhhJ2MZWOKEHwiimbMZeEWOgq0eP7VNb8Z9snC2?=
 =?us-ascii?Q?qg3yBo8G4cULo4VeZA6XoAZuJanb0zIjuoW/0tEYMeX4lbN2NWvWIW/UDAuv?=
 =?us-ascii?Q?J35F54dmj9+W0mShTzB/11H8TP3Ii5SFbU2w4ENN/lRDF1/z7l4dE/V0gSbq?=
 =?us-ascii?Q?54uNRG1YQtrVgw2iMazI5bOPygXA4fE+tkGeZYXn8+7q/+n30FZy1TwsDBYm?=
 =?us-ascii?Q?fBHO1zuHNA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567e5ec7-0273-47f6-fec9-08de811a9124
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:07:03.9678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQlPFtVEPmYYnjeA3g3dsMfs4hXVvOPDKoJ5KPVT5iy5mh6k+kvUPWTmCFNWCfF4XGw428zCUZ5VHqN0BDyh1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_090712_665666_917CEC8E 
X-CRM114-Status: GOOD (  10.73  )
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

On Sat, Mar 07, 2026 at 04:54:47PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
> external reference clock, configuring the PHY and providing the required
> clock and reset properties.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
...
>
> +&pcie_phy {
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	fsl,tx-deemph-gen1 = <0x2d>;
> +	fsl,tx-deemph-gen2 = <0xf>;
> +	fsl,clkreq-unsupported;

vendor property should last but just before status

Frank

>

