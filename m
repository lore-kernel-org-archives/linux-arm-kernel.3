Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA19EFB810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1IkUg3Q9+Zu2kPt5FkumK1ZX1m9hcDplS2/G3IHqF0=; b=lNBEK79Pr1fF8qL8IznfpUNgPS
	MwMOMveM9JuQlDuYUctV4QVFVJx8Xagt3c+bBmlG37BvMPRGN69SKj7MDzWejIQ3n5sHriIsVT9mM
	/qqbJ+Y+ypzmGWWvjfOplNVWrJW9yRier66ugQOZDtucSW8PklLUGC8pQXiDGgQilt7o0eeeU0pgL
	4rwGDPNxYHLcN83L2nDNlj98iuZArdFn1rLJCFeKhaeKtfqKsyWvEXk524DVsH3oN9jaYXmU1mkgP
	amGZcXeeMKYGLn/O/rVb3mMgnUsaGqAcbGyVRAafVHAh9TaGdfIr3Bfqia6l6YhNc9nrjxstxxOJB
	0g0UX1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumkV-00000001aFW-1EPz;
	Tue, 24 Feb 2026 07:22:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumkS-00000001aF7-3wYH;
	Tue, 24 Feb 2026 07:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F3F743A5F;
	Tue, 24 Feb 2026 07:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC75EC116D0;
	Tue, 24 Feb 2026 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771917743;
	bh=8sYxib13fUYmbRr8GN0ErWAgBVzMRPr1YYVyj9V9drg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWFIBFTFfD96BBFjZyhR8OqD6QzhH3cB5oEsh8Ydkk3OcGGvYH3mF8alU7drTiAjB
	 xgDVCDtq4TsWk5y1w2IwFngLZzSTL+UWH+P4j3n1wm/2kw6fy9maApDpWFcuhzQnqK
	 mtFLm0d1vQJGT+GhjbTJ432c6aiQBQq5YY5XGr1K7xt0ZTQ/m6zM9FaLcL+hcoK7Vo
	 n/rVIzUck7mJAFLj8YmZslzSZsDHBXAQgGwdAPE0it1BJTFL9t3HEgbbDL9BskqhQE
	 1UJJ6cKy2uqC8Ev/SjRA1yZPwr172Ffv+Fdd998t/UYZqZ19WyBHwHg+7OgDn0cf1C
	 B0tBsqlycriLg==
Date: Tue, 24 Feb 2026 08:22:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
Message-ID: <20260224-glaring-poetic-goshawk-b44d7b@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-2-daf4942dfc02@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-2-daf4942dfc02@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_232225_007592_BE141956 
X-CRM114-Status: GOOD (  18.39  )
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

On Mon, Feb 23, 2026 at 09:49:50PM +0200, Cristian Ciocaltea wrote:
> When building device trees for the RK3576 based boards, DTC shows the
> following complaint:
> 
>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

So you need to fix the unit address. This is what the warning tells you.

> 
> Provide the register blocks in the expected address-based order.
> 
> Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index 49ccdf12ef7e..45eb0d053a6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
>  
>  		vdec: video-codec@27b00000 {
>  			compatible = "rockchip,rk3576-vdec";
> -			reg = <0x0 0x27b00100 0x0 0x500>,
> -			      <0x0 0x27b00000 0x0 0x100>,
> +			reg = <0x0 0x27b00000 0x0 0x100>,
> +			      <0x0 0x27b00100 0x0 0x500>,
>  			      <0x0 0x27b00600 0x0 0x100>;

The main block, so probably the lowest address as in unit address,
should be used, but this ship has sailed. You shipped this DTS, because
the order of items is FIXED. Your binding change is clearly incorrect
and ABI break without explanation and without reason, so you cannot use
such as an argument here.

You cannot change it without impact, so just fix the unit address.

Best regards,
Krzysztof


