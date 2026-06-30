Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC55C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmOeYBnH+pucvx3tPfeJ0XPPeaBlbElUu+Q/ZIKymgM=; b=w2IwLL56jInF3TInMLDixrTDXL
	iasCV3ttChyeDbU1XvDdG/TIYhn5Uz/CzM9IDCJDOjHMRJ0OQPPwTyjixubJgdns7/qhP4uK4Ch+F
	Buf/VY/AESVTHPgqa4WwkltKCqDxLjKjNxbajTJQAjPIXqITsq9VKKJyRMQi6WeUeyY2G3c7xuoxs
	jRcAgqY8Y4N4wSY/6KUChb8Jahe63E6uI/ijlIaxvxWzWCGRWXAGmvORFdDukrhpE6+UEFChCzok6
	A7LgEyiEA2hR7xhwkPDU5Hxe7Uh0NI01vI0getk+V0HjTBT4dqyLyoSkP+twi7sogc63FwSTauWOT
	okhfS/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSGW-0000000G1oE-2Hvg;
	Tue, 30 Jun 2026 06:48:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSGV-0000000G1nx-0WcK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:48:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9711F43ED4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADD01F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782802094;
	bh=GmOeYBnH+pucvx3tPfeJ0XPPeaBlbElUu+Q/ZIKymgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gQbUHPxhEiH2raHpZIN6oBRl9E+1UD3QUNT2Fw4BPeFQ+WDHDN+zFU6PwALsNMK05
	 2WjNlTS+FoMmA2fr/tFjj4GhPIvIc9cC2METu1pc6GLfvit78DT+DLQV/gs1JE0hbt
	 fgb31zwcDdQo31BoonXIRM6Fq/apx7UcxVtwwsvPyNwkqB88Yh/LevTtxWfRLdoZMZ
	 rGXNGVVtUgJi44UaN8zODBgy2aNOsaQGrrILL7pUJP5D7qUzL9mSiRR3za3IxR1s/f
	 4WmaLujPY3xb+FTws1zpYt90YJaXS77LpBoqsRjCJKuubo6YxPtNvlspKmDadlCY35
	 LSZgNK5KCJ5eg==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-475881b9a4bso453611f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqaOoAVomtosn41gJbxBusizOY/8jCGqxzhN7+CfRO3WNv5ciwiHM3/g+9K80J125hz7Nqr+9JgFkIZqGpJ/l95@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv0AjV8Otze+3wlB7TrvVy5DAe9QoO32jfTs/malBXIFQKFktH
	e0ZTqBS4oaS4pfy4w2VPv6FgzCzhcw187nDEOGXvOTrvPoqOtURiyNJjDo/bjdt7pqcNRrP99S5
	SLSJKW2LoxY850zskcTLaIh3ZlAoec5U=
X-Received: by 2002:a5d:5d06:0:b0:475:f100:3600 with SMTP id
 ffacd0b85a97d-475f100372fmr683383f8f.61.1782802093102; Mon, 29 Jun 2026
 23:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260630045531.3939-1-kprateek.nayak@amd.com> <20260630045531.3939-5-kprateek.nayak@amd.com>
In-Reply-To: <20260630045531.3939-5-kprateek.nayak@amd.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 Jun 2026 14:47:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTi3EJj7NrOEZ0GF21VxfyUFujnaGbRmLuYy1_YcPkbDw@mail.gmail.com>
X-Gm-Features: AVVi8Cc9p7eoaCe7f58H6IC6apx1iBlYENd1M3Ce4o3oou9E96K3mWDK4f0IxWE
Message-ID: <CAJF2gTTi3EJj7NrOEZ0GF21VxfyUFujnaGbRmLuYy1_YcPkbDw@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] riscv/runtime-const: Replace open-coded
 placeholder with RUNTIME_MAGIC
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Jisheng Zhang <jszhang@kernel.org>
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

On Tue, Jun 30, 2026 at 12:57=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
>
> Define the placeholder used for lui + addi[w] patching sequence as
> RUNTIME_MAGIC and use that instead of open coding the constants in the
> inline assembly.
>
> No functional changes intended.
>
> Suggested-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> changelog v4..v5:
>
> o Collected tags from Charlie (Thanks a ton!)
> ---
>  arch/riscv/include/asm/runtime-const.h | 38 ++++++++++++++------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/=
asm/runtime-const.h
> index 900db0a103d05..1ce02605d2e43 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -15,21 +15,23 @@
>
>  #include <linux/uaccess.h>
>
> +#define RUNTIME_MAGIC __ASM_STR(0x89ABCDEF)
> +
>  #ifdef CONFIG_32BIT
> -#define runtime_const_ptr(sym)                                 \
> -({                                                             \
> -       typeof(sym) __ret;                                      \
> -       asm_inline(".option push\n\t"                           \
> -               ".option norvc\n\t"                             \
> -               "1:\t"                                          \
> -               "lui    %[__ret],0x89abd\n\t"                   \
> -               "addi   %[__ret],%[__ret],-0x211\n\t"           \
> -               ".option pop\n\t"                               \
> -               ".pushsection runtime_ptr_" #sym ",\"a\"\n\t"   \
> -               ".long 1b - .\n\t"                              \
> -               ".popsection"                                   \
> -               : [__ret] "=3Dr" (__ret));                        \
> -       __ret;                                                  \
> +#define runtime_const_ptr(sym)                                         \
> +({                                                                     \
> +       typeof(sym) __ret;                                              \
> +       asm_inline(".option push\n\t"                                   \
> +               ".option norvc\n\t"                                     \
> +               "1:\t"                                                  \
> +               "lui    %[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"          \
> +               "addi   %[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t" \
> +               ".option pop\n\t"                                       \
> +               ".pushsection runtime_ptr_" #sym ",\"a\"\n\t"           \
> +               ".long 1b - .\n\t"                                      \
> +               ".popsection"                                           \
> +               : [__ret] "=3Dr" (__ret));                               =
 \
> +       __ret;                                                          \
>  })
>  #else
>  /*
> @@ -46,10 +48,10 @@
>         ".option push\n\t"                                      \
>         ".option norvc\n\t"                                     \
>         "1:\t"                                                  \
> -       "lui    %[__ret],0x89abd\n\t"                           \
> -       "lui    %[__tmp],0x1234\n\t"                            \
> -       "addiw  %[__ret],%[__ret],-0x211\n\t"                   \
> -       "addiw  %[__tmp],%[__tmp],0x567\n\t"                    \
> +       "lui    %[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"          \
> +       "lui    %[__tmp], %%hi(" RUNTIME_MAGIC ")\n\t"          \
> +       "addiw  %[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t" \
> +       "addiw  %[__tmp],%[__tmp], %%lo(" RUNTIME_MAGIC ")\n\t" \
LGTM!

Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren

