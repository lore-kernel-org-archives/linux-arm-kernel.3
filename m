Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B06BC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=; b=iGWVr6BQZKFmELcEHz74wa8T1T
	JKRkTxbHDcRBC3sHVPwb32d/ITyKp8CDJWVblSnx7Nl+UMun4W2/UDXPEJ4YolNha9HCL3b32/rx+
	Krv5A4Y/uuUeaVBddyhfAPjOiiEeQ47zZCpoL8PybQb9c2eO3zUomrSRnfawdYD71ChxTAdFgifYJ
	AsJ4pkt9y//fFwIqVXMVBxPwz0opDWMrqjkRagiZjvDEsVIaYd9JuOto0yQLo+B8sk9yBpVXroxkO
	oK6X8Z/u3xo+2iYpWGvHlw8GUPfu7vdH+5O359dwda3zSkgP7YoqUP8WYv3wLAYMLURCtEzdIzhRy
	9gxnZBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gMM-00000008Ewg-0XTc;
	Wed, 16 Sep 2026 03:30:58 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gMF-00000008EvY-1ByM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:30:55 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f6so3133045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789529443; cv=none;
        d=google.com; s=arc-20260327;
        b=oAfWbwoFMqy/tjchZlw8s4deNojNGczctJwwH3yf3zFIfjgKiXcZvJ6Xs9zl1Gky7u
         hWLGZMH4jwik6QFXf4tHwUOmEL2COLRNPXlcKOMmdTPXIMEeVgAEb/MW+U1MBr68Y3fx
         McxUrh42yrPJkiYu27vGkUeAlQyxdw5QgAhWNL/PsnpY4kxA83Dy9ffRcbHPWwO4706p
         011m6/dVGa+aooOXWMuqEvVNU4jATVDaOqrFWnC/LECp2Ett6VcxCNy4b4K3FLjdMMcw
         L37NjB3LyA57MtI3vi4e0ytTChEBP6+/Hn7wLdAxL2T2ut+th4z5Kr13Xn8W8wd7YXPL
         GeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        fh=whkQoPQqug7yLr60p+yMLnwY91dl5QFr4WtsVwTiUPo=;
        b=qdSqDPLb2tw2oMUaICml4d83LSQRwfP5R0/RmwZcpuAdY429gX6gqbivIL+lCKqmNJ
         1RpUk9TO/pcg0valmLiERxE/qdyDAOWrMag0YJPC05qAcKV2SJsZB6q44pe5d9xk+aI4
         Ei6Of+9zV/n9CNUmDw7Qm5a3msgiKwcU+4LFoAm8S2mP0PayHLvVW6BwSzPIycmKgNFY
         SosUiyR8X42Sha+ROcMueUKP155neowWz5Jy776+2u/hULzHYLYLfzvXZvW6zR5rizjh
         wkQbCVzTkaaMJhc4ORkmxcJO58Fqm+tzR4SBh3Dp+wF2vAiUnLlqG0RFfMSlB6aiLNC2
         xaNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789529443; x=1790134243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        b=dlxctrc4mbIkJUQV9FXruN3Q4RPoZgyrfWBopgtljuM8OyeEwvaheRoYbfmWM8TsDv
         yLdQBfs9D1nEiGKhR8ldsF5XEEHsWDZt6ssebTyTmAGhkt0Kifv1KSWGOxT5g0XEp8VZ
         /VZZneBkpMnQPrL5P4DIAJNjutrsGy33o0DLw/O/nSdItYXmeY5XNMfmd0ehHhYWVY+P
         V1LRmX3VlPm2CwjFFn6GmAng0zgmRnErG3bWG9Q8PYKXnwM6UZJxssv58k4j1WcS/+Nw
         GDOEZ4O0FvZrW+cTZfGrtlZDe8SP/r6fF83KRplbEYNrfOlHPcmA4ENVqxkm9hY6Jh0N
         5rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529443; x=1790134243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        b=hkSb6dBTOI1B60lDq7ZEIyW81IpUhHOyRam93DDTDlLlH5KwsoyunR08JxgDBdKmzl
         M7NxkryDT1u+HD5y++t1EkssC+JtGKYgu8BM72fUywA9PgnsHWFjUPey19V2IR56oxMA
         GDOnsgYJXcrTmHunG2OgzUijNvHB6sE8uGYadN7UEbWCF8bor5m7fbydUDG7KkP9C1U+
         dvP/7ur+JRkrVFpsSHy8sUB4VU12Mf6d4h2ZrKcHLR9gzqnKM4h4hEuJsig5qBcWwm7p
         vL63mjlGz21fPqAPTJgeqWtrBHSCKsuZSfX6ugbWF641rduaewPDTzryUDFFzR4AABz1
         mQRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwf+Abx5P8HedXf4rz2Gz/dV7Df+zi1E16fY4yGYZeUZbKKmeo/II1gdkgUv4HAB3HcaCyzhgOjjcTHn6UYB3i@lists.infradead.org
X-Gm-Message-State: AFuF++nZOWoDKcBTtQgslVtkB6jlJPjzPB1m+UUTOrqq0UWaLoSuZohY
	87Rr1C1HAPjDTcaSbbBRi6uOF/GOb6MROEyNLLqEu+LHvH5MtofWI+y1/Q3bkcvCQ1pM1F/90os
	Dcp1fDc+VSCoQ+nec4MA0UHKVHEZZmOM=
X-Gm-Gg: AYBFou2Az9/nP24mglACaEahx1xFyqWJdNnGYcM+hRhP0yZLhqRrPsR7E9B/Q1GvGy1
	WhO+u5ggzlBoGgAHnC5ek5cfUaUpHgfCax5tTPijxWMm9gtQujGp09HG4b5Y9ge0nFq7haBN3C2
	kN9JhUksD/ShmZmCsU3WvGh6qMQNrLPN/tDGyD0T8Hq5MAMS5oyNiLB+GJRbEw1UTdF3qS6tx1q
	onmXNkHEfXnsVAAayaD9ykt/k5pu559YrEZC6udT6Oj12IzBCZNIfo++Ro69IUKp1gwTTcbe1Wc
	WdQ5YUNPZDLT2of1jNKhFy4+IvJZY0xAPxSiVTvTWL45IRc6evZYncCvHIBmmPaDum4=
X-Received: by 2002:a17:903:1ac5:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2dd8e003302mr22506815ad.6.1789529443281; Tue, 15 Sep 2026
 20:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com> <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 16 Sep 2026 11:30:15 +0800
X-Gm-Features: AcwNN1XutB8iZg2AF0p02q4kvkV9mnifXUYQQ4fzj9LiCitjAIk_rhIx4BZpDsc
Message-ID: <CAA+D8APje43K1vNagzzH4yX=q1fx0Ntwa28fuFfyhYt5MRCkbg@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ASoC: fsl_asrc: Replace dma_request_slave_channel()
 by dma_request_chan()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, bui duc phuc <phucduc.bui@gmail.com>, 
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Dave Penkler <dpenkler@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Lars-Peter Clausen <lars@metafoo.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203051_337753_909F39A0 
X-CRM114-Status: GOOD (  20.45  )
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

On Tue, Sep 15, 2026 at 6:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc.c     |  2 +-
>  sound/soc/fsl/fsl_asrc_dma.c | 13 +++++++------
>  sound/soc/fsl/fsl_asrc_m2m.c |  8 ++++----
>  sound/soc/fsl/fsl_easrc.c    |  2 +-
>  4 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index b24737add001..ae682bf450f6 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -638,7 +638,7 @@ static struct dma_chan *fsl_asrc_get_dma_channel(stru=
ct fsl_asrc_pair *pair,
>
>         sprintf(name, "%cx%c", dir =3D=3D IN ? 'r' : 't', index + 'a');
>
> -       return dma_request_slave_channel(&asrc->pdev->dev, name);
> +       return dma_request_chan(&asrc->pdev->dev, name);
>  }
>
>  static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 2f662bdf14d0..5cd12781c604 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -191,9 +191,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_com=
ponent *component,
>         dma_params_fe->maxburst =3D dma_params_be->maxburst;
>
>         pair->dma_chan[!dir] =3D asrc->get_dma_channel(pair, !dir);
> -       if (!pair->dma_chan[!dir]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[!dir]);
> +       if (ret) {
>                 dev_err(dev, "failed to request DMA channel\n");
> -               return -EINVAL;
> +               return ret;
>         }
>
>         ret =3D snd_dmaengine_pcm_prepare_slave_config(substream, params,=
 &config_fe);
> @@ -404,9 +405,9 @@ static int fsl_asrc_dma_startup(struct snd_soc_compon=
ent *component,
>
>         /* Request a dummy dma channel, which will be released later. */
>         tmp_chan =3D asrc->get_dma_channel(pair, dir);
> -       if (!tmp_chan) {
> +       ret =3D PTR_ERR_OR_ZERO(tmp_chan);
> +       if (ret) {
>                 dev_err(dev, "failed to get dma channel\n");
> -               ret =3D -EINVAL;
>                 goto dma_chan_err;
>         }
>
> @@ -497,9 +498,9 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_compon=
ent *component,
>
>         /* Request a dma channel, which will be released later. */
>         chan =3D asrc->get_dma_channel(pair, IN);
> -       if (!chan) {
> +       ret =3D PTR_ERR_OR_ZERO(chan);
> +       if (ret) {
>                 dev_err(dev, "failed to get dma channel\n");
> -               ret =3D -EINVAL;
>                 goto dma_chan_err;
>         }
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 4bc40f328f58..e440cc083ebb 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -503,16 +503,16 @@ static int fsl_asrc_m2m_comp_task_create(struct snd=
_compr_stream *stream,
>
>         /* Request dma channels */
>         pair->dma_chan[IN] =3D asrc->get_dma_channel(pair, IN);
> -       if (!pair->dma_chan[IN]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[IN]);
> +       if (ret) {
>                 dev_err(dev, "[ctx%d] failed to get input DMA channel\n",=
 pair->index);
> -               ret =3D -EBUSY;
>                 goto err_dma_channel_in;
>         }
>
>         pair->dma_chan[OUT] =3D asrc->get_dma_channel(pair, OUT);
> -       if (!pair->dma_chan[OUT]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[OUT]);
> +       if (ret) {
>                 dev_err(dev, "[ctx%d] failed to get output DMA channel\n"=
, pair->index);
> -               ret =3D -EBUSY;
>                 goto err_dma_channel_out;
>         }
>
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index aced16d1228a..d30cc3e90215 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1433,7 +1433,7 @@ static struct dma_chan *fsl_easrc_get_dma_channel(s=
truct fsl_asrc_pair *ctx,
>         /* Example of dma name: ctx0_rx */
>         sprintf(name, "ctx%c_%cx", index + '0', dir =3D=3D IN ? 'r' : 't'=
);
>
> -       return dma_request_slave_channel(&easrc->pdev->dev, name);
> +       return dma_request_chan(&easrc->pdev->dev, name);
>  };
>
>  static const unsigned int easrc_rates[] =3D {
> --
> 2.50.1
>

