Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A351C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 00:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6j1QLbmc9CH1YB8P5tbtnU8R1sQZH0z8XgO5nFnuh4=; b=jUg3qvR63qmUvbEyPsjAQ4zibG
	J00hrdam0OZShbJU+zk7iMV0WKSEDmNLpVlH7IVVbQvyjL8IEkDvsJjTqOGdbCr1Nx4j2vpKuBt8q
	n+yCKdoyoNnpcpY2/uibWNtKBHGW65Tgezh2GLUmEvlVGLXFivWGzahpmW2D/5eU8VDn9IMZuEeSJ
	V6weQHWqbRJpwDyrgHTRUiPMKsqHUr9gbJR2YVU+Snt7OS1OH/MA/aastu7QQc7e/iX9HFhU/5jaT
	1LMrP4qcYnvmGr0iocy/bTsmhLLj5J9kjWH7290jgxrSj6rQ/diTDckN8CN1tJB4e/KXXATK044Yk
	hjquBiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhH1b-00000002ewd-4BGB;
	Thu, 31 Jul 2025 00:20:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGz9-00000002el2-1xns
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 00:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E3D760051;
	Thu, 31 Jul 2025 00:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7440C4CEE3;
	Thu, 31 Jul 2025 00:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753921046;
	bh=SdCrAcgGtnYmocw+W0qZSbGDaU5Sy9OcegMik9AZgfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjEecx/vvmZS4SALcyWAoonJEPrujzYZDKvI++ulsgBGQV60FqSxx4SwUVY8eaLoJ
	 wuwfVG9/33Ft2QfbsfKLmGlittcBJ8krYRye4hNQWGkMKFmuVMKkvEZvdGGvuGsuxx
	 Psy83nLRw0Cm+5U5EEGWCA+R/6pz/BHtgUfQO2VAPMUCaDPMhicsgutD3IDnq+izHG
	 NNO+rcsGcjuXL6DLxOvvYuBzYrIm6c625iYiw3jTaw27A0AjtmQIjef0dnrpj4wVl+
	 Brg60SrZHq1bVKHh6vASLlXEZecRL4BwkO4RRHs5TdHSYzX0nYJAbhNIXe9VMMxsBo
	 T7KxvJEISu9Fw==
Date: Wed, 30 Jul 2025 19:17:25 -0500
From: Rob Herring <robh@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
	Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, thomas.petazzoni@bootlin.com,
	Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl
 property
Message-ID: <20250731001725.GA1938112-robh@kernel.org>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-3-1bdfb3fe7922@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-fix-edge-handling-v1-3-1bdfb3fe7922@bootlin.com>
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

On Wed, Jul 30, 2025 at 07:02:46PM +0200, Louis Chauvet wrote:
> For am62 processors, we need to use the newly created clk-ctrl property to
> properly handle data edge sampling configuration. Add them in the main
> device tree.
> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> 
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 9e0b6eee9ac77d66869915b2d7bec3e2275c03ea..d3131e6da8e70fde035d3c44716f939e8167795a 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -76,6 +76,11 @@ audio_refclk1: clock-controller@82e4 {
>  			assigned-clock-parents = <&k3_clks 157 18>;
>  			#clock-cells = <0>;
>  		};
> +
> +		dss_clk_ctrl: dss_clk_ctrl@8300 {
> +			compatible = "ti,am625-dss-clk-ctrl", "syscon";
> +			reg = <0x8300 0x4>;

H/w blocks are rarely only 4 bytes of registers... Does this belong to 
some larger block. The problem with bindings defining single registers 
like this is they don't get defined until needed and you have a constant 
stream of DT updates.

> +		};
>  	};
>  
>  	dmss: bus@48000000 {
> @@ -787,6 +792,7 @@ dss: dss@30200000 {
>  			 <&k3_clks 186 2>;
>  		clock-names = "fck", "vp1", "vp2";
>  		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +		ti,clk-ctrl = <&dss_clk_ctrl>;
>  		status = "disabled";
>  
>  		dss_ports: ports {
> 
> -- 
> 2.50.1
> 

