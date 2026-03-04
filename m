Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B43EF8FF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhmfQeovht1rSuRZNy6gZedQyCvKT4r+/qT4qhUwods=; b=PqWAn3OdbJjrEjZRTnG5+XH9YQ
	bBZYGx0MfA7g+NgnvT/RdaoiAnHD5hf+LFk1C0Er7py8lKaUOTth0NtGb5qrrgXtFrVug90FFrw2X
	vDX8AhRXrUKnKxmJKVym4qK5TJuooGTa86iGjjxCR/pvx8l4NJVwgDTeKuGFxylsGgD6fCa+HX4Aq
	E6Y/o0oWSw2qWxPIoqrKYEAvdxKhvACxjkMWRffUne+jztYOZ9S1P5x9t/hlzPt/z8V1Jsuy+A3O9
	aUj9/YTrdyA60M4Iouzgo8Iryc1soCyRzNP8g0+HToIxaLhs8gEHWAaQqd7APMyXDUMerddUuAgWj
	ysh/mnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo8s-0000000HYcB-2txV;
	Wed, 04 Mar 2026 15:28:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo8r-0000000HYbM-3T9q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCA9261118
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 15:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F48C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772638084;
	bh=4Uhi0QlTwzgQc5rwFHf8CwgRiHlRT+OzQOSYUnatPQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YLh3PbYgXGp2v3C6KnPZu44bNeXrA+51KuQHTzYyw27y6BqAZ0LJyuMZgR/nRtBT7
	 Y4D+tHIysm63trLL2LxN2D8GYwx1NiAhpsRoz+gI0a7Ely3TJReyJxJVrCgxUtIKg+
	 avgF2+mbM2lcegc8OIj1cIQVKArFB0cF7ba5n6wMnPFc8PFVrR3xkzPaN6zrMZ3s4P
	 ZsHxBOBni1s84woCGzvDqENShD61CQci6rWXSpjk2BhlxvkE+4R0up21FWZeUs5Ivp
	 f6WkWpxC33pZjxBDoHYhxTcDHo+Ir+YZvqF3QNOVCw9rB3HJRvr6ZU02UWVK1GF1xN
	 Aj15557fVZdtA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a23cf08e0so29500191fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 07:28:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMbpQdlTAdMtDIs9fPiB1ffSNw4754kfmWwms1cj3u3CXv7P/3GHBhrzogLp+YwY6cVcTdpKrmks2XZCAWDa07@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs5/d5WK7RCSbkGoBIwHwYxltdBApVSDy5xSgOQfBLDQ3yKlLx
	8TPddDytK/IWtPyrdfy+fhe67sOnYVCFHCl3rcHqkhKfStLN3TKk2SfFrU9/wdHCYLOnUX+RqUs
	o2lkpzbDBovSsvD6vPr0kf1nI5bmj1ztkhShHrOTjKw==
X-Received: by 2002:a2e:be8b:0:b0:38a:314f:b80e with SMTP id
 38308e7fff4ca-38a314fb8e2mr8868381fa.37.1772638083128; Wed, 04 Mar 2026
 07:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-12-4bf1f5db4802@oss.qualcomm.com> <aahHeR9j7q4_ynYK@vaman>
In-Reply-To: <aahHeR9j7q4_ynYK@vaman>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 4 Mar 2026 16:27:50 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc48+NyMPkFRa8GPv-odCe=r9WXJWUZYkTsaY53Ev_stQ@mail.gmail.com>
X-Gm-Features: AaiRm53PjeLrZbaX46W-h8Hoc8doSIzcwlm0W7I8e3WNmtZGuh6x2grvktVUNBA
Message-ID: <CAMRc=Mc48+NyMPkFRa8GPv-odCe=r9WXJWUZYkTsaY53Ev_stQ@mail.gmail.com>
Subject: Re: [PATCH RFC v11 12/12] dmaengine: qcom: bam_dma: add support for
 BAM locking
To: Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
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

On Wed, Mar 4, 2026 at 3:53=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 02-03-26, 16:57, Bartosz Golaszewski wrote:
> > Add support for BAM pipe locking. To that end: when starting the DMA on
> > an RX channel - wrap the already issued descriptors with additional
> > command descriptors performing dummy writes to the base register
> > supplied by the client via dmaengine_slave_config() (if any) alongside
> > the lock/unlock HW flags.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>

[snip]

> > +static struct bam_async_desc *
> > +bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
> > +                struct bam_cmd_element *ce, unsigned int flag)
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
> > +     bam_prep_ce_le32(ce, bchan->slave.dst_addr, BAM_WRITE_COMMAND, 0)=
;
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
>
> I am not sure I understand this.
>
> At start you add a descriptor in the queue, ideally which should be
> queued after the existing descriptors are completed!
>
> Also I thought you want to append Pipe cmd to descriptors, why not do
> this while preparing the descriptors and add the pipe cmd and start and
> end of the sequence when you prepare... This was you dont need to create
> a cookie like this
>

Client (in this case - crypto engine) can call
dmaengine_prep_slave_sg() multiple times adding several logical
descriptors which themselves can have several hardware descriptors. We
want to lock the channel before issuing the first queued descriptor
(for crypto: typically data descriptor) and unlock it once the final
descriptor is processed (typically command descriptor). To that end:
we insert the dummy command descriptor with the lock flag at the head
of the queue and the one with the unlock flag at the tail - "wrapping"
the existing queue with lock/unlock operations.

Bart

