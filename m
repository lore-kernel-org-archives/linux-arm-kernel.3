Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C7CCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24+DhovLXRowK75nxtwEh/hEzG0jJ1R1pyylOLaj9mw=; b=qJlOonaRYnJ84u4FfLjU67/e38
	hEwXSA6Zzvt1ftMq0uxbaPiygub3LgfGLZr4YLDQy0kV5l73MCJgbJ6xpmXyQGcN85mS31TkYZaq2
	Kf7f41WPR8tbwgQrqjlrNvwAD6s1l5G70drCXCw3+7Uv4+6nGt/NKRr3hYFt0FlCrnnWdy+YO2qkI
	ZZ1lPOtWHbJbZ0hP2qCpY2lXAO4HTLDS9BXBAtPZilwR5jHT21EO6R3rQ88GuzJ+xY2NdJLPBKOCe
	Eze30mPfMnDn7yF4FlLoUjUmmNgSMDSY9Lq/KHjqsg0+TTMDDVDIKLvH2E6A3x5HWr97C8ogtAUDh
	EZYIWXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQqN-0000000BDKY-1crs;
	Tue, 19 Aug 2025 18:13:59 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMYP-0000000AcTp-0HjV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:39:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so709238166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755610747; x=1756215547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=24+DhovLXRowK75nxtwEh/hEzG0jJ1R1pyylOLaj9mw=;
        b=GXtkAfRL7fdX31u6tx2iRG60yYBlgj0OUFkv8W/Fg36B5CZ9C3Xah+V7vF6rEcervt
         tMmfUip/xvPPtR21AXmME7G/4NAVN9XU2yQnQqbZmPJio8yXTsCfO5tLfG3HPnvCrVy0
         3dxX89weQTl11EUjxBN9Au1yhYWb7iFWxEEcXz5vTwE/OClwoTSrLwDR8nO9/397rX5Q
         wT9LOv1SlK0A6XvIZ0Mcq/hQy3Hsd5YsRo+yyKxxnFd4vCzG7BK3CULpcP9cLNmUI7jV
         UdDIUHsA5MzwVJpVKG2JI3ciqDbVlqiuceNJmi/Ic55zOaZEEqXoLCtEF2B6mnRDGBy7
         rEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610747; x=1756215547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24+DhovLXRowK75nxtwEh/hEzG0jJ1R1pyylOLaj9mw=;
        b=T7PPLJED1w/p+BjSrUR01qjnAZEYzeSGXBKuI1UluROM3PUlNystJvN4d0oUZt5fQr
         wa8lRHVxsssoP1WrnkKWDcoaNvKkvNHgd0kSJX9T/ksMlg6lYJqZV3Mrdk0zXoT1gFq8
         letiXX/uyiMyI89UUCu6KUAuJdb9gDzksnxXoeaTL9VTzulkegmfzvOmuP+eS2jHIpPd
         nFnSJ0W2SY+Xzhdr3WdK+QJ/oFPfhAf023+8byAE9IRN4n6+Q8dpRgbwsdjqITgeXEk8
         u+uOYnzf1sln6wmCELA+U9U+U6BXwhy/ao7wD00ZCT4XLYn0GtstwwU86VRn62UgTt0n
         RpRg==
X-Forwarded-Encrypted: i=1; AJvYcCWC9rj5lneHYxLsBsKCjUrsU2ORqGKgsirWbRGZpIlYFfEBVtk1X91Mr7X/6sThS/P4ExbOV2H5QXhvmQMXtXGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ8E/L/tNlagG8r4Hm8SGUTD+4WbJeXg3uWbAnGoJHvs0NOAL7
	j6hYjTgp1oD1VGPgAwlGw5Ge8LhsbBPtkwfuJKJYeyI27TOLEQlE14s1ZGF3YRX+rpY=
X-Gm-Gg: ASbGncs96TJpG0w5FXqOJxVb7nw/8L6uWqp4RsgKgiC+F+Bs7/vCOWxJ5pv8wGykRgX
	XR6h5pOBgCYZ5kgb2d2Ok/sKYYqjJXwYjkoVoArFHkISjVlhbjD6LMYGMWXiPSMn4ijQ0J93Q9G
	hIN8lCS4EFV7IidZ3SJMss5eoJSAifiQ+ztJfEjyf25+hyUhu3ZZxGwcRVLHIvHpLqxwr/tL8YO
	WnJVQyZ/IJniQD38zn06mhodfvxJDak4VYgpd9TMAUvrEwO0J1HnEw6IIRfbPGGgV5FBKgK8Ggf
	xyUJT1Q0Opg/FiIL27gPlPd4YBUZM5zdijUCnzhzdNcvkGI87aPqE0/creyUDWkQi67DFNFthGM
	EWCUJNNR6gDJaVwa7/mMuJc8C1Zfp1fpCshTa
X-Google-Smtp-Source: AGHT+IFp0IGZ5ZPsxOx8ZOcQIH9irjrlcYZTRa9qnfGYi1fwrDmtMMTExjhy4Qa5CnmntZ1UkEbjfA==
X-Received: by 2002:a17:907:86a9:b0:afa:1ef1:342a with SMTP id a640c23a62f3a-afddcb8326bmr270992966b.20.1755610746926;
        Tue, 19 Aug 2025 06:39:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccd37sm1012541266b.80.2025.08.19.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:39:06 -0700 (PDT)
Date: Tue, 19 Aug 2025 15:39:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: cuiguoqi <cuiguoqi@kylinos.cn>
Cc: catalin.marinas@arm.com, will@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org, farbere@amazon.com,
	guoqi0226@163.com, tglx@linutronix.de, akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com, joel.granados@kernel.org,
	john.ogness@linutronix.de, namcao@linutronix.de,
	takakura@valinux.co.jp, sravankumarlpu@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] printk: Fix panic log flush to serial console during
 kdump in PREEMPT_RT kernels
Message-ID: <aKR-eBMoMBa4fnrF@pathway.suse.cz>
References: <20250807112247.170127-1-cuiguoqi@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807112247.170127-1-cuiguoqi@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_063909_108485_7DD7AADD 
X-CRM114-Status: GOOD (  31.66  )
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

On Thu 2025-08-07 19:22:47, cuiguoqi wrote:
> When a system running a real-time (PREEMPT_RT) kernel panics and triggers kdump,
> the critical log messages (e.g., panic reason, stack traces) may fail to appear
> on the serial console.

How did you find this problem, please?
Were you investigating why a log was missing?
Or was is just be reading the code?

By other words, is this problem theoretial or did you found
it when debugging a real life problem?

I ask because there is no ideal solution. This change might help
in one situation and make it worse in other situations.
See below.

> When kdump cannot be used properly, serial console logs are crucial,
> whether for diagnosing kdump issues or troubleshooting the underlying problem.
> 
> This issue arises due to synchronization or deferred flushing of the printk buffer
> in real-time contexts, where preemptible console locks or delayed workqueues prevent
> timely log output before kexec transitions to the crash kernel.
> 
> The test results are as follows:
> [  T197] Kernel panic - not syncing: sysrq triggered crash
> [  T197] Call trace:
> [  T197]  dump_backtrace+0x9c/0x120
> [  T197]  show_stack+0x1c/0x30
> [  T197]  dump_stack_lvl+0x34/0x88
> [  T197]  dump_stack+0x14/0x20
> [  T197]  panic+0x3c4/0x3f8
> [  T197]  sysrq_handle_crash+0x20/0x28
> [  T197]  __handle_sysrq+0xd4/0x1e0
> [  T197]  write_sysrq_trigger+0x88/0x108
> [  T197]  proc_reg_write+0x9c/0xf8
> [  T197]  vfs_write+0xf4/0x450
> [  T197]  ksys_write+0x70/0x100
> [  T197]  __arm64_sys_write+0x20/0x30
> [  T197]  invoke_syscall+0x48/0x110
> [  T197]  el0_svc_common.constprop.0+0x44/0xe8
> [  T197]  do_el0_svc+0x20/0x30
> [  T197]  el0_svc+0x24/0x88
> [  T197]  el0t_64_sync_handler+0xb8/0xc0
> [  T197]  el0t_64_sync+0x14c/0x150
> [  T197] SMP: stopping secondary CPUs
> [  T197] Starting crashdump kernel...
> [  T197] Bye!
> 
> Signed-off-by: cuiguoqi <cuiguoqi@kylinos.cn>
> ---
>  arch/arm64/kernel/machine_kexec.c | 4 ++++
>  kernel/panic.c                    | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 6f121a0..66c7d90 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -24,6 +24,7 @@
>  #include <asm/page.h>
>  #include <asm/sections.h>
>  #include <asm/trans_pgd.h>
> +#include <linux/console.h>
>  
>  /**
>   * kexec_image_info - For debugging output.
> @@ -176,6 +177,9 @@ void machine_kexec(struct kimage *kimage)
>  
>  	pr_info("Bye!\n");
>  
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT) && in_kexec_crash)
> +		console_flush_on_panic(CONSOLE_FLUSH_PENDING);

IMHO, this is a bad idea. console_flush_on_panic() is supposed
to be called as the last attempt to flush the kernel messages
when there is no other chance to see them.

console_flush_on_panic() ignores console_lock() because it might
create a deadlock. This why vpanic() calls debug_locks_off() first.
But ignoring a synchronization might obviously bring another problems,
and break the system another way.

console_lock() should _not_ be ignored when we try to create
crash_dump(). It would increase the risk that the crash_dump
would fail. And crash_dump() is the preferred way to preserve
the kernel messages in this code path.

> +
>  	local_daif_mask();
>  
>  	/*
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 72fcbb5..e0ad0df 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -437,6 +437,8 @@ void vpanic(const char *fmt, va_list args)
>  	 */
>  	kgdb_panic(buf);
>  
> +	printk_legacy_allow_panic_sync();

I do not like this as well.

The commit message for the commit  e35a8884270bae1 ("printk:
Coordinate direct printing in panic") says that the primary
purpose is to disable flushing legacy consoles when printing
the backtrace by dump_stack(). This change looks OK from this POV.

But we wanted to delay this after __crash_kexec() and
panic_other_cpus_shutdown() because the legacy consoles
are not safe in panic(). They ignore the internal spin locks
after calling bust_spinlocks(1).

This change would increase the risk that __crash_kexec() would
fail. Also the legacy consoles are more safe after stopping
other CPUs.

IMPORTANT: The legacy consoles are blocked only when some
	"nbcon" console is registered. And nbcon consoles are never
	blocked. It guarantees that the messages are flushed on some
	consoles even before this call.

> +
>  	/*
>  	 * If we have crashed and we have a crash kernel loaded let it handle
>  	 * everything else.
> @@ -450,8 +452,6 @@ void vpanic(const char *fmt, va_list args)
>  
>  	panic_other_cpus_shutdown(_crash_kexec_post_notifiers);
>  
> -	printk_legacy_allow_panic_sync();
> -
>  	/*
>  	 * Run any panic handlers, including those that might need to
>  	 * add information to the kmsg dump output.

Best Regards,
Petr

