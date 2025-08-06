Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA429C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 06:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LOjQGBKez5S1iGyBaU0i1tLauar5otkV86mmIjmqK0=; b=anLCdybyz4Ie6bpD1dLAeTg+qH
	UJB+K8vBYHOnV0Wlpj/LTGSTWMrY6je+zeHGnUxgJbbjjRXJWK019aepoABkrKlNSgQDVoAU53RO3
	U1R5usu8TyDga4U2Wwg6013c1j6+/kN7Dm761RFf1/SwVwcz76q7cAohgD+/YM5hW4AbxbgQ18kmi
	LwRBstlCFbLa2Ak+MbEUuo8poWzI3oZbUH40b9jl/F/WEU2Fvqr62K+VmYgtNnl3TepItPUPtmZNA
	+/qAeDhstYREQO7l7ZkdpaQMHc0qBUauDnNImifYHczjRuGAbkDwT1gB9SpS+nPK6CAWdudHlrljs
	GBXDWrYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXEs-0000000EN8N-3Tl5;
	Wed, 06 Aug 2025 06:03:02 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXCM-0000000EMxU-28DP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 06:00:27 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-87999c368e9so455258639f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 23:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754460025; x=1755064825; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LOjQGBKez5S1iGyBaU0i1tLauar5otkV86mmIjmqK0=;
        b=XNtTQHUYoqgroNeGHJPExEmQirquQc9WCUyBWGhfsA/PaEYNrpmU0puiFOg6loal/2
         dN/G+Zvn+9IWjSX5toU7pAGvKYcTsUZLOlfdK89sdaNpnyqX8ebjOFd2cubJaYo3+0h4
         /VVLd2mIi0UCcLczAiJGOLvBpGnyZxu55JoZijeoPgKRr/7BlPFsc5AQN9kUiNB41lHy
         cY/oSumPHXTyHqEGP4QK6nPEn/+xseZdsmvK7OA3vKzitpLlOZIaocMB5ZrskD5OP8cd
         NxB4PZ7iFLVMtdESMhjlZiFGAUHFgYVLBqja6ac2fLlR6is68dsO8ZXJMtYpygEiFiwL
         vgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754460025; x=1755064825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LOjQGBKez5S1iGyBaU0i1tLauar5otkV86mmIjmqK0=;
        b=ZZaac2S5bNA1RDdcxsWgn9PSUIDLMdLsYvwZVdtPkuTs/8I6LjDBM+aZ9eau0vpbSQ
         zQ7mN0WKpzpi2XgUalDGhP52KaI3QFiVxW/pTxFekJ7GMU+POki5m/Ra5uvMxh1tvSM5
         E+uBwH1NO95vK31/fDEW/27IStRaAUcpecW2rXY72KRH2Wx8LNHOB6/Z7PSVSdoXkB1C
         zYGdrvnmlkCx30qm3lmu1KpxDD9roGyktc8y4ihfiTnFFPZdr8hsSXFCP55T1jkAzYpG
         u1aWPXRKnz3OSvpH3ZHHtl/+V80EE9rZ7ofDUC4dM3/B8ja3cXdhV1Sjm2weMrl2BcSP
         sRQA==
X-Forwarded-Encrypted: i=1; AJvYcCVecvAikn/b0xx7qTTKSnSO1CjjeCVy/BVV8mdQ0P7qbYxu2hB0Vyy+s057pWOrLhCR6R+3We1kRFS27o/95yiS@lists.infradead.org
X-Gm-Message-State: AOJu0YwiKdaXrlrWvvQMp0x4vdIZKhUMEqr/gJuP2BUpyzS5P+cxqKnr
	FTG2lCPIDmQ0HBT9wes02XzZGIa4bq4BoB1ORXd64tsCcdzYAwtCIa4HMbcAG6JAMgg9ERePZML
	WBQMbY+tkUi+6M/O/ozHycIKnsOhX+ks=
X-Gm-Gg: ASbGncvQke2qWdw6HXXuqoMKt1Uit4IXgD5jibZxc5XsGOLy4PWJo3WIAW+p4SXTxi+
	oaA3e6rU1zyn9LOairtEZ92YwfazRJFrMhMRF8LlPL1gIDW9WqawxVjN6Q22D1LU1z625BEyeeW
	rAoBIbmy3k51A7xmanEwk3GHwl9XCJKtbeRlB34LlHPRIKy1uREijS+ZZUkXsGTP7NGfqEYyt8n
	c7A/DQ=
X-Google-Smtp-Source: AGHT+IGXTd343+VF/DxWVcdW2rLvvEJ8x/TFUG5Tpo/FEQ7fHX2BzAtVcAbQoY4hyy1ohYC0jFv/9H1yMpGG0tLM+1M=
X-Received: by 2002:a05:6602:6c14:b0:87c:30d4:65f2 with SMTP id
 ca18e2360f4ac-8819f2dc2f6mr259724639f.3.1754460025324; Tue, 05 Aug 2025
 23:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com> <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
In-Reply-To: <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Aug 2025 14:00:05 +0800
X-Gm-Features: Ac12FXw0nnoM3OTdXQVUBKMi5kWO9s__PdvorJUHLc_FVvpTTZTj4ms-phKQiNs
Message-ID: <CAA+D8AN9Ay8jnSS=h3G_Kepc_5WYQRAUrWmtu5N056GsnvGrTA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250805_230026_561310_ED5C2BB1 
X-CRM114-Status: GOOD (  43.12  )
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

On Tue, Aug 5, 2025 at 4:55=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On 08/04/2025, Shengjiu Wang wrote:
> > The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> > acts as the bridge between the Audio Subsystem to the HDMI TX Controlle=
r.
> > This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> >
> > Data received from the audio subsystem can have an arbitrary component
> > ordering. The HTX_PAI block has integrated muxing options to select whi=
ch
> > sections of the 32-bit input data word will be mapped to each IEC60958
> > field. The HTX_PAI_FIELD_CTRL register contains mux selects to
> > individually select P,C,U,V,Data, and Preamble.
> >
> > Use component helper that imx8mp-hdmi-tx will be aggregate driver,
>
> s/that/so that/
>
> > imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
> > bind() ops to get the plat_data from imx8mp-hdmi-tx device.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
> >  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 205 +++++++++++++++++++
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  55 +++++
> >  include/drm/bridge/dw_hdmi.h                 |   6 +
> >  5 files changed, 275 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridg=
e/imx/Kconfig
> > index 9a480c6abb85..6c1a8bc5d4a0 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -18,12 +18,20 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> >       depends on OF
> >       depends on COMMON_CLK
> >       select DRM_DW_HDMI
> > +     imply DRM_IMX8MP_HDMI_PAI
> >       imply DRM_IMX8MP_HDMI_PVI
> >       imply PHY_FSL_SAMSUNG_HDMI_PHY
> >       help
> >         Choose this to enable support for the internal HDMI encoder fou=
nd
> >         on the i.MX8MP SoC.
> >
> > +config DRM_IMX8MP_HDMI_PAI
> > +     tristate "Freescale i.MX8MP HDMI PAI bridge support"
> > +     depends on OF
>
> select REGMAP
> select REGMAP_MMIO


will add them.

>
> > +     help
> > +       Choose this to enable support for the internal HDMI TX Parallel
> > +       Audio Interface found on the Freescale i.MX8MP SoC.
> > +
> >  config DRM_IMX8MP_HDMI_PVI
> >       tristate "Freescale i.MX8MP HDMI PVI bridge support"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/brid=
ge/imx/Makefile
> > index dd5d48584806..8d01fda25451 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -1,6 +1,7 @@
> >  obj-$(CONFIG_DRM_IMX_LDB_HELPER) +=3D imx-ldb-helper.o
> >  obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) +=3D imx-legacy-bridge.o
> >  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) +=3D imx8mp-hdmi-tx.o
> > +obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) +=3D imx8mp-hdmi-pai.o
> >  obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) +=3D imx8mp-hdmi-pvi.o
> >  obj-$(CONFIG_DRM_IMX8QM_LDB) +=3D imx8qm-ldb.o
> >  obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu=
/drm/bridge/imx/imx8mp-hdmi-pai.c
> > new file mode 100644
> > index 000000000000..9002974073ca
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> > @@ -0,0 +1,205 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/component.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
>
> #include <linux/regmap.h>

ok,
>
> > +#include <drm/bridge/dw_hdmi.h>
> > +#include <sound/asoundef.h>
> > +
> > +#define HTX_PAI_CTRL                 0x00
> > +#define   ENABLE                     BIT(0)
> > +
> > +#define HTX_PAI_CTRL_EXT             0x04
> > +#define   WTMK_HIGH_MASK             GENMASK(31, 24)
> > +#define   WTMK_LOW_MASK                      GENMASK(23, 16)
> > +#define   NUM_CH_MASK                        GENMASK(10, 8)
>
> Add NUM_CH(n) and use it when programming HTX_PAI_CTRL_EXT.
> #define NUM_CH(n)                       FIELD_PREP(NUM_CH_MASK, (n - 1))

Ok, will add it.

>
> > +#define   WTMK_HIGH(n)                       FIELD_PREP(WTMK_HIGH_MASK=
, (n))
> > +#define   WTMK_LOW(n)                        FIELD_PREP(WTMK_LOW_MASK,=
 (n))
> > +
> > +#define HTX_PAI_FIELD_CTRL           0x08
> > +#define   B_FILT                     BIT(31)
> > +#define   PARITY_EN                  BIT(30)
> > +#define   END_SEL                    BIT(29)
>
> The above 3 bits are unused.  Drop.

Ok.

>
> > +#define   PRE_SEL                    GENMASK(28, 24)
> > +#define   D_SEL                              GENMASK(23, 20)
> > +#define   V_SEL                              GENMASK(19, 15)
> > +#define   U_SEL                              GENMASK(14, 10)
> > +#define   C_SEL                              GENMASK(9, 5)
> > +#define   P_SEL                              GENMASK(4, 0)
> > +
> > +#define HTX_PAI_STAT                 0x0c
> > +#define HTX_PAI_IRQ_NOMASK           0x10
> > +#define HTX_PAI_IRQ_MASKED           0x14
> > +#define HTX_PAI_IRQ_MASK             0x18
>
> The above 4 registers are not pratically used.  Drop.

They are used by regmap to make a full definition.

>
> > +
> > +struct imx8mp_hdmi_pai {
> > +     struct device   *dev;
> > +     struct regmap   *regmap;
> > +};
> > +
> > +static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channe=
l,
> > +                                int width, int rate, int non_pcm,
> > +                                int iec958)
> > +{
> > +     const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw=
_hdmi);
> > +     struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pd=
ata->priv_audio;
>
> I don't think you need to convert type explicitly.  Same for the other
> explicit conversions in this driver.

ok, can be removed.
>
> > +     int val;
> > +
> > +     /* PAI set control extended */
> > +     val =3D  WTMK_HIGH(3) | WTMK_LOW(3);
> > +     val |=3D FIELD_PREP(NUM_CH_MASK, channel - 1);
> > +     regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
> > +
> > +     /* IEC60958 format */
> > +     if (iec958) {
> > +             val =3D FIELD_PREP_CONST(P_SEL,
> > +                                    __bf_shf(IEC958_SUBFRAME_PARITY));
> > +             val |=3D FIELD_PREP_CONST(C_SEL,
> > +                                     __bf_shf(IEC958_SUBFRAME_CHANNEL_=
STATUS));
> > +             val |=3D FIELD_PREP_CONST(U_SEL,
> > +                                     __bf_shf(IEC958_SUBFRAME_USER_DAT=
A));
> > +             val |=3D FIELD_PREP_CONST(V_SEL,
> > +                                     __bf_shf(IEC958_SUBFRAME_VALIDITY=
));
> > +             val |=3D FIELD_PREP_CONST(D_SEL,
> > +                                     __bf_shf(IEC958_SUBFRAME_SAMPLE_2=
4_MASK));
> > +             val |=3D FIELD_PREP_CONST(PRE_SEL,
> > +                                     __bf_shf(IEC958_SUBFRAME_PREAMBLE=
_MASK));
> > +     } else {
> > +             /* PCM choose 24bit*/
> > +             val =3D FIELD_PREP(D_SEL, width - 24);
>
> Why 'width - 24'?  Can it be expressed by a helper or macro?

                /*
                 * The allowed width are 24bit and 32bit, as they are
supported by
                 * aud2htx module.
                 * for 24bit, D_SEL =3D 0, select all the bits.
                 * for 32bit, D_SEL =3D 8, select the MSB.
                 */
will add such comments.

best regards
Shengjiu wang
>
> > +     }
> > +
> > +     regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
> > +
> > +     /* PAI start running */
> > +     regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
> > +}
> > +
> > +static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
> > +{
> > +     const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw=
_hdmi);
> > +     struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pd=
ata->priv_audio;
> > +
> > +     /* Stop PAI */
> > +     regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
> > +}
> > +
> > +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *mas=
ter, void *data)
> > +{
> > +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_data=
 *)data;
> > +     struct imx8mp_hdmi_pai *hdmi_pai;
> > +
> > +     hdmi_pai =3D dev_get_drvdata(dev);
> > +
> > +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> > +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> > +     plat_data->priv_audio =3D hdmi_pai;
> > +
> > +     return 0;
> > +}
> > +
> > +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device *=
master, void *data)
> > +{
> > +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_data=
 *)data;
> > +
> > +     plat_data->enable_audio =3D NULL;
> > +     plat_data->disable_audio =3D NULL;
> > +     plat_data->priv_audio =3D NULL;
>
> Do you really need to set these ptrs to NULL?
>
> > +}
> > +
> > +static const struct component_ops imx8mp_hdmi_pai_ops =3D {
> > +     .bind   =3D imx8mp_hdmi_pai_bind,
> > +     .unbind =3D imx8mp_hdmi_pai_unbind,
> > +};
> > +
> > +static bool imx8mp_hdmi_pai_volatile_reg(struct device *dev, unsigned =
int reg)
> > +{
> > +     switch (reg) {
> > +     case HTX_PAI_IRQ_NOMASK:
> > +     case HTX_PAI_IRQ_MASKED:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +static bool imx8mp_hdmi_pai_writeable_reg(struct device *dev, unsigned=
 int reg)
> > +{
> > +     switch (reg) {
> > +     case HTX_PAI_CTRL:
> > +     case HTX_PAI_CTRL_EXT:
> > +     case HTX_PAI_FIELD_CTRL:
> > +     case HTX_PAI_IRQ_NOMASK:
> > +     case HTX_PAI_IRQ_MASKED:
> > +     case HTX_PAI_IRQ_MASK:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +static const struct regmap_config imx8mp_hdmi_pai_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .val_bits =3D 32,
> > +     .max_register =3D HTX_PAI_IRQ_MASK,
> > +     .volatile_reg =3D imx8mp_hdmi_pai_volatile_reg,
> > +     .writeable_reg =3D imx8mp_hdmi_pai_writeable_reg,
> > +};
> > +
> > +static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct imx8mp_hdmi_pai *hdmi_pai;
> > +     struct resource *res;
> > +     void __iomem *base;
> > +
> > +     hdmi_pai =3D devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> > +     if (!hdmi_pai)
> > +             return -ENOMEM;
> > +
> > +     base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > +     if (IS_ERR(base))
> > +             return PTR_ERR(base);
> > +
> > +     hdmi_pai->dev =3D dev;
> > +
> > +     hdmi_pai->regmap =3D devm_regmap_init_mmio(dev, base, &imx8mp_hdm=
i_pai_regmap_config);
>
> Now that DT binding says there is an APB clock, use devm_regmap_init_mmio=
_clk()
> to ensure registers can be accessed with clock enabled even via debugfs.
>
> > +     if (IS_ERR(hdmi_pai->regmap)) {
> > +             dev_err(dev, "regmap init failed\n");
> > +             return PTR_ERR(hdmi_pai->regmap);
> > +     }
> > +
> > +     dev_set_drvdata(dev, hdmi_pai);
> > +
> > +     return component_add(dev, &imx8mp_hdmi_pai_ops);
>
> Imagine that users could enable this driver without enabling imx8mp-hdmi-=
tx
> driver, you may add the component in this probe() callback only and move =
all
> the other stuff to bind() callback to avoid unnecessary things being done=
 here.
>
> > +}
> > +
> > +static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
> > +{
> > +     component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
> > +}
> > +
> > +static const struct of_device_id imx8mp_hdmi_pai_of_table[] =3D {
> > +     { .compatible =3D "fsl,imx8mp-hdmi-pai" },
> > +     { /* Sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> > +
> > +static struct platform_driver imx8mp_hdmi_pai_platform_driver =3D {
> > +     .probe          =3D imx8mp_hdmi_pai_probe,
> > +     .remove         =3D imx8mp_hdmi_pai_remove,
> > +     .driver         =3D {
> > +             .name   =3D "imx8mp-hdmi-pai",
> > +             .of_match_table =3D imx8mp_hdmi_pai_of_table,
> > +     },
> > +};
> > +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> > +
> > +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/=
drm/bridge/imx/imx8mp-hdmi-tx.c
> > index 1e7a789ec289..ee08084d2394 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > @@ -5,11 +5,13 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/component.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <drm/bridge/dw_hdmi.h>
> >  #include <drm/drm_modes.h>
> > +#include <drm/drm_of.h>
> >
> >  struct imx8mp_hdmi {
> >       struct dw_hdmi_plat_data plat_data;
> > @@ -79,11 +81,46 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy=
_ops =3D {
> >       .update_hpd     =3D dw_hdmi_phy_update_hpd,
> >  };
> >
> > +static int imx8mp_dw_hdmi_bind(struct device *dev)
> > +{
> > +     struct dw_hdmi_plat_data *plat_data;
> > +     struct imx8mp_hdmi *hdmi;
> > +     int ret;
> > +
> > +     hdmi =3D dev_get_drvdata(dev);
> > +     plat_data =3D &hdmi->plat_data;
> > +
> > +     ret =3D component_bind_all(dev, plat_data);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "component_bind_all failed=
!\n");
>
> As component_bind_all() would bind imx8mp-hdmi-pai and hence set
> {enable,disable}_audio callbacks, you need to call dw_hdmi_probe() after
> component_bind_all() instead of too early in probe() callback.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static void imx8mp_dw_hdmi_unbind(struct device *dev)
> > +{
> > +     struct dw_hdmi_plat_data *plat_data;
> > +     struct imx8mp_hdmi *hdmi;
> > +
> > +     hdmi =3D dev_get_drvdata(dev);
> > +     plat_data =3D &hdmi->plat_data;
> > +
> > +     component_unbind_all(dev, plat_data);
> > +}
> > +
> > +static const struct component_master_ops imx8mp_dw_hdmi_ops =3D {
> > +     .bind   =3D imx8mp_dw_hdmi_bind,
> > +     .unbind =3D imx8mp_dw_hdmi_unbind,
> > +};
> > +
> >  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev =3D &pdev->dev;
> >       struct dw_hdmi_plat_data *plat_data;
> > +     struct component_match *match;
>
> As Alexander pointed out, this needs to be set to NULL.
> See how other drivers which are component masters do.
>
> > +     struct device_node *remote;
> >       struct imx8mp_hdmi *hdmi;
> > +     int ret;
> >
> >       hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> >       if (!hdmi)
> > @@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platform_de=
vice *pdev)
> >
> >       platform_set_drvdata(pdev, hdmi);
> >
> > +     /* port@2 is for hdmi_pai device */
> > +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> > +     if (remote && of_device_is_available(remote)) {
>
> Doesn't of_graph_get_remote_node() ensure that remote is avaiable?
>
> > +             drm_of_component_match_add(dev, &match, component_compare=
_of, remote);
> > +
> > +             of_node_put(remote);
> > +
> > +             ret =3D component_master_add_with_match(dev, &imx8mp_dw_h=
dmi_ops, match);
> > +             if (ret)
> > +                     dev_warn(dev, "Unable to register aggregate drive=
r\n");
> > +             /*
> > +              * This audio function is optional for avoid blocking dis=
play.
> > +              * So just print warning message and no error is returned=
.
>
> No, since PAI node is available here, it has to be bound.  Yet you still =
need
> to properly handle the case where PAI node is inavailable.
>
> > +              */
> > +     }
> > +
> >       return 0;
> >  }
> >
> > @@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platform_d=
evice *pdev)
> >  {
> >       struct imx8mp_hdmi *hdmi =3D platform_get_drvdata(pdev);
> >
> > +     component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
> > +
> >       dw_hdmi_remove(hdmi->dw_hdmi);
> >  }
> >
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.=
h
> > index 095cdd9b7424..336f062e1f9d 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
> >                                          const struct drm_display_info =
*info,
> >                                          const struct drm_display_mode =
*mode);
> >
> > +     /*
> > +      * priv_audio is specially used for additional audio device to ge=
t
> > +      * driver data through this dw_hdmi_plat_data.
> > +      */
> > +     void *priv_audio;
> > +
> >       /* Platform-specific audio enable/disable (optional) */
> >       void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
> >                            int width, int rate, int non_pcm, int iec958=
);
>
>
> --
> Regards,
> Liu Ying

