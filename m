Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E75C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBhM7FF9u5QvV0vicKwt7/j6wjdB57A3Ftn0yg5M34M=; b=xkdmKWmd8xdBN5kw6Xp6WoZla7
	STpgAw6DVABQBZHWGQcYhC8PVwbbfNYpYL9i+XDDm3mln1Fepf51eSpZ3RJshRWxBTvpqBJ5M1x79
	7ts1ctiGH9z5NE21R7wQKhXgqnxwKfpjxHNg1OIg6zP6JqqJ5Lf+tj0bSyATAnC+g3JXapcNSuZBi
	pSE9NVVwtGHL5IV+xXRnSjm+hm2TlLotT/SX222r6c7Pt7zQ0GjKURzW8vAMCwENbrhfNzFYYjvnT
	13q3Elfqb98djKZeP5HSS7o1w++r+NznRpYup+MuWg6FSmG6UHQQD10eerdmYMjL0kBt1GOXrxPTo
	5ei+VNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QJ9-00000000WyR-11ze;
	Sun, 20 Sep 2026 22:46:51 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QJ6-00000000Wxy-0uXE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:46:49 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466ccbd478cso1093994fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789944407; cv=none;
        d=google.com; s=arc-20260327;
        b=mGsUeQnLqTaQxW52lkypGsFHglsy0mdK1WFPyesNUcOHgznPp6ZLvK+58SKQ0RNZm0
         H+3Q3xiJk5koEYv1mbfIndgOyixiaRCQARE6d9XyvsvDZ+6Z+aRAxEps1DncFcFazu1r
         tfAwCAUlTrmlvknyFZOEgHiTbLm2J35enIY/IW4E1FLzVRvM/jvqB8FHz5dDTCfi0cSd
         65iphCRPSJgM5ayA8jJevpgQY91KRKvB057a61xI7e2udjHR84gMMqOqthCB/9CvYTt+
         Ot4+3hxZtnqhNBhYDxFpWPh9ec9FL7OgpOfPUHYy1UTTKB/CjTWhIOECZjwZO/td3zRr
         tbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CBhM7FF9u5QvV0vicKwt7/j6wjdB57A3Ftn0yg5M34M=;
        fh=L0g+o+KJh4smkCSVaEAN3NTtg17HtNLjcfuVFqdds1M=;
        b=q8gnvDgZLtfZOGssaj+xO9anb71KmV+M6kBStScW5jfIJhVMEQl+Gu9kr2kjBxi6fK
         dc6M5Hl1lS/XIDE8BXwXEnrMguHN54AemFo1BCGiFn4+4G6ob8m7AasVTAshHNhD4yPN
         ensuHRzg63wJVxHlelAQP9SsxWqTXSWXP6Q1UgCFqrN7QxQc+acwGTKNugykkI0LMeOm
         Nqa5DzVvNbLEQTcDWVT8A+PnzBEWaPzp69sCJNZT/P4npuJps/ue4EVOy1MTDKM/tJCs
         xYgUFxKpyojVFBA5ywkrDaBjDge8DRgkiGmUwAdOY2dOUUkmylLHf5nZ0kU8M2QeR9Cw
         +ZXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789944407; x=1790549207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CBhM7FF9u5QvV0vicKwt7/j6wjdB57A3Ftn0yg5M34M=;
        b=eoq+3hRs1kQoynUBih/8Uq//2Vv9SPQGAu1Mnt1a6vdS4C97xM9zcdfqtE3COdEYF1
         vqXGA7dkmM7BI75qVJYdrmCIRzy9F7hIP2waRCw9HYxOMhhQ1nCqBzWKoYfixPeI1TOr
         VTQLiezLXultZKrkH0dILhx7kWzz0A1gbvgigFeHq0dLpbOeZn5CNnVGUSFNdymSbZWS
         WBL3jMYOICOGx8eAh4YAKfnKFegm9gpFFJoQSV8PSZOtyMHbf3zjksoqS72Q0VlM6L4k
         TdACOGsBai93TCCki9oasAiBJWmVxyHXmxNNXhh0tclnOWQYkxYTewIXsAsYCHAJ8NSe
         /bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789944407; x=1790549207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBhM7FF9u5QvV0vicKwt7/j6wjdB57A3Ftn0yg5M34M=;
        b=WuNSsUI+P//0VSaV6DF9ix7mIzK266CVatQ4OnVCZQcmbsfF3wgMKUbUzbjXbOEKxV
         m4QpeWKyinUx50ormZwSg+l0vudbsgOk3x376io0/t17JluC/9yeQ6REVThk1Gdm1e5E
         cc7x1/tMEXOU4fJhRWrkr4lWq8Eksys67KdgTdvpegfHU2yzETBf2F/h7PSv634+7eJb
         ZyRqpcSfvv2LSYrLsyXUgV9HK95F1rcnQhxnbtKmlOPTR3t7MoshaR9Y7SiGpb3IkUig
         vOtDAlW8AhjFNCroz38ofMByedVIWP69x0Gzyn+oDx4JZW9o920nel9QGkQRsLjzbx4R
         sUyw==
X-Forwarded-Encrypted: i=1; AKwUvBxmC3Pjd6ZRK/Y+5xulkGcZ6rIh89aZA/bkCZUfRysdKQDCU1AEGsGu7Tk3oQzopgWDkLB/LwmXwMGsNjn9WQnC@lists.infradead.org
X-Gm-Message-State: AFuF++mKqxKBpgtgXCA+0vE27xQWZJcTbOq64UmHziQYIwInoXddA2bj
	XhlvGjZj27rc1SWGvpkd8AmJdogF7qr4BEwzEneAjfo2OZtgXnfn1Lcw1sw7ToVK0oOZcZDu+HL
	0jDfkpgc7yeZ+aiknkLJBzUqA20XxMiA=
X-Gm-Gg: AYBFou3OxdqzXrFnjqK+9IjIuh5jZ+2OfUCZ+v1NkdfsGbAbP+POVDTvsj6/aeGkuAj
	VAb+CY4o35/mgAwoyx/swqX4BlF7qSaQuFaDedL5vozCXOomGbE6hq0ciX44VIPYgAXFE+xnv94
	KfaeBQItFVsdI/43gF9klHZu8P7V5HDTZlEYmQ2109r6Bf43WxS0TBi0dhbE5il/NiTVyN2U5TM
	7TFaMKuPHIcD0krPpzOGyBxWIwLq7YHq3GtT4W4TGM6cXU4Gz7vPXt22xyti2gFeYyGQo75XNa+
	Ux5YnAfTrhjuwz8vl6ZHi7QqDJJbsvoe8PxBbsibzKIqaynPPS3S31s=
X-Received: by 2002:a05:6870:3207:b0:46a:d3e7:2552 with SMTP id
 586e51a60fabf-486e4e100b8mr8341437fac.1.1789944406853; Sun, 20 Sep 2026
 15:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com> <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
In-Reply-To: <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 20 Sep 2026 17:46:35 -0500
X-Gm-Features: AcwNN1VuA008vOMHnkJv-oCnQ1icxOOy2PmZx4D2aQIj4GV-3fDcHSdBhSxycls
Message-ID: <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260920_154648_303656_1B6F7F99 
X-CRM114-Status: GOOD (  58.34  )
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

Hi Doug,

On Sun, Sep 20, 2026 at 4:39=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
 >
> > > Imagine we have three clocks: They are: "clk_i2c1", "clk_i2c2", and
> > > "clk_spi". The "clk_i2c1" needs to be turned on when we're going to
> > > start an I2C transfer on I2C bus 1. "clk_i2c2" is the same but for th=
e
> > > I2C bus 2. "clk_spi" needs to be turned on when we want to start a a
> > > SPI transfer.
> > >
> > clk_prepare() is allowed to sleep, so any path, that includes the
> > call, can not be expected to have low or even deterministic latency.
>
> Sure. Essentially anything using a mailbox as a transport mechanism
> needs to be able to sleep, at least if it cares about "txdone". Even
> without a guaranteed latency, though, that doesn't mean we shouldn't
> try to reduce the latency.
>
>
> > > In the i2c/spi drivers, we've got "clk_prepare(clk)" calls to turn on
> > > the clocks. The three clocks are operated independently by their
> > > respective users. An I2C or SPI transfer may take place at any time.
> > > The I2C and SPI drivers need to know for sure when the clock has
> > > finished enabling because as soon as the clk_prepare() calls return
> > > they will start transferring.
> > >
> > > All three clocks are backed by a single clock driver. We'll call it
> > > the "clk_mailbox" driver. The "clk_mailbox" driver takes the request
> > > to turn on the clock and encodes it as a mailbox message to a remote
> > > processor. Let's imagine that the mailbox message looks like a 2-word
> > > transfer. The first word contains a 0 or a 1 for enable/disable and
> > > the second word contains the ID of the clock: 0 for "clk_i2c1", 1 for
> > > "clk_i2c2", and 2 for "clk_i3c3".
> > >
> > > Now, imagine that we want to turn on all three clocks simultaneously.
> >
> > Why? (not that it can't be done) I2C and SPI clients run independent
> > of each other.
>
> Right, the whole "independent" aspect is what I'm talking about. I'm
> not saying that we're _trying_ to do all three transfers at once, but
> just in the natural state of things there will be lots of clock calls
> going on at the system all independently of each other. That means
> it's likely there will be times when several clocks are enabled
> simultaneously.
>
>
> > > The "clk_mailbox" driver will see 3 calls to turn on the clocks and i=
t
> > > needs to convert those to messages to send the remote processor. It
> > > will then call mbox_send_message() to queue those messages with the
> > > mailbox controller. In other words, we'll see these three calls happe=
n
> > > nearly simultaneously:
> > >
> > > mbox_send_message(chan, &{0x1, 0x0});
> > > mbox_send_message(chan, &{0x1, 0x1});
> > > mbox_send_message(chan, &{0x1, 0x2});
> > >
> > > The LGA mailbox controller knows "txdone". That is, when the remote
> > > processor "acks" a message, the LGA mailbox controller can tell (and
> > > get an interrupt). This "ack" signals that the clock has finished
> > > enabling. This means that the "clk_mailbox" cannot run the state
> > > machine and it can't call "txdone" itself.
> > >
> > > Without my patches, when the above 3 mbox_send_message() calls are
> > > made, the first one will go straight to the LGA mailbox controller an=
d
> > > the second two will be queued up. Once the "txdone" for the first
> > > message arrives, we'll queue the second message. Once the "txdone" fo=
r
> > > the second message arrives, we'll queue the third message. This means
> > > that the messages are not being processed simultaneously. The third
> > > clk_prepare() call will be processed much more slowly since it has to
> > > wait in line. If we had 10 clocks enabling at the same time, the 10th
> > > clock could have a pretty significant wait.
> > >
> > > With my patches, the LGA mailbox controller is given the second and
> > > third message even though the first message isn't done yet. The LGA
> > > mailbox controller can queue the second and third messages even thoug=
h
> > > the txdone for the first message hasn't arrived yet. If things are
> > > fast enough, all three messages can be queued up before the remote
> > > processor has even started processing the first one. The remote
> > > processor can process all three messages concurrently and acknowledge
> > > all three at once. The LGA mailbox controller can get a single
> > > interrupt representing all three "txdone" ACKs and call "txdone" for
> > > all three messages simultaneously.
> > >
> > If your remote (host) can actually act on multiple requests parallely,
> > you need a way to map ACKs back onto the requests. Currently you
> > don't.
> > Looking at the goog_mba_handle_tx_interrupt() implementation, consider
> > the situation when 5 requests are submitted in the h/w fifo and 3 are
> > reported ACKed by the interrupt after some time.
> > You assume the three done are the first three -- which implies that
> > the remote handles requests in the order they arrive i.e, serially.
> > Otherwise, say, request-1 may be wrongly completed if the ACKs were
> > for requests 2, 3 & 4.
> > So it seems mostly an illusion of parallelism - remote is acting on
> > requests (or atleast sending ACKs) serially.
>
> It's more than an illusion because all of the slow paths are
> parallelized. For the remote processor, I believe that turning on a
> clock is trivially easy: just set a bit. The slow parts are the
> interrupt arriving on the remote processor and the interrupt arriving
> on the Linux processor. Those _are_ parallelized. During a single
> interrupt, we can see and process multiple mailbox messges (or
> multiple mailbox ACKs). I can paste the example I gave earlier. Just
> as you say, interrupts are processed and acted on serially. ...but
> because we can parallelize the interrupt handling we still get the win
> because interrupt latency is much worse than any of the actual work
> that needs to be done.
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
> The numbers here for interrupt latency are made up for my example and
> I haven't personally measured them, but I think it's not completely
> absurd to say that interrupt latency (on both the Linux and remote
> sides) dominates the communication path.
>
Yes, the numbers do look biased. It takes 50us for remote to get the
irq and act upon it before ACKing but it takes 100us for that ACK to
get back.
And the benefit will be hard to achieve - it involves three unrelated
clk_prepare() requests done within 50us often enough. When the stars
align you save 300us on a clk_prepare()

It feels you are trying to optimize a non-issue. clk_prepare() is
expected to be slow and anyways shouldn't be frequent enough from all
devices to give noticeable benefit.

If you do have some real numbers and think it is worth it on your
platform, then maybe expose each doorbell/shm-slot as a generic
channel. clk_mailbox will request a generic channel, do the request
and free it. The same effect but without inventing a new api. I can
share a draft if you want, but I suggest let's not make things
complicated without proven benefit.

> > We can keep the core
> > unchanged and the driver much simpler if we simply use the buffering
> > in the core.
>
> FWIW, the driver will need to contain the queuing complexity
> regardless. This is because the remote processor expects queuing. Even
> if we don't queue at the Linux level, the driver still needs to know
> if the remote side uses a "queuing protocol." This is because the
> remote side expects the shared memory to be partitioned into chunks
> and that we must move onto the next chunk between messages.
>
My first concern is to avoid implanting a yet another path of sending
messages and second is to keep drivers simple if they can.

Regards,
Jassi

