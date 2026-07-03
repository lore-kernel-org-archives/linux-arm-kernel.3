Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D296C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExOHSK3CI7w8Qx7zhNqd6+97gfyapZZ4gckpH8gnop8=; b=HLT4YcqGNHtA5hWHsQzcZCHAY1
	X+EESTcJ+HKstkuV6F98MCUqDo+fz/mSQ8H/Lnpxq3shIQpqKC/yMUBG8C8GpeYlLcPUuqN3UHP32
	aceincMtwRKuQrlTvOJFBinFXjuNVR1jImKiyXs8WQs0IyP8F43MQ1f1ujY7XJyvExaGDUid5kzkR
	tOvjZLSqbs+vyFs1Fpca/rYMFJ9pRvENM4lbnBbsXhhAyYDpITzRHavRDNgmEeL3+r5bQoNaZ8Qot
	eTQZ0CnQwTctclMscZjdFWTV9eZ9uR2tW7lI8r8Ar/5eS0JuGJHQrTs0E9Hy0JBq55vINaxCefGVe
	toxNxrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdSx-000000071WP-2w0x;
	Fri, 03 Jul 2026 12:57:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdSu-000000071V4-2ami;
	Fri, 03 Jul 2026 12:57:58 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783083472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ExOHSK3CI7w8Qx7zhNqd6+97gfyapZZ4gckpH8gnop8=;
	b=gFDJJDMoLngo4YmHo0ybSQlBpP1891OHy9boiilNkhlrNk7irpKYyPH1gA8782eZZg1cJC
	zIwmgaL6mlnakEtCcinhZ40DqDZ2uKPR1IVDQOQITD1EINWKhCBWIQHl1Q7Wde0H0wCQ1N
	v4uDbikok2cI9yx4ceqs7LzFGkIwjGlxrWTjLQx7wtIPliR1DE6mVEppE5KrAhm6o+izNJ
	jTk6GpaBgdR7wrDL8bPSa2h9/wEixZSwOjVaChigplU1yZxlKhWHnSdojbjkdkuw2vtoO9
	U+C0saXH0ExMiUi2v9XxOvwC4DQvv37XScA8FO7oKHDxH5nwrVFcdkZ5Zsz+Bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783083472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ExOHSK3CI7w8Qx7zhNqd6+97gfyapZZ4gckpH8gnop8=;
	b=v1RWWjRx6NJRFvACEhlyvXJxTa3oTzptyUySp2/ZfBTTsP7MKcfIMBECLVHncRNsz3jHxJ
	MSdOhQ9ywN74rNCw==
To: Andrew Murray <amurray@thegoodpenguin.co.uk>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Russell King
 <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
In-Reply-To: <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
Date: Fri, 03 Jul 2026 15:03:51 +0206
Message-ID: <87zf08w7qo.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_055756_837073_0EB70A0F 
X-CRM114-Status: GOOD (  18.97  )
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

Hi,

Sorry I am so late to this party.

On 2026-06-30, Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> diff --git a/include/linux/console.h b/include/linux/console.h
> index d624200cfc1708bf73925892a466efe0c95c5586..3478b556c0eb9579530409dc6fbb9b5a8bff581c 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -290,6 +290,8 @@ struct nbcon_context {
>   * @outbuf:		Pointer to the text buffer for output
>   * @len:		Length to write
>   * @unsafe_takeover:	If a hostile takeover in an unsafe state has occurred
> + * @emitted:		The write context attempted to emit the message. Might
> + *			be incomplete.
>   * @cpu:		CPU on which the message was generated
>   * @pid:		PID of the task that generated the message
>   * @comm:		Name of the task that generated the message
> @@ -298,7 +300,8 @@ struct nbcon_write_context {
>  	struct nbcon_context	__private ctxt;
>  	char			*outbuf;
>  	unsigned int		len;
> -	bool			unsafe_takeover;
> +	unsigned char		unsafe_takeover : 1;
> +	unsigned char		emitted		: 1;

This is the wrong structure to add this flag. This structure is for
the nbcon drivers.

struct nbcon_context would be the correct structure.

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 4b03b019cd5ee25d68e9ace84392045e91241a7f..ae45cb0589c0effafc66f1756bdaecd1c1e53ab9 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
>  	}
>  
>  	progress = nbcon_emit_one(&wctxt, use_atomic);
> +	if (progress && wctxt.emitted)
> +		printk_delay(use_atomic);
>  
>  	if (use_atomic) {
>  		start_critical_timings();

This is too deep (also pointed out by Sashiko) because it multiplies the
delay times the number of consoles. For the legacy printing, it would be
more appropriate to put the delay inside console_flush_all() and
legacy_kthread_func().

> @@ -1584,6 +1593,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  			if (!nbcon_context_try_acquire(ctxt, false))
>  				return -EPERM;
>  
> +			wctxt.emitted = 0;
> +
>  			/*
>  			 * nbcon_emit_next_record() returns false when
>  			 * the console was handed over or taken over.
> @@ -1600,6 +1611,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  			if (nbcon_seq_read(con) < stop_seq)
>  				err = -ENOENT;
>  			break;
> +		} else if (wctxt.emitted > 0) {
> +			printk_delay(true);

@emitted is a flag:

		} else if (wctxt.emitted) {

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index cc203327247aa4f81f55b907c66ac88f30ce6da8..5278d9cb19e4177a00998fba5c1438251e033578 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3211,6 +3208,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
>  		*handover = console_lock_spinning_disable_and_check(cookie);
>  		printk_safe_exit_irqrestore(flags);
>  	}
> +	printk_delay(true);
> +

Again, too deep. Let console_flush_all() and legacy_kthread_func()
perform the delay appropriately between each message.

John Ogness

