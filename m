Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F89C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpiYdySHhrFSLFvt+ZXWlE3IvVelgPZB7slyigr8p3I=; b=NldK5NktWsRTfRAyahghUsGAiC
	2BDVNi3bXKolGfZuI1dnpzFRc9L28FfsjDgKFJKcLghnxQCsmW3fAjqwc9QXEwhglTp+1Qx4EjRcX
	aAXS3LVOBq0f2xIyv1hC1aaz37Dyb31OUpOQYtYaESCoGWWzWAYyDX2nG83iNQtopjyWDwL3f2KLG
	cCeQy0Gj1ylWh0Jy18UlEj0JpWRxkeHk3+01AtnTajUTNOharmp2IcuTzBa0CET/g5FMQKjOVViA1
	cK0x0Dr0h6S5KYeEoX2/2G7vb8j1ndw0GwgHg04kVVSyvg3UL4dK7qvHcgm48unMw5S+jcV5cqq7C
	hredQJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6P8-0000000D1DY-1X5L;
	Wed, 13 Aug 2025 08:00:14 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um67z-0000000Cxxx-0IAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 07:42:32 +0000
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32127d5f63eso775905a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 00:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755070950; x=1755675750;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpiYdySHhrFSLFvt+ZXWlE3IvVelgPZB7slyigr8p3I=;
        b=vDYOP+tHqRLV4n8ePvgPGwuPNl72hda/rHpmbeXik5zJzU5HDLfdnfnIGYTFBNAmrq
         QpxMdKcZ8w991qI3jZIn57A6dm2rnT20tyXA82lTB0gfWssQX2ZkFIOv+jdeKeIyA0bf
         vg+OF5jBHhsC8nfWnD6r70YHtLrvP2OREC/XnL1jyyKxipRYrTwfqVt3K/epmgPZMtSf
         Brrvs2vVaAg/xMZzGN5fctPNtCeBeMLIGMZzqDPRWjgE8XcK//ynPyNxODBLJcjXmrGi
         zQyA7KvXs/P7yVjI7NnzZyKHksq3diS/RWestsoKl1+bw7PG2JtCGyhF0pnueyLvItM+
         cjag==
X-Forwarded-Encrypted: i=1; AJvYcCXioTQnaXliIULMYgy2JgdpAsYhXgyp7brad9+uLslh+zKn8ubBu5eKElqFPaDHXmHIK/sopFVNW6HRBFAAOei+@lists.infradead.org
X-Gm-Message-State: AOJu0YwAIKl+7p8JCstB1dZ8kcrbp/q7A2JUUXtRM+dGbG1v3mZB7hzW
	y9K8tUKeFshwzeEczgw0GWsTDDUN2rsd1+kHie3/yLkvt9THxBUQ7v6r
X-Gm-Gg: ASbGncutgtl8vOMISC4XL+r7Kf/NaBaTRRAOoKutL7n8WC2cj+HOY/7JJELL7nobgsP
	tyZU4JM/VJ7JR6NMgRyuQaJQiVa8//4j4QqXXT405XhPEE43VZ0CsT+x+8PRN6drNbYmQGJfbH5
	OIZNfmodfK+JQcOkxZirpBIqZ/zzRmLUFMwyu8fVWR0Z/uh7NsaFMGvuonuEmmN38DPDosk9Oej
	4IeDj4RHS8xZX0M0WlRRxjDiV3mZ/rTMddTqnMNxJFATiMoJOYuYFRTz0v4BnY/myw54v/wZvuR
	LinOLMnLmwc2MX11v34Z7qvoP+ddnNSovZTaBuUG3xNLOdRGDhR4nbbSEp3liaFrULyxGTNDSx5
	8U5x1ro++cCpb+E3ccP9U5dTVjPigt9Mi
X-Google-Smtp-Source: AGHT+IFyRulOk2yEiytouE8c1ifGVIrW23F74ZO8AVJB/Bv0ruH/ZKMqF0l+0q/T60XygCbCXcCjWw==
X-Received: by 2002:a17:90b:224f:b0:31f:23f0:2df8 with SMTP id 98e67ed59e1d1-321d0ecb6aamr1294794a91.6.1755070950304;
        Wed, 13 Aug 2025 00:42:30 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b429920ab6dsm11951099a12.58.2025.08.13.00.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 00:42:29 -0700 (PDT)
Message-ID: <17f91b9a-0a3a-47e1-bdfb-06237ae5da55@kzalloc.com>
Date: Wed, 13 Aug 2025 16:42:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] arm64: Sleeping function called from invalid context in
 do_debug_exception on PREEMPT_RT
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Austin Kim <austindh.kim@gmail.com>,
 linux-rt-devel@lists.linux.dev, syzkaller@googlegroups.com,
 stable@vger.kernel.org
References: <c36e8dca-d466-40ad-ad51-2b75e769ff47@kzalloc.com>
 <aJw3L7B7u5qAPOMz@e129823.arm.com>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <aJw3L7B7u5qAPOMz@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_004231_113936_5930C49E 
X-CRM114-Status: GOOD (  13.42  )
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

Hi Yeoreum,

Thank you for pointing it!

On 8/13/25 3:56 PM, Yeoreum Yun wrote:
> Hi Yunseong,
> 
>>
>> | BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>> | in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 20466, name: syz.0.1689
>> | preempt_count: 1, expected: 0
>> | RCU nest depth: 0, expected: 0
>> | Preemption disabled at:
>> | [<ffff800080241600>] debug_exception_enter arch/arm64/mm/fault.c:978 [inline]
>> | [<ffff800080241600>] do_debug_exception+0x68/0x2fc arch/arm64/mm/fault.c:997
>> | CPU: 0 UID: 0 PID: 20466 Comm: syz.0.1689 Not tainted 6.16.0-rc1-rt1-dirty #12 PREEMPT_RT
>> | Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
>> | Call trace:
>> |  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
>> |  __dump_stack+0x30/0x40 lib/dump_stack.c:94
>> |  dump_stack_lvl+0x148/0x1d8 lib/dump_stack.c:120
>> |  dump_stack+0x1c/0x3c lib/dump_stack.c:129
>> |  __might_resched+0x2e4/0x52c kernel/sched/core.c:8800
>> |  __rt_spin_lock kernel/locking/spinlock_rt.c:48 [inline]
>> |  rt_spin_lock+0xa8/0x1bc kernel/locking/spinlock_rt.c:57
>> |  spin_lock include/linux/spinlock_rt.h:44 [inline]
>> |  force_sig_info_to_task+0x6c/0x4a8 kernel/signal.c:1302
>> |  force_sig_fault_to_task kernel/signal.c:1699 [inline]
>> |  force_sig_fault+0xc4/0x110 kernel/signal.c:1704
>> |  arm64_force_sig_fault+0x6c/0x80 arch/arm64/kernel/traps.c:265
>> |  send_user_sigtrap arch/arm64/kernel/debug-monitors.c:237 [inline]
>> |  single_step_handler+0x1f4/0x36c arch/arm64/kernel/debug-monitors.c:257
>> |  do_debug_exception+0x154/0x2fc arch/arm64/mm/fault.c:1002
>> |  el0_dbg+0x44/0x120 arch/arm64/kernel/entry-common.c:756
>> |  el0t_64_sync_handler+0x3c/0x108 arch/arm64/kernel/entry-common.c:832
>> |  el0t_64_sync+0x1ac/0x1b0 arch/arm64/kernel/entry.S:600
>>
>>
>> It seems that commit eaff68b32861 ("arm64: entry: Add entry and exit functions
>> for debug exception") in 6.17-rc1, also present as 6fb44438a5e1 in mainline,
>> removed code that previously avoided sleeping context issues when handling
>> debug exceptions:
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/arch/arm64/mm/fault.c?id=eaff68b3286116d499a3d4e513a36d772faba587
> 
> No. Her patch commit 31575e11ecf7 (arm64: debug: split brk64 exception entry)
> solves your splat since el0_brk64() doesn't call debug_exception_enter()
> by spliting el0/el1 brk64 entry exception entry.
> 
> Formerly, el(0/1)_dbg() are handled in do_debug_exception() together
> and it calls debug_exception_enter() disabling preemption and this makes
> your splat while handling brk excepttion from el0.
> 

Do you think a fix is necessary if this issue also affects the LTS kernel
before 6.17-rc1? As far as I know, most production RT kernels are still
based on the existing LTS versions.

> 
> --
> Sincerely,
> Yeoreum Yun

Thank you,
Yunseong


