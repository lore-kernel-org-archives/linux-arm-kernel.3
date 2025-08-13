Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01BFCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihlo7ylUGW7wZsGWuOHUqv/CYuxjb+ZuvYxiMymfvww=; b=oXWlx2FFAZwUwHCHImkUrh8zO/
	/d2c3+0ex/ZOpbIMV/Co1lTA1YBFKeU58Bsowf/ye2aD5x2b6AzEesQQTZoUsrOib9T2quusrFY0J
	MJiyb7xammRbxxq0dJE9nGBq93LCKunwahc8nrjzA8RX/p+1QP2m2JAXpN6eTmv6ohCcTM3b1E1zy
	QJ95DCglNFAQEnRhqFsuIHVGWCfFgaRZhd+21vor6Y8YihnlKFMXv+IXO1l1NxmOCXtVhbpV59/Y5
	QBMOMkuwrBXd47YtIZ8H8Pj1JxuhddP0EV2TkQHFcVkEoxSQ1KDMdid6oMk7fB3MwTdi1FVKNmuTi
	GFY8wktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAJF-0000000Dbf2-1vcl;
	Wed, 13 Aug 2025 12:10:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9MQ-0000000DU8s-2rAx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:09:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b780bdda21so5206347f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755083377; x=1755688177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihlo7ylUGW7wZsGWuOHUqv/CYuxjb+ZuvYxiMymfvww=;
        b=SlTCkzVfQkbAprzpbp+oSiW1lr95rarrsUURk82NXtlr8uXzakgfVNslsdHdeKSu+v
         bmJ3nzYbOxTwkqbx1xyUavQztXF4QJWJkPK8aZ5ES8sD9AD6/0LK3jV0NyMuoAwVwRge
         ZLMjdu66jQaiWyn46zdemzFxxRm7/B6Tp8i9Mb9EjAkzss+O2nPD0ibG/GS7Dq5uKPkV
         1SvFcSlQ7O/gt2+f2ZjzHUb2J59G+L3lb2J4xffB5wAc+RMZBMuEuiCIzK2dVZEFqo5e
         dn+HVGSMunNUvC0GKNbh6z29FEPIWDl/IB//kWQ386spp/xAJofZm58v6x+1CynJm6++
         ZWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755083377; x=1755688177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihlo7ylUGW7wZsGWuOHUqv/CYuxjb+ZuvYxiMymfvww=;
        b=H6YXptk9NrxfodNicwzUbUMdbk4cN+i4ZM17E3KnO4x+P+ONvGFUg8Q+kz82KVZrCB
         6wCVnd81GZCXJZRhFOh6jc666hl4ftPjbqdLh9PnJulNI4/Lcvs4J2pHVxoGicU1mAkd
         UY7f82I18Nb7pgSOwR+v1l9jssf4HzLakuDnH+GinVxSYjd2OTJhsjEeiJmkFvIPRHpx
         GcU22d3KZ5hI+fWj9L9FUnvTvfu3CchPhDbKzHmo445c8xFBZXfhNav6d/iOG4R8lBiO
         J/Z+98ZVnrOTE7rdroq7AmT3jKnQBa+JMpuMSTUyXeU26/EQkpdpxliMiZGDaV5kHWLv
         aflg==
X-Forwarded-Encrypted: i=1; AJvYcCVKKmSwHY5Cw6kQEg86t3SuDY9gMWLRPjybgbEBole64tk5ARE3+AIO5NdFQRQ3Nt2Pz9rB3JlNHJKnOguwd3D8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6BqmHblmY6mjGUgAMCjxECntLm+K6frVp6AXtN1ankyxsIjWP
	3mH5dO/Q+FDa2tUvuUoWpRaROg6eZvaQ4dkbMww9ZH2A4DDVLZrGXqWF
X-Gm-Gg: ASbGncun+6xlvS41ifnNoenm4DEt9aFNlPghYNP7YWrbM7Q41M+2ltOq0QvHwmWWjXX
	uabcJa4iyEeJo6lhFk+CbpdAY4CEmBAC6M9kygg0mjMi3zrNmGE0uVrt0LJvhBIldH1bdD/pCwM
	p0cfjekyeyX6zw+ktBY+eaYPLCTLCLyC6t0cHrvNShruEl4NDCnASKgMych3cNZ1odqwcKCENTQ
	gzpLWmNp9PmfjxEoVixg+x2cJAV7LzNYSmy67BFMiloBDmbnJSshVOB/93KGq91MzkDMEwc0SOa
	uFBMgoX3c2g8wbHQfOSpkl9I2+DoEjGg7OndQ0Aisd0K4k79C5rl3YUxmya1XPIZvmjfg0lg
X-Google-Smtp-Source: AGHT+IETSOLlR59YRwctEzPBeHp5gfFmJ1QGN0Lmnm3+uuS6XuM5Uw0ufwMK4okqdZJUlZO4IgB3UA==
X-Received: by 2002:a05:6000:22ca:b0:3b8:fb31:a42d with SMTP id ffacd0b85a97d-3b917e88b83mr1526542f8f.34.1755083376430;
        Wed, 13 Aug 2025 04:09:36 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::31e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf970sm47108906f8f.25.2025.08.13.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:09:35 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 13 Aug 2025 13:09:33 +0200
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 00/10] ftrace,bpf: Use single direct ops for bpf trampolines
Message-ID: <aJxybRed6B1Zx_Th@krava>
References: <aIn_12KHz7ikF2t1@krava>
 <aIyNOd18TRLu8EpY@J2N7QTR9R3>
 <aI6CltnCRbVXwyfm@krava>
 <aJMsWB2Sxb7-66zs@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJMsWB2Sxb7-66zs@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040938_747368_5941D5A9 
X-CRM114-Status: GOOD (  46.71  )
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

On Wed, Aug 06, 2025 at 11:20:08AM +0100, Mark Rutland wrote:
> On Sat, Aug 02, 2025 at 11:26:46PM +0200, Jiri Olsa wrote:
> > On Fri, Aug 01, 2025 at 10:49:56AM +0100, Mark Rutland wrote:
> > > On Wed, Jul 30, 2025 at 01:19:51PM +0200, Jiri Olsa wrote:
> > > > On Tue, Jul 29, 2025 at 06:57:40PM +0100, Mark Rutland wrote:
> > > > > 
> > > > > On Tue, Jul 29, 2025 at 12:28:03PM +0200, Jiri Olsa wrote:
> > > > > > hi,
> > > > > > while poking the multi-tracing interface I ended up with just one
> > > > > > ftrace_ops object to attach all trampolines.
> > > > > > 
> > > > > > This change allows to use less direct API calls during the attachment
> > > > > > changes in the future code, so in effect speeding up the attachment.
> > > > > 
> > > > > How important is that, and what sort of speedup does this result in? I
> > > > > ask due to potential performance hits noted below, and I'm lacking
> > > > > context as to why we want to do this in the first place -- what is this
> > > > > intended to enable/improve?
> > > > 
> > > > so it's all work on PoC stage, the idea is to be able to attach many
> > > > (like 20,30,40k) functions to their trampolines quickly, which at the
> > > > moment is slow because all the involved interfaces work with just single
> > > > function/tracempoline relation
> > > 
> > > Do you know which aspect of that is slow? e.g. is that becuase you have
> > > to update each ftrace_ops independently, and pay the synchronization
> > > overhead per-ops?
> > > 
> > > I ask because it might be possible to do some more batching there, at
> > > least for architectures like arm64 that use the CALL_OPS approach.
> > 
> > IIRC it's the rcu sync in register_ftrace_direct and ftrace_shutdown
> > I'll try to profile that case again, there  might have been changes
> > since the last time we did that
> 
> Do you mean synchronize_rcu_tasks()?
> 
> The call in register_ftrace_direct() was removed in commit:
> 
>   33f137143e651321 ("ftrace: Use asynchronous grace period for register_ftrace_direct()")
> 
> ... but in ftrace_shutdown() we still have a call to synchronize_rcu_tasks(),
> and to synchronize_rcu_tasks_rude().
> 
> The call to synchronize_rcu_tasks() is still necessary, but we might be
> abel to batch that better with API changes.
> 
> I think we might be able to remove the call to
> synchronize_rcu_tasks_rude() on architectures with ARCH_WANTS_NO_INSTR,
> since there shouldn't be any instrumentable functions called with RCU
> not watching. That'd need to be checked.
> 
> [...]
> 
> > > > sorry I probably forgot/missed discussion on this, but doing the fast path like in
> > > > x86_64 is not an option in arm, right?
> > > 
> > > On arm64 we have a fast path, BUT branch range limitations means that we
> > > cannot always branch directly from the instrumented function to the
> > > direct func with a single branch instruction. We use ops->direct_call to
> > > handle that case within a common trampoline, which is significantly
> > > cheaper that iterating over the ops and/or looking up the direct func
> > > from a hash.
> > > 
> > > With CALL_OPS, we place a pointer to the ops immediately before the
> > > instrumented function, and have the instrumented function branch to a
> > > common trampoline which can load that pointer (and can then branch to
> > > any direct func as necessary).
> > > 
> > > The instrumented function looks like:
> > > 
> > > 	# Aligned to 8 bytes
> > > 	func - 8:
> > > 		< pointer to ops >
> > 
> > stupid question.. so there's ftrace_ops pointer stored for each function at
> > 'func - 8` ?  why not store the func's direct trampoline address in there?
> 
> Once reason is that today we don't have trampolines for all ops. Since
> branch range limitations can require bouncing through the common ops,
> it's simpler/better to bounce from that to the regular call than to
> bounce from that to a trampoline which makes the regular call.
> 
> We *could* consider adding trampolines, but that comes with a jump in
> complexity that we originally tried to avoid, and a potential
> performance hit for regular ftrace calls. IIUC that will require similar
> synchronization to what we have today, so it's not clearly a win
> generally.
> 
> I'd like to better understand what the real bottleneck is; AFAICT it's
> the tasks-rcu synchronization, and sharing the hash means that you only
> need to do that once. I think that it should be possible to share that
> synchronization across multiple ops updates with some API changes (e.g.
> something like the batching of text_poke on x86).

yea, so rcu does not seem to be the cause anymore (IIRC that was the
case some time ago) it looks like now the time is spent in the ftrace
internals that iterate and update call sites

the test was loop on attach/detach of fentry program

    31.48%  test_progs       [kernel.kallsyms]                               [k] ftrace_replace_code
    10.98%  test_progs       [kernel.kallsyms]                               [k] __ftrace_hash_update_ipmodify
     6.41%  test_progs       [kernel.kallsyms]                               [k] __ftrace_hash_rec_update
     4.69%  test_progs       [kernel.kallsyms]                               [k] ftrace_check_record
     4.59%  test_progs       [kernel.kallsyms]                               [k] ftrace_lookup_ip
     3.65%  swapper          [kernel.kallsyms]                               [k] acpi_os_read_port
     3.40%  test_progs       [kernel.kallsyms]                               [k] srso_alias_return_thunk
     2.97%  test_progs       [kernel.kallsyms]                               [k] srso_alias_safe_ret
     2.67%  test_progs       [kernel.kallsyms]                               [k] ftrace_rec_iter_record
     2.05%  test_progs       [kernel.kallsyms]                               [k] ftrace_test_record
     1.83%  test_progs       [kernel.kallsyms]                               [k] ftrace_rec_iter_next
     1.76%  test_progs       [kernel.kallsyms]                               [k] smp_call_function_many_cond
     1.05%  rcu_tasks_kthre  [kernel.kallsyms]                               [k] rcu_tasks_pertask
     0.70%  test_progs       [kernel.kallsyms]                               [k] btf_find_by_name_kind
     0.61%  swapper          [kernel.kallsyms]                               [k] srso_alias_safe_ret
     0.55%  swapper          [kernel.kallsyms]                               [k] io_idle

so by sharing the hash we do that (iterate and update functions)
just once

jirka


---
    31.48%  test_progs       [kernel.kallsyms]                               [k] ftrace_replace_code
            |          
            |--11.54%--ftrace_replace_code
            |          ftrace_modify_all_code
            |          |          
            |          |--6.06%--ftrace_shutdown.part.0
            |          |          unregister_ftrace_function
            |          |          unregister_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          bpf_trampoline_unlink_prog
            |          |          bpf_tracing_link_release
            |          |          bpf_link_free
            |          |          bpf_link_release
            |          |          __fput
            |          |          __x64_sys_close
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          __syscall_cancel_arch_end
            |          |          __syscall_cancel
            |          |          __close
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --5.47%--ftrace_startup
            |                     register_ftrace_function_nolock
            |                     register_ftrace_direct
            |                     bpf_trampoline_update
            |                     __bpf_trampoline_link_prog
            |                     bpf_trampoline_link_prog
            |                     bpf_tracing_prog_attach
            |                     bpf_raw_tp_link_attach
            |                     __sys_bpf
            |                     __x64_sys_bpf
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     syscall
            |                     skel_raw_tracepoint_open
            |                     fentry_test_lskel__test1__attach
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
            |--8.81%--ftrace_check_record
            |          ftrace_replace_code
            |          ftrace_modify_all_code
            |          |          
            |          |--4.72%--ftrace_shutdown.part.0
            |          |          unregister_ftrace_function
            |          |          unregister_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          bpf_trampoline_unlink_prog
            |          |          bpf_tracing_link_release
            |          |          bpf_link_free
            |          |          bpf_link_release
            |          |          __fput
            |          |          __x64_sys_close
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          __syscall_cancel_arch_end
            |          |          __syscall_cancel
            |          |          __close
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --4.10%--ftrace_startup
            |                     register_ftrace_function_nolock
            |                     register_ftrace_direct
            |                     bpf_trampoline_update
            |                     __bpf_trampoline_link_prog
            |                     bpf_trampoline_link_prog
            |                     bpf_tracing_prog_attach
            |                     bpf_raw_tp_link_attach
            |                     __sys_bpf
            |                     __x64_sys_bpf
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     syscall
            |                     skel_raw_tracepoint_open
            |                     fentry_test_lskel__test1__attach
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
            |--3.60%--ftrace_rec_iter_record
            |          ftrace_replace_code
            |          ftrace_modify_all_code
            |          |          
            |          |--1.91%--ftrace_shutdown.part.0
            |          |          unregister_ftrace_function
            |          |          unregister_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          bpf_trampoline_unlink_prog
            |          |          bpf_tracing_link_release
            |          |          bpf_link_free
            |          |          bpf_link_release
            |          |          __fput
            |          |          __x64_sys_close
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          __syscall_cancel_arch_end
            |          |          __syscall_cancel
            |          |          __close
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --1.69%--ftrace_startup
            |                     register_ftrace_function_nolock
            |                     register_ftrace_direct
            |                     bpf_trampoline_update
            |                     __bpf_trampoline_link_prog
            |                     bpf_trampoline_link_prog
            |                     bpf_tracing_prog_attach
            |                     bpf_raw_tp_link_attach
            |                     __sys_bpf
            |                     __x64_sys_bpf
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     syscall
            |                     skel_raw_tracepoint_open
            |                     fentry_test_lskel__test1__attach
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
            |--3.50%--ftrace_rec_iter_next
            |          ftrace_replace_code
            |          ftrace_modify_all_code
            |          |          
            |          |--2.08%--ftrace_startup
            |          |          register_ftrace_function_nolock
            |          |          register_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          __bpf_trampoline_link_prog
            |          |          bpf_trampoline_link_prog
            |          |          bpf_tracing_prog_attach
            |          |          bpf_raw_tp_link_attach
            |          |          __sys_bpf
            |          |          __x64_sys_bpf
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          syscall
            |          |          skel_raw_tracepoint_open
            |          |          fentry_test_lskel__test1__attach
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --1.42%--ftrace_shutdown.part.0
            |                     unregister_ftrace_function
            |                     unregister_ftrace_direct
            |                     bpf_trampoline_update
            |                     bpf_trampoline_unlink_prog
            |                     bpf_tracing_link_release
            |                     bpf_link_free
            |                     bpf_link_release
            |                     __fput
            |                     __x64_sys_close
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     __syscall_cancel_arch_end
            |                     __syscall_cancel
            |                     __close
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
            |--2.44%--srso_alias_safe_ret
            |          srso_alias_return_thunk
            |          ftrace_replace_code
            |          ftrace_modify_all_code
            |          |          
            |          |--1.36%--ftrace_shutdown.part.0
            |          |          unregister_ftrace_function
            |          |          unregister_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          bpf_trampoline_unlink_prog
            |          |          bpf_tracing_link_release
            |          |          bpf_link_free
            |          |          bpf_link_release
            |          |          __fput
            |          |          __x64_sys_close
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          __syscall_cancel_arch_end
            |          |          __syscall_cancel
            |          |          __close
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --1.07%--ftrace_startup
            |                     register_ftrace_function_nolock
            |                     register_ftrace_direct
            |                     bpf_trampoline_update
            |                     __bpf_trampoline_link_prog
            |                     bpf_trampoline_link_prog
            |                     bpf_tracing_prog_attach
            |                     bpf_raw_tp_link_attach
            |                     __sys_bpf
            |                     __x64_sys_bpf
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     syscall
            |                     skel_raw_tracepoint_open
            |                     fentry_test_lskel__test1__attach
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
             --1.59%--ftrace_test_record
                       ftrace_replace_code
                       ftrace_modify_all_code
                       |          
                       |--0.87%--ftrace_startup
                       |          register_ftrace_function_nolock
                       |          register_ftrace_direct
                       |          bpf_trampoline_update
                       |          __bpf_trampoline_link_prog
                       |          bpf_trampoline_link_prog
                       |          bpf_tracing_prog_attach
                       |          bpf_raw_tp_link_attach
                       |          __sys_bpf
                       |          __x64_sys_bpf
                       |          do_syscall_64
                       |          entry_SYSCALL_64_after_hwframe
                       |          syscall
                       |          skel_raw_tracepoint_open
                       |          fentry_test_lskel__test1__attach
                       |          fentry_test_common
                       |          fentry_test
                       |          test_fentry_test
                       |          run_one_test
                       |          main
                       |          __libc_start_call_main
                       |          __libc_start_main@@GLIBC_2.34
                       |          _start
                       |          
                        --0.72%--ftrace_shutdown.part.0
                                  unregister_ftrace_function
                                  unregister_ftrace_direct
                                  bpf_trampoline_update
                                  bpf_trampoline_unlink_prog
                                  bpf_tracing_link_release
                                  bpf_link_free
                                  bpf_link_release
                                  __fput
                                  __x64_sys_close
                                  do_syscall_64
                                  entry_SYSCALL_64_after_hwframe
                                  __syscall_cancel_arch_end
                                  __syscall_cancel
                                  __close
                                  fentry_test_common
                                  fentry_test
                                  test_fentry_test
                                  run_one_test
                                  main
                                  __libc_start_call_main
                                  __libc_start_main@@GLIBC_2.34
                                  _start

    10.98%  test_progs       [kernel.kallsyms]                               [k] __ftrace_hash_update_ipmodify
            |          
            |--7.90%--__ftrace_hash_update_ipmodify
            |          |          
            |          |--4.27%--ftrace_shutdown.part.0
            |          |          unregister_ftrace_function
            |          |          unregister_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          bpf_trampoline_unlink_prog
            |          |          bpf_tracing_link_release
            |          |          bpf_link_free
            |          |          bpf_link_release
            |          |          __fput
            |          |          __x64_sys_close
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          __syscall_cancel_arch_end
            |          |          __syscall_cancel
            |          |          __close
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --3.63%--ftrace_startup
            |                     register_ftrace_function_nolock
            |                     register_ftrace_direct
            |                     bpf_trampoline_update
            |                     __bpf_trampoline_link_prog
            |                     bpf_trampoline_link_prog
            |                     bpf_tracing_prog_attach
            |                     bpf_raw_tp_link_attach
            |                     __sys_bpf
            |                     __x64_sys_bpf
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     syscall
            |                     skel_raw_tracepoint_open
            |                     fentry_test_lskel__test1__attach
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
             --3.06%--ftrace_lookup_ip
                       __ftrace_hash_update_ipmodify
                       |          
                       |--1.92%--ftrace_startup
                       |          register_ftrace_function_nolock
                       |          register_ftrace_direct
                       |          bpf_trampoline_update
                       |          __bpf_trampoline_link_prog
                       |          bpf_trampoline_link_prog
                       |          bpf_tracing_prog_attach
                       |          bpf_raw_tp_link_attach
                       |          __sys_bpf
                       |          __x64_sys_bpf
                       |          do_syscall_64
                       |          entry_SYSCALL_64_after_hwframe
                       |          syscall
                       |          skel_raw_tracepoint_open
                       |          fentry_test_lskel__test1__attach
                       |          fentry_test_common
                       |          fentry_test
                       |          test_fentry_test
                       |          run_one_test
                       |          main
                       |          __libc_start_call_main
                       |          __libc_start_main@@GLIBC_2.34
                       |          _start
                       |          
                        --1.14%--ftrace_shutdown.part.0
                                  unregister_ftrace_function
                                  unregister_ftrace_direct
                                  bpf_trampoline_update
                                  bpf_trampoline_unlink_prog
                                  bpf_tracing_link_release
                                  bpf_link_free
                                  bpf_link_release
                                  __fput
                                  __x64_sys_close
                                  do_syscall_64
                                  entry_SYSCALL_64_after_hwframe
                                  __syscall_cancel_arch_end
                                  __syscall_cancel
                                  __close
                                  fentry_test_common
                                  fentry_test
                                  test_fentry_test
                                  run_one_test
                                  main
                                  __libc_start_call_main
                                  __libc_start_main@@GLIBC_2.34
                                  _start

     6.41%  test_progs       [kernel.kallsyms]                               [k] __ftrace_hash_rec_update
            |          
            |--3.37%--__ftrace_hash_rec_update
            |          |          
            |          |--1.90%--ftrace_startup
            |          |          register_ftrace_function_nolock
            |          |          register_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          __bpf_trampoline_link_prog
            |          |          bpf_trampoline_link_prog
            |          |          bpf_tracing_prog_attach
            |          |          bpf_raw_tp_link_attach
            |          |          __sys_bpf
            |          |          __x64_sys_bpf
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          syscall
            |          |          skel_raw_tracepoint_open
            |          |          fentry_test_lskel__test1__attach
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --1.47%--ftrace_shutdown.part.0
            |                     unregister_ftrace_function
            |                     unregister_ftrace_direct
            |                     bpf_trampoline_update
            |                     bpf_trampoline_unlink_prog
            |                     bpf_tracing_link_release
            |                     bpf_link_free
            |                     bpf_link_release
            |                     __fput
            |                     __x64_sys_close
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     __syscall_cancel_arch_end
            |                     __syscall_cancel
            |                     __close
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
            |--2.16%--ftrace_lookup_ip
            |          __ftrace_hash_rec_update
            |          |          
            |          |--1.16%--ftrace_shutdown.part.0
            |          |          unregister_ftrace_function
            |          |          unregister_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          bpf_trampoline_unlink_prog
            |          |          bpf_tracing_link_release
            |          |          bpf_link_free
            |          |          bpf_link_release
            |          |          __fput
            |          |          __x64_sys_close
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          __syscall_cancel_arch_end
            |          |          __syscall_cancel
            |          |          __close
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --0.99%--ftrace_startup
            |                     register_ftrace_function_nolock
            |                     register_ftrace_direct
            |                     bpf_trampoline_update
            |                     __bpf_trampoline_link_prog
            |                     bpf_trampoline_link_prog
            |                     bpf_tracing_prog_attach
            |                     bpf_raw_tp_link_attach
            |                     __sys_bpf
            |                     __x64_sys_bpf
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     syscall
            |                     skel_raw_tracepoint_open
            |                     fentry_test_lskel__test1__attach
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
             --0.88%--srso_alias_safe_ret
                       |          
                        --0.79%--__ftrace_hash_rec_update
                                  |          
                                   --0.52%--ftrace_shutdown.part.0
                                             unregister_ftrace_function
                                             unregister_ftrace_direct
                                             bpf_trampoline_update
                                             bpf_trampoline_unlink_prog
                                             bpf_tracing_link_release
                                             bpf_link_free
                                             bpf_link_release
                                             __fput
                                             __x64_sys_close
                                             do_syscall_64
                                             entry_SYSCALL_64_after_hwframe
                                             __syscall_cancel_arch_end
                                             __syscall_cancel
                                             __close
                                             fentry_test_common
                                             fentry_test
                                             test_fentry_test
                                             run_one_test
                                             main
                                             __libc_start_call_main
                                             __libc_start_main@@GLIBC_2.34
                                             _start

     4.69%  test_progs       [kernel.kallsyms]                               [k] ftrace_check_record
            |          
            |--2.04%--ftrace_check_record
            |          ftrace_replace_code
            |          ftrace_modify_all_code
            |          |          
            |          |--1.06%--ftrace_startup
            |          |          register_ftrace_function_nolock
            |          |          register_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          __bpf_trampoline_link_prog
            |          |          bpf_trampoline_link_prog
            |          |          bpf_tracing_prog_attach
            |          |          bpf_raw_tp_link_attach
            |          |          __sys_bpf
            |          |          __x64_sys_bpf
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          syscall
            |          |          skel_raw_tracepoint_open
            |          |          fentry_test_lskel__test1__attach
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --0.98%--ftrace_shutdown.part.0
            |                     unregister_ftrace_function
            |                     unregister_ftrace_direct
            |                     bpf_trampoline_update
            |                     bpf_trampoline_unlink_prog
            |                     bpf_tracing_link_release
            |                     bpf_link_free
            |                     bpf_link_release
            |                     __fput
            |                     __x64_sys_close
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     __syscall_cancel_arch_end
            |                     __syscall_cancel
            |                     __close
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
             --1.28%--ftrace_replace_code
                       ftrace_modify_all_code
                       |          
                        --0.81%--ftrace_startup
                                  register_ftrace_function_nolock
                                  register_ftrace_direct
                                  bpf_trampoline_update
                                  __bpf_trampoline_link_prog
                                  bpf_trampoline_link_prog
                                  bpf_tracing_prog_attach
                                  bpf_raw_tp_link_attach
                                  __sys_bpf
                                  __x64_sys_bpf
                                  do_syscall_64
                                  entry_SYSCALL_64_after_hwframe
                                  syscall
                                  skel_raw_tracepoint_open
                                  fentry_test_lskel__test1__attach
                                  fentry_test_common
                                  fentry_test
                                  test_fentry_test
                                  run_one_test
                                  main
                                  __libc_start_call_main
                                  __libc_start_main@@GLIBC_2.34
                                  _start

     4.59%  test_progs       [kernel.kallsyms]                               [k] ftrace_lookup_ip
            |          
            |--1.99%--__ftrace_hash_update_ipmodify
            |          |          
            |          |--1.03%--ftrace_shutdown.part.0
            |          |          unregister_ftrace_function
            |          |          unregister_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          bpf_trampoline_unlink_prog
            |          |          bpf_tracing_link_release
            |          |          bpf_link_free
            |          |          bpf_link_release
            |          |          __fput
            |          |          __x64_sys_close
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          __syscall_cancel_arch_end
            |          |          __syscall_cancel
            |          |          __close
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --0.96%--ftrace_startup
            |                     register_ftrace_function_nolock
            |                     register_ftrace_direct
            |                     bpf_trampoline_update
            |                     __bpf_trampoline_link_prog
            |                     bpf_trampoline_link_prog
            |                     bpf_tracing_prog_attach
            |                     bpf_raw_tp_link_attach
            |                     __sys_bpf
            |                     __x64_sys_bpf
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     syscall
            |                     skel_raw_tracepoint_open
            |                     fentry_test_lskel__test1__attach
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
            |--1.67%--ftrace_lookup_ip
            |          |          
            |           --1.19%--__ftrace_hash_update_ipmodify
            |                     |          
            |                     |--0.60%--ftrace_shutdown.part.0
            |                     |          unregister_ftrace_function
            |                     |          unregister_ftrace_direct
            |                     |          bpf_trampoline_update
            |                     |          bpf_trampoline_unlink_prog
            |                     |          bpf_tracing_link_release
            |                     |          bpf_link_free
            |                     |          bpf_link_release
            |                     |          __fput
            |                     |          __x64_sys_close
            |                     |          do_syscall_64
            |                     |          entry_SYSCALL_64_after_hwframe
            |                     |          __syscall_cancel_arch_end
            |                     |          __syscall_cancel
            |                     |          __close
            |                     |          fentry_test_common
            |                     |          fentry_test
            |                     |          test_fentry_test
            |                     |          run_one_test
            |                     |          main
            |                     |          __libc_start_call_main
            |                     |          __libc_start_main@@GLIBC_2.34
            |                     |          _start
            |                     |          
            |                      --0.59%--ftrace_startup
            |                                register_ftrace_function_nolock
            |                                register_ftrace_direct
            |                                bpf_trampoline_update
            |                                __bpf_trampoline_link_prog
            |                                bpf_trampoline_link_prog
            |                                bpf_tracing_prog_attach
            |                                bpf_raw_tp_link_attach
            |                                __sys_bpf
            |                                __x64_sys_bpf
            |                                do_syscall_64
            |                                entry_SYSCALL_64_after_hwframe
            |                                syscall
            |                                skel_raw_tracepoint_open
            |                                fentry_test_lskel__test1__attach
            |                                fentry_test_common
            |                                fentry_test
            |                                test_fentry_test
            |                                run_one_test
            |                                main
            |                                __libc_start_call_main
            |                                __libc_start_main@@GLIBC_2.34
            |                                _start
            |          
             --0.81%--__ftrace_hash_rec_update

     3.65%  swapper          [kernel.kallsyms]                               [k] acpi_os_read_port
            |          
            |--1.03%--acpi_os_read_port
            |          acpi_hw_read_port
            |          acpi_hw_read
            |          acpi_hw_register_read
            |          acpi_read_bit_register
            |          acpi_idle_enter_bm
            |          cpuidle_enter_state
            |          cpuidle_enter
            |          do_idle
            |          cpu_startup_entry
            |          |          
            |           --0.97%--start_secondary
            |                     common_startup_64
            |          
            |--0.82%--srso_alias_safe_ret
            |          
             --0.74%--acpi_hw_read
                       acpi_hw_register_read
                       acpi_read_bit_register
                       acpi_idle_enter_bm
                       cpuidle_enter_state
                       cpuidle_enter
                       do_idle
                       cpu_startup_entry
                       |          
                        --0.74%--start_secondary
                                  common_startup_64

     3.40%  test_progs       [kernel.kallsyms]                               [k] srso_alias_return_thunk
            |          
            |--0.85%--ftrace_replace_code
            |          ftrace_modify_all_code
            |          |          
            |           --0.51%--ftrace_startup
            |                     register_ftrace_function_nolock
            |                     register_ftrace_direct
            |                     bpf_trampoline_update
            |                     __bpf_trampoline_link_prog
            |                     bpf_trampoline_link_prog
            |                     bpf_tracing_prog_attach
            |                     bpf_raw_tp_link_attach
            |                     __sys_bpf
            |                     __x64_sys_bpf
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     syscall
            |                     skel_raw_tracepoint_open
            |                     fentry_test_lskel__test1__attach
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
             --0.64%--ftrace_check_record
                       ftrace_replace_code
                       ftrace_modify_all_code

     2.97%  test_progs       [kernel.kallsyms]                               [k] srso_alias_safe_ret
            |          
            |--0.73%--ftrace_check_record
            |          ftrace_replace_code
            |          ftrace_modify_all_code
            |          
             --0.69%--ftrace_replace_code
                       ftrace_modify_all_code

     2.67%  test_progs       [kernel.kallsyms]                               [k] ftrace_rec_iter_record
            |          
            |--1.19%--ftrace_replace_code
            |          ftrace_modify_all_code
            |          |          
            |          |--0.68%--ftrace_startup
            |          |          register_ftrace_function_nolock
            |          |          register_ftrace_direct
            |          |          bpf_trampoline_update
            |          |          __bpf_trampoline_link_prog
            |          |          bpf_trampoline_link_prog
            |          |          bpf_tracing_prog_attach
            |          |          bpf_raw_tp_link_attach
            |          |          __sys_bpf
            |          |          __x64_sys_bpf
            |          |          do_syscall_64
            |          |          entry_SYSCALL_64_after_hwframe
            |          |          syscall
            |          |          skel_raw_tracepoint_open
            |          |          fentry_test_lskel__test1__attach
            |          |          fentry_test_common
            |          |          fentry_test
            |          |          test_fentry_test
            |          |          run_one_test
            |          |          main
            |          |          __libc_start_call_main
            |          |          __libc_start_main@@GLIBC_2.34
            |          |          _start
            |          |          
            |           --0.51%--ftrace_shutdown.part.0
            |                     unregister_ftrace_function
            |                     unregister_ftrace_direct
            |                     bpf_trampoline_update
            |                     bpf_trampoline_unlink_prog
            |                     bpf_tracing_link_release
            |                     bpf_link_free
            |                     bpf_link_release
            |                     __fput
            |                     __x64_sys_close
            |                     do_syscall_64
            |                     entry_SYSCALL_64_after_hwframe
            |                     __syscall_cancel_arch_end
            |                     __syscall_cancel
            |                     __close
            |                     fentry_test_common
            |                     fentry_test
            |                     test_fentry_test
            |                     run_one_test
            |                     main
            |                     __libc_start_call_main
            |                     __libc_start_main@@GLIBC_2.34
            |                     _start
            |          
             --0.69%--ftrace_check_record
                       ftrace_replace_code
                       ftrace_modify_all_code

     2.05%  test_progs       [kernel.kallsyms]                               [k] ftrace_test_record
            |          
             --0.79%--ftrace_replace_code
                       ftrace_modify_all_code

     1.83%  test_progs       [kernel.kallsyms]                               [k] ftrace_rec_iter_next
            |          
             --0.87%--ftrace_replace_code
                       ftrace_modify_all_code
                       |          
                        --0.51%--ftrace_startup
                                  register_ftrace_function_nolock
                                  register_ftrace_direct
                                  bpf_trampoline_update
                                  __bpf_trampoline_link_prog
                                  bpf_trampoline_link_prog
                                  bpf_tracing_prog_attach
                                  bpf_raw_tp_link_attach
                                  __sys_bpf
                                  __x64_sys_bpf
                                  do_syscall_64
                                  entry_SYSCALL_64_after_hwframe
                                  syscall
                                  skel_raw_tracepoint_open
                                  fentry_test_lskel__test1__attach
                                  fentry_test_common
                                  fentry_test
                                  test_fentry_test
                                  run_one_test
                                  main
                                  __libc_start_call_main
                                  __libc_start_main@@GLIBC_2.34
                                  _start

     1.76%  test_progs       [kernel.kallsyms]                               [k] smp_call_function_many_cond
            |          
             --1.73%--smp_call_function_many_cond
                       on_each_cpu_cond_mask
                       |          
                        --1.57%--smp_text_poke_batch_finish
                                  |          
                                   --1.55%--ftrace_modify_all_code
                                             |          
                                             |--0.91%--ftrace_shutdown.part.0
                                             |          unregister_ftrace_function
                                             |          unregister_ftrace_direct
                                             |          bpf_trampoline_update
                                             |          bpf_trampoline_unlink_prog
                                             |          bpf_tracing_link_release
                                             |          bpf_link_free
                                             |          bpf_link_release
                                             |          __fput
                                             |          __x64_sys_close
                                             |          do_syscall_64
                                             |          entry_SYSCALL_64_after_hwframe
                                             |          __syscall_cancel_arch_end
                                             |          __syscall_cancel
                                             |          __close
                                             |          fentry_test_common
                                             |          fentry_test
                                             |          test_fentry_test
                                             |          run_one_test
                                             |          main
                                             |          __libc_start_call_main
                                             |          __libc_start_main@@GLIBC_2.34
                                             |          _start
                                             |          
                                              --0.64%--ftrace_startup
                                                        register_ftrace_function_nolock
                                                        register_ftrace_direct
                                                        bpf_trampoline_update
                                                        __bpf_trampoline_link_prog
                                                        bpf_trampoline_link_prog
                                                        bpf_tracing_prog_attach
                                                        bpf_raw_tp_link_attach
                                                        __sys_bpf
                                                        __x64_sys_bpf
                                                        do_syscall_64
                                                        entry_SYSCALL_64_after_hwframe
                                                        syscall
                                                        skel_raw_tracepoint_open
                                                        fentry_test_lskel__test1__attach
                                                        fentry_test_common
                                                        fentry_test
                                                        test_fentry_test
                                                        run_one_test
                                                        main
                                                        __libc_start_call_main
                                                        __libc_start_main@@GLIBC_2.34
                                                        _start

     1.05%  rcu_tasks_kthre  [kernel.kallsyms]                               [k] rcu_tasks_pertask
            |          
             --0.65%--rcu_tasks_wait_gp
                       rcu_tasks_one_gp
                       rcu_tasks_kthread
                       kthread
                       ret_from_fork
                       ret_from_fork_asm

     0.70%  test_progs       [kernel.kallsyms]                               [k] btf_find_by_name_kind
            |          
             --0.59%--btf_find_by_name_kind


