Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A7CD73EAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 01:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=; b=EdkLfujTJMYeA3thi8UeoPZ1C4
	YZUf2M/BbTjmSlwNmuDgxJSAmvRb2KUB2fb1d+DiSwLP3DNoKOnCR2jPYjY10cdZ3e8VZdDIJs6/l
	HMb3g5rEGS+tR9x0fblFJDxf15nVJ+0qkvilckk3UE7+jfbWit1lFVgPEJZejDgbJcYzkrm2SfTFJ
	LBkIELg7q3VKwhJnp8YfAtYM4WOS9aOZWl910Z0lv2TPpECIRVUDd6hFnM1gt34wYVHz68GwsgTOv
	x5OTXAg83EJw/C0aLi/8mRrIIl1eifA0ifDgubSyPHK3F0CNguZCgoBHPS6i+7T0S9MX9Gp6sbpZm
	mRtc31Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldge-00000000sFv-3oTg;
	Fri, 30 Jan 2026 01:52:40 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldgd-00000000sFa-0NMv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 01:52:40 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso1658739a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 17:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769737958; cv=none;
        d=google.com; s=arc-20240605;
        b=Hz9yOCCOL7W7WAujdfXOTFo3dNwtMuh4kEAeCv/3x46DBkNUd1supV3CQWps99p+3q
         XvDl8eK9zdQB9TrBgsYKjjGwnoqpJPZWx//BuSHJZLTCztRPbuDtdi1SZKg96OjEyw+u
         OQEOoA23DVXBRxx5ZPiVvlqchK4upXw161dnC1yOiou3qanq/H89c7j+ZMjr6YVD2mZf
         nMFFbs8iW+wGE4o6iLCeiZAJLn+D8qvYKnpH2jLJ+ki94IOs09/fIOjVobJN9l09cCcL
         XHpUB9x693ZFA1uryop4J89apO1aD+DiaGhG4bTOYsD5hSa5Rwp3vVkuZebZkVJbPsnu
         H6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        fh=kfzPbuHLxMidNeMGquFgKTpBvGNIM0IJxvSX1JnrbrY=;
        b=OBKplUgxE4vzxmPIYMdW76gBmfMMIbgQWdPNWO/2881Yrg+r+dZq59B6xoXW5w1jG+
         2m5gXeG/BBImJ6Fs3esVzXejK2OLcTQEcdi4Bx7yFXRr68FU+KvjXdmtgZb2vZBcTNbW
         LISh6GEV+gNGO+O5cjTDi3WW87/jQgSwlJnLLIhiWZZcvUrmdExGjZNK9CDnjI4E+HnO
         k+sR+CtHZMkz4tSMxuu979IXqY9IKh01CGnQUFUfsjbTiVzHdwDIWtnlMWoqdnVKq7Mz
         rI3vhRu3A0uJEdRGtsOc4E53u/Q/w53nGbA8hZx1X86i7IDhXe/L8X31ARR7GWqZ7MIk
         c3ow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769737958; x=1770342758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        b=PDzvqSLIlr7W9vPrqGmFCZbUUxkwCFNTch4qyOuO1oRYcsOrKT4RGbQFxX9DS5Pke7
         gKr7AahkRp8AZkOa6c9ehnVpxBPusNx19ur4AHMCC4Rp7U72VATDoEv7QSeDAqG8xUpK
         UNZ1rgNU5tDzs0EKTqJdwaOgzjZBliUZqH3ftKzCT7GZWj+CeRhgK1Gr126m6aPUVj7Z
         e8rMatAmR4Lzd4sRAUwOjsrxZuaU6KADtLiU6a+jjrdz+nxNEal+V8m16lUUTdFHcAYg
         1sLdt5/fntLdWGK859xmtkkt7QYrGFS4yZ1jSBgoPrighp7YGrFcERcVnFID20aL1MXK
         8j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737958; x=1770342758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        b=daEOnTQyR6xijSfexSkHHVVJ+zWX340GDIWY7Birg/yYwMFtYMFwv6OEq6/Ofz488o
         EKuQBI7n4aGd7xvd3PQhHODlbwI6obCSZGdmj9xsyJgUwZN92nfC6OUDulgRjGMco8JN
         I2OK1WAjqVkjr+t/6tMxU9NJoUAsynid/xVlAyTG/mWm5WlDBOqtRmv9FVDdbtIzSQ+t
         Bxwf38WGCCKMnSo732nGBolnCEQHInZ9Z/oESXk05SXjedK9A3MtV6fH2KwIIIZkQbwb
         TjC5OoDGFsITPwu5PWGDL5P/r8TICQByMi2phbm4AMtL5t1LtTKTTn9G+2X8036Acchy
         Pfjg==
X-Forwarded-Encrypted: i=1; AJvYcCVwiZdVUfxf1C2fid3F2l45uw/LvQPaIJlB/7UkVjv7ocrJzwIcfP7DKluQnTGP5fdzMPzAaFXsTz7LPcUaguao@lists.infradead.org
X-Gm-Message-State: AOJu0YxhUkHFKBnK3uTUPnAVmDB3PRlm5Iqsk5jfJhRy31eZ6ny1V4/7
	LUPcu60NOpx2pHRlaT+eJk/2Z/wMTsQbicXGINvIBI8ng/lU9XV81blrUlJ2S98180J49FL0GMJ
	jf8JbnzmJ+Y8PIN5yxKOPhKjO3RYM2yQ=
X-Gm-Gg: AZuq6aJxh4avuihzia36RJodpfV3/EAJphJWqDo0atT1H7l9FshZtXm6ZCch6IVTiA2
	ryerrOxTzfMlhcd1gHKpeJLaYl/2PKqoANHy0icRH2C1QFmnzmlYq1PJjIkt30VdOp63PKjEZMm
	0KqeRRmMQGgyQPkZxQypMDaPh712LBC2aBEspANlEaE/uk0cVqqR7zMS4t8bflITeJGYrLjqKf7
	qVcP4flNxxbOlDo4omXCFGGwk+QQPvndttzSjPyEIQHlNn0MItIXT4jTm+x7/hX8hmaWYE=
X-Received: by 2002:a17:90b:1c0e:b0:340:8d99:49d4 with SMTP id
 98e67ed59e1d1-354299f24a8mr4236387a91.1.1769737957855; Thu, 29 Jan 2026
 17:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com> <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 09:52:26 +0800
X-Gm-Features: AZwV_QiF2cDrLfRKNnjCIo-qh5cZKFulc8s1nwm3YFRDiF2SntZx7QwlcKkdk5I
Message-ID: <CAA+D8AM2d8m2eZnenH7gqOEUO1dLifFSNgizRRXwOiLX2vVdTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_175239_142142_F79A5C54 
X-CRM114-Status: GOOD (  27.25  )
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

On Fri, Jan 30, 2026 at 1:09=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:53PM +0800, Shengjiu Wang wrote:
> > As the dma device may support dma-coherent property on the i.MX952,
> > allocate memory from dma device to make asrc driver to be compatible wi=
th
> > such a case.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.=
c
> > index 7dacc06b2f02..b8fe242d53db 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > @@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component=
 *component,
> >  static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
> >                               struct snd_soc_pcm_runtime *rtd)
> >  {
> > -     struct snd_card *card =3D rtd->card->snd_card;
> > +     struct device *dev =3D component->dev;
> > +     struct fsl_asrc *asrc =3D dev_get_drvdata(dev);
> > +     struct fsl_asrc_pair *pair;
> >       struct snd_pcm *pcm =3D rtd->pcm;
> > +     struct dma_chan *chan;
> >       int ret;
> >
> > -     ret =3D dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32))=
;
> > -     if (ret) {
> > -             dev_err(card->dev, "failed to set DMA mask\n");
> > -             return ret;
> > +     pair =3D kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL=
);
>
> prefer use size_add(sizeof(*pair), asrc->pair_priv_size), which did
> overflow check.

Ok, will update it.

>
> > +     if (!pair)
> > +             return -ENOMEM;
> > +
> > +     pair->asrc =3D asrc;
> > +     pair->private =3D (void *)pair + sizeof(struct fsl_asrc_pair);
> > +
> > +     /* Request a dummy pair, which will be released later.
> > +      * Request pair function needs channel num as input, for this
> > +      * dummy pair, we just request "1" channel temporarily.
> > +      */
> > +     ret =3D asrc->request_pair(1, pair);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to request asrc pair\n");
> > +             goto req_pair_err;
> >       }
> >
> > -     return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> > -                                         card->dev, FSL_ASRC_DMABUF_SI=
ZE);
> > +     /* Request a dummy dma channel, which will be released later. */
> > +     chan =3D asrc->get_dma_channel(pair, IN);
>
> Is it possible get real dma chan from fsl_asrc?

This is real dma chan, may be I should remove "dummy".

>
> > +     if (!chan) {
> > +             dev_err(dev, "failed to get dma channel\n");
> > +             ret =3D -EINVAL;
> > +             goto dma_chan_err;
> > +     }
> > +
> > +     ret =3D snd_pcm_set_fixed_buffer_all(pcm,
> > +                                        SNDRV_DMA_TYPE_DEV,
> > +                                        chan->device->dev,
> > +                                        FSL_ASRC_DMABUF_SIZE);
>
> Here you assume chan->device->dev never change when it did DMA transfer.

Yes, this refers to the generic code in ALSA.

best regards
Shengjiu Wang

>
> Frank
> > +
> > +     dma_release_channel(chan);
> > +
> > +dma_chan_err:
> > +     asrc->release_pair(pair);
> > +
> > +req_pair_err:
> > +     kfree(pair);
> > +
> > +     return ret;
> >  }
> >
> >  struct snd_soc_component_driver fsl_asrc_component =3D {
> > --
> > 2.34.1
> >

