Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC31103E17D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJV0T6d4bCFyMyGoohm0615dllleRlMqHyZcNbvCvkk=; b=cUQe2WU9a4MZigekXaHOZLiRte
	+58vg168aA7xLOi7oBraN7Aj5KFCTciMCMk6rPOMNLlMH6m95QnvBr0Pzm0IhYHyhXlATYbcqlDUV
	XwW4t3S6jTyf1yCaoX/3pk1fhOOpSsKB22DGStNc8QatK7NRCwHnOI7L4sJvarvv3pRugCHjw0HWB
	bl157c0PCAUQdY7ScGBo3ZRELPYq1aHoV1sBZ9wEDM9cAp3RuZQ4t6q9E0R9CPHOStmL3lyJgMfk5
	9wMcbk45Xj+DPtfIvc45fVAql/NcWqYFVOYhF/oUDrIcIQUWaqARb08lRUC4sdrsIHXZ1ohl+OUo/
	RYiRziMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rGb-00000008WIW-2H6R;
	Wed, 18 Mar 2026 13:48:57 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rGY-00000008WGc-1Lkh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItmOWn9j0Wpa0Zy22epZpyA973m7qQ2WpVm1tg2QL3pplKKWybJCwTSYgrr+A4AicbyzuvnWfcNoLzAIe47uf6CDc6AYOWNzMngQtBsh7F/G958rDujrgfBYosyrn7qBFL3JOruktubS2RglAf1BcPme3UZsD09fDswsKw2/j4ebZiiVkO5vje5U1rh5hpNfaU/He5/Csd7C5jUcWa6AG1iJZDRtkDpPau5hSH6r9+VStBn6yR4EU7DIk74tfd4/zMYMLX2QD8Dr8dS3YBQRh8gJGGWk6qjQV/AIkk9YGA1g0lgEtFoch0BAvmcu+fvLoKA3Nz4yPyIbug/OIPrSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJV0T6d4bCFyMyGoohm0615dllleRlMqHyZcNbvCvkk=;
 b=lt0GwwVu5q7hJDOstNch3E772c2QgQYQq+ASkS8TRUOjwTQ0OTUzfQx5KaK63oRoYx4nNE6+PeKhZLf5Vaiy/ubBaAnOvts4mKmiGcIyOCbxWOQMH4AURtjguY+MgFlQiy4btwS0RcM8wikTA6TH1o8y4TA0QelTgwmwiSSG8jbOeetjhQf/4t9ZBZnDAlfxfyWpL5s7mtkrUcdyxnJpYvsO7UzFR2FUu5WDVwDR+80fpxHrUT8+HJrQOVYlhVTq2wxJQGGBltSN+BP8F5nLrw2CYw53GHmFJb0LT9vQf4P2dHw+MPjuw/BxY+MThopUMd80sunfa0KxvU3zKkkxjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJV0T6d4bCFyMyGoohm0615dllleRlMqHyZcNbvCvkk=;
 b=Dlca7Cel5KPjxMsOBLqrS58iOtLELzeC+UVzxryXtzNp4TWhKUBl6z2x+VaK81c+94UVDvt/wcXYY2yDAIJiOjr8zTrZbzIQVodphK0g4u1tTmEF4tmMbs5Gv2TJQ+zhg28N4G6LJ/wHNfd92/Z0f4F8Ul3N5WwsHvEebiyQ10sNLRWaBovDklAd0EGVbak8laWt7/HN3uc3yNYicLJIWTfuM07wYuEON/B/gqeLB7nRmXV2343sirW9OxvLqEqjGMIAbnFspqXjATSTInsapxnxYgWs7EcgXyLZOnMofPKhHkiw+VGQ3nnf7+AF2jjyp+O5qDtAUktv/Gtw1jQ+zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10738.eurprd04.prod.outlook.com (2603:10a6:800:277::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Wed, 18 Mar
 2026 13:48:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 13:48:49 +0000
Date: Wed, 18 Mar 2026 09:48:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Carlos Song <carlos.song@nxp.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 04/10] arm64: dts: lx2160a: rename pinmux nodes for
 readability
Message-ID: <abqtOFohYjf0q6P1@lizhi-Precision-Tower-5810>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
 <20260314-lx2160-sd-cd-v5-4-83de721585e3@solid-run.com>
 <abiiDr4bLYIufKwp@lizhi-Precision-Tower-5810>
 <52a09ab1-ab55-43f9-91fc-c35f6a0d4730@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52a09ab1-ab55-43f9-91fc-c35f6a0d4730@solid-run.com>
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10738:EE_
X-MS-Office365-Filtering-Correlation-Id: 50867fcc-6b55-462e-eb8c-08de84f514f7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info: 47WbSqgxQzdj/Pojp4eSNZtywShxg4y6WqxKLz+oaukq/H7gUVl2TmUV1II00mXtgn5AO1sTID2hX32Q4/ZDCwDY81PJ+ZckryiI2EgmOF9OgHGkC7udKb81fJbhaNRAQsHeY1ywj0bGgjtI4JeCbOYLMWdBb4XIvVdNDkX8d01K+IyXRkBoRyypNbXfTzFLoiLg+Nep1dFGln0X4vLHlWjyEEbljtqVLoq7PrgI1WVXMbNXRvP2v2NFGtrgtyuDGssdzfMGh4CV7qkHRpKranwuEGMM2ZMYgMPKuvqOur5lUzZUEzMT0bFGkFTZtW4xHQqPqjs+GdG7XXgCXSaKdCiTm/LFXbLCgC9LRQfhA7yW27o4BnZ8TmeRFFBLkDZLrQ5paFOqqPvFdpdpuzvdlbKiqFjMHQpGdkVfWnK13p4phlR8mxdnjThSLfUf2tBtCpOT+SMglzMnGTZ8ku3Nx+2EzHJK/pli0Ts0YXi+nMexqsdOd4Sa0l2eWUDFU5cXsuH0joyq8RZhRiZrl/J6Ty/Ca/x2nFmeUrtmz7vwhQXzK3FDG/L32mKl+zewJyO6K92vWAp+qUN9G2s85bhWVVLa9F6U+1P9o+T4kAQJVlIquGPwkaia/78l4QYDb6xrq9l+gi8z10pNBHTm4ZRNGGqBvCyLHX77MDMv/xgwsQi0XoJHrh5h9neF6Pv5UQq9i/xX+ReUV6o33bzk1FQc7WcaC9TzXk90yObRwUQ+ICvj/VljhcxepIchMpOatuQ7ujjCBNgl5y5Pk409zrEzDYu9qb4fW446m5RDzhKFM4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KZD4m5W+YW/HYPyQ69/e6ZDrqXidkPDEPj90LFDXSCc9Q51YD3SEuyBtksLK?=
 =?us-ascii?Q?aPmY9tnJioPuIQ6Ph9MMgufruo4cgRcCkcVM+VN26kJnMsLlBE7f95YTMa+Z?=
 =?us-ascii?Q?trMqkMpp4FK7noejBHlFTlVPzZEIv3E5pFDPF1yGWVxxouV9LMbtGbdHFW6n?=
 =?us-ascii?Q?VWRKQnz05IqRZjtEuAHDr4Nm9nIErLHGMMvTww7ZLwf8EwV89oUeiGcROjkp?=
 =?us-ascii?Q?iH+fxY50xmr9/ZZZP3Se/t/SJjKn7H2qfvjqMxWvMTq+ZeSTMoEc56f03i4W?=
 =?us-ascii?Q?UGHeVgRoRlRbzJ++k5L10cjT+S9u0XIG5JSQ9Hgcqbbjr0kZkTs0ZvfDWohp?=
 =?us-ascii?Q?kLzF8Q1fYzOg6Vk3T1J7xOb+87wFjQR6P49lFGYGnMfV2A2/Bs8rmFfrskSm?=
 =?us-ascii?Q?ZuKKtJn/+R19gOH4MyGHahqvN+9YP+ZKsLiVb8dDjL7M0bsfZ3FlaJukNVpk?=
 =?us-ascii?Q?z1AVni/wqFrMZbIUNwpO2ijhiYpTu4SXOEfNOpsAr/RFBoxRHki68AHDI3Il?=
 =?us-ascii?Q?a/x10gkn9bjVm75RkmJjZYzZE+ropT6SjrtC7wZNp+NjqVp5Pw6iTSGLkPWr?=
 =?us-ascii?Q?XQz3HyhDyCKSgsUCS2+QzfAgMeSiVfa+k7WtLYzgSvb81Inp7MFA3C0gXREb?=
 =?us-ascii?Q?N2RmbTJBMfP1KbjjI0QvY98NKDp8LmI/JuRi7QVLG7oBYgiudhoXymYnSYz5?=
 =?us-ascii?Q?v2J1kl8Duf3LfWG3LKUgDXbnk8auFoSJntOVLzOj9r49y72/dXPK94FYxIOe?=
 =?us-ascii?Q?yUxCrsgaaM6rDX80IdQolEjIm7SHQwYhGo14kAiiBlMkxkjn3OREM1jtYxBd?=
 =?us-ascii?Q?3vq4zSOlU1Ggq/FWxGzOY+x4ShLPEa67h6xafDua2o65ifbYQxoBK4dQ0pEl?=
 =?us-ascii?Q?YjquRgVjcrNlpPS13udocmA7q7X4nMhZkZBdKYqh1/TUKMQxqLqigqLzMlfq?=
 =?us-ascii?Q?YAUBon9tY+WHMqb/0yTKe4Wq+mn5yyEsi1/RaXyUJcoHNl1dDE8jKXodheq7?=
 =?us-ascii?Q?y6et8K/K10YdiYqvBL2XCp5u3YDYbznI41TrykqszLoS+pEsH2jewqpqY7SD?=
 =?us-ascii?Q?c6JocnH3quTd5dFsaaqLPzfdzR2wWGJyMoXpbXFIjutiYPcIa6uBEzcV4unk?=
 =?us-ascii?Q?C4h3j45JfCS6RjakNYvB6cQ2lf/0XxMYWY/ZORCQ00OiOF0cUWqQXBnrwuj0?=
 =?us-ascii?Q?9W9ieBJkYGfKb3+qelcVjaQaYLIIbNtFf4jA3c1J/aBI8XKvthcv0ORrVhHG?=
 =?us-ascii?Q?pUm0ScQmX3bsQiqCcGab6XFePR9LTMyk/0GRscb5ZdJXf4vtwPAUqPN/OWbe?=
 =?us-ascii?Q?ZEMzUj0iNAdPAUfbqyzGQjPw91/TmWXvIslQLQhJFs1S3UYu4q2PFmobJ7uO?=
 =?us-ascii?Q?FClyeKG1D0uZL+CBFmCoTTHGP7Y90Cot3zB88EcJ0w3cRxGk+2KGRVk/palc?=
 =?us-ascii?Q?lkHSxXg4MC/OwsxCibKVXHvXEOOSH3d8hGVmkJs5ArojawK5WuTrz7d6azLf?=
 =?us-ascii?Q?xBC8x8PaG5AR4K0fGn3XGWXXofObO5otishh4XJpni7o7S2p5eDb9QgZaeAT?=
 =?us-ascii?Q?PiYbJ3YY7GbD/CwZhtcQ1xZ5qeYgI6LYK0j7SHqxx15J2IpnL4t6YfvlKWM6?=
 =?us-ascii?Q?2rrSGQDso0TRvDQVCiFmCEcr5TahifSQeKdi2yy9ewicDEGbi4qp0FwmIx8T?=
 =?us-ascii?Q?r4U59atwdTsLW4Af00wAX6y8P+9U/+vIyD442f7cDMSvTZMSgy9xf97fJZ0H?=
 =?us-ascii?Q?jBrBwpN9vg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50867fcc-6b55-462e-eb8c-08de84f514f7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:48:48.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5mosZlpC/MtfxAPi3A9nIJohIRd0GWHuTn4qN5h4Oi812D+Xc9W6oyGnHzZWzWc/Izs5ZfE9c2XXOj3CFURiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_064854_950715_AE83F2F4 
X-CRM114-Status: GOOD (  25.11  )
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

On Tue, Mar 17, 2026 at 05:20:20PM +0000, Josua Mayer wrote:
> Hi Frank,
>
> On 3/17/26 02:36, Frank Li wrote:
> > On Sat, Mar 14, 2026 at 01:05:14PM +0100, Josua Mayer wrote:
> >> LX2160A pinmux is done in groups by various length bitfields within
> >> configuration registers.
> >>
> >> Each group of pins is named in the reference manual after a primary
> >> function using soc-specific naming, e.g. IIC1 (for i2c0).
> >>
> >> Hardware block numbering starts from zero in device-tree but one in the
> >> reference manual.
> >>
> >> Rename the already defined pinmux nodes originally added for changing
> >> i2c pins between i2c and gpio functions reflecting the reference manual
> >> name (IIC) in the node name, and the device-tree name (i2c, gpio) in the
> >> label.
> >>
> >> This makes it more clear to future developers that these nodes do in

Needn't 'this' just

Make it more ...

> >> fact configure a group of pins, and helps with cross-referencing
> >> documentation.
> >>
> >> No functional change intended.
> >>
> >> Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >> ---
> >>   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 64 +++++++++++++-------------
> >>   1 file changed, 32 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> >> index 41c9b4253f4a5..28500e8873909 100644
> >> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> >> @@ -750,8 +750,8 @@ i2c0: i2c@2000000 {
> >>   			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
> >>   					    QORIQ_CLK_PLL_DIV(16)>;
> >>   			pinctrl-names = "default", "gpio";
> >> -			pinctrl-0 = <&i2c0_scl>;
> >> -			pinctrl-1 = <&i2c0_scl_gpio>;
> >> +			pinctrl-0 = <&i2c0_pins>;
> >> +			pinctrl-1 = <&gpio0_3_2_pins>;
> > why need change label name here. It should scl, why need change to pins?
>
> Readability.
>
> It should definitely not be called "scl" precisely because the node
> previously labeled i2c0_scl actually configures both sda and scl together.

This need mention in commit message about why rename.

Frank
>
> And plain "&i2c0" is already taken, so I added _pins.
>
> For the gpios I also changed the label because we are in SoC dtsi,
> and gpios are not specific to sda or scl function.
>
> Further including the gpio numbers in the label helps spotting mistakes.
>
> This patch-set is a story explaining chapter by chapter why initially
> I just reverted the original commit.
>
> sincerely
> Josua Mayer

