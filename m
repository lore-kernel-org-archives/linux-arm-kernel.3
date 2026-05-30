Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EF2CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 00:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRqQuSUnQXIp8UkHJ3sfDs0vFpquRuFQmXl1WKZBm+U=; b=s0lXS+c/vCoVEPXl3DS2q9m6yB
	hWN1xIBmxSyqvgFH9vKDzcwlfWPvzr+NYPaocfrFHFm3MChthtMlCnV4vLZ8mUWp3xRrArtOMWETi
	Fb28gfa4kGpjsYs0gVyHlGv1Y2yKop2PLy08Q9MMWdOpB7M7z7KtQbQEGQpwwVunfS7mBlhTXFbZa
	knXuDV78uChQBE9rQ609ltS+JyXykghBdPYkMUiw8gl1i91vt/Vuovzc0AFguKjGxRauMmOUmFP/q
	3FE0aOnWrY2TzMKAJNIf3vTN36zqN5fyj2vs/moLmQ25HGPOYdaC/iRvHpzxHiuTqjF7fDZUggiA/
	ZUDvofyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7v7-00000008LXe-2i0V;
	Sat, 30 May 2026 00:51:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7v4-00000008LX5-3syF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 00:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780102275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zRqQuSUnQXIp8UkHJ3sfDs0vFpquRuFQmXl1WKZBm+U=;
	b=VVpe1yZk4AcW//r2MUOssBbVieSDx3lLoGKzvY8USgB9a8LTKPPoGJSTXAUIzkKRczncRV
	VZ+QUk0kxfpmuEcoZsc5FIJHPJfk8R8Gia6JRg1ctl6vxWALkp0fWRogGTCUkR2cRCao+o
	odw6RLQMaydfvO39ooS5wr6j1vAbhLQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-aSJK__TSM1uXw8sPVkz9hw-1; Fri,
 29 May 2026 20:51:13 -0400
X-MC-Unique: aSJK__TSM1uXw8sPVkz9hw-1
X-Mimecast-MFC-AGG-ID: aSJK__TSM1uXw8sPVkz9hw_1780102271
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C01F1956080;
	Sat, 30 May 2026 00:51:10 +0000 (UTC)
Received: from localhost (unknown [10.22.88.56])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 65F321800576;
	Sat, 30 May 2026 00:51:08 +0000 (UTC)
Date: Fri, 29 May 2026 21:51:06 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Waiman Long <longman@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] arm64/entry: Don't disable preemption in
 debug_exception_enter() with RT kernel
Message-ID: <aho0eqjMESuHxECr@redhat.com>
References: <20260519222524.886454-1-longman@redhat.com>
 <20260520061920.XCqBHe0x@linutronix.de>
 <a5251664-2c15-4a8e-906b-d204e10c38be@redhat.com>
 <20260528145124.v9o6OcOc@linutronix.de>
 <20260528153554.vllN7_T9@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20260528153554.vllN7_T9@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: W9cN2eeafCebWcOKETLVr2EFWu1Pnvuw2AFnbf_BGYU_1780102271
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_175119_057671_E2F75529 
X-CRM114-Status: GOOD (  17.95  )
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

On Thu, May 28, 2026 at 05:35:54PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-05-28 16:51:24 [+0200], To Waiman Long wrote:
> > > The kernel backtrace is produced using the latest v7.1-rc4 kernel. There are
> > > a number of changes to the debug_exception_enter() and
> > > debug_exception_exit() functions over the years, but the preemption disable
> > > code remains since its introduction in v5.3.
> > 
> > Let me look at this again.
> 
> So how do you reproduce this? The calls within debug_exception_enter()/
> exit() look harmless or I miss the big thing here.
> From your backtrace, you have brk_handler() and this is gone since
> commit 31575e11ecf7e ("arm64: debug: split brk64 exception entry") which
> is v6.17-rc1. I can use gdb with breakpoint handling.

Sebastian, in the original series Ada provided a few tests, including the
two files I list below. Running that test in a v7.1-rc5 kernel with
PREEMPT_RT and DEBUG_ATOMIC_SLEEP enabled, I get this backtrace:

[10416.818417] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
[10416.818426] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 6437, name: gdb_prog1
[10416.818428] preempt_count: 1, expected: 0
[10416.818430] RCU nest depth: 1, expected: 1
[10416.818434] CPU: 11 UID: 0 PID: 6437 Comm: gdb_prog1 Not tainted 7.1.0-rc5-rt1 #2 PREEMPT_{RT,(full)} 
[10416.818437] Hardware name: Lenovo HR330A            7X33CTO1WW    /FALCON     , BIOS hve104r-1.15 02/26/2021
[10416.818440] Call trace:
[10416.818442]  show_stack+0x20/0x40 (C)
[10416.818450]  dump_stack_lvl+0x88/0xb8
[10416.818454]  dump_stack+0x18/0x30
[10416.818457]  __might_resched+0x18c/0x1c8
[10416.818462]  rt_spin_lock+0x4c/0x1b0
[10416.818467]  force_sig_info_to_task+0x34/0x1f0
[10416.818471]  force_sig_fault+0x68/0xb0
[10416.818473]  arm64_force_sig_fault+0x44/0x70
[10416.818476]  ptrace_hbptriggered+0xd0/0x150
[10416.818479]  __perf_event_overflow+0xf4/0x300
[10416.818483]  perf_swevent_event+0x1b8/0x1f0
[10416.818486]  perf_bp_event+0xcc/0xe0
[10416.818489]  do_breakpoint+0xf4/0x238
[10416.818493]  el0_breakpt+0x7c/0x200
[10416.818497]  el0t_64_sync_handler+0xa8/0xf0
[10416.818500]  el0t_64_sync+0x1b0/0x1b8


n order to run the test, you need to create two files with the names and
content listed below and run the following commands:

    cc gdb_prog1.c -o gdb_prog1 -O0 -g
    gdb -x gdb_cmdlist ./gdb_prog1

That's it.

The files I mentioned are:

===== gdb_cmdlist 

---------- >8 cut here 8< ----------
start
hbreak 3
watch target
commands 2
continue
end
commands 3
continue
end
continue
jump 11
continue
quit
---------- >8 cut here 8< ----------


===== gdb_prog1.c

---------- >8 cut here 8< ----------
int main() {
	int add = 0xAA;
	int target = 0;

	target += add;

#ifdef COMPAT
    __asm__("BKPT");
#else
    __asm__("BRK 1");
#endif

	return target;
}
---------- >8 cut here 8< ----------

Luis



