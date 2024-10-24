Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322FDD0BB5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 04:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXHBkD5lHjgDpSqAIuvzM4kWXZrUfO6y78LQBr3izWA=; b=J4squosOGDzXYrecVxnm4RAlRy
	X1KUg/ANbjoGHet3mN27a13ruYs5IS9tzU9i1Ya7LqJp2mSawTa8Iz4AlbCr3919tJ9ZcUMVlI/zV
	1VtcyqFbXkC8kULmYaJlRVlYrISHIgUdkF5Fontu/+MPEeCxi6xe00WKfGNtobDyX2/B4EBXPC/KL
	uwDFVQVZE/gdeuNvyLTiQNT7598HRBwo2HUqTOE7qZpaxw/rX/Ba0JUU95CIYSO1MJpG8T4opgDc3
	cLK36SantlXz3KFHRaNFevY/DG851yK4UyOu4lP9oNebMCqv7tIuo8luwLVBgIpO3X6mMvKnqnm56
	MWgld5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3pXR-0000000GiKm-2bSU;
	Thu, 24 Oct 2024 04:33:33 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3pVu-0000000GiAz-0qPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 04:31:59 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539eb97f26aso385572e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 21:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729744315; x=1730349115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXHBkD5lHjgDpSqAIuvzM4kWXZrUfO6y78LQBr3izWA=;
        b=U5Qe312nsHE00K20pJ97pYCt04LntAniRWWKT9zMwy3EAOQowXeBR5EkTb2YkYARh6
         AbR5SN3whNzObCYHHT/MFqpZa3/YIgy68/d1RhoqFkf8pLEZNamiJNRLDGl/eyV6rBM+
         pmMkb3Uo8GDwKs/AlXRHFw1nPgY/UaDUlDGCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729744315; x=1730349115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXHBkD5lHjgDpSqAIuvzM4kWXZrUfO6y78LQBr3izWA=;
        b=RUjtiN9G0Hi/gzuY/xvTLP3jbbJ+TddktXaoY5zmyVFzNmput4e8fc3xyx7BzUJwkj
         wjXzrTma7qqlw8W2gMXZYzfCb2+EczOzVowJIxezC8WdQCUZqdz8L5JmmntkM7rAkhno
         uPJrcfxmz1NQdEp0hygKdxnky0QUeORPydLXvm5W5+TtjH8j32RuBAfROlttzFRkzXSa
         46Cs3wLuJFHGIDSWROUQJuNW9TRTfB4dNlfeP8K1cLC1NgscT0EV9bpm5JXm+6mithTz
         ajXUPAEBNjL2WyXNCbmWmXL1dtl/p5Co+JyJVZpircg4Lk5jsALkRODwnypa0rrovgd6
         U6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjgh29dz1qsB3k3M7Y2vhfJWMID2SO9CdN+4wkc62IOrZNdg9QiAq7Gfo9w/qddgSkiH+vtkosRxzhO0YP+bMT@lists.infradead.org
X-Gm-Message-State: AOJu0YykIol+HeIjCTq8JjIaqczneT7U+4xiMZ1vr/tXFBIIyGVOyLLo
	En9ziHInxcx6pWUA4+wQjDAPWVEK6F/9PinW1n2cZdiJa7ulsvYWVhgEUcrFbptcQcc2rqQT7jB
	mEvkEcOLioKx1gxQ+DLrVAy2/nMKPz+gKnxK7
X-Google-Smtp-Source: AGHT+IHXDBEMaX7ic839HhtSb4X50NJuUWp4GLOIZefhwLSR4kBcZE77mUD9AbXS9mfI98mMdm40M834lvETM/6lm2k=
X-Received: by 2002:a05:6512:3a83:b0:53a:1a81:f006 with SMTP id
 2adb3069b0e04-53b1a34084dmr2238654e87.31.1729744315273; Wed, 23 Oct 2024
 21:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240702145102.46953-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240702145102.46953-1-krzysztof.kozlowski@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Oct 2024 12:31:43 +0800
Message-ID: <CAGXv+5HSZfr14K1sGky4g9Sik987DAisH7KTZn9v_svOwF+y6A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui: align thermal node
 names with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_213158_289825_19C810E7 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, Jul 2, 2024 at 10:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Bindings expect thermal zones node name to follow certain pattern.
> This fixes dtbs_check warning:
>
>   mt8183-kukui-jacuzzi-burnet.dtb: thermal-zones: 'tboard1', 'tboard2'
>     do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-therm=
al$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

This seems to have been sitting for a long time. Angelo, can you pick it up=
?


> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 6345e969efae..3aea2643f21c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -974,13 +974,13 @@ &ssusb {
>  };
>
>  &thermal_zones {
> -       tboard1 {
> +       tboard1-thermal {
>                 polling-delay =3D <1000>; /* milliseconds */
>                 polling-delay-passive =3D <0>; /* milliseconds */
>                 thermal-sensors =3D <&tboard_thermistor1>;
>         };
>
> -       tboard2 {
> +       tboard2-thermal {
>                 polling-delay =3D <1000>; /* milliseconds */
>                 polling-delay-passive =3D <0>; /* milliseconds */
>                 thermal-sensors =3D <&tboard_thermistor2>;
> --
> 2.43.0
>
>

