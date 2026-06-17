Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B6CCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLlL5rZhYcrp7dhMr2Kz7P02hmD2dxwyOdUGGrHy7ew=; b=z7YlEtxh79Bt4rvJlm+rlKcQvT
	Qfi0RaZywrvx/I6Pjn1opVHhhim5I9iaGfIfcGWAEkTvt/j7aZfww5FAmE9wKO1CCeAKaGV9MT/tt
	mhhW4Mnf726z4IsyC+8zPfWphK7GdZXUq65tJsd2/uCvvECtq0DLVkCdseTpGduuA1qvFdgRrwFSZ
	/5rub1hhx7fV3ZOvEbnqTQi5b7Pf6B15uwUSDJsGZNaZaEmPv/oICCUf2YwMateuGM8Bb5CeAaudb
	4EyD9zH1R35AakQCSjWL0BD4bDZ/iVQSO61fk6mqnPwlLe0pSNw//WvVcxRCb+Lr0/m0ph1piRtUf
	gk/nPmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsRy-0000000HZwQ-3Nrn;
	Wed, 17 Jun 2026 15:45:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsRw-0000000HZvP-06ii
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 15:45:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45fd464d51fso3546297f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781711106; x=1782315906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tLlL5rZhYcrp7dhMr2Kz7P02hmD2dxwyOdUGGrHy7ew=;
        b=Mps+RUmO635fo8rV9wOw7O/Fs21JRjq1Z/eAErawPlDqwD57OywDPwTmmU6KyFYtwu
         5Daf1QeumxTL9plhdqfKMOYmqhwUSTzEAbtp48GwpsoxQhrOkgSomM50UreL6bTjGW27
         GN0vlHTf9JgojEX6VUxPk+9/tWl1N6A02amsliok92MYtTK7cAf1GHxnP6Va56tiuiXM
         unRx9V9bgVhDPxV9NWDSNsg4ce+55sCLD+x6ncTFfaEmKeUSRxxbX4gi6oc8V7/sOCz7
         UksniI3cYIbP+bNW4r/VG9fbjQzoikHt1N6Hicb+s+6bQqAjyyYEzO2UmYQvTl5co+Tt
         /ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711106; x=1782315906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLlL5rZhYcrp7dhMr2Kz7P02hmD2dxwyOdUGGrHy7ew=;
        b=tRjLYbej7Pkm+hu8qhjL53ANnjrDskW7Ie+1Fww9EOVShd1PgS7LZ41jZCOMQ8tCKk
         50TWqAdD+JjAQ5udZc35XAoVG/2ooL4uVcdHiVmW4TJEnvjWzpkeo2sjhjDk10mwrjtx
         zGRzYjDivP52+j5rtwGM/UZXOeLadiF/lhZa5Nhct7cu+QGZu6rpjupnl7u1nsaXf89p
         AkXwm7j7uINkelfBzTSseovuLHOZOQ1zMpM8WL/guHZYBH7Rw/Q2z2bZjLD9iOEIqtBV
         ukwWlLmTa8IaRzXYNhpTY8dZguIKEp4bM9vI2Qc8Xyix2ORHI1TTL4ZW+n5oR/6PLB3q
         r2uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1O+slkbUk3fZMbvHTOrNyS0eFMrI4ITnZLSgyID21kMkNXwB3ndCUHAATesSVCAJj1MfER5sy08LHmb8VvDBz@lists.infradead.org
X-Gm-Message-State: AOJu0YzqNcYJCRtfrZ3/gbJ0RnGnHoqLqfE3TqVNOHsaQvrXk9AyjdIE
	J1vlQtRynL1jU/bBszhQaZULD9mPxz2M4rlzCpYMA1O7y/akNSboKmQEJ/xlHWyzXWM=
X-Gm-Gg: Acq92OF5NAIq1SnREn5fWygbrteUcBsic2b3QlRbvDuzd7hLV4Ohps3pqLF3D6phdhX
	XGHIou+nUjpITUoh/p8TzVIe6Kk4SNIutxCB2zITeBtQbD3GYag143JxN+s2qj223/NOAN5G/rO
	flAUnK91oPxnHoPTYBD9urvpZ7fv/RtdjCAsOw7nng5/OabJx7HZvbgVvVu7WF4kTzrjVvDNXv0
	ZhBZXZHyqzLJr2/flnm8Q4SgzuqFVfScZBgxEDQyg0F+zKsf2Wr+zdMOJKfersc/64QkK0C6lC3
	QVDAEjmOjuhounDzNxkV0n2EhBuP6KXpmLx/xXW/6Fz7Ux6XKhNVeh7r7rzRTpEn7rZtPb8zvpW
	rCzdc6RA7cZrC3l9OA9FX7RQgnlrCSiMy04iVFDyg1Ese6aIHsWmNqaHUKkj5so8X/FqD/DCpD8
	/rDpd04kQlapRF8HU=
X-Received: by 2002:a05:600c:5287:b0:492:834:24a2 with SMTP id 5b1f17b1804b1-492333b1529mr81017605e9.16.1781711106011;
        Wed, 17 Jun 2026 08:45:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa96f0esm189956735e9.12.2026.06.17.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:45:05 -0700 (PDT)
Date: Wed, 17 Jun 2026 17:45:03 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <ajLA_yPOXPraCP6y@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-3-c34c187142a6@thegoodpenguin.co.uk>
 <aibe12WcrLxVWTez@pathway.suse.cz>
 <CALqELGymunRD=ku6CpoZ6OMH9QOYvyPB-EMN24ez5WAeXFtCsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALqELGymunRD=ku6CpoZ6OMH9QOYvyPB-EMN24ez5WAeXFtCsg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_084508_141779_12BD2549 
X-CRM114-Status: GOOD (  61.22  )
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

On Sun 2026-06-14 13:55:31, Andrew Murray wrote:
> On Mon, 8 Jun 2026 at 16:25, Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Mon 2026-06-01 00:17:39, Andrew Murray wrote:
> > > The printk_delay and boot_delay features are helpful for debugging
> > > as kernel output can be slowed down during boot allowing messages to
> > > be seen before scrolling off the screen, or to correlate timing between
> > > some physical event and console output.
> > >
> > > However, since the introduction of nbcon and the legacy printer thread
> > > for PREEMPT_RT kernels, printk records are now emited to the console
> > > asynchronously to the caller of printk. Thus, any printk delay added by
> > > boot_delay/printk_delay continues to slow down the calling process but
> > > may not have any impact to the rate in which records are emited to the
> > > console.
> > >
> > > Let's address this by moving the printk delay from the calling code
> > > to the console emiting code instead. Whilst this ensures that delays
> > > are still observed (especially for slower consoles), it doesn't improve
> > > the use-case of using boot_delay/printk_delay to correlate timings
> > > between physical events and console output.
> > >
> > > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > > index d7044a7a214bdd4537a5e20d876d99bc3ffe8b3a..a507a2fed5bf4366e24330f763b842a698ecf6f7 100644
> > > --- a/kernel/printk/nbcon.c
> > > +++ b/kernel/printk/nbcon.c
> > > @@ -1267,11 +1267,16 @@ static int nbcon_kthread_func(void *__console)
> > >
> > >               con_flags = console_srcu_read_flags(con);
> > >
> > > +             wctxt.len = 0;
> > > +
> > >               if (console_is_usable(con, con_flags, false))
> > >                       backlog = nbcon_emit_one(&wctxt, false);
> > >
> > >               console_srcu_read_unlock(cookie);
> > >
> > > +             if (backlog && wctxt.len > 0)
> >
> > Heh, this is tricky. It might probably work but it is not guarantted
> > by design.
> >
> > The "backlog" name is a bit misleading. The value is basically
> > wctxt.ctxt.backlog. The real meaning is that printk_get_next_message()
> > was able to read a message. It means that there _was_ a backlog.
> > But it is not clear whether there are still pending messages or not.
> 
> Yes I found that to be the case (see my notes in the cover letter) -
> backlog is only true if a record was successfully retrieved, though
> that record may be one that is suppressed.
> 
> 
> >
> > Also it is not clear that whether the message was pushed to the
> > console or not. It might have been supressed in which case
> > (wctxt.len == 0). But it might also be emitted only partially
> > when a higher priority context took over the console context
> > ownership.
> 
> You say it might probably work but isn't guaranteed by design, I'm
> struggling to see what I've missed...

Ah, I am sorry I was not clear enough, see below.

> As far as I could tell, nbcon_emit_next_record only returns true when
> a record has been printed and it still has context. The only exception
> to that is where pmsg.outbuf_len is zero (suppressed), in which case
> it may return true. Thus if (nbcon_emit_next_record() &&
> !pmsg.outbuf_len) then we can be sure a record was printed. In order
> to apply this test from the various callers...
> 
> for nbcon_emit_one - this returns ctxt->backlog if
> nbcon_emit_next_record returned true. But backlog is *always* true
> when nbcon_emit_next_record returns true. Thus the test of (backlog &&
> wctxt.len) is equivelant to (nbcon_emit_next_record() &&
> !pmsg.outbuf_len).
> 
> So I still think this implementation is valid.

You are right. Your change would work with the current code.

When I talked about the design I meant that we "did not expect"
that anyone would need to check whether nbcon_emit_next_record()
really emitted something.

Or better to say, the design has always been complicated.
And we had to review it when the callers needed anything.
For example, see see the commit ba00f7c4d0051e351e
("printk: console_flush_one_record() code cleanup").
We did it before commit 1bc9a28f076fa68736 ("printk:
Use console_flush_one_record for legacy printer kthread").

And the check if (backlog && wctxt.len > 0) is not a good design.
I would say that it depends on internal implementation details
which might change in the future. Also the variable name "backlog"
does not well describe the real behavior.

This is why I suggested to add the @emitted field into
struct nbcon_context instead. It might look like it adds some
complexity. But the semantic of this field will be clear and
simple. So, it should make the life easier in the long term.

> > I would prefer to explicitely set some flag when
> > nbcon_emit_next_record() really called con->write*().
> > See below.
> >
> > > +                     printk_delay(false);
> > > +
> > >               cond_resched();
> > >
> > >       } while (backlog);
> > > @@ -1595,7 +1604,9 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> > >                       nbcon_context_release(ctxt);
> > >               }
> > >
> > > -             if (!ctxt->backlog) {
> > > +             if (ctxt->backlog && wctxt.len > 0) {
> > > +                     printk_delay(true);
> > > +             } else {
> >
> > This changes the semantic. The original code call this when
> > no message was read. The new code would call this path also
> > when the output was suppressed. It would probably work.
> > But still.
> 
> Ah, good spot! I missed that.
> 
> 
> >
> > >                       /* Are there reserved but not yet finalized records? */
> > >                       if (nbcon_seq_read(con) < stop_seq)
> > >                               err = -ENOENT;
> >
> >
> > As mentioned above, I would add a flag which would be set when
> > con->write*() was called.
> 
> I'm not sure why I tried to avoid adding members to nbcon_context, but
> I prefer your solution, it isn't so fragile, and makes it easier to
> understand. I'll update for my next revision.

Uff :-)

> >
> > It modifies the type of unsafe_takeover in struct nbcon_write_context.
> > But it actually makes it more compatible with struct nbcon_state.
> 
> What is the intent of this change (bool to unsigned char)?

I meant that my proposed change switched it from bool to 1 bit.
But I see that it will not be fully compatible anyway because it is

   unsigned int unsafe_takeover	: 1 in struct nbcon_state

vs
   unsigned char unsafe_takeover : 1 in struct struct nbcon_write_context.

Honestly, I am not sure what C standard says about bool vs. bit
and bit vs. bit operations. But I believe that compilers would
do the right thing in both cases. Anyway, bit vs. bit sounds cleaner.


> > My proposal (on top of this patch):
> >
> > diff --git a/include/linux/console.h b/include/linux/console.h
> > index 5520e4477ad7..5a86942e55ef 100644
> > --- a/include/linux/console.h
> > +++ b/include/linux/console.h
> > @@ -290,6 +290,7 @@ struct nbcon_context {
> >   * @outbuf:            Pointer to the text buffer for output
> >   * @len:               Length to write
> >   * @unsafe_takeover:   If a hostile takeover in an unsafe state has occurred
> > + * @emitted:           The write context tried to emit the message. Might be incomplete.
> >   * @cpu:               CPU on which the message was generated
> >   * @pid:               PID of the task that generated the message
> >   * @comm:              Name of the task that generated the message
> > @@ -298,7 +299,8 @@ struct nbcon_write_context {
> >         struct nbcon_context    __private ctxt;
> >         char                    *outbuf;
> >         unsigned int            len;
> > -       bool                    unsafe_takeover;
> > +       unsigned char           unsafe_takeover :  1;
> > +       unsigned char           emitted : 1
> >  #ifdef CONFIG_PRINTK_EXECUTION_CTX
> >         int                     cpu;
> >         pid_t                   pid;

Best Regards,
Petr

