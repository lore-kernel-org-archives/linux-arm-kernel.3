Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D21C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 00:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FOpMiYLMMX182EYvmPfUF40zpuQGKvY/VPcmu9Q4Ac=; b=r/gYVqTTeZ8QO6EwKsgMu4/MMq
	LElm60veeMCsv6mJ+ljD8F5emp4EbZ0u9Xkecuz/TsNSVFaCnO2DCglC2/JQCV7fzNO2yFU6/2mOi
	4Q5xImtPFUET24kGc8ExPX6Po9c8C+cVnK0cDqXyQR5QLV78eCM5tAcWs5en27mtsWNSHBSQhePdq
	PHNf3juupBdYUY7IB4HTEUWzg/PFnfHRRh0YCb8uMfaQFMEBXkUt2wBxZOiHJ6sWR9vYPnJmCB5Ow
	z0WVqQNyweSmbWW82h7yhtPirAYA9DUki411jAUSjRAr63opeXKms44zhOMtlvYLo2FI7PLFVhRzV
	UUlwubQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMFTu-00000009Pms-45Tl;
	Tue, 03 Jun 2025 00:26:18 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMFRf-00000009PfX-0MDF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 00:24:00 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-551ed563740so6330935e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 17:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748910236; x=1749515036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FOpMiYLMMX182EYvmPfUF40zpuQGKvY/VPcmu9Q4Ac=;
        b=S7WOR9wTRYAOYpHQuzk901aO2581J7B0308x2DAjM0FErdM482mpYJuMDvdm2CQ56S
         CPZKRc2hzKWhyW4NshJmzSOLeRX5Qg5/S7cX5S6EVYjPy79jg/8DzAIGf94X8VMN5jHI
         bPIBlVK4Tg03KXykrId1+yWLTAY/GSuuD6nu8zFGUYgxmWHqUkLnRoHe3Ygz7HF/NHKS
         eHDCyPHScs2+vGfnECR6xbQp9lRMW8sF8BhKVS4YoMs5q9xHlmgUxhV4KyzGfdeyw/52
         Y9sXtZzIokTEzyTLG9quXWLbyvmsF5Ro4BYLaL0hdq5AX7O05xNo5TfnM0GiHS61Xb8v
         G8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748910236; x=1749515036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FOpMiYLMMX182EYvmPfUF40zpuQGKvY/VPcmu9Q4Ac=;
        b=cwiZ1+lxLohWQaxBEuqjbEv2qeXsM9NKAeBmmWAurQdnAMs128FZGbyKgiNMtrwpVk
         ICCFUuT5ee6m+Db3RRDqlyKo78XDtqoKUwVYiUojXfx9floqsJO/1C5N/pjQ++EiLv/p
         T6hV+gdwMaOtE/wpqNYhL//Y0/FHkk36hI1+/IsSbYDqT2BTEakX/x4ZnLJmECZl0adv
         rsUqt3LzzAgwDl+AbkfHAPcPOEjwxYxUUlNzShjC0NHn/DMiePsa7BhDHQhethggIRsc
         jiKJ+hfuAYQ85gWbDCuHEPCB7MFf50w010UxvKKQIczpEskfrrf/KwCJQOvKFMUb0Vjh
         lH1A==
X-Forwarded-Encrypted: i=1; AJvYcCX/8Z9EaK2M9saZ7u8DwVRF64ibHs7PZts2vrtMjD/3EhPI2cCLoBSa/0L42fSd4NKAZQsq4shGsJcgL6lGPYJX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5SczfooJD+4SSWxd3MrL1QkiMUXdj2eC5q/y36ymyv3lFVV0/
	htMEBdyM2asoyNm7cQqZDg07/1hHJgOn80V8TwoBHeEprKDubyOdh8PL/eeAfxXPhWYiRCXCE9c
	lHGTrpYVNzmFXqqCGc1dIwgHhvOXWveL5MByjqnN1
X-Gm-Gg: ASbGncuJfprAcEpb67UjmMy5TFQSwFU9C2tVfNCV/5dTh7WE9uQkzaV+p5KafXlLTzq
	ap4GDNCX3ivSzyyIyGnROWFhlAlSaaU4CL3Hc+bjECvMjqV6XlVkl72Cn+qJ8lhwHk832lSYdTc
	jIyGbhZUHS9TeClNJoZePmY4d+xfYgRiCfXssGvcJQSCMZmzF8RcX3p8nab2CjSWZDtvWhX647V
	bmjE9ZR7lKeazo=
X-Google-Smtp-Source: AGHT+IF0eNhrWbj9hQxfD1unRyrkdD0kp+Z0yS9s1IOEtVghOX4coHO+O1yKo9y4gO22c3TpyInE02NwNDsomxX6gBM=
X-Received: by 2002:a05:6512:b86:b0:553:291f:92e with SMTP id
 2adb3069b0e04-5533b92e470mr4356320e87.39.1748910235984; Mon, 02 Jun 2025
 17:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org> <20250523134025.75130-3-ulf.hansson@linaro.org>
In-Reply-To: <20250523134025.75130-3-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 2 Jun 2025 17:23:19 -0700
X-Gm-Features: AX0GCFs2XcbroxtBQgFIVghV_VdooKR0d1OXApi_zYrHQREB3E38JByH61YRbu0
Message-ID: <CAGETcx-hsKb_BDPLuSM3A_ac0x6Z4NOq2pCmjKKJHTYbYZPwcA@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] pmdomain: core: Add a bus and a driver for genpd providers
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_172359_153566_71E3AF4F 
X-CRM114-Status: GOOD (  31.85  )
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

On Fri, May 23, 2025 at 6:40=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> When we create a genpd via pm_genpd_init() we are initializing a
> corresponding struct device for it, but we don't add the device to any
> bus_type. It has not really been needed as the device is used as cookie t=
o
> help us manage OPP tables.
>
> However, to prepare to make better use of the device let's add a new genp=
d
> provider bus_type and a corresponding genpd provider driver. Subsequent
> changes will make use of this.
>
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 9a66b728fbbf..da515350c65b 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -27,6 +27,11 @@
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>
> +/* The parent for genpd_provider devices. */
> +static struct device genpd_provider_bus =3D {
> +       .init_name =3D "genpd_provider",
> +};
> +
>  #define GENPD_RETRY_MAX_MS     250             /* Approximate */
>
>  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)         \
> @@ -44,6 +49,14 @@ static DEFINE_IDA(genpd_ida);
>  static LIST_HEAD(gpd_list);
>  static DEFINE_MUTEX(gpd_list_lock);
>
> +#define to_genpd_provider_drv(d) container_of(d, struct genpd_provider_d=
rv, drv)
> +
> +struct genpd_provider_drv {
> +       struct device_driver drv;
> +       int (*probe)(struct device *dev);
> +       void (*remove)(struct device *dev);
> +};
> +
>  struct genpd_lock_ops {
>         void (*lock)(struct generic_pm_domain *genpd);
>         void (*lock_nested)(struct generic_pm_domain *genpd, int depth);
> @@ -2225,6 +2238,26 @@ static int genpd_set_default_power_state(struct ge=
neric_pm_domain *genpd)
>         return 0;
>  }
>
> +static int genpd_provider_bus_probe(struct device *dev)
> +{
> +       struct genpd_provider_drv *drv =3D to_genpd_provider_drv(dev->dri=
ver);
> +
> +       return drv->probe(dev);
> +}
> +
> +static void genpd_provider_bus_remove(struct device *dev)
> +{
> +       struct genpd_provider_drv *drv =3D to_genpd_provider_drv(dev->dri=
ver);
> +
> +       drv->remove(dev);
> +}

Not sure if I'm missing some corner case you found out, but you don't
need these stubs just to call the drv ops. Driver core does it anyway
if the bus probe/remove functions are missing.

> +
> +static const struct bus_type genpd_provider_bus_type =3D {
> +       .name           =3D "genpd_provider",
> +       .probe          =3D genpd_provider_bus_probe,
> +       .remove         =3D genpd_provider_bus_remove,
> +};
> +
>  static void genpd_provider_release(struct device *dev)
>  {
>         /* nothing to be done here */
> @@ -2262,6 +2295,8 @@ static int genpd_alloc_data(struct generic_pm_domai=
n *genpd)
>         genpd->gd =3D gd;
>         device_initialize(&genpd->dev);
>         genpd->dev.release =3D genpd_provider_release;
> +       genpd->dev.bus =3D &genpd_provider_bus_type;
> +       genpd->dev.parent =3D &genpd_provider_bus;
>
>         if (!genpd_is_dev_name_fw(genpd)) {
>                 dev_set_name(&genpd->dev, "%s", genpd->name);
> @@ -3355,9 +3390,61 @@ int of_genpd_parse_idle_states(struct device_node =
*dn,
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>
> +static int genpd_provider_probe(struct device *dev)
> +{
> +       return 0;
> +}
> +
> +static void genpd_provider_remove(struct device *dev)
> +{
> +}

Same might apply here.

-Saravana

> +
> +static void genpd_provider_sync_state(struct device *dev)
> +{
> +}
> +
> +static struct genpd_provider_drv genpd_provider_drv =3D {
> +       .drv =3D {
> +               .name =3D "genpd_provider",
> +               .bus =3D &genpd_provider_bus_type,
> +               .sync_state =3D genpd_provider_sync_state,
> +               .suppress_bind_attrs =3D true,
> +       },
> +       .probe =3D genpd_provider_probe,
> +       .remove =3D genpd_provider_remove,
> +};
> +
>  static int __init genpd_bus_init(void)
>  {
> -       return bus_register(&genpd_bus_type);
> +       int ret;
> +
> +       ret =3D device_register(&genpd_provider_bus);
> +       if (ret) {
> +               put_device(&genpd_provider_bus);
> +               return ret;
> +       }
> +
> +       ret =3D bus_register(&genpd_provider_bus_type);
> +       if (ret)
> +               goto err_dev;
> +
> +       ret =3D bus_register(&genpd_bus_type);
> +       if (ret)
> +               goto err_prov_bus;
> +
> +       ret =3D driver_register(&genpd_provider_drv.drv);
> +       if (ret)
> +               goto err_bus;
> +
> +       return 0;
> +
> +err_bus:
> +       bus_unregister(&genpd_bus_type);
> +err_prov_bus:
> +       bus_unregister(&genpd_provider_bus_type);
> +err_dev:
> +       device_unregister(&genpd_provider_bus);
> +       return ret;
>  }
>  core_initcall(genpd_bus_init);
>
> --
> 2.43.0
>

