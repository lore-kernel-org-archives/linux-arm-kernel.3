Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8BFCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D19Vw4l9A1iAw5lo1r64wNXQuyjnSfA8yjiubDQIMYM=; b=pfUXqwQyOhSzc4bH8dehpHk4XK
	WmUc/j0XrnlYS68qNd7vYyL0w+jlfE9efgbO8N6hee/XrGd0HjmIWyzpbnXsihWwcFDeFSorKSVJm
	z0iaob8E1XnfxbVAc/C2X9JmLQs9N4BGdwGby2vIhAFoBKpFCmKW7GaHnTa12eHQlDa6myiMQbnMs
	RgOTm8q51+chWwUChAf7OJPBbgErMH8F2wSb41q03OwSlgrkzbM06TnyQz2NjrtenxRW0srNudL3K
	RdIApQEsTfP8TYyQ3xyxwW5pRGqQdoz0maFMDDl/DmJDhs2m/I+om98nyWgoPLi4UBMyyPM/bIDYY
	CTZ5xdKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3GC-0000000Gden-2dK0;
	Mon, 18 May 2026 19:04:16 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3GA-0000000Gddw-0icP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:04:15 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7de46b8e432so2886603a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 12:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779131053; cv=none;
        d=google.com; s=arc-20240605;
        b=FFccEZryWmCU11OdNKpwrPjyw2UY4Ft0OBmRJJDWntc78Fz4xnAQEYT4u0q5nX/DoN
         wY/nHJEbEdDxO/TkLUfCVAqyDXWW6yvFmY5vMIPoQiPCndRkibgvDj91PUgZligZ8eId
         8qjaEGdFXYX2w/5sQeom6CNSjy9qKjoWY4GeHoQhAncSFkFX4vG6LnXG5K1QGwOgQblh
         fy5D0Z3rCGUZOfgoesKjQcCfCMHccdrmP4IiKPf2l2qkZoJeXaKE38gIMBn1MOSueRIL
         kaP5jH0YSUn5zcAfN5dASnY373NyK/R0BeMIc13gGFtJfGUlElqdDMgNiR8k/k2QmE5x
         m+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D19Vw4l9A1iAw5lo1r64wNXQuyjnSfA8yjiubDQIMYM=;
        fh=9ige2ZH5UKq5VF2iXZ3YW85XeNcYe0fzZYIb0V65WYk=;
        b=Asr0KgWfsul6kjt4rgqT98r4JSKJHiac5VzhdCvgb6vI+jTun/Pr/NqOL1y15rLmBy
         SLeflIcLBAEnYpALTmZmKps9ABMvfXwCZsIEQ/sIwTyMThTIDjpw1FkVYBSxEKphTh8d
         xB2T/ppfSErhaCaABozftfVakyB1FXFIlu7Cwz68U3H0G8sYUP3egCOZvK6wLUcNtCHk
         ofCXkfKBuZee1wMuzbaALhJ/41Oewd1Kue16kxA0n4NXjqU8YaoTG59Gar8/CauCZJSq
         yIxHrg3cJZWLd2J0XUJ3Q9ICKSfSNgRJOiKNvwsmnhP3SwQNyMwh+M1fuYVcxkIZgQqP
         txLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131053; x=1779735853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D19Vw4l9A1iAw5lo1r64wNXQuyjnSfA8yjiubDQIMYM=;
        b=JsGaL4sunm+B8ZWWKeXg+N4qxQhCQ+t5NFEFQ/2AeXDnlW0Ipk22F+lC2ONhn6Esmg
         i0g4XnEVdGkDv1BFQiBlka52Hn0iruZNt1gRvUKZDrDMzqjkZMxdfJkRmN9t0VfQcmgp
         UZzHEAs17e81WTrTiw+37Z66+uLmvMZekPHpR3gJeESoZAvlIsW928NiQ0cP4qgdB9UJ
         6ASqmLas3mc4DxVrvFVtHnqKZcWr0/+bzO5ZHu4nj8SM7MBWvN//wG5V8DIrZqZjkLTv
         NiXqAhfJylAGXheOFpl0IasDpKZTBIx6+QLJK10cF/4dmaKVuJFuu9h+cwphCRR/NAhR
         2epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131053; x=1779735853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D19Vw4l9A1iAw5lo1r64wNXQuyjnSfA8yjiubDQIMYM=;
        b=fMrSz+ZZksdE87huVhBNpaZA2KkLOO5aj73HR4S2HagBkMRAbMIaJNL+urdeTL94hH
         LYe6R2AOryTHVuurxNtDXxyFzrP90Ri43AY1qaqvzAzywa1uvqYCLbOcwBzey6BsKBNi
         kiGfYiAv/kSfcFmQ5tUcUIzr6OeSbbF5XM1si1xAF4B7QnzBlpZCP9uJUIXHCQyjrfFK
         VMSpPUhN1XQp+b3nlhM8PFqoVUyH2SSwi+9/JZ4Ueg2ZY9UnVqn9MbpYnmRzQXB0WPl0
         QjTePI3x78Qbxey9QE1JsdGbsZFUijX8CJbFJ7jG/J4Gdds/Ro9XNRCEoND01ZD6yc6a
         0kng==
X-Forwarded-Encrypted: i=1; AFNElJ9XWv/94qs814VCoOPdLlElOvFdCzjqeJAgc0h66HB4LZmjW0/mI1Fgj3ljoqUi/QWuqbx/dnLN7sA4/BllGC+d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ewtNfUanzXHcaDFB5PtOmjDPTVNh6kUfwPVGSSCgG893lHYT
	bxHi/IJFMyTb/x3f67yWCNpQNENBwQCiUjWwttcDq3o8D6WxJnI/g9GtRPexRocbqyG5jeycRIv
	d23+iUdKYQLfH8BW9UFAOa89YjB6F718=
X-Gm-Gg: Acq92OExfoBEIqq5rjIlZqT+Nwknml4gqMB/bNaxGtTet4hMN/QfcEdHQ+PcjLkQEly
	VIHDDaSW8RgZH6mtbpCm6ckga32cuCEbNcFhJpZEkVcr69IuLKWcETYy/HeCluupG0W/MEfh30c
	wF3eHoOQYyQ+vcFjA5ae6nB2ZfTV8B2HUnaLvz/DgE8jjP2o9I9H+A/Ocan9P9JzI4kkJvZamJl
	NI90HBHneC4aqQ/qva/02rYpwnQcYUMEBcy6zphm1Ohs6ABxLCdlQJcH20dJEM21lcb3fboURd9
	/HGbEKF1v376428A6Zc=
X-Received: by 2002:a05:6830:3809:b0:7de:44a5:51d1 with SMTP id
 46e09a7af769-7e4ea0818c0mr10204710a34.7.1779131052955; Mon, 18 May 2026
 12:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260428025614.1094085-1-senozhatsky@chromium.org>
In-Reply-To: <20260428025614.1094085-1-senozhatsky@chromium.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:04:01 -0500
X-Gm-Features: AVHnY4I7yygR6iIAN0n3cRgheBUNKVPddXLQRGYhBBdR5Z8-_fNNgL2cX9WJYo4
Message-ID: <CABb+yY1zjOdV9XpSfD82WjbAY3_9tadQm+Cf2KaOsYercB6CEA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-adsp: fix UAF during device teardown
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, YC Hung <yc.hung@mediatek.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_120414_225452_0923506F 
X-CRM114-Status: GOOD (  25.32  )
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

On Mon, Apr 27, 2026 at 9:56=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> When the SOF audio driver fails to initialize (e.g. firmware boot
> timeout), its devres unwind frees the snd_sof_dev object that the
> mailbox client (mtk-adsp-ipc) reaches via chan->cl->rx_callback.
> The mtk-adsp-mailbox shutdown clears the mailbox command registers
> but leaves the IRQ line unmasked, so a late interrupt can still
> queue a threaded handler after mbox_free_channel() had cleared
> chan->cl, and mbox_chan_received_data() would then trigger UAF:
>
>   BUG: KASAN: slab-use-after-free in sof_ipc3_validate_fw_version
>    sof_ipc3_validate_fw_version
>    sof_ipc3_do_rx_work
>    sof_ipc3_rx_msg
>    mt8196_dsp_handle_request
>    mtk_adsp_ipc_recv
>    mbox_chan_received_data
>    mtk_adsp_mbox_isr
>    irq_thread_fn
>   Freed by task ...:
>    kfree
>    devres_release_all
>    really_probe
>    ... (sof-audio-of-mt8196 probe failure)
>
> The crash was observed roughly three seconds after the failed probe.
>
> disable_irq() in shutdown and enable_irq() in startup. disable_irq()
> also waits for any in-flight interrupts, so by the time
> mbox_free_channel() proceeds to clear chan->cl no rx_callback can run.
>
> In addition, request the IRQ with IRQF_NO_AUTOEN so it stays masked
> between probe and the first client bind =E2=80=94 otherwise an early inte=
rrupt
> can crash on chan->cl =3D=3D NULL in mbox_chan_received_data().
>
> Fixes: af2dfa96c52d ("mailbox: mediatek: add support for adsp mailbox con=
troller")
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/mailbox/mtk-adsp-mailbox.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-ads=
p-mailbox.c
> index 91487aa4d7da..8bcecddee0eb 100644
> --- a/drivers/mailbox/mtk-adsp-mailbox.c
> +++ b/drivers/mailbox/mtk-adsp-mailbox.c
> @@ -19,6 +19,7 @@ struct mtk_adsp_mbox_priv {
>         struct mbox_controller mbox;
>         void __iomem *va_mboxreg;
>         const struct mtk_adsp_mbox_cfg *cfg;
> +       int irq;
>  };
>
>  struct mtk_adsp_mbox_cfg {
> @@ -67,6 +68,8 @@ static int mtk_adsp_mbox_startup(struct mbox_chan *chan=
)
>         writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_in);
>         writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_out);
>
> +       enable_irq(priv->irq);
> +
>         return 0;
>  }
>
> @@ -74,6 +77,8 @@ static void mtk_adsp_mbox_shutdown(struct mbox_chan *ch=
an)
>  {
>         struct mtk_adsp_mbox_priv *priv =3D get_mtk_adsp_mbox_priv(chan->=
mbox);
>
> +       disable_irq(priv->irq);
> +
>         /* Clear ADSP mbox command */
>         writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_in);
>         writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_out);
> @@ -139,8 +144,10 @@ static int mtk_adsp_mbox_probe(struct platform_devic=
e *pdev)
>         if (irq < 0)
>                 return irq;
>
> +       priv->irq =3D irq;
>         ret =3D devm_request_threaded_irq(dev, irq, mtk_adsp_mbox_irq,
> -                                       mtk_adsp_mbox_isr, IRQF_TRIGGER_N=
ONE,
> +                                       mtk_adsp_mbox_isr,
> +                                       IRQF_TRIGGER_NONE | IRQF_NO_AUTOE=
N,
>                                         dev_name(dev), mbox->chans);
>         if (ret < 0)
>                 return ret;
> --
> 2.54.0.545.g6539524ca2-goog
>
Applied to mailbox/for-next
Thanks
Jassi

