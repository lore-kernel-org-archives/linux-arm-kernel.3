Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D915CED60F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7Ukgm/BIguZnm5z2Fhn+vkaR7oKSydx2si/893PWF0=; b=U7Rx5sh2H/i6E1YVXe7d2OLcjX
	FTsvOLPqWC3LQSf0EUzEurE0zdaGNj/Ok6/xZyLpao1MQLsCbvvIlS2lyA4qGIWv4EK4OdvtFLjGn
	hrd2VD4uI30qjKVN5QduYJLp0h8f66/vebiTxcrkUFR27e3vtqeLAJwq2/JKWnCgCLNDoMY2/JeuD
	2rYMhRIGJ5AJe2/nqNggqBbky3Jd4WsTZTEMo0Iq5EPooF4lsVEEJt9M/EjptWMzigeSp/OZWYuuD
	GCs0Q3GbH89GeSMXQnerl7hOIXRY3hp8ZDG91TmVlr11AEl9K9F5SDRmQGvWL/4s85slpEstC4oyf
	gqxmB2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJWg-00000000IbA-0Jg9;
	Tue, 18 Nov 2025 11:05:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJWd-00000000Iah-25al
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 11:05:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 140D5FEC;
	Tue, 18 Nov 2025 03:05:21 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 548B23F66E;
	Tue, 18 Nov 2025 03:05:27 -0800 (PST)
Date: Tue, 18 Nov 2025 11:05:21 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Kees Cook <kees@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <aRxS8fQWhvxYiTbl@J2N7QTR9R3>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <202511171221.517FC4F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511171221.517FC4F@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_030531_686306_A99CEC40 
X-CRM114-Status: GOOD (  35.00  )
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

On Mon, Nov 17, 2025 at 12:27:36PM -0800, Kees Cook wrote:
> On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
> > On 17/11/2025 11:30, Ryan Roberts wrote:
> > > I think we could just pass the random seed to add_random_kstack_offset() so that
> > > we consume the old and buffer the new atomically? We would still buffer it
> > > across syscalls to avoid the guessability issue that's documented. Then
> > > choose_random_kstack_offset() could be removed. Or we could store
> > > per-task_struct given it is only 32-bits?
> 
> I had wanted to avoid both growing task_struct and to avoid tying the
> randomness to a given task -- then unpredictability could be higher
> (barring the bug above), and could be only reduced to per-thread by
> pinning a thread exclusively to a single CPU.

I appreciate the rationale of not growing task struct, but I think the
"unpredictability could be higher" rationale doesn't hold any water.

If an adversary has userspace code execution, they can pin the thread to
a CPU. Regardless of whether they have that capability, in common cases
the thread isn't going to migrate for a number of syscalls if those are
non-blocking. The unpredictability gained by CPU migrations is slim to
none.

From a thread model perspective, we need this to be unpredictable
*regardless* of any pinning.

From a quick look at task struct, it appears that (on 64-bit platforms)
there are several opportunities for rearranging fields to pack things
together and save bytes. I think that if the state is sufficiently
small, we don't actually have to grow task struct. Practically speaking,
if this is small enough no-one will notice.

> > > Bug 2: add_random_kstack_offset() and choose_random_kstack_offset() both
> > > document their requirement to be called with interrupts and preemption disabled.
> > > They use raw_cpu_*(), which require this. But on arm64, they are called from
> > > invoke_syscall(), where interrupts and preemption are _enabled_. In practice, I
> > > don't think this will cause functional harm for arm64's implementations of
> > > raw_cpu_*(), but means that it's possible that the wrong per-cpu structure is
> > > being referred to. Perhaps there is a way for user code to exploit this to
> > > defeat the purpose of the feature.
> > > 
> > > This should be straightforward to fix; if we take the task_struct approach for
> > > bug 1, then that would also fix this issue too because the requirement to be in
> > > atomic context goes away. Otherwsise it can be moved earlier in the callchain,
> > > before interrupts are enabled.
> 
> I can't speak to these internals, just that I'd hope to avoid forcing
> the randomness down to the thread-level.

From my perspective this would be *much* nicer as a per-thread property,
since it wouldn't have any problematic interactions with preemption, and
wouldn't force awkward requirements on architecture code.

i.e. I completely disagree -- I think this would be much better per
thread.

Using siphash per thread sounds fine to me.

Mark.

