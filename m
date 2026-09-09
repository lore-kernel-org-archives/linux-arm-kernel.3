Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772B6C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9+VNAcoJZM4aq0tQI6V+NRSLAdDW0QhBOB3oGupHtM=; b=xHa45I0KqMRKL5WLRz6CITw5yN
	T64RG9/SLua6QDFbbeOitRm4AU+/At+M+2/lta1uwIIDL4vZhhHPCrOcrKzq7NQbhuuKMGTNiMWW8
	n+vUpHQaSIaD+bX3Y5DOHcpnPP6nR2KIrnF6XuRVZaT6l9DLP98pWmKBmoLUZijYsk4I8fU75lyTQ
	giEKaFDDLoefXgD/YJq+EZqduCpzqHDN2zMN9IrfYbWYRtnAjR9AguiuzsqyUDsyKcZ3kLezbplcR
	AJZ/Wd3QJsTAAO81KAf92Mab4sJbQbzs/+dO7q+IgGKb7KE6O+edPTWZJXX8r2WtRv4ArNEylOYrn
	FpsT/9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KcY-0000000CEb1-1TDi;
	Wed, 09 Sep 2026 15:53:58 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KcV-0000000CEZU-43EL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:53:57 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so1271632e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788969233; x=1789574033; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a9+VNAcoJZM4aq0tQI6V+NRSLAdDW0QhBOB3oGupHtM=;
        b=K39JCTskxIz34CYOrRBPBrKG6chy707zaRfIu/UGbiH2x9Z0jzNXp6dfXjulIfbq6h
         Z6VQkGmMQq8nhMh8nS6aEglu2OZ0JrveyeVa5yn/251iWr/rKgEzS/3rDyt4I/gx+Yrc
         llSZyenY0h2U7/B9j2l8RbmqdFA0TphC2MDq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969233; x=1789574033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9+VNAcoJZM4aq0tQI6V+NRSLAdDW0QhBOB3oGupHtM=;
        b=eWKiKORjxVpf2TP1bEcZ+zSkl+gwZC8PyeK1UuFQmT8+a1nBteY5Lwhh5mdYST+9E0
         aqPn9AI70QGArgFk24E9sY8OmUP1GpT5bC0NbvdYHeqXi+uXn3t3Hnj/bx7+nfBS92wU
         HyuJYeKRi9sOw6F+rtA9YfYwRXgN11TP5NmFol85THVnL7OpmPrF9vHSBSaHIL3XsWCx
         Z+FCygi8lZaIiCkjgmByJ0HKnQBTToQFkpEQKQ33mbbtiepDe6+fNr8kJ6zFC000DjJP
         1QfQtLlG0j2tSQLqopm+5l99jWySLZvj8QeK75JU/xiKutFRsrX0PZTK4Cz3rsNqZwPb
         I0EA==
X-Forwarded-Encrypted: i=1; AKwUvBwScwoQyEzR/AZe/c6orrwRljxJFP887d3R2RmzbTs1WmTh6Hw4eL9jtoPbxxhVVRckM5yTQCwzVQ8arcqU93TP@lists.infradead.org
X-Gm-Message-State: AFuF++nXHTzGUpGNQ9Y3ARp8lRxvPK2SaBIiUfIjs7Z5FKjofhWva9M3
	oFmJHgeS2BETXKySGdaiG0kTXc2m7Qln6FyJ0bZB4xTTvIih6L+2FrH5BJ5VFtoNLn4g2kCewYx
	dDHYFvQ==
X-Gm-Gg: AYBFou2Qqm6tvJm0VplhvgD0YhhiLTZwyjKv/2hXbovfsA1radjp/ieI4p3oaK8IyIg
	kacPnKUpU5d1sQFzf9RI8OJmue1N4IA4wBU2ySlpJk7EZWfHEFcvaIQT13Q43Bo4i9Ddk/eRUaH
	e0N6pbxg0zOrQ3rT5dRtgHnrTPp9AapwqLic8ngf7jtQAdS80d2xTNNtfeY8tCFeR1KowKI8J7l
	KW0rqi1PSEkXKm43GPr8BUyD72eZX5qGVQp4Pzf1Knynn3icfwtgt+L4R6WCxMTaaZpSgVol9wo
	BELGY7hpO17XtBK+PyD5d07HUDJ/4SUyVaH6TWA7LRgpRb+LFWl/8TrXNsIMjTVGoHa9LpFU0li
	BKbSngHyYysPLgujwfyiHAfe+qk0skYIGRGRKUj/n1wRSdz5hPU/XzAsT57hqOKZFG3S6jG9ON1
	Qz3A93zsXqp7PBnM/3Mv+rWaMXQ8U0SayUteExxYQWs43laiM57t+T4rRM2hywUUb375b+rN+A/
	ppJTvB/0TT9NleU0qU/Z8T7J+Q/4rxEo1Vk5g==
X-Received: by 2002:a05:6512:6884:10b0:5b7:f75a:d62a with SMTP id 2adb3069b0e04-5b7f75ad712mr929484e87.2.1788969233041;
        Wed, 09 Sep 2026 08:53:53 -0700 (PDT)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com. [74.125.230.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b899800272sm176683e87.83.2026.09.09.08.53.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:53:52 -0700 (PDT)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso11981081fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqlcR8f01LGh/8yr15GKb22v+7FOyGAnk5FALi9dWzZh8/nKyEDMewepZxnXw8pyzcj8NYDSyHL7CYYPTaeQFS@lists.infradead.org
X-Received: by 2002:a05:651c:a34a:b0:3a1:4f33:f60e with SMTP id
 38308e7fff4ca-3a49765d1ccmr16262451fa.8.1788969230181; Wed, 09 Sep 2026
 08:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid> <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
In-Reply-To: <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Sep 2026 08:53:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
X-Gm-Features: AcwNN1VMebMlHBDN2oamx6OSXko7kBI4Fg9_efqS3e1qWZ6X4QFSZyV1w6i5DKU
Message-ID: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_085356_077034_321E0183 
X-CRM114-Status: GOOD (  24.77  )
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

Hi,

On Sat, Sep 5, 2026 at 6:20=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Douglas,
>
> On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> ....
> > +
> > +/**
> > + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Acked=
 our msg.
> > + * @goog_mbox: The mailbox info.
> > + */
> > +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog_m=
box)
> > +{
> > +       unsigned int reqs_completed;
> > +       int i;
> > +
> > +       /*
> > +        * ACK interrupt needs to be cleared before reading CLIENT_OUTS=
TANDING_MSG.
> > +        * Then if a "race" happens and another message gets Acked afte=
r we clear
> > +        * but before we read CLIENT_OUTSTANDING_MSG then the worst tha=
t will
> > +        * happen is we'll get a followup interrupt that will show 0 re=
qs_completed.
> > +        */
> > +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_IRQ=
_STATUS_OFFSET);
> > +
> > +       if (goog_mbox->queue_mode) {
> > +               u32 outstanding_msgs;
> > +
> > +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_OU=
TSTANDING_MSG);
> > +               spin_lock(&goog_mbox->lock);
> > +
> > +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs) =
{
> > +                       reqs_completed =3D goog_mbox->outstanding_msgs =
- outstanding_msgs;
> > +               } else {
> > +                       /*
> > +                        * The hardware's track of outstanding messages=
 should always
> > +                        * be less than or equal to the number of messa=
ges we queued.
> > +                        * If it thinks there are more messages outstan=
ding than we
> > +                        * queued, something is wrong. Assume nothing w=
as completed.
> > +                        */
> > +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> > +                                            "%pOFP: unexpected outstan=
ding msgs: %u -> %u\n",
> > +                                            goog_mbox->np, goog_mbox->=
outstanding_msgs,
> > +                                            outstanding_msgs);
> > +                       reqs_completed =3D 0;
> > +               }
> > +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> > +               spin_unlock(&goog_mbox->lock);
> > +
> > +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_complet=
ed, outstanding_msgs);
> > +       } else {
> > +               reqs_completed =3D 1;
> > +               trace_goog_mba_process_nq_txdone(goog_mbox);
> > +       }
> > +
> > +       for (i =3D 0; i < reqs_completed; i++)
> > +               mbox_chan_txdone(&goog_mbox->chan, 0);
>
> The patchset doesn't say much about the clients but if the platform
> works like this, I have a strong feeling we can do without introducing
> mbox_controller.has_queue.
> Just use the msg_data[] ringbuffer -- we can avoid changing the core
> internals and you will still get ACK for each message.
> What are the clients going to be like?

I don't think we can get rid of `mbox_controller.has_queue`.
Specifically, the queue mode allows the mailbox controller to handle
multiple outstanding transactions simultaneously to reduce latency.
Imagine host (Linux) interrupt latency is 100us and we want to send 3
mailbox messages. Let's say queuing a mailbox message takes 10us.
We'll say that the remote interrupt latency is 50us. Timing would look
something like this:

0.000000: Client sends msg #1 and mbox controller initiates the xfer
0.000010: Client sends msg #2 and mbox controller initiates the xfer
0.000020: Client sends msg #3 and mbox controller initiates the xfer
0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
0.000150: ACK IRQ arrives; mbox controller sends 3 txdone

...so all 3 messages are sent / ACKed in 150us.

Without letting the mailbox controller queue, we'd end up more like this:

0.000000: Client sends msg #1 and mbox controller initiates the xfer
0.000050: Remote gets IRQ, sees msg #1, ACKs it.
0.000150: ACK IRQ arrives; mbox controller sends txdone
0.000150: mbox core notes txdone and sends msg #2
0.000200: Remote gets IRQ, sees msg #2, ACKs it.
0.000300: ACK IRQ arrives; mbox controller sends txdone
0.000300: mbox core notes txdone and sends msg #3
0.000350: Remote gets IRQ, sees msg #3, ACKs it.
0.000450: ACK IRQ arrives; mbox controller sends txdone

Hopefully that clears up what the "has_queue" is about and why we need it?

-Doug

