Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B831E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2vh/xwZF5apT8bu19SqSmXzYYa1+FrHmeqyI4yFkWo=; b=sbvno/CTHqBq2LXZavDYn1DOzy
	J2Qj1mHs62IziOSuwYaYdTkXkIyT4It7EchEety04JyDqaRNM+a7Urkr5cFZTmsZPvh2ppWW71wVv
	J1TaocqOwaqlXQK2u6wfKNr5E4HG6O1QgQJsnGOgEE7PLmWd2e3ukxkKlCbha9eeOf6AsZSz4ujXv
	o4O+BHxqHoHBQE9b/Fj1Y8y1ZL9U9uFITfCmg5eNiXf+CZfLiA00m/MUOIwTHcJP2+SoMPCFlEccS
	sElpGwLRPo5w9y1a/MxUVcDybW2jDSU2akvpPk5DH5/UmCq7TStVOOiqUOmF69uP4NIt/xR6Tk1DI
	/lNJSPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNt1l-0000000Ga6v-3CI9;
	Wed, 18 Dec 2024 12:19:45 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNszf-0000000GZaX-1ihv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:17:36 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-71e3005916aso1150326a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 04:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524254; x=1735129054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2vh/xwZF5apT8bu19SqSmXzYYa1+FrHmeqyI4yFkWo=;
        b=hBznnG/v2mIBuskqn5SR+udcalYOGo9ZhJg1rDvU2omVpWARu1S9Tid/HT4WLU9k/5
         GYqEux2Jx2pz0Kc0wuoNeBYFZJgtWr/RVihhnRLP7mt2FhUWneKE8hyEjEAKktXkrLIm
         93BiWwdZFRUiZxV0JDNq5I/vpxvGmR3xDbXbUig5b/hJgt8oE2IrHOtEDyaMpBXsdrIW
         wFWKXAbJsQjUeLl08n3jYtCjvohcka5RPGCTh3O3X+yjWk+g0tSvaDTq2QrY8+9crwIw
         tw2/GImBAqh+b3be6GJwBGmBrling1pp9nepBY2Q+HnGbDN12oqcKfw5KXeC+XCcQmzz
         upGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524254; x=1735129054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2vh/xwZF5apT8bu19SqSmXzYYa1+FrHmeqyI4yFkWo=;
        b=vT5i/vTPm/aDt2MXs33EUk8GZoNGpptAbGv7pCTzTb7vDBC8I4Gt+F+JssiQ+QqlvL
         E54+hKjaaDuuNnyEerDgyAjZ9O2Zb8DFRSVkRzzFI2uPuNNGh/06C1K+xMMRp9kzmFl4
         +BtrWBt0k4wnfX9Lbimt68MST/YEC01+1eavZkac7eWLhObyFoIbLlP++/bAvVopebCA
         EIJA6JfCQ1gNR1LK13VvjaS7X2XjFm2pGW5XyY6FDNbML45SUHBoYAmyroUPjmQVCx2s
         UaAMLtX75svFa5l/gTMpvoT3gWrYVHpC1A5zWOi1IGG3DHea9YwP63lW+PcUK5k8vUl2
         G9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl65f6cpic2Gd8mgIWIeBbdocalx8K7d+6O1YveeZkBNAYypDV+akw+6w3dAZStON7QxHfaduswP5AK8tLMYUA@lists.infradead.org
X-Gm-Message-State: AOJu0YyGhp1hsu61kBXhp01MLY+s2DVblKN36aRpWGC7UNWOOp8HzgNA
	sokI+sfUT6xSroEKX28idrdYp6DzoGU4wV4CQpTulqdWrUGqhN7kUWgMoNCrXZw5E/2xPUF70i1
	RJd9Ua25lxGLCmDD/bJLA3GLd15o36qjP9jjR0Q==
X-Gm-Gg: ASbGnctESrPU/J81sIB4Dy85AZ+vEjq8dyk1GQsH5OkxHEnGFArUI9Z7gmKXZtcbbYs
	gUBseIFyUUWWdQaoxUkPKieJDNyHyKhEIhjcKrhA=
X-Google-Smtp-Source: AGHT+IEojA6LnlTVG9PHZZVxfH/TlVwW+tBtuepHbLJd8n0q39aSKwMleaTiWWO3skHqftkc2ID9Y5fPiPCYVBpN7G4=
X-Received: by 2002:a05:6830:6e83:b0:718:7c3:f86a with SMTP id
 46e09a7af769-71fb75731acmr1512698a34.6.1734524254625; Wed, 18 Dec 2024
 04:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org> <20241216-gs101-simplefb-v1-2-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-2-8ccad1830281@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 12:17:23 +0000
Message-ID: <CADrjBPq4hH+kiuObXCkJXf6Ft-zEDnSVM5HuYNd=xMvaLicryg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_041735_445534_7D993085 
X-CRM114-Status: GOOD (  11.57  )
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

Hi Andre

On Mon, 16 Dec 2024 at 13:06, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The bootloader configures the display hardware for a framebuffer at the
> given address, let's add a simple-framebuffer node here until we get a
> proper DRM driver.
>
> This has several benefits since it's an OLED display:
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested on Oriole device, with latest initramfs and framebuffer was function=
al.

regards,

Peter

