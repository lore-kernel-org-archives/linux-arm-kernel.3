Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071A8E8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTxlcaECIOSPGuWyVGV6jMrdulKgnVXDtGKmH5N3sQ8=; b=g1nUrCptZqBSJK4bD2G93BSYq7
	rZYcBZy4+v5dyGpgzBjUmsKRUif0mUcB7aVOEsF6TRFXRa9LicNrOXwkBWXgWxAJvF6BWaOxitWfE
	F71F36tpCDH9Kuh5PLxmuoxH42/N+QMOyUzHDbNboj4WeQNfcgl+4JaQJE0cDj7iic1EZjz3uWRqJ
	h3hl+QHujma2y2Z6+YoEjcmtpbjazBfwOceMHHQhqQ22ugIkOqocMx5qxr3lbEWblpLP6sOaqbBA+
	hikFmOJcjCV5pYNB5KjrMDS4M2cwZPMDXLVAAUrG3QKLtc7MzwLHjQ+iKbvh9wIt3WKIFZdaQfolO
	Gf1vZjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gJQ-00000002Cc0-2BSf;
	Fri, 03 Apr 2026 15:19:56 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gJN-00000002Cb7-3WpQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 15:19:54 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b23af7d7e8so55438495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775229592; x=1775834392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTxlcaECIOSPGuWyVGV6jMrdulKgnVXDtGKmH5N3sQ8=;
        b=Luvv/sluHU9eOwos121rCmDxp5vFbhcVSQfe78Va90SPYMAR/W0jy3HdoE5y2BCdGf
         G2l7R2tnKkBk31hyudlMwVVvQm+mzCrj8O7gJN2hIsbgQ+oUT9/KqW0QVmrxeZPShHci
         tQtjN8mqIX4LdK3olfVesI7SzeabgfIP4y0SdE000FI4CwGvJTrXJMard+L6onBdivhq
         y0nxFUIPI+KmOzyuxABETDZwDqt9IZn6CreUoHR3FIOmXcO7Y/6uAibFvVYh2Oe6besv
         7lQiynZsBDo/4lmZYlhgGAm7D/gnds+jUXqUYReaB9TFC6ZUJFp/X1/AXeB5SATvYNrO
         BT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775229592; x=1775834392;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uTxlcaECIOSPGuWyVGV6jMrdulKgnVXDtGKmH5N3sQ8=;
        b=qW2CAJTv5CTkhmb/w5cV+wl5ijzX+Eq4gmGuGzn4mZGOfS1dHpmIIxncLeldmhoesf
         C9QHYrN0HBMvJ1OuJM2wCZtriIHc+zyezf0lNimXHcKhmBma1t9vhimS155kA0tFvkty
         jojnE/rKIGuSBHQDKCaBpm1SF1Gx6Bc2REE0JgGS1pFcXUDfK28PzuIP0OIW6hchprEc
         ajsmYSPYTKVTqTU1cEEwtkzqxvT0tvPiebXLrouMEEgjK72gtH+EU2nI3O/pLN4nYd1m
         lG+bYuxC4cDKsnab512ji/KWA0ZrQ6vxFtTe+R7scqziWycrhc+iwdjIidUAqzdwy3eo
         c9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdlNn8OpbjI5ZA30ElGoq+Wis6cBamCZ05vYm9tAH4ZE620MOZMIK/2EGU4alf/7L8ZjMxqevN/uIGKF7Hufa+@lists.infradead.org
X-Gm-Message-State: AOJu0YxVwXL9mkBECf1s5WAUZdij2vT9LU3da8b35WWqzNpeAgWgU3CR
	tuxZjb2p1pyk6+pGgcGf2I9S+0fMWHCcYNnXc3fOxTMtAz6Y4nADMu2pLtkRwbnQHMlByz+zQNU
	PtM3Hd1tfvoY52qAINFo3x5h+aA==
X-Received: from pgcn23.prod.google.com ([2002:a63:7217:0:b0:c73:bace:526e])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7354:b0:39b:e321:784f with SMTP id adf61e73a8af0-39f2f05041dmr3566398637.40.1775229591907;
 Fri, 03 Apr 2026 08:19:51 -0700 (PDT)
Date: Fri,  3 Apr 2026 15:19:47 +0000
In-Reply-To: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403151950.2592581-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	joonwonkang@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_081953_910248_BE4FF091 
X-CRM114-Status: GOOD (  34.75  )
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

> On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > When the mailbox controller failed transmitting message, the error code
> > was only passed to the client's tx done handler and not to
> > mbox_send_message(). For this reason, the function could return a false
> > success. This commit resolves the issue by introducing the tx status an=
d
> > checking it before mbox_send_message() returns.
> >
> Can you please share the scenario when this becomes necessary? This
> can potentially change the ground underneath some clients, so we have
> to be sure this is really useful.

I would say the problem here is generic enough to apply to all the cases wh=
ere
the send result needs to be checked. Since the return value of the send API=
 is
not the real send result, any users who believe that this blocking send API
will return the real send result could fall for that. For example, users ma=
y
think the send was successful even though it was not actually. I believe it=
 is
uncommon that users have to register a callback solely to get the send resu=
lt
even though they are using the blocking send API already. Also, I guess the=
re
is no special reason why only the mailbox send API should work this way amo=
ng
other typical blocking send APIs. For these reasons, this patch makes the s=
end
API return the real send result. This way, users will not need to register =
the
redundant callback and I think the return value will align with their commo=
n
expectation.

Regarding the change in the ground for some clients, could you help to clar=
ify
a bit more on what change, you expect, would surprise the clients?

Thanks,
Joonwon Kang

>=20
> Thanks
> Jassi
>=20
>=20
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joonwon Kang <joonwonkang@google.com>
> > ---
> >  drivers/mailbox/mailbox.c          | 20 +++++++++++++++-----
> >  include/linux/mailbox_controller.h |  2 ++
> >  2 files changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> > index d63386468982..ea9aec9dc947 100644
> > --- a/drivers/mailbox/mailbox.c
> > +++ b/drivers/mailbox/mailbox.c
> > @@ -21,7 +21,10 @@
> >  static LIST_HEAD(mbox_cons);
> >  static DEFINE_MUTEX(con_mutex);
> >
> > -static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct comp=
letion *tx_complete)
> > +static int add_to_rbuf(struct mbox_chan *chan,
> > +                      void *mssg,
> > +                      struct completion *tx_complete,
> > +                      int *tx_status)
> >  {
> >         int idx;
> >
> > @@ -34,6 +37,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *=
mssg, struct completion *tx
> >         idx =3D chan->msg_free;
> >         chan->msg_data[idx].data =3D mssg;
> >         chan->msg_data[idx].tx_complete =3D tx_complete;
> > +       chan->msg_data[idx].tx_status =3D tx_status;
> >         chan->msg_count++;
> >
> >         if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
> > @@ -91,12 +95,13 @@ static void msg_submit(struct mbox_chan *chan)
> >
> >  static void tx_tick(struct mbox_chan *chan, int r, int idx)
> >  {
> > -       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL};
> > +       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL, NULL};
> >
> >         scoped_guard(spinlock_irqsave, &chan->lock) {
> >                 if (idx >=3D 0 && idx !=3D chan->active_req) {
> >                         chan->msg_data[idx].data =3D MBOX_NO_MSG;
> >                         chan->msg_data[idx].tx_complete =3D NULL;
> > +                       chan->msg_data[idx].tx_status =3D NULL;
> >                         return;
> >                 }
> >
> > @@ -116,8 +121,10 @@ static void tx_tick(struct mbox_chan *chan, int r,=
 int idx)
> >         if (chan->cl->tx_done)
> >                 chan->cl->tx_done(chan->cl, mssg.data, r);
> >
> > -       if (r !=3D -ETIME && chan->cl->tx_block)
> > +       if (r !=3D -ETIME && chan->cl->tx_block) {
> > +               *mssg.tx_status =3D r;
> >                 complete(mssg.tx_complete);
> > +       }
> >  }
> >
> >  static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
> > @@ -286,15 +293,16 @@ int mbox_send_message(struct mbox_chan *chan, voi=
d *mssg)
> >         int t;
> >         int idx;
> >         struct completion tx_complete;
> > +       int tx_status =3D 0;
> >
> >         if (!chan || !chan->cl || mssg =3D=3D MBOX_NO_MSG)
> >                 return -EINVAL;
> >
> >         if (chan->cl->tx_block) {
> >                 init_completion(&tx_complete);
> > -               t =3D add_to_rbuf(chan, mssg, &tx_complete);
> > +               t =3D add_to_rbuf(chan, mssg, &tx_complete, &tx_status)=
;
> >         } else {
> > -               t =3D add_to_rbuf(chan, mssg, NULL);
> > +               t =3D add_to_rbuf(chan, mssg, NULL, NULL);
> >         }
> >
> >         if (t < 0) {
> > @@ -318,6 +326,8 @@ int mbox_send_message(struct mbox_chan *chan, void =
*mssg)
> >                         idx =3D t;
> >                         t =3D -ETIME;
> >                         tx_tick(chan, t, idx);
> > +               } else if (tx_status < 0) {
> > +                       t =3D tx_status;
> >                 }
> >         }
> >
> > diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox=
_controller.h
> > index 912499ad08ed..890da97bcb50 100644
> > --- a/include/linux/mailbox_controller.h
> > +++ b/include/linux/mailbox_controller.h
> > @@ -117,10 +117,12 @@ struct mbox_controller {
> >   * struct mbox_message - Internal representation of a mailbox message
> >   * @data:              Data packet
> >   * @tx_complete:       Pointer to the transmission completion
> > + * @tx_status:         Pointer to the transmission status
> >   */
> >  struct mbox_message {
> >         void *data;
> >         struct completion *tx_complete;
> > +       int *tx_status;
> >  };
> >
> >  /**
> > --
> > 2.53.0.1185.g05d4b7b318-goog
> >

