Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B76C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/Aj/fQ0/cX0gUBelTJEVsUYvKgREoT3ILbqcgtsbZk=; b=phFtxVN81nGUCkykdSBPAC1bci
	HYd/fOzMBdialeAAUD6zr2opr9lnrMihaKjC8MrLvfLkl6Jk7QAvXhIJNAROddC5JaChw8MEVGlkE
	K6WL7f5Xd83rHEyx5RNrOVK+P2Tt++zksnut9GRmGQTDVNi8NaogEvXZY8lUvtO3P5cNuDMeElpj8
	rLYjQg+Gu8Eyz3hi+0wPKmDeHD/YtU5gVpZ7uXqui6RPQFLRamK7+uNYLzdtRgHPyAK54iqvVXURt
	nCrNmesxI9L4qQi+A4DOLJk5EGkkwBFlPOrwIdp8UraeW053EdmmO6GlXiV0SbgcTwJKsasZAGX7Y
	DFqpUmiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpjP-00000002l0b-1aGF;
	Thu, 09 Jul 2026 14:28:03 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpjM-00000002kzj-2Z9c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:28:02 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6a198cdc4e4so731352eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783607279; cv=none;
        d=google.com; s=arc-20260327;
        b=hNq2ATPQJ9KvYc5boJNS75iBBNXuipJwl9do8o0UMY49jq9Y7i8JFFnQYkE0gerwkw
         ZzK8vUkMyKGalBnHQJsBSNFVr4UovpIuLftSxyKmIkzlE0p+u5PHjQTePLoBgUNYokWa
         4l9cwx505TvTdl2WE2jL9JECCSsXX4DuTkg3SDZBUf6zUOTQIirIRsaNuWB1KJuASDWT
         6Bm3XRkCzJN9E/DoMDIRP97gDdWBqJhy5kfjmL3wlK0u3LroC3XamPiLx2O16YpX+qhi
         qxG6hpejRHrJUDhGvFA0F7B+65fgkPyLpnHxp+uQFtOM0SDCR1aAFG1rBsdY6JZOe1LD
         uOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o/Aj/fQ0/cX0gUBelTJEVsUYvKgREoT3ILbqcgtsbZk=;
        fh=vOo6TEL1n3QCAlzb314JnE5LjZKYwzG1ar9WdNbt5u0=;
        b=gqDsxzGYBeYtszM+2lZe4xPBRBx02Mw8WV44QUtxy0g5GyljojjZQJyAMMCE3+dGd9
         Z/f46KQS6ZvuBrt5x8+qxjC3wyOkrYMHubZEhSFI2+N5VXXba7ao7E/66TFkgJp0xxIO
         ZZHjaNRj7EUhbqiMh9vFe4JZ+VUVtAIpHyLPrVFu7xufhvv3zt3m/qnj5BRriYkYwHU1
         wVEG6R3rW8UvFUcZU6s9V4THdWXOQoGk8CS0ql42L+5s2fQJk6Mb0+rUbOXksZJHVXlk
         zj9dnurrDcN/G7T61Bt33j8Z319AmbfHMnW80NA7AAfVNR88ermnaZVby8uUkuXmpCTE
         UCRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783607279; x=1784212079; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/Aj/fQ0/cX0gUBelTJEVsUYvKgREoT3ILbqcgtsbZk=;
        b=gF5Ft7xW4SgxEpnch7UwPbcm77YHLhYzx6CUXwOIOb/v7rjXRpTJyI7c3LrMQ3HNpt
         qNBI94IYKbW2IUsjEqASXMlBHL5uS5VNxgbo9Y0cvSeWQWdqvhubvbGsfvRJUePX775B
         YsQjzLcIw+0+O5Qj6i/UmcnRILxypLjz99S+c4pV2//PQg1jtaW52KNUO7b2C55DdUXq
         uzW0/SIJBMUbpBcXFAX64ByztK+EV7a043bi0syNFIUj+tWi3Z4dk7jxpxs/7YjVq+87
         cdMT4ebvHXl7gc3SQgPtjSXpe/e7fcYIGJnDmsblXORUG286SJUKyKO+ytiWso5KyRiw
         zmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607279; x=1784212079;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o/Aj/fQ0/cX0gUBelTJEVsUYvKgREoT3ILbqcgtsbZk=;
        b=ClBFkKbNrvA8tq+KtLMbN2obZGKP2VPRN8jNQzFxnmCkGLNemf6SFXT/ijc87fNor5
         ms5H/0ObR1lFbkhNcp8XcYu+qcRlQsXVpph+VI0znL4OraD3ul/6TYjzKTvDVTGDedJc
         Wcnmp+AKWTxBEnolZFYXWfj9dDEBfRuBsfRfp/cAoR5GDajxyqExbXXiM5pFazPVTrVJ
         +7kvzbNtDwzfeCXk0iOb9PDESVPYFDdEpN4G+JTDgL6ct8MFEdQq137SxtWsnDjpK75j
         o8uQ0KXTFFUlhP2OmlqEU9XymeT/sB8lSq1aKHOs1yk4uik6nNYbIk8e091jFQECXx/H
         AMCA==
X-Forwarded-Encrypted: i=1; AFNElJ8ofW2hTSIaIE0mEAwOrAhu56ccDnzdyALHGbfE4GxrfiC+7BFNVBeAOvO1t3rS2rpr6Wp6tpsQSGPKRLDqmEO9@lists.infradead.org
X-Gm-Message-State: AOJu0YzdOnyXX8xY+n7LIM9f9WlZ6AuqQDY0rC9+x98kRFy5oULuG8I1
	WlueVMWgXAmhLJytlCgpP3Jhmig5qvl0isIZu/wmwsgirH+q/u0/SshYMC6coDd8/PIKLxhZijR
	k1Sj31b0dfNDCXsbpAEhxwK3tnipC2myGIuWzjvxr4Q==
X-Gm-Gg: AfdE7cnmN6n/YnY7iCVPdx1XJ4iewV6iUf3WOi6OQCThxEJ8nHxAv8iF2fmxj4my+Bi
	c5VnZ+4dgHdqLN9T187u+VVYODIHtoxcotT0zVXDbUYyvIG+AHLlzJr/7Ck7qaew8kYtpO6XVUQ
	X52M1vl7c0eaY1cINt6i5x8UQWXA+vrTbIGMGm0EMFYjDwz2QIpTJ0Fs9D3F1N8i/0JpuXVLxfV
	BiQMA6iixAOLH+H+ugKup3nkZWEJ9/v2iNRMi0cVM5TMe0JTCgQxYUcYIC8HoldL8vuxFzWoNQ+
	2UvaepK6de5Nvx0eEm+n4jdJjUWIiNVR/3GroeZK8acvKSEv5rdho1OjMSy/87fvxOK2AAiJIF4
	GLZkD/t3R/51zseH7IVpn06biNvDV
X-Received: by 2002:a05:6820:210d:b0:6a1:87cb:c34e with SMTP id
 006d021491bc7-6a36da8c20amr5154700eaf.72.1783607279485; Thu, 09 Jul 2026
 07:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra> <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz> <87qzldvqpm.fsf@jogness.linutronix.de>
In-Reply-To: <87qzldvqpm.fsf@jogness.linutronix.de>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 15:27:47 +0100
X-Gm-Features: AUfX_mz4PcZ8QKTOvulicXteeeMZuJNGsMqSn_rhQXpmhC8-QWtUxRPj3PV0YiM
Message-ID: <CALqELGx+7RSKL0+kdOxu0TpXaOifYkzxmOTv+4gTSHqrbLEJ5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Benedikt Spranger <b.spranger@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_072800_915392_5EEDD3ED 
X-CRM114-Status: GOOD (  38.23  )
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

Hi John,

On Wed, 8 Jul 2026 at 09:19, John Ogness <john.ogness@linutronix.de> wrote:
>
> On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> > To summarize this discussion:
> >
> >   + Benedikt would prefer to add the synchronous mode before
> >     moving the delay from the printk() caller to the console emit
> >     code path.
> >
> >   + The delay in the printk() caller code path did not guarantee
> >     the output but it increased the chance to see it.
> >
> >   + The synchronous mode will be even more reliable than the delay
> >     in printk() caller path.
> >
> > Please, let me know if I did not get it right,
> >
> > John, did you have any plan how to add the synchronous mode, please?
> > Does it look complicated?
> >
> > I guess that we would somehow need to "mis-use" the emergency
> > priority and force it everywhere by some global system setting.
>
> The synchronous mode would rely on the driver being nbcon. I envision
> something like this:

Is it possible to apply synchronous mode for both nbcon and legacy
consoles? For the debugging case Benedikt suggested (is this the main
use case for this feature?), it would be helpful if a developer could
indicate a preference for synchronous mode without first determining
the console type. Though I'm not sure what means you propose to
indicate such a preference.


>
> ---- BEGIN SYNC IDEA ----
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 2fe9a963c823a..beb5bb3c037b5 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2456,6 +2456,8 @@ asmlinkage int vprintk_emit(int facility, int level,
>
>         if (ft.nbcon_atomic)
>                 nbcon_atomic_flush_pending();
> +       else if (have_nbcon_console_sync)
> +               nbcon_atomic_flush_sync_pending();
>
>         if (ft.nbcon_offload)
>                 nbcon_kthreads_wake();

My interest in misusing (not proposing that as a solution) the
emergency mode, is that the flush mode is nicely abstracted by
printk_get_console_flush_type. Depending on how you trigger the sync
mode, could printk_get_console_flush_type be expanded to look at a
flag and return ft.legacy_direct, ft.legacy_offload or
ft.nbcon_atomic_sync ? I.e. if a sync flag isn't set then
printk_get_console_flush_type returns based on NBCON_PRIO_type but if
it is, then it shortcuts to ft.legacy_direct, ft.legacy_offload or
ft.nbcon_atomic_sync?

I'm not familiar with this area of printk, so please forgive any
obvious issues with this. But as someone that happily uses printk to
debug the kernel, it would be nice to have an easy way to do this
without the friction of figuring out what console I have.


> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 4b03b019cd5ee..8f8f29f757614 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
>         cookie = console_srcu_read_lock();
>
>         flags = console_srcu_read_flags(con);
> -       if (console_is_usable(con, flags, false)) {
> +       if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {
>                 /* Bring the sequence in @ctxt up to date */
>                 ctxt->seq = nbcon_seq_read(con);
>
> @@ -1654,7 +1654,7 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>   *                                     write_atomic() callback
>   * @stop_seq:                  Flush up until this record
>   */
> -static void __nbcon_atomic_flush_pending(u64 stop_seq)
> +static void __nbcon_atomic_flush_pending(u64 stop_seq, bool sync_only)
>  {
>         struct console *con;
>         int cookie;
> @@ -1666,6 +1666,9 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>                 if (!(flags & CON_NBCON))
>                         continue;
>
> +               if (sync_only && !(flags & CON_SYNC))
> +                       continue;
> +
>                 if (!console_is_usable(con, flags, true))
>                         continue;
>
> @@ -1688,7 +1691,12 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>   */
>  void nbcon_atomic_flush_pending(void)
>  {
> -       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
> +}
> +
> +void nbcon_atomic_flush_sync_pending(void)
> +{
> +       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), true);
>  }
>
>  /**
> @@ -1701,7 +1709,7 @@ void nbcon_atomic_flush_pending(void)
>  void nbcon_atomic_flush_unsafe(void)
>  {
>         panic_nbcon_allow_unsafe_takeover = true;
> -       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
>         panic_nbcon_allow_unsafe_takeover = false;
>  }
>
> ---- END SYNC IDEA ----
>
> BTW: The sync mode is the final piece so that PeterZ can start using
> mainline code for debugging by serial instead of his own workaround [0].
>
> John

Thanks,

Andrew Murray

>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=debug/experimental

