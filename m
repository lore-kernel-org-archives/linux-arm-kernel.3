Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6393C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54Dj02k3uul5TPtw9U5JIJjN3eOpWu3nQg9JkvEUFro=; b=w5X1lf+42SYT5MhrSFREiJeRG4
	gZGKRhHElRoHLHE6ZrwhTwXXwjqpf593GGGdBREInnWi/olY/uYBB/mS312M0q7zBqK1US4g/6oIC
	fxOJGY0gzNaWACtu0oov4MIrTVpuRmRXy6iiN9U+2Z8Rpg6TPKWLpjcXZIGerhvgzNEU4nALhVras
	JkyDI31ZtCP370hUV9Hhhrt5Oh1vXw5z64srrmfqPwkcnrecuA+xispF9hmDd1bam/gqp6cJeTiPy
	+A2pdYaHqkC5zI3j/sX8GJ58Cs9OJo7Z4xo/s7dQpYmC7bsQJLoMXHNi/6lz1ljK0uoMWrfKf2+Yk
	2pPWp5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqG7-00000002rab-0Q8c;
	Thu, 09 Jul 2026 15:01:51 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqG5-00000002rZq-08AI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:01:50 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6a2c1edb210so259915eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783609308; cv=none;
        d=google.com; s=arc-20260327;
        b=XvJc8ifcTMVXq4vTK9gsPxj0CbEmJp1KKuC/RR7T70j465/axx7+7xYgrZ7UH8KLEC
         NlhQMA/R5+91fvlEDPlN7Fsm4QkGa6jriq/csD4G1+egrhNG4go6rUU1ygcoRsJLz61v
         VIvSEBKGa61Kq4Nvlyj8RBSGyqgmZiQIJCagZSXvjO64dTKA1FgUn9AfTSTInpN55Ltl
         Mz0I0GOgckcthZSjlUn3FlkVSCLag45buru7VVnEMTgDAAHgPp8pobz/QR13YGwLlynK
         LlYTlm1RJAPUotKAQ2y+C1Nv+LeUGr3g3uv11Pb50Wv52KXlCRKvBLhlCBxihdB72319
         bTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=54Dj02k3uul5TPtw9U5JIJjN3eOpWu3nQg9JkvEUFro=;
        fh=iUZyvnHg0WMpS7oIiQPWMj4drQRl4vE4TQ5yJhx3N64=;
        b=Riyx8indLyui5i97Za4Jl3h0VRRc1XJRJPR9yL7ECJbpbKt5/wCu6/X2aXqq4NoF/h
         GY2KL7pxZalpGvdVwO4y2HStUUYuEn1OydQx6TID54jlS7sqU/BpPVGoTBhwrXVlNHXj
         Rf4VfIKPGVDvJ87KgaBBC9XC9j1gGj/ZB11y/Pa9gdcfIN7EWdu1R9yUbCROALrwh9cD
         PyNkc64izpJ9/D1pxnzrh0oUlOA7vIeMUhAPd4sFox2N22b5fHT+PzXP4umFIRpbGqVG
         sJsAzaHfw3wVXLyOb7EOtqWupprdVHB6ROMrv+qNMWJT1JxFOtvoA5lgDnIMRXeDfWnH
         GOgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783609308; x=1784214108; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54Dj02k3uul5TPtw9U5JIJjN3eOpWu3nQg9JkvEUFro=;
        b=V09K660aCE8/LB5GSpigFj5nj8ejb7K/2qynrmPwoz4XBx0zJ4YZtHJLvy6IJ8+8vY
         C/DoH4t5BOqYhaKVF7YEqxwMVUJmxKStsyz1PmMWujP5fY2zNWE0o9U7nAQTxi7omPrZ
         sE/XhY7ICY7m2LwUayHaECNuHpJ5zxWpBrKGqa9nynlHct8st4naREYU/nvDEHVyMmb5
         ge45y0MJVVCe3VmMzvRQqKutMK1XdfR7m4vzejRLnHshQBrxn8t0nQNGIaihlMLaDNYE
         Dgdhe5UZciwUp6E0D+uoPJ3B1nck51NMwUVVkaCv7YxmAfBfj9A2DlQn/pBqAm45dk2s
         uu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609308; x=1784214108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=54Dj02k3uul5TPtw9U5JIJjN3eOpWu3nQg9JkvEUFro=;
        b=ODqBLXdyt9ig0GMkWZfTqqUOJ1SaZGYZwzDV33h/692i7vXJUqMu0iZRU3RaIxkH0f
         IthlrcuFflYBHTb97YNhkej7CEx4+Wlq/Cv+hPRVX2nD3BbvDbteM6pnbnlkuW8CrDO/
         un0itbe3cNgRduz1mDHLQS9l/0vLrQknkKCCzhH3W+QkYRgg1a5/TdBy2YavD3eAWfyU
         cBJVa7eiwbwA7n0KMEPRKEsLYeubY/NVn8z8kb+Ign/klVO+7uflLUwyJE8Euxe5YrO+
         ziRYcm+EkHPD8j55OUOX6kFyWso0YWm1hoJA8qHQ8Un6p1ig54oZ7+fnL61yuyFAYIBZ
         obqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f6xO1n/xRtz8MKFg3j6vyDdUcMejDgLu81gVRcu7/nKqFUUVDUCYc3gcX2sDKiyzYfRQ13bPU4KzZ5Za6zwfO@lists.infradead.org
X-Gm-Message-State: AOJu0YzIkG5od/dYxtQqvd25bcm1MJJl0T7vpWurgkPty3SBtd4L7XcP
	TTnm7lO9PJIknr9ho1piAboUAxLb9QkTWMHekscYSQvtPDnS9QvQ7E57TfnOkrdHKoBdrZQq0xH
	o0u78vTay8V7w36BzOw+5nMyM3wTgvoccnyfgURgT/g==
X-Gm-Gg: AfdE7cmoafadDC2/pAiV14YgWFJI2RtGWoJz6+mG0ftEw3O6lXQxiHWef8wP4QfJCBk
	e7C0qQql+AAOhGuHRlRScBRkap4EgOHcsAE1jUCreVzw9i35V1smSrPSrbtsMmleQXHneaP2lHF
	m4+Xm1APcEWhckcrj+yLmg46oE6vK5ChhcYqqhFok6g8WW3ETtyGPj1+LajKqLbBZmqr05/b+8A
	cEv+nqASIfLzsD+LcUtoHoh+qePC3rdUctJI+R8BlnjQyGQMMvG/VHcG52ici0F6m7id9QA7+n6
	e1+uWaFwnqRnYp2eWo/2sOU35xYHvvBmdqX9gSQomKx3kBMoDPsAzDKatx4kd8ShliHbc5S8kub
	qXG+QdVfTS7yPz/G9dGiUekjxrhbV
X-Received: by 2002:a05:6820:80c9:b0:6a1:7d5d:d55b with SMTP id
 006d021491bc7-6a36da40a78mr6610565eaf.63.1783609306048; Thu, 09 Jul 2026
 08:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk> <87zf08w7qo.fsf@jogness.linutronix.de>
In-Reply-To: <87zf08w7qo.fsf@jogness.linutronix.de>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 16:01:33 +0100
X-Gm-Features: AUfX_mzxAEUtA0gfeGBkNwUL4IfvDIIDWxjRLhkwrbukoka3ocYrFDWdq-jaaZM
Message-ID: <CALqELGxAXDF-cz-b=2G64TayXDU1U1vBzb_qBwcEJ2Bvw+fFjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: John Ogness <john.ogness@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_080149_093030_FDAC7201 
X-CRM114-Status: GOOD (  29.56  )
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

On Fri, 3 Jul 2026 at 13:57, John Ogness <john.ogness@linutronix.de> wrote:
>
> Hi,
>
> Sorry I am so late to this party.
>
> On 2026-06-30, Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> > diff --git a/include/linux/console.h b/include/linux/console.h
> > index d624200cfc1708bf73925892a466efe0c95c5586..3478b556c0eb9579530409dc6fbb9b5a8bff581c 100644
> > --- a/include/linux/console.h
> > +++ b/include/linux/console.h
> > @@ -290,6 +290,8 @@ struct nbcon_context {
> >   * @outbuf:          Pointer to the text buffer for output
> >   * @len:             Length to write
> >   * @unsafe_takeover: If a hostile takeover in an unsafe state has occurred
> > + * @emitted:         The write context attempted to emit the message. Might
> > + *                   be incomplete.
> >   * @cpu:             CPU on which the message was generated
> >   * @pid:             PID of the task that generated the message
> >   * @comm:            Name of the task that generated the message
> > @@ -298,7 +300,8 @@ struct nbcon_write_context {
> >       struct nbcon_context    __private ctxt;
> >       char                    *outbuf;
> >       unsigned int            len;
> > -     bool                    unsafe_takeover;
> > +     unsigned char           unsafe_takeover : 1;
> > +     unsigned char           emitted         : 1;
>
> This is the wrong structure to add this flag. This structure is for
> the nbcon drivers.
>
> struct nbcon_context would be the correct structure.

That's no problem, I'll update on the next series.


>
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index 4b03b019cd5ee25d68e9ace84392045e91241a7f..ae45cb0589c0effafc66f1756bdaecd1c1e53ab9 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
> >       }
> >
> >       progress = nbcon_emit_one(&wctxt, use_atomic);
> > +     if (progress && wctxt.emitted)
> > +             printk_delay(use_atomic);
> >
> >       if (use_atomic) {
> >               start_critical_timings();
>
> This is too deep (also pointed out by Sashiko) because it multiplies the
> delay times the number of consoles. For the legacy printing, it would be
> more appropriate to put the delay inside console_flush_all() and
> legacy_kthread_func().
>
> > @@ -1584,6 +1593,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >                       if (!nbcon_context_try_acquire(ctxt, false))
> >                               return -EPERM;
> >
> > +                     wctxt.emitted = 0;
> > +
> >                       /*
> >                        * nbcon_emit_next_record() returns false when
> >                        * the console was handed over or taken over.
> > @@ -1600,6 +1611,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >                       if (nbcon_seq_read(con) < stop_seq)
> >                               err = -ENOENT;
> >                       break;
> > +             } else if (wctxt.emitted > 0) {
> > +                     printk_delay(true);
>
> @emitted is a flag:
>
>                 } else if (wctxt.emitted) {
>

Good spot, that was sloppy of me. I'll fix.

Thanks,

Andrew Murray

> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index cc203327247aa4f81f55b907c66ac88f30ce6da8..5278d9cb19e4177a00998fba5c1438251e033578 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -3211,6 +3208,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
> >               *handover = console_lock_spinning_disable_and_check(cookie);
> >               printk_safe_exit_irqrestore(flags);
> >       }
> > +     printk_delay(true);
> > +
>
> Again, too deep. Let console_flush_all() and legacy_kthread_func()
> perform the delay appropriately between each message.
>
> John Ogness

