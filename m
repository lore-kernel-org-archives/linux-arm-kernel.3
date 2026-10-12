Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D472CCA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw7bv2pnfae4cMWiRM1MW1DbGUPZqrWolE0VMUTTkds=; b=TNpB8KtF0HjaKwnT4fSXtjZnSP
	WseB9e2ENRNyVW2pDEIhj+3z+xVdoDOgwYHsQ3dPwGpLsHbfFrhv0CljcfvOTIwhwBVPptYnUUMh1
	yuYkNlZ2DpMjgpFBeQUMS53Ald405vqwgna1moFWkXQU1xyha1/GELMmwrY2LLnh7w8sQDXcck2X7
	Utth/91b1eiC+fDgcphTfRV+uCLyMam96SrMjb7NgiVuakhUpuC2qyu4Wd1V7Dth9M0O7AB7pFP0j
	VMr5o2aASKgOGLVAnYLGWal7iOzo9gCZAu/jCTR4xPz9oIoeUPZS8sfRrqdojKH4JAnM9RuA9Yff7
	1mGpL1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLMI-0000000BLn0-1phH;
	Mon, 12 Oct 2026 19:06:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLME-0000000BLli-1dYq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:06:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E1D24E411FE;
	Mon, 12 Oct 2026 19:06:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2603C601A6;
	Mon, 12 Oct 2026 19:06:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFFD411D70CA7;
	Mon, 12 Oct 2026 21:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791831996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bw7bv2pnfae4cMWiRM1MW1DbGUPZqrWolE0VMUTTkds=;
	b=vS3NyB/2AQirlZc3zwonhlMtCW4/+Tm5UyQ7Um01rVmMrRno6RPzmzdCh8FU2cjHcaW3Th
	5uHwUXZRnhNN+3Cnipgeglik203ebVueIHnAIS4Hdssa3eZ9OSIENz9o4BHC3Pl0W9YKh1
	ne1qHRrPxjWs35WdViC8YO02zulN+MPqxYAUsTBHzZdQnrFaJL8K6+Dq6Wtr283XK1AFos
	WWDG4W+AMdAIsRWfVef557tOkwe5WQNGfxMhePfq0y2CeEusWB8KA6k1vUaPBkidP1enHT
	iPPJK8u8FDOfHxS8g3M7M0oVbJvFQ52fVNjzQIIX4EsLCpXM82TAyDtK9a84Gw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
In-Reply-To: <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
	(James Hilliard's message of "Mon, 12 Oct 2026 12:26:00 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	<20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
	<8733ua23xs.fsf@bootlin.com>
	<CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 21:06:28 +0200
Message-ID: <877bjmzqkr.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_120646_717000_44841A1E 
X-CRM114-Status: GOOD (  38.38  )
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

On 12/10/2026 at 12:26:00 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> On Mon, Oct 12, 2026 at 12:02=E2=80=AFPM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
>>
>> Hi James,
>>
>> On 14/09/2026 at 15:09:47 -06, James Hilliard <james.hilliard1@gmail.com=
> wrote:
>>
>> > A timed-out wait can return while the interrupt handler is still using
>> > the previous operation's interrupt status and enable mask. Starting the
>> > next wait calls init_completion() on the same object, which can reset =
its
>> > waitqueue lock while the old handler calls complete(). The old handler
>> > can also complete the new wait or restore an obsolete interrupt mask.
>> >
>> > Initialize the completion once in probe and use reinit_completion() for
>> > each interrupt-driven wait. On timeout, disable and synchronize the IRQ
>> > before masking controller interrupts and acknowledging the waited-for
>> > events. Draining the handler first also prevents a partial-event handl=
er
>> > from rewriting the enable mask after it has been cleared. Flush these
>> > register writes before re-enabling the IRQ line, leaving the controlle=
r's
>> > interrupt sources masked.
>> >
>> > For successful waits, move complete() after the handler's register upd=
ates
>> > so that the next operation cannot race with those updates. Keep polling
>> > unchanged and leave controller and DMA abort handling to the existing
>> > callers.
>> >
>> > Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller suppo=
rt")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> > ---
>>
>> So from the commit log I understand that you are fixing a race. The
>> problem seems legitimate.
>>
>> >  drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
>> >  1 file changed, 20 insertions(+), 6 deletions(-)
>> >
>>
>> ...
>>
>> > @@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, =
void *dev_id)
>> >       if (!(ien & st))
>> >               return IRQ_NONE;
>> >
>> > -     if ((ien & st) =3D=3D ien)
>> > -             complete(&nfc->complete);
>> > -
>> > +     /* Finish updating the interrupt state before waking the next op=
eration. */
>> >       writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
>> >       writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
>> >
>> > +     if ((ien & st) =3D=3D ien)
>> > +             complete(&nfc->complete);
>> > +
>> >       return IRQ_HANDLED;
>> >  }
>> >
>> > @@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nf=
c *nfc, u32 events,
>> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
>> >
>> >       if (!use_polling) {
>> > -             init_completion(&nfc->complete);
>> > +             reinit_completion(&nfc->complete);
>>
>> The whole change around (re)init_completion looks relevant (here and in =
the handler).
>>
>> >
>> >               writel(events, nfc->regs + NFC_REG_INT);
>> >               ret =3D wait_for_completion_timeout(&nfc->complete,
>> >                                               msecs_to_jiffies(timeout=
_ms));
>> > -             if (!ret)
>> > +             if (!ret) {
>> > +                     /* Drain the handler before it can restore an ol=
d IRQ mask. */
>> > +                     disable_irq(nfc->irq);
>>
>> disable_irq() for serializing accesses to a single register?
>
> The intention was to drain an in-flight handler before cleaning up the
> timed-out wait, rather than just serialize the register write.

I guess here you relate to the race explained below.

> disable_irq() provides that synchronization as well as masking the line.
> It is only used on timeout, and this IRQ is requested without
> IRQF_SHARED.

This is clearly debatable, since we can identify the IRQ, that flag
could (should, maybe) have been set. With your approach it would have
been even more impacting. But that's not the point.

> A spinlock could also address this, provided it covers the handler's
> status/enable reads through complete(), together with the waiter's
> cleanup and rearming. Protecting only the register writes would leave
> the handler able to act on an old snapshot.

I'm not sure what you call "only the register writes", you can call
complete() from within the lock if that makes sense for this case,
yes. complete() does not block so it is fine.

...

>> commit log, I now disagree with the first part of:
>>
>> >The old handler can also complete the new wait or restore an obsolete i=
nterrupt mask.
>>
>> "complete the new wait"? I don't see how a stale handler completes the
>> next wait given the handler is a hard IRQ and the interrupt enable
>> register is cleared on timeout.
>
> The case I had in mind is an already-running handler on another CPU:
>
> CPU 0: Read st and ien for operation A.
> CPU 1: Time out operation A, mask/acknowledge its interrupts,
>        then eventually reinitialize the completion for operation B.
> CPU 0: Call complete() based on the saved st and ien from operation A.

For this to fire, the hard IRQ handler on CPU0 would have to be stopped
between reading st/ien and calling complete() long enough to span:
- A's timeout
- A's cleanup
- B's wait being rearmed
On this hardware, how is this reachable?

> Clearing the device's enable register does not invalidate those local
> values or wait for the running handler to finish. Hard-IRQ context
> prevents this overlap on the same CPU, but not across CPUs.
>
> That distinction was not explicit enough in the commit message. I'm
> open to a different implementation; the requirement I wanted to preserve
> is that the old handler cannot update the mask or signal the completion
> after the waiter has cleaned up and reused it.

Miqu=C3=A8l

