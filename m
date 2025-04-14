Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F69BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 07:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A952/haBhzu1Eh0V7dVLXe3Dv2m1JQRtOevmR/ub3NA=; b=ufPbJ2zU8t0ASfGXu5EaYr+qv2
	07vKG1EFzOIPzcKPDITaWYcaDhkfYkxNojsv6JpHAW9F2zTJbBs3a+3km2JoG3EVHiS51/H8za4jo
	5vZAu0Sx0Xyu7Az7hSzvO8SokvjPkHP0SZI0AIN1eKE+xKssotfRhfO3wc+HWusF3pawz2Mg+N12J
	eTObr5x49zFXT8K6nEQYXi9VM46itkpAo8qW2imWO4xYjrrJPaIMQ3f3vB2tctYx9sw2FTvrKxEt5
	k/ISZa6b6xz4r09ndyE3ujJK423dPR5USNkNP0TXqy14UBl6/Ar0WV4aEw7xGRkDfK7N36zj2PWw7
	zPRu6kqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4DtN-00000000ss9-3CwK;
	Mon, 14 Apr 2025 07:06:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4DrW-00000000sXR-1zBt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 07:04:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91C4C60007
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915C1C4CEE2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744614249;
	bh=icC6pKxwkk63ydYys6oK1ioyyV4qcPSvCmG0NKiQefg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EOKguFF2VxI82DMzK1Hz/A36DdD6tyL16iCFnyNocB04XiHAEx2Usjf/l6jDguOkg
	 x3x3GRKL3w5pPVXZXuWw8qka//Ftfz2gh2c3JWvNBxmk2NWEGeFWbV1va2ur/nm60z
	 GY7tun/dRfez4UgI3Y+aeNdjEkOUTPStzp/a77Huyjwo9YDobX5TXngfK1JnmNckvv
	 Pxe1thYVFZ8sjvAerBTj+XrQO6k9DRsERd4IDnLmszh5hTBhX9R1hMavHavnnO/RBa
	 8vBY9W5SWdJavz0DzdjfjrDYaFhxI5GAVDy48t8XDSSp72bBnRzw+3Sv8wRiahxeGv
	 Hqppo3tkdiUcg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b0d638e86so4764070e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 00:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEFi8mChlpPtUW7BwHQnaT4KYzNgWi4dWAStM5VARkb+MnB8Tfx1J1lzQpgA65RmRFEu3BaoIAmEiVhJmQde2f@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6jCdxjD8MHMuYWMIw8bkLx970l1MxEHXzuXfIJHpj6lvKRm2t
	+ckvkZg6oxCADpNbxX/4qZ3licpxnVyXLW0t4sr3pm0jeyasFqj14Owl0UG5R8c0tVzDUfV+1FQ
	ggg1RmfPXVwfrGc0971L8cllZ1BA=
X-Google-Smtp-Source: AGHT+IEoYXlejAjxOwys1OLaOhDBK3py6wT/Y0QJYW6cfE2lr6fzReeEdjo+qSenumfyEoIhuh4zXG1xEt+R7ijOO8Y=
X-Received: by 2002:a05:6512:ba7:b0:546:2f7a:38c4 with SMTP id
 2adb3069b0e04-54d45292cd1mr2746051e87.13.1744614247886; Mon, 14 Apr 2025
 00:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250413154350.10819-1-ebiggers@kernel.org>
In-Reply-To: <20250413154350.10819-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Apr 2025 09:03:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGhG6PKVzqmVT6qrQ+GPkk_oxXE5d-ut0swi49V2=o-wQ@mail.gmail.com>
X-Gm-Features: ATxdqUEnYfS7U-gc63ktCKYv5CbPjrmaDdsHdKGekiLY6qQSH14mpXQi1o5UxKs
Message-ID: <CAMj1kXGhG6PKVzqmVT6qrQ+GPkk_oxXE5d-ut0swi49V2=o-wQ@mail.gmail.com>
Subject: Re: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 13 Apr 2025 at 17:44, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> All of the CRC library's CPU feature static_keys are initialized by
> initcalls and never change afterwards, so there's no need for them to be
> in the regular .data section.  Put them in .data..ro_after_init instead.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>
> I'm planning to take this via the crc tree.
>
>  arch/arm/lib/crc-t10dif-glue.c       | 4 ++--
>  arch/arm/lib/crc32-glue.c            | 4 ++--
>  arch/arm64/lib/crc-t10dif-glue.c     | 4 ++--
>  arch/loongarch/lib/crc32-loongarch.c | 2 +-
>  arch/mips/lib/crc32-mips.c           | 2 +-
>  arch/powerpc/lib/crc-t10dif-glue.c   | 2 +-
>  arch/powerpc/lib/crc32-glue.c        | 2 +-
>  arch/s390/lib/crc32-glue.c           | 2 +-
>  arch/sparc/lib/crc32_glue.c          | 2 +-
>  arch/x86/lib/crc-t10dif-glue.c       | 2 +-
>  arch/x86/lib/crc32-glue.c            | 4 ++--
>  arch/x86/lib/crc64-glue.c            | 2 +-
>  12 files changed, 16 insertions(+), 16 deletions(-)
>


Acked-by: Ard Biesheuvel <ardb@kernel.org>



> diff --git a/arch/arm/lib/crc-t10dif-glue.c b/arch/arm/lib/crc-t10dif-glue.c
> index 6efad3d78284..382437094bdd 100644
> --- a/arch/arm/lib/crc-t10dif-glue.c
> +++ b/arch/arm/lib/crc-t10dif-glue.c
> @@ -14,12 +14,12 @@
>  #include <crypto/internal/simd.h>
>
>  #include <asm/neon.h>
>  #include <asm/simd.h>
>
> -static DEFINE_STATIC_KEY_FALSE(have_neon);
> -static DEFINE_STATIC_KEY_FALSE(have_pmull);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
>
>  #define CRC_T10DIF_PMULL_CHUNK_SIZE    16U
>
>  asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
>  asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
> diff --git a/arch/arm/lib/crc32-glue.c b/arch/arm/lib/crc32-glue.c
> index 4340351dbde8..7ef7db9c0de7 100644
> --- a/arch/arm/lib/crc32-glue.c
> +++ b/arch/arm/lib/crc32-glue.c
> @@ -16,12 +16,12 @@
>
>  #include <asm/hwcap.h>
>  #include <asm/neon.h>
>  #include <asm/simd.h>
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32);
> -static DEFINE_STATIC_KEY_FALSE(have_pmull);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
>
>  #define PMULL_MIN_LEN  64      /* min size of buffer for pmull functions */
>
>  asmlinkage u32 crc32_pmull_le(const u8 buf[], u32 len, u32 init_crc);
>  asmlinkage u32 crc32_armv8_le(u32 init_crc, const u8 buf[], u32 len);
> diff --git a/arch/arm64/lib/crc-t10dif-glue.c b/arch/arm64/lib/crc-t10dif-glue.c
> index bacd18f23168..99d0b5668a28 100644
> --- a/arch/arm64/lib/crc-t10dif-glue.c
> +++ b/arch/arm64/lib/crc-t10dif-glue.c
> @@ -15,12 +15,12 @@
>  #include <crypto/internal/simd.h>
>
>  #include <asm/neon.h>
>  #include <asm/simd.h>
>
> -static DEFINE_STATIC_KEY_FALSE(have_asimd);
> -static DEFINE_STATIC_KEY_FALSE(have_pmull);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_asimd);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
>
>  #define CRC_T10DIF_PMULL_CHUNK_SIZE    16U
>
>  asmlinkage void crc_t10dif_pmull_p8(u16 init_crc, const u8 *buf, size_t len,
>                                     u8 out[16]);
> diff --git a/arch/loongarch/lib/crc32-loongarch.c b/arch/loongarch/lib/crc32-loongarch.c
> index c44ee4f32557..8e6d1f517e73 100644
> --- a/arch/loongarch/lib/crc32-loongarch.c
> +++ b/arch/loongarch/lib/crc32-loongarch.c
> @@ -24,11 +24,11 @@ do {                                                        \
>  } while (0)
>
>  #define CRC32(crc, value, size)                _CRC32(crc, value, size, crc)
>  #define CRC32C(crc, value, size)       _CRC32(crc, value, size, crcc)
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
>
>  u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
>  {
>         if (!static_branch_likely(&have_crc32))
>                 return crc32_le_base(crc, p, len);
> diff --git a/arch/mips/lib/crc32-mips.c b/arch/mips/lib/crc32-mips.c
> index 676a4b3e290b..84df361e7181 100644
> --- a/arch/mips/lib/crc32-mips.c
> +++ b/arch/mips/lib/crc32-mips.c
> @@ -60,11 +60,11 @@ do {                                                        \
>         _CRC32(crc, value, size, crc32)
>
>  #define CRC32C(crc, value, size) \
>         _CRC32(crc, value, size, crc32c)
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
>
>  u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
>  {
>         if (!static_branch_likely(&have_crc32))
>                 return crc32_le_base(crc, p, len);
> diff --git a/arch/powerpc/lib/crc-t10dif-glue.c b/arch/powerpc/lib/crc-t10dif-glue.c
> index f411b0120cc5..ddd5c4088f50 100644
> --- a/arch/powerpc/lib/crc-t10dif-glue.c
> +++ b/arch/powerpc/lib/crc-t10dif-glue.c
> @@ -19,11 +19,11 @@
>  #define VMX_ALIGN              16
>  #define VMX_ALIGN_MASK         (VMX_ALIGN-1)
>
>  #define VECTOR_BREAKPOINT      64
>
> -static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
>
>  u32 __crct10dif_vpmsum(u32 crc, unsigned char const *p, size_t len);
>
>  u16 crc_t10dif_arch(u16 crci, const u8 *p, size_t len)
>  {
> diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32-glue.c
> index dbd10f339183..42f2dd3c85dd 100644
> --- a/arch/powerpc/lib/crc32-glue.c
> +++ b/arch/powerpc/lib/crc32-glue.c
> @@ -11,11 +11,11 @@
>  #define VMX_ALIGN              16
>  #define VMX_ALIGN_MASK         (VMX_ALIGN-1)
>
>  #define VECTOR_BREAKPOINT      512
>
> -static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
>
>  u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
>
>  u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
>  {
> diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32-glue.c
> index 124214a27340..8f20a8e595c3 100644
> --- a/arch/s390/lib/crc32-glue.c
> +++ b/arch/s390/lib/crc32-glue.c
> @@ -16,11 +16,11 @@
>
>  #define VX_MIN_LEN             64
>  #define VX_ALIGNMENT           16L
>  #define VX_ALIGN_MASK          (VX_ALIGNMENT - 1)
>
> -static DEFINE_STATIC_KEY_FALSE(have_vxrs);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vxrs);
>
>  /*
>   * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
>   *
>   * Creates a function to perform a particular CRC-32 computation. Depending
> diff --git a/arch/sparc/lib/crc32_glue.c b/arch/sparc/lib/crc32_glue.c
> index a70752c729cf..d34e7cc7e1a1 100644
> --- a/arch/sparc/lib/crc32_glue.c
> +++ b/arch/sparc/lib/crc32_glue.c
> @@ -15,11 +15,11 @@
>  #include <linux/kernel.h>
>  #include <linux/crc32.h>
>  #include <asm/pstate.h>
>  #include <asm/elf.h>
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
>
>  u32 crc32_le_arch(u32 crc, const u8 *data, size_t len)
>  {
>         return crc32_le_base(crc, data, len);
>  }
> diff --git a/arch/x86/lib/crc-t10dif-glue.c b/arch/x86/lib/crc-t10dif-glue.c
> index f89c335cde3c..d073b3678edc 100644
> --- a/arch/x86/lib/crc-t10dif-glue.c
> +++ b/arch/x86/lib/crc-t10dif-glue.c
> @@ -7,11 +7,11 @@
>
>  #include <linux/crc-t10dif.h>
>  #include <linux/module.h>
>  #include "crc-pclmul-template.h"
>
> -static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
>
>  DECLARE_CRC_PCLMUL_FUNCS(crc16_msb, u16);
>
>  u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
>  {
> diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32-glue.c
> index e3f93b17ac3f..e6a6285cfca8 100644
> --- a/arch/x86/lib/crc32-glue.c
> +++ b/arch/x86/lib/crc32-glue.c
> @@ -9,12 +9,12 @@
>
>  #include <linux/crc32.h>
>  #include <linux/module.h>
>  #include "crc-pclmul-template.h"
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32);
> -static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
>
>  DECLARE_CRC_PCLMUL_FUNCS(crc32_lsb, u32);
>
>  u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
>  {
> diff --git a/arch/x86/lib/crc64-glue.c b/arch/x86/lib/crc64-glue.c
> index b0e1b719ecbf..1214ee726c16 100644
> --- a/arch/x86/lib/crc64-glue.c
> +++ b/arch/x86/lib/crc64-glue.c
> @@ -7,11 +7,11 @@
>
>  #include <linux/crc64.h>
>  #include <linux/module.h>
>  #include "crc-pclmul-template.h"
>
> -static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
>
>  DECLARE_CRC_PCLMUL_FUNCS(crc64_msb, u64);
>  DECLARE_CRC_PCLMUL_FUNCS(crc64_lsb, u64);
>
>  u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)
>
> base-commit: e8c24520a1338f938774268a9bafb679ace93b76
> --
> 2.49.0
>

