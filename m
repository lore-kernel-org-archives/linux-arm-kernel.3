Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705ACD25042
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1n52GJUXMp/HKtmkEtsDqFReft0eMQBSrCUNh4f3w4M=; b=X0/4Hi5FX4fWxEOmhCAmrYQmY7
	e5TumlDOs5Hkq5Mbl4h3NEgAa4FVtxc09erB346sqyiyItcTfYfXXLNBcDzDefigWvqKl5NGfKlDa
	FTk9N/sDBPk1TxMdN6G9UIpIw4upU10VofgJ4mihqwCNDsIXSX+VmDHGqP0HcL6/86T/4ysTFqJ98
	IPaqyaE5Tcna752TXmH9GQmDuR6UxvGcdP7GV2sLEG94Emh5moDH5HkIntPU45WsfuQGSTGh6bBXd
	g2hGWr2loG7/kV8WIqI6EmbJLr95xbM000tlwBV7ex2Wi6Nc7IsXtrH9PIh6tEgH+HAYeHb4VQQfP
	5KHzMoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCXE-00000004uZZ-1iJQ;
	Mon, 12 Jan 2026 07:40:20 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCXA-00000004uYH-3JE8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:40:19 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-382f0732612so33427161fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768203614; x=1768808414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1n52GJUXMp/HKtmkEtsDqFReft0eMQBSrCUNh4f3w4M=;
        b=VXQI2hAJx1xz6+b12q8OgxZF137mdwJZU8OOJfDGR8masU1p/8IYptVj1m9Gl/oz/3
         GYr2GJpARijcptkTYLkykG1cAkj0eCHMyo754f6VVoMyuZdO4W1X7zqxcSRGkdsCd716
         2xWXchvjR++h1fOr7DId9s4+VDVXfMcTTaTr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203614; x=1768808414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1n52GJUXMp/HKtmkEtsDqFReft0eMQBSrCUNh4f3w4M=;
        b=Ax+ne9/IhD26pYlj2CMxBocW9ZThHF9iv9W3Rk3+qH6hIh8pxlDyPFNMyRZsSa8JNF
         yag9Cb8RLRgzTTSugWALpCoUqCERHtNv8bafYJ76jN6Zt/mFAFrgfb/B9wuwmKqzp1iK
         dYbmLdiqTZ8K6IgOduAZKpogAy6yyFnSKn8AwnsXROIHBPKutb3mIT8xpTLP6Rh7AuAv
         mO3p+FPI/iOPkEbBeW0e9bYhMsZbQneZ3+RV17NwjqmYpZxhXUbQUK5VOsLWHybNiijf
         XR6HV6fMU+LOLGe5dRBQ30QuPBR5c/ls6tD2DRcDLfcEfwyOzNFQ8JGlCUIE/m4YrsjU
         +ojg==
X-Forwarded-Encrypted: i=1; AJvYcCWhsL5VPdF2t9ub/3sy6esoscQoOB0GK7OkMqlJ5jhJ9G7o2U8nHCwuBj68PrVJZhG/pHt5x/T4VsuaCdlAI9l+@lists.infradead.org
X-Gm-Message-State: AOJu0Yza7khIZrgln5jCOFVsEb40wRtxfVJ9RIlx2Wib7ez3o0hzuzrY
	lzB3pRopHBgA9qEDNgGYDsu8x5GDHgQJPLcgtIPi543G/aTnZMWC/7MGx1RFen5zJNyF1cH6MBR
	inZjkIDZxUOKRtJkC4PhsWpitkLbwqpJRjK9YnHRx
X-Gm-Gg: AY/fxX6pP5nudL7jk1kNXmjr6E3msLlN1fP71bkNeWkj8yB+sfCEE2WGl5dUunsOrke
	BgZ+LUBD1Z9QMn8BVbcYb2NcEpDIeQ1eY397pu+PftHxwwFz33ejwk3gXvjyzvcogu2+AxUbjKk
	tYXBdFKAh9oWoXJUwoSQbYXdIaAIYw+0td2olhZyZ4C0uw1SvjhdafEgNGMZBtn+tGpsOb7GIPY
	Xo+DmUwlfKjJjHShx2pW7YknJzJ2iY7Y8bTTK2sDDo8yZTg/oNm3F9ri7t4l7NRWbtoHs/h4wcE
	iIU4eV19hyxiyGmFoyibwS5C
X-Google-Smtp-Source: AGHT+IHUZT28NEm0pfAfk51zPeTo+Gj4RHUge+kB6DYLCdNVFDgCN4Sz5SqqU/frHG9MN/FkGcGoa1cuyd/52Y4L5JA=
X-Received: by 2002:a05:651c:210f:b0:383:31cb:e3a8 with SMTP id
 38308e7fff4ca-38331cbe654mr19249041fa.40.1768203614432; Sun, 11 Jan 2026
 23:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:40:03 +0800
X-Gm-Features: AZwV_Qg9LwCLxMIXkGb-DD3-ik3Cc_aZ4i9dLvLfg60QSxVSU71EYiNaKoNhU6g
Message-ID: <CAGXv+5H3YLUahzOKP4qkUq=v9vz-uXv_0uOGSEsTKWgXoyUJ3w@mail.gmail.com>
Subject: Re: [PATCH 08/11] arm64: dts: mediatek: mt8173-elm: Fix dsi0 ports warning
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234016_867556_5CB1EBD9 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Since only a single port is present, remove the inner `ports`
> parent node and just declare the single port as `port`.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/bo=
ot/dts/mediatek/mt8173-elm.dtsi
> index 59813fff7833..dc064cdcedb5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -206,11 +206,9 @@ target: trip-point1 {
>
>  &dsi0 {
>         status =3D "okay";
> -       ports {
> -               port {
> -                       dsi0_out: endpoint {
> -                               remote-endpoint =3D <&ps8640_in>;
> -                       };

Nit: while at it you could add a new line here to separate the child node
from the properties, as per the dts coding style.

Either way,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +       port {
> +               dsi0_out: endpoint {
> +                       remote-endpoint =3D <&ps8640_in>;
>                 };
>         };
>  };
> --
> 2.52.0
>
>

