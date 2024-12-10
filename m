Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45062E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68dpRV7WNOR7sj/6rUmXieI5aMfCcTBO86KfdpRDwOQ=; b=gsxQiOsbIGbpnOfwKt3SdnVWxd
	7jNd5D8R/NE8eKHCMjnet+I+DopCcNItgOtJE5/BXxCpPPXPX7XQ1391UVsCD7k4ap1cSpVqYLJ0x
	Xq8OnuCADctf9iBlfhsDrm23Rn6vU02ULL42l8F+/AzK8NR0C9XDqDgJCQ6i9EAUEnZvlLOhJNF6h
	A92lJmaZUKHTA907sYjVw5cTKa0fZTPtithXssYLR4GSJLBW2RqY6Jg1iJkZZouSDoXFn+udsgHdw
	31HJyWbFuSIVX4O3Jrm3ufYX5Mh82d+6DXvk6yoPpN6YtwktX8lodq2CKnmbs1RCM0c5ig+FxGOJ7
	T2L4B4aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2nN-0000000C2SP-1WQ5;
	Tue, 10 Dec 2024 16:09:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2l1-0000000C1ra-3qCk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:06:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DD7CA40F5D;
	Tue, 10 Dec 2024 16:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C9CC4CEE8;
	Tue, 10 Dec 2024 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733846802;
	bh=nhIKrOVHXT3fUCBw4LPHGsOsiy5FD8A3uloS3DV+YHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P8ZZHIvSDkAlRtjuBdPZfIY3aU5cCBpzyB/i2Vv0HHj1O6+BciyVjba8Qkih/H+oH
	 8TtDjHvi5iAR5MM0ElcShiTGwZql1i32Y6428E+38PRhzgRtAWTKpfhzHJiPn84smK
	 HJWY3mo1jKE1QGYdAFfrLrczgT25PXzoZxXyZngcTAjKXWCDBA2CPN3ZHKobWSi6Kp
	 YPEzJWTJOIMs4W0CAIhrvEGezqOkDjf872n/KtyP4lCYe2TAn2G5E3eIEtTgkMqO5y
	 6R94PbszNkqgUUmIxY+fUeVVOLgne6LUFDtXRCNteNin/BkIZD+yk9ibqhphxRJ7mU
	 pxz1jz8DVVEoQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/4] ARM: Disable jump-label on PREEMPT_RT
Date: Tue, 10 Dec 2024 17:05:53 +0100
Message-Id: <20241210160556.2341497-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210160556.2341497-1-arnd@kernel.org>
References: <20241210160556.2341497-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_080644_076235_951CF1A8 
X-CRM114-Status: GOOD (  19.63  )
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

From: Thomas Gleixner <tglx@linutronix.de>

jump-labels are used to efficiently switch between two possible code
paths. To achieve this, stop_machine() is used to keep the CPU in a
known state while the opcode is modified. The usage of stop_machine()
here leads to large latency spikes which can be observed on PREEMPT_RT.

Jump labels may change the target during runtime and are not restricted
to debug or "configuration/ setup" part of a PREEMPT_RT system where
high latencies could be defined as acceptable.

On 64-bit Arm, it is possible to use jump labels without the
stop_machine() call, which architecturally provides a way to atomically
change one 32-bit instruction word while keeping maintaining consistency,
but this is not generally the case on 32-bit, in particular in thumb2
mode.

Disable jump-label support on a PREEMPT_RT system when SMP is enabled.

[bigeasy: Patch description.]
[arnd: add !SMP case, extend changelog]

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Link: https://lkml.kernel.org/r/20220613182447.112191-2-bigeasy@linutronix.de
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I slightly changed the patch from the version currently in linux-rt.git
to leave jump labels enabled on single-CPU kernels that are still
fairly common on 32-bit arm.

If there are no additional concerns about this version, I will
forward it to Russell's patch system
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fb4e1da3bb98..ed850cc0ed3c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -80,7 +80,7 @@ config ARM
 	select HAS_IOPORT if PCI || PCMCIA || ISA || ARCH_FOOTBRIDGE || ARCH_RPC
 	select HAVE_ARCH_AUDITSYSCALL if AEABI && !OABI_COMPAT
 	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
-	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
+	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU && (!PREEMPT_RT || !SMP)
 	select HAVE_ARCH_KFENCE if MMU && !XIP_KERNEL
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
-- 
2.39.5


