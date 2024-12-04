Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC167E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNA1GsPxilVJChqzg/IHgUeCWNBJYbUvWL6MaZGSVcI=; b=pRNUawoOAmmnSa8kRgLb0pIyRz
	DaQj9VTNT+z4TNbfOHyn1y0ZMVZzHOq0vwB77FLdWSREzY9pKVq6Lz6+jANTtFtfPWFsLE3kj9gdL
	lwysmWKR7QsVMQ6BvPf0iiL9c2Y1vQK/a33Qn0kDM0Q6At4MGVlOPQ1rvrqwnVduP9jFOZDhReb8G
	68dWUOHEC90iOXS3pb5MNc+8p1yqn5TrM/v71gdiiuZ1MC+pjOgcaz261v38oIk2kRR0kMo15KXwz
	0hGoaVgUGylk2vt1imk9w6z2V1fPNgzglDxgTI/pYGntC/Gc0wMtHBFGElQW3fpE0UWAkFttpPIGO
	wJuYJqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIwoe-0000000Dtb2-1U8D;
	Wed, 04 Dec 2024 21:21:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIwnd-0000000DtTB-3tTu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 21:20:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7252b7326f4so227124b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 13:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733347244; x=1733952044; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BNA1GsPxilVJChqzg/IHgUeCWNBJYbUvWL6MaZGSVcI=;
        b=WVcBBijqDmLEl4l3660X+52dVm864PAKvJ8JOtzVXKPRLvPAXs7Xla3MnQPDgOfEJK
         F63j/agSvY6154HXywBbS5jZs1QxCDJ6YYboQIsGBRwHM5Zhy6P86BVCIxz0pNxBEHb4
         FBNoSDD4od4Gv6HjTph+9s61W+oxa/J7hNwQu9k2fbnBrFnMb0KSq7G2jan42qmq1/cR
         fZovtNApRaeSzVTrOiRo5dF1xPkU5I7zBhliQG7/OW2yze6DEepNHA1v8RzZTPx+T0se
         PJCS/qY1RvzdJyQQfODLtCy0wCIGCWXS8wHxkyxiTGZSOxIWmmV2syAfZjGZdyu8eMHn
         0ILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733347244; x=1733952044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNA1GsPxilVJChqzg/IHgUeCWNBJYbUvWL6MaZGSVcI=;
        b=UGgOCrvS0HJDzE3zA3dOkpNgnlgarCR/S0LBx6Uc5lVgefxvD0FZk27PFyttY3Yiwc
         amQhmbxla3kXe3wiY1yCzooZ2J53pmDVwBTdfeAVhPvutTHtFU7bSR7AI624Kpxv3lq+
         flkNV15b9p2HTKhl4s5WbotaVbTcU9fq2P7nqgvRhxiY7CMApv3gOgmB67oI8xEma/P9
         Aj20GFh+lpWme0Iowcm50IXwB1RbDtIdSI9vKefN0+4z8d//OmIUGitsEy4nF4idebmZ
         eoUXeSqwh5S1PdusfiY98sbqfr9sUsSwSGOLUFx4zfwzIp+ZK1vUmUI95BIQhxRwdunB
         YuGw==
X-Forwarded-Encrypted: i=1; AJvYcCVodFsvgpwrqP7yqdKsyzZpmOKWzDP8h4g3LCXMJ42XPUSABRozBZXRag+tNM+w6AIMrTGGv8w31UYqC/ndEUcU@lists.infradead.org
X-Gm-Message-State: AOJu0YzuT2DHBxwelxnxI0QYTdHYUgR2sVNvzSv36DoNWV+RlSiA+ZKk
	TdIiOWQQ6d1ldU31LjdSMRVdHhEnkpF7fFJt7zYLvI0CABICoQhC
X-Gm-Gg: ASbGncvD/rdIJ+OGJ/3TcxBfwbtoDqvnlcrtR6lPI4wbUV7ob5s0082icrBl/fcMIGk
	4dA/HqfDrFHzL+8Bd7xTNpEPOBfQ2WhTQNqfwffWJM+7sIzuDlrOnqLae76yhkBNyL3zke/vO4m
	uUhxlXWSKYFPHu6RhFX2zsBRZJr1kQkH8sYIihoOphKj2xZCE4Sc29aetHNdRg5B88mL0UKuNnU
	smvpiGSOHWohyHeZYaoKAnNhr1JsbjTNE1pOkqSQHykXZl3aQ==
X-Google-Smtp-Source: AGHT+IFEmSUNzGrT5DnfoRZVH+SQ2pUXxmGmw+aJzGPI7oEZwncOxNonhADpq7F5PtDa6Cd2EgQG5g==
X-Received: by 2002:a05:6a00:3022:b0:725:9202:6731 with SMTP id d2e1a72fcca58-72592026879mr4620300b3a.13.1733347244177;
        Wed, 04 Dec 2024 13:20:44 -0800 (PST)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7258b2e79d3sm2235622b3a.67.2024.12.04.13.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:20:43 -0800 (PST)
Date: Wed, 4 Dec 2024 13:20:39 -0800
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Martin Uecker <Martin.Uecker@med.uni-goettingen.de>,
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Message-ID: <Z1DHp34fyyhtLEV0@yury-ThinkPad>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_132045_966413_07FDCFE6 
X-CRM114-Status: GOOD (  32.89  )
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

> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index a2a56a50dd85227a4fdc62236a2710ca37c5ba52..30ce06df4153cfdc0fad9bc7bffab9097f8b0450 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -316,6 +316,47 @@ static inline void *offset_to_ptr(const int *off)
> >  #define statically_true(x) (__builtin_constant_p(x) && (x))
> >  #define statically_false(x) (__builtin_constant_p(x) && (x) == 0)
> > 
> > +/*
> > + * Whether x is the integer constant expression 0 or something else.
> > + *
> > + * Details:
> > + *   - The C11 standard defines in §6.3.2.3.3
> > + *       (void *)<integer constant expression with the value 0>
> > + *     as a null pointer constant (c.f. the NULL macro).
> > + *   - If x evaluates to the integer constant expression 0,
> > + *       (void *)(x)
> > + *     is a null pointer constant. Else, it is a void * expression.
> > + *   - In a ternary expression:
> > + *       condition ? operand1 : operand2
> > + *     if one of the two operands is of type void * and the other one
> > + *     some other pointer type, the C11 standard defines in §6.5.15.6
> > + *     the resulting type as below:
> > + *       if one operand is a null pointer constant, the result has the
> > + *       type of the other operand; otherwise [...] the result type is
> > + *       a pointer to an appropriately qualified version of void.
> > + *   - As such, in
> > + *       0 ? (void *)(x) : (char *)0
> > + *     if x is the integer constant expression 0, operand1 is a null
> > + *     pointer constant and the resulting type is that of operand2:
> > + *     char *. If x is anything else, the type is void *.
> > + *   - The (long) cast silences a compiler warning for when x is not 0.
> > + *   - Finally, the _Generic() dispatches the resulting type into a
> > + *     Boolean.
> 
> The comment is absolutely excessive.

I like this comment. Particularly I like the references to the standard
followed by a step-by-step explanation of how the macro is built.

> I'm sure I managed about 2 lines in one of the patches I did.

Sorry, don't understand this.

Thanks,
Yury

> > + *
> > + * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> 
> IIRC Martin has agreed in the past that the accreditation can
> be removed - especially since it refers to the 'sizeof (void)' trick.
> 
> > + */
> > +#define __is_const_zero(x) \
> > +	_Generic(0 ? (void *)(long)(x) : (char *)0, char *: 1, void *: 0)
> > +
> > +/*
> > + * Returns a constant expression while determining if its argument is a
> > + * constant expression, most importantly without evaluating the argument.
> 
> You need to differentiate between a 'constant integer expression'
> and a 'compile time constant'.
>  
> > + *
> > + * If getting a constant expression is not relevant to you, use the more
> > + * powerful __builtin_constant_p() instead.
> 
> __builtin_constant_p() is not 'more powerful' it is testing for
> something different.
> 
> 	David
> 
> > + */
> > +#define is_const(x) __is_const_zero(0 * (x))
> > +
> >  /*
> >   * This is needed in functions which generate the stack canary, see
> >   * arch/x86/kernel/smpboot.c::start_secondary() for an example.
> > 
> > --
> > 2.45.2
> > 
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

