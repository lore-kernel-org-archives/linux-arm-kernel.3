Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AFCC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGXUIdTFQac7mJFRH+e+84EpMzV6neC01o/VEUKascg=; b=DAmhJ/zd25nf6LCaL2tx4Cs4qv
	xa9zXSvMOL0ePrpqQtsHMg62/5/dtmmOGSEzwUzoq/jmcH/37jZtIrxpNARVZ1A7dNS1Y1LhrSbsm
	oHoMX48r+f2et7qwladmjHoeJNTc1N/emDJYbLvG9zmlEwmeIGXIin/e7k9oIlKVWn7LxPcwr/DQ1
	WeCneE38UmN6MCNToOlwwzigYspP6nIsOgLu2n0VfzOodQy2KUxOFoHYtinWqht50b4BZVtpUyPlH
	LG29hFPhGx4Rki7wmT5u7Bkkss8POqphbVeudQ0e4+xQlwHz8i0tfcfm7AhoSia4ONH6MjShvXd8e
	EPklROwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0NS-00000000c5R-2ocM;
	Thu, 08 May 2025 12:29:26 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Jb-00000000bDK-2sck
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:25:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso7708321fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746707126; x=1747311926; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGXUIdTFQac7mJFRH+e+84EpMzV6neC01o/VEUKascg=;
        b=NUgYliGPZydivBfPe8770ET4iH+lijmx6v8DCCVxvBtYVBw07QuCzK0c4YUDHFIVmc
         VSEx+GNV5iTtS7WuTjvXpf7M9LfoPRfwcp+AyhwnqmydOuSB3vyKSW4x00xq7lmIO4lW
         F6UmBTUy/e/54cIcFE1X5ZI9RD+Kyh64EpeY++4Evf6S+iJzKFdxorgnYubeYB3SIGiS
         h+dnXRgMGRUwYbCZ735gJhGhvjwgGf0si4CJJWOPdgn6Y+nMbTZhW2Ys1mIJF3knrhQU
         hB8QPZ1XHsrJRmf5cNRIKkU8Tr/kG84gXBVh7GBqLDJtK4HcJbGn75+PorlJ9Nd29zOH
         LOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707126; x=1747311926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGXUIdTFQac7mJFRH+e+84EpMzV6neC01o/VEUKascg=;
        b=Q6b7uACTVZjG8XB07N+7CtZB1OtCtdShZnQRspMotVQeNSrDtolcpd/Es/3PQDthRS
         681UsEHS0cSZgFS07D3VkY9d6+24RMAGCwx+Lh1BMCG/Z5OE+1V+k07sfKVT0iugGB0F
         KjZw8yNlwYdbK1zn+k1SKos2HlpUAf2jJqyz/r1tC+vxcjPV99FHJzDxS6MIAaud/YPx
         LwsI1OeA7fCT2d//IV3kyR2l/H8f+PB+7g89bc/TU8L4ugF53pw1nHAhJBD2D2tLdCVg
         1SKzBpCRVn+Sb+fOOskK1YYr8b921aE8N6wdm2ewj5Tlqv8YcamyFWWaSO5IeeEEjvpk
         iE9w==
X-Forwarded-Encrypted: i=1; AJvYcCUnpP2D7ZRG1qfpYhCJh4/Pe8sSRs83FfPSB4FLUrXmm1Oq82ne8tg7DFn9zB04jtiDLA0UF/ZFtG5ZrvlFiBaK@lists.infradead.org
X-Gm-Message-State: AOJu0YywJUinjs6JZ7q2FmaNDuvao74t8QvUvSqes2Zb+Fjg/OJYjXMK
	L1KgtnBP9WcxZAN8h863diNvWg08BhmDFlUcbDgmCR8t8HfOEpf+00uoviXyxQ621khkSBfU3+e
	XQQYqz3UglZiCGJpjrA1U7eEIHiqZCiWgNC6y
X-Gm-Gg: ASbGnctD6R86MV7gONm1zKZwTNPVCBp/GHT1fcsUjbbxufZ0oPNimVKwOFWLohqf+Ev
	t3VBCzv4zzgyo5oN/q3n8qdofgFWwhcnL/0puI661bOJZ1vyCaUhcx4lrQUB/bGTlTGXZGvHh2V
	Vt1MgOyofY0IItxuMZwuvowxSh9zA8Vbsi1pR1RCOFasyBlYCpPFTd
X-Google-Smtp-Source: AGHT+IHELJP6PjDmjgnoQ+DcewZezMvkPDTBk3DlAEgOIW2HtUu14uSoRBVrm2tBSd/cEMjU36ADUjG1Ap9y8UFRrr8=
X-Received: by 2002:a05:651c:b11:b0:30b:f006:3f5 with SMTP id
 38308e7fff4ca-326b87dacdfmr7793251fa.15.1746707125568; Thu, 08 May 2025
 05:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250507180852.work.231-kees@kernel.org> <20250507181615.1947159-2-kees@kernel.org>
 <CANpmjNPcYPvnQzMT3p+Vc2=EiEbR1WnykUEjuYc0bH2HOFi6HQ@mail.gmail.com>
In-Reply-To: <CANpmjNPcYPvnQzMT3p+Vc2=EiEbR1WnykUEjuYc0bH2HOFi6HQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 8 May 2025 14:25:13 +0200
X-Gm-Features: ATxdqUEOMWVMkXbvXQaHqruZq4t8-pmXFLrRyvMg5ohXOpGrzDC1z300bwlcEE0
Message-ID: <CACT4Y+betRmieWEHBdEf=gOLhWiNVRH5CSDeN6ykBtoP1GrzLA@mail.gmail.com>
Subject: Re: [PATCH 2/8] init.h: Disable sanitizer coverage for __init and __head
To: Marco Elver <elver@google.com>
Cc: Kees Cook <kees@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Aleksandr Nogikh <nogikh@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Hou Wenlong <houwenlong.hwl@antgroup.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	kasan-dev@googlegroups.com, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	sparclinux@vger.kernel.org, llvm@lists.linux.dev, 
	syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_052527_740447_FE50497B 
X-CRM114-Status: GOOD (  27.83  )
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

On Thu, 8 May 2025 at 14:23, Marco Elver <elver@google.com> wrote:
>
> +Cc KCOV maintainers
>
> On Wed, 7 May 2025 at 20:16, Kees Cook <kees@kernel.org> wrote:
> >
> > While __noinstr already contained __no_sanitize_coverage, it needs to
> > be added to __init and __head section markings to support the Clang
> > implementation of CONFIG_STACKLEAK. This is to make sure the stack depth
> > tracking callback is not executed in unsupported contexts.
> >
> > The other sanitizer coverage options (trace-pc and trace-cmp) aren't
> > needed in __head nor __init either ("We are interested in code coverage
> > as a function of a syscall inputs"[1]), so this appears safe to disable
> > for them as well.
>
> @ Dmitry, Aleksandr - Will this produce some unwanted side-effects for
> syzbot? I also think it's safe, but just double checking.

I do not see any problems with this.

> > Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/kcov.c?h=v6.14#n179 [1]
> > Signed-off-by: Kees Cook <kees@kernel.org>
>
> Acked-by: Marco Elver <elver@google.com>
>
> > ---
> > Cc: Marco Elver <elver@google.com>
> > Cc: Andrey Konovalov <andreyknvl@gmail.com>
> > Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: <x86@kernel.org>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> > Cc: Luis Chamberlain <mcgrof@kernel.org>
> > Cc: Sami Tolvanen <samitolvanen@google.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: <kasan-dev@googlegroups.com>
> > ---
> >  arch/x86/include/asm/init.h | 2 +-
> >  include/linux/init.h        | 4 +++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
> > index 8b1b1abcef15..6bfdaeddbae8 100644
> > --- a/arch/x86/include/asm/init.h
> > +++ b/arch/x86/include/asm/init.h
> > @@ -5,7 +5,7 @@
> >  #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 170000
> >  #define __head __section(".head.text") __no_sanitize_undefined __no_stack_protector
> >  #else
> > -#define __head __section(".head.text") __no_sanitize_undefined
> > +#define __head __section(".head.text") __no_sanitize_undefined __no_sanitize_coverage
> >  #endif
> >
> >  struct x86_mapping_info {
> > diff --git a/include/linux/init.h b/include/linux/init.h
> > index ee1309473bc6..c65a050d52a7 100644
> > --- a/include/linux/init.h
> > +++ b/include/linux/init.h
> > @@ -49,7 +49,9 @@
> >
> >  /* These are for everybody (although not all archs will actually
> >     discard it in modules) */
> > -#define __init         __section(".init.text") __cold  __latent_entropy __noinitretpoline
> > +#define __init         __section(".init.text") __cold __latent_entropy \
> > +                                               __noinitretpoline       \
> > +                                               __no_sanitize_coverage
> >  #define __initdata     __section(".init.data")
> >  #define __initconst    __section(".init.rodata")
> >  #define __exitdata     __section(".exit.data")
> > --
> > 2.34.1
> >

