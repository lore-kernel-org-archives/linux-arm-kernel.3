Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1139DC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 01:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQazujB/9yd1yOfFaq3YxlrN7+iuxbijBpN0gJtM4vU=; b=L5IBfllYlWDqKG9ETTfYIWOfYT
	ARexype1NVCGY3eZVqhHNSgMyn0zgus0u4n+9Fgy7QE81PbFG3LRMax7Nn/dWJHNfQLse/7BC9PRI
	HsyoIdZVz+J9KeY24DPfTeSWssZUGnqQghEsczrNLy+7UGoI5FcJEr4xFu9TvHw9gYH+162QsPXcz
	TEmeDfkRxNZBt7ZtrRyTsb+pqamlusP6vuts5x2AKdCCQqHi0xEyly82s+CBfxm0ITl7rmJ4oEmLn
	KR5T0wahid9+3OhxmJUZowPE/1aVrOm0GrAX0G2d9PV2e5+seTirqJHne30MfcqYEK6wEdeFcDjTA
	UKOt52rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuiY4-00000007kfw-1GLA;
	Wed, 19 Mar 2025 01:48:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuiWM-00000007kWC-2G5H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 01:47:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2241053582dso25179555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 18:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742348821; x=1742953621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQazujB/9yd1yOfFaq3YxlrN7+iuxbijBpN0gJtM4vU=;
        b=bOs+2X8568kTBK/wWmHQ5LFL8QqveQhy1xnB1JN5leZsJjduqI6pST6R+qG9GJrJpW
         EAzgRRoJ+wKGkcuptX7bQAZZBjn16SDQdJV+aN1m2GjKmVBrr7/vm+29yQ/lmEUUEZqO
         V89Vzg1j+gJVsBui4hhV2UD7bBC3xuLszFGb4IGt+NV6+x/mw2RKuR0yHHaSKuzNNEeT
         R7s5ShU9iiZUTdjIfCmQ4mmQZIDN7FqwvNThD2lSqAzMsc1HwfGhsm4SCJoG+yGrdGHP
         PH0U96E/i1lhN7PLXnaZX2NiBbeZ0SuTFiPZQLKgdW2zrI2p0ahdvZ4eQFQ+3Tgrz08X
         1zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742348821; x=1742953621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQazujB/9yd1yOfFaq3YxlrN7+iuxbijBpN0gJtM4vU=;
        b=qkd/UGj1TWlUYtt+y8cGvZVym1LvUHdRII07uaf3Fxbw/sgnlbgv5c5rkcg0Clm3tl
         no6uQK4dODEwKUqp2Y/Es8HD/5VKcLUGU4GNFiK79p+QepHvySbLXoD+1AKdq7sQazti
         LilgOHIGu32dNtG8jv39+h/2IoDZKumZzZb6eLHR8iW9pcLZv8T+sgcU1EAJ4pKOMLGJ
         AyYVbTZfFqjlFdFFjb1gDfwaJfAICqo6D0pNyiHE4FAEXjdZkAxciUjeEWrLif9B43vj
         lJ5yl+/cCYA11S082LldCU0GHQjynjcGJkKCKuhwItXA1KGXq99KfNDc1ujk312Q4DHw
         KKTA==
X-Gm-Message-State: AOJu0YxZ2xueNugXJELTKr2vKeFluXiZWqV6CXIWytxfSUPnhv2RXwl/
	Bq0GwkVjxl/MCRwKZScETZX6EfQkruZ96wZ6iLLMy+YmwAeeNJdF95H0IUBb
X-Gm-Gg: ASbGncskz9rKETd7r1PyxfRFeDkEsKNwea67SYWja4Wh5G6AjdBUSNxBZ0UmMFZhBvL
	moAohmUAPzKN4P9eJqh54eeOYu+W4PP8Qs5NUhxAg+AL3kBGFhcP0i9NoGmG+PVNZsOkzIprIVW
	27xj/HCkV5zcIIZ9XiZe/MueD34HpRSZczBEWJ1Iay4nu/t+Vs+qBMaGTvJw9f5OABqKbyrqTzE
	yzCLzOMXHbJFvEsy8OFYHLFeJHzGi/LV2GpQ1VoQ1NOivKyr8klIScMKD31YHmEfWHlHu+2kQxa
	KaK6224yLbdfxvxqRZ/u+ptG00PFRF5tdv8mDbv5uEllUE0q+S7t/ep5XunSBLqBNHQm
X-Google-Smtp-Source: AGHT+IF0XB8fhv1p95uLw69R18eSu0Lwf8G2N3t1RKmk5WXiiexOrAeRINEjNr/ltlJBTDEzGkPmkg==
X-Received: by 2002:a17:902:e803:b0:21f:74ec:1ff0 with SMTP id d9443c01a7336-22649a67f76mr13801815ad.32.1742348821049;
        Tue, 18 Mar 2025 18:47:01 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888486sm101601915ad.11.2025.03.18.18.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 18:47:00 -0700 (PDT)
Date: Tue, 18 Mar 2025 21:46:58 -0400
From: Yury Norov <yury.norov@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z9oiEkQEcHhA0a80@thinkpad>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hsRJvpjYoqh9RG@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8hsRJvpjYoqh9RG@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_184702_580200_C3A6120D 
X-CRM114-Status: GOOD (  45.51  )
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

+ Catalin Marinas, ARM maillist

Hi Catalin and everyone,

Anshuman Khandual asked me to merge GENMASK_U128() saying it's
important for ARM to stabilize API. While it's a dead code, I
accepted his patch as he promised to add users shortly.

Now it's more than half a year since that. There's no users,
and no feedback from Anshuman.

Can you please tell if you still need the macro? I don't want to
undercut your development, but if you don't need 128-bit genmasks
there's no reason to have a dead code in the uapi.

Thanks,
Yury

On Wed, Mar 05, 2025 at 10:22:47AM -0500, Yury Norov wrote:
> + Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Anshuman,
> 
> I merged your GENMASK_U128() because you said it's important for your
> projects, and that it will get used in the kernel soon.
> 
> Now it's in the kernel for more than 6 month, but no users were added.
> Can you clarify if you still need it, and if so why it's not used?
> 
> As you see, people add another fixed-types GENMASK() macros, and their
> implementation differ from GENMASK_U128().
> 
> My second concern is that __GENMASK_U128() is declared in uapi, while
> the general understanding for other fixed-type genmasks is that they
> are not exported to users. Do you need this macro to be exported to
> userspace? Can you show how and where it is used there?
> 
> Thanks,
> Yury
> 
> 
> On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
> > From: Yury Norov <yury.norov@gmail.com>
> > 
> > Add __GENMASK_t() which generalizes __GENMASK() to support different
> > types, and implement fixed-types versions of GENMASK() based on it.
> > The fixed-type version allows more strict checks to the min/max values
> > accepted, which is useful for defining registers like implemented by
> > i915 and xe drivers with their REG_GENMASK*() macros.
> > 
> > The strict checks rely on shift-count-overflow compiler check to fail
> > the build if a number outside of the range allowed is passed.
> > Example:
> > 
> > 	#define FOO_MASK GENMASK_U32(33, 4)
> > 
> > will generate a warning like:
> > 
> > 	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
> > 	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> > 	      |                               ^~
> > 
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> > Changelog:
> > 
> >   v3 -> v4:
> > 
> >     - The v3 is one year old. Meanwhile people started using
> >       __GENMASK() directly. So instead of generalizing __GENMASK() to
> >       support different types, add a new GENMASK_t().
> > 
> >     - replace ~0ULL by ~_ULL(0). Otherwise, __GENMASK_t() would fail
> >       in asm code.
> > 
> >     - Make GENMASK_U8() and GENMASK_U16() return an unsigned int. In
> >       v3, due to the integer promotion rules, these were returning a
> >       signed integer. By casting these to unsigned int, at least the
> >       signedness is kept.
> > ---
> >  include/linux/bitops.h |  1 -
> >  include/linux/bits.h   | 33 +++++++++++++++++++++++++++++----
> >  2 files changed, 29 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index c1cb53cf2f0f8662ed3e324578f74330e63f935d..9be2d50da09a417966b3d11c84092bb2f4cd0bef 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -8,7 +8,6 @@
> >  
> >  #include <uapi/linux/kernel.h>
> >  
> > -#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
> >  #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
> >  #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
> >  #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
> > diff --git a/include/linux/bits.h b/include/linux/bits.h
> > index 5f68980a1b98d771426872c74d7b5c0f79e5e802..f202e46d2f4b7899c16d975120f3fa3ae41556ae 100644
> > --- a/include/linux/bits.h
> > +++ b/include/linux/bits.h
> > @@ -12,6 +12,7 @@
> >  #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
> >  #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
> >  #define BITS_PER_BYTE		8
> > +#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
> >  
> >  /*
> >   * Create a contiguous bitmask starting at bit position @l and ending at
> > @@ -25,14 +26,38 @@
> >  
> >  #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> >  
> > -#define GENMASK(h, l) \
> > -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> > -#define GENMASK_ULL(h, l) \
> > -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
> > +/*
> > + * Generate a mask for the specified type @t. Additional checks are made to
> > + * guarantee the value returned fits in that type, relying on
> > + * shift-count-overflow compiler check to detect incompatible arguments.
> > + * For example, all these create build errors or warnings:
> > + *
> > + * - GENMASK(15, 20): wrong argument order
> > + * - GENMASK(72, 15): doesn't fit unsigned long
> > + * - GENMASK_U32(33, 15): doesn't fit in a u32
> > + */
> > +#define GENMASK_t(t, h, l)				\
> > +	(GENMASK_INPUT_CHECK(h, l) +			\
> > +	 (((t)~ULL(0) - ((t)1 << (l)) + 1) &		\
> > +	  ((t)~ULL(0) >> (BITS_PER_TYPE(t) - 1 - (h)))))
> > +
> > +#define GENMASK(h, l) GENMASK_t(unsigned long,  h, l)
> > +#define GENMASK_ULL(h, l) GENMASK_t(unsigned long long, h, l)
> >  
> >  /*
> >   * Missing asm support
> >   *
> > + * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm
> > + * code as BITS_PER_TYPE() relies on sizeof(), something not available in
> > + * asm. Nethertheless, the concept of fixed width integers is a C thing which
> > + * does not apply to assembly code.
> > + */
> > +#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
> > +#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))
> > +#define GENMASK_U32(h, l) GENMASK_t(u32, h, l)
> > +#define GENMASK_U64(h, l) GENMASK_t(u64, h, l)
> > +
> > +/*
> >   * __GENMASK_U128() depends on _BIT128() which would not work
> >   * in the asm code, as it shifts an 'unsigned __int128' data
> >   * type instead of direct representation of 128 bit constants
> > 
> > -- 
> > 2.45.3
> > 

