Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF072C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=610vcd2ONEcjkXFZg+eI0At7uTF43lyNmlLxQtd66Lk=; b=OjOcCSg3rxMH0MC6GXzlaSGD7Q
	46KHIMRSgujtjwhnXA4VWg9xEv5GpsZf25F0QqnqpTvEijpFpRcHGHL73nfrJMH1dxEI73xrLktrh
	KWlSIIS4dRVes3MPV0XY1c3UkK3CHBFXjLPRKeCWfoX9ox/hTwIc+8mE8Hb+0E3kZZSQafHkW/VTH
	zZ3D0/uDMYzT9iscfg4kBUTmeqXJR6HKXeeOo5DHn6Nj2QViFziSR4IjibCJRg7sSOIuOwTOepWRh
	e7kCTAEMGPQTILWNGkyl8ulIGXp+KCiSJx1/0ZwspBu9mfTKGph7WvIFrkLqH6hqyofeJ6OLWxMf8
	bH0Qiw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOOQ-000000005Yf-3XEe;
	Thu, 16 Jul 2026 15:52:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOON-000000005Xa-04TV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 15:52:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so37411975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784217173; x=1784821973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=610vcd2ONEcjkXFZg+eI0At7uTF43lyNmlLxQtd66Lk=;
        b=baQ8OSYLhiHXePsRMQ6811QV4dplSEaeUrm3b6/4+4DucS57nZQRy+x9cRP82HPyTx
         IOZNTvHLjYqZmd3oZAJgHmjSRZAmN1SdrUxlh+F1JBJP2etfGNsMrv5vXlslLvl2f82o
         27FFB1vjwS2e4MugRcjPfk7bzV113wm6Wc7E/j/dpKRO54NptPX7GQy0uHwQORLQAndG
         bJgPopnpr2dRyFbOYI+6K6LQ8U8IYVpY/8krunmpNMhzE6dsNXq3PB6TDZj/XLzhGITq
         WfbiCwH0i6tfYeB/GZ7r+4G6WDmcf6g6URjv/++CsSayvFvnu3YmgmTLGOweYzPt5xRS
         fUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784217173; x=1784821973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=610vcd2ONEcjkXFZg+eI0At7uTF43lyNmlLxQtd66Lk=;
        b=YysTKWFoMx2Uzk18WCP+FhkyEuRQHGCYHAaAIl9DDi0PSZyhheXIOakpeCp05FrqED
         z7tLgNe8jgCmPhvDNRRRIjKJbmTi0aJGbMRpq8LNEyr7eE/gQ2AA8si6/ptcjnqM9Fg+
         raoyU/5N8YQCVf8kaqbCLBEwseuKbIEiC8DHaspJbDBviE0U3XFwVU0VHxbaw4eedPCZ
         bOuF1IJHseKESXifYW/Ku+HYEMd81S3BeG10XHC8eABctKkJPaWz41w72mW5WVVCZ5SF
         nU6NKoILX6A+PZX3PJngdnJCQk7uiO4WRxTGLbbSUbS1UeEDWghRtimHszwz8TsBu8c3
         3EcQ==
X-Forwarded-Encrypted: i=1; AHgh+RreZpXuXlApdqS27MzoaNCLaZEMWtuVrhhPVBVXgiCr1j/PyqQNv9HvJgjAWFaMAGp4eiLGoYmCygh8HApnw9eH@lists.infradead.org
X-Gm-Message-State: AOJu0YxmBs5SYEF0yWhM0iuf2FRSbb7a8yH+6W3T+lDmGLWFGRjb8zTl
	aU0VF+OdRb/0F3OcZLiCtClCNtcIq0T4NPQpAn5Ki9Xa1JcEr/r1D+AIzq9503g9Fz8=
X-Gm-Gg: AfdE7cl6mTeKuxYwKSZxWyL/SYSyQhTYCk98osFBeokI/tkbpoW7NnvD4ynw/kZ9FdB
	jrb2eTEXX3C2vai42Un0Mw025iJSv4FLxBzgFh9g9U/qtbyW2waHtLA4g3L1bF074fzH1xkeFjy
	pH4GCZvKnzCNofUTbk0AlPbWde4maggfI7wmX5ympmirJ05szDBSRyQPX8qaOC7GepN1fI+wukA
	k5numbENACJCiRicny4yAh1bd8bqsHCcQhrefiNTfr5vniYU4V1PETovce9JEVEb9BYzpANQa/1
	MzoQSIouHBveHZ5aK5Z8W/x2ungPun+IqoMpsx3E9GvD91PqH3dQHLadVBmy2ZIOxN7lo0Hw6DI
	JDp03CrXuD9HRyDQQEDFnnLJFajJB3EIhmeuxvFvH2UDF8x1qbItt4JvESANuIEVMUUg933S9cx
	x+Z5Hy9tbdtEhNGWg=
X-Received: by 2002:a05:600c:3e15:b0:495:409e:bc80 with SMTP id 5b1f17b1804b1-495409ebcfcmr47429445e9.37.1784217173152;
        Thu, 16 Jul 2026 08:52:53 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm90863465e9.13.2026.07.16.08.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:52:52 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:52:50 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 5/6] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <alj-UsDwB_vQ6nJ_@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-5-574547b8f71b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-printkcleanup-v3-5-574547b8f71b@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_085255_110882_B32706AE 
X-CRM114-Status: GOOD (  39.50  )
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

On Sun 2026-07-12 11:20:36, Andrew Murray wrote:
> The printk_delay and boot_delay features are helpful for debugging
> as kernel output can be slowed down during boot allowing messages to
> be seen before scrolling off the screen, or to correlate timing between
> some physical event and console output.
> 
> However, since the introduction of nbcon and the legacy printer thread
> for PREEMPT_RT kernels, printk records are now emited to the console
> asynchronously to the caller of printk. Thus, any printk delay added by
> boot_delay/printk_delay continues to slow down the calling process but
> may not have any impact to the rate in which records are emited to the
> console.
> 
> Let's address this by moving the printk delay from the calling code
> to the console emiting code instead. Whilst this ensures that delays
> are still observed (especially for slower consoles), it doesn't improve
> the use-case of using boot_delay/printk_delay to correlate timings
> between physical events and console output.
> 
> Behavior change:
> 
> Please note that printk delays now occur after messages are emitted
> rather than before.
> 
> Please also note that the printk delays occur within the printk_safe
> (irqs off) context.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -266,6 +266,8 @@ struct printk_buffers;
>   *				might cause a system freeze when the console
>   *				is used later.
>   * @backlog:			Ringbuffer has pending records
> + * @emitted:			The context attempted to emit the message. Might
> + *				be incomplete.
>   * @pbufs:			Pointer to the text buffer for this context
>   * @seq:			The sequence number to print for this context
>   */
> @@ -278,6 +280,7 @@ struct nbcon_context {
>  
>  	/* members set by emit */
>  	unsigned int		backlog			: 1;
> +	unsigned char		emitted			: 1;

We should be consistent. Note that there is one more
"allow_unsafe_takeover" bit defined above.

Maybe, the "unsigned int" was a waste of space. I do not see any
technical reason to keep it. But we should switch the existing
members in a separate patch. It might help bisecting eventual
problems, ...

>  	/* members set by acquire */
>  	struct printk_buffers	*pbufs;
> @@ -298,7 +301,7 @@ struct nbcon_write_context {
>  	struct nbcon_context	__private ctxt;
>  	char			*outbuf;
>  	unsigned int		len;
> -	bool			unsafe_takeover;
> +	unsigned char		unsafe_takeover : 1;

Makes perfect sense. But it should be done in a separate patch. We
should not hide this in complex patches. It will most likely
just work. But there is always a tiny risk that such changes
might cause regression or unveil an existing problem which was
hidded before.

>  #ifdef CONFIG_PRINTK_EXECUTION_CTX
>  	int			cpu;
>  	pid_t			pid;
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1267,11 +1269,16 @@ static int nbcon_kthread_func(void *__console)
>  
>  		con_flags = console_srcu_read_flags(con);
>  
> +		ctxt->emitted = 0;
> +
>  		if (console_is_usable(con, con_flags, false))
>  			backlog = nbcon_emit_one(&wctxt, false);
>  
>  		console_srcu_read_unlock(cookie);
>  
> +		if (backlog && ctxt->emitted)
> +			printk_delay(false);

This should be:

		/*
		 * This is a compromise between reliability and	effectiveness.
		 * A less intrusive sleeping wait might be used	here. But
		 * the released nbcon context allows to print one more message
		 * in an emergency or panic context immediately. But
		 * next	messages in these contexts will have its own delay.
		 */
		if (ctxt->emitted)
			printk_delay(false);

We need to check only ctxt->emitted. Otherwise, the delay would be
skipped for the last message. It would be bad when messages are added
slow-enough so that the kthread can emit them immediately and
the delay is always skipped. But it still might be too fast for a
human reader.

> +
>  		cond_resched();
>  
>  	} while (backlog);
> @@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
>  	}
>  
>  	progress = nbcon_emit_one(&wctxt, use_atomic);
> +	if (progress && ctxt->emitted)
> +		printk_delay(use_atomic);

Same here:

	if (ctxt->emitted)
		printk_delay(use_atomic);
>  
>  	if (use_atomic) {
>  		start_critical_timings();
> @@ -1584,6 +1593,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  			if (!nbcon_context_try_acquire(ctxt, false))
>  				return -EPERM;
>  
> +			ctxt->emitted = 0;
> +
>  			/*
>  			 * nbcon_emit_next_record() returns false when
>  			 * the console was handed over or taken over.
> @@ -1600,6 +1611,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  			if (nbcon_seq_read(con) < stop_seq)
>  				err = -ENOENT;
>  			break;
> +		} else if (ctxt->emitted) {
> +			printk_delay(true);

Similar here. We need something like:

		if (ctxt->emitted) {
			printk_delay(true);

		if (!ctxt->backlog) {
			/* Are there reserved but not yet finalized records? */
			if (nbcon_seq_read(con) < stop_seq)
				err = -ENOENT;
			break;
		}

>  	}
>  
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 4517266e9ca112e0dcb0163a99dd0e8d50931848..5df09e56cf8abc2d0555b6950eed4e483ba56d4b 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3206,6 +3205,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
>  		printk_legacy_allow_spinlock_enter();
>  		con->write(con, outbuf, pmsg.outbuf_len);
>  		printk_legacy_allow_spinlock_exit();
> +		printk_delay(true);
>  
>  		start_critical_timings();
>  

The rest looks good to me.

Well, the bool parameters are always hard to follow. I would prefer to
create two wrappers. They might be defined in kernel/printk/internal.h

static inline void printk_delay_atomic(void)
{
	printk_delay(true);
}

static inline void printk_delay_thread(void)
{
	printk_delay(false);
}

Or maybe rename the original printk_delay() to __printk_delay().
And use:

static inline void printk_delay_atomic(void)
{
	printk_delay(true);
}

static inline void printk_delay(void)
{
	printk_delay(false);
}


Finally, Sashiko AI pointed out that the delay is newly done while
holding console_sem and might trigger lockup detector warning, see
https://sashiko.dev/#/patchset/20260712-printkcleanup-v3-0-574547b8f71b%40thegoodpenguin.co.uk
I would ignore it until we see real-life problems.

Best Regards,
Petr


