Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAE7C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=; b=WABfyR7+m+JaU5q1fIkNJKpXNA
	T5VrjE30yN7gyf+uiHhFSaiaeETcUCEE2VUbCDEpwVFPFhJ5XuN80naA39/QSpr5QTJ3vTPGA2JyW
	mPL+1oNJN6Z2gUQJvcpWl+VTlrDj3GguXAqA9xR3X+ECIMdA8HpHSgKSAXyn2XBweLdH44qvYx+SH
	pnilpUZqMTHAGCbOAS5zLgBmf+gTaM54rTLxyf20Ch9hDlIQmX6vS41CKSZ4Z4ot4ZSkg2pCyeCsk
	C+5HymXKDm7T5XV3JZANDgMZpHyZm6Mp+8kwRJ/mdBVcBXt5LzcYcyzu/8yy1hstF8FpfBTq5MBw5
	CUGStEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpf-00000009r46-2794;
	Wed, 25 Jun 2025 20:34:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTCs-00000009LBJ-2Sv2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 16:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750869760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=;
	b=ZfG8lJgOQgYlKA4FrFH3bMr99UHN0BXXsgotgBMDlJfUSP2vJ6kho/DYJY/DcvP4IQhoQO
	aFrK8f0ScKwgBANzRhzJYhU5zdnGjEvMTOBGue//l+/nl/jZT9ppKNvBtoReDFOXh2oE52
	BAwynusj4NTa6KVAW5w37Ic1GnMt5+o=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-gtOyXCs_NLCpksk_1BAotQ-1; Wed, 25 Jun 2025 12:42:39 -0400
X-MC-Unique: gtOyXCs_NLCpksk_1BAotQ-1
X-Mimecast-MFC-AGG-ID: gtOyXCs_NLCpksk_1BAotQ_1750869759
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70e2b627b47so1141837b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 09:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869759; x=1751474559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=;
        b=Vu+ebtnzEkx1ntXEmFejZwasSrtJel2CIDpe7oNqHjJgwXIYq3GPV9J24ajRYqc5F2
         L3eMUWkvH64bAWLHoPsbU1bCofIxTyt08wqkjegmRisYvvh5DTVUb7Ka8wPQ7N8tfkOU
         YpWRnW+z6cq23UEY8jeyy50YD1bVj6/VVRbDAweLf4LoVUF2Vjn6kSDjfRQiBXWUfVxf
         jCd1XKARnueLkryEVv2TrGobvL+UMLhXQaoW2yNI9pVxm14+c5owUmoO7kOE5o8/gwhN
         eL/tQCeuh/4VlFWTENPDmpbHeaQeMPK6oNhqvQRohOuiltX6rfT01nYIlyvVoaiob0TB
         4KvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX33ZTgTApQHDYclMGu9P5ZsRBIZkszD3zyUaeI4QjTvelmIEKuhKJqETgq35wQUEtoIAAj1FGjzfnTqjfZubFx@lists.infradead.org
X-Gm-Message-State: AOJu0YzODpvsOUqJP4QI0TutV+jDJAMM17+x3XUmCL1wSBBNle+vXxGN
	h2wyQcE8XqOZ6xkAWzaYivMwlx2xxvmjQCev1ceX7BmHB3xn0yrxdX0rkAbx9xMUYg0itfavbZF
	2bg2KsHySG5x2/yE+kbmpFoChts+FB9u/Q47Od+/0aZz+0F46XAUhdvjr+GmUDuyozNpAgNsRG+
	tbwy08KvKlp3cUEe4QJj6jvbMaWmbCWajj4KuHVZ2JCv2O7Rjs1vA=
X-Gm-Gg: ASbGnct3ZFdKd+ZXdaQvhJsBAbe9/0VPCOadDalr1XovMhFMIwWl6JwcH/5RqzjK4wb
	1k0YMrFYfMd9LgoepW4qZmTTopkxhHFRqWw7jWax9QDx4tLu2sJ9xAioZQjsBygv4OiI3IAv7Rw
	VGf/zyQQ==
X-Received: by 2002:a05:690c:6b0c:b0:70f:8913:ed66 with SMTP id 00721157ae682-715087c70bdmr10121967b3.38.1750869759008;
        Wed, 25 Jun 2025 09:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFieNmTUGgh1wCgADlrPL5JDmEvLuKpDHJRUgQ2djJiYYhZb7UVT6EWDckb5lNTgx4pKSPLhXjmzcMJTZ3XZMc=
X-Received: by 2002:a05:690c:6b0c:b0:70f:8913:ed66 with SMTP id
 00721157ae682-715087c70bdmr10121207b3.38.1750869758423; Wed, 25 Jun 2025
 09:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250620130810.99069-1-sgarzare@redhat.com> <20250620130810.99069-5-sgarzare@redhat.com>
 <aFvlaY0BNjaGxU1D@kernel.org> <aFwQ129i_HYzG3aY@kernel.org>
In-Reply-To: <aFwQ129i_HYzG3aY@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 25 Jun 2025 18:42:26 +0200
X-Gm-Features: Ac12FXxEB7j1Pqu364HQDxXaTieTzsNMquFeCJO9Pw5PNZpgUTeipi1JP5Ohhks
Message-ID: <CAGxU2F4q_UyBiNqWfQMVAXqsWQbtu5ety9MTpg35eRcE=eVqjg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Naveen N Rao <naveen@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XIKI2Bx4G71_EP1UaaoPm53hNI__Er7itELT2gGe7M8_1750869759
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094242_697954_720B3877 
X-CRM114-Status: GOOD (  34.23  )
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

On Wed, 25 Jun 2025 at 17:08, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 03:02:54PM +0300, Jarkko Sakkinen wrote:
> > On Fri, Jun 20, 2025 at 03:08:10PM +0200, Stefano Garzarella wrote:
> > > From: Stefano Garzarella <sgarzare@redhat.com>
> > >
> > > This driver does not support interrupts, and receiving the response is
> > > synchronous with sending the command.
> > >
> > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > ->send() already fills the provided buffer with a response, and ->recv()
> > > is not implemented.
> > >
> > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > it for each command. We need the buffer to have the header required by
> > > the SVSM protocol and the command contiguous in memory.
> > >
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > > v5:
> > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > v4:
> > > - reworked commit description [Jarkko]
> > > ---
> > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > > index 0847cbf450b4..f5ba0f64850b 100644
> > > --- a/drivers/char/tpm/tpm_svsm.c
> > > +++ b/drivers/char/tpm/tpm_svsm.c
> > > @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
> > >  };
> > >
> > >  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> > > -                    size_t len)
> > > +                    size_t cmd_len)
> > >  {
> > >     struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > >     int ret;
> > >
> > > -   ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > > +   ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
> > >     if (ret)
> > >             return ret;
> > >
> > >     /*
> > >      * The SVSM call uses the same buffer for the command and for the
> > > -    * response, so after this call, the buffer will contain the response
> > > -    * that can be used by .recv() op.
> > > +    * response, so after this call, the buffer will contain the response.
> > > +    *
> > > +    * Note: we have to use an internal buffer because the device in SVSM
> > > +    * expects the svsm_vtpm header + data to be physically contiguous.
> > >      */
> > > -   return snp_svsm_vtpm_send_command(priv->buffer);
> > > -}
> > > -
> > > -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > > -{
> > > -   struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > > +   ret = snp_svsm_vtpm_send_command(priv->buffer);
> > > +   if (ret)
> > > +           return ret;
> > >
> > > -   /*
> > > -    * The internal buffer contains the response after we send the command
> > > -    * to SVSM.
> > > -    */
> > > -   return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > > +   return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
> > >  }
> > >
> > >  static struct tpm_class_ops tpm_chip_ops = {
> > >     .flags = TPM_OPS_AUTO_STARTUP,
> > > -   .recv = tpm_svsm_recv,
> > >     .send = tpm_svsm_send,
> > >  };
> > >
> > > @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
> > >
> > >     dev_set_drvdata(&chip->dev, priv);
> > >
> > > +   chip->flags |= TPM_CHIP_FLAG_SYNC;
> > >     err = tpm2_probe(chip);
> > >     if (err)
> > >             return err;
> > > --
> > > 2.49.0
> > >
> >
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>
> Applied.

Great, thanks!
Stefano


