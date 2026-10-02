Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888ECCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=; b=pGZ3REU/r3IOz/NF9oL11R5q1Y
	fLG6TjqL+WpAREt/twvCKF3pnkMaJ/KaqQPp5Bow0CEV8lVCU+vccRLvBm6P0xNgi3TGlaR2xIUaq
	g9ySkLd5WkKkWRf6SK8Z6tgeFljF5LQEq7BqlZKDurmt7XKqIt2D+It5CDg6qWSAK9/Rzdkp5ZHBw
	NtspBo57Yx6POxF5pih94Ly9lCUlDxeP9thCAp/pCEqeap9/KLBXkKUzwyBoPvfqOsy3x7RNeUCRp
	pfisQsySE4HkueRsjBmtZua515KlhoTuSdnbYtI4ocLDyM5pGHJqzbIvEDAeqS97w2Q5WLn7KkxaP
	QHXem1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeKQ-0000000BmqQ-27PJ;
	Fri, 02 Oct 2026 14:33:38 +0000
Received: from mail-vs2-x27.google.com ([2a00:1450:4864:3a::27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeKN-0000000BmpZ-3y18
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:33:37 +0000
Received: by mail-vs2-x27.google.com with SMTP id ada2fe7eead31-7c1b1ae8523so153391137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 07:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951614; cv=none;
        d=google.com; s=arc-20260327;
        b=VzrQgic+URgQkfLobnqiQTvTr1dPbxdvArDc/YZ2N1Rr74qBwQeLBC0HvJH7lmQ+mz
         OjtAHCd6J1PgCaMokYrqKgvSJjt4+3AH8HI16qPGUsuZQ1sUhhktSyXpdaCYQzRAlXEA
         t/GfjKCMygC43Us7mVhZFFRkqsuQps3nT0SyDktoMcS/fLVhw0y8atRTj7ljFizSy43/
         4UK+THrKACsal1qKZXVvG9Ve+E2WZEknrO0/kZoYADFAd9rtfLKdUEnazRw6y+hrfD57
         ted4deePhKEe0rGmCRDHOJBsHHQ4M1xBs39X0WXT9aFs0k06AJuc5ScgsjAyUMZr6oxW
         G3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        fh=kl9kaqFyLtppEda5AqNT6cgT/BNEMA5gnY3JAJ07Kpc=;
        b=O9S2/TPgwg30sMJsRxykYU7fUHcLgvhXOIwURna24sg+9JroaBtogitLNgMrptXMai
         ME5bIkwfojmTUpwyBvckmQCP3MfnuWLinD4uc16e/rUG8TcMllqPTyrNlmsG/rUJEPG4
         Df1BhLgI/BqWy0C0GCoJPn851QDDLV4XXJ/ovKQetpHfJex+21JUGKVB68TfB+mq+9kr
         PNAJHNAijkJUiiTig9UhT9jdhlHETjt2otwh50SHkMF3LbJ6QXFPEvWHtK9yVyPuuHLy
         i0+0WmEVRLorSkYoeEWpxw75I+zuN/jFMi6G9MyxdDyPEnOgmCE3w6GiRXkY9pnxWm2u
         zzoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951614; x=1791556414; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        b=FLGSyZa1FDQ7wxtgn3wXpKBA4FZkHBh5PQnCy8vVYej2Ipu35nNvVYtfMDUCWOc6MO
         u51HC/vBMYDMOzv2UClyQnO4WnnxzNMt+rxpjKUeNJfCW1UOTGq2U1+MkmjyHgoR52FJ
         MmI8D4/0INCTnqfEJ1288DRFwIfiXmUBa9ptQLPV9Jq288CN+75NhHtU3Z/0Xoklphdi
         +TA9Drca1nBw733DTNUR9IkmmA2pzthcN0vLXHUZ4a817ZDA4YYiOnimlxRqPvEGc40o
         g2p6pjQ6+63AOrd+gpHswgaiq7j/qrsaoqqGEbJYefxqtgnB5xsljidE9yCCiHmSeLGS
         voAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951614; x=1791556414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        b=woO29WzEYmBYl/ExA90cJWoRepHQGASJetzmA4tG5Ppy9DShZAfb5x8/Jeg+K23lQ/
         +1rupAz+5J7CgvCbHj8f2k/UZuolk8UZYRa6dsFYUIFFgNvuEUhGNETpUPv7BUkx4m2L
         4USufUh9e2k1BisUatmXvR0GSprL3Yio4iFmsgey1TcmZVwDDAb3pwxTFMLf675rHgoS
         a4JAmO4lIqeLqMOUehQELOyxk4+zZtlJqbobE42NuEDza32uKmAt5+jgzUj1vtr7rPod
         jW2EjQZXTHP56rh+2aVmh1emIt9XjiuY+MGB6ZB1eFSkQGwaoXfztH4odBQBNnkMQIZ+
         qJWQ==
X-Forwarded-Encrypted: i=1; AKwUvByqTc0QigIbVNmjYrpqW41CRInYXWhfl0bzPq9nlPhZZOwFVI+c+DCDYBKuLzXVWxyqx+caZEZxs2s9bSB6Cb5j@lists.infradead.org
X-Gm-Message-State: AFq9FYJKTG5er0fkomfQ6SwfUDWviHVnu82rNehG+UfWpsmw4baZs1rC
	y96tLsLmuy90x8qo2Lca5mZ31FoVEUxaydA1X4sQbl11fFCV3W2TuKi988l1NK2hQeA9O8aEo9N
	VilGjB3P10BN1dMzsVneF6gIcsuh3/Pfqm4nXgO7zrw==
X-Gm-Gg: AYBFou1G/RHgQc/HsDWZysgXVNxBGXDlm9eZTu4yu4eS9VgHK0ciOEUa5IEEQ3cBrpY
	T67hvhXQS5aXEOkZdE5o44oyJZX+tEkt8siUdmvHIiwxpfWgx/fOWxzHLixwlCUE6maTp5KuDkO
	c7MfXzdFd6DwTJEsQGDsO3uooA49svBQpa713ciNY34OpkfMTUOIlp5EoCiaeh9+BS5l9rqlqWb
	2oS0nEZAuqaObynzWiCWAENeMqZO1tWVxw5VXgzCThS/GCyDMbZ8NfN4TDhy0WE5QmWazuwNQJ3
	2Qe9uYprHI4Sb4GzpLIdkKV+usiytWkV6ZO8AqXJoSOMEeIutNXsDHw30iUVDX+NKJ+ROsGPLip
	ZoeOrCvxM4nx/2g==
X-Received: by 2002:a05:6102:6444:b0:7ba:ea54:65a9 with SMTP id
 ada2fe7eead31-7c0f42731b5mr647395137.6.1790951614035; Fri, 02 Oct 2026
 07:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org> <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:33:20 +0100
X-Gm-Features: AclHuK_nlsYCw4TsUB6KsMMTGZlzaoT0nlgKI-1tdzuxscLcNJSDMijcKeaoSvg
Message-ID: <CADrjBPpXvW1RVGC=mTO9sQncS3w4zAMKekwVa7Vbrq5OszJMwg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: exynos850-e850-96: add soc thermistor node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_073336_003157_B68DA3FE 
X-CRM114-Status: GOOD (  19.19  )
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

On Thu, 1 Oct 2026 at 04:09, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
> near the SoC package die and connected to channel 0 of the CMGP ADC.
>
> Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
> add the board-level thermistor node linked to channel 0 of exynos_adc.
> Regulator is represented as a dummy one because we lack PMIC support and
> should be replaced with a real one when PMIC support will be implemented.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> index afef32ad4ee2..1abae8b9fa49 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> @@ -126,6 +126,14 @@ reg_dummy: regulator-0 {
>                 regulator-name = "dummy_reg";
>         };
>
> +       /* TODO: Remove this once PMIC is implemented  */
> +       vdd_1v8_dummy: regulator-1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vdd_1v8_dummy";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +       };
> +
>         reg_usb_host_vbus: regulator-1 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "usb_host_vbus";
> @@ -166,6 +174,20 @@ rtcclk: clock-rtcclk {
>                 #clock-cells = <0>;
>                 clock-frequency = <32768>;
>         };
> +
> +       thermistor-soc {
> +               compatible = "murata,ncp03wf104";
> +               pullup-uv = <1800000>;
> +               pullup-ohm = <100000>;
> +               pulldown-ohm = <0>;
> +               io-channels = <&exynos_adc 0>;
> +               #thermal-sensor-cells = <0>;
> +       };
> +};
> +
> +&exynos_adc {
> +       status = "okay";
> +       vdd-supply = <&vdd_1v8_dummy>;
>  };
>
>  &cmu_hsi {
>
> --
> 2.51.0
>

