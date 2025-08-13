Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C5EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9iqVe+R8c3zfM/uPK79C2n38w+wRWE9/HfoR+oRT0g=; b=zL8pPrHrd5DvspTj1cfhSG1WVY
	dk6As7LxoUxEsLjOndz7y9plecNzZGjxsvJAB551Z0xORqjbIoDpzhgeIp6QcBIdq7pQzxvAau6mF
	zpNu/ayTo0UduuUqks2ytarIsC5SPASVgmcKoWr8oP4FAegdMOaXBktnRdqyHkMpOuO8ElEDsfXXG
	G91VIKiT038qOmd/71vD0K3bKKK11OQsfrRf255pKhmQjzB0wyEJdWUpHINOnN8mIxQJjmJF41p0+
	295C3jUPY+y4sHUBGxT12wIq2Zy8WjgKna+CngvFMt6PFbcNvWGGLuUwbAdAOwATajWg7FTlahxJ7
	rf/Sdp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um93C-0000000DQlk-400M;
	Wed, 13 Aug 2025 10:49:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Ns-0000000DKA7-1jcc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755079622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j9iqVe+R8c3zfM/uPK79C2n38w+wRWE9/HfoR+oRT0g=;
	b=NR0bOv3UCwRdRBkRTonBc4DoD/Heb/YYug0yYH7fDby98U/MIfGkhoaNhGnTkBGT/Pg0BS
	SiG6znUfO3pYM9DOUZ9dWMOTOSr8+qV5PX0OXTULNFn+nuYNuzlYc1O4IKF/iFjOC4m6bK
	3vwFOhcPQZgNPcGDKb5te9zA8fyfYis=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-148-LBRarVM-PTaDi3FS6q2eaA-1; Wed,
 13 Aug 2025 06:07:00 -0400
X-MC-Unique: LBRarVM-PTaDi3FS6q2eaA-1
X-Mimecast-MFC-AGG-ID: LBRarVM-PTaDi3FS6q2eaA_1755079618
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B6CF1956087;
	Wed, 13 Aug 2025 10:06:57 +0000 (UTC)
Received: from localhost (unknown [10.22.64.44])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1DCA51955F43;
	Wed, 13 Aug 2025 10:06:55 +0000 (UTC)
Date: Wed, 13 Aug 2025 07:06:54 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [BUG] arm64: Sleeping function called from invalid context in
 do_debug_exception on PREEMPT_RT
Message-ID: <aJxjvh4sAcUOJT2V@uudg.org>
References: <c36e8dca-d466-40ad-ad51-2b75e769ff47@kzalloc.com>
 <aJw3L7B7u5qAPOMz@e129823.arm.com>
 <17f91b9a-0a3a-47e1-bdfb-06237ae5da55@kzalloc.com>
 <aJxT2ie1wW2+/OCg@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJxT2ie1wW2+/OCg@e129823.arm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_030704_524725_376465A2 
X-CRM114-Status: GOOD (  22.03  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, Austin Kim <austindh.kim@gmail.com>, stable@vger.kernel.org, syzkaller@googlegroups.com, Masami Hiramatsu <mhiramat@kernel.org>, Will Deacon <will@kernel.org>, linux-rt-devel@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Yunseong Kim <ysk@kzalloc.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Aug 13, 2025 at 09:59:06AM +0100, Yeoreum Yun wrote:
> +Ada Couprie Diaz
> 
> > Hi Yeoreum,
> >
> > Thank you for pointing it!
> >
> > On 8/13/25 3:56 PM, Yeoreum Yun wrote:
> > > Hi Yunseong,
> > >
> > >>
> > >> | BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> > >> | in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 20466, name: syz.0.1689
> > >> | preempt_count: 1, expected: 0
> > >> | RCU nest depth: 0, expected: 0
> > >> | Preemption disabled at:
> > >> | [<ffff800080241600>] debug_exception_enter arch/arm64/mm/fault.c:978 [inline]
> > >> | [<ffff800080241600>] do_debug_exception+0x68/0x2fc arch/arm64/mm/fault.c:997
> > >> | CPU: 0 UID: 0 PID: 20466 Comm: syz.0.1689 Not tainted 6.16.0-rc1-rt1-dirty #12 PREEMPT_RT
> > >> | Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
> > >> | Call trace:
> > >> |  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
> > >> |  __dump_stack+0x30/0x40 lib/dump_stack.c:94
> > >> |  dump_stack_lvl+0x148/0x1d8 lib/dump_stack.c:120
> > >> |  dump_stack+0x1c/0x3c lib/dump_stack.c:129
> > >> |  __might_resched+0x2e4/0x52c kernel/sched/core.c:8800
> > >> |  __rt_spin_lock kernel/locking/spinlock_rt.c:48 [inline]
> > >> |  rt_spin_lock+0xa8/0x1bc kernel/locking/spinlock_rt.c:57
> > >> |  spin_lock include/linux/spinlock_rt.h:44 [inline]
> > >> |  force_sig_info_to_task+0x6c/0x4a8 kernel/signal.c:1302
> > >> |  force_sig_fault_to_task kernel/signal.c:1699 [inline]
> > >> |  force_sig_fault+0xc4/0x110 kernel/signal.c:1704
> > >> |  arm64_force_sig_fault+0x6c/0x80 arch/arm64/kernel/traps.c:265
> > >> |  send_user_sigtrap arch/arm64/kernel/debug-monitors.c:237 [inline]
> > >> |  single_step_handler+0x1f4/0x36c arch/arm64/kernel/debug-monitors.c:257
> > >> |  do_debug_exception+0x154/0x2fc arch/arm64/mm/fault.c:1002
> > >> |  el0_dbg+0x44/0x120 arch/arm64/kernel/entry-common.c:756
> > >> |  el0t_64_sync_handler+0x3c/0x108 arch/arm64/kernel/entry-common.c:832
> > >> |  el0t_64_sync+0x1ac/0x1b0 arch/arm64/kernel/entry.S:600
> > >>
> > >>
> > >> It seems that commit eaff68b32861 ("arm64: entry: Add entry and exit functions
> > >> for debug exception") in 6.17-rc1, also present as 6fb44438a5e1 in mainline,
> > >> removed code that previously avoided sleeping context issues when handling
> > >> debug exceptions:
> > >> Link: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/arch/arm64/mm/fault.c?id=eaff68b3286116d499a3d4e513a36d772faba587
> > >
> > > No. Her patch commit 31575e11ecf7 (arm64: debug: split brk64 exception entry)
> > > solves your splat since el0_brk64() doesn't call debug_exception_enter()
> > > by spliting el0/el1 brk64 entry exception entry.
> > >
> > > Formerly, el(0/1)_dbg() are handled in do_debug_exception() together
> > > and it calls debug_exception_enter() disabling preemption and this makes
> > > your splat while handling brk excepttion from el0.
> > >
> >
> > Do you think a fix is necessary if this issue also affects the LTS kernel
> > before 6.17-rc1? As far as I know, most production RT kernels are still
> > based on the existing LTS versions.
> 
> IMHO, I think her patch should be backedported.

I also strongly suggest backporting Ada's patch series, as without them
using anything that resorts to debug exceptions (ptrace, gdb, ...) on
aarch64 with PREEMPT_RT enabled may result in a backtrace or worse.

Luis

> 
> [0]: https://lore.kernel.org/all/20250707114109.35672-1-ada.coupriediaz@arm.com/
> 
> Thanks.
> 
> --
> Sincerely,
> Yeoreum Yun
> 
---end quoted text---


