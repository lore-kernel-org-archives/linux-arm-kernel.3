Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30593F54AD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4wmmxMq51a+UZyJ5e3BgqjNPsEVNBscF1jHzUjAzxs=; b=aRkxax0vsV7y+iR+Z2YYl4bXWw
	XX5BdrIgzMtbI9Nak+zFtEB0PnTtcbCF/x6CCzUcrr2CMrGu1oyQwgjn2JESmOaAaxltGmGDVgGRi
	/544Pb1RMN2+22y3qeGpuMzXrfEM5OPnatGIzEyUO5hxVDc4x6aUH2B4Kc1Y5omP7jZGrIO2lWEi8
	zRyvJxfl5TCCJ9hjLqV0jxTY9S2y78sqzQbxIms9wVqXIH1WuBJRqiIOKymo1fxpsfadBHvmUUXPs
	mKMWBS5eIJZJnfQ5K6rT2x+2jMMblmvftxITxX8FJYa4pAtzVE8Va45pIo8WFOQGlmtAngIBxpvL4
	rbjcPRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Iu-00000001qob-2UUO;
	Tue, 24 Mar 2026 16:08:28 +0000
Received: from mail-francecentralazon11013014.outbound.protection.outlook.com ([40.107.162.14] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Is-00000001qo1-1ogc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lg41yDgCVUj1ry3ZGMENCjA2jU3SW1t01zQCQeeXqehJQRm5WI+w4b0PPRqnudMiyNbbsc84W8SHdsrF071llM/4legWM0aQD5qgotcGqFsKccRSJBR0xNDx2tCzG/LsiywwI4YwTxV9m6UAbOBVfAy6D8JuuRHuoj2Y2d9yA31Vaf9VoD/b+B6jII0t8oMmHD2gA/jhDwba01q1zsF5EYGD/5RZ0mmNMOB8zXMVxLMpCWRH9m76iFIWfdJ5ylnEN/f+DpmxtUPBWPLiOcLHd9xOUWgPr8F6HWNvC5+c0guoHUy5ZmvfzAj6GTbYiDlVZSe0PlH9VsbFGmrA2hAtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4wmmxMq51a+UZyJ5e3BgqjNPsEVNBscF1jHzUjAzxs=;
 b=SHMd7XLcSfJE+y+Mdp05o45Zg6E+wpPtERdKsHEnf2FUww1I/mpyOheNxhACR7g5P6Nx6KOjrtKlBZnBXELB0+DNT+oZiW/iRyOibMynlGok1B1dx+iERygam7d8pHkGaXYPOPsO351bdBbBCY/92s8WDiCU9T8bCac7V4FU5aTzToMfeby1BDdkOvR13hAU1EIv73EjS0mIo0F1i8JNY3LdVOtSOXg99TW6sQy1OxEsGW5qYiMzBGArPL6Kx2qUdc/I6tNbRlgNbdkGfWlJPp2ePpMBEEMJ8a74N/0wgn4swEWpZbR9bhcZfHIv91ibY1OVgR7NMe4PFeW86qdbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4wmmxMq51a+UZyJ5e3BgqjNPsEVNBscF1jHzUjAzxs=;
 b=QbVbGBkV1L/V5DNKCPEs3OCrZlwidOuif+8F68t8tC5Jn3ABWl2ZCqxkOXFsjEvtfc5hPW/Jv5+ZtHvq4ZlxdRsi+0r813+vSVx7Wt8ApW2GDmdQ1Ex0IPhVr5OMHBtqKugdm/eFMIL7+1qnleHzZrhaA+YnlhXxVTrRhyv/DoKwmHjC5PQfRXpargm/U+VI+Zo9Os4fuk27OZ5IBCgR5m+XsGlWqvhKU1mRsre3AE/CK/AQOT/8J/E4JGexh3s7Pu6H06nkwoccb907X1SC5+h5UYEArLkomcHkrgd10pfGoFQWyV4o/XWGKgU0OyuvFqrnUmyR5DhHTIPsUsDtHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 16:08:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 16:08:13 +0000
Date: Tue, 24 Mar 2026 12:08:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: fsl: add Verdin iMX95
Message-ID: <acK26Vt_rasid8AR@lizhi-Precision-Tower-5810>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
 <20260313-verdin-imx95-upstream-frank-li-base-v2-1-bd488be7c699@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-verdin-imx95-upstream-frank-li-base-v2-1-bd488be7c699@toradex.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: fba7a8e6-0d5a-4357-9864-08de89bf8c80
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IiXH/krgqB+m21/criyTo3KFVYn92ga5uyL9Pg+IHIuwhKzHSFL+w42qbz0/vZ83kjqq6qOYAteC2zCCopGuBdLd72Sr2GNOEuoJTfSsZA/A59v2g4qr8uWKtC3+IqH23kvHg+5QnrqYeMbukU5y5ctMj7Mg/vnkY4A/Nlty5lDIcR6iibHSQ7LbyuF3TheufomAkRpXy2IhbSUBMh8gCyVZYGCDfw9r8FviI7UMNraCE/inGUH7oyE7JglAoHKFm9SkWYdRPaTrUnaxg5CQDVzzXivQNUDJ7nY1hHgJrkQHCMpC0QapAn2B2X8OxNcn5gx/uwDwiebBFeftTSkYnC8l77R6Lfdx9T1mNUsS7qDhjquQ5CpluMLzTerU373ZiE4f++KC6JK9eze0uKYUa6my8fVvnfjnWZHInGX7GPbZgt2Y9dUD7QxKUyiSQfa3+JOMHXTOQTczIfHWU8HLszUZTcwVO79PRkbpRXVAfnI5gKfjOUWEC5tSvMcJT86OwPKhcoNEyLZ1E3EW0SEht46TbAysRdtN+Xm6A3nPWq3FM8PDQVb/JMCwwKAPNb/7c8REtVOU40NUgw6JC8loA2KqWNtB8hOoE50Y9TyAaxkUvqVDGZbFIBHnaPR1ZzJIXb8U3SbqQDLzaq1QvzZ7VoH1Wa5mgvnrxSdgD7PbzRCedD6/It+3dPYWYgTats0wxO6FgI6oELhxRxyoIvJK6zd1oAaPVhWV7ecFeXOqsm0wdcJ+bZqt6qXusFXgakT8UfZwo3iudthd/KaoCKozcuRIPV12zFXhx0iVM7nWaYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jAFKmoLbHRa22vc4QyjhhyhKOhiocHH0sj+cHgFRHO7VBfn/AMSq9np1sKHz?=
 =?us-ascii?Q?07ZxWdSUz2JajIpQAzTwx+yIrcEXFG6oMHFBOjKCuAGvVdWVUmkNaMCQDPd0?=
 =?us-ascii?Q?LKKvC4aAD2KKtPeNJfU1IGfxoqt6QoumQJVekHUC2qmI8q7T1a+2r2TfLNC0?=
 =?us-ascii?Q?Mfb8+0uoQ4Q4q0DhFGwZXI7IvCn++d1fG0dTV2Vr/v09JSyzLMYl8wOJNt8m?=
 =?us-ascii?Q?qDQD0Rhme0KTTbnA4Y3xlrzqYLUmop1Xourtl6ubhJnjowh6P6CLMzhOFBZL?=
 =?us-ascii?Q?s9UKWQHBA25ioJY0mmST0BhyTbLk8tS7WlDmcK9YFi8q7XV5EsGTSEJsl40s?=
 =?us-ascii?Q?Pl1q04B5r77V9DZ3AEuOWkPpS5QtiUOHPaybsJgO3BKxssSJBtub7DsKtg1a?=
 =?us-ascii?Q?D7RXJIfkHoZAWwb+amIm3GUgyhSWo+iEOLbaWrLfIc0kH9MsUPLVdvM5+cbf?=
 =?us-ascii?Q?o29ZmCcikW/1yNIPZIonvYQ8HONC0c5UexWO2DMkk8/K8ecO4aWfJtFYHKBX?=
 =?us-ascii?Q?lTFHEB1KWBU0G0g5HnhDtxxUkdfxaa3Gdj+Dx/i3icffV0bbIbkIwTgrRqAW?=
 =?us-ascii?Q?G8it1Q9uVjAI0mcDaX0PebSam2+4a4n8xws2Umn8AXXHnZ2bAXELO4I4+qnu?=
 =?us-ascii?Q?D9DJkBI76pNWM92JhmkNRQ4iR/vHKmoFcgphaCjRPXcGE4LNvkpF+iRShYAZ?=
 =?us-ascii?Q?CjwbsFhmvqtk8rtcJO3AZd6kKmxgyEFYjChfTfxPXvg3enFGuc8udGXSjilz?=
 =?us-ascii?Q?5gE3T0k5lFW9Fd9OU9Wjj1zWX0v7BJXUtabKuBTpdS3wSZ/iaHWfo9ysas9D?=
 =?us-ascii?Q?TTd43IEKG9o8e/U9v25Ncj5uL1DwaffgATI00zILL1wTpWDcor/GpMX4LV1V?=
 =?us-ascii?Q?UuR+4JI7EbYm7Q7olrX+mfxykAE4FOS1K9qireEJLOfs+EHB+6uT5y9449XK?=
 =?us-ascii?Q?1FkonB+51dTR0SsI0KeG4pbRYGVQGYw77pyQj2df1N00G57+iFvy7RbfNwhP?=
 =?us-ascii?Q?6hUNcoJ+RMGl9AnffeGRopLMlrIbf7bIkNKwm3JNE/hG4cIXQenFJIkI4Sni?=
 =?us-ascii?Q?nvShwv6uv1m0O5fWXp8YfZJoI6nAHda0YUQQ2SkXlYwQymJRbktQpaak09SI?=
 =?us-ascii?Q?6lguO6/0IHLCzedaxVeKE4E9dXnPy0LjeOOVfKFK2qbLAleHZ9l7HsueW/kf?=
 =?us-ascii?Q?VWrsZtZ507nsPmsSUWG8cEHooBNVBY+wdQw55jDIB2pzVeadhIQxt25yG92+?=
 =?us-ascii?Q?IbTd6x3szww90DDpFo531dGVzV6cCrlksdxK8ZfFjMr0zxyqKFj5MTPZcXAn?=
 =?us-ascii?Q?te3eyD+oYEtHPaCMb5NPzbc93L9PFDpyG89eAWvOZAv4GAWjOTumr2tEmz7h?=
 =?us-ascii?Q?Cwbmn0F0holRvLkLFJu2LeemmucdlAwcY0Br17ydARPkYVb89QTc5sHI39NH?=
 =?us-ascii?Q?ZdtNWjD6iYhFT0S01v4cbCto8lUHq+BfbQJfNLtOHe/qjElZWtmffasM5CBF?=
 =?us-ascii?Q?yx2uLuWK9raXYq+juIQvd80o+hyhazIlZvvc175YuDYJyEaPDZriVQNOuaBa?=
 =?us-ascii?Q?0aPlZT/T3ZygBMspAeB24ovHi7vbioYVayFYQXc5L19GZXNlrLkF83OPT7t9?=
 =?us-ascii?Q?gEPpPGNJKiwzkmdJC6xWb1Gfp+ynQCzwom4lzTQ+6nlQ6oULflXAK3lTz2np?=
 =?us-ascii?Q?uof6UFcSTrEvazpKgSP1Yv4+9Hkr/B8JELOpRrCNLw44KHQIq4mDUH1OCgZa?=
 =?us-ascii?Q?sbeRHyX1pA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba7a8e6-0d5a-4357-9864-08de89bf8c80
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 16:08:13.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkIAOP6CjCIIOzN1akxJVfhTQTpe7zSp/oaK8o2j+BEsLOqlWykjx5m7660PIV6UkRaKSE9qv6E9DvTlrrug+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_090826_474530_BA0F7470 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, Mar 13, 2026 at 09:57:42AM +0100, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Add DT compatible strings for the Verdin i.MX95 SoM and its supported
> carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
> Mallow and Yavia carrier boards.
>
> Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
> Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
> Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
> Link: https://www.toradex.com/products/carrier-board/yavia
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

can you rebase to https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=for-next

Frank

> v2: Added Krzysztof's reviewed-by
> v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com/
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 5716d701292c..f0701143b237 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1477,6 +1477,30 @@ properties:
>            - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
>            - const: fsl,imx95
>
> +      - description: Toradex Boards with Verdin iMX95 Modules
> +        items:
> +          - enum:
> +              - toradex,verdin-imx95-nonwifi-dahlia # Verdin iMX95 Module on Dahlia
> +              - toradex,verdin-imx95-nonwifi-dev    # Verdin iMX95 Module on Verdin Development Board
> +              - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
> +              - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
> +              - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
> +          - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
> +          - const: toradex,verdin-imx95             # Verdin iMX95 Module
> +          - const: fsl,imx95
> +
> +      - description: Toradex Boards with Verdin iMX95 Wi-Fi / BT Modules
> +        items:
> +          - enum:
> +              - toradex,verdin-imx95-wifi-dahlia  # Verdin iMX95 Wi-Fi / BT Module on Dahlia
> +              - toradex,verdin-imx95-wifi-dev     # Verdin iMX95 Wi-Fi / BT Module on Verdin Development B.
> +              - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
> +              - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
> +              - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
> +          - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
> +          - const: toradex,verdin-imx95           # Verdin iMX95 Module
> +          - const: fsl,imx95
> +
>        - description: i.MXRT1050 based Boards
>          items:
>            - enum:
>
> --
> 2.43.0
>

