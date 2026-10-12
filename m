Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522B4CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=; b=if4mycnNLcGfWo5AInlLdXblC+
	qr7BZ1vzeBwLC8uXjgfQqE6oNJ84YXj5oV+UF614hvCXsHT24tJZ/PyV63RCjv9YrkhHPF32mOxm9
	+cfxl0nnyEyZgH1MmbtbVbFh785zhI6aRryXzO6ddqelyJ9LgvE5en94V79/p5EX+JJ7KnHdORoQR
	gL/4roLM9ceuGN0DHNPk1uUlCDzAWAVq+lFOy3TkyxsQa+6i9bv/RYqDCGXKrQQpaBcME5KBXfHYt
	DeD+G6ovLUZNrEixZ562bH860ZdbWXP47h6TL3WCUg8xGJY7m/POJ6OgKBk6bosQmGX+Fe+Tf3Gd4
	0T6x9yVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLWm-0000000BN0w-0LGu;
	Mon, 12 Oct 2026 19:17:40 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLWi-0000000BMz9-02KD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:17:37 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-7c1ecff2b1fso574015137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791832655; cv=none;
        d=google.com; s=arc-20260327;
        b=SIOIhI9zpOFsw+bYLZfQ/AV9NdVPVH9g5eqOJcIujs3OFj79oIMe2v/vFLKyrMU1AS
         EezT/lwdgDmboL2oqlWx6HT7WtcvNKCLjFo7xIEDocr9bSiJbAIoQEgXriURRPM5HLe7
         2e3Lchje8D/TC1DS6TTFgxgVHznvZKzoIT2uipYl/KebFhUY9G3s3SbvezIN3vwsWJ7L
         5dQaV8Jh4VLpUyqPEzXOHnwoq23odgU3BxPweqZt/1o1is3HyoVy+r7lgtIV6Iy/YMJ3
         GxPqsDjV3bQSrRKsOwZMwg/0qI+Jmj0/A2fQBdXQUtEKDgBBXZQ29XOII1vbi/dAEB1C
         eQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        fh=vEtqA/eyxDjIA5t85/IYAPpF431aR7/nTXuJfm3mwBs=;
        b=EwzAYc+3P780Y46LKExu0q6KascgxuaZkMK5W3TCweEEzPHWJhpQ4p4XNnRmiIn0hR
         fmnB5igxM21RjBM9we+KsLeaFIJkjLFTjkdxPtAKK3Lgn5Y1CTHIpPmz3XyJOzbJyWxm
         pCJ6yQbLn0p4gK/G5DmcCgnEpFKkj9fUSJOddtWnxS+UYiPpwbBdbJOyPWqvL93BpDnb
         s0aMZawcMtlz2guzp1L66G+9xgyX1NOoSb2Ml6SxDclAK/vWHHeM9b27jHLHiRzi+HHl
         pWQQYUxvxJRO3hcdZ9Ks11TT/wgq9/i4nHM/0OXO1zRi9ej+GYyq2i2BG0z8p0jwTxYo
         Zhvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832655; x=1792437455; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        b=GtJgfcYnR3OpaSAaF3j+b5tya0oZffzqVvXNiQmcMio45Juhl/bb64kqJuKKzUgrJ3
         eEYAsGVeBophng1vwpGZOw0Rto6VaNO2OAEC0BPCis+GTGzSvFYJhUltgRry3d8/twzo
         05VoSPTQbyrRRRNuVnS6d4snUwgZbkeaXrJFATy7Hwt19iG29FnZn2BJSFFW5lD2Ajfp
         lsC00u7nc7KX4vG+INDYYTuQlZXxsp64pmTNGNZFfb8Ez/7Is6dHQjH8XytEHhF2/YDY
         WmdKAn+FpRSZJi+v6akI/nKeOoztdRIh8IWVyOFCeAcPsZKfSJQ/bqe7Lvoql6K/ObqA
         KXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832655; x=1792437455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        b=GPMbqkwFiFlcYuKTSEhGsK4NhN6UPG6hWZyFnMaPNCvaqzJ6JE525tgMGbUVRctwkF
         hUnHNrWU6j58QOkCaXyajPyDLZp1NjYg1mzEijzquIqaudsJjhrao3VVvkNSOPHlS8DX
         przaDpWjCbN5WdNL7Q8vCW7pJViwlCSnTkB5ywhoeyHb6LpFkyOhIfquRQDXrs1Tp6yP
         LWvo5F2A8MemfYKcbu5Da1aySXvlqK2gnxGI03ryUudP1B6PbHGuhCmJtIjr01FDajox
         Y23EyOvTL+FS1X5HrZfCwPme6GTG/+3lzB4wJpvaOXM+ga0eWlKekSeUVdewY4gBarqm
         rEbQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9MJUFvIjcmSreL8ukiS5jeD/dBWkYP64r1TdfXr2CNZRzOPbpQ72YWgYur3ptrIPNJd8W15oz8LyC3PcF/+ND@lists.infradead.org
X-Gm-Message-State: AFq9FYKVjVZYoGOWxJuVmr4gvAWHXY8NqHjd1GDYenDEZvwvGl8aK00G
	P7OluTWYEZcvZaHFpcziwzEi1oEUK7oBkZx7Oq3fiSQHmpB15VocgqKsrtZ3LXxAul5wK80TWeJ
	DQveZj/TNNJ/uekGso+N7W/NVUhkfQa4=
X-Gm-Gg: AYBFou1gvRmG96kxRYxIb50EFk3k32tiGdgpO2xcUYG4/2ErbIn2bOyWustgLU7Ooe8
	e2ZUBIGvw9xskCCVkEJ4zwpijK80MWU7rrK+K4zrsbEY0xcIQ8mXPH4sFufKMIOVAOST6bNAHo3
	9npoqEt4kpal0AlZzOWh7MBCzh4XF/NO8OnUD6ul+w7YJrFvkEEegLZBAblzBY+bhQvflnftOWx
	jKT8G8F/WsV/m/lnplhX4C4D0Co/fbhtLtZ6H9k5rVB3Wx1LAxe0vlnPgzvRALhUQKtMz1hj67w
	71Af1gGiNheMb2F/PwiwCnUloy1LJRxs6ZUi63xEp0p9rPVBran95Aa7JtcFcvRtcmVeFTKnRvh
	obvNuWfzostemsF9SBzS2MHaCPJkg7j9qNQGoompVqG21pIzun8M7KeAWdMvij5JdpAaOiE+/bI
	aYe5f/2CnwsO9IW0PlZMnFrmavHln5D7rnbw7IvS6BYZ0v
X-Received: by 2002:a05:6102:6c7:b0:7c1:8aa5:36d6 with SMTP id
 ada2fe7eead31-7cb372821a6mr2739066137.11.1791832654562; Mon, 12 Oct 2026
 12:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
 <8733ua23xs.fsf@bootlin.com> <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
 <877bjmzqkr.fsf@bootlin.com>
In-Reply-To: <877bjmzqkr.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 13:17:23 -0600
X-Gm-Features: AclHuK_F8iNKqf1C4Ki3QntMVw0O_GSO7mPk67Uyart16gEEmw2VFpP4md4WlVw
Message-ID: <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_121736_070121_D3697AF2 
X-CRM114-Status: GOOD (  49.73  )
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

On Mon, Oct 12, 2026 at 1:06=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 12/10/2026 at 12:26:00 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > On Mon, Oct 12, 2026 at 12:02=E2=80=AFPM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> >>
> >> Hi James,
> >>
> >> On 14/09/2026 at 15:09:47 -06, James Hilliard <james.hilliard1@gmail.c=
om> wrote:
> >>
> >> > A timed-out wait can return while the interrupt handler is still usi=
ng
> >> > the previous operation's interrupt status and enable mask. Starting =
the
> >> > next wait calls init_completion() on the same object, which can rese=
t its
> >> > waitqueue lock while the old handler calls complete(). The old handl=
er
> >> > can also complete the new wait or restore an obsolete interrupt mask=
.
> >> >
> >> > Initialize the completion once in probe and use reinit_completion() =
for
> >> > each interrupt-driven wait. On timeout, disable and synchronize the =
IRQ
> >> > before masking controller interrupts and acknowledging the waited-fo=
r
> >> > events. Draining the handler first also prevents a partial-event han=
dler
> >> > from rewriting the enable mask after it has been cleared. Flush thes=
e
> >> > register writes before re-enabling the IRQ line, leaving the control=
ler's
> >> > interrupt sources masked.
> >> >
> >> > For successful waits, move complete() after the handler's register u=
pdates
> >> > so that the next operation cannot race with those updates. Keep poll=
ing
> >> > unchanged and leave controller and DMA abort handling to the existin=
g
> >> > callers.
> >> >
> >> > Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller sup=
port")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >> > ---
> >>
> >> So from the commit log I understand that you are fixing a race. The
> >> problem seems legitimate.
> >>
> >> >  drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
> >> >  1 file changed, 20 insertions(+), 6 deletions(-)
> >> >
> >>
> >> ...
> >>
> >> > @@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq=
, void *dev_id)
> >> >       if (!(ien & st))
> >> >               return IRQ_NONE;
> >> >
> >> > -     if ((ien & st) =3D=3D ien)
> >> > -             complete(&nfc->complete);
> >> > -
> >> > +     /* Finish updating the interrupt state before waking the next =
operation. */
> >> >       writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
> >> >       writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
> >> >
> >> > +     if ((ien & st) =3D=3D ien)
> >> > +             complete(&nfc->complete);
> >> > +
> >> >       return IRQ_HANDLED;
> >> >  }
> >> >
> >> > @@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_=
nfc *nfc, u32 events,
> >> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
> >> >
> >> >       if (!use_polling) {
> >> > -             init_completion(&nfc->complete);
> >> > +             reinit_completion(&nfc->complete);
> >>
> >> The whole change around (re)init_completion looks relevant (here and i=
n the handler).
> >>
> >> >
> >> >               writel(events, nfc->regs + NFC_REG_INT);
> >> >               ret =3D wait_for_completion_timeout(&nfc->complete,
> >> >                                               msecs_to_jiffies(timeo=
ut_ms));
> >> > -             if (!ret)
> >> > +             if (!ret) {
> >> > +                     /* Drain the handler before it can restore an =
old IRQ mask. */
> >> > +                     disable_irq(nfc->irq);
> >>
> >> disable_irq() for serializing accesses to a single register?
> >
> > The intention was to drain an in-flight handler before cleaning up the
> > timed-out wait, rather than just serialize the register write.
>
> I guess here you relate to the race explained below.
>
> > disable_irq() provides that synchronization as well as masking the line=
.
> > It is only used on timeout, and this IRQ is requested without
> > IRQF_SHARED.
>
> This is clearly debatable, since we can identify the IRQ, that flag
> could (should, maybe) have been set. With your approach it would have
> been even more impacting. But that's not the point.

Agreed. I mentioned this to describe the current registration, not to
rule out IRQ sharing.

> > A spinlock could also address this, provided it covers the handler's
> > status/enable reads through complete(), together with the waiter's
> > cleanup and rearming. Protecting only the register writes would leave
> > the handler able to act on an old snapshot.
>
> I'm not sure what you call "only the register writes", you can call
> complete() from within the lock if that makes sense for this case,
> yes. complete() does not block so it is fine.

Yes, agreed. I meant that protecting just the writel() calls would leave
the snapshot unprotected. A lock covering the handler's st/ien reads
through the register updates and complete(), with matching protection
in the waiter's cleanup and rearming, would address that.

>
> ...
>
> >> commit log, I now disagree with the first part of:
> >>
> >> >The old handler can also complete the new wait or restore an obsolete=
 interrupt mask.
> >>
> >> "complete the new wait"? I don't see how a stale handler completes the
> >> next wait given the handler is a hard IRQ and the interrupt enable
> >> register is cleared on timeout.
> >
> > The case I had in mind is an already-running handler on another CPU:
> >
> > CPU 0: Read st and ien for operation A.
> > CPU 1: Time out operation A, mask/acknowledge its interrupts,
> >        then eventually reinitialize the completion for operation B.
> > CPU 0: Call complete() based on the saved st and ien from operation A.
>
> For this to fire, the hard IRQ handler on CPU0 would have to be stopped
> between reading st/ien and calling complete() long enough to span:
> - A's timeout
> - A's cleanup
> - B's wait being rearmed
> On this hardware, how is this reachable?

CONFIG_PREEMPT_RT provides a concrete mechanism. The driver requests this
IRQ with flags =3D 0, without IRQF_NO_THREAD, so the handler is
forced-threaded. A higher-priority task can preempt that IRQ thread
after it reads st/ien:

CPU0: The IRQ thread reads st/ien for A and is then preempted.
CPU1: A's wait times out, performs cleanup, and eventually reinitializes
    the completion and rearms the wait for B.
CPU0: The IRQ thread resumes and calls complete() using A's snapshot.

Clearing the controller's interrupt-enable register on CPU1 does not
cancel the running IRQ thread or invalidate its saved values. The late
complete() therefore acts on the completion now being used for B.

This does not require a prolonged non-preemptible hard IRQ or a hardware
stall.

>
> > Clearing the device's enable register does not invalidate those local
> > values or wait for the running handler to finish. Hard-IRQ context
> > prevents this overlap on the same CPU, but not across CPUs.
> >
> > That distinction was not explicit enough in the commit message. I'm
> > open to a different implementation; the requirement I wanted to preserv=
e
> > is that the old handler cannot update the mask or signal the completion
> > after the waiter has cleaned up and reused it.
>
> Miqu=C3=A8l

