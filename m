Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C500BCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6IL/ss3Y8x+u4i8PpUFYL9uKyD/qSTFj96oAhsxiYI=; b=3QKDVWpGzv85gx0HGwvQ8NhZZK
	eqIR8yt/EZnePu8W7ePWID1Xg6lrUdX272VCiqzLp45wxHjr/nf5P3yAdEoVqUEzGtQWmVab9fzA2
	bL0338qug+mgjQkKPmF62KJNZf/O8orsqLWPZQctxeBuhImy1SDw/lwXp9PXR0WLhJ9jsZ7jHXVoK
	ikZX5FOneVq3dEwOJivVpCt6NO5AUShrXgoaKTMPujNt3DTEsmnv3yflCqjMOK0WJFauMPCPol/rG
	HktOR7D+AYfo7fAsyYPAw6NBYDnNZpt1CPO9dbR4NcmB0GzNPI4b1lilhr/DY4PoyEohipRBAn2ig
	1PAuqH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYPn-00000000KW3-2Rda;
	Wed, 06 May 2026 09:19:35 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYPm-00000000KVX-22id
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j6IL/ss3Y8x+u4i8PpUFYL9uKyD/qSTFj96oAhsxiYI=; b=a2+5mhfXsYqjwb5n9M1cQeTM/k
	oK4uKxfhpc7jWMvfhz5ksp5uTuk4RKb72wO/UeGEhBgvkDqVaTaMKJJyhQMwXm15tcfvey+J0ocL8
	Xft9WjfAKS6VgFYGZAAOfyksmNG5t3t3/wj1AR0hxbb1hfE2u7u2zjyuicM0zrROFgHFmNw8W3BXp
	oZidG2psKz2JzqcqoD/Mc8UcB7OKauhotRCOyINn+yU7MBJR5Q4EVT3jGq2BgyGqu32ceKMnCAvHg
	oT4K/sh7NbbOBM4ECf/HPnSyZtRlnTAMPw8Srk5HMDJBljPlkBtnbej/3/cU+/LpbdKgR/diyYpvQ
	5Dfs/Xsw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wKYPe-003UEa-1l;
	Wed, 06 May 2026 09:19:26 +0000
Date: Wed, 6 May 2026 02:19:22 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64/fpsimd: ptrace: zero target's fpsimd_state, not
 the tracer's
Message-ID: <afsFFVFqFkexsCAR@gmail.com>
References: <20260505-fix_ptrace-v1-1-36ac1f6d0bfb@debian.org>
 <afojVYiwkiHN43RW@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afojVYiwkiHN43RW@J2N7QTR9R3.cambridge.arm.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_021934_542700_CFFE72A7 
X-CRM114-Status: GOOD (  23.94  )
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

Hello Mark,

On Tue, May 05, 2026 at 06:05:25PM +0100, Mark Rutland wrote:
> Hi Breno,
> 
> On Tue, May 05, 2026 at 09:02:13AM -0700, Breno Leitao wrote:
> > sve_set_common() is the backend for PTRACE_SETREGSET(NT_ARM_SVE) and
> > PTRACE_SETREGSET(NT_ARM_SSVE). Every write in the function operates on
> > the tracee (target) - except a single memset that uses current instead,
> > zeroing the tracer's saved V0-V31 / FPSR / FPCR shadow on every ptrace
> > SETREGSET call.
> 
> Sorry about this; this was my bad and definitely needs to be fixed.

No worries at all. While investigating random coredumps in the Meta fleet
with some colleagues, the randomness of the crashes reminded me of a similar
issue I encountered 10 years ago, where floating-point and vector registers
weren't being properly restored at context switch due to a kernel bug,
and created a reproducer in commit 77fad8bfb1d2f ("selftests/powerpc:
Check FP/VEC on exception in TM"). So, this class of bugs is not
special, although *very* hard to debug.

> > Due to FPSIMD lazy save/restore the wipe only takes effect when the
> > tracer's CPU FPSIMD binding is dropped after the memset; the next
> > return to userspace then reloads V0-V31, FPSR and FPCR as zero. No
> > signal is raised and ptrace() returns success.
> 
> You're right that the corruption of the tracer's state is often masked,
> but I don't think the last paragraph describes the circumstances
> entirely accurately (e.g. if the binding is lost *before* the memset(),
> the issue can still occur).
> 
> I think it would be better to say:
> 
>   The corruption of the tracer's saved FPSIMD state is not always
>   observable. Where the tracer's state is live on a CPU, this may reused
>   without loading the corrupted state from memory, and will eventually
>   be written back over the corrupted state. Where the tracer's state is
>   saved in SVE_PT_REGS_SVE format, only the FPSR and FPCR are clobbered,
>   and the effective copy of the vectors is in the task's sve_state.

Ack!

> > Fixes: 316283f276eb ("arm64/fpsimd: ptrace: Consistently handle partial writes to NT_ARM_(S)SVE")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> This will need to be Cc'd to stable.
> 
> With the fixups above (which I assume Catalin or Will can handle):
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thank you for the review. I won't respin it, assuming Catalin or Will
can handle the message rewrite.

Thanks again!
--breno

