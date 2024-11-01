Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72402E674BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsxKUGjdWiAGv47BwNUyBJUWR+9qdLa5UgvjbsntLK4=; b=1Q7I0iK6N3lnspChjSPiIMdPPK
	PmH/4UhEepAUUHE1NRWObYwLytO88zRpKkZAMfte7lURMnZTbVIliS8q7vhNmH5x6gC0WF+xktqIK
	2rXA4KQ62J9BIdkFU/bg+ywGa+GezekkLmUDKM5R62V4RkGETb/hQkuXkKlXkp/WXdew6UYvgtm8r
	IhaVGukORksUdHxyo1AY2KS5VxDXxm9185hw+IDwFvuxYwmI0nIErymsGhziBUsoqA1vAEo+Lg1eI
	uZlE2qTHKQMLwxQV/TezDIDJNxye/V51vGScFIZro2cnk4BtIm0KAwoML4HdsNq5dSmJ+s41/XZ67
	Gdlo+xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nBc-00000006IZZ-1dJx;
	Fri, 01 Nov 2024 08:39:16 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6n2Y-00000006HJi-0NCj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:29:56 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e6c754bdso1596917e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 01:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730449792; x=1731054592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsxKUGjdWiAGv47BwNUyBJUWR+9qdLa5UgvjbsntLK4=;
        b=NXKQu/zdU3zcNunr0KZEyhiZtmTK0YTy/yRIejR4O98c7xfjV/11Q62RPa7DRSPZLv
         LZpEd+SzTdCFAX34m0xbxPRHXpczVdBh+gPX4zXVifappPQrAqe8e5UMGF/WrHNlkYbc
         oZj09hhTORf/bVaGrrZVmr4wxHF90/vi0FacI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730449792; x=1731054592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsxKUGjdWiAGv47BwNUyBJUWR+9qdLa5UgvjbsntLK4=;
        b=sA0R5DOzxUZQM+BVdKzf9cZSWebSCfDqtwnYFp2HkTlPqGQ8+ZzR/iF2yJ1DkeLaSs
         sCt7lpFWad2LTaUQQLHokDLW/VsFzWqvxT+a2LG3wvuH9XGBx6sJIVlm5L4d60RsJh7B
         lYVRqUavsziGuuDkDJ0mqLTqvfaV2EYot/Ir4ycaQUetoDbN+THUgOJxBUht9mD3xq6M
         GNuSvkctiL1/O5D7FvQ7kCQySVQVnGwq5lsA6zialWVfrvI+Bc4G1QjgfwXievxZSGd5
         14LVXqeDvGhuPHXVxKIb3eCUUrkxbd+f2OnRE9u+G4tH9Qpatlqr124iHJyPPfjs1PpJ
         0LFA==
X-Forwarded-Encrypted: i=1; AJvYcCXMKpHVhY9sspUt8YHF8O+zA+DGGHxlaK3H6Or0ScWSYDTd12WZiBZ8KAf3bF0ofmy8mT7m/Zl7HJqc2nCEw4x0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4CzKImEck3CBY0/3RYYWR0faQfkmbwTHAopXGp2LS+2QOYJ1Y
	HMJkwt4OuLzepZmVjRqNgNHl6JFSyZU+yqKWjC666JgX9I3YSkp9uv8B5EbixJlp4Yb0CDUJXfg
	3aBJyAWdryWKP52ex1Qcu3iV4l0qUMACNt1nc
X-Google-Smtp-Source: AGHT+IGTqX5UyIr8VvxldtI0gT3OkfHP2I0HNyq5N6sGuNcogMS6UYUySZz5IWAmNrkSd6R8e/w0nPK4JJsKuNULoKc=
X-Received: by 2002:ac2:4c41:0:b0:539:f36c:dbac with SMTP id
 2adb3069b0e04-53c79e15c89mr3671562e87.4.1730449791856; Fri, 01 Nov 2024
 01:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241025-auxadc_thermal-v14-1-96ab5b60c02e@chromium.org>
In-Reply-To: <20241025-auxadc_thermal-v14-1-96ab5b60c02e@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Nov 2024 16:29:39 +0800
Message-ID: <CAGXv+5G36JCpEMD_MDTwjvBmqZ8OOAaxjAYhZbdpp37n=XFkcg@mail.gmail.com>
Subject: Re: [PATCH v14] thermal/drivers/mediatek/auxadc_thermal: expose all
 thermal sensors
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, James Lo <james.lo@mediatek.com>, 
	Michael Kao <michael.kao@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Ben Tseng <ben.tseng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_012954_199501_37E0F23D 
X-CRM114-Status: GOOD (  42.06  )
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

On Fri, Oct 25, 2024 at 9:16=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> From: James Lo <james.lo@mediatek.com>
>
> Previously, the driver only supported reading the temperature from all
> sensors and returning the maximum value. This update adds another
> get_temp ops to support reading the temperature from each sensor
> separately.
>
> Especially, some thermal zones registered by this patch are needed by
> MT8183 since those thermal zones are necessary for mtk-svs driver.
>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: James Lo <james.lo@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> Changes in v14:
> - Remove redundant error message.
> - Link to v13: https://lore.kernel.org/r/20241025-auxadc_thermal-v13-1-a5=
231c52dccb@chromium.org
>
> Changes in v13:
> - Make subject and commit message more clear.
> - Make error message more clear.
> - Link to v12: https://lore.kernel.org/r/20241016-auxadc_thermal-v12-1-c0=
433e9f61af@chromium.org
>
> Changes in v12:
> - Remove unnecessary check and unused variable assignment in mtk_read_sen=
sor_temp.
> - Add more about what this patch achieves in the commit message.
> - Link to v11: https://lore.kernel.org/r/20240809-auxadc_thermal-v11-1-af=
36cc74f3a3@chromium.org
>
> Changes in V11:
>     - Rebase on kernel v6.11-rc2
>     - Use mtk_thermal_temp_is_valid in mtk_read_sensor_temp just like
>       mtk_thermal_bank_temperature
>     - Change the error handling of devm_thermal_of_zone_register return
>       value
>     - link to V10: https://lore.kernel.org/lkml/20220519101044.16765-1-ja=
mes.lo@mediatek.com/
>
> Changes in V10:
>     - Rebase to kernel-v5.18-rc7
>     - Resend
>
> Changes in V9:
>     - Rebase to kernel-v5.14-rc1
>     - Bind raw_to_mcelsius_v1 or raw_to_mcelsius_v2 to compatible
>       data of struct mtk_thermal_data
>     - Remove duplicate struct 'mtk_thermal_bank'
>     - Remove unnecessary if condition check
>     - Return error if any thermal zone fail to register
>
> Changes in V8:
>     - Rebase to kernel-v5.13-rc1
>     - Resend
>
> Changes in v7:
>     - Fix build error in v6.
>
> Changes in v6:
>     - Rebase to kernel-5.11-rc1.
>     - [1/3]
>         - add interrupts property.
>     - [2/3]
>         - add the Tested-by in the commit message.
>     - [3/3]
>         - use the mt->conf->msr[id] instead of conf->msr[id] in the
>           _get_sensor_temp and mtk_thermal_bank_temperature.
>         - remove the redundant space in _get_sensor_temp and
>           mtk_read_sensor_temp.
>         - change kmalloc to dev_kmalloc in mtk_thermal_probe.
>
> Changes in v5:
>     - Rebase to kernel-5.9-rc1.
>     - Revise the title of cover letter.
>     - Drop "[v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESE=
L"
>     - [2/2]
>         -  Add the judgement to the version of raw_to_mcelsius.
>
> Changes in v4:
>     - Rebase to kernel-5.6-rc1.
>     - [1/7]
>         - Squash thermal zone settings in the dtsi from [v3,5/8]
>           arm64: dts: mt8183: Increase polling frequency for CPU thermal =
zone.
>         - Remove the property of interrupts and mediatek,hw-reset-temp.
>     - [2/7]
>         - Correct commit message.
>     - [4/7]
>         - Change the target temperature to the 80C and change the commit =
message.
>     - [6/7]
>         - Adjust newline alignment.
>         - Fix the judgement on the return value of registering thermal zo=
ne.
>
> Changes in v3:
>     - Rebase to kernel-5.5-rc1.
>     - [1/8]
>         - Update sustainable power of cpu, tzts1~5 and tztsABB.
>     - [7/8]
>         - Bypass the failure that non cpu_thermal sensor is not find in t=
hermal-zones
>           in dts, which is normal for mt8173, so prompt a warning here in=
stead of
>           failing.
>
>     Return -EAGAIN instead of -EACCESS on the first read of sensor that
>         often are bogus values. This can avoid following warning on boot:
>
>           thermal thermal_zone6: failed to read out thermal zone (-13)
>
> Changes in v2:
>     - [1/8]
>         - Add the sustainable-power,trips,cooling-maps to the tzts1~tztsA=
BB.
>     - [4/8]
>         - Add the min opp of cpu throttle.
> ---
>
> ---
>  drivers/thermal/mediatek/auxadc_thermal.c | 70 +++++++++++++++++++++++++=
++----
>  1 file changed, 62 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/=
mediatek/auxadc_thermal.c
> index 9ee2e7283435acfcbb1a956303b6122a08affecc..9a9079d559a3abe9e3823f744=
d4c9a159a8666bd 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -847,7 +847,8 @@ static int mtk_thermal_bank_temperature(struct mtk_th=
ermal_bank *bank)
>
>  static int mtk_read_temp(struct thermal_zone_device *tz, int *temperatur=
e)
>  {
> -       struct mtk_thermal *mt =3D thermal_zone_device_priv(tz);
> +       struct mtk_thermal_bank *bank =3D thermal_zone_device_priv(tz);
> +       struct mtk_thermal *mt =3D bank->mt;
>         int i;
>         int tempmax =3D INT_MIN;
>
> @@ -866,10 +867,41 @@ static int mtk_read_temp(struct thermal_zone_device=
 *tz, int *temperature)
>         return 0;
>  }
>
> +static int mtk_read_sensor_temp(struct thermal_zone_device *tz, int *tem=
perature)
> +{
> +       struct mtk_thermal_bank *bank =3D thermal_zone_device_priv(tz);
> +       struct mtk_thermal *mt =3D bank->mt;
> +       const struct mtk_thermal_data *conf =3D mt->conf;
> +       int id =3D bank->id - 1;
> +       int temp =3D INT_MIN;
> +       u32 raw;
> +
> +       raw =3D readl(mt->thermal_base + conf->msr[id]);
> +
> +       temp =3D mt->raw_to_mcelsius(mt, id, raw);
> +
> +       /*
> +        * The first read of a sensor often contains very high bogus
> +        * temperature value. Filter these out so that the system does
> +        * not immediately shut down.
> +        */
> +
> +       if (unlikely(!mtk_thermal_temp_is_valid(temp)))
> +               return -EAGAIN;
> +
> +       *temperature =3D temp;
> +
> +       return 0;
> +}
> +
>  static const struct thermal_zone_device_ops mtk_thermal_ops =3D {
>         .get_temp =3D mtk_read_temp,
>  };
>
> +static const struct thermal_zone_device_ops mtk_thermal_sensor_ops =3D {
> +       .get_temp =3D mtk_read_sensor_temp,
> +};
> +
>  static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>                                   u32 apmixed_phys_base, u32 auxadc_phys_=
base,
>                                   int ctrl_id)
> @@ -1199,6 +1231,7 @@ static int mtk_thermal_probe(struct platform_device=
 *pdev)
>         u64 auxadc_phys_base, apmixed_phys_base;
>         struct thermal_zone_device *tzdev;
>         void __iomem *apmixed_base, *auxadc_base;
> +       struct mtk_thermal_bank *tz;
>
>         mt =3D devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
>         if (!mt)
> @@ -1285,14 +1318,35 @@ static int mtk_thermal_probe(struct platform_devi=
ce *pdev)
>                         mtk_thermal_init_bank(mt, i, apmixed_phys_base,
>                                               auxadc_phys_base, ctrl_id);
>
> -       tzdev =3D devm_thermal_of_zone_register(&pdev->dev, 0, mt,
> -                                             &mtk_thermal_ops);
> -       if (IS_ERR(tzdev))
> -               return PTR_ERR(tzdev);
> +       for (i =3D 0; i <=3D mt->conf->num_sensors; i++) {
> +               tz =3D devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
> +               if (!tz)
> +                       return -ENOMEM;
> +
> +               tz->mt =3D mt;
> +               tz->id =3D i;
> +
> +               tzdev =3D devm_thermal_of_zone_register(&pdev->dev, i,
> +                                                     tz, (i =3D=3D 0) ?
> +                                                     &mtk_thermal_ops
> +                                                     : &mtk_thermal_sens=
or_ops);

Nit: I think the ':' should be at the end of the previous line?

> +
> +               if (IS_ERR(tzdev)) {
> +                       ret =3D PTR_ERR(tzdev);
> +                       if (ret =3D=3D -ENODEV) {
> +                               dev_warn(&pdev->dev,
> +                                        "Can't find thermal zone for sen=
sor %d; sensor skipped.\n", i);
> +                               continue;
> +                       }
> +                       return dev_err_probe(&pdev->dev, ret,
> +                                            "Failed to register thermal =
zone %d.\n", i);

This section could probably be slightly simplified to:

    if (PTR_ERR(tzdev) =3D=3D -ENODEV) {
        dev_warn(...);
        continue;
    }

    return dev_err_cast_probe(&p-dev->dev, tzdev, ...);

I don't think these nitpicks warrant a new revision though.

ChenYu

> +               }
>
> -       ret =3D devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
> -       if (ret)
> -               dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
> +               ret =3D devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
> +               if (ret)
> +                       dev_warn(&pdev->dev,
> +                                "Sensor %d: Error in thermal_add_hwmon_s=
ysfs: %d\n", i, ret);
> +       }
>
>         return 0;
>  }
>
> ---
> base-commit: b589839414be04b2b37e4bf6f84af576c99faf64
> change-id: 20240809-auxadc_thermal-9be338ec8b1c
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
>

