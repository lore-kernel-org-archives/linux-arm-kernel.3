Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC823CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hr7c+3FOU2JcV480M9kUOHZt6iGvTylWPKVomVAcFf4=; b=jrysNvT0KY0WMHgX+6iskNvZgx
	ktBkt2zRPpRF4d9Cs9xpYYbX/9mST+jzxBBbVQ321gtSkmq2CICVRjRXaj7yawh4X2b9e/vO1diH6
	PneepM7UqSEuZDogXAH/Lcw4veGexsBOsyRB5TIeTm53EeGIg8hqebaamEvpVTv+N58hGVDbCQaQG
	SSTYqXb0KmymXSQVlHxhp0U6FAtd23j1kXK7oDJyfW6RtZyX8L/6Rt4v7VR1/QbWdW9/JxDi672Hn
	mDoF5aaP12b8pP9cJYJydDPTVBnmZEe9HEN+QQRlB8uFIY+pEF9zhwWbLUzY0SNBYwoHSwpOYa4cS
	0F8ygPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbqq-00000003xJs-2D8F;
	Mon, 08 Jun 2026 15:25:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbqm-00000003xIY-3Xja
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 15:25:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so29460535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780932315; x=1781537115; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hr7c+3FOU2JcV480M9kUOHZt6iGvTylWPKVomVAcFf4=;
        b=Y2dCUW3Rc9OPpyCqgqqYyfvpOSwiXJKu/Cp42GvYY1MVenhg/tMdmDdlfevg4DP+Q7
         +3UPxrcz97yItIs+lUkmKiK8io/ycLMcDUbd5H4VlUnyjlEes/SrvBYU8vLpxPqBmLSa
         ln8aPcJ+QsmmNDHLunTGPfTbdWo5oe1r1vdQtht7EyGBT3+W5WS6aEHpIfb8NIQ+ikKu
         OFkEOMkvXWIKnLkD/COFVpGuQNZsDQ25LL51UGDHtT0Q9ZL6VwHFN5yhZ6MM8OTDWXV5
         lLc1B3vbEwsGeETDaU98ELljYdksSvzAyfv1D3SFjyr2OHbc269vjNGJH2gzQSFWeUpA
         DtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932315; x=1781537115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr7c+3FOU2JcV480M9kUOHZt6iGvTylWPKVomVAcFf4=;
        b=UppMZlwApxDgFqCuZtTbzVU1z6a8penenJFfAXNIVLuz8NRu+NEI6xnYjEeSH+vTF4
         iugdm5DNRV0HLgm6VVDSh1fPk40l0VrHExIjYDseLqnsICXDT6FKqfP/ZfuG7nyNJ+P2
         4VvY6jaSMvjxNIjqJFcNCT5UJRLq1rLdOtC/k88T/Vb9N+bJZXF/KxOr/qMvyYlcA+EB
         JoZbmmd04EzBjaPVEsPJy+WdWkoiU5lqTeR34qiDW3vgRElPflcr8fLOtwAAUHT4iMHt
         b/lwtWVwhz6AGALEPtY0tV+35LciRi1ElDkggphcUQP4axqh+mylRNUKFfIhFs7WiNdQ
         Xs3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8VRTArQJZ8RvZrirSg4tXA4wbdH/D0U34uakDBsk3ag0U7Y91dIg4FF4JoxqxzTXtjrkottk0/HaTHzGSPoagO@lists.infradead.org
X-Gm-Message-State: AOJu0YxjAZvgdot2EvREgRwLSpG607wnNPdTbLyhBT28tv89DHuh4uwU
	/keqXWc9/tEpJmDXK2YGx9Y915VsgA4WNJrJmV+G0+ZdiqgjaKtKzSers7bWLBEngek=
X-Gm-Gg: Acq92OF/duHfj9Dr2RrYRLsB0zEGkZfuOdWHV5316qg/+dT+CfkyJDxEmmBkzOXaR5t
	Yr6PVjKs8txLEIvgq8QgBxry9cqguLSNpWAEA7vFD//CaEAVKveKY6zkJ226NfRL2nResv7K4oL
	pTbXONM13pJQiNwVpPBG082KgjtIjE3HIgeG0IG03kMgqc1uubHzcYVnI6biIfvpa84MuojH2O7
	//GfYuPY3N/Kigkk0s0KfQmCnjFo25bAyNPC1kmfdlw17y+RTYftxamehZgVxns/htTsL4jZhiT
	esQFUn35j/8Vpcpr2xShXowZbfq+8vASLXoAMaQmvotqKeHACJqzN+YW710MUb4VsXy6jI1T08K
	l+2A2X4DDB7p07dVYq92NHlChWD4f7bMBo5wOBh32c5DYNFu7qGa33gcdqM1hCA7bj+SZeHoxf1
	jOH2EX4eW3ZEQA/Q3v6STqaV5OoTVVNVrL2kEI
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr294852765e9.7.1780932314828;
        Mon, 08 Jun 2026 08:25:14 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm369305055e9.3.2026.06.08.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:25:14 -0700 (PDT)
Date: Mon, 8 Jun 2026 17:25:11 +0200
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
Message-ID: <aibe12WcrLxVWTez@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-3-c34c187142a6@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-deprecate_boot_delay-v1-3-c34c187142a6@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_082516_932135_65C27DA4 
X-CRM114-Status: GOOD (  40.15  )
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

On Mon 2026-06-01 00:17:39, Andrew Murray wrote:
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
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h

The declaration is needed just inside kernel/printk/ directory.
It should better be done via kernel/printk/internal.h

> @@ -209,6 +209,7 @@ extern bool nbcon_device_try_acquire(struct console *con);
>  extern void nbcon_device_release(struct console *con);
>  void nbcon_atomic_flush_unsafe(void);
>  bool pr_flush(int timeout_ms, bool reset_on_progress);
> +void printk_delay(bool use_atomic);
>  #else
>  static inline __printf(1, 0)
>  int vprintk(const char *s, va_list args)
> @@ -326,6 +327,9 @@ static inline bool pr_flush(int timeout_ms, bool reset_on_progress)
>  {
>  	return true;
>  }
> +static inline void printk_delay(bool use_atomic)
> +{
> +}
>  
>  #endif
>  
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index d7044a7a214bdd4537a5e20d876d99bc3ffe8b3a..a507a2fed5bf4366e24330f763b842a698ecf6f7 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1267,11 +1267,16 @@ static int nbcon_kthread_func(void *__console)
>  
>  		con_flags = console_srcu_read_flags(con);
>  
> +		wctxt.len = 0;
> +
>  		if (console_is_usable(con, con_flags, false))
>  			backlog = nbcon_emit_one(&wctxt, false);
>  
>  		console_srcu_read_unlock(cookie);
>  
> +		if (backlog && wctxt.len > 0)

Heh, this is tricky. It might probably work but it is not guarantted
by design.

The "backlog" name is a bit misleading. The value is basically
wctxt.ctxt.backlog. The real meaning is that printk_get_next_message()
was able to read a message. It means that there _was_ a backlog.
But it is not clear whether there are still pending messages or not.

Also it is not clear that whether the message was pushed to the
console or not. It might have been supressed in which case
(wctxt.len == 0). But it might also be emitted only partially
when a higher priority context took over the console context
ownership.

I would prefer to explicitely set some flag when
nbcon_emit_next_record() really called con->write*().
See below.

> +			printk_delay(false);
> +
>  		cond_resched();
>  
>  	} while (backlog);
> @@ -1525,6 +1530,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
>  	}
>  
>  	progress = nbcon_emit_one(&wctxt, use_atomic);
> +	if (progress && wctxt.len > 0)

Same here.

> +		printk_delay(use_atomic);
>  
>  	if (use_atomic) {
>  		start_critical_timings();
> @@ -1584,6 +1591,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  			if (!nbcon_context_try_acquire(ctxt, false))
>  				return -EPERM;
>  
> +			wctxt.len = 0;
> +
>  			/*
>  			 * nbcon_emit_next_record() returns false when
>  			 * the console was handed over or taken over.
> @@ -1595,7 +1604,9 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  			nbcon_context_release(ctxt);
>  		}
>  
> -		if (!ctxt->backlog) {
> +		if (ctxt->backlog && wctxt.len > 0) {
> +			printk_delay(true);
> +		} else {

This changes the semantic. The original code call this when
no message was read. The new code would call this path also
when the output was suppressed. It would probably work.
But still.

>  			/* Are there reserved but not yet finalized records? */
>  			if (nbcon_seq_read(con) < stop_seq)
>  				err = -ENOENT;


As mentioned above, I would add a flag which would be set when
con->write*() was called.

It modifies the type of unsafe_takeover in struct nbcon_write_context.
But it actually makes it more compatible with struct nbcon_state.

My proposal (on top of this patch):

diff --git a/include/linux/console.h b/include/linux/console.h
index 5520e4477ad7..5a86942e55ef 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -290,6 +290,7 @@ struct nbcon_context {
  * @outbuf:		Pointer to the text buffer for output
  * @len:		Length to write
  * @unsafe_takeover:	If a hostile takeover in an unsafe state has occurred
+ * @emitted:		The write context tried to emit the message. Might be incomplete.
  * @cpu:		CPU on which the message was generated
  * @pid:		PID of the task that generated the message
  * @comm:		Name of the task that generated the message
@@ -298,7 +299,8 @@ struct nbcon_write_context {
 	struct nbcon_context	__private ctxt;
 	char			*outbuf;
 	unsigned int		len;
-	bool			unsafe_takeover;
+	unsigned char		unsafe_takeover	:  1;
+	unsigned char		emitted : 1
 #ifdef CONFIG_PRINTK_EXECUTION_CTX
 	int			cpu;
 	pid_t			pid;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index a507a2fed5bf..060534becefc 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1069,6 +1069,9 @@ static bool nbcon_emit_next_record(struct nbcon_write_context *wctxt, bool use_a
 	else
 		con->write_thread(con, wctxt);
 
+	/* Tried to emit something. Might be incomplete. */
+	wctxt.emitted = 1;
+
 	if (!wctxt->outbuf) {
 		/*
 		 * Ownership was lost and reacquired by the driver. Handle it
@@ -1267,14 +1270,14 @@ static int nbcon_kthread_func(void *__console)
 
 		con_flags = console_srcu_read_flags(con);
 
-		wctxt.len = 0;
+		wctxt.emitted = 0;
 
 		if (console_is_usable(con, con_flags, false))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
 
-		if (backlog && wctxt.len > 0)
+		if (wctxt.emitted)
 			printk_delay(false);
 
 		cond_resched();
@@ -1530,7 +1533,7 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 	}
 
 	progress = nbcon_emit_one(&wctxt, use_atomic);
-	if (progress && wctxt.len > 0)
+	if (wctxt.emitted)
 		printk_delay(use_atomic);
 
 	if (use_atomic) {
@@ -1591,7 +1594,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			if (!nbcon_context_try_acquire(ctxt, false))
 				return -EPERM;
 
-			wctxt.len = 0;
+			wctxt.emitted = 0;
 
 			/*
 			 * nbcon_emit_next_record() returns false when
@@ -1604,9 +1607,10 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			nbcon_context_release(ctxt);
 		}
 
-		if (ctxt->backlog && wctxt.len > 0) {
+		if (wctxt.emitted)
 			printk_delay(true);
-		} else {
+
+		if (!ctxt->backlog) {
 			/* Are there reserved but not yet finalized records? */
 			if (nbcon_seq_read(con) < stop_seq)
 				err = -ENOENT;

