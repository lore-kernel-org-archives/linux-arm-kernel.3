Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1FFC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZzpiYZwNaf+7GMBi0VLlcvQKHbRH+NQQeTOtdaqsaY=; b=SDgkj0oKN1Y1c+4QNFeuqVD83n
	r5drXj6D3ivgglpXCwmEHfrgGAGuA5JtFKaX6vlMBYEvZ46Nk2SrUyAY/yZICFZpVt8UPn2uPAWq2
	LcqsHpclMLiT9Zc+Xl2+CF1xvdLJ8rYq7xaR9LtdOZoEFDZhmwRGfIGpgZ0L3Eb05XoiJuoOsRmb+
	NZ/StxgfagkA0Kr+LWsbvjy84n00YDP52P9gnK58F+jIte+uFnCQ5gA/dARxQ5QjQcLkit7SOWewn
	CGAbkzWS+jHdvXPVCrpNntyhbDAqDLLh4umAgPyon7BlE0LvylKLXCqngy3e8R2w796/MYwWSUWqL
	FZEsFfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uba90-00000004MFx-3hnN;
	Tue, 15 Jul 2025 07:32:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uba5G-00000004LK1-2wlw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 07:28:16 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553d771435fso4532369e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 00:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752564493; x=1753169293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZzpiYZwNaf+7GMBi0VLlcvQKHbRH+NQQeTOtdaqsaY=;
        b=BkCzUmHMVSg0UqyqPJLDSeApju8wVYtpWdT/MUqWBBnF5isiuEPR5JAxYOlYPOall/
         zqK0KyHNMQaCHd8Gz5kKitp82cNDQmQKFpu9kwrH1H0D0kh47JveGOVOV1+GSy3vssyC
         APuMfmAvNGimjHjU84il5BqZp2PGTYs1R0emM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564493; x=1753169293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZzpiYZwNaf+7GMBi0VLlcvQKHbRH+NQQeTOtdaqsaY=;
        b=nfQ0xj1u54QDBYH4nWTc2wDkLf7TmXAIs0j5bcm60e8JsCHLZumxgdjQvHrk0DAWHc
         7N2+2mv30hZRguDg9X5CaofH8hBPgxNbR6boV+DXq0oGeU89PswrS4lJyjypGCfDR0sB
         hpwzeFSlCJWVLR8AjORPCLaPZMF7GVy82OoIwoz7SbC9gtBbNxnD/l5tDWDFQN/DzZ98
         3yVm6xxaIYhfFEcVntkw0g2XvMjQoJd1ySz/+FwelH2ol/qTitCMgbm/k7xHmEfMEKa4
         BufwgZjb7W4Wtj8mS0kVB6bFyKxCyTgtxEMgLXvGGpqcI7gPdNl1HnaI0QSPWbZjdqII
         +47A==
X-Forwarded-Encrypted: i=1; AJvYcCUST1GaoZq5m9FwEQOkxWN/UnKS5cokRLsCP2Yg7nLZeAvymQmxaVhFxBvaJhve4Hb3qv7Y0McHWb+riMEeU05G@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1eKfk1Ay2QouOpn9Q4+4VFVm2bIM4pCUCTzGOtW6WDNUT1QnV
	MtfLgK7Hwee6J9BMapXTvcxEhIUXGyo5opcecdtDtFidDYj4qpwa/iy/iYuRZ0yBK/LRdDaHjMD
	W+gDYbCMAd5LvFzrQw6XhZytnW7/lbyrpxonRz5yA
X-Gm-Gg: ASbGncuMVcPsesEMGa9Q9N/LeHPvtNSp8puyBniWRMHDtUasEXCLodeRgNIB+yNmlmw
	miCo25n1NdI6+UNdtcXidkV5sbitU5b9NuWo4K5fxiAnz+OfY7VpyEOhd/CPcoEmuJbrEhqMOd5
	2/dx4P1cGTEJAyAX/Ziry+2KVXjMZW88+JEu8kjPZtuCDLNyo4VnSMqU04YcH6FDNd/xhYUqRad
	jcn495DbiRg8zB8MPYiR1VSZ+Kx9k6lwTlfiPnWiU9+FA==
X-Google-Smtp-Source: AGHT+IE+I2EKW/Vlk3fRtykPHngODTfgQlgraXU23nzszgS13v7r+PoSUsWI29YIuHFK4Z4/TZxfjJyjsgNva6Nvih0=
X-Received: by 2002:a05:6512:23a0:b0:553:a32a:6c6 with SMTP id
 2adb3069b0e04-55a058cca78mr3983896e87.51.1752564492768; Tue, 15 Jul 2025
 00:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-15-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-15-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 15:28:01 +0800
X-Gm-Features: Ac12FXyU8Sq6NaxHfbh3KFMLAH5aLMP41sVO2AcuKk50klccx7LXTjHhhdUwccY
Message-ID: <CAGXv+5EsVOPC+i2=9d-Be1U-DuB8tPDAyokzhTOeVZQtZJ9+CQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250715_002814_852013_FDEDB1D2 
X-CRM114-Status: GOOD (  26.84  )
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

Hi,


On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |   2 +-
>  drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 769 +++++++++++++++++++++
>  2 files changed, 770 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index 0688d7bf4979..24683dd51783 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -161,7 +161,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt81=
95-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt8195=
-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o \
> -                                  clk-mt8196-topckgen2.o
> +                                  clk-mt8196-topckgen2.o clk-mt8196-vlpc=
kgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/med=
iatek/clk-mt8196-vlpckgen.c
> new file mode 100644
> index 000000000000..23a673dd4c5c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
> @@ -0,0 +1,769 @@

[...]

> +static const char * const vlp_camtg0_parents[] =3D {
> +       "clk26m",
> +       "univpll_192m_d32",
> +       "univpll_192m_d16",
> +       "clk13m",
> +       "osc_d40",
> +       "osc_d32",
> +       "univpll_192m_d10",
> +       "univpll_192m_d8",
> +       "univpll_d6_d16",
> +       "ulposc3",
> +       "osc_d20",
> +       "ck2_tvdpll1_d16",
> +       "univpll_d6_d8"
> +};

It seems all the vlp_camtg* parents are the same. Please merge them
and just have one list.

> +static const char * const vlp_sspm_26m_parents[] =3D {
> +       "clk26m",
> +       "osc_d20"
> +};
> +
> +static const char * const vlp_ulposc_sspm_parents[] =3D {
> +       "clk26m",
> +       "osc_d2",
> +       "mainpll_d4_d2"
> +};
> +
> +static const char * const vlp_vlp_pbus_26m_parents[] =3D {
> +       "clk26m",
> +       "osc_d20"
> +};
> +
> +static const char * const vlp_debug_err_flag_parents[] =3D {
> +       "clk26m",
> +       "osc_d20"
> +};
> +
> +static const char * const vlp_dpmsrdma_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d2"
> +};
> +
> +static const char * const vlp_vlp_pbus_156m_parents[] =3D {
> +       "clk26m",
> +       "osc_d2",
> +       "mainpll_d7_d2",
> +       "mainpll_d7"
> +};
> +
> +static const char * const vlp_spm_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d4"
> +};
> +
> +static const char * const vlp_mminfra_parents[] =3D {
> +       "clk26m",
> +       "osc_d4",
> +       "mainpll_d3"
> +};
> +
> +static const char * const vlp_usb_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d9"
> +};

The previous and the next one are the same.

> +static const char * const vlp_usb_xhci_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d9"
> +};
> +
> +static const char * const vlp_noc_vlp_parents[] =3D {
> +       "clk26m",
> +       "osc_d20",
> +       "mainpll_d9"
> +};
> +
> +static const char * const vlp_audio_h_parents[] =3D {
> +       "clk26m",
> +       "vlp_apll1",
> +       "vlp_apll2"
> +};
> +
> +static const char * const vlp_aud_engen1_parents[] =3D {
> +       "clk26m",
> +       "apll1_d8",
> +       "apll1_d4"
> +};

The previous and the next one are the same.

> +static const char * const vlp_aud_engen2_parents[] =3D {
> +       "clk26m",
> +       "apll2_d8",
> +       "apll2_d4"
> +};
> +
> +static const char * const vlp_aud_intbus_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d4",
> +       "mainpll_d4_d4"
> +};
> +
> +static const char * const vlp_spvlp_26m

[...]

> +static int clk_mt8196_vlp_probe(struct platform_device *pdev)
> +{
> +       struct clk_hw_onecell_data *clk_data;
> +       int r;
> +       struct device_node *node =3D pdev->dev.of_node;
> +
> +       clk_data =3D mtk_alloc_clk_data(ARRAY_SIZE(vlp_muxes) +
> +                                     ARRAY_SIZE(vlp_plls));
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r =3D mtk_clk_register_muxes(&pdev->dev, vlp_muxes, ARRAY_SIZE(vl=
p_muxes),
> +                                  node, &mt8196_clk_vlp_lock, clk_data);
> +       if (r)
> +               goto free_clk_data;
> +
> +       r =3D mtk_clk_register_plls(node, vlp_plls, ARRAY_SIZE(vlp_plls),
> +                                 clk_data);
> +       if (r)
> +               goto unregister_muxes;
> +
> +       r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_dat=
a);
> +       if (r)
> +               goto unregister_plls;
> +
> +       platform_set_drvdata(pdev, clk_data);
> +
> +       return r;
> +
> +unregister_plls:
> +       mtk_clk_unregister_plls(vlp_plls, ARRAY_SIZE(vlp_plls), clk_data)=
;
> +unregister_muxes:
> +       mtk_clk_unregister_muxes(vlp_muxes, ARRAY_SIZE(vlp_muxes), clk_da=
ta);
> +free_clk_data:
> +       mtk_free_clk_data(clk_data);

The AFE driver sets some tuner parameters in the VLPCKGEN block at probe
time. Maybe we could do that here instead?

/* vlp_cksys_clk: 0x1c016000 */
#define VLP_APLL1_TUNER_CON0 0x02a4
#define VLP_APLL2_TUNER_CON0 0x02a8

/* vlp apll1 tuner default value*/
#define VLP_APLL1_TUNER_CON0_VALUE 0x6f28bd4d
/* vlp apll2 tuner default value + 1*/
#define VLP_APLL2_TUNER_CON0_VALUE 0x78fd5265

       regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0,
VLP_APLL1_TUNER_CON0_VALUE);
       regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0,
VLP_APLL2_TUNER_CON0_VALUE);

ChenYu

> +
> +       return r;
> +}
> +
> +static void clk_mt8196_vlp_remove(struct platform_device *pdev)
> +{
> +       struct clk_hw_onecell_data *clk_data =3D platform_get_drvdata(pde=
v);
> +       struct device_node *node =3D pdev->dev.of_node;
> +
> +       of_clk_del_provider(node);
> +       mtk_clk_unregister_plls(vlp_plls, ARRAY_SIZE(vlp_plls), clk_data)=
;
> +       mtk_clk_unregister_muxes(vlp_muxes, ARRAY_SIZE(vlp_muxes), clk_da=
ta);
> +       mtk_free_clk_data(clk_data);
> +}
> +
> +static const struct of_device_id of_match_clk_mt8196_vlp_ck[] =3D {
> +       { .compatible =3D "mediatek,mt8196-vlpckgen" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vlp_ck);
> +
> +static struct platform_driver clk_mt8196_vlp_drv =3D {
> +       .probe =3D clk_mt8196_vlp_probe,
> +       .remove =3D clk_mt8196_vlp_remove,
> +       .driver =3D {
> +               .name =3D "clk-mt8196-vlpck",
> +               .of_match_table =3D of_match_clk_mt8196_vlp_ck,
> +       },
> +};
> +
> +MODULE_DESCRIPTION("MediaTek MT8196 VLP clock generator driver");
> +module_platform_driver(clk_mt8196_vlp_drv);
> +MODULE_LICENSE("GPL");
> --
> 2.39.5
>

