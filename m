Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91D8C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaYcqNx5rMYLhdSC0kSUgZT1tN8fo/ryKgabcNZ/bCw=; b=sjIlIHyh0h7fojWkLh+6iQVHTr
	XrCWzuTRHynmcYvmiYPSPq1zIWz0DU9NoAhd+K4z1pl/C4gbULfgY7qNSMjmCV3QKGJqG9enIHiEf
	/Trq+kzSH9k5YR3gBRFDlgPPr63gslo+qims6GBpeIEzkiD9i/J5rkKObOVpNJqrjQG87u9bkirLl
	ZOwL0eTK7DV+1scP87fMzJ4ySIoAoPyDtGeC+eYyIfWOb2uUI7ERvhVICIoMEKewWcO4xtGGzytnk
	Rwk1UdzwtaZt399q1M0f/2tkWj3YfagRgZok4YSM7l/J8S+dFvqzvH9VEsAEMqzSChgUlxPLmRXRz
	oVljn9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoYf-0000000BqqR-2Pgr;
	Mon, 05 Jan 2026 17:39:57 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoYb-0000000BqpT-33pY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:39:55 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so243100a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767634789; x=1768239589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaYcqNx5rMYLhdSC0kSUgZT1tN8fo/ryKgabcNZ/bCw=;
        b=Zr/AZ2vxoTlBYi96idvm5fJzKzGoDwy3VOK5yvpipaQ95T9p/AA/dCQBBndJWhNOOw
         uiy4JZ4n61BT2r3+flk+iPqcNVox1xaBPAkhTqBsNZG6aC7oxYIkBY4muyKmRkoS8pcz
         ru0V7RQ53JhNJm5+GjeHE/l/R5asEH50n+4L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767634789; x=1768239589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NaYcqNx5rMYLhdSC0kSUgZT1tN8fo/ryKgabcNZ/bCw=;
        b=J41UHa1rFp2/Ka6izepnOydPxtglePDBU34INzLTStM+UfJ3ym3p1zrymDbR9P6n27
         wMCYiJ42Ogvdc8YAyg9iQ5G6vfTuovwc+HP5iB5TsEJQHPsXZIrAqljgxFv4k89/6xhI
         7O3834gJfljgq0S14mhXUN2e4U7Rdc5mKX9zFiUasKJoPWC/8mmx57xmMEXrDbd5C+dQ
         2RPRrOqF0P2TJUriFQEHUiAYgV1stdjrr8wxr4w5EniM35Z9e9Of+oVIqEWKG/MEXj11
         PW7M3GfPDQZkrUdpoTMXYrYU2M9yz/Ro3bKxiRRtPMMn4r+OsZinEtpDxkddb0Deb8B2
         L5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn0q22SO+52ADFpZIFl2tRt3ZKFfV0ibNd6H5VV3rULi1DBQNvMCZ1abX5unEp6qzTaSLbLFwso/YloBbTbGfa@lists.infradead.org
X-Gm-Message-State: AOJu0YxiDF0QX99rQmKqZulaXf75xY1tj4f155lAuCdopfgwc97Hdr0c
	y8+aXkJBtyPuTDFACxBjRpR3UXPlLGTznG2yhQfZZMFruZp8i3/w1GLss1wR3bCm4M6pdmOGZJc
	ZK9/Ddw==
X-Gm-Gg: AY/fxX7kKx7e6oW3BARNchPWEQpyWYR64CZVkurTUcIDLy9THjK/RwFin8q6NdtCuuK
	dn7ryt6S7hOw1GOvUPyB0nMKWPz78uIr2CsyF8plsUczUVlA01F6JDiLxBvGqxHSq4amqFi01N5
	uxBA+CmjnYnOo8igkRrRP3w6Ois/tqj6jQlcMeohRScbhA2sJJS1P0IWc8xPtZruiofmEZNjP1F
	W8kic/DngDu3vCMj23KH21SVb4LWraRXTEMWz5g2kLn+dF0SPNSDuUBLuxn4eB/+7jiCXnXlJ/m
	tK4RRST8KUBhsQF9gghP8YxRaombJj1FrVnIWnqie3m875DH0UAJs4bzWzqplpvrAX8QI1xSrLT
	Sbq/B4B5PNZtvOOmBslhDxik6zP7b6ms2yLvNP1eCDnBh+ZnKDZTf7AkWmaLvef2NoWtwDzhgKM
	UUgd+VvfY2VBqDrY+/ADH9b4Vi/Dcfwapl0y6W9J7yA0wpf0Gm25TrtJDCgunv
X-Google-Smtp-Source: AGHT+IFLRlJa4S+piYGh11DDiNpSMewqgs99pKpdF8NNTyOW+mqlnh3KJd1wwSEs2tVtjU6+Lh50VA==
X-Received: by 2002:a05:6402:13d2:b0:64b:7e89:811 with SMTP id 4fb4d7f45d1cf-6507931f849mr238231a12.13.1767634789432;
        Mon, 05 Jan 2026 09:39:49 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65075a26079sm368940a12.1.2026.01.05.09.39.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 09:39:49 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f57cd471so62618f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:39:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBQiNQvFfZwyMYG3bsDFkx0GB0pcx/LgTBwsZdO02hqDM5finkmoZH6yuF3kP+eFZI6MrTbCYDcQfVtnIyUBAa@lists.infradead.org
X-Received: by 2002:a5d:64e5:0:b0:42f:b581:c69d with SMTP id
 ffacd0b85a97d-432bca2cba0mr696796f8f.3.1767634787333; Mon, 05 Jan 2026
 09:39:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767111804.git.robin.murphy@arm.com> <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
In-Reply-To: <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 09:39:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VB9XOm33VvsTN4cd22rBf9A-7ie4hN80TAByciQropfg@mail.gmail.com>
X-Gm-Features: AQt7F2olhV1Qt_uuATpZxGz_1-vircsLH4yPAB7cIo-0B798684oC2-AXT17Qsc
Message-ID: <CAD=FV=VB9XOm33VvsTN4cd22rBf9A-7ie4hN80TAByciQropfg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
	sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_093954_120084_8215226F 
X-CRM114-Status: GOOD (  17.73  )
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

Hi,

On Tue, Dec 30, 2025 at 9:21=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> +&{/} {
> +       pwm_bl: backlight {

nit: up to you, but I happened to notice that other rk3399 boards just
use the label "backlight:" instead of "pwm_bl:"


> +               compatible =3D "pwm-backlight";
> +               pwms =3D <&pwm0 0 25000 0>;

40kHz is awfully fast for a PWM backlight. Are you sure you need it that fa=
st?


> +               enable-gpios =3D <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;

Not that I'm doing a thorough review here, but I happened to notice
that you're referring to a GPIO without adding a pinctrl entry. I
think the usual convention is to add one.


> +               brightness-levels =3D <0 255>;
> +               default-brightness-level =3D <200>;
> +               num-interpolated-steps =3D <255>;
> +       };
> +};
> +
> +&edp {
> +       force-hpd;
> +       status =3D "okay";
> +
> +       aux-bus {
> +               edp-panel {
> +                       compatible =3D "friendlyarm,hd702e";

As per my response in your driver patch, any chance this can just be
"edp-panel"?


> +                       backlight =3D <&pwm_bl>;
> +                       no-hpd;
> +                       power-supply =3D <&vcc12v0_sys>;

While not strictly required, it seems highly likely that you want
"hpd-absent-delay-ms". It's highly unlikely that you would have
"no-hpd" plus a "power-supply" but no hardcoded delay to wait here. I
haven't seen panels that turn on and respond instantly.


> +
> +                       port {
> +                               panel_in_edp: endpoint {
> +                                       remote-endpoint =3D <&edp_out_pan=
el>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&edp_out {
> +       edp_out_panel: endpoint {
> +               remote-endpoint =3D <&panel_in_edp>;
> +       };
> +};
> +
> +&i2c4 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;

The base dts already specifies #address-cells and #size-cells, right?


> +       touchscreen@5d {
> +               compatible =3D "goodix,gt9271";
> +               reg =3D <0x5d>;
> +               interrupt-parent =3D <&gpio1>;
> +               interrupts =3D <RK_PC4 IRQ_TYPE_EDGE_FALLING>;
> +               irq-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +               reset-gpios =3D <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;

There's no power supply here, so I'll assume it follows the power
supply of the panel? You probably want to be a "panel-follower" then,
right? AKA you'd want to add a "panel =3D " node here to refer to your
edp-panel.

Oh, except that the goodix driver you're using doesn't support
panel-follower. That's annoying. I guess you'd have to add support for
that (see history around "is_panel_follower" in "i2c-hid-core.c")?
Without it then I assume you'll just be lucky that things work? ...or
you'd need to mark the power supply as always-on?

I guess I can also note the same comment that there is no pinctrl for
your GPIOs here.

-Doug

