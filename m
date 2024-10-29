Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F06D5B865
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 03:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwCHZzOi2IxF0273uCz1RBIIGqQ3HHsLcLh3T1vj37E=; b=SedIIBEVT/Y2mTPvVPQ2EWoBEg
	l6oQAt8xsH7eu/eTh8euWaCPXOtvo3QJYhPrLCq4DhBBpRJzrRthu8Ln12s3Fem7YDMnxDk8QO0da
	7nQ1xjJq5IJqiQxcJR7is+Z1g8s83mpnhTSbveXtD0gCIIitT/7bF4sHQNjSME/XQ4yGLJ6v0PM0y
	Iudj9R3sJfXkZO6InJwg5o1eRI0t8dikr18rO3qVrrfMwCiMiUZDY7F72MS25oDmsq0OjvMP0IfNj
	P+9J02s4V6Tx246hNbGjanSCWQVOcSYWzO1ckAllT8oOPHH2XWiWilB2/LMgezzoXMRFms7fIPfal
	rz/ivD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cj1-0000000D4PP-1Q4m;
	Tue, 29 Oct 2024 03:16:55 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5chN-0000000D44v-1cPc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 03:15:15 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539fe02c386so5513030e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 20:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730171711; x=1730776511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwCHZzOi2IxF0273uCz1RBIIGqQ3HHsLcLh3T1vj37E=;
        b=IYRhZdCQ++owusMlFx+VYsWhYvb3TiMlSL212g9o9DjDGZ3lJ0u6JKN89rDxys6Zfx
         VoY05NKAJJY5uDkpyRwdqKo2ITZPWwa34uA+71y29Mv8KDZfj8nniWRxyq6U3dJb2E7L
         feHHt+QnlM1qRcGeK2OBzfaGMGWRoa/SVSqVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730171711; x=1730776511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwCHZzOi2IxF0273uCz1RBIIGqQ3HHsLcLh3T1vj37E=;
        b=Y23ELHLHCy6awSDtc4OrhdBjsHreVHT32bRnbUpSVNhIMgTDQmEacg+DLvX6FUMcUH
         +gabUx9gJ2c4bWB8DikrSTSoDJ9pe2rmIXeOBtlaxpfAZu9JhbWHbrKzthvFbs5FVUyh
         1ZSrAmVQjKLZd2VQCb/CP0zcpiVXGm8Djh738Zre/PQXOldgWT6/GQdi0wvHvmqpDeb4
         ClfRjmYEW6orMMkR1pF63oTl5QBSJsQ259bu1fReinlwaZbdagf8e2MicWM0ny/k4ma/
         rmLF2OO4kxBER84IDXYFUEhwefS9SmYXlCzHcSoiWFmtLv2AT3PfW/BHFZlHnDV+PHFR
         Ikjw==
X-Forwarded-Encrypted: i=1; AJvYcCX8HkNo0UVXstTj35II9MK3wa14O1ugQrtd+U0F3S2M/1ctb4He2sbMq4CEnPDhMEQcRJSu1MVWpScSuRJoB+kH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxox0Kwy56j25d4WjOX8WFDcKvhhJLCdv069CiKrjaBnldmhUnc
	b0Mw8x6oWiwWLngsSmziCMBJ/vKNApg+3KCmzTPIEbUtPWZwMJRinGYkQTsLVZmhskaVPTQPUX/
	UKB0ZnRGVBxJTVscpZVSk/fS+msg9G7Frp7Qc
X-Google-Smtp-Source: AGHT+IE/PeX5d+WkadX6mrq9k/9kf941Iyu+kJldmFZ1nqsFjejU2v3e96UXSMIqxJKvoz+7XYik6OvMSya72Oe1z6c=
X-Received: by 2002:a05:6512:3ca4:b0:539:edc9:7400 with SMTP id
 2adb3069b0e04-53b4927d0c1mr147190e87.20.1730171711103; Mon, 28 Oct 2024
 20:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241018073139.1268995-1-wenst@chromium.org> <20241028171901.2484882-1-daniel.lezcano@linaro.org>
 <be7ad677-f7e3-4eab-8b7e-1c375eed3ef7@linaro.org>
In-Reply-To: <be7ad677-f7e3-4eab-8b7e-1c375eed3ef7@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 29 Oct 2024 11:14:59 +0800
Message-ID: <CAGXv+5F8Ga8DF-G4-RtkpQA4b34QtYn8z1WGkSeMtfUkVApNpg@mail.gmail.com>
Subject: Re: [PATCH] thermal/of: support thermal zones w/o trips subnode
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, Icenowy Zheng <uwu@icenowy.me>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_201513_470614_318503D3 
X-CRM114-Status: GOOD (  26.25  )
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

On Tue, Oct 29, 2024 at 1:23=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 28/10/2024 18:19, Daniel Lezcano wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >
> > Although the current device tree binding of thermal zones require the
> > trips subnode, the binding in kernel v5.15 does not require it, and man=
y
> > device trees shipped with the kernel, for example,
> > allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, stil=
l
> > comply to the old binding and contain no trips subnode.
> >
> > Allow the code to successfully register thermal zones w/o trips subnode
> > for DT binding compatibility now.
> >
> > Furtherly, the inconsistency between DTs and bindings should be resolve=
d
> > by either adding empty trips subnode or dropping the trips subnode
> > requirement.
> >
> > Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > [wenst@chromium.org: Reworked logic and kernel log messages]
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
> > Link: https://lore.kernel.org/r/20241018073139.1268995-1-wenst@chromium=
.org
> > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>
> In order to fix a conflict when merging this patch I did the following
> changes. Let me know if you [dis]agree with the changes

Looks fine to me.

Thanks
ChenYu

> This change will go through the 'fixes' branch, so for v6.12
>
> Thanks
>
> > ---
> >   drivers/thermal/thermal_of.c | 21 ++++++++++-----------
> >   1 file changed, 10 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.=
c
> > index a4caf7899f8e..07e09897165f 100644
> > --- a/drivers/thermal/thermal_of.c
> > +++ b/drivers/thermal/thermal_of.c
> > @@ -99,18 +99,15 @@ static struct thermal_trip *thermal_of_trips_init(s=
truct device_node *np, int *n
> >       struct device_node *trips;
> >       int ret, count;
> >
> > +     *ntrips =3D 0;
> > +
> >       trips =3D of_get_child_by_name(np, "trips");
> > -     if (!trips) {
> > -             pr_err("Failed to find 'trips' node\n");
> > -             return ERR_PTR(-EINVAL);
> > -     }
> > +     if (!trips)
> > +             return NULL;
> >
> >       count =3D of_get_child_count(trips);
> > -     if (!count) {
> > -             pr_err("No trip point defined\n");
> > -             ret =3D -EINVAL;
> > -             goto out_of_node_put;
> > -     }
> > +     if (!count)
> > +             return NULL;
> >
> >       tt =3D kzalloc(sizeof(*tt) * count, GFP_KERNEL);
> >       if (!tt) {
> > @@ -133,7 +130,6 @@ static struct thermal_trip *thermal_of_trips_init(s=
truct device_node *np, int *n
> >
> >   out_kfree:
> >       kfree(tt);
> > -     *ntrips =3D 0;
> >   out_of_node_put:
> >       of_node_put(trips);
> >
> > @@ -401,11 +397,14 @@ static struct thermal_zone_device *thermal_of_zon=
e_register(struct device_node *
> >
> >       trips =3D thermal_of_trips_init(np, &ntrips);
> >       if (IS_ERR(trips)) {
> > -             pr_err("Failed to find trip points for %pOFn id=3D%d\n", =
sensor, id);
> > +             pr_err("Failed to parse trip points for %pOFn id=3D%d\n",=
 sensor, id);
> >               ret =3D PTR_ERR(trips);
> >               goto out_of_node_put;
> >       }
> >
> > +     if (!trips)
> > +             pr_info("No trip points found for %pOFn id=3D%d\n", senso=
r, id);
> > +
> >       ret =3D thermal_of_monitor_init(np, &delay, &pdelay);
> >       if (ret) {
> >               pr_err("Failed to initialize monitoring delays from %pOFn=
\n", np);
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

