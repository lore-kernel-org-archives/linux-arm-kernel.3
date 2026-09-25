Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F339FC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVgejJErSi/df8/6avC+kCC2kZbgZL+1y5/eEh1fX5I=; b=lY/xHNYiM5TFR5PmocNQRV/Xe7
	d63MD0IMFpyRqgKsmjNkI3R5ekfUQDE5275EG2qzGLp2wod+tRjqunThpeOjyZJHoWWWJBg9rbiRE
	BssWrB+/Isry8+XT4UlUUgjMI8h8ymX49EWatrVRTKRGD8dZcOijH0glmLK/yG3bpYv6PbdIQ/VYa
	+pL4Eyn4b+C5mX3uXmVWmxJk/EAvu/Z4Pv/J8Cr9j9lRdO+7BfDhWRrXqv2qrYhSRAgXEoxILuEMn
	0VRiIKD2Fl0O8GZ41C60U2mNPvecN/FbqrVtXc76jyprVU1ytgMVlmvA0MqnDXtHoj4KLtKAXt3Qh
	wgYpn7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5L6-0000000DM4u-12Ob;
	Fri, 25 Sep 2026 12:47:44 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5Kz-0000000DM0T-25xp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:47:41 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d391aso6139295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790340455; x=1790945255; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVgejJErSi/df8/6avC+kCC2kZbgZL+1y5/eEh1fX5I=;
        b=RY4+Pxn59wsor4m5G30G6lelwdvxY+SP9I7gE8ydAQxEI2sEUaQ87OwtQ7JPO3tebe
         MspalvXufDkG4dOKTnOxuCNmmKk+9wZeF0iT2yoYnc3ZtrDCvVsg5EYjJonFZMMOtQIa
         tvtcCa93KrGyGiNWoO4zui1b/ORfnUUBgMhPbyxYtUZSYstz9Lsuzm55dJsPbkh04CbQ
         4JkvT0FSFx1CAmNOyuA5ouMro9kDZkGx3GMort77K0BeaUaS5btmizNUyjz/udDbYmEi
         sPTggDNj1to0FDFvJ92WeaYWI3pFz4lNz9QNcy60+YVB8SFYNaOWfu7CRkxOnhLzJT2j
         GGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340455; x=1790945255;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVgejJErSi/df8/6avC+kCC2kZbgZL+1y5/eEh1fX5I=;
        b=PmxEltm1uuFWK5wFYIwqal+KBDUB0Mlc1ltzGepmfc3yJ9m70h8Klu7uXcMl2yF1P4
         2crwXG/kfXftxE8sq1N+wMcLQ+bqdzllrVo1xEdXyX3TuZa2oZv2l9cb/5hDgEfKc3+i
         WIWVfnmckLo2bkNrAoOeBAEK/206K9Xwx0koSSSczPRFm6EqoSLVahchbU07B0xmlvXH
         Di0Zw6rqYmfEz43xFlB1wsI45OseTVe8hKOllTUhEF2gG+LHVTRvh+VY3TWzWiX+zGGI
         OC6AJWEhwhEk+CQ0t8+1wRuxmJMBsr26Z4YyuIp1gUrn/izYSwtjwW4ql3ndp4kmQjVB
         dHbg==
X-Forwarded-Encrypted: i=1; AKwUvBwi2AQKkNoOSstDYmFpr2yQROhAyC+WVhG1DGmlH2mkI7rkP6ifRZf827V8M3wu4pNIbR7EVV/XeUyZUIMGw9/M@lists.infradead.org
X-Gm-Message-State: AFuF++kl8iwiFyxF364gsrSP+1EChw+aVHjTChjFOUUyzAKagcvPuklQ
	wU9IRdAFhJ176OuEih/DDALItL8Rg26qjQ8AnqOXt5cG9uBAiuPly11curOT4HEEH+0=
X-Gm-Gg: AYBFou2cxPhdTI9zqd1EglnExSEjp1R5TL1EkoDg6vF4v/NeDcc/6TDLiBh9ZfwC6Ic
	byHGL5ESTJVLRQMG3tQwEShRNwJa7iAidg9CqN9qsVKcz22K8TUuH6xrHuBIq41DdWLEpH/FHBW
	EG8vFMGvWAijUs0zCtbIokzJSM0MX3j0EnoTjG21Wa/rtcG1XmtQTnN1Xo79+V0lcBUQgcvEXHL
	Q7o0ZD3M3tXgB8NKWLqAu4dLahBSFBRp79W2lEFAi+Gnz8aDHDVG5FSMfSGgQHbAXQ+mx2CuUPV
	wPFDUi/c+ROfuFXO890AhCXmOh2xGQZNrbje4p+zwY97uuHc2emvS/VwnV3UmRo8IkhFloiHtGR
	UzvRjx2VaxEO3D76byWuhTnTCZ4dOyQj4rPghLBbLY7brONJ2WK1P7USEhMA5SnCXnbq706eN1K
	28wmMmTKTn6S0idGpSZHNrgutC31IM2riAJTTpZI2ZKkJNi80LbEBQlCpwGSSYywWXl4eOnjK4F
	L3swhmBGX8JYSo7bA==
X-Received: by 2002:a05:600c:6090:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49fe670424cmr91000685e9.28.1790340455565;
        Fri, 25 Sep 2026 05:47:35 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff27eabc1sm58460335e9.15.2026.09.25.05.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:47:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona
	Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
 Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mfd@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
 <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: Re: [PATCH v3 13/19] clk: starfive: jh7110-vout: Allow pixel clock
 rate propagation
In-Reply-To: <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
Date: Fri, 25 Sep 2026 14:47:30 +0200
Message-ID: <1j5wzt8plp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_054737_636266_70AB7A07 
X-CRM114-Status: GOOD (  17.17  )
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

On ven. 04 sept. 2026 at 15:27, Michal Wilczynski <m.wilczynski@samsung.com> wrote:

> The dc8200_pix0 and dc8200_pix1 MUXes feed the display controller, and
> the rate they carry is ultimately produced by the HDMI PHY, which
> registers hdmitx0_pixelclk as a clock provider.
>
> Add CLK_SET_RATE_PARENT to both MUXes so a rate requested on them
> reaches that parent, instead of being clamped to whatever rate the
> parent already happens to run at.
>
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh7110-vout.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> index bad20d5d794a72f071b4d547b7304786a8ba9afa..aeba42cd3c44ba205ced52b1826d2d2de82ad78f 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> @@ -40,10 +40,12 @@ static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
> -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
> +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0",
> +		    CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 2,

I see that you've added CLK_SET_RATE_NO_REPARENT following a previous
sashiko advice.

Note that saying it will 'hijack' the parent without it is kind of
strong. It is fine to let a mux reparent while setting a rate, as long
as you understand the possible consequences for the rest of the tree.

Regardless

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>  		    JH7110_VOUTCLK_DC8200_PIX,
>  		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
> +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1",
> +		    CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 2,
>  		    JH7110_VOUTCLK_DC8200_PIX,
>  		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
>  	/* LCD */
>
> -- 
> 2.34.1
>

-- 
Jerome

