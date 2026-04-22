Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50814F9EDC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PowB5mj05QciDylbP0PKStvJknopRA1HXmBgo46Fgcw=; b=11uobBSq06TYX9qhaKffpugwAa
	faFpD4+GYxGeQRTlCL3w1NslTwuDmqNdfdZB6U+m0F7oAlifDPbNjLIM90ugYPZ4tK460AfkqtViF
	HyazN5QE5OESSQtLwDk1e5Mvg6pBvsxUjZ+GPkHaEkvz/1x3qkE39NbCf2GTtMlOg7uto1f+WoEVx
	NvO5pA0RiOnUlsv3QDTNEtpxEk6JI8jXof0BbM2Q/sxb0YBis7d5mWQNZkdD0SHPAw7RtNTRRKexY
	c8XIXLxKzH0BB2tK/UUdn+xbCzZbxojr9GTVC408qDfef0S8cLJCoNisdYEjIJgIaYwWb7zFxh3vc
	33HL4OCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXEM-0000000AFw3-3ViR;
	Wed, 22 Apr 2026 13:03:02 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXEF-0000000AFvd-0uPl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1776862965;
	bh=YxTCrsTvYuYgr0tQA2Yg1Vpe9Rkih4RQ70ymWk8Yu8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoQp4eS2INnQCUgXAQh4ZuRJfkGZBj2UjrOul9Nbke6mpuR9MWPPykDVEQTomElc3
	 4INUtLFdaTdZrdWPVEQgw9BiTyqeY9w5IN1Jj03wlwVUZFhbVwlQxSIbrs8Ev1PxGY
	 KfxRPFCDytFyDg+QWCvhegZjboLyEL8JvKmYz6hg=
Date: Wed, 22 Apr 2026 15:02:44 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Carlos O'Donell <carlos@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@aerifal.cx>, Torvald Riegel <triegel@redhat.com>, 
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Uros Bizjak <ubizjak@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	kernel-dev@igalia.com
Subject: Re: [PATCH RFC 1/2] arm64: vdso: Prepare for robust futex unlock
 support
Message-ID: <e0ee43e3-725c-4b99-80b3-956d24beb1c7@t-8ch.de>
References: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
 <20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_060255_649762_6E491080 
X-CRM114-Status: GOOD (  14.35  )
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

On 2026-04-17 11:56:10-0300, André Almeida wrote:
> There will be a VDSO function to unlock non-contended robust futexes in
> user space. The unlock sequence is racy vs. clearing the list_pending_op
> pointer in the task's robust list head. To plug this race the kernel needs
> to know the critical section window so it can clear the pointer when the
> task is interrupted within that race window. The window is determined by
> labels in the inline assembly.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> RFC: Those symbols can't be found by the linker after patch 2/2, it fails with:
> 
> ld: arch/arm64/kernel/vdso.o: in function `vdso_futex_robust_unlock_update_ips':
> arch/arm64/kernel/vdso.c:72:(.text+0x200): undefined reference to `__futex_list64_try_unlock_cs_success'
> ld: arch/arm64/kernel/vdso.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__futex_list64_try_unlock_cs_success' which may bind externally can not be used when making a shared object; recompile with -fPIC
> arch/arm64/kernel/vdso.c:72:(.text+0x200): dangerous relocation: unsupported relocation

arch/arm64/kernel/vdso.o is a kernel object.
__futex_list64_try_unlock_cs_success is a vDSO symbol.
They live in wholly different objects, which are never linked together.
Look at VDSO_SYMBOL() to get the offset of the vDSO symbol in kernel code.

(...)


Thomas

