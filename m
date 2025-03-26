Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E479C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmOEoyHY2Ks0gUuytaK4wjrwLTqw4vCXipxUeutcC98=; b=FzMLkbghnbWYfF3nLfFKFQEcCn
	fFXbrWwiuw5Ld/aF3kqvQrGRXd+I5G9mgNeCtvZUTFr1KL5i1+Vd/j1z7940lNTcZu6QYsjaXHqyC
	Nk4w+1W/35VBo9vzOcll9+k4+701kfnbaeKG+Ma7ZYMDRM5pDlQMop0be6VoZ3JenWAvuvZF59cTn
	6+NKD+dSm3LDDv48mGKmJKVzEf2FAAhbeK+7/3OUHl3ZLkoFK+KDJvNTI3cRtM9bFyRpjDjmJBrst
	lhPfOUoOhpZ7vfju43zl6MZCIBccSPlzAQjt7oz2Oyrp8Ba2Zguq/YHS2fZMygKuHLRPP1/Fi6JML
	Tl0A/6hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txR5K-00000008b9Q-0Fxz;
	Wed, 26 Mar 2025 13:46:22 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQmZ-00000008Yxb-32zX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:27:01 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52403e39a23so6279167e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742995617; x=1743600417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmOEoyHY2Ks0gUuytaK4wjrwLTqw4vCXipxUeutcC98=;
        b=ma4vua2DHjRslsG8UpmDh1yP0RdE0AnAAgcTEurEa/VEWcNDjmK+9/4HSH3s0OYybl
         e2ZX1Ki1RfVW9zbVAJZvv/XZQ/xdda9yqXyMINh5TjLPYVaoZSHuduvurTaicZfJ7g8i
         2W6K5eZdArImLKOA7JwEHnB7/H75myUrytMP4oLqTXPoc+TDQSZmvPi4UrGCujz3aos+
         6VIddVCR31fAw0DxOX7TH5DHEYsnoY2BiQ9DrHWiJBM9KvqXHFy8uqnkmng4We6J9oUy
         w0eotqrWqb2aDUckfIZJUUdM62LgvGl5zMl2VOe1EndJQslIHDDXgDQxN23DIk0+B6Oi
         R16Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtLhSC2snwVLzUB1AdlMH/q5d5ZIRx95V5Cw7Iwz8Lov87xwNrI1xumxREy6w/aglZphBK2LBwPlPFnaywMJRN@lists.infradead.org
X-Gm-Message-State: AOJu0YwS4VPtvToecnGX53Re5aLEro51MignCsJsR5vrUpovLFxbuBTP
	1IX+16zhqVidJRHeXyGCt9h5Vv6JSnFKAsS5qvxhfeCfl6q14hJWqXYAqn2Jpho=
X-Gm-Gg: ASbGncsiQ1jqnllPPZKBL7XcXeoz/pA/hHMEfwdnmhF2jLHVC8Tl+DPtzZ6gbZPDecv
	112EiwaUl5CBA0ADm5YAxKIacxHC9Wa3ig73EYAB7chBO0B5d2V/IEkxMs45+2Z6Q0907PESchg
	QR8zP9UG4KvobvmIqrP16zJVAmaInHWn9BPNVwfYMJLbuNxPP8RjPpGlucfiwYZk3tZ4mdVCASi
	gQbUPwyhe8mYfbpyLAh6fDb9BgR3b6jx3tAMbIH8cR5WTvrKrIL0oHludwpUsjbteEZy2NUGyCb
	No2bZfFZBn/jeoEQz6LnMASrR3x4AoLgo1lLJX2adlcoMc0rKL2YKt1H3o8rEPZr/Habd9NZY6N
	/9GoJooQYpsYXXEizU3Hf1A==
X-Google-Smtp-Source: AGHT+IFHcgRf8ucZvjDwQ3w7HBu17oRojkEbUXhYorY1PJYMRVqny62dzqi09FVv9bvvTHiosZuzyQ==
X-Received: by 2002:a05:6122:d95:b0:520:63e6:79d1 with SMTP id 71dfb90a1353d-525a85412bcmr13127426e0c.10.1742995616732;
        Wed, 26 Mar 2025 06:26:56 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a766e5f2sm2222013e0c.40.2025.03.26.06.26.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:26:55 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-520847ad493so6523261e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:26:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKlMLrDoZMOC8dnTR1IG9O2JYSXaJT9wA+SSnQ5oKWKkEmXDTCc9PGjyQkYYUMBdI9qv99nCGkCitt/Y727tTn@lists.infradead.org
X-Received: by 2002:a05:6122:251b:b0:520:61ee:c7f9 with SMTP id
 71dfb90a1353d-525a84c5e96mr16364284e0c.7.1742995615066; Wed, 26 Mar 2025
 06:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com> <20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Mar 2025 14:26:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUNFo4pqbXh1xMatsv7T7cnq0SmDxM_o9em0=gpurdCA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo5c_rzCtK6r04J2m-KHiI22CUo11JxOin2-O__Lj4JFrTCJtdIWo19EQs
Message-ID: <CAMuHMdUUNFo4pqbXh1xMatsv7T7cnq0SmDxM_o9em0=gpurdCA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] thermal: renesas: rzg3s: Add thermal driver for
 the Renesas RZ/G3S SoC
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062659_780675_1524713E 
X-CRM114-Status: GOOD (  32.86  )
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

Hi Claudiu,

On Mon, 24 Mar 2025 at 14:57, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
> the junction temperature. The temperature is reported through a dedicated
> ADC channel. Add a driver for the Renesas RZ/G3S TSU.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - drop the runtime resume/suspend from rzg3s_thermal_get_temp(); this
>   is not needed as the temperature is read with ADC
> - opened the devres group id in rzg3s_thermal_probe() and rename
>   previsouly rzg3s_thermal_probe() to rzg3s_thermal_probe_helper(), to
>   have simpler code; this approach was suggested by Jonathan in [1];
>   as there is no positive feedback for the generic solution [2] this
>   looks currently the best approach

Thanks for the update!

> --- /dev/null
> +++ b/drivers/thermal/renesas/rzg3s_thermal.c

> +static int rzg3s_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +       struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
> +       int ts_code_ave = 0;
> +       int ret, val;
> +
> +       if (priv->mode != THERMAL_DEVICE_ENABLED)
> +               return -EAGAIN;
> +
> +       for (u8 i = 0; i < TSU_READ_STEPS; i++) {
> +               ret = iio_read_channel_raw(priv->channel, &val);
> +               if (ret < 0)
> +                       return ret;
> +
> +               ts_code_ave += val;
> +               /*
> +                * According to the HW manual (section 40.4.4 Procedure for Measuring the
> +                * Temperature) we need to wait here at leat 3us.
> +                */
> +               usleep_range(5, 10);
> +       }
> +
> +       ret = 0;
> +       ts_code_ave = DIV_ROUND_CLOSEST(MCELSIUS(ts_code_ave), TSU_READ_STEPS);
> +
> +       /*
> +        * According to the HW manual (section 40.4.4 Procedure for Measuring the Temperature)
> +        * the computation formula is as follows:
> +        *
> +        * Tj = (ts_code_ave - priv->calib1) * 165 / (priv->calib0 - priv->calib1) - 40
> +        *
> +        * Convert everything to mili Celsius before applying the formula to avoid

milli

> +        * losing precision.
> +        */
> +
> +       *temp = DIV_ROUND_CLOSEST((s64)(ts_code_ave - MCELSIUS(priv->calib1)) * MCELSIUS(165),
> +                                 MCELSIUS(priv->calib0 - priv->calib1)) - MCELSIUS(40);

This is a 64-by-32 division. When compile-testing on arm32:

rzg3s_thermal.c:(.text+0x330): undefined reference to `__aeabi_ldivmod'

> +
> +       /* Report it in mili degrees Celsius and round it up to 0.5 degrees Celsius. */

milli


> +       *temp = roundup(*temp, 500);
> +
> +       return ret;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

