Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24EFE77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcTZJffRKJFLQ0fKlKmrd75g6mQ38s5WcS/uLYuZ4Jk=; b=RiWOiuGVmIFHS+jM+RSmRk0tVU
	h9BxBxg8XtpNMe5WO8Mf8Ov09mOTTB+jz5N/r6kv/1w5F5M5IGV0XNe07dNB1+HPXiXm+9XjqHBtz
	EOc/rQrrmDloSGAVqB8Mv20PpYMwQV31Ih8UYEyfrj3Mwgt9NRU7CA8hZE8Nokvhyb5Do1zHcHMIU
	mcXj29Viw2nxabIgY2nH0Fvc/BPQNyvhLgDWixbnKMGBh4qHSkBIMQ7y0nmixYMOiJjU3B6Fhmd18
	/PIE/4Uh/lEOPxSHnUQ+MIVupmufgTseRJOYi8b1Cu4bdXQPSGXMC4wOpFqZJnjY/HwtgXjCGTEIz
	p4fjFF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIJD-0000000EFyl-3TUK;
	Wed, 11 Dec 2024 08:43:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIIA-0000000EFpN-0T3n;
	Wed, 11 Dec 2024 08:41:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B83DA41FD3;
	Wed, 11 Dec 2024 08:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519F9C4CEEE;
	Wed, 11 Dec 2024 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733906516;
	bh=11k4EF5OtV96AkBGLTd+hH0qKo61NlPe3GiJ6SKgOkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pm8GQBRyxvJBdkrJvB5xqnkaQDK3pQH87o2d08mKRohKRhHeZREIXkL0k4nqUt2cm
	 hPk5xQc3DdC83EUlt0uuVyRLixOlSM/eq/88PsXvN7dVJqm/xljHvKMIBC1C/gFBHQ
	 P8aJVl5g1ko3s6+ndoUJmGaN+L+ce0g8sKQS3+1C6YhCPXYds31oE4aUehqq1aqt3U
	 rq15OYEnt6oohrzKUah8SL1L/YUO6y2qYlI1J5WAyK9LQzlpbzO/tP8WJBI/FgEn3F
	 ndJ1ytAS7pYHzrUy+wcnCubZp+bJEiXgPYiWJqv5+94lJqn7J9A9Qwoszdch4dNaPq
	 LIrJbvVowJqtg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so5819948a12.2;
        Wed, 11 Dec 2024 00:41:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9q4IUn55RxgjZ3L65mRpduz7b8RQRFfda1ic16uwzgAt2QacylYZMyc0b7NmfJqnejhR7ecna25+f2+Q=@lists.infradead.org, AJvYcCWvVcKNNsjCV+oDJUESxvyt8OzWL9S1JmY8wSgfEq89IO/DccsVirtLhIHf0ACdPceRV9EjSsL6ItrI+TBIphF2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi5ZDDFomjZX3SaMf7zhFT7Xz9RwpVyPEkZMPJAD5q1HMXe2R2
	XUWPrcjpvMe+DfXPJOVNTBNw4jXk/Dev6yEhF4D9RoTaUOzhKa7DtQd+V4z2gisAfxGX4k1PNzB
	VqoyRXPXJSHejl8lEGINUylzPSPI=
X-Google-Smtp-Source: AGHT+IGBqIIVL8M8gd1swf2r/NXYFCJNyY0lS3KZFrZ3efUdXDZaZlzPpq5HkoxLe8d8jwzVBsIy563EXgXKfOfsJeo=
X-Received: by 2002:a05:6402:2105:b0:5d0:cfad:f71 with SMTP id
 4fb4d7f45d1cf-5d43316510amr4128041a12.32.1733906514580; Wed, 11 Dec 2024
 00:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com> <20241210001802.228725-5-fujita.tomonori@gmail.com>
In-Reply-To: <20241210001802.228725-5-fujita.tomonori@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 11 Dec 2024 16:41:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7BxE7xeA982Pr4PFxgfNpgXs6H4OZ2LydmYAtYjvYNaw@mail.gmail.com>
Message-ID: <CAAhV-H7BxE7xeA982Pr4PFxgfNpgXs6H4OZ2LydmYAtYjvYNaw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for
 BUG/WARN asm code sharing with Rust
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, kernel@xen0n.name, 
	tangyouling@loongson.cn, hejinyang@loongson.cn, yangtiezhu@loongson.cn, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_004158_273712_90744152 
X-CRM114-Status: GOOD (  14.99  )
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

Hi, FUJITA,

On Tue, Dec 10, 2024 at 8:19=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
> Rust to avoid the duplication.
>
> No functional changes.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  arch/loongarch/include/asm/bug.h | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/as=
m/bug.h
> index 08388876ade4..2343c4226595 100644
> --- a/arch/loongarch/include/asm/bug.h
> +++ b/arch/loongarch/include/asm/bug.h
> @@ -21,14 +21,21 @@
>  #ifndef CONFIG_GENERIC_BUG
>  #define __BUG_ENTRY(flags)
>  #else
> -#define __BUG_ENTRY(flags)                                     \
> +
> +#define __BUG_ENTRY_START                                      \
>                 .pushsection __bug_table, "aw";                 \
>                 .align 2;                                       \
>         10000:  .long 10001f - .;                               \
> -               _BUGVERBOSE_LOCATION(__FILE__, __LINE__)        \
> -               .short flags;                                   \
> +
> +#define __BUG_ENTRY_END                                                \
>                 .popsection;                                    \
>         10001:
> +
> +#define __BUG_ENTRY(flags)                                     \
> +               __BUG_ENTRY_START                       \
> +               _BUGVERBOSE_LOCATION(__FILE__, __LINE__)        \
> +               .short flags;                                   \
> +               __BUG_ENTRY_END
>  #endif
>
>  #define ASM_BUG_FLAGS(flags)                                   \
> @@ -55,6 +62,24 @@ do {                                                  =
       \
>         unreachable();                                          \
>  } while (0)
>
> +#ifdef CONFIG_DEBUG_BUGVERBOSE
> +#define __BUG_LOCATION_STRING(file, line)              \
> +               ".long " file "- .;"                    \
> +               ".short " line ";"
> +#else
> +#define __BUG_LOCATION_STRING(_file, _line)
> +#endif
Can we use file and line instead of _file and _line, which is the same
as the CONFIG_DEBUG_BUGVERBOSE case?

> +
> +#define __BUG_ENTRY_STRING(file, line, flags)          \
> +               __stringify(__BUG_ENTRY_START)          \
> +               __BUG_LOCATION_STRING(file, line)       \
> +               ".short " flags ";"                     \
> +               __stringify(__BUG_ENTRY_END)
> +
> +#define ARCH_WARN_ASM(file, line, flags, size)         \
> +       __BUG_ENTRY_STRING(file, line, flags)           \
> +       __stringify(break BRK_BUG) ";"
> +
Can we use the same indentation in this file?

Huacai

>  #define HAVE_ARCH_BUG
>
>  #include <asm-generic/bug.h>
> --
> 2.43.0
>

