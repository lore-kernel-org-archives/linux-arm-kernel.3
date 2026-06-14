Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBDCCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 19:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4UrwTTSzIsxsEoiq28kNYEE7Qb/E3lbhaeDgdQ4yrs=; b=UxMWLsbNuwseqmkmdVpd5U6SYe
	y5qgR2XLOxtK1A/MCUSk9oGBOSJ2BtcswLr/WJR6AWtOSwFqDbfvWsLxJUBhNI/vrGjaXc0AULXQE
	/HM/7d0j+YTzTyxFJZqk+3UdAiKRqVT3tDFkhaWzebUPEkYUkk8799PoLtRrceHRi2nLAO21pFPHI
	rIyvyVNVa3zatwrLK0UfjjJyaFpMAG68dfZiDdQVGJAWNjd0+6W9iLxDojDxPRKrL4ULHEEP200AU
	Xpl/EMG1M2aqmE/AxJU/c/YvSrk5qfjd//PQDLrJ4Inx66GUCktohM2jCouPHC0P6i2ouWXE/qjoK
	4ZpKmipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYqKl-0000000DFsE-3bD2;
	Sun, 14 Jun 2026 19:17:27 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYqKi-0000000DFrW-1mPa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 19:17:26 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7e6d37b7098so2850190a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 12:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781464643; cv=none;
        d=google.com; s=arc-20240605;
        b=E4eiAQKI+8pI+imfv/UUE+kL/D8EAABBWXe2yh/6GV2pJue2aDAr5HCWno/vLJrBmk
         xEMlsH3elzmyfTXlAZRU+ZX6eaBdk/b2UmjNWIsgXIst7EZzCZLs/cIXzGBKRkEQ/A45
         ZuZMh9m8hIAn4folfiHw8OKP04IgxbSqsGmqAdDUjJ4SVEbWIIQGcTPiLhFtS7swHltv
         aeEh07m98dsJjnEn2H9lCL5Elvfk2VsD65UJMbC/lIpq5Vxa4eqMpP+vZazz5uGoN/FM
         d+rCcn/+B9xjR8/IDUO3cVB3MpIO1jyf2ytzFCMjC9Xw01zUaWJhcIEvwxun4GOVItTX
         xZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F4UrwTTSzIsxsEoiq28kNYEE7Qb/E3lbhaeDgdQ4yrs=;
        fh=C8zVFz3kwmC/hEzXTdVhL1Jom4rfOY9QSk0lZzYEIxc=;
        b=TUi5ojBDZIYydETWp07UX2418jbdob4d/sze1PIX9ARltE4VLH9F0UU9dX5kmPrkvc
         ERuzB9ujTviyqbY54gb+K0hRORdjZDAYjCn8GSxFKNi6jBi+ZFIv5ftRnXGSaBQdD9uZ
         eUBNFFx3ZMyMDe+54a33rm34suQqF3xr8MuK0XEAWW+rBxRKIAxky1OSCKA+aIVY1IBz
         z3jFoSurCoz+A7/ChiT4TDoCkNx//Z5ne4AnyQUreBLwdoMB7djKAMzuwUeffLlvPyUR
         EEkEMEVpA+De6WCTKiGeNpbYWoV1P0rt40n2/t04Aslyi8V4wd3aiNduK7Vlu9OWHSxn
         JPBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781464643; x=1782069443; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F4UrwTTSzIsxsEoiq28kNYEE7Qb/E3lbhaeDgdQ4yrs=;
        b=NqS5gY5cWrgVMGkgOVl159W+NqWnXw+R6As8o2Pj/uRD1iNeCIFyEnx56y/NJVYGSM
         5GyJqoGiXTkFhdu/2JSaIkotUNfzLCmOp+DQZFmSEPzL/4TLGelDRWa7aA3K63TlakSF
         vHVgf0pVNETrgekGqDyZ8KupitPzXcES5VCWIecZz/+KAQv0xkfr/RszmehBRyPkTCwm
         iccfax+n03miCLGvEob/qT/l+Z34wbt5EYuRjP8OJXz8REGGh5szB6B5yxeQQpc5dM6p
         UHJhD2z1H6ChXwdnlzlLDJ3bTDPTIwRYM1sC8FTwPptm67Q5cYtocaF9SATYNYDu7HyD
         VyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781464643; x=1782069443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4UrwTTSzIsxsEoiq28kNYEE7Qb/E3lbhaeDgdQ4yrs=;
        b=KbIQTlvuX//nkqd2OxTCUtYD4oAXYHCpZ+iADHHKQJlTfo4pCRRdC0bWH0Lis6vOno
         dyBlD0nSn+IP5nbWe2bmVGL+8l+OfQ6sV9Bh2Fi3jNxE5QOXR1I8cZozZZiN8kx+yvto
         XACPixYSzvwkQXPvHm7tXK36kBjHn8IPaWkAgBUF6Jr7hH5Gu6mFEla4hVbZxD8ioRZ9
         cK9QUVQUNAeiLgiWqLj6IHrZFP8KElPWFn0WiirQW0nFDTzrivv+3+fBZ2ai9eFyXIFM
         YPlY+RkrFV8TGNEy9i8k+wMdUr1X+4qXDZGrWn9GWbvGBxGEKneBby7/FcIc6BcRv3KF
         e0Yg==
X-Forwarded-Encrypted: i=1; AFNElJ/v5gF0/t6d2wOHmZ8zJS/1VqWxs5TwrFTugFOQQPwvwhqk2JRiRkzGagDJLdfIngpzBYgnHbvAGB9/yAYnKnyH@lists.infradead.org
X-Gm-Message-State: AOJu0YwKuQRxuNfA4USX5l5Z750c4uT5lpDJRx/zpqei98TUlsiI5DJl
	jK4zpubQdGRvxtXBt3vbeNhkbv2rX5ijQHiziSxBv1Il5RV4ziX3S5+ixwSmOwiYB8Sp0WD6pNo
	pyxXqAj9HNzN44VOpgGaBRFLD8EdsVNSpe4QWibcaFg==
X-Gm-Gg: Acq92OFrPLdemn4R9lsOcQNy3ibJT5i/jQqmPImic+AxuPJ+wPjpUEdUW/+QF9Ac8gZ
	YqnW1mYwZDtGnKV6zFsW4wuK9/OJoJk2Olz/pFLvpmI6GOMI78nwXWWktwivIij2Z5DNXf+m3bk
	nstan5wJj4BxVR6HtZGqPh/fDOsprdIJQA8nQUpdcNU9BTDxWiumKjzNaX85XJnaMs/NsjwmY1U
	aeKAzcV+dMjGTtb4cA99Gu8MyuCy/UyihCwlutEH85G0oihQWwWZeEN8kE4S5c8pWMMU5sTb3Oo
	gKXpy55/aqRZ/nL3PfTHRHGKEoDM5nXcJFcpNliEL/tpYEYe5VkIBM09OzUaCOwVaapI8LzQWsf
	Tf5LsFo8OByRyQ+ytcL6WtQXUT3chXwqhnN9/dZk=
X-Received: by 2002:a05:6808:178e:b0:485:41fc:71e1 with SMTP id
 5614622812f47-4872f4a0776mr6926903b6e.21.1781464642824; Sun, 14 Jun 2026
 12:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-3-c34c187142a6@thegoodpenguin.co.uk> <aibe12WcrLxVWTez@pathway.suse.cz>
In-Reply-To: <aibe12WcrLxVWTez@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 20:17:10 +0100
X-Gm-Features: AVVi8Cd_wDbpoenWa3p5Qu6vcK4mwMkoHo9_Ly4qYzGijYT1qiw-VX-9B0ykX4w
Message-ID: <CALqELGxjUGFgpo6sf3689RgSEQg3+owZkk4TZKwV=dSJxxka_Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260614_121724_736971_04F53FC2 
X-CRM114-Status: GOOD (  49.48  )
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
>
> Also it is not clear that whether the message was pushed to the
> console or not. It might have been supressed in which case
> (wctxt.len == 0). But it might also be emitted only partially
> when a higher priority context took over the console context
> ownership.
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
>
> >                       /* Are there reserved but not yet finalized records? */
> >                       if (nbcon_seq_read(con) < stop_seq)
> >                               err = -ENOENT;
>
>
> As mentioned above, I would add a flag which would be set when
> con->write*() was called.
>
> It modifies the type of unsafe_takeover in struct nbcon_write_context.
> But it actually makes it more compatible with struct nbcon_state.
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


I think this (and the others) should be:

if (backlog && wctxt.emitted)

Otherwise you may delay in instances where con->write_* was called but
ownership is lost, for example if write_thread calls
nbcon_enter_unsafe which returns false and doesn't write anything. I
assume that when ownership is lost, the record will be reattempted in
the future, thus it would presumably make sense to delay upon
successful emit, rather than each/any partial attempt? Is that
understanding correct?

Thanks,

Andrew Murray

>
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

