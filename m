Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7C4CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3PM2SwKGUgQ1Wfor83rkZsilDOPTMWeMgpO7Hmp6Coc=; b=y1GUOurrM3aaytd9R/sfVi3uJ4
	JrIegfBWlGqND18KoAgDtA6/g0GNKwPBHgyxYBjLEgsJurVG0KdgXldZ5g+9PZO3Xp7h7tm1ft45b
	T/J2V6/iPpE1ETr6ZCLcaZ1jJ4Bg0UQgJXuLZVu1nVSKTv1s/QNkavCPjOPmhtsVXFaB43Bs05hkG
	1mNJwYZ8MzmovJ1sqKbS3fZJnxoriABBlB5nOVSFNGGzgRLS7lCWVMf0sUW3Pl/1D4MMLinMBLhcA
	VNTybpHeSiwgqEJW3uDoJ7Y38cAbs+f9S6kkrgC8zcGUdr6kTXUYcldYIuKLhlbhauccG22itBGaC
	8rLvO4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbEcm-00000003sm4-10x9;
	Sun, 21 Jun 2026 09:37:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbEck-00000003sld-2Gm7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 09:37:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99C0F60051;
	Sun, 21 Jun 2026 09:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EEE1F000E9;
	Sun, 21 Jun 2026 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782034672;
	bh=3PM2SwKGUgQ1Wfor83rkZsilDOPTMWeMgpO7Hmp6Coc=;
	h=Date:From:To:Cc:Subject;
	b=CPvoIDGL14sCX5ylLaYUAhDC9lMcMiJh12IJzutGSGQKhhN/j3P7fMe1lw15m5Roc
	 tHpoEk8Aby4R7yyQzmUbl4hKAdLn06DdHEiYs3o1201v2up+FU7xKvnepQ/nPPwDCI
	 WFkQeLslfQ8Kj6y7aV8P00hG40B3FZDEvni22GswCCp3bAgMXKZfMgiJsONy+BOgVi
	 k0p/zCAiBS0MY4A0IhU6SDokj6lXppltL7JA3pcuCP15DKxW8Mk4X/xfQ3c3P97y2z
	 c5uOUbqO06EeOjVenm17mc5XrEaYLlP7aug5hC/9nFo5DtP/NtxZmsipMAfim8Ib+w
	 nCbGOugNardpA==
Received: from rostedt by gandalf with local (Exim 4.99.3)
	(envelope-from <rostedt@kernel.org>)
	id 1wbEd0-00000001qTd-46mY;
	Sun, 21 Jun 2026 05:38:10 -0400
Message-ID: <20260621093430.264983361@kernel.org>
User-Agent: quilt/0.69
Date: Sun, 21 Jun 2026 05:34:30 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Julia Lawall <julia.lawall@inria.fr>,
 Yury Norov <yury.norov@gmail.com>,
 linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org,
 kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] tracing: Move trace_printk.h out of kernel.h
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

There's been complaints about trace_printk() being defined in kernel.h as it
can increase the compilation time. As it is only used by some developers for
debugging purposes, it should not be in kernel.h causing lots of wasted CPU
cycles for those that do not ever care about it.

Instead, add a CONFIG_TRACE_PRINTK_DEBUGGING option that developers that do
use it can set and not have to always remember to add #include <linux/trace_printk.h>
to the files they add trace_printk() while debugging. It also means that
those that do not have that config set will not have to worry about wasted
CPU cycles as it is only include in the CFLAGS when the option is set, and
its completely ignored otherwise.

Steven Rostedt (2):
      tracing: Move non-trace_printk prototypes back to kernel.h
      tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean up kernel.h

----
 .../driver_development_debugging_guide.rst         |  2 +-
 Makefile                                           |  5 +++++
 arch/powerpc/kvm/book3s_xics.c                     |  1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  1 +
 drivers/gpu/drm/i915/i915_gem.h                    |  1 +
 drivers/hwtracing/stm/dummy_stm.c                  |  4 ++++
 drivers/infiniband/hw/hfi1/trace_dbg.h             |  1 +
 drivers/usb/early/xhci-dbc.c                       |  1 +
 fs/ext4/inline.c                                   |  1 +
 include/linux/kernel.h                             | 19 ++++++++++++++++++-
 include/linux/sunrpc/debug.h                       |  1 +
 include/linux/trace_printk.h                       | 22 +++-------------------
 kernel/trace/Kconfig                               | 10 ++++++++++
 kernel/trace/ring_buffer_benchmark.c               |  1 +
 kernel/trace/trace.h                               |  1 +
 samples/fprobe/fprobe_example.c                    |  1 +
 samples/ftrace/ftrace-direct-modify.c              |  1 +
 samples/ftrace/ftrace-direct-multi-modify.c        |  1 +
 samples/ftrace/ftrace-direct-multi.c               |  2 +-
 samples/ftrace/ftrace-direct-too.c                 |  2 +-
 samples/ftrace/ftrace-direct.c                     |  2 +-
 21 files changed, 56 insertions(+), 24 deletions(-)

