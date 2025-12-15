Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA265D5B841
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6JfhVrsDRUYR0znw7PF2A14GrzFwlQpn8CTBMp8rN8=; b=023U/Gf2bRoj/+dO4HuqLZZMLQ
	Vc6crPU3ITAfJVY8Wr9x3CxIGg8zLsMn5tsynA+f0x02FtBKqeWqXDkn67qTaCymkN6UkAG3gL+Kz
	Wkuan9WuCDbLRi94Fvk4XnKBNqCNbNDRTNbxyRoku6Sh93VG1N1Od9cfML+fgtzYRJrw3dORcq8ax
	6c25MR+tCCkOnBeXmcJmXK3vg6Rme3BO65iSz3k9w75hhhZjigEkzyAlOKTdICDESPphMgRsYg++R
	tRgYBaGhMzGLJBKC1PHOgoM4o1qyQ1PwjhSxVYIjj6QAnr6iHIG13+gDVdKlHnnd7S7GC5tdVLkV5
	4QIQcc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAm2-00000003vFQ-0rB7;
	Mon, 15 Dec 2025 15:46:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlv-00000003v8j-0Ada
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:46:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477563e28a3so27601965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765813560; x=1766418360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6JfhVrsDRUYR0znw7PF2A14GrzFwlQpn8CTBMp8rN8=;
        b=SR1FMlm6gWUSygEOrEm1SOa0Kb/MB/xT1DVdE4TCwbGP0k1a0wuzJBwS7hpt26k/yu
         TmrlPBX1NCu/hmk1ERBH9g9uo51fIw2WWU77/83XX311kc/1m+Pss0bA8qLOZLCMYgs1
         8AycIAsWJtXo9dRILFrdm/2zk8glau+I+78IVFU2DHk4487MHxX5MnmzmY98TyOUhIVq
         IfD3ea+1jvNlva+IbTEtm3PFyfMdY270/Wcfy7BU3Psmp7GTbM+5T/RE7a081Bt/mDP8
         daO+FdAVYTu4OW/vTFgTZIdyPzi4xtMxss/XK3Oy52gUsId8JNhpRLCa3XFakYLtbQAF
         2cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813560; x=1766418360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6JfhVrsDRUYR0znw7PF2A14GrzFwlQpn8CTBMp8rN8=;
        b=eJI1Ov1L17uSeMD1eSVBsEzFtbljiylMIuIKaRDHy3vzC1PHQytxQ+kpJtojH0V4ss
         UTg4LrESn2tXAGowJAeJ/npWh/zhkosLYAO9vod4c5yjkVpOT8SHYuU3ewosjs3fx7fG
         oCzoEo/XgQ3EjrFBye92GuMGn9orv6QzAlMjxwfIwSYuPs/nEvQYPwt1vXHrfkZtL/ch
         Ugo5WR0KkR6YbfKqJdk1+336g96i+I6irJ8dZsdPiph7jagBWoKn9FDRl8dsIhclCuBD
         zW1fwtcGcf6gNO1mOp/Kh+LDNvlxTGhjw+R4IRqT06xEt2IkBF0LF9+SInXCcyAl2jJe
         VChg==
X-Forwarded-Encrypted: i=1; AJvYcCVtyLZQDjmlvIDqJ/maBigzmUfhFfl45Hu60VW3EimmiAw0dJ6jddzI35LJa3RTdQbdnkUsjUC6nmBZ1qfostcO@lists.infradead.org
X-Gm-Message-State: AOJu0YxLixuaG4zqQgRc/gO6USEi1w2cTAck+3s+6uUqL0Ktm+m4+Zuv
	ICMCtMXdF7/oldVS5GdxKY29Tdh+sPqBAUq/pUHo4MTDHgUVvCE3Bt0/nKVyMzDEUT0=
X-Gm-Gg: AY/fxX4MxdZsIw/BtSPUaXFIMai13UCIKn7IyRb1MLTWLocaKw/B2i4vkrlHyRkq/x9
	XgchB4CvgWBvFQ0PUrKkCnQ2KqPJD/TPZVsu6Gklyh/ng+0d8b4CrMnbKBobCg7wySp5yU5GpvP
	yQt7iwanhfAibmiYfmU7i0tzUBBICqHWjlOxFZ13h3e3x291ZcEw2mRcAoMEr55C4/B0/FTzicR
	7xq3PyljSTFk1FTn8/ptmPjGqauVL8r6eP3aNMC/4Wf5HEVOa7RSOznc44q/xGWzGuDq+OkLZoc
	yz4Gmv/lMhWsJROj2uXREcvjRatQSKJpVYrh7B8e5XYSXkdCx7djLlTKGZtbnLIwEQdvxxQ14/3
	T1hsehYJnWewq1VZ68DWGXhFRnaNF8VfB1xzkSmgoo50ixAAla43rMOBwLNQDGTfrh1zf8NaUb8
	Z/Sq0FYyWjtfwfFA==
X-Google-Smtp-Source: AGHT+IEL2ySYtEiaRYvZXiXlVF7s0hOwCkdZdWshaGqSsdP2jwyOVBD8hvkUfg2yLLiKTJ9Af1DarQ==
X-Received: by 2002:a05:600c:46cb:b0:471:665:e688 with SMTP id 5b1f17b1804b1-47a8f2cacf3mr128997195e9.17.1765813560470;
        Mon, 15 Dec 2025 07:46:00 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f3a206csm69943435e9.3.2025.12.15.07.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 07:46:00 -0800 (PST)
Date: Mon, 15 Dec 2025 16:45:57 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Breno Leitao <leitao@debian.org>, linux@armlinux.org.uk,
	paulmck@kernel.org, usamaarif642@gmail.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, rmikey@meta.com
Subject: Re: [PATCH v2] printk/nbcon: Restore IRQ in atomic flush after each
 emitted record
Message-ID: <aUAtNbAIsR9_8IUo@pathway>
References: <20251212124520.244483-1-pmladek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212124520.244483-1-pmladek@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074603_283740_CC0B1E48 
X-CRM114-Status: GOOD (  19.57  )
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

On Fri 2025-12-12 13:45:20, Petr Mladek wrote:
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

JFYI, the patch has been committed into printk/linux.git,
branch rework/atomic-flush-softlockup.

It is fixing a real-life problem. I am going to give it few days
in linux-next and crete pull request by the end of this week
or at Jan 2, 2026 (before or after my Christmass vacation).

Best Regards,
Petr

