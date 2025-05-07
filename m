Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C47EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGWvFh73VHU/UucUjdIHLesAEivi8T6Wp6e/2i5JC5A=; b=hlj21Pu5UJevkJZX3GbrsOIX2v
	47hZdUD3FLjNjnrdnKMpAQiqyB2Lnhk2IcStzME+f0gu6497sg9ZwoXCS5H9XZGg7AiX8L5HNNiB8
	2l3u6Xbgm+YJauEzSn2ztc7zlqiHrn2K2NHYPAgHn0wx0mn+G3UhJbzGIM1OB50UtFKYivcNaD65/
	q+8RhrycQ+RpxTawN3lOaFIaoPCm7SsOzOi13eDUKuSs507Cw8bBRXZlSorfDTKD2Ti5fj60wlzcp
	GPXbPS71x0S8qAr+HmC+Z1rMNeu5+Txygv+dwCVrmL83ZgqnKJM3cqwstjvVzN5OdGUUkukYrx8jH
	UnGymcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeFp-0000000FTcV-0ydy;
	Wed, 07 May 2025 12:52:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeAs-0000000FSYm-0GgT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 12:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06BF3A4D89E;
	Wed,  7 May 2025 12:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308D0C4CEE7;
	Wed,  7 May 2025 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746622016;
	bh=M8HiGgo70JZQbHUXbcLV/WPIeId2qynww23Fp9ql1dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=En/TkqDRvJ70cgXG6YITOFBAJarr4oL8aHja8hCtp5qoVNR7Fic16ivjv7L3QfzEB
	 R47M1gQDH4FBdiqdtA0DXIeBHJy+ODDBWupxKPZH/q/7FBdqB9kfR9OB8te6cHCHHM
	 rkeGokL6nMimw8FNHfEzCHg7AVnri52qs7ZaJBso88bEhyNWZvYatQWMQlA3JYmG2+
	 MVxWe3rzk68pR7DOGvedLRzHuBsUtMxgC4O2F4Z6k0x0PFHPWgGEPgphiEbJuvys//
	 79LBnczPiG3zlwMd4+pKISShK5IAOZa/D5+eZh2mSswkCXpCHwi+XNgV6j0QaPXGLU
	 WxJ92R3wsFRYA==
Date: Wed, 7 May 2025 13:46:45 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 03/20] arm64/fpsimd: signal: Clear PSTATE.SM when
 restoring FPSIMD frame only
Message-ID: <20250507124644.GA2227@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-4-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-4-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_054658_243362_354FA5F3 
X-CRM114-Status: GOOD (  24.71  )
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

On Tue, May 06, 2025 at 04:25:06PM +0100, Mark Rutland wrote:
> On systems with SVE and/or SME, the kernel will always create SVE and
> FPSIMD signal frames when delivering a signal, but a user can manipulate
> signal frames such that a signal return only observes an FPSIMD signal
> frame. When this happens, restore_fpsimd_context() will restore state
> such that fp_type==FP_STATE_FPSIMD, but will leave PSTATE.SM as-is.
> 
> It is possible for a user to set PSTATE.SM between syscall entry and
> execution of the sigreturn logic (e.g. via ptrace), and consequently the
> sigreturn may result in the task having PSTATE.SM==1 and
> fp_type==FP_STATE_FPSIMD.
> 
> For various reasons it is not legitimate for a task to be in a state
> where PSTATE.SM==1 and fp_type==FP_STATE_FPSIMD. Portions of the user
> ABI are written with the requirement that streaming SVE state is always
> presented in SVE format rather than FPSIMD format, and as there is no
> mechanism to permit access to only the FPSIMD subset of streaming SVE
> state, streaming SVE state must always be saved and restored in SVE
> format.
> 
> Fix restore_fpsimd_context() to clear PSTATE.SM when restoring an FPSIMD
> signal frame without an SVE signal frame. This matches the current
> behaviour when an SVE signal frame is present, but the SVE signal frame
> has no register payload (e.g. as is the case on SME-only systems which
> lack SVE).
> 
> This change should have no effect for applications which do not alter
> signal frames (i.e. almost all applications). I do not expect
> non-{malicious,buggy} applications to hide the SVE signal frame, but
> I've chosen to clear PSTATE.SM rather than mandating the presence of an
> SVE signal frame in case there is some legacy (non-SME) usage that I am
> not currently aware of.
> 
> For context, the SME handling was originally introduced in commit:
> 
>   85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")
> 
> ... and subsequently updated/fixed to handle SME-only systems in commits:
> 
>   7dde62f0687c ("arm64/signal: Always accept SVE signal frames on SME only systems")
>   f26cd7372160 ("arm64/signal: Always allocate SVE signal frames on SME only systems")
> 
> Fixes: 85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/signal.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 48d3c0129dade..fdce1b856f498 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -280,6 +280,7 @@ static int restore_fpsimd_context(struct user_ctxs *user)
>  	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
>  
>  	clear_thread_flag(TIF_SVE);
> +	current->thread.svcr &= ~SVCR_SM_MASK;
>  	current->thread.fp_type = FP_STATE_FPSIMD;

Hmm, I think we're preemptible here so do we need some compiler barriers
to make sure that the context-switching code doesn't see these fields in
an inconsistent state?

Will

