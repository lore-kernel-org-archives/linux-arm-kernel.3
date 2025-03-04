Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CB0C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vi0p/lSlr77GGvcvyCiPXso/onreQjLMG5o3KFIfYA=; b=23bjl50JsYzyJKPjaK8ZpsQKA1
	oaWsHAkrQlmeIOEbtjMg4HVabrcb+okJueUJnkdprHbhzBHHHnx5yTnNTsd5HIEf7k3SF1po2RmxT
	nP6OWrsS9r0jhs1CgEuwfLMjFXhaKeQiVTWBNbQ689yhgShII0qL0GKaWQS8SiD9ta8cVd7rigEcO
	V9a/3sywsLvVBZ/Z4BXV/xIvPnMHEi2sSK1EMf/igHVY5LTZtiluANdJ0XwLg7YL9Q7XiqFlNz46+
	JDpI5a4JHVh8jaSoawlhr6SeJf58J5NtvjyDWCaKqOAVrL4XGcn2Ckje2lfWb6FXQ/hVfN9ZStc9c
	tM0ehf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4l-00000004WaQ-2BXo;
	Tue, 04 Mar 2025 12:08:43 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPlt-00000004FO2-3jg8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:45:11 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-549644ae382so2618846e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741085108; x=1741689908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vi0p/lSlr77GGvcvyCiPXso/onreQjLMG5o3KFIfYA=;
        b=vemlhNt7sV+ikwUskRO+GFN1w0bQ7EQTAL5AXQOguwIzoLIMUwKyaOSQNNDPGO6l5J
         6djxR3E1UavVU+tOJRpK5s8XCZwusUVUeV4I8o+tL8+JYc9GCj6gWveJOFhoURvhd3WZ
         KMSZoTH8rRp+hnG2RIxy2HpF/wW4O+D31cngiNeo/7UaiSDucZbW6+1Y7/JavlDJU8fs
         9IiEep7umo7Ic3ivmIYZPOzUUK1SkvuHAVR8nphg3e4FnO+4oepkZ77YJVbyipA6CFy5
         Bwmz9qXNWBJhaUrPtbVeLt03YVGYLd8SzyzxSeJvAj1fOPWSOJQ3BXfyrDD160Cr5XR8
         3xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085108; x=1741689908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vi0p/lSlr77GGvcvyCiPXso/onreQjLMG5o3KFIfYA=;
        b=LnYII7t/BolTGbEPh86I6fAcqFhhAkHiyD5QPQ6tPgnLZR0uM9P6NPgtdWZXLtwLnt
         mqD0LA3Ew1cFSbmL4wbYFg7oHzPk/cj+R8RL+RSDpesKZd+0zhfOeNq87bXhqQT19tIB
         8+EedH70tocVfVCZVOrFPUfHvIxAEfFipuOCgzPlALKObpqG1kgo5zmgS4Lmz/R0ANIs
         nuA8ybFVD5U+1jR7WIO7Pzs46DTfz5vUVwVTJ0ZuwiGfJTSEw5JsQADhOQrlOKCtcg/Y
         EDJIVK/kgGDgOS7Zfb/24OwxuT5M6GSDLTi4IcHFLSz3YgcESXX7Gw7AooaE7moxCiAj
         z8gw==
X-Forwarded-Encrypted: i=1; AJvYcCVqCE4mdTFZXWVFdg3ynWFbp5cgEHvVenz2kIbkI0FSirfNcwQI5v4wBmB9slJhPW/BRHxkTZ1tcv51sD8W0RoF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi2ZiZiqtqwhcxqHz1llSyroVA6HK17jq7feYpmA40sreg2e4s
	7VTza8cs8b2A2RS456UVoJ55sZqZFGybWSUBVAyLTyGyi8SzlyGc9levBFuNvJ954rzOsNRWXlv
	CUnTGrKKF573toASAty/oNXVzpj3N63+RCTtuew==
X-Gm-Gg: ASbGnctfWJUYVtLEZz9mhHjUO28dnyNlZbZra1eCkFZM2orS3PGvHPAWLXG3tJ+imJT
	POg0ywD1fZDIKN9VRg4F/DAwd32OPZroO+KZz6UoGXYKuUhnA+jx3BlpPhN0+Kyo5rUdOzfmveo
	seff4NLaslhp9tsfDPPcLnjW710FWWdyeRMWsWFwMG/IftS/mCP8SgBjzh/A==
X-Google-Smtp-Source: AGHT+IH4X+TpSlMA4OP1Ri68DCSx1TmLB0cOv2GgNnPst8yTPeOn4g8rSBM21Ook7Y/aVoCTILVcp/FsWwJbq4fqHgw=
X-Received: by 2002:a05:6512:3b99:b0:545:3037:a73a with SMTP id
 2adb3069b0e04-5494c31b22cmr5968515e87.13.1741085108012; Tue, 04 Mar 2025
 02:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-4-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-4-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:44:57 +0100
X-Gm-Features: AQ5f1JoodYhnRZ12dEFSOR0LjSnLM_w4iJYBs7Z8uhMPMXJfplIc7w2hgDO3Mlo
Message-ID: <CAMRc=Mc3GkM1aoDnNgGLBH7rzOxyCZcu23MspdCC0gMm9f=_=w@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024509_935942_E3880549 
X-CRM114-Status: GOOD (  27.52  )
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

On Mon, Mar 3, 2025 at 9:41=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The Speyside ASoC uses a single GPIO from the WM8996
> that we can provide from the local offset on that chip
> rather than from the global GPIO numberspace as is being
> done currently.
>
> The offset 2 was done by calculating the base offset
> for the CODEC (i.e. wm8996) GPIOs to 212, by reading
> arch/arm/mach-s3c/gpio-samsung-s3c64xx.h and
> arch/arm/mach-s3c/crag6410.h and adding up all the
> offsets that were occasionally adding a +1 blank GPIO
> between each GPIO provider.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  sound/soc/samsung/speyside.c | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
> index 79476e8eb680984434a1198ff691ddd4b9fe07c1..947b85ff83f036a0814fd477f=
5f6f69253a2a2d8 100644
> --- a/sound/soc/samsung/speyside.c
> +++ b/sound/soc/samsung/speyside.c
> @@ -7,13 +7,13 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm8996.h"
>  #include "../codecs/wm9081.h"
>
> -#define WM8996_HPSEL_GPIO 214
>  #define MCLK_AUDIO_RATE (512 * 48000)
>
>  static int speyside_set_bias_level(struct snd_soc_card *card,
> @@ -105,6 +105,7 @@ static struct snd_soc_jack_pin speyside_headset_pins[=
] =3D {
>         },
>  };
>
> +static struct gpio_desc *speyside_hpsel_gpio;
>  /* Default the headphone selection to active high */
>  static int speyside_jack_polarity;
>
> @@ -123,7 +124,7 @@ static void speyside_set_polarity(struct snd_soc_comp=
onent *component,
>                                   int polarity)
>  {
>         speyside_jack_polarity =3D !polarity;
> -       gpio_direction_output(WM8996_HPSEL_GPIO, speyside_jack_polarity);
> +       gpiod_direction_output(speyside_hpsel_gpio, speyside_jack_polarit=
y);
>
>         /* Re-run DAPM to make sure we're using the correct mic bias */
>         snd_soc_dapm_sync(snd_soc_component_get_dapm(component));
> @@ -145,16 +146,22 @@ static int speyside_wm8996_init(struct snd_soc_pcm_=
runtime *rtd)
>  {
>         struct snd_soc_dai *dai =3D snd_soc_rtd_to_codec(rtd, 0);
>         struct snd_soc_component *component =3D dai->component;
> +       enum gpiod_flags flags;
>         int ret;
>
>         ret =3D snd_soc_dai_set_sysclk(dai, WM8996_SYSCLK_MCLK2, 32768, 0=
);
>         if (ret < 0)
>                 return ret;
>
> -       ret =3D gpio_request(WM8996_HPSEL_GPIO, "HP_SEL");
> -       if (ret !=3D 0)
> -               pr_err("Failed to request HP_SEL GPIO: %d\n", ret);
> -       gpio_direction_output(WM8996_HPSEL_GPIO, speyside_jack_polarity);
> +       if (speyside_jack_polarity)
> +               flags =3D GPIOD_OUT_HIGH;
> +       else
> +               flags =3D GPIOD_OUT_LOW;
> +       speyside_hpsel_gpio =3D devm_gpiod_get(rtd->card->dev,
> +                                            "hp-sel",
> +                                            flags);
> +       if (IS_ERR(speyside_hpsel_gpio))
> +               return PTR_ERR(speyside_hpsel_gpio);
>
>         ret =3D snd_soc_card_jack_new_pins(rtd->card, "Headset",
>                                          SND_JACK_LINEOUT | SND_JACK_HEAD=
SET |
> @@ -325,6 +332,21 @@ static struct snd_soc_card speyside =3D {
>         .late_probe =3D speyside_late_probe,
>  };
>
> +static struct gpiod_lookup_table wm8996_gpiod_table =3D {
> +       /* Hardcoded device name in board file mach-crag6410.c */
> +       .dev_id =3D "speyside",
> +       .table =3D {
> +               /*
> +                * This line was hardcoded to 214 in the global GPIO
> +                * number space, S3C GPIO macros seems top set the
> +                * wm8996 codec GPIO start offset to 212, so this will
> +                * be GPIO 214 - 212 =3D 2 on the wm8996.
> +                */
> +               GPIO_LOOKUP("wm8996", 2, "hp-sel", GPIO_ACTIVE_HIGH),
> +               { },
> +       },
> +};
> +
>  static int speyside_probe(struct platform_device *pdev)
>  {
>         struct snd_soc_card *card =3D &speyside;
> @@ -332,6 +354,7 @@ static int speyside_probe(struct platform_device *pde=
v)
>
>         card->dev =3D &pdev->dev;
>
> +       gpiod_add_lookup_table(&wm8996_gpiod_table);

This looks good but you never remove the lookup table. We should
typically undo everything on driver detach, that we did in probe().
I'd suggest either scheduling a devm action to remove the lookup table
or adding it statically in module's init.

Bart

>         ret =3D devm_snd_soc_register_card(&pdev->dev, card);
>         if (ret)
>                 dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() f=
ailed\n");
>
> --
> 2.48.1
>

