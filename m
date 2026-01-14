Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB12D39003
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeYcgQYeu8I7ysABYtWCJh1Wk1DZPlWME5u9+VeXyUM=; b=ddgcgF3uXyw6yAYjH5lEP/7mYi
	dHvHaKVfkNe3MA2ZmLw60kt2YVW/7lpvp32BooAcwqKCjJ2k99596D/h7N3/FX35n/39tF+aK73cP
	jq5BdpfA9K1XVLDbyM1HERDrwLxrrkOdyHWSavn/bCOLCI5GPAIbATW95JBJR6YQZ1msFWjFicjyl
	WH9ZRF0Nbd8m20pLE7usY0uS5fNMbpTbkxCq3QLuNmdhnQmG2e5gHHb5Cah3R9Lr8IeF19MVFCgbh
	mgd/kw9F5ZlmK7z7YcYe+j57BSrPB7cgQ/qc/Pcf4yymLHf5wIAJfvHctwIVB2vkkpA8yEpCWg2e3
	F5eULjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5Lj-0000000AHIq-0shS;
	Wed, 14 Jan 2026 18:12:07 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5Lg-0000000AHGW-17SJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 18:12:06 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-f9vp.prod.antispam.mailspamprotection.com; s=arckey; t=1768414324;
	 b=SjcoiT1+11P1gVF3zZd3KU0BRVZHDN6OG3SJbSLVcl8Tlrx2O9j1I8U/Xh1Rj/VVPOFseNyLNd
	  SP+6OamC0Y0nulcSxxobybQ5KzmGHVeCBjaxkIIUcAFnCbRySf8L2l8w66H+ngdgZRQy++aSC5
	  JaY/TKCjfawlD+J+R9evEKIS8j1Vh0kleOJart08ZqsNqQHTiQdoEvD3dLbpBtCjA/PSyPC6+o
	  6IC+AqstNnoPfID6QFAe0oZOZb6d1amUTK9IjFOaq0Grtj5MuPQKvf857GD8jzuxIzZ1Dx5Q6J
	  adXwlExuGja+v//u1qiy84xpHlaBRNx522yFGWW7teHpsw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-f9vp.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-f9vp.prod.antispam.mailspamprotection.com; s=arckey; t=1768414324;
	bh=ItaR7NR4AgDe3rSPiWtFPKFq1neRYIZXFOOcVjXrw/I=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=IKjjX8A8OWG/XszhklcP6++IsjFbzMNCzxkUxJfaUyzfbuCMy5RZ0iyswzA1O1gVo+Y/ebqjb0
	  estiVnB2PtczRvXjoZ7UkiUyJ94FHIuDi55K4wzn4AE2P+Znb5E/LiMUDs7Rdfo80iPehu5kx6
	  DnGQUqHl98KWNuc0803mGD2dh/WsmY1b/U/Trz9nu/OoVKJfdPhdVfFtU4IRlXs1Yjj7NOGEZZ
	  Roy0O6+ygGrbVczW0ifgL9MRx/Qc1q3awllWMtnBHORHJhdFJVOsHGGjC7gkRtqoUqrR5e3CT6
	  ApSBEh8OOc+5B7VyvwQirWp+t3F2a5FVrtoOuq5icx2vrA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=KeYcgQYeu8I7ysABYtWCJh1Wk1DZPlWME5u9+VeXyUM=; b=Znu1wQKsw+fcxOsxLcZXmR0qin
	oh0tIR4hD9qGPVGtx+eM1OFkpKWOjHzQghqa8Try015VeeU6nUrNVihqUa2vNDdb5r7rQtTYY+3um
	Vcs7JDfClenJ6VbKRQ3VNO4XZUwtO4d4Vgucr5b9Jj8wn2NSQiCghAdguORgxmtEZEQY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-f9vp.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vg5LW-00000006UeO-01wR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 18:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=KeYcgQYeu8I7ysABYtWCJh1Wk1DZPlWME5u9+VeXyUM=; b=UgMg9dg9phAh2zXYHLfgObTenB
	9K3Od55ULWamIYLZvLG/GlMOvjfW7tPVBLE+oDOKPwWq0bdJsE9Tk6j/HmDPCFa4R8ZeFX6rVze8J
	wJJx/nHWqLg3Wwg+QxXVuoZkyvIgorowCRfQCu52BD8vKm7dO5GRJSZnEKngEDvP6zUg=;
Received: from [95.248.141.113] (port=62575 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vg5Kz-00000000GgK-1k1W;
	Wed, 14 Jan 2026 18:11:21 +0000
Date: Wed, 14 Jan 2026 19:11:19 +0100
From: Francesco Valla <francesco@valla.it>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tom Zheng <haidong.zheng@nxp.com>
Subject: Re: [PATCH v3] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Message-ID: <aWfcRxYBME4H0BQH@bywater>
References: <20260113075002.561453-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113075002.561453-1-daniel.baluta@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: e662a2df6df83e594ac4520a435e4b4f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vg5LW-00000006UeO-01wR-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-f9vp.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_101204_774592_38EBD3A6 
X-CRM114-Status: GOOD (  14.54  )
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

On Tue, Jan 13, 2026 at 09:50:02AM +0200, Daniel Baluta wrote:
> Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
> by adding sound card description and enabling sai1 and mqs1 dts nodes,
> together with necessary clocks and pinmux.
> 
> This supports audio playback via SAI1 DAI which is connected to the MQS1
> block.
> 
> Co-developed-by: Tom Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Tom Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v2:
> * Remove  "fsl,imx6sx-sdb-mqs" compatible from sound-mqs as it doesn't
>   make much sense to use it as per Fabio suggestion
> * Link to v2: https://lore.kernel.org/imx/20260112135612.465325-1-daniel.baluta@nxp.com/
> 
>  .../boot/dts/freescale/imx93-11x11-frdm.dts   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> index 066c5139842b..5bb6ae0d154a 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -81,6 +81,13 @@ vdevbuffer: vdevbuffer@a4020000 {
>  			no-map;
>  		};
>  	};
> +
> +	sound-mqs {
> +		compatible = "fsl,imx-audio-mqs";
> +		model = "mqs-audio";
> +		audio-cpu = <&sai1>;
> +		audio-codec = <&mqs1>;
> +	};
>  };
>  
>  &adc1 {
> @@ -315,6 +322,27 @@ &lpuart1 { /* console */
>  	status = "okay";
>  };
>  
> +&mqs1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_mqs1>;
> +	clocks = <&clk IMX93_CLK_MQS1_GATE>;
> +	clock-names = "mclk";
> +	status = "okay";
> +};
> +
> +&sai1 {
> +	#sound-dai-cells = <0>;
> +	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  &usbotg1 {
>  	adp-disable;
>  	disable-over-current;
> @@ -479,6 +507,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
>  		>;
>  	};
>  
> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_CLK__MQS1_LEFT		0x31e
> +			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT	0x31e
> +		>;
> +	};
> +
>  	pinctrl_pcal6524: pcal6524grp {
>  		fsl,pins = <
>  			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> -- 
> 2.45.2
> 
>

Tested-by: Francesco Valla <francesco@valla.it>


Regards,
Francesco


