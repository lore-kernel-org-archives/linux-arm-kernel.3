Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E89BC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=; b=4IqpV++ZD9kY6ni/ByhXTsOJX2
	pwLTUHlKERhpEPUx+VLpoPujalrXb0qCfhV2oEthrEUrSy1ndRPg/N9oPZRaqcUdLsI9bCd27VcCz
	8RKqbvIJwhuvEqx/0/uuPQ5MEAeeTx0tmW1M1P5AHBUn4MCYPhBprHgxRZeEqAiYe5uEw1PBeSHiU
	GQWzQqXGjaxLk0qHr3GdWvoHnJuGiTv/9Gs/k7y8xI0V5xk7LsCAWgjR9v88I3/QZdmlBpd3A6PZn
	grreWNSSTbKe2tswqdZU01orLw5uZVM9SyPHSwKT4Hwgzh4SfwMgPPaQzoHL5wSyvT1PJZ1LDKM/j
	pcY9oPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LFm-0000000CL4v-0RgJ;
	Wed, 09 Sep 2026 16:34:30 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LFk-0000000CL3s-0xtb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:34:29 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466cc9b2f1dso1421323fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 09:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788971667; cv=none;
        d=google.com; s=arc-20260327;
        b=ec+H6fiGlNLbOlZ5VJT0+A8JbfQ/HVJ54KB/6PoZEoFffd1lE6pIkVrjDqIQeoFzgl
         fuXYsJ2wmpA3Vh1hvzmudffPwFPbQqmm5wuKM9FEDRnZV29aEWYeoz1fmPA2czBbnMNd
         unyf0HEkv7FhIHuvJ67701iaIOhZrUZCWGodZVtvZkMXSUimr+SCOpB4a6RpCL0MYFMQ
         dHmtMVTGJyffTSBw0F8kUyKhTeRwVmmk40sULXzbzg4cal3hkdoXe2eZrRlW+BZJavn3
         LoczySq2LUxz+6yNTZaHjbKuKGLHSKkJf+bmwti37KrMWDW8yLe+NT7vmE0nZ2Lx9Tb2
         O0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        fh=eZd1hBHAGjM/QttVVRkQKNb+NSsJgAf0Y4zOVii0JnE=;
        b=hHD/naR3VieJKfwd2QxTweHHuLo85jzcx31l19K5nrCkTriqN+TFXoo6pXhg2dHtaa
         STVCnpQ6qvKbaJhQKuyvfGXQabRcTX5fvIOQAZcL3Vopf6rlBUQySu/u9GIIhtaxnCpc
         BLJ39UFILmTPDzL2yMKyNcNx0OEWTfBlqGNJbmuq9JuvxYgeeHpSBFMjKEbUmdGLcxnJ
         oNlN0sc7PCIswObLNltGsp43aNfCM55SZHVeCUbc6wlLb3QwWhnM8Rys0cwA9+6S8kaL
         QXgkzm1r2uo7QrhijL3KifwLyETqU7U6GYtdfEW3a/AOZh907S/tdAqb6+BMOF/rnkRK
         lktA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971667; x=1789576467; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        b=MQ9j4tr9If0vXmy3duWdyW9BsjCOJirhmNTmKApIN9VJ/nEJvVxUZgzShYtENjl/bq
         eQvrLwDDuXYn5SuV8RYazPpU/R7kScZjWDZrA4IKs5/Ekdu5VZ99R0NaLnuN1oYvZEub
         cFXwKztm5KDX5pPErOmTvBB8vYkCBROZChTjWoc28O5LDgku7nyfnIeJZ7j2bSp4w1L2
         aWL65f/i3MLXi68mafLfrvLIhpMf5nbS5m1UFRhvi8G1uWJuTsx39mbpzRukuagqf4Kj
         yEJAnm/jhtXtytRmFkPeUmeW5g9g7MwPtnolBIpzGaR/a7Ze+Yufgys+5pSKyGpJW2x0
         4Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971667; x=1789576467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        b=kh0JLRBq2IESgw9SxFVd+DsdD1Y6cLtYVshjs9qJLreMvkK1ggfW8z60ZhLx343oBH
         NNCDpsA5dvGxn1TLy+TM4vWL38AVR+MrLwVi3UqXAF2gG9fHdn2+eh79loqYW4Dqe7mV
         ewKcNg85IB/mPSepCD992iVJ0aiAWH/lAZlTU+4Ys+woi+zjNfC22LJaX+/31od9XU7K
         0C6IP6SMePQ4WAkXmTezKOfpS2NAh05f6LjTwM8Pk9rhMMjSkx2wlqq+QRzV2GZV/rHy
         Hvp+uyFJhbMRtxiFjZg3bhDYuY525uuwTPCUah1RQ8c70Lq0Vv0/Tc5wuBv96aQ5OQuq
         NOFg==
X-Forwarded-Encrypted: i=1; AKwUvBwLMLjRdjGWXzPLL+pBfq4AeDuMudDBH+tZWy1LPE+KULoqBRqRYsbL6syQNmnMvxYzVWe+9lrJU1pHlSuvEQiA@lists.infradead.org
X-Gm-Message-State: AFuF++loFb8eIWesY/fAJFoO+iktpp8RbFWWFX1WAGSqplgwwZBKEpv0
	Awax2/IOxENO6vdBKK2V2di/GGnkhDfws3WQChSqXuNBE2fW1uzmzP5tI9qj1ymiEYitaHx1nlH
	NNwXgVB4CuP0OOD+rMVnCnKjmUFKtt0c=
X-Gm-Gg: AYBFou1oc/vursuEYdk+JryGdpIyhxNIHbh9jwtdqI5x/posuXxUedx6UCa9rRopzgm
	KpZmdnRFhoWXBzz+bb6fYKExQwQjA0reCpv8bhDchx9+XZ45DwV04OZJmp1U6tERA7qvDqGqLyk
	tMM15ZMd68GjF6A+9ce6xBblTCx9T5JEAlvmUgjsmk9TmrMrf88irQsaDNE/jjSE2OskpS4651K
	3Q5k6ELHCK4TechFxK9QWjIRAGCFvOYpaE7vd4xH3e/+F9mDkn1dHeok6QmkfxqU1DJ+0bzos9Q
	3jWg/aMEvmqROw4EcVX3svrRT43pEgHKssSEHgB4doiFQAJYpoZUtmM=
X-Received: by 2002:a05:6871:73a2:b0:47b:d505:86e8 with SMTP id
 586e51a60fabf-47c97aefcebmr81914fac.7.1788971666583; Wed, 09 Sep 2026
 09:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com> <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
In-Reply-To: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 9 Sep 2026 11:34:15 -0500
X-Gm-Features: AcwNN1VgB6PY3lWZVGJPLxRB24QIZFj2GUXPTnTbU7UduTBmTljunh-ycSlPZcM
Message-ID: <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093428_281309_4D9AF088 
X-CRM114-Status: GOOD (  28.83  )
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

On Wed, Sep 9, 2026 at 10:53=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Sep 5, 2026 at 6:20=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.c=
om> wrote:
> >
> > Hi Douglas,
> >
> > On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > ....
> > > +
> > > +/**
> > > + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Ack=
ed our msg.
> > > + * @goog_mbox: The mailbox info.
> > > + */
> > > +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog=
_mbox)
> > > +{
> > > +       unsigned int reqs_completed;
> > > +       int i;
> > > +
> > > +       /*
> > > +        * ACK interrupt needs to be cleared before reading CLIENT_OU=
TSTANDING_MSG.
> > > +        * Then if a "race" happens and another message gets Acked af=
ter we clear
> > > +        * but before we read CLIENT_OUTSTANDING_MSG then the worst t=
hat will
> > > +        * happen is we'll get a followup interrupt that will show 0 =
reqs_completed.
> > > +        */
> > > +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_I=
RQ_STATUS_OFFSET);
> > > +
> > > +       if (goog_mbox->queue_mode) {
> > > +               u32 outstanding_msgs;
> > > +
> > > +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_=
OUTSTANDING_MSG);
> > > +               spin_lock(&goog_mbox->lock);
> > > +
> > > +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs=
) {
> > > +                       reqs_completed =3D goog_mbox->outstanding_msg=
s - outstanding_msgs;
> > > +               } else {
> > > +                       /*
> > > +                        * The hardware's track of outstanding messag=
es should always
> > > +                        * be less than or equal to the number of mes=
sages we queued.
> > > +                        * If it thinks there are more messages outst=
anding than we
> > > +                        * queued, something is wrong. Assume nothing=
 was completed.
> > > +                        */
> > > +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> > > +                                            "%pOFP: unexpected outst=
anding msgs: %u -> %u\n",
> > > +                                            goog_mbox->np, goog_mbox=
->outstanding_msgs,
> > > +                                            outstanding_msgs);
> > > +                       reqs_completed =3D 0;
> > > +               }
> > > +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> > > +               spin_unlock(&goog_mbox->lock);
> > > +
> > > +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_compl=
eted, outstanding_msgs);
> > > +       } else {
> > > +               reqs_completed =3D 1;
> > > +               trace_goog_mba_process_nq_txdone(goog_mbox);
> > > +       }
> > > +
> > > +       for (i =3D 0; i < reqs_completed; i++)
> > > +               mbox_chan_txdone(&goog_mbox->chan, 0);
> >
> > The patchset doesn't say much about the clients but if the platform
> > works like this, I have a strong feeling we can do without introducing
> > mbox_controller.has_queue.
> > Just use the msg_data[] ringbuffer -- we can avoid changing the core
> > internals and you will still get ACK for each message.
> > What are the clients going to be like?
>
> I don't think we can get rid of `mbox_controller.has_queue`.
> Specifically, the queue mode allows the mailbox controller to handle
> multiple outstanding transactions simultaneously to reduce latency.
> Imagine host (Linux) interrupt latency is 100us and we want to send 3
> mailbox messages. Let's say queuing a mailbox message takes 10us.
> We'll say that the remote interrupt latency is 50us. Timing would look
> something like this:
>
> 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> 0.000010: Client sends msg #2 and mbox controller initiates the xfer
> 0.000020: Client sends msg #3 and mbox controller initiates the xfer
> 0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
> 0.000150: ACK IRQ arrives; mbox controller sends 3 txdone
>
> ...so all 3 messages are sent / ACKed in 150us.
>
> Without letting the mailbox controller queue, we'd end up more like this:
>
> 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> 0.000050: Remote gets IRQ, sees msg #1, ACKs it.
> 0.000150: ACK IRQ arrives; mbox controller sends txdone
> 0.000150: mbox core notes txdone and sends msg #2
> 0.000200: Remote gets IRQ, sees msg #2, ACKs it.
> 0.000300: ACK IRQ arrives; mbox controller sends txdone
> 0.000300: mbox core notes txdone and sends msg #3
> 0.000350: Remote gets IRQ, sees msg #3, ACKs it.
> 0.000450: ACK IRQ arrives; mbox controller sends txdone
>
I don't mean that ... though even that may be more acceptable to the
clients than you think. What class of clients are there?

I am suggesting to consider TX-Is-Done when send_data() returns, i.e
tx submitted is seen as transferred. You anyway  don't catch
transmission errors. That way you fill all slots without blocking on
the first message and achieve this same throughput.
Without knowing the clients I am not sure if that can't be done.

Regards,
Jassi

