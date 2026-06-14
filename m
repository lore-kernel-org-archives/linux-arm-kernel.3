Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26546CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZeTyf1C0nn8STuLXoAYPKsgBtsVBb2BP7ZZv+Bey8Y=; b=3MjjoTebPbHXGupnDyezb6OKjd
	AY8Mq+qDirymU9gW+EhxZQP0ghQqvNwTF6pcKp0HvGsPhQQ4Qez0QQ4+T5xrTvpWwb9kHvoRgM8+g
	XphTtRCvKlVH7vdVC2wh4i987vrm0ZUKynN11rp/PYegFAfLUCdIx59rhxqg04H966pXdARmP9hD5
	Zc2uLADmgWRsBMJCyqWfs45wu9Sp89IG/5goIBjryFhxJjVX6xaoxyuvWFX4T0G2yKizygUSqI2bD
	bKlqhx5jwqYTdZOgtJv8KfCM2szFeR0ny42PiUPAKlwyn7FWltMy2z+ZV+rklo9mT8cAjyC2kbo+N
	oHgKpJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkNP-0000000CzbC-2bAk;
	Sun, 14 Jun 2026 12:55:47 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkNN-0000000CzaU-0tVj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 12:55:46 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7e71b2d527dso919270a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 05:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781441744; cv=none;
        d=google.com; s=arc-20240605;
        b=gOIjGdGvaQBtg0Z91TZsrBdn+5R13HZ02Qegi2mNKda+ci4FQTiT5uAsHBKhYvVawb
         A+Sf5M654KHxWWOR/+TinONv7KR6kS0PZJ6lTwpT1nnvn++5EYntLBaZ3UoLDoaasaMJ
         O4Lrx/kmIAuSO++xwZw/N0gUvxoxcL2L63v139ZXJs3A6SDSTeiJnit4Bb+2s56FjmkO
         n+6gacj04sOUFDUAaBpXBk5vBgXG1l+YfnM8B9lR8nx9+EM0l02UU7bI0IGlVmKGv/O8
         vWWfZVwKV3K/6+zi5T09+uhUvern8LREqG5liWnxQVe9OgcCobg5z/phYNxDb07LxOZ1
         7yyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WZeTyf1C0nn8STuLXoAYPKsgBtsVBb2BP7ZZv+Bey8Y=;
        fh=DiuMfI6PqM13rURq5Ihx5VZISNY7RYGOMb8R6JnW+t0=;
        b=bcnk/GR7eQgImD4XTeg9dY1JkkL1JbR/0YqYgFoW36AT8O1+R5AhE3mdLBsaBzDhg7
         QD55aXFZb/hWU08Hle3hhwbW7c4eDURl/gX4UkAHXdb8y9ykE0uoyEnwZ8He84nqbgfX
         8M5OU0kgm5NcFehVnBqf3k+zE2YZr2EvDUKrSpLZ1HcsMYr/jchZqA+a+vRGyJ9hQyv/
         H7+SxJFA8J/lQAc5bBp68Ng0N7jP41ooKQz/wDyK0B66HvGCZXGK6gfNZEPwIhehU1Xa
         DyzplDZH/xjWYwJY2Kji4hxDGoGBcowIeG47RNoRK9CKZDqseqSt2kmPGoWUyJ3kuqFZ
         D5tw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781441744; x=1782046544; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WZeTyf1C0nn8STuLXoAYPKsgBtsVBb2BP7ZZv+Bey8Y=;
        b=uO9CU2MqtuuiTu7RU39geIqBw54WdKPUMNZ4XR6Uqrdkk1CgwKdwtNdW8OgRP8z9lH
         t6NReTagHvPEuiCcjJdNoIQS9uVcDD6qQOhFMN9Z+8BSyJ+3JfLYQr74dK7rdCx0LWwr
         QOvb2txEBTjqNS1VYUsXMUmeS9szcJfabGzPUPEGBiOunYkDEipvLBAaUotscD3jPfr6
         1djj5e+Gpkqu9RUmuBokQGom8pFrsQIhmY5YMAXHf+rgDMTp0mAjEf0NjG3TJKhRr67e
         hHe7xr6bZ+Sf+Ghz35CEwid7uGXIWK9jSBXTaRggcuYYtnoQo24yGhSSLBh22QoRJJtu
         FHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441744; x=1782046544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZeTyf1C0nn8STuLXoAYPKsgBtsVBb2BP7ZZv+Bey8Y=;
        b=Cj1fPsDnUyxzDwFaS3rIDKJKRmy4/AzEgWF2M55LZFyICu2akEYb/QfPl/f13snmNt
         cxcVcuLzhAicbWfHmsqxrfyVyA++iEhOdD3Mofk3vxrkEg9ivy8VuVz7gsnVn8hiiGkB
         k644Go2ktIlUS0Gy0+/hwVh3HoQDKRX/hycB1Rfbi2WNo2TaqoIdynZ15KQYxt4RiXsp
         n5JobzhvObC2iDHibF4DP+NtwkiuSH1USQOmaa6LwC1XT+Xl2eyYYtEy6gwRHOMiVSXa
         jU2wN2qTxa2iXUdW0OUV+5YbX3ss0AgxOR8Qmzz8Mq+y5XU4HHcEpUz7juj0DIndwrYT
         QeIA==
X-Forwarded-Encrypted: i=1; AFNElJ93W6jOEXWqyNz4ahk0MffrGkbEfvS4PmuNUwbJ8kPi5uL96SKVSmuwKKBp+4ScEGK7dbAiUWDvxv8vEudEozXP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7opITZGg+RZPk1AOD4ytHrP/FjdWO8TDrkHixZuimMsktCuTh
	RagYR3NfPcD2MGmnebnURU8CLVA9jN8rbu4bnBij0tEYCU64kdmZ/pMddDCpY9SJIPM3KZ6C2gr
	Dgce9SoP4CXY6swPuG7nYYCmRWt91XQA2Vmz3MRSwXQ==
X-Gm-Gg: Acq92OFwGu1ZTKQtnNI/lX9xhCNd4MPBdYC2OA76nY+IpLPf0RZnhOzOSZtIi/o4dIe
	nQxwCf3tZZg6Lzf0+XK+ZWGq2jyfFiXFGDy/Efz14gJKZMkyJvKxl7Hlj1kScJfWuB7scXjMzQl
	wXGPaKImyqTEDkL3K0kSVNMFu2oDZLi3SqDhoUHZJ6Ijm+xO7n8ZjvMDDKuTLONxlPT0xaKlwY2
	YfBqo0ziaiTU7IA3oMsbz4UvJb+MUDJeI5QmUVoy7QN2bwbzcgKgLM+b5pga9oihvaVZRgiLZVG
	5+VWVzD+i9zEgR544d9UXZSkbTMW2fXisFN9mWUaXEcxEreksGCwKNrFkwczI2bg0n/idRTeb/c
	PThEDIjO2j00uB97pCbX4gWIglSmRyFrzko2Vv9M=
X-Received: by 2002:a05:6808:170a:b0:485:403d:9b78 with SMTP id
 5614622812f47-48741936d9dmr4143100b6e.3.1781441744013; Sun, 14 Jun 2026
 05:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-3-c34c187142a6@thegoodpenguin.co.uk> <aibe12WcrLxVWTez@pathway.suse.cz>
In-Reply-To: <aibe12WcrLxVWTez@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 13:55:31 +0100
X-Gm-Features: AVVi8CflUYPsTo9tQrMGcwZHbhm2kwfKfqeb77lT7O7OOqLaCglAj6vHQG53s8k
Message-ID: <CALqELGymunRD=ku6CpoZ6OMH9QOYvyPB-EMN24ez5WAeXFtCsg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_055545_511581_3316B5B6 
X-CRM114-Status: GOOD (  53.07  )
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

On Mon, 8 Jun 2026 at 16:25, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-06-01 00:17:39, Andrew Murray wrote:
> > The printk_delay and boot_delay features are helpful for debugging
> > as kernel output can be slowed down during boot allowing messages to
> > be seen before scrolling off the screen, or to correlate timing between
> > some physical event and console output.
> >
> > However, since the introduction of nbcon and the legacy printer thread
> > for PREEMPT_RT kernels, printk records are now emited to the console
> > asynchronously to the caller of printk. Thus, any printk delay added by
> > boot_delay/printk_delay continues to slow down the calling process but
> > may not have any impact to the rate in which records are emited to the
> > console.
> >
> > Let's address this by moving the printk delay from the calling code
> > to the console emiting code instead. Whilst this ensures that delays
> > are still observed (especially for slower consoles), it doesn't improve
> > the use-case of using boot_delay/printk_delay to correlate timings
> > between physical events and console output.
> >
> > --- a/include/linux/printk.h
> > +++ b/include/linux/printk.h
>
> The declaration is needed just inside kernel/printk/ directory.
> It should better be done via kernel/printk/internal.h

OK.


>
> > @@ -209,6 +209,7 @@ extern bool nbcon_device_try_acquire(struct console *con);
> >  extern void nbcon_device_release(struct console *con);
> >  void nbcon_atomic_flush_unsafe(void);
> >  bool pr_flush(int timeout_ms, bool reset_on_progress);
> > +void printk_delay(bool use_atomic);
> >  #else
> >  static inline __printf(1, 0)
> >  int vprintk(const char *s, va_list args)
> > @@ -326,6 +327,9 @@ static inline bool pr_flush(int timeout_ms, bool reset_on_progress)
> >  {
> >       return true;
> >  }
> > +static inline void printk_delay(bool use_atomic)
> > +{
> > +}
> >
> >  #endif
> >
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index d7044a7a214bdd4537a5e20d876d99bc3ffe8b3a..a507a2fed5bf4366e24330f763b842a698ecf6f7 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -1267,11 +1267,16 @@ static int nbcon_kthread_func(void *__console)
> >
> >               con_flags = console_srcu_read_flags(con);
> >
> > +             wctxt.len = 0;
> > +
> >               if (console_is_usable(con, con_flags, false))
> >                       backlog = nbcon_emit_one(&wctxt, false);
> >
> >               console_srcu_read_unlock(cookie);
> >
> > +             if (backlog && wctxt.len > 0)
>
> Heh, this is tricky. It might probably work but it is not guarantted
> by design.
>
> The "backlog" name is a bit misleading. The value is basically
> wctxt.ctxt.backlog. The real meaning is that printk_get_next_message()
> was able to read a message. It means that there _was_ a backlog.
> But it is not clear whether there are still pending messages or not.

Yes I found that to be the case (see my notes in the cover letter) -
backlog is only true if a record was successfully retrieved, though
that record may be one that is suppressed.


>
> Also it is not clear that whether the message was pushed to the
> console or not. It might have been supressed in which case
> (wctxt.len == 0). But it might also be emitted only partially
> when a higher priority context took over the console context
> ownership.

You say it might probably work but isn't guaranteed by design, I'm
struggling to see what I've missed...

As far as I could tell, nbcon_emit_next_record only returns true when
a record has been printed and it still has context. The only exception
to that is where pmsg.outbuf_len is zero (suppressed), in which case
it may return true. Thus if (nbcon_emit_next_record() &&
!pmsg.outbuf_len) then we can be sure a record was printed. In order
to apply this test from the various callers...

for nbcon_emit_one - this returns ctxt->backlog if
nbcon_emit_next_record returned true. But backlog is *always* true
when nbcon_emit_next_record returns true. Thus the test of (backlog &&
wctxt.len) is equivelant to (nbcon_emit_next_record() &&
!pmsg.outbuf_len).

So I still think this implementation is valid.


>
> I would prefer to explicitely set some flag when
> nbcon_emit_next_record() really called con->write*().
> See below.
>
> > +                     printk_delay(false);
> > +
> >               cond_resched();
> >
> >       } while (backlog);
> > @@ -1525,6 +1530,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
> >       }
> >
> >       progress = nbcon_emit_one(&wctxt, use_atomic);
> > +     if (progress && wctxt.len > 0)
>
> Same here.
>
> > +             printk_delay(use_atomic);
> >
> >       if (use_atomic) {
> >               start_critical_timings();
> > @@ -1584,6 +1591,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >                       if (!nbcon_context_try_acquire(ctxt, false))
> >                               return -EPERM;
> >
> > +                     wctxt.len = 0;
> > +
> >                       /*
> >                        * nbcon_emit_next_record() returns false when
> >                        * the console was handed over or taken over.
> > @@ -1595,7 +1604,9 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >                       nbcon_context_release(ctxt);
> >               }
> >
> > -             if (!ctxt->backlog) {
> > +             if (ctxt->backlog && wctxt.len > 0) {
> > +                     printk_delay(true);
> > +             } else {
>
> This changes the semantic. The original code call this when
> no message was read. The new code would call this path also
> when the output was suppressed. It would probably work.
> But still.

Ah, good spot! I missed that.


>
> >                       /* Are there reserved but not yet finalized records? */
> >                       if (nbcon_seq_read(con) < stop_seq)
> >                               err = -ENOENT;
>
>
> As mentioned above, I would add a flag which would be set when
> con->write*() was called.

I'm not sure why I tried to avoid adding members to nbcon_context, but
I prefer your solution, it isn't so fragile, and makes it easier to
understand. I'll update for my next revision.


>
> It modifies the type of unsafe_takeover in struct nbcon_write_context.
> But it actually makes it more compatible with struct nbcon_state.

What is the intent of this change (bool to unsigned char)?


>
> My proposal (on top of this patch):
>
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 5520e4477ad7..5a86942e55ef 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -290,6 +290,7 @@ struct nbcon_context {
>   * @outbuf:            Pointer to the text buffer for output
>   * @len:               Length to write
>   * @unsafe_takeover:   If a hostile takeover in an unsafe state has occurred
> + * @emitted:           The write context tried to emit the message. Might be incomplete.
>   * @cpu:               CPU on which the message was generated
>   * @pid:               PID of the task that generated the message
>   * @comm:              Name of the task that generated the message
> @@ -298,7 +299,8 @@ struct nbcon_write_context {
>         struct nbcon_context    __private ctxt;
>         char                    *outbuf;
>         unsigned int            len;
> -       bool                    unsafe_takeover;
> +       unsigned char           unsafe_takeover :  1;
> +       unsigned char           emitted : 1
>  #ifdef CONFIG_PRINTK_EXECUTION_CTX
>         int                     cpu;
>         pid_t                   pid;
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index a507a2fed5bf..060534becefc 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1069,6 +1069,9 @@ static bool nbcon_emit_next_record(struct nbcon_write_context *wctxt, bool use_a
>         else
>                 con->write_thread(con, wctxt);
>
> +       /* Tried to emit something. Might be incomplete. */
> +       wctxt.emitted = 1;
> +
>         if (!wctxt->outbuf) {
>                 /*
>                  * Ownership was lost and reacquired by the driver. Handle it
> @@ -1267,14 +1270,14 @@ static int nbcon_kthread_func(void *__console)
>
>                 con_flags = console_srcu_read_flags(con);
>
> -               wctxt.len = 0;
> +               wctxt.emitted = 0;
>
>                 if (console_is_usable(con, con_flags, false))
>                         backlog = nbcon_emit_one(&wctxt, false);
>
>                 console_srcu_read_unlock(cookie);
>
> -               if (backlog && wctxt.len > 0)
> +               if (wctxt.emitted)
>                         printk_delay(false);
>
>                 cond_resched();
> @@ -1530,7 +1533,7 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
>         }
>
>         progress = nbcon_emit_one(&wctxt, use_atomic);
> -       if (progress && wctxt.len > 0)
> +       if (wctxt.emitted)
>                 printk_delay(use_atomic);
>
>         if (use_atomic) {
> @@ -1591,7 +1594,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>                         if (!nbcon_context_try_acquire(ctxt, false))
>                                 return -EPERM;
>
> -                       wctxt.len = 0;
> +                       wctxt.emitted = 0;
>
>                         /*
>                          * nbcon_emit_next_record() returns false when
> @@ -1604,9 +1607,10 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>                         nbcon_context_release(ctxt);
>                 }
>
> -               if (ctxt->backlog && wctxt.len > 0) {
> +               if (wctxt.emitted)
>                         printk_delay(true);
> -               } else {
> +
> +               if (!ctxt->backlog) {
>                         /* Are there reserved but not yet finalized records? */
>                         if (nbcon_seq_read(con) < stop_seq)
>                                 err = -ENOENT;

Thanks,

Andrew Murray

