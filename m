Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CD9CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 21:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=; b=pcZdgD2KxPDtAswUVimVnmw0rP
	ccMFR55rQYeocbDM/w1RPJrHQouJRI2TOTZI1I5Dw/KzMJX9oNEjliRuHtOXIku/isBHNlYunRgrs
	sr7rDBurNtAc2u9kaMWyjroV2WEctqt/EJatW447/88vXHrK8Jl/gBf6ArvQ0pB0voLA+ElPXKsHs
	FALWY7hUiVK7JeOa+s0bMzdW3Mf9v9hm+zIAkq7rI2daO91Dve6FRTKzN7BlyeAKVO2KmzOW1sDNm
	cFf1iVAfUddRJk/0yRkrEaJ3KhV6s6OZoYe2whQ6aFMiWkS8suD++UNhb6QlhSTzSaayEVcxvpyEY
	w31gc1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFewd-00000008Som-2nHm;
	Sat, 10 Oct 2026 21:49:31 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFewa-00000008So3-2Szf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 21:49:30 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67921b515a7so531377d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 14:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791668967; cv=none;
        d=google.com; s=arc-20260327;
        b=Ou+h+yfQmSzKnA1b1GyYslucg7vMUmzYtAOuL4YTleQXLEA3JTMNB0Im+9ilrJI3zt
         HfaPHlXyP4r8ekwhawjYkoZi3Rkgdn/R7ZKVCraFv7nXsI/Z19tZEvumQNDYUnBTiUUk
         Q/K/0at1bP34qFfonbSUsaX5xff4p9nWYpUEc10ok42AOpS9xBBvMcP/WZ7EVLiAAVBg
         DzKG8v2Q7j+aL421yN7CEG/VcM617Gw4LRHD5xTTwpYCHqvUwuTzG8QnAM0SVUzpqHtN
         oHHZ6khw4z4BU/mlImjAyapx/sKCtFgGa9SAwzKYjKwD0Fy7JTTqL3LNkdN3HRyagLGw
         YwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        fh=gEX527UaFpIE/V8kGlOWVv/p76JP3JtTV96r3P7WpOM=;
        b=s0+TntooWc0B/hZzUl4QKjrMR0hpXt9JB8F1cFfIgasdh/GsWP1D1TtCpx+yxhuuKR
         3VSHg7/xv3WNrbqVne8miT13FcCCY19Y4juAPpwk+8BENq1codZy5i7FV28uSVBt7HJt
         gB1usIuQAr+iZZuag2KcMqBZ6+x/i7WlpXdOsQzKR1YarV3rYo2G3TckOagiQYP14TXr
         S3I9+VvkZYrZVcNbWl7+cK/KVwozscWgXoPKR3ynKdw6Hkqh+66e4xRZ3BJgdNtQYG3f
         tqSWYfQRiHTbFdi+f0QsxZ/kd3GdLmUqzYkwDjTpEZKPpZotcSmNOJljKu7nnkj7hIcS
         OZZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791668967; x=1792273767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        b=TDpq895xFFqLnS+glWCa9hZlfkLYPD6xY9rZzVZVj2cH+sA760cXYZ3hQc18BjO0gy
         2l1EbjKSa1hjpYGtRIeA84cgUO2SJDiYvg9i6CW4qOoH4WgyjvTB2qaD4P5mt+lkx8fg
         cAvsrC630LCp3+lm7gfHLJ6TDiS0qj85PtuWOx38d/9G9A6A1JVXBcZIQUsLhT0Gytsd
         CXnuvgMauC3pdvoKIotGlL+yOT2b37RFZOqfuEMtBTM0uxYCqPoSZCNrzEuzM5fVNp5N
         B7qzvGsDZldYyWQJHIX2Z53Sxbjn/TxrhMcE8c7NJGW3gls6nDGHayANtl8fA0BVwbHS
         KPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791668967; x=1792273767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        b=u9aM0BZzIwxtL1gG8nnjbbmbBQNA2j0qOjZ3bh9hGQ3UnP/KzZyQWxJQj+5klQYgpn
         tiWWt/MAxl3zrzagPnKU+XxGYCIpzB8Vti95MKK7XiPbGUZD7nyqK2w7WVFZo/IrTUHp
         U4CmINRjLNAsl6itbS41wyAbvMTJe3CUfyRo7Tp+PBAH0ukq0Kdo8BubzGukd10nPIJ7
         8BREZ0JEIdtSh0znhzy9DKZhAY2/M528H7VITtl5kknBDxbwH3BjOIA97H9TW3nlSAgO
         Dzh/PG5r8h/cR9cYPOYN1X214+WDXXfv88Z//nIMft1TwFhgk80O0GydOOucge/bZ4fJ
         jGvA==
X-Forwarded-Encrypted: i=1; AKwUvBxAQJOfAHSW0rHyYuMh9JjAKxbkY+sbTR97EdZRoWyFa6ugv58h1bTfuxjkOvddVI7xyHVzCEsvD9fEC2FTS/fm@lists.infradead.org
X-Gm-Message-State: AFq9FYKRe4kWD0fkbJFfh0DKgVGt32NUSMYDg7KBTXIKiWy5JYInYN/3
	jCX+YLDQ5b5lFF2VrWDuYyjCu6UydXSIRmGdU2z/jRDbSpi4j2eLt3WRIyTezrkPVDFuC1IktqO
	guZbKwh4mWbwhAOzZQlqk+gQtsvgD3Rw=
X-Gm-Gg: AYBFou2uS5rl5C5Gmq2R3Tzh4dRMAPiwTJpOGdwhCFrHpseXiT7S3lWezVEqUQmTtMx
	LF0r/IIDZQo0wbu4oU9jj+wsgcKIxycFk7bOjbfBNDI8oCJXZryCRya4NZVW74M0rc8ebY/fSej
	O8Vj4d60lEZcUQrF54VJ98ow4qs6r0/mO2bodHwx8hoXJxNyGMvK6YDCE08ScxVdH/VaUPbCoZa
	rgjF+qqeWD6d18Q+aX865NAGAcFfjvi4BZeRnzvs1OdnKaQEvcGrKfIFHsgJjsKdPd9aDKOBLl3
	Tn1oOIDjmNPfjhYmV1eKMtX1fvf58rk0Y/vum3/dfFjGsP9MSjkM/is/VOuYKASyU8SILKoIykU
	U1ptg1f7k2LX8
X-Received: by 2002:a05:690e:5:b0:674:17ca:25dd with SMTP id
 956f58d0204a3-679362cb227mr1431918d50.78.1791668966625; Sat, 10 Oct 2026
 14:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-5-tanure@linux.com>
In-Reply-To: <20261010105900.247342-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Oct 2026 23:49:15 +0200
X-Gm-Features: AclHuK8jJjUAGUEE_RiHqUn3ZKgg7qAYmUp7tVzhoh46a9QNl3VNEK64s0Xinno
Message-ID: <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_144928_644599_205C19A3 
X-CRM114-Status: GOOD (  16.11  )
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

Hi Lucas,

$subject caught my eye because I didn't understand why there's a "T7
way" for adding RGMII delays since we should be following a standard.
Patch 8/8 in this series documents the standard. Can you please find a
more suitable $subject for this patch?

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
>  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>  {
>         u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_devi=
ce *pdev)
>         dwmac->dev =3D &pdev->dev;
>         dwmac->phy_mode =3D plat_dat->phy_interface;
>
> -       /* use 2ns as fallback since this value was previously hardcoded =
*/
> -       if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns"=
,
> -                                &dwmac->tx_delay_ns))
> -               dwmac->tx_delay_ns =3D 2;
The 2ns default value in case "amlogic,tx-delay-ns" is absent hasn't
been necessary since commit 093d23db4fff ("ARM64: dts: amlogic: add
the ethernet TX delay configuration").
That commit is part of v4.12. So boards using RGMII and a .dtb without
that property haven't been updated in more than 9 years.

[...]
> -       ret =3D meson8b_init_rgmii_delays(dwmac);
> +       if (dwmac->data->mac_applies_dt_delays)
> +               ret =3D meson_dwmac_init_dt_delays(dwmac, plat_dat);
> +       else
> +               ret =3D meson8b_init_rgmii_delays(dwmac);
From the discussion in v2 I couldn't understand the overall way forward.
I get that new compatible strings should not rely on old, incorrect
behavior. But what's the path forward for the other SoCs?

[...]
>  static const struct meson8b_dwmac_data meson_t7_dwmac_data =3D {
>         .set_phy_mode =3D meson_axg_set_phy_mode,
> -       .has_prg_eth1_rgmii_rx_delay =3D true,
>         .has_pipeline_clk =3D true,
> +       .mac_applies_dt_delays =3D true,
This should be a callback function pointer (apply_delays or similar,
to match set_phy_mode) unless there's a way to make older SoCs also
follow the "correct" RGMII delay specification.


Best regards,
Martin

