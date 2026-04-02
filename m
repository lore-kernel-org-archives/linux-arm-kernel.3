Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D838111227A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 03:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/J2uF2/Ma2hV+2GrDKzcXv6J/tpkVJTVgjFT4h2TI+k=; b=xN41U0eTIMhFkYh1AmT1jJfWzb
	qHwQpzAccb2x5wqiEg8l1YWqzOj5rnOWYzPLWgJxwff6Oj2UvxGwKcMK6XyUS4wl16c1+7vud6R+k
	xT7G2TkTWRZhPVo6D5HsmBqs2xJWLgGhHJitg2pZT9Mz/oihuYEa6JO1UuUSjVNebRPH9bhJcSfxt
	u2HgZi9dBKGs6pH1MIM14BnQg54ExvrmMgt5qNgrNj5zVjLeQMc4xCnGt/gtp31i7g1xURywpGGBi
	EM7tFR4o1rDzAijGYXi6WWLx4CCRhu2UqJDl0Bf6cr1BhUc+mamqqwCU//umY/GCU2gUqOYNkjBT4
	j5zQAuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w88or-0000000Gfei-0ovN;
	Thu, 02 Apr 2026 03:34:09 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w88oo-0000000GfeF-0rgl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 03:34:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso166259a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 20:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775100845; cv=none;
        d=google.com; s=arc-20240605;
        b=gjeSvB9rzSi0Cc8bcDRdG8XZ0y4akWoAShaNLxP0k7wCNiJEHWXQLz/gLeWxGtdi2u
         Z9eBryELp8D5fP6/axvDeCNBkoPsitY+BZWmJz2INzIkeiyMuDEO7CvxosTtsbCgq4rz
         StQsj5RZhZz37cqjU2i+sNTImClMa27qh/mt0UovUotG4zfRYiGF2hQ06M3XceLcbxZq
         e1pr/fmoPdsTyOoy4iCLmp2ydf8Dvm91Bi7FtbjTdPy32JP2LedwkZKKfbTilFeBr1L6
         AD8h2mydjW9YqJA555rXLxo8Oqim6jerVP4fj59owXelOIxvc0cQU9rPGQuP9Oxdjq+Q
         XUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/J2uF2/Ma2hV+2GrDKzcXv6J/tpkVJTVgjFT4h2TI+k=;
        fh=omNekI1MwvO0OFmh5Vd0ivHlY4kv5TIECiCWuclBZew=;
        b=H+3WZiDa6wUZPJz4DJgf/4TRM7Bh4UVsN7SsuvyMJjaIE1+K08ksIM8dsmJc3YYmpV
         nkqUFTHlF1LvLqMop+pEdn8WedmqiwMKkcLBL7hwAGkWZcK0A2OnmDihJcrpNxEeAdx5
         +ZSgFKrsb2kdVKCu8xCTkk8jS7FXJGk5X9HBgSxfsykl0irxnohewFDln2UUAJXFE0VP
         n3CRkytziImhM+C602TWYdJZnoZaP3iC+tMtapQsN+nONM8c4xf0JTGedWB8UtAwqzQO
         wpCUb8Wu281fYg/htXCP10kS//exGPKoDu5eWaUUDwf2guSspCpX4IiZt/Qp8h3VLXga
         Ek6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100845; x=1775705645; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J2uF2/Ma2hV+2GrDKzcXv6J/tpkVJTVgjFT4h2TI+k=;
        b=cIHd23juLjTQ55j6eWmykIYvAlS3C+YarZv5EaoYvVPwIUAhLgu/Eb3X3M4nC54KB3
         +0Ss5K9KCiJYw2bVgD1diV0hfrnhveikB5FV6HFcWlYReFgpIUgEAK9kp5AP0hK3m1rE
         y2VkPeGwKSljGzGvDsN9d0iMyMJO5bLYqbOul6FsqQQP/WkkHSI4ceKEn7pZybYQayou
         hxBeW5hjuTvKptLAbQ+9pPRn2hkZbrCKAVz5hmOmQI5xxgw2MK3uwpdc0X2KHP5VfaRc
         6s/Ajfn6jzkU8AM2aZXmjDWfFr+w9hbrNzxqAMIz0VgTxtdylcIN2dISq2oxxDaEFNQE
         VHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100845; x=1775705645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/J2uF2/Ma2hV+2GrDKzcXv6J/tpkVJTVgjFT4h2TI+k=;
        b=KdNdpMfPa2qzagTUcSrm6Sg3O73JYd6VSsxgo+tglyBnRNCUdJpSB1T2z0TRl6/Pat
         kszY/TFoL05jDd075qH3GMzbVhIzGZe38EMbWgcIqCqXlIvqUpZr89dbQebJO891LdWL
         ZxMGbF7515mPtKc3BbS3Vc6hn8xrhkbU3156fpEdCvtYe1M9iHdIgN8dYzioFfPiBHWU
         HAIQ82PnqqejTYTtmOPOHUNpyfqWqgb5zEu7lD2qTgGVNDk/t9gv77JMVaAj+AHBw/MY
         CIT48eg9SfEphRfi1PSAMkGg/FQ1oKBL+r8t99nkU/nP/RPmpqpp/61Au+FMHBOLVwnb
         EEtA==
X-Forwarded-Encrypted: i=1; AJvYcCX1sMurF6cjLkKuyCQo/3NdKKplyHIaitbfLmt6c92XJPLHEROMravC2uuWcePDYgATPz5lJkIN7MUVo5wGpukP@lists.infradead.org
X-Gm-Message-State: AOJu0YzgKRbtjnwKQaW4b0hWkndAOjMjC1ZQMiJ7vHyjDL7q+IBeM9sE
	ueX8tmxro8cJ+iDyb7lziU5uZyWiJFXIAviofqqrrAJwlfF9EBX6IqJE5lTY33JEvjFKbhXoR//
	jb/UtfMKm+Dkqtxyug4TVagzPkb54TEPi+4K3
X-Gm-Gg: ATEYQzz7msIp8M4P/sD+y9mtp7smHvSKvu+jgpuNU7QSCxfX9u/vGERO6T9znWg0Ira
	o1kNwW/v1TJOWFEmsBIFn21yKvgcxVCA20DEFwpWpHNAKn7l+pDur2jHkU9t6uAxC3DONBEYMa7
	ocj0Uq7CGMHTXSLfkP+aAqv4pAdLXmGilpECHfjtAMYDqRqvesT+1zUZzlk6hNk9Nq36U9k8G7O
	vcbvS+n5APMZgizbxdPWvPAJLbEYJaQG9IgN57rAjHE5iLmM6M2+qGgZ6uDnew/V3LyIclRY19Y
	oSWzF54=
X-Received: by 2002:a17:903:32cc:b0:2b0:5990:cf1e with SMTP id
 d9443c01a7336-2b269c80fd2mr58675965ad.33.1775100844939; Wed, 01 Apr 2026
 20:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de> <20250911-v6-16-topic-sdma-v2-2-d315f56343b5@pengutronix.de>
In-Reply-To: <20250911-v6-16-topic-sdma-v2-2-d315f56343b5@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 2 Apr 2026 11:33:52 +0800
X-Gm-Features: AQROBzCSdKcZaLbfDao98j_I1toGLvfE9bJe_Lqq7ufOyEXTyqcaETde8D_cryk
Message-ID: <CAA+D8APVK8SUSK7_mQ0Rr5EYSSkxaWG52KYRKN=XpBV-dZTskg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dmaengine: imx-sdma: fix spba-bus handling for i.MX8M
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_203406_276297_04404C83 
X-CRM114-Status: GOOD (  27.73  )
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

On Fri, Sep 12, 2025 at 6:05=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Starting with i.MX8M* devices there are multiple spba-busses so we can't
> just search the whole DT for the first spba-bus match and take it.
> Instead we need to check for each device to which bus it belongs and
> setup the spba_{start,end}_addr accordingly per sdma_channel.
>
> While on it, don't ignore errors from of_address_to_resource() if they
> are valid.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/dma/imx-sdma.c | 58 ++++++++++++++++++++++++++++++++++----------=
------
>  1 file changed, 40 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 3ecb917214b1268b148a29df697b780bc462afa4..56daaeb7df03986850c9c7427=
3d0816700581dc0 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -429,6 +429,8 @@ struct sdma_desc {
>   * @event_mask:                event mask used in p_2_p script
>   * @watermark_level:   value for gReg[7], some script will extend it fro=
m
>   *                     basic watermark such as p_2_p
> + * @spba_start_addr:   SDMA controller SPBA bus start address
> + * @spba_end_addr:     SDMA controller SPBA bus end address
>   * @shp_addr:          value for gReg[6]
>   * @per_addr:          value for gReg[2]
>   * @status:            status of dma channel
> @@ -461,6 +463,8 @@ struct sdma_channel {
>         dma_addr_t                      per_address, per_address2;
>         unsigned long                   event_mask[2];
>         unsigned long                   watermark_level;
> +       u32                             spba_start_addr;
> +       u32                             spba_end_addr;
>         u32                             shp_addr, per_addr;
>         enum dma_status                 status;
>         struct imx_dma_data             data;
> @@ -534,8 +538,6 @@ struct sdma_engine {
>         u32                             script_number;
>         struct sdma_script_start_addrs  *script_addrs;
>         const struct sdma_driver_data   *drvdata;
> -       u32                             spba_start_addr;
> -       u32                             spba_end_addr;
>         unsigned int                    irq;
>         dma_addr_t                      bd0_phys;
>         struct sdma_buffer_descriptor   *bd0;
> @@ -1236,8 +1238,6 @@ static void sdma_channel_synchronize(struct dma_cha=
n *chan)
>
>  static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
>  {
> -       struct sdma_engine *sdma =3D sdmac->sdma;
> -
>         int lwml =3D sdmac->watermark_level & SDMA_WATERMARK_LEVEL_LWML;
>         int hwml =3D (sdmac->watermark_level & SDMA_WATERMARK_LEVEL_HWML)=
 >> 16;
>
> @@ -1263,12 +1263,12 @@ static void sdma_set_watermarklevel_for_p2p(struc=
t sdma_channel *sdmac)
>                 swap(sdmac->event_mask[0], sdmac->event_mask[1]);
>         }
>
> -       if (sdmac->per_address2 >=3D sdma->spba_start_addr &&
> -                       sdmac->per_address2 <=3D sdma->spba_end_addr)
> +       if (sdmac->per_address2 >=3D sdmac->spba_start_addr &&
> +                       sdmac->per_address2 <=3D sdmac->spba_end_addr)
>                 sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_SP;
>
> -       if (sdmac->per_address >=3D sdma->spba_start_addr &&
> -                       sdmac->per_address <=3D sdma->spba_end_addr)
> +       if (sdmac->per_address >=3D sdmac->spba_start_addr &&
> +                       sdmac->per_address <=3D sdmac->spba_end_addr)
>                 sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_DP;
>
>         sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_CONT;
> @@ -1447,6 +1447,31 @@ static void sdma_desc_free(struct virt_dma_desc *v=
d)
>         kfree(desc);
>  }
>
> +static int sdma_config_spba_slave(struct dma_chan *chan)
> +{
> +       struct sdma_channel *sdmac =3D to_sdma_chan(chan);
> +       struct device_node *spba_bus;
> +       struct resource spba_res;
> +       int ret;
> +
> +       spba_bus =3D of_get_parent(chan->slave->of_node);

if the chan is requested by __dma_request_channel(),  the chan->slave =3D N=
ULL
Then there will be an issue here.

Best regards
Shengjiu Wang

> +       /* Device doesn't belong to the spba-bus */
> +       if (!of_device_is_compatible(spba_bus, "fsl,spba-bus"))
> +               return 0;
> +
> +       ret =3D of_address_to_resource(spba_bus, 0, &spba_res);
> +       of_node_put(spba_bus);
> +       if (ret) {
> +               dev_err(sdmac->sdma->dev, "Failed to get spba-bus resourc=
es\n");
> +               return -EINVAL;
> +       }
> +
> +       sdmac->spba_start_addr =3D spba_res.start;
> +       sdmac->spba_end_addr =3D spba_res.end;
> +
> +       return 0;
> +}
> +
>  static int sdma_alloc_chan_resources(struct dma_chan *chan)
>  {
>         struct sdma_channel *sdmac =3D to_sdma_chan(chan);
> @@ -1527,6 +1552,8 @@ static void sdma_free_chan_resources(struct dma_cha=
n *chan)
>
>         sdmac->event_id0 =3D 0;
>         sdmac->event_id1 =3D 0;
> +       sdmac->spba_start_addr =3D 0;
> +       sdmac->spba_end_addr =3D 0;
>
>         sdma_set_channel_priority(sdmac, 0);
>
> @@ -1837,6 +1864,7 @@ static int sdma_config(struct dma_chan *chan,
>  {
>         struct sdma_channel *sdmac =3D to_sdma_chan(chan);
>         struct sdma_engine *sdma =3D sdmac->sdma;
> +       int ret;
>
>         memcpy(&sdmac->slave_config, dmaengine_cfg, sizeof(*dmaengine_cfg=
));
>
> @@ -1867,6 +1895,10 @@ static int sdma_config(struct dma_chan *chan,
>                 sdma_event_enable(sdmac, sdmac->event_id1);
>         }
>
> +       ret =3D sdma_config_spba_slave(chan);
> +       if (ret)
> +               return ret;
> +
>         return 0;
>  }
>
> @@ -2235,11 +2267,9 @@ static struct dma_chan *sdma_xlate(struct of_phand=
le_args *dma_spec,
>  static int sdma_probe(struct platform_device *pdev)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
> -       struct device_node *spba_bus;
>         const char *fw_name;
>         int ret;
>         int irq;
> -       struct resource spba_res;
>         int i;
>         struct sdma_engine *sdma;
>         s32 *saddr_arr;
> @@ -2375,14 +2405,6 @@ static int sdma_probe(struct platform_device *pdev=
)
>                         dev_err(&pdev->dev, "failed to register controlle=
r\n");
>                         goto err_register;
>                 }
> -
> -               spba_bus =3D of_find_compatible_node(NULL, NULL, "fsl,spb=
a-bus");
> -               ret =3D of_address_to_resource(spba_bus, 0, &spba_res);
> -               if (!ret) {
> -                       sdma->spba_start_addr =3D spba_res.start;
> -                       sdma->spba_end_addr =3D spba_res.end;
> -               }
> -               of_node_put(spba_bus);
>         }
>
>         /*
>
> --
> 2.47.3
>
>

