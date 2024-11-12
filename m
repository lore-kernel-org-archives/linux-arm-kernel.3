Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E729D41D44
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spUKRV7OxoGH84s6UjjK27+hvVkNjTU0eC0jz2ca18g=; b=QrxZ1HziC52ft4be+bIgCiHgXI
	IyC720XVysQBcSeR1I2DJZg4D1IL8B/ddjChG1dDHy74tYcvGXlpeXYqsqB12ZnIAlMqhqSzTqfGb
	li8vqBVj24hzIyiXNeIHr3zKKat7FyHyM3y+R2qG5HIsIrqELbH3AmYByJprU0GmhCYlOal+4uR/u
	dEcU4CAGcYOoCG9tXzPm2cyXL933Dc0p7rDA7TN2Knu6or9WKZ1AuDIQcebMaUPT6CQoqQxrInz0n
	FAJsuN2I3+xy5RVkg5a79ggJgEapuAPPF8Naklb+z1sAkuS3IJD3mYn0yV4ST6B8Px5FCQSZlzAp0
	3IrLnUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfX1-00000001qTL-3Yyv;
	Tue, 12 Nov 2024 01:17:23 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfVF-00000001qOn-245D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 01:15:34 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2fb58980711so42666081fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 17:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731374130; x=1731978930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spUKRV7OxoGH84s6UjjK27+hvVkNjTU0eC0jz2ca18g=;
        b=V6Ap0Q26+j060X6WB0l+avRa1gPUiHBZGUrLrDw6X5I3p1FaiZIgPzGbXviykP/kiY
         JH/q5Z7Gb/vpIYcSSPXWcuYixTFl1eIR73ujbVEmWrVKC/uLVMdO6bb9qP4h31sT/zua
         WshJuWAZyWB5Mqknl0SPRt5Mm7vvce6w8V1/6oEB1qCN1THzEB4/SxnIaij5NNvpgy0L
         0ptAZnr/Yq/QdPPAemDSiIxfHTIkSp8Ow1WmopAHh3ghz6tp2trmOfTiRnk1yG/uDeOk
         3nALoK65Pn55e6Cy+XPIo3inUknz1yCc0M/bDw58CX689CtYd08q+0D/+2OFK2qAAKVE
         VYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731374130; x=1731978930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spUKRV7OxoGH84s6UjjK27+hvVkNjTU0eC0jz2ca18g=;
        b=UaTdzs05p3jZauTsEfrUdPAM6A2aaxQxCfemMDL8qkOm6QaHw4/TJ3zBnmLvUIGAd6
         rUhtA8cty+5cTIK5jTrtUyzRg6xwdKjlb1DKjN0cmEVTXarZ0rBSRS+dMH8Oy1bC2cIQ
         ++oBrkacKd3Xizycz9w3r2XPKY+oriX32eJBztHUEoeHA1hjtDIrQIMmTMltFd3MWQnx
         h3hmosKb2Qoz352LWzHWUHhwRAF8uH9U+PWkXNJPEDs8EJALdMg3s01JT0d1epk2RO20
         OxM5GyNZuCVhk7Awbo6iS/MyXpfYUjPGYgVDgUxd/EekV1kLdzmAs93biQehq1M/mi3b
         +p1w==
X-Gm-Message-State: AOJu0Yz0AW10hCvpBqeQ7/SlnJ/SYRqmJBQSqKs8mbi8Tfpr6NanHLMi
	uF72WikKdTfwp9WybIZvhgCNCkX68BcTKd5TsWBV30cwbQLMAIkIMcY9Ov7sXxwB92u7GWs3tsL
	i8OrW6z3dkNErkIBywngIhtAVpFzTrBzHRuGWAQ==
X-Google-Smtp-Source: AGHT+IFhKWTwwBPu5jX7u89u+dUKj0C5//5o/QMl+RXh0GIkjzOyjBHHfqpvI+xl/jvzNzXbfa5GdbcAObQdme0kFAs=
X-Received: by 2002:a2e:a813:0:b0:2fe:fec7:8adf with SMTP id
 38308e7fff4ca-2ff2029fed5mr65047841fa.38.1731374130317; Mon, 11 Nov 2024
 17:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20241111233817.2f824c19@foxbook>
In-Reply-To: <20241111233817.2f824c19@foxbook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Nov 2024 02:15:19 +0100
Message-ID: <CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_171533_577404_B3CBD261 
X-CRM114-Status: GOOD (  22.67  )
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

Hi Michal,

On Mon, Nov 11, 2024 at 11:38=E2=80=AFPM Micha=C5=82 Pecio <michal.pecio@gm=
ail.com> wrote:

> I installed v6.11.5 on Tegra K1 (Cortex-A15) with tegra_defconfing +
> CONFIG_ARM_LPAE + a few drivers + minor patches for driver issues.
>
> gdb segfaults on startup, strace shows this:
>
> openat(AT_FDCWD, "/usr/lib/guile/3.0/ccache/ice-9/psyntax-pp.go", O_RDONL=
Y|O_LARGEFILE|O_CLOEXEC) =3D 11
> _llseek(11, 0, [477309], SEEK_END)      =3D 0
> mmap2(NULL, 477309, PROT_READ, MAP_PRIVATE, 11, 0) =3D 0xb378a000
> close(11)                               =3D 0
> mprotect(0xb37da000, 43512, PROT_READ|PROT_WRITE) =3D 0
> mmap2(NULL, 262144, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONY=
MOUS, -1, 0) =3D 0xb374a000
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> futex(0xb6f0bb14, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR, si_addr=3D0x4} --=
-
>
> guile is apparently a scripting language with JIT compiler, disabling
> JIT resolves the crash, so cacheflush is a big suspect at this point.
>
> No apparent valid reason for those failures and no recent changes to
> cacheflush handling that I see, so I searched for commits touching LPAE
> (perhaps the most uncommon part of my system) and I quickly found the
> ARM_PAN feature, which claims to monkey with page tables. Hmm...
>
> Disabled ARM_PAN, cacheflush returns 0 now and gdb crashes no more.
>
> So I guess it looks like there is a problem with this feature, perhaps
> a missing "permit user accesss" somewhere?

We are trying to locate the issue, which I think is the same as this
but not sure:
https://bugzilla.kernel.org/show_bug.cgi?id=3D219247

I have been trying to replicate it on a Chromebook but didn't get so far
yet because the installation is pretty idiomatic :/ also there is only appe=
ars
in a single Qt program and not as predictable as here.

But. It appears the code is issuing cacheflush() which I guess ends
up in arm_syscall() here:

        case NR(cacheflush):
                return do_cache_op(regs->ARM_r0, regs->ARM_r1, regs->ARM_r2=
);

To here:

static inline int
do_cache_op(unsigned long start, unsigned long end, int flags)
{
        if (end < start || flags)
                return -EINVAL;

        if (!access_ok((void __user *)start, end - start))
                return -EFAULT;

        return __do_cache_op(start, end);
}

Here userspace access should be fine because we have entered a
syscall from userspace. I tried to emulate the situation with this
program:

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

#define NR_cacheflush 0xf0002

/* libgcc */
extern void __clear_cache(void *, void *);

int main (int argc, char **argv) {
  void *addr;
  int ret;

  printf("Test()\n");
  addr =3D mmap(NULL, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC,
              MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
  if (addr =3D=3D MAP_FAILED) {
    printf("mmap() failed\n");
    exit(1);
  }

The libgcc version is what guile uses.
But it all just works fine for me.

I added prints in the cacheflush trap:

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 480e307501bb..400650519bd1 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -592,11 +592,14 @@ __do_cache_op(unsigned long start, unsigned long end)
 static inline int
 do_cache_op(unsigned long start, unsigned long end, int flags)
 {
+       pr_info("%s(%08lx-%08lx)\n", __func__, start, end);
        if (end < start || flags)
                return -EINVAL;

-       if (!access_ok((void __user *)start, end - start))
+       if (!access_ok((void __user *)start, end - start)) {
+               pr_err("ACCESS NOT OK\n");
                return -EFAULT;
+       }

        return __do_cache_op(start, end);
 }

And they all work fine with the test program.
This is on v6.12-rc1.

Does this test program work also on your set-up?

Yours,
Linus Walleij

