Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62772CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/KiIeOfWlwkq2YgY2/wAs61qLE1m4TRL6dAU7ZZx34=; b=Ezn+YhPHG6co414UqBEgnzVHva
	WAsilB4f3SMptw4AdRi2Rd3ylOTLekFmgGYt2VrOegrg6HD52ftkslWPFqwQShNFczoKzGWnL9x2W
	O6ZOViMiGxCNNn6Z35O0FERNsw8lRiDexLukruDgVprEz/xsP5zz5ZVxf0IT26l3I8FwelH5qKJQW
	1dSe80XkWajIls3qH9YUKSE/VwruPUA94afzJTbB6ZoMP086y+95WAeycvbctRQOlk/udVkTZcYgj
	rLfEerdhXFoEu/w1RZ87dgY32FJdbbFwXQlDe0xXf3e/xeyLXIWHHaDBfgmWqShkIAN5IFpxbaSDv
	2uPu8GQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXpB-0000000FttY-1Yrv;
	Mon, 08 Sep 2025 09:06:09 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWuI-0000000FaPJ-36ZA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:07:23 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 381231D000F9;
	Mon,  8 Sep 2025 04:07:21 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-04.internal (MEProxy); Mon, 08 Sep 2025 04:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1757318841; x=1757405241; bh=8/KiIeOfWlwkq2YgY2/wAs61qLE1m4TR
	L6dAU7ZZx34=; b=r8mQNiWbO3w82AkN+xjB7tULa0XYQETxf/Qinw8qpGRTMTSP
	aP/PwDu5aEn13Vm5QJsTZEL2BUZqQs6+2W7u68XmObKMwqHTbrOn2er6nOjQKtKQ
	I5wx4d4SqMnXGBdpYFUPnb8dAzbmgTvQcEbn6/EE/4UfI0bsOj5dtO+U0anZ3lDw
	yToAtj1JoYgShdNKjZ6hNquCNOLRCS55hd/mgJHaP5EWhfT3M6a0K66JACCToQve
	beED4muhk/wxpkXFpVxw7aPjvzeIdWCGvg3gy3Va3s1DhXwIIIV45Cqd4Ex3pHe0
	S8aT/KFgDgUdWiPK6uci9X5q03i1sdT6n4Jlxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757318841; x=
	1757405241; bh=8/KiIeOfWlwkq2YgY2/wAs61qLE1m4TRL6dAU7ZZx34=; b=I
	KVsXk+dt/ufVeuoh0t1y8HfdnPSS7SCpAMWue+EqOFP5LthB28su8PK6JtXNjo1K
	RXhJIkOzvm1rKmuoEqXgISo01meyKdJR9DJ7JVXczu3p+DP5H6o+lxWFul16jlfw
	rh5duRAD9hxqLNxhq9prN1pqNRmid//uyhDKCDrGuzRFJHvQ0Ya8eIK8RY8b2CWK
	u9P+qzJRBxm+my7E/0Sa9XPlfKrZhtWnS46NJksJrmIjEQVldhjNF1Gr/9cQ0R0l
	Qu31SL0+VN3IwjBF1vJjaa0ZcL/eUH6VdCXDTZwdAaW7BUWU51m7KMrF7sVS8IoF
	Cuut32IOpYnSSkwdkz/DQ==
X-ME-Sender: <xms:uI6-aLHqJBZw58D0QFEmOJW3CVCjquRrxkGwwQPlszJcj9m5aKoxMQ>
    <xme:uI6-aIUPtbkEKExUHpUif0NVixo-RZsUKP4X-1t_z-23guuH0MhL28XtSfMqCICqR
    zjN-tyRpBxjtWTqxjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujedttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomheptehlihhsthgr
    ihhruceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtth
    gvrhhnpeehjeffgeellefgfffhteehvedvhfekfeefleeuvdehudeitdduveeggfeigfeg
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlh
    hishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtg
    homhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthht
    oheprghkvghmnhgruggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnih
    gvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:uI6-aKNzRcQv-eRS2ujwJGTvK4Epx8qKA1pRkjuG2DLA9Cl2U6wZfQ>
    <xmx:uI6-aA25ZQZUWLM6IjKKJcXUhPCQtqan1FMiGbDG-C0Lge2XsmhhYQ>
    <xmx:uI6-aArYQK-qESDCDtkLKK2Je3-LMSENVH4iR-v8Cmx4eMyUCXfKww>
    <xmx:uI6-aCeAPsoZ0poy7mH6DhQIBa5oELDWaLCECAQSuQq6S3NLIyWdqg>
    <xmx:uY6-aHfPBcb6BsgOV72jBy8FlBd9xqDRh8CR7txj0P1BdZJvH5r8VS8d>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A449B2400098; Mon,  8 Sep 2025 04:07:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aus85q1JlVYk
Date: Mon, 08 Sep 2025 18:07:20 +1000
From: Alistair <alistair@alistair23.me>
To: "Andreas Kemnade" <akemnade@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-Id: <d4589e3c-ebda-471d-8ddd-6c5dd45b918e@app.fastmail.com>
In-Reply-To: <20250906-sy7636-rsrc-v1-4-e2886a9763a7@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
 <20250906-sy7636-rsrc-v1-4-e2886a9763a7@kernel.org>
Subject: Re: [PATCH 4/4] ARM: dts: imx: e70k02: add sy7636
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010722_841303_B20B140F 
X-CRM114-Status: GOOD (  14.66  )
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

On Sat, 6 Sep 2025, at 7:09 PM, Andreas Kemnade wrote:
> Add the EPD PMIC for the e70k02 based devices as a step towards full EPD
> support.
> 
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>

Acked-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
> arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 +++++++++++++++++++++-
> .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 +++++++++++++++++++++
> .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 +++++++++++++++++++++
> 3 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> index dcc3c9d488a88..5f6b7545a0c0c 100644
> --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> @@ -69,6 +69,14 @@ memory@80000000 {
> reg = <0x80000000 0x20000000>;
> };
>  
> + epd_pmic_supply: regulator-epd-pmic-in {
> + compatible = "regulator-fixed";
> + regulator-name = "epd_pmic_supply";
> + gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
> + startup-delay-us = <20000>;
> + enable-active-high;
> + };
> +
> reg_wifi: regulator-wifi {
> compatible = "regulator-fixed";
> regulator-name = "SD3_SPWR";
> @@ -133,7 +141,22 @@ touchscreen@24 {
> vdd-supply = <&ldo5_reg>;
> };
>  
> - /* TODO: SY7636 PMIC for E Ink at 0x62 */
> + sy7636: pmic@62 {
> + compatible = "silergy,sy7636a";
> + reg = <0x62>;
> + en-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
> + vcom-en-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
> + epd-pwr-good-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
> + vin-supply = <&epd_pmic_supply>;
> +
> + #thermal-sensor-cells = <0>;
> +
> + regulators {
> + reg_epdpmic: vcom {
> + regulator-name = "vcom";
> + };
> + };
> + };
>  
> };
>  
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
> index a2534c422a522..f8709a9524093 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
> @@ -26,6 +26,11 @@ / {
> compatible = "kobo,tolino-vision5", "fsl,imx6sl";
> };
>  
> +&epd_pmic_supply {
> + pinctrl-names = "default";
> + pinctrl-0 = <&pinctrl_epd_pmic_supply>;
> +};
> +
> &gpio_keys {
> pinctrl-names = "default";
> pinctrl-0 = <&pinctrl_gpio_keys>;
> @@ -59,6 +64,12 @@ MX6SL_PAD_FEC_RXD1__GPIO4_IO18          0x10059 /* TP_RST */
> >;
> };
>  
> + pinctrl_epd_pmic_supply: epd-pmic-supplygrp {
> + fsl,pins = <
> + MX6SL_PAD_EPDC_PWRWAKEUP__GPIO2_IO14    0x40010059
> + >;
> + };
> +
> pinctrl_gpio_keys: gpio-keysgrp {
> fsl,pins = <
> MX6SL_PAD_FEC_CRS_DV__GPIO4_IO25 0x17059 /* PWR_SW */
> @@ -159,6 +170,14 @@ MX6SL_PAD_KEY_COL2__GPIO3_IO28 0x1b8b1 /* ricoh619 bat_low_int */
> >;
> };
>  
> + pinctrl_sy7636_gpio: sy7636-gpiogrp {
> + fsl,pins = <
> + MX6SL_PAD_EPDC_VCOM0__GPIO2_IO03        0x40010059 /* VCOM_CTRL */
> + MX6SL_PAD_EPDC_PWRCTRL1__GPIO2_IO08     0x40010059 /* EN */
> + MX6SL_PAD_EPDC_PWRSTAT__GPIO2_IO13      0x17059 /* PWR_GOOD */
> + >;
> + };
> +
> pinctrl_uart1: uart1grp {
> fsl,pins = <
> MX6SL_PAD_UART1_TXD__UART1_TX_DATA 0x1b0b1
> @@ -329,6 +348,11 @@ &ricoh619 {
> pinctrl-0 = <&pinctrl_ricoh_gpio>;
> };
>  
> +&sy7636 {
> + pinctrl-names = "default";
> + pinctrl-0 = <&pinctrl_sy7636_gpio>;
> +};
> +
> &uart1 {
> pinctrl-names = "default";
> pinctrl-0 = <&pinctrl_uart1>;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
> index 660620d226f71..19bbe60331b36 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
> @@ -36,6 +36,11 @@ &cpu0 {
> soc-supply = <&dcdc1_reg>;
> };
>  
> +&epd_pmic_supply {
> + pinctrl-names = "default";
> + pinctrl-0 = <&pinctrl_epd_pmic_supply>;
> +};
> +
> &gpio_keys {
> pinctrl-names = "default";
> pinctrl-0 = <&pinctrl_gpio_keys>;
> @@ -69,6 +74,12 @@ MX6SLL_PAD_GPIO4_IO18__GPIO4_IO18 0x10059 /* TP_RST */
> >;
> };
>  
> + pinctrl_epd_pmic_supply: epd-pmic-supplygrp {
> + fsl,pins = <
> + MX6SLL_PAD_EPDC_PWR_WAKE__GPIO2_IO14    0x40010059
> + >;
> + };
> +
> pinctrl_gpio_keys: gpio-keysgrp {
> fsl,pins = <
> MX6SLL_PAD_GPIO4_IO25__GPIO4_IO25 0x17059 /* PWR_SW */
> @@ -169,6 +180,14 @@ MX6SLL_PAD_KEY_COL2__GPIO3_IO28 0x1b8b1 /* ricoh619 bat_low_int */
> >;
> };
>  
> + pinctrl_sy7636_gpio: sy7636-gpiogrp {
> + fsl,pins = <
> + MX6SLL_PAD_EPDC_VCOM0__GPIO2_IO03       0x40010059 /* VCOM_CTRL */
> + MX6SLL_PAD_EPDC_PWR_CTRL1__GPIO2_IO08   0x40010059 /* EN */
> + MX6SLL_PAD_EPDC_PWR_STAT__GPIO2_IO13    0x17059 /* PWR_GOOD */
> + >;
> + };
> +
> pinctrl_uart1: uart1grp {
> fsl,pins = <
> MX6SLL_PAD_UART1_TXD__UART1_DCE_TX 0x1b0b1
> @@ -319,6 +338,11 @@ &ricoh619 {
> pinctrl-0 = <&pinctrl_ricoh_gpio>;
> };
>  
> +&sy7636 {
> + pinctrl-names = "default";
> + pinctrl-0 = <&pinctrl_sy7636_gpio>;
> +};
> +
> &uart1 {
> pinctrl-names = "default";
> pinctrl-0 = <&pinctrl_uart1>;
> 
> -- 
> 2.39.5
> 
> 

