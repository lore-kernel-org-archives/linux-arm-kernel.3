Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08621F41818
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7MX7FiVwdn1luyV1cLu0sOM5Hf6zgqMaQrAs2fP9yE=; b=HHp36m82a8mg6dIjG++7jdNkTL
	tY4ItsVrEQsv4M3B935m+B6qwLOf4kF8mkZlinnq0t/kRaF1BKN99bgqsnK8aAPX9IWUjyW5v9WOW
	u8aaFY8Ff+cgIlbqSV1TkorgTah5rr08jN9SmbIxSkNEoqq8PdOpftE0hzXmidbhNT2cQFBzPAHbS
	NHzE2tCtoPuwHUdD/z8TfHBwln55vnIzw90B+NCKb6g/5N7pHWUH7ueVPMvN/Dp/4zvvHms5uxPKd
	dSr9E8PsIw9m2qMSBVE0QuAQV7aUBJu7mCUM9eGpvCqSz6VVIinV8mMcRkvQoEBllLgETA7ZYu7qB
	TneHdFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vze3S-00000007n6T-0Q76;
	Mon, 09 Mar 2026 17:06:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vze3P-00000007n4Q-0gyG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 17:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C35FA44138
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 17:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A225DC19423
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075962;
	bh=Nl4HOblw010V5+pE2S/P/QX3P3lziK39Je/lLiEZbvE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=geuaaSQvhOJNX357Z9w1wt3tQulaQ2XrNbaryqjHB41cQrIEKqI/vZq5TaPrTTZU+
	 M9vyJ9dq4ijyvChbTm7rBXIN+xqp7/7Zg+LweUoaGQQCyIzdQIbX7vO9RmCBO6SNh0
	 HCkM2f6NvmQE+cjtgjISXrFdntTFS+KmP8R7IFEr9MshUvtq11+rZDb9ytOF4jZPhy
	 KjfxZqgFqENm7BRNZg+fcqG3/PRG0xYL6KOoxcXbrxqFB9eNIaHOcjgrNo6H5NQrFp
	 r+IQpXqjhjyxflvNd5G53edsKI7lnL8xnAnY+13IpRtz43P5qHajtmAGju844wD7nb
	 WMU6swPIGVMOA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a38ccc217so32464671fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 10:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtRyIIgA7Y+17rbkODCPEunZ4iEZhirLZeXkWbH64C+Xyp4SLTA5MYtd3qNzm3yl0Vm93w5gcqkCljqGogYJJo@lists.infradead.org
X-Gm-Message-State: AOJu0YxF+Fc/ulZ698yfpqb7CUmTam4nWsN54wjpSxqjcL3YSBAy0coN
	fhuIx+aecJeYYLhowCq4f0I2c0OvfDTuR6vTVqdqPnZLgkdVopxC2vF4+hV0nnqN79JJv+kador
	nE19b4bkUxkT95SLHH8NeVCiHonL0JpQaR6vKMoFE0A==
X-Received: by 2002:a05:651c:2212:b0:38a:42ec:9f84 with SMTP id
 38308e7fff4ca-38a42ec9ffcmr33518861fa.4.1773075960460; Mon, 09 Mar 2026
 10:06:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 10:05:59 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 10:05:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aayLkmDRLMuTzXZv@vaman>
MIME-Version: 1.0
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-12-4bf1f5db4802@oss.qualcomm.com>
 <aahHeR9j7q4_ynYK@vaman> <CAMRc=Mc48+NyMPkFRa8GPv-odCe=r9WXJWUZYkTsaY53Ev_stQ@mail.gmail.com>
 <aayLkmDRLMuTzXZv@vaman>
Date: Mon, 9 Mar 2026 10:05:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeJNQq8AF9SrJYY=CNOF62UXpaX7Tzuk5VSfaXoWSCGRg@mail.gmail.com>
X-Gm-Features: AaiRm52AwUikzvApltwtSp3ZuI8KyckqNAj_xcMnQHdUmblkYlZhjv-tlMSJcGs
Message-ID: <CAMRc=MeJNQq8AF9SrJYY=CNOF62UXpaX7Tzuk5VSfaXoWSCGRg@mail.gmail.com>
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_100603_239830_5E64E4A8 
X-CRM114-Status: GOOD (  26.80  )
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

On Sat, 7 Mar 2026 21:33:22 +0100, Vinod Koul <vkoul@kernel.org> said:
> On 04-03-26, 16:27, Bartosz Golaszewski wrote:
>> On Wed, Mar 4, 2026 at 3:53=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wro=
te:
>> >
>> > On 02-03-26, 16:57, Bartosz Golaszewski wrote:
>> > > Add support for BAM pipe locking. To that end: when starting the DMA=
 on
>> > > an RX channel - wrap the already issued descriptors with additional
>> > > command descriptors performing dummy writes to the base register
>> > > supplied by the client via dmaengine_slave_config() (if any) alongsi=
de
>> > > the lock/unlock HW flags.
>> > >
>> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
>>
>> [snip]
>>
>> > > +static struct bam_async_desc *
>> > > +bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
>> > > +                struct bam_cmd_element *ce, unsigned int flag)
>> > > +{
>> > > +     struct dma_chan *chan =3D &bchan->vc.chan;
>> > > +     struct bam_async_desc *async_desc;
>> > > +     struct bam_desc_hw *desc;
>> > > +     struct virt_dma_desc *vd;
>> > > +     struct virt_dma_chan *vc;
>> > > +     unsigned int mapped;
>> > > +     dma_cookie_t cookie;
>> > > +     int ret;
>> > > +
>> > > +     async_desc =3D kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
>> > > +     if (!async_desc) {
>> > > +             dev_err(bchan->bdev->dev, "failed to allocate the BAM =
lock descriptor\n");
>> > > +             return NULL;
>> > > +     }
>> > > +
>> > > +     async_desc->num_desc =3D 1;
>> > > +     async_desc->curr_desc =3D async_desc->desc;
>> > > +     async_desc->dir =3D DMA_MEM_TO_DEV;
>> > > +
>> > > +     desc =3D async_desc->desc;
>> > > +
>> > > +     bam_prep_ce_le32(ce, bchan->slave.dst_addr, BAM_WRITE_COMMAND,=
 0);
>> > > +     sg_set_buf(sg, ce, sizeof(*ce));
>> > > +
>> > > +     mapped =3D dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE,=
 DMA_PREP_CMD);
>> > > +     if (!mapped) {
>> > > +             kfree(async_desc);
>> > > +             return NULL;
>> > > +     }
>> > > +
>> > > +     desc->flags |=3D cpu_to_le16(DESC_FLAG_CMD | flag);
>> > > +     desc->addr =3D sg_dma_address(sg);
>> > > +     desc->size =3D sizeof(struct bam_cmd_element);
>> > > +
>> > > +     vc =3D &bchan->vc;
>> > > +     vd =3D &async_desc->vd;
>> > > +
>> > > +     dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
>> > > +     vd->tx.flags =3D DMA_PREP_CMD;
>> > > +     vd->tx.desc_free =3D vchan_tx_desc_free;
>> > > +     vd->tx_result.result =3D DMA_TRANS_NOERROR;
>> > > +     vd->tx_result.residue =3D 0;
>> > > +
>> > > +     cookie =3D dma_cookie_assign(&vd->tx);
>> > > +     ret =3D dma_submit_error(cookie);
>> >
>> > I am not sure I understand this.
>> >
>> > At start you add a descriptor in the queue, ideally which should be
>> > queued after the existing descriptors are completed!
>> >
>> > Also I thought you want to append Pipe cmd to descriptors, why not do
>> > this while preparing the descriptors and add the pipe cmd and start an=
d
>> > end of the sequence when you prepare... This was you dont need to crea=
te
>> > a cookie like this
>> >
>>
>> Client (in this case - crypto engine) can call
>> dmaengine_prep_slave_sg() multiple times adding several logical
>> descriptors which themselves can have several hardware descriptors. We
>> want to lock the channel before issuing the first queued descriptor
>> (for crypto: typically data descriptor) and unlock it once the final
>> descriptor is processed (typically command descriptor). To that end:
>> we insert the dummy command descriptor with the lock flag at the head
>> of the queue and the one with the unlock flag at the tail - "wrapping"
>> the existing queue with lock/unlock operations.
>
> Why not do this per prep call submitted to the engine. It would be
> simpler to just add lock and unlock to the start and end of transaction.
>

Becuase then we'd have:

  [LOCK] [DATA] [UNLOCK] [LOCK] [CMD] [UNLOCK]

while what we want is:

  [LOCK] [DATA] [CMD] [UNLOCK]

Bartosz

