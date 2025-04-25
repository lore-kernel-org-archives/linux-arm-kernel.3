Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72453C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFiaMWMIJ6jFGDzd2ejMDb6Y0fvSj84EWSVaMESBeFo=; b=ECcFyAG7EcmVojCqCv/syRljSO
	MA4TiqIYr5U8LJKn3ZUrHFaNHX0b9SBe+dWyj9Kg3mtIL+/2XFAoZWEOwLF8nhqdULuaTQpUvXNUK
	wiN2QTSHsaekpsKDpiRjyDCGvhq85mYAeKF5Zq6NFflFtCNyzy6f70qoDPcQnWXJmrpHXplFsQpNZ
	ZArc44tESuLj7+lhyeDDYrFz+uVr5KbeQV/XScJmqhbmmzluM6t1BMqbQP2etYIaN8XiJt+Rv3XFM
	Ywiz11957S9e6YZdFPg9saJpPeb2zK70GfLlsVcPh2JCMn2qeLj2W6g/ymy+MvYhXKxYFCO1oDBg9
	NhgR/RNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NPC-00000000UMd-1QzT;
	Fri, 25 Apr 2025 18:04:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MtI-00000000OcX-3OGm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:31:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfe808908so3495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745602266; x=1746207066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JFiaMWMIJ6jFGDzd2ejMDb6Y0fvSj84EWSVaMESBeFo=;
        b=XOTgN2pO2po1YTxLN45o4ihxebelL6XohX+kDHCnUjHvexD/DqQrf9dFsqXUuv6CEF
         n+tREfG8WNBvwtsUr9zrYTNQ2sPs8t5kJd4AX90s5ckL/Nr8tp/PZO13Gj3dMUOKd4ZS
         FQyt+ssOvdmhDZwNHG5ePYEADdE+jX958Lc8Q7StVjMWhT9OLPLroGH+c2Eg8gBc1bEb
         XFQokX4dC45ePzogdVorKuhLSz7oorUfNWfUr7MHwWDFrnWdLKF5Gb5Z/ZDWOlWc017l
         7+dbiKEy7OrFlPAoO0o9rVQybFhGNP3PmG9G8x/2CW1sHHKJD1Miu33JedKmeMiaMQyt
         4L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602266; x=1746207066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFiaMWMIJ6jFGDzd2ejMDb6Y0fvSj84EWSVaMESBeFo=;
        b=JI7fp6nwu/WF5yx9Sc14EAe3ds8DHUxMZBKCSlqL/g5lqPMNpuzgm27v6w6nNXaGxc
         ueNTXCUojr6pniZSPoZQet93zan4aZ84lZ4Or2UinaC9VX9w/vg5f1mJz+8yozEQxCwA
         MnF/+FwcG780YVDPekD87HfvJASUKMdR1bUmnIsRQYFif6HxcGWruTo7BuAgw0SKfIPK
         95o9heDvxZ4eVd+9ACJxfPHf/06Z7s+d7960D7wguP1jYxPuwqRU08y9p3qwCRNOa7Xa
         zJ986Eb4/dK7LAmusj5ETe264usmlkpe6Yxw8R+i6u+9ZDh3mFLRZQO4Q4aO//hGz5HI
         txow==
X-Forwarded-Encrypted: i=1; AJvYcCVgYdVV4psQqk3RU8wqaR4V80HO06+Cn97fil2DKleS4NOPdKAbIU3CFq+UkmKAz/L4CeD2+ycPIaiofTnKtidd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy79Y3tGABuiIAGVb1AMP9lgLD9WoMrZmmvVR+hd7d8V4pY8Ctw
	0jTqnA5oJZurF7gk56AGs5t7Db+qHcEW8oALdSVSdKe8Ze9PF75ATE90x10cLA==
X-Gm-Gg: ASbGncuhoO3MLChXxOeiIAA1zS9tGqr6uMaTAxaiY5wcmNHkRQ+dJt3sDo8G/l3Py58
	KFDI9rr177xMpnLIbLq80Avr/3G1R7wo4a3qeZKc6oz04MHi7Kf+AJtWNo/OWXsewQN1ONtRryR
	PNQCpjnOWZGZHNRYBVeUhurGMrKmWOAlzgmdMVYWceufjLtVdLdKtgKXev+YgvoNdqlWG1E5P6z
	uZ82m4ZErtMxu7I6XbltaAhf2kpmYnGe+TE9q2Bs9AQ8Muzf7ZF/sf70v6YJtLSTno2GbuicH9H
	ta4+vBi513O+wQyBdK0nuB0/MUolHWsXr/sCXQ8ocdMjj8mfj10ODPmi+V8B5BqcM2KVtWxNdCZ
	v0zM=
X-Google-Smtp-Source: AGHT+IEVDVRVuX4opsIX/vqCZ4daSuCP6celTChiSDGf34K1DZrofUU6naynvnVCdNa987Qdas1bbg==
X-Received: by 2002:a05:600c:1c8b:b0:439:8f59:2c56 with SMTP id 5b1f17b1804b1-440abc6d38bmr9835e9.2.1745602266145;
        Fri, 25 Apr 2025 10:31:06 -0700 (PDT)
Received: from google.com (202.88.205.35.bc.googleusercontent.com. [35.205.88.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2dfc2fsm62434785e9.33.2025.04.25.10.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:31:05 -0700 (PDT)
Date: Fri, 25 Apr 2025 17:30:57 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Kees Cook <kees@kernel.org>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH 3/4] KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
Message-ID: <aAvG0br0XT9BFZ6S@google.com>
References: <20250416180440.231949-1-smostafa@google.com>
 <20250416180440.231949-4-smostafa@google.com>
 <202504161250.CC5C277A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504161250.CC5C277A@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_103108_847337_5C962082 
X-CRM114-Status: GOOD (  32.57  )
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

On Wed, Apr 16, 2025 at 12:54:21PM -0700, Kees Cook wrote:
> On Wed, Apr 16, 2025 at 06:04:33PM +0000, Mostafa Saleh wrote:
> > Add a new Kconfig CONFIG_UBSAN_KVM_EL2 for KVM which enables
> > UBSAN for EL2 code (in protected/nvhe/hvhe) modes.
> > This will re-use the same checks enabled for the kernel for
> > the hypervisor. The only difference is that for EL2 it always
> > emits a "brk" instead of implementing hooks as the hypervisor
> > can't print reports.
> > 
> > The KVM code will re-use the same code for the kernel
> > "report_ubsan_failure()" so #ifdefs are changed to also have this
> > code for CONFIG_UBSAN_KVM_EL2
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
> >  include/linux/ubsan.h            | 2 +-
> >  lib/Kconfig.ubsan                | 9 +++++++++
> >  lib/ubsan.c                      | 6 ++++--
> >  scripts/Makefile.ubsan           | 5 ++++-
> >  5 files changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> > index b43426a493df..cbe7e12752bc 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > @@ -99,3 +99,9 @@ KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS), $(KBUILD_CFLAG
> >  # causes a build failure. Remove profile optimization flags.
> >  KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%, $(KBUILD_CFLAGS))
> >  KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables
> > +
> > +ifeq ($(CONFIG_UBSAN_KVM_EL2),y)
> > +UBSAN_SANITIZE := y
> > +# Always use brk and not hooks
> > +ccflags-y += $(CFLAGS_UBSAN_FOR_TRAP)
> > +endif
> > diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
> > index c843816f5f68..3ab8d38aedb8 100644
> > --- a/include/linux/ubsan.h
> > +++ b/include/linux/ubsan.h
> > @@ -2,7 +2,7 @@
> >  #ifndef _LINUX_UBSAN_H
> >  #define _LINUX_UBSAN_H
> >  
> > -#ifdef CONFIG_UBSAN_TRAP
> > +#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
> >  const char *report_ubsan_failure(u32 check_type);
> >  #else
> >  static inline const char *report_ubsan_failure(u32 check_type)
> > diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> > index 4216b3a4ff21..3878858eb473 100644
> > --- a/lib/Kconfig.ubsan
> > +++ b/lib/Kconfig.ubsan
> > @@ -166,4 +166,13 @@ config TEST_UBSAN
> >  	  This is a test module for UBSAN.
> >  	  It triggers various undefined behavior, and detect it.
> >  
> > +config UBSAN_KVM_EL2
> > +	bool "UBSAN for KVM code at EL2"
> > +	depends on ARM64
> > +	help
> > +	  Enable UBSAN when running on ARM64 with KVM in a split mode
> > +	  (nvhe/hvhe/protected) for the hypervisor code running in EL2.
> > +	  In this mode, any UBSAN violation in EL2 would panic the kernel
> > +	  and information similar to UBSAN_TRAP would be printed.
> > +
> >  endif	# if UBSAN
> > diff --git a/lib/ubsan.c b/lib/ubsan.c
> > index 17993727fc96..a6ca235dd714 100644
> > --- a/lib/ubsan.c
> > +++ b/lib/ubsan.c
> > @@ -19,7 +19,7 @@
> >  
> >  #include "ubsan.h"
> >  
> > -#ifdef CONFIG_UBSAN_TRAP
> > +#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
> >  /*
> >   * Only include matches for UBSAN checks that are actually compiled in.
> >   * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
> > @@ -97,7 +97,9 @@ const char *report_ubsan_failure(u32 check_type)
> >  	}
> >  }
> >  
> > -#else
> > +#endif
> > +
> > +#ifndef CONFIG_UBSAN_TRAP
> >  static const char * const type_check_kinds[] = {
> >  	"load of",
> >  	"store to",
> > diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> > index 9e35198edbf0..68af6830af0f 100644
> > --- a/scripts/Makefile.ubsan
> > +++ b/scripts/Makefile.ubsan
> > @@ -1,5 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> > +#Shared with KVM/arm64
> 
> Nitpick: Please add a space between "#" and "Shared", and end the line
> with "."

I will fix it in v2.

> 
> > +export CFLAGS_UBSAN_FOR_TRAP := $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
> > +
> >  # Enable available and selected UBSAN features.
> >  ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
> >  ubsan-cflags-$(CONFIG_UBSAN_BOUNDS_STRICT)	+= -fsanitize=bounds-strict
> > @@ -10,7 +13,7 @@ ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
> >  ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
> >  ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
> >  ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
> > -ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
> > +ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(CFLAGS_UBSAN_FOR_TRAP)
> 
> Another minor style request: please name this "CFLAGS_UBSAN_TRAP"
> (nothing else in Kconfig uses "FOR" like this, and leaving it off sounds
> more declarative).
I will fix it also in v2.

> 
> >  
> >  export CFLAGS_UBSAN := $(ubsan-cflags-y)
> 
> Otherwise, yes, looks good.
> 
> -- 
> Kees Cook

Thanks,
Mostafa

