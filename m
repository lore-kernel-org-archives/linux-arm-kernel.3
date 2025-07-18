Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F2BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8xwpmkMzspiOongpmX1MNLbl0q1sdU9S7sc4man+Jg=; b=ri6LdmNSWb2u8Fs67IxR/raNC8
	e8lcXXRk+nOzYu2QuVdYrxWnY/CKnyNZeG3aJmaobNEnkvdMxdrjzRakSbqHXgGsP+goNCvc50B0v
	Mbdv2Khv/HTFbC5MtqTwuGuYIbogzW3RdiToCPsZ5VEG/GFqCznIYJosRUvxaoaA50drl/1k3sXUh
	8F4n5Is+x80FPRbNUQhhUOBK9f7B37gUTyH4AomMnrHlYR+ZDNl6oSyRbO7vXrgRGd99x4oPFfSGJ
	AS8k8Ud6m+/kMSiG+PhcWOyE0ImI8DUkZYxlzZUVAejGNikiAtp+zyyuTuai9f9ENc9Vn/iRFUByu
	Rq86FE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgha-0000000C4gn-08Zq;
	Fri, 18 Jul 2025 08:44:22 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgVC-0000000C323-1DRJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 08:31:35 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso1888848e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 01:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752827492; x=1753432292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8xwpmkMzspiOongpmX1MNLbl0q1sdU9S7sc4man+Jg=;
        b=NisjeUBd0rJWLgI8eumqkUTYufuje8XuWoV1TiCjTdToQveFscjEgFP6wk6wVlzLsR
         tjjH6IbM5NE+fDtJkCh1faRSlWGg0DcSn48q3QK4TLfF9USMyJd4WRUnYpD3diJ0AX8G
         g5Kf3pxwP9tGs0wDOlFay0vsKBue5/8Td6ggs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752827492; x=1753432292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8xwpmkMzspiOongpmX1MNLbl0q1sdU9S7sc4man+Jg=;
        b=m9ppNAZ5WyBpEFLYE98TPIRAc1boqDJvK6BBpEPE8tb3/84pt1wUJSUDSuDgOYk2Nz
         bMX89u1zbFgYyzm4jIsYXQwZLqanH5yVLBwdJKkZfTv7my1C2dlpIjuOdN7I3a7YJl7P
         LPyVRzLrstyT9oC/5uhllRww505Zhl5i2UMa2wfRzC2fsEAwm1OfgMV5OEzjMrC+YLCI
         8oHd48jmmQg23Sh8z1YE5hESZIlOibO4tynpdvItkFEm06nP7SDCBPH4vN2w+Mz5gHMn
         tgWu4MZNNBS6GYjdZdJ7BGSA32tXPY64QF2nuiQprWtTpXyRMqD/jZ8ldRE54oKlixzP
         W7uw==
X-Forwarded-Encrypted: i=1; AJvYcCWN7b7bh/TrmoZM9UloAIT5u1TDg34zZ9QyJOHNPG/rx8ajNLL1jjIy8lXH8PjMTzEGMXRDEROMgwrfvlhTbAQM@lists.infradead.org
X-Gm-Message-State: AOJu0YzUy1byatYiE3WM8dMMnDDAQc5azSK0SZMN2GUgQWpVQSc9dhab
	x8gd4NTEs0XbG3ezru1KLMVcOD5QR0gTNANBbsWtMUGue0XcQTQ5IDL5wQfjkYj+NNGFSSzyoPH
	aRFQhE3P5E1oKOirksJAtx+WlmdDVAPcjMymSc1fT
X-Gm-Gg: ASbGncv86nQPAsFpU2v6aWd4xit6gA7lpY2Fouth6zU4oHcW/MVoZHW2bnwNayV6Thx
	L4nfA1HDYSXCrrzY4oHVVu0uitV9ZJD61ax3GMEdyBQ9L1Gh0H/st+rb2aIw5RAkrcfp+FQjE/B
	h7ijO2L8SbEwJWmt/YxBn+WL5f2CXFqb1VRo9RTi0EkbJDzD1srkOQ9LAYRHhD7KZrosWE36CbE
	s0lL0kZkAyOI7izHfubW2uKSOL283dLk60=
X-Google-Smtp-Source: AGHT+IE2YCP3qtGwbWMMf4nA+VHzKJt73OAglarAy2N4KkRi0JUERUKf9Ryw1zRIfRne1bwjjAb8n8O/WhX1Et2H5P0=
X-Received: by 2002:ac2:4bd3:0:b0:553:543d:d963 with SMTP id
 2adb3069b0e04-55a3188f091mr482109e87.36.1752827491972; Fri, 18 Jul 2025
 01:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com>
 <20250624143220.244549-15-laura.nao@collabora.com> <CAGXv+5EsVOPC+i2=9d-Be1U-DuB8tPDAyokzhTOeVZQtZJ9+CQ@mail.gmail.com>
In-Reply-To: <CAGXv+5EsVOPC+i2=9d-Be1U-DuB8tPDAyokzhTOeVZQtZJ9+CQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Jul 2025 16:31:18 +0800
X-Gm-Features: Ac12FXy4SClgcQRcJIHHX9Uew0lkKbfgQ80ydRk_k7muDqm79-Y_wxCCK4MPdyc
Message-ID: <CAGXv+5ErtDLNf3u5OdHrEBdrA-2bPA5wy32S+Bqd1c_1Z9u1pA@mail.gmail.com>
Subject: Re: [PATCH v2 14/29] clk: mediatek: Add MT8196 vlpckgen clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_013134_364141_7689B0F4 
X-CRM114-Status: GOOD (  32.78  )
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

On Tue, Jul 15, 2025 at 3:28=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi,
>
>
> On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.c=
om> wrote:
> >
> > Add support for the MT8196 vlpckgen clock controller, which provides
> > muxes and dividers for clock selection in other IP blocks.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Signed-off-by: Laura Nao <laura.nao@collabora.com>
> > ---
> >  drivers/clk/mediatek/Makefile              |   2 +-
> >  drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 769 +++++++++++++++++++++
> >  2 files changed, 770 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
> >
> > diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makef=
ile
> > index 0688d7bf4979..24683dd51783 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -161,7 +161,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt=
8195-venc.o
> >  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt81=
95-vpp1.o
> >  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
> >  obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt819=
6-topckgen.o \
> > -                                  clk-mt8196-topckgen2.o
> > +                                  clk-mt8196-topckgen2.o clk-mt8196-vl=
pckgen.o
> >  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt836=
5.o
> >  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
> >  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> > diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/m=
ediatek/clk-mt8196-vlpckgen.c
> > new file mode 100644
> > index 000000000000..23a673dd4c5c
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
> > @@ -0,0 +1,769 @@
>
> [...]
>
> > +static const char * const vlp_camtg0_parents[] =3D {
> > +       "clk26m",
> > +       "univpll_192m_d32",
> > +       "univpll_192m_d16",
> > +       "clk13m",
> > +       "osc_d40",
> > +       "osc_d32",
> > +       "univpll_192m_d10",
> > +       "univpll_192m_d8",
> > +       "univpll_d6_d16",
> > +       "ulposc3",
> > +       "osc_d20",
> > +       "ck2_tvdpll1_d16",
> > +       "univpll_d6_d8"
> > +};
>
> It seems all the vlp_camtg* parents are the same. Please merge them
> and just have one list.
>
> > +static const char * const vlp_sspm_26m_parents[] =3D {
> > +       "clk26m",
> > +       "osc_d20"
> > +};
> > +
> > +static const char * const vlp_ulposc_sspm_parents[] =3D {
> > +       "clk26m",
> > +       "osc_d2",
> > +       "mainpll_d4_d2"
> > +};
> > +
> > +static const char * const vlp_vlp_pbus_26m_parents[] =3D {
> > +       "clk26m",
> > +       "osc_d20"
> > +};
> > +
> > +static const char * const vlp_debug_err_flag_parents[] =3D {
> > +       "clk26m",
> > +       "osc_d20"
> > +};
> > +
> > +static const char * const vlp_dpmsrdma_parents[] =3D {
> > +       "clk26m",
> > +       "mainpll_d7_d2"
> > +};
> > +
> > +static const char * const vlp_vlp_pbus_156m_parents[] =3D {
> > +       "clk26m",
> > +       "osc_d2",
> > +       "mainpll_d7_d2",
> > +       "mainpll_d7"
> > +};
> > +
> > +static const char * const vlp_spm_parents[] =3D {
> > +       "clk26m",
> > +       "mainpll_d7_d4"
> > +};
> > +
> > +static const char * const vlp_mminfra_parents[] =3D {
> > +       "clk26m",
> > +       "osc_d4",
> > +       "mainpll_d3"
> > +};
> > +
> > +static const char * const vlp_usb_parents[] =3D {
> > +       "clk26m",
> > +       "mainpll_d9"
> > +};
>
> The previous and the next one are the same.
>
> > +static const char * const vlp_usb_xhci_parents[] =3D {
> > +       "clk26m",
> > +       "mainpll_d9"
> > +};
> > +
> > +static const char * const vlp_noc_vlp_parents[] =3D {
> > +       "clk26m",
> > +       "osc_d20",
> > +       "mainpll_d9"
> > +};
> > +
> > +static const char * const vlp_audio_h_parents[] =3D {
> > +       "clk26m",
> > +       "vlp_apll1",
> > +       "vlp_apll2"
> > +};
> > +
> > +static const char * const vlp_aud_engen1_parents[] =3D {
> > +       "clk26m",
> > +       "apll1_d8",
> > +       "apll1_d4"
> > +};
>
> The previous and the next one are the same.
>
> > +static const char * const vlp_aud_engen2_parents[] =3D {
> > +       "clk26m",
> > +       "apll2_d8",
> > +       "apll2_d4"
> > +};
> > +
> > +static const char * const vlp_aud_intbus_parents[] =3D {
> > +       "clk26m",
> > +       "mainpll_d7_d4",
> > +       "mainpll_d4_d4"
> > +};

Also, all these audio related clocks (audio_h, aud_engen1, aud_engen2
aud_intbus) have a "vlp_clk26m" clock as their parent. It should be:

  - clk26m (clk26m from the top ckgen domain)
  - vlp_clk26m (clk26m from the VLP domain)
  - (from PLLs)
  - (from PLLs)

Moreover, an offline discussion with the audio owner suggests that
of the two 26 MHz clock parents, we really just want the one from
the VLP domain, as that one is usable even under suspend. This
could be done by providing an index table.

ChenYu

> > +
> > +static const char * const vlp_spvlp_26m
>
> [...]
>
> > +static int clk_mt8196_vlp_probe(struct platform_device *pdev)
> > +{
> > +       struct clk_hw_onecell_data *clk_data;
> > +       int r;
> > +       struct device_node *node =3D pdev->dev.of_node;
> > +
> > +       clk_data =3D mtk_alloc_clk_data(ARRAY_SIZE(vlp_muxes) +
> > +                                     ARRAY_SIZE(vlp_plls));
> > +       if (!clk_data)
> > +               return -ENOMEM;
> > +
> > +       r =3D mtk_clk_register_muxes(&pdev->dev, vlp_muxes, ARRAY_SIZE(=
vlp_muxes),
> > +                                  node, &mt8196_clk_vlp_lock, clk_data=
);
> > +       if (r)
> > +               goto free_clk_data;
> > +
> > +       r =3D mtk_clk_register_plls(node, vlp_plls, ARRAY_SIZE(vlp_plls=
),
> > +                                 clk_data);
> > +       if (r)
> > +               goto unregister_muxes;
> > +
> > +       r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_d=
ata);
> > +       if (r)
> > +               goto unregister_plls;
> > +
> > +       platform_set_drvdata(pdev, clk_data);
> > +
> > +       return r;
> > +
> > +unregister_plls:
> > +       mtk_clk_unregister_plls(vlp_plls, ARRAY_SIZE(vlp_plls), clk_dat=
a);
> > +unregister_muxes:
> > +       mtk_clk_unregister_muxes(vlp_muxes, ARRAY_SIZE(vlp_muxes), clk_=
data);
> > +free_clk_data:
> > +       mtk_free_clk_data(clk_data);
>
> The AFE driver sets some tuner parameters in the VLPCKGEN block at probe
> time. Maybe we could do that here instead?
>
> /* vlp_cksys_clk: 0x1c016000 */
> #define VLP_APLL1_TUNER_CON0 0x02a4
> #define VLP_APLL2_TUNER_CON0 0x02a8
>
> /* vlp apll1 tuner default value*/
> #define VLP_APLL1_TUNER_CON0_VALUE 0x6f28bd4d
> /* vlp apll2 tuner default value + 1*/
> #define VLP_APLL2_TUNER_CON0_VALUE 0x78fd5265
>
>        regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0,
> VLP_APLL1_TUNER_CON0_VALUE);
>        regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0,
> VLP_APLL2_TUNER_CON0_VALUE);
>
> ChenYu
>
> > +
> > +       return r;
> > +}
> > +
> > +static void clk_mt8196_vlp_remove(struct platform_device *pdev)
> > +{
> > +       struct clk_hw_onecell_data *clk_data =3D platform_get_drvdata(p=
dev);
> > +       struct device_node *node =3D pdev->dev.of_node;
> > +
> > +       of_clk_del_provider(node);
> > +       mtk_clk_unregister_plls(vlp_plls, ARRAY_SIZE(vlp_plls), clk_dat=
a);
> > +       mtk_clk_unregister_muxes(vlp_muxes, ARRAY_SIZE(vlp_muxes), clk_=
data);
> > +       mtk_free_clk_data(clk_data);
> > +}
> > +
> > +static const struct of_device_id of_match_clk_mt8196_vlp_ck[] =3D {
> > +       { .compatible =3D "mediatek,mt8196-vlpckgen" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vlp_ck);
> > +
> > +static struct platform_driver clk_mt8196_vlp_drv =3D {
> > +       .probe =3D clk_mt8196_vlp_probe,
> > +       .remove =3D clk_mt8196_vlp_remove,
> > +       .driver =3D {
> > +               .name =3D "clk-mt8196-vlpck",
> > +               .of_match_table =3D of_match_clk_mt8196_vlp_ck,
> > +       },
> > +};
> > +
> > +MODULE_DESCRIPTION("MediaTek MT8196 VLP clock generator driver");
> > +module_platform_driver(clk_mt8196_vlp_drv);
> > +MODULE_LICENSE("GPL");
> > --
> > 2.39.5
> >

