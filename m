Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AD0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tWMOA3+MxqIET7zOeogQlZpQrCQ4ulH5geagIzb9wU=; b=tPR+uhqVMCC9DVng9djc2kj/hn
	sYegUS0ie8Y7z3T3Q34HGiBo3qA5AbLY3tZuuPx1v3n3bbcFvA3WVP7X8lYYxLeG9t3Gnfi9BLvOJ
	R3hasZHm95hWrutvx1af2n5Ijs/YCzO/D7JOupIa8Hwc9JO9NvY08WifuafWNE2Fv//v+qmsS5Tih
	5RjPOtDQj2dV02gJkP0GznGjb4xnRkZv1I8ZD35cktHwQ/ouxePbaiNgyOnRTQXyMd9PlgKu6Hu0S
	BsLHBMIsH9h/zzTtJnYHZut0WyvDTHW1dnpCcfu0UvMQRqdtGp72uoNU7pTEi4FCZUP26C1pePCOV
	labf2A1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujygd-00000000MFZ-1Sqp;
	Thu, 07 Aug 2025 11:21:31 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyKL-00000000J10-2vUM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:58:30 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e51a12f1a0so2882895ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754564308; x=1755169108; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tWMOA3+MxqIET7zOeogQlZpQrCQ4ulH5geagIzb9wU=;
        b=U7WT/PEZx8ToHDUb1maBn84e7RdKyXhlpjjPFaIRDQlbED5XPuQ7VLXv/Os7OhI/bO
         I9HQFJ9etYuzPyplf8lC5mXGNflDSGQHVv2GGjZgz4pTkT+FAH4fDSicPy4EpTKAXna9
         yhONI/NDS/8HE5RASFmY6O3W3p8hgwTUFJWnbExLdI5w5ngkdSjYU9eXGBsaHMZy+wzO
         MWXjnuMiFN5T+SQ0LFljD+m9acLTSYV48Qa0nxWdu8n1V5XfxPIPkOqhYEhtZM5wP9jb
         xL4mlhXRLsZnPbCdcSFTf6ZukxVu19GdDDCNDNdntRrBjX6dyDs4bcx5EjFQiZmEFzi0
         5E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564308; x=1755169108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tWMOA3+MxqIET7zOeogQlZpQrCQ4ulH5geagIzb9wU=;
        b=MEHQe9puOCqpeHb/kHKGYengDchGKHD9NnZ64RLsjkZ2iyXjvzGEi586VskNaFpFjv
         nb8hYlJBPbduMkdWgDLCG/30jDggqEOME0rGDAbPjUAVSSAgS8zrA3KacZKPBqy1lfBT
         4PB0Mo7dRizPd9d/kYMgMPoFwKK5MxmrIdkEBHc7D1oRppGOTHdqsTEsN6zjAVsDeqeG
         6K9LqgnvyMuDHcc//5GXcBZ+8LOOmFk2JYgX8/ZHulGo+pf+db6D6VCDZLQRLrJOGXgj
         WiLvyQVnj9ltvHXvBJQ4NHsm39736xNFjRS5up4WuXnQNhqr0lEfQd35Ez/1DkfyZz6n
         tSMg==
X-Forwarded-Encrypted: i=1; AJvYcCUGAmlkLiUdcGKr2nHO2fLB0tcjdD3NUHxtBnjydX94XcVNRH0gsLddYYh4a46l60hHu7yf8X1ETvmuAzI15EoD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz24CcvRhuFvRrhi04/ao39RiRqujIVYvmllIr+Ncv0RsFKNmRH
	8kJQ0w9xmRUfMXw8u7gFodN57HEGNOZ6e0uCB0hqLhwPUYqGV8MYnhynQezeuhDIHPfIWc0CbJt
	aKszOe/ScaUYFcjIdLMmg3MRJuEZXSkk=
X-Gm-Gg: ASbGncsfV+cz86hI2er0FZH+ONvrXkJz46VRPjGSPVkTEHkHOltV6V9qQd2auTFsoDT
	q+57GGUayEWJCk28htHPuxOtcXOExK9KKDtRbC1UG44XX8fg4zKWn06+LU9kACektWi7vHcKn1d
	hno45V0Uf1JXKyNRN58qqrDBSzu8I2kQ3GAIFvOhNMm2jJFVPT6Hl6by5+0ti0aPZlF54MPAquQ
	JZej3c=
X-Google-Smtp-Source: AGHT+IHFyEqQlwA4nzQRnsXvPUsGwZOgKB36m7+Ke65jmW1lXiVYvMW77eXhUFaYX4r2OmzVe+1dFNu46sXVYvnzZ80=
X-Received: by 2002:a05:6e02:18c7:b0:3df:3598:7688 with SMTP id
 e9e14a558f8ab-3e51b93cc8dmr120096585ab.21.1754564308346; Thu, 07 Aug 2025
 03:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com> <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com> <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
In-Reply-To: <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Aug 2025 18:58:15 +0800
X-Gm-Features: Ac12FXwUPM-Znt5cq2SUHVDzi6o3wmoQ462FD5iaVLkULQVZBddMO5yf_2W0GwQ
Message-ID: <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250807_035829_739538_5DF319AF 
X-CRM114-Status: GOOD (  45.01  )
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

On Wed, Aug 6, 2025 at 2:52=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On 08/06/2025, Shengjiu Wang wrote:
> > On Tue, Aug 5, 2025 at 4:55=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wr=
ote:
> >>
> >> On 08/04/2025, Shengjiu Wang wrote:
>
> [...]
>
> >>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *m=
aster, void *data)
> >>> +{
> >>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_da=
ta *)data;
> >>> +     struct imx8mp_hdmi_pai *hdmi_pai;
> >>> +
> >>> +     hdmi_pai =3D dev_get_drvdata(dev);
> >>> +
> >>> +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> >>> +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >>> +     plat_data->priv_audio =3D hdmi_pai;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device=
 *master, void *data)
> >>> +{
> >>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_da=
ta *)data;
> >>> +
> >>> +     plat_data->enable_audio =3D NULL;
> >>> +     plat_data->disable_audio =3D NULL;
> >>> +     plat_data->priv_audio =3D NULL;
> >>
> >> Do you really need to set these ptrs to NULL?
> >
> > yes.  below code in dw-hdmi.c use the pdata->enable_audio as condition.
>
> Note that this is all about tearing down components.
> If this is done properly as the below snippet of pseudo-code, then
> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() won't =
be
> called after audio device is removed by dw_hdmi_remove().  So, it's unnec=
essary
> to set these pointers to NULL here.
>
> imx8mp_dw_hdmi_unbind()
> {
>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
> }
>
> BTW, I suggest the below snippet[1] to bind components.
>
> imx8mp_dw_hdmi_bind()
> {
>    component_bind_all(); // imx8mp_hdmi_pai_bind()
>                          //   set pdata->{enable,disable}_audio
>    dw_hdmi_probe(); // hdmi->audio =3D platform_device_register_full(&pde=
vinfo);
> }

Looks like we should use dw_hdmi_bind() here to make unbind -> bind work.
But can't get the encoder pointer.  the encoder pointer is from lcdif_drv.c=
,
the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, then pvi=
,
then lcdif, because current implementation in lcdif and pvi driver.

Should the lcdif and pvi driver be modified to use component helper?
This seems out of the scope of this patch set.

Best regards
Shengjiu Wang
>
> >
> >         if (pdata->enable_audio)
> >                 pdata->enable_audio(hdmi,
> >                                     hdmi->channels,
> >                                     hdmi->sample_width,
> >                                     hdmi->sample_rate,
> >                                     hdmi->sample_non_pcm,
> >                                     hdmi->sample_iec958);
> >
> >
> >>
>
> [...]
>
> >>> +     return component_add(dev, &imx8mp_hdmi_pai_ops);
> >>
> >> Imagine that users could enable this driver without enabling imx8mp-hd=
mi-tx
> >> driver, you may add the component in this probe() callback only and mo=
ve all
> >> the other stuff to bind() callback to avoid unnecessary things being d=
one here.
> >
> > component helper functions don't have such dependency that the aggregat=
e
> > driver or component driver must be probed or not.  if imx8mp-hdmi-tx is=
 not
> > enabled, there is no problem, just the bind() callback is not called.
>
> I meant I'd write imx8mp_hdmi_pai_probe() as below snippet and do all the
> other stuff in imx8mp_hdmi_pai_bind().  This ensures minimum things are d=
one
> in imx8mp_hdmi_pai_probe() if imx8mp-hdmi-tx doesn't probe.
>
> static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> {
>         return component_add(&pdev->dev, &imx8mp_hdmi_pai_ops);
> }
>
> >
> >>
> >>> +}
> >>> +
> >>> +static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
> >>> +{
> >>> +     component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
> >>> +}
> >>> +
> >>> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] =3D {
> >>> +     { .compatible =3D "fsl,imx8mp-hdmi-pai" },
> >>> +     { /* Sentinel */ }
> >>> +};
> >>> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> >>> +
> >>> +static struct platform_driver imx8mp_hdmi_pai_platform_driver =3D {
> >>> +     .probe          =3D imx8mp_hdmi_pai_probe,
> >>> +     .remove         =3D imx8mp_hdmi_pai_remove,
> >>> +     .driver         =3D {
> >>> +             .name   =3D "imx8mp-hdmi-pai",
> >>> +             .of_match_table =3D imx8mp_hdmi_pai_of_table,
> >>> +     },
> >>> +};
> >>> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> >>> +
> >>> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> >>> +MODULE_LICENSE("GPL");
> >>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gp=
u/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>> index 1e7a789ec289..ee08084d2394 100644
> >>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>> @@ -5,11 +5,13 @@
> >>>   */
> >>>
> >>>  #include <linux/clk.h>
> >>> +#include <linux/component.h>
> >>>  #include <linux/mod_devicetable.h>
> >>>  #include <linux/module.h>
> >>>  #include <linux/platform_device.h>
> >>>  #include <drm/bridge/dw_hdmi.h>
> >>>  #include <drm/drm_modes.h>
> >>> +#include <drm/drm_of.h>
> >>>
> >>>  struct imx8mp_hdmi {
> >>>       struct dw_hdmi_plat_data plat_data;
> >>> @@ -79,11 +81,46 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_p=
hy_ops =3D {
> >>>       .update_hpd     =3D dw_hdmi_phy_update_hpd,
> >>>  };
> >>>
> >>> +static int imx8mp_dw_hdmi_bind(struct device *dev)
> >>> +{
> >>> +     struct dw_hdmi_plat_data *plat_data;
> >>> +     struct imx8mp_hdmi *hdmi;
> >>> +     int ret;
> >>> +
> >>> +     hdmi =3D dev_get_drvdata(dev);
> >>> +     plat_data =3D &hdmi->plat_data;
> >>> +
> >>> +     ret =3D component_bind_all(dev, plat_data);
> >>> +     if (ret)
> >>> +             return dev_err_probe(dev, ret, "component_bind_all fail=
ed!\n");
> >>
> >> As component_bind_all() would bind imx8mp-hdmi-pai and hence set
> >> {enable,disable}_audio callbacks, you need to call dw_hdmi_probe() aft=
er
> >> component_bind_all() instead of too early in probe() callback.
> >
> > There is no such dependency.
> > Maybe you mixed the hdmi->enable_audio() with pdata->enable_audio().
>
> As the above snippet[1] shows, once dw_hdmi_probe() registers audio devic=
e,
> the audio device could be functional soon after audio driver probes, henc=
e
> hdmi->enable_audio() would be called and hence pdata->enable_audio() woul=
d
> be called. So, you need to set pdata->enable_audio() before dw_hdmi_probe=
()
> is called, otherwise pdata->enable_audio could be NULL when is called by
> audio driver.
>
> [...]
>
> >>> +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> >>> +     if (remote && of_device_is_available(remote)) {
> >>
> >> Doesn't of_graph_get_remote_node() ensure that remote is avaiable?
> >
> > No.  'remote' is the node,  not the 'device'.
>
> See of_device_is_available() is called by of_graph_get_remote_node():
>
> struct device_node *of_graph_get_remote_node(const struct device_node *no=
de,
>                                              u32 port, u32 endpoint)
> {
>         struct device_node *endpoint_node, *remote;
>
>         endpoint_node =3D of_graph_get_endpoint_by_regs(node, port, endpo=
int);
>         if (!endpoint_node) {
>                 pr_debug("no valid endpoint (%d, %d) for node %pOF\n",
>                          port, endpoint, node);
>                 return NULL;
>         }
>
>         remote =3D of_graph_get_remote_port_parent(endpoint_node);
>         of_node_put(endpoint_node);
>         if (!remote) {
>                 pr_debug("no valid remote node\n");
>                 return NULL;
>         }
>
>         if (!of_device_is_available(remote)) {
>              ^~~~~~~~~~~~~~~~~~~~~~
>                 pr_debug("not available for remote node\n");
>                 of_node_put(remote);
>                 return NULL;
>         }
>
>         return remote;
> }
> EXPORT_SYMBOL(of_graph_get_remote_node);
>
> >
> >>
> >>> +             drm_of_component_match_add(dev, &match, component_compa=
re_of, remote);
> >>> +
> >>> +             of_node_put(remote);
> >>> +
> >>> +             ret =3D component_master_add_with_match(dev, &imx8mp_dw=
_hdmi_ops, match);
> >>> +             if (ret)
> >>> +                     dev_warn(dev, "Unable to register aggregate dri=
ver\n");
> >>> +             /*
> >>> +              * This audio function is optional for avoid blocking d=
isplay.
> >>> +              * So just print warning message and no error is return=
ed.
> >>
> >> No, since PAI node is available here, it has to be bound.  Yet you sti=
ll need
> >> to properly handle the case where PAI node is inavailable.
> >
> > This is for aggregate driver registration,  not for bind()
> >
> > The bind() is called after both drivers have been registered.  again th=
ere is no
> > dependency for both aggregate driver and component driver should be
> > registered or probed.
>
> Sorry for not being clear about my previous wording.  I meant since PAI n=
ode is
> available here, component_master_add_with_match() must be called to regis=
ter
> the master and if it fails to register it, imx8mp_dw_hdmi_probe() should =
return
> proper error code, not 0.
>
> --
> Regards,
> Liu Ying

