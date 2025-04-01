Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F99C36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P6SMD/bKhjEujLUGf61mWQXWZIRCeLismurG+acV7Y=; b=fN21Boipgfe4zY0VYLOzvpXufy
	O6PAaOZKjNcHbrNEpPumOB4q3V8ep64p5hs0zg/neO25KMLpnnJiLPOWProy0Ljq2kySdrg2Q/Pnh
	CylgEAMCoCHdj46L92SfzGn5SCtQQH6Vl7XgSgtLqe5ep/Yraf/dAttDVS9bEWFWW7eNWmCp+qGil
	9ldBrNEKZZ2uvXn4hvYojoQefo1FFH/w1iGu9mZGEMcEv2rfrpbZsI4g7DNktczVNirN0LEc87fJT
	5t0N87ATQv+yJ2ZuV2uKG17Whfq7Bw1RFLAakdczvqDw1FIhYYj3RIK1poS+aSgOVbrEItDOY+fpg
	dWWkTAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZJ5-00000002hOS-2Ufq;
	Tue, 01 Apr 2025 10:57:23 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ0z-00000002eSE-3Bfl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:38:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54addb5a139so5985655e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743503920; x=1744108720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P6SMD/bKhjEujLUGf61mWQXWZIRCeLismurG+acV7Y=;
        b=Q+vbhaps3Oan9uJ6kmqmSg7huaxDSU06hAwVwfn4GpcvWdExesOvOfmXYPofukky3b
         GSQS9TdvZr7hF+GojxZyVY3CCpKjw4zNv3IFhM6nH+2ITfDYM4FmSjtGm++DEfhzlhjC
         AWXNB1nPmnrQxvESId2BUfFnvHoL5oWHVUYrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503920; x=1744108720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P6SMD/bKhjEujLUGf61mWQXWZIRCeLismurG+acV7Y=;
        b=OztzL7h4xebU8vQ7iIydqP98uRcXlaWrGPIgoWRCDsxg/rOm4Z+hG8vZlV+f2JvS4T
         KkOhoABLjGSPF3GPVZ03r9HYSRuwmc+cs7S7oKe1c7s0039KBqjXGoQpx66VE/nN14V3
         uEDObm7ZMF89DwEPJV46vo/OEI3h8V/XBym2UXB1NF4HwW/lmWXZC6ri8v/QNHCLcEZc
         u6BOG0R43sDwmXoBErQcfAHiwUje2Rs9TcIqK21TUPq2EoE2bGA7AEnLhZdisTqW5+dG
         +nzejr9FMYc6/qx+fr+NwoP88Wmc7xPZfVOhUnX+t1F6j3Dy/kZxyKLVuYmguJAMSDTv
         gaMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgZFNwvf5qpOgVoLKpqSU4ks1mffJcCx2K9PZ1Bh7E3Tz6YAG8pA3qxfmMHmBgtXjZYpQeB9IbtR38R/VNZ+ti@lists.infradead.org
X-Gm-Message-State: AOJu0YxH5hKHxlmFQhJ/6XEn/WSfT9vwxLwoF/J1DkkGVRaZ6Za7pwCC
	WQ2N8BIxOHFU/bT0Nc+poY1b3bOMiFQAzuDJN96po2rgvvXx/M42c1XR7fB/sbtmGcsq9f8TNjv
	I7k11evvv3ZBeN8ZeeALwg8milZVHpeU/ZXYQ
X-Gm-Gg: ASbGncvmIu/SW3sZF93D78FXfVDnyRQSCqexNOYHkcPrnKK5agqeBpjviUeiL61JvKa
	dgn+eLPrpMkuqYNsaaMCinXPxnfU54B8EEpEUBsOSCqqYmzf2OhwEAyVDJrwDff8qEBbBHXE7r2
	NQDYdlzszAoB7Ow4vM+LzaTl0952ibT/WEIEzBwiz++wuvoOGueyhD3w==
X-Google-Smtp-Source: AGHT+IFqb50D2XU09Hg1uqN245vHYLHlnocBE1aPtPJ4+hrmspphH1HPpdjvdi8L1C0+N760QbNY2I46IYB3Jv1diC4=
X-Received: by 2002:a05:6512:12c4:b0:549:4e79:dd5f with SMTP id
 2adb3069b0e04-54b11011803mr3105755e87.37.1743503919726; Tue, 01 Apr 2025
 03:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250401085659.1222008-1-wenst@chromium.org> <2de0cc68-f3d7-4b9c-86d3-105666963fb7@collabora.com>
In-Reply-To: <2de0cc68-f3d7-4b9c-86d3-105666963fb7@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Apr 2025 18:38:28 +0800
X-Gm-Features: AQ5f1JrCHXHKf9Nj2VGAr7AcO-rnH97YDI2A2evb14saP9NqEu9tQ2fTUEE_3nA
Message-ID: <CAGXv+5Hw+13J6eU6X3EPa+Vr4kmyNH5L83Zj2VLqx=_Z+XtOzw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some platforms
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-sound@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, treapking@chromium.org, yuanhsinte@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_033841_976027_ED09262B 
X-CRM114-Status: GOOD (  27.80  )
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

On Tue, Apr 1, 2025 at 6:12=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 01/04/25 10:56, Chen-Yu Tsai ha scritto:
> > In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation"=
)
> > buffer pre-allocation was disabled to accommodate newer platforms that
> > have a limited reserved memory region for the audio frontend.
> >
> > Turns out disabling pre-allocation across the board impacts platforms
> > that don't have this reserved memory region. Buffer allocation failures
> > have been observed on MT8173 and MT8183 based Chromebooks under low
> > memory conditions, which results in no audio playback for the user.
> >
> > Reinstate the original policy of pre-allocating audio buffers at probe
> > time on MT8173, MT8183, and MT8186 platforms. These platforms do not
> > have reserved memory for the audio frontend.
> >
> > Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Have you tried to add the reserved memory regions to the MT8173/83/86 AFE=
?

I haven't tried it, though I'm fairly certain that would work as well.

> This means not only devicetree but also the driver - that should be simpl=
e
> enough, and would allow to eventually add a layer of further commonizatio=
n
> between the AFE PCM drivers of all those MediaTek SoCs.

I think no driver changes are necessary? It's a single memory region,
so it would automatically be picked by the driver core for all coherent
DMA allocations.

I picked the driver route because it restores old behavior.


ChenYu

> Cheers,
> Angelo
>
> > ---
> >   sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
> >   sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
> >   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
> >   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
> >   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
> >   5 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/soun=
d/soc/mediatek/common/mtk-afe-platform-driver.c
> > index 6b6330583941..70fd05d5ff48 100644
> > --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> > +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> > @@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *compo=
nent,
> >       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> >
> >       size =3D afe->mtk_afe_hardware->buffer_bytes_max;
> > -     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,=
 0, size);
> > +     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
> > +                                    afe->preallocate_buffers ? size : =
0,
> > +                                    size);
> >
> >       return 0;
> >   }
> > diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/media=
tek/common/mtk-base-afe.h
> > index f51578b6c50a..a406f2e3e7a8 100644
> > --- a/sound/soc/mediatek/common/mtk-base-afe.h
> > +++ b/sound/soc/mediatek/common/mtk-base-afe.h
> > @@ -117,6 +117,7 @@ struct mtk_base_afe {
> >       struct mtk_base_afe_irq *irqs;
> >       int irqs_size;
> >       int memif_32bit_supported;
> > +     bool preallocate_buffers;
> >
> >       struct list_head sub_dais;
> >       struct snd_soc_dai_driver *dai_drivers;
> > diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/med=
iatek/mt8173/mt8173-afe-pcm.c
> > index 04ed0cfec174..37b20ec80829 100644
> > --- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> > +++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> > @@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
> >       afe->mtk_afe_hardware =3D &mt8173_afe_hardware;
> >       afe->memif_fs =3D mt8173_memif_fs;
> >       afe->irq_fs =3D mt8173_irq_fs;
> > +     afe->preallocate_buffers =3D true;
> >
> >       platform_set_drvdata(pdev, afe);
> >
> > diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/med=
iatek/mt8183/mt8183-afe-pcm.c
> > index d083b4bf0f95..0ef07fb2898d 100644
> > --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> > +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> > @@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
> >       afe->mtk_afe_hardware =3D &mt8183_afe_hardware;
> >       afe->memif_fs =3D mt8183_memif_fs;
> >       afe->irq_fs =3D mt8183_irq_fs;
> > +     afe->preallocate_buffers =3D true;
> >
> >       afe->runtime_resume =3D mt8183_afe_runtime_resume;
> >       afe->runtime_suspend =3D mt8183_afe_runtime_suspend;
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/med=
iatek/mt8186/mt8186-afe-pcm.c
> > index db7c93401bee..c588a68d672d 100644
> > --- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > @@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
> >       afe->irq_fs =3D mt8186_irq_fs;
> >       afe->get_dai_fs =3D mt8186_get_dai_fs;
> >       afe->get_memif_pbuf_size =3D mt8186_get_memif_pbuf_size;
> > +     afe->preallocate_buffers =3D true;
> >
> >       afe->runtime_resume =3D mt8186_afe_runtime_resume;
> >       afe->runtime_suspend =3D mt8186_afe_runtime_suspend;
>
>

