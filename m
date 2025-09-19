Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA83ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJ1bcB1s0zz3tgBDEHljOqaNE+5+x52FmyZ/wmPMdmw=; b=HO4vjXRnAPp2zCjRWcKJAlzoW4
	wn57KlMfny6pUiPa7UhKSZWtKfgLLq2nCDO3E0uVq43eNGq21jRFSm4G+MciSCD1HClvvIXxT2dq4
	9X2LJ4ThaPFPnfWAXEDaDhDwdSFyfwANsfEjI85DjF/A+Cp4hL7j/11FytXLMTSiaeAxjF/EBFWgc
	+HStfIfj4Jl5topFBhFMyDCySEOxZFc+qz4J0WESXn0X/OtMHRPtQz+OQqI0Q4YTd77FB50/J8My8
	hHrqWvFsITBUvphUW8Hv5XRw5Es0cFShHBeqzYnr1+eOu+2nDpqkooUpKesK09Af3dG3m+dPbWcUw
	BuLz8mJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZOg-00000002iRT-3gjd;
	Fri, 19 Sep 2025 11:35:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZOf-00000002iQl-0Y9N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC5E040868;
	Fri, 19 Sep 2025 11:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FACC4CEF0;
	Fri, 19 Sep 2025 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758281724;
	bh=8V/ME5FetuhSVUNdHBVPAq2YDWKI9klTf230RijzXoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjT670faGCLl/hl2yw+AaBv0uZfKXVuSzZ1v7N4f2eiUHjVVkho9EAKbR+5PazVVj
	 aM28J8HnJRxj6uxMdgPSFO4YpOVSDfaCK0sqjQFQV+RYZU/jh++3Am8SUEfT44I9io
	 9UWTXZcg7ZxsMkGGyvdthYlDqHsIDE3EmsageVOSjh0U/ZLmDwDVGvocctIZjj8nCf
	 lJpkc4VlgxtjrTtAmf/b09maMt1ydxNvpUx/9r9mDHVRPGaOx6GjcyseWVsJp5AFsJ
	 8HBQJp0qYYctc+hmJ+WDtSHIdfMDipo2gHK+2ddPycJqFc8Y1RzRfUM7dpzKOvkDt3
	 FtOzPc95o4KMw==
Date: Fri, 19 Sep 2025 12:35:19 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 6/8] arm64/efi: Use a mutex to protect the EFI stack
 and FP/SIMD state
Message-ID: <aM0_96QvR-hlYMJJ@willie-the-truck>
References: <20250918103010.2973462-10-ardb+git@google.com>
 <20250918103010.2973462-16-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918103010.2973462-16-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_043525_194088_22416C13 
X-CRM114-Status: GOOD (  22.39  )
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

On Thu, Sep 18, 2025 at 12:30:17PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Replace the spinlock in the arm64 glue code with a mutex, so that
> the CPU can preempted while running the EFI runtime service.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kernel/efi.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 0d52414415f3..4372fafde8e9 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -166,15 +166,22 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
>  	return s;
>  }
>  
> -static DEFINE_RAW_SPINLOCK(efi_rt_lock);
> +static DEFINE_MUTEX(efi_rt_lock);
>  
>  bool arch_efi_call_virt_setup(void)
>  {
>  	if (!may_use_simd())
>  		return false;
>  
> +	/*
> +	 * This might be called from a non-sleepable context so try to take the
> +	 * lock but don't block on it. This should never fail in practice, as
> +	 * all EFI runtime calls are serialized under the efi_runtime_lock.
> +	 */
> +	if (WARN_ON(!mutex_trylock(&efi_rt_lock)))
> +		return false;

If it will never fail in practice, why do we need the lock at all? Can we
just assert that the efi_runtime_lock is held instead and rely on that?

Will

