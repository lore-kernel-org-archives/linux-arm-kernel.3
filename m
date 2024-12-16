Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD49E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybFr+xBF+04SsTx9tZHOi4dPPshGyMog5vNkLi99Q50=; b=SDQyLzDKLKHf1NwYrAvJQz4nDQ
	vLrPxMhbmQ8T+/czk4LyXdYSBosUFdQzRi6BeBxX3c8PKSFldi+i1uCWrl03mNReoaFa2lQUAEbce
	8cSXkMMkVDgueI9WJuz10v1hcjiCkyIw4tPWTlLwlW/oZZIlNVMlsjvGvxEfozpUAIkqDvUBA5BJV
	sqPgwK2GBgisnj2N7lR4FJJZnDZ5K77nt2VRvQO//Dn7uYHLmwSk5/qM4ztQEK6EfHftPJZtKfNO4
	0pUW09bYy1eyRZ9iGjROwZM3cm2NG5I+ojPK71oiCCf7ymTm6T04qfsj4W8gyfqFcKEVGnKlFFVVS
	JIcu4HUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN74S-00000009UtT-4AZV;
	Mon, 16 Dec 2024 09:07:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN73J-00000009UgO-3Mr5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 09:06:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53e3a227b82so3736104e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 01:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734339967; x=1734944767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ybFr+xBF+04SsTx9tZHOi4dPPshGyMog5vNkLi99Q50=;
        b=udtSUswqtbgNebxnlihB6flWtT4NwCiX5gbi1SwETd5iICmg856PI/XgEpvJ05V+6S
         TVeqFY0k78UYNhdaOqCnb0XKBVDhmnTqAxwzYT1lSXnFoXuP9I+cAEEdsu7fXjjEdSjM
         167XXT1O08/CVYyvR9UkMbXaXsW67bZBA3+IPaudFB8bBN77HOepsZPV6zw368mjsKoo
         XhZlScAhvb65v4IqLWbAr0LQe+xvr2aSAm1rsJlwP7yOoJRz2iRC3uNnrU4dxK8lxDRF
         vVcnnQsPXCkeZcHu9ZGDoCI50t+AH1boQs0vm0v1KHf/ZfXFa1uMjH0Crw7iiD7GXGIK
         a3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734339967; x=1734944767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybFr+xBF+04SsTx9tZHOi4dPPshGyMog5vNkLi99Q50=;
        b=oQY7MZQk59iPYcMhEujtohixIpslam96slZD2gUp87KIsvYvCYb3giGv9QXBxpt2Za
         dTvVHQoPc/B+jOr6CVcarIZ4PsLUeOVVn1YEu6BWHDkKkTuRGDVcbX7RZC/F5dVnJ7d/
         L0ZMLBKeKPdUA4RaK/i2D4rkzhbjcJveptZ7rn+nDw+iwNFJdsux2/tjYOggDPmBuDSr
         p5l2OZSVJKUltSM/aNdmU47Hj38Zh7fK2H+FXfGM1kkwyrU+laUQcR7foyds/do/a+T1
         Mv2XOqsK3jL5nuyLVzPRkZBx+gBd1HsBL0cIHhRqLZmXC7Inibfv59hLDL4VgLuYv5m3
         TL3A==
X-Forwarded-Encrypted: i=1; AJvYcCXNdANhwk/nxkjVSFos1b5QT0CcK3k9wFDb4Wnn3iuL+CZ89ahEhu07LfXV91uDFUmB+Q420cY0xyPVxPoQAEiP@lists.infradead.org
X-Gm-Message-State: AOJu0YwwdLAZDOn5bDX9y64XJUrDy2gGc/Sm9SAAkgZcXR7Nrd2umb1J
	8afatTaqXiW+XHftVuijd1tPIQad1/KcryzzTSDbfswaH2ivHn/pXEV0yYWfuj0=
X-Gm-Gg: ASbGnctvyNgPRYwDXBP0mmSkO1qq5n5angNX21GhDiH624qipYkSZVFEO/czt+9Dsd+
	Lnh1facpsCy9mbAQW2Ee73D6TOvPBiveOnMV5ftOKpy5b0/T4aq1dk4+x70qDSMsnDbi2vGJ9f/
	Ot/6xeqwWnD+Q+BhUULBADFF/526ckRtBsdIwwjYceGBx2epwWmy6vNeGU07MYRGzxD058iJwmB
	1IvZ6NVWr1dCOaLiheYs33bcZfx9CtqBrxeNrJbRzLffPxPhqsQVzmS6BdEsbqBSJt33KwVav8L
	aLiQOGP9tLV3W0LmdmrSJ3Ruqmajaa8g3sK6
X-Google-Smtp-Source: AGHT+IE2z+Yrxqh/d+CbdTI/ZEFbpY0tdfpWkjP3iId/t6e4EaPLDgQ5n81rb49OUv0YGO/PEvgPOg==
X-Received: by 2002:a05:6512:b96:b0:540:2a6e:3882 with SMTP id 2adb3069b0e04-540905616b3mr3205171e87.29.1734339966797;
        Mon, 16 Dec 2024 01:06:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00166sm768988e87.159.2024.12.16.01.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 01:06:05 -0800 (PST)
Date: Mon, 16 Dec 2024 11:06:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 10/11] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
Message-ID: <ay2im4itrj3k4p2ksobgsk77b7m4laaxctkfcpffqxj5ttxenm@mzdizmf3mlcb>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216031225.3746-11-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_010609_863411_25788A56 
X-CRM114-Status: GOOD (  18.01  )
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

On Mon, Dec 16, 2024 at 11:12:24AM +0800, Damon Ding wrote:
> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
> - Add edp-panel node
> - Set pinctrl of pwm12 for backlight
> - Enable edp0/hdptxphy0/vp2
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Remove brightness-levels and default-brightness-level properties in
>   backlight node.
> - Add the detail DT changes to commit message.
> ---
>  .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> index bc4077575beb..5c1ea25b6524 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "rk3588s.dtsi"
>  
> @@ -120,6 +121,18 @@ backlight: backlight {
>  		pwms = <&pwm12 0 25000 0>;
>  	};
>  
> +	edp_panel: edp-panel {
> +		compatible = "lg,lp079qx1-sp0v";

Please use aux-bus and a generic "edp-panel" entry for newer platforms
instead of declaring the panel on the platform bus. Placing eDP panels
on the platform bus has been deprecated for quite a while.

> +		backlight = <&backlight>;
> +		power-supply = <&vcc3v3_lcd_edp>;
> +
> +		port {
> +			panel_in_edp: endpoint {
> +				remote-endpoint = <&edp_out_panel>;
> +			};
> +		};
> +	};
> +
>  	combophy_avdd0v85: regulator-combophy-avdd0v85 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "combophy_avdd0v85";

-- 
With best wishes
Dmitry

