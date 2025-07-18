Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C4EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04XZ3n49dipBeBmJztAm4W/QiiUkoj0gNbWiC3AXtvE=; b=qV3z7gV4vVVY1SQlkIi8fIWns5
	5ztpnNH/gDCYCALSa7PKEUIib+9VDcVE6r7YV9mk/98SrK6ViwUMARKRmWq+rOjOI4HdEf6oRc2yz
	MaQnUQHAGXVUmQKYhx03ml/sCXcQbQLsiihQA+WKF8zJ+5yV+h3T1u/ReCUIyLmdevKvN16P+4pEB
	Iy6EmNF4iXPc8oi3jUMdmRjBBi1IQUaEao/RYrhN5VFMHVuuzTKZ1zvX2zTn6syhbdofHhcNP3X2h
	sM+aZM/gj49KPQBk5+ApSNAHN/XfayPJmf+JqRMevKV59HdpHw4OkhoAy19WhT5vgw3vo9ls9NtTR
	yCkx2k/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucha4-0000000CDKc-2vBC;
	Fri, 18 Jul 2025 09:40:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchEP-0000000C9fU-1FMF;
	Fri, 18 Jul 2025 09:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A821601DB;
	Fri, 18 Jul 2025 09:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23016C4CEF8;
	Fri, 18 Jul 2025 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752830296;
	bh=iN0MjV8lG6vlPY6QKWEDWqXP3y58juMGr+peNv9I/+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=upUCLIdrbbvEbKjUsZgTdUEGyRbXXPVKgUMJXI8oVEu7IuCo+NlAr8pZ3hP/3OpCS
	 z+m8WoLkMvYdx42mseDFgent82TIUAOPaXDuO0MHrSBPWaortApspXcggf+7lhNmY8
	 tOaGg0j7eaXiZqMy8OhhL3BAvuI4qqptGCOW5qdmQyljlx4c3DuNukqLAdC4airAsq
	 nJKi0Be3SrrR2xHh9RGmjhMqPl6sRDW75QEF/7Lu21+PwIinNh5ZPzzmyUHWJMe6cp
	 dzghcLYsnfaa3tVtbk0VeArOxbSMW6EX7TzfWbBD0ifZlVbF7q2+xGG6ugEJd7zFXx
	 5DD1NmgbOVSgg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-611f74c1837so3434961a12.3;
        Fri, 18 Jul 2025 02:18:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrxZXrr/KRktGw3Em0zBTEnraFPRtGWiqkV0XW6Vckh5Q+k02PEN9qg98ydWOa7nU05/ImbvBKRCx2wBo=@lists.infradead.org, AJvYcCXHgREp5xzIsIzupY6JW8QwPUgnMM3ZhwCFDX8R9Hoy+gJFE4CNuS33bcclzQLsT9VZunftRCyVZQfnyC2455fk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc1radSji7Y6itCKrWhpnXl6WYdKK1sarDEkzrQwbe3W1yviTg
	wEAD+Tq17sKAlgwus9VavPtvV1zm/mShw4vnXTS2YOLa37W0uMicEFgsyfP5Sfp+ubcwlD+p0Cd
	6ez42qM94uBCBXYfHD4oJ89+m4ENgDGw=
X-Google-Smtp-Source: AGHT+IH+CR6kK9khsoUi4kQxVa0vWTn3qqM4Z4G6WAw+0g0YyuRvDHP3ooIXGfMWBaXJUiPtMEtFUptkHeWtXN/zID4=
X-Received: by 2002:a05:6402:26d5:b0:60c:6a48:8047 with SMTP id
 4fb4d7f45d1cf-612d456bb15mr803449a12.11.1752830294637; Fri, 18 Jul 2025
 02:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250717231756.make.423-kees@kernel.org> <20250717232519.2984886-9-kees@kernel.org>
In-Reply-To: <20250717232519.2984886-9-kees@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 18 Jul 2025 17:18:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4RyZQTak5AgYj6TaXHyEefgw+wmXs9Gi8jUJWrUV5HQw@mail.gmail.com>
X-Gm-Features: Ac12FXyrA9A9-rpLV3MB79YH2kXhj6f2Fk9F6HAlk-0emUPTHthuyPP3lR9zQXg
Message-ID: <CAAhV-H4RyZQTak5AgYj6TaXHyEefgw+wmXs9Gi8jUJWrUV5HQw@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] mips: Handle KCOV __init vs inline mismatch
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Fri, Jul 18, 2025 at 7:26=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> When KCOV is enabled all functions get instrumented, unless
> the __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we
> have to handle differences in how GCC's inline optimizations get
> resolved. For mips this requires adding the __init annotation on
> init_mips_clocksource().
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: <linux-mips@vger.kernel.org>
> ---
>  arch/mips/include/asm/time.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.h
> index e855a3611d92..5e7193b759f3 100644
> --- a/arch/mips/include/asm/time.h
> +++ b/arch/mips/include/asm/time.h
> @@ -55,7 +55,7 @@ static inline int mips_clockevent_init(void)
>   */
>  extern int init_r4k_clocksource(void);
>
> -static inline int init_mips_clocksource(void)
> +static inline __init int init_mips_clocksource(void)
>  {
>  #ifdef CONFIG_CSRC_R4K
>         return init_r4k_clocksource();
> --
> 2.34.1
>
>

