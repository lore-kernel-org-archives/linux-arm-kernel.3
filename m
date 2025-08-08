Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95CFC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 08:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMJPXbaBPXENRr4gR3xPaKVUyoNmc5Q3jFGAdG8Wanc=; b=xCDuLMcQpv1DK12jeKlPrhSmQv
	qZcKSPSRdvMjb8aiX7GbsdyGI5DBP9vNkq2YfONhIinyd2ljELuciSLceTiMptJzFGtcdeQtIoOjP
	+EUgHyLuGzwjGP5CdDV+2OWeOgfhmsN/xL99hWEoC/Ng6s9SCiOdKkehcuyNJzH6aaGKPs5gPDMwQ
	BcK7qY6ANYaI6rbgOZWytoqoJ90AzJlcjIRhRsdM8+FyhRpGHOBEaywDz2l0XJk5rwphsQdVqCBPy
	wc9vLZy1jTAosVPjQlgqF4TB0LtCG1JdW/9Yx/SHV7VrAk1Ny3nR8gThK3TsjgMmWLepSV0qJsLIM
	bBrvscow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukI69-00000002HbL-23Yh;
	Fri, 08 Aug 2025 08:05:09 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHtv-00000002G62-3St2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:52:32 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e538bfcfc3so375385ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754639551; x=1755244351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMJPXbaBPXENRr4gR3xPaKVUyoNmc5Q3jFGAdG8Wanc=;
        b=bEhloXBHfHB+H4NhetQgsVvs7eArgnGV7M37nH0FAqsyz0bhTo9x/qRnhuvx+791gY
         C/bxST/wktDIW535iSYUNmSl30cWDdjg+w3z7DF9GlCUrv7xlJGD53RlTZ1DZ2iRC6Al
         mzew1W9+SYuixo6uYeTLW8RWhh4KU0oyWJGAOmT6fL3yLRBoBKjU1W/Qx5Cvw3iz2+I6
         jLZpnMNToGVPbcDQ9xvFUo9f7glN8ZflA83XjOEXT9vEurryJlbV0aorC1gsTuFN8gN7
         mlk730ngjvQkqe/ozL9lr7kXN740pQKLJ/r3Snl8ZWh8TR7LdiYD0j6LBMkWJcKCBfXL
         4LqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754639551; x=1755244351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMJPXbaBPXENRr4gR3xPaKVUyoNmc5Q3jFGAdG8Wanc=;
        b=u7nKWXfuWoiW1jdWxaxxesWZjhtc8UUcxQDfXMGrQeCicnIYYkg9c0SbG0eOYvqhYs
         VlKMwqZJ/+BMsMyogbW+Bm+RnULB2sOt94/EByhBe3HIH53g75bLaxMk6xqghxWUuAS1
         u1DNlOZwWtwZkGYoys/nPDyJXBetF/MawZA0Ejc16YkZxhxeZ/HeLr8NuoiiMwVN96DN
         LFdXs18bTQYtT74Xr6zfDi4zFwjcFY1RQ6f36yDEgrix6gf4myXzF5aOdjXXXMkHJnSD
         /J6NRynt578Nu8UBhxCsMRh9n1ap6vdvlSF5X+7V8m6JHbuhmCfuIXYEFm6A4EGwuIev
         3bvg==
X-Forwarded-Encrypted: i=1; AJvYcCX+XZs4RD+f9KXby3YzuWEd/HF9i4d9zb463+WWbCaTMyb8PgJGXNvIg6FPk6w6qUjtHBnUAAalshEGJzdU33G0@lists.infradead.org
X-Gm-Message-State: AOJu0YxD6fWIoSCacDLKTS/jLs74WBJlQuFzE05AFJgu+6yYoN7g8vEz
	0Mj/17dSQTePL6VnRbta2wNV041/Y2vzPsNVqnO5+HVuYU/OtK97+8XPgP8Rj+gO3297AJ1jUaO
	ZmWEHofv+H/ehswQxQ9yY54CKNS23yAs=
X-Gm-Gg: ASbGncvmCHAevdlEbr84GSYAr4ocyk+UH8jcyR5oWcV8TsPyILJW601MlxCEaIcfBno
	00hR69COQ+YF+0zRfJUKhObXc2i1OZ4XXSh8fDWlQ7ab2m4YvPlb/fwd9GKnjD9EJFdKYJJvUBu
	Sy+A0rxynCCBNpvFqOmX2qBf53GExVA3H2sFJ1YhL+pVGJT+MXuKqJ/5VxPwPmaQj3HvdRIYIF0
	RL/1ZQ=
X-Google-Smtp-Source: AGHT+IGSx/MWmNs4iG0YtuQTuuEGzoU+a805glrA7aVFmRpsmJJas6zm7UrtMxrzUkLnNImJh4LmO7qWL0oTSAGoO2Q=
X-Received: by 2002:a05:6e02:2143:b0:3e5:2aa3:e023 with SMTP id
 e9e14a558f8ab-3e5331a73famr38564065ab.18.1754639550620; Fri, 08 Aug 2025
 00:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com> <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
 <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com> <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
 <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com> <CAA+D8AMmQo=TgaJTubLL6xRp0NV3GpeE0JKwhBjmhZjtBnBQjA@mail.gmail.com>
 <0ee5fcbc-a553-4385-b930-b1a40693add5@nxp.com>
In-Reply-To: <0ee5fcbc-a553-4385-b930-b1a40693add5@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Aug 2025 15:52:16 +0800
X-Gm-Features: Ac12FXxZ7K99EU2WpMLSx8j0NsgdbwVE7AL7D4sJwRKCaSEutjkABFPrHX5i5vQ
Message-ID: <CAA+D8AO1GKF+615A8G5G6-LhfBguYOTTsPyh9i4PSf8eHC8VPg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250808_005231_872264_50BEE9A2 
X-CRM114-Status: GOOD (  35.59  )
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

On Fri, Aug 8, 2025 at 3:49=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On 08/08/2025, Shengjiu Wang wrote:
> > On Fri, Aug 8, 2025 at 2:32=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wr=
ote:
> >>
> >> On 08/07/2025, Shengjiu Wang wrote:
> >>> On Wed, Aug 6, 2025 at 2:52=E2=80=AFPM Liu Ying <victor.liu@nxp.com> =
wrote:
> >>>>
> >>>> On 08/06/2025, Shengjiu Wang wrote:
> >>>>> On Tue, Aug 5, 2025 at 4:55=E2=80=AFPM Liu Ying <victor.liu@nxp.com=
> wrote:
> >>>>>>
> >>>>>> On 08/04/2025, Shengjiu Wang wrote:
> >>>>
> >>>> [...]
> >>>>
> >>>>>>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct devic=
e *master, void *data)
> >>>>>>> +{
> >>>>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_pla=
t_data *)data;
> >>>>>>> +     struct imx8mp_hdmi_pai *hdmi_pai;
> >>>>>>> +
> >>>>>>> +     hdmi_pai =3D dev_get_drvdata(dev);
> >>>>>>> +
> >>>>>>> +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> >>>>>>> +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >>>>>>> +     plat_data->priv_audio =3D hdmi_pai;
> >>>>>>> +
> >>>>>>> +     return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct de=
vice *master, void *data)
> >>>>>>> +{
> >>>>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_pla=
t_data *)data;
> >>>>>>> +
> >>>>>>> +     plat_data->enable_audio =3D NULL;
> >>>>>>> +     plat_data->disable_audio =3D NULL;
> >>>>>>> +     plat_data->priv_audio =3D NULL;
> >>>>>>
> >>>>>> Do you really need to set these ptrs to NULL?
> >>>>>
> >>>>> yes.  below code in dw-hdmi.c use the pdata->enable_audio as condit=
ion.
> >>>>
> >>>> Note that this is all about tearing down components.
> >>>> If this is done properly as the below snippet of pseudo-code, then
> >>>> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() w=
on't be
> >>>> called after audio device is removed by dw_hdmi_remove().  So, it's =
unnecessary
> >>>> to set these pointers to NULL here.
> >>>>
> >>>> imx8mp_dw_hdmi_unbind()
> >>>> {
> >>>>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
> >>>>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
> >>>> }
> >>>>
> >>>> BTW, I suggest the below snippet[1] to bind components.
> >>>>
> >>>> imx8mp_dw_hdmi_bind()
> >>>> {
> >>>>    component_bind_all(); // imx8mp_hdmi_pai_bind()
> >>>>                          //   set pdata->{enable,disable}_audio
> >>>>    dw_hdmi_probe(); // hdmi->audio =3D platform_device_register_full=
(&pdevinfo);
> >>>> }
> >>>
> >>> Looks like we should use dw_hdmi_bind() here to make unbind -> bind w=
ork.
> >>
> >> I don't get your idea here.
> >>
> >> What are you trying to make work?
> >> Why dw_hdmi_probe() can't be used?
> >> How does dw_hdmi_bind() help here?
> >
> > bind() is ok.  but unbind(),  then bind() there is an issue.
> >
> >>
> >>> But can't get the encoder pointer.  the encoder pointer is from lcdif=
_drv.c,
> >>> the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, th=
en pvi,
> >>> then lcdif, because current implementation in lcdif and pvi driver.
> >>
> >> We use deferral probe to make sure the probe sequence is
> >> DW_HDMI -> PVI -> LCDIF.
> >>
> >> LCDIF driver would call devm_drm_of_get_bridge() to get the next bridg=
e PVI
> >> and it defers probe if devm_drm_of_get_bridge() returns ERR_PTR(-EPROB=
E_DEFER).
> >> Same to PVI driver, it would call of_drm_find_bridge() to get the next=
 bridge
> >> DW_HDMI and defers probe if needed.
> >
> > right, probe is no problem,  but after probe,  if unbind pai, hdmi_tx,
> >  then bind
> > them again,  there is a problem,  because no one call the
> > drm_bridge_attach() again.
>
> In my mind, this is a common issue as DRM bridges are not properly detach=
ed
> and attached again.
> For now, only drm_encoder_cleanup() calls drm_bridge_detach().
>
> Anyway, this issue is not introduced by this patch series, i.e. it's alre=
ady
> there.

Ok,  thanks for clarification.

best regards
shengjiu Wang
>
> >
> >>
> >>>
> >>> Should the lcdif and pvi driver be modified to use component helper?
> >>
> >> Why should they use component helper?
> >>
> >> BTW, I've tried testing the snippets suggested by me on i.MX8MP EVK an=
d
> >> the components bind successfully:
> >
> > right, probe is no problem. but if try to unbind() then bind, there is =
issue.
>
> I don't think the DRM bridge detach/attach issue would be addressed by
> using component helper.
>
> >
> > best regards
> > shengjiu Wang
> >>
> >> cat /sys/kernel/debug/device_component/32fd8000.hdmi
> >> aggregate_device name                                            statu=
s
> >> ----------------------------------------------------------------------=
-
> >> 32fd8000.hdmi                                                     boun=
d
> >>
> >> device name                                                      statu=
s
> >> ----------------------------------------------------------------------=
-
> >> 32fc4800.audio-bridge                                             boun=
d
> >>
> >>> This seems out of the scope of this patch set.
> >>>
> >>> Best regards
> >>> Shengjiu Wang
> >>
> >> [...]
> >>
> >> --
> >> Regards,
> >> Liu Ying
>
>
> --
> Regards,
> Liu Ying

