Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71504C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 23:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RImuKL11AWw27VGnXGt5AKSYaF75iEDxt4FG+PZZJZo=; b=X0iH1HrqC1vVXZ2UITpRmpv2jJ
	EcNCdTuFqKHOCq7rxd1+877O7/gZPKos3gJ5iKOFQJsYxq8zBmlZcCWofTARIRzGJA86yAYt6DlL2
	fJPWSGLGRdnIvRLZ/XXG/8G8aSVU5VDdKS2fjAyEOQcpT6zZlmW67dI//f8ifo7sr1cDFPBE1Qwzq
	gWJSBe3FSUhJEbNdcWVaWU2gbnzvl2qVQiJo3Q1TefFXWQpOYUfJPu8QOZkYiyspgXvmyWXbeaHNH
	iNLeMcsgamgoxA1sR7JMDxo/mgmx448uuU0Nq3/dgoe5Hsfe8arku6t20ybg7UQeZRA8nTLnSDX51
	Lvs10J7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCo1Q-0000000GwHn-1Bul;
	Wed, 07 May 2025 23:17:52 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnzO-0000000Gw5K-28qA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 23:15:48 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so2540985ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 16:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746659745; x=1747264545; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RImuKL11AWw27VGnXGt5AKSYaF75iEDxt4FG+PZZJZo=;
        b=HZP4pJ6oarZ4L0HTFwtV8qW4bAwq8qezQT2nx2lQeqb1mSb1oExW7LKtuTqFtUIE0h
         2uytd2Nyc2JnodubWJ4V2IqrVjXUXfzyrX/FwNgNN5hMZ/r7QQgf+/3cFf5zi3VLzK7S
         k0rNyxRTF0TvcFiy+Yq1Ggm1RIrfRi1iebWWG+MiEVxUuvSqoNFDBjVvMzO2089dMjww
         gSPYoXkYnBsymQKySXlVmXRUSsPMn0j7vd4VvDZqCATCYbLbbKg4JlJsZHMs++V3fn1+
         poW7r9VGkdQ/ZQE9JKvQ7RVX723DbuLcpvJAkApxvLpJRopUHEs3KqMxZVPEuchekjsx
         vG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746659745; x=1747264545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RImuKL11AWw27VGnXGt5AKSYaF75iEDxt4FG+PZZJZo=;
        b=H0TB0x3zc80FfoMuBUboZRfPux3QpzxH8jOIgD8oru/1S61sswuxCnteErQCZwo+vA
         eJL7A530LAHjY6ariZsSKOHrnDZFjS452dRtvhd9E2ULzbQ6ozN09TQcCd3h42Wx78iA
         Ul/jeNp6WHK8XHMP3T8vKbw3HcLPcTNLjuJnAtFt5qmyX6aOIoxNdNLZSLiAkWsWGsFy
         l/2/WmNh7WViS18gjCDLmzxm5LkjEwmfqH5A0CqZr3J4vTWE+9oa2lm6c8F8tngt5184
         8zg9w+7TrWabjOQHejmCFbc6GcLNCNlZP6L7K2Nli5oPfh4vmf01Tr/oTGRpZ8ouP4WI
         hJew==
X-Forwarded-Encrypted: i=1; AJvYcCW5Vxu4CONeOhVM1KyJVHH854HVI9XeWzYPhFy20vU+WI+Is/2Cylzl+HyAXo1VhFWvWVqcV/+K4UJvSQHYNvsN@lists.infradead.org
X-Gm-Message-State: AOJu0YwHQ4CV6KmR4FoSDj+2iTm1hXN1Yjc2JdOiBk4LXWu07vgKQBbD
	Nfq1exDs8AGcYSpClDd50KXFxSIqqhPS3sQ8KmIaWB04s4AhOQ5V4f2tds3lLBtleTOtrjuDfvi
	ckzUTuAUgKC9Wfy3HiuS0mDr0fzw=
X-Gm-Gg: ASbGncuqNNYrf6QRebSTQm9r4Fr7lcXcHVmWaZilD22bDkhEWOGwpLtWdr8oI7/R5wv
	ABC6gclLtoGufnXWnDK3OXiFegQ7NcQNGxL1WD2Wwwy5xvjh+hCIeOsgi5VvArsClS3fPzwMtX/
	ars424a5phMeE/gm4xLlcQ
X-Google-Smtp-Source: AGHT+IGtSYttpG1zZ5PGkPf2Vbh+MmEc34Y+/FIKQTM3ZkuCIGnzwVXYb/erKuYvJnGgpIXx6irfFTWYc3vMqMU6DkU=
X-Received: by 2002:a05:6e02:1445:b0:3d9:6379:86e9 with SMTP id
 e9e14a558f8ab-3da738ed6d2mr53358505ab.5.1746659745190; Wed, 07 May 2025
 16:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250507030804.70273-1-kerneljasonxing@gmail.com>
 <681b5ebc80a81_1e440629460@willemb.c.googlers.com.notmuch>
 <CAL+tcoC606GBfwo3BY_7vn3jPQJdC=78h9q-110hC3DCYRg7jQ@mail.gmail.com> <681b9d2210879_1f6aad294bc@willemb.c.googlers.com.notmuch>
In-Reply-To: <681b9d2210879_1f6aad294bc@willemb.c.googlers.com.notmuch>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 8 May 2025 07:14:59 +0800
X-Gm-Features: ATxdqUHKm-VYQ08mqLoWYWANXneFqy01jhG7ZahId-T1A1Q1JXLo7PVvCxSKSr4
Message-ID: <CAL+tcoC13tUNTjmfuueExPtNX6TOvH_q6NJw_7KX4rEDDSwyvg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: thunder: make tx software timestamp independent
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, sgoutham@marvell.com, 
	andrew+netdev@lunn.ch, willemb@google.com, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_161546_553778_2D9A8714 
X-CRM114-Status: GOOD (  53.84  )
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

On Thu, May 8, 2025 at 1:49=E2=80=AFAM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Jason Xing wrote:
> > Hi Willem,
> >
> > On Wed, May 7, 2025 at 9:23=E2=80=AFPM Willem de Bruijn
> > <willemdebruijn.kernel@gmail.com> wrote:
> > >
> > > Jason Xing wrote:
> > > > From: Jason Xing <kernelxing@tencent.com>
> > > >
> > > > skb_tx_timestamp() is used for tx software timestamp enabled by
> > > > SOF_TIMESTAMPING_TX_SOFTWARE while SKBTX_HW_TSTAMP is controlled by
> > > > SOF_TIMESTAMPING_TX_HARDWARE. As it clearly shows they are differen=
t
> > > > timestamps in two dimensions, this patch makes the software one
> > > > standalone.
> > > >
> > > > Signed-off-by: Jason Xing <kernelxing@tencent.com>
> > > > ---
> > > >  drivers/net/ethernet/cavium/thunder/nicvf_queues.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c b/d=
rivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > > > index 06397cc8bb36..d368f381b6de 100644
> > > > --- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > > > +++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > > > @@ -1389,11 +1389,11 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic,=
 struct snd_queue *sq, int qentry,
> > > >               this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
> > > >       }
> > > >
> > > > +     skb_tx_timestamp(skb);
> > > > +
> > > >       /* Check if timestamp is requested */
> > >
> > > Nit: check if hw timestamp is requested.
> >
> > Thanks for the review. Will change it.
> >
> > >
> > > > -     if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
> > > > -             skb_tx_timestamp(skb);
> > > > +     if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
> > > >               return;
> > > > -     }
> > >
> > > The SO_TIMESTAMPING behavior around both software and hardware
> > > timestamps is a bit odd.
> >
> > Just a little bit. The reason why I looked into this driver is because
> > I was reviewing this recent patch[1]. Then I found that the thunder
> > driver uses the HW flag to test if we can generate a software
> > timestamp which is also a little bit odd. Software timestamp function
> > is controlled by the SW flag or SWHW flag instead of the pure HW flag.
> >
> > [1]: https://lore.kernel.org/all/20250506215508.3611977-1-stfomichev@gm=
ail.com/
> >
> > >
> > > Unless SOF_TIMESTAMPING_OPT_TX_SWHW is set, by default a driver will
> > > only return software if no hardware timestamp is also requested.
> >
> > Sure thing. SOF_TIMESTAMPING_OPT_TX_SWHW can be used in this case as
> > well as patch [1].
> >
> > >
> > > Through the following in __skb_tstamp_tx
> > >
> > >         if (!hwtstamps && !(tsflags & SOF_TIMESTAMPING_OPT_TX_SWHW) &=
&
> > >             skb_shinfo(orig_skb)->tx_flags & SKBTX_IN_PROGRESS)
> > >                 return;
> > >
> > > There really is no good reason to have this dependency. But it is
> > > historical and all drivers should implement the same behavior.
> >
> > As you said, this morning when I was reviewing patch[1], I noticed
> > that thunder code is not that consistent with others.
> >
> > >
> > > This automatically happens if the software timestamp request
> > > skb_tx_timestamp is called after the hardware timestamp request
> > > is configured, i.e., after SKBTX_IN_PROGRESS is set. That usually
> > > happens because the software timestamp is requests as close to kickin=
g
> > > the doorbell as possible.
> >
> > Right. In most cases, they implemented in such an order:
> >
> >                 if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)
> >                         skb_shinfo(skb)->tx_flags |=3D
> > SKBTX_IN_PROGRESS;
> >
> >                 skb_tx_timestamp(skb);
> >
> > Should I adjust this patch to have the same behavior in the next
> > revision like below[2]?
>
> Best is just to do what other drivers do with the software
> timestamp: take it as late as possible in ndo_start_xmit,
> meaning just before ringing the doorbell.
>
> For this driver, that is in two places, as said.

Oh, now I see your other core suggestion. Thanks!

Probably I will split it into a small series to make each patch only
do one thing.

Thanks,
Jason

>
> > Then we can get the conclusion:1) if only the
> > HW or SW flag is set, nothing changes and only corresponding timestamp
> > will be generated, 2) if HW and SW are set without the HWSW flag, it
> > will check the HW first. In non TSO mode, If the non outstanding skb
> > misses the HW timestamp, then the software timestamp will be
> > generated, 3) if HW and SW and HWSW are set with the HWSW flag, two
> > types of timestamp can be generated. To put it in a simpler way, after
> > [2] patch, thunder driver works like other drivers. Or else, without
> > [2], the HWSW flag doesn't even work.
> >
> > [2]
> > diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > index 06397cc8bb36..4be562ead392 100644
> > --- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > +++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > @@ -1389,28 +1389,24 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic,
> > struct snd_queue *sq, int qentry,
> >                 this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
> >         }
> >
> > -       /* Check if timestamp is requested */
> > -       if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
> > -               skb_tx_timestamp(skb);
> > -               return;
> > -       }
> >
> > -       /* Tx timestamping not supported along with TSO, so ignore requ=
est */
> > -       if (skb_shinfo(skb)->gso_size)
> > -               return;
> > -
> > -       /* HW supports only a single outstanding packet to timestamp */
> > -       if (!atomic_add_unless(&nic->pnicvf->tx_ptp_skbs, 1, 1))
> > -               return;
> > -
> > -       /* Mark the SKB for later reference */
> > -       skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> > +       /* Check if hw timestamp is requested */
> > +       if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&
> > +           /* Tx timestamping not supported along with TSO, so ignore
> > request */
> > +           !skb_shinfo(skb)->gso_size &&
> > +           /* HW supports only a single outstanding packet to timestam=
p */
> > +           atomic_add_unless(&nic->pnicvf->tx_ptp_skbs, 1, 1)) {
> > +               /* Mark the SKB for later reference */
> > +               skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> > +
> > +               /* Finally enable timestamp generation
> > +                * Since 'post_cqe' is also set, two CQEs will be poste=
d
> > +                * for this packet i.e CQE_TYPE_SEND and CQE_TYPE_SEND_=
PTP.
> > +                */
> > +               hdr->tstmp =3D 1;
> > +       }
> >
> > -       /* Finally enable timestamp generation
> > -        * Since 'post_cqe' is also set, two CQEs will be posted
> > -        * for this packet i.e CQE_TYPE_SEND and CQE_TYPE_SEND_PTP.
> > -        */
> > -       hdr->tstmp =3D 1;
> > +       skb_tx_timestamp(skb);
> >  }
> >
> >  /* SQ GATHER subdescriptor
> >
> > Thanks,
> > Jason
> >
> > >
> > > In this driver, that would be not in nicvf_sq_add_hdr_subdesc, but
> > > just before calling nicvf_sq_doorbell. Unfortunately, there are two
> > > callers, TSO and non-TSO.
> > >
> > > >
> > > >       /* Tx timestamping not supported along with TSO, so ignore re=
quest */
> > > >       if (skb_shinfo(skb)->gso_size)
> > > > --
> > > > 2.43.5
> > > >
> > >
> > >
>
>

