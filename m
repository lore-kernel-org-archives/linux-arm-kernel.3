Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E51C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW5kHqGoMgcJPCZRWrn/3XY+/PqK7bC2f+q7PxYZJmI=; b=wSaZAT3VWVp3cQQxrXUIlNNdNn
	/UuYTt3RkR/k3bLeeV+D2eOgQFIbbRgsSXfnAnPx9JxNVprmwj1jzZvi79IZX1KXmLutQ2AeGWhQy
	OJn8s3FK4O4VcEWNjvH+6BnKSLUDc7lpggJdl6mPBtc8WTRO4X5FoyiLy7jacSYND/b8wyo/rAaCw
	UTecymjo8kLBf9iNr7OdPC+EL/yi1cZ+tj7DWLiyqKOWDkuBoyt4N/qAqgfcho5cFJIp0V6LPKBGl
	lM5xuVaV9LWfXTezlEq6TMCS/061Kr0ijfi0wOU+jVTv117bYNWdphWwg5RxMXCRGfbYJRW3he+m7
	+9UsdmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTx6-0000000BTdg-2c20;
	Wed, 11 Jun 2025 22:29:48 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSMr-0000000BCsr-31Wt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:48:18 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D87C211401F7;
	Wed, 11 Jun 2025 16:48:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 11 Jun 2025 16:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749674896; x=1749761296; bh=cW5kHqGoMg
	cJPCZRWrn/3XY+/PqK7bC2f+q7PxYZJmI=; b=lccOqZ4zDxD5QnxYqtuNw7kx61
	UfSXSwslOKC1hlVyRlsCP/+2aU8f/QlFjHGFaXZcrSRXH3OZzJosB+u41yQ341G2
	notTs7uCv74XxLa6yP+H5v0tnlLM0BFmYCekjHpbIFvNL+mSKds67ob40vG7nCwJ
	CJUuqd8ubW8zgIu0sRpI7Qhck4v/+otxVGd99diTuzy/Yn6B/njdP20r8LNd0r4m
	q/2QjCz0qHrKZWQffh9eNsqiDH8ljzro3KzD1hyKa7x03Y+npAJfuYTEa+hzBfj8
	Cy55kfl00+QsYT5HFNIdqKDGo6tgrJ/1ZVX+ol7rwiStMx+SY/hi+VLdAlrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749674896; x=1749761296; bh=cW5kHqGoMgcJPCZRWrn/3XY+/PqK7bC2f+q
	7PxYZJmI=; b=gEiLVlyS0LmftbzpaTBiNHWXFGAXALENeNIFVlxu5BbBJmIBQOy
	6biybY2D/PcrA7qcunHQRIk0Lc7WO6BwVI2Vwr6UX1D2dnaKfebIhWC1Z/qs4auR
	gBJ/xgaLTafA3GIV9vClFbd4vRcHV0dFA7PFAaQwZXGmNWNZ/koWUeSU92lVb3l8
	HjJqTSS00nvAKczI1SQWNGBD7ypQ4C+9T0ueW3gQisPaUKyLeeY6azQbCkZpii8M
	73ldWbhtUwVIVg/3NybE6S+Kx3k/n8bnLsUULHkLyfzlbgLXgIrLY4aXzmZbwVuD
	ch313qsow9TD9gUh4Sq+xfsTLGUcvZ4kTTg==
X-ME-Sender: <xms:kOtJaPGBJ8VxML_IFDAM5ojYhisoWLK_dLE_cSg_W0kFUD6pFPaWYQ>
    <xme:kOtJaMX1soAQHQ6TLFzPL0Tafd6Rou3A4xiDRr39IwAagrc35JAkop911DY103BL-
    8V6uTrUWnk5j7c4h4g>
X-ME-Received: <xmr:kOtJaBL7_fPCWP-umOJvhjENK8D6xi_bjdXa8MMhmRuE3r1hmEp7XeTqRSKvuQ48CG4V61A-hpMRSTmJxk_AgL6giBxGKFoL-pc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:kOtJaNF-MWh_9aGOL3AXtXQwiIMLr0T-Num_Cz6QwEHVnVC4sDNXAQ>
    <xmx:kOtJaFWJ8jcZCzOeD8Me2ZoAJC7GIDSOreY0thhO6Haq5rROJNxNRg>
    <xmx:kOtJaINz6Yq6x3cT23Xr67urYegzm8UXXJ-sVrEV134fn1b4PP2sNw>
    <xmx:kOtJaE1yj2w5sxV8CUxJ9CZqGMiZxobzyHRKXUdVcli9BxE_OMtafg>
    <xmx:kOtJaK4tgj967JTcmaHAgZtX46seZ9XqRRELL3oU5M_5c5dZqVa6ZBHr>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 16:48:16 -0400 (EDT)
Date: Wed, 11 Jun 2025 22:48:14 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Drop {address,size}-cells from SPI NOR
Message-ID: <20250611204814.GC3141695@robin.jannau.net>
References: <20250610-apple-dts-warnings-v1-1-70b53e8108a0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610-apple-dts-warnings-v1-1-70b53e8108a0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_134817_828017_0BFF2AE6 
X-CRM114-Status: GOOD (  13.75  )
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

On Tue, Jun 10, 2025 at 07:19:24PM +0000, Sven Peter wrote:
> Fix the following warning by dropping #{address,size}-cells from the SPI
> NOR node which only has a single child node without reg property:
> 
> spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> Fixes: 3febe9de5ca5 ("arm64: dts: apple: Add SPI NOR nvram partition to all devices")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> index 3df2fd3993b52884d7c00b65099c88d830a7a4c3..9740fbf200f0bcd0e7d1b81885fe9d9ff8f04fdc 100644
> --- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> +++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> @@ -20,8 +20,6 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0x0>;
>  		spi-max-frequency = <25000000>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
>  
>  		partitions {
>  			compatible = "fixed-partitions";
> 

Reviewed-by: Janne Grunau <j@jannau.net>

Janne

