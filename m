Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AC6C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oy2Ea/ssm1beZBjGEYFsJ0VI56cblaE3GagKA541Ec=; b=tHKfvexmFcZJ2pF6UxvI194uTd
	RGLUD87Y2UIxtUHYg39OjsLquiaFvY/lN31xPQzD2xH2Smz2OgwHc13/RBenEkg/jOE7PJ+Y/e+I4
	+0Koxf8TBk3UJZsFOcyDq07rzha56r5vKTEn9IcT36jPrrrofSiXdlrQdA9NamcMvdMSZmhbxo0r9
	kRyqbOgFROCxklzmzEmwqh06+HZRTV3jg/fP26UPx+BAT5Sw0x0AenbyUWUwhN421JmFNF0cJsgJ9
	l/ccgiIi6Xq4dPI6jPiQMOjf4xg6kKJMb2l9SYl3WSWMWfPHBiK46uYfsmN+PDjsVvJVrVlu/nBnC
	qSRGBasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzyg-00000000mxS-3wof;
	Fri, 30 May 2025 13:40:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzw9-00000000mVl-2uhC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 13:38:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BFE1629EE;
	Fri, 30 May 2025 13:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7316DC4CEEB;
	Fri, 30 May 2025 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748612296;
	bh=oErVW9B+sUdfA4HxRdKhLGzTWK6paqVXGRHYPARTOEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFYy2kW1qmK0GWogVV0GRDlXo7mBPSS2bH4NQ1ny7s7gqibNDBod4dnfNi5ied47e
	 f4JC+WOBnW5wR+Vxhrf3wSHL80QEg3C7uZ+rGmEkRwa/RLaN+uabxIOmYW6+bFuekR
	 MEzlekglA30jtfTgCzKXpYo28fDi8qfWW8oQVHBPtalM4rRidb0mcLKo6wbEGXIAmz
	 gJlugk5fRBuO5TlCitpcuegepTmsD7YIZOagfxMiFy0Df5rjqLTmPoLATclIRfp3yw
	 pNXz4JFBEtiuqPT43wJ4apGWXy97XUKY5WfvITMl51YG7m6BU3dmUMgisfuAcU+3I8
	 vbDQxXSDU6cTg==
Date: Fri, 30 May 2025 14:38:12 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	nathan@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Message-ID: <20250530133811.GB30622@willie-the-truck>
References: <20250529073507.2984959-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529073507.2984959-2-ardb+git@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

What about the ASSERT()s at the end of vmlinux.lds.S? Are they not
affected by the bug, for some reason?

Also, even with this patch applied, I still see a link failure:

  | ld.lld: error: assignment to symbol __init_end does not converge

with the .config you sent me off-list.

Will

