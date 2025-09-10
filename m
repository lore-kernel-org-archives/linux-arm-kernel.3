Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56983CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IkDIc30A5I5+5gGYCirVC3ygVlzp+pkEs2HFu2fts4=; b=hbJTStrRBot9IB
	pQhdcNFrReNV4FetUXh9zVB6s18WM8h69gaR4EhIRoEhyCuVZlOd8d9QC+B7U7nHHGSnGmuY6X+cD
	ofmH9F3IQwFmsujpkNJWDWLKGrcXeiOHBGGqFzSBUrPD2FMuc54A9gBOGXDyOjwj3JZ6hKi6GP9fr
	ptqsYUz5U+DkxunEsm+T+Vt/Aw4bV+8v86PVbV+JWQ5x7AI+C6baRxcXY+6/qR4Kl7KPjTZhxA38D
	DbrCmD73SAs+uCQfMamfED/cgbZFrmCyxl32ulI5v+O4MxTcNyJkn3klPBeV/v0feX2n8IEHN9d5g
	AU4RF/f0igl+ViVxjr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKPm-0000000EGW9-1Lvr;
	Wed, 10 Sep 2025 12:59:10 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKPj-0000000EGUL-0wro
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:59:08 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso6837463e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 05:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509143; x=1758113943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IkDIc30A5I5+5gGYCirVC3ygVlzp+pkEs2HFu2fts4=;
        b=MlWGb3q8xbztUAG0AbcZaVgl5kmuNswhT8BBz0Yqo0QP2zPOnjupxSvdqZtxMO3zwI
         PRR56GDLUHduZNN8NSsvVcqKvFiADbHJa4MixnsTMHx5w8PnulZGEEE54Mqmh5dyU62V
         dTVsvq0WCvs9noMc37We3Yt+qFjAGl9xt+jwTN1gJdi6BLNBEazqMM5ejkhW4WLhNLNQ
         RXfrktPmOFWzaoN1aJ4ueiGqi1pLYB55/nnrsuiMfEINlOfmlm335DMxuWCCrDHkCVO6
         I1H4V9DuzMkfi1SlmvYC7lNRz97KtGHUN0oRqkWyo4+UZ2AsZkabesdKwvZFmV7iDaod
         qKmg==
X-Forwarded-Encrypted: i=1; AJvYcCXmwgFTiIHOJfM5siJ7ftwLOTGAdasu+krLtK9PUuSK+nTeBThoKP2uStyYXbTOQ5JEvSQRPbWJOgGw0QnmxUVU@lists.infradead.org
X-Gm-Message-State: AOJu0YxOMDXw/av7Mn4gNGMyQGBfvqVtviHjA8KGcHyRUm8GdHx25fsD
	c6VJ6/7scld697E0fQK/KghIsarOzX3Mhsq+76n4nKtfClYFe1dLdpuOt0d3h3Bm
X-Gm-Gg: ASbGncvav4/LTv7WLJLIS1KLc+YVVnWKlGy2Pbv1RLXGRQS9i85L9FiaTeZsUDOTKjf
	7aGbao3nCWLgfqTZurce0O930ukSGm2msSScxjG65YUvptQATQ+hnz2y3JcWY52VpJBz3Nybvzo
	YdlY8SC3By1LCO0eHp5W2+HvnueCbKnujwfrwC3+HM5Y83mXv4PL91ePwOXwVmev8Qxm/TPj9+P
	8k8RBIGgsgjGfX83WkK/bhU0hpY33/wivVqEurxuL4lfZc51ChBak5zFTnKuupuvYsLLLg+JH4T
	wxDhMaZX6//+oyaAvF5k0Jz8/oVmmJYhFmcB7hIzeWwxOBEXBchDXYQzgkldP45Gs++JJibN5zI
	I1lwji+tdccrmjq1/7MEPGwmvTuAGeihl778ZKI6wuVRZ/1cRVUw2AlxhFCzWTA==
X-Google-Smtp-Source: AGHT+IGNqeIAy8MKUoG1UEBpjrsk4UNtZpOKd1u7rQ8/xQdLi5AsAvd5COYp447/18YiSE+rYEm18Q==
X-Received: by 2002:a05:6512:2244:b0:55f:4839:d049 with SMTP id 2adb3069b0e04-56262d23b1bmr4691500e87.39.1757509143249;
        Wed, 10 Sep 2025 05:59:03 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cce8b79sm1235609e87.48.2025.09.10.05.59.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:59:03 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso6837395e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 05:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVl0hLpNHmWiGSaljXlUvE8oLYr+19MRq75eoh3D7dkzmg3l+s8GjQ8qF2tXCOKwBfKr/jum1kVBE7/w2KBGGtE@lists.infradead.org
X-Received: by 2002:a05:6512:258a:b0:55f:71d2:e5b6 with SMTP id
 2adb3069b0e04-56262667e84mr4272953e87.30.1757509142550; Wed, 10 Sep 2025
 05:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250809-opz-audio-v2-0-f4fd15552a82@posteo.net> <20250809-opz-audio-v2-2-f4fd15552a82@posteo.net>
In-Reply-To: <20250809-opz-audio-v2-2-f4fd15552a82@posteo.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 10 Sep 2025 20:58:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v671xTaWkRD0xVPsgGWvykAwPESXuBLgDz-oo4ywOJ=5Xg@mail.gmail.com>
X-Gm-Features: Ac12FXzcg0HuLYsq4drjLq836L_aVuo4Ro9TH7Nv-ZbI1uV7AhXI1LYHqmezi8M
Message-ID: <CAGb2v671xTaWkRD0xVPsgGWvykAwPESXuBLgDz-oo4ywOJ=5Xg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: allwinner: orangepi-zero2: Add default
 audio routing
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_055907_282448_0A1BDF3F 
X-CRM114-Status: GOOD (  19.35  )
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

On Sun, Aug 10, 2025 at 12:18=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>


The subject is misleading. The Orange Pi Zero2 is a different board with
the H616 SoC.

ChenYu

> The Orange Pi Zero Plus 2 has the same pinout[1] as the Orange Pi
> Zero[2] (with the possible exception of line-out left/right being
> swapped), and the Orange Pi Zero Interface Board is sold[3] as
> compatible with both of them. We can thus use the same audio routing.
>
> [1]: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/de=
tails/Orange-Pi-Zero-Plus-2.html
> [2]: https://linux-sunxi.org/Xunlong_Orange_Pi_Zero#Expansion_Port
> [3]: https://orangepi.com/index.php?route=3Dproduct/product&product_id=3D=
871
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>
> v2:
> - new patch
> ---
>  .../boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts    | 14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts=
 b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> index 7a6444a10e2534458b7380882ea4fd42bd54fea8..97a3565ac7a819be6b18d324f=
a6f65d0d1d2b2ad 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> @@ -99,6 +99,20 @@ wifi_pwrseq: pwrseq {
>         };
>  };
>
> +/*
> + * Audio input/output is exposed on the 13-pin header and can't be used =
for
> + * anything else. However, adapter boards may use different audio routin=
g.
> + * - http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/d=
etails/Orange-Pi-Zero-Plus-2.html
> + * - Allwinner H3 Datasheet, section 3.1. Pin Characteristics
> + */
> +&codec {
> +       allwinner,audio-routing =3D
> +               "Line Out", "LINEOUT",
> +               "MIC1", "Mic",
> +               "Mic",  "MBIAS";
> +       status =3D "disabled";
> +};
> +
>  &de {
>         status =3D "okay";
>  };
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>
>
>

