Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F28CD41C1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsAQFyywzgQt8hTuOma0wGcWOIPVIjI9LIgrRTCikK4=; b=Th4peW2exhhwDZjsBT+wvGjohr
	dyVAv+hERqkdBSi3a4SUA4E3ctrOgXWvAe5N150+PcInMBdIPstri6DhpA0w+1lU5SGTxQAeyQ5TU
	IRMBTR4lGeQtQ3su5RTorGMLuwHeXM8/oPnabGrsJxncl407etg4CdhaXqWbtIVHEWsPktSRFb1XN
	Lnw1ABOf83S7VngoQcIEWo23APbBjVI4YqIYMG7yYdXA5FJKVYbYBdgrHsnGrikIiyOkU0DVyExt/
	kaoj5BWLYA4gtobwxLBNUXRSfW3wUWN8pXWArKMI2b1VDKTr2d9EiBaEZIWnpVuG0Qz2uYrYyrVxN
	v1bCHyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeuM-0000000GXWc-1nJv;
	Thu, 11 Dec 2025 11:32:30 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeuK-0000000GXVd-1dac
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:32:29 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-78e2fe1f568so2289437b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765452747; x=1766057547; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tsAQFyywzgQt8hTuOma0wGcWOIPVIjI9LIgrRTCikK4=;
        b=YtOmGhWVqBFQu6mQZfHyRoMQhHepW21Xf6r1SxmuSOn2xACsfsBA3+TRtjv24+VEJR
         mXIgHp8iXk/Cntx4rBmeMLe/a/GylyYRSuFZF2kvlZfFGU/GSysSV5lUYYWRumVTtmeD
         G11RaVKa3QoWK8eDD3+VIrYOS9VlJdk358y20ZGIME0/MUzaqKCnbXWRRlPCA08UUKEW
         +16dGoMep0RJEpr/WMTd+D1Baa7njmVCu5Xv2tKMfXkS4otUL8+dWkhHSuTzUIZMSacS
         toDdIJd8ZQZM0LSwN95d6joZvvCC3PpEFmDh2n/QtpxBt5o2jrAF/kix7kJgkHu3b2FU
         JX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765452747; x=1766057547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsAQFyywzgQt8hTuOma0wGcWOIPVIjI9LIgrRTCikK4=;
        b=usDZ7BnUFYDBZlQYRXPZNb9G30nJvf4X6RMF2N9chj0biO1Tcz9O0lm0NF8Q+tBNfC
         6ujj08uyl6OfV4qedOgs7bBXgkCNOwrlC5gAbd75Fr5aPj3k+SBfEuTBIiXlCePl3IRB
         gxM7Jz/0FJJqGLP5MnYrkFJDcCYn7vvM7aMGjlv5qXMEhLIKYylw7w1uhU7MlgUH9/Or
         0ICYV3Q02hIsnTCWeILYXR6wg7BaseGrYqUQ6XNiguq6qrudTgDAlCXALjFOOHWiqKUt
         URVuvg4Ymk0ErQRm0nv4rMq61dkdHnDkR9BTHVHDEE+IGiupnb7dcRLQuA2imXC9XTDM
         mKsw==
X-Forwarded-Encrypted: i=1; AJvYcCXERogZQ+p2owXX5JpxMMtM9yiV3bmCvR4kTeDWfRnNJnWBm0a1LISXzypE60hDkVR+zPVGx5zfhD9hdje3p2Aj@lists.infradead.org
X-Gm-Message-State: AOJu0YxWvRMPwvlOH+/tNHoj6j7cAH7O4oHL6IExgNAGoH6cTS0B+wyF
	4YJnJOimNB8d/dQMbEhVd4Q3ad5Ro+kfFBl9oJjd+gZ6zN679Gh7Bop6LT3AIk+lRshqtycpW+1
	50XOZC8tCO0th1RMbA5AkaryBlfSSZEjkhAU3lqOzdhKoX+otve6W
X-Gm-Gg: AY/fxX6EWUYN7rkzDzVDBAQOJj1sSFPnPhcMmQIXgHDakfYyUlnNYhco0LaTehp/z5D
	EaZnfPkahbJqXUgEsI2M4rqF0U/CuVIH5taDNVcwsvdLuJuQXGJzMfuzVM6i5rcTUlDcYpUPkw4
	qWperVcMGAjwO7IyDblq8nxeaMfuVgxT3x/UbCjxqbJqH/oU4LKi25yYoYo/8JG9ZV2i9DYml2b
	5JlTYmi3Ieet5Tq573DO7pjvaMuourmPxWt7hrAVoPkghOiSjH73fAV3Buvl6EHYmL4t3G6f8sp
	esegAJg=
X-Google-Smtp-Source: AGHT+IGi8FI7tue2F1muYiYdXCcwa1VCSq2fLFaLgh7A0p4DE+EvhP5UsxEj9lkt3uuk+LvjC2KVDNW0gmzNrvJK74w=
X-Received: by 2002:a05:690c:45c5:b0:787:bf16:d489 with SMTP id
 00721157ae682-78ca64495eamr51688117b3.62.1765452747098; Thu, 11 Dec 2025
 03:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-8-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-8-21b18b9ada77@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Dec 2025 12:31:50 +0100
X-Gm-Features: AQt7F2pk6E2fyrBRST0HoIuBOhvmNQUfLJiP182o7R-P0Ig55Fk3IUyQwfYuHbU
Message-ID: <CAPDyKFpQXYFFrZ-unVxa9m2+tKLEyFZyo7Tv7JD_7vTbqqfmDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 08/16] ARM: dts: aspeed: Use specified wp-inverted
 property for AST2600 EVB
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033228_447150_CDB933BF 
X-CRM114-Status: GOOD (  14.64  )
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

On Thu, 11 Dec 2025 at 09:47, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> While sdhci-pltfm supports sdhci,wp-inverted, it also supports
> the un-prefixed and specified wp-inverted property. Switch the EVB
> devicetree to use the specified property to remove warnings when
> checking the DTB.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

FWIW:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>


> ---
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> index 3eba676e57f1..c51977dcb56b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> @@ -315,7 +315,7 @@ &sdhci0 {
>         bus-width = <4>;
>         max-frequency = <100000000>;
>         sdhci-caps-mask = <0x7 0x0>;
> -       sdhci,wp-inverted;
> +       wp-inverted;
>         vmmc-supply = <&vcc_sdhci0>;
>         vqmmc-supply = <&vccq_sdhci0>;
>         clk-phase-sd-hs = <7>, <200>;
> @@ -326,7 +326,7 @@ &sdhci1 {
>         bus-width = <4>;
>         max-frequency = <100000000>;
>         sdhci-caps-mask = <0x7 0x0>;
> -       sdhci,wp-inverted;
> +       wp-inverted;
>         vmmc-supply = <&vcc_sdhci1>;
>         vqmmc-supply = <&vccq_sdhci1>;
>         clk-phase-sd-hs = <7>, <200>;
>
> --
> 2.47.3
>
>

