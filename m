Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F020C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 02:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmDTHtwI/yBPWt0ksQmsaYWOLJgfl6jkdJ3p4UPuqB8=; b=gQtvLFVcV4MFR8qp3oEsGXOEzQ
	Jh5ee2VTeWdid1WiWG91hrQw7ZSb+sTk8cA0sNivRuZ3LW1rV7HwPJi3ODgcNLAVb6w+g9PHRD/lo
	vrISUG6Jj9yt/V/5J2MGz8W35VfyfDUxPmgHkeFGw7YuzEfIA0T9lkJI02vMf0o7oe+dtaHjQtTd1
	Epj4fZLEqofQJvVHnLw0e0a7aZtZ8EqhmRnIyq56fmnjITetsYf/NyGcYAl5PbYV/BYs6kO5U2B+p
	Oo3VTUdRDs3kJjmVgurpiIHRlW/R4Qc/g4sw5A+0H7JpcOrfz7N1NDRlm88C5NA/qAxg1mwlCIrfN
	6OodO4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKpYP-0000000GvQF-0Hiv;
	Fri, 30 May 2025 02:33:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKpWH-0000000GvGb-4BuM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 02:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29E0A614BA;
	Fri, 30 May 2025 02:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3B2C4CEE7;
	Fri, 30 May 2025 02:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748572252;
	bh=78K/uRg12LAyCDBBxuqUJOtxtkUyuf3T7qNs8Ajqr1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGsAMSae1+Fy/8DwH38881VMtRy90s/TjF3AjeZk+y8b2EpAimPc7MteEpTbhfz9+
	 2mheFacNrNCa5WlNQCT5woXFswHoeIIYj/7q1nQZiB5fW8UMqOOmk2MRz1b4CquHgD
	 sUJs/efjr4HX2QU3urc0MoTQFdBtHB6rkAFk7z7+S/nwi73zdAlalZbzK57+MovsFF
	 +gt/QFCyLpKN4KtB1Hk7MQSSlmp30i7+Hnj0G0QIXiugyuUnUBaejnQHApDgn5rkbD
	 HCn4AbEIWoP59+YIprel/r+tBcLUqfMm3qpcbPkB6ZO1iD3VrdlgfItVjcSy2+SuLh
	 HJeyHopfO/qAg==
Date: Thu, 29 May 2025 19:30:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, will@kernel.org,
	catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Message-ID: <20250530023048.GA1491122@ax162>
References: <20250529073507.2984959-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529073507.2984959-2-ardb+git@google.com>
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

On Thu, May 29, 2025 at 09:35:08AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> It turns out that the way LLD handles ASSERT()s in the linker script can
> result in spurious failures, so disable them for the newly introduced
> BSS symbol export checks.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

You could add Fangrui's commit as a reference to why LLD 21 is needed
for this to work but it is probably not worth a v2 by itself.

https://github.com/llvm/llvm-project/commit/5859863bab7fb1cd98b6028293cba6ba25f7d514

> ---
>  arch/arm64/kernel/image-vars.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index c5266430284b..86f088a16147 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -10,6 +10,10 @@
>  #error This file should only be included in vmlinux.lds.S
>  #endif
>  
> +#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
> +#define ASSERT(...)
> +#endif
> +
>  #define PI_EXPORT_SYM(sym)		\
>  	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
>  #define __PI_EXPORT_SYM(sym, pisym, msg)\
> @@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
>  _kernel_codesize = ABSOLUTE(__inittext_end - _text);
>  #endif
>  
> +#undef ASSERT
> +
>  #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
> -- 
> 2.49.0.1238.gf8c92423fb-goog
> 
> 

