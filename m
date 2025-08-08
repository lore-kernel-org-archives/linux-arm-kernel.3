Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FB9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 06:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfJ96l0L79uC3QqMW/tKUozVfcbzbbqgdHMrzI/pgq0=; b=jZYlUecYDChwRn+Bou8+steA70
	V8iIsEYz+hefMcANmg+3s07CbGx7QzMBYLs7ruHy7Ku2acEjUChcyHlA3Rwm6JSrcAU4/Kg+h/Rje
	Fo7zfF+VXawkXp+u1ZdfMbGK1dKerRsh//6sgMxK9fIUDnNtwK7dHX4jU3Hf9Xa7B/gX7mfBahSGe
	lmKFxew4yVCiiQFqljTJwm1CJUMxy94dz8kTur6+hEg/k1ZS5hDwHwRRgu5AylIsEbzwboAN+gApX
	n5jnvwoAe84a5t7dMz5Yx/0/jZ3j5VZNxUMjBIVuVNFUxGsU/B+Oed1IFHtE5a32ZgHFss8ZO/MFT
	8fF6tbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukGvN-000000027zl-1DXU;
	Fri, 08 Aug 2025 06:49:57 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukGrF-000000027Yq-0tqb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 06:45:42 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e3f378ea68so15881295ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 23:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754635540; x=1755240340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfJ96l0L79uC3QqMW/tKUozVfcbzbbqgdHMrzI/pgq0=;
        b=SyRoJPxgFe4UYCwA61Y2RAimr/WP9AR1GDA3mJHiaX0tqS6EMWelUv88Hl13OwSN+q
         38iUBIWqYLSkI6TWHTc+NIWVtObJhVFH3rOuuwrN+q8SAu2EUoHq8OIbRnc4c+qnWeku
         YVN+g/tRHlNFC6+QQcMCDWd2D9J1q+ZVh7mxCTjIVA4CFb529BkS1fsihvc/Va4s+ivK
         sJc8q3q9D98NVVbNhm1Dvx9n3A1NjG32lYVkljMwLnI70LW2xPntkbO0gh72fdit64gv
         E4LqaVcvLp6nMYy7qNwZ4+voy0/82wIXr343GbWGbWDUjC4raEfZS5f1PgqmCTw0LWhG
         ge7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754635540; x=1755240340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfJ96l0L79uC3QqMW/tKUozVfcbzbbqgdHMrzI/pgq0=;
        b=lGp3mZUdhOw/cA7RAa83d1ymDL6yDk10PwQvHheVeMJ8p4/Hn2CVqdj7KRYfgG6faU
         LuiyhBdk6U+EAB2OJnf1fl8r3wlFO0q9H3sXoFsGinpUsozSAaRu5Xm8/5iLfRjhdPcE
         NSSklNx9dWMflKG48AmosAc+eFX3bvjIs3qieCA4HP/kYeDD9kH4U7709dzIWnrK3tvh
         2q+6yMeIsCAzlTVLImv+brnNwJW8UlJBVuUqAUISIAAjwpwO+FueDXk9hYIx2ani4AlF
         +0MfmhoElHFfsbLYebkwZpeNXanVD3xFMMLI9ECfa1PM3U9gEEsu8Sm2WBUp/ULhP6jA
         V5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRbsga6stskFv2yT7yEB8PCT2tUN6MyoiiF9mZf0p4JGtE08SrcaZ/0Dwn0noxYshcf+KKsO5P1NTn1dyDzyOJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwY4JR03ypgsnQamAyntLdtiFXoXZX8eJFqkHh40thC0DYc/T1r
	36jEl5pW47F+HeE0h8javk+5K5qfiB6b45jWwSc2wxPDu8R32YgUTsCLTOZk/jwcIcZWix/WfrT
	6M/4fKww2r9YTLBJkXxI0rW8VDfPEXwA=
X-Gm-Gg: ASbGnctb2RkaIjxbvRCeamkgHTgvE8i5Y8r2S6dDSIoWltU+B8G1RP/ZAyQ49ScQ8L8
	CXFA2lhmcnfwzoJaLnNh9nbF1fxJ+L4TYjB0TR9xF7yQdr+m0k5f08oqXdNDSIV/zYJ/lrqgDiu
	VHiUUPsDOJxbQb0dThPcZNnvaz+sgbPMC6SeSzNqdJbH9QgdR6AE38RKHAeXITVYHXN9JgnuZSh
	LATB0o=
X-Google-Smtp-Source: AGHT+IGltElZVlwhxw9uDPM97pmJeDSJgwVBwjLX4g172vFNLkOj72zAp9AwhEXJbpTGZUTj/wZcUv/NAwx9DgBOto4=
X-Received: by 2002:a05:6e02:1a07:b0:3e3:a49a:917b with SMTP id
 e9e14a558f8ab-3e53306e84fmr37599135ab.2.1754635540083; Thu, 07 Aug 2025
 23:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com> <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
 <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com> <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
 <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
In-Reply-To: <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Aug 2025 14:45:26 +0800
X-Gm-Features: Ac12FXwPBbMoH09jFjYWwfKVloaD-hbqz3Zq3uo6wZJ3wJC3FWnXebP2M-e4hG8
Message-ID: <CAA+D8AMmQo=TgaJTubLL6xRp0NV3GpeE0JKwhBjmhZjtBnBQjA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_234541_255372_AA624E01 
X-CRM114-Status: GOOD (  33.69  )
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

On Fri, Aug 8, 2025 at 2:32=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On 08/07/2025, Shengjiu Wang wrote:
> > On Wed, Aug 6, 2025 at 2:52=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wr=
ote:
> >>
> >> On 08/06/2025, Shengjiu Wang wrote:
> >>> On Tue, Aug 5, 2025 at 4:55=E2=80=AFPM Liu Ying <victor.liu@nxp.com> =
wrote:
> >>>>
> >>>> On 08/04/2025, Shengjiu Wang wrote:
> >>
> >> [...]
> >>
> >>>>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device =
*master, void *data)
> >>>>> +{
> >>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_=
data *)data;
> >>>>> +     struct imx8mp_hdmi_pai *hdmi_pai;
> >>>>> +
> >>>>> +     hdmi_pai =3D dev_get_drvdata(dev);
> >>>>> +
> >>>>> +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> >>>>> +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >>>>> +     plat_data->priv_audio =3D hdmi_pai;
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct devi=
ce *master, void *data)
> >>>>> +{
> >>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_=
data *)data;
> >>>>> +
> >>>>> +     plat_data->enable_audio =3D NULL;
> >>>>> +     plat_data->disable_audio =3D NULL;
> >>>>> +     plat_data->priv_audio =3D NULL;
> >>>>
> >>>> Do you really need to set these ptrs to NULL?
> >>>
> >>> yes.  below code in dw-hdmi.c use the pdata->enable_audio as conditio=
n.
> >>
> >> Note that this is all about tearing down components.
> >> If this is done properly as the below snippet of pseudo-code, then
> >> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() won=
't be
> >> called after audio device is removed by dw_hdmi_remove().  So, it's un=
necessary
> >> to set these pointers to NULL here.
> >>
> >> imx8mp_dw_hdmi_unbind()
> >> {
> >>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
> >>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
> >> }
> >>
> >> BTW, I suggest the below snippet[1] to bind components.
> >>
> >> imx8mp_dw_hdmi_bind()
> >> {
> >>    component_bind_all(); // imx8mp_hdmi_pai_bind()
> >>                          //   set pdata->{enable,disable}_audio
> >>    dw_hdmi_probe(); // hdmi->audio =3D platform_device_register_full(&=
pdevinfo);
> >> }
> >
> > Looks like we should use dw_hdmi_bind() here to make unbind -> bind wor=
k.
>
> I don't get your idea here.
>
> What are you trying to make work?
> Why dw_hdmi_probe() can't be used?
> How does dw_hdmi_bind() help here?

bind() is ok.  but unbind(),  then bind() there is an issue.

>
> > But can't get the encoder pointer.  the encoder pointer is from lcdif_d=
rv.c,
> > the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, then=
 pvi,
> > then lcdif, because current implementation in lcdif and pvi driver.
>
> We use deferral probe to make sure the probe sequence is
> DW_HDMI -> PVI -> LCDIF.
>
> LCDIF driver would call devm_drm_of_get_bridge() to get the next bridge P=
VI
> and it defers probe if devm_drm_of_get_bridge() returns ERR_PTR(-EPROBE_D=
EFER).
> Same to PVI driver, it would call of_drm_find_bridge() to get the next br=
idge
> DW_HDMI and defers probe if needed.

right, probe is no problem,  but after probe,  if unbind pai, hdmi_tx,
 then bind
them again,  there is a problem,  because no one call the
drm_bridge_attach() again.

>
> >
> > Should the lcdif and pvi driver be modified to use component helper?
>
> Why should they use component helper?
>
> BTW, I've tried testing the snippets suggested by me on i.MX8MP EVK and
> the components bind successfully:

right, probe is no problem. but if try to unbind() then bind, there is issu=
e.

best regards
shengjiu Wang
>
> cat /sys/kernel/debug/device_component/32fd8000.hdmi
> aggregate_device name                                            status
> -----------------------------------------------------------------------
> 32fd8000.hdmi                                                     bound
>
> device name                                                      status
> -----------------------------------------------------------------------
> 32fc4800.audio-bridge                                             bound
>
> > This seems out of the scope of this patch set.
> >
> > Best regards
> > Shengjiu Wang
>
> [...]
>
> --
> Regards,
> Liu Ying

