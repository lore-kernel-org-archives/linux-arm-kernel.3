Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED0D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 23:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7abD6XH4eHcxEiWpbo/4uwSFXjdFhqX7mjZwLL/Fl0=; b=mCQNTcMIjqq1FQYrhPZDA+Tzhu
	aoigSCACrI1DWwfn4n67tA64bTzyTiKQLqa4bq3l4a/rWYrkxhangD9IMYZcK4/D0YhmW7VS/eo6u
	Oy93bTDVKXaMBkPB2xd7I4Gpbs9jy0xvaXE7qhAya7+VnAR25FGB2AMRiy54oSMg6iO3zuiLRcYEO
	owu/p+aiLc7QO3V+zlqf8D+f3Jthq+KBNmEqp0ZwW1uatn5U7nyX3lRhz9CRwu2qbTRDAt2wBf+RI
	ZbET6TWKxNbKu+69nJ44qzZ6uEOSbT+UZPNEiLWOV1fDoHFu3K7ezK2RXZYUs00IiXZ3/tbKyj5PX
	IUBYMZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPTvv-00000001qzQ-0GCM;
	Sat, 29 Nov 2025 23:00:51 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPTvs-00000001qz3-06MD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 23:00:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so5252485a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 15:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764457245; x=1765062045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7abD6XH4eHcxEiWpbo/4uwSFXjdFhqX7mjZwLL/Fl0=;
        b=J558o9ibHVmgrHJbiVT6AgXIoSWmDhWQr3hEimNG5Xy6ptfzVthzw9ya0IPJcWim+H
         mCiUSQBv9WftONIsVg+RENCHtmUa54ulnJ222LAfv1cQzxEAav1C3JNrETVESn2IIcW/
         uBm6KFT/jTCWjM/UuLYcwzehlT1DSDcLLWtZusK5KWdgQkpwBSfha6SeQJAaH5jWWZ9s
         lWefRw/gOEdVOGLtjbnmNONgLMVZ290/Xx945HSsoGNIaoGF9uCVSUU/nA+SGdplqIfB
         rWLhyLKTmMM9SMRP3c/9TVk9cyQAeJ+I7wwpHumtqVPKajfFnBtIGqoSi6JMNw1t68hw
         1KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764457245; x=1765062045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7abD6XH4eHcxEiWpbo/4uwSFXjdFhqX7mjZwLL/Fl0=;
        b=CEvCTFWosaTAOTqzFeQaJCofU4JpMvy3jG9XeiP1nH1egwHqc5rca0n4MEmKiXFvu9
         rQPHLrFRMnfpd4e/Qc1tdR/+w+YAdWOllwagS9zRlTht9DaBwH+8tcEfcsZt3NSIPCc7
         9Vf1896x9hMhU6evHLj61dYc4fzgGvaYYKQ4euqvxFIPisZBfCXkEJkxtUagGpjtnfwf
         3qBkiY9pEZ8AQ7mvyiEl0dxsQ2KqwGo8taNMQpPr903dHUfYeW3oADGEdLVQI8sbXtPf
         Syuj6T2FBzRRRQQgd1X8N6X6d13oEN3j+ku4tT0cs0gLowvbYaCEbS9xaZOgkluFsnWg
         XouA==
X-Forwarded-Encrypted: i=1; AJvYcCWopcxsbxTUXykT9wve97MSoxzEnynYCuADvDfccvFcp4J4WxEyNSyZmYwrPJox59lK/M2nY5sux4AHqZCFkNTF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+GtayFsVgfEKqn3Td7acqy5mQ8dFYNMOZFOxTvGaV1wKoB020
	nAOIItLTXCOcWCpS+ojA2slFcBrhT82px4Uxmdh9XN6U0DYn5xpTibqde2NmSOfgjhnlO7RXyV/
	Tk1eBSIlZp0EvZuqYMIZGhnuFaE5h1ws=
X-Gm-Gg: ASbGncuBhiRiuo5pfrZkJl48m7BjTMvkGw35hxyFMTkCD2Ws/4yPs0kI74v3OVAROxD
	CE8v4v5tL2ShMAD13gD6SG62Zcs4ZiTi1VX+2zkh9lMXqd3OedQlx+Gto6NzWVKyU+nuefCMZmH
	XNA9HKHQ6cgle2Z4sdbojvaCwnoY5ersq6PGGNZ24OpM7N82Y8tZdRwyBQvgLcVoBxNvawWM8Yh
	WzxOTTEHa7ue03ZQ0Yb5x7N8OisUZI3RoHO2vIiqkLWJdHMY5tyT35tBLw80rkyNBBUioUB
X-Google-Smtp-Source: AGHT+IFraZxIxArC6ZRLXa5g7OneQiuIwggV1ggNXIteOyfynnk9uYcAtUhHJonNAod2bu5yo5u0XI1eptsrAOVctRM=
X-Received: by 2002:a05:6402:50d2:b0:633:d0b7:d6d2 with SMTP id
 4fb4d7f45d1cf-645eb2a9007mr18043484a12.18.1764457245181; Sat, 29 Nov 2025
 15:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20251121100044.282684-1-thuth@redhat.com> <20251121100044.282684-2-thuth@redhat.com>
In-Reply-To: <20251121100044.282684-2-thuth@redhat.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 30 Nov 2025 00:00:33 +0100
X-Gm-Features: AWmQ_bkDTkRArCOJtRA_LXcLs7nIqPHlR48Siu-A5cxKCr76Y6aVmGcQU7u8Tko
Message-ID: <CA+=Fv5SPuYyZ2ASzz3oVMCRQNP-G+0pbW58o32ryXrm_RBfqSA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 the alpha headers
To: Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_150048_197018_1E950C70 
X-CRM114-Status: GOOD (  21.95  )
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

On Fri, Nov 21, 2025 at 11:10=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
>
> From: Thomas Huth <thuth@redhat.com>
>
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
>
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  arch/alpha/include/asm/console.h     | 4 ++--
>  arch/alpha/include/asm/page.h        | 4 ++--
>  arch/alpha/include/asm/pal.h         | 4 ++--
>  arch/alpha/include/asm/thread_info.h | 8 ++++----
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/co=
nsole.h
> index 088b7b9eb15ae..1cabdb6064bbe 100644
> --- a/arch/alpha/include/asm/console.h
> +++ b/arch/alpha/include/asm/console.h
> @@ -4,7 +4,7 @@
>
>  #include <uapi/asm/console.h>
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  extern long callback_puts(long unit, const char *s, long length);
>  extern long callback_getc(long unit);
>  extern long callback_open_console(void);
> @@ -26,5 +26,5 @@ struct crb_struct;
>  struct hwrpb_struct;
>  extern int callback_init_done;
>  extern void * callback_init(void *);
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>  #endif /* __AXP_CONSOLE_H */
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.=
h
> index 5ec4c77e432e0..d2c6667d73e9e 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -6,7 +6,7 @@
>  #include <asm/pal.h>
>  #include <vdso/page.h>
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>
>  #define STRICT_MM_TYPECHECKS
>
> @@ -74,7 +74,7 @@ typedef struct page *pgtable_t;
>  #define PAGE_OFFSET            0xfffffc0000000000
>  #endif
>
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>
>  #define __pa(x)                        ((unsigned long) (x) - PAGE_OFFSE=
T)
>  #define __va(x)                        ((void *)((unsigned long) (x) + P=
AGE_OFFSET))
> diff --git a/arch/alpha/include/asm/pal.h b/arch/alpha/include/asm/pal.h
> index db2b3b18b34c7..799a64c051984 100644
> --- a/arch/alpha/include/asm/pal.h
> +++ b/arch/alpha/include/asm/pal.h
> @@ -4,7 +4,7 @@
>
>  #include <uapi/asm/pal.h>
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>
>  extern void halt(void) __attribute__((noreturn));
>  #define __halt() __asm__ __volatile__ ("call_pal %0 #halt" : : "i" (PAL_=
halt))
> @@ -183,5 +183,5 @@ qemu_get_vmtime(void)
>         return v0;
>  }
>
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>  #endif /* __ALPHA_PAL_H */
> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/as=
m/thread_info.h
> index 4a4d00b37986e..98ccbca64984c 100644
> --- a/arch/alpha/include/asm/thread_info.h
> +++ b/arch/alpha/include/asm/thread_info.h
> @@ -4,14 +4,14 @@
>
>  #ifdef __KERNEL__
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  #include <asm/processor.h>
>  #include <asm/types.h>
>  #include <asm/hwrpb.h>
>  #include <asm/sysinfo.h>
>  #endif
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  struct thread_info {
>         struct pcb_struct       pcb;            /* palcode state */
>
> @@ -44,7 +44,7 @@ register struct thread_info *__current_thread_info __as=
m__("$8");
>
>  register unsigned long *current_stack_pointer __asm__ ("$30");
>
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>
>  /* Thread information allocation.  */
>  #define THREAD_SIZE_ORDER 1
> @@ -110,7 +110,7 @@ register unsigned long *current_stack_pointer __asm__=
 ("$30");
>         put_user(res, (int __user *)(value));                           \
>         })
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  extern void __save_fpu(void);
>
>  static inline void save_fpu(void)
> --
> 2.51.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

