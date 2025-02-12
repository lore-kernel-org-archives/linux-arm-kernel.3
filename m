Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEA1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uYrRumV9nMSUYKKSpYn+3g5k4eAh93TeT+WqPiVakU=; b=AMa9Na/3uMlW2DsmgwsRbO2jhf
	UTU135ioD8kCkh1Jno0cY5sAPGlBfXl0Wyc9mvPtJN9iQi8waxA/68TbJJHJQec7aJroc2qunjKfD
	YnehnlQBAWO0x41i9Xd5CHg3CKsGCDf5nVIXHLra4Cwgby669cvI7/j1/eNl+bPLs7oMsLIvicS6G
	BlNSrNLsLjkUtvDyaQyXMz0NdXyeKiPQ/0MvcBBAzhQRbt9Or0qz6FHsnVv8cUv5oJuCAz1/NEZ5m
	+1YHurC59OTA2wu39ZZWCGZtOs7JnsRBl2E1PFbaRMbU4gnWjyExVGhvUM2AJTtiljp1jNiSCVl8o
	knPLY+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFHJ-000000080Mh-0J9p;
	Wed, 12 Feb 2025 16:07:57 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEy0-00000007v1g-2g8w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:48:02 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7f76aeedbso95113066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 07:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739375279; x=1739980079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uYrRumV9nMSUYKKSpYn+3g5k4eAh93TeT+WqPiVakU=;
        b=X0ugmZfv3XzQK5kZ7H0kT1BDN7ZJW6eXYVapTw9bkJ2G6MjYfvVgdRTsIufg5l7KZM
         fre2207my2IeTw4e8+euKQel1GOCjs2E89b3EaSGEJQ2H60XIxCJhhhGh7O/tgjobfZN
         5qakbwUk8PfHov931L5avMhXGqi/6Sq6nd2zqMZole3sHdrs2LmekeaOVb53c/MAWsc3
         F9jyJQJPAwDqFkQKxgPQfUkrqqJlYcPvqvQ5BgMQsc6GeOF1QA4pyQQYYuW57gu5xXee
         9ae8ePMWK/qUqf+aDTvz96iAyWrai1Ho5w4TtLgzOI7DFy5UHhfL/Q3jHWW+yntyuX0O
         o3rg==
X-Forwarded-Encrypted: i=1; AJvYcCVVwyAhLGzliiFMf7iBOhjbtK1TGa40hBpIrR4O8owwJj0vh4dZ6EoUgQ3osLI7e77zCBttgk7v2eZn0Mazs+Qd@lists.infradead.org
X-Gm-Message-State: AOJu0YyV5lAhnQG8lLa/btYnR0C4Pqn/pAcFoBOESnwnyKUE5mGaVrDz
	ZYx/jNvV1S9tJxpYRQ13xR5x2x2zpGlpg52xsLnB3Yu2cGK44ohm0N2M1kQkVfY=
X-Gm-Gg: ASbGncuZzNGbvPzdT8CUfBYNRUbBYrYWbtA7cuhY0qWZpXauxP0PBEOuR/mlej74ZVT
	/YMj97RoSiWSS2XtdBFD9k2O+1/kpwe6lS8EB5QudtKdhsbzwObWTc6wYnghypFV5z9E3uaeTf/
	9KS2Lp/W+/eaKTZ/aCoS3IOBpORVRVM4juFz5cyo3R6m+DLewc3wICKvCQJ4L9YaNYtgJIOMtww
	azvxEF2gdjwizzShv70zSovkSg5hN9Azrw/FjPNkugGEm9QM6EimK5tQLA0eW+fD6wYBaGvxZ2d
	Epfh1K3cWCzilCjd0jUN8UqZGV7HQLyBhfPCCfD2yCXPgw==
X-Google-Smtp-Source: AGHT+IF29DRcY7fRpy40i71BJQ2mtf2xUnMFfiWXXDq0sSLcnp3neI4OCtKDnJcOx8mdRN1pp8tN9Q==
X-Received: by 2002:a05:6402:3510:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5deadd71ae6mr8580651a12.7.1739375278513;
        Wed, 12 Feb 2025 07:47:58 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d11db52esm485533866b.177.2025.02.12.07.47.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:47:58 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f1e8efe82so827626f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 07:47:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUc4U3eGlrkcwAaeqV/S6KS2XIP18PTzCaeuTS/5+L2OCaMNutt8uJ0z2SVy5VAvJcQ7ezq7uPEZYQiwvplJtIk@lists.infradead.org
X-Received: by 2002:a5d:588c:0:b0:38a:2b39:9205 with SMTP id
 ffacd0b85a97d-38dea2878bfmr3997807f8f.33.1739375277843; Wed, 12 Feb 2025
 07:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20250211-rtkit-more-logging-v1-1-93334e9c1c77@rosenzweig.io>
In-Reply-To: <20250211-rtkit-more-logging-v1-1-93334e9c1c77@rosenzweig.io>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 12 Feb 2025 10:47:21 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_XadeDiXBeXckZ=UQ2wYHtGppdM3nPmardyYx7SBgCrg@mail.gmail.com>
X-Gm-Features: AWEUYZloTNjia8wdzYJXwYEgocjhTE4bAY0UXN52FPIm83DaokT5Zoy8sOwb2VQ
Message-ID: <CAEg-Je_XadeDiXBeXckZ=UQ2wYHtGppdM3nPmardyYx7SBgCrg@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Check & log more failures
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074800_675725_DC635E4F 
X-CRM114-Status: GOOD (  21.86  )
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

On Tue, Feb 11, 2025 at 1:00=E2=80=AFPM Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote:
>
> From: Asahi Lina <lina@asahilina.net>
>
> Check and log the following failures:
>
> * regular messages
> * management messages
> * failed buffer requests
>
> This helps debugging.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
> Originally multiple commits by Asahi Lina, squashed here and
> checkpatch.pl warn fixed.
> ---
>  drivers/soc/apple/rtkit.c | 44 ++++++++++++++++++++++++++++++++++-------=
---
>  1 file changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index e6d940292c9fbdfc4cd42020e89aca2662c5cdce..f8077a1ec3a42265eb9565a0e=
a1ca6a4cf7e79dc 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -97,12 +97,19 @@ bool apple_rtkit_is_crashed(struct apple_rtkit *rtk)
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_is_crashed);
>
> -static void apple_rtkit_management_send(struct apple_rtkit *rtk, u8 type=
,
> +static int apple_rtkit_management_send(struct apple_rtkit *rtk, u8 type,
>                                         u64 msg)
>  {
> +       int ret;
> +
>         msg &=3D ~APPLE_RTKIT_MGMT_TYPE;
>         msg |=3D FIELD_PREP(APPLE_RTKIT_MGMT_TYPE, type);
> -       apple_rtkit_send_message(rtk, APPLE_RTKIT_EP_MGMT, msg, NULL, fal=
se);
> +       ret =3D apple_rtkit_send_message(rtk, APPLE_RTKIT_EP_MGMT, msg, N=
ULL, false);
> +
> +       if (ret)
> +               dev_err(rtk->dev, "RTKit: Failed to send management messa=
ge: %d\n", ret);
> +
> +       return ret;
>  }
>
>  static void apple_rtkit_management_rx_hello(struct apple_rtkit *rtk, u64=
 msg)
> @@ -295,6 +302,9 @@ static int apple_rtkit_common_rx_get_buffer(struct ap=
ple_rtkit *rtk,
>         return 0;
>
>  error:
> +       dev_err(rtk->dev, "RTKit: failed buffer request for 0x%zx bytes (=
%d)\n",
> +               buffer->size, err);
> +
>         buffer->buffer =3D NULL;
>         buffer->iomem =3D NULL;
>         buffer->iova =3D 0;
> @@ -588,11 +598,18 @@ int apple_rtkit_send_message(struct apple_rtkit *rt=
k, u8 ep, u64 message,
>                 .msg1 =3D ep,
>         };
>
> -       if (rtk->crashed)
> +       if (rtk->crashed) {
> +               dev_warn(rtk->dev,
> +                        "RTKit: Device is crashed, cannot send message\n=
");
>                 return -EINVAL;
> +       }
> +
>         if (ep >=3D APPLE_RTKIT_APP_ENDPOINT_START &&
> -           !apple_rtkit_is_running(rtk))
> +           !apple_rtkit_is_running(rtk)) {
> +               dev_warn(rtk->dev,
> +                        "RTKit: Endpoint 0x%02x is not running, cannot s=
end message\n", ep);
>                 return -EINVAL;
> +       }
>
>         /*
>          * The message will be sent with a MMIO write. We need the barrie=
r
> @@ -742,8 +759,10 @@ static int apple_rtkit_set_ap_power_state(struct app=
le_rtkit *rtk,
>         reinit_completion(&rtk->ap_pwr_ack_completion);
>
>         msg =3D FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, state);
> -       apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_AP_PWR_STAT=
E,
> -                                   msg);
> +       ret =3D apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_AP_=
PWR_STATE,
> +                                         msg);
> +       if (ret)
> +               return ret;
>
>         ret =3D apple_rtkit_wait_for_completion(&rtk->ap_pwr_ack_completi=
on);
>         if (ret)
> @@ -763,8 +782,10 @@ static int apple_rtkit_set_iop_power_state(struct ap=
ple_rtkit *rtk,
>         reinit_completion(&rtk->iop_pwr_ack_completion);
>
>         msg =3D FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, state);
> -       apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STA=
TE,
> -                                   msg);
> +       ret =3D apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP=
_PWR_STATE,
> +                                         msg);
> +       if (ret)
> +               return ret;
>
>         ret =3D apple_rtkit_wait_for_completion(&rtk->iop_pwr_ack_complet=
ion);
>         if (ret)
> @@ -865,6 +886,7 @@ EXPORT_SYMBOL_GPL(apple_rtkit_quiesce);
>  int apple_rtkit_wake(struct apple_rtkit *rtk)
>  {
>         u64 msg;
> +       int ret;
>
>         if (apple_rtkit_is_running(rtk))
>                 return -EINVAL;
> @@ -876,8 +898,10 @@ int apple_rtkit_wake(struct apple_rtkit *rtk)
>          * will wait for the completion anyway.
>          */
>         msg =3D FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_ST=
ATE_ON);
> -       apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STA=
TE,
> -                                   msg);
> +       ret =3D apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP=
_PWR_STATE,
> +                                         msg);
> +       if (ret)
> +               return ret;
>
>         return apple_rtkit_boot(rtk);
>  }
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250211-rtkit-more-logging-79cbbbe21eee
>
> Best regards,
> --
> Alyssa Rosenzweig <alyssa@rosenzweig.io>
>
>

Looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

