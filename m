Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13589FD8FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdGIkNue3wC7Z2kwRQxQSzltLzNKCvLHh8TlS3QN/Ds=; b=o48B2Nqi6UHlit4eqad9OK8DrJ
	nnD7NoXG70hcNEsLlDN1DhGscRg8aMp49Q4dQXX5Qg6Rw/NmyfuO3MC4eWbl3Hi0ewQnahxa+HYfa
	pVm3CXWB0m9BtP2ydaeJTvjcIKt/f6ZasFgV4a7nJIUrzw0wXJ1/uucgQf8wDsBegqiSbEF8mI/nV
	KgbSQFuHhDaDD8iryIcWeMb7ddiwU2FsztzsWpqw5mMY4WuBS8jbd2nA1CJ0j9ICGh9MK6WdmsSs+
	Uzc9KyToHZEs8E/DxCQVNikHVCh5HIbIfKMM5Tc4fQ+eTVEtW/ymtL/AlsffV9bSs0LMz0ztkINm8
	Gd1dMsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd7U-00000006Thq-0RgK;
	Thu, 26 Feb 2026 15:17:40 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd7S-00000006ThO-2R5m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npEgV72UA31Hy3aoZdbfXGu/jhArV/9P6ZRHPExuG1FBmfPV2vaage2AgVEfq3HVobznQOni3zVSxqZh/G96c3ObqQ+JqUhBwi8RmJ2g53v2WjZUlybQpExr8nrq1Xhluer3hnuN/a15ij/9hosOodJ1j4JJpSCvsrMH3KEqeINXu58KH8RF1ICS83zFNt+SIQH2MUPVMKBfFtZUJhAmLesjaDj2bQtXsJw+RcN91vRvvh1gcQv0xNLjvCh9zcULyHWTC5PchcJAS2xjMw0x6tBHKxlzoAceqeACGlygBY+YfCfm5JNRKU6C5/iSVvgskKFuPBNel/ATIhICdaeQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdGIkNue3wC7Z2kwRQxQSzltLzNKCvLHh8TlS3QN/Ds=;
 b=lGi9944JRQ/idK/2LXZ+DFL1wwrcEemO4Smu/jPBkMRaUeGQygDH3BM+hAbrpjUMVFb4hlsD4eXlrJExBgDeTAxER+08ZdftFsPJMZJ9bT7RzDv7zWX7L/pMotAllrgHRKmRROIQjTk5HQGWCEiPc/gv2u9fDjbCnoPDHmjVSh/wR0W/W4tucSM/J9CNLdonB/XRj2E0jLKNZG/0mSk0uVS3hUWcez4mRTrwjfEFeynsdQVoebxohca0cZwPFEonZTKz7bT2kDcpxJtf9OZUgt0y9SC+KpTytpGD1KAPyCATLM+Iww/apmztbvRMB4+PyuQ7k5q5OsUhNKg1wTAV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdGIkNue3wC7Z2kwRQxQSzltLzNKCvLHh8TlS3QN/Ds=;
 b=K0AS3sLEvBb32AjYU9i3UwYfU03bZCUZnNdMAS8aNIskf+xMsBvg7vwTKaCsfNRUwOR8iIXova/TvRSd29msrCJciFhJaDWUP4Y/AbJ3Q4TVoIunG73ZKmkq4TRnVheAVEUUKbi3tyfXPeQNO6c5OVMIJNc9G32ahyeK35BaK0FcXEMz//JxZn+q7OmJ+L9AA4wjS09P4cVBLmwK0YIqbcczeJ8Oj1Tj9uAdNlI7+REr4skFtHmAVpmA1tO5ZONtvc/Xxq/6hzKecVMFLV5yZTxveovQhQLf157Q8Ck6Ehkkd0LCcH4S4nAZdYALBBlX51lrEXKiDtv+d/xi41ynIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRZPR04MB12429.eurprd04.prod.outlook.com (2603:10a6:d10:1cb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 15:17:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 15:17:34 +0000
Date: Thu, 26 Feb 2026 10:17:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, s32@nxp.com,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB
 board
Message-ID: <aaBkBAvW6mvwoLqX@lizhi-Precision-Tower-5810>
References: <20260225133858.8026-1-ciprianmarian.costea@oss.nxp.com>
 <20260225133858.8026-4-ciprianmarian.costea@oss.nxp.com>
 <20260226-sly-fuzzy-parakeet-ea9fb2@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-sly-fuzzy-parakeet-ea9fb2@quoll>
X-ClientProxiedBy: PH7P220CA0046.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|FRZPR04MB12429:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e98edf6-a9fe-4121-679b-08de754a2acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: T9RkEHqkBP3SWl9HnR44ITqwVwnaPHN0jsz2TswqJVjzBnL9U5/2bF+f/UGyYDu7w3gt6e5OkdgSh3Cjo2Xe59spO0JYE/XegeEPzMx/acyXbSyMV9rmxnVMaSVCaA6I2+uhWLRsRZnmG+Vf6MHTEYKc+kDcO1BECSBGVqckEfw1FxYVUxW2UFUr1AQs6gdY1daEPx4hYxF0jNrROYIkLkH04Lxc04t17s3VoPOcYl/ddm9RuvRcL37kKG/Y0rDvWr87XNsUPJg2omOxyjLlzClP5ts/v3LVBQE85K76y/dwmvxjsDEEqTjq2dzH2PNrHWYgIw4VeoTD3wP0TfvnCRjTqIiim+VORD4cF0efRvqVEKNRSBQqjlnaF+dxUKfn2Vejvve0M3a2M11HPyUsWnAaphzbZbC3GjxL3+Y4KheHuS20F8WcVW98VLwE0XxwfipJrWs3vrac6jLZtV4OWUJjtoiXD4yrm5hV6syflQJtIq/ICOJs+wjlHVTjKf8jhksAzkZTAWW0JGWdSEgLsW5om77qT0Px3FfGxPcZmAiZa4XR7CR+AwE2MQWFqnvqcH52TapkryUiuFQdp2jLfLWyCDPxFo7oKcNFRHRpMqTfkcn1BZJPTaiJe9JfCyusRjBKLS2C/qFogh1BBIkL7mql5+dL9ujMfRyM+4hcUPfovbHWvNkHqvXHiKi6jq4lHUykTv6qQIr9NPBO2qL0X25XeF76QubwE9/X617wSXC15BeHtjrV8enb+AJYVKSzDaqH0306ELZViMg/jLPRtm0LikgrX+7R2+6dxd9FPME=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Am6STlU7u1f3K9jigHE4yRpa4JZStbMujkf0A34iLhB9YC+BepvDi8DMEnFd?=
 =?us-ascii?Q?xy8qooz4sjHCKfaab3FTyVQ5YZd7q/WW3d55RxtTgfBBAqDBcH5x5S4mUM7x?=
 =?us-ascii?Q?Epy2m1ejBP2JilikKDkjoM4DhkuoAksmjPWzORdZO0ITBCt5bJPMKtTJXb8q?=
 =?us-ascii?Q?81KeVqiOeY/+QMc0nNMYOypoSjnkdgcbk3oxezfdd3FqgjZ9YHnDszuniogG?=
 =?us-ascii?Q?rDvy07mQRxbKaEYsGReQGI3yIpsvtx0ofNVBGMBbje6I/ds3FbNoEcRgBOSD?=
 =?us-ascii?Q?OvQSIMOToT5V8qXNgMsVgUaWek2FnrMnyIUAJmrBfLzfPhUvM9afMVdpjfdg?=
 =?us-ascii?Q?KOvlSwLKOJF76Gjlp074alPwPeXkDnWCZDz1saQc26AWJYOrT3CT44HFfxIb?=
 =?us-ascii?Q?8MRPBj0HZQlHzQsPaAkl5Ojg5qqR893ZxghUjgFqhIbZLkctmaz8/3h8mrhz?=
 =?us-ascii?Q?5O6s4GAWG7hmCeDerg8V97Spjy7LU+NcBkNXr2Kfm5kWMyjTJ0CRXgmLQUvQ?=
 =?us-ascii?Q?JxGQWv9xZAUtJaSJGr7dsoOdLf4Gm8GhwXnkztZMfumJYh4LMdxJMRMArWA/?=
 =?us-ascii?Q?4DofPOcSjcCWGWu9szpD66A+D4iqkdoStyROhP6KF+rPcQbiNyNdPkfXKizG?=
 =?us-ascii?Q?lH1FKVqkWJVFq7W0lUxJGLiooPuftWQpRGnuRMBFg89t3WQsEverlIrf+Fak?=
 =?us-ascii?Q?fbBG3VYVezvRZ0Hf9rQLMh9UTccKcQPwcZasCNCN6CrBWRfJiPgESFE1d5Yg?=
 =?us-ascii?Q?997Il61M+VV5pqbJmF+ZOmy43iZsVqlKda5gtrtqCJ40Cn4bgEE2toCG2FEL?=
 =?us-ascii?Q?tpARvkQRWtGkQZZFVp0w53qVesRwxtdcnomqpIM5vzMqvaiGecIGyHNmVzST?=
 =?us-ascii?Q?7eFahaTBTyi7cKKVVuhKDf1AnteeBEj13lf7j8NUECbRKeDSASSxJqjRsN/X?=
 =?us-ascii?Q?Fw4NrKQUFc5y1luTTYm9O0JekO7KWkKeJ3PHZRNw4L5Ct2bwFptGNdErm9jl?=
 =?us-ascii?Q?1Ez4zwc2Njhr4CaNcjCe/hiNRE43pUIxzkFkuYoz/z7VZPe2oXMGkASTBPtx?=
 =?us-ascii?Q?OZ1XblRmIJek6CRyzBSRrSfvIZML7hkfTO/1CP1Jws/7YHRfJkRfZvvth0yk?=
 =?us-ascii?Q?OXq7Vhlb1YAtlp1GuB4/V/rYFHmN9K/HybcZmTFe96D24IuzZ0LlhYv9KhpO?=
 =?us-ascii?Q?yTB6U0iU62NhTXWG0Y8KPGfser4etx+tTyliDUJbOr4xf/gBy9n0Av/IcOjo?=
 =?us-ascii?Q?D/CzEEAG1awnRR1eHWxYA9/IQJAtrOHFwf/9kZpSyZ0T77HXPBHvX4Bf3Wl1?=
 =?us-ascii?Q?i3dUXTnfw0Kk6Xlczz9cUNf+J4igtUX9/jDBeOZAR3SmCjE4zRD3K4ATupA3?=
 =?us-ascii?Q?nOhPO4H7C0uodvjlVMLIzByc4ETZw5+Dgn92QEEFx50bYnHGbhruYBcic5yr?=
 =?us-ascii?Q?2wdk53hD1hwZT1lT2NHSja2+B4sGAIFtqEVMtgxjhxY+7DS47njaQ8Kpz+Aq?=
 =?us-ascii?Q?KYzXtoRRI8KbXR0F5wFwoCkkSGhJZ2iUUg4VNIY6fNHE/R4oL+paft749eU8?=
 =?us-ascii?Q?/iJTCiz8/lVa3Pal67LZCFXwpmYlOFgXOky8kHLnqp0TbPTDvXKqu5tL9wSb?=
 =?us-ascii?Q?A2jmlMUdT8bVCHFupivAo2w44NLwLWQhqIvX3x/5Sres5Y3kDMv6eh67JvgU?=
 =?us-ascii?Q?onnNe6L/IJPI3H5TREHUp9Nm0VpTccK1kBG4ssn/ZFzbAId0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e98edf6-a9fe-4121-679b-08de754a2acd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 15:17:34.0936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH88MwGogFaN65ZD2/NGvrNZmaTe85cQCVgEq5BgwFjDnNQFJ095H3xKvgitEcX0BPH+tq/VEz657jHgD6kpfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_071738_621907_36E49B83 
X-CRM114-Status: GOOD (  20.01  )
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

On Thu, Feb 26, 2026 at 08:32:16AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 25, 2026 at 02:38:54PM +0100, Ciprian Costea wrote:
> > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >
> > Add device tree binding documentation for the NXP S32N79 automotive SoC
> > and the S32N79 Reference Design Board (S32N79-RDB).
> >
> > The S32N79 is an automotive-grade SoC featuring eight ARM Cortex-A78AE
> > cores organized for high-performance networking and gateway applications
> > in vehicles.
> >
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 5716d701292c..415081423a30 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -1827,6 +1827,12 @@ properties:
> >                - fsl,s32v234-evb           # S32V234-EVB2 Customer Evaluation Board
> >            - const: fsl,s32v234
> >
> > +      - description: S32N79 based Boards
> > +        items:
> > +          - enum:
> > +              - nxp,s32n79-rdb
> > +          - const: nxp,s32n79
>
> I believe these are ordered by fallback, so s32v > s32n.

Previous use fsl,s32v234, now use nxp,s32n79, I suggest keep consistent
with existing one, use fsl,s32n79

Frank

>
> > +
> >        - description: Traverse LS1088A based Boards
> >          items:
> >            - enum:
> > --
> > 2.43.0
> >

