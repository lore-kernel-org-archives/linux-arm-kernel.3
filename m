Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED32BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L53dXikqTNXJkZTSFekn3I5MrGgFa0Qzi3Fg74QfOfE=; b=2Tdgx0Gl7hR0pqFf8rw5hQZQir
	Y1UqSN/5piuJZ1dTjDwC+yKxkkbuxm5dMRQx9yxFJnyVm2i9I2xdx6K6zVUIgJ3qFHW3uVEXZHyyU
	TYuP96Aui4AexEcbADGxWFDQqYvkyBm35u3BF296NljaRIgE0gNhJwR3LLlq4ZTQ6Pmj42hz/unBx
	i046oaKqQoIBLeKnqqYW2YFJ35OKIGZhvBvFwklgEOneh4UJqEX+su27MBXZkGGUs1ReyMgvoNeNX
	Gq2sRVhQDZcKvOaFUou87nQKOXuVXoAt47ErdB+H+P6M+8zL0kd6xh4LRCtvxNnhYd6bfgiByGY6J
	k7o5uxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0hp-00000000u2z-46Fm;
	Fri, 30 May 2025 14:27:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0dx-00000000tQW-0D5y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 14:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14B41A4F654
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 14:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9714AC4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 14:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615009;
	bh=G1DHqL85O4M7V9gqQeeeLVXS9o1JqvnLgjJ0b/R3998=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kh+0GJAZgF9ocuGGvCpcj14yF/KsAoPDFdkcNZTBX11vSxNlxEVpWvxlhIY/pNRww
	 KKLMXmTOaOG4JfN/kjaQydvmwzMSgbw5O3na6AwKMq7kqap9t0YaWI+dtdC2gIER4J
	 ufOLi4JGLxgnZbAyWisY8tMNSNk5QQ8m7TjMxNHGDTfZuzeofdl2kDIf8D5P5/caVL
	 XekITB6/ZmkITNSae0qeCdR7iz19oUGV1oJsIc5o7y79nTz4MbgjDW61ApyW0xx3nH
	 eQXkqs8HWsCfTTzXEua71lmzYCbznr9wfAa6+nK5VEboNJX0+MoCgBlOMqyY4MjXSD
	 nphD72Vpp7TPw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-552206ac67aso2521137e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 07:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsiH3b1HNGdGBax62uB1wRZN0wEzwLj+GuZfJAo29AtKc9yk+8zQlCOatfPx0oWH2Ohq4Pnz1+7NAOyNMAVGlY@lists.infradead.org
X-Gm-Message-State: AOJu0YzuLFT3sZlnKKE/ZJqI8FLyW3jNq5gKWRXRx05Uc3InL6ZKG8Rd
	YjtLzvvL3Mhqs4GujdQ14MhRKW7w6NcdVmkNuaLQQ/xHo9+tPYBTmC+orR5JNWPJKpdVT6qLkOK
	czrBGRIzC9a9wJRO+y378D0H/UUf+z3s=
X-Google-Smtp-Source: AGHT+IGt/ob5oIdyFBNz3BNQJMytXMyiUKhYop+0LOnh+OuVTmEFUuUGiES8anXXR0vfHxL+cc3/rDK2U4LsEG3cMBU=
X-Received: by 2002:a05:6512:1150:b0:553:2a2f:22eb with SMTP id
 2adb3069b0e04-5533d1ab3d4mr864981e87.36.1748615007973; Fri, 30 May 2025
 07:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250529073507.2984959-2-ardb+git@google.com> <20250530133811.GB30622@willie-the-truck>
In-Reply-To: <20250530133811.GB30622@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 May 2025 16:23:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHypqdC9O+8WH7n1=aDOySMScZc2y526S3gc_-QNpqO=w@mail.gmail.com>
X-Gm-Features: AX0GCFv9Ullf4B8cpH7c41fIue3JQUkh9LV84qL1g7sdVxmnSnjW5Ar7V20Dwwk
Message-ID: <CAMj1kXHypqdC9O+8WH7n1=aDOySMScZc2y526S3gc_-QNpqO=w@mail.gmail.com>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
To: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, 
	nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_072333_229937_78B0F348 
X-CRM114-Status: GOOD (  24.91  )
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

On Fri, 30 May 2025 at 15:38, Will Deacon <will@kernel.org> wrote:
>
> On Thu, May 29, 2025 at 09:35:08AM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > It turns out that the way LLD handles ASSERT()s in the linker script can
> > result in spurious failures, so disable them for the newly introduced
> > BSS symbol export checks.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/image-vars.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > index c5266430284b..86f088a16147 100644
> > --- a/arch/arm64/kernel/image-vars.h
> > +++ b/arch/arm64/kernel/image-vars.h
> > @@ -10,6 +10,10 @@
> >  #error This file should only be included in vmlinux.lds.S
> >  #endif
> >
> > +#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
> > +#define ASSERT(...)
> > +#endif
> > +
> >  #define PI_EXPORT_SYM(sym)           \
> >       __PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> >  #define __PI_EXPORT_SYM(sym, pisym, msg)\
> > @@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
> >  _kernel_codesize = ABSOLUTE(__inittext_end - _text);
> >  #endif
> >
> > +#undef ASSERT
>
> What about the ASSERT()s at the end of vmlinux.lds.S? Are they not
> affected by the bug, for some reason?
>
> Also, even with this patch applied, I still see a link failure:
>
>   | ld.lld: error: assignment to symbol __init_end does not converge
>
> with the .config you sent me off-list.
>

That is a different error that has been lurking for a while now; Arnd
occasionally hits it but I haven't seen any other reports of it. AIUI,
the issue is that INIT_IDMAP_DIR_PAGES and INIT_DIR_SIZE are defined
in terms of (_end - KIMAGE_VADDR), resulting in a circular dependency.

The config in the kernel test robot's report [0] appears to build fine
with this patch applied.


[0] https://lore.kernel.org/all/202505261019.OUlitN6m-lkp@intel.com/T/#u

