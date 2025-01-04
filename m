Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E5DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oEoAKKEizk1AGrodmNZICCaBPTxNB6DvcRBoDziYoQ=; b=3BmEwsAW7WDGDi
	HEEOFAUVNujGNWrTikx3fCsCJUMqbapCmBdUwx4aL3lx1DSI++Z2xsoaC7v6f/Lmh+/BQAcPjAbOM
	4J6v+AWDgUP4wrnf1MSOzwFwjjMYfyAV4MX6Zxt1l2+NATgXma3LCErAHLyEaDbZgIkcofEYDJEmA
	txkgvqHFPXeFCw2qVnOmiPgssRsBuWUpRPY5bPwaBOJGvPIvDgp5MQ8ZE9PeUP7lzxywR1lWfcK3y
	41bxUpZz70ZKITuSjVxy6IHmpM42uqXhQkstlfjtMLImxehUIGvEYj03HnXgqug1O34/i9cZ1imqv
	14aWq1TsPHbHyFAbgAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU1Kv-0000000ErUi-37Fz;
	Sat, 04 Jan 2025 10:24:53 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU1Jj-0000000ErJo-2xOh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 10:23:41 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53f22fd6887so12232555e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 02:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735986212; x=1736591012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oEoAKKEizk1AGrodmNZICCaBPTxNB6DvcRBoDziYoQ=;
        b=L2scjxlyDq56ulVOO1c6MNm2qTeo74ndv9K4e7JEwhwG2yWYNaqhD7VP20Wcc/Szq0
         ziuWmHorf0HqP7ybrQjyJvCA+dxq/tGIeTPRN0X0RI7w28prDPkxZQ+yFDpzdQKueLVX
         7uE2RxOU4BzQpwWJsDmVwQKdogXgDsdbFq85F0xXhZAWx1Y1y+SRo5/+85tOYqFonk09
         QR2yfYlk/FvrzJL3iPAYfyzbwV5wZChTzDyhps3vrd2aRV6Q00A69wKi2WNpRW8hK/CO
         vEToP7Gj9bnaIOfifNNGLnFwelwysSn1mH9nFISb0DP7Txpq2DtYvrhIIP4j5sM/f74S
         QDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCw7nkdSa5XvRZF3Y0sehxMHi4mmjUoNJroZ8TbqyMC1oxJJsZl3UoE58PL9Q7vDwXA/vork6TUTLiWnDk4Yiv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv5RwjlFyAj6xWrtofEzvLpXnNen+5WA3+oBINos6BycYk+CuA
	MppmuHXgVS0xclNGDDP66zNprYXRcD9P+928d3W7znE1+d5fpeoH6BGCvh7B
X-Gm-Gg: ASbGncs2EX+5vTnaad/IYHycz69BU6kbW2CgkQealH2nYIF1xXFDSdTjZYfC0GTdok9
	lQmEnKdNMpfNECIS9ep7yYTHGLWlgnkEm/KehBxMr2cOBv+Rk69V4fkbwHgudeig29B+MEZE5EZ
	Q4kZZrmIoMpZtkh3/DqRF5/G3ZKxmQOn5ck5EGEqEc21rAtU6moFAAEhrsnoCsyMc9h565kuUe9
	OQfMPyuxgezqFtPrkDaJgsFTmKOqEcGRBHNUUxD/654mcCkzn9uz53gx7dc5jQroz6+4tnwAucn
	cj3AzEM1ZA==
X-Google-Smtp-Source: AGHT+IGAiPMwEg84xtJZ6LeaFQ5Nr26UZT5Blm/2gS8wJQMRI/hYLrrT32guLSZTdSHfh/cvkSN4Qw==
X-Received: by 2002:a05:6512:318c:b0:542:2943:db06 with SMTP id 2adb3069b0e04-54229547836mr15189210e87.33.1735986212140;
        Sat, 04 Jan 2025 02:23:32 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5424b9f0e3dsm2180416e87.76.2025.01.04.02.23.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 02:23:31 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53f22fd6887so12232524e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 02:23:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYR8ilXcsrhENY9BjpPOg+WY/PQfk2lPa+2v/VpAVlMqUURnNKWpgMI5koat1lKuVxVfKNoNaL60eptMHC5yh7@lists.infradead.org
X-Received: by 2002:a05:6512:2399:b0:53e:362e:ed3 with SMTP id
 2adb3069b0e04-542295253cdmr14007249e87.1.1735986209772; Sat, 04 Jan 2025
 02:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
In-Reply-To: <20250104074035.1611136-2-anarsoul@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 4 Jan 2025 18:23:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
Message-ID: <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>, 
	Frank Oltmanns <frank@oltmanns.dev>, Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_022339_743936_329D0600 
X-CRM114-Status: GOOD (  17.21  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Jan 4, 2025 at 3:40=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmail.co=
m> wrote:
>
> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> select TCON0 clock parent in dts
>
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 =
mux")
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bind=
ings/clock/sun50i-a64-ccu.h
> index 175892189e9d..4f220ea7a23c 100644
> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> @@ -44,7 +44,9 @@
>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
>
>  #define CLK_PLL_VIDEO0         7
> +#define CLK_PLL_VIDEO0_2X      8
>  #define CLK_PLL_PERIPH0                11
> +#define CLK_PLL_MIPI           17

You can't really split code movement into two patches.

With this patch applied the clk driver will fail to build because
the macros are now redefined in both header files.

Barring recombining the patches, please add a patch before this
adding #ifndef's around the two macros that are moved.

ChenYu


>  #define CLK_CPUX               21
>  #define CLK_BUS_MIPI_DSI       28
> --
> 2.47.1
>

