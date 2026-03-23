Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BE3F46111
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AThaNra7PYPJkWS/PqQQWitYZvyRX/JWDoYPFuGNRGo=; b=PfFGfeQYrnJhJYLfWPqkt9EhnX
	ISaQfgeBmgWjmEBq0ULoAnkmy24BRTxuacppgwZ4cN3pyJyHAtSZmXPR7deV1N54V+334anRZASt8
	T9yunZfirp/qw/FMpLSCIm9YuplPN3FQLoEXRYj9I62xcAWdJijHTpd79z1b34lecV+Z5b9O59zUe
	CREZM1E0YepC0Jcv8FjT9O/j8l1R6OaFe0omkhk119gCW+5PaDjb9P4i6UIRROA49AiY57xfR0kdU
	ZXrq7Uf/GZZCfoXwUSGM1cmlQPPcY5eS4UOet5nTkoYe7uou98zAnSxoDU13Dhqvca3guQAciCX9q
	ez/afD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fT1-0000000Gq9t-0fQD;
	Mon, 23 Mar 2026 13:37:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fT0-0000000Gq9l-07St
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9583600AC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C768C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273032;
	bh=bv/SaUq1HdOMFnRKapZs5n44wqZCvMp+Q5Yg1ZUqQT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m7zrVHz8jG70gOBJcuvGd9dQDhChoJnZeciGZMEwB53wUhOugKsxbQdtTrzaMLE3K
	 woO/Y0CCFVTtdfxh7PBN0MdrIo/XxqM+d1R6o95whzgIxItgVy1RiPKVlCgpnSYUJn
	 3rC/v/c6EyhgWN07TN5XFfJM0fHtI7fIJ6Ax7QK1CyvhBX6dJJqIycyep4Lr0vs/3K
	 5vf/eoZ90MF5eg1u1jFqhozl0yY8btTvkEWzPUtTccVnHiwkQN12MKkhvfz1G0OJkN
	 LEn9AaxmO+cngxDe3AgvKNSpPpZyP6KFlH3OLBIfRGoQYTmaZiRBHIvCCB3vbuQo1K
	 xrIdkAq1a9mqg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a278b4c1a5so97141e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:37:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS5BC4VZ5V0Gt+bD1ACIRaRfziIo8BfW03yySJyZ5VxvuZhqguqDYov59s49LCW+Vh6ahECKiao66XJfmlTUh/@lists.infradead.org
X-Gm-Message-State: AOJu0YwVwisr54gnNjRdBEcQVAVu332+UopFJkuI2UAZn0m6TIw894Y3
	T7PsMuuQe+O9oimVtn+xRBMFs5SOLx/5hzpB/JY6WWpZ1fTQE2SuNeq4Y1FKPL7w3nHw2AkamCs
	Q4qZ7zpz5SxTMfZ0rkiD5OoN4bdEtvgY9nattSgi+wA==
X-Received: by 2002:a05:6512:10d3:b0:5a1:7458:c17e with SMTP id
 2adb3069b0e04-5a285b55dd3mr3848196e87.37.1774273031248; Mon, 23 Mar 2026
 06:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
 <20260317-qcom-qce-cmd-descr-v13-5-0968eb4f8c40@oss.qualcomm.com> <hohx2judes5c6na4svpah254hqbaf4kbeyu7prwkprfv5dy7hj@26nxwlvb76yp>
In-Reply-To: <hohx2judes5c6na4svpah254hqbaf4kbeyu7prwkprfv5dy7hj@26nxwlvb76yp>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 14:36:59 +0100
X-Gmail-Original-Message-ID: <CAMRc=McostnmVjE=uV=2KA7-dqLvQ2BAJYTXzANacFpPGgS+Sw@mail.gmail.com>
X-Gm-Features: AaiRm52smHlzaZX3o3c7rJCXBkH0quFZvqCL-0liNookxclyfizWuRA5g5cCXoU
Message-ID: <CAMRc=McostnmVjE=uV=2KA7-dqLvQ2BAJYTXzANacFpPGgS+Sw@mail.gmail.com>
Subject: Re: [PATCH v13 05/12] dmaengine: qcom: bam_dma: add support for BAM locking
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Mar 23, 2026 at 10:35=E2=80=AFAM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
>
> On Tue, Mar 17, 2026 at 03:02:12PM +0100, Bartosz Golaszewski wrote:
> > Add support for BAM pipe locking. To that end: when starting DMA on an =
RX
> > channel - prepend the existing queue of issued descriptors with an
> > additional "dummy" command descriptor with the LOCK bit set. Once the
> > transaction is done (no more issued descriptors), issue one more dummy
> > descriptor with the UNLOCK bit.
>
> I've left some comments in v12, but looks like you've missed them.

Sorry for that, as I explained in private, this email did not end up
in my inbox and I didn't see it on lore.

> >
> > +static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, v=
oid *data, size_t len)
> > +{
> > +     struct bam_chan *bchan =3D to_bam_chan(desc->chan);
> > +     const struct bam_device_data *bdata =3D bchan->bdev->dev_data;
> > +     struct bam_desc_metadata *metadata =3D data;
> > +
> > +     if (!data)
> > +             return -EINVAL;
> > +
> > +     if (!bdata->pipe_lock_supported)
> > +             return -EOPNOTSUPP;
>
> As mentioned in v12, you should return 0 to avoid erroring out the client=
s if
> pipe lock is not supported.
>

If the client attaches the scratchpad register then it probably does
want to use locking, right? On the other hand, I assume you're
thinking about a situation where the client wants locking but BAM does
not support it. It's unlikely but ok, I'll change it.

> >
> > +static struct bam_async_desc *
> > +bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
> > +                struct bam_cmd_element *ce, unsigned long flag)
> > +{
> > +     struct dma_chan *chan =3D &bchan->vc.chan;
> > +     struct bam_async_desc *async_desc;
> > +     struct bam_desc_hw *desc;
> > +     struct virt_dma_desc *vd;
> > +     struct virt_dma_chan *vc;
> > +     unsigned int mapped;
> > +     dma_cookie_t cookie;
> > +     int ret;
> > +
> > +     sg_init_table(sg, 1);
> > +
> > +     async_desc =3D kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
> > +     if (!async_desc) {
> > +             dev_err(bchan->bdev->dev, "failed to allocate the BAM loc=
k descriptor\n");
> > +             return NULL;
> > +     }
> > +
> > +     async_desc->num_desc =3D 1;
> > +     async_desc->curr_desc =3D async_desc->desc;
> > +     async_desc->dir =3D DMA_MEM_TO_DEV;
> > +
> > +     desc =3D async_desc->desc;
> > +
> > +     bam_prep_ce_le32(ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0=
);
> > +     sg_set_buf(sg, ce, sizeof(*ce));
> > +
> > +     mapped =3D dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DM=
A_PREP_CMD);
> > +     if (!mapped) {
> > +             kfree(async_desc);
> > +             return NULL;
> > +     }
> > +
> > +     desc->flags |=3D cpu_to_le16(DESC_FLAG_CMD | flag);
> > +     desc->addr =3D sg_dma_address(sg);
> > +     desc->size =3D sizeof(struct bam_cmd_element);
> > +
> > +     vc =3D &bchan->vc;
> > +     vd =3D &async_desc->vd;
> > +
> > +     dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
> > +     vd->tx.flags =3D DMA_PREP_CMD;
> > +     vd->tx.desc_free =3D vchan_tx_desc_free;
> > +     vd->tx_result.result =3D DMA_TRANS_NOERROR;
> > +     vd->tx_result.residue =3D 0;
> > +
> > +     cookie =3D dma_cookie_assign(&vd->tx);
> > +     ret =3D dma_submit_error(cookie);
> > +     if (ret)
> > +             return NULL;
>
> You are leaking async_desc here.
>

Yeah, not only that but also should unmap the sg here too. Thanks.

> > +
> > +     return async_desc;
> > +}
> > +
> > +static int bam_do_setup_pipe_lock(struct bam_chan *bchan, bool lock)
> > +{
> > +     struct bam_device *bdev =3D bchan->bdev;
> > +     const struct bam_device_data *bdata =3D bdev->dev_data;
> > +     struct bam_async_desc *lock_desc;
> > +     struct bam_cmd_element *ce;
> > +     struct scatterlist *sgl;
> > +     unsigned long flag;
> > +
> > +     lockdep_assert_held(&bchan->vc.lock);
> > +
> > +     if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
> > +         bchan->slave.direction !=3D DMA_MEM_TO_DEV)
> > +             return 0;
> > +
> > +     if (lock) {
> > +             sgl =3D &bchan->lock_sg;
> > +             ce =3D &bchan->lock_ce;
> > +             flag =3D DESC_FLAG_LOCK;
> > +     } else {
> > +             sgl =3D &bchan->unlock_sg;
> > +             ce =3D &bchan->unlock_ce;
> > +             flag =3D DESC_FLAG_UNLOCK;
> > +     }
> > +
> > +     lock_desc =3D bam_make_lock_desc(bchan, sgl, ce, flag);
> > +     if (!lock_desc)
> > +             return -ENOMEM;
> > +
> > +     if (lock)
> > +             list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
> > +     else
> > +             list_add_tail(&lock_desc->vd.node, &bchan->vc.desc_issued=
);
> > +
> > +     bchan->locked =3D lock;
>
> What is this flag for?
>

Just a leftover. I'll drop it, thanks.

> >
> > +struct bam_desc_metadata {
> > +     phys_addr_t scratchpad_addr;
>
> I think it'd be worth adding a comment for this.
>

Will do.

Bart

