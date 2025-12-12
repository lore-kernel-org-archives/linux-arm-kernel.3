Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0662BD49224
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvGr9d/dIygxRx5cPl0O+or//LHhG9RUJzHpGhU+TaQ=; b=vBddOZ2cZtZMt1C3agDg413fDG
	UGO+5BYMrJDIDsjEpdbFlvIN3l8bucU1qAUUWf5BkTsv/f61UVbO66wLGSAjMmQ3MUfwYxjx/z98M
	X0/T89ZrMieDAwP0fZCleq/UhopDR1VT//8ZlXr1fqqvMrLt09rLm/M6vuDumBqldiikOhBZ6QDFt
	vam+Ttde+8R2SJbCC57bLAcM8v1Bwo8uWYIQVjw+fIXw6BA86HQeBtc+EDkuQ5iIP/5HX3DSfNUFX
	2SUcpDAZYAqAJ9JFVWskgs0kqHXAgIk1y/gDjtX/0gGTg9eLDWJqJx4YK5S+0OcC2yGVV73Vv7cgC
	AHZH0qpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU3Jt-00000000ZLi-3d2f;
	Fri, 12 Dec 2025 13:36:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU3Jq-00000000ZLI-3SrN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 13:36:28 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765546575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvGr9d/dIygxRx5cPl0O+or//LHhG9RUJzHpGhU+TaQ=;
	b=u+zgpe/rVwjvxJ0aDunB2fzLzufw5TN5tySCv2MvzLF8yM35SL66QlQMqWqBo9iwrd+r9Q
	qpsgBWKQxmxzl5my9G6JhgCkLKtcHxgKFp8BSR9C1KCzYrj3i06bagyhfUkUKnCPVxcUuV
	NHt4ACOagzYD6AotlQVkd9I4Bf0D+5Qq9ptf6qvAniP/kdx3smoeaYipvU1bhkYzwbRS0k
	Kanen2XNPRv/c37NEiwGDqak6aEk2jzaLg57lNg9kEx6KC28tNRbx0haP+4yje44T8n/TQ
	+G0P3rWtfyVBwDYwG/KlyomsiGkZNbzbfnd7tBz1KpCHFxfwSCIT4YKYcNSf2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765546575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvGr9d/dIygxRx5cPl0O+or//LHhG9RUJzHpGhU+TaQ=;
	b=41ud9jzbEd6zFqqWX0LKaQK58au+fC+nUfEmKAOiwM5Z5z0w3w5hNRt6g6GaquQjocXcng
	Haf1mq6LpcEh+kBg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Breno Leitao <leitao@debian.org>,
 linux@armlinux.org.uk, paulmck@kernel.org, usamaarif642@gmail.com,
 leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com, Petr
 Mladek <pmladek@suse.com>
Subject: Re: [PATCH v2] printk/nbcon: Restore IRQ in atomic flush after each
 emitted record
In-Reply-To: <20251212124520.244483-1-pmladek@suse.com>
References: <20251212124520.244483-1-pmladek@suse.com>
Date: Fri, 12 Dec 2025 14:42:14 +0106
Message-ID: <87v7ibhlf5.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_053627_005919_D7F8E83C 
X-CRM114-Status: GOOD (  13.55  )
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

On 2025-12-12, Petr Mladek <pmladek@suse.com> wrote:
> The commit d5d399efff6577 ("printk/nbcon: Release nbcon consoles ownership
> in atomic flush after each emitted record") prevented stall of a CPU
> which lost nbcon console ownership because another CPU entered
> an emergency flush.
>
> But there is still the problem that the CPU doing the emergency flush
> might cause a stall on its own.
>
> Let's go even further and restore IRQ in the atomic flush after
> each emitted record.
>
> It is not a complete solution. The interrupts and/or scheduling might
> still be blocked when the emergency atomic flush was called with
> IRQs and/or scheduling disabled. But it should remove the following
> lockup:
>
>   mlx5_core 0000:03:00.0: Shutdown was called
>   kvm: exiting hardware virtualization
>   arm-smmu-v3 arm-smmu-v3.10.auto: CMD_SYNC timeout at 0x00000103 [hwprod 0x00000104, hwcons 0x00000102]
>   smp: csd: Detected non-responsive CSD lock (#1) on CPU#4, waiting 5000000032 ns for CPU#00 do_nothing (kernel/smp.c:1057)
>   smp:     csd: CSD lock (#1) unresponsive.
>   [...]
>   Call trace:
>   pl011_console_write_atomic (./arch/arm64/include/asm/vdso/processor.h:12 drivers/tty/serial/amba-pl011.c:2540) (P)
>   nbcon_emit_next_record (kernel/printk/nbcon.c:1049)
>   __nbcon_atomic_flush_pending_con (kernel/printk/nbcon.c:1517)
>   __nbcon_atomic_flush_pending.llvm.15488114865160659019 (./arch/arm64/include/asm/alternative-macros.h:254 ./arch/arm64/include/asm/cpufeature.h:808 ./arch/arm64/include/asm/irqflags.h:192 kernel/printk/nbcon.c:1562 kernel/printk/nbcon.c:1612)
>   nbcon_atomic_flush_pending (kernel/printk/nbcon.c:1629)
>   printk_kthreads_shutdown (kernel/printk/printk.c:?)
>   syscore_shutdown (drivers/base/syscore.c:120)
>   kernel_kexec (kernel/kexec_core.c:1045)
>   __arm64_sys_reboot (kernel/reboot.c:794 kernel/reboot.c:722 kernel/reboot.c:722)
>   invoke_syscall (arch/arm64/kernel/syscall.c:50)
>   el0_svc_common.llvm.14158405452757855239 (arch/arm64/kernel/syscall.c:?)
>   do_el0_svc (arch/arm64/kernel/syscall.c:152)
>   el0_svc (./arch/arm64/include/asm/alternative-macros.h:254 ./arch/arm64/include/asm/cpufeature.h:808 ./arch/arm64/include/asm/irqflags.h:73 arch/arm64/kernel/entry-common.c:169 arch/arm64/kernel/entry-common.c:182 arch/arm64/kernel/entry-common.c:749)
>   el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:820)
>   el0t_64_sync (arch/arm64/kernel/entry.S:600)
>
> In this case, nbcon_atomic_flush_pending() is called from
> printk_kthreads_shutdown() with IRQs and scheduling enabled.
>
> Note that __nbcon_atomic_flush_pending_con() is directly called also from
> nbcon_device_release() where the disabled IRQs might break PREEMPT_RT
> guarantees. But the atomic flush is called only in emergency or panic
> situations where the latencies are irrelevant anyway.
>
> An ultimate solution would be a touching of watchdogs. But it would hide
> all problems. Let's do it later when anyone reports a stall which does
> not have a better solution.
>
> Closes: https://lore.kernel.org/r/sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu
> Tested-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

