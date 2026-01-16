Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7415FD4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjTC6oEgSq/Ty0kZ9stNjLj4oN8tdQz/SascLoj0UMo=; b=C+hw7FZpHog8gGfibZMuhGUeKn
	4xlvv0VzwoPFWDhof9ibXGHLMmv82jDIagNkWTtD8F8V4z6Xtk7KZ+630SDnrF9yus+LcuA/84Vrn
	XpPGG/OuRJ2HNPdrzilArfb5+RQERe6IwazO3iXCgPYxdtFF9vQ+L/yn6Ero0mS0Fd3Hld31cux9S
	AsPAsBlp3/lLSeQL52uicg4wrIygTN4i9QBQI6qwuybTzGOE/+HSS0ZcrdjYbJUX9DTFym+VG4DkF
	zfimq3Cfh2ndP3W+nHaTf2GYi6Qql/qRUMAta1kENwyWT9dz2K1EE8MqomAdU0rXNT3+WGZb3e3eQ
	YdiBpkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjV4-0000000E8US-3sIA;
	Fri, 16 Jan 2026 13:04:26 +0000
Received: from mail-westus3azon11010014.outbound.protection.outlook.com ([52.101.201.14] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjV1-0000000E8U3-3bCB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:04:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK4J5ZcE9ms12e15+oWnbmySU0hBcFPOEac642RjaqX1pSXKME8+FxDcR2fd1lnhkGK2Sanlf1qR9FyweNygT3qLdu7jDlvhJOq12uo/bzBaGsU00OuHlC5TXAH4hPon02lzEJxHP99DhhU26GNc+/qZ7WX1VbDakvgk7wB/uzxWTZK2SaHA6GKkyOSxNE26aSr9MwBhjk/wcLvyR+i+hKe3SFl+v8zY79Vyjv/E8QPjOnX2WZqC9h+nRsXCqX0BhqbzIhJPnt4tm6UGNCFdNB7XoitPrmkWCvD5SMbyW+D4EpsW9G8uvccdcor/YhtHRmumB1kuK4AI8Mu2k0TIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjTC6oEgSq/Ty0kZ9stNjLj4oN8tdQz/SascLoj0UMo=;
 b=vpfOHTSCM5A6bHUdjNB0dX4babNTmZt7bqP1NxW53q9CEK+rIQjVXfiaven3iCx6ZLHnQp2WTsuLd5C/2bveJBnbWEwqIWuPOermUaLdJO2u2UwCe+gX3f5gCkAj7EED+5Ay/XO72ERx9zDfP+jhvk+tAtM9525deHOzFS3mGmOeLekPmfx98jyyLLC0qTfPLY9GR4uEZAh1pS7bjtnOhJYpDvN2JyEQR5Y5miPqCtiCuvYxRiuQkuPoWY/GMVw+SVOnvHbsQ9JRzwL1fQDzMcvlngvFt8UkpkIKICSikjN5MAqU/0WFlap27kIF/Vzr1tIuwoOzEbYRzlUkUYLgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjTC6oEgSq/Ty0kZ9stNjLj4oN8tdQz/SascLoj0UMo=;
 b=Tz22oJDjgKzqeUS+bAm4PdV/+m2+jiXTc5pZciPzLwlRpRgl9TRfEvqH7Kb6vWZnxUVrb83C7qvJPil5CiEs6CW2v478Px/7tVbLU9ZXoAGwX7D2l9Qn/F+CREDiP+GPoWQkD3zUohA/67/zQGTS4nZUeoj9T94wL88gXgMaFB4=
Received: from BY5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:1e0::20)
 by CO1PR10MB4499.namprd10.prod.outlook.com (2603:10b6:303:6d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 13:04:19 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::4) by BY5PR03CA0010.outlook.office365.com
 (2603:10b6:a03:1e0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Fri,
 16 Jan 2026 13:04:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 13:04:18 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 07:04:17 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 07:04:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 07:04:17 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GD4HSA3174462;
	Fri, 16 Jan 2026 07:04:17 -0600
Date: Fri, 16 Jan 2026 07:04:17 -0600
From: Nishanth Menon <nm@ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<vigneshr@ti.com>, <kristo@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<u-kumar1@ti.com>, <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j721s2-common-proc-board: Enable
 analog audio support
Message-ID: <20260116130417.kir4agaxqukaxr57@series>
References: <20260112104536.83309-1-m-shah@ti.com>
 <20260112104536.83309-4-m-shah@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260112104536.83309-4-m-shah@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|CO1PR10MB4499:EE_
X-MS-Office365-Filtering-Correlation-Id: 4242f778-9411-42a7-6bc7-08de54ffc23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OxPhHlOOKaHJqXdsqm23a2zfu8erlhdm9o/mqDVrYFefuD3+ryWQlngTqKdO?=
 =?us-ascii?Q?APOu5VPOhPysWMGLczWNyxc/PWMjn6o0AidWKZ4EN8EVGVc0hi5izU8h5b4K?=
 =?us-ascii?Q?lj5hY/0PW85gaqcTd359cKBbAl3EMuMZOqUmu+1Du8PPv/4ekDceZPw8BypY?=
 =?us-ascii?Q?tbTjKGaAqGoX/UzEt5djBDYk4yeNKCm49/EznKXWLtw3N1zPU/RhjwN8IroA?=
 =?us-ascii?Q?cjw75td6L6dCZmSvMXtNqTrisvOnOMyCf24tkRdEemRSEHb1vwa6FydmfQHt?=
 =?us-ascii?Q?YbOPRp02omUhxH8NqnxSWtzC38//VZIoHKIkz/39E6yb+TZQ3XSLQJbvoN5w?=
 =?us-ascii?Q?D8sXs2OS4ALMn4uEmyZGLYk5XshWe5ZSmqymfqcdBQx9jcsGeI3x8nPvF/NH?=
 =?us-ascii?Q?2kdxdIHO28swPFLcF/UN+4xyo6KGhh7KM/vp5GlWDoc8VObI7W6ATaQ4dC5Z?=
 =?us-ascii?Q?kujQsM59jVky8pbRR51DBZnhYR7eRY2l4LnPQsgnatlsjOi1Jm7HklgKC+IV?=
 =?us-ascii?Q?df6/SUTR9VkI/Hj49Ekm4wfkZbJHQ6S/JhkeREMp7wj6H589cs8EiD656iCM?=
 =?us-ascii?Q?W1g1ZM5uqo60y6cRUTACnWEsBmNkwE5ygRbnDgF4cSY1Uyr6wMyBM79gnTvA?=
 =?us-ascii?Q?kU+BLMzW9xKOXmzm8EoZjOd+aFE0PHDSxzrPXT8s09vsgMvFQCx36il124XD?=
 =?us-ascii?Q?9JAhm7x1WArDIneMHOzXUXT7DgMqpYRuMvvRPHlDHi6snHRMAI9JOB4Ym8qJ?=
 =?us-ascii?Q?7BMEiFoiXvUL19xJQtD5q9gHVPTxFqaxMZkwP9Y0Mz149utipFkGx/HCmZ2w?=
 =?us-ascii?Q?kMeBLs+xX9eyTbT5PuRlyFTXLS191ZmIukyFuo0PcxB9plfU7T4idUI003IG?=
 =?us-ascii?Q?xvPtt7Yexwvt39c460zXsNWWm6SSIPC1fMvLZeEGp20djccsEh/x/4ISj3+A?=
 =?us-ascii?Q?khFRKP0wc3hLklBM7TfuOo6eQ9zz93pqVCueFyFLz+a1XXrlK/3/rVpvuLs2?=
 =?us-ascii?Q?+4UmndQMZJlwZ2H3pV4Bqwtk7zbkaSytLeSCTUcg1FXUfI773WDM+jKFATWy?=
 =?us-ascii?Q?DSpyUxHMfzDAJi6kmNsSnKEaMZhGXy8T7V4Vg6/q23s4iNUnqpMTjY96O843?=
 =?us-ascii?Q?hIhRpU/bZqj2iFAOMSNCBhFb6LMAmsAu36rU/nyE/GGe54tbJ9Yy80wJKk+W?=
 =?us-ascii?Q?3eUscIan55p/z6xE18aStOiXozwij2qKpelUVUYEtd44Gk5CEmSLhZ/HezzJ?=
 =?us-ascii?Q?A0VnvKERj+7IK2nguJB4UoLev/VOLNO2EjxM9Hegok9y/Qw3tcApAwn57N8h?=
 =?us-ascii?Q?Ctx+LPA4l9m9pPGeVw+JcuYqxYYZAcnTrJawZTdQhuiblugFodA5qT/zSvWo?=
 =?us-ascii?Q?fwokLVfsS0WucWzpHrNMD/X2ypygs4aa1ffyu6LI7cdGsIbExD5wkLQvcf6+?=
 =?us-ascii?Q?sfXfd2LAvuD8gISnrsRpuZJGLYxMkB0bOS9e2s0A7SXED46oXqPv/R7FvoUa?=
 =?us-ascii?Q?4iStGrpJHFQuixGdQBQY8dZwj2Wjb8pe34zSOwnq05Mkbxx+9nvlGv7AJswq?=
 =?us-ascii?Q?0WfOujllpL3zPVleDGTccPFALxeYHAX44XvK6FxIf3uVq30+FfmmprxwDXHD?=
 =?us-ascii?Q?x7co1rTAfYA0IHPHrqZwBWzmuHsjXP5ZdwDSfOZ2p8UHPegSXF0DSmmbLl2q?=
 =?us-ascii?Q?t35ibA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 13:04:18.4018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4242f778-9411-42a7-6bc7-08de54ffc23e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_050424_013745_8BA3F462 
X-CRM114-Status: GOOD (  22.83  )
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

On 16:15-20260112, Moteen Shah wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> The audio support on J721S2-EVM is using PCM3168A codec
> connected to McASP4 serializers.
> 
> - Add the nodes for sound-card, audio codec, MAIN_I2C3 and
>   McASP4.
> - Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and
>   WKUP_GPIO_0.
> - Add necessary GPIO hogs to route the MAIN_I2C3 lines and
>   McASP serializer.
> - Add idle-state as 1 in mux0 and mux1 to route McASP signals
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../dts/ti/k3-j721s2-common-proc-board.dts    | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index 4fea99519113..d9269a16956c 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -150,6 +150,28 @@ transceiver4: can-phy4 {
>  		standby-gpios = <&exp_som 7 GPIO_ACTIVE_HIGH>;
>  		mux-states = <&mux1 1>;
>  	};
> +
> +	codec_audio: sound {
> +		compatible = "ti,j7200-cpb-audio";
> +		model = "j721e-cpb";
> +
> +		ti,cpb-mcasp = <&mcasp4>;
> +		ti,cpb-codec = <&pcm3168a_1>;
> +
> +		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
> +			 <&k3_clks 157 299>, <&k3_clks 157 328>;
> +		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
> +			      "cpb-codec-scki", "cpb-codec-scki-48000";
> +	};
> +
> +	i2c_mux: mux-controller-2 {

There is just a single i2c_mux on processor board/evm? if not, might
be good to set this as i2c_mux0 or appropriate naming?

> +		compatible = "gpio-mux";
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
> +		idle-state = <1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&main_i2c3_mux_pins_default>;
> +	};
>  };
>  
>  &main_pmx0 {
> @@ -224,6 +246,22 @@ J721S2_IOPAD(0x03c, PIN_INPUT, 0) /* (U27) MCASP0_AFSX.MCAN5_RX */
>  			J721S2_IOPAD(0x038, PIN_OUTPUT, 0) /* (AB28) MCASP0_ACLKX.MCAN5_TX */
>  		>;
>  	};
> +
> +	mcasp4_pins_default: mcasp4-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
> +			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
> +			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
> +			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
> +			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
> +		>;
> +	};
> +
> +	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
> +		>;
> +	};
>  };
>  
>  &wkup_pmx2 {
> @@ -321,6 +359,12 @@ J721S2_WKUP_IOPAD(0x104, PIN_INPUT, 0) /* (N26) MCU_ADC1_AIN6 */
>  			J721S2_WKUP_IOPAD(0x108, PIN_INPUT, 0) /* (N27) MCU_ADC1_AIN7 */
>  		>;
>  	};
> +
> +	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
> +		>;
> +	};
>  };
>  
>  &wkup_pmx1 {
> @@ -396,6 +440,22 @@ exp2: gpio@22 {
>  				  "MLB_MUX_SEL", "MCAN_MUX_SEL", "MCASP2/SPI3_MUX_SEL", "PCIe_CLKREQn_MUX_SEL",
>  				  "CDCI2_RSTZ", "ENET_EXP_PWRDN", "ENET_EXP_RESETZ", "ENET_I2CMUX_SEL",
>  				  "ENET_EXP_SPARE2", "M2PCIE_RTSZ", "USER_INPUT1", "USER_LED1", "USER_LED2";
> +
> +		p09-hog {
> +			/* P09 - MCASP/TRACE_MUX_S0 */
> +			gpio-hog;
> +			gpios = <9 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name = "MCASP/TRACE_MUX_S0";
> +		};
> +
> +		p10-hog {
> +			/* P10 - MCASP/TRACE_MUX_S1 */
> +			gpio-hog;
> +			gpios = <10 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MCASP/TRACE_MUX_S1";
> +		};

We loose JTAG Trace?

>  	};
>  };
>  
> @@ -657,3 +717,74 @@ &dphy_tx0 {
>  &dsi0 {
>  	status = "okay";
>  };
> +
> +&mux0 {
> +	idle-state = <0>;
> +};
> +
> +&mux1 {
> +	idle-state = <0>;

Commit says:
- Add idle-state as 1 in mux0 and mux1 to route McASP signals

you are adding idle-state = <0> here - which is correct? why?

> +};
> +
> +&exp_som {
> +	p03-hog {
> +		/* P03 - CANUART_MUX_SEL1 */

and we loose CAN? or UART -> not sure I understand this change and why
is it related to audio?

> +		gpio-hog;
> +		gpios = <3 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CANUART_MUX_SEL1";
> +	};
> +};
> +
> +&k3_clks {
> +	/* Confiure AUDIO_EXT_REFCLK1 pin as output */

I bet you did'nt run checkpatch --strict --codespell.. :)
s/Confiure/Configure

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
> +};
> +
> +&main_i2c3 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c3_pins_default>;
> +	clock-frequency = <400000>;
> +	mux-states = <&i2c_mux 1>;
> +
> +	exp3: gpio@20 {
> +		compatible = "ti,tca6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;

gpio-line-names please

> +	};
> +
> +	pcm3168a_1: audio-codec@44 {
> +		compatible = "ti,pcm3168a";
> +		reg = <0x44>;
> +		#sound-dai-cells = <1>;
> +		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
> +		/* C_AUDIO_REFCLK1 -> MCAN2_RX (Y25) */

What is this comment pertinent to?

> +		clocks = <&audio_refclk1>;
> +		clock-names = "scki";
> +		VDD1-supply = <&vsys_3v3>;
> +		VDD2-supply = <&vsys_3v3>;
> +		VCCAD1-supply = <&vsys_5v0>;
> +		VCCAD2-supply = <&vsys_5v0>;
> +		VCCDA1-supply = <&vsys_5v0>;
> +		VCCDA2-supply = <&vsys_5v0>;
> +	};
> +};
> +
> +&mcasp4 {
> +	status = "okay";
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mcasp4_pins_default>;
> +	op-mode = <0>;          /* MCASP_IIS_MODE */
> +	tdm-slots = <2>;
> +	auxclk-fs-ratio = <256>;
> +	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
> +		0 2 1 1
> +		0 0 0 0
> +		0 0 0 0
> +		0 0 0 0
> +	>;
> +};
> -- 
> 2.34.1
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

