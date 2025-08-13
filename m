Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C8CCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 05:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fEZpKy93KwsZzwDENO82mv0vqJLUvc/sxgMgyLQLjXY=; b=TyS0dSqZpd1YB6u/aKZehIKKyY
	HlzXpBSByauZyb+vWSZbi7uKQTiPQHFyW7AID4PqOqLfDXjDY00vpFPKb+gY8u9ZObcQfIUDJWSSv
	oVWrVqrerVd5S+6lNc7+z+TDiGJrLikzySjbNhOOWpZIU/E+FjCxfl0TLj0cDs5IMORncuwx0FA/O
	TZFznQgsG+vZoAn64jOnfhE0jcy/78B8phiQBiXrHRxjqVKv7fvb/OdxrFT/0mxC3ry/o7o0VWERn
	WAOm5O9rz5UYKIZ5fAjXMFyoyHwVNK28070uMAhRf7dSRqj3Q79Fg87bTwO2/BY94idn6b2Ml8nX6
	ZBV+sdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um3f5-0000000CdA1-2th1;
	Wed, 13 Aug 2025 05:04:31 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um3cX-0000000Cd4j-3nuY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 05:01:55 +0000
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b46f2570acbso321538a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 22:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755061313; x=1755666113;
        h=content-transfer-encoding:subject:organization:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEZpKy93KwsZzwDENO82mv0vqJLUvc/sxgMgyLQLjXY=;
        b=bNnULwQebfqjUn6mbIA8K66lcRRSDNE098iXXRzCHmoicfKKbIHvRb85IfqVOnYwyi
         J7X/T+cAUnYKhF/fsfY4h/PjRq5dB7Wi9KN4M01fx1IEjxRB3kgPck7/ETuDMj8EF/hW
         01X7OHXTW1W/ULKhmyBh8KklqzKD8KdeJLNXzEuhQ+5R0WNhAHpMT3pxlszq711ly9n4
         +WTj4iqe+aWkF8wwMLZ2c0pyAGaB7JRVlrhOdw9HlpX72KDcGIOEAZobFeJfBHmtioxO
         e11j6Juz0Mc94l/+/PAxwrA/fYDB1aZJvMBiEEy700HRZT6ka3LL42WWoI/k41x2Gt0V
         GZCw==
X-Forwarded-Encrypted: i=1; AJvYcCVT2S8fW34x+oIS4JEGJvb51xuXdoK7frq4FIAvr56O58gSI7jZRxObX14CwbN/+fO0zsqlDf8s6cP3xZl0jRBm@lists.infradead.org
X-Gm-Message-State: AOJu0YwLC2mcXoPcmLEhc+HxdBaGm+ljxiJe3XNlZjOXbIUWMfyaRuH1
	fOZBWLnfpemUUf5Mneba58vfPuldPBO+fWmLXvtvCO5GXQYGwAOSD59T5ugZgw==
X-Gm-Gg: ASbGncvChJRyGZseOT6+gpupI9EXSCzNSxvoeF6YqE30x8qgYbg7XDIm+tn3p3+Mp1e
	BBNK9VCIX5Lyff7n9atfCcAFdqiv50+3LApV4PmI+3SNtm5DMUDiImYoX9efTOZAPX9Wh9rByJn
	JaUSg0MAYoSfLB2Jqj1n/8pn3vg0rtUcdSvt2jeiJdEh4S9i/px6AD6Oi2hhMh5ONKH0Jf7Qzpi
	X0RyImq0sRZ59q0ftIK3cyXJ+j3t8KYxCULdg+Ljk8EQRrda4MJkez7TReZ4UyRKpT1NTFPDpDY
	FdMOWTpkh9RmIa4SlqC0VPwU6/kowq7XATyY0KN2jplXVgg9nVY/cGeRbMxwAQak2SZi2Fis7Dk
	clvE6XmFBsiwBfbiJ6Gs+JMDvycGYVNBa
X-Google-Smtp-Source: AGHT+IGY5yLj/I/IkcPxLpksicKcihBsAfqxMOagl8R5SrYJsF+l3779kjiHTiFGMZhZcU8311NzNw==
X-Received: by 2002:a05:6a00:815:b0:730:87b2:e848 with SMTP id d2e1a72fcca58-76e20fae24dmr1088857b3a.5.1755061313110;
        Tue, 12 Aug 2025 22:01:53 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf606978bsm25154871b3a.89.2025.08.12.22.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 22:01:52 -0700 (PDT)
Message-ID: <c36e8dca-d466-40ad-ad51-2b75e769ff47@kzalloc.com>
Date: Wed, 13 Aug 2025 14:01:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Austin Kim <austindh.kim@gmail.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-rt-devel@lists.linux.dev,
 syzkaller@googlegroups.com, stable@vger.kernel.org
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
Subject: [BUG] arm64: Sleeping function called from invalid context in
 do_debug_exception on PREEMPT_RT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_220153_954140_3276D57C 
X-CRM114-Status: GOOD (  13.33  )
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

On a PREEMPT_RT kernel based on v6.16-rc1, I hit the following splat:

| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
| in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 20466, name: syz.0.1689
| preempt_count: 1, expected: 0
| RCU nest depth: 0, expected: 0
| Preemption disabled at:
| [<ffff800080241600>] debug_exception_enter arch/arm64/mm/fault.c:978 [inline]
| [<ffff800080241600>] do_debug_exception+0x68/0x2fc arch/arm64/mm/fault.c:997
| CPU: 0 UID: 0 PID: 20466 Comm: syz.0.1689 Not tainted 6.16.0-rc1-rt1-dirty #12 PREEMPT_RT
| Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
| Call trace:
|  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
|  __dump_stack+0x30/0x40 lib/dump_stack.c:94
|  dump_stack_lvl+0x148/0x1d8 lib/dump_stack.c:120
|  dump_stack+0x1c/0x3c lib/dump_stack.c:129
|  __might_resched+0x2e4/0x52c kernel/sched/core.c:8800
|  __rt_spin_lock kernel/locking/spinlock_rt.c:48 [inline]
|  rt_spin_lock+0xa8/0x1bc kernel/locking/spinlock_rt.c:57
|  spin_lock include/linux/spinlock_rt.h:44 [inline]
|  force_sig_info_to_task+0x6c/0x4a8 kernel/signal.c:1302
|  force_sig_fault_to_task kernel/signal.c:1699 [inline]
|  force_sig_fault+0xc4/0x110 kernel/signal.c:1704
|  arm64_force_sig_fault+0x6c/0x80 arch/arm64/kernel/traps.c:265
|  send_user_sigtrap arch/arm64/kernel/debug-monitors.c:237 [inline]
|  single_step_handler+0x1f4/0x36c arch/arm64/kernel/debug-monitors.c:257
|  do_debug_exception+0x154/0x2fc arch/arm64/mm/fault.c:1002
|  el0_dbg+0x44/0x120 arch/arm64/kernel/entry-common.c:756
|  el0t_64_sync_handler+0x3c/0x108 arch/arm64/kernel/entry-common.c:832
|  el0t_64_sync+0x1ac/0x1b0 arch/arm64/kernel/entry.S:600


It seems that commit eaff68b32861 ("arm64: entry: Add entry and exit functions
for debug exception") in 6.17-rc1, also present as 6fb44438a5e1 in mainline,
removed code that previously avoided sleeping context issues when handling
debug exceptions:
Link: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/arch/arm64/mm/fault.c?id=eaff68b3286116d499a3d4e513a36d772faba587

This appears to be triggered when force_sig_fault() is called from
debug exception context, which is not sleepable under PREEMPT_RT.

I understand that this path is primarily for debugging, but I would like
to discuss whether the patch needs some adjustment for PREEMPT_RT.

I also found that the issue can be reproduced depending on the changes
introduced by the following commit:
Link: https://github.com/torvalds/linux/commit/d8bb6718c4d

  arm64: Make debug exception handlers visible from RCU
  Make debug exceptions visible from RCU so that synchronize_rcu()
  correctly tracks the debug exception handler.

  This also introduces sanity checks for user-mode exceptions as same
  as x86's ist_enter()/ist_exit().

  The debug exception can interrupt in idle task. For example, it warns
  if we put a kprobe on a function called from idle task as below.
  The warning message showed that the rcu_read_lock() caused this
  problem. But actually, this means the RCU lost the context which
  was already in NMI/IRQ.

    /sys/kernel/debug/tracing # echo p default_idle_call >> kprobe_events
    /sys/kernel/debug/tracing # echo 1 > events/kprobes/enable
    ...

For reference:
- v5.2.10: https://elixir.bootlin.com/linux/v5.2.10/source/arch/arm64/mm/fault.c#L810
- v5.3-rc3: https://elixir.bootlin.com/linux/v5.3-rc3/source/arch/arm64/mm/fault.c#L787


Do we need to restore some form of non-sleeping signal delivery in debug
exception context for PREEMPT_RT, or is there another preferred fix?

Thanks,
Yunseong

