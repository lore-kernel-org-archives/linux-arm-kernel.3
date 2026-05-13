Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8172CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a38+h9bWp3RlleTL1QjZzeIbioOA+x/4L20QS9dVRSE=; b=RMsaYe7tk3VanFE+M4ctWs3oOd
	PUkN/hOjmdKzGNrSzQSCeET+R3actjlaEoIp+bA2KOl4Ox7VTzunceZiXAqFA7Kvyu3Bi+J6RTaaI
	HKeRShAAPKzlwnbcDCSvJX6xOqqW2ImolymbCaFiY1jirRE5+JttAyPxX4ukmu/yscjwb2H2PHlLg
	GMfSj1OyHM1r5x5J6iT3bgM3ezkaUjoiWkrtn1DFqZZ0A0YGuEpZzqdJN5gmiUqFqQCe0R9cJSSO6
	R2MR/z+gdL+SMDo46ux10Eb5yPSYhjAOidXbxPf2zdCjo7V6Qmfht8dsvz8O9bqPiu4RwkrAJQd3o
	TL5B7dig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9GD-00000002bB5-2Xvm;
	Wed, 13 May 2026 13:04:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9GB-00000002b9i-1TUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:04:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44c350a5b87so4246269f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778677460; x=1779282260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a38+h9bWp3RlleTL1QjZzeIbioOA+x/4L20QS9dVRSE=;
        b=BDx5nDw1u/8SjAR2ZFtEPppKlQs3zmxra9Jhi207CSL9qbAh0Tp2v8eRFaSAaYhPgy
         t9LJZg8Qfx3JS3/MexjA46ZcM++66167KKNwgHoIKyaWkmE5w7n4QfTTJOn74sXLOyOt
         1UwqBaj/tWf9ott8Lyc/9BMhqzwJ8cgNEorWGa9r4fzjPXQmuvA5yMbw/voSESxg3Red
         lNfFeJSH4BvR/5DU0MLtxl2dfmyJHlHh5iqRowzx4ov0Egv2sI/mBEtgVu8TBUhFElDK
         vIQiijal2lG/K7AjI/oqvTTFkL9xSm2lnBf462phogb1g3iOszsVWKalJcFecbRwKGd3
         IEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677460; x=1779282260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a38+h9bWp3RlleTL1QjZzeIbioOA+x/4L20QS9dVRSE=;
        b=IxxDg0ZTeTd3byGFqR1KcVnny1AvaloeNLDaeu2cAshwow4otyI+Xh072+aXHg4Cpv
         eWti4PbrLuQ9onuI8M122tWTU57XgrDAp4u4Z36FuP6+7MuAqHXtQFyYXP60YuVEdxjZ
         v3McEn4i2GSX5x+bUi8F+aa0Dr1NFDUCAgvsXVAGnmf7KLlk4zlyMIe1zqNyRNg2XoUn
         ORznJHJKs0oz/OQM7UqzaKVOPYY1r/SSLNstWkAQ9Fe83ODmZqARSZ7Bc/Ft9Z+EvlX8
         isEMfNBxrP+Ca4YpbQByP0HOfxYwxxYfXNbpKNA1rcSLqd0AwduJpxTdERVt1wa5b2Ef
         RKzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RTGqD+Z/3rKgrFuQ3jdRIpS/TdeN+AmzrzflPGtGI0vEWa6h6BakuLhOKUFaAQmUXn99Dpbzqjdk0L2+o9aDg@lists.infradead.org
X-Gm-Message-State: AOJu0YwHQPa2TroOnxMEqeGL6iSCU4xmIPP+mxXhwRA48sFl8Ae0YHSj
	6CUppwL3Bry7f7a0nsoTUeFSBCUbSi9o87y4FVHtnd/shxeN873odEmB355xEwtYWto=
X-Gm-Gg: Acq92OEa6Y1VHB4i2+uGe9SW0IRRK//JmKjFi38Un+nW5D3I7Afpd4aUzvHCnuW3/xT
	fzpvCN1b9G9aBIfltAYT3t7gVbkd6AX++/RvBk5p+1EEbKU1F6Zk8dEGLksuxGRGulUopdD6Kvz
	d79EJ5sZIYC0oqXOK1weh/y0QWMZcdzUVlwuVIz+HF165f6ha7RQtkhv+BM0xRGTpOq5jaQic3h
	wKStDi8FrhnSJ23cw8Uh41cQAwV1ofpF5byn97OfY2RGQ1KsIqSnNsy42eLJJT3YXJMiak0DuMX
	UvaCse0x4E+nu6kULmQfwDf7TxJsGmCRIUKHDGWF7E1GYXkIiWf2yAqAq9CBJSWumqENSzX7+x5
	3GuGkufp+t9A2ujhguQpBtv3THxjfd8815kra13S/t/WyQY9Gve8dQRj14R9FpAgMhbLEAAby6+
	xOE/oytbSZwxKtCqaDPtH92GcO3a4794bdTYAv
X-Received: by 2002:a05:6000:1acc:b0:43d:7e11:1b72 with SMTP id ffacd0b85a97d-45c57de9e7emr5052075f8f.9.1778677459533;
        Wed, 13 May 2026 06:04:19 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ba2aaec3asm11115693f8f.15.2026.05.13.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:04:18 -0700 (PDT)
Date: Wed, 13 May 2026 15:04:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Clark Williams <clrkwllms@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
Message-ID: <agR2z4r5sJvAjm1a@pathway.suse.cz>
References: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>
 <afn-H1EQJxnDs0BZ@pathway.suse.cz>
 <CALqELGxhXO=kzh9bpztd9=Ug9ykPL2NALo9Apq3=Oj6aeiEcKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALqELGxhXO=kzh9bpztd9=Ug9ykPL2NALo9Apq3=Oj6aeiEcKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_060423_420887_2D85BD53 
X-CRM114-Status: GOOD (  55.67  )
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

On Wed 2026-05-06 23:37:01, Andrew Murray wrote:
> On Tue, 5 May 2026 at 15:26, Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Tue 2026-05-05 14:45:00, Andrew Murray wrote:
> > > The CONFIG_BOOT_PRINTK_DELAY option enables support for the boot_delay
> > > kernel parameter, this allows for a configurable delay to be added before
> > > each and every printk is emitted. This is DEBUG_KERNEL option that is
> > > helpful for debugging as kernel output can be slowed down during boot
> > > allowing messages to be seen before scrolling off the screen, or to
> > > correlate timing between some physical event and console output.
> > >
> > > However, since the introduction of nbcon and the legacy printer thread for
> > > PREEMPT_RT kernels, printk records are now emited to the console
> > > asynchronously to the caller of printk and its boot_delay. The delay added
> > > by boot_delay continues to slow down the calling process, but may not have
> > > any impact to the rate in which records are emited to the console. For
> > > example, if delay_use is set to 100ms, and the printer thread has a
> > > backlog of more than 100ms, perhaps due to a slow serial console, then the
> > > records will appear to be printed without any delay between them.
> > >
> > > It would be unhelpful to add a delay to the printer thread, and it would
> > > not be possible to disallow selection of CONFIG_BOOT_PRINTK_DELAY at build
> > > time as it's not possible to detect which consoles are nbcon enabled at
> > > build time. Therefore, let's remove this feature.
> >
> > Heh, Randy proposed to remove "boot_delay" few days ago.
> > This RFC goes even further and remove both "boot_delay" and
> > "printk_delay".
> 
> Apologies, I didn't see this. I'll co-ordinate with Randy.

No need to apologize.

> > Honestly, I do not feel comfortable by this. The delay seems to
> > be handy when there is only graphical console. I would suggest
> > to do:
> >
> >    1. Obsolete "boot_delay" with "printk_delay" as
> >       proposed in Randy's thread, see
> >       https://lore.kernel.org/all/afn2sYKKsqG4QBVX@pathway.suse.cz/
> 
> Your suggestion was:
> 
> " 1. Add "printk_delay" early_param() which would allow
>      to set "printk_delay_msec" via command line."
> 
> And I assume the intent is to replicate the functionality of
> boot_delay, by allowing printk_delay to be used to introduce delays
> from early_param time? Thus deprecating delay_use.

Exactly.

> 
> "  2. Modify boot_delay_setup() to set "printk_delay_msec" as well.
>      In addition, it might print a message that it has been
>      obsoleted by "printk_delay" and will be removed."
> 
> Given the intent may be to deprecate boot_delay, I'm not sure that
> setting printk_delay_msec as well would be beneficial, as this would
> extend its functionality to add delays beyond SYSTEM_RUNNING which is
> where boot_delay stops. Unless you mean to use boot_delay as an alias
> to an early_param hook for printk_delay?

I do not think that this is a big problem. As you write below, it is
a debug feature. IMHO, people debugging boot problems won't mind when
the delay continues beyond SYSTEM_RUNNING. And if anyone complains
than we would at least know that there are people using this feature ;-)

> It seems that there are also differences in behavior between
> printk_delay and boot_use, with printk_delay unconditionally adding
> delays to all printks, and delay_use which considers the loglevel.

The unconditional delay does not make much sense. I consider it a bug.

> >
> >    2. Move printk_delay() from vprintk_emit() to
> >       console_emit_next_record() and nbcon_emit_next_record().
> >
> >       For nbcon console, even better would be to use a sleeping
> >       wait in nbcon_kthread_func(). But it would need some
> >       changes to call it only when a record was really emitted.
> >       Also we would need to use the busy wait in
> >       __nbcon_atomic_flush_pending_con().
> 
> This makes sense.
> 
> If the use case (in a post kthread printk thread world), is only
> relevant for graphical consoles, then I do wonder if printk_delay and
> boot_delay can be replaced with a more specific solution? Now that we
> have printk threads, the time in which a printk is presented to the
> user may not relate to when it was created, and I fear people may
> continue to debug issues that rely on that assumption.
> 
> I think the most pragmatic solution for now is:
> - Move the printk delay to the point where the printk is actually
> printed (e.g. console_flush_one_record and descendants)
> - Add an early_param to allow for printk_delay_msec to be set
> - Deprecate boot_delay, by using it as an alias for setting
 > printk_delay_msec, and include a user mesage that it is being
> deprecated and that it now extends to beyond boot (which could impact
> performance on non PREEMPT_RT and non nbcon systems)

Sounds good.

> - Update printk_delay function to use the appropiate mechanism to
> delay based on stage of boot and using printk_delay_msec instead of
> boot_delay.

Good point! I thought that mdelay() can be used even for the early
messages because parse_early_param() is called right before
parse_args() in start_kernel() in init/main.c.

But parse_early_param() might be called even earlier, for example,
by setup_arch in arch/x86/kernel/setup.c. And it is called before

  + tsc_early_init()
    + tsc_enable_sched_clock()
      + loops_per_jiffy = get_loops_per_jiffy()

which seems to be used by

  + mdelay()
    + udelay()
      + __const_udelay()

Anyway, it has to be done before printk_delay_msec() can be set
via an early parameter.

> If that makes sense I can fashion a patchset.

That would be great.

Best Regards,
Petr

PS: Note that I am traveling the following week so my review might
    get delayed.

