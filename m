Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4643AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXIobE5b6VW8RzKFzcASsltJi5rpNbgytTkp8AnV2LE=; b=yZR1Nw2sMYAPcDo1lMkHvW0zWF
	nr5teIXb02meP8PyjnTysCaq2GRzoaPMM9/EnXb6/g7fUnWMGT/ZtPakwqeUmLONO0E+su13YZHD1
	RFwCieeu7J2h8RoLVCzNEOwOzo7pboX5nOSasQGOHqad4gv0DkjdBNyL7mVGTYSaTbWNq+s97DwWC
	9Ij5jKvD5hkJ3JxF5vjXK85jPBDCL+H8qGFV9L/90Y6JI0SjgvKAeQYVkoEGW3DwmKty9PaFraNwM
	YaXkegz4cgwRzg5qruiKnzVriwAemC2ZoXtOxoLp9XZycS4OKFkk/rzTG8mMHno9MrqqCAUrIX058
	DVHeTcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE74-0000000Ewlh-11aE;
	Fri, 11 Jul 2025 13:48:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE11-0000000Ew0S-36Y0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 13:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iXIobE5b6VW8RzKFzcASsltJi5rpNbgytTkp8AnV2LE=; b=bKq3xX37zovRndp/82mhLpkLcH
	Grrhhw35o759ZCPeBrjPj7Djslcp/1QAskOsscxa6mcmkWQU8305FewX7Ae0+psA8tnQfMxOnPQV4
	KVOPWujqyMSrJsccgUlIOz2SVDXu+KrCBGhjuRt/dVAoQCMOUHIW27LzBhD9Uv32ctXljPwueGQ1J
	a82RbCqoWmPSaEqGx9EMduLcMCXTlCGY/oyYX0DdubnSYxiBhb5+8Lh4SZY1/KUYPFd1JpjEqxO5s
	d129+oCEvPgxQ3aApg2LDf3LmtNha/JBfRga4I9ApCuX+LSsLx7RMT6Kb9wYPWXRU90vW1KZoh91U
	JQCQxuJA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE0w-00000009GjO-169A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A70C146465;
	Fri, 11 Jul 2025 13:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41F2C4CEED;
	Fri, 11 Jul 2025 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752241323;
	bh=E+qQLRz6mPRPePZKtFgMgdhHMnIyYUYFPTP+kWQvHIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQ2E+87aPmB2oO90D/mF50PyoPZCyzBHz4b5Y6PM2H+D1vplka2tb4RDipc9wFan8
	 vwNaJFJgXLt71CKtOsluLFBFPk4k6GDMtIepI+vZ6xouxcoDvD2EExIsRXQU4t0+QH
	 9LhtosxM6qmzWcb314/+AS9ZsLw2XoQaOS/X3K/5+qm67+uGm44WhPe6A0qTJfPPOc
	 7JsVNcPIqNfaiAPSPu4lNhCgQN0oGEFLV/xKNhU/Xkw0Fcr4kxt68pgAG0x53jB/NM
	 nQLxWnzjAvuIY5U7xkNxhgmIlJi6Myglh3Bl42w+Eh92hbZJyE+gVSNI2NyJ0QsHkC
	 c76o+WrRHzU1Q==
Date: Fri, 11 Jul 2025 14:41:58 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 6/7] arm64/efi: Move uaccess en/disable out of
 efi_set_pgd()
Message-ID: <aHEUpiXt-pW7DBAN@willie-the-truck>
References: <20250514174339.1834871-9-ardb+git@google.com>
 <20250514174339.1834871-15-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514174339.1834871-15-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_144210_593809_4F73224C 
X-CRM114-Status: GOOD (  19.93  )
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

On Wed, May 14, 2025 at 07:43:46PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> efi_set_pgd() will no longer be called when invoking EFI runtime
> services via the efi_rts_wq work queue, but the uaccess en/disable are
> still needed when using PAN emulation using TTBR0 switching. So move
> these into the callers.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/efi.h | 3 ---
>  arch/arm64/kernel/efi.c      | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
> index decf87777f57..abe9176a3a23 100644
> --- a/arch/arm64/include/asm/efi.h
> +++ b/arch/arm64/include/asm/efi.h
> @@ -132,15 +132,12 @@ static inline void efi_set_pgd(struct mm_struct *mm)
>  			 * exception when invoking the EFI run-time services.
>  			 */
>  			update_saved_ttbr0(current, mm);
> -			uaccess_ttbr0_enable();
> -			post_ttbr_update_workaround();
>  		} else {
>  			/*
>  			 * Defer the switch to the current thread's TTBR0_EL1
>  			 * until uaccess_enable(). Restore the current
>  			 * thread's saved ttbr0 corresponding to its active_mm
>  			 */
> -			uaccess_ttbr0_disable();
>  			update_saved_ttbr0(current, current->active_mm);
>  		}
>  	}
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index d01ae156bb63..5d188c6c44d7 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -177,6 +177,8 @@ bool arch_efi_call_virt_setup(void)
>  		return false;
>  
>  	efi_virtmap_load();
> +	uaccess_ttbr0_enable();
> +	post_ttbr_update_workaround();
>  	__efi_fpsimd_begin();
>  	return true;
>  }
> @@ -185,6 +187,7 @@ void arch_efi_call_virt_teardown(void)
>  {
>  	__efi_fpsimd_end();
>  	efi_virtmap_unload();
> +	uaccess_ttbr0_disable();

Moving this after updating the saved TTBR0 isn't great for SWPAN, as it
means that if we take an exception (e.g. an IRQ) before calling
uaccess_ttbr0_disable() then I think we'll end up running with the user
page-table installed briefly in TTBR0 which SWPAN is supposed to prevent
outside of genuine uaccess sections.

Will

