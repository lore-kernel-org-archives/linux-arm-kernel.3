Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A769E6C617
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWVU5IWmattSZ28Z0DFPKDl8mHNr4ydvW+wphgIGkSg=; b=WuNK64RfzVgFsSwlcJhooh/8+Y
	gWcs/HeoEvMs/fkdDKga4My0vnUtpO92+oSIuOQlUC4BQIV0dJICX1RHTeeBUgSdxF13WfAYVrQlL
	jCCXd2tvzpvPyDakKXat8exk0Dk6pYl3IYzo6YBN/PYiRENvyIkhCJVkhvNG3H/lNHCsMkAt+j5Zn
	VKy4IiSqUf6McIsk0iRlvAax9QW3/EVUHKZFrsqNVFFSTdyXGR3O/NCYR8WV82paM9LfWdzrQDTbr
	dx7RM18piOKzMstvFkMVz1oEAWHC+EmjYM5Wcc5KubVkoNON+rjhmBmQMDIZ93+7NWFRr0iwYgBbP
	fmU4UV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIO01-00000008ePD-3rs2;
	Tue, 03 Dec 2024 08:11:13 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINtZ-00000008ctK-2GBM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:04:35 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id D4537114008E;
	Tue,  3 Dec 2024 03:04:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 03 Dec 2024 03:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1733213069; x=1733299469; bh=ZWVU5IWmat
	tSZ28Z0DFPKDl8mHNr4ydvW+wphgIGkSg=; b=fuhSYsQOU0mGUHobNWEfacorSV
	G+ONaLSX9pvznk3aaLBMAOEMGLgEORy1NYCvK9/nCxv7KEKokENGK7BIzaiEbX+/
	KOowx6GpiA1m+RfK6wbmyKo0kvpHgguq2TiQRBAg5CKYSjdAzu6wXf2aQ7+SnssD
	4bYwZFZ80xZzEwEo6JEYsNrnIg7lWZoem+qxdsGv3xVuhkna7IPtlVFlLP5xTYyq
	bJEs0p/2ScFE24mZB1tcXvDof2AM5LniywB41bHMWDPseDNj5s85pSfmJA3qVbIN
	w80m7RUHzCFXrFwg6x2BYeesHWcq7T1vxptgmFNT4Vy6tz0Ve2jPFOdVw5SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733213069; x=1733299469; bh=ZWVU5IWmattSZ28Z0DFPKDl8mHNr4ydvW+w
	phgIGkSg=; b=nTMLuboHE0haQpl0c89usXC90jBGyKAZToeaQY99fJyjKxkNT38
	17YINjtMpCbYcn1WEL6m17Gb3j+A74HsSDh0TeFQOE45Y9OVDSCzQwNHtLh8Es69
	VyAr5Xxe7HO4PH7r/f39VAHkhtxY3LWIKGYe/Fgf1OKbPzMbVyeHnbJ7K0W3vDET
	9Caw17vpD8DSCbmCBfIfWXZ3WFv36+XMsSYz4V5JyZMCZ0Bxawe8xfaNgmSt5zxr
	7E82Gdy3itb6SKzHitpZzvpCwho63lkYZboX1AzR2f8zMHiwU5Ilc1FQepQR7QkB
	ptDscAYIpHeMo97WKQ37SDI0E8sL2ZNLzWA==
X-ME-Sender: <xms:jLtOZxvGiMYUrXGYlEpbo7PVspkZrcE3ZoVjuG6VBfm6J2t1kgtPyA>
    <xme:jLtOZ6e3Er0LA_aaA73eYGDijO_NuzSiaOl9U5jJTax-OtU8bT9Hs8qpgkzETHFQz
    7FZqjMQG3R35z1RnW4>
X-ME-Received: <xmr:jLtOZ0yUTGltTN7L69IgFv_22vS9bMAN4ivKFvSRV-icuDtj1yuhEbSrV56YiiFPneh365ltFBMQCxfzYp9u4XkWUgyRV7DSou4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddriedugdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecu
    hfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecugg
    ftrfgrthhtvghrnhepgfduueffleefkeegueektdehkeejtedtffdtudejhfdvheetgfei
    gfeltdeufeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdp
    nhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfnh
    hklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtrghnsehm
    rghrtggrnhdrshhtpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpd
    hrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohep
    ughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehroh
    gshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehrhigusggvrhhgsegsihhtmhgrthhhrdhorhhg
X-ME-Proxy: <xmx:jLtOZ4PYyoXOF_WHCXiBQY16ljwNzyFGD6Gylb8DVA-7JiG8_LSO4A>
    <xmx:jLtOZx-m66TPqIuiljjMhnYojaLzyukjVGitZ2wbpazkCH8Wi4Lszg>
    <xmx:jLtOZ4UxEHcli7CfPxNpk0Khduvh2ghK8UyZrZCjflZyFpDMkEQQIA>
    <xmx:jLtOZyclnK1uoHFpkR23E_aK23U9sTQd6qbioIpqn_yvqu35loywfg>
    <xmx:jbtOZ1U3FWeeR2Fy_ac13jXc-ROY-APNVl7rAMkBH82sWiTWbhfwc-3K>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Dec 2024 03:04:27 -0500 (EST)
Date: Tue, 3 Dec 2024 09:04:25 +0100
From: Janne Grunau <j@jannau.net>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Message-ID: <20241203080425.GA1282717@robin.jannau.net>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-3-76cc59bbf117@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128-z2-v2-3-76cc59bbf117@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_000434_103285_6A6C37C1 
X-CRM114-Status: GOOD (  20.02  )
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

On Thu, Nov 28, 2024 at 11:29:18PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar digitizer
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++
>  4 files changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 56b0c67bfcda321b60c621de092643017693ff91..c31eb3f6f54268cafc9197a9244a5954fbb42802 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -17,6 +17,14 @@ / {
>  	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
>  	model = "Apple MacBook Pro (13-inch, M1, 2020)";
>  
> +	/*
> +	 * All of those are used by the bootloader to pass calibration
> +	 * blobs and other device-specific properties
> +	 */
> +	aliases {
> +		touchbar0 = &touchbar0;
> +	};
> +
>  	led-controller {
>  		compatible = "pwm-leds";
>  		led-0 {
> @@ -49,3 +57,21 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&spi0 {
> +	status = "okay";
> +
> +	touchbar0: touchbar@0 {
> +		compatible = "apple,j293-touchbar";
> +		reg = <0>;
> +		spi-max-frequency = <11500000>;
> +		spi-cs-setup-delay-ns = <2000>;
> +		spi-cs-hold-delay-ns = <2000>;
> +		reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
> +		interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
> +		firmware-name = "apple/dfrmtfw-j293.bin";
> +		touchscreen-size-x = <23045>;
> +		touchscreen-size-y = <640>;
> +		touchscreen-inverted-y;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b83341a799d9a37578e5461e6b184f81ee7435c 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -326,6 +326,13 @@ clkref: clock-ref {
>  		clock-output-names = "clkref";
>  	};
>  
> +	clk_200m: clock-200m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "clk_200m";
> +	};
> +
>  	/*
>  	 * This is a fabulated representation of the input clock
>  	 * to NCO since we don't know the true clock tree.
> @@ -441,6 +448,19 @@ fpwm1: pwm@235044000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@235100000 {
> +			compatible = "apple,t8103-spi", "apple,spi";
> +			reg = <0x2 0x35100000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
> +			cs-gpios = <&pinctrl_ap 109 GPIO_ACTIVE_LOW>;

Since this appears to be a regular GPIO pin I think it should go into
the spi0 override in t8103-j293.dts. Kind of academic since that's the
only device using spi0. It will however allow to easily rebase this on
top of "Add Apple SPI controller and spi-nor dt nodes:
https://lore.kernel.org/asahi/20241203-asahi-spi-dt-v2-0-cd68bfaf0c84@jannau.net/T/#u

Janne

