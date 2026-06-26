Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2726DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yvw6+GjJRRakSTt07g6wW5GBrCnruGOoGq+tkn21WA=; b=RDR/94Jsq0S/JqMAQ+BsXo3MxT
	9lu5U8O7S35wJ4fbYL9PyB+oILuB8guFfWSDAZ0B5SYXhX339yVwYrvxrkJ6zZEPl8zckRNf3NAhD
	Zc+J+vWeHYrAv+NSda2ZE97FLSBd2a+RicoV6wKBGoJJkpff2N7U5w1OxJVW3sJ+wDj3OW2AYFrz0
	ALZS+FkHKhY13L/rT7CWdOXuyBrhmDEOD9qezujAnjGkFAAihKGBHNF9bYOjmvZI62YGUjamK1nQg
	35flZ99skSpjyhjDhEbUiNBGsfdCJ7mX5nMUqMSpzorgVFCW50YQTqF1imurv4k49GBKMXrsDd2iy
	U99J43XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6VV-0000000BMlL-2gEy;
	Fri, 26 Jun 2026 13:22:09 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6VS-0000000BMjs-0xcP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:22:07 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3967701fc3cso484101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480124; x=1783084924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6yvw6+GjJRRakSTt07g6wW5GBrCnruGOoGq+tkn21WA=;
        b=fjlRsSsQou/mhJ/3P05wAwGAXcZwNz9MRnjWhGD0bz07bc1XNxNIW11BEcmaTcU32h
         kSgR0snSlUfOvLIcfEiepG5zaUj4E0CyIwn7XyMyranAWz/Ng7hQi3Q9znK5pcI/XwLl
         656OaHJi6Ttax5E2ifLA8UphV8+iggD4D9ibdnJ83u/wMSIdjQmZEh7nEtPtLT0mN5j8
         lcSpn/1DE6N0I9GA5LzT6NIBeGAfC3Z4ivWU0OM4ndK/QgMUasZZ2mxSv5kUfGcKcDc5
         UGEPFUIf6FAY1ZpzUPSwZtEAHiIrJ7clxF+UFD8qR/fZOFuPBMkn5e7ms6BKfeGP1Hny
         bKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480124; x=1783084924;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yvw6+GjJRRakSTt07g6wW5GBrCnruGOoGq+tkn21WA=;
        b=eBbQg0o5D1DJC6lti3zkNQL9vLro2aWqTneyHVdudZrKiYlXVEwIX3aire1vbK/WTt
         JP1SMdGb0PV8fVV6SyVIhLfhYFoFXLAT/isDIpJv+DtMNEulN8gkTf2ZGMUOaBG9Znn0
         XL66Pit+2ZZa3tRc6SJlpKT7dM8rlDS9o6b7MANKVCIJqBKoJsFokbGQDESkoO6gPhHH
         ZbrBI47VRbqZR52OL2hc9d3pZP9aBVbGkKd2MRqGZwuIYPK3PsnBBWsAF4KOiZiImklv
         g+0M5p/S3GRZngNjeHQLXukwMGMCHE9W8ZosyW3f2rAodXm7WcASY8KeAxHGPu2kFZCo
         P4XA==
X-Forwarded-Encrypted: i=1; AHgh+RrpMPq67MYsl1WaJPAbafoMwRfYfge0J0OfY04+1yOJHxcq9TSF76maN4ib/hF5ZkgY3A7hienFbndCxqtErOmN@lists.infradead.org
X-Gm-Message-State: AOJu0YxMnmboqtBgObVwdShZCbxlzb0uuTEeyP5NA/ctTk4tt/q53OJp
	NFe+dZCIpSD4TQ2u8kSlqmwsXnM8kr/oi509i1BRjgsH6+8hELmzzaGmifM97VhN1Yg=
X-Gm-Gg: AfdE7ckZRbEhGAPsTh2hIorVwA7+aMgZmTP8uZaYMRlL/krfMToeOHoMYzEnuBy4w7z
	CrllmWt78iBCEGSMHojB49R9Y41a5bfvJGJBOLRd0kpa2l7DfcoyF7cc5xfR2r/zw3Gtw17TzNt
	rHDR/Pnh/ZRhZgngi3Yw1PLIJaMJLXgEygG7bBcTe+VFiQMuFrJLmrUGBMSyE0OLao1+SuGl5mB
	pVWBgOt6Ju6ix0/se/E0/Mfi7rAcDqIsO6jh20lMhQ20ViCP2Nquks3i39kUXCrp0ejTXJOElcy
	uzsa1sjGabystHpYD6Jg397DOjoe5tTz0YbCTQsA31IY2wKqumNX/BMZF/RPl37zr68qsIEsWnT
	Rueel0D+XnvkbLsqaXQZkya0XqbyW83OzlAyzplxeDW846+xSdizxg2mekylHQZ+l7BJsdCXiCO
	1+CTIgB6A9Cgb45atyJ1NOcXT/8QRAaSNJS9WCKVcTOMkupx+OZ1Gk2pMAbe6ZACISiZU=
X-Received: by 2002:a2e:a547:0:b0:396:831a:ef36 with SMTP id 38308e7fff4ca-39acb6eaffamr7242181fa.5.1782480123871;
        Fri, 26 Jun 2026 06:22:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999af9e53esm49306771fa.6.2026.06.26.06.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:22:03 -0700 (PDT)
Message-ID: <409287ae-1bba-44d7-a386-e2369025f8d2@linaro.org>
Date: Fri, 26 Jun 2026 16:22:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: media: i2c: Utilise
 video-interface-devices enums
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-3-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-3-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_062206_343460_ADA208E1 
X-CRM114-Status: GOOD (  13.73  )
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

On 6/26/26 15:07, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the existing examples throughout the bindings documentation for
> camera sensors.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml  | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml  | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml     | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml     | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml | 3 ++-
>   12 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> index 1a57f2aa1982..b7bc6ba26e6e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -86,6 +86,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -102,7 +103,7 @@ examples:
>               vddio-supply = <&reg_camera_vddio>;
>               reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
>               shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>               rotation = <0>;
>   
>               port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> index 6f2017c75125..b9c61395b24f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> @@ -69,6 +69,7 @@ examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -84,7 +85,7 @@ examples:
>               avdd-supply = <&ov08d10_vdda_2v8>;
>               dvdd-supply = <&ov08d10_vddd_1v2>;
>   
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               rotation = <0>;
>   
>               reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> index d96199031b66..fcd617848ce3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> @@ -96,6 +96,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -114,7 +115,7 @@ examples:
>               powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
>               reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
>   
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               rotation = <0>;
>   
>               port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> index ad07204057f9..6df62fd0c0c0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> @@ -85,6 +85,7 @@ examples:
>     - |
>       #include <dt-bindings/clock/px30-cru.h>
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>       #include <dt-bindings/pinctrl/rockchip.h>
>   
>       i2c {
> @@ -108,7 +109,7 @@ examples:
>               dovdd-supply = <&vcc_2v8>;
>   
>               rotation = <90>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>               port {
>                   ucam_out: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> index 3368b3bd8ef2..5732657e1484 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> @@ -103,6 +103,7 @@ examples:
>     - |
>       #include <dt-bindings/clock/px30-cru.h>
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>       #include <dt-bindings/pinctrl/rockchip.h>
>   
>       i2c {
> @@ -126,7 +127,7 @@ examples:
>               dovdd-supply = <&vcc_2v8>;
>   
>               rotation = <90>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>               port {
>                   ucam_out: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> index 2b6143aff391..24787c9aa155 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> @@ -72,6 +72,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>         #include <dt-bindings/gpio/gpio.h>
> +      #include <dt-bindings/media/video-interface-devices.h>
>   
>         i2c {
>             #address-cells = <1>;
> @@ -87,7 +88,7 @@ examples:
>                 powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
>                 reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>                 rotation = <180>;
> -              orientation = <2>;
> +              orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>   
>                 port {
>                     endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> index 20f48d5e9b2d..56fb5f18f07b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> @@ -69,6 +69,7 @@ examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -84,7 +85,7 @@ examples:
>               dvdd-supply = <&camera_vddd_1v2>;
>               avdd-supply = <&camera_vdda_2v7>;
>   
> -            orientation = <1>;
> +            orientation = <MEDIA_ORIENTATION_BACK>;
>               rotation = <90>;
>   
>               nvmem = <&eeprom>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> index 6050d7e7dcfe..b4a88eaa7ef2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -74,6 +74,7 @@ examples:
>     - |
>       #include <dt-bindings/clock/qcom,camcc-sdm845.h>
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -98,7 +99,7 @@ examples:
>               pinctrl-0 = <&cam_front_default>;
>   
>               rotation = <270>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>               port {
>                   cam_front_endpoint: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> index 7c11e871dca6..69a37ff68db3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> @@ -86,6 +86,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -98,7 +99,7 @@ examples:
>               clocks = <&clock_cam>;
>               dvdd-supply = <&vcc1v1_cam>;
>               lens-focus = <&vcm>;
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               ovdd-supply = <&vcc1v8_cam>;
>               reset-gpios = <&gpio_expander 14 GPIO_ACTIVE_LOW>;
>               rotation = <180>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> index 060ac6829b66..db9f0c15576c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> @@ -105,6 +105,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -123,7 +124,7 @@ examples:
>               reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>               st,leds = <2>;
>   
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               rotation = <0>;
>   
>               port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> index c6673b8539db..48db22ca4a7e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> @@ -107,6 +107,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -125,7 +126,7 @@ examples:
>               reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>               st,leds = <6>;
>   
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               rotation = <0>;
>   
>               port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> index bc339a7374b2..4a66cb711372 100644
> --- a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> @@ -173,6 +173,7 @@ examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -196,7 +197,7 @@ examples:
>               vddgpio-0-supply = <&vsys_v4p2>;
>               vddgpio-1-supply = <&vsys_v4p2>;
>   
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>               rotation = <0>;
>   
>               sensors {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

