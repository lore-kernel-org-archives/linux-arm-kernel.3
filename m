Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EEACA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFDRc4rOIO+c40lpmKovemaErB2R9zNLl58jsdIqFX4=; b=S9uwTM+Nay9bC3D2ianTMfWQY3
	/I1YUBOv5O5Bajftugmyfa42SEeu+CUUfYvkMfubK0hwdeADQNXGueEYY7vZ0hJsK6R0vYgfk2t/o
	VT5pHqKX1DFWmN7nWPTTRQt9dnFn10pkjo0qQy7p/jzMvYCXkwbqmqyGdgYSvPvLv1dBnbyYS4YaY
	2KTBfUutcStoiad/h+pl3a8wtzDJ78A9GDggaiZeJvI9rU6A9J78IEixPOdgtmetm6sN1dnvCySmW
	mQfJJ5RfrOXmmmaWodubniuUeEAKS1ZToo0Bccu3Gyr2P5Yr7efsedGN5OoPloLx9MJuJwMopKryx
	Rb/X0+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYzV-0000000B2NC-1YyE;
	Fri, 02 Oct 2026 08:51:41 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYzS-0000000B2Ll-29Sa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:51:41 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso3164115a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 01:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790931098; x=1791535898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFDRc4rOIO+c40lpmKovemaErB2R9zNLl58jsdIqFX4=;
        b=n050FP7exRAT6qS1GGJyWLNiie0mlSheN6tBth1fgG1bxm2+mwA2CJdnn/LBQM6tAs
         25whtMJ/rFR1VcG+jk2OQGoLP9fWHjmQZVFmXc5IYCB30IWOM8yl/qOKsOgd1K6RK38p
         vMDp7PnBhjQmdi4NGO4HePxyFOkyNWtd9yuWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931098; x=1791535898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFDRc4rOIO+c40lpmKovemaErB2R9zNLl58jsdIqFX4=;
        b=0U+Jo16O0n/dwrbMMM9j4cqKquU+iGvdmLR1EQacB5fKhzicGkBSBs2pm8W5txNdq1
         8kwS697ZgYdX6TWlu5eE3sLzhV9Qh5oe6zc+tmJZjVhxdJgSOMnjUillH3LUKmHOVEAj
         2Dr7dRmCgAECFSlCZ2GP+yOjkDce9uFVfVx5A/1FJPpRRqm1WoA2DiiCCMqlW7vEtDPo
         F4UIzv3RZ1IbkGKPDR8nEZwlXz1sf85dJXqj/vW12wJkyI1VM/fSsqsMsGKaCVB85ZxQ
         g49myTeYuRRiHl7/xt9ekRO8BcZuo90qjAUFIpSQCC0nvJ/AGtZNcij+YcP8Uzeu0shw
         u7kQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbTAzJELG10QY5oWA/89FD2LETg4KMsODzWoIoCQbnwdf/SpW7L4UxWvRS7BvbbwG361lXO+rfBeAULHpOxw/E@lists.infradead.org
X-Gm-Message-State: AFq9FYISacvonulMhY8s/9VgLnCVPuUjhF3hZIlTdkvJT7NAma0UlENu
	wirJX4c8WTtN/gk4nMj/N7uxxdWTEoHvS+bwnWRZBmCgFTQIQe7TaXi0stizvtspPA==
X-Gm-Gg: AYBFou1P/U7mwSE8iGzmGsImvEPoP2sAC+eJXjIIpW+KFlASST595wUmMRh/JzY5qjc
	R3lWwETcW4mriiNVYbp5eUBFLMNo0XBWscUeHhmA/W5nbBg6NYsS3hNxRhfTLl6ZH66Q6tyGyrF
	XYGMVPsL6iI6zksDHBlYdnqKBt4MpAeFILZJ+9nsuGxCldiDTo/41PHWK2Kd6ema9Mwzgb3KqEY
	dJYXvwJi20VwH7Agq8XHdHuZoWQ4+gLOv1/e0c/KRV+eC4VVXVDBfxW81DP8/7jIvACLmFJ/E3Q
	2GCARSLjhEaswbGbLId8yZi84r6VwDXgun7fHFe9Ac0F34Nfl3gmZmiN/GtENd7xzBs1eR5Blhz
	nlfPgZLeMjFGk2Et40GzYr/zO8kzwhoSFVNLA7NCYxEX5urk6Owv6dLcG+pNPsffu1Cgo0BsrvG
	u8K/J/E2A9HVg+lRIQuEC2xp4QgeZh/4YhywwTX/S6Ds9anud8IeH1g0Rz5X4UFpe6hTQpt4X7W
	EJ8hLWZ5iFFwqSU9wOmg3TqMmxMEwI=
X-Received: by 2002:a17:90b:48ce:b0:3a0:cc3f:b93a with SMTP id 98e67ed59e1d1-3a6cdda1a3dmr768222a91.0.1790931097477;
        Fri, 02 Oct 2026 01:51:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:203d:7:eb6d:4917:3e16:43e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd4bd483sm1024611a91.4.2026.10.02.01.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:51:36 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:51:33 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC] arm64: dts: mediatek: mt8183: Switch to undeprecated
 qcom,calibration-variant
Message-ID: <20261002085133.GA2343595@google.com>
References: <20250225101828.107509-1-krzysztof.kozlowski@linaro.org>
 <c50e114a-bb5b-40a4-ab01-69ee33b984b8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c50e114a-bb5b-40a4-ab01-69ee33b984b8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_015138_647289_9FAE2697 
X-CRM114-Status: GOOD (  19.78  )
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

On Tue, Feb 25, 2025 at 11:23:23AM +0100, AngeloGioacchino Del Regno wrote:
> Il 25/02/25 11:18, Krzysztof Kozlowski ha scritto:
> > The property qcom,ath10k-calibration-variant was deprecated in favor of
> > recently introduced generic qcom,calibration-variant, common to all
> > Qualcomm Atheros WiFi bindings.
> > 
> > Change will affect out of tree users, like other projects, of this DTS.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> 
> Ah, finally. That's nice :-)
> 
> Regardless of the RFC status....:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I think this can be applied now?


ChenYu

> > ---
> > 
> > Dependency/RFC!
> > 
> > RFC, because this should be merged release after driver support is
> > merged:
> > https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts     | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts    | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts  | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi  | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts      | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi   | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi           | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts       | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts       | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi           | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi            | 2 +-
> >   16 files changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > index 83bbcfe62083..f2303d9f125f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > @@ -35,5 +35,5 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_COZMO";
> > +	qcom,calibration-variant = "GO_COZMO";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > index 3935d83a047e..13ec15fa284f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > @@ -31,7 +31,7 @@ &mt6358codec {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_DAMU";
> > +	qcom,calibration-variant = "GO_DAMU";
> >   };
> >   &i2c2 {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > index 72852b760038..b576b974cf23 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > @@ -40,6 +40,6 @@ &touchscreen {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > index 757d0afd14fb..d64581f35d2c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > @@ -28,6 +28,6 @@ &touchscreen {
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > index 6641b087e7c5..d0c98d0aba95 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > @@ -28,6 +28,6 @@ &touchscreen {
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > index 877256eab262..3a81786084da 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > @@ -14,5 +14,5 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > index b981dd31a430..959c4d3d9707 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > @@ -14,5 +14,5 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > index 078bc765646f..4788edaeab87 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > @@ -22,6 +22,6 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_JUNIPER";
> > +	qcom,calibration-variant = "GO_JUNIPER";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > index ddb993521bbf..01cd59993a7c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > @@ -14,7 +14,7 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> >   &mmc1_pins_uhs {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > index 10c4f920a7d8..c939ef3965ec 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > @@ -14,7 +14,7 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> >   &mmc1_pins_uhs {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > index c942e461a177..14d03419b92c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > @@ -37,5 +37,5 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_JUNIPER";
> > +	qcom,calibration-variant = "GO_JUNIPER";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > index ff02f63bac29..c4c08c0f715e 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > @@ -370,7 +370,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KAKADU";
> > +	qcom,calibration-variant = "GO_KAKADU";
> >   };
> >   &panel {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > index 2b5a8d1f900e..7428efec95a0 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > @@ -32,5 +32,5 @@ &panel {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KATSU";
> > +	qcom,calibration-variant = "GO_KATSU";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > index 75fadf2c7059..a36b6ddb71f6 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > @@ -32,7 +32,7 @@ &panel {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KATSU";
> > +	qcom,calibration-variant = "GO_KATSU";
> >   };
> >   &sound {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > index da6e767b4cee..2b283a55f653 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > @@ -349,7 +349,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KODAMA";
> > +	qcom,calibration-variant = "GO_KODAMA";
> >   };
> >   &i2c_tunnel {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > index 8b56b8564ed7..00da50a41574 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > @@ -353,7 +353,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "LE_Krane";
> > +	qcom,calibration-variant = "LE_Krane";
> >   };
> >   &sound {
> 
> 
> 

