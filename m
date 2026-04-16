Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A943F8A171
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9keKW5p4++WsVuxHmBqHxADE1ZcTw3Q0sJGd/F983YY=; b=y8L4CnaKfUgeXvjqTIZxt3T8nq
	VypXQy0PHHOZ5B5QxO3HX/KW0nVY4B5WeJQ3W8Nt9hhK2P10QjedEHJ8MaOxXc6KTc5DiwsCUrZVg
	WgDp5XLWG5rVx7SE+fPjWdBp9Zxl85nLmcSUCtTqQFypwr/4JAZhMfhUi5hZxWbtkUIbOlsDWaUV6
	T7M1X+TsxsTc69PwxlUh7fLdnHsBzn+ZaJvWQ8aMUyJOydw+lODuXinrgu/SDguKxS1SQ3B+BnfjX
	97a3mqFRKrdfeK0yHBSkIbXO7EPJYi9vxdUxLHRtcAW9fJHkfWaGgSGxj/CG/z/AZqodk3XQCJn3A
	qZVTYwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMOp-00000002TCq-41KA;
	Thu, 16 Apr 2026 13:04:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMOo-00000002TCA-00Nd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 13:04:51 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2aae4816912so53292075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 06:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776344689; cv=none;
        d=google.com; s=arc-20240605;
        b=k5Z03bmIYTXAiewE+oZx7N2qIKMLjGiRNgulTEhdDowi1w+ZQWTQEaN6fz9Rrr8yMP
         jjvhkAlT+ktYbuJoehtl9b/OgXWO8Gqk28AYBrbG0huCtYZUnIvHeMQl2ccD7R9ZnAby
         VSOYShPZzmv2Qiau/Iz9mbIIoPBzKrtcrmf1Htk5X9t/8ZejMrFeXxEkkdOR0UNFb3u0
         WOvZMtDOKo/BXu1gPdJnzWWtwkJpbroek1BbZ23VA8vwmAHFPcqRBRFwIuwF1SMgRIwG
         zYrOuGt2YsIXuucHtCOZnkw4L+labcNSG7ViVP6tbMqrHokq+WzqKSaGgDTPcSKQQ6vk
         EEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9keKW5p4++WsVuxHmBqHxADE1ZcTw3Q0sJGd/F983YY=;
        fh=9jrdUgvgPWVbs5qPsP0KoTvUoIHTf71+yumcfXQj6K4=;
        b=d0zhHyCmpttFr/FflqrCRxoY605EWQx1x91S7m9yf+eK/nW7/tQhPUfR/udqwIxk/i
         gDIrrweuaA1ChYKweNNm/SptdPy46uOMg+tmvSSp3EtYT2fpN4A0wHdqwfcLMnDnyssx
         lRm+R4DCGA44bLxFjSnWyUk75VVoNDCRAA+EbEr4PaVP9B1bujjlpwM/7iOPt7zu+tPB
         hJOXmmalQnJy9LcjfwI8R7NDAlVzvGzcVhpybRXcYGGbF/Pt1GP/Sp9trJdrZLfX+iUh
         LWvbvSTqhDWCfArxj6Vwu5ir30KhPGeQ53TjneWOByFXoklapQJ3X4jvKVXjMK8UwtQW
         fG6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776344689; x=1776949489; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9keKW5p4++WsVuxHmBqHxADE1ZcTw3Q0sJGd/F983YY=;
        b=mfIpfOrCU/0u278hgRApG2LUfjKA8/C0XQFhYsc+VZaFZtVLxo8cjypXWBOg9uVXvM
         DV1nAMDIfbsVn+7DAm2LJcX7sADUkn//yj3lYV77g1P6LqKRbDch8pLgJsppBtNGGRVH
         azhdj5wXLavPIuMIxk/LT4JdTCRnUul9/eEuCgfRipqLRWLOStGwPeGk1gkw0CLR+JWk
         laO8PQ+yAdxwfcaSrPZlVrmhIdwSLQg/nFBKGwEiHdOERUYRzRKUiHnfq/jwfX7KDtNl
         Fjaapx4ms5sGyyfZi2xRsTWp/hK02kmoCZJvVzT2tc3jI1MYPHLVy1kztP2H2FLJ/aFR
         aRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344689; x=1776949489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9keKW5p4++WsVuxHmBqHxADE1ZcTw3Q0sJGd/F983YY=;
        b=jkDudW7WowVDVmognJ3q0EFziRRHstN8OyC8KUkrpjijwcsR6SsVNlhmVDnW0rF445
         n1txw1A5N2qUIxCRbhVz6seTyWcTWI/5ZzyR5+Zaqef4m713qRG1SyQCyKaetNiDQF7/
         vk47Og9GbjAH0Uib8VHnNC8Po3qsDrb5FRLR9lLO3FT/jjch0UJu5DrlRPgkm8NWtqLt
         t988lBQZUq6lKEP0JAHfjIeEBlbML2/XCZ1nQFRF64sX/CRmrpOWnSxBf8znD/OLkHaD
         05KRnq28XPJrrxbTPyc/hpVnEyJnkQDR8x7CvYRXQ3O1pz5KjT+E+hEujYHIVNvExNdc
         IWsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/d3z9wTcwP3TEN4chgfjqwe7qEALlSc6tD9YiDZV98sc1D+SpPw93yaKjj1tUHRn6HFCOyhJNO3xxwzHlTtaQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzIr+nkJOGEF22Z/IHRd475f0XqTByv/IBWGe2Kd8gHI4eHxFs1
	bwWE72WMwzzX8sOQCKhqESi8Eqry7IbZ16mlCcsk99JTNGnCRBOSjgOnJQ5T/0uBRioIvkrSEQc
	0ImCd2ZDneGKFmdWcP+Bj9UyEi3UpiaE=
X-Gm-Gg: AeBDievonok1SvyNPYdBCClx2a8ZEyX3gyi//w/uk6lpUgPKx/ahIXshCthNhBYz75U
	t21X00TGpp0GfeaiKdeZPpbVrSkxBvWM9cLF1fZROdUkDBEy8LnXNxl1m3twARBJom2G/fIZr88
	+OwogItIOc1/GD13+/dFIv5hql4CNVD8vDbd3yH//LOzgbzF3QjMMl3gNL5luvLOKmKVZYLt1i8
	3DfpPdGJ54CkQZNrS0/WAonnaFftvqF9pSRegrUcT/9euGtAEcKz8IkSKWjoOMT659DDDLtIayw
	JQerBeX69CSQY9RFMnLHTye+cWsV6co1MKwwt8NnvZo0ceX57xPm5PP88jNyPJNUO35yK8bUw58
	=
X-Received: by 2002:a17:902:d507:b0:2b4:5cd0:b6c3 with SMTP id
 d9443c01a7336-2b45cd0bb63mr212259795ad.29.1776344688850; Thu, 16 Apr 2026
 06:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260415-imx-v2-0-aeacff9e72b2@gmail.com> <20260415-imx-v2-1-aeacff9e72b2@gmail.com>
In-Reply-To: <20260415-imx-v2-1-aeacff9e72b2@gmail.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 16 Apr 2026 21:04:38 +0800
X-Gm-Features: AQROBzAHfswAILDPJrZ03lSCXQzT-HPAwyhO5aKUzw0OdIQTV7XQ9Ww0qLogIkk
Message-ID: <CAN4SLj3rH1q-jd6ccdo2qVNuNUoqfpsiS0KXJ3b=b7m_bh2QBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] thermal/drivers/imx: Fix thermal zone leak on
 probe error path
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_060450_042654_B73B0541 
X-CRM114-Status: GOOD (  24.74  )
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

On Wed, Apr 15, 2026 at 9:10=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:
>
> If pm_runtime_resume_and_get() fails after the thermal zone has been
> registered, the probe error path cleans up runtime PM but skips
> thermal_zone_device_unregister(), leaking the thermal zone device.
>
> Switch to use devm_thermal_of_zone_register() to fix the problem.
>
> Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/thermal/imx_thermal.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.=
c
> index 38c993d1bcb3..3729c3eac748 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -216,6 +216,20 @@ struct imx_thermal_data {
>         const char *temp_grade;
>  };
>
> +static int imx_thermal_sync_zone_trip(struct thermal_trip *trip, void *a=
rg)
> +{
> +       struct imx_thermal_data *data =3D arg;
> +       int temp;
> +
> +       if (trip->type !=3D THERMAL_TRIP_PASSIVE && trip->type !=3D THERM=
AL_TRIP_CRITICAL)
> +               return 0;
> +
> +       temp =3D trips[trip->type].temperature;
> +       thermal_zone_set_trip_temp(data->tz, trip, temp);
> +
> +       return 0;
> +}
> +
>  static void imx_set_panic_temp(struct imx_thermal_data *data,
>                                int panic_temp)
>  {
> @@ -679,13 +693,8 @@ static int imx_thermal_probe(struct platform_device =
*pdev)
>                 goto legacy_cleanup;
>         }
>
> -       data->tz =3D thermal_zone_device_register_with_trips("imx_thermal=
_zone",
> -                                                          trips,
> -                                                          ARRAY_SIZE(tri=
ps),
> -                                                          data,
> -                                                          &imx_tz_ops, N=
ULL,
> -                                                          IMX_PASSIVE_DE=
LAY,
> -                                                          IMX_POLLING_DE=
LAY);
> +       data->irq_enabled =3D true;
> +       data->tz =3D devm_thermal_of_zone_register(dev, 0, data, &imx_tz_=
ops);
>         if (IS_ERR(data->tz)) {
>                 ret =3D PTR_ERR(data->tz);
>                 dev_err(dev, "failed to register thermal zone device %d\n=
",
> @@ -693,6 +702,8 @@ static int imx_thermal_probe(struct platform_device *=
pdev)
>                 goto clk_disable;
>         }
>
> +       thermal_zone_for_each_trip(data->tz, imx_thermal_sync_zone_trip, =
data);
> +
>         dev_info(dev, "%s CPU temperature grade - max:%dC"
>                  " critical:%dC passive:%dC\n", data->temp_grade,
>                  data->temp_max / 1000, trips[IMX_TRIP_CRITICAL].temperat=
ure / 1000,
> @@ -724,25 +735,18 @@ static int imx_thermal_probe(struct platform_device=
 *pdev)
>         if (ret < 0)
>                 goto disable_runtime_pm;
>
> -       data->irq_enabled =3D true;
> -       ret =3D thermal_zone_device_enable(data->tz);
> -       if (ret)
> -               goto thermal_zone_unregister;
> -
>         ret =3D devm_request_threaded_irq(dev, data->irq,
>                         imx_thermal_alarm_irq, imx_thermal_alarm_irq_thre=
ad,
>                         0, "imx_thermal", data);
>         if (ret < 0) {
>                 dev_err(dev, "failed to request alarm irq: %d\n", ret);
> -               goto thermal_zone_unregister;
> +               goto disable_runtime_pm;
>         }
>
>         pm_runtime_put(data->dev);
>
>         return 0;
>
> -thermal_zone_unregister:
> -       thermal_zone_device_unregister(data->tz);
>  disable_runtime_pm:
>         pm_runtime_put_noidle(data->dev);
>         pm_runtime_disable(data->dev);
> @@ -761,7 +765,6 @@ static void imx_thermal_remove(struct platform_device=
 *pdev)
>         pm_runtime_put_noidle(data->dev);
>         pm_runtime_disable(data->dev);
>
> -       thermal_zone_device_unregister(data->tz);
>         imx_thermal_unregister_legacy_cooling(data);
>  }
>
>
> --
> 2.43.0
>

Hi all,
This patch has a problem, I will fix it and send v3.

Best regards,
Felix

