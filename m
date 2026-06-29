Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA49C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r51vBflPLPCW6bZheOH7y6x50zxuT3Or9c+D81EvhYQ=; b=XRrOja8E9cIhNq28UOp6jgCsDH
	Yqkue5/NHRB47UWzDCnhxmqATlQ3ROmr7zMkV+CXEFs5UNVASqea0/jK4sxRSDKT9tT5ClCHeNSSv
	bmUUQcJuBGkleVagvYAscs/Y53JEvXrFkzDOV3p2LJIZHUChqshPD+l5KG8adkcScFriLQBguJ90s
	+zWXqnoFPeUY4HRcR3v0H0L4LxhN8gdPRBoxLpT0ajU1HFCsMsrPD/+4xX5lanTGrEtq840fhfQiV
	brAe+oqb/npbOauBJoFvBA9SwJg+hOJXjRaIlt9UHR3gtP5+A+kAIH0sKWAHUJ7uyqo4UlWvkQnFo
	hmWgj00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEsL-0000000FDRp-2PL6;
	Mon, 29 Jun 2026 16:30:25 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEsK-0000000FDRQ-0052
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqxxeqZrTalxob74VQT1xOqPDWCXqxHyfF+NmMh+75kH9fFbpXKiq4Kf7FWx8at1hpkUokq9GtLNw3zXfNUZb5+DbZmUvgLBS33zbLelajuC1DJz4lv3+ffrOu3XsW9KOpUJijT/1jD2MxfjV+AlYYrqpNfQznea+ElpnQ77xiHLTOVF8GvN0KETPYorKsZvax8Aet9c+M5/EmK6hgIZHL7PnkDBivtTb/s38h8jWWb/aGbFYcmNbHKVwI24riHFoog/rxHdNzZq+Etp6NP1i3xzbYyTCreVg5tf5rAsCwqEZ348uOowgjPQsICRD+tLGtfwkyaNu0y/lI/1W+cwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r51vBflPLPCW6bZheOH7y6x50zxuT3Or9c+D81EvhYQ=;
 b=MsFELGr03pkRzmltXTUE4uj5+7KVov9nKK9k8byxtoYZ3zN12TQS5oEMt4+zFWKY1f7gcWp4+1TBNMoFq7Ab/6cPmYt2goYcMK1/pCP2lzYogazK69RDSAqBwXqOWMlmjkFGNc+pO3XfRXZfP1YgeOhKek9q0mjO7vrLkWw0eRuV8eeP7w88UTYXDjlezOY7c2D7oej6obCT8ozZsf2bbMKHALlI0RoiNIFFxc5DCFDQ/wdYRYo4X1bHbwLLvngDehXgwYmih3PcV1AuLQ7FBlWCPnHGVAbZzjdTFW/0+KIdMvzM4ErfKWSJsHOlqD67DOjTQHJnxdTGEcDKkBoqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r51vBflPLPCW6bZheOH7y6x50zxuT3Or9c+D81EvhYQ=;
 b=PY83pEo9HTi/oYSarBivg2q6vC233GYOHZ6//sxw8f+tGAdxs+GxkFN97pvbyffvWceJ6RYHkMNXGSKTCxECf8DXowckVAHu6SYQ/m1ZaLqqmkiv+NeOeTWJuL9LwJYawF5bh+H2L6Moqc5grq5CThV7eQUQRk/rXk4nCsOsZznvJTiEFbu6kWA20+UDkQgOoO3y5KS9C5f0UQAZg2PtTC1p9XTSnoFLUIMOtNmU/kFbZ5tt1ZtMqDxIBvj/MUwvOJSsdB1fNURavpgaTHgESHKxhdvPmHYcxMg19TT1oDzriO1t30FV7cQw5diKqbpfSVCEIasudewIrcf8fGz9OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:30:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:30:18 +0000
Date: Mon, 29 Jun 2026 12:30:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Message-ID: <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>
References: <cover.1780929317.git.stefano.r@variscite.com>
 <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
X-ClientProxiedBy: PH7PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:510:23d::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ed2d14-0938-42e4-3b7f-08ded5fbb4ea
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|7416014|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Q95WxHrY6lmoJ5lhBl3ncoLRSzrbA5Q+kbKeYFB+bH6dRleNqHw4buWO1veQwUQo6Ntm7qtYoMjEQyR0CT7nlNFoOonh/xwz77m8IiO89pG9n/svkvzMs7iKJt5J1uKqHSpc1RKqqyvHyog884RKYu1kCZFlqbBpwedwSpLqXAdSwJpx23YpvulO4Yf2eft/IruIScqLibHzwEeqBfoiZzwlt0cmrXl8wsMA/y6M17KxjsATg/kOkcIIdBa3TlyWOBWiAVbNF7CnF+t0Y6YroaCGGmXuQOweo1ba1ZdvdY5W9xr8Ixhm70413Hr09pyqkH9g0cvC4Sgq934uKyOaGqpma81IQNulP1k5FYIWd1R658jgHb8l5ktJnx+E9ZGP+lJ1O9Ej4GBxCbJfSLCViCr6WLsuSjdk6NWDd2WRGbZeUSoHgvQjPtURLm2cz+K4RvaQEgBFSTvE+p3wrncw336KzRxvF+49EDke8gc2jjIKRyBdp9ZNeROG+cPL/16CnfXZ0f3HiZuqHCv3MKrt2UInCiIgDNgN/njLb9kCyESuSGK69EY8nB8K19IKvzbMcCsGplpNkgoS2TDaSzS7F3EJ3nvn7NaP2cin4o09flac6kGOT7gfZGUQi/MtPbihm3dfxwFr+OjT9H2VO5iErloUkhYaY9z5gnlajdkfLvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(7416014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pilMbkCl+o3OJ9e49MGsFOUSQU0aO4X9vZ9tlsSQgCU2sNVY7csXxrz2iDU?=
 =?us-ascii?Q?eJiXzBJF+J9lL6pihTo+1V89qOGYoQ1kkZiMP5mddLwunKlVRu9mkvvSvxKb?=
 =?us-ascii?Q?nYNaOpoma5iJ8YsmVX2HhF9Cz+O8gTwJRF3eFs8vEkbiLGApiVL+nbQlA+5+?=
 =?us-ascii?Q?rvcB5OLkrgHZgEItFdhRndhuILsxgMDKnCb2xBo5wpObgkFtZJHuvFXyYf79?=
 =?us-ascii?Q?UfViBmzbJgjt3yCMrTsX/ZX/XDLrxBPMQ4xOO/i35h9LQssdSnwSQo+IigPj?=
 =?us-ascii?Q?iWWHG0xVstR01ey2hyZ6OfycmfkktRs5T5tF/XsKFfNt8DA6nsz44cwk0sVn?=
 =?us-ascii?Q?7OUr8gHy5UE/UKX1yDdZCRavmnYMksKcvS2Oc4XGlZcD7ZoLl6f0EuEUv4YD?=
 =?us-ascii?Q?YWGul18keK6ySajbGHHGa5hAgoTuYzyopgJRVT+4m2DS6yeHWG6I2sdr2cZ2?=
 =?us-ascii?Q?MPAIVpjki13P77XUQp/1uGhzKJF8YtOiJGjhHZbmRopyNB5LND3A63a5q+Kk?=
 =?us-ascii?Q?U18+osFKlpHS7R7xwj9rUFVXc5L3dkJ8JtjNrgDu3ASDBPzQMCXqFtWx+ziG?=
 =?us-ascii?Q?FeDcEHcyTfIlmi4+eZFfgKoZ8X2S+8IMWq5ollTMCQ71dQKjdJkeZvLInrkV?=
 =?us-ascii?Q?HYcxDfx/u905XLbQD/T2lfhy/0TbDZQ7WGl0pIaBZaCDWec8b1wsCk4IoW9D?=
 =?us-ascii?Q?LU1OEU4sF0vhqUWj4+Drk+jMMtC4pTzQ5LynoqznFeEAe+TvGQPKR4fdAX5i?=
 =?us-ascii?Q?PU2CZD5xzYYi7Qsof8YFRdietr65yGvJQPJj4jVlkrOZE+qH8OxcSFfc9yGr?=
 =?us-ascii?Q?kQZHziHJ1VWB7Iga2k0IILroqicJ99nO25L97U+iA4RYUvVQtQZEnyTSVDnq?=
 =?us-ascii?Q?5+RuFsEheqmaHlX5yGP6GR8SdqRb5CAanEoQwuLMCGbZSoHe4jqEjCsw91i2?=
 =?us-ascii?Q?Fjb/yjEZvmDBd1vt4lgI7+LkeohA4Cgu9p6apk6vmkzmuxN8QU/YYFSS+EqC?=
 =?us-ascii?Q?eG0LWDaj0edcZlgaYQKDTfB6/9BOk/3JxYqpxqmutbVc0BzIbk3cCYoEVydZ?=
 =?us-ascii?Q?POkjX8HmrO2R1wdWFpjaI3JY1PKxPYvRgXFj1DuoDphWrmcBeNq9nwziqyw6?=
 =?us-ascii?Q?4rce059QM5w6m4KbItjbflRUWlt21Y0Y5lgxg8DkdMtpcKlo7u9bgrHCgcIF?=
 =?us-ascii?Q?0fPqKIdqD0hBysf/MDQYdCq3n+bzCEoCzsIAuGpDi+7eSoIGJUb8TorD7++S?=
 =?us-ascii?Q?SiYATbLnlLqThDamPm8fOV+VeckGNW/hMkjjDvSNXF6C0EgiNQnop//VA/YN?=
 =?us-ascii?Q?WyDte919kLjm4kJ26QQ2369C75JBTixXyRkLVsotiN3S3Dd8J+gBLAwzJlKI?=
 =?us-ascii?Q?oeqwMRazUJbfCxVBz4E4Ud7I0ad7hldggcm9BAqfI0JaJGCk3XUz6gqWUYwU?=
 =?us-ascii?Q?TJ7Yz46csbZJpJ6q+UA+EKyiYpBbr8EvXr73JSqJgXWoa8OvtvgPM0seblit?=
 =?us-ascii?Q?arKrCIDVbisQU1HTBfqXnF+3nRlpoIraS05m484uyKQ7gkQBPBfVtfxodHEC?=
 =?us-ascii?Q?sAwUz/b8iqr+NZScWdek8HDTNZpp2vFFgvyMUhO/4B4OyRcB4c6Y09O8v3ad?=
 =?us-ascii?Q?g/d6Sbk18Lb0htWkAD2a84OQ/OHF9JlFl38EhbwjWRSOzOB22Iz4zZNc+oBG?=
 =?us-ascii?Q?q3xbdhlB3toaO+CXHbb9zkkVBg4YNnUVdPcd2qWWH7ZhVUsW0mojZ9KJlOBi?=
 =?us-ascii?Q?fJphZw8i0ITPVX0Rzmin3CpkY0DDU4WdlmSQs37PnPBKykHhhtr/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ed2d14-0938-42e4-3b7f-08ded5fbb4ea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:30:18.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 079eJPTXfIke4lpL2qE3MDqCvpdV8kcXk7iSs8cdwTYd0DuEKM1TFzDQt0pCK5dKT16oXRAFkHXrrd7afnqvLbnFLVdDdOkCMKxI+u4bAbQHhVoCipydbfCFrzT0BN+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_093024_041037_6E8A89CE 
X-CRM114-Status: GOOD (  16.16  )
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

On Mon, Jun 08, 2026 at 04:41:07PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add the PCIe reference clock and enable the PCIe controller and PHY on
> the Symphony carrier board.
>
> Describe the PERST# reset GPIO and configure the PHY to use an external
> reference clock input.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v4->v5:
>  -
>
> v3->v4:
>  - Add pcie reset-gpios instead of deprecated one
>
> v2->v3:
>  -
>
> v1->v2:
>  - Adjust PCIe controller configuration
>
>  .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index fdac4ceb4c19..698f02fc39a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> @@ -48,6 +48,12 @@ led-0 {
>  		};
>  	};
>
> +	pcie0_refclk: pcie0-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VSD_3V3";
> @@ -146,6 +152,18 @@ rtc@68 {
>  	};
>  };
>
> +&pcie {
> +	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	clocks = <&pcie0_refclk>;
> +	clock-names = "ref";

You have to provide all clocks, otherwise, whole clocks and clock-names will
by overwrite with one clock "ref".

suppose CHECK_DTBS should report warning about clocks items.

Frank

> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	status = "okay";
> +};
> +
>  &snvs_pwrkey {
>  	status = "okay";
>  };
> --
> 2.47.3
>

