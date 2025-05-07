Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C2BC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfz6uyoMRfhTnypRiFCmoqot29/UxOPXHyP1KOR63r4=; b=doKenmaUFB3yBp/LO9PtW4w6fF
	kvMWKRJRViJS/UrffN+18e6P/6NVShDQLLETX8wB0sqtOukgCbTsa7Sz65PRIaeh8cS4KxIR8+ugM
	JKSOodTmRQgvqFaufRBxaDj76QOqwWRdc6ONN6pSBLMJ+pV1KqLSwOK/m5X7N+LCzRxw874KrQD/9
	QmSOZQyHwZtWReP+oQFPjQxlDp4ra0j3B+4OB0Gdwl56qLoe4CrAn8GhVtTi4gaySsnGQfSooKanM
	551o83BPMOYCBL9sXMk3nOGOJTCZyCSY0FjlCQrQC6qJ+80p2qRgyULqR0Of+sH2+Gd3kKBkSGz7a
	627Km/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCj9J-0000000GQZI-0CIN;
	Wed, 07 May 2025 18:05:41 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCitX-0000000GOWY-4Add
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:49:25 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6f53d1cb94eso1827236d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746640163; x=1747244963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfz6uyoMRfhTnypRiFCmoqot29/UxOPXHyP1KOR63r4=;
        b=CxdSwzaLDCtiICKHxs3Tmo7idIZNMTotZxPosyjvGevkzTVE50EVDyhSm1xZe3pblq
         vzYI2xcuR6Z6TZcwTPSssuuwPYEjRQXsDI+/wsMnbnughc3T46L4Pkp4l/XGTPBNWQIA
         x+JPA1birPHsE3Se4kUDtyHQm/xqu2t8nNRrw6EGqWdU7LbZ0N5bG9iHhdJLkCC5HXZp
         sUKlHxkrn9FVV9pfZ5eM/n3JXnaeiAgTSWv9SSKFzxhhh5FJwcV7wDTnhYdwX0jOEh+Z
         IGh6wTIHhvSLwVUyy599kpe25D/VRm8u5zQwGgBpG0f/Yj936igCjCHjnq7J073jH1L3
         4OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746640163; x=1747244963;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kfz6uyoMRfhTnypRiFCmoqot29/UxOPXHyP1KOR63r4=;
        b=Mqy0p5BIfRTpI8kqegw4DnGGDRBUF5I9Eppskx7nJK77mCjT5SynZyuz5UENPp4w/A
         wtUmVlP9EcpdehGPO7cnErs25xxhsTuYo03CV9Ww5cfCBlhLiv45TDOfLVsEGzQSn/Os
         4pCpu9oNjG+MSEZhkkZLOFl9KQJVo3M4svdWIYZ9RLXu88X74PQ8F8sh0Y0AXhVd2Fhi
         J77QEG9YQDkxEdaCn+w65TZcO6cszQ+RMUuYbXTmlW/oE4qzhnkPP+WtvvTeypeoAusa
         QsJ732BauvpLx/tUV5aZ2w7LwoDaJHMzsncRO/TxdmpZXJchE7GUD+Mweyx5JGB/jebG
         Iv5A==
X-Forwarded-Encrypted: i=1; AJvYcCVAF4uCRWhIlnbfTeyCj6pDqD+qpQGzVOt2IWyYurG+w22WCjxFoelid82yZU1YAK/ac3Px8WBij0rVs/dSkllj@lists.infradead.org
X-Gm-Message-State: AOJu0YzfbzXScSlvqQVZiMSd+eWTCQuOPBlXttYMLGDd53Mg2nCkMF6i
	iszQpjBagPqzeCEZpevbHaOSVCux2Ai+UtIJwByiICFQs4sNQ2mg
X-Gm-Gg: ASbGncvmiwFuLXbDjh6HUoJWuKPMKivdzgurOnEAhYVC+VO2EXlE1kedZ1Wp4x14wVX
	MfZtVg3YD4VbKdLwBqr2rzPlL4EQ3eDkyYsQpYkoYbo9hrdXIGe/aDbHR/9GuYiWGy0sCyqdaN9
	S0TPrahOmH4H+bw2P2/E8+Z0P4F5mC8K+s80F0NlUIEPMVytFbUs5Ku661IutbIQB3b11b/n9P1
	e+4qE10Tu1voB06xsmwLmkBCWUaLQCAMPqWkNd9j2dr2KDrzmVR5QavK+3LtLMpsWOb05OY+Io8
	vWI2lySSTgAA3t9DJ0mZ3Yj7+32g2F2gnWeWNuwFzUGO0aZnj7q8SBwtDqEt5yxhx0F5RpbXkqN
	Dk60TJbG8A6pzNqInKswr
X-Google-Smtp-Source: AGHT+IEdmDz6bgqyCAX+DBi2xQ6M9zcA4fwpG7/l9puBW+mKy97fTNnoENSya6bjigpX9N0Iatt+jg==
X-Received: by 2002:a05:6214:190f:b0:6f5:437a:dd5d with SMTP id 6a1803df08f44-6f5437ae0d2mr44414396d6.0.1746640162842;
        Wed, 07 May 2025 10:49:22 -0700 (PDT)
Received: from localhost (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f54278112dsm16751986d6.91.2025.05.07.10.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:49:22 -0700 (PDT)
Date: Wed, 07 May 2025 13:49:22 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 sgoutham@marvell.com, 
 andrew+netdev@lunn.ch, 
 willemb@google.com, 
 linux-arm-kernel@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Jason Xing <kernelxing@tencent.com>
Message-ID: <681b9d2210879_1f6aad294bc@willemb.c.googlers.com.notmuch>
In-Reply-To: <CAL+tcoC606GBfwo3BY_7vn3jPQJdC=78h9q-110hC3DCYRg7jQ@mail.gmail.com>
References: <20250507030804.70273-1-kerneljasonxing@gmail.com>
 <681b5ebc80a81_1e440629460@willemb.c.googlers.com.notmuch>
 <CAL+tcoC606GBfwo3BY_7vn3jPQJdC=78h9q-110hC3DCYRg7jQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: thunder: make tx software timestamp
 independent
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_104924_033690_5F42B6BA 
X-CRM114-Status: GOOD (  49.43  )
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

Jason Xing wrote:
> Hi Willem,
> =

> On Wed, May 7, 2025 at 9:23=E2=80=AFPM Willem de Bruijn
> <willemdebruijn.kernel@gmail.com> wrote:
> >
> > Jason Xing wrote:
> > > From: Jason Xing <kernelxing@tencent.com>
> > >
> > > skb_tx_timestamp() is used for tx software timestamp enabled by
> > > SOF_TIMESTAMPING_TX_SOFTWARE while SKBTX_HW_TSTAMP is controlled by=

> > > SOF_TIMESTAMPING_TX_HARDWARE. As it clearly shows they are differen=
t
> > > timestamps in two dimensions, this patch makes the software one
> > > standalone.
> > >
> > > Signed-off-by: Jason Xing <kernelxing@tencent.com>
> > > ---
> > >  drivers/net/ethernet/cavium/thunder/nicvf_queues.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c b/d=
rivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > > index 06397cc8bb36..d368f381b6de 100644
> > > --- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > > +++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > > @@ -1389,11 +1389,11 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic,=
 struct snd_queue *sq, int qentry,
> > >               this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
> > >       }
> > >
> > > +     skb_tx_timestamp(skb);
> > > +
> > >       /* Check if timestamp is requested */
> >
> > Nit: check if hw timestamp is requested.
> =

> Thanks for the review. Will change it.
> =

> >
> > > -     if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
> > > -             skb_tx_timestamp(skb);
> > > +     if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
> > >               return;
> > > -     }
> >
> > The SO_TIMESTAMPING behavior around both software and hardware
> > timestamps is a bit odd.
> =

> Just a little bit. The reason why I looked into this driver is because
> I was reviewing this recent patch[1]. Then I found that the thunder
> driver uses the HW flag to test if we can generate a software
> timestamp which is also a little bit odd. Software timestamp function
> is controlled by the SW flag or SWHW flag instead of the pure HW flag.
> =

> [1]: https://lore.kernel.org/all/20250506215508.3611977-1-stfomichev@gm=
ail.com/
> =

> >
> > Unless SOF_TIMESTAMPING_OPT_TX_SWHW is set, by default a driver will
> > only return software if no hardware timestamp is also requested.
> =

> Sure thing. SOF_TIMESTAMPING_OPT_TX_SWHW can be used in this case as
> well as patch [1].
> =

> >
> > Through the following in __skb_tstamp_tx
> >
> >         if (!hwtstamps && !(tsflags & SOF_TIMESTAMPING_OPT_TX_SWHW) &=
&
> >             skb_shinfo(orig_skb)->tx_flags & SKBTX_IN_PROGRESS)
> >                 return;
> >
> > There really is no good reason to have this dependency. But it is
> > historical and all drivers should implement the same behavior.
> =

> As you said, this morning when I was reviewing patch[1], I noticed
> that thunder code is not that consistent with others.
> =

> >
> > This automatically happens if the software timestamp request
> > skb_tx_timestamp is called after the hardware timestamp request
> > is configured, i.e., after SKBTX_IN_PROGRESS is set. That usually
> > happens because the software timestamp is requests as close to kickin=
g
> > the doorbell as possible.
> =

> Right. In most cases, they implemented in such an order:
> =

>                 if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)
>                         skb_shinfo(skb)->tx_flags |=3D
> SKBTX_IN_PROGRESS;
> =

>                 skb_tx_timestamp(skb);
> =

> Should I adjust this patch to have the same behavior in the next
> revision like below[2]?

Best is just to do what other drivers do with the software
timestamp: take it as late as possible in ndo_start_xmit,
meaning just before ringing the doorbell.

For this driver, that is in two places, as said.

> Then we can get the conclusion:1) if only the
> HW or SW flag is set, nothing changes and only corresponding timestamp
> will be generated, 2) if HW and SW are set without the HWSW flag, it
> will check the HW first. In non TSO mode, If the non outstanding skb
> misses the HW timestamp, then the software timestamp will be
> generated, 3) if HW and SW and HWSW are set with the HWSW flag, two
> types of timestamp can be generated. To put it in a simpler way, after
> [2] patch, thunder driver works like other drivers. Or else, without
> [2], the HWSW flag doesn't even work.
> =

> [2]
> diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> index 06397cc8bb36..4be562ead392 100644
> --- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> +++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> @@ -1389,28 +1389,24 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic,
> struct snd_queue *sq, int qentry,
>                 this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
>         }
> =

> -       /* Check if timestamp is requested */
> -       if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
> -               skb_tx_timestamp(skb);
> -               return;
> -       }
> =

> -       /* Tx timestamping not supported along with TSO, so ignore requ=
est */
> -       if (skb_shinfo(skb)->gso_size)
> -               return;
> -
> -       /* HW supports only a single outstanding packet to timestamp */=

> -       if (!atomic_add_unless(&nic->pnicvf->tx_ptp_skbs, 1, 1))
> -               return;
> -
> -       /* Mark the SKB for later reference */
> -       skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> +       /* Check if hw timestamp is requested */
> +       if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&
> +           /* Tx timestamping not supported along with TSO, so ignore
> request */
> +           !skb_shinfo(skb)->gso_size &&
> +           /* HW supports only a single outstanding packet to timestam=
p */
> +           atomic_add_unless(&nic->pnicvf->tx_ptp_skbs, 1, 1)) {
> +               /* Mark the SKB for later reference */
> +               skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> +
> +               /* Finally enable timestamp generation
> +                * Since 'post_cqe' is also set, two CQEs will be poste=
d
> +                * for this packet i.e CQE_TYPE_SEND and CQE_TYPE_SEND_=
PTP.
> +                */
> +               hdr->tstmp =3D 1;
> +       }
> =

> -       /* Finally enable timestamp generation
> -        * Since 'post_cqe' is also set, two CQEs will be posted
> -        * for this packet i.e CQE_TYPE_SEND and CQE_TYPE_SEND_PTP.
> -        */
> -       hdr->tstmp =3D 1;
> +       skb_tx_timestamp(skb);
>  }
> =

>  /* SQ GATHER subdescriptor
> =

> Thanks,
> Jason
> =

> >
> > In this driver, that would be not in nicvf_sq_add_hdr_subdesc, but
> > just before calling nicvf_sq_doorbell. Unfortunately, there are two
> > callers, TSO and non-TSO.
> >
> > >
> > >       /* Tx timestamping not supported along with TSO, so ignore re=
quest */
> > >       if (skb_shinfo(skb)->gso_size)
> > > --
> > > 2.43.5
> > >
> >
> >



