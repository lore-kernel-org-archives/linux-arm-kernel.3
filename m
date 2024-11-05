Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33BBD2C12D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KkAinrNT+hYVyXrN15tEDaGqNXSK6Grpc32DS2aupI=; b=uyjy8J96tlrhN61d6Mlqv5kvfI
	c8ohsaRlNHpfAcuUl6xXFUchnZxsFO30PenEjPOrjN72CWjcmFJq5P9lUhoQUWMFU49EUxxiXCeBr
	MjS7EtrjhMr4ypVLKerbqGHp2i62I8q9Kg26X6rM80yTz/FERZ9n4AmHA7rA/3W4x/BkUyI28jtG3
	Gplz84Xer0iZitiqSi/USusUuDpYhKqshgASJm7QLKk+c1mJqQK9t+Nm/ovB/Dj6G7kh6xY7ap+Ic
	/oRWOde+TcNxq4IY7KLk7XiCMazQLOXg6x5zUAPTpulMck14+CeGF6fXGZEtcHQ45zFOfgmv6amKT
	sPQfT/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LMB-0000000HPOL-3YZK;
	Tue, 05 Nov 2024 15:20:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LKT-0000000HP6t-24PB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:18:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77145FEC;
	Tue,  5 Nov 2024 07:19:15 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89A823F528;
	Tue,  5 Nov 2024 07:18:44 -0800 (PST)
Date: Tue, 5 Nov 2024 15:18:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/signal: Avoid corruption of SME state when
 entering signal handler
Message-ID: <Zyo3QU8aBGmtbTRo@J2N7QTR9R3.cambridge.arm.com>
References: <20241030-arm64-fp-sme-sigentry-v2-1-43ce805d1b20@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-arm64-fp-sme-sigentry-v2-1-43ce805d1b20@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_071849_645315_0DF49C5F 
X-CRM114-Status: GOOD (  26.62  )
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

On Wed, Oct 30, 2024 at 07:58:36PM +0000, Mark Brown wrote:
> We intend that signal handlers are entered with PSTATE.{SM,ZA}={0,0}.
> The logic for this in setup_return() manipulates the saved state and
> live CPU state in an unsafe manner, and consequently, when a task enters
> a signal handler:

Looking at this, I think there's a bigger question as to what we
actually intend here; explanation below, with two possible answers at
the end.

[...] 

> +/*
> + * Called by the signal handling code when preparing current to enter
> + * a signal handler. Currently this only needs to take care of exiting
> + * streaming mode and clearing ZA on SME systems.
> + */
> +void fpsimd_enter_sighandler(void)
> +{
> +	if (!system_supports_sme())
> +		return;
> +
> +	get_cpu_fpsimd_context();
> +
> +	if (test_thread_flag(TIF_FOREIGN_FPSTATE)) {
> +		/* Exiting streaming mode zeros the FPSIMD state */
> +		if (current->thread.svcr & SVCR_SM_MASK) {
> +			memset(&current->thread.uw.fpsimd_state, 0,
> +			       sizeof(current->thread.uw.fpsimd_state));
> +			current->thread.fp_type = FP_STATE_FPSIMD;
> +		}
> +
> +		current->thread.svcr &= ~(SVCR_ZA_MASK |
> +					  SVCR_SM_MASK);
> +
> +		/* Ensure any copies on other CPUs aren't reused */
> +		fpsimd_flush_task_state(current);
> +	} else {
> +		/* The register state is current, just update it. */
> +		sme_smstop();
> +	}

I don't think that the foreign / non-foreign cases are equivalent. In
the foreign case we clear the entire fpsimd_state structure, i.e. all
of:

	struct user_fpsimd_state {
		__uint128_t     vregs[32];
		__u32           fpsr;
		__u32           fpcr;
		__u32           __reserved[2];
	};

Looking at the latest ARM ARM (ARM DDI 0487K.a):

  https://developer.arm.com/documentation/ddi0487/ka/

... the descriptions for FPSR and FPCR say nothing about exiting
streaming mode, and rule RKFRQZ says:

| When the Effective value of PSTATE.SM is changed by any method from 1
| to 0, an exit from Streaming SVE mode is performed, and in the
| newly-entered mode, all implemented bits of the SVE scalable vector
| registers, SVE predicate registers, and FFR, are set to zero.	

... which doesn't say anything about FPSR or FPCR, so from the ARM ARM
it doesn't look like SMSTOP will clobber those.

Looking at the latest "Arm A-profile Architecture Registers" document
(ARM DDI 061 2024-09):

  https://developer.arm.com/documentation/ddi0601/2024-09/

... the description of FPCR says nothing about exiting streaming mode,
so it appears to be preserved.

... the description of FPMR (which is not in the latest ARM ARM) says:

| On entry to or exit from Streaming SVE mode, FPMR is set to 0.

... so we'd need code to clobber that.

... and the description of FPSR says:

| On entry to or exit from Streaming SVE mode, FPSR.{IOC, DZC, OFC, UFC,
| IXC, IDC, QC} are set to 1 and the remaining bits are set to 0.

... so we'd need something more elaborate.

AFAICT either:

(a) Our intended ABI is that signal handlers are entered as-if an SMSTOP
    is executed to exit streaming mode and disable ZA storage.

    In this case we'll need a more elaborate sequence here to simulate
    that effect.

(b) Our intended ABI is that signal handlers are entered with
    PSTATE.{SM,ZA} cleared, FPSR cleared, FPCR cleared, and FPMR
    preserved.

    In this case we cannot use SMSTOP in the non-foreign case, and it
    would be simplest to always save the value back to memory and
    manipulate it there.

Our documentation in Documentation/arch/arm64/sme.rst says:

| Signal handlers are invoked with streaming mode and ZA disabled.

... and doesn't mention FPCR/FPMR/FPSR, so we could go either way,
though I suspect we intended case (a) ?

Mark.

