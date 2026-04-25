Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DCCFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8c6yWGMQo5L1X5gw5Y++BUlPK4zJUB8QavkHYAjxYo=; b=fOOnWr3u95O5KVJ0Pb83XaHIa6
	WsESmMf6EtNFwf5wC2VLZAGoURECpKPZfhqoa42PRVsslTzOG5E9psPbI4dyVwqn+NInK1CMab27x
	8PjPfCCEa/aORpKYVOTGvlfISeyvZIXXj9cOsyv+s24I7yAMJ1HWRTkw11w8dXQXrcvL60v6PLXcf
	GsGAl/9XttVUOxcTHDUtlBSDKuw4euIhJ6wvsje0UyfFqKKYNNe7rcEcvbOr7PMdusfKtUHhxUfM2
	GF97BQTw27c+cgxAu5N7YIjmMxeCGYexF2u+WnN18cqFWrFkbUeGcGLI1MBxjG5IrDjVIJSg10OEo
	hqgW9Btw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGiYy-0000000ElOO-1QMk;
	Sat, 25 Apr 2026 19:21:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGiYv-0000000ElNh-25T6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 19:21:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so1557232466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 12:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777144867; cv=none;
        d=google.com; s=arc-20240605;
        b=bCEQYMhm1veL/KeiRwzXMj1Fe5JEi/OlRr4+c+vX88wer1yTXzMn0CSvacVHzthHa3
         1pQx9pi9TQZdBkd8D1cf36PmUpCAQW1Wpo4+Hr/DTQuHf/uQl/6DXYoTOpUdwrTTD+py
         oKuLL1m50T74NnukI+CYgT6AmoXTXyXbrqYdP2RXzAnF6kKkhGF9MovJBqM9qki83MHo
         VubOPwomYQswD+dl81L3Gv4ph7kAvc6RqHs71vfpceYxbAggvJYIFgz7g78pfMxcHsl0
         uXZHh/YtReVel69a2xdOhoZ4qARj0Gdoti3ZdYTQ3WfHOJ22yRm1sSoYSuRZ4hOJ4cKp
         9L3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+8c6yWGMQo5L1X5gw5Y++BUlPK4zJUB8QavkHYAjxYo=;
        fh=YnetBwALcyN9PpWS6y3w1IeQMcRiIvCO1eRxX66A+lQ=;
        b=BVwnjVoVZojIs83Txqg++uQqh+0Qx/QmtIUKHh/DeVW+dLhPlYL4dGYPoXbNWRB0aP
         L/xry2fJjTVTKx1mGERHPcNjZOAWbUmHgTzUB7FJL+yBNPCCBASSrn7f3RHTgmaAe2/9
         gRZfSpm0KnvVJINO/b0YaZ/m48mTsAhmUfV9jJ0FfLLNpOFHm1PszzPh9mZgSPPPScz7
         qT3gsxYJORQEOxTuZFJK0HciA0muQKjJRT5W52oeuqBkSyYoq8G0YEclpiD+5OrVIaDF
         gdLUhhKcaZRABM6Brsi1iqUmu5aR0BJpymZiSTY/6TRb7rL2dNIP6/pA526Ykuth8+X+
         ZU3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777144867; x=1777749667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8c6yWGMQo5L1X5gw5Y++BUlPK4zJUB8QavkHYAjxYo=;
        b=LJWIJWgogiz0wrmOit8xKzNrwFGHCx0I5S1G8rW59MssA3yHlMxwkzvragE0bdFmtB
         0dijCfK5osfBNGNSoCxx9VEk5Y+0UcTlI/A9Olxlbf6X255TVydPGwfO4frBNJithfI3
         1jcR8oWkYuk+yrFI5NyMT5za+EVHkBlxvG9blqR7s/AdG12Agp4jh1GSpacBEot99SDn
         mQY2bNdkqBn79djQ6Ic6w096FhWz+K43+gl8L+dZoldTMyaS+t/Hrj4CB2JR/7U89Dkr
         lS6cnCZCC5rFPrgsTOO39Z7nHEK6mp/CAQ5bMqhGx2VuSlucPkkTxb9b/hS5ExaZIfwQ
         cwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777144867; x=1777749667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+8c6yWGMQo5L1X5gw5Y++BUlPK4zJUB8QavkHYAjxYo=;
        b=g9K8CLKq7MywGHMvLoNFpHUTUh8tOdscWIIvMgDUbzXOp2dzOQKR1Uti6ijOcvpAyK
         urgM5jreDrWApEJctYz7AMRNeDk3OwcS3bXYOpbeM91HzAJKCvjMiPmhNKgubpZ5rwKY
         6xzPaLB74do4tYUZKYwPWlGUdNBIWy2674QOOZicy3Ig92AuPgtWXRJb1BaIMQMXF/OP
         3w4ul1zTHVLroXn0vGbxGTuhg6abjkAOANdA7IjuPV7ayre7b1UPpglLrgNSss/tVy1a
         X/LvMSd34LQmNShuEHWFJc2ljEVuIZWoO7Jsi9JyBlutIx1n21Xx98hXbpk6McJI5/lI
         9QqA==
X-Forwarded-Encrypted: i=1; AFNElJ89fA4vVBSfFgRDN98HbR/UrVnBU5dxh4LD0WK+XfiEiakzQiNrTGWIeosC1UEsqmvzLkeAALhbVbZagaIjmDP+@lists.infradead.org
X-Gm-Message-State: AOJu0YyhVI8Apz1z0zBP02N/TPukKydaKBpju88iAK+vIWNM8gixPRX9
	PfEKnLr39J5rBinLvj74A0YDSND2uFrtrBpxVA5IDel9aPJ5wWOtNkUMlJAubyH3Lqi4sZn5FpY
	3lZouOWrDOeB1IjHaMcimAt18LZxf3tY=
X-Gm-Gg: AeBDieuJf9wNgTC+IhHmKGzJ7cZcgB4e+8gpE8KsUETSffKuc7rSxWkecLxV3pwEcJ9
	K7MNJR2iwi2PMAFWD2o6Kk/YzECxbGQV6vucylUwKZma8+5GNdxKqdP12ibbmI0JzS47vJuXp3F
	UjkT2SIViU/xWcczYFW3vQRfq4+yDeX9reTYgvG7S8FZbW80MrDnScZz2tc+SdBdkH0jSSNCj6o
	DbFvBGgoctT+ZgfBqT6uszG0hZGx6xaY/KXVV9epagX5RTRax1lAKUtO9T5DPkqtozgzNR8Xcow
	MOtZxsKUUMrr40/Q0IzXM8iT8PxkyDJeRo2BPDqUowteIsKH+S702CPQ8+APPvCVNkAi1VtqUJ0
	mbdBApU97bXSm+7dI+aDae07sABpLWiEqGWzb0cuibIK3/Fz6
X-Received: by 2002:a17:907:7f86:b0:bae:2aac:3cfc with SMTP id
 a640c23a62f3a-bae2aac3d84mr333598766b.3.1777144866692; Sat, 25 Apr 2026
 12:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
In-Reply-To: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 25 Apr 2026 12:20:55 -0700
X-Gm-Features: AQROBzBWERVyzPtDfabAtbUn-NQMbd1-MjW_pzWLW_K4WY_b7oYxhF49AZGCCKg
Message-ID: <CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on error
To: Felix Gu <ustc.gu@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_122109_587774_343DEF6B 
X-CRM114-Status: GOOD (  19.75  )
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

On Sat, Apr 25, 2026 at 9:07=E2=80=AFAM Felix Gu <ustc.gu@gmail.com> wrote:
>
> meson_sar_adc_temp_sensor_init() allocates a buffer with
> nvmem_cell_read(), but the old code leaked it if
> syscon_regmap_lookup_by_phandle() failed.
>
> Switch buf to __free(kfree) so all return paths release it.
>
> Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/iio/adc/meson_saradc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_sarad=
c.c
> index 23991a3612bd..9708ddcc4919 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -786,7 +786,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *ind=
io_dev,
>  static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>  {
>         struct meson_sar_adc_priv *priv =3D iio_priv(indio_dev);
> -       u8 *buf, trimming_bits, trimming_mask, upper_adc_val;
> +       u8 trimming_bits, trimming_mask, upper_adc_val;
>         struct device *dev =3D indio_dev->dev.parent;
>         struct nvmem_cell *temperature_calib;
>         size_t read_len;
> @@ -807,14 +807,12 @@ static int meson_sar_adc_temp_sensor_init(struct ii=
o_dev *indio_dev)
>         }
>
>         read_len =3D MESON_SAR_ADC_EFUSE_BYTES;
> -       buf =3D nvmem_cell_read(temperature_calib, &read_len);
> +       u8 *buf __free(kfree) =3D nvmem_cell_read(temperature_calib, &rea=
d_len);
>         nvmem_cell_put(temperature_calib);
>         if (IS_ERR(buf))
>                 return dev_err_probe(dev, PTR_ERR(buf), "failed to read t=
emperature_calib cell\n");
> -       if (read_len !=3D MESON_SAR_ADC_EFUSE_BYTES) {
> -               kfree(buf);
I don't like this. Just add the missing kfree.
> +       if (read_len !=3D MESON_SAR_ADC_EFUSE_BYTES)
>                 return dev_err_probe(dev, -EINVAL, "invalid read size of =
temperature_calib cell\n");
> -       }
>
>         priv->tsc_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node=
, "amlogic,hhi-sysctrl");
>         if (IS_ERR(priv->tsc_regmap))
> @@ -835,8 +833,6 @@ static int meson_sar_adc_temp_sensor_init(struct iio_=
dev *indio_dev)
>         priv->temperature_sensor_adc_val |=3D upper_adc_val << BITS_PER_B=
YTE;
>         priv->temperature_sensor_adc_val >>=3D trimming_bits;
>
> -       kfree(buf);
> -
>         return 0;
>  }
>
>
> ---
> base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
> change-id: 20260425-meson_saradc-54abc52d9b31
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

