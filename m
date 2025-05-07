Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D7AC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOWpuGjSjBZGrIvkeONlnGI5lOqPZS+eJFMv5U1+B30=; b=eL/87+F8pCj59FZw7sI60ozMP+
	kzP1Tvg6ud+evMR16D671AJt07r1/ixTXBACkrDZ1w1d2tSEofdSn9lPXZ3qgdQVnZQdt29xsddHt
	TNwn12QvlJuCJ3wObhlUT4lnPy5WEPOSxQw+pRem0h7T/Z/JjHdcYSYgzVd94boI2WuRNi/Z8uDpx
	XQgiXYH0DpaonfBjMKTCvIsMTn/lO5d2kWL6Z0YM/TJvIfDJ8uCqFkQjke4Ga9xmyQGFwKNhIhKX1
	1nxE5rkOZO74zut5coJCfbG7OZmqZ1bJr7EVLmc3s2qsRQRTXGu4wO1h4DqZLSYfrY+UK2FaslGbX
	qb/imZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCghf-0000000FyUV-2kLz;
	Wed, 07 May 2025 15:28:59 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgA6-0000000Frbo-34fh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:54:20 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso16766a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746629658; x=1747234458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOWpuGjSjBZGrIvkeONlnGI5lOqPZS+eJFMv5U1+B30=;
        b=gyvC9n2OPccA98Pag83I5G2lSp0hEF4EdkSIBnCxyBK24zrAS8/ZQcnZRHxIEbGdZc
         DZz092hyO4Qt8JIDV4yQZVYt9jzpx7aH0pMmuD3NJGkt9LDxzI3Os8Is3NakuMQJilOt
         s23GStuM5+V77A1nxskcHNaiPiTFNjwFibuQb/1VMpe6b8sQw38CJ6BwJWB3o16ow72d
         8dJhgf6Qp2t1rGhDLB3QSvESeS7xJu74WBugqDTgfg7VR/R/OgSz6JTUWZmYjO6mDz8L
         Zubg55OrPc4tsAo5ZfkRkbZbGZk8xfcG1yyg4jCozWQm9jzfmlI29oubVDjQ9ujuUE9w
         tmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629658; x=1747234458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOWpuGjSjBZGrIvkeONlnGI5lOqPZS+eJFMv5U1+B30=;
        b=kiptxeIRAzVcCBhL6H1ovI49QKQgtXlk2Cz65NGe6+aWhnfrAUf/O/vtHhRAc/PYNb
         lstTHZThIg8WyHfMvYFmbrOEZ+2iFPT+2cct8kvo7AtciolzJjjp8OEr5bTPhsAU5CFv
         hUkXkvYlq7ysJvTLl/8/ncY3J3lGAwRE1fIfmk2EtBOO9NPyiEKtwnplEaM1mVCbyzTz
         5HXrQ8OrJdHqTIGhP6WB7QWjtR7eMEW4VoXXjLPtDHTYHCTovjePbCwNntm54ElBxk56
         tbsXvy22vq+kdmn3iNEtCr7pf7Ubkb1/WMyoRt7cRzsngEZOSzF+nVwHtlmHk7SsQERc
         d3cg==
X-Forwarded-Encrypted: i=1; AJvYcCUlbgGNnrY7YhPb5jUM+5UTM2TduzmQTrwQse/BwhhGL3Z6bn7pq0uz1Fw8KOCifXNJsaHaTXeqr4yXGTWIMB2y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6FB4PLPCFMoJwc2lEusEmZFnzN+96K0y7pB+YF6czkYuufGZ5
	OEgMA6w5Gby0+F/9qTA4EcUSYyJ+oYnMJr3YblBc/LrRRXQQE06u4yP1mEOiMju1G1TIvUDoR89
	H1JwMDVvfgCiLzf4bqPQZB/iVSeCI+I/nluc=
X-Gm-Gg: ASbGnctr6nVM8WVQVLdq+7Ttul6I0RqdKWyHzL0S2Yj2+E+t7ukRUtHEwf0Mv4s0wpM
	yQaKF4nu7UCPyMkrhn8z+sqeP/la9/ML/tSJFJEgOyLJ+1u0kDlIxwpnomVAp4S53NRJXm/rTuw
	4rbnXDI7S1yt+6DgZurROEnKl1MNxE5rM=
X-Google-Smtp-Source: AGHT+IFNvGZ+DEYEXKW0B9YV2+DO4I0tiY7sB529MeZ8z2cnx0UOs+r85SbOUXdVIFgaArcXxT5vljAEQMmGPcZyM1w=
X-Received: by 2002:a05:6e02:144c:b0:3d8:1e50:1d51 with SMTP id
 e9e14a558f8ab-3da73908592mr37437245ab.13.1746629647101; Wed, 07 May 2025
 07:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250507030804.70273-1-kerneljasonxing@gmail.com> <681b5ebc80a81_1e440629460@willemb.c.googlers.com.notmuch>
In-Reply-To: <681b5ebc80a81_1e440629460@willemb.c.googlers.com.notmuch>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 7 May 2025 22:53:31 +0800
X-Gm-Features: ATxdqUF3LLyCla5RywYUlJILbIaorGy0nMY6kjwnpahuv7rJMFZ_9WvJuELitag
Message-ID: <CAL+tcoC606GBfwo3BY_7vn3jPQJdC=78h9q-110hC3DCYRg7jQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250507_075418_777843_4E0FEF19 
X-CRM114-Status: GOOD (  37.95  )
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

Hi Willem,

On Wed, May 7, 2025 at 9:23=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Jason Xing wrote:
> > From: Jason Xing <kernelxing@tencent.com>
> >
> > skb_tx_timestamp() is used for tx software timestamp enabled by
> > SOF_TIMESTAMPING_TX_SOFTWARE while SKBTX_HW_TSTAMP is controlled by
> > SOF_TIMESTAMPING_TX_HARDWARE. As it clearly shows they are different
> > timestamps in two dimensions, this patch makes the software one
> > standalone.
> >
> > Signed-off-by: Jason Xing <kernelxing@tencent.com>
> > ---
> >  drivers/net/ethernet/cavium/thunder/nicvf_queues.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c b/drive=
rs/net/ethernet/cavium/thunder/nicvf_queues.c
> > index 06397cc8bb36..d368f381b6de 100644
> > --- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > +++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> > @@ -1389,11 +1389,11 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic, str=
uct snd_queue *sq, int qentry,
> >               this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
> >       }
> >
> > +     skb_tx_timestamp(skb);
> > +
> >       /* Check if timestamp is requested */
>
> Nit: check if hw timestamp is requested.

Thanks for the review. Will change it.

>
> > -     if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
> > -             skb_tx_timestamp(skb);
> > +     if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
> >               return;
> > -     }
>
> The SO_TIMESTAMPING behavior around both software and hardware
> timestamps is a bit odd.

Just a little bit. The reason why I looked into this driver is because
I was reviewing this recent patch[1]. Then I found that the thunder
driver uses the HW flag to test if we can generate a software
timestamp which is also a little bit odd. Software timestamp function
is controlled by the SW flag or SWHW flag instead of the pure HW flag.

[1]: https://lore.kernel.org/all/20250506215508.3611977-1-stfomichev@gmail.=
com/

>
> Unless SOF_TIMESTAMPING_OPT_TX_SWHW is set, by default a driver will
> only return software if no hardware timestamp is also requested.

Sure thing. SOF_TIMESTAMPING_OPT_TX_SWHW can be used in this case as
well as patch [1].

>
> Through the following in __skb_tstamp_tx
>
>         if (!hwtstamps && !(tsflags & SOF_TIMESTAMPING_OPT_TX_SWHW) &&
>             skb_shinfo(orig_skb)->tx_flags & SKBTX_IN_PROGRESS)
>                 return;
>
> There really is no good reason to have this dependency. But it is
> historical and all drivers should implement the same behavior.

As you said, this morning when I was reviewing patch[1], I noticed
that thunder code is not that consistent with others.

>
> This automatically happens if the software timestamp request
> skb_tx_timestamp is called after the hardware timestamp request
> is configured, i.e., after SKBTX_IN_PROGRESS is set. That usually
> happens because the software timestamp is requests as close to kicking
> the doorbell as possible.

Right. In most cases, they implemented in such an order:

                if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)
                        skb_shinfo(skb)->tx_flags |=3D
SKBTX_IN_PROGRESS;

                skb_tx_timestamp(skb);

Should I adjust this patch to have the same behavior in the next
revision like below[2]? Then we can get the conclusion:1) if only the
HW or SW flag is set, nothing changes and only corresponding timestamp
will be generated, 2) if HW and SW are set without the HWSW flag, it
will check the HW first. In non TSO mode, If the non outstanding skb
misses the HW timestamp, then the software timestamp will be
generated, 3) if HW and SW and HWSW are set with the HWSW flag, two
types of timestamp can be generated. To put it in a simpler way, after
[2] patch, thunder driver works like other drivers. Or else, without
[2], the HWSW flag doesn't even work.

[2]
diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
index 06397cc8bb36..4be562ead392 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
@@ -1389,28 +1389,24 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic,
struct snd_queue *sq, int qentry,
                this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
        }

-       /* Check if timestamp is requested */
-       if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
-               skb_tx_timestamp(skb);
-               return;
-       }

-       /* Tx timestamping not supported along with TSO, so ignore request =
*/
-       if (skb_shinfo(skb)->gso_size)
-               return;
-
-       /* HW supports only a single outstanding packet to timestamp */
-       if (!atomic_add_unless(&nic->pnicvf->tx_ptp_skbs, 1, 1))
-               return;
-
-       /* Mark the SKB for later reference */
-       skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
+       /* Check if hw timestamp is requested */
+       if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&
+           /* Tx timestamping not supported along with TSO, so ignore
request */
+           !skb_shinfo(skb)->gso_size &&
+           /* HW supports only a single outstanding packet to timestamp */
+           atomic_add_unless(&nic->pnicvf->tx_ptp_skbs, 1, 1)) {
+               /* Mark the SKB for later reference */
+               skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
+
+               /* Finally enable timestamp generation
+                * Since 'post_cqe' is also set, two CQEs will be posted
+                * for this packet i.e CQE_TYPE_SEND and CQE_TYPE_SEND_PTP.
+                */
+               hdr->tstmp =3D 1;
+       }

-       /* Finally enable timestamp generation
-        * Since 'post_cqe' is also set, two CQEs will be posted
-        * for this packet i.e CQE_TYPE_SEND and CQE_TYPE_SEND_PTP.
-        */
-       hdr->tstmp =3D 1;
+       skb_tx_timestamp(skb);
 }

 /* SQ GATHER subdescriptor

Thanks,
Jason

>
> In this driver, that would be not in nicvf_sq_add_hdr_subdesc, but
> just before calling nicvf_sq_doorbell. Unfortunately, there are two
> callers, TSO and non-TSO.
>
> >
> >       /* Tx timestamping not supported along with TSO, so ignore reques=
t */
> >       if (skb_shinfo(skb)->gso_size)
> > --
> > 2.43.5
> >
>
>

