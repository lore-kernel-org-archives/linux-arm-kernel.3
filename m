Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D504CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQBxmURKiGaN3QIqBhTff7pEbZ70mJ9TllMgftPCUcQ=; b=og9k/Wc5kuxu3CerFMNq00pPpt
	n3QrLSZsk78uX3uWmp5npLkK9/TvxYQWdIkwP2SU6g6iTIpqQrdqYfV/jBxb1vPuwbFk/VKIoMSDr
	X8oXkzfXPHIsqy6Ku5lVwbBt8tWn+QIZDFYJzhEb5k62EY8f1IG2R91nz4O1BWOwiW9+Jrc4eCUUw
	0W9Y/jJ/O8mdP5KXP10eKfSxp/aC+4LJF43siGupKPw4sfMLDyiwOf6kjMidFd2VHjej0I0+hBn7z
	wLz3VMbNycFBXW2fqru1AN9eqAk+D5zwm6+S0qYXXOY6Ye/sdULsoaHHVNUxYDoGByxWyOJZ7ldAk
	pq3U27sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t3f-00000006bdK-1Z1P;
	Thu, 09 Oct 2025 15:59:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t3Y-00000006bUB-1j58
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:59:55 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-57db15eeb11so1403593e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760025590; x=1760630390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQBxmURKiGaN3QIqBhTff7pEbZ70mJ9TllMgftPCUcQ=;
        b=cZyEhQhMSD7X3uXeVIKIPHao30plBnq+20CatvCysbsJla9gICClJVAukc93fqDAcf
         EgdiWLujWg2rzz/PqNQUJuZYnV6ecXrhyIBLCVAqLBI8Q5jfnsU1A9abnOIZVoDiq+S+
         nOB6Z/ybvXYNWb5vRoQpvPG4G7z9PYoOuRQiKrvc/bau21EOrvTHQsSfIZ4Oi3+XxM4J
         CW8yF+D9zYUBfS+qSioxRImqOtwafbUsPdFGd9XRZUvKe4FRDq8aXL+QutojSH6319IX
         2xzFAOEjPOfoyIoBfpKz0KjnwWtWh3095e1mS0zRUgjkEvpfVbjGgknfK5hPEa9nro4j
         loiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760025590; x=1760630390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQBxmURKiGaN3QIqBhTff7pEbZ70mJ9TllMgftPCUcQ=;
        b=idZT+as4vLQeDuMJRgseN+VAJ0HgoU11Qor7rlWaKV1DQMyMXD7MKuDz6dI151ZwkR
         2Aqfb4w9V2zJZqBljiuzBo45OzfdvZIvZOIJ7Jc9ZkqCnSfspyYW4/fg91f/WMfYS8or
         S6GV5KlmUsFtv8wDRBUa3DO9vYVRbdGe2I2WZq+8cZqphurkxjvySQnR9UF4opaQqVt3
         zPl7Ifp5HGO2pIy+te76I/3ieeC0MhTKNClvDwA/NPt/jTOy4m6v+BZoyuHIDEHlrjLn
         ao0+OsNXTILcNdf/8RSAoWP6XreyUQkVI9wdvms+OT3lwczfdzlvstsURHBSN0IaloEK
         mJVw==
X-Forwarded-Encrypted: i=1; AJvYcCWbpMw8KYaKR+HehTaaZNoK5iNEdf+KD2LmFTIFKcP1V4XAk/7GNdaaHwQHLiFZ2iSAGT66K4w+uIZ93rCc0BV1@lists.infradead.org
X-Gm-Message-State: AOJu0YzAnqJSIxGUFfH+/Z0nD9zRDKEBWt0JO/ptd9xiXym1y6Gu2+Q7
	FqXTE1ViOt81Fc5s4CyVFn3tNZ4B6jw88cu3pipbjMTJQok8KU+P9lZt2ltgKGBe5KJyzF5JjJi
	p2qg0Vn46BRB5jlY67IcALb+o/tQ0ih4=
X-Gm-Gg: ASbGnctxRIOTYrXysQkd84orFOVV36WqV7v2AQx8dvN4N9uHbOoRQYVEQrxzqq0twbl
	DqNI9DtEQyejbVd9Xd53liOD5kelUfxscMT4JbhkRnX4rGejRmY67nMy/ZU84tqbPEn3MLZKhui
	x7pbhc9+GifQfM0buq5F6j04XbIsM22EGmGEJKeQkcocIDMfUa0DwKk5+wB/HaTYd3z0PD3lqe3
	ra1IdLW6EtRbeFDB87PG76yo5nSEyZtZrdytWylXQ==
X-Google-Smtp-Source: AGHT+IFiOw5ablsLgUKfCaNuQJri4wcztl+zI4ly3LRjrgaXjzgOnqWcpR8ZMzuTHWFg5QDe7h9JoAEutSyQKhvfT4w=
X-Received: by 2002:a05:6512:1291:b0:57d:ffa4:56f4 with SMTP id
 2adb3069b0e04-5906dae5904mr2393608e87.41.1760025589415; Thu, 09 Oct 2025
 08:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <87ldmv6p5n.ritesh.list@gmail.com>
In-Reply-To: <87ldmv6p5n.ritesh.list@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 9 Oct 2025 20:59:32 +0500
X-Gm-Features: AS18NWAnJdcYDP3fsUmpv8ZuZnvVnkv1zMHsU4QWH3X3orZoE8748Ur0FWZohd0
Message-ID: <CACzwLxia6xMcQ=vsYG7SE+pUO8=4DiRWD_Omq3wzRyuhDjGcPQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, andreyknvl@gmail.com, akpm@linux-foundation.org, 
	zhangqing@loongson.cn, chenhuacai@loongson.cn, davidgow@google.com, 
	glider@google.com, dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085952_474303_28B328D7 
X-CRM114-Status: GOOD (  17.16  )
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

On Thu, Sep 4, 2025 at 5:38=E2=80=AFAM Ritesh Harjani <ritesh.list@gmail.co=
m> wrote:
>
>
> Only book3s64 needs static keys here because of radix v/s hash mode
> selection during runtime. The changes in above for powerpc looks good to
> me. It's a nice cleanup too.
>

Hello,
Thanks for the review and sorry for the late reply. This has already
been merged.
AFAIU, in arch/powerpc/Kconfig

config PPC
...
        select ARCH_NEEDS_DEFER_KASAN if PPC_RADIX_MMU

and in arch/powerpc/platforms/Kconfig.cputype:

config PPC_RADIX_MMU
        bool "Radix MMU Support"
        depends on PPC_BOOK3S_64
        select ARCH_HAS_GIGANTIC_PAGE
        default y

So the KASAN static key is enabled only for PPC_BOOK3S_64 by this
Kconfig selection.
In other git changes like:
arch/powerpc/mm/kasan/init_32.c
arch/powerpc/mm/kasan/init_book3e_64.c

, where we call kasan_init_generic() -> kasan_enable() does nothing because
CONFIG_ARCH_DEFER_KASAN is not selected.

> So feel free to take:
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc
>
> However I have few comments below...
>
> > @@ -246,7 +255,7 @@ static inline void poison_slab_object(struct kmem_c=
ache *cache, void *object,
> >  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
> >                               unsigned long ip)
> >  {
> > -     if (!kasan_arch_is_ready() || is_kfence_address(object))
> > +     if (is_kfence_address(object))
>
> For changes in mm/kasan/common.c.. you have removed !kasan_enabled()
> check at few places. This seems to be partial revert of commit [1]:
>
>   b3c34245756ada "kasan: catch invalid free before SLUB reinitializes the=
 object"
>
> Can you please explain why this needs to be removed?

kasan_arch_is_ready() was removed here because in
commit 1e338f4d99e6("kasan: introduce ARCH_DEFER_KASAN and unify
static key across modes")
I've unified the check with kasan_enabled() which is already called in
the __wrapper
__kasan_slab_pre_free in include/linux/kasan.h

> Also the explaination of the same should be added in the commit msg too.
>
> [1]: https://lore.kernel.org/all/20240809-kasan-tsbrcu-v8-1-aef4593f9532@=
google.com/
>

