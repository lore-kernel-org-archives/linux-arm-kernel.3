Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A498CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=; b=nIJG8e7U1vjv+PHBXXxFo4engg
	eaBODDfbllxO1iVFJOMUDfG2zMso4KBT7t/ym/3ov70JM+76RUSD3RdDmiyLeWMmL7k0lzHTDlG8X
	rHuniD2WooA9zLpY2CYk78aGWCZz0w4EcokrUlHxOKiinpl1DmhseTpL0eOdMjuNnvHHhAAEwBLCe
	98BzdxBk83NBcTG/H/dtRqT130C8YohnN8eawJzQ7zWh4P27ka4a7RxjXyrDXFP9COokOQQ5FfvrD
	FsXeqetkmweqY4GS/ZsO9DsUOPdd037QiWWatrZGTvOpnpMn2ouomSk/62w33z8hpP/dlUk7y0CFT
	Fmm9uNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKj1-0000000BEBQ-2sQU;
	Mon, 12 Oct 2026 18:26:15 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKiz-0000000BEAI-0nCI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:26:14 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-78fb1fb9508so3757637137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829572; cv=none;
        d=google.com; s=arc-20260327;
        b=sY3Zjk3zGNfuXg7EfiQrVkuoR3NkrEmUHKL9MqWWKboibPI6ATxeIBlyfmIOSAdRJ/
         grRf6rnOusVOTdyiYPjHwyz8TYP68l8gF4iVHmep5s33njJOFAlM4quqm+tfl8KtaMq6
         Ye+FH7c8D6UFVA7W8DdzYUVUUCNL353uPQHXbsOMJp8KFc3tk36bdMTq5+fJnl/MYVYJ
         KeUdcFHt5mdaF2Btkvq6bmK2QkY+rtGWCOCUuTCvQftNEep96xW1f8PJOcsBc4bsnhu9
         xLfr2qQxP2q9BcQVxcOoWXxjRDq+YaMGgAFc8B5ui/HLl+zWsTl1Nvt8BdvNS/wq9HU4
         euZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        fh=XNwJmNttPznPlkJdW5uOrQ8JMbgN3U0s4AJm8fGjn+k=;
        b=V2CpgMEERj/UvRAbuCypLpwIdylETs0ZsmFiwnTLzSFx2hY+PCs632eZ/Sq/avCGWs
         12mtoTQMj4AFL1EcGmVQhgUB2PYhxQDir2Ed9fyvl4ba5dKqqVUbJEpOp5f0GA145gPP
         qBYZ4usKUQPYZlwqehgzsFY3IcLM2gLUSywBVEk0LL/JXoyXTJnbn7iaGkpu2k1k5mpf
         dW0+dknUAg/YltEOw4cOOn1qk4Oqlp2fjAqy33Uls0h2g+Sf8C1796i9cSnQCR99+iyp
         Z0uhoz/n7oszUyP9B2+6n6pvOEM8wqAENu0je1np1vDUB5h65trjmzRmdA+QWzxmQ/fF
         2bdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829572; x=1792434372; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        b=VcI0MkVdN8a7DSww9jnTv9fx+ZNa56aI3011lIheW6togsat4whoXd9tCDPBbTJT0E
         wDh2V1PX1kxkDifbY2LIp+bcobp6NpYpt9TBANvVYea087VWiheRMteams51HLhmGzi4
         mS/TCHiGdP9VNrA0fJX9PyHJuCqei9W9y1Xj6juVlYgifZrQiDWs/nzav/p8gOp58/97
         mcrTClgMT2N4iYufZMlBZRV8GLigQ43nelwq4p5bx8S2LtgL/o+2BR5td6oBsvetcw6l
         Gy8urMZUcUyd9yONJrgyhM+LZy+bQtwXHAoAdN0gotUAKfIPevE1klgn8H7vXT62JywP
         Dk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829572; x=1792434372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        b=hd3/m5xx+gtCg3B5U9VDvsOw6FchTaF+9t2inX5HfhEpZIPwxdwDXP74Dxw1W8jyFg
         ctV95gvoLxWNSO7iqiTTGs0LosUxUJ7i+lwCmaYWg3UtFjUIjoA0IJnY5Kw36enxIIsO
         GURVDkpPVWl6CXcf/l/vCUCgD7/1JTdjDxOKAMXRaE4wCk2IXABr7139GzTD+MqRqO0M
         Gqiu/tQ4m1mgA8gZ/kKE5DbXHKOeMhofBqbZJ66ficnbHZEwe96cKoaK2sfybqG0GVSi
         KfXZnOOdn0XB1znvJJZ4KaIgUWQu8Szw4s3K/YBRYjoazxza0w0QUHZZPruNQtQ3jkij
         s0NQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3svmrd6PARGIk1ot1z8rwdahUMTCXXeQ3ZyWFykGq2rq0xBvBn5blalTlhR0V10MGNMYo0r7sNNOkAFeYA67G@lists.infradead.org
X-Gm-Message-State: AFq9FYI+CIqzXuN2P+pgpJiBLBgSXZaqHtTYsUoRZb747iDmu6sj8NWa
	/t+PH4AduH5bzc9Yb+vZ9n3Ji+0+CfWkr2/v8mcxD9aYoDV0rTeIGcaGCoLllKUPwVws3EX1NmK
	/dVC32zzppRdryHZ8u3/fDS7u35Jp5W0=
X-Gm-Gg: AYBFou301nRxXbc9IMJnvJmmUpvsgWnLAfF64xzLEEMvkTpxE3BXWcI3WOtUG8vaUp3
	NjN4zL3mNfgwLzNpgDuXyoH5yIDc2A5W6H5HudTITMmrp0Iu50DjmJaT6DG8lyj1Dtu2SXhbWSG
	isGlgMRqzsjpCMAXgNMvAjXNeREHirCEnAoa7Q5GI6XWs+SiMc57qrzGNk7Z2DG29yu7KhRsykf
	FI3zugH53RpQXA7ed6X//DZ14B845vBoKDfFZjnnAIJ6QWy1yfgyT3lNHqSpW88ukKJkXVvtPAZ
	/U9Jbl4cLT/4btNzCrsRXJt8EUaPRTL7ViSPgLsBbGXAMMy9oSYwuy6//o77bUEcmLfKwX+9h/K
	G+udkwIwwbXtbXC0mKiu/5aSuuUMRSCMtI82z8YmXk5wlGvQjzAxbPfSzgd3dVbBAxqT3Pygro1
	yQnJjrnFUpEEtSW603o/D3aTl1fI75JKKVVJiIT2XH8dgz
X-Received: by 2002:a05:6102:370f:b0:798:24e8:23f4 with SMTP id
 ada2fe7eead31-7cb42a03e2dmr2294757137.7.1791829571647; Mon, 12 Oct 2026
 11:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com> <8733ua23xs.fsf@bootlin.com>
In-Reply-To: <8733ua23xs.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 12:26:00 -0600
X-Gm-Features: AclHuK-YE9EZvdISkdO2ItcawmmP4G9wFY0yyJFRi71wZBtPLVkiWianJdKsR5A
Message-ID: <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261012_112613_255001_6E616AEE 
X-CRM114-Status: GOOD (  42.51  )
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

On Mon, Oct 12, 2026 at 12:02=E2=80=AFPM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:47 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > A timed-out wait can return while the interrupt handler is still using
> > the previous operation's interrupt status and enable mask. Starting the
> > next wait calls init_completion() on the same object, which can reset i=
ts
> > waitqueue lock while the old handler calls complete(). The old handler
> > can also complete the new wait or restore an obsolete interrupt mask.
> >
> > Initialize the completion once in probe and use reinit_completion() for
> > each interrupt-driven wait. On timeout, disable and synchronize the IRQ
> > before masking controller interrupts and acknowledging the waited-for
> > events. Draining the handler first also prevents a partial-event handle=
r
> > from rewriting the enable mask after it has been cleared. Flush these
> > register writes before re-enabling the IRQ line, leaving the controller=
's
> > interrupt sources masked.
> >
> > For successful waits, move complete() after the handler's register upda=
tes
> > so that the next operation cannot race with those updates. Keep polling
> > unchanged and leave controller and DMA abort handling to the existing
> > callers.
> >
> > Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller suppor=
t")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> So from the commit log I understand that you are fixing a race. The
> problem seems legitimate.
>
> >  drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
> >  1 file changed, 20 insertions(+), 6 deletions(-)
> >
>
> ...
>
> > @@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, v=
oid *dev_id)
> >       if (!(ien & st))
> >               return IRQ_NONE;
> >
> > -     if ((ien & st) =3D=3D ien)
> > -             complete(&nfc->complete);
> > -
> > +     /* Finish updating the interrupt state before waking the next ope=
ration. */
> >       writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
> >       writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
> >
> > +     if ((ien & st) =3D=3D ien)
> > +             complete(&nfc->complete);
> > +
> >       return IRQ_HANDLED;
> >  }
> >
> > @@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc=
 *nfc, u32 events,
> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
> >
> >       if (!use_polling) {
> > -             init_completion(&nfc->complete);
> > +             reinit_completion(&nfc->complete);
>
> The whole change around (re)init_completion looks relevant (here and in t=
he handler).
>
> >
> >               writel(events, nfc->regs + NFC_REG_INT);
> >               ret =3D wait_for_completion_timeout(&nfc->complete,
> >                                               msecs_to_jiffies(timeout_=
ms));
> > -             if (!ret)
> > +             if (!ret) {
> > +                     /* Drain the handler before it can restore an old=
 IRQ mask. */
> > +                     disable_irq(nfc->irq);
>
> disable_irq() for serializing accesses to a single register?

The intention was to drain an in-flight handler before cleaning up the
timed-out wait, rather than just serialize the register write.
disable_irq() provides that synchronization as well as masking the line.
It is only used on timeout, and this IRQ is requested without IRQF_SHARED.

A spinlock could also address this, provided it covers the handler's
status/enable reads through complete(), together with the waiter's
cleanup and rearming. Protecting only the register writes would leave
the handler able to act on an old snapshot.

> It
> certainly works but I don't think it is so common to use it like that,
> for such simple cases. Typically in this case I would have used a
> spinlock maybe? Or even better, why not just avoid the race entirely
> and handle the register in the waiter?

One detail to account for is that the MBUS DMA path waits for both
NFC_CMD_INT_FLAG and NFC_DMA_INT_FLAG. The handler currently acknowledges
and masks each event as it arrives, leaving the remaining event enabled
until both have completed.

Moving the register handling to the waiter would therefore need to
preserve partial-event tracking and avoid leaving an asserted interrupt
source enabled while waiting for the task to run.

> You certainly don't need to write
> it in the IRQ handler. You can handle the IRQ configuration at the
> device level, which will also prevent the need for your extra
> readl "barrier" before enabling the IRQ.
>
> Furthermore, now that I have a better understanding, re-reading the
> commit log, I now disagree with the first part of:
>
> >The old handler can also complete the new wait or restore an obsolete in=
terrupt mask.
>
> "complete the new wait"? I don't see how a stale handler completes the
> next wait given the handler is a hard IRQ and the interrupt enable
> register is cleared on timeout.

The case I had in mind is an already-running handler on another CPU:

CPU 0: Read st and ien for operation A.
CPU 1: Time out operation A, mask/acknowledge its interrupts,
       then eventually reinitialize the completion for operation B.
CPU 0: Call complete() based on the saved st and ien from operation A.

Clearing the device's enable register does not invalidate those local
values or wait for the running handler to finish. Hard-IRQ context
prevents this overlap on the same CPU, but not across CPUs.

That distinction was not explicit enough in the commit message. I'm
open to a different implementation; the requirement I wanted to preserve
is that the old handler cannot update the mask or signal the completion
after the waiter has cleaned up and reused it.

>
> Thanks,
> Miqu=C3=A8l

