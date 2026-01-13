Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6009CF45DD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 01:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0/waOmhHsYmDL/6HVvoGGIYHZETE02HxsKl6ODkF3o=; b=EHPqbnJD9coPi3ws2PKtqO7B7u
	UuO/HVWwA9nJBwezOSaqZEaP2HQIglCnQKcZq9kwhCYjyckArtc0AvMtWkQefHBEWfKyAGHufIJ5R
	+1hf2FumWxCeRlD/w5W8sO7u6y46bJhG8ZUG7k1UekyNrl0rTm1XdOlaFLv/eXGCCm+DgN9vithXU
	xSiHMlSQHrirVQfZlMP78C0ZDYHcL+tt39Hh5KfcOqnQ40ZRgVdex9FV9vYJbvPHwPaFenkD1Dvjo
	Jqp2lL5tahPNQA77iH2jqZ6802rwK0xe93WMfU+Mpfc6CEdoAFpSLxCfRtzyzmjU6uigUsj9fSc1y
	iNbJKE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfT64-00000006Nm2-1TQk;
	Tue, 13 Jan 2026 01:21:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfT61-00000006Nlb-2fey
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 01:21:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42fbc3056afso4023908f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 17:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768267279; x=1768872079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0/waOmhHsYmDL/6HVvoGGIYHZETE02HxsKl6ODkF3o=;
        b=Aj3hfttGYZZwuAcaHjzHGlMfnQWOUoRdxj4a973vYyy0NtmG+bWLOro2U9Adq9BAcp
         bSBs5N0mDQTWR8Jj2mvt9FPHk8SC8dlCbRsiAlGUlcu9WKmyv+F1KJ0r1L660HXKoh/5
         Pzmpt0ephXc1o7D3R4NpwGJ8PeEiXdon8+kkvCOjiHsltQ9xKPa0MlueOs5rvfrVuTLF
         DQ/486yrj5+CRIFLGTS6sAlqRjrXDDFOLN4+aJpjW+D/SZWDx/wY+WnOZNpRP2Kahm+t
         9fxsibSWgi8NTcO/PnXFeF2Jifi1NItXCj2QQvTVEUf/yBhGdbMS7/+ZU8dzAm8jMxJO
         1H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267279; x=1768872079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0/waOmhHsYmDL/6HVvoGGIYHZETE02HxsKl6ODkF3o=;
        b=U+0EoumiSyg4/g107wDA+uLh3L7vqdUrKlcBHe8dvGEY0QS33aHFxHQ/YD4hvzrAjb
         AGvx3y/I81oU3ZcUDkjiyGJ0VV/0msLFeV2S8vqojo0kaYvAzY0IHZc+QTvo8KkqlOQm
         Pf1nhmomRs6Cj5xLqRvbd2kw0yLvz1COX08kF+QGnQol6IHlQGQ4CkJq+cM12ZdI5blq
         1k7S0qd38lQqzljqWA5r8CRs01+jL0Lnlr9tjioPZORIekfHKtduMuJrp+LFDvc/hBDe
         5cg+2qT63iUfIK9UaOE7+Up+cZFXNY7ZPin8TXkOf3uOVbeISpSFzJvV0urcdJFIIJ46
         yOug==
X-Forwarded-Encrypted: i=1; AJvYcCXI2sy4sbGSjc6fIM2UkNCbc+4+Jy1rcsUgSckecPNxfdpETGjNBpyHM3qqFSYpYwrqZWw1wVoNoxQ/lh34sG9t@lists.infradead.org
X-Gm-Message-State: AOJu0YzFFcEhB5eEY9mbjNLNwPcUtO+K1WFySYu93zSf0p2UdNGJZzlb
	dRj0NEVWYPWBlBvvuXfGGf4kFyj7qHj4wQcgKWI25+mRI6xsybBqxU2Yi06AtpDQCOFOWHaX8Kn
	98Ieff3mQe8R4Oh/VqqNarvSCbXMxYWo=
X-Gm-Gg: AY/fxX7rsx6VozlwVgECU6OUvnbTvWvHfzUHlJvTy9IN8O8BTkNBBw26NmWmlD9v5Jv
	7H0k4cBh7KrAZPJKd0gXkl02iLc0/UKRq6Dfozqcv84EMWiZLP5FcJ/AguLrPsjlk6wFzQqjXm6
	Zbgjpt50/tozPUYVM14bttqEuTHWqDHbvY4OcGfHGg0AHdP33dMeZdCgRXc9Haunum/jr6mQHgb
	l1YBEXUI3g/m3LiWjGHuLBIS/cTFnnqpZN33kTsfsJGTU+6OOETx8Q0D9PvVDG+1eL2HLMP5/Yd
	t4eA4r80IyrF6ab2kgdACIsEJ+Apag==
X-Google-Smtp-Source: AGHT+IHsdWkVlnLMRuujPEk8fgbaYFpMbhMzj3K/n8eLf4/IDQ0QT15xIzF9mO5xWMxwZF/FWLtnbiYQFvFN5vQd7J4=
X-Received: by 2002:a05:6000:26ca:b0:431:808:2d60 with SMTP id
 ffacd0b85a97d-432c3629aebmr24541037f8f.12.1768267278856; Mon, 12 Jan 2026
 17:21:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768233085.git.m.wieczorretman@pm.me> <be136bf8d1a6ae9ef98686c3ba0b6a4e2ea2e780.1768233085.git.m.wieczorretman@pm.me>
In-Reply-To: <be136bf8d1a6ae9ef98686c3ba0b6a4e2ea2e780.1768233085.git.m.wieczorretman@pm.me>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 13 Jan 2026 02:21:07 +0100
X-Gm-Features: AZwV_QjCoIAxOzPZYukp_TYwCHn5QSJvAWN-Df89pT1TOcJPzRbvNO1VkRAILAE
Message-ID: <CA+fCnZfQmhSyF9vh3RzreY7zrQ4GbQOp5NbA0bXLHUMG6p28QQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] kasan: arm64: x86: Make special tags arch specific
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_172121_725640_74165334 
X-CRM114-Status: GOOD (  39.79  )
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

On Mon, Jan 12, 2026 at 6:27=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Samuel Holland <samuel.holland@sifive.com>
>
> KASAN's tag-based mode defines multiple special tag values. They're
> reserved for:
> - Native kernel value. On arm64 it's 0xFF and it causes an early return
>   in the tag checking function.
> - Invalid value. 0xFE marks an area as freed / unallocated. It's also
>   the value that is used to initialize regions of shadow memory.
> - Min and max values. 0xFD is the highest value that can be randomly
>   generated for a new tag. 0 is the minimal value with the exception of
>   arm64's hardware mode where it is equal to 0xF0.
>
> Metadata macro is also defined:
> - Tag width equal to 8.
>
> Tag-based mode on x86 is going to use 4 bit wide tags so all the above
> values need to be changed accordingly.
>
> Make tag width and native kernel tag arch specific for x86 and arm64.
>
> Base the invalid tag value and the max value on the native kernel tag
> since they follow the same pattern on both mentioned architectures.
>
> Also generalize KASAN_SHADOW_INIT and 0xff used in various
> page_kasan_tag* helpers.
>
> Give KASAN_TAG_MIN the default value of zero, and move the special value
> for hw_tags arm64 to its arch specific kasan-tags.h.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> Co-developed-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Acked-by: Will Deacon <will@kernel.org> (for the arm part)
> ---
> Changelog v7:
> - Reorder defines of arm64 tag width to prevent redefinition warnings.
> - Remove KASAN_TAG_MASK so it's only defined in mmzone.h (Andrey
>   Konovalov)
> - Merge the 'support tag widths less than 8 bits' with this patch since
>   they do similar things and overwrite each other. (Alexander)
>
> Changelog v6:
> - Add hardware tags KASAN_TAG_WIDTH value to the arm64 arch file.
> - Keep KASAN_TAG_MASK in the mmzone.h.
> - Remove ifndef from KASAN_SHADOW_INIT.
>
> Changelog v5:
> - Move KASAN_TAG_MIN to the arm64 kasan-tags.h for the hardware KASAN
>   mode case.
>
> Changelog v4:
> - Move KASAN_TAG_MASK to kasan-tags.h.
>
> Changelog v2:
> - Remove risc-v from the patch.
>
>  MAINTAINERS                         |  2 +-
>  arch/arm64/include/asm/kasan-tags.h | 14 ++++++++++++++
>  arch/arm64/include/asm/kasan.h      |  2 --
>  arch/arm64/include/asm/uaccess.h    |  1 +
>  arch/x86/include/asm/kasan-tags.h   |  9 +++++++++
>  include/linux/kasan-tags.h          | 19 ++++++++++++++-----
>  include/linux/kasan.h               |  3 +--
>  include/linux/mm.h                  |  6 +++---
>  include/linux/page-flags-layout.h   |  9 +--------
>  9 files changed, 44 insertions(+), 21 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kasan-tags.h
>  create mode 100644 arch/x86/include/asm/kasan-tags.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d044a58cbfe..84fdf497a97c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13581,7 +13581,7 @@ L:      kasan-dev@googlegroups.com
>  S:     Maintained
>  B:     https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&pr=
oduct=3DMemory%20Management
>  F:     Documentation/dev-tools/kasan.rst
> -F:     arch/*/include/asm/*kasan.h
> +F:     arch/*/include/asm/*kasan*.h
>  F:     arch/*/mm/kasan_init*
>  F:     include/linux/kasan*.h
>  F:     lib/Kconfig.kasan
> diff --git a/arch/arm64/include/asm/kasan-tags.h b/arch/arm64/include/asm=
/kasan-tags.h
> new file mode 100644
> index 000000000000..259952677443
> --- /dev/null
> +++ b/arch/arm64/include/asm/kasan-tags.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL       0xFF /* native kernel pointers tag */
> +
> +#ifdef CONFIG_KASAN_HW_TAGS
> +#define KASAN_TAG_MIN          0xF0 /* minimum value for random tags */
> +#define KASAN_TAG_WIDTH                4
> +#else
> +#define KASAN_TAG_WIDTH                8
> +#endif
> +
> +#endif /* ASM_KASAN_TAGS_H */
> diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasa=
n.h
> index b167e9d3da91..fd4a8557d736 100644
> --- a/arch/arm64/include/asm/kasan.h
> +++ b/arch/arm64/include/asm/kasan.h
> @@ -6,8 +6,6 @@
>
>  #include <linux/linkage.h>
>  #include <asm/memory.h>
> -#include <asm/mte-kasan.h>
> -#include <asm/pgtable-types.h>
>
>  #define arch_kasan_set_tag(addr, tag)  __tag_set(addr, tag)
>  #define arch_kasan_reset_tag(addr)     __tag_reset(addr)
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/ua=
ccess.h
> index 6490930deef8..ccd41a39e3a1 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -22,6 +22,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/mmu.h>
>  #include <asm/mte.h>
> +#include <asm/mte-kasan.h>
>  #include <asm/ptrace.h>
>  #include <asm/memory.h>
>  #include <asm/extable.h>
> diff --git a/arch/x86/include/asm/kasan-tags.h b/arch/x86/include/asm/kas=
an-tags.h
> new file mode 100644
> index 000000000000..68ba385bc75c
> --- /dev/null
> +++ b/arch/x86/include/asm/kasan-tags.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL       0xF /* native kernel pointers tag */

One thing that stood out to me here was that for x86, KASAN_TAG_KERNEL
is defined as a 4-bit value (0xF). Which makes sense, as
KASAN_TAG_WIDTH =3D=3D 4.

But for arm64, KASAN_TAG_KERNEL and others are defined as 8-bit values
(0xFF, etc.), even though for HW_TAGS, KASAN_TAG_WIDTH is also =3D=3D 4
and only the lower 4 bits of these values define the tags.

This happens to work out: for HW_TAGS, __tag_set resets the top byte
but then uses the given value as is, so the higher 4 bits gets set to
0xF and the lower set to the tag. And for saving/restoring the tag in
page->flags, everything also works, as we only store the meaningful
lower 4 bits in flags, and restore the higher 0xF when doing ^ 0xFF.

But this is not related to this series: I think the way x86 defines
KASAN_TAG_KERNEL to be 0xF makes sense; we might just need to clean up
the arm64 implementation at some point.

> +
> +#define KASAN_TAG_WIDTH                4
> +
> +#endif /* ASM_KASAN_TAGS_H */
> diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
> index 4f85f562512c..ad5c11950233 100644
> --- a/include/linux/kasan-tags.h
> +++ b/include/linux/kasan-tags.h
> @@ -2,13 +2,22 @@
>  #ifndef _LINUX_KASAN_TAGS_H
>  #define _LINUX_KASAN_TAGS_H
>
> +#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#include <asm/kasan-tags.h>
> +#endif
> +
> +#ifndef KASAN_TAG_WIDTH
> +#define KASAN_TAG_WIDTH                0
> +#endif
> +
> +#ifndef KASAN_TAG_KERNEL
>  #define KASAN_TAG_KERNEL       0xFF /* native kernel pointers tag */
> -#define KASAN_TAG_INVALID      0xFE /* inaccessible memory tag */
> -#define KASAN_TAG_MAX          0xFD /* maximum value for random tags */
> +#endif
> +
> +#define KASAN_TAG_INVALID      (KASAN_TAG_KERNEL - 1) /* inaccessible me=
mory tag */
> +#define KASAN_TAG_MAX          (KASAN_TAG_KERNEL - 2) /* maximum value f=
or random tags */
>
> -#ifdef CONFIG_KASAN_HW_TAGS
> -#define KASAN_TAG_MIN          0xF0 /* minimum value for random tags */
> -#else
> +#ifndef KASAN_TAG_MIN
>  #define KASAN_TAG_MIN          0x00 /* minimum value for random tags */
>  #endif
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 0f65e88cc3f6..1c7acdb5f297 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -40,8 +40,7 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
>  /* Software KASAN implementations use shadow memory. */
>
>  #ifdef CONFIG_KASAN_SW_TAGS
> -/* This matches KASAN_TAG_INVALID. */
> -#define KASAN_SHADOW_INIT 0xFE
> +#define KASAN_SHADOW_INIT KASAN_TAG_INVALID
>  #else
>  #define KASAN_SHADOW_INIT 0
>  #endif
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6f959d8ca4b4..8ba91f38a794 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1949,7 +1949,7 @@ static inline u8 page_kasan_tag(const struct page *=
page)
>
>         if (kasan_enabled()) {
>                 tag =3D (page->flags.f >> KASAN_TAG_PGSHIFT) & KASAN_TAG_=
MASK;
> -               tag ^=3D 0xff;
> +               tag ^=3D KASAN_TAG_KERNEL;
>         }
>
>         return tag;
> @@ -1962,7 +1962,7 @@ static inline void page_kasan_tag_set(struct page *=
page, u8 tag)
>         if (!kasan_enabled())
>                 return;
>
> -       tag ^=3D 0xff;
> +       tag ^=3D KASAN_TAG_KERNEL;
>         old_flags =3D READ_ONCE(page->flags.f);
>         do {
>                 flags =3D old_flags;
> @@ -1981,7 +1981,7 @@ static inline void page_kasan_tag_reset(struct page=
 *page)
>
>  static inline u8 page_kasan_tag(const struct page *page)
>  {
> -       return 0xff;
> +       return KASAN_TAG_KERNEL;
>  }
>
>  static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
> diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags=
-layout.h
> index 760006b1c480..b2cc4cb870e0 100644
> --- a/include/linux/page-flags-layout.h
> +++ b/include/linux/page-flags-layout.h
> @@ -3,6 +3,7 @@
>  #define PAGE_FLAGS_LAYOUT_H
>
>  #include <linux/numa.h>
> +#include <linux/kasan-tags.h>
>  #include <generated/bounds.h>
>
>  /*
> @@ -72,14 +73,6 @@
>  #define NODE_NOT_IN_PAGE_FLAGS 1
>  #endif
>
> -#if defined(CONFIG_KASAN_SW_TAGS)
> -#define KASAN_TAG_WIDTH 8
> -#elif defined(CONFIG_KASAN_HW_TAGS)
> -#define KASAN_TAG_WIDTH 4
> -#else
> -#define KASAN_TAG_WIDTH 0
> -#endif
> -
>  #ifdef CONFIG_NUMA_BALANCING
>  #define LAST__PID_SHIFT 8
>  #define LAST__PID_MASK  ((1 << LAST__PID_SHIFT)-1)
> --
> 2.52.0
>
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

