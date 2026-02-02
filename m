Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCD8E73150
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=; b=Mvuh7k8WB0eUcXvgHxnb0d0LzN
	q61RV5fywm3uhHAaNSGys84G7MDs267lX4CZl1Lm8JITJvBspwe/G3yZv9YoG5s48NrpKTsIycaYS
	6mPvYgRqqu6x1fnoZejsBPkt5W2DeowndlyY01wD+zDKsfJ+jgosuv388Vsg1dZ7DbDtPCvadsHvL
	PYaT8GdL7eD7kuwGGuaXTrFr0IVOi1PSC9P+WnJVoa4bMgLSYD1kTXF0J2izz9iDw1AgiSvwKJqbN
	xnY3VYLES5MzzdMlirOINwGfbI5YKqd+GBEFdJncuVqHMKE9s4cTvi8uXZYgv8/nQPSSus+U7oMip
	NgQpz49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqTy-00000004jYi-0vyQ;
	Mon, 02 Feb 2026 09:44:34 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqTv-00000004jYG-1i1m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:44:32 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35334ea1f98so1901595a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 01:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770025470; cv=none;
        d=google.com; s=arc-20240605;
        b=HjNUzv3YyjSecTAMTUICjVbHfeH7d3bFBUlH021Ck1T1mYtBodwQh5vnvrViUCyLBK
         Rv/lq8DwwTC9NbCFUlNFlE1BUj402ZyryYEHVzPZq/+XW4rj8sKragMj6HeEoQHBTm82
         u5xIpus6PcuXtzcmxP1EmM1It15YhSsNlzmTQQwZxTSqyoMBYhb62yBvApYzVPedYMJI
         wPCSyk0XP0vkOmDq+7ybo03UQhmZKLVf9X84CPKzQwKMtZFvf5S730w/bMtFFmUH7G5l
         rWIoxeb2l4AgexZV/yiC3rxsqY2o5MNnmccSmxznrdhDtuBwwn7cbu2wA/r4I/DjnsXW
         X5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        fh=gjfVAL9s9yvC9SNUhuvsUlORggGi+lmf270C36XvMUs=;
        b=POcykXsV8kW5hhQFySVeNKVHNCNMq3/QNgH0gRSuKpGmWnYoTAVFh9rgZ35d/qsZt/
         CPu1DBcjXqhwVFL+0JaMCKO5RAw6ttte0OcWQihnPfRd7S7B8BPyoyxRDntLSizjEp2L
         eeQW6ND7kitTQWYcYqcRTe7OF2lrVcH4nxm3iz32jS5DP8oV6LwchJ1HHSgc34giDtlR
         oJhXNH9NaH50xhIz6nnxKvICy+PP27cHai41X1w6Bx00YX0gxZFZf9nokfeRQg+GZCBs
         TUAfapZmo/l4GCzKIs7+q48gfi+mEQaPh586+BUcqoVCuYOeoZeW+ki3dyLKA+WBYyWj
         cSeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770025470; x=1770630270; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        b=If55/ujgzYDWsPGcP5/noxqafgbP5LNHV+Rqjg+1wcAGXrIwqUi3l/g97EGZcVd95U
         P9GBidds3F1J7HK+QSWjhqcOk6FfHd/f+46FIHUbWvFReGTB/qZtyvaS/U/w2+zhjf9J
         Y+Z+CLsQPG525ShlugvF09oWzzV8SmsaL7oKJvr3V4kvCX0OZIEZOeUWxrchxwLrc+2a
         LHe4JY9O6l5k3IaFIoIXk4T8p4sn6FQiROchO1otugzzcPkUKnCpiUNMBLtLujRluWwU
         FsJ5Put+un2Aq8Fnx/0JLF/DwfsDXBW6WrUMdYCF8pZyw7FigtmlajW1ooQYJ0SuRh0j
         0KHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770025470; x=1770630270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        b=UGqEVprU1fGRqVRTTGSsjfIzigBhoIzA/k8qi3QFTqBw92uKh94AqqIiDpqHozVCFS
         k3JI6PPUgiMluSflqq2oucunjkH6mRknKhNXQRe5DaLc6OCmsa+I2TQV2GCl3sx7FVDI
         uma4N3EI/WZXqgrrvswT1MR2k63Y0uHxR24PC0Hzonw84fWuG2uREJjFDTaIq6wGw3WE
         TtyklloIhMJ6qs07zhFRDZPsbD98R1JO/G0udYDj6kAGESymGugwZ7UKWVqU+Yoy0ALr
         w+E8t8gFRC5VODWOaSV9Fmw5EtJNkeL52nKUN9MVNrYGrFQv8aGcXzw7GEYOmD5UdfsX
         /DSw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWqzauTMSHQaY7XAnD1ns7V0ip0wtX8Z0zp7YS74xjtAjS+QhncnOFUN+d+g8ndhmRb3Cl1rV/3iVcFz1jX2f@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh9e+Aw0oQJ3k0cBX4nIrY2+KwHJ48PTaUIBmg7VleG0kXHVRF
	1kIqBaOb1Yjlo7qWM7iQOsWcctm+65JMZIX2rNpx4pTHJvCalOEl+JACjMTrJOEbJKvZyc+VgKQ
	XmbamuZE6OazZAnM9kuXD1y+kb7i6nvk=
X-Gm-Gg: AZuq6aIIjs/iUoLkuBAmxzflQri8g3op7v+lM+iZgYRTRBkSal7QKhathEE74h3P2WQ
	yN4tqfYupArrjnSDXKImgZeE3fP1svvZn6/rO/dx6JXKYSFnssI5MAm7qehVGMT25OYMHohGdgS
	m5PCJ4TyFCfWrSGPceZA/4Ep1C9ktBYcKwSrKTp1bG0+t1fNbc2u0hvCWoDa+vPK7VJsnTUU075
	4OFcAPWXu3fF3IGpySB73fDfMQ2wZArGBApyGddYeG2nnqkKHL/F+jp4FsoUKf7eAiRYxYXtO7w
	Cv8K+A==
X-Received: by 2002:a17:90a:e704:b0:340:f7d6:dc70 with SMTP id
 98e67ed59e1d1-3543b32db3cmr10551164a91.13.1770025470178; Mon, 02 Feb 2026
 01:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
 <20260130054330.3462544-4-shengjiu.wang@nxp.com> <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
In-Reply-To: <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 2 Feb 2026 17:44:16 +0800
X-Gm-Features: AZwV_QgU5fRT0_5Q6bzl-9D65zjMNMGvATERP1AuFCLfH7W34TynL2XUXVAiodw
Message-ID: <CAA+D8ANrW0N7Sjbat_LN3d8UbcuN-=DOKjfF0XncgqqM62rCMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ASoC: fsl_asrc_m2m: Start ASRC before DMA device
 for M2M
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
X-CRM114-CacheID: sfid-20260202_014431_523278_C8A7B092 
X-CRM114-Status: GOOD (  33.40  )
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

On Fri, Jan 30, 2026 at 10:43=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jan 30, 2026 at 01:43:29PM +0800, Shengjiu Wang wrote:
> > There is a limitation on i.MX952 that dma request is not cleared at the
> > end of conversion with dma slave mode. Which causes sample is dropped
> > from the input fifo on the second time if dma is triggered before the
> > client device and EDMA may copy wrong data from output fifo as the outp=
ut
> > fifo is not ready in the beginning.
> >
> > So need to trigger asrc before dma on i.MX952, and add delay to wait
> > output data is generated then start the EDMA for output, otherwise the
> > m2m function has noise issues.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c        | 25 +++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        |  2 ++
> >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> >  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++++++--------
> >  4 files changed, 52 insertions(+), 8 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 5846a2b1f73c..2374577c13f9 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -1084,6 +1084,28 @@ static unsigned int fsl_asrc_get_output_fifo_siz=
e(struct fsl_asrc_pair *pair)
> >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> >  }
> >
> > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > +{
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     enum asrc_pair_index index =3D pair->index;
> > +     int retry =3D 1000;
> > +     u32 val;
> > +
> > +     /* Check output fifo status if it exceeds the watermark. */
> > +     do {
> > +             regmap_read(asrc->regmap, REG_ASRFST(index), &val);
> > +             val &=3D ASRFSTi_OUTPUT_FIFO_MASK;
> > +             val =3D val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > +     } while (val < ASRC_M2M_OUTPUTFIFO_WML && --retry);
>
> use regmap_read_poll_timeout()

Ok, will update it.

>
> > +
> > +     if (!retry) {
> > +             pair_warn("output is not ready\n");
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> >  {
> >       struct fsl_asrc_pair_priv *pair_priv =3D pair->private;
> > @@ -1281,6 +1303,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >
> >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> >       asrc->request_pair =3D fsl_asrc_request_pair;
> >       asrc->release_pair =3D fsl_asrc_release_pair;
> > @@ -1295,6 +1318,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> >
> >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > @@ -1565,6 +1589,7 @@ static const struct fsl_asrc_soc_data fsl_asrc_im=
x8qxp_data =3D {
> >  static const struct fsl_asrc_soc_data fsl_asrc_imx952_data =3D {
> >       .use_edma =3D true,
> >       .channel_bits =3D 4,
> > +     .start_before_dma =3D true,
> >  };
> >
> >  static const struct of_device_id fsl_asrc_ids[] =3D {
> > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > index 2f67b085de24..1be93148a879 100644
> > --- a/sound/soc/fsl/fsl_asrc.h
> > +++ b/sound/soc/fsl/fsl_asrc.h
> > @@ -446,10 +446,12 @@ struct dma_block {
> >   *
> >   * @use_edma: using edma as dma device or not
> >   * @channel_bits: width of ASRCNCR register for each pair
> > + * @start_before_dma: start asrc before dma
> >   */
> >  struct fsl_asrc_soc_data {
> >       bool use_edma;
> >       unsigned int channel_bits;
> > +     bool start_before_dma;
> >  };
> >
> >  /**
> > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_c=
ommon.h
> > index 0cd595b0f629..c8a1a2b5915d 100644
> > --- a/sound/soc/fsl/fsl_asrc_common.h
> > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> >   * @asrc_rate: default sample rate for ASoC Back-Ends
> >   * @asrc_format: default sample format for ASoC Back-Ends
> >   * @use_edma: edma is used
> > + * @start_before_dma: start asrc before dma
> >   * @get_dma_channel: function pointer
> >   * @request_pair: function pointer
> >   * @release_pair: function pointer
> > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> >   * @m2m_start: function pointer
> >   * @m2m_unprepare: function pointer
> >   * @m2m_stop: function pointer
> > + * @m2m_output_ready: function pointer, check output fifo ready or not
> >   * @m2m_calc_out_len: function pointer
> >   * @m2m_get_maxburst: function pointer
> >   * @m2m_pair_suspend: function pointer
> > @@ -143,6 +145,7 @@ struct fsl_asrc {
> >       int asrc_rate;
> >       snd_pcm_format_t asrc_format;
> >       bool use_edma;
> > +     bool start_before_dma;
> >
> >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, b=
ool dir);
> >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
> > @@ -154,6 +157,7 @@ struct fsl_asrc {
> >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> >
> >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buf=
fer_length);
> >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.=
c
> > index f46881f71e43..296e13a16490 100644
> > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > @@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pa=
ir *pair, struct snd_compr_task
> >       reinit_completion(&pair->complete[IN]);
> >       reinit_completion(&pair->complete[OUT]);
> >
> > -     /* Submit DMA request */
> > -     dmaengine_submit(pair->desc[IN]);
> > -     dma_async_issue_pending(pair->desc[IN]->chan);
> > -     if (out_dma_len > 0) {
> > -             dmaengine_submit(pair->desc[OUT]);
> > -             dma_async_issue_pending(pair->desc[OUT]->chan);
> > -     }
> > +     if (asrc->start_before_dma) {
> > +             asrc->m2m_start(pair);
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     if (asrc->m2m_output_ready)
> > +                             asrc->m2m_output_ready(pair);
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> > +     } else {
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> >
> > -     asrc->m2m_start(pair);
> > +             asrc->m2m_start(pair);
> > +     }
>
> if really like start_before_dma, move common part no change
>
>         if (start_before_dma)
>                 asrc->m2m_start(pair);
>
>         ....
>
>         if (!start_before_dma)
>                 asrc->m2m_start(pair);

Ok, will update it.

best regards
Shengjiu Wang
>
> Frank
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >

