Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61F5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1uszv6YuOg7iXkALbp8AWMQ97qKkEmgUUlVgFz7u14=; b=rHOi1JPlYk7bkNDelPgs3pcZuy
	ED6w4s939QrmSOv02UBqtu7ub0bKrpeu/hCuCFlGlHEMTnvOOcC0Suirmw+64yWmi7ybAzQh0s4Js
	p1h6Tlhy3m4HbpuINrLfBzQRKw/bFfavtxGyjrupekjt1F5UiBNGHnA/De0ixQ7wwyLg9pOx08Fsx
	FLcanMsZLCct2bvFiigt6z/+BIzGtvOlJ2AjszJPNrnJ8DnN5vBYlr1e1oTg2+tmBWXaZPlYda5Xr
	jFyG2VvYEZlXWY21afVYGCdhfz9Pe3uGgCSTMYwDLzxSfJHteNiGFzMH7L7CFf1z0D2XUVd1OR6z2
	YsMu+peA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUX5-0000000Bcz3-2KU0;
	Wed, 11 Jun 2025 23:07:00 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTKI-0000000BOeV-2qOb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 21:49:44 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 219C313804DF;
	Wed, 11 Jun 2025 17:49:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 11 Jun 2025 17:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749678581; x=1749764981; bh=y1uszv6YuO
	g7iXkALbp8AWMQ97qKkEmgUUlVgFz7u14=; b=CkNekZTxGSrPDNFW85kwvoRH/0
	SEUP/xNDPmAhXmFMr/Wpin5NGjzqcID9l3RwDKpgUwygn/08nF4CjT//PHs3DK+E
	6peA+qscBI71W830jYYnioR2n4QC+iPKAKJtZB1KlAD0K46xktFsymu2zFofR9CA
	SqrgVY1bVnupP8e/eab5kkY6GRzHzZPrBR7qcjkaQTQ/vD1BTvxIMmeWUC9U0ovl
	v/nfpqm6pfzf31R8I4RokiOOXIF5eFY8G8p1rpiB2EUyp46nPbXPAgRjGup2dAxH
	xpFpl2jcpm0dh9KPTtR1uFEAPQhzX7tHGoktozdwSDCyZFdAgTNhS5tm+hMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749678581; x=1749764981; bh=y1uszv6YuOg7iXkALbp8AWMQ97qKkEmgUUl
	VgFz7u14=; b=Ant+dIKYLfq0AD1oHGVibCDhOFd8mcpdEerSRQbaxBM32DHCefh
	cR7aORIl3W6J8EoSK3OZmWoHksavhPQr9mpEiLoU32afs69OHOJpRA1Azj0snK+u
	MUBOq8HIfkyN02BwxH7Q9KG71WCtG8cG7llc3IFUKEkiaPhfq5u0cgb8rkyatMXw
	Dhy7S5Vb/5hsdNppjrxqzuYmyxjNu24HRKb4oZG9tZ4aoY+ujaDOI72/VU946pQy
	ZMk9ctqTbmuQ1yMUbWthfAgdKxc2vv1pb/fEGPvCmQhMUVzlQ4sgcsbK+ZXxX0JX
	77NFIrT3KpoxeyLHauIGzHuEabpgXowYSIw==
X-ME-Sender: <xms:9PlJaKudVxquCH7_4r3Y1BeoIEJ49suMGftNvKEy8S4yJOcXHSIWvA>
    <xme:9PlJaPffj9qQv1LLLA72rcmy2EHQLAME7CxZ26nWVxSP-xehrhL-OCGjhS5SPQ03v
    ptfrhdfpubnowu8_ZU>
X-ME-Received: <xmr:9PlJaFyejvOjoJxqPka68BOO7cBzp1H4y8dGka4wD_CJ_5OSoEDAO0_nuzhKGj_zVJmbkpAx5qslCTEbWFmJM-bDTyNUkMfROnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufeefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfnhhklhdrkhgvrhhnvg
    hlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhofihinhgthhgvnhhmihesghhmrghi
    lhdrtghomhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:9PlJaFOBs99OoFiBNi-CXRmGeMsqDoGh4kJpz2Bg9bWmXFTZJqRX7A>
    <xmx:9PlJaK9mZvTTmeT2mcoIq7OhhD4wGAiGi_kE30yjBinKj6Nb73T46Q>
    <xmx:9PlJaNWOFfwDpHV85nZVncClUot-bl6mFPS6u-PDJPFc8NcBA0L8eQ>
    <xmx:9PlJaDfAeohEKGZ5QihTgkr0uD4OGdko8_y45z-FRT8Y9evXrMdthA>
    <xmx:9flJaD_0sbA4UmwT--1OstRHr2Mw_fbWWMwiex02gQrwMtPZTpFzEX8t>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 17:49:40 -0400 (EDT)
Date: Wed, 11 Jun 2025 23:49:38 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Move touchbar mipi
 {address,size}-cells from dtsi to dts
Message-ID: <20250611214938.GD3141695@robin.jannau.net>
References: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_144943_230064_EC62D6A0 
X-CRM114-Status: GOOD (  16.45  )
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

On Wed, Jun 11, 2025 at 03:18:53PM +0000, Sven Peter wrote:
> Move the {address,size}-cells property from the (disabled) touchbar screen
> mipi node inside the dtsi file to the model-specific dts file where it's
> enabled to fix the following W=1 warnings:
> 
> t8103.dtsi:404.34-433.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> t8112.dtsi:419.34-448.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> Fixes: 7275e795e520 ("arm64: dts: apple: Add touchbar screen nodes")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 2 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 2 --
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 2 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 2 --
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index e2d9439397f71a93c28b75a7eea589f4bcb3e374..5b3c42e9f0e6776241bf746d3458766e44e3639a 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -100,6 +100,8 @@ dfr_mipi_out_panel: endpoint@0 {
>  
>  &displaydfr_mipi {
>  	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  
>  	dfr_panel: panel@0 {
>  		compatible = "apple,j293-summit", "apple,summit";
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 20faf0c0d80927b2e18dd966a61b5507b322c72f..3a204845b85befb093dd470b4280e778c2894b09 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -405,8 +405,6 @@ displaydfr_mipi: dsi@228600000 {
>  			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
>  			reg = <0x2 0x28600000 0x0 0x100000>;
>  			power-domains = <&ps_mipi_dsi>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index be86d34c6696cb47d31696541266e504cee8ce10..fb8ad7d4c65a8fe7966f5541f24f03a379143cfb 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -63,6 +63,8 @@ dfr_mipi_out_panel: endpoint@0 {
>  
>  &displaydfr_mipi {
>  	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  
>  	dfr_panel: panel@0 {
>  		compatible = "apple,j493-summit", "apple,summit";
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index e95711d8337f6cea898e88a3d564caf2c4f94404..f68354194355807dae9b5922bb8aff74da3c29e6 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -420,8 +420,6 @@ displaydfr_mipi: dsi@228600000 {
>  			compatible = "apple,t8112-display-pipe-mipi", "apple,h7-display-pipe-mipi";
>  			reg = <0x2 0x28600000 0x0 0x100000>;
>  			power-domains = <&ps_mipi_dsi>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			status = "disabled";
>  
>  			ports {
> 

This looks a little odd and the two qcom devicetrees I've looked at have
the same "issue". Fixing warnings is welcome and the resulting dtbs are
unchanged.

Reviewed-by: Janne Grunau <j@jannau.net>

Janne

