Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27772C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 03:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQz3EwDsCOo1XFmvxHoa4HIcyhVHPzzMG2oMGGNImxA=; b=Y7JDFxGOulZp08ngti+5Xp+lBz
	A1MeMiL9ieqqTQ6cnGDA79hP+Ku+a5dZ1mnHOao/dULQ6bzz1OgsdTFj6ShYRrHB8Bw/qMZYXjMCs
	WBFPPsSDN0h9couaa0CNXmdswEfu8/1DsJhbZhahROfSBr1FhAsWAb9MmUhCAkNJ0RKPJhEQ5TN7F
	JkNSJ6WhV/ClfGHlSpAx7WUHcnMkMtJIuMPBUl3VEA5HMrPmaOtzUW3+KjHp+yXLG3dj5gJR1USvl
	ousLLQGLmYgaJMC3TmVZHdrMaiFaOV7Jd44VDLTg7Gi5t9N1/NbyNpHyVEMNiQqhgc4+vmxc/HIpQ
	m2YsDtTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhJp4-00000002p3n-26IA;
	Thu, 31 Jul 2025 03:19:14 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhJmb-00000002ooL-2EKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 03:16:42 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-73e62d692fbso358912a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 20:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753931800; x=1754536600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQz3EwDsCOo1XFmvxHoa4HIcyhVHPzzMG2oMGGNImxA=;
        b=XePNkXULzlpTNUbUtDYxw3/As+hfgni0TbjcGeEO075a8WVK8IbyjX5QqyBBnyT9Np
         K0qxDx22HAQohA2H2yyc1deHfWz6B63xV+M40Q+lbwiEtblYYZue8Fc3N3LVHE6gBz2h
         3b8/HQP7znoEgK2CzyL2np4aF6VbXiXonMIeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753931800; x=1754536600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQz3EwDsCOo1XFmvxHoa4HIcyhVHPzzMG2oMGGNImxA=;
        b=HsGtCkiNBMMX5YVpGfJ+94Mrud2ziwc+a2jf5tF0lyOqrENOUNnkq9WjzGdU8QpKto
         2+C/uoUctekmNuaSnPRo66r9cziZdobS0xiSmb7O0JADxZ4opzUsOmwXU0jCI03eqPvO
         W3Yoi5oaPHT6MQgGBYPWiBZXzgLR3iCYRRYqRcXr3K2vmzgbeWDlr5gVJ5tFvEENJEOt
         4X7NXUcw2ihliPdLvEnO16GBfFleqUpddj0qAWa1f5zSD6hEgsaczTdJ70xw2yJRBfcy
         6FeOInkxH6Vou00gs5KMawWuwQHuM1uKohQIPqY/uXmYQVsDYvkG9YYjYnQjUqkhVbOs
         Qpdw==
X-Forwarded-Encrypted: i=1; AJvYcCXEdm7x8F8R69mY0O83ndPFbx7PlNsuwooY/vPH6V/8RxgNBYLiiOmI9QE/gQ7zm6tLVszB4SlUTNwu+E39OaeY@lists.infradead.org
X-Gm-Message-State: AOJu0YwseiOoYgzLnU56cnNQLFzkKEzMz0z/ZbFCQCOn33JdLrXsi1Hm
	YGQhQvECJa1DxUhseTI9c6VXrfLIFQjIjbeaLMZ325OMMT6B/4jTX2FcJqGSFTbIo7gHwIfegoc
	juA4=
X-Gm-Gg: ASbGncscNuH1YPUoqj5iKw2wByiG8h/RK3yZgiAivlOtV66+p2Dyl1czJ/dWHkzqj/g
	3x6Vk18tvITLJCRfHAFDkFUaNDQB1H01EvffoUTp22uH0qufqW0fLTY3ejbmbRC4LJt5pMYgdsD
	NtC8siK09PrzskDLOIMJ4A2GIv81CqSnymd/z6dNkyiGI7ZAmhRSI1me+y2xK3QbiEffmhvBemV
	hgVjmg3sD6tW8ZwQfUeCR7TvIsTryBOd+Fr5DePTWaCZMdvn01tkaMpjYIeTrsE0iKXRPYU4GjB
	Fxwx7Ei628c+6J7Snc7a4N30PpTxKoCEY+zvSaihzAqnklLO6SxjD5du4JGiIeooLY2iEK0OTMs
	jyr1gJnPVaSMSku6tkklcEQ/DIDBS9j5o1vHx8hQApj3SkGe/TAzp8TNqFEhsnV/tOebm
X-Google-Smtp-Source: AGHT+IF1BxeAas60QGmGdRQsq4yLQom6g5YzjKxGVT+TjZYrEo/JJl/tFwC6uSK0OHKnq6VIgG5+QA==
X-Received: by 2002:a05:6830:448a:b0:73b:2ec0:6556 with SMTP id 46e09a7af769-741778519aemr4793841a34.0.1753931799934;
        Wed, 30 Jul 2025 20:16:39 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-74186dc83ffsm133554a34.50.2025.07.30.20.16.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 20:16:39 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-615ee07353bso294689eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 20:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV97ZAu+Gb9bE4NSTCqwEE/BCdS/9sGfsESJrHIb/mIEujt7D63nbPUrORY6lgcW5PZKO4fzkDr3LjXfIYAothz@lists.infradead.org
X-Received: by 2002:a05:6102:3e86:b0:4f9:d929:8558 with SMTP id
 ada2fe7eead31-4fbe7f5a8ecmr3674144137.10.1753931451474; Wed, 30 Jul 2025
 20:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-3-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-3-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 11:10:15 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhEiWmFkVMVGqg97TqXQqLhP0KZkQvq+F=k_hS_Jg297Q@mail.gmail.com>
X-Gm-Features: Ac12FXxQNf_MHWgJFTLhQCBFRAD1HLcfHVxkjg6vNoUDqC6XlmkmVeEw5sZ-QQw
Message-ID: <CAC=S1nhEiWmFkVMVGqg97TqXQqLhP0KZkQvq+F=k_hS_Jg297Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] thermal/drivers/mediatek/lvts: Make number of
 calibration offsets configurable
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_201641_583245_A44B3007 
X-CRM114-Status: GOOD (  22.05  )
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

On Wed, Jul 30, 2025 at 11:30=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> MT8196/MT6991 use 2-byte eFuse calibration data, whereas other SoCs
> supported by the driver rely on 3 bytes. Make the number of calibration
> bytes per sensor configurable, enabling support for SoCs with varying
> calibration formats.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 32 +++++++++++++++++--------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index f4d1e66d7db9..05aa8895ccce 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -96,12 +96,14 @@
>
>  #define LVTS_MINIMUM_THRESHOLD         20000
>
> +#define LVTS_MAX_CAL_OFFSETS           3
> +
>  static int golden_temp =3D LVTS_GOLDEN_TEMP_DEFAULT;
>  static int golden_temp_offset;
>
>  struct lvts_sensor_data {
>         int dt_id;
> -       u8 cal_offsets[3];
> +       u8 cal_offsets[LVTS_MAX_CAL_OFFSETS];
>  };
>
>  struct lvts_ctrl_data {
> @@ -127,6 +129,7 @@ struct lvts_data {
>         const struct lvts_ctrl_data *lvts_ctrl;
>         const u32 *conn_cmd;
>         const u32 *init_cmd;
> +       int num_cal_offsets;
>         int num_lvts_ctrl;
>         int num_conn_cmd;
>         int num_init_cmd;
> @@ -711,7 +714,7 @@ static int lvts_calibration_init(struct device *dev, =
struct lvts_ctrl *lvts_ctrl
>                                         u8 *efuse_calibration,
>                                         size_t calib_len)
>  {
> -       int i;
> +       int i, j;
>         u32 gt;
>
>         /* A zero value for gt means that device has invalid efuse data *=
/
> @@ -720,17 +723,18 @@ static int lvts_calibration_init(struct device *dev=
, struct lvts_ctrl *lvts_ctrl
>         lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
>                 const struct lvts_sensor_data *sensor =3D
>                                         &lvts_ctrl_data->lvts_sensor[i];
> +               u32 calib =3D 0;
>
> -               if (sensor->cal_offsets[0] >=3D calib_len ||
> -                   sensor->cal_offsets[1] >=3D calib_len ||
> -                   sensor->cal_offsets[2] >=3D calib_len)
> -                       return -EINVAL;
> +               for (j =3D 0; j < lvts_ctrl->lvts_data->num_cal_offsets; =
j++) {
> +                       u8 offset =3D sensor->cal_offsets[j];
> +
> +                       if (offset >=3D calib_len)
> +                               return -EINVAL;
> +                       calib |=3D efuse_calibration[offset] << (8 * j);
> +               }
>
>                 if (gt) {
> -                       lvts_ctrl->calibration[i] =3D
> -                               (efuse_calibration[sensor->cal_offsets[0]=
] << 0) +
> -                               (efuse_calibration[sensor->cal_offsets[1]=
] << 8) +
> -                               (efuse_calibration[sensor->cal_offsets[2]=
] << 16);
> +                       lvts_ctrl->calibration[i] =3D calib;
>                 } else if (lvts_ctrl->lvts_data->def_calibration) {
>                         lvts_ctrl->calibration[i] =3D lvts_ctrl->lvts_dat=
a->def_calibration;
>                 } else {
> @@ -1763,6 +1767,7 @@ static const struct lvts_data mt7988_lvts_ap_data =
=3D {
>         .temp_factor    =3D LVTS_COEFF_A_MT7988,
>         .temp_offset    =3D LVTS_COEFF_B_MT7988,
>         .gt_calib_bit_offset =3D 24,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8186_lvts_data =3D {
> @@ -1776,6 +1781,7 @@ static const struct lvts_data mt8186_lvts_data =3D =
{
>         .temp_offset    =3D LVTS_COEFF_B_MT7988,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 19000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8188_lvts_mcu_data =3D {
> @@ -1789,6 +1795,7 @@ static const struct lvts_data mt8188_lvts_mcu_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 20,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8188_lvts_ap_data =3D {
> @@ -1802,6 +1809,7 @@ static const struct lvts_data mt8188_lvts_ap_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 20,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8192_lvts_mcu_data =3D {
> @@ -1815,6 +1823,7 @@ static const struct lvts_data mt8192_lvts_mcu_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8192_lvts_ap_data =3D {
> @@ -1828,6 +1837,7 @@ static const struct lvts_data mt8192_lvts_ap_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8195_lvts_mcu_data =3D {
> @@ -1841,6 +1851,7 @@ static const struct lvts_data mt8195_lvts_mcu_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8195_lvts_ap_data =3D {
> @@ -1854,6 +1865,7 @@ static const struct lvts_data mt8195_lvts_ap_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct of_device_id lvts_of_match[] =3D {
> --
> 2.39.5
>
>

