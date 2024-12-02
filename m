Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C542ED49795
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=964CsZFa0DtdYQz702jag30/6F8XCIRo36K7Z0RRRTU=; b=ODDqbI460Jl90+n3zPm1Pny/wj
	KNNwjG5G6Qeg3ONnbRLbRbdkQbmUaI55ROfMmi9/i/sLdca9Gs9QV2MTeD8XQr4y8zCCsy/ClCTye
	YngkbboRvhTJDIlckU43/KMdlvgk9JVXZmJNPFQgh2y0++MYAZRzt+0Rwaqc1yTtpc9c4RsRcgnke
	lTVh0ze3mkOW+ZFMiQNzdv0X/ac99tqGr5BdfbA3F2D+GkEEKvYeIDaugbZ91YzJN/Vs9jS7tnVHC
	+Aq/VRlB1LvP6OrIJMdFWmbu9nb1MKbkbXC9jLcTpHVhovULauvBciaRVp/W3WN79zRHMlio+EMzH
	V00HD9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxXm-00000004ziY-3c9H;
	Mon, 02 Dec 2024 03:56:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxWn-00000004zfU-2vPi;
	Mon, 02 Dec 2024 03:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=964CsZFa0DtdYQz702jag30/6F8XCIRo36K7Z0RRRTU=; b=QHrAtDTTNDPNAyHkV5OgNkiHWH
	fhvlWWO13oXOCz2InL12TuimojrLct1wMQeE4p+IbMvq32YCmoNaA9nj04wUX5Lh2RKLosHtR4uOr
	D3ICnJJfzxn1M4pwiU8MBNkjtBMC9PxVh6oOoNb1zFkKetlunBx+hm51vvGNq/hGMID/8UJfWwLvC
	sI1avPeGic9hpBBE3E5/ei2M1zzA4Qeuot6AYnOjJJE+XlBhcvHPpEl78kJ2zFwJzjWOoSVwV6s7S
	YUqEeRDLtYZQleZEV+LND4E3Afbo6O+dFWbtxARa2h/RWErJ27aY4taqFS29yz3ncilqvlYb2ENE/
	pMLT/pLg==;
Received: from mail.manjaro.org ([116.203.91.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxWk-000000027Cz-1CTh;
	Mon, 02 Dec 2024 03:55:16 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733111704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=964CsZFa0DtdYQz702jag30/6F8XCIRo36K7Z0RRRTU=;
	b=bP8Ukc/lpLFkUHoG6g6sdznQyR5ivg8vmC7QZjMRvwKpheOA2Gi+CcB1aS7jf764fqwKK1
	4STa9w5npVT6Xoc2tuVzvQcFc9tN+9VK95y2G+uldqyX6qK22uAGyEAjNAfrHddqseSRCv
	L+eLVDF1i6C6WeVEmV6BX381R4SfZgvX3556DPPoZYiYeksgu4tUxTJ6oGBJpLKD5PWgjC
	VDwQSIQLE1HgkvHSjqZb2lPPbZTCPcvigWoKfyQRxuD3a+MxPT40TdZMIOS2FxRfRDWZ9A
	XJGpg9ZVTx8p78uB712B9CWUgFCv+CLoY1Leo5AV77vyf1b0mw8eXulObf33zQ==
Date: Mon, 02 Dec 2024 04:55:03 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable rng on all rk356x
In-Reply-To: <20241201234613.52322-1-pbrobinson@gmail.com>
References: <a> <20241201234613.52322-1-pbrobinson@gmail.com>
Message-ID: <302bdae2f4defeefe88ea4018a0be11f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_035514_636637_6CF9560F 
X-CRM114-Status: GOOD (  15.20  )
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

Hello Peter,

On 2024-12-02 00:46, Peter Robinson wrote:
> The rk356x rng is available on both the rk3566 and rk3568
> parts, the IP is all self contained within the SoCs so
> it's enabled already by default on rk3568 so let's enable
> it in the base rk356x.dtsi so it's enabled consistently
> everywhere.

Please, go through the mailing list threads [1][2] that have led us
to the current state.  To sum it up, it isn't about what's supported
in the two RK356x SoC variants, but about the RK3566's HWRNG being
disabled because the testing showed that it produces unacceptably
low quality of random data, for some yet unknown reason.

[1] 
https://lore.kernel.org/linux-rockchip/cover.1720969799.git.daniel@makrotopia.org/T/#u
[2] 
https://lore.kernel.org/linux-rockchip/cover.1722355365.git.daniel@makrotopia.org/T/#u

> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 4 ----
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> index ecaefe208e3e..9dc09db5034d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -397,10 +397,6 @@ power-domain@RK3568_PD_PIPE {
>  	};
>  };
> 
> -&rng {
> -	status = "okay";
> -};
> -
>  &usb_host0_xhci {
>  	phys = <&usb2phy0_otg>, <&combphy0 PHY_TYPE_USB3>;
>  	phy-names = "usb2-phy", "usb3-phy";
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> index 62be06f3b863..2994cddb3464 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -1038,7 +1038,6 @@ rng: rng@fe388000 {
>  		clocks = <&cru CLK_TRNG_NS>, <&cru HCLK_TRNG_NS>;
>  		clock-names = "core", "ahb";
>  		resets = <&cru SRST_TRNG_NS>;
> -		status = "disabled";
>  	};
> 
>  	i2s0_8ch: i2s@fe400000 {

